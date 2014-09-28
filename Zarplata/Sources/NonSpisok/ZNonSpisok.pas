unit ZNonSpisok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, ZNonSpisok_Dmodule,
  cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TFZNonSpisok = class(TForm)
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
    ActList: TActionList;
    PanelDetailData: TPanel;
    PanelDopData: TPanel;
    EditDepartment: TcxDBMaskEdit;
    EditCategory: TcxDBMaskEdit;
    EditSmeta: TcxDBMaskEdit;
    LabelSmeta: TcxLabel;
    LabelDepartment: TcxLabel;
    LabelCategory: TcxLabel;
    SplitterPanelDopData: TcxSplitter;
    GridChild: TcxGrid;
    GridChildDBTableView1: TcxGridDBTableView;
    GridChildLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    OtherBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    FilterBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    PanelDataMain: TPanel;
    GridMain: TcxGrid;
    GridMainDBTableView1: TcxGridDBTableView;
    Grid_FIO_ColumnTn: TcxGridDBColumn;
    Grid_FIO_ColumnFIO: TcxGridDBColumn;
    GridMainLevel1: TcxGridLevel;
    GridChildColKodSetup2: TcxGridDBColumn;
    GridChildColVoKod: TcxGridDBColumn;
    GridChildColVoName: TcxGridDBColumn;
    GridChildColSumma: TcxGridDBColumn;
    GridChildColKodDepartment: TcxGridDBColumn;
    GridChildColKodSmeta: TcxGridDBColumn;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    PanelContainer: TPanel;
    EditLocate: TcxTextEdit;
    LabelLocate: TcxLabel;
    LocateBtn: TcxButton;
    LocateNextbtn: TcxButton;
    ActionLocate: TAction;
    ActionLocateNext: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure OtherBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure GridChildColKodSetup2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure EditLocateKeyPress(Sender: TObject; var Key: Char);
    procedure EditLocateEnter(Sender: TObject);
    procedure EditLocateExit(Sender: TObject);
    procedure ActionLocateExecute(Sender: TObject);
    procedure ActionLocateNextExecute(Sender: TObject);
    procedure GridChildDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridMainDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    DM:TDM;
    P_Kod_Setup:integer;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math;

{$R *.dfm}

constructor TFZNonSpisok.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 P_Kod_Setup:=-1;
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption := NonSpisok_Caption[PLanguageIndex];
 InsertBtn.Caption := InsertBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption := UpdateBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption := DeleteBtn_Caption[PLanguageIndex];
 DetailBtn.Caption := DetailBtn_Caption[PLanguageIndex];
 OtherBtn.Caption  := AddManBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption:= RefreshBtn_Caption[PLanguageIndex];
 ExitBtn.Caption   := ExitBtn_Caption[PLanguageIndex];
 FilterBtn.Caption := FilterBtn_Caption[PLanguageIndex];
 LocateBtn.Caption := '';
 LocateNextbtn.Caption := '';
 LocateBtn.Hint    := LocateBtn_Caption[PLanguageIndex];
 LocateNextBtn.Hint:= LocateNextBtn_Caption[PLanguageIndex];
//******************************************************************************
 Grid_FIO_ColumnTn.Caption := GridClTn_Caption[PLanguageIndex];
 Grid_FIO_ColumnFIO.Caption:= GridClFIO_Caption[PLanguageIndex];
 LabelLocate.Caption := Grid_FIO_ColumnTn.Caption;

 GridChildColKodSmeta.Caption := GridClKodSmeta_Caption[PLanguageIndex];
 GridChildColKodDepartment.Caption := GridClKodDepartment_Caption[PLanguageIndex];
 GridChildColVoKod.Caption := GridClKodVidOpl_Caption[PLanguageIndex];
 GridChildColVoName.Caption := GridClNameVidopl_Caption[PLanguageIndex];
 GridChildColKodSetup2.Caption := GridClKodSetup_Caption[PLanguageIndex];
 GridChildColSumma.Caption := GridClSumma_Caption[PLanguageIndex];

 LabelSmeta.Caption := LabelSmeta_Caption[PLanguageIndex];
 LabelDepartment.Caption := LabelDepartment_Caption[PLanguageIndex];
 LabelCategory.Caption := LabelCategory_Caption[PLanguageIndex];
//******************************************************************************
 DM:=TDM.Create(AOwner,Db_Handle);
//******************************************************************************
 GridMainDBTableView1.DataController.DataSource:=DM.DSourceMain;
 GridChildDBTableView1.DataController.DataSource:=DM.DSourceChild;
 EditDepartment.DataBinding.DataSource := DM.DSourceChild;
 EditCategory.DataBinding.DataSource := DM.DSourceChild;
 EditSmeta.DataBinding.DataSource := DM.DSourceChild;
//******************************************************************************
 SplitterPanelDopData.Color := GridChildDBTableView1.Styles.Header.Color;
 PanelDopData.Color         := GridChildDBTableView1.Styles.Background.Color;
 SplitterPanelDopData.CloseSplitter;
 GridMainDBTableView1FocusedRecordChanged(GridMainDBTableView1,
                                          nil,
                                          GridMainDBTableView1.Controller.FocusedRecord,
                                          True);
end;

procedure TFZNonSpisok.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TFZNonSpisok.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZNonSpisok.OtherBtnClick(Sender: TObject);
var Man:variant;
begin
Man := LoadPeopleModal(self,Dm.db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DM.DSetMain.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DM.DSetMain.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_DATAPEOPLE_BY_ID_MAN('+VarToStr(Man[0])+')';
   DM.DSetMain.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   DM.DSetMain.Insert;
   DM.DSetMain.Post;
  end;
end;

procedure TFZNonSpisok.FilterBtnClick(Sender: TObject);
var KodSetup:integer;
begin
kodSetup:=LoadFilterKodSetup(self,DM.DB.Handle,P_kod_Setup);
if (KodSetup<>-1) and (KodSetup<>P_Kod_Setup) then
 begin
  P_Kod_Setup:=KodSetup;
  RefreshBtnClick(Sender);
 end;
end;

procedure TFZNonSpisok.RefreshBtnClick(Sender: TObject);
var KeyParent,KeyChild:variant;
begin
KeyParent:=ifThen(VarIsNull(DM.DSetMain['ID_MAN']),NULL,DM.DSetMain['ID_MAN']);
KeyChild:=IfThen(VarIsNull(DM.DSetChild['ID']),NULL,DM.DSetChild['ID']);

DM.DSetChild.Close;
DM.DSetMain.Close;
DM.DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM Z_NONSPISOK_S_FIO('+IfThen(P_kod_Setup<=0,'NULL',IntToStr(P_kod_Setup))+')';
DM.DSetMain.Open;

GridMainDBTableView1.DataController.LocateByKey(KeyParent);

DM.DSetChild.Open;

GridChildDBTableView1.DataController.LocateByKey(KeyChild);
end;

procedure TFZNonSpisok.InsertBtnClick(Sender: TObject);
var Parameter:TNonSpisokControlParameter;
    Res:variant;
begin
Parameter.Owner:=self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsInsert;
Parameter.Id:=DM.DSetMain['ID_MAN'];
Res:=LoadNonSpisokControl(Parameter);
If not VarIsNull(Res) then
 begin
  GridChildDBTableView1.DataController.DataSource:=nil;
  with DM.DSetChild do
   begin
    SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
    SQLs.RefreshSQL.Text := 'SELECT * FROM Z_NONSPISOK_S_BY_ID('+VarToStr(Res)+')';
    Insert;
    Post;
    GridChildDBTableView1.DataController.LocateByKey(Res);
   end;
  GridChildDBTableView1.DataController.DataSource:=DM.DSourceChild;
 end;
end;

procedure TFZNonSpisok.UpdateBtnClick(Sender: TObject);
var Parameter:TNonSpisokControlParameter;
    Res:Variant;
begin
Parameter.Owner:=self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsUpdate;
Parameter.Id:=DM.DSetChild['ID'];
Res:=LoadNonSpisokControl(Parameter);
If not VarIsNull(Res) then
  with DM.DSetChild do
   begin
    SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';
    SQLs.RefreshSQL.Text := 'SELECT * FROM Z_NONSPISOK_S_BY_ID('+VarToStr(Res)+')';
    Edit;
    Post;
    GridChildDBTableView1.DataController.LocateByKey(Res);
   end;
end;

procedure TFZNonSpisok.DeleteBtnClick(Sender: TObject);
var Parameter:TNonSpisokControlParameter;
begin
Parameter.Owner:=self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsDelete;
Parameter.Id:=DM.DSetChild['ID'];
if not VarIsNULL(LoadNonSpisokControl(Parameter)) then
  with DM.DSetChild do
   begin
    SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
    Delete;
    GridChildDBTableView1.DataController.LocateByKey(DM.DSetChild['ID'] );
   end;
end;

procedure TFZNonSpisok.DetailBtnClick(Sender: TObject);
var Parameter:TNonSpisokControlParameter;
begin
Parameter.Owner:=self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsShowDetails;
Parameter.Id:=DM.DSetChild['ID'];
LoadNonSpisokControl(Parameter);
end;

procedure TFZNonSpisok.GridChildColKodSetup2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZNonSpisok.EditLocateKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [chr(VK_TAB),chr(VK_DELETE),chr(VK_BACK)]) or (Key=#0) then exit;
if (Key in ['0'..'9']) then
 begin
  if LabelLocate.Caption = Grid_FIO_ColumnFIO.Caption then
   begin
    EditLocate.Text:='';
    LabelLocate.Caption := Grid_FIO_ColumnTn.Caption;
   end
 end
else
 begin
  if LabelLocate.Caption = Grid_FIO_ColumnTn.Caption then
   begin
    EditLocate.Text:='';
    LabelLocate.Caption := Grid_FIO_ColumnFIO.Caption;
   end
 end;
end;

procedure TFZNonSpisok.EditLocateEnter(Sender: TObject);
begin
DeleteBtn.ShortCut := 0;
end;

procedure TFZNonSpisok.EditLocateExit(Sender: TObject);
begin
DeleteBtn.ShortCut := 46;
end;

procedure TFZNonSpisok.ActionLocateExecute(Sender: TObject);
begin
if EditLocate.Text='' then exit;
if LabelLocate.Caption = Grid_FIO_ColumnTn.Caption then
 DM.DSetMain.Locate('TN',EditLocate.Text,[loCaseInsensitive,loPartialKey])
else
 DM.DSetMain.Locate('FIO',EditLocate.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TFZNonSpisok.ActionLocateNextExecute(Sender: TObject);
begin
if EditLocate.Text='' then exit;
if LabelLocate.Caption = Grid_FIO_ColumnTn.Caption then
 DM.DSetMain.LocateNext('TN',EditLocate.Text,[loCaseInsensitive,loPartialKey])
else
 DM.DSetMain.LocateNext('FIO',EditLocate.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TFZNonSpisok.GridChildDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DetailBtn.Enabled := False;
  EditDepartment.DataBinding.DataSource := nil;
  EditCategory.DataBinding.DataSource := nil;
  EditSmeta.DataBinding.DataSource := nil;
 end
else
 begin
  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
  EditDepartment.DataBinding.DataSource := DM.DSourceChild;
  EditCategory.DataBinding.DataSource := DM.DSourceChild;
  EditSmeta.DataBinding.DataSource := DM.DSourceChild;
 end;
end;

procedure TFZNonSpisok.GridMainDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
InsertBtn.Enabled := not(AFocusedRecord=nil);
GridChildDBTableView1FocusedRecordChanged(GridChildDBTableView1,
                                          nil,
                                          GridChildDBTableView1.Controller.FocusedRecord,
                                          True);
end;

end.
