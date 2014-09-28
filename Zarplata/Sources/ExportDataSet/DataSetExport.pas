unit DataSetExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Halcn6db, ComCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxTextEdit, ZMessages,
  zProc, cxMaskEdit, cxButtonEdit, cxLabel, pfibquery, cxShellDlgs,
  cxShellBrowserDialog, XLSReadWriteII2, BIFFRecsII2, ComObj;

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
    DataSetConst: TpFIBDataSet;
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
    procedure ExportProminvest2(DataSet: TpFIBDataSet);
    procedure ExportPrivat(DataSet: TpFIBDataSet);
    procedure ExportUkrSib(DataSet : TpFIBDataSet);
    procedure ExportAval(DataSet : TpFIBDataSet);
    procedure ExportTxt(DataSet: TpFIBDataSet);
    procedure ExportTxt2(DataSet: TpFIBDataSet);
    procedure ExportProminvestKiev(DataSet: TpFIBDataSet);
    procedure ExportVTB(DataSet: TpFIBDataSet);
    procedure ExportPrivatKiev(DataSet: TpFIBDataSet);
    procedure ExportKiev(DataSet: TpFIBDataSet);
    procedure ExportImex(DataSet: TpFIBDataSet);
    procedure ExportPravex(DataSet: TpFIBDataSet);
    procedure ExportUniCreditDBF(DataSet: TpFIBDataSet);
    procedure ExportUkrKomunBankFict(DataSet: TpFIBDataSet);
    procedure ExportUkrKomunBank(DataSet: TpFIBDataSet);
    procedure ExportUkrsibbankSimple(DataSet: TpFIBDataSet);
    procedure ExportOschad(DataSet: TpFIBDataSet);
    function ChangeByte(const FilePath: String; OldByte,NewByte: Byte; SetPos: int64): Boolean;
  end;


implementation

uses StrUtils, DateUtils, MaskUtils;

const year   : array[2000..2020] of string =('0','1','2','3','4','5','6','7','8','9','a',
                                              'b','c','d','e','f','g','h','i','j','k');

const month  : array[1..12] of string =('1','2','3','4','5','6','7','8','9','a','b','c');

const day    : array[0..35] of string =('0','1','2','3','4','5','6','7','8','9','a',
                                        'b','c','d','e','f','g','h','i','j','k',
                                        'l','m','n','o','p','q','r','s','t','u',
                                        'v','w','x','y','z');

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
  if q['EXPORT_PROC'].AsString = 'ExportUkrSib' then form.fType := 4;
  if q['EXPORT_PROC'].AsString = 'ExportAval' then form.fType := 5;
  if q['EXPORT_PROC'].AsString = 'ExportUniCreditDBF' then form.fType := 6;
  if q['EXPORT_PROC'].AsString = 'ExportTxt2' then form.fType := 7;
  if q['EXPORT_PROC'].AsString = 'ExportProminvestKiev' then form.fType := 8;
  if q['EXPORT_PROC'].AsString = 'ExportVTB' then form.fType := 9;
  if q['EXPORT_PROC'].AsString = 'ExportPrivatKiev' then form.fType := 10;
  if q['EXPORT_PROC'].AsString = 'ExportKiev' then form.fType := 11;
  if q['EXPORT_PROC'].AsString = 'ExportImex' then form.fType := 12;
  if q['EXPORT_PROC'].AsString = 'ExportPravex' then form.fType := 13;
  if q['EXPORT_PROC'].AsString = 'ExportProminvest2' then form.fType := 14;
  if q['EXPORT_PROC'].AsString = 'ExportUkrKomunBank' then form.fType := 15;
  if q['EXPORT_PROC'].AsString = 'ExportOschad' then form.fType := 16;
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
      4 : ExportUkrSib(DSet);
      5 : ExportAval(DSet);
      6 : ExportUniCreditDBF(DSet);
      7 : ExportTxt2(DSet);
      8 : ExportProminvestKiev(DSet);
      9 : ExportVTB(DSet);
      10: ExportPrivatKiev(DSet);
      11: ExportKiev(DSet);
      12: ExportImex(DSet);
      13: ExportPravex(DSet);
      14: ExportProminvest2(DSet);
      15: ExportUkrKomunBank(DSet);
      16: ExportOschad(DSet);
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

procedure TBankExportForm.ExportUkrKomunBankFict(DataSet: TpFIBDataSet);
var            //не адекватная постановка(нада было выбрать людей 1 раз а не делать экспорт)
  RecordCount,t : integer;
  xls: TXLSReadWriteII2;
  //  MyExcel: Variant;
  PathTem, PathRes:string;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  {CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('A;C;16;0');
  CreateDBUniver.CreateFields.Add('B;C;45;0');
  CreateDBUniver.CreateFields.Add('C;N;11;2');
  CreateDBUniver.CreateFields.Add('COMPANY;C;30;0');
  CreateDBUniver.CreateFields.Add('INN;C;10;0');
  CreateDBUniver.CreateFields.Add('T_N;C;32;0');    }

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  {if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;

  DbfExport.Exclusive:=False;
  DbfExport.Open; }


  {MyExcel:=CreateOleObject('Excel.Application');
  MyExcel.Visible := False;
  MyExcel.WorkBooks.Add;
  MyExcel.Save(DbfExport.DatabaseName + '\' + DbfExport.TableName);
  MyExcel.Quit;}

  xls:= TXLSReadWriteII2.Create(Application);

  PathTem:= ExtractFilePath(Application.ExeName)+'Reports/Zarplata/Obrazec.xls';
  PathRes:=  DbfExport.DatabaseName + '\' + DbfExport.TableName;
  if FileExists(PathRes) then DeleteFile(PathRes);
  CopyFile(pansichar(PathTem), pansichar(PathRes),true);

  xls.Filename:=PChar(PathRes);
  xls.Read;
  xls.Sheet[0].AsString[0,0]:='П.І.Б.';
  xls.Sheet[0].Cell[0,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[1,0]:='Рід';
  xls.Sheet[0].Cell[1,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[2,0]:='Дата народження';
  xls.Sheet[0].Cell[2,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[3,0]:='Серія паспорта';
  xls.Sheet[0].Cell[3,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[4,0]:='Номер паспорта';
  xls.Sheet[0].Cell[4,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[5,0]:='Дата выдачі';
  xls.Sheet[0].Cell[5,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[6,0]:='Місце видачі паспорта';
  xls.Sheet[0].Cell[6,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[7,0]:='Иден.код';
  xls.Sheet[0].Cell[7,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[8,0]:='Тип';
  xls.Sheet[0].Cell[8,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[9,0]:='Назва міста (або смт. та ін.)';
  xls.Sheet[0].Cell[9,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[10,0]:='Вулица';
  xls.Sheet[0].Cell[10,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[11,0]:='Дом';
  xls.Sheet[0].Cell[11,0].FillPatternForeColor:=xcGreen;
  xls.Sheet[0].AsString[12,0]:='Квартира';
  xls.Sheet[0].Cell[12,0].FillPatternForeColor:=xcGreen;

  for t:=1 to 13 do
    xls.Sheet[0].AsInteger[t-1,1]:=t;

  t:=1;
  try
    While not(DSet.Eof) do
    begin
      xls.Sheet[0].AsString[0,t]:=VarToStrDef(DSet['FIO'], '');
      xls.Sheet[0].AsString[1,t]:=IfThen(DSet['SEX']=1,'м','ж');
      xls.Sheet[0].AsDateTime[2,t]:=DSet['BIRTH_DATE'];
      xls.Sheet[0].AsString[3,t]:=VarToStrDef(DSet['SERIA'],'');
      xls.Sheet[0].AsString[4,t]:=VarToStrDef(DSet['NUMBER'],'');
      xls.Sheet[0].AsString[5,t]:=VarToStrDef(DSet['DATE_BEG'],'');
      xls.Sheet[0].AsString[6,t]:=VarToStrDef(DSet['vidan'],'');
      xls.Sheet[0].AsString[7,t]:=VarToStrDef(DSet['TIN'],'');
      xls.Sheet[0].AsString[8,t]:=VarToStrDef(DSet['NAME_SHORT'],'');
      xls.Sheet[0].AsString[9,t]:=VarToStrDef(DSet['NAME_PLACE'],'');
      xls.Sheet[0].AsString[10,t]:=VarToStrDef(DSet['NAME_STREET'],'');
      xls.Sheet[0].AsString[11,t]:=VarToStrDef(DSet['HOUSE'],'');
      xls.Sheet[0].AsString[12,t]:=VarToStrDef(DSet['FLAT'],'');
      t:=t+1;
      DSet.Next;
      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
    xls.Write;
    xls.Destroy;
  except
    on e:Exception do
    begin
      ZShowMessage('Помилка!', 'Неможливо зробити імпорт!' + #13 + e.Message, mtError, [mbOk]);
      exit;
    end;
  end;
  //DbfExport.Close;
  ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
end;

procedure TBankExportForm.ExportProminvest2(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  str:string;
  c:char;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('ACCT_CARD;C;16;0');
  CreateDBUniver.CreateFields.Add('FIO;C;50;0');
  CreateDBUniver.CreateFields.Add('ID_CODE;C;10;0');
  CreateDBUniver.CreateFields.Add('SUMA;N;10;2');


  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;



  DbfExport.TranslateASCII:=True;
  DbfExport.Exclusive:=False;
  DbfExport.Open;

  try
    While not(DSet.Eof) do                                  //  chr(ord(178))
    begin
      DbfExport.Append;

      DbfExport['ACCT_CARD']  :=    DSet['ACCT_CARD'];
      DbfExport['FIO'] :=           StringReplace(VarToStr(DSet['FIO']),chr(178),'I',[rfReplaceAll, rfIgnoreCase]);
      DbfExport['SUMA'] :=          DSet['SUMMA'];
      DbfExport['ID_CODE']  :=      ifthen((DSet['TIN']<0),'0000000000',DSet['TIN']);

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
  TIN         : string;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('PERIOD;C;22;0');
  CreateDBUniver.CreateFields.Add('TN;N;8;0');
  CreateDBUniver.CreateFields.Add('LSTBL;C;16;0');
  CreateDBUniver.CreateFields.Add('FAM;C;20;0');
  CreateDBUniver.CreateFields.Add('NAME;C;20;0');
  CreateDBUniver.CreateFields.Add('OT;C;20;0');
  CreateDBUniver.CreateFields.Add('RLSUM;N;16;2');
  CreateDBUniver.CreateFields.Add('RLKOD;C;30;0');
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

  DbfExport.TranslateASCII:=True;
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
      DbfExport['TN']      := DSet['TN'];
      DbfExport['LSTBL']   := DSet['ACCT_CARD'];
      DbfExport['FAM']     := DSet['FAMILIYA'];
      DbfExport['NAME']    := DSet['IMYA'];
      DbfExport['OT']      := DSet['OTCHESTVO'];
      DbfExport['RLSUM']   := DSet['SUMMA'];
      DbfExport['RLKOD']   := DSet['PRIZNAK'];
      TIN:=DSet['TIN'];
      if(Pos('-',TIN)>0)then
      begin
        ShowMessage(TIN);
        TIN:=FormatDateTime('ddmmyyyy"00"',DSet['BIRTH_DATE']);
      end;
      DbfExport['TIN']:= TIN;
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

procedure TBankExportForm.ExportUkrSib(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  num : integer;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;
  num := 1;
  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('TRAN_DATE;D;8;0');
  CreateDBUniver.CreateFields.Add('SLIP_NR;C;7;0');
  CreateDBUniver.CreateFields.Add('TRAN_TYPE;C;2;0');
  CreateDBUniver.CreateFields.Add('CARD_ACCT;C;14;0');
  CreateDBUniver.CreateFields.Add('AMOUNT;N;15;2');
  CreateDBUniver.CreateFields.Add('CURRENCY;C;3;0');
  CreateDBUniver.CreateFields.Add('OPERATOR;C;10;0');

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
      DbfExport['SLIP_NR']   := inttostr(num);//IntToStr(pl_num);
      DbfExport['TRAN_TYPE'] := '20';
      DbfExport['CARD_ACCT'] := DSet['ACCT_CARD'];
      DbfExport['AMOUNT']    := DSet['SUMMA'];
      DbfExport['CURRENCY']  := 'UAH';
      if(DSet['EXPORT_OPERATOR']<>null) then
          DbfExport['OPERATOR']  := DSet['EXPORT_OPERATOR']
      else
          DbfExport['OPERATOR']  := '';

      DbfExport.Post;
      DSet.Next;

      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
      num := num+1;
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

procedure TBankExportForm.ExportAval(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('ACCT_CARD;C;10;0');
  CreateDBUniver.CreateFields.Add('FIO;C;50;0');
  CreateDBUniver.CreateFields.Add('ID_CODE;C;10;0');
  CreateDBUniver.CreateFields.Add('SUMA;N;10;2');

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

      DbfExport['ACCT_CARD']       := DSet['ACCT_CARD'];
      DbfExport['FIO']             := DSet['FIO'];
      DbfExport['SUMA']            := DSet['SUMMA'];
      DbfExport['ID_CODE']         := DSet['TIN'];

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
  str, s      : PAnsiChar;
begin
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(eFileNameEdit.Text));
  sl := TStringList.Create;

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
  try
    While not(DSet.Eof) do
    begin
      sl.Add(DSet.FBN('TN').AsString + ' ' + DSet['ACCT_CARD'] + '          ' + StringReplace(FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency),',', '.', [rfReplaceAll]) + '  ' + DSet['FIO']);
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
end;

procedure TBankExportForm.ExportOschad(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  sl          : TStringList;
  i           : integer;
  count       : integer;
begin
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(eFileNameEdit.Text));
  sl := TStringList.Create;

  sl.Add(IntToStr(RecordCount)+'|'+ StringReplace(FormatFloat('0.00', DSet['SUMMA_ALL']), ',', '.', [rfReplaceAll])+'|');


  try
    While not(DSet.Eof) do
    begin
      sl.Add('20|'+varToStr(DSet['ACCT_CARD'])+'|'+varToStr(DSet['FIO'])+'|'+StringReplace(FormatFloat('0.00', DSet['SUMMA']), ',', '.', [rfReplaceAll])+'|');
      DSet.Next;
      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;

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
end;


procedure TBankExportForm.ExportTxt2(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  sl          : TStringList;
  i           : integer;
  count       : integer;
begin
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(eFileNameEdit.Text));
  sl := TStringList.Create;

  sl.Add('Реєстр зарахувань на картрахунки');
  sl.Add('органiзацiї ' + AnsiUpperCase(DSet['NAME_CUSTOMER_NATIVE']));
  sl.Add('до платiжного документа N ' + IntToStr(DSet['NUM_DOC']));
  sl.Add('вiд ' + StringReplace(FormatDateTime('dd.mm.yy', DSet['EXPORT_DAY']), '.', '.', [rfReplaceAll]));
  sl.Add('iм''я файлу: ' + ExtractFileName(eFileNameEdit.Text));
  sl.Add('МФО банку платника: ' + DSet['MFO_CUST']);
  sl.Add('Поточний рахунок платника: ' + DSet['RATE_ACCOUNT_CUST']);
  sl.Add('Код ЕДРПОУ платника: ' + DSet['KOD_EDRPOU_CUST']);
  sl.Add('Загальна суму до зарахування: ' + StringReplace(FormatFloat('0.00', DSet['SUMMA_ALL']), ',', '.', [rfReplaceAll]));
  sl.Add('Валюта зарахування: 980');

  //Если вызывается из договоров то это відрядження
  if Owner.ClassName = 'TplatForm' then
     sl.Add('Призначення: зарахування видатків на відрядження')
                                   else
     sl.Add('Призначення: зарахування зароботной плати');
  sl.Add('---------------------------------------------------------------------');
  count:=1;
  try
    While not(DSet.Eof) do
    begin
      sl.Add('  '+Copy(IntToStr(count)+'          ',0,10) + ' ' + DSet['ACCT_CARD'] + '          ' + StringReplace(FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency), ',', '.', [rfReplaceAll]) + '  ' + DSet['FIO']);
      DSet.Next;
      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
      Inc(count);
    end;
    for i := 0 to sl.Count - 1 do
    begin
{      s := PAnsiChar(sl.Strings[i]);
      GetMem(str, Length(s) + 2);
      CharToOem(s, Str);
      sl.Strings[i] := StrPas(Str);;}
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
end;

procedure TBankExportForm.ExportProminvestkiev(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  sl          : TStringList;
  count       : integer;
begin
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(eFileNameEdit.Text));
  sl := TStringList.Create;

  count:=0;
  while not(DSet.Eof) do
  begin
    DSet.Next;
    Inc(count);
  end;


  sl.Add('Розпорядження на списання коштiв для поповнення карткових рахункiв');
  sl.Add('Ф Вiдд. ПАТ Промiнвестбанк в м.Черкаси');
  sl.Add('');
  sl.Add('CODE: 074');

  sl.Add('FILE: uObluian.F01');
  sl.Add('DATE: '+StringReplace(FormatDateTime('dd.mm.yy', DSet['EXPORT_DAY']), '.', '/', [rfReplaceAll]));
  sl.Add('CURR: 980');
  sl.Add('CARD: ' + IntToStr(count));
  sl.Add('AMNT: ' + StringReplace(FormatFloat('0.00', DSet['SUMMA_ALL']), ',', '.', [rfReplaceAll]));
  sl.Add('TEXT: ' + IntToStr(DSet['NUM_DOC'])+' від '+StringReplace(FormatDateTime('dd.mm.yy', DSet['EXPORT_DAY']), '.', '.', [rfReplaceAll]));
  sl.Add('START: ');

  sl.Add('');
  DSet.First;
  try
    while not(DSet.Eof) do
    begin
      sl.Add(DSet['ACCT_CARD'] + ' ' + StringReplace(FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency), ',', '.', [rfReplaceAll]));
      DSet.Next;
      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;

  sl.Add('');
  sl.Add('END:');

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
end;

procedure TBankExportForm.ExportVTB(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  count       : integer;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('NNP;N;5;0');
  CreateDBUniver.CreateFields.Add('FAM;C;20;0');
  CreateDBUniver.CreateFields.Add('NAME;C;20;0');
  CreateDBUniver.CreateFields.Add('SURNAME;C;20;0');
  CreateDBUniver.CreateFields.Add('INN;C;10;0');
  CreateDBUniver.CreateFields.Add('CARDNO;C;16;0');
  CreateDBUniver.CreateFields.Add('SUMMA;N;16;2');

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;
  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;

  DbfExport.TranslateASCII:=false;
  DbfExport.Exclusive:=False;
  DbfExport.Open;

  count:=1;
  try
    While not(DSet.Eof) do
    begin
      DbfExport.Append;


      DbfExport['NNP']  := count;
      DbfExport['FAM']     := DSet['FAMILIYA'];
      DbfExport['NAME']    := DSet['IMYA'];
      DbfExport['SURNAME'] := DSet['OTCHESTVO'];
      DbfExport['INN']     := DSet['TIN'];
      DbfExport['CARDNO']  := DSet['ACCT_CARD'];
      DbfExport['SUMMA']   := DSet['SUMMA'];
      DbfExport.Post;
      DSet.Next;

      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
      Inc(count);
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

procedure TBankExportForm.ExportPrivatKiev(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('LSTBL;C;10;0');
  CreateDBUniver.CreateFields.Add('RLSUM;N;16;2');
  CreateDBUniver.CreateFields.Add('RLKOD;C;30;0');
  CreateDBUniver.CreateFields.Add('FAM;C;50;0');
  CreateDBUniver.CreateFields.Add('NAME;C;50;0');
  CreateDBUniver.CreateFields.Add('OT;C;50;0');
  CreateDBUniver.CreateFields.Add('CARD_NO;C;16;0');
  CreateDBUniver.CreateFields.Add('INN;C;10;0');

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;
  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;

  DbfExport.TranslateASCII:=true;
  DbfExport.Exclusive:=False;
  DbfExport.Open;

  try
    While not(DSet.Eof) do
    begin
      DbfExport.Append;

      DbfExport['LSTBL']   := DSet['TIN'];
      DbfExport['RLSUM']   := DSet['SUMMA'];
      DbfExport['RLKOD']   := '750';
      DbfExport['FAM']     := DSet['FAMILIYA'];
      DbfExport['NAME']    := DSet['IMYA'];
      DbfExport['OT']      := DSet['OTCHESTVO'];
      DbfExport['CARD_NO'] := DSet['ACCT_CARD'];
      {TIN:=DSet['TIN'];
      if(Pos('-',TIN)>0)then
      begin
        ShowMessage(TIN);
        TIN:=FormatDateTime('yyyymmdd"00"',DSet['BIRTH_DATE']);
      end; }
      DbfExport['INN']:= DSet['TIN'];

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

procedure TBankExportForm.ExportKiev(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  sl          : TStringList;
  count       : integer;
begin
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(eFileNameEdit.Text));
  sl := TStringList.Create;

  sl.Add(eFileNameEdit.Text+'    001'+FormatDateTime('yyyymmdd', DSet['EXPORT_DAY']));
  DSet.First;
  count:=0;
  try
    while not(DSet.Eof) do
    begin
      sl.Add(DSet['ACCT_CARD'] + '    ' + StringReplace(FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency), ',', '', [rfReplaceAll])+'980'+FormatDateTime('yyyymmdd', DSet['EXPORT_DAY']));
      DSet.Next;
      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
      Inc(count);
    end;

    sl.Add(eFileNameEdit.Text+'     '+IntToStr(count+2)+'     '+StringReplace(FormatFloat('0.00', DSet['SUMMA_ALL']), ',', '', [rfReplaceAll]));

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
end;

procedure TBankExportForm.ExportImex(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
  sl          : TStringList;
  count       : integer;
begin
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(eFileNameEdit.Text));
  sl := TStringList.Create;

  count:=0;
  while not(DSet.Eof) do
  begin
    DSet.Next;
    Inc(count);
  end;


  sl.Add('ВЕДОМОСТЬ      1     '+IntToStr(count)+'        '+DSet['KOD_EDRPOU_CUST']+'        '+DSet['RATE_ACCOUNT_CUST']+
         '       '+FormatDateTime('dd.mm.yyyy', DSet['EXPORT_DAY'])+'       '+StringReplace(FormatFloat('0.00', DSet['SUMMA_ALL']), ',', '', [rfReplaceAll]));
  DSet.First;
  try
    while not(DSet.Eof) do
    begin

      sl.Add(FormatMaskText('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL',DSet['FAMILIYA'])+
             FormatMaskText('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL',DSet['IMYA'])+
             FormatMaskText('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL',DSet['OTCHESTVO'])+
             FormatMaskText('AAAAAAAAAAAAAAAAAA',DSet['ACCT_CARD'])+
             FormatMaskText('AAAAAAAA',StringReplace(FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency), ',','', [rfReplaceAll]))+
             FormatMaskText('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',IntToStr(DSet['NUM_DOC'])+' від '+StringReplace(FormatDateTime('dd.mm.yy', DSet['EXPORT_DAY']), '.', '.', [rfReplaceAll])));
      DSet.Next;
      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
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
end;

procedure TBankExportForm.ExportPravex(DataSet: TpFIBDataSet);
var
  RecordCount : integer;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;

  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('ACCOUNT;C;14;0');
  CreateDBUniver.CreateFields.Add('SUM;N;12;0');
  CreateDBUniver.CreateFields.Add('LAST;C;20;0');
  CreateDBUniver.CreateFields.Add('NAME;C;20;0');
  CreateDBUniver.CreateFields.Add('SNAME;C;20;0');

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

      DbfExport['ACCOUNT']    := DSet['ACCT_CARD'];
      DbfExport['SUM']        := StringReplace(FormatFloat('0.00', DSet.FBN('SUMMA').AsCurrency), ',','', [rfReplaceAll]);
      DbfExport['LAST']       := DSet['FAMILIYA'];
      DbfExport['NAME']       := DSet['IMYA'];
      DbfExport['SNAME']      := DSet['OTCHESTVO'];

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

procedure TBankExportForm.GenFileName(Path : string);
var
  s  : string;


  function GetExt : string;
  begin
    if (fType=12) or (fType=16) then Result := '.txt'
    else
    begin
      if (fType = 7) then Result := '.828' else Result := '.dbf';
    end
  end;

begin
  if path[Length(path)] <> '\' then path := path + '\';
//  s := FormatDateTime('mmdd', date);
  s := IntToStr(pl_num);
  case fType of
    0 : s := 'DF' + s;
    1 : s := 'EX' + s;
    2 : s := 'PR' + s;
    3 : s := 'PV' + S;
    4 : s := 'US' + s;
    5 : s := 'AV' + s;
    6 : s := 'US' + s;
    7 : s := '^001';
    12: s := 'IMEX' + s;
    15 : s := 'US' + s;
  end;
{  num := 0;
  while FileExists(path + s +   IfThen(num < 10, '0' + IntToStr(num), IntToStr(num)) + GetExt) do
  begin
    inc(num);
  end;}

//  s := path + s +   IfThen(num < 10, '0' + IntToStr(num), IntToStr(num)) + GetExt;\


  if(ftype<>7) then s := path + s + 'P' + GetExt
  else
  begin
    s := s + year[YearOf(Date)]+day[DayOf(Date)]+month[MonthOf(Date)]+day[pl_num mod 36];
    s := path + s + GetExt;
  end;

  if(fType=8)then
    s:=path+'uObluian.F01';

  if(fType=9)then
    s:=path+'D'+FormatDateTime('yymmdd', date)+'S.dbf';

  if(fType=10)then
    s:=path+'28E_0291.dbf';

  if(fType=11)then
    s:=path+'p0010071.iss';

  if(fType=13)then
    s:=path+'xbase.dbf';

  eFileNameEdit.Text := s;

  DbfExport.DatabaseName := ExtractFilePath(s);
  DbfExport.TableName := ExtractFileName(s);
end;

procedure TBankExportForm.ExportUniCreditDBF(DataSet: TpFIBDataSet);
var
  RecordCount,i : integer;
  buf0,S,Res:string;
  buf1:WideString;
  Source : array[0..255] of Char;
  Dest:PChar;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;


  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('PAN;C;15;0');
  CreateDBUniver.CreateFields.Add('SUMA;N;12;2');
  CreateDBUniver.CreateFields.Add('FIO;C;80;0');
  CreateDBUniver.CreateFields.Add('IDEN;C;10;0');
  CreateDBUniver.CreateFields.Add('TN;C;20;0');

  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;
  DbfExport.TranslateASCII:=True;
  DbfExport.Exclusive:=False;
  DbfExport.Open;

  DbfExport.Append;
  buf0:= '@'+ VarToStr(DSet['RATE_ACCOUNT_CUST']);
  OemToAnsi(PAnsiChar(buf0),  PAnsiChar(buf0));
  DbfExport['PAN'] :=         buf0;
  DbfExport['SUMA']:=         DSet['SUMMA_ALL'];

  buf0:=IfThen(Owner.ClassName = 'TplatForm','зарахування видатків на відр.','зарахування зар. плати');
  OemToAnsi(PAnsiChar(buf0),  PAnsiChar(buf0));
  DbfExport['FIO'] :=         buf0;
  DbfExport['IDEN']  :=       DSet['OKPO'];
  DbfExport['TN']  :=         DSet['MFO_CUST'];
  DbfExport.Post;

  try
    While not(DSet.Eof) do
    begin
      DbfExport.TranslateASCII:=False;
      DbfExport.Append;

      DbfExport['PAN']  :=    DSet['ACCT_CARD'];
      DbfExport['SUMA'] :=    DSet['SUMMA'];

      DbfExport['FIO']   :=    DSet['FIO']; //(buf0);

      DbfExport['IDEN']  :=    ifthen((DSet['TIN']<0),'0000000000',DSet['TIN']);

      DbfExport['TN']  :=    DSet['TN'];

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
//  ChangeByte(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName),$026,$0C9,29);
  ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
end;

function TBankExportForm.ChangeByte(const FilePath: String; OldByte,NewByte: Byte; SetPos: int64): Boolean;
var
  FS: TFileStream;
  B: Byte;
begin
  Result := False;
  FS := TFileStream.Create(FilePath,FMOpenReadWrite);
  //try
    if FS.Size<SetPos then Exit;
    FS.Position := SetPos;
    FS.Read(B,1);
//    if B=OldByte then
    begin
      FS.Position := SetPos;
      Result := FS.Write(newByte,1)=1;
    end;
  //finally
    FS.Free;
  //end;
end;

procedure TBankExportForm.ExportUkrKomunBank(DataSet: TpFIBDataSet);
var
  RecordCount,i : integer;
  buf0,S,Res:string;
  buf1:WideString;
  Source : array[0..255] of Char;
  Dest:PChar;
begin
  DbfExport.Close;
  DSet.Open;
  DSet.FetchAll;
  RecordCount := DSet.RecordCount;
  DSet.First;


  CreateDBUniver.CreateFields.Clear;
  CreateDBUniver.CreateFields.Add('FIO;C;80;0');
  CreateDBUniver.CreateFields.Add('PAN;C;16;0');
  CreateDBUniver.CreateFields.Add('SUMA;N;16;2');
  CreateDBUniver.CreateFields.Add('IDEN;C;10;0');


  ProgressBar.Properties.Max := RecordCount;
  ProgressBar.Position       := 0;

  DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
  if not CreateDBUniver.Execute then
  begin
    ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
    Exit;
  end;
  DbfExport.TranslateASCII:=True;
  DbfExport.Exclusive:=False;
  DbfExport.Open;

  {DbfExport.Append;
  //buf0:= '@'+ VarToStr(DSet['RATE_ACCOUNT_CUST']);
  //OemToAnsi(PAnsiChar(buf0),  PAnsiChar(buf0));
  //DbfExport['PAN'] :=         buf0;
  DbfExport['PAN'] :=         DSet['RATE_ACCOUNT_CUST'];
  DbfExport['SUMA']:=         DSet['SUMMA_ALL'];

  //buf0:=IfThen(Owner.ClassName = 'TplatForm','зарахування видатків на відр.','зарахування зар. плати');
  //OemToAnsi(PAnsiChar(buf0),  PAnsiChar(buf0));
  DbfExport['FIO'] :=         buf0;
  DbfExport['IDEN']  :=       DSet['OKPO'];
  DbfExport['TN']  :=         DSet['MFO_CUST'];
  DbfExport.Post;   }

  try
    While not(DSet.Eof) do
    begin
      DbfExport.TranslateASCII:=False;
      DbfExport.Append;
      DbfExport['PAN']  :=    DSet['ACCT_CARD'];
      DbfExport['SUMA'] :=    DSet['SUMMA'];

      DbfExport['FIO']   :=    DSet['FIO']; //(buf0);

      DbfExport['IDEN']  :=    ifthen((DSet['TIN']<0),'0000000000',DSet['TIN']);

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
//  ChangeByte(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName),$026,$0C9,29);
  ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
end;



procedure TBankExportForm.ExportUkrsibbankSimple(DataSet: TpFIBDataSet);
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


end.
