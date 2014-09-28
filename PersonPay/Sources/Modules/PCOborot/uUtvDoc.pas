unit uUtvDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxSplitter, StdCtrls, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxContainer, cxCheckBox, cxRadioGroup, ibase, ActnList, DateUtils, uMainPerem,
  cxTextEdit, cxDBEdit, cxButtonEdit, Buttons, cxCurrencyEdit,
  cxHyperLinkEdit, cxDropDownEdit, cxSpinEdit, cxMaskEdit, Kernel, uWate,
  cxMemo, Menus, uMainFanc;

type
  TDocValForm = class(TForm)
    pnl1: TPanel;
    DB_MAIN: TpFIBDatabase;
    DS: TpFIBDataSet;
    TR_DB_PROV: TpFIBTransaction;
    ST_PR_DB: TpFIBStoredProc;
    ds1: TDataSource;
    pnl2: TPanel;
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
    DSID_DOC: TFIBBCDField;
    DSNUM_DOC: TFIBStringField;
    DSDATE_DOC: TFIBDateField;
    DSTYPE_DOC: TFIBStringField;
    DSDB_SUMMA: TFIBBCDField;
    DSKR_SUMMA: TFIBBCDField;
    DSDB_SUMMA_VAL: TFIBBCDField;
    DSKR_SUMMA_VAL: TFIBBCDField;
    DSNOTE: TFIBStringField;
    DSID_TYPE_DOC: TFIBBCDField;
    DSIS_OUR_DOC: TFIBIntegerField;
    DSID_VALUTE: TFIBBCDField;
    DSKURS: TFIBBCDField;
    DSIS_UTV: TFIBIntegerField;
    DSIS_DB_KR: TFIBIntegerField;
    DSN_VAL: TFIBStringField;
    actlst1: TActionList;
    actSelect: TAction;
    cxDBTextEdit1: TcxDBTextEdit;
    pnl3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbclmnTYPE_DOC: TcxGridDBColumn;
    cxgrdbclmnNUM_DOC: TcxGridDBColumn;
    cxgrdbclmnDATE_DOC: TcxGridDBColumn;
    cxgrdbclmnN_VAL: TcxGridDBColumn;
    cxgrdbclmnKURS: TcxGridDBColumn;
    cxgrdbclmnDB_SUMMA: TcxGridDBColumn;
    cxgrdbclmnDB_SUMMA_VAL: TcxGridDBColumn;
    cxgrdbclmnKR_SUMMA: TcxGridDBColumn;
    cxgrdbclmnKR_SUMMA_VAL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxgrdbclmnIS_UTV: TcxGridDBColumn;
    pnl4: TPanel;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxNP: TcxCheckBox;
    btnAddButton: TSpeedButton;
    btnModifyButton: TSpeedButton;
    btnDeleteButton: TSpeedButton;
    btnRefreshButton: TSpeedButton;
    btnOkButton: TSpeedButton;
    btnShow: TSpeedButton;
    btnCancelButton: TSpeedButton;
    actClose: TAction;
    btnPodt: TSpeedButton;
    actPodt: TAction;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DS_PROV: TpFIBDataSet;
    cxgrdbclmnIST_FIN: TcxGridDBColumn;
    ds2: TDataSource;
    cxgrdbclmnNUM_SCH_DB: TcxGridDBColumn;
    cxgrdbclmnNUM_SCH_KR: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    actAdd: TAction;
    ReadTr: TpFIBTransaction;
    WriteTr: TpFIBTransaction;
    pnl5: TPanel;
    lbl1: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    lbl5: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    actEdit: TAction;
    cxgrdbclmnIS_OUR_DOC: TcxGridDBColumn;
    DSPK_ID: TFIBBCDField;
    cxgrdbclmnNOTE: TcxGridDBColumn;
    actDelete: TAction;
    actView: TAction;
    cxgrdbclmnFIO: TcxGridDBColumn;
    cxgrdbclmnREG_NUM: TcxGridDBColumn;
    DSSYMBOL: TFIBStringField;
    DSDB_SUMMA_S: TStringField;
    DSKR_SUMMA_S: TStringField;
    cxgrdbclmnDB_SUMMA_VAL_S: TcxGridDBColumn;
    cxgrdbclmnKR_SUMMA_VAL_S: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn9: TcxGridDBColumn;
    DS_PROVID_PROV: TFIBBCDField;
    DS_PROVID_SCH_DB: TFIBIntegerField;
    DS_PROVID_SCH_KR: TFIBIntegerField;
    DS_PROVNUM_SCH_DB: TFIBStringField;
    DS_PROVNUM_SCH_KR: TFIBStringField;
    DS_PROVNAME_SCH_DB: TFIBStringField;
    DS_PROVNAME_SCH_KR: TFIBStringField;
    DS_PROVID_S: TFIBBCDField;
    DS_PROVID_R: TFIBBCDField;
    DS_PROVID_ST: TFIBBCDField;
    DS_PROVID_KEKV: TFIBBCDField;
    DS_PROVKOD_S: TFIBIntegerField;
    DS_PROVKOD_R: TFIBIntegerField;
    DS_PROVKOD_ST: TFIBIntegerField;
    DS_PROVKOD_KEKV: TFIBIntegerField;
    DS_PROVNAME_S: TFIBStringField;
    DS_PROVNAME_R: TFIBStringField;
    DS_PROVNAME_ST: TFIBStringField;
    DS_PROVNAME_KEKV: TFIBStringField;
    DS_PROVDATE_PROV: TFIBDateField;
    DS_PROVID_DOG: TFIBBCDField;
    DS_PROVKOD_DOG: TFIBBCDField;
    DS_PROVSUMMA: TFIBBCDField;
    DS_PROVID_MEN: TFIBBCDField;
    DS_PROVID_PAYER: TFIBBCDField;
    DS_PROVID_SERVER: TFIBBCDField;
    DS_PROVID_CUSTOMER: TFIBBCDField;
    DS_PROVNAME_CUSTOMER: TFIBStringField;
    DS_PROVNAME_SHABLON: TFIBStringField;
    DS_PROVREG_NUM: TFIBStringField;
    DS_PROVIS_MAIN: TFIBSmallIntField;
    DS_PROVID_TIP_DOG: TFIBBCDField;
    DS_PROVSYMBOL: TFIBStringField;
    DS_PROVSUMMA_VAL: TFIBBCDField;
    DS_PROVIST_FIN: TFIBStringField;
    DS_PROVSUMMA_VAL_S: TStringField;
    DS_PROVFIO: TFIBStringField;
    cxgrdbclmnNAME_CUSTOMER_NATIVE: TcxGridDBColumn;
    DS_PROVNAME_CUSTOMER_NATIVE: TFIBStringField;
    DS_PROVNAME_TIP_DOG: TFIBStringField;
    cxgrdbclmnMFO_NATIVE: TcxGridDBColumn;
    cxgrdbclmnNAME_BANK_NATIVE: TcxGridDBColumn;
    DS_PROVNAME_BANK: TFIBStringField;
    DS_PROVMFO: TFIBStringField;
    pnl6: TPanel;
    cxSplitter2: TcxSplitter;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBMemo1: TcxDBMemo;
    DS_PROVNUM_DOG: TFIBStringField;
    btnClose: TSpeedButton;
    actRun: TAction;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actPubSelect: TAction;
    cxAllPodt: TcxCheckBox;
    DSDATE_TIME_OPLAT: TFIBDateTimeField;
    date_time_oplat: TcxGridDBColumn;
    procedure actSelectExecute(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure cxRadioButton3Click(Sender: TObject);
    procedure cxNPPropertiesChange(Sender: TObject);
    procedure cxgrdbclmnKURSPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxgrdbclmnKURSPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actPodtExecute(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure actCloseExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure DSCalcFields(DataSet: TDataSet);
    procedure DS_PROVCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRunExecute(Sender: TObject);
    procedure actPubSelectExecute(Sender: TObject);
    procedure DS_PROVSUMMA_VALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DSDB_SUMMA_VALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DSKR_SUMMA_VALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    is_db, is_utv_doc:Integer;
    DBEG, DEND, DATE_REC: TDateTime;
    Year, Month: Word;
    id_ses_val:Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; state:integer);overload;
  end;
   procedure ShowDocValForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; state:integer); stdcall;
  exports ShowDocValForm;
var
  DocValForm: TDocValForm;

implementation

uses uUtvDocAction, uUtvProv, uWorkDoc, uAddDocVal;
{$R *.dfm}
constructor TDocValForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; state:integer);
var DATE_REC:TDateTime;
begin
inherited Create(AOwner);
if Assigned(DBHandle)
then begin
 Self.DBHANDLE := DBHandle;
 Self.DB_MAIN.Close;
 Self.DB_MAIN.Handle:=DBHANDLE;
 month:=MonthOf(PERS_PAY_PERIOD);
 year:=YearOf(PERS_PAY_PERIOD);
 DBEG:=StartOfAMonth(Year, Month);
 DEND:=EndOfAMonth(Year, Month);
 Self.cxMonthBeg.ItemIndex:=month-1;
 Self.cxYearBeg.value:=year;
 Self.cxMonthEnd.ItemIndex:=month-1;
 Self.cxYearEnd.value:=year;

  is_db:=-1;
  is_utv_doc:=0;
 if state=1 then
 begin
  FormStyle:=fsMDIChild;
  WindowState:=wsMaximized;
  btnClose.Visible:=False;
  btnCancelButton.Visible:=True;
  actPubSelect.Execute;
 end
 else
 begin
  FormStyle:=fsNormal;
  WindowState:=wsNormal;
  btnClose.Visible:=True;
  btnCancelButton.Visible:=False;
  actSelect.Execute;
 end;

 if is_utv_doc = 0 then cxNP.Checked:=True else cxNP.Checked:=False;
 Self.cxRadioButton1.Checked:=True;

//access
   actAdd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_DOCS','Edit', false)=0;
   actEdit.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_DOCS','Edit', false)=0;
   actDelete.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_DOCS','Edit', false)=0;
   actPodt.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_DOCS','Edit', false)=0;
{actAdd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_UCH/PC_DOCS','Edit', false)=0;
actEdit.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_UCH/PC_DOCS','Edit', false)=0;
actDelete.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_UCH/PC_DOCS','Edit', false)=0;
actPodt.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_UCH/PC_DOCS','Edit', false)=0;}
//actAdd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_UCH/PC_DOCS','Belong', false)=0;

end;
end;

procedure ShowDocValForm(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; state:Integer);stdcall;
var
 form : TDocValForm;
begin
 form := TDocValForm.Create(AOwner,DBHANDLE, state);
 Form.Show;
// Form.Free;
end;

procedure TDocValForm.actSelectExecute(Sender: TObject);
var prefix:string;
begin
 month:=cxMonthBeg.ItemIndex+1;
 year:=cxYearBeg.Value;
 DBEG:=StartOfAMonth(Year, Month);
 month:=cxMonthEnd.ItemIndex+1;
 year:=cxYearEnd.Value;
 DEND:=EndOfAMonth(Year, Month);

 DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('select * from PC_DT_DEB_KR_DOC_VALUTE(:date_beg, :date_end) ');
 prefix:=' where ';
 if cxNP.Checked=True then
 begin
 DS.SelectSQL.Add(prefix+' is_utv in (0,1)');
 prefix :=' and ';
 end
 else
 begin
 DS.SelectSQL.Add(prefix+' is_utv = 1');
 prefix :=' and ';
 end;
 if is_db = -1 then
 DS.SelectSQL.Add(' order by date_doc');
 if is_db = 0 then
 DS.SelectSQL.Add(prefix +' db_summa <> 0');
 if is_db = 1 then
 DS.SelectSQL.Add(prefix +' kr_summa <> 0');
 DS.Prepare;
 DS.parambyName('DATE_BEG').AsDate:=DBEG;
 DS.parambyName('DATE_END').AsDate:=DEND;
 DS.CloseOpen(False);

 if is_db = -1 then
 begin
   cxGrid1DBTableView1.Columns[5].Visible:=True;
   cxGrid1DBTableView1.Columns[6].Visible:=True;
   cxGrid1DBTableView1.Columns[8].Visible:=True;
   cxGrid1DBTableView1.Columns[9].Visible:=True;
 end;

 if is_db = 0 then
 begin
   cxGrid1DBTableView1.Columns[5].Visible:=True;
   cxGrid1DBTableView1.Columns[6].Visible:=True;
   cxGrid1DBTableView1.Columns[8].Visible:=False;
   cxGrid1DBTableView1.Columns[9].Visible:=False;
 end;

 if is_db = 1 then
 begin
   cxGrid1DBTableView1.Columns[5].Visible:=False;
   cxGrid1DBTableView1.Columns[6].Visible:=False;
   cxGrid1DBTableView1.Columns[8].Visible:=True;
   cxGrid1DBTableView1.Columns[9].Visible:=True;
 end;
 cxGrid1DBTableView1.ViewData.Expand(true);

end;

procedure TDocValForm.cxRadioButton1Click(Sender: TObject);
begin
is_db:=-1;
 actSelect.Execute;
end;

procedure TDocValForm.cxRadioButton2Click(Sender: TObject);
begin
 is_db:=0;
 actSelect.Execute;
end;

procedure TDocValForm.cxRadioButton3Click(Sender: TObject);
begin
is_db:=1;
 actSelect.Execute;
end;

procedure TDocValForm.cxNPPropertiesChange(Sender: TObject);
begin
 actSelect.Execute;
end;

procedure TDocValForm.cxgrdbclmnKURSPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
showmessage('1');
end;

procedure TDocValForm.cxgrdbclmnKURSPropertiesEditValueChanged(
  Sender: TObject);
begin
ShowMessage('2');
end;

procedure TDocValForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
 Arect:=AViewInfo.Bounds;
{if (AViewInfo.GridRecord.Values[9]= 0)  then
  begin
      ACanvas.Canvas.Brush.Color :=$00CD9BFF;// $00E8E8E8;//$00D2D2D2;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;}
  if (AViewInfo.GridRecord.Values[11]= 0)  then
begin
      ACanvas.Canvas.Brush.Color :=$00C1C1C1;// $00E8E8E8;//$00D2D2D2;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
end;
end;

procedure TDocValForm.actPodtExecute(Sender: TObject);
var f:TUtvForm;
    ff:TUtvProvForm;
    id_doc:Integer;
begin
 month:=cxMonthBeg.ItemIndex+1;
 year:=cxYearBeg.Value;
 DBEG:=StartOfAMonth(Year, Month);
 month:=cxMonthEnd.ItemIndex+1;
 year:=cxYearEnd.Value;
 DEND:=EndOfAMonth(Year, Month);

 id_doc:=DSID_DOC.AsInteger;
 if cxAllPodt.Checked = true then
 begin
 try
   ST_PR_DB.Close;
   ST_PR_DB.Transaction := TR_DB_PROV;
   ST_PR_DB.Transaction.StartTransaction;
   ST_PR_DB.StoredProcName:='PC_DT_UTV_DOC';
   ST_PR_DB.Prepare;
   ST_PR_DB.parambyName('DATE_BEG').AsDate:=DBEG;
   ST_PR_DB.parambyName('DATE_END').AsDate:=DEND;
   ST_PR_DB.ExecProc;
   ST_PR_DB.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR_DB.Transaction.Rollback;
    exit;
   end;
   end;
   actSelect.Execute;
 end
 else
{ f:=TUtvForm.Create(Self);
 f.ShowModal;
 if f.ModalResult = mrOk then
 begin
   if f.podtv = 0 then
   begin
   try
   ST_PR_DB.Close;
   ST_PR_DB.Transaction := TR_DB_PROV;
   ST_PR_DB.Transaction.StartTransaction;
   ST_PR_DB.StoredProcName:='PC_DT_UTV_DOC';
   ST_PR_DB.Prepare;
   ST_PR_DB.ParamByName('PC_ID_DOC').AsInteger:=DSID_DOC.AsInteger;
   ST_PR_DB.ExecProc;
   ST_PR_DB.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR_DB.Transaction.Rollback;
    exit;
   end;
   end;
   actSelect.Execute;
  end
  else
  begin}
  begin
   ff:=TUtvProvForm.Create(Self, DBHANDLE, DSID_DOC.AsInteger);
   ff.ShowModal;
   actSelect.Execute;
   ff.Free;
 // end;
 //end;
// f.Free;
 DS.Locate('ID_DOC',id_doc,[]);
 end;
end;

procedure TDocValForm.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
ds_prov.close;
ds_prov.prepare;
ds_prov.ParamByNAme('ID_DOC').AsInteger:=DSID_DOC.AsInteger;
DS_PROV.ParamByName('REG_UCH').AsInteger:=ID_REG;
DS_PROV.CloseOpen(False);
//40019 - начисление
if ((DSID_TYPE_DOC.AsInteger=TYPE_DOC_VAL)or(DSID_TYPE_DOC.AsInteger=TYPE_DOC)or (DSID_TYPE_DOC.AsInteger=TYPE_DOC_NACH)) then
begin
  btnPodt.Enabled:=False;
  btnModifyButton.Enabled:=True;
  if DSID_TYPE_DOC.AsInteger=TYPE_DOC_VAL then
  btnModifyButton.Enabled:=False;
end
else
begin
  btnPodt.Enabled:=True;
  btnModifyButton.Enabled:=True;
end;  


end;

procedure TDocValForm.actCloseExecute(Sender: TObject);
begin
Close;
end;

procedure TDocValForm.actAddExecute(Sender: TObject);
var pk_id: Int64;
    doc:TWorkDocForm;
    is_debkr:Integer;
    pc_id_doc, id_val:Integer;
    ff:TUtvProvForm;
    kurs:Double;
    no_action:Integer;
    id_doc:Integer;
    f:TAddDocForm;
begin
id_doc:=DSID_DOC.AsInteger;

f:=TAddDocForm.Create(Self);
if ((cxRadioButton2.Checked) or ( cxRadioButton1.Checked)) then f.cxRadioButton1.Checked:=True
else f.cxRadioButton2.Checked:=True;
f.ShowModal;
if f.ModalResult = mrOK then
 if f.cxRadioButton1.Checked then is_debkr:=0 else is_debkr:=1
else Exit;
f.Free;

 doc:=TWorkDocForm.Create(Self);
 doc.State     := 'Add';

 if is_debkr = 0 then
  doc.Caption   := 'Додавання дебетового документа'
 else
  doc.Caption   := 'Додавання кредитового документа';

 if is_debkr = 0 then
 doc.is_Kredit := False
 else doc.is_Kredit := True;

 doc.Database         := DB_MAIN.Handle;
 doc.ReadTransaction  := ReadTr.Handle;
 doc.WriteTransaction := WriteTr.Handle;

// DocsAddForm.Res        := ResProc;

// Month := Copy(cxMonthBeg.Text, 1, 2);
 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;

 doc.ActualDate := StartOfAMonth(Year, Month);
 doc.is_Native := True;

 doc.FormStyle  := fsNormal;
// doc.Position:=MainFormCenter;
 doc.ShowModal;
 pk_id:=doc.PK_id;
 kurs:=doc.kurs;
 id_val:=doc.id_valute;
 no_action:=doc.no_action;
 doc.Free;

  if no_action=0 then
  begin
 // начинаем валютную часть
  try
   ST_PR_DB.Close;
   ST_PR_DB.Transaction := TR_DB_PROV;
   ST_PR_DB.Transaction.StartTransaction;
   ST_PR_DB.StoredProcName:='PC_ADD_PUB_DOC_TO_PC_DOC';
   ST_PR_DB.Prepare;
   ST_PR_DB.ParamByName('PK_ID').AsInt64:=pk_id;
   ST_PR_DB.ParamByName('KURS').AsCurrency:=kurs;
   ST_PR_DB.ParamByName('ID_VALUTE').AsInteger:=id_val;
   ST_PR_DB.ParamByName('IS_DB_KR').AsInteger:=is_debkr;
   ST_PR_DB.ExecProc;
   ST_PR_DB.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR_DB.Transaction.Rollback;
    exit;
   end;
   end;
   pc_id_doc:= ST_PR_DB.ParamByName('PC_ID_DOC').AsInteger;
   id_doc:=pc_id_doc;
   end;
   actSelect.Execute;
 DS.Locate('ID_DOC',id_doc,[]);
end;

procedure TDocValForm.actEditExecute(Sender: TObject);
var
 k,pc_id_doc          : integer;
 PK_id      : int64;
 kurs:Double;
 d_b, d_e:TDateTime;
 is_dk, is_debkr, id_val:Integer;
 id:Int64;
 doc:TWorkDocForm;
 ff:TUtvProvForm;
 no_action, id_doc:Integer;
begin
 if DS.IsEmpty then Exit;
 id_doc:=DSID_DOC.AsInteger;

 month:=cxMonthBeg.ItemIndex+1;
 year:=cxYearBeg.Value;
 DBEG:=StartOfAMonth(Year, Month);
 month:=cxMonthEnd.ItemIndex+1;
 year:=cxYearEnd.Value;
 DEND:=EndOfAMonth(Year, Month);
 d_b:=DBEG;
 d_e:=DEND;
 if ((DSDB_SUMMA.Value = null) and (DSKR_SUMMA.Value<>null)) then is_debkr:=1 else is_debkr:=0;
 is_dk:=is_debkr;
 id:=dsPK_ID.AsInt64;
 if dsis_our_doc.AsInteger = 0 then
 begin
  ShowMessage('Неможливо змінити цей документ!');
  Exit;
 end
 else
 begin
  if WorkDocForm2 <> nil then begin
  ShowMessage('Форма редагування зайнята іншим документом!');
  WorkDocForm2.Show;
  Exit;
  end;

  doc:=TWorkDocForm.Create(Self);
  doc.State   := 'Edit';
  doc.Caption := 'Редагування документа';

  if is_debkr = 0 then
  doc.is_Kredit := False
  else doc.is_Kredit := True;
  
  k := cxGrid1DBTableView1.DataController.FocusedRecordIndex;

  doc.NumDoc.Text   := cxGrid1DBTableView1.DataController.Values[k, 1];
  doc.NoteMemo.Text := cxGrid1DBTableView1.DataController.Values[k, 11];
  doc.DateDoc.Date  := cxGrid1DBTableView1.DataController.Values[k, 2];
  doc.PK_id         := DSPK_ID.Asint64;
  doc.ID_TYPE_DOC   :=DSID_TYPE_DOC.AsInteger;
  doc.Database         := DB_MAIN.Handle;
  doc.ReadTransaction  := ReadTr.Handle;
  doc.WriteTransaction := WriteTr.Handle;

  if DSKURS.Value=null then doc.kurs:=1
  else doc.kurs:=DSKURS.AsCurrency;

  if DSKURS.Value=null then doc.cxKurs.EditValue:=1
  else doc.cxKurs.EditValue:=DSKURS.AsCurrency;

  if DSID_VALUTE.Value=null then
  begin
  doc.id_valute:=0;
  doc.cxValute.Text:='';
  doc.symbol:='';
  end
  else
  begin
  doc.id_valute:=DSID_VALUTE.AsInteger;
  doc.cxValute.Text:=DSN_VAL.AsString;
  doc.symbol:=DSSYMBOL.AsString;
  end;


 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;

 doc.ActualDate := StartOfAMonth(Year, Month);
  doc.is_Native := True;

  doc.FormStyle  := fsNormal;
  doc.ShowModal;
  pk_id:=doc.PK_id;
  kurs:=doc.kurs;
  id_val:=doc.id_valute;
  no_action:=doc.no_action;
  doc.Free;

  if no_action=0 then
  begin

 // начинаем валютную часть
  try
   ST_PR_DB.Close;
   ST_PR_DB.Transaction := TR_DB_PROV;
   ST_PR_DB.Transaction.StartTransaction;
   ST_PR_DB.StoredProcName:='PC_ADD_PUB_DOC_TO_PC_DOC';
   ST_PR_DB.Prepare;
   ST_PR_DB.ParamByName('PK_ID').AsInt64:=pk_id;
   ST_PR_DB.ParamByName('KURS').AsCurrency:=kurs;
   ST_PR_DB.ParamByName('ID_VALUTE').AsInteger:=id_val;
   ST_PR_DB.ParamByName('IS_DB_KR').AsInteger:=is_debkr;
   ST_PR_DB.ExecProc;
   ST_PR_DB.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR_DB.Transaction.Rollback;
    exit;
   end;
   end;
   pc_id_doc:= ST_PR_DB.ParamByName('PC_ID_DOC').AsInteger;
   id_doc:=pc_id_doc;
   end;
 end;
 actSelect.Execute;
DS.Locate('ID_DOC',id_doc,[]);
end;

procedure TDocValForm.actDeleteExecute(Sender: TObject);
var
 k           : integer;
 PK_id       : int64;

 RecInfo     : RECORD_INFO_STRUCTURE;
 ResultInfo  : RESULT_STRUCTURE;

 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 KEY_SESSION : integer;
 ErrorList   : TStringList;
 DocDate     : TDate;

 Key, id     : int64;
 d_b, d_e    :TDateTime;
 is_dk, is_debkr       :Integer;

 f           :TWateForm;
 is_prov     :Integer;
begin
 k := cxGrid1DBTableView1.DataController.FocusedRecordIndex;
  if DS.IsEmpty then Exit;
 d_b:=DBEG;
 d_e:=DEND;
 if ((DSDB_SUMMA.Value = null) and (DSKR_SUMMA.Value<>null)) then is_debkr:=1 else is_debkr:=0;
 is_dk:=is_debkr;
 id:=DSPK_ID.AsInt64;

 if DSIS_OUR_DOC.AsInteger = 0
 then
 begin
  ShowMessage('Неможливо видалити цей документ!');
  Exit;
 end;
  
 PK_id   := id;
 DocDate := cxGrid1DBTableView1.DataController.Values[k, 1];



 if MessageDlg('Ви дійсно бажаєте видалити обраний документ?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
begin

 WriteTr.StartTransaction;
 // Удаляю выбранный документ

 KEY_SESSION := DB_MAIN.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := PERS_PAY_PERIOD;
 STRU.DBHANDLE      := DB_MAIN.Handle;
 STRU.TRHANDLE      := WriteTr.Handle;
 STRU.KERNEL_ACTION := 2;
 STRU.PK_ID         := PK_id;
 STRU.ID_USER       := USER_ID;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   WriteTr.Rollback;
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  WriteTr.Rollback;
  ShowMessage(ErrorList.Text);
  Exit;
 end;
//showmessage(inttostr(PK_ID));
end;



 WriteTr.Commit;


 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(Year, Month);
 Month:=cxMonthBeg.ItemIndex+1;
 DEND:=EndOfAMonth(Year, Month);

 f:=TWateForm.Create(Self);
 f.Show;
 f.Update;
try
   ST_PR_DB.Close;
   ST_PR_DB.Transaction := TR_DB_PROV;
   ST_PR_DB.Transaction.StartTransaction;
   ST_PR_DB.StoredProcName:='PC_ADD_PUB_DOC_TO_PC_DOC';
   ST_PR_DB.Prepare;
   ST_PR_DB.ParamByName('PK_ID').AsInt64:=pk_id;
   ST_PR_DB.ExecProc;
   ST_PR_DB.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR_DB.Transaction.Rollback;
    exit;
   end;
   end;
    actSelect.Execute;


 f.Free;
 
// LocateRecord(Key);
// end;



end;

procedure TDocValForm.actViewExecute(Sender: TObject);
var   d_b, d_e:TDateTime;
      is_dk, k, is_debkr, id_doc:Integer;
      id:Int64;
      doc:TWorkDocForm;
begin
  if DS.IsEmpty then Exit;
  id_doc:=DSID_DOC.AsInteger;
  d_b:=DBEG;
  d_e:=DEND;
   if ((DSDB_SUMMA.Value = null) and (DSKR_SUMMA.Value<>null)) then is_debkr:=1 else is_debkr:=0;
  is_dk:=is_debkr;
  id:=DSPK_ID.AsInt64;

  k := cxGrid1DBTableView1.DataController.FocusedRecordIndex;

  doc := TWorkDocForm.Create(Self);
  doc.State := 'View';
  doc.Caption := 'Перегляд документа';

  doc.NumDoc.Text   := cxGrid1DBTableView1.DataController.Values[k, 0];

  if not VarIsNull(cxGrid1DBTableView1.DataController.Values[k, 5]) then doc.NoteMemo.Text := cxGrid1DBTableView1.DataController.Values[k, 5];
  doc.DateDoc.Date  := cxGrid1DBTableView1.DataController.Values[k, 1];
  doc.PK_id         := DSPK_ID.Asint64;

  if is_dk = 0 then
  doc.is_Kredit := False
  else doc.is_Kredit := True;

  doc.Database         := DB_MAIN.Handle;
  doc.ReadTransaction  := ReadTr.Handle;
  doc.WriteTransaction := WriteTr.Handle;

  doc.is_Native := True;
  doc.kurs:=DSKURS.AsCurrency;
  doc.cxKurs.EditValue:=DSKURS.AsCurrency;
  doc.id_valute:=DSID_VALUTE.AsInteger;
  doc.cxValute.Text:=DSN_VAL.AsString;
  doc.FormStyle  := fsNormal;
  doc.ShowModal;
  doc.Free;
  actSelect.Execute;
  DS.Locate('ID_DOC',id_doc,[]);
end;

procedure TDocValForm.DSCalcFields(DataSet: TDataSet);
begin
if DSDB_SUMMA_VAL.AsString<>'0' then
DSDB_SUMMA_S.Value:= DSDB_SUMMA_VAL.AsString + ' ' + DSSYMBOL.AsString
else DSDB_SUMMA_S.Value:= DSDB_SUMMA_VAL.AsString;

if DSKR_SUMMA_VAL.AsString<>'0' then
DSKR_SUMMA_S.Value:= DSKR_SUMMA_VAL.AsString + ' ' + DSSYMBOL.AsString
else DSKR_SUMMA_S.Value:= DSKR_SUMMA_VAL.AsString;

end;

procedure TDocValForm.DS_PROVCalcFields(DataSet: TDataSet);
begin
  if DS_PROVSUMMA_VAL.AsString<>'0' then
DS_PROVSUMMA_VAL_S.Value:=DS_PROVSUMMA_VAL.AsString+' '+DS_PROVSYMBOL.AsString
else DS_PROVSUMMA_VAL_S.Value:=DS_PROVSUMMA_VAL.AsString;
end;

procedure TDocValForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TDocValForm.actRunExecute(Sender: TObject);
begin
Close;
end;

procedure TDocValForm.actPubSelectExecute(Sender: TObject);
var form:TWateForm;
begin
form:=TWateForm.Create(Self);
form.cxLabel1.Caption:='Триває збір документів системи...';
form.Show;
form.Update;
try
 ST_PR_DB.Close;
 ST_PR_DB.Transaction := ReadTr;
 ST_PR_DB.Transaction.StartTransaction;
 ST_PR_DB.StoredProcName:='PC_FROM_PUB_DOC_TO_PC_DOC';
 ST_PR_DB.Prepare;
 ST_PR_DB.ParamByName('DATE_BEG').AsDate:=DBEG;
 ST_PR_DB.ParamByName('DATE_END').AsDate:=DEND;
 ST_PR_DB.ParamByName('ID_REG').AsInteger:=ID_REG;
 ST_PR_DB.ExecProc;
 ST_PR_DB.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  ST_PR_DB.Transaction.Rollback;
  exit;
    end;
end;
form.Free;
 actSelect.Execute;
end;

procedure TDocValForm.DS_PROVSUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
{  if ((DS_PROVSUMMA_VAL.value<>null)or (DS_PROVSUMMA_VAL.AsCurrency<>0) ) then
  if DS_PROVSUMMA_VAL.AsCurrency=Trunc(DS_PROVSUMMA_VAL.AsCurrency) then
 text:=  GetRazryad(DS_PROVSUMMA_VAL.AsString)+DecimalSeparator+'00 '+ds_provSymbol.Asstring
 else text:=  GetRazryad(DS_PROVSUMMA_VAL.AsString)+' '+ds_provSymbol.Asstring;}
 text:=FloatToStrF(DS_PROVSUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+dsSymbol.Asstring;
end;

procedure TDocValForm.DSDB_SUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
{  if ((dsdb_summa_val.value<>null)or (dsdb_summa_val.asCurrency<>0)) then
if dsdb_summa_val.AsCurrency=Trunc(dsdb_summa_val.AsCurrency) then
 text:=  GetRazryad(dsdb_summa_val.AsString)+DecimalSeparator+'00 '+dsSymbol.Asstring
 else text:= GetRazryad(dsdb_summa_val.AsString)+' '+dsSymbol.Asstring; }
 text:=FloatToStrF(dsdb_summa_val.AsCurrency, ffNumber, 18, 2)+' '+dsSymbol.Asstring;
end;

procedure TDocValForm.DSKR_SUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
{  if ((dskr_summa_val.value<>null)or (dskr_summa_val.Ascurrency<>0)) then
if dskr_summa_val.AsCurrency=Trunc(dskr_summa_val.AsCurrency) then
 text:=  GetRazryad(dskr_summa_val.AsString)+DecimalSeparator+'00 '+dsSymbol.Asstring
 else text:=  GetRazryad(dskr_summa_val.AsString)+' '+dsSymbol.Asstring;}
 text:=FloatToStrF(dskr_summa_val.AsCurrency, ffNumber, 18, 2)+' '+dsSymbol.Asstring;
end;

end.
