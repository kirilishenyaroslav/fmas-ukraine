unit Current_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, Current_DM,
  dxStatusBar, ZcxLocateBar, zMessages, Current_Filter, Current_LineView,
  Registry, Menus;

type
  TFZCurrent = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
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
    DetailBtn: TdxBarLargeButton;
    PanelCurrent: TPanel;
    Grid2: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2Level1: TcxGridLevel;
    PanelDopData: TPanel;
    EditDepartment: TcxDBMaskEdit;
    EditCategory: TcxDBMaskEdit;
    EditSmeta: TcxDBMaskEdit;
    LSmeta: TcxLabel;
    LDepartment: TcxLabel;
    LCategory: TcxLabel;
    cxSplitter3: TcxSplitter;
    Grid2ClKodSetup: TcxGridDBColumn;
    Grid2ClVidOpl: TcxGridDBColumn;
    Grid2ClVo: TcxGridDBColumn;
    Grid2ClSmeta: TcxGridDBColumn;
    Grid2ClDepartment: TcxGridDBColumn;
    Grid2ClSumma: TcxGridDBColumn;
    dxStatusBar2: TdxStatusBar;
    PanelPeople: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClTn: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    ActionList: TActionList;
    SystemAction: TAction;
    FilterBtn: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    LineViewBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    Grid2ClPeriod: TcxGridDBColumn;
    Grid2ClSovmest: TcxGridDBColumn;
    GroupBtn: TdxBarLargeButton;
    Grid2DBTableView1DBColumn1: TcxGridDBColumn;
    EditEnterDate: TcxDBMaskEdit;
    EditPrikaz1: TcxDBMaskEdit;
    EditNDay: TcxDBMaskEdit;
    EditClock: TcxDBMaskEdit;
    EditPercent: TcxDBMaskEdit;
    EditSumClock: TcxDBMaskEdit;
    LPercent: TcxLabel;
    LSumClock: TcxLabel;
    LNDay: TcxLabel;
    LClock: TcxLabel;
    LPrikaz: TcxLabel;
    LEnterDate: TcxLabel;
    AccBtn: TdxBarLargeButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure Grid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure Grid_CurrentRMoving_Column_KodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid_Current_Column_KodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure AddManBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Grid2ClKodSetupGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure SystemActionExecute(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure Grid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure LineViewBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GroupBtnClick(Sender: TObject);
    procedure EditCategoryPropertiesChange(Sender: TObject);
    procedure EditDepartmentPropertiesChange(Sender: TObject);
    procedure EditSmetaPropertiesChange(Sender: TObject);
    procedure EditEnterDatePropertiesChange(Sender: TObject);
    procedure EditPrikaz1PropertiesChange(Sender: TObject);
    procedure EditNDayPropertiesChange(Sender: TObject);
    procedure EditClockPropertiesChange(Sender: TObject);
    procedure EditPercentPropertiesChange(Sender: TObject);
    procedure EditSumClockPropertiesChange(Sender: TObject);
    procedure AccBtnClick(Sender: TObject);
  private
    DM:TDM;
    PAOwner:TComponent;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    PCurrentFilter:TzCurrentFilter;
    pKodSetupBeg,pKodSetupCurrent:Integer;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ACurrentFilter:TzCurrentFilter);reintroduce;
  end;

implementation

uses Math, ZWait;

{$R *.dfm}

constructor TFZCurrent.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ACurrentFilter:TzCurrentFilter);
var
  i:byte;
  wf:TForm;
begin
  inherited Create(AOwner);
  PLanguageIndex:=LanguageIndex;

  PAOwner       := AOwner;
//******************************************************************************
  Caption                   := GetConst('Current',tcForm);
  AddManBtn.Caption         := GetConst('AddMan',tcButton);
  RefreshBtn.Caption        := GetConst('Refresh',tcButton);
  ExitBtn.Caption           := GetConst('Exit',tcButton);
  InsertBtn.Caption         := GetConst('Insert',tcButton);
  UpdateBtn.Caption         := GetConst('Update',tcButton);
  DeleteBtn.Caption         := GetConst('Delete',tcButton);
  DetailBtn.Caption         := GetConst('Detail',tcButton);
  FilterBtn.Caption         := GetConst('Filter',tcButton);
  LineViewBtn.Caption       := GetConst('LineView',tcButton);
  GroupBtn.Caption          := GetConst('Group',tcButton);
  AccBtn.Caption          := 'Перегляд розрахунку';
//******************************************************************************
  Grid1ClTn.Caption         := GetConst('Tn',tcGridColumn);
  Grid1ClFIO.Caption        := GetConst('FIO',tcGridColumn);
//******************************************************************************
  Grid2ClKodSetup.Caption   := GetConst('KodSetup',tcGridColumn);
  Grid2ClDepartment.Caption := GetConst('KodDepartment',tcGridColumn);
  Grid2ClSumma.Caption      := GetConst('Summa',tcGridColumn);
  Grid2ClSmeta.Caption      := GetConst('KodSmeta',tcGridColumn);
  Grid2ClVo.Caption         := GetConst('KodVidopl',tcGridColumn);
  Grid2ClVidOpl.Caption     := GetConst('NameVidopl',tcGridColumn);
  Grid2ClPeriod.Caption     := GetConst('WorkPeriod',tcGridColumn);
  Grid2ClSovmest.Caption    := GetConst('Sovmest',tcGridColumn);

//******************************************************************************
  LSmeta.Caption        := GetConst('Smeta',tcLabel);
  LDepartment.Caption   := GetConst('Department',tcLabel);
  LCategory.Caption     := GetConst('Category',tcLabel);
  LEnterDate.Caption                 := GetConst('EnterDate',tcLabel);
  LPrikaz.Caption                    := GetConst('Prikaz',tcLabel);
  LNDay.Caption                      := GetConst('NDay',tcLabel);
  LClock.Caption                     := GetConst('Clock',tcLabel);
  LPercent.Caption                   := GetConst('Percent',tcLabel);
  LSumClock.Caption                  := GetConst('SumClock',tcLabel);
//******************************************************************************
  cxSplitter3.Color         := Grid2DBTableView1.Styles.Header.Color;
  PanelDopData.Color        := Grid2DBTableView1.Styles.Background.Color;
//******************************************************************************
  dxStatusBar1.Panels[0].Text   := ShortCutToText(AddManBtn.ShortCut)+' - '+AddManBtn.Caption;
  dxStatusBar1.Panels[1].Text   := ShortCutToText(InsertBtn.ShortCut)+' - '+InsertBtn.Caption;
  dxStatusBar1.Panels[2].Text   := ShortCutToText(UpdateBtn.ShortCut)+' - '+UpdateBtn.Caption;
  dxStatusBar1.Panels[3].Text   := ShortCutToText(DeleteBtn.ShortCut)+' - '+DeleteBtn.Caption;
  dxStatusBar1.Panels[4].Text   := ShortCutToText(DetailBtn.ShortCut)+' - '+DetailBtn.Caption;
  dxStatusBar1.Panels[5].Text   := ShortCutToText(RefreshBtn.ShortCut)+' - '+RefreshBtn.Caption;
  dxStatusBar2.Panels[0].Text   := ShortCutToText(FilterBtn.ShortCut)+' - '+FilterBtn.Caption;
  dxStatusBar2.Panels[1].Text   := ShortCutToText(LineViewBtn.ShortCut)+' - '+LineViewBtn.Caption;
  dxStatusBar2.Panels[4].Text   := ShortCutToText(ExitBtn.ShortCut)+' - '+ExitBtn.Caption;

  pKodSetupBeg                  := CurrentKodSetup(Db_Handle);
  pKodSetupCurrent              := CurrentKodSetup(Db_Handle);

  for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
  for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
//******************************************************************************
  PCurrentFilter:=ACurrentFilter;
  try
   wf:=ShowWaitForm(Application.MainForm);
   DM := TDM.Create(self,Db_Handle,PCurrentFilter);
  finally
   CloseWaitForm(wf);
  end;
//******************************************************************************
  Grid1ClTn.DataBinding.FieldName  := 'TN';
  Grid1ClFIO.DataBinding.FieldName := 'FIO';
  Grid1DBTableView1.DataController.DataSource := DM.DSource1;
//******************************************************************************
  Grid2ClKodSetup.DataBinding.FieldName   := 'KOD_SETUP';
  Grid2ClDepartment.DataBinding.FieldName := 'KOD_DEPARTMENT';
  Grid2ClSumma.DataBinding.FieldName      := 'SUMMA';
  Grid2ClSmeta.DataBinding.FieldName      := 'SMETA_KOD';
  Grid2ClVo.DataBinding.FieldName         := 'VIDOPL_KOD';
  Grid2ClVidOpl.DataBinding.FieldName     := 'VIDOPL_NAME';
  Grid2DBTableView1.DataController.DataSource := DM.DSource3;
//******************************************************************************
  EditSmeta.DataBinding.DataSource      := DM.DSource3;
  EditDepartment.DataBinding.DataSource := DM.DSource3;
  EditCategory.DataBinding.DataSource   := DM.DSource3;
  EditEnterDate.DataBinding.DataSource  := DM.DSource3;
  EditPrikaz1.DataBinding.DataSource    := DM.DSource3;
  EditNDay.DataBinding.DataSource       := DM.DSource3;
  EditClock.DataBinding.DataSource      := DM.DSource3;
  EditPercent.DataBinding.DataSource    := DM.DSource3;
  EditSumClock.DataBinding.DataSource   := DM.DSource3;
//******************************************************************************
  EditSmeta.DataBinding.DataField      := 'SMETA_NAME';
  EditDepartment.DataBinding.DataField := 'NAME_DEPARTMENT';
  EditCategory.DataBinding.DataField   := 'CATEGORY_NAME';
//******************************************************************************
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
  PBarLocate.DockControl  := BarDockLocate;

  dxStatusBar2.Panels[2].Text   := ShortCutToText(PBarLocate.LocateBtn.ShortCut)+' - '+PBarLocate.LocateBtn.Caption;
  dxStatusBar2.Panels[3].Text   := ShortCutToText(PBarLocate.LocateNextBtn.ShortCut)+' - '+PBarLocate.LocateNextBtn.Caption;
//******************************************************************************
  WindowState := wsMaximized;
end;

procedure TFZCurrent.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZCurrent.Grid1DBTableView1KeyPress(Sender: TObject;
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

procedure TFZCurrent.Grid_CurrentRMoving_Column_KodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZCurrent.Grid_Current_Column_KodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZCurrent.InsertBtnClick(Sender: TObject);
var Parameter:TZCurrentParameters;
    ResLoad:Variant;
begin
if DM.DSet1.IsEmpty then Exit;
if not InsertBtn.Enabled then Exit;
//Parameter.ID:=IfThen(VarIsNull(DM.DSet2['RMOVING']),0,DM.DSet2['RMOVING']);
Parameter.ID:=IfThen(VarIsNull(DM.DSet1['ID_MAN']),0,DM.DSet1['ID_MAN']);
Parameter.TypeID:=zcptRMoving;
Parameter.Owner:=Self;
Parameter.ControlFormStyle:=zcfsInsert;
Parameter.Db_Handle:=DM.DB.Handle;
resload:=LoadCurrentControl(Parameter);
if VarArrayDimCount(ResLoad)>0 then
 if ResLoad[0]=mrYes then
  begin
   DM.DSet3.CloseOpen(True);
   Grid2DBTableView1.DataController.LocateByKey(ResLoad[1]);
  end;
end;

procedure TFZCurrent.UpdateBtnClick(Sender: TObject);
var Parameter:TZCurrentParameters;
    ResLoad:Variant;
begin
if DM.DSet3.IsEmpty then Exit;
if not UpdateBtn.Enabled then Exit;
Parameter.ID:=IfThen(VarIsNull(DM.DSet3['ID_CURRENT']),0,DM.DSet3['ID_CURRENT']);
Parameter.TypeID:=zcptRMoving;
Parameter.Owner:=Self;
Parameter.ControlFormStyle:=zcfsUpdate;
Parameter.Db_Handle:=DM.DB.Handle;
resload:=LoadCurrentControl(Parameter);
if VarArrayDimCount(ResLoad)>0 then
 if ResLoad[0]=mrYes then
  begin
   DM.DSet3.CloseOpen(True);
   Grid2DBTableView1.DataController.LocateByKey(Parameter.ID);
  end;
end;

procedure TFZCurrent.DeleteBtnClick(Sender: TObject);
var Parameter:TZCurrentParameters;
    ResLoad:Variant;
begin
if DM.DSet3.IsEmpty then Exit;
if not DeleteBtn.Enabled then Exit;
Parameter.ID:=IfThen(VarIsNull(DM.DSet3['ID_CURRENT']),0,DM.DSet3['ID_CURRENT']);
Parameter.TypeID:=zcptIdCurrent;
Parameter.Owner:=Self;
Parameter.Db_Handle:=DM.DB.Handle;
Parameter.ControlFormStyle:=zcfsDelete;
ResLoad:=LoadCurrentControl(Parameter);
If  VarArrayDimCount(ResLoad)>0 then
 if ResLoad[0]=mrYes then
  begin
   DataSetCloseOpen(DM.DSet3);
   Grid2DBTableView1.DataController.LocateByKey(Dm.DSet3['ID_CURRENT']);
  end;
end;

procedure TFZCurrent.DetailBtnClick(Sender: TObject);
var Parameter:TZCurrentParameters;
begin
if DM.DSet3.IsEmpty then Exit;
if not DetailBtn.Enabled then Exit;
Parameter.ID:=IfThen(VarIsNull(DM.DSet3['ID_CURRENT']),0,DM.DSet3['ID_CURRENT']);
Parameter.TypeID:=zcptIdCurrent;
Parameter.Owner:=Self;
Parameter.ControlFormStyle:=zcfsShowDetails;
Parameter.Db_Handle:=DM.DB.Handle;
LoadCurrentControl(Parameter);
end;

procedure TFZCurrent.AddManBtnClick(Sender: TObject);
var Man:variant;
begin
Man := LoadPeopleModal(self,Dm.db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DM.DSet1.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DM.DSet3.Close;
   DM.DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_DATAPEOPLE_BY_ID_MAN('+VarToStr(Man[0])+')';
   DM.DSet1.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   DM.DSet1.Insert;
   DM.DSet1.Post;
   if not DM.DSet1.IsEmpty then DM.DSet3.Open;
  end;
end;

procedure TFZCurrent.FormClose(Sender: TObject; var Action: TCloseAction);
var reg:TRegistry;
begin
if FormStyle=fsMDIChild then Action:=caFree;

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if reg.OpenKey('\Software\Zarplata\CurrentCtrl\',False) then
     reg.WriteInteger('IsBuffer',0);
 finally
  reg.Free;
 end;
end;

procedure TFZCurrent.Grid2ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText := KodSetupToPeriod(StrToInt(AText),1);
end;

procedure TFZCurrent.Grid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DetailBtn.Enabled := False;
  EditCategory.DataBinding.DataSource   := nil;
  EditDepartment.DataBinding.DataSource := nil;
  EditSmeta.DataBinding.DataSource      := nil;
  EditEnterDate.DataBinding.DataSource  := nil;
  EditPrikaz1.DataBinding.DataSource    := nil;
  EditNDay.DataBinding.DataSource       := nil;
  EditClock.DataBinding.DataSource      := nil;
  EditPercent.DataBinding.DataSource    := nil;
  EditSumClock.DataBinding.DataSource   := nil;
 end
else
 begin
  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
  EditCategory.DataBinding.DataSource   := DM.DSource3;
  EditDepartment.DataBinding.DataSource := DM.DSource3;
  EditSmeta.DataBinding.DataSource      := DM.DSource3;
  EditEnterDate.DataBinding.DataSource  := DM.DSource3;
  EditPrikaz1.DataBinding.DataSource    := DM.DSource3;
  EditNDay.DataBinding.DataSource       := DM.DSource3;
  EditClock.DataBinding.DataSource      := DM.DSource3;
  EditPercent.DataBinding.DataSource    := DM.DSource3;
  EditSumClock.DataBinding.DataSource   := DM.DSource3;
 end;
end;

procedure TFZCurrent.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System Information',
             'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'0')+#13+
             'RMOVING = '+IfThen(DM.DSet3.Active,VarToStr(DM.DSet3['RMOVING']),'0')+#13+
             'ID_CURRENT = '+IfThen(DM.DSet3.Active,VarToStr(DM.DSet3['ID_CURRENT']),'0'),
              mtInformation,[mbOK]);
end;

procedure TFZCurrent.FilterBtnClick(Sender: TObject);
var wf:TForm;
begin
PCurrentFilter:=ViewFilter(Self,DM.DB.Handle,PCurrentFilter);
if PCurrentFilter.ModalResult=mrYes then
 with DM do
 try
  wf:=ShowWaitForm(Self);
  pKodSetupBeg := PCurrentFilter.Kod_Setup1;
  if DSet3.Active then DSet3.Close;
  if DSet1.Active then DSet1.Close;
  DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CURRENT_SELECT_FIO('+
                                IfThen(PCurrentFilter.Is_KodSetup,IntToStr(PCurrentFilter.Kod_Setup1)+','+
                                                                IntToStr(PCurrentFilter.Kod_Setup2),'NULL,NULL')+','+
                                IfThen(PCurrentFilter.Is_Man,IntToStr(PCurrentFilter.Id_man),'NULL')+','+
                                IfThen(PCurrentFilter.Is_Department,IntToStr(PCurrentFilter.Id_department),'NULL')+','+
                                IfThen(PCurrentFilter.Is_VidOpl,IntToStr(PCurrentFilter.Id_VidOpl),'NULL')+','+
                                IfThen(PCurrentFilter.Is_Smeta,IntToStr(PCurrentFilter.Id_smeta),'NULL')+','+
                                IfThen(PCurrentFilter.Is_Prikaz,''''+StringPrepareToQueryText(PCurrentFilter.Prikaz)+'''','NULL')+') ORDER BY TN';
  if PCurrentFilter.Is_OperationsFilter then
   DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CURRENT_SELECT_DATA(?ID_MAN,'+
                                 IfThen(PCurrentFilter.Is_KodSetup,IntToStr(PCurrentFilter.Kod_Setup1)+','+
                                                                 IntToStr(PCurrentFilter.Kod_Setup2),'NULL,NULL')+','+
                                 IfThen(PCurrentFilter.Is_Department,IntToStr(PCurrentFilter.Id_department),'NULL')+','+
                                 IfThen(PCurrentFilter.Is_VidOpl,IntToStr(PCurrentFilter.Id_VidOpl),'NULL')+','+
                                 IfThen(PCurrentFilter.Is_Smeta,IntToStr(PCurrentFilter.Id_smeta),'NULL')+','+
                                 IfThen(PCurrentFilter.Is_Prikaz,''''+StringPrepareToQueryText(PCurrentFilter.Prikaz)+'''','NULL')+') ORDER BY KOD_SETUP DESCENDING'
  else
   DSet3.SQLs.SelectSQL.Text := 'select * from Z_CURRENT_SELECT_DATA(?ID_MAN,NULL,NULL,NULL,NULL,NULL,NULL) ORDER BY KOD_SETUP DESCENDING';
  DSet1.Open;
  if not DSet1.IsEmpty then DSet3.Open;
 finally
  CloseWaitForm(wf);
 end;
end;

procedure TFZCurrent.RefreshBtnClick(Sender: TObject);
var wf:TForm;
begin
wf:=ShowWaitForm(Self);
with DM do
 begin
  if DSet3.Active then DSet3.Close;
  if DSet1.Active then DSet1.Close;
  DSet1.Open;
  DSet3.Open;
 end;
CloseWaitForm(wf);
end;

procedure TFZCurrent.Grid3DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
InsertBtn.Enabled := not (AFocusedRecord=nil);
if PCurrentFilter.Is_OperationsFilter then
 Grid2DBTableView1.ViewData.Expand(True);
Grid2DBTableView1FocusedRecordChanged(Grid2DBTableView1,nil,Grid2DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFZCurrent.LineViewBtnClick(Sender: TObject);
begin
ViewLineCurrent(Self,DM.DB.Handle,PCurrentFilter);
end;

procedure TFZCurrent.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TFZCurrent.FormDestroy(Sender: TObject);
begin
if dm<>nil then DM.Destroy;
end;

procedure TFZCurrent.GroupBtnClick(Sender: TObject);
var i:integer;
begin
Grid2DBTableView1.OptionsView.GroupByBox := GroupBtn.Down;
if not Grid2DBTableView1.OptionsView.GroupByBox then
   for i:=0 to Grid2DBTableView1.ColumnCount-1 do
       Grid2DBTableView1.Columns[i].GroupIndex := -1;
end;

procedure TFZCurrent.EditCategoryPropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('CATEGORY_NAME').AsString = '' then
    begin
        LCategory.Visible:=False;
        EditCategory.Visible:=False;
    end else begin
        LCategory.Visible:=True;
        EditCategory.Visible:=True;
    end;
end;

procedure TFZCurrent.EditDepartmentPropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('NAME_DEPARTMENT').AsString = '' then
    begin
        LDepartment.Visible:=False;
        EditDepartment.Visible:=False;
    end else begin
        LDepartment.Visible:=True;
        EditDepartment.Visible:=True;
    end;
end;

procedure TFZCurrent.EditSmetaPropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('SMETA_NAME').AsString = '' then
    begin
        LSmeta.Visible:=False;
        EditSmeta.Visible:=False;
    end else begin
        LSmeta.Visible:=True;
        EditSmeta.Visible:=True;
    end;
end;

procedure TFZCurrent.EditEnterDatePropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('insert_date').AsString = '' then
    begin
        LEnterDate.Visible:=False;
        EditEnterDate.Visible:=False;
    end else begin
        LEnterDate.Visible:=True;
        EditEnterDate.Visible:=True;
    end;
end;

procedure TFZCurrent.EditPrikaz1PropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('OUT_PRIKAZ').AsString = '' then
    begin
        LPrikaz.Visible:=False;
        EditPrikaz1.Visible:=False;
    end else begin
        LPrikaz.Visible:=True;
        EditPrikaz1.Visible:=True;
    end;
end;

procedure TFZCurrent.EditNDayPropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('OUT_NDAY').AsString = '' then
    begin
        LNDay.Visible:=False;
        EditNDay.Visible:=False;
    end else begin
        LNDay.Visible:=True;
        EditNDay.Visible:=True;
    end;
end;

procedure TFZCurrent.EditClockPropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('OUT_CLOCK').AsString = '' then
    begin
        LClock.Visible:=False;
        EditClock.Visible:=False;
    end else begin
        LClock.Visible:=True;
        EditClock.Visible:=True;
    end;
end;

procedure TFZCurrent.EditPercentPropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('OUT_PERCENT').AsString = '' then
    begin
        LPercent.Visible:=False;
        EditPercent.Visible:=False;
    end else begin
        LPercent.Visible:=True;
        EditPercent.Visible:=True;
    end;
end;

procedure TFZCurrent.EditSumClockPropertiesChange(Sender: TObject);
begin
    if DM.DSet3.FieldByName('OUT_SUM_CLOCK').AsString = '' then
    begin
        LSumClock.Visible:=False;
        EditSumClock.Visible:=False;
    end else begin
        LSumClock.Visible:=True;
        EditSumClock.Visible:=True;
    end;
end;

procedure TFZCurrent.AccBtnClick(Sender: TObject);
begin
    LoadDateAcc2(PAOwner, DM.DB.Handle, pKodSetupCurrent, pKodSetupCurrent, DM.DSet1['ID_MAN']);
end;

end.
