unit uProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, frxExportImage,
  frxExportPDF, frxExportRTF, frxExportXLS, frxExportHTML, frxClass,
  frxExportTXT, frxCross,  ActnList, frxDesgn, frxDBSet,
  cxGridTableView, FIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons,
  ExtCtrls, cxGridDBTableView, DateUtils, uMainPerem, ibase, uWate, Kernel;

type
  TProvFrom = class(TForm)
    pnl1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    TR: TpFIBTransaction;
    StPr: TpFIBStoredProc;
    ds1: TDataSource;
    actlst1: TActionList;
    actShow: TAction;
    DSID_PC_TMP: TFIBBCDField;
    DSID_DOG: TFIBBCDField;
    DSKOD_DOG: TFIBBCDField;
    DSIN_DB_SUMMA: TFIBBCDField;
    DSIN_KR_SUMMA: TFIBBCDField;
    DSOUT_DB_SUMMA: TFIBBCDField;
    DSOUT_KR_SUMMA: TFIBBCDField;
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
    DSDATE_OST_MOOVE: TFIBDateField;
    DSDATE_EXEC_DOLG: TFIBDateField;
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
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actMain: TAction;
    cxButton3: TcxButton;
    actClose: TAction;
    DS_Buffer: TpFIBDataSet;
    DS_BufferID_SM: TFIBBCDField;
    DS_BufferID_RZ: TFIBBCDField;
    DS_BufferID_ST: TFIBBCDField;
    DS_BufferID_KEKV: TFIBBCDField;
    DS_BufferID_DOG: TFIBBCDField;
    DS_BufferOUT_DB_SUMMA: TFIBBCDField;
    DS_BufferOUT_KR_SUMMA: TFIBBCDField;
    DS_BufferCR_BY_DT: TFIBIntegerField;
    DS_BufferSUMMA_OST: TFIBBCDField;
    DS_BufferDB_ID_SCH_VIVOD: TFIBBCDField;
    DS_BufferKR_ID_SCH_VIVOD: TFIBBCDField;
    DS_SUMMA: TpFIBDataSet;
    pFIBStoredProc1: TpFIBStoredProc;
    StPr2: TpFIBStoredProc;
    Tr2: TpFIBTransaction;
    procedure actShowExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actMainExecute(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    id_session, key_session:Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowProvForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE); stdcall;
  exports ShowProvForm;

var
  ProvFrom: TProvFrom;

implementation

{$R *.dfm}
procedure ShowProvForm(AOwner:TComponent;  DBHANDLE : TISC_DB_HANDLE);stdcall;
var
 form : TProvFrom;
begin
 form := TProvFrom.Create(AOwner, DBHANDLE);
 Form.Show;
end;

constructor TProvFrom.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
begin
inherited Create(AOwner);
if Assigned(DBHandle)
then begin
 Self.DBHANDLE := DBHandle;
 Self.DB.Close;
 Self.DB.Handle:=DBHANDLE;
 id_session:=0;
 actShow.Execute;
 
end;
end;

procedure TProvFrom.actShowExecute(Sender: TObject);
var
 form:TWateForm;
 prefix: string;
 is_one:Integer;
begin
form:=TWateForm.Create(Self);
form.Show;
form.Update;
// чистим временные таблицы
try
 StPr.Close;
 StPr.Transaction := TR;
 StPr.Transaction.StartTransaction;
 StPr.StoredProcName:='PC_CLEAR_TIME_TABLES';
 StPr.Prepare;
 StPr.ParamByName('ID_SESSION').AsInteger:=id_session;
 StPr.ExecProc;
 StPr.Transaction.Commit;
except on E : Exception
 do begin
 ShowMessage(E.Message);
 StPr.Transaction.Rollback;
 exit;
 end;
end;
// выбираем сессию
try
//  showmessage(inttostr(ID_REG));
 StPr.Close;
 StPr.Transaction := TR;
 StPr.Transaction.StartTransaction;
 StPr.StoredProcName:='PC_TMP_OBOROT_INS_UPD_TWO_REG';
 StPr.Prepare;
 StPr.ParamByName('DATE_BEG').Value:=StartOfTheMonth(PERS_PAY_PERIOD);
 StPr.ParamByName('DATE_END').Value:=EndOfTheMonth(PERS_PAY_PERIOD);
 StPr.ParamByName('FORM_UCH').Value:=FORM_UCH;
 StPr.ExecProc;
 StPr.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StPr.Transaction.Rollback;
  exit;
 end;
end;
id_session:=StPr.ParamByName('ID_SESSION').Value;

DS.Close;
DS.SelectSQL.Clear;
DS.SelectSQL.Add('SELECT * FROM PC_TMP_OBOROT_SELECT(:ID_SESSION, :DATE_REG, :ID_REG)' );
DS.SelectSQL.Add(' ORDER BY FIO, id_dog, sm_kod, rz_kod, st_kod, kekv_kod ');
DS.Prepare;
DS.ParamByName('ID_SESSION').AsInteger:=id_session;
DS.ParamByName('DATE_REG').Value:=StartOfTheMonth(PERS_PAY_PERIOD);
DS.ParamByName('ID_REG').Value:=ID_REG;
DS.CloseOpen(False);
DS.First;
form.Free;
end;

procedure TProvFrom.actCloseExecute(Sender: TObject);
begin
try
 StPr.Close;
 StPr.Transaction := TR;
 StPr.Transaction.StartTransaction;
 StPr.StoredProcName:='PC_CLEAR_TIME_TABLES';
 StPr.Prepare;
 StPr.ParamByName('ID_SESSION').AsInteger:=id_session;
 StPr.ExecProc;
 StPr.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StPr.Transaction.Rollback;
  exit;
    end;
 end;
 Close;
end;

procedure TProvFrom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
 StPr.Close;
 StPr.Transaction := TR;
 StPr.Transaction.StartTransaction;
 StPr.StoredProcName:='PC_CLEAR_TIME_TABLES';
 StPr.Prepare;
 StPr.ParamByName('ID_SESSION').AsInteger:=id_session;
 StPr.ExecProc;
 StPr.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StPr.Transaction.Rollback;
  exit;
    end;
 end;
 Action:=caFree;
end;

procedure TProvFrom.actMainExecute(Sender: TObject);
var STRU        : KERNEL_MODE_STRUCTURE;
    form        : TWateForm;
    DoResult    : Boolean;
    ErrorList   : TStringList;
    MemoLines   : TStringList;
    i, ID_DEF_CUSTOMER  : Integer;
    summa_doc   :Double;
    PK_id       :Int64;
    be_prov     :Integer;
    n_doc     :Integer;
    num_doc, num_doc_proc :string;
begin
form:=TWateForm.Create(Self);
form.Show;
form.Update;
// генерим сессию
key_session := DS.Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

// add prov to buffer
 StPr.StoredProcName:='PC_SVOD_PROV';
 StPr.Prepare;
 StPr.ParamByName('FORM_UCH').AsInteger:=FORM_UCH;
 StPr.ParamByName('DATE_BEG').AsDate:=PERS_PAY_PERIOD;
 StPr.ParamByName('ID_SESSION').AsInteger:=id_session;
 StPr.ParamByName('KEY_SESSION').AsInteger:=key_session;
 StPr.ParamByName('ID_REG').AsInteger:=ID_REG;
 StPr.ExecProc;

 be_prov:=StPr.ParamByName('BE_PROV').Value;

 if be_prov = 0 then
 begin
   ShowMessage('Жодна проводка не була додана. Всі рахунки вирівнено');
   form.Free;
   Exit;
 end;

 // add doc
 if FORM_UCH = 20 then
  n_doc:= DS_SUMMA.Database.Gen_Id('PC_NUM_DOC_CN', 1);
  if FORM_UCH = 19 then
  n_doc:= DS_SUMMA.Database.Gen_Id('PC_NUM_DOC_ST', 1);
  num_doc:=IntToStr(n_doc);
  num_doc_proc:='';
  i:=Length(num_doc);
  while (i<LENGHT_NUM_DOC) do
  begin
  num_doc_proc:=num_doc_proc+'0';
  Inc(i);
  end;
  num_doc_proc:=num_doc_proc+num_doc;

 DS_SUMMA.Close;
 DS_SUMMA.SelectSQL.Text:='SELECT UNKNOWN_ID_CUST FROM PUB_SYS_DATA';
 DS_SUMMA.Prepare;
 DS_SUMMA.CloseOpen(False);
 if DS_SUMMA.FieldValues['UNKNOWN_ID_CUST']<>null then
 ID_DEF_CUSTOMER:= DS_SUMMA.FieldValues['UNKNOWN_ID_CUST']
 else ID_DEF_CUSTOMER:=0;

 StPr2.ExecProcedure('PUB_GET_ID_DOC', [20]);
 PK_id := StPr2.FieldByName('RET_VALUE').AsInt64;
 StPr2.Close;

 DS_SUMMA.Close;
 DS_SUMMA.SelectSQL.Text:='SELECT SUM(SUMMA) FROM PUB_DT_ALL_PROV_BUFFER WHERE KEY_SESSION = :KEY_SESSION';
 DS_SUMMA.Prepare;
 DS_SUMMA.ParamByName('KEY_SESSION').AsInteger:=key_session;
 DS_SUMMA.CloseOpen(False);
 summa_doc:=DS_SUMMA.FieldValues['SUM'];
 //генерация номера

 StPr.StoredProcName := 'PC_DT_ALL_DOC_ADD_SVOD';
 StPr.Prepare;

 StPr.ParamByName('KEY_SESSION').AsInt64   := KEY_SESSION;
 StPr.ParamByName('PK_ID').AsInt64         := PK_id;
// StoredProc.ParamByName('COMPUTER').AsString     := SYS_INFO^._Comp_Name;
 StPr.ParamByName('DATE_PROV').AsDate      := PERS_PAY_PERIOD;
 StPr.ParamByName('DATE_DOC').AsDate       := PERS_PAY_PERIOD;
 StPr.ParamByName('ID_TYPE_DOC').AsInteger := TYPE_DOC;
 StPr.ParamByName('REG_NUM').AsString      := num_doc_proc;
 StPr.ParamByName('SUMMA').AsCurrency      := summa_doc;
 StPr.ParamByName('ID_CUSTOMER').AsInt64   := ID_DEF_CUSTOMER;
 StPr.ParamByName('NOTE').AsString         := 'ВЫРАВНИВАНИЕ СЧЕТОВ';
 StPr.ExecProc;

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := PERS_PAY_PERIOD;
 STRU.DBHANDLE      := StPr.Database.Handle;
 STRU.TRHANDLE      := StPr.Transaction.Handle;
 STRU.KERNEL_ACTION := 1;
 STRU.ID_USER       := USER_ID;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   StPr.Transaction.Rollback;
   form.Free;
   ShowMessage(E.Message);
   Exit;
  end;
 end;

 if not DoResult then
 begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  MemoLines:=TStringList.Create;
  MemoLines.AddStrings(ErrorList);
  ShowMessage(MemoLines.Text);
  StPr.Transaction.Rollback;
 end
 else
 begin
  StPr.Transaction.Commit;
  ShowMessage('Документ проведено без помилок!');
 end;
 form.Free;
end;

end.
