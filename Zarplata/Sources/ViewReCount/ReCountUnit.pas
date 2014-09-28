unit ReCountUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, cxMemo, ReCountFilter,
  FIBQuery, pFIBQuery, ZProc, Dates, ZTypes, ZMessages,
  PackageLoad, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  cxCheckListBox, cxGridBandedTableView, cxGridDBBandedTableView, Unit_ReCountData_Consts;

type
  TFZReCountData = class(TForm)
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
    GridMasterTn: TcxGridDBColumn;
    PanelDopData: TPanel;
    DBMaskEditDepartment: TcxDBMaskEdit;
    DBMaskEditSmeta: TcxDBMaskEdit;
    LabelDepartment: TcxLabel;
    LabelSmeta: TcxLabel;
    dxBarDockControl1: TdxBarDockControl;
    EditLocate: TdxBarEdit;
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
    GridChildColClock: TcxGridDBBandedColumn;
    FilterBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    DeleteAllBtn: TdxBarLargeButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GridMasterKodSetup2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridChildColP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridChildColSummaGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridDatesView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridDatesView1KeyPress(Sender: TObject; var Key: Char);
    procedure GridDatesView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditLocateEnter(Sender: TObject);
    procedure GridAccDBBandedTableView1DataControllerGroupingChanged(
      Sender: TObject);
    procedure GridChildColKodSetup3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FilterBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DeleteAllBtnClick(Sender: TObject);
  private
   PItemFilter:byte;
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);reintroduce;
  end;

function View_ReCountData(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant; stdcall;
 exports  View_ReCountData;


implementation

uses StrUtils, Math;

{$R *.dfm}

function View_ReCountData(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
var ViewForm: TFZReCountData;
begin
if not IsMDIChildFormShow(TFZReCountData) then
    ViewForm  :=  TFZReCountData.Create(AOwner,DB);
View_ReCountData:=NULL;
end;

constructor TFZReCountData.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
Inherited Create(AOwner);
cxSplitter1.Color := GridDatesView1.Styles.Selection.Color;
PanelDopData.Color := GridDatesView1.Styles.Background.Color;
//******************************************************************************
Caption := 'Показники перерахунку'; //FZReCountData_Caption_LaterPeriods;
RefreshBtn.Caption                           := 'Відновити'; //FZReCountData_RefreshBtn_Caption;
ExitBtn.Caption                              := FZReCountData_ExitBtn_Caption;

GridMasterTn.Caption                         := FZReCountData_GridMasterTn_Caption;
GridMasterFIO.Caption                        := FZReCountData_GridMasterFIO_Caption;
GridMasterKodSetup2.Caption                  := FZReCountData_GridMasterKodSetup2_Caption;

GridChildColKodVidOpl.Caption                := FZReCountData_GridChildColKodVidOpl_Caption;
GridChildColSumma.Caption                    := FZReCountData_GridChildColSumma_Caption;
GridChildColNameVidOpl.Caption               := FZReCountData_GridChildColNameVidOpl_Caption;
GridChildColP1.Caption                       := FZReCountData_GridChildColP1_Caption;
GridChildColDepartment.Caption               := FZReCountData_GridChildColDepartment_Caption;
GridChildColSmeta.Caption                    := 'Кошт.'; //FZReCountData_GridChildColSmeta_Caption;
GridChildColKodSetup3.Caption                := FZReCountData_GridChildColKodSetup3_Caption;
GridChildColNDay.Caption                     := FZReCountData_GridChildColNDay_Caption;
GridChildColClock.Caption                    := FZReCountData_GridChildColClock_Caption;

LabelDepartment.Caption                      := FZReCountData_GridChildColDepartment_Caption+':';
LabelSmeta.Caption                           := 'Кошт.'; //FZReCountData_GridChildColSmeta_Caption+':';

//******************************************************************************
GridMasterKodSetup2.DataBinding.FieldName    := 'KOD_SETUP';
GridMasterFIO.DataBinding.FieldName          := 'FIO';
GridMasterTn.DataBinding.FieldName           := 'TN';
//******************************************************************************
GridChildColKodVidOpl.DataBinding.FieldName  := 'KOD_VIDOPL';
GridChildColSumma.DataBinding.FieldName      := 'SUMMA';
GridChildColNameVidOpl.DataBinding.FieldName := 'NAME_VIDOPL';
GridChildColP1.DataBinding.FieldName         := 'P1';
GridChildColDepartment.DataBinding.FieldName := 'KOD_DEPARTMENT';
GridChildColSmeta.DataBinding.FieldName      := 'KOD_SMETA';
GridChildColKodSetup3.DataBinding.FieldName  := 'KOD_SETUP3';
GridChildColNDay.DataBinding.FieldName       := 'NDAY';
GridChildColClock.DataBinding.FieldName      := 'CLOCK';
DBMaskEditDepartment.DataBinding.DataField   := 'NAME_DEPARTMENT';
DBMaskEditSmeta.DataBinding.DataField        := 'NAME_SMETA';
//******************************************************************************
DataSetChild.SQLs.SelectSQL.Text:='SELECT * FROM Z_VIEW_RECOUNT(?ID_MAN,?KOD_SETUP)';
DataSetParent.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_RECOUNT_LIST(2)';

DataBase.Handle                              := DB;
DataSetParent.Open;
PItemFilter:=1;
end;

procedure TFZReCountData.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZReCountData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZReCountData.FormCreate(Sender: TObject);
begin
GridAccDBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := FZReCountData_GridChildColNameVidOplSummary_Format;
GridDatesView1FocusedRecordChanged(GridDatesView1,nil,GridDatesView1.Controller.FocusedRecord,True);
end;

procedure TFZReCountData.RefreshBtnClick(Sender: TObject);
var Id1:Variant;
begin
ID1:=DataSetParent['ID_MAN'];
DataSetChild.Close;
DataSetParent.CloseOpen(True);
DataSetParent.Locate('ID_MAN',ID1,[loCaseInsensitive,loPartialKey]);
DataSetChild.Open;
end;

procedure TFZReCountData.GridMasterKodSetup2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZReCountData.GridChildColP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='False' then
   AText:=FZReCountData_GridChildColP1False_Text;
if AText='True' then
   AText:=FZReCountData_GridChildColP1True_Text;
end;

procedure TFZReCountData.GridChildColSummaGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if ARecord.Values[3]='F' then
 begin
  if pos('-',AText)>0 then
    delete(AText,1,1)
  else
    AText:='-'+AText
 end;
end;

procedure TFZReCountData.GridDatesView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  DeleteBtn.Enabled:=False;
  if DataSetChild.Active then DataSetChild.Close;
  GridAccDBBandedTableView1.OptionsView.Footer := False;
 end
else
 begin
  DeleteBtn.Enabled:=True;
  if not DataSetChild.Active then DataSetChild.Open;
  GridAccDBBandedTableView1.OptionsView.Footer := True;
 end;
DeleteAllBtn.Enabled:=not(AFocusedRecord=nil);
end;

procedure TFZReCountData.GridDatesView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (GridDatesView1.OptionsBehavior.IncSearchItem <> GridMasterTn)then
    begin
     GridDatesView1.Controller.IncSearchingText   := '';
     GridDatesView1.OptionsBehavior.IncSearchItem := GridMasterTn;
    end
  end
 else
  if (GridDatesView1.OptionsBehavior.IncSearchItem <> GridMasterFIO)then
   begin
    GridDatesView1.Controller.IncSearchingText   := '';
    GridDatesView1.OptionsBehavior.IncSearchItem := GridMasterFIO;
   end;
end;

procedure TFZReCountData.GridDatesView1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
EditLocate.Text := GridDatesView1.Controller.IncSearchingText;
end;

procedure TFZReCountData.EditLocateEnter(Sender: TObject);
begin
GridDates.SetFocus;
end;

procedure TFZReCountData.GridAccDBBandedTableView1DataControllerGroupingChanged(
  Sender: TObject);
begin
 GridChildColP1.Caption:=IfThen(GridChildColP1.GroupIndex>-1,FZReCountData_GridChildColP1_Caption_Group,FZReCountData_GridChildColP1_Caption);
end;

procedure TFZReCountData.GridChildColKodSetup3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZReCountData.FilterBtnClick(Sender: TObject);
var ItemFilter:byte;
begin
ItemFilter:=ViewFilter(Self,PItemFilter);
if ItemFilter<>0 then
 begin
  DataSetChild.Close;
  DataSetParent.Close;
  case ItemFilter of
   1: DataSetParent.SQLs.SelectSQL.Text :='SELECT * FROM Z_GET_RECOUNT_LIST(2)';
   2: DataSetParent.SQLs.SelectSQL.Text :='SELECT * FROM Z_GET_RECOUNT_LIST(1)';
   3: DataSetParent.SQLs.SelectSQL.Text :='SELECT * FROM Z_GET_RECOUNT_LIST(-1)';
   4: DataSetParent.SQLs.SelectSQL.Text :='SELECT * FROM Z_GET_RECOUNT_LIST(0)';
   5: DataSetParent.SQLs.SelectSQL.Text :='SELECT * FROM Z_GET_RECOUNT_LIST(NULL)';
  end;
  DataSetParent.Open;
  DataSetChild.Open;
  PItemFilter:=ItemFilter;
 end;
end;

procedure TFZReCountData.DeleteBtnClick(Sender: TObject);
begin
if ZShowMessage('Попередження','Ви дійсно бажаєте видалити данні з перерахунка?',mtConfirmation,[mbYes,mbOK])=mrYes then
 try
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='Z_RECOUNT_LIST_DELETE_MAN';
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
    ZShowMessage('Error',e.Message,mtError,[mbOk]);
   end;
 end;
end;

procedure TFZReCountData.DeleteAllBtnClick(Sender: TObject);
begin
if ZShowMessage('Попередження','Ви дійсно бажаєте видалити данні з перерахунка?',mtConfirmation,[mbYes,mbOK])=mrYes then
 try
  DataSetChild.Close;
  GridDatesView1.DataController.DataSource:=nil;
  DataSetParent.First;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='Z_RECOUNT_LIST_DELETE_MAN';
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
    ZShowMessage('Error',e.Message,mtError,[mbOk]);
   end;
 end;
end;

end.
