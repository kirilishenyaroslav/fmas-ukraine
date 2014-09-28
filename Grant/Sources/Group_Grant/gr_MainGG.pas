unit gr_MainGG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxLookAndFeelPainters, dxStatusBar,
  StdCtrls, cxButtons, ExtCtrls, dxBar, cxLabel, cxContainer, gr_uCommonConsts
  ,gr_Stud_Group_DM, gr_uCommonProc, gr_uWaitForm,RxMemDs, DateUtils, ZWait,         ///////
  gr_Filter_Stud_Group,gr_uCommonTypes, IBase,Dates, pFIBDataSet, FIBDataSet
  , cxCalendar, cxCurrencyEdit, cxCheckBox, gr_uCommonLoader,
  ZTypes,gr_uMessage, ActnList, dxBarExtItems, StrUtils,
  cxGridBandedTableView,  Registry, cxSplitter,
  gr_EditGG, cxTimeEdit;

type
  TFGroupGrant = class(TForm)
    Actions: TActionList;
    ActionCancel: TAction;
    ActionAdd: TAction;
    ActionDel: TAction;
    ActionClean: TAction;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarGroup1: TdxBarGroup;
    dxBarButton1: TdxBarButton;
    Styles: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    dxStatusBar2: TdxStatusBar;
    LBtnUpdate: TdxBarLargeButton;
    LBtnDeletePayment: TdxBarLargeButton;
    Panel1: TPanel;
    cxGrid1Payment: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    ColPeriod: TcxGridDBColumn;
    ColEndMonth: TcxGridDBColumn;
    ColTypeOperNomber: TcxGridDBColumn;
    ColTypeOper: TcxGridDBColumn;
    ColEstimateNomber: TcxGridDBColumn;
    ColEstimate: TcxGridDBColumn;
    ColSum: TcxGridDBColumn;
    ColOrder: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    BtnSave: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    ColDateBeg: TcxGridDBColumn;
    ColDateEnd: TcxGridDBColumn;
    Col_Type_Mass_Payment: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    cxGrid1FIO: TcxGrid;
    cxGrid1DBTableView1FIO: TcxGridDBTableView;
    Grid1ClTin: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1ClCat: TcxGridDBColumn;
    Grid1ClDep: TcxGridDBColumn;
    Grid1ClFormaOb: TcxGridDBColumn;
    cxGrid1FIOLevel1: TcxGridLevel;
    ColBal: TcxGridDBColumn;
    Grid1ClKurs: TcxGridDBColumn;
    LargeBtn: TdxBarLargeButton;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    ActionUpdate: TAction;
    procedure cxButton2Click(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ColPeriodGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure LargeBtnClick(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionCleanExecute(Sender: TObject);
    procedure ActionUpdateExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    //procedure FormCreate(AOwner:TComponent);        //Sender: TObject
  private
    //StylesDM:TStylesDM;
   // PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    PParamFilter:TParamFilter;
    procedure EnableEditPeople(x:boolean);
   { PWidth33:word;
    PWidth32:word;
    PWidth22:word;
    PWidth31:word;        }
  public
    Constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
  end;

var
  FGroupGrant: TFGroupGrant;
  Focus:Variant;


implementation



{$R *.dfm}

constructor TFGroupGrant.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
wf:TForm;
aField: TVarRec;
begin

inherited Create(AOwner);

wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);

DM := TDM_g.Create(self,Db_Handle);
//******************************************************************************
WindowState := wsMaximized;
PLanguageIndex                := IndexLanguage;

//******************************************************************************
//ShowMessage(inttostr(PLanguageIndex));
                                           
dxBarLargeButton2.Caption     := Exit_Caption[PLanguageIndex];
dxBarLargeButton5.Caption     := InsertBtn_Caption[PLanguageIndex];
DeleteBtn.Caption             := DeleteBtn_Caption[PLanguageIndex];
AddManBtn.Caption             := InsertBtn_Caption[PLanguageIndex];
//RefreshBtn.Caption            := UpdateBtn_Caption[PLanguageIndex];
LBtnUpdate.Caption            := UpdateBtn_Caption[PLanguageIndex];
LBtnDeletePayment.Caption     := DeleteBtn_Caption[PLanguageIndex];
BtnSave.Caption               := YesBtn_Caption[PLanguageIndex];
LargeBtn.Caption              := RefreshBtn_Caption[PLanguageIndex];
//******************************************************************************

//wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
//******************************************************************************


//FUpdateGroup(DM.RxMemoryData1,DM.DSetStud,'I');


//******************************************************************************
cxGridDBTableView1.DataController.DataSource:=DM.DSourceEditPayment;

ColPeriod.DataBinding.FieldName:='KOD_SETUP';
ColEndMonth.DataBinding.FieldName:='END_MONTH';
ColTypeOperNomber.DataBinding.FieldName:='KOD_VIDOPL';
ColTypeOper.DataBinding.FieldName:='NAME_VIDOPL';
ColEstimateNomber.DataBinding.FieldName:='SMETA_KOD';
ColEstimate.DataBinding.FieldName:='SMETA_TITLE';
ColSum.DataBinding.FieldName:='SUMMA';
ColOrder.DataBinding.FieldName:='PRIKAZ';
ColDateBeg.DataBinding.FieldName:='DATE_BEG';
ColDateEnd.DataBinding.FieldName:='DATE_END';
Col_Type_Mass_Payment.DataBinding.FieldName:='TYPE_MASS_PAYMENT_OUT';
ColBal.DataBinding.FieldName:='BAL';




//******************************************************************************
cxGrid1DBTableView1FIO.DataController.DataSource:=DM.DSourceStud;

Grid1ClTin.DataBinding.FieldName:='TIN';
Grid1ClFIO.DataBinding.FieldName:='FIO';
Grid1ClCat.DataBinding.FieldName:='CAT';
Grid1ClDep.DataBinding.FieldName:='NAME_DEPARTMENT';
Grid1ClFormaOb.DataBinding.FieldName:='FORMA_OB';
Grid1ClKurs.DataBinding.FieldName:='KURS';
//Grid1ClBal.DataBinding.FieldName:='BAL';


Grid1ClFIO.Caption            := GridClFIO_Caption[PLanguageIndex];
Grid1ClTin.Caption            := GridClTin_Caption[PLanguageIndex];
//Grid1ClBal.Caption            := GridClBal_Caption[PLanguageIndex];
Grid1ClDep.Caption            := GridClNameDepartment_Caption[PLanguageIndex];
Grid1ClFormaOb.Caption        := GridClForma_Ob_Caption[PLanguageIndex];
Grid1ClCat.Caption            := GridClCategory_Caption[PLanguageIndex];
Grid1ClKurs.Caption           := GridClKurs_Caption[PLanguageIndex];

try
cxGridDBTableView1.Controller.GotoFirst;
cxGrid1DBTableView1FIO.Controller.GotoFirst;
except
end;
CloseWaitForm(wf);

end;

procedure TFGroupGrant.EnableEditPeople(x:boolean);
begin
if x then
begin
  AddManBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  RefreshBtn.Enabled:=True;
  BtnSave.Enabled:=True;
end
else
begin
  AddManBtn.Enabled:=False;
  DeleteBtn.Enabled:=False;
  RefreshBtn.Enabled:=False;
  BtnSave.Enabled:=False;
end;

end;

procedure TFGroupGrant.cxButton2Click(Sender: TObject);
var LocParamA:TgrPriznakSimpleParam;
focus:variant;
begin
  LocParamA:=TgrPriznakSimpleParam.Create;
  LocParamA.Owner:=self;
  LocParamA.Priznak:='A';
  focus:= View_Edit(LocParamA);
  LocParamA.free;
  if focus<>null then
    begin
      DM.DSetEditPayment.CloseOpen(True);
      DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT', focus, []);
      cxGridDBTableView1.Controller.FocusedRecord.Selected:=True;
      DM.DSetStudSel.CloseOpen(True);
    end;
end;

procedure TFGroupGrant.ActionCancelExecute(Sender: TObject);
begin
  cxButton1Click(self)
end;

procedure TFGroupGrant.ActionYesExecute(Sender: TObject);
begin
  cxButton2Click(self);
end;

procedure TFGroupGrant.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFGroupGrant.dxBarLargeButton3Click(Sender: TObject);
var focus:integer;
begin
  DM.RxMemoryData1.Close;
  DM.RxMemoryData1.Open;
end;



procedure TFGroupGrant.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;





procedure TFGroupGrant.ColPeriodGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if Atext<>'' then
    AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFGroupGrant.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var wf:TForm;
begin

end;

procedure TFGroupGrant.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key,focus:Variant;
    wf:TForm;
    i:integer;
begin
  if DM.DSetEditPayment.IsEmpty then exit;
  if grShowMessage(ExitBtn_Caption[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
    begin
      wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
      if cxGridDBTableView1.Controller.SelectedRowCount>0 then
        for i:=0 to cxGridDBTableView1.Controller.SelectedRowCount-1 do
          begin
            with DM do
              begin

                StProc.Transaction.StartTransaction;
                StProc.StoredProcName:='GR_MASS_PAYMENT_DD';
                StProc.Prepare;
                StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInt64   := cxGridDBTableView1.Controller.SelectedRecords[i].Values[12];
                StProc.ExecProc;
                StProc.Transaction.Commit;

              end;
          end;
      DM.DSetEditPayment.CloseOpen(True);
      cxGridDBTableView1.Controller.FocusedRecord.Selected:=True;
      DM.DSetStudSel.CloseOpen(True);
    end
  else
    exit;
    cxGridDBTableView1.Controller.GoToFirst;
    CloseWaitForm(wf);
end;

procedure TFGroupGrant.LBtnUpdateClick(Sender: TObject);
var LocParamA:TgrPriznakSimpleParam;
begin
  if DM.DSetEditPayment.IsEmpty then  exit;
  LocParamA:=TgrPriznakSimpleParam.Create;
  LocParamA.Owner:=self;
  LocParamA.Priznak:='U';
  View_Edit(LocParamA);
  LocParamA.Free;
  DM.DSetStudSel.CloseOpen(True);
end;

procedure TFGroupGrant.LargeBtnClick(Sender: TObject);
var focus:Variant;
begin
  if DM.DSetEditPayment.IsEmpty then exit;
  focus:=DM.DSetEditPayment['ID_GR_MASS_PAYMENT'];
  DM.DSetEditPayment.CloseOpen(True);
  DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT',focus,[loCaseInsensitive]);
  cxGridDBTableView1.Controller.FocusedRecord.Selected:=True;
  DM.DSetStudSel.CloseOpen(True);
end;

procedure TFGroupGrant.ActionDelExecute(Sender: TObject);
begin
  LBtnDeletePaymentClick(Sender);
end;

procedure TFGroupGrant.ActionCleanExecute(Sender: TObject);
begin
  LargeBtnClick(Sender);
end;

procedure TFGroupGrant.ActionUpdateExecute(Sender: TObject);
begin
  LBtnUpdateClick(Sender);
end;

procedure TFGroupGrant.ActionAddExecute(Sender: TObject);
begin
  cxButton2Click(Sender);
end;

end.
