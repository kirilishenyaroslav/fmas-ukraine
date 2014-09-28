unit gr_ReCountData_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, cxMemo,
  FIBQuery, pFIBQuery, ZProc, gr_uCommonProc, Dates, ZTypes, gr_uMessage,
  PackageLoad, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  cxCheckListBox, cxGridBandedTableView, cxGridDBBandedTableView, gr_uCommonConsts,
  gr_uCommonLoader, zcxLocateBar, gr_dmCommonStyles, gr_uWaitForm;

type
  TFgrReCountData = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    PanelGridsChild: TPanel;
    SplitterPanelGridVed: TcxSplitter;
    PanelGridDatesAcc: TPanel;
    GridDates: TcxGrid;
    GridDatesView1: TcxGridDBTableView;
    GridMasterKodSetup2: TcxGridDBColumn;
    GridDatesLevel1: TcxGridLevel;
    PanelGridPeople: TPanel;
    DataSourceChild: TDataSource;
    DataSourceParent: TDataSource;
    DataBase: TpFIBDatabase;
    DataSetChild: TpFIBDataSet;
    DataSetParent: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
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
    dxBarDockControl2: TdxBarDockControl;
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
    GridMasterFIO: TcxGridDBColumn;
    GridMasterTin: TcxGridDBColumn;
    PanelDopData: TPanel;
    LabelDepartment: TcxLabel;
    LabelSmeta: TcxLabel;
    BarDockLocate: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    GridAcc: TcxGrid;
    GridAccDBBandedTableView1: TcxGridDBBandedTableView;
    GridChildColKodVidOpl: TcxGridDBBandedColumn;
    GridChildColNameVidOpl: TcxGridDBBandedColumn;
    GridChildColSumma: TcxGridDBBandedColumn;
    GridChildColP1: TcxGridDBBandedColumn;
    GridChildColDepartment: TcxGridDBBandedColumn;
    GridChildColSmeta: TcxGridDBBandedColumn;
    GridChildColKodSetup3: TcxGridDBBandedColumn;
    GridAccLevel1: TcxGridLevel;
    GridChildColNDay: TcxGridDBBandedColumn;
    DeleteBtn: TdxBarLargeButton;
    DeleteAllBtn: TdxBarLargeButton;
    LabelCategory: TcxLabel;
    EditCategory: TcxDBMaskEdit;
    EditDepartment: TcxDBMaskEdit;
    EditSmeta: TcxDBMaskEdit;
    dxBarStatic5: TdxBarStatic;
    dxBarStatic6: TdxBarStatic;
    SumLessNullBtn: TdxBarLargeButton;
    SumIsEveryBtn: TdxBarLargeButton;
    SumEqualsNullBtn: TdxBarLargeButton;
    SumMoreNullBtn: TdxBarLargeButton;
    SumIsNullBtn: TdxBarLargeButton;
    BarStaticFilter: TdxBarStatic;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GridMasterKodSetup2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridChildColP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridDatesView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridDatesView1KeyPress(Sender: TObject; var Key: Char);
    procedure EditLocateEnter(Sender: TObject);
    procedure GridChildColKodSetup3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DeleteAllBtnClick(Sender: TObject);
    procedure PanelDopDataResize(Sender: TObject);
    procedure GridAccDBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridAccDBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure GetData(Sender: TObject);
    procedure SumIsEveryBtnClick(Sender: TObject);
    procedure SumMoreNullBtnClick(Sender: TObject);
    procedure SumEqualsNullBtnClick(Sender: TObject);
    procedure SumLessNullBtnClick(Sender: TObject);
    procedure SumIsNullBtnClick(Sender: TObject);
  private
   PItemFilter:byte;
   pLanguageIndex:byte;
   pBarLocate:TZBarLocate;
   pStylesDM:TStylesDM;
   pDiffWidth:integer;
   pLastFilterBtn:byte;
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);reintroduce;
  end;

function View_ReCountData(AParameter:TObject):Variant;stdcall;
exports View_ReCountData;

implementation

uses StrUtils, Math;

{$R *.dfm}

function View_ReCountData(AParameter:TObject):Variant;
var ViewForm: TFgrReCountData;
begin
if ((IsMDIChildFormShow(TFgrReCountData)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
ViewForm  :=  TFgrReCountData.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle);
end;

constructor TFgrReCountData.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
Inherited Create(AOwner);
pDiffWidth:=PanelDopData.Width-EditDepartment.Width;
cxSplitter1.Color := GridDatesView1.Styles.Selection.Color;
PanelDopData.Color := GridDatesView1.Styles.Background.Color;
pLastFilterBtn:=1;
pLanguageIndex := IndexLanguage;
//******************************************************************************
Caption                                      := ViewRecData_Text[pLanguageIndex];
RefreshBtn.Caption                           := RefreshBtn_Caption[pLanguageIndex];
ExitBtn.Caption                              := ExitBtn_Caption[pLanguageIndex];

GridMasterTin.Caption                        := GridClTin_Caption[pLanguageIndex];
GridMasterFIO.Caption                        := GridClFIO_Caption[pLanguageIndex];
GridMasterKodSetup2.Caption                  := GridClKodSetup_Caption[pLanguageIndex];



GridChildColKodVidOpl.Caption                := GridClKodVo_Caption[pLanguageIndex];
GridChildColSumma.Caption                    := GridClSumma_Caption[pLanguageIndex];
GridChildColNameVidOpl.Caption               := GridClNameVo_Caption[pLanguageIndex];
GridChildColP1.Caption                       := GridClP1_Caption[pLanguageIndex];
GridChildColDepartment.Caption               := GridClKodDepartment_Caption[pLanguageIndex];
GridChildColSmeta.Caption                    := GridClKodSmeta_Caption[pLanguageIndex];
GridChildColKodSetup3.Caption                := GridClKodSetup_Caption[pLanguageIndex];
GridChildColNDay.Caption                     := GridClNday_Caption[pLanguageIndex];

LabelCategory.Caption                        := LabelCategory_Caption[pLanguageIndex]+': ';
LabelDepartment.Caption                      := LabelDepartment_Caption[pLanguageIndex]+': ';
LabelSmeta.Caption                           := LabelSmeta_Caption[pLanguageIndex]+': ';

BarStaticFilter.Caption                      := Filter_Text[pLanguageIndex]+': ';
SumIsEveryBtn.Caption                        := NotFilter_Text[PlanguageIndex];
SumMoreNullBtn.Caption                       := SumMoreNull_Text[PlanguageIndex];
SumLessNullBtn.Caption                       := SumLessNull_Text[PlanguageIndex];
SumEqualsNullBtn.Caption                     := SumEqualsNull_Text[PlanguageIndex];
SumIsNullBtn.Caption                         := SumIsNull_Text[PlanguageIndex];
//******************************************************************************
DataSetChild.SQLs.SelectSQL.Text:='SELECT * FROM GR_VIEW_RECOUNT(?ID_MAN,?KOD_SETUP)';
DataSetParent.SQLs.SelectSQL.Text:='SELECT * FROM GR_GET_RECOUNT_LIST(2)';

DataBase.Handle                              := DB;
PItemFilter:=1;
//******************************************************************************
SetOptionsBarManager(BarManager);
SetOptionsGridView(GridDatesView1);
SetOptionsGridView(GridAccDBBandedTableView1);
dxBarDockControl2.SunkenBorder := True;
GridDatesView1.OptionsView.Footer:=true;
//------------------------------------------------------------------------------
 pStylesDM := TStylesDM.Create(self);
 GridDatesView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
 GridAccDBBandedTableView1.Styles.StyleSheet := pStylesDM.GridBandedTableViewStyleSheetDevExpress;
//------------------------------------------------------------------------------
 PBarLocate:=TZBarLocate.Create(BarManager);

 PBarLocate.DataSet := DataSetParent;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('TIN',
                           GridMasterTin.Caption,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('FIO',
                           GridMasterFIO.Caption,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TIN';
 PBarLocate.DockControl  := BarDockLocate;
//------------------------------------------------------------------------------
GridAccDBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Summary_Text[pLanguageIndex];
end;

procedure TFgrReCountData.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFgrReCountData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFgrReCountData.FormCreate(Sender: TObject);
begin
GetData(sender);
GridDatesView1FocusedRecordChanged(GridDatesView1,nil,GridDatesView1.Controller.FocusedRecord,True);
end;

procedure TFgrReCountData.RefreshBtnClick(Sender: TObject);
var Id1:Variant;
    wf:TForm;
begin
wf:=ShowWaitForm(self,wfSelectData);
ID1:=DataSetParent['ID_MAN'];
DataSetChild.Close;
DataSetParent.CloseOpen(True);
DataSetParent.Locate('ID_MAN',ID1,[loCaseInsensitive,loPartialKey]);
DataSetChild.Open;
CloseWaitForm(wf);
end;

procedure TFgrReCountData.GridMasterKodSetup2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText<>'' then Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFgrReCountData.GridChildColP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='False' then
   AText:=GridClP1_Ud_Text[pLanguageIndex];
if AText='True' then
   AText:=GridClP1_Nar_Text[pLanguageIndex];
end;

procedure TFgrReCountData.GridDatesView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  DeleteBtn.Enabled:=False;
  GridAccDBBandedTableView1.OptionsView.Footer := False;
 end
else
 begin
  DeleteBtn.Enabled:=True;
  GridAccDBBandedTableView1.OptionsView.Footer := True;
 end;
DeleteAllBtn.Enabled:=not(AFocusedRecord=nil);
GridAccDBBandedTableView1FocusedRecordChanged(GridAccDBBandedTableView1,nil,GridAccDBBandedTableView1.Controller.FocusedRecord,True);
end;

procedure TFgrReCountData.GridDatesView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (GridDatesView1.OptionsBehavior.IncSearchItem <> GridMasterTin)then
    begin
     GridDatesView1.Controller.IncSearchingText   := '';
     GridDatesView1.OptionsBehavior.IncSearchItem := GridMasterTin;
    end
  end
 else
  if (GridDatesView1.OptionsBehavior.IncSearchItem <> GridMasterFIO)then
   begin
    GridDatesView1.Controller.IncSearchingText   := '';
    GridDatesView1.OptionsBehavior.IncSearchItem := GridMasterFIO;
   end;
end;

procedure TFgrReCountData.EditLocateEnter(Sender: TObject);
begin
GridDates.SetFocus;
end;

procedure TFgrReCountData.GridChildColKodSetup3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText<>'' then Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFgrReCountData.DeleteBtnClick(Sender: TObject);
begin
if grShowMessage(Caption_Delete[pLanguageIndex],DeleteRecordQuestion_Text[pLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 try
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='GR_RECOUNT_LIST_DELETE_MAN';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_MAN').AsInteger := DataSetParent['ID_MAN'];
  StoredProc.ParamByName('KOD_SETUP').AsInteger := DataSetParent['KOD_SETUP'];
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  DataSetParent.SQLs.DeleteSQL.Text:='execute procedure Z_EMPTY_PROC';
  DataSetParent.Delete;
 except
  on E:Exception do
   begin
    StoredProc.Transaction.Rollback;
    grShowMessage(ECaption[pLanguageIndex],e.Message,mtError,[mbOk]);
   end;
 end;
end;

procedure TFgrReCountData.DeleteAllBtnClick(Sender: TObject);
begin
 if grShowMessage(Caption_Delete[pLanguageIndex],DelAllRecordsQuestion_Text[pLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 try
   DataSetChild.Close;
   GridDatesView1.DataController.DataSource:=nil;
   try
    DataSetParent.First;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='GR_RECOUNT_LIST_DELETE_MAN';
    StoredProc.Prepare;
    while not DataSetParent.Eof do
     begin
      StoredProc.ParamByName('ID_MAN').AsInteger := DataSetParent['ID_MAN'];
      StoredProc.ParamByName('KOD_SETUP').AsInteger := DataSetParent['KOD_SETUP'];
      StoredProc.ExecProc;
      DataSetParent.Next;
     end;
    StoredProc.Transaction.Commit;
    DataSetParent.CloseOpen(True);
    DataSetChild.Open;
   except
    on E:Exception do
     begin
      StoredProc.Transaction.Rollback;
      grShowMessage(ECaption[pLanguageIndex],e.Message,mtError,[mbOk]);
     end;
   end;
  finally
   DataSetChild.Open;
   GridDatesView1.DataController.DataSource := DataSourceParent;
  end;
end;

procedure TFgrReCountData.PanelDopDataResize(Sender: TObject);
begin
EditDepartment.Width := max(PanelDopData.Width-pDiffWidth,100);
EditSmeta.Width := EditDepartment.Width;
EditCategory.Width := EditDepartment.Width;
end;

procedure TFgrReCountData.GridAccDBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable)
 then
   begin
    EditCategory.DataBinding.DataSource := nil;
    EditDepartment.DataBinding.DataSource := nil;
    EditSmeta.DataBinding.DataSource := nil;
   end
 else
   begin
    EditCategory.DataBinding.DataSource := DataSourceChild;
    EditDepartment.DataBinding.DataSource := DataSourceChild;
    EditSmeta.DataBinding.DataSource := DataSourceChild;
   end;
end;

procedure TFgrReCountData.GridAccDBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = GridChildColSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spFooter) then
  begin
   if (VarToStr(GridAccDBBandedTableView1.DataController.Values[Arguments.RecordIndex, GridChildColP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TFgrReCountData.GetData(Sender: TObject);
var wf:TForm;
begin
 wf := ShowWaitForm(self,wfSelectData);
 DataSetParent.Open;
 DataSetChild.Open;
 CloseWaitForm(wf);
end;

procedure TFgrReCountData.SumIsEveryBtnClick(Sender: TObject);
begin
if not (pLastFilterBtn=1) then
 begin
  DataSetChild.Close;
  DataSetParent.Close;
  DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM GR_GET_RECOUNT_LIST(2)';
  GetData(Sender);
  pLastFilterBtn := 1;
 end;
end;

procedure TFgrReCountData.SumMoreNullBtnClick(Sender: TObject);
begin
if not (pLastFilterBtn=2) then
 begin
  DataSetChild.Close;
  DataSetParent.Close;
  DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM GR_GET_RECOUNT_LIST(1)';
  GetData(Sender);
  pLastFilterBtn := 2;
 end;
end;

procedure TFgrReCountData.SumEqualsNullBtnClick(Sender: TObject);
begin
if not (pLastFilterBtn = 3) then
 begin
  DataSetChild.Close;
  DataSetParent.Close;
  DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM GR_GET_RECOUNT_LIST(0)';
  GetData(Sender);
  pLastFilterBtn := 3;
 end;
end;

procedure TFgrReCountData.SumLessNullBtnClick(Sender: TObject);
begin
if not (pLastFilterBtn = 4) then
 begin
  DataSetChild.Close;
  DataSetParent.Close;
  DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM GR_GET_RECOUNT_LIST(-1)';
  GetData(Sender);
  pLastFilterBtn := 4;
 end;
end;

procedure TFgrReCountData.SumIsNullBtnClick(Sender: TObject);
begin
if not (pLastFilterBtn = 5) then
 begin
  DataSetChild.Close;
  DataSetParent.Close;
  DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM GR_GET_RECOUNT_LIST(NULL)';
  GetData(Sender);
  pLastFilterBtn := 5;
 end;
end;

end.
