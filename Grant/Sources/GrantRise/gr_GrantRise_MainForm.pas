unit gr_GrantRise_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGridBandedTableView, cxClasses, cxStyles, cxGridTableView,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxSplitter, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, dxBar, dxBarExtItems,
  dxStatusBar, ibase, ZProc, gr_uMessage,
  gr_uCommonConsts, cxBlobEdit, cxCurrencyEdit, gr_GrantRise_ByDate,
  gr_GrantRise_DM, gr_uCommonLoader, gr_uCommonProc, Dates, gr_GrantRise_Problem;

type
  TFGrantRise = class(TForm)
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
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    dxStatusBar1: TdxStatusBar;
    Grid1DBTableView1DBSumma: TcxGridDBColumn;
    Grid1DBTableView1DBSummaNew: TcxGridDBColumn;
    Grid1DBTableView1DBKatStud: TcxGridDBColumn;
    Grid1DBTableView1DBSmeta: TcxGridDBColumn;
    Grid1DBTableView1DBVidOpl: TcxGridDBColumn;
    BarDockControlFilter: TdxBarDockControl;
    MonthCombo: TdxBarCombo;
    YearSpinEdit: TdxBarSpinEdit;
    DaySpinEdit: TdxBarSpinEdit;
    Grid1DBTableView1DBTotalSum: TcxGridDBColumn;
    Grid1DBTableView1DBTotalSumNew: TcxGridDBColumn;
    CommitBtn: TdxBarLargeButton;
    RollbackBtn: TdxBarLargeButton;
    SelectRiseBtn: TdxBarLargeButton;
    Grid1DBTableView1DBTotal: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure CommitBtnClick(Sender: TObject);
    procedure RollbackBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure Grid1DBTableView1DBSummaNewPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure SelectRiseBtnClick(Sender: TObject);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DaySpinEditChange(Sender: TObject);
    procedure MonthComboChange(Sender: TObject);
  private
    History: integer;
    Owner:TComponent;
    PLanguageIndex:Byte;
    KodSetup: integer;
  public
    constructor Create(AOwner:TComponent;DB:TISC_DB_HANDLE;PHistory:integer);reintroduce;
  end;

var
  FGrantRise: TFGrantRise;

function View_GrantRise(AParameter:TObject):Variant;stdcall;
exports View_GrantRise;

implementation

{$R *.dfm}

function View_GrantRise(AParameter:TObject):Variant;
var ViewForm: TFGrantRise;
    Filter: TFGrantRiseByDate;
begin
  DM := TDM.Create(TgrSimpleParam(AParameter).Owner);
  DM.DB.Handle:=TgrSimpleParam(AParameter).DB_Handle;
  DM.ReadTransaction.StartTransaction;
  Filter:=TFGrantRiseByDate.Create(TgrSimpleParam(AParameter).Owner);
  if(Filter.ShowModal=mrYes)then
    ViewForm:=TFGrantRise.Create(TgrSimpleParam(AParameter).Owner,DM.DB.Handle,Filter.Result);
end;

constructor TFGrantRise.Create(AOwner:TComponent;DB:TISC_DB_HANDLE;PHistory:integer);
var i:byte;
begin
  inherited Create(AOwner);
  Owner:=AOwner;
  PLanguageIndex                := IndexLanguage;
  History:=PHistory;
  Caption:=GrantRise_Text[PLanguageIndex];
//******************************************************************************
  KodSetup:=grKodSetup(DB);
  MonthCombo.Items.Text   := MonthesList_Text[PLanguageIndex];
  MonthCombo.Caption      := LabelPeriod_Caption[PLanguageIndex];
  MonthCombo.ItemIndex    :=YearMonthFromKodSetup(KodSetup,False)-1;
  YearSpinEdit.Value      :=YearMonthFromKodSetup(KodSetup);
//******************************************************************************
  RefreshBtn.Caption      :=RefreshBtn_Caption[PLanguageIndex];
  UpdateBtn.Caption       :=UpdateBtn_Caption[PLanguageIndex];
  CommitBtn.Caption       :=ApplyBtn_Caption[PLanguageIndex];
  RollbackBtn.Caption     :=CancelBtn_Caption[PLanguageIndex];
  SelectRiseBtn.Caption   :=FilterBtn_Caption[PLanguageIndex];
  ExitBtn.Caption         :=ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
  Grid1DBTableView1DBSumma.Caption       :=GridClSumma_Caption[PLanguageIndex];
  Grid1DBTableView1DBKatStud.Caption     :=GridClCategory_Caption[PLanguageIndex];
  Grid1DBTableView1DBSmeta.Caption       :=GridClNameSmeta_Caption[PLanguageIndex];
  Grid1DBTableView1DBVidOpl.Caption      :=GridClNameVo_Caption[PLanguageIndex];
  Grid1DBTableView1DBSummaNew.Caption    :=GridClSummaNew_Caption[PLanguageIndex];
  Grid1DBTableView1DBTotal.Caption       :=GridClTotal_Caption[PLanguageIndex];
  Grid1DBTableView1DBTotalSum.Caption    :=GridClTotalSum_Caption[PLanguageIndex];
  Grid1DBTableView1DBTotalSumNew.Caption :=GridClTotalSumNew_Caption[PLanguageIndex];
//******************************************************************************
  DM.DSet2.SQLs.SelectSQL.Text:='SELECT * FROM GR_DT_GRANTS_RISE_S('+IntToStr(History)+',null)';
  DM.DSet2.SQLs.UpdateSQL.Text:='execute procedure GR_DT_GRANTS_RISE_U(?SUMMA_NEW,?ID_RISE)';
  DM.DSet2.Open;
//******************************************************************************
  dxStatusBar1.Panels[0].Text:= 'F2-'+UpdateBtn.Caption;
  dxStatusBar1.Panels[1].Text:= 'F5-'+RefreshBtn.Caption;
  dxStatusBar1.Panels[2].Text:= 'Esc-'+ExitBtn.Caption;
  dxStatusBar1.Panels[3].Text:= 'F8-'+SelectRiseBtn.Caption;

  for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
//******************************************************************************
  Grid1DBTableView1.DataController.DataSource:=DM.DSource2;
  RefreshBtn.Click;
//******************************************************************************
  WindowState := wsMaximized;
end;

procedure TFGrantRise.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFGrantRise.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFGrantRise.FormResize(Sender: TObject);
var i:byte;
begin
  for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFGrantRise.CommitBtnClick(Sender: TObject);
begin
  try
    DM.StoredProc.StoredProcName := 'GR_DT_GRANTS_RISE_COMMIT';
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('GRDATE').AsDate:=EncodeDate(YearSpinEdit.IntValue,MonthCombo.ItemIndex+1,DaySpinEdit.IntValue);
    DM.StoredProc.ExecProc;
    DM.StoredProc.Transaction.Commit;
    grShowMessage(Caption ,RiseCommit_Text[PLanguageIndex], mtInformation, [mbYes]);
  except
    on e:exception do
    begin
      DM.StoredProc.Transaction.Rollback;
      grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOk]);
    end;
  end;
  SelectRiseBtn.Click;
end;

procedure TFGrantRise.RollbackBtnClick(Sender: TObject);
var exist:integer;
    FRollback:TFGrantRiseProblem;
begin
  exist:=0;
  try
    DM.StoredProc.StoredProcName := 'GR_DT_RISE_PROBLEM_EXISTS';
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_RISE_HISTORY').AsInteger:=History;
    DM.StoredProc.ExecProc;
    exist:=DM.StoredProc.ParamByName('IF_EXIST').AsInteger;
    DM.StoredProc.Transaction.Commit;
  except
    on e:exception do
    begin
      DM.StoredProc.Transaction.Rollback;
      grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOk]);
    end;
  end;
  if(exist=1)then
  begin
    FRollback:=TFGrantRiseProblem.Create(self,History);
    if(FRollback.ShowModal=mrYes)then exist:=FRollback.Result
    else exist:=-1;
  end;
  if(exist<>-1)then
    try
      DM.StoredProc.StoredProcName := 'GR_DT_GRANTS_RISE_ROLLBACK';
      DM.StoredProc.Transaction.StartTransaction;
      DM.StoredProc.Prepare;
      DM.StoredProc.ParamByName('ID_RISE_HISTORY').AsInteger:=History;
      DM.StoredProc.ParamByName('ALL_ROLLBACK').AsInteger:=exist;
      DM.StoredProc.ExecProc;
      DM.StoredProc.Transaction.Commit;
      grShowMessage(Caption ,RiseRollback_Text[PLanguageIndex], mtInformation, [mbYes]);
    except
      on e:exception do
      begin
        DM.StoredProc.Transaction.Rollback;
        grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOk]);
      end;
    end;
  SelectRiseBtn.Click;
end;

procedure TFGrantRise.RefreshBtnClick(Sender: TObject);
begin
  try
    DM.StoredProc.StoredProcName := 'GR_DT_GRANTS_RISE_I';
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('GRDATE').AsDate:=EncodeDate(YearSpinEdit.IntValue,MonthCombo.ItemIndex+1,DaySpinEdit.IntValue);
    DM.StoredProc.ExecProc;
    DM.StoredProc.Transaction.Commit;
  except
    on e:exception do
    begin
      DM.StoredProc.Transaction.Rollback;
      grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOk]);
    end;
  end;
  if DM.DSet2.Active=true then
    DM.DSet2.FullRefresh;
  CommitBtn.Enabled:=false;
  UpdateBtn.Enabled:=true;
  RollbackBtn.Enabled:=false;

  if Grid1DBTableView1.Controller.FocusedRecord=nil then
  begin
    UpdateBtn.Enabled:=false;
  end
  else
    if History=0 then RollbackBtn.Enabled:=false
    else
    begin
      UpdateBtn.Enabled:=false;
      RollbackBtn.Enabled:=true;
    end
end;

procedure TFGrantRise.UpdateBtnClick(Sender: TObject);
begin
  Grid1DBTableView1DBSummaNew.Editing:=true;
end;

procedure TFGrantRise.Grid1DBTableView1DBSummaNewPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  DM.DSet2.Edit;
  DM.DSet2['SUMMA_NEW']:=grIfThen(VarToStrDef(DisplayValue,'')='',null,DisplayValue);
  DM.DSet2.Post;
  if DM.UpdateTransaction.InTransaction then DM.UpdateTransaction.Commit;
  DM.DSet2.SQLs.RefreshSQL.Text:='SELECT * FROM GR_DT_GRANTS_RISE_S('+IntToStr(History)+',?ID_RISE)';
  DM.DSet2.Refresh;
  if history=0 then CommitBtn.Enabled:=true;
end;

procedure TFGrantRise.SelectRiseBtnClick(Sender: TObject);
var Filter: TFGrantRiseByDate;
begin
  Filter:=TFGrantRiseByDate.Create(Owner);
  if(Filter.ShowModal=mrYes)then
  begin
    History:=Filter.Result;
    DM.DSet2.Close;
    DM.DSet2.SQLs.SelectSQL.Text:='SELECT * FROM GR_DT_GRANTS_RISE_S('+IntToStr(History)+',null)';
    DM.DSet2.Open;
    RefreshBtn.Click;
  end
  else Close;
end;

procedure TFGrantRise.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if(DM.DSet2['IS_COMMIT']=1)then
  begin
    Grid1DBTableView1DBSummaNew.Options.Editing:=false;
    Grid1DBTableView1DBSummaNew.Options.Focusing:=false;
  end
  else
  begin
    Grid1DBTableView1DBSummaNew.Options.Editing:=true;
    Grid1DBTableView1DBSummaNew.Options.Focusing:=true;
  end;
end;

procedure TFGrantRise.DaySpinEditChange(Sender: TObject);
begin
  RefreshBtn.Click;
end;

procedure TFGrantRise.MonthComboChange(Sender: TObject);
begin
  RefreshBtn.Click;
end;

end.
