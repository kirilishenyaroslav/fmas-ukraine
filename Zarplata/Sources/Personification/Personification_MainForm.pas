unit Personification_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, Personification_DM,
  dxStatusBar, ZcxLocateBar, zMessages, cxGridBandedTableView,
  cxGridDBBandedTableView, cxCheckBox, cxGridCustomPopupMenu, cxGridPopupMenu, Menus,
  Personification_export, ImgList, cxButtonEdit, cxSpinEdit,
  Personification_AddYearReport, z_uWaitForm, PersDatesAcc;

type
  TMainFormF1df = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddReportBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    cxSplitter1: TcxSplitter;
    PanelCurrent: TPanel;
    Grid2Level1: TcxGridLevel;
    dxStatusBar1: TdxStatusBar;
    PanelPeople: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClNumReport: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    ActionList: TActionList;
    SystemAction: TAction;
    Grid2DBBandedTableView1: TcxGridDBBandedTableView;
    Grid2: TcxGrid;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
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
    grid1ClDateReport: TcxGridDBColumn;
    Grid2ClTin: TcxGridDBBandedColumn;
    Grid2ClBirthDate: TcxGridDBBandedColumn;
    Grid2ClFio: TcxGridDBBandedColumn;
    DelReportBtn: TdxBarLargeButton;
    cxGridPopupMenu1: TcxGridPopupMenu;
    Grid2ClSex: TcxGridDBBandedColumn;
    ExportBtn: TdxBarLargeButton;
    GroupBtn: TdxBarLargeButton;
    Grid2DBis_science: TcxGridDBBandedColumn;
    Panel1: TPanel;
    cxSplitter3: TcxSplitter;
    Panel3: TPanel;
    Grid3: TcxGrid;
    Grid3DBBandedTableView1: TcxGridDBBandedTableView;
    Grid3ClKodSetup: TcxGridDBBandedColumn;
    Grid3ClSumAll: TcxGridDBBandedColumn;
    Grid3ClPensiya: TcxGridDBBandedColumn;
    Grid3ClBol: TcxGridDBBandedColumn;
    Grid3ClSumPens: TcxGridDBBandedColumn;
    Grid3ClStaj: TcxGridDBBandedColumn;
    Grid3ClIsMain: TcxGridDBBandedColumn;
    Grid3ClIsInv: TcxGridDBBandedColumn;
    Grid3DBis_science: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    Grid3ClVo: TcxGridDBBandedColumn;
    Grid3ClVidOpl: TcxGridDBBandedColumn;
    Grid3ClSumma: TcxGridDBBandedColumn;
    Grid3ClP1: TcxGridDBBandedColumn;
    Grid3ClDepartment: TcxGridDBBandedColumn;
    Grid3ClSmeta: TcxGridDBBandedColumn;
    Grid3ClKodSetup3: TcxGridDBBandedColumn;
    Grid3ClReCount: TcxGridDBBandedColumn;
    Grid3ClNDay: TcxGridDBBandedColumn;
    Grid3ClClock: TcxGridDBBandedColumn;
    Grid3ClStavkaPercent: TcxGridDBBandedColumn;
    Grid3Level1: TcxGridLevel;
    procedure ExitBtnClick(Sender: TObject);
    procedure AddReportBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure DelReportBtnClick(Sender: TObject);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Grid2DBBandedTableView1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Grid3ClKodSetupGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure ExportBtnClick(Sender: TObject);
    procedure dxStatusBar1Resize(Sender: TObject);
    procedure GroupBtnClick(Sender: TObject);
    procedure Grid3DBBandedTableView1DblClick(Sender: TObject);
    procedure cxGridDBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure cxGridDBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure Grid3ClP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid3ClKodSetup3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormResize(Sender: TObject);
  private
    DM:TDM;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math, FIBQuery;

{$R *.dfm}

constructor TMainFormF1df.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption                := FZ_Personification_Caption[PLanguageIndex];
 AddReportBtn.Caption   := AddReport_Caption[PLanguageIndex];
 DelReportBtn.Caption   := DelReport_Caption[PLanguageIndex];
 ExitBtn.Caption        := ExitBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption     := RefreshBtn_Caption[PLanguageIndex];

 Grid1ClNumReport.Caption  := GridClNumberShort_Caption[pLanguageIndex];
 grid1ClDateReport.Caption := GridClDate_Caption[pLanguageIndex];

 Grid2ClFio.Caption        := GridClFIO_Caption[PLanguageIndex];
 Grid2ClTin.Caption        := GridClTin_Caption[PLanguageIndex];
 Grid2ClBirthDate.Caption  := GridClDateCame_Caption[PLanguageIndex];

 Grid3ClKodSetup.Caption   := GridClKodSetup_Caption[pLanguageIndex];
 Grid3ClSumAll.Caption     := GridClAll_Caption[pLanguageIndex];
 Grid3ClPensiya.Caption    := GridClPensSum_Caption[pLanguageIndex];
 Grid3ClBol.Caption        := GridClHospSum_Caption[pLanguageIndex];
 Grid3ClSumPens.Caption    := GridClVznosSum_Caption[pLanguageIndex];
 Grid3ClStaj.Caption       := GridClStaj_Caption[pLanguageIndex];

 Grid3ClVo.Caption := GridClKodVidOpl_Caption[PLanguageIndex];
 Grid3ClVidOpl.Caption := GridClNameVidopl_Caption[PLanguageIndex];
 Grid3ClSumma.Caption := GridClSumma_Caption[PLanguageIndex];
 Grid3ClP1.Caption := GridClP1_Caption[PLanguageIndex];
 Grid3ClDepartment.Caption := GridClKodDepartment_Caption[PLanguageIndex];
 Grid3ClSmeta.Caption := GridClKodSmeta_Caption[PLanguageIndex];
 Grid3ClKodSetup3.Caption := GridClKodSetup_Caption[PLanguageIndex];
 Grid3ClReCount.Caption := '';
 Grid3ClNDay.Caption := GridClNday_Caption[PLanguageIndex];
 Grid3ClClock.Caption := GridClClock_Caption[PLanguageIndex];
 Grid3ClStavkaPercent.Caption := GridClStavkaPercent_Caption[PLanguageIndex];
 //Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex]+':';
//******************************************************************************
 DM := TDM.Create(self,Db_Handle);

//******************************************************************************
 dxStatusBar1.Panels[0].Text:= ShortCutToText(AddReportBtn.ShortCut)+'-'+AddReportBtn.Caption;
 dxStatusBar1.Panels[1].Text:= ShortCutToText(DelReportBtn.ShortCut)+'-'+DelReportBtn.Caption;
 dxStatusBar1.Panels[2].Text:= ShortCutToText(RefreshBtn.ShortCut)+'-'+RefreshBtn.Caption;
 dxStatusBar1.Panels[5].Text:= ShortCutToText(ExitBtn.ShortCut)+'-'+ExitBtn.Caption;
//******************************************************************************
 Grid1DBTableView1.DataController.DataSource := DM.DSource1;
 Grid2DBBandedTableView1.DataController.DataSource := DM.DSource2;
 Grid3DBBandedTableView1.DataController.DataSource := DM.DSource3;
 cxGridDBBandedTableView1.DataController.DataSource := DM.DSource4;
//******************************************************************************
 WindowState := wsMaximized;
//******************************************************************************
end;

procedure TMainFormF1df.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TMainFormF1df.AddReportBtnClick(Sender: TObject);
var ViewForm:TFAddYearReport;
begin
ViewForm := TFAddYearReport.Create(Self,DM.DB.Handle);
if ViewForm.ShowModal=mrYes then
 begin
  DM.DSet1.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
  DM.DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_REPORT_S_BY_K('+IntToStr(ViewForm.Id_report)+')';
  DM.DSet1.Insert;
  DM.DSet1.Post;
 end;
ViewForm.Destroy;
end;

procedure TMainFormF1df.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TMainFormF1df.FormDestroy(Sender: TObject);
begin
if not(DM=nil) then DM.Destroy;
end;

procedure TMainFormF1df.RefreshBtnClick(Sender: TObject);
begin
 DM.DSet3.Close;
 DM.DSet2.Close;
 DM.DSet1.CloseOpen(True);
 DM.DSet2.Open;
 DM.DSet3.Open;
end;

procedure TMainFormF1df.DelReportBtnClick(Sender: TObject);
var wf:TForm;
begin
if ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
try
  wf:=ShowWaitForm(self,zwfDeleteData);
  with DM do
   try
    StProc.StoredProcName := 'Z_PERSONIFICATION_REPORT_D';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('ID').AsInteger := DSet1['ID'];
    StProc.ExecProc;
    StProc.Transaction.Commit;
    DSet1.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
    DSet1.Delete;
   except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
     StProc.Transaction.Rollback;
    end;
   end;
finally
  CloseWaitForm(wf);
end;  
end;

procedure TMainFormF1df.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if (AFocusedRecord=nil) or (AFocusedRecord.Expandable)
     then
         begin
              Grid2DBBandedTableView1.DataController.DataSource:=nil;
              DelReportBtn.Enabled := False;
         end
     else
         begin
              Grid2DBBandedTableView1.DataController.DataSource:=DM.DSource2;
              DelReportBtn.Enabled := True;
         end;
end;

procedure TMainFormF1df.FormShow(Sender: TObject);
begin
 Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
 FormResize(Self);
end;

procedure TMainFormF1df.Grid2DBBandedTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (Grid2DBBandedTableView1.OptionsBehavior.IncSearchItem<>Grid2ClTin)then
    begin
     Grid2DBBandedTableView1.Controller.IncSearchingText   := '';
     Grid2DBBandedTableView1.OptionsBehavior.IncSearchItem := Grid2ClTin;
    end
  end
 else
  if (Grid2DBBandedTableView1.OptionsBehavior.IncSearchItem<>Grid2ClFio)then
   begin
    Grid2DBBandedTableView1.Controller.IncSearchingText   := '';
    Grid2DBBandedTableView1.OptionsBehavior.IncSearchItem := Grid2ClFIO;
   end;
end;

procedure TMainFormF1df.Grid3ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TMainFormF1df.ExportBtnClick(Sender: TObject);
begin
ExportToDBF(self,DM.DB.Handle,DM.DSet1['ID']);
end;

procedure TMainFormF1df.dxStatusBar1Resize(Sender: TObject);
var i:integer;
begin
  for i:=0 to dxStatusBar1.Panels.Count-1 do
     dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TMainFormF1df.GroupBtnClick(Sender: TObject);
begin
 Grid3DBBandedTableView1.OptionsView.GroupByBox := GroupBtn.Down;
 if Grid3DBBandedTableView1.OptionsView.GroupByBox then Grid3ClKodSetup.GroupIndex := 0
                                                   else Grid3ClKodSetup.GroupIndex := -1;
 Grid3ClKodSetup.Visible := not GroupBtn.Down;
end;

procedure TMainFormF1df.Grid3DBBandedTableView1DblClick(Sender: TObject);
var id_anketa:Int64;
begin
     if Grid3DBBandedTableView1.DataController.DataSource.DataSet.RecordCount>0
     then begin
               id_anketa:=Grid2DBBandedTableView1.DataController.DataSource.DataSet['id'];
               with TFZDateAcc.Create(self,DM.DB.Handle,id_anketa,
                    Grid3DBBandedTableView1.DataController.DataSource.DataSet['KOD_SETUP2'],
                    Grid3DBBandedTableView1.DataController.DataSource.DataSet['is_science']) do
               begin
                    ShowModal;
                    Free;
               end;
     end;
end;

procedure TMainFormF1df.cxGridDBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spGroup) then
  begin
   if (AItem.Column.GroupIndex<Grid3ClP1.GroupIndex) and (VarToStr(cxGridDBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TMainFormF1df.cxGridDBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spGroup) then
  begin
   if (AItem.Column.GroupIndex<Grid3ClP1.GroupIndex) and (VarToStr(cxGridDBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TMainFormF1df.Grid3ClP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if AText='False' then
    AText:=GridClP1_Text_False[PLanguageIndex];
 if AText='True' then
    AText:=GridClP1_Text_True[PLanguageIndex];

end;

procedure TMainFormF1df.Grid3ClKodSetup3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     Atext:=KodSetupToPeriod(StrToInt(Atext),1);
end;

procedure TMainFormF1df.FormResize(Sender: TObject);
begin
     Grid2.Height:=PanelPeople.Height div 8;
     Panel1.Height:=(PanelPeople.Height div 8)*7;
     cxSplitter3.Top:=Panel1.Top-1;
     PanelPeople.Width:=Self.ClientWidth div 4;
     cxSplitter1.Left:=PanelPeople.Left+PanelPeople.Width+1;

     Grid3.Height :=(Panel1.Height div 5)*3;
     Panel2.Height:=(Panel1.Height div 5)*2;
     cxSplitter2.Top:=Panel2.Top-1;
     cxGridDBBandedTableView1.ViewData.Expand(true);
end;

end.
