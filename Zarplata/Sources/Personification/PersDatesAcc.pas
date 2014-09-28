unit PersDatesAcc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, cxMemo, ZcxLocateBar,
  FIBQuery, pFIBQuery, ZProc, Dates, ZTypes, ZMessages,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  cxCheckListBox, cxGridBandedTableView, cxGridDBBandedTableView, Unit_ZGlobal_Consts,
  dxStatusBar, ActnList, unit_NumericConsts,
  PackageLoad, z_dmCommonStyles, cxDBLabel, pFIBProps,
  cxGridCustomPopupMenu, cxGridPopupMenu, zWait, Menus;

type
  TFZDateAcc = class(TForm)
    DSource3: TDataSource;
    DSource1: TDataSource;
    DataBase: TpFIBDatabase;
    DSet3: TpFIBDataSet;
    DSet1: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Styles: TcxStyleRepository;
    dxBarDockControl2: TdxBarDockControl;
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
    DSet2: TpFIBDataSet;
    DSource2: TDataSource;
    dxStatusBar1: TdxStatusBar;
    ActionList: TActionList;
    ActionSystem: TAction;
    DockSite: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    DockPanel2: TdxDockPanel;
    Grid3: TcxGrid;
    Grid3DBBandedTableView1: TcxGridDBBandedTableView;
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
    PanelGrid3DopData: TPanel;
    DBMaskEditDepartment: TcxDBMaskEdit;
    DBMaskEditSmeta: TcxDBMaskEdit;
    LabelDepartment: TcxLabel;
    LabelSmeta: TcxLabel;
    DBMaskEditPost: TcxDBMaskEdit;
    LabelPost: TcxLabel;
    cxSplitter1: TcxSplitter;
    DBMaskEditCategory: TcxDBMaskEdit;
    LabelCategory: TcxLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Grid3ClP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid3ClKodSetup3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid3ClNDayGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid3ClClockGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid2ClKodSetupGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure DSet3AfterOpen(DataSet: TDataSet);
    procedure Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure RefreshBtnClick(Sender: TObject);
    procedure dxStatusBar1Resize(Sender: TObject);
    procedure PanelGrid3DopDataResize(Sender: TObject);
    procedure ActionSystemExecute(Sender: TObject);
    procedure Grid3DBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dxBarButton1Click(Sender: TObject);
    procedure Grid3DBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
  private
        PMode:TZTypeData;
        PLanguageIndex:byte;
        pStyles:TStylesDM;
        pWidth:integer;
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE; id_anketa:int64; kod_setup:Integer; is_science:Integer);reintroduce;
  end;



implementation

uses StrUtils, Math;

{$R *.dfm}


constructor TFZDateAcc.Create(AOwner : TComponent;DB:TISC_DB_HANDLE; id_anketa:int64; kod_setup:Integer; is_science:Integer);
var i:Byte;
    wf:TForm;
begin
Inherited Create(AOwner);
 try
   wf:=ShowWaitForm(Application.MainForm);
  //******************************************************************************
   pWidth := PanelGrid3DopData.Width-DBMaskEditDepartment.Width;
   PLanguageIndex:=LanguageIndex;
   Caption := 'Розшифровка персоніфікації';
  //******************************************************************************
  //******************************************************************************
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
  //******************************************************************************
   LabelDepartment.Caption := LabelDepartment_Caption[PLanguageIndex];
   LabelSmeta.Caption := LabelSmeta_Caption[PLanguageIndex];
   LabelPost.Caption := LabelPost_Caption[PLanguageIndex];
   LabelCategory.Caption := LabelCategory_Caption[PLanguageIndex];
  //******************************************************************************
   Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex]+':';
  //******************************************************************************
   PanelGrid3DopData.Color := Grid3DBBandedTableView1.Styles.Background.Color;
   cxSplitter1.Color := Grid3DBBandedTableView1.Styles.Header.Color;
  //******************************************************************************
   for i:=0 to dxStatusBar1.Panels.Count-1 do
     dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
   dxStatusBar1.Panels[0].Text:= RefreshBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[1].Text:= LocateBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[2].Text:= LocateNextBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[3].Text:= FilterBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[4].Text:= PrintBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[5].Text:= ExitBtn_Hint[PLanguageIndex];
  //******************************************************************************
  DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_ACC_S('+IntToStr(id_anketa)+') where kod_setup3='+IntTostr(kod_setup)+
  ' and is_science='+IntTostr(is_science)+' order by Kod_vidopl';
  DataBase.Handle                              := DB;

  DSet3.Open;
  //******************************************************************************
  pStyles := TStylesDM.Create(self);
  Grid3DBBandedTableView1.Styles.StyleSheet := pStyles.GridBandedTableViewStyleSheetDevExpress;
 finally
   CloseWaitForm(wf);
 end;
end;

procedure TFZDateAcc.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZDateAcc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
if FormStyle=fsMDIChild then Action:=caFree;
end;


procedure TFZDateAcc.FormCreate(Sender: TObject);
begin
Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex];
end;

procedure TFZDateAcc.Grid3ClP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if AText='False' then
    AText:=GridClP1_Text_False[PLanguageIndex];
 if AText='True' then
    AText:=GridClP1_Text_True[PLanguageIndex];
end;


procedure TFZDateAcc.Grid3ClKodSetup3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(Atext),1);
end;

procedure TFZDateAcc.Grid3ClNDayGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if StrToInt(AText)=0 then AText:='';
end;

procedure TFZDateAcc.Grid3ClClockGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if (AText<>'') and (StrToFloat(AText)=0) then AText:='';
end;

procedure TFZDateAcc.Grid2ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;


procedure TFZDateAcc.DSet3AfterOpen(DataSet: TDataSet);
begin
Grid3DBBandedTableView1.ViewData.Expand(False);
end;

procedure TFZDateAcc.Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spFooter) then
  begin
   if (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TFZDateAcc.RefreshBtnClick(Sender: TObject);
begin
DSet3.Close;
DSet2.Close;
DSet1.CloseOpen(True);
DSet2.Open;
DSet3.Open;
end;

procedure TFZDateAcc.dxStatusBar1Resize(Sender: TObject);
var i:byte;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFZDateAcc.PanelGrid3DopDataResize(Sender: TObject);
begin
DBMaskEditDepartment.Width:=PanelGrid3DopData.Width-pWidth;
DBMaskEditSmeta.Width:=PanelGrid3DopData.Width-pWidth;
DBMaskEditPost.Width:=PanelGrid3DopData.Width-pWidth;
DBMaskEditCategory.Width:=PanelGrid3DopData.Width-pWidth;
end;

procedure TFZDateAcc.ActionSystemExecute(Sender: TObject);
begin
ZShowMessage('System Data','ID_MAN = '+VarToStrDef(DSet2['ID_MAN'],'NULL')+#13+
                           'ID_GROUP_ACCOUNT = '+VarToStrDef(DSet2['ID_GROUP_ACCOUNT'],'NULL')+#13+
                           'KOD_SETUP_2 = '+VarToStrDef(DSet2['KOD_SETUP_2'],'NULL'),mtInformation,[mbOk]);
end;

procedure TFZDateAcc.Grid3DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  DBMaskEditDepartment.DataBinding.DataSource := nil;
  DBMaskEditSmeta.DataBinding.DataSource := nil;
  DBMaskEditPost.DataBinding.DataSource := nil;
  DBMaskEditCategory.DataBinding.DataSource := nil;
 end
else
 begin
  DBMaskEditDepartment.DataBinding.DataSource := DSource3;
  DBMaskEditSmeta.DataBinding.DataSource := DSource3;
  DBMaskEditPost.DataBinding.DataSource := DSource3;
  DBMaskEditCategory.DataBinding.DataSource := DSource3;
 end;
end;

procedure TFZDateAcc.dxBarButton1Click(Sender: TObject);
begin
Grid3Level1.GridView := GetTable(DSource2,'KOD_SETUP_2');
end;



procedure TFZDateAcc.Grid3DBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spGroup) then
  begin
   if (AItem.Column.GroupIndex<Grid3ClP1.GroupIndex) and (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;


end.
