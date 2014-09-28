unit DataSetExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Halcn6db, ComCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxTextEdit, ZMessages,
  zProc, cxMaskEdit, cxButtonEdit, cxLabel, pfibquery, cxShellDlgs,
  cxShellBrowserDialog;

  function ExpBankDataSet(AOwner:TComponent;DataSet:TpFIBDataSet;IdBank:integer):Variant;stdcall;
  exports ExpBankDataSet;


type
  TBankExportForm = class(TForm)
    DSet: TpFIBDataSet;
    DbfExport: THalcyonDataSet;
    SaveDialog: TSaveDialog;
    CreateDBUniver: TCreateHalcyonDataSet;
    LabelFile: TcxLabel;
    ProgressBar: TcxProgressBar;
    StartBtn: TcxButton;
    ExitBtn: TcxButton;
    cxshlbrwsrdlg1: TcxShellBrowserDialog;
    eFileNameEdit: TcxButtonEdit;
    procedure StartBtnClick(Sender: TObject);
    procedure FileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ExitBtnClick(Sender: TObject);
  private
    pIdBank:integer;
    fType : integer;
    pl_num : integer;
    procedure GenFileName(Path : string);
  public
    constructor Create(AOwner:TComponent;DataSet:TpFIBDataSet;IdBank:integer);reintroduce;
    procedure ExportDefault(DataSet : TpFIBDataSet);
    procedure ExportExim(DataSet : TpFIBDataSet);
    procedure ExportProminvest(DataSet: TpFIBDataSet);
    procedure ExportPrivat(DataSet: TpFIBDataSet);
    procedure ExportTxt(DataSet: TpFIBDataSet);
  end;


implementation

uses StrUtils, DateUtils;

function ExpBankDataSet(AOwner:TComponent;DataSet:TpFIBDataSet;IdBank:integer):Variant;
var
  form : TBankExportForm;
  q    : TpFIBQuery;
begin
  form := TBankExportForm.Create(AOwner, DataSet, IdBank);
  q := TpFIBQuery.Create(form);
  q.Database    := DataSet.Database;
  q.Transaction := DataSet.Transaction;
  q.SQL.Text    := 'select DEFAULT_PATH, EXPORT_PROC from z_sp_type_payment where id_mfo = :id_bank';
  q.Prepare;
  q.ParamByName('ID_BANK').AsInt64 := IdBank;
  try
    q.ExecQuery;
  except
    ZShowMessage('Помилка!', 'Неможливо получити шлях за замовчуванням!', mtError, [mbOk]);
    q.Close;
    form.free;
    exit;
  end;
  form.fType := 0;
  if q.RecordCount = 0 then
  begin
    ZShowMessage('Помилка!', 'Неможливо получити шлях за замовчуванням!', mtError, [mbOk]);
    q.Close;
    form.free;
    exit;
  end;
  if VarIsNull(q['DEFAULT_PATH'].AsVariant) then
  begin
    ZShowMessage('Помилка!', 'Неможливо получити шлях за замовчуванням!', mtError, [mbOk]);
    q.Close;
    form.free;
    exit;
  end;

  if q['EXPORT_PROC'].AsString = 'ExportExim' then form.fType := 1;
  if q['EXPORT_PROC'].AsString = 'ExportProminvest' then form.fType := 2;
  if q['EXPORT_PROC'].AsString = 'ExportPrivat' then form.fType := 3;
  if q['EXPORT_PROC'].AsString = 'ExportTxt' then form.fType := 4;
  form.GenFileName(q['DEFAULT_PATH'].AsString);
  q.Close;
  form.ShowModal;
  form.Free;
end;

Constructor TBankExportForm.Create(AOwner:TComponent;DataSet:TpFIBDataSet;IdBank:integer);
begin
  inherited Create(AOwner);
  DSet := DataSet;
  pl_num := DataSet['NUM_DOC'];
  pIdBank := IdBank;
end;

{$R *.dfm}

procedure TBankExportForm.StartBtnClick(Sender: TObject);
begin
  if eFileNameEdit.Text<>'' then
  begin
    case fType of
      0 : ExportDefault(DSet);
      1 : ExportExim(DSet);
      2 : ExportProminvest(DSet);
      3 : ExportPrivat(DSet);
      4 : ExportTxt(DSet);
    end;
  end else ZShowMessage('Увага!','Не знайден шлях експорту!', mtInformation, [mbOk]);
end;

procedure TBankExportForm.FileNameEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if not cxshlbrwsrdlg1.Execute then exit;
  GenFileName(cxshlbrwsrdlg1.Path);
end;

procedure TBankExportForm.ExitBtnClick(Sender: TObject);
begin
  DSet := nil;
  Close;
end;

procedure TBankExportForm.ExportExim(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('TRAN_DATE;D;8;0');
  CreateDBUniver.CreateFields.Add('CARD_ACCT;C;10;0');
  CreateDBUniver.CreateFields.Add('AMOUNT;N;10;2');
  CreateDBUniver.CreateFields.Add('CURRENCY;C;3;0');
  CreateDBUniver.CreateFields.Add('FIO;C;50;0');

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;

  DbfExport.Exclusive:=False;
  DbfExport.Open;

  try
    While not(DSet.Eof) do
    begin
      DbfExport.Append;

      DbfExport['TRAN_DATE'] := DSet['EXPORT_DAY'];
      DbfExport['CARD_ACCT'] := DSet['ACCT_CARD'];
      DbfExport['AMOUNT']    := DSet['SUMMA'];
      DbfExport['CURRENCY']  := 'UAH';
      DbfExport['FIO']       := DSet['FIO'];

      DbfExport.Post;
      DSet.Next;

      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
  except
    on e:Exception do
    begin
      ZShowMessage('Помилка!', 'Неможливо зробити імпорт!' + #13 + e.Message, mtError, [mbOk]);
      exit;
    end;
  end;
  DbfExport.Close;
  ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
end;


procedure TBankExportForm.ExportProminvest(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('A;C;16;0');
  CreateDBUniver.CreateFields.Add('B;C;45;0');
  CreateDBUniver.CreateFields.Add('C;N;11;2');
  CreateDBUniver.CreateFields.Add('COMPANY;C;30;0');
  CreateDBUniver.CreateFields.Add('INN;C;10;0');
  CreateDBUniver.CreateFields.Add('T_N;C;32;0');

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;

  DbfExport.Exclusive:=False;
  DbfExport.Open;

  try
    While not(DSet.Eof) do
    begin
      DbfExport.Append;

      DbfExport['A']       := DSet['ACCT_CARD'];
      DbfExport['B']       := DSet['FIO'];
      DbfExport['C']       := DSet['SUMMA'];
      DbfExport['COMPANY'] := DSet['NAME_CUSTOMER_NATIVE'];
      DbfExport['INN']     := DSet['TIN'];
      DbfExport['T_N']     := '';

      DbfExport.Post;
      DSet.Next;

      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
  except
    on e:Exception do
    begin
      ZShowMessage('Помилка!', 'Неможливо зробити імпорт!' + #13 + e.Message, mtError, [mbOk]);
      exit;
    end;  
  end;
  DbfExport.Close;
  ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
end;


procedure TBankExportForm.ExportDefault(DataSet: TpFIBDataSet);
var
   TotalRecord:Integer;
   Flag:boolean;
begin
    DbfExport.Close;

    DSet.Open;
    DSet.Last;
    Totalrecord := DSet.RecordCount;
    DSet.First;

    ProgressBar.Properties.Max:=TotalRecord;

    Flag := CreateDBUniver.Execute;

    if Flag then
    begin
        DbfExport.Exclusive:=True;
        DbfExport.Open;
    end
    else
    begin
        ZShowMessage('Помилка!','Неможливо створити файл!',mtError,[mbOk]);
        Exit;
    end;

    while(not DbfExport.Eof) do
    begin
       DbfExport.Delete;
       DbfExport.Next;
    end;

    DbfExport.Close;
    DbfExport.Exclusive:=False;
    DbfExport.Open;


    try
      While not(DSet.Eof) do
      begin
        DbfExport.Append;

        DbfExport['ID_MAN']    := DSet['ID_MAN'];
        DbfExport['TN']        := DSet['TN'];
        DbfExport['FIO']       := DSet['FIO'];
        DbfExport['SUMMA']     := DSet['SUMMA'];
        DbfExport['ACCT_CARD'] := DSet['ACCT_CARD'];
        DbfExport['TIN']       := DSet['TIN'];

        DbfExport.Post;

        DSet.Next;

        ProgressBar.Position   := ProgressBar.Position+1;

        Application.ProcessMessages;
      end;
  except
    on e:Exception do
    begin
      ZShowMessage('Помилка!', 'Неможливо зробити імпорт!' + #13 + e.Message, mtError, [mbOk]);
      exit;
    end;
  end;
  DbfExport.Close;
  ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
end;

procedure TBankExportForm.ExportPrivat(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  s           : string;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('PERIOD;C;22;0');
  CreateDBUniver.CreateFields.Add('TN;N;10;0');
  CreateDBUniver.CreateFields.Add('LSTBL;C;16;0');
  CreateDBUniver.CreateFields.Add('FAM;C;20;0');
  CreateDBUniver.CreateFields.Add('NAME;C;20;0');
  CreateDBUniver.CreateFields.Add('OT;C;20;0');
  CreateDBUniver.CreateFields.Add('RLSUM;N;16;2');
  CreateDBUniver.CreateFields.Add('RLKOD;C;1;0');
  CreateDBUniver.CreateFields.Add('TIN;C;10;0');
  CreateDBUniver.CreateFields.Add('DATE_RO;D;8;0');

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;
  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;

  DbfExport.Exclusive:=False;
  DbfExport.Open;

  try
    While not(DSet.Eof) do
    begin
      DbfExport.Append;

      s := '';
      case MonthOf(DSet['EXPORT_DAY'])of
         1: s := 'январь';
         2: s := 'февраль';
         3: s := 'март';
         4: s := 'апрель';
         5: s := 'май';
         6: s := 'июнь';
         7: s := 'июль';
         8: s := 'август';
         9: s := 'сентябрь';
        10: s := 'октябрь';
        11: s := 'ноябрь';
        12: s := 'декабрь';
      end;

      DbfExport['PERIOD']  := s + ' месяц ' + IntToStr(YearOf(DSet['EXPORT_DAY'])) + ' год';
      DbfExport['TN']      := DSet['ID_MAN'];
      DbfExport['LSTBL']   := DSet['ACCT_CARD'];
      DbfExport['FAM']     := DSet['FAMILIYA'];
      DbfExport['NAME']    := DSet['IMYA'];
      DbfExport['OT']      := DSet['OTCHESTVO'];
      DbfExport['RLSUM']   := DSet['SUMMA'];
      DbfExport['RLKOD']   := 'з';
      DbfExport['TIN']     := DSet['TIN'];
      DbfExport['DATE_RO'] := DSet['BIRTH_DATE'];

      DbfExport.Post;
      DSet.Next;

      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
  except
    on e:Exception do
    begin
      ZShowMessage('Помилка!', 'Неможливо зробити імпорт!' + #13 + e.Message, mtError, [mbOk]);
      exit;
    end;
  end;
  DbfExport.Close;
  ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
end;


procedure TBankExportForm.ExportTxt(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  sl          : TStringList;
  i           : integer;
  idx         : integer;
  str, s      : PAnsiChar;
  test_str    : string;
  sum_str     : string;
  sum         : Currency; 
begin
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(eFileNameEdit.Text));
  sl := TStringList.Create;

  DecimalSeparator := '.';

  sl.Add('Реєстр зарахувань на картрахунки');
  sl.Add('органiзацiї ' + AnsiUpperCase(DSet['NAME_CUSTOMER_NATIVE']));
  sl.Add('до платiжного документа N ' + IntToStr(DSet['NUM_DOC']));
  sl.Add('вiд ' + StringReplace(FormatDateTime('dd/mm/yy', DSet['EXPORT_DAY']), '.', '/', [rfReplaceAll]));
  sl.Add('iм''я файлу: ' + ExtractFileName(eFileNameEdit.Text));
  sl.Add('МФО банку платника: ' + DSet['MFO_CUST']);
  sl.Add('Поточний рахунок платника: ' + DSet['RATE_ACCOUNT_CUST']);
  sl.Add('Код ЕДРПОУ платника: ' + DSet['KOD_EDRPOU_CUST']);
  sl.Add('Загальна суму до зарахування:        ' + FormatFloat('0.00', DSet['SUMMA_ALL']));
  sl.Add('Валюта зарахування: 980');

  //Если вызывается из договоров то это відрядження
  if Owner.ClassName = 'TplatForm' then
     sl.Add('Призначення: зарахування видатків на відрядження')
                                   else
     sl.Add('Призначення: зарахування зароботной плати');
  sl.Add('---------------------------------------------------------------------');
  idx := 1;
  try
    While not(DSet.Eof) do
    begin
      if idx < 10 then test_str  := '    ' + IntToStr(idx)
                  else
      if idx < 100 then test_str := '   ' + IntToStr(idx)
                  else
      if idx < 1000 then test_str := '  ' + IntToStr(idx)
                   else
      if idx < 10000 then test_str := ' ' + IntToStr(idx)
                   else
                   test_str := IntToStr(idx);
      sum := DSet.FBN('SUMMA').AsCurrency;

      if sum < 10 then sum_str := '    ' + FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency)
                  else
      if sum < 100 then sum_str := '   ' + FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency)
                  else
      if sum < 1000 then sum_str := '  ' + FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency)
                  else
      if sum < 10000 then sum_str := ' ' + FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency)
                  else
                  sum_str := FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency);

      sl.Add(test_str + ' ' +  DSet['ACCT_CARD'] + '          ' + sum_str + '  ' + DSet['FIO']);
      inc(idx);
      DSet.Next;
      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
    for i := 0 to sl.Count - 1 do
    begin
      s := PAnsiChar(sl.Strings[i]);
      GetMem(str, Length(s) + 2);
      CharToOem(s, Str);
      sl.Strings[i] := StrPas(Str);;
    end;

    sl.SaveToFile(eFileNameEdit.Text);
  except
    on e:Exception do
    begin
      ZShowMessage('Помилка!', 'Неможливо зробити імпорт!' + #13 + e.Message, mtError, [mbOk]);
      exit;
    end;
  end;


  sl.Free;

  ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
  DecimalSeparator := ',';
end;

procedure TBankExportForm.GenFileName(Path : string);
var
  s  : string;
  sr : TSearchRec;
  mask : string;
  num  : integer;

  function GetExt : string;
  begin
    if fType = 4 then Result := '.txt' else Result := '.dbf';
  end;

begin
  if path[Length(path)] <> '\' then path := path + '\';
//  s := FormatDateTime('mmdd', date);
  s := IntToStr(pl_num);
  case fType of
    0 : s := 'DF' + s;
    1 : s := 'EX' + s;
    2 : s := 'PR' + s;             
    3 : S := 'PV' + S;
    4 : s := 'US' + s;
  end;
{  num := 0;
  while FileExists(path + s +   IfThen(num < 10, '0' + IntToStr(num), IntToStr(num)) + GetExt) do
  begin
    inc(num);
  end;}

//  s := path + s +   IfThen(num < 10, '0' + IntToStr(num), IntToStr(num)) + GetExt;

  if Owner.ClassName = 'TplatForm' then
      s := path + s + 'P' + GetExt
                                   else
      s := path + s + GetExt;

  eFileNameEdit.Text := s;

  DbfExport.DatabaseName := ExtractFilePath(s);;
  DbfExport.TableName := ExtractFileName(s);
end;

end.
