unit uSaldoVal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, Placemnt,
  ActnList, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDataSet, pFIBDataSet, cxGridTableView, StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxSpinEdit,
  cxContainer, cxMaskEdit, cxDropDownEdit, ExtCtrls, ibase, uMainFanc, uMainPerem,
  DateUtils, uWate;

type
  TSaldoValForm = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    CxSch: TcxComboBox;
    TextFIO: TcxTextEdit;
    cxTextEditSmeta: TcxTextEdit;
    cxRZ: TcxTextEdit;
    cxStat: TcxTextEdit;
    cxFiltr: TcxComboBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGridSCH: TcxGridDBColumn;
    cxgrdbclmnGridDog: TcxGridDBColumn;
    cxgrdbclmnGridSM: TcxGridDBColumn;
    cxgrdbclmnGridRZ: TcxGridDBColumn;
    cxgrdbclmnGridST: TcxGridDBColumn;
    cxgrdbclmnGridKEKV: TcxGridDBColumn;
    cxgrdbclmnGridDBSumma: TcxGridDBColumn;
    cxgrdbclmnGridKRSumma: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    OkButton: TcxButton;
    cxClose: TcxButton;
    pnl2: TPanel;
    cxAddDogButton: TcxButton;
    cxDelete: TcxButton;
    cxUpdSaldo: TcxButton;
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
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
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
    StoredProc: TpFIBStoredProc;
    ReadTr: TpFIBTransaction;
    ds1: TDataSource;
    WriteTr: TpFIBTransaction;
    actlst1: TActionList;
    actShow: TAction;
    actIns: TAction;
    actUpd: TAction;
    actDel: TAction;
    actFilter: TAction;
    cxgrdbclmnDB_SUMMA_VAL: TcxGridDBColumn;
    cxgrdbclmnKR_SUMMA_VAL: TcxGridDBColumn;
    cxgrdbclmnCODE_VAL: TcxGridDBColumn;
    DSDB_SUMMA_VAL: TFIBBCDField;
    DSKR_SUMMA_VAL: TFIBBCDField;
    DSCODE_VAL: TFIBStringField;
    DSSYMBOL: TFIBStringField;
    DSNAME_VAL: TFIBStringField;
    DSID_VALUTE: TFIBBCDField;
    ds_upd: TpFIBDataSet;
    DSNUM_DOG: TFIBStringField;
    procedure cxCloseClick(Sender: TObject);
    procedure actShowExecute(Sender: TObject);
    procedure actInsExecute(Sender: TObject);
    procedure actUpdExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMonthBegPropertiesChange(Sender: TObject);
    procedure cxYearBegPropertiesChange(Sender: TObject);
    procedure DSDB_SUMMA_VALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DSKR_SUMMA_VALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DSFIOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    DBEG, DEND: TDateTime;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

   procedure ShowSaldoValForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE); stdcall;
   exports ShowSaldoValForm;
var
  SaldoValForm: TSaldoValForm;

implementation

{$R *.dfm}
uses uAddDoc, uDel;
constructor TSaldoValForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
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
//   windowState:=wsMaximized;
   actIns.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_SALDO','Edit', false)=0;
   actUpd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_SALDO','Edit', false)=0;
   actDel.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_SALDO','Edit', false)=0;

   actShow.Execute;
  
   // cxGrid1.SetFocus;
 end;
end;

procedure ShowSaldoValForm(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);stdcall;
var
 form : TSaldoValForm;
begin
 form := TSaldoValForm.Create(AOwner, DBHANDLE);
 Form.Show;
 //form.Free;
end;
procedure TSaldoValForm.cxCloseClick(Sender: TObject);
begin
  // FormStorage1.SaveFormPlacement;
 Close;
end;

procedure TSaldoValForm.actShowExecute(Sender: TObject);
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
 DS.SelectSQL.Add('SELECT * FROM PC_DT_SALDO_SELECT_VAL(:DATE_REC, :ID_REG)');
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

procedure TSaldoValForm.actInsExecute(Sender: TObject);
var add_saldo   :TAddDocForm;
    Year, Month : Word;
    fio:string;
begin
Year:=cxYearBeg.Value;
Month:=cxMonthBeg.ItemIndex+1;
DBEG:=StartOfAMonth(Year, Month);
add_saldo:=TAddDocForm.Create(Self, DBHANDLE, DBEG, 0, 0);
 add_saldo.lbl1.Visible:=True;
 add_saldo.Lbl2.Visible:=True;
 add_saldo.cxVal.Visible:=True;
 add_saldo.cxKurs.Visible:=True;
add_saldo.ID_SCH:=SCH_ARRAY[cxSch.ItemIndex][0];
add_saldo.cxNameKrSch.Text:=SCH_ARRAY[cxSch.ItemIndex][1];
add_saldo.cxDogEdit.Enabled:=True;
if IS_VALYUTA = 1 then
begin
  add_saldo.cxGrid2.Visible:=True;
  add_saldo.cxGrid2.Align:=alClient;
end;
add_saldo.ShowModal;
if add_saldo.ModalResult = mrOk then
begin
 DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('SELECT * FROM PC_DT_SALDO_SELECT_val(:DATE_REC, :ID_REG)');
 DS.SelectSQL.Add('ORDER BY FIO');
 DS.Prepare;
 DS.ParamByName('DATE_REC').Value:=DBEG;
 DS.ParamByName('ID_REG').Value:=ID_REG;
 DS.CloseOpen(False);
// DS.First;
 fio:=add_saldo.cxDogEdit.Text;
 cxGrid1DBTableView1.ViewData.Expand(true);
end;
add_saldo.free;
//myform.DataSetMain.Locate('ID_J4_SP_JO', myform.DataSetMain['ID_J4_SP_JO'], []);
DS.Locate('FIO',fio,[]);
 cxGrid1.SetFocus;

end;

procedure TSaldoValForm.actUpdExecute(Sender: TObject);
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
add_saldo.lbl1.Visible:=True;
add_saldo.Lbl2.Visible:=True;
add_saldo.cxVal.Visible:=True;
add_saldo.cxKurs.Visible:=True;
if IS_VALYUTA = 1 then
begin
  add_saldo.cxGrid2.Visible:=True;
  add_saldo.cxGrid2.Align:=alClient;
end;
ds_upd.close;
ds_upd.SelectSQL.Clear;
ds_upd.SelectSQL.Add('Select * from PC_DT_SALDO_SELECT_PO_DOG_VAL(:date_rec, :id_reg, :id_dog, :kod_dog)');
ds_upd.Prepare;
ds_upd.ParamByName('DATE_REC').AsDate:= DBEG;
ds_upd.ParamByName('ID_REG').AsInteger:= ID_REG;
ds_upd.ParamByName('ID_DOG').AsInt64:= DS.FieldValues['ID_DOG'];
ds_upd.ParamByName('KOD_DOG').AsInt64:= DS.FieldValues['KOD_DOG'];
ds_upd.CloseOpen(False);
ds_upd.FetchAll;
ds_upd.First;
while not ds_upd.Eof do
begin
try
 add_saldo.SaldoStoredProc.Close;
 add_saldo.SaldoStoredProc.Transaction := add_saldo.SaldoTr;
 add_saldo.SaldoStoredProc.Transaction.StartTransaction;
 add_saldo.SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
 add_saldo.SaldoStoredProc.Prepare;
 add_saldo.SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ds_upd.FieldValues['ID_DOG'];
 add_saldo.SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=ds_upd.FieldValues['KOD_DOG'];  //константа
 add_saldo.SaldoStoredProc.ParamByName('ID_SM').AsInteger:=ds_upd.FieldValues['ID_SM'];
 add_saldo.SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=ds_upd.FieldValues['ID_RZ'];
 add_saldo.SaldoStoredProc.ParamByName('ID_ST').AsInteger:=ds_upd.FieldValues['ID_ST'];
 add_saldo.SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=ds_upd.FieldValues['ID_KEKV'];
 add_saldo.SaldoStoredProc.ParamByName('DB_SUMMA').Value:=ds_upd.FieldValues['DB_SUMMA'];
 add_saldo.SaldoStoredProc.ParamByName('KR_SUMMA').Value:=ds_upd.FieldValues['KR_SUMMA'];
 add_saldo.SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
 add_saldo.SaldoStoredProc.ParamByName('DB_SUMMA_VAL').Value:=ds_upd.FieldValues['DB_SUMMA_VAL'];
 add_saldo.SaldoStoredProc.ParamByName('KR_SUMMA_VAL').Value:=ds_upd.FieldValues['KR_SUMMA_VAL'];
 add_saldo.SaldoStoredProc.ParamByName('ID_VALUTE').AsInt64:=ds_upd.FieldValues['ID_VALUTE'];
 add_saldo.SaldoStoredProc.ExecProc;
 add_saldo.SaldoStoredProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  add_saldo.SaldoStoredProc.Transaction.Rollback;
  exit;
    end;
end;
ds_upd.Next;
end;
add_saldo.cxDogEdit.Text:= DS.FieldValues['FIO'];

add_saldo.SaldoDS.Close;
add_saldo.SaldoDS.SelectSQL.Clear;
add_saldo.SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
add_saldo.SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
add_saldo.SaldoDS.ParamByName('DATE_REG').AsDate:=DBEG;
add_saldo.SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
add_saldo.SaldoDS.CloseOpen(false);
//ShowMessage(VarToStr(ds_upd.FieldValues['DB_SUMMA'])+' '+VarToStr(ds_upd.FieldValues['KR_SUMMA'])+' '+VarToStr(ds_upd.FieldValues['DB_SUMMA_VAL'])+' '+VarToStr(ds_upd.FieldValues['KR_SUMMA_VAL']));
if ((ds.FieldValues['DB_SUMMA']<>null)and(ds.FieldValues['DB_SUMMA']<>0)) then
add_saldo.kurs:=ds.FieldValues['DB_SUMMA']/ds.FieldValues['DB_SUMMA_VAL']
else
if ((ds.FieldValues['KR_SUMMA']<>null)and(ds.FieldValues['KR_SUMMA']<>0)) then
  add_saldo.kurs:=ds.FieldValues['KR_SUMMA']/ds.FieldValues['KR_SUMMA_VAL']
else add_saldo.kurs:=1;
add_saldo.cxKurs.editValue:=add_saldo.kurs;
add_saldo.id_valute:=DS.FieldValues['ID_VALUTE'];
add_saldo.cxVal.Text:=DS.FieldValues['CODE_VAL'];
add_saldo.is_upd:=1;
//add_saldo.UpdButClick(self);

add_saldo.ShowModal;
if add_saldo.ModalResult = mrOk then
begin
 DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('SELECT * FROM PC_DT_SALDO_SELECT_VAL(:DATE_REC, :ID_REG)');
 DS.SelectSQL.Add('ORDER BY FIO');
 DS.Prepare;
 DS.ParamByName('DATE_REC').Value:=DBEG;
 DS.ParamByName('ID_REG').Value:=ID_REG;
 DS.CloseOpen(False);
 DS.First;
 cxGrid1DBTableView1.ViewData.Expand(true);
end;
 add_saldo.free;
 DS.Locate('FIO',fio,[]);
  cxGrid1.SetFocus;

end;

procedure TSaldoValForm.actDelExecute(Sender: TObject);
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
DS.Close;
DS.SelectSQL.Clear;
DS.SelectSQL.Add('SELECT * FROM PC_DT_SALDO_SELECT_VAL(:DATE_REC, :ID_REG)');
DS.SelectSQL.Add('ORDER BY FIO');
DS.Prepare;
DS.ParamByName('DATE_REC').Value:=DBEG;
DS.ParamByName('ID_REG').Value:=ID_REG;
DS.CloseOpen(False);
DS.First;
cxGrid1DBTableView1.ViewData.Expand(true);

end;

procedure TSaldoValForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TSaldoValForm.cxMonthBegPropertiesChange(Sender: TObject);
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

procedure TSaldoValForm.cxYearBegPropertiesChange(Sender: TObject);
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

procedure TSaldoValForm.DSDB_SUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 text:=FloatToStrF(DSDB_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DSSYMBOL.AsString;
end;

procedure TSaldoValForm.DSKR_SUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 text:=FloatToStrF(DSKR_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DSSYMBOL.AsString;
end;

procedure TSaldoValForm.DSFIOGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
text:=DSFIO.AsString + ' ('+DSNUM_DOG.AsString+')';
end;

procedure TSaldoValForm.FormShow(Sender: TObject);
begin
windowState:=wsMaximized;
end;

end.
