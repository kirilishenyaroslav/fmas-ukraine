
{ -$Id: Buffer.pas,v 1.1 2005/11/09 09:00:13 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система «Управление персоналом              }
{       государственного производственного предприятия «Укрпромводчермет»      }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                   Модуль "Запись в буфера обмена"                            }
{   Запись в буфера обмена dbf из дублирующих буферов Interbase, подсчет CRC,  }
{   управление dbf-транзакциями буфера, откат транзакций                       }
{                                                  ответственный: Олег Волков  }

unit Buffer;

interface

uses	Controls, IBDatabase, IBQuery, Halcn6Db, Crc32;

type

  TBufferTransaction = class
	public
		procedure Start;
		function  AddRecord(Buffer, IB_Buffer: String): Integer;
		procedure Rollback;
		procedure Commit;
	private
		Id_Transaction: Integer;
		FInTransaction: Boolean;
	published
		property InTransaction: Boolean read FInTransaction;
  end;

var
	BufferTransaction: TIBTransaction;	// транзакция для работы с таблицей Buff_Tran
	BufferTransactionQuery: TIBQuery;
	BufferTable: THalcyonDataset;
	IBBufferQuery: TIBQuery;

function GetIDPBKey: Integer;
procedure AllBuffersRollback;
procedure WriteToDbf(Buffer, IB_Buffer: String; Id_PBKey: Integer);
Procedure ReCalcCRC(Buffer : String);

implementation

uses	PersonalCommon, SpCommon, Dialogs, SysUtils, Variants, DB, VarUtils;

procedure TBufferTransaction.Start;
begin
	if FInTransaction then
       		raise Exception.Create('Start: Транзакция уже начата');

	FInTransaction := True;
	WriteTransaction.StartTransaction;

		// Получаем идентификатор транзакции
        with BufferTransactionQuery do
        begin
       		Close;
		Transaction := BufferTransaction;
		SQL.Text := 'SELECT ID_TRANSACTION FROM GET_ID_TRANSACTION';
		Id_Transaction := ExecQuery(BufferTransactionQuery);
        end;
end;

function TBufferTransaction.AddRecord(Buffer, IB_Buffer: String): Integer;
begin
	if not FInTransaction then
		raise Exception.Create('AddRecord: Транзакция буфера не запущена');

        Result := GetIDPBKey;
        
        with BufferTransactionQuery do
        begin
       		Close;
		Transaction := BufferTransaction;
		SQL.Text :=
                'INSERT INTO BUFF_TRAN(ID_TRANSACTION, ID_PBKEY, DATE_IN, ' +
		'BUFFER_NAME, IB_BUFFER_NAME) VALUES(' +
		IntToStr(ID_TRANSACTION) + ',' + IntToStr(Result) + ',''' +
		DateToStr(Date) + ''',' + QuotedStr(BUFFER) + ',' +
		QuotedStr(IB_Buffer)+ ')';
		ExecQuery(BufferTransactionQuery);
        end;
end;

procedure TBufferTransaction.Rollback;
var
	BufDelQuery: TIBQuery;
        Id_PBKey: Integer;
begin
	if not FInTransaction then
       		raise Exception.Create('Rollback: Транзакция буфера не запущена');

	BufDelQuery := TIBQuery.Create(nil);
	BufDelQuery.Transaction := BufferTransaction;

		// получить все записи по данной транзакции
        with BufferTransactionQuery do
	begin
        	Close;
       		Transaction := ReadTransaction;
		SQL.Text := 'SELECT * FROM BUFF_GET_TRANSACTION_RECORDS(' + IntToStr(ID_TRANSACTION) + ');';
		Open;
		First;
        end;

		// откатить их
	try
		While Not BufferTransactionQuery.Eof do
		begin
				// открываем нужный dbf
			BufferTable.Close;
			BufferTable.TableName := BufferTransactionQuery['BUFFER_NAME'];
			BufferTable.Open;

				// Удаляем из буфера, если найдем
                        ID_PBKey := BufferTransactionQuery['id_PbKey'];
			if BufferTable.Locate('Id_pbKey', Id_PBKey, []) then
                               	BufferTable.Delete;

				// Удаляем из интербейзовского буфера данные
			if not VarIsNull(BufferTransactionQuery['IB_BUFFER_NAME'])
			then
			begin
				BufDelQuery.SQL.Text := 'DELETE FROM ' +
				BufferTransactionQuery['IB_BUFFER_NAME'] +
				' WHERE Id_PBkey = ' + IntToStr(
				BufferTransactionQuery['Id_PBKey']);
				ExecQuery(BufDelQuery);
			end;


			BufferTable.Close;
			BufferTransactionQuery.Next;
		end;

		except
			FInTransaction := False;
			WriteTransaction.Rollback;
			Exit;
	end;

	// Если все прошло успешно, то удаляем из таблицы транзакций все записи с таким идентификатором транзакций
	try
		BufDelQuery.Close;
		BufDelQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_TRANSACTION_RECORDS_DELETE(' + IntToStr(ID_TRANSACTION) + ')';
		ExecQuery(BufDelQuery);

		WriteTransaction.Rollback;
		FInTransaction := False;
		BufDelQuery.Free;
	except
	on Exception do
		FInTransaction := False;
	end;
end;

procedure TBufferTransaction.Commit;
begin
	if not FInTransaction then
        	raise Exception.Create('Commit: Транзакция буфера не запущена');

		// Если все прошло успешно, то удаляем из таблицы транзакций
                // все записи с таким идентификатором транзакций
	try
        	with BufferTransactionQuery do
                begin
                	Close;
			Transaction := WriteTransaction;
                        SQL.Text :=
                        'EXECUTE PROCEDURE BUFF_TRANSACTION_RECORDS_DELETE ' +
			IntToStr(ID_TRANSACTION);
			ExecQuery(BufferTransactionQuery);
                end;
		WriteTransaction.Commit;
		FInTransaction := False;
	except
		Rollback
	end;
end;

	// откатить все буферные транзакции
procedure AllBuffersRollback;
var
	DeleteTranQuery: TIBQuery;
        Id_PBKey: Integer; 
begin
	DeleteTranQuery := TIBQuery.Create(nil);
	DeleteTranQuery.Transaction := BufferTransaction;

		// получить все записи по всем транзакциям
        with BufferTransactionQuery do
	begin
		Close;
		Transaction := ReadTransaction;
		SQL.Text := 'SELECT * FROM BUFF_TRAN';
		Open;
		First;
        end;

		// откатить их
	While Not BufferTransactionQuery.Eof do
	try
			// открываем нужный dbf
        	BufferTable.Close;
	       	BufferTable.TableName := BufferTransactionQuery['BUFFER_NAME'];
	       	BufferTable.Open;

	       		// Удаляем из буфера, если найдем
                Id_PBKey := BufferTransactionQuery['id_PbKey'];
	       	if BufferTable.Locate('Id_pbKey', Id_PBKey, [])
	       		then BufferTable.Delete;

			// Удаляем из интербейзовского буфера данные
		if not VarIsNull(BufferTransactionQuery['IB_BUFFER_NAME'])
		then
		begin
                	DeleteTranQuery.Close;
			DeleteTranQuery.SQL.Text := 'DELETE FROM ' +
				BufferTransactionQuery['IB_BUFFER_NAME'] +
				' WHERE Id_PBkey = ' + IntToStr(
				BufferTransactionQuery['Id_PBKey']);
			ExecQuery(DeleteTranQuery);
                end;

				// Удаляем из Buff_Tran эту транзакцию
                DeleteTranQuery.Close;
		DeleteTranQuery.SQL.Text := 'DELETE FROM BUFF_TRAN WHERE ' +
			' Id_Transaction = ' + IntToStr(BufferTransactionQuery['Id_Transaction']) +
			' AND Id_PBKey = ' + IntToStr(BufferTransactionQuery['Id_PBKey']);
		ExecQuery(DeleteTranQuery);

	    	BufferTable.Close;
	    	BufferTransactionQuery.Next;

	except  on E: exception do
		begin
			MessageDlg('Під час роботи системи обміну даних виникла проблема: '
				+ E.message, mtError, [mbOk], 0);
			Continue;
		end;
	end;

	BufferTransactionQuery.Close;
end;

function VFloatToString(field : TField) : String;    // Функция дописывает к дробному поля нули после запятой, т.е. было 250 стало 250.00
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

        if POS('.',res_str) = 0 then res_str := res_str + '.';

        while POS('.',res_str) > Length(res_str) - SymbolsAfterDot
        do res_str := res_str + '0';

        result := res_str;

end;

procedure WriteCRC32Field;
var
	i: Integer;
	fieldName: String;
	field: TField;
        crc32_str : String;
        date_form : TFormatSettings;
begin

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
							//else crc32_str := crc32_str + ' ';                            // Если пустая строка, то дополняем одним пробелом

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


Procedure ReCalcCRC(Buffer : String);
begin
        BufferTable.Close;
	BufferTable.TableName := Buffer;
        BufferTable.Open;
        BufferTable.First;
        while not BufferTable.Eof
        do begin
                WriteCrc32Field;
                BufferTable.Next;
        end;
        BufferTable.Close;
end;

procedure WriteToDbf(Buffer, IB_Buffer: String; Id_PBKey: Integer);
var
	i: Integer;
	fieldName: String;
	field: TField;
        val: Variant;
        crc32_str : String;
        index : String;
begin

	with IBBufferQuery do
	begin
		Close;
                Transaction := ReadTransaction;
                SQL.Text := 'SELECT * FROM ' + IB_Buffer +
                	' WHERE Id_PBKey = ' + IntToStr(Id_PBKey);
                Open;
        end;

        BufferTable.Close;
	BufferTable.TableName := Buffer;
        BufferTable.Open;
        BufferTable.IndexFiles.Clear;
        index := Buffer + '.cdx';
        //BufferTable.IndexFiles.Add(index);
        BufferTable.IndexFileInclude(index);
        //ShowMessage(IntToStr(BufferTable.indexCount));
	BufferTable.Append;

        SetLength(crc32_str,4096);
        crc32_str := '';

	for i:=0 to IBBufferQuery.FieldCount-1 do
	begin
		fieldName := UpperCase(IBBufferQuery.Fields[i].FieldName);
		field := BufferTable.Fields.FindField(fieldName);
		if field <> nil then
                begin
                        val := IBBufferQuery[fieldName];

			if field.DataType = ftBoolean then
				field.Value := ( val = 'T')
			else	field.Value := val;
		end
	end;

	//crc32_str := StringToHalcyonASCII(crc32_str);

	//BufferTable.TranslateASCII := False;
	//BufferTable['CRC32'] := CrcToString(CalculateCrc32(crc32_str));
	//BufferTable.TranslateASCII := True;
	if BufferTable.Fields.FindField('SYSTEM_FC') <> nil then
		BufferTable['System_FC'] := 'ABCDEFGH';
	if BufferTable.Fields.FindField('SYSTEM_F') <> nil then
		BufferTable['System_F'] := 'ABCDEFGH';
	if BufferTable.Fields.FindField('SYSTEM_FB') <> nil then
		BufferTable['System_FB'] := 'ABCDEFGH';

	BufferTable.Post;

        WriteCRC32Field;

	BufferTable.Close;
end;

function GetIDPBKey: Integer;
begin
	IBBufferQuery.Close;
	IBBufferQuery.Transaction := BufferTransaction;
	IBBufferQuery.SQL.Text := 'SELECT Id_PbKey FROM Buffer_Get_Id_PBKey';
	Result := ExecQuery(IBBufferQuery);
end;

initialization
	BufferTransactionQuery := TIBQuery.Create(nil);
	IBBufferQuery := TIBQuery.Create(nil);

finalization
	BufferTransactionQuery.Free;
	IBBufferQuery.Free;

end.
