unit ReCountData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, cxMemo,
  FIBQuery, pFIBQuery, ZProc, Dates, ZTypes, ZMessages,
  PackageLoad, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  cxCheckListBox, cxGridBandedTableView, cxGridDBBandedTableView, Unit_DatesAcc_Consts;

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
    GridMasterDateAcc: TcxGridDBColumn;
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
    GridMasterIdMan: TcxGridDBColumn;
    dxBarDockControl2: TdxBarDockControl;
    GridMasterTypeAcc: TcxGridDBColumn;
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
    GridAcc: TcxGrid;
    GridAccDBBandedTableView1: TcxGridDBBandedTableView;
    GridChildColKodVidOpl: TcxGridDBBandedColumn;
    GridChildColNameVidOpl: TcxGridDBBandedColumn;
    GridChildColSumma: TcxGridDBBandedColumn;
    GridChildColP1: TcxGridDBBandedColumn;
    GridChildColDepartment: TcxGridDBBandedColumn;
    GridChildColSmeta: TcxGridDBBandedColumn;
    GridAccLevel1: TcxGridLevel;
    PanelDopData: TPanel;
    DBMaskEditDepartment: TcxDBMaskEdit;
    DBMaskEditSmeta: TcxDBMaskEdit;
    LabelDepartment: TcxLabel;
    LabelSmeta: TcxLabel;
    dxBarDockControl1: TdxBarDockControl;
    EditLocate: TdxBarEdit;
    cxSplitter1: TcxSplitter;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GridMasterKodSetup2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridAccDBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
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
    procedure GridAccDBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure GridDatesView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditLocateEnter(Sender: TObject);
  private
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);reintroduce;
  end;

function View_ReCount(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant; stdcall;
 exports  View_ReCount;


implementation

uses StrUtils, Math;

{$R *.dfm}

function View_ReCount(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZReCountData;
begin
if not IsMDIChildFormShow(TFZReCountData) then
    ViewForm  :=  TFZReCountData.Create(AOwner,DB);
View_ReCount:=NULL;
end;

constructor TFZReCountData.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
var TypeId:Byte;
begin
Inherited Create(AOwner);
cxSplitter1.Color := GridDatesView1.Styles.Selection.Color;
PanelDopData.Color := GridDatesView1.Styles.Background.Color;
//******************************************************************************
Caption := FZDateAcc_Caption_LaterPeriods;
RefreshBtn.Caption                           := FZDateAcc_RefreshBtn_Caption;
ExitBtn.Caption                              := FZDateAcc_ExitBtn_Caption;

GridChildColKodVidOpl.Caption                := FZDateAcc_GridChildColKodVidOpl_Caption;
GridChildColSumma.Caption                    := FZDateAcc_GridChildColSumma_Caption;
GridChildColNameVidOpl.Caption               := FZDateAcc_GridChildColNameVidOpl_Caption;
GridChildColP1.Caption                       := FZDateAcc_GridChildColP1_Caption;
GridChildColDepartment.Caption               := FZDateAcc_GridChildColDepartment_Caption;
GridChildColSmeta.Caption                    := FZDateAcc_GridChildColSmeta_Caption;

LabelDepartment.Caption                      := FZDateAcc_GridChildColDepartment_Caption+':';
LabelSmeta.Caption                           := FZDateAcc_GridChildColSmeta_Caption+':';

GridMasterKodSetup2.Caption                  := FZDateAcc_GridMasterKodSetup2_Caption;
GridMasterDateAcc.Caption                    := FZDateAcc_GridMasterDateAcc_Caption;
GridMasterIdMan.Caption                      := FZDateAcc_GridMasterIdMan_Caption;
GridMasterTypeAcc.Caption                    := FZDateAcc_GridMasterTypeAcc_Caption;
//******************************************************************************
GridMasterIdMan.DataBinding.FieldName        := 'FIO_TN';
GridMasterKodSetup2.DataBinding.FieldName    := 'KOD_SETUP_2';
GridMasterDateAcc.DataBinding.FieldName      := 'DATE_ACC';
GridMasterTypeAcc.DataBinding.FieldName      := 'TYPE_ACC';
GridMasterFIO.DataBinding.FieldName          := 'FIO';
GridMasterTn.DataBinding.FieldName           := 'TN';
//******************************************************************************
GridChildColKodVidOpl.DataBinding.FieldName  := 'KOD_VIDOPL';
GridChildColSumma.DataBinding.FieldName      := 'SUMMA';
GridChildColNameVidOpl.DataBinding.FieldName := 'NAME_VIDOPL';
GridChildColP1.DataBinding.FieldName         := 'P1';
GridChildColDepartment.DataBinding.FieldName := 'NAME_DEPARTMENT';
GridChildColSmeta.DataBinding.FieldName      := 'NAME_SMETA';
DBMaskEditDepartment.DataBinding.DataField   := 'NAME_DEPARTMENT';
DBMaskEditSmeta.DataBinding.DataField        := 'NAME_SMETA';
//******************************************************************************
DataSetChild.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S(?ID_ACCOUNT,?ID_GROUP_ACCOUNT,'
                                                                          +IntToStr(TypeId)+')';
DataSetParent.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_RECOUNT_LIST';

DataBase.Handle                              := DB;
DataSetParent.Open;
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
GridAccDBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := FZDateAcc_GridChildColNameVidOplSummary_Format;
GridDatesView1FocusedRecordChanged(GridDatesView1,nil,GridDatesView1.Controller.FocusedRecord,True);
end;

procedure TFZReCountData.RefreshBtnClick(Sender: TObject);
var Id1,Id2:Variant;
begin
ID2:=DataSetChild.RecNo;
ID1:=DataSetParent.FieldValues['ID_ACCOUNT'];
DataSetChild.Close;
DataSetParent.CloseOpen(True);
GridDatesView1.DataController.LocateByKey(ID1);
DataSetChild.Open;
DataSetChild.RecNo:=Id2;
end;

procedure TFZReCountData.GridMasterKodSetup2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZReCountData.GridAccDBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
begin
{var
  AValueSumma, AValueP1: Variant;
  AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = GridChildColSumma) and
    (AItem.Kind = skSum) and (AItem.Position = spGroup) then
  begin
    AValueSumma := GridAccView1.DataController.Values[
      Arguments.RecordIndex, GridChildColSumma.Index];
    AValueP1    := GridAccView1.DataController.Values[
      Arguments.RecordIndex, GridChildColP1.Index];
    if not VarIsNull(AValueSumma) then
     if not VarIsNull(AValueP1) then
      if VarToStr(AValueP1) = 'F' then
       begin
        OutArguments.Value:=-OutArguments.Value;
        ShowMessage(varToStr(OutArguments.Value));
       end;
  end;}
end;

procedure TFZReCountData.GridChildColP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='False' then
   AText:=FZDateAcc_GridChildColP1False_Text;
if AText='True' then
   AText:=FZDateAcc_GridChildColP1True_Text;
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
//  if DataSetChild.Active then DataSetChild.Close;
  GridAccDBBandedTableView1.OptionsView.Footer := False;
 end
else
 begin
//  if not DataSetChild.Active then DataSetChild.Open;
  GridAccDBBandedTableView1.OptionsView.Footer := True;
 end;
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

procedure TFZReCountData.GridAccDBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var
  AValueSumma, AValueP1: Variant;
  AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = GridChildColSumma) and
    (AItem.Kind = skSum) and (AItem.Position = spGroup) then
  begin
    AValueSumma := GridAccDBBandedTableView1.DataController.Values[
      Arguments.RecordIndex, GridChildColSumma.Index];
    AValueP1    := GridAccDBBandedTableView1.DataController.Values[
      Arguments.RecordIndex, GridChildColP1.Index];
    if not VarIsNull(AValueSumma) then
     if not VarIsNull(AValueP1) then
      if VarToStr(AValueP1) = 'F' then
       begin
        OutArguments.Value:=-OutArguments.Value;
       end;
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

end.
