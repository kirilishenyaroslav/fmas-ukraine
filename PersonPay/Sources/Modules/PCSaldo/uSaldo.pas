unit uSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxSpinEdit, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, uMainPerem, ibase, DateUtils, uWate,
  ActnList, Placemnt, uMainFanc, cxCheckBox;


type
  TSaldoForm = class(TForm)
    pnl1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    lbl1: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    cxGridSCH: TcxGridDBColumn;
    cxGridSM: TcxGridDBColumn;
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    ReadTr: TpFIBTransaction;
    ds1: TDataSource;
    OkButton: TcxButton;
    DSID_SALDO: TFIBBCDField;
    DSID_DOG: TFIBBCDField;
    DSKOD_DOG: TFIBBCDField;
    DSDB_SUMMA: TFIBBCDField;
    DSKR_SUMMA: TFIBBCDField;
    DSID_SM: TFIBBCDField;
    DSID_RZ: TFIBBCDField;
    DSID_ST: TFIBBCDField;
    DSID_KEKV: TFIBBCDField;
    DSSM_TITLE: TFIBStringField;
    DSSM_KOD: TFIBIntegerField;
    DSRZ_TITLE: TFIBStringField;
    DSRZ_KOD: TFIBIntegerField;
    DSST_TITLE: TFIBStringField;
    DSST_KOD: TFIBIntegerField;
    DSKEKV_TITLE: TFIBStringField;
    DSKEKV_KOD: TFIBIntegerField;
    DSFIO: TFIBStringField;
    DSID_SCH: TFIBBCDField;
    DSSCH_NUMBER: TFIBStringField;
    DSSCH_TITLE: TFIBStringField;
    cxGridRZ: TcxGridDBColumn;
    cxGridST: TcxGridDBColumn;
    cxGridKEKV: TcxGridDBColumn;
    cxGridDBSumma: TcxGridDBColumn;
    cxGridKRSumma: TcxGridDBColumn;
    WriteTr: TpFIBTransaction;
    cxGridDog: TcxGridDBColumn;
    cxClose: TcxButton;
    CxSch: TcxComboBox;
    lbl2: TLabel;
    pnl2: TPanel;
    cxAddDogButton: TcxButton;
    cxDelete: TcxButton;
    cxUpdSaldo: TcxButton;
    actlst1: TActionList;
    actShow: TAction;
    actIns: TAction;
    actUpd: TAction;
    actDel: TAction;
    lbl3: TLabel;
    TextFIO: TcxTextEdit;
    lbl4: TLabel;
    cxTextEditSmeta: TcxTextEdit;
    lbl6: TLabel;
    cxRZ: TcxTextEdit;
    lbl7: TLabel;
    cxStat: TcxTextEdit;
    cxFiltr: TcxComboBox;
    actFilter: TAction;
    cxgrup: TcxCheckBox;

    procedure cxCloseClick(Sender: TObject);
    procedure actShowExecute(Sender: TObject);
    procedure actInsExecute(Sender: TObject);
    procedure actUpdExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMonthBegPropertiesChange(Sender: TObject);
    procedure cxYearBegPropertiesChange(Sender: TObject);
    procedure cxgrupPropertiesChange(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    DBEG, DEND: TDateTime;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowSaldoForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE); stdcall;
  exports ShowSaldoForm;

var
  SaldoForm: TSaldoForm;

implementation

{$R *.dfm}
uses uAddDoc, uDel;

constructor TSaldoForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
var DATE_REC:TDateTime;
    month, year:Word;
    i:Integer;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.DB.Close;
   Self.DB.Handle:=DBHANDLE;
   month:=MonthOf(PERS_PAY_PERIOD);
   year:=YearOf(PERS_PAY_PERIOD);
   Self.cxMonthBeg.ItemIndex:=month-1;
   Self.cxYearBeg.value:=year;
   Self.DS.Close;

   for i:=0 to Length(SCH_ARRAY)- 1 do
  // ShowMessage(IntToStr(i)+' ' + SCH_ARRAY[i][1]);
   CxSch.Properties.Items.Add(SCH_ARRAY[i][1]);
   CxSch.Properties.Items.Add('');
   CxSch.ItemIndex:=0;
  // FormStorage1.RestoreFormPlacement;
    //access

   actIns.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_SALDO','Edit', false)=0;
   actUpd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_SALDO','Edit', false)=0;
   actDel.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_SALDO','Edit', false)=0;

   cxgrup.Checked:=False;
   actShow.Execute;
   // cxGrid1.SetFocus;
 end;
end;

procedure ShowSaldoForm(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);stdcall;
var
 form : TSaldoForm;
begin
 form := TSaldoForm.Create(AOwner, DBHANDLE);
 Form.Show;
 //form.Free;
end;


procedure TSaldoForm.cxCloseClick(Sender: TObject);
begin
   //FormStorage1.SaveFormPlacement;
 Close;
end;

procedure TSaldoForm.actShowExecute(Sender: TObject);
var  Year, Month: Word;
     form:TWateForm;
     prefix:string;
begin
 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(Year, Month);
 Month:=cxMonthBeg.ItemIndex+1;
 DEND:=EndOfAMonth(Year, Month);
 form:=TWateForm.Create(Self);
 form:=TWateForm.Create(Self);
 form.Show;
 form.Update;
 prefix:=' WHERE ';
 DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('SELECT * FROM PC_DT_SALDO_SELECT(:DATE_REC, :ID_REG)');
  if TextFIO.text<>''then
begin
 DS.SelectSQL.Add(prefix+'FIO LIKE '+''''+AnsiUpperCase(TextFIO.text)+'%'+''' ');
 prefix:=' AND ';
end;

if cxTextEditSmeta.text<>''then
begin
 DS.SelectSQL.Add(prefix+'SM_KOD LIKE '+''''+cxTextEditSmeta.text+'%'+''' ');
 prefix:=' AND ';
// is_filtr:=1;
end;

if cxRZ.text<>''then
begin
 DS.SelectSQL.Add(prefix+'RZ_KOD LIKE '+''''+cxRZ.text+'%'+''' ');
 prefix:=' AND ';
// is_filtr:=1;
end;

if cxSTAT.text<>''then
begin
 DS.SelectSQL.Add(prefix+'ST_KOD LIKE '+''''+cxStat.text+'%'+''' ');
 prefix:=' AND ';
// is_filtr:=1;
end;

if CxSch.text<>''then
begin
 DS.SelectSQL.Add(prefix+'SCH_NUMBER = '+''''+CxSch.text+''' ');
 prefix:=' AND ';
// is_filtr:=1;
end;

if cxFiltr.ItemIndex = 1 then
begin
DS.SelectSQL.Add(prefix+' DB_SUMMA<>0 and KR_SUMMA = 0');
 prefix:=' AND ';
// is_filtr:=1;
end;

if cxFiltr.ItemIndex = 2 then
begin
DS.SelectSQL.Add(prefix+' DB_SUMMA = 0 and KR_SUMMA<>0');
 prefix:=' AND ';
// is_filtr:=1;
end;

if cxFiltr.ItemIndex = 3 then
begin
 DS.SelectSQL.Add(prefix+' DB_SUMMA<>0 and KR_SUMMA<>0');
 prefix:=' AND ';
// is_filtr:=1;
end;
 DS.SelectSQL.Add('ORDER BY FIO');
// ShowMessage(DS.SelectSQL.Text);
 DS.Prepare;
 DS.ParamByName('DATE_REC').Value:=DBEG;
 DS.ParamByName('ID_REG').Value:=ID_REG;
 DS.CloseOpen(False);
 DS.First;
 form.Free;
 cxGrid1DBTableView1.ViewData.Expand(true);

end;

procedure TSaldoForm.actInsExecute(Sender: TObject);
var add_saldo   :TAddDocForm;
    Year, Month : Word;
    fio:string;
begin

Year:=cxYearBeg.Value;
Month:=cxMonthBeg.ItemIndex+1;
DBEG:=StartOfAMonth(Year, Month);
add_saldo:=TAddDocForm.Create(Self, DBHANDLE, DBEG, 0, 0);
if IS_NOT_EXIXSTS_SCH = 1  then
begin
  ShowMessage('Не має рахунків системи!');
  Exit;
end;
add_saldo.ID_SCH:=SCH_ARRAY[cxSch.ItemIndex][0];
add_saldo.cxNameKrSch.Text:=SCH_ARRAY[cxSch.ItemIndex][1];
add_saldo.cxDogEdit.Enabled:=True;
add_saldo.ShowModal;
if add_saldo.ModalResult = mrOk then
begin
  actShow.Execute;
{ DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('SELECT * FROM PC_DT_SALDO_SELECT(:DATE_REC, :ID_REG)');
 DS.SelectSQL.Add('ORDER BY FIO');
 DS.Prepare;
 DS.ParamByName('DATE_REC').Value:=DBEG;
 DS.ParamByName('ID_REG').Value:=ID_REG;
 DS.CloseOpen(False);}
// DS.First;
 fio:=add_saldo.cxDogEdit.Text;
 cxGrid1DBTableView1.ViewData.Expand(true);
end;
add_saldo.free;
//myform.DataSetMain.Locate('ID_J4_SP_JO', myform.DataSetMain['ID_J4_SP_JO'], []);
DS.Locate('FIO',fio,[]);
 cxGrid1.SetFocus;
end;

procedure TSaldoForm.actUpdExecute(Sender: TObject);
var add_saldo:TAddDocForm;
   Year, Month: Word;
   fio:string;
begin
if DS.IsEmpty then Exit;
Year:=cxYearBeg.Value;
Month:=cxMonthBeg.ItemIndex+1;
DBEG:=StartOfAMonth(Year, Month);
fio:=DSFIO.AsString;
add_saldo:=TAddDocForm.Create(Self, DBHANDLE, DBEG, 1, DS.FieldValues['ID_SALDO']);
add_saldo.ID_SCH:=SCH_ARRAY[cxSch.ItemIndex][0];
add_saldo.cxNameKrSch.Text:=SCH_ARRAY[cxSch.ItemIndex][1];
add_saldo.cxDogEdit.Enabled:=True;
add_saldo.ID_DOG:=DS.FieldValues['ID_DOG'];
add_saldo.KOD_DOG:=DS.FieldValues['KOD_DOG'];
try
 add_saldo.SaldoStoredProc.Close;
 add_saldo.SaldoStoredProc.Transaction := add_saldo.SaldoTr;
 add_saldo.SaldoStoredProc.Transaction.StartTransaction;
 add_saldo.SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
 add_saldo.SaldoStoredProc.Prepare;
 add_saldo.SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=DS.FieldValues['ID_DOG'];
 add_saldo.SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=DS.FieldValues['KOD_DOG'];  //константа
 add_saldo.SaldoStoredProc.ParamByName('ID_SM').AsInteger:=DS.FieldValues['ID_SM'];
 add_saldo.SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=DS.FieldValues['ID_RZ'];
 add_saldo.SaldoStoredProc.ParamByName('ID_ST').AsInteger:=DS.FieldValues['ID_ST'];
 add_saldo.SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=DS.FieldValues['ID_KEKV'];
 add_saldo.SaldoStoredProc.ParamByName('DB_SUMMA').Value:=DS.FieldValues['DB_SUMMA'];
 add_saldo.SaldoStoredProc.ParamByName('KR_SUMMA').Value:=DS.FieldValues['KR_SUMMA'];
 add_saldo.SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
 add_saldo.SaldoStoredProc.ExecProc;
 add_saldo.SaldoStoredProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  add_saldo.SaldoStoredProc.Transaction.Rollback;
  exit;
    end;
end;
add_saldo.cxDogEdit.Text:= DS.FieldValues['FIO'];
add_saldo.SaldoDS.Close;
add_saldo.SaldoDS.SelectSQL.Clear;
add_saldo.SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
add_saldo.SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
add_saldo.SaldoDS.ParamByName('DATE_REG').AsDate:=DBEG;
add_saldo.SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
add_saldo.SaldoDS.CloseOpen(false);
add_saldo.is_upd:=1;
add_saldo.actEdit.Execute;

//add_saldo.ShowModal;
if add_saldo.ModalResult = mrOk then
begin
   actShow.Execute;
{ DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('SELECT * FROM PC_DT_SALDO_SELECT(:DATE_REC, :ID_REG)');
 DS.SelectSQL.Add('ORDER BY FIO');
 DS.Prepare;
 DS.ParamByName('DATE_REC').Value:=DBEG;
 DS.ParamByName('ID_REG').Value:=ID_REG;
 DS.CloseOpen(False);
 DS.First; }
 cxGrid1DBTableView1.ViewData.Expand(true);
end;
 add_saldo.free;
 DS.Locate('FIO',fio,[]);
  cxGrid1.SetFocus;
end;

procedure TSaldoForm.actDelExecute(Sender: TObject);
var id:Integer;
     f:TDelForm;
begin
if DS.IsEmpty then Exit;
f:=TDelForm.Create(Self);
f.ShowModal;
if f.ModalResult = mrOk then
begin
 id:=DS.FieldValues['ID_SALDO'];
 try
  StoredProc.Close;
  StoredProc.Transaction := ReadTr;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='PC_DT_SALDO_DELETE';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_SALDO').AsInteger:=id;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   exit;
     end;
 end;
f.Free;
end;
{DS.Close;
DS.SelectSQL.Clear;
DS.SelectSQL.Add('SELECT * FROM PC_DT_SALDO_SELECT(:DATE_REC, :ID_REG)');
DS.SelectSQL.Add('ORDER BY FIO');
DS.Prepare;
DS.ParamByName('DATE_REC').Value:=DBEG;
DS.ParamByName('ID_REG').Value:=ID_REG;
DS.CloseOpen(False);
DS.First;   }
 actShow.Execute;
cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TSaldoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TSaldoForm.cxMonthBegPropertiesChange(Sender: TObject);
var now:TDateTime;
    year_now, month_now:Word;
begin
month_now:= cxMonthBeg.ItemIndex +1;
year_now:=cxYearBeg.Value;

now:=StartOfAMonth(year_now, month_now);

if (now < PERS_PAY_PERIOD) then
begin
  cxAddDogButton.Enabled:=False;
  cxUpdSaldo.Enabled:=False;
  cxDelete.Enabled:=False;
end
else
begin
  cxAddDogButton.Enabled:=True;
  cxUpdSaldo.Enabled:=True;
  cxDelete.Enabled:=True;
end;
end;

procedure TSaldoForm.cxYearBegPropertiesChange(Sender: TObject);
var now:TDateTime;
    year_now, month_now:Word;
begin
month_now:= cxMonthBeg.ItemIndex +1;
year_now:=cxYearBeg.Value;

now:=StartOfAMonth(year_now, month_now);

if (now < PERS_PAY_PERIOD) then
begin
  cxAddDogButton.Enabled:=False;
  cxUpdSaldo.Enabled:=False;
  cxDelete.Enabled:=False;
end
else
begin
  cxAddDogButton.Enabled:=True;
  cxUpdSaldo.Enabled:=True;
  cxDelete.Enabled:=True;
end;

end;

procedure TSaldoForm.cxgrupPropertiesChange(Sender: TObject);
begin
if cxgrup.checked=True then cxGrid1DBTableView1.OptionsView.GroupByBox:=True
else cxGrid1DBTableView1.OptionsView.GroupByBox:=False;
end;

end.
