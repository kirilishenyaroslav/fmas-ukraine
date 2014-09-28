unit NonSpisok_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, NonSpisok_DM,
  dxStatusBar, ZcxLocateBar, zMessages, cxGridBandedTableView,
  cxGridDBBandedTableView, Registry, cxButtonEdit;

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
    Splitter1: TcxSplitter;
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
    Grid2ClKodSetup2: TcxGridDBColumn;
    Grid2ClSmeta: TcxGridDBColumn;
    Grid2ClVo: TcxGridDBColumn;
    Grid2ClVidOpl: TcxGridDBColumn;
    Grid2ClSumma: TcxGridDBColumn;
    Grid2ClDepartment: TcxGridDBColumn;
    Grid2Level1: TcxGridLevel;
    Panel3: TPanel;
    EditDepartment: TcxDBMaskEdit;
    EditCategory: TcxDBMaskEdit;
    EditSmeta: TcxDBMaskEdit;
    LabelSmeta: TcxLabel;
    LabelDepartment: TcxLabel;
    LabelCategory: TcxLabel;
    Splitter2: TcxSplitter;
    AcctCardBtn: TdxBarLargeButton;
    Grid1DBTableView1DBColumn1: TcxGridDBColumn;
    AccBtn: TdxBarLargeButton;
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
    procedure Grid2ClKodSetup2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Panel3Resize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AcctCardBtnClick(Sender: TObject);
    procedure Grid1DBTableView1DBColumn1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure AccBtnClick(Sender: TObject);
  private
    DM:TDM;
    PAOwner:TComponent;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    PKodSetup:integer;
    pKodSetupBeg:Integer;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math, ZWait;

{$R *.dfm}

constructor TFZNonSpisok.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
  wf:TForm;
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
 PAOwner       :=Aowner;
 pKodSetupBeg                  := CurrentKodSetup(Db_Handle);
//******************************************************************************
 Caption                    := ZNonSpisok_Caption[PLanguageIndex];
 AddManBtn.Caption          := AddManBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption         := RefreshBtn_Caption[PLanguageIndex];
 InsertBtn.Caption          := InsertBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption          := UpdateBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption          := DeleteBtn_Caption[PLanguageIndex];
 DetailBtn.Caption          := DetailBtn_Caption[PLanguageIndex];
 FilterBtn.Caption          := FilterBtn_Caption[PLanguageIndex];
 ExitBtn.Caption            := ExitBtn_Caption[PLanguageIndex];
 AccBtn.Caption          := 'Перегляд розрахунку';
//******************************************************************************
 Grid1ClTn.Caption          := GridClTn_Caption[PLanguageIndex];
 Grid1ClFIO.Caption         := GridClFIO_Caption[PLanguageIndex];
//******************************************************************************
 Grid2ClKodSetup2.Caption   := GridClKodSetup_Caption[PLanguageIndex];
 Grid2ClVo.Caption          := GridClKodVidOpl_Caption[PLanguageIndex];
 Grid2ClSumma.Caption       := GridClSumma_Caption[PLanguageIndex];
 Grid2ClSmeta.Caption       := GridClKodSmeta_Caption[PLanguageIndex];
 Grid2ClDepartment.Caption  := GridClKodDepartment_Caption[PLanguageIndex];
 Grid2ClVidOpl.Caption      := GridClNameVidopl_Caption[PLanguageIndex];
//******************************************************************************
 LabelDepartment.Caption    := LabelDepartment_Caption[PLanguageIndex];
 LabelCategory.Caption      := LabelCategory_Caption[PLanguageIndex];
 LabelSmeta.Caption         := LabelSmeta_Caption[PLanguageIndex];
//******************************************************************************
 Splitter2.Color := Grid2DBTableView1.Styles.Header.Color;
 Panel3.Color    := Grid2DBTableView1.Styles.Background.Color;
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
 Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
//******************************************************************************
end;

procedure TFZNonSpisok.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZNonSpisok.Grid1DBTableView1KeyPress(Sender: TObject;
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

procedure TFZNonSpisok.AddManBtnClick(Sender: TObject);
var Man:variant;
begin
Man := LoadPeopleModal(self,Dm.db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DM.DSet1.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DM.DSet2.Close;
   DM.DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_NONSPISOK_PEOPLE_BY_ID_MAN('+VarToStr(Man[0])+')';
   DM.DSet1.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   DM.DSet1.Insert;
   DM.DSet1.Post;
   DM.DSet2.Open;
  end;
end;

procedure TFZNonSpisok.FormClose(Sender: TObject; var Action: TCloseAction);
var reg:TRegistry;
begin
if FormStyle=fsMDIChild then Action:=caFree;

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if reg.OpenKey('\Software\Zarplata\NonSpisokCtrl\',False) then
     reg.WriteInteger('IsBuffer',0);
 finally
  reg.Free;
 end;
end;

procedure TFZNonSpisok.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System Information',
             'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'0')+#13+
             'ID_NONSPISOK = '+IfThen(DM.DSet2.Active,VarToStr(DM.DSet2['ID']),'0'),
              mtInformation,[mbOK]);
end;

procedure TFZNonSpisok.RefreshBtnClick(Sender: TObject);
var wf:TForm;
    id:Integer;
begin
 wf:=ShowWaitForm(Self);
 with DM do
  begin
   if DSet2.Active then DSet2.Close;
   if DSet1.Active
   then begin
             if DSet1.RecordCount>0 then id:=DSet1['id_man'];
             DSet1.Close;
   end;
   DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_NONSPISOK_S_FIO('+IntToStr(PKodSetup)+') ORDER BY TN';
   DSet1.Open;
   DSet1.Locate('id_man',id,[]);
   DSet2.Open;
  end;
 CloseWaitForm(wf);
end;

procedure TFZNonSpisok.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TFZNonSpisok.FilterBtnClick(Sender: TObject);
var KodSetup:integer;
begin
KodSetup:=LoadFilterKodSetup(self,DM.DB.Handle,PKodSetup);
if KodSetup<>PKodSetup then
 begin
  PKodSetup:=KodSetup;
  RefreshBtnClick(Sender);
 end;
end;

procedure TFZNonSpisok.Grid2DBTableView1FocusedRecordChanged(
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
  EditDepartment.DataBinding.DataSource := DM.DSource2;
  EditCategory.DataBinding.DataSource := DM.DSource2;
  EditSmeta.DataBinding.DataSource := DM.DSource2;
 end;
end;

procedure TFZNonSpisok.Grid3DBTableView1FocusedRecordChanged(
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

procedure TFZNonSpisok.InsertBtnClick(Sender: TObject);
var Parameter:TNonSpisokControlParameter;
    Res:variant;
begin
Parameter.Owner:=self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsInsert;
Parameter.Id:=DM.DSet1['ID_MAN'];
Res:=LoadNonSpisokControl(Parameter);
If not VarIsNull(Res) then
 begin
  Grid2DBTableView1.DataController.DataSource:=nil;
  with DM.DSet2 do
   begin
    SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
    SQLs.RefreshSQL.Text := 'SELECT * FROM Z_NONSPISOK_S_BY_ID('+VarToStr(Res)+')';
    Insert;
    Post;
    Grid2DBTableView1.DataController.LocateByKey(Res);
   end;
  Grid2DBTableView1.DataController.DataSource:=DM.DSource2;
 end;
end;

procedure TFZNonSpisok.UpdateBtnClick(Sender: TObject);
var Parameter:TNonSpisokControlParameter;
    Res:Variant;
begin
Parameter.Owner:=self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsUpdate;
Parameter.Id:=DM.DSet2['ID'];
Res:=LoadNonSpisokControl(Parameter);
If not VarIsNull(Res) then
  with DM.DSet2 do
   begin
    SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';
    SQLs.RefreshSQL.Text := 'SELECT * FROM Z_NONSPISOK_S_BY_ID('+VarToStr(Res)+')';
    Edit;
    Post;
    Grid2DBTableView1.DataController.LocateByKey(Res);
   end;
end;

procedure TFZNonSpisok.DeleteBtnClick(Sender: TObject);
var Parameter:TNonSpisokControlParameter;
begin
Parameter.Owner:=self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsDelete;
Parameter.Id:=DM.DSet2['ID'];
if not VarIsNULL(LoadNonSpisokControl(Parameter)) then
  with DM.DSet2 do
   begin
    SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
    Delete;
    Grid2DBTableView1.DataController.LocateByKey(DM.DSet2['ID'] );
   end;
end;

procedure TFZNonSpisok.DetailBtnClick(Sender: TObject);
var Parameter:TNonSpisokControlParameter;
begin
Parameter.Owner:=self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsShowDetails;
Parameter.Id:=DM.DSet2['ID'];
LoadNonSpisokControl(Parameter);
end;

procedure TFZNonSpisok.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
InsertBtn.Enabled := not (AFocusedRecord=nil);
Grid2DBTableView1FocusedRecordChanged(Grid2DBTableView1,nil,Grid2DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFZNonSpisok.Grid2ClKodSetup2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZNonSpisok.Panel3Resize(Sender: TObject);
begin
 EditCategory.Width   := Max(100,Panel3.Width-103);
 EditDepartment.Width := Max(100,Panel3.Width-103);
 EditSmeta.Width      := Max(100,Panel3.Width-103);
end;

procedure TFZNonSpisok.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFZNonSpisok.AcctCardBtnClick(Sender: TObject);
begin
     if (DM.DSet1.RecordCount > 0)
     then PackageLoad.LoadSpAllPeopleEditForm(Self,DM.DB.Handle,DM.DSet1['ID_MAN'],True);
end;

procedure TFZNonSpisok.Grid1DBTableView1DBColumn1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Man:variant;
begin
    if DM.DSet1.RecordCount>0
    then
    begin
      PackageLoad.LoadTnAccess(Self,DM.DB.Handle,DM.DSet1['id_man']);

      Man := DM.DSet1['ID_MAN'];
      if (Man<>null) then
      begin
        DM.DSet2.Close;
        DM.DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_NONSPISOK_PEOPLE_BY_ID_MAN('+VarToStr(Man)+')';
        DM.DSet1.Refresh;
        DM.DSet2.Open;
      end;
             //RefreshBtnClick(self);
    end;

end;

procedure TFZNonSpisok.AccBtnClick(Sender: TObject);
begin
   LoadDateAcc2(PAOwner, DM.DB.Handle, pKodSetupBeg, pKodSetupBeg, DM.DSet1['ID_MAN']);
end;

end.
