
{ -$Id: uBuffer.pas,v 1.3 2006/07/13 13:58:29 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                   Модуль "Запись в буфера обмена"                            }
{   Запись в буфера обмена dbf из дублирующих буферов Interbase, подсчет CRC,  }
{   управление dbf-транзакциями буфера, откат транзакций                       }
{                                                  ответственный: Олег Волков  }

unit uBuffer;

interface

uses	Controls, Halcn6Db, Crc32, uCommonDB, uBufferString, ProcessUnit;

type
  TBufferTransaction = class(TObject)
	private
		Id_Transaction: Integer;
		FInTransaction: Boolean;

        DB: TDBCenter;
        BufferTransaction: TCommonDBTransaction;
       	BufferTable: THalcyonDataset;

        function GetNative: TObject;
	public
        DontWriteToDbf: Boolean;
        
        UseIndex: Boolean;
        UseCRC: Boolean;
        
        constructor Create(DB: TDBCenter; Dbf_Path: String);
        destructor Destroy; override;

		procedure Start;
		function  AddRecord(Buffer, IB_Buffer: String): Integer;
		procedure Rollback;
		procedure Commit;

        procedure Write(Buffer, IB_Buffer: String; Id_PBKey: Integer; DontOpenDbf: Boolean = False);
        procedure MassWrite(Buffer, IB_Buffer: String; InfoSQL: String);

        procedure RollbackAll;

        procedure WriteCRC32Field;
        procedure ReCalcCRC(Buffer : String);

        property InTransaction: Boolean read FInTransaction;
        property NativeBufferTransaction: TObject read GetNative;
  end;

var
   DbfBufferIdSystem: Integer;
   
implementation

uses	Dialogs, SysUtils, Variants, DB, VarUtils, Forms;

function TBufferTransaction.GetNative: TObject;
begin
    Result := BufferTransaction.NativeTransaction;
end;

constructor TBufferTransaction.Create(DB: TDBCenter; Dbf_Path: String);
begin
    inherited Create;
    Self.DB := DB;
    BufferTransaction := DB.DB.GetTransaction;

    DontWriteToDbf := False;
    BufferTable := THalcyonDataset.Create(nil);
	BufferTable.DatabaseName := Dbf_Path;
end;

destructor TBufferTransaction.Destroy;
begin
    BufferTable.Free;
    BufferTransaction.Free;
    inherited Destroy;
end;

procedure TBufferTransaction.Start;
begin
	if FInTransaction then
       		raise Exception.Create(errBufTransactionActive);

	FInTransaction := True;
	DB.WriteTransaction.Start;

        // Получаем идентификатор транзакции
    DB.ExecWithResult(BufferTransaction, sqlGetIDTransaction);
    Id_Transaction := DB['Id_Transaction'];
end;

function TBufferTransaction.AddRecord(Buffer, IB_Buffer: String): Integer;
begin
	if not FInTransaction then
		raise Exception.Create(errARBufTransactionNotActive);

    DB.ExecWithResult(BufferTransaction, sqlGetIDPBKey);
    Result := DB['Id_PBKey'];

    DB['Id_Transaction'] := Id_Transaction;
    DB['Buffer'] := Buffer;
    DB['IB_Buffer'] := IB_Buffer;
    DB['Id_System'] := DbfBufferIdSystem;

    DB.ExecQuery(BufferTransaction, sqlAddBufTran, 'Id_Transaction, Id_PBKey, Buffer, IB_Buffer, Id_System');
end;

procedure TBufferTransaction.Rollback;
var
    Tran_DS: TDataSet;
    Id_PBKey: Integer;
begin
	if not FInTransaction then
       		raise Exception.Create(errRBBufTransactionNotActive);

		// получить все записи по данной транзакции
    DB['Id_Transaction'] := Id_Transaction;
    Tran_DS := DB.QueryData(sqlGetTranData, 'Id_Transaction');
    Tran_DS.First;

		// откатить их
	try
		While Not Tran_DS.Eof do
		begin
				// открываем нужный dbf
			BufferTable.Close;
			BufferTable.TableName := Tran_DS['BUFFER_NAME'];
			BufferTable.Open;

				// Удаляем из буфера, если найдем
            ID_PBKey := Tran_DS['id_PbKey'];
			if BufferTable.Locate('Id_pbKey', Id_PBKey, []) then
                BufferTable.Delete;

				// Удаляем из интербейзовского буфера данные
			if not VarIsNull(Tran_DS['IB_BUFFER_NAME'])
			then
			begin
                DB['IB_Buffer_Name'] := Tran_Ds['IB_Buffer_Name'];
                DB['Id_PBKey'] := Tran_DS['Id_PBKey'];
                DB.ExecQuery(BufferTransaction, sqlDelIBBuffer,
                    'IB_Buffer_Name, Id_PBKey', False);
			end;

			BufferTable.Close;
			Tran_DS.Next;
		end;

		except
			FInTransaction := False;
			DB.WriteTransaction.Rollback;
            DB.RemoveDataset(Tran_DS);
			Exit;
	end;

	// Если все прошло успешно, то удаляем из таблицы транзакций все записи с таким идентификатором транзакций
	try
        DB['Id_Transaction'] := Id_Transaction;
        DB.ExecQuery(BufferTransaction, sqlDelBufTran, 'Id_Transaction');

		DB.WriteTransaction.Rollback;
	except
	end;

    FInTransaction := False;
    DB.RemoveDataset(Tran_DS);
end;

procedure TBufferTransaction.Commit;
begin
	if not FInTransaction then
        	raise Exception.Create(errCBufTransactionNotActive);

		// Если все прошло успешно, то удаляем из таблицы транзакций
        // все записи с таким идентификатором транзакций
   	try
        DB['Id_Transaction'] := Id_Transaction;
        DB.ExecQuery(BufferTransaction, sqlDelBufTran, 'Id_Transaction');

   		DB.WriteTransaction.Commit;
		FInTransaction := False;
	except
        Rollback;
	end;
end;

	// откатить все буферные транзакции
procedure TBufferTransaction.RollbackAll;
var
    BuffTran: TDataSet;
    Id_PBKey: Integer;
begin
        // получить все записи по всем транзакциям
    DB['Id_System'] := DbfBufferIdSystem;
    BuffTran := DB.QueryData(sqlGetAllTran, 'Id_System');
    BuffTran.First;

		// откатить их
	While Not BuffTran.Eof do
	try
        DB.StoreFields(BuffTran, 'Id_PBKey, IB_Buffer_Name, Id_Transaction');
            // открываем нужный dbf
        BufferTable.Close;
        BufferTable.TableName := BuffTran['BUFFER_NAME'];
        BufferTable.Open;

            // Удаляем из буфера, если найдем
        Id_PBKey := BuffTran['id_PbKey'];
        if BufferTable.Locate('Id_pbKey', Id_PBKey, [])
            then BufferTable.Delete;

			// Удаляем из интербейзовского буфера данные
		if not VarIsNull(BuffTran['IB_BUFFER_NAME']) then
            DB.ExecQuery(BufferTransaction, sqlDelIBBuffer,
                'IB_Buffer_Name, ID_PBKey', False);

            // Удаляем из Buff_Tran эту запись
        DB.ExecQuery(BufferTransaction, sqlDelRecBufTran, 'Id_Transaction, Id_PBKey');

        BufferTable.Close;
	    BuffTran.Next;
	except  on E: exception do
		begin
			MessageDlg(errRollbackAll + E.message, mtError, [mbOk], 0);
            BuffTran.Next;
			Continue;
		end;
	end;

    DB.RemoveDataset(BuffTran);
end;

    // Функция дописывает к дробному поля нули после запятой,
    // т.е. было 250 стало 250.00
function VFloatToString(field : TField) : String;
var
	SymbolsAfterDot : Integer;
	res_str : String;
begin
	if UpperCase(field.FieldName) = 'TARST'
	then SymbolsAfterDot := 3
                else SymbolsAfterDot := 2;

        if not VarIsNull(field.Value)
                then res_str := Field.Value
                else res_str := '0';

        res_str := StringReplace(res_str,',','.',[rfReplaceAll]);

        if POS('.',res_str) = 0 then res_str := res_str + '.';

        while POS('.',res_str) > Length(res_str) - SymbolsAfterDot
        do res_str := res_str + '0';

        result := res_str;

end;

procedure TBufferTransaction.WriteCRC32Field;
var
	i: Integer;
	fieldName: String;
	field: TField;
    crc32_str : String;
    date_form : TFormatSettings;
begin
    if BufferTable.FindField('CRC32') = nil then Exit;
    
    date_form.ShortDateFormat := 'yyyymmdd';
    date_form.LongDateFormat  := 'yyyymmdd';

        crc32_str := '';

        BufferTable.TranslateASCII := False;
        for i := 0 to BufferTable.FieldCount - 1
        do begin
                field := BufferTable.Fields[i];
                fieldName := UpperCase(BufferTable.Fields[i].FieldName);
			// CRC32_beg
		if (FieldName <> 'CRC32') and (FieldName <> 'SYSTEM_F')
		then begin

		        case field.DataType of
				ftString   : if not VarIsNull(field.Value)
						then crc32_str := crc32_str + field.Value;       // Если строка, то пишем её без концевых пробелов
                        
				ftInteger  : if not VarIsNull(field.Value)
						then crc32_str := crc32_str + IntToStr(field.Value)
						else crc32_str := crc32_str + '0';

				ftSmallInt : if not VarIsNull(field.Value)
						then crc32_str := crc32_str + IntToStr(field.Value)
						else crc32_str := crc32_str + '0';

				ftBoolean  : if not VarIsNull(field.Value)
						then begin
							if field.Value  then crc32_str := crc32_str + 'T'
									else crc32_str := crc32_str + 'F';
						end
						else crc32_str := crc32_str + 'F';

				ftFloat    : crc32_str := crc32_str + VFloatToString(field);

				ftDate     : if not VarIsNull(field.Value)
						then crc32_str := crc32_str + DateToStr(field.Value,date_form)
						else crc32_str := crc32_str + '00000000';
			end;
                end;
			// CRC32_end
        end;

        BufferTable.Edit;

        field := BufferTable.FieldByName('CRC32');

        field.SetData(PChar(CrcToString(CalculateCrc32(crc32_str))));

        BufferTable.Post;

        BufferTable.TranslateASCII := True;
end;


Procedure TBufferTransaction.ReCalcCRC(Buffer : String);
begin
    BufferTable.Close;
	BufferTable.TableName := Buffer;
    BufferTable.Open;
    BufferTable.First;
    while not BufferTable.Eof do
    begin
        WriteCrc32Field;
        BufferTable.Next;
    end;
    BufferTable.Close;
end;

procedure TBufferTransaction.Write(Buffer, IB_Buffer: String; Id_PBKey: Integer; DontOpenDbf: Boolean = False);
var
    Data: TDataSet;
	i: Integer;
	fieldName: String;
	field: TField;
    val: Variant;
    crc32_str : String;
    index : String;
begin
    if DontWriteToDbf then Exit;

    DB['IB_Buffer'] := IB_Buffer;
    DB['Id_PBKey'] := Id_PBKey;
    Data := DB.QueryData(sqlGetData, 'IB_Buffer, Id_PBKey', False);
    if Data.IsEmpty then
    begin
        DB.RemoveDataset(Data);
        Exit;
    end;

    try
        if not DontOpenDbf then
        begin
            BufferTable.Close;
            BufferTable.TableName := Buffer;
            BufferTable.Open;
            if UseIndex then
            begin
                BufferTable.IndexFiles.Clear;
                index := Buffer + '.cdx';
                BufferTable.IndexFileInclude(index);
            end;
        end;

        BufferTable.Append;

        SetLength(crc32_str,4096);
        crc32_str := '';

        for i:=0 to Data.FieldCount-1 do
    	begin
	    	fieldName := UpperCase(Data.Fields[i].FieldName);
		    field := BufferTable.Fields.FindField(fieldName);
    		if field <> nil then
            begin
                val := Data[fieldName];

                    // Конвертим украинские буквы I, i в латинские
                if (field.DataType = ftString) and (not VarIsNull(val)) then
                begin
                    val := StringReplace(val,'І',Chr(73),[rfReplaceAll]);
                    val := StringReplace(val,'і',Chr(105),[rfReplaceAll]);
                end;

    			if field.DataType = ftBoolean then
                    field.Value := ( val = 'T')
		    	else	field.Value := val;
         	end
    	end;

        if UseCRC then
        begin
    	    if BufferTable.Fields.FindField('SYSTEM_FC') <> nil then
	    	    BufferTable['System_FC'] := 'ABCDEFGH';
    	    if BufferTable.Fields.FindField('SYSTEM_F') <> nil then
	    	    BufferTable['System_F'] := 'ABCDEFGH';
        	if BufferTable.Fields.FindField('SYSTEM_FB') <> nil then
	        	BufferTable['System_FB'] := 'ABCDEFGH';

            WriteCRC32Field;
        end;

   	    BufferTable.Post;

        if not DontOpenDbf then BufferTable.Close;
    finally
        DB.RemoveDataset(Data);
    end;
end;

procedure TBufferTransaction.MassWrite(Buffer, IB_Buffer: String; InfoSQL: String);
var
    Data: TDataSet;
	i: Integer;
	fieldName: String;
	field: TField;
    val: Variant;
    crc32_str : String;
    index : String;
    form: TProcessForm;
begin
    if DontWriteToDbf then Exit;

    form := TProcessForm.Create(nil);
    form.Caption := 'Масова вигрузка у буфер, зачекайте...';
    form.Show;

    Data := DB.QueryData(InfoSQL);
    if Data.IsEmpty then
    begin
        DB.RemoveDataset(Data);
        Exit;
    end;

    Data.Last;
    form.Progress.Max := Data.RecNo;

    BufferTable.Close;
    BufferTable.TableName := Buffer;
    BufferTable.Open;
    BufferTable.IndexFiles.Clear;
    index := Buffer + '.cdx';
    BufferTable.IndexFileInclude(index);

    Data.First;
    while not Data.Eof do
    begin
        BufferTable.Append;

        SetLength(crc32_str,4096);
        crc32_str := '';

	    for i:=0 to Data.FieldCount-1 do
	    begin
		    fieldName := UpperCase(Data.Fields[i].FieldName);
		    field := BufferTable.Fields.FindField(fieldName);
		    if field <> nil then
            begin
                val := Data[fieldName];

                // Конвертим украинские буквы I, i в латинские
                if (field.DataType = ftString) and (not VarIsNull(val)) then
                begin
                    val := StringReplace(val,'І',Chr(73),[rfReplaceAll]);
                    val := StringReplace(val,'і',Chr(105),[rfReplaceAll]);
                end;

			    if field.DataType = ftBoolean then
				    field.Value := ( val = 'T')
			    else	field.Value := val;
		    end
	    end;

	    if BufferTable.Fields.FindField('SYSTEM_FC') <> nil then
		    BufferTable['System_FC'] := 'ABCDEFGH';
	    if BufferTable.Fields.FindField('SYSTEM_F') <> nil then
		    BufferTable['System_F'] := 'ABCDEFGH';
	    if BufferTable.Fields.FindField('SYSTEM_FB') <> nil then
		    BufferTable['System_FB'] := 'ABCDEFGH';

        if Stop then break;
        form.Step;
        Data.Next;
    end;

	BufferTable.Post;

    WriteCRC32Field;

    BufferTable.Close;
    form.Close;
    DB.RemoveDataset(Data);
end;

end.
