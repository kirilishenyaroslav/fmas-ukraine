unit DopNach_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, DopNach_DM,
  dxStatusBar, ZcxLocateBar, zcxFilterBar, zMessages, cxGridBandedTableView,
  cxGridDBBandedTableView;

type
  TFZDopNach = class(TForm)
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
    PanelPeople: TPanel;
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
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    LineViewBtn: TdxBarLargeButton;
    Grid3: TcxGrid;
    Grid3DBTableView1: TcxGridDBTableView;
    Grid3ClVO: TcxGridDBColumn;
    Grid3ClVidOpl: TcxGridDBColumn;
    Grid3ClSumma: TcxGridDBColumn;
    Grid3ClDateBeg: TcxGridDBColumn;
    Grid3ClDateEnd: TcxGridDBColumn;
    Grid3Level1: TcxGridLevel;
    dxBarSubItem1: TdxBarSubItem;
    IndexChildHelpBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    Grid3ClBudget: TcxGridDBColumn;
    SplitterCurrent: TcxSplitter;
    PanelCurrentGroup: TPanel;
    cxMaskEditDepartment: TcxDBMaskEdit;
    LabelSmeta: TcxLabel;
    cxMaskEditSmeta: TcxDBMaskEdit;
    LabelKat: TcxLabel;
    cxMaskEditKategor: TcxDBMaskEdit;
    LabelPers: TcxLabel;
    cxMaskEditTypePepros: TcxDBMaskEdit;
    LabelDep: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    FilterBarDockControl: TdxBarDockControl;
    BarDockLocate: TdxBarDockControl;
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
    procedure FormDestroy(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure AccBtnClick(Sender: TObject);
  private
    DM:TDM;
    PAOwner:TComponent;
    PBarLocate:TZBarLocate;
    PBarFilter:TzFilterBarPeriods;
    PLanguageIndex:Byte;
    PKodSetup:integer;
    pKodSetupBeg:Integer;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math;

{$R *.dfm}

constructor TFZDopNach.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
 PAOwner       :=Aowner;
 pKodSetupBeg                  := CurrentKodSetup(Db_Handle);
//******************************************************************************
 Caption                    := ZDopNach_Caption[PLanguageIndex];
 AddManBtn.Caption          := AddManBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption         := RefreshBtn_Caption[PLanguageIndex];
 InsertBtn.Caption          := InsertBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption          := UpdateBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption          := DeleteBtn_Caption[PLanguageIndex];
 DetailBtn.Caption          := DetailBtn_Caption[PLanguageIndex];
 ExitBtn.Caption            := ExitBtn_Caption[PLanguageIndex];
 PrintBtn.Caption           := PrintBtn_Caption[PLanguageIndex];
  AccBtn.Caption          := 'Перегляд розрахунку';
//******************************************************************************
 Grid1ClTn.Caption          := GridClTn_Caption[PLanguageIndex];
 Grid1ClFIO.Caption         := GridClFIO_Caption[PLanguageIndex];
//******************************************************************************
 //Grid2ClPeriodBeg.Caption   := GridClBegPeriod_Caption[PLanguageIndex];
 //Grid2ClPeriodEnd.Caption   := GridClEndPeriod_Caption[PLanguageIndex];
 //Grid2ClNameSovmest.Caption := GridClNameSovmest_Caption[PLanguageIndex];
//******************************************************************************
 Grid3ClBudget.Caption      := GridClBudget_Caption[PLanguageIndex];
 Grid3ClVO.Caption          := GridClKodVidOpl_Caption[PLanguageIndex];
 Grid3ClVidOpl.Caption      := GridClNameVidopl_Caption[PLanguageIndex];
 Grid3ClSumma.Caption       := GridClSumma_Caption[PLanguageIndex];
 Grid3ClDateBeg.Caption     := GridClBegPeriod_Caption[PLanguageIndex];
 Grid3ClDateEnd.Caption     := GridClEndPeriod_Caption[PLanguageIndex];
//******************************************************************************

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
 DM := TDM.Create(self,Db_Handle);
 DM.KodSetupBeg := CurrentKodSetup(Db_Handle);
 DM.KodSetupEnd := DM.KodSetupBeg;
 DM.DataSetsReOpen;
//******************************************************************************
 PBarFilter := TzFilterBarPeriods.Create(BarManager);
 PBarFilter.Bar.DockControl := FilterBarDockControl;
 PBarFilter.KodSetupBeg := DM.KodSetupBeg;
 PBarFilter.KodSetupEnd := DM.KodSetupEnd;
 PBarFilter.Bar.BorderStyle := bbsNone;
 PBarFilter.FilterBtn.OnClick := FilterBtnClick;
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
//******************************************************************************
 PKodSetup:=CurrentKodSetup(DM.DB.Handle);
//******************************************************************************
 Grid1DBTableView1.DataController.DataSource := DM.DSource1;
 //Grid2DBTableView1.DataController.DataSource := DM.DSource2;
 Grid3DBTableView1.DataController.DataSource := DM.DSource3;
//******************************************************************************
 cxMaskEditDepartment.DataBinding.DataSource:=DM.DSource3;
 cxMaskEditDepartment.DataBinding.DataField:='NAME_FULL_DEP';
 cxMaskEditSmeta.DataBinding.DataSource:=DM.DSource3;
 cxMaskEditSmeta.DataBinding.DataField:='NAME_SMETA';
 cxMaskEditKategor.DataBinding.DataSource:=DM.DSource3;
 cxMaskEditKategor.DataBinding.DataField:='NAME_CATEGORY';
 cxMaskEditTypePepros.DataBinding.DataSource:=DM.DSource3;
 cxMaskEditTypePepros.DataBinding.DataField:='NAME_TYPE_POST';
//******************************************************************************
 WindowState := wsMaximized;
end;

procedure TFZDopNach.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZDopNach.Grid1DBTableView1KeyPress(Sender: TObject;
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

procedure TFZDopNach.AddManBtnClick(Sender: TObject);
var Man:variant;
begin
Man := LoadPeopleModal(self,Dm.db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DM.DSet1.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DM.DSet3.Close;
   DM.DSet2.Close;
   DM.DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_DATAPEOPLE_BY_ID_MAN('+VarToStr(Man[0])+')';
   DM.DSet1.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   DM.DSet1.Insert;
   DM.DSet1.Post;
   DM.DSet2.Open;
   if not DM.DSet2.IsEmpty then DM.DSet3.Open;
  end;
end;

procedure TFZDopNach.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZDopNach.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System Information',
             'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'0')+#13+
             'RMOVING = '+IfThen(DM.DSet2.Active,VarToStr(DM.DSet2['RMOVING']),'0')+#13+
             'ID_DOP_NACH = '+IfThen(DM.DSet3.Active,VarToStr(DM.DSet3['ID_DOP_NACH']),'0'),
              mtInformation,[mbOK]);
end;

procedure TFZDopNach.RefreshBtnClick(Sender: TObject);
begin
 DM.DataSetsReOpen;
end;

procedure TFZDopNach.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TFZDopNach.FilterBtnClick(Sender: TObject);
begin
 DM.KodSetupBeg := PBarFilter.KodSetupBeg;
 DM.KodSetupEnd := PBarFilter.KodSetupEnd;
 DM.DataSetsReOpen;
end;

procedure TFZDopNach.Grid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
InsertBtn.Enabled := not (AFocusedRecord=nil);
end;

procedure TFZDopNach.Grid3DBTableView1FocusedRecordChanged(
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

procedure TFZDopNach.InsertBtnClick(Sender: TObject);
var Parameter:TDopNachControlParameter;
    Value:Variant;
begin
Parameter.AOwner:=self;
Parameter.ADb_Handle:=Dm.DB.Handle;
Parameter.AControlFormStyle:=zcfsInsert;
Parameter.AId:=DM.DSet2['RMOVING'];
Value:=LoadDopNachControl(Parameter);
If Value<>NULL then
 begin
  DM.DSet3.CloseOpen(True);
  DM.DSet3.Locate('ID_DOP_NACH',Value,[loCaseInsensitive]);
 end;
end;

procedure TFZDopNach.UpdateBtnClick(Sender: TObject);
var Parameter:TDopNachControlParameter;
    Value:Variant;
begin
Parameter.AOwner:=self;
Parameter.ADb_Handle:=DM.DB.Handle;
Parameter.AControlFormStyle:=zcfsUpdate;
Parameter.AId:=DM.DSet3['ID_DOP_NACH'];

Value:=LoadDopNachControl(Parameter);
If Value<>NULL then
 begin
  DM.DSet3.CloseOpen(True);
  DM.DSet3.Locate('ID_DOP_NACH',Parameter.AId,[loCaseInsensitive]);
 end;
end;

procedure TFZDopNach.DeleteBtnClick(Sender: TObject);
var Parameter:TDopNachControlParameter;
    Value:Variant;
begin
Parameter.AOwner:=self;
Parameter.ADb_Handle:=DM.DB.Handle;
Parameter.AControlFormStyle:=zcfsDelete;
Parameter.AId:=DM.DSet3['ID_DOP_NACH'];
Value:=LoadDopNachControl(Parameter);
If Value<>NULL then
  DM.DSet3.CloseOpen(True);
end;

procedure TFZDopNach.DetailBtnClick(Sender: TObject);
var Parameter:TDopNachControlParameter;
begin
Parameter.AOwner:=self;
Parameter.ADb_Handle:=DM.DB.Handle;
Parameter.AControlFormStyle:=zcfsShowDetails;
Parameter.AId:=DM.DSet3['ID_DOP_NACH'];
LoadDopNachControl(Parameter);
end;

procedure TFZDopNach.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFZDopNach.PrintBtnClick(Sender: TObject);
begin
  DM.DoPrint;
end;

procedure TFZDopNach.AccBtnClick(Sender: TObject);
begin
      LoadDateAcc2(PAOwner, DM.DB.Handle, pKodSetupBeg, pKodSetupBeg, DM.DSet1['ID_MAN']);
end;

end.
