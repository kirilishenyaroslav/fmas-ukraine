{ -$Id: Buffer.pas,v 1.19 2007/01/22 14:44:55 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                   Модуль "Запись в буфера обмена"                            }
{   Запись в буфера обмена dbf из дублирующих буферов Interbase, подсчет CRC,  }
{   управление dbf-транзакциями буфера, откат транзакций                       }
{                                                  ответственный: Олег Волков  }

unit Buffer;

interface

uses Controls, IBDatabase, IBQuery, Halcn6Db, Crc32;

type
  TBufferTransaction = class
  public
    procedure Start;
    function AddRecord(Buffer, IB_Buffer: string): Integer;
    procedure Rollback;
    procedure Commit;
  private
    Id_Transaction: Integer;
    FInTransaction: Boolean;
  published
    property InTransaction: Boolean read FInTransaction;
  end;

var
  Buffer_Id_System: Integer;
  BufferTransaction: TIBTransaction; // транзакция для работы с таблицей Buff_Tran
  BufferTransactionQuery: TIBQuery;
  BufferTable: THalcyonDataset;
  IBBufferQuery: TIBQuery;
  BufferReadTransaction: TIBTransaction; // транзакция для чтения данных
  DontUseIndex: Boolean = False; // Klug
  DontConvert: Boolean = False; // Klug
  UseASCII: Boolean = True; // Klug
  WriteTransaction: TIBTransaction;
  ReadTransaction: TIBTransaction;
  DontWriteToDbf: Boolean;
  UseCRC: Boolean;

function GetIDPBKey: Integer;
procedure AllBuffersRollback(IgnoreError: Boolean = True);
procedure WriteToDbf(ReadTransaction: TIBTransaction; Buffer, IB_Buffer: string;
  Id_PBKey: Integer; DontOpenDbf: Boolean = False); overload;
procedure WriteToDbf(Buffer, IB_Buffer: string; Id_PBKey: Integer; DontOpenDbf: Boolean = False); overload;
procedure MassWriteToDbf(ReadTransaction: TIBTransaction; Buffer, IB_Buffer: string; InfoSQL: string); overload;
procedure MassWriteToDbf(Buffer, IB_Buffer: string; InfoSQL: string); overload;
procedure GetPBKeyRange(InfoSQL: string; var First_PBKey, Last_PBKey: Integer);
procedure MassExport(Buffer, IB_Buffer: string; InfoSQL: string);
procedure ExportRange(ReadTransaction: TIBTransaction; First_PBKey, Last_PBKey: Integer; Buffer, IB_Buffer: string);
procedure ReCalcCRC(Buffer: string);
function ReserverPBKeys(number: Integer): Integer;

procedure InitBuffer(WriteTransaction, ReadTransaction: TIBTransaction;
    DontWriteToDbf: Boolean; UseCRC: Boolean);

implementation

uses Dialogs, SysUtils, Variants, DB, VarUtils, ProcessUnit, Forms,
  SpCommon, NagScreenUnit;


procedure InitBuffer(WriteTransaction, ReadTransaction: TIBTransaction;
    DontWriteToDbf: Boolean; UseCRC: Boolean);
begin
    Buffer.WriteTransaction := WriteTransaction;
    Buffer.ReadTransaction := ReadTransaction;
    Buffer.DontWriteToDbf := DontWriteToDbf;
    Buffer.UseCRC := UseCRC;
end;

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

procedure AddRange(First_PBKey, Last_PBKey: Integer; Buffer, IB_Buffer: string);
var
  Id_PBKey: Integer;
begin
  BufferTransactionQuery.Transaction := BufferTransaction;
  BufferTransaction.StartTransaction;
  try
    for Id_PBKey := First_PBKey to Last_PBKey do
      with BufferTransactionQuery do
      begin
        Close;
        SQL.Text :=
          'INSERT INTO BUFF_TRAN(ID_PBKEY, DATE_IN, ' +
          'BUFFER_NAME, IB_BUFFER_NAME, Id_System) VALUES(' +
          IntToStr(Id_PBKey) + ',CURRENT_DATE' + ',' + QuotedStr(BUFFER) + ','
          + QuotedStr(IB_Buffer) + ',' + IntToStr(Buffer_Id_System) + ')';
        BufferTransactionQuery.ExecSQL;
      end;
    BufferTransaction.Commit;
  except on e: Exception do
    begin
      BufferTransaction.Rollback;
      raise e;
    end;
  end;
end;



function TBufferTransaction.AddRecord(Buffer, IB_Buffer: string): Integer;
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
      'BUFFER_NAME, IB_BUFFER_NAME, Id_System) VALUES(' +
      IntToStr(ID_TRANSACTION) + ',' + IntToStr(Result) + ',CURRENT_DATE' +
      ',' + QuotedStr(BUFFER) + ',' +
      QuotedStr(IB_Buffer) + ',' + IntToStr(Buffer_Id_System) + ')';
    ExecQuery(BufferTransactionQuery);
  end;
end;

procedure TBufferTransaction.Rollback;
var
  BufDelQuery: TIBQuery;
  Id_PBKey: Integer;
  form: TProcessForm;
begin
  form := TProcessForm.Create(nil);
  form.Caption := 'Відкат незавершених операцій, зачекайте...';
  form.Show;

  if not FInTransaction then
    raise Exception.Create('Rollback: Транзакция буфера не запущена');

  BufDelQuery := TIBQuery.Create(nil);
  BufDelQuery.Transaction := BufferTransaction;

  // получить все записи по данной транзакции
  with BufferTransactionQuery do
  begin
    Close;
    Transaction := BufferReadTransaction;
    SQL.Text := 'SELECT * FROM BUFF_GET_TRANSACTION_RECORDS(' + IntToStr(ID_TRANSACTION) + ');';
    Open;
    FetchAll;
    First;

    form.Progress.Max := RecordCount;
  end;

  // откатить их
  try
    while not BufferTransactionQuery.Eof do
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
      if not VarIsNull(BufferTransactionQuery['IB_BUFFER_NAME']) then
      begin
        BufDelQuery.SQL.Text := 'DELETE FROM ' +
          BufferTransactionQuery['IB_BUFFER_NAME'] +
          ' WHERE Id_PBkey = ' + IntToStr(
          BufferTransactionQuery['Id_PBKey']);
        ExecQuery(BufDelQuery);
      end;


      BufferTable.Close;
      BufferTransactionQuery.Next;

      form.Step;
    end;

  except
    FInTransaction := False;
    WriteTransaction.Rollback;
    BufferTransactionQuery.Next;
    form.Step;
    Exit;
  end;

  form.Free;

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

procedure AllBuffersRollback(IgnoreError: Boolean = True);
var
  RollTrans: TIBTransaction;
  DeleteTranQuery, TranRecordsQuery: TIBQuery;
  Id_PBKey: Integer;
  form: TProcessForm;
  WasError: Boolean;
begin
  WasError := False;

  RollTrans := TIBTransaction.Create(BufferTransaction.DefaultDatabase);
  RollTrans.DefaultDatabase := BufferTransaction.DefaultDatabase;
  RollTrans.Params.Add('nowait');

  TranRecordsQuery := TIBQuery.Create(nil);
  TranRecordsQuery.Database := BufferTransaction.DefaultDatabase;
  TranRecordsQuery.Transaction := RollTrans;

  DeleteTranQuery := TIBQuery.Create(nil);
  DeleteTranQuery.Transaction := BufferTransaction;

  BufferTransactionQuery.Transaction := ReadTransaction;
  BufferTransactionQuery.SQL.Text :=
    'SELECT DISTINCT Id_Transaction FROM Buff_Tran ' +
    'WHERE Id_Transaction IS NOT NULL AND Id_System = ' + IntToStr(Buffer_Id_System);
  BufferTransactionQuery.Open;
  BufferTransactionQuery.First;

  while not BufferTransactionQuery.Eof do
  begin
    form := TProcessForm.Create(nil);
    form.Caption := 'Відкат незавершених операцій, зачекайте...';
    form.Show;

         // получить все записи по транзакции
    try
      with TranRecordsQuery do
      begin
        Close;
        Transaction := RollTrans;
        RollTrans.StartTransaction;
        SQL.Text := 'SELECT * FROM BUFF_TRAN WHERE Id_Transaction=' +
          IntToStr(BufferTransactionQuery['Id_Transaction']) +
          ' ORDER BY Buffer_Name, Id_PBKey WITH LOCK';
        Open;
        FetchAll;
        form.Progress.Max := RecordCount;
        First;
      end;
    except on e: Exception do
      begin
        if not IgnoreError then
          MessageDlg('Виникла помилка: ' + e.Message, mtError, [mbOk], 0);
        RollTrans.Rollback;
        BufferTransactionQuery.Next;
        form.Close;
        Continue;
      end
    end;

               // откатить их
    while not TranRecordsQuery.Eof do
    try
                  // открываем нужный dbf
      BufferTable.Close;
      BufferTable.TableName := TranRecordsQuery['BUFFER_NAME'];
      BufferTable.Open;

                 // Удаляем из буфера, если найдем
      Id_PBKey := TranRecordsQuery['id_PbKey'];
      if BufferTable.Locate('Id_pbKey', Id_PBKey, []) then BufferTable.Delete;

                 // Удаляем из интербейзовского буфера данные
      if not VarIsNull(TranRecordsQuery['IB_BUFFER_NAME']) then
      begin
        DeleteTranQuery.Close;
        DeleteTranQuery.SQL.Text := 'DELETE FROM ' +
          TranRecordsQuery['IB_BUFFER_NAME'] +
          ' WHERE Id_PBkey = ' + IntToStr(
          TranRecordsQuery['Id_PBKey']);
        ExecQuery(DeleteTranQuery);
      end;

                    // Удаляем из Buff_Tran эту транзакцию
      DeleteTranQuery.Close;
      DeleteTranQuery.Transaction := RollTrans;
      DeleteTranQuery.SQL.Text := 'DELETE FROM BUFF_TRAN WHERE ' +
        ' Id_Transaction = ' + IntToStr(TranRecordsQuery['Id_Transaction']) +
        ' AND Id_PBKey = ' + IntToStr(TranRecordsQuery['Id_PBKey']);
      ExecQuery(DeleteTranQuery);

      BufferTable.Close;
      TranRecordsQuery.Next;
      form.Step;

    except on E: exception do
      begin
        if not WasError then
        begin
          MessageDlg('Під час відкату даних з буферів виникла проблема: '
            + E.message, mtError, [mbOk], 0);
          WasError := True;
        end;
        TranRecordsQuery.Next;
        form.Step;
        Continue;
      end;
    end;

    TranRecordsQuery.Close;
    RollTrans.Commit;
    form.Close;
    BufferTransactionQuery.Next;
  end;
end;


function VFloatToString(field: TField): string; // Функция дописывает к дробному поля нули после запятой, т.е. было 250 стало 250.00
var
  SymbolsAfterDot: Integer;
  res_str: string;
begin
  SymbolsAfterDot := 2;

  if (field is TFloatField) and (field.DataSet is THalcyonDataSet) then
    SymbolsAfterDot := (field.DataSet as THalcyonDataSet).
      DBFHandle.gsFieldDecimals(field.FieldNo);

  if not VarIsNull(field.Value) then
    res_str := Field.Value
  else
    res_str := '0';

  res_str := StringReplace(res_str, ',', '.', [rfReplaceAll]);

  if POS('.', res_str) = 0 then res_str := res_str + '.';

  while POS('.', res_str) > Length(res_str) - SymbolsAfterDot do
    res_str := res_str + '0';

  result := res_str;

end;

procedure WriteCRC32Field;
var
  i: Integer;
  fieldName: string;
  field: TField;
  crc32_str: string;
  date_form: TFormatSettings;
begin

  date_form.ShortDateFormat := 'yyyymmdd';
  date_form.LongDateFormat := 'yyyymmdd';

  crc32_str := '';

  BufferTable.TranslateASCII := False;
  for i := 0 to BufferTable.FieldCount - 1 do
  begin
    field := BufferTable.Fields[i];
    fieldName := UpperCase(BufferTable.Fields[i].FieldName);
   // CRC32_beg
    if (FieldName <> 'CRC32') and (FieldName <> 'SYSTEM_F') then
    begin

      case field.DataType of
        ftString: if not VarIsNull(field.Value) then crc32_str := crc32_str + field.Value; // Если строка, то пишем её без концевых пробелов

        ftInteger: if not VarIsNull(field.Value) then
            crc32_str := crc32_str + IntToStr(field.Value)
          else
            crc32_str := crc32_str + '0';

        ftSmallInt: if not VarIsNull(field.Value) then
            crc32_str := crc32_str + IntToStr(field.Value)
          else
            crc32_str := crc32_str + '0';

        ftBoolean: if not VarIsNull(field.Value) then
          begin
            if field.Value then
              crc32_str := crc32_str + 'T'
            else
              crc32_str := crc32_str + 'F';
          end
          else
            crc32_str := crc32_str + 'F';

        ftFloat: crc32_str := crc32_str + VFloatToString(field);

        ftDate: if not VarIsNull(field.Value) then
            crc32_str := crc32_str + DateToStr(field.Value, date_form)
          else
            crc32_str := crc32_str + '00000000';
      end;
    end;
   // CRC32_end
  end;

  BufferTable.Edit;

  field := BufferTable.FieldByName('CRC32');

  field.SetData(PChar(CrcToString(CalculateCrc32(crc32_str))));

  BufferTable.Post;

  BufferTable.TranslateASCII := UseASCII; // Klug
end;


procedure ReCalcCRC(Buffer: string);
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

procedure WriteToDbf(Buffer, IB_Buffer: string; Id_PBKey: Integer; DontOpenDbf: Boolean = False);
begin
  WriteToDbf(BufferReadTransaction, Buffer, IB_Buffer, Id_PBKey, DontOpenDbf);
end;

procedure WriteToDbf(ReadTransaction: TIBTransaction; Buffer, IB_Buffer: string;
  Id_PBKey: Integer; DontOpenDbf: Boolean = False);
var
  i, len: Integer;
  fieldName: string;
  field: TField;
  val: Variant;
  crc32_str: string;
  index: string;
  dbfField: string;
begin
  if DontWriteToDbf then Exit;

  with IBBufferQuery do
  begin
    Close;
    Transaction := ReadTransaction;
    SQL.Text := 'SELECT * FROM ' + IB_Buffer +
      ' WHERE Id_PBKey = ' + IntToStr(Id_PBKey);
    Open;
    if IsEmpty then exit;
  end;

  if not DontOpenDbf then
  begin
    BufferTable.Close;
    BufferTable.TableName := Buffer;
    BufferTable.Open;
    BufferTable.IndexFiles.Clear;
    index := Buffer + '.cdx';
            //BufferTable.IndexFiles.Add(index);
    BufferTable.IndexFileInclude(index);
            //ShowMessage(IntToStr(BufferTable.indexCount));
  end;

  BufferTable.Append;

  SetLength(crc32_str, 4096);
  crc32_str := '';

  for i := 0 to IBBufferQuery.FieldCount - 1 do
  begin
    fieldName := UpperCase(IBBufferQuery.Fields[i].FieldName);
    dbfField := fieldName;
    len := Length(dbfField);
    if (len > 4) and (dbfField[len] = 'D') and
      (dbfField[len - 1] = 'T') and (dbfField[len - 2] = 'L')
      and (dbfField[len - 3] = '_') then dbfField := Copy(dbfField, 1, len - 4);

    field := BufferTable.Fields.FindField(dbfField);
    if field <> nil then
    begin
      val := IBBufferQuery[fieldName];

            // Конвертим украинские буквы I, i в латинские
      if (field.DataType = ftString) and (not VarIsNull(val)) then
      begin
        val := StringReplace(val, 'І', Chr(73), [rfReplaceAll]);
        val := StringReplace(val, 'і', Chr(105), [rfReplaceAll]);
      end;

      if field.DataType = ftBoolean then
        field.Value := (val = 'T')
      else
        field.Value := val;
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

  if not DontOpenDbf then BufferTable.Close;
end;

procedure MassWriteToDbf(Buffer, IB_Buffer: string; InfoSQL: string);
begin
  MassWriteToDbf(BufferReadTransaction, Buffer, IB_Buffer, InfoSQL);
end;

procedure MassWriteToDbf(ReadTransaction: TIBTransaction; Buffer, IB_Buffer: string; InfoSQL: string);
var
  i, len: Integer;
  fieldName: string;
  field: TField;
  val: Variant;
  crc32_str: string;
  index: string;
  form: TProcessForm;
  dbfField: string;
begin
  if DontWriteToDbf then Exit;


  form := TProcessForm.Create(nil);
  form.Caption := 'Масова вигрузка у буфер, зачекайте...';
  form.Show;

  with IBBufferQuery do
  begin
    Close;
    Transaction := ReadTransaction;
    SQL.Text := InfoSQL;
    Open;
    FetchAll;
    form.Progress.Max := IBBufferQuery.RecordCount;
    if IsEmpty then
    begin
      form.Close;
      exit;
    end;
  end;

  try
    BufferTable.Close;
    BufferTable.TableName := Buffer;
    BufferTable.Open;
    BufferTable.IndexFiles.Clear;
    if not DontUseIndex then //Klug
    begin
      index := Buffer + '.cdx';
            //BufferTable.IndexFiles.Add(index);
      BufferTable.IndexFileInclude(index);
            //ShowMessage(IntToStr(BufferTable.indexCount));
    end;

  except on e: Exception do
    begin
      MessageDlg(e.Message, mtError, [mbOk], 0);
      form.Free;
      Exit;
    end
  end;

  IBBufferQuery.First;
  while not IBBufferQuery.Eof do
  begin
    BufferTable.Append;

    SetLength(crc32_str, 4096);
    crc32_str := '';

    for i := 0 to IBBufferQuery.FieldCount - 1 do
    begin
      fieldName := UpperCase(IBBufferQuery.Fields[i].FieldName);
      dbfField := fieldName;
      len := Length(dbfField);
      if (len > 4) and (dbfField[len] = 'D') and
        (dbfField[len - 1] = 'T') and (dbfField[len - 2] = 'L')
        and (dbfField[len - 3] = '_') then dbfField := Copy(dbfField, 1, len - 4);

      field := BufferTable.Fields.FindField(dbfField);

      if field <> nil then
      begin
        val := IBBufferQuery[fieldName];

                // Конвертим украинские буквы I, i в латинские
        if (field.DataType = ftString) and (not VarIsNull(val)) and (not DontConvert) then // Klug
        begin
          val := StringReplace(val, 'І', Chr(73), [rfReplaceAll]);
          val := StringReplace(val, 'і', Chr(105), [rfReplaceAll]);
        end;

        if field.DataType = ftBoolean then
          field.Value := (val = 'T')
        else
          field.Value := val;
      end
    end;

    if BufferTable.Fields.FindField('SYSTEM_FC') <> nil then
      BufferTable['System_FC'] := 'ABCDEFGH';
    if BufferTable.Fields.FindField('SYSTEM_F') <> nil then
      BufferTable['System_F'] := 'ABCDEFGH';
    if BufferTable.Fields.FindField('SYSTEM_FB') <> nil then
      BufferTable['System_FB'] := 'ABCDEFGH';

    BufferTable.Post;

    if UseCRC then WriteCRC32Field;

    if Stop then break;
    form.Step;
    IBBufferQuery.Next;
  end;

  BufferTable.Close;
  form.Close;
end;

function GetIDPBKey: Integer;
begin
  IBBufferQuery.Close;
  IBBufferQuery.Transaction := BufferTransaction;
  IBBufferQuery.SQL.Text := 'SELECT Id_PbKey FROM Buffer_Get_Id_PBKey';
  Result := ExecQuery(IBBufferQuery);
end;

function ReserverPBKeys(number: Integer): Integer;
begin
  IBBufferQuery.Close;
  IBBufferQuery.Transaction := BufferTransaction;
  IBBufferQuery.SQL.Text := 'SELECT Id_PbKey FROM Buffer_Get_Id_PBKey';
  Result := ExecQuery(IBBufferQuery);
end;

procedure GetPBKeyRange(InfoSQL: string; var First_PBKey, Last_PBKey: Integer);
var
  NagScreen: TNagScreen;
  InfoQuery: TIBQuery;
begin
  try
    NagScreen := TNagScreen.Create(nil);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримується інформація...');

    InfoQuery := TIBQuery.Create(nil);
    InfoQuery.Transaction := BufferTransaction;

    InfoQuery.SQL.Text := InfoSQL;
    InfoQuery.Open;

    First_PBKey := InfoQuery['First_PBKey'];
    Last_PBKey := InfoQuery['Last_PBKey'];
    InfoQuery.Transaction.Commit;

  finally
    NagScreen.Free;
    InfoQuery.Free;
  end;
end;

procedure ExportRange(ReadTransaction: TIBTransaction; First_PBKey, Last_PBKey: Integer; Buffer, IB_Buffer: string);
var
  sql: string;
begin
  try
    BufferTable.Close;
    BufferTable.TableName := Buffer;
    BufferTable.Open;
    BufferTable.IndexFiles.Clear;
    BufferTable.IndexFileInclude(Buffer + '.cdx');

      // запись в dbf
    sql := 'SELECT * FROM ' + IB_Buffer + ' WHERE Id_PBKey BETWEEN ' +
      IntToStr(First_PBKey) + ' AND ' + IntToStr(Last_PBKey);
    MassWriteToDbf(ReadTransaction, Buffer, IB_Buffer, sql);
  finally
    BufferTable.Close
  end;
end;

procedure MassExport(Buffer, IB_Buffer: string; InfoSQL: string);
var
  First_PBKey, Last_PBKey: Integer;
begin
  try
    WriteTransaction.StartTransaction;

    GetPBKeyRange(InfoSQL, First_PBKey, Last_PBKey);

    ExportRange(BufferReadTransaction, First_PBKey, Last_PBKey, Buffer, IB_Buffer);

  except on e: Exception do
    begin
      if e.Message <> '' then
        MessageDlg('При занесенні у буфер виникла помилка: ' + e.Message,
          mtError, [mbOk], 0);
      WriteTransaction.Rollback;

{      if not Consts_Query.Active then
        Consts_Query.Open;}

      Exit;
    end
  end;
  WriteTransaction.Commit;
end;

initialization
  BufferTransactionQuery := TIBQuery.Create(nil);
  IBBufferQuery := TIBQuery.Create(nil);

finalization
  BufferTransactionQuery.Free;
  IBBufferQuery.Free;

end.

