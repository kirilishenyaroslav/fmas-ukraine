unit PeoplePriv_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, PeoplePriv_DM,
  dxStatusBar, ZcxLocateBar, zMessages, cxGridBandedTableView,
  cxGridDBBandedTableView;

type
  TFZPeoplePriv = class(TForm)
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
    Panel2: TPanel;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClTn: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    ActionList: TActionList;
    SystemAction: TAction;
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
    dxStatusBar2: TdxStatusBar;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    FilterBtn: TdxBarLargeButton;
    LineViewBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    Grid2: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2ClPrivKod: TcxGridDBColumn;
    Grid2ClPrivName: TcxGridDBColumn;
    Grid2ClDateBeg: TcxGridDBColumn;
    Grid2ClDateEnd: TcxGridDBColumn;
    Grid2ClExpense: TcxGridDBColumn;
    Grid2Level1: TcxGridLevel;
    procedure ExitBtnClick(Sender: TObject);
    procedure Grid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure AddManBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SystemActionExecute(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure Grid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    DM:TDM;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    PKodSetup:integer;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math, ZWait;

{$R *.dfm}

constructor TFZPeoplePriv.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
  wf:TForm;
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption                    := ZPeoplePriv_Caption[PLanguageIndex];
 AddManBtn.Caption          := AddManBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption         := RefreshBtn_Caption[PLanguageIndex];
 InsertBtn.Caption          := InsertBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption          := UpdateBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption          := DeleteBtn_Caption[PLanguageIndex];
 DetailBtn.Caption          := DetailBtn_Caption[PLanguageIndex];
 FilterBtn.Caption          := FilterBtn_Caption[PLanguageIndex];
 ExitBtn.Caption            := ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
 Grid1ClTn.Caption          := GridClTn_Caption[PLanguageIndex];
 Grid1ClFIO.Caption         := GridClFIO_Caption[PLanguageIndex];
//******************************************************************************
 Grid2ClExpense.Caption     := GridClExpense_Caption[PLanguageIndex];
 Grid2ClPrivKod.Caption     := GridClKod_Caption[PLanguageIndex];
 Grid2ClPrivName.Caption    := GridClNamePriv_Caption[PLanguageIndex];
 Grid2ClDateBeg.Caption     := GridClBegPeriod_Caption[PLanguageIndex];
 Grid2ClDateEnd.Caption     := GridClEndPeriod_Caption[PLanguageIndex];
//******************************************************************************
 dxStatusBar1.Panels[0].Text:= AddManBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[1].Text:= InsertBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[2].Text:= UpdateBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[3].Text:= DeleteBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[4].Text:= DetailBtn_Hint[PLanguageIndex];

 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

 dxStatusBar2.Panels[0].Text:= RefreshBtn_Hint[PLanguageIndex];
 dxStatusBar2.Panels[1].Text:= LocateBtn_Hint[PLanguageIndex];
 dxStatusBar2.Panels[2].Text:= LocateNextBtn_Hint[PLanguageIndex];
 dxStatusBar2.Panels[3].Text:= FilterBtn_Hint[PLanguageIndex];
 dxStatusBar2.Panels[4].Text:= ExitBtn_Hint[PLanguageIndex];

 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
//******************************************************************************
 Grid1ClFio.DataBinding.FieldName        := 'FIO';
 Grid1ClTn.DataBinding.FieldName         := 'TN';
 Grid2ClPrivKod.DataBinding.FieldName    := 'KOD_PRIV';
 Grid2ClPrivName.DataBinding.FieldName   := 'NAME_PRIV';
 Grid2ClDateBeg.DataBinding.FieldName    := 'DATE_BEG';
 Grid2ClDateEnd.DataBinding.FieldName    := 'DATE_END';
 Grid2ClExpense.DataBinding.FieldName    := 'EXPENSE';
//******************************************************************************
 wf:=ShowWaitForm(Application.MainForm);
 DM := TDM.Create(self,Db_Handle);
 CloseWaitForm(wf);
 PBarLocate:=TZBarLocate.Create(BarManager);

 PBarLocate.DataSet := DM.DSet1;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('TN',
                           Grid1ClTn.Caption,
                           [loCaseInsensitive]);
 PBarLocate.AddLocateItem('FIO',
                           Grid1ClFIO.Caption,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TN';
 PBarLocate.DockControl := BarDockLocate;
//******************************************************************************
 PKodSetup:=CurrentKodSetup(DM.DB.Handle);
//******************************************************************************
 Grid1DBTableView1.DataController.DataSource := DM.DSource1;
 Grid2DBTableView1.DataController.DataSource := DM.DSource2;
//******************************************************************************
 WindowState := wsMaximized; 
end;

procedure TFZPeoplePriv.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZPeoplePriv.Grid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (Grid1DBTableView1.OptionsBehavior.IncSearchItem<>Grid1ClTn)then
    begin
     Grid1DBTableView1.Controller.IncSearchingText   := '';
     Grid1DBTableView1.OptionsBehavior.IncSearchItem := Grid1ClTn;
    end
  end
 else
  if (Grid1DBTableView1.OptionsBehavior.IncSearchItem<>Grid1ClFIO)then
   begin
    Grid1DBTableView1.Controller.IncSearchingText   := '';
    Grid1DBTableView1.OptionsBehavior.IncSearchItem := Grid1ClFIO;
   end;
end;

procedure TFZPeoplePriv.AddManBtnClick(Sender: TObject);
var Man:variant;
begin
Man := LoadPeopleModal(self,Dm.db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DM.DSet1.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DM.DSet2.Close;
   DM.DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_DATAPEOPLE_BY_ID_MAN('+VarToStr(Man[0])+')';
   DM.DSet1.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   DM.DSet1.Insert;
   DM.DSet1.Post;
   DM.DSet2.Open;
  end;
end;

procedure TFZPeoplePriv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZPeoplePriv.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System Information',
             'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'0')+#13+
             'ID_PEOPLE_PRIV = '+IfThen(DM.DSet2.Active,VarToStr(DM.DSet2['ID_PEOPLE_PRIV']),'0'),
              mtInformation,[mbOK]);
end;

procedure TFZPeoplePriv.RefreshBtnClick(Sender: TObject);
var wf:TForm;
begin
 wf:=ShowWaitForm(Self);
 with DM do
  begin
   if DSet2.Active then DSet2.Close;
   if DSet1.Active then DSet1.Close;
   DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_PEOPLEPRIV_SELECT_FIO('+IntToStr(PKodSetup)+') order by tn';
   DSet1.Open;
   DSet2.Open;
  end;
 CloseWaitForm(wf);
end;

procedure TFZPeoplePriv.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TFZPeoplePriv.FilterBtnClick(Sender: TObject);
var KodSetup:integer;
begin
KodSetup:=LoadFilterKodSetup(self,DM.DB.Handle,PKodSetup);
if KodSetup<>PKodSetup then
 begin
  PKodSetup:=KodSetup;
  RefreshBtnClick(Sender);
 end;
end;

procedure TFZPeoplePriv.Grid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord=nil then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DetailBtn.Enabled := False;
 end
else
 begin
  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
 end;
end;

procedure TFZPeoplePriv.Grid3DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord=nil then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DetailBtn.Enabled := False;
 end
else
 begin
  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
 end;
end;

procedure TFZPeoplePriv.InsertBtnClick(Sender: TObject);
var Parameter:TZPeoplePrivParameters;
    ResLoad:variant;
begin
if not InsertBtn.Enabled then Exit;
Parameter.ID := DM.DSet1['ID_MAN'];
Parameter.TypeId := zppctIdPeople;
Parameter.ControlFormStyle := zcfsInsert;
ResLoad:=LoadPeoplePrivControl(self,DM.DB.Handle,Parameter);
if VarArrayDimCount(ResLoad)>0 then
 if ResLoad[0]=mrYes then
  begin
   DM.DSet2.CloseOpen(True);
   DM.DSet2.Locate('ID_PEOPLE_PRIV',ResLoad,[loCaseInsensitive]);
  end;
end;

procedure TFZPeoplePriv.UpdateBtnClick(Sender: TObject);
var Parameter:TZPeoplePrivParameters;
    ResLoad:variant;
begin
if not UpdateBtn.Enabled then Exit;
Parameter.ID := DM.DSet2['ID_PEOPLE_PRIV'];
Parameter.TypeId := zppctIdPeoplePriv;
Parameter.ControlFormStyle := zcfsUpdate;
ResLoad:=LoadPeoplePrivControl(self,DM.DB.Handle,Parameter);
if ResLoad[0]=mrYes then
   DataSetCloseOpen(DM.DSet2,'ID_PEOPLE_PRIV');
end;

procedure TFZPeoplePriv.DeleteBtnClick(Sender: TObject);
var Parameter:TZPeoplePrivParameters;
    ResLoad:variant;
begin
if not DeleteBtn.Enabled then Exit;
Parameter.ID := DM.DSet2['ID_PEOPLE_PRIV'];
Parameter.TypeId := zppctIdPeoplePriv;
Parameter.ControlFormStyle := zcfsDelete;
ResLoad:=LoadPeoplePrivControl(self,DM.DB.Handle,Parameter);
if ResLoad[0]=mrYes then
   DataSetCloseOpen(DM.DSet2,'ID_PEOPLE_PRIV');
end;

procedure TFZPeoplePriv.DetailBtnClick(Sender: TObject);
var Parameter:TZPeoplePrivParameters;
begin
if not DetailBtn.Enabled then Exit;
Parameter.ID := DM.DSet2['ID_PEOPLE_PRIV'];
Parameter.TypeId := zppctIdPeoplePriv;
Parameter.ControlFormStyle := zcfsShowDetails;
LoadPeoplePrivControl(self,DM.DB.Handle,Parameter);
end;

procedure TFZPeoplePriv.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
InsertBtn.Enabled := not (AFocusedRecord=nil);
end;

procedure TFZPeoplePriv.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

end.
