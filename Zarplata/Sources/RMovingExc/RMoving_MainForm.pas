unit RMoving_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls,
  dxStatusBar, ZcxLocateBar, zMessages, Registry, cxGridBandedTableView,
  cxGridDBBandedTableView, z_dmCommonStyles, rMoving_Ctrl, zcxFilterBar,
  cxCheckBox;

type
  TFZRmovingExc = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    cxSplitter1: TcxSplitter;
    DetailBtn: TdxBarLargeButton;
    PanelCurrent: TPanel;
    Grid3: TcxGrid;
    Grid3DBTableView1: TcxGridDBTableView;
    Grid3Level1: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    Grid3ClDateBeg: TcxGridDBColumn;
    Grid3ClDateEnd: TcxGridDBColumn;
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
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    DSet4: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DSource1: TDataSource;
    DSource2: TDataSource;
    DSource4: TDataSource;
    Grid2: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2ClPeriodBeg: TcxGridDBColumn;
    Grid2ClPeriodEnd: TcxGridDBColumn;
    Grid2ClNameSovmest: TcxGridDBColumn;
    Grid2Level1: TcxGridLevel;
    DSet3: TpFIBDataSet;
    DSource3: TDataSource;
    Grid2DBBandedTableView1: TcxGridDBBandedTableView;
    Grid22ClDateBeg: TcxGridDBBandedColumn;
    Grid22ClDateEnd: TcxGridDBBandedColumn;
    Grid2Level4: TcxGridLevel;
    Grid22ClNameSovmest: TcxGridDBBandedColumn;
    Grid22ClNamePost: TcxGridDBBandedColumn;
    FilterBarDockControl: TdxBarDockControl;
    PostFilterPanel: TPanel;
    PostFilterCheckBox: TcxCheckBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure Grid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure Grid_CurrentRMoving_Column_KodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid_Current_Column_KodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Grid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure SystemActionExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AddManBtnClick(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender:TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure Grid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure PostFilterCheckBoxPropertiesChange(Sender: TObject);
    procedure DSet3FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DSet2FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DSet1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    pStylesDm:TStylesDM;
    PBarFilter:TzFilterBarPeriods;
    pKodSetupBeg:integer;
    pKodSetupEnd:integer;
    pRMoving:integer;

    pDateBeg:TDate;
    pDateEnd:TDate;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;RMoving:Integer);reintroduce;
  end;

implementation

uses Math, DateUtils, ZWait;

{$R *.dfm}

constructor TFZRmovingExc.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;RMoving:Integer);
var i:byte;
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
// RMoving:=0;
 pRMoving:=RMoving;
//******************************************************************************
 Caption            := Exception_Caption[PLanguageIndex];
 AddManBtn.Caption  := AddManBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
 ExitBtn.Caption    := ExitBtn_Caption[PLanguageIndex];
 InsertBtn.Caption  := InsertBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption  := UpdateBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption  := DeleteBtn_Caption[PLanguageIndex];
 DetailBtn.Caption  := DetailBtn_Caption[PLanguageIndex];
 FilterBtn.Caption  := FilterBtn_Caption[PLanguageIndex];
 LineViewBtn.Caption:= LineViewBtn_Caption[PLanguageIndex];

 if pRMoving=0 then
  begin
//******************************************************************************
 Grid1ClTn.Caption        := GridClTn_Caption[PLanguageIndex];
 Grid1ClFIO.Caption       := GridClFIO_Caption[PLanguageIndex];
//******************************************************************************
 Grid2ClPeriodBeg.Caption := GridClBegPeriod_Caption[PLanguageIndex];
 Grid2ClPeriodEnd.Caption := GridClEndPeriod_Caption[PLanguageIndex];
 Grid2ClNameSovmest.Caption := GridClNameSovmest_Caption[PLanguageIndex];
 Grid22ClDateBeg.Caption  := GridClBegPeriod_Caption[PLanguageIndex];
 Grid22ClDateEnd.Caption  := GridClEndPeriod_Caption[PLanguageIndex];
 Grid22ClNameSovmest.Caption := GridClNameSovmest_Caption[PLanguageIndex];
 Grid22ClNamePost.Caption := LabelPost_Caption[PLanguageIndex];
//******************************************************************************
 Grid3ClDateBeg.Caption   :=  GridClBegPeriod_Caption[PLanguageIndex];
 Grid3ClDateEnd.Caption   :=  GridClEndPeriod_Caption[PLanguageIndex];
//******************************************************************************
 dxStatusBar1.Panels[0].Text   := AddManBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[1].Text   := InsertBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[2].Text   := UpdateBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[3].Text   := DeleteBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[4].Text   := DetailBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[5].Text   := RefreshBtn_Hint[PLanguageIndex];
 dxStatusBar2.Panels[0].Text   := FilterBtn_Hint[PLanguageIndex];
 dxStatusBar2.Panels[1].Text   := LocateBtn_Hint[PLanguageIndex];
 dxStatusBar2.Panels[2].Text   := LocateNextBtn_Hint[PLanguageIndex];
 dxStatusBar2.Panels[3].Text   := ExitBtn_Hint[PLanguageIndex];
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
//******************************************************************************
 pStylesDm := TStylesDM.Create(self);
 Grid1DBTableView1.Styles.StyleSheet := pStylesDm.GridTableViewStyleSheetDevExpress;
 Grid2DBTableView1.Styles.StyleSheet := pStylesDm.GridTableViewStyleSheetDevExpress;
 Grid2DBBandedTableView1.Styles.StyleSheet := pStylesDm.GridBandedTableViewStyleSheetDevExpress;
 Grid3DBTableView1.Styles.StyleSheet := pStylesDm.GridTableViewStyleSheetDevExpress;
//******************************************************************************
 cxSplitter3.Color         := Grid2DBTableView1.Styles.Header.Color;
//******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DSet1;
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
 WindowState := wsMaximized;
//******************************************************************************
 Grid2DBBandedTableView1.OptionsView.ColumnAutoWidth := False;
 Grid22ClDateBeg.Width         := (Grid2DBBandedTableView1.Bands[0].Width div 100)*10;
 Grid22ClDateEnd.Width         := (Grid2DBBandedTableView1.Bands[0].Width div 100)*10;
 Grid22ClNameSovmest.Width     := (Grid2DBBandedTableView1.Bands[0].Width div 100)*40;
 Grid22ClNamePost.Width        := (Grid2DBBandedTableView1.Bands[0].Width div 100)*40;
 Grid2DBBandedTableView1.OptionsView.ColumnAutoWidth := True;
//******************************************************************************
 DB.Handle                     := Db_Handle;
 pKodSetupBeg                  := CurrentKodSetup(DB.Handle);
 pKodSetupEnd                  := pKodSetupBeg;

 RefreshBtnClick(self);
//******************************************************************************
 PBarFilter                   := TzFilterBarPeriods.Create(BarManager);
 PBarFilter.KodSetupBeg       := pKodSetupBeg;
 PBarFilter.KodSetupEnd       := pKodSetupEnd;
 PBarFilter.Bar.BorderStyle   := bbsNone;
 PBarFilter.Bar.DockControl   := FilterBarDockControl;
 PBarFilter.FilterBtn.OnClick := FilterBtnClick;
//******************************************************************************
Grid2DBTableView1FocusedRecordChanged(Grid2DBTableView1,nil,Grid2DBTableView1.Controller.FocusedRecord,True);
//******************************************************************************
 PostFilterCheckBox.Checked:=true;
 PostFilterCheckBox.Properties.Caption:=PostFilterCheckBox_Caption[pLanguageIndex];
  end
 else
  begin
//******************************************************************************
   Grid3ClDateBeg.Caption   :=  GridClBegPeriod_Caption[PLanguageIndex];
   Grid3ClDateEnd.Caption   :=  GridClEndPeriod_Caption[PLanguageIndex];
//******************************************************************************
   pStylesDm := TStylesDM.Create(self);
   Grid3DBTableView1.Styles.StyleSheet := pStylesDm.GridTableViewStyleSheetDevExpress;
//******************************************************************************
   DB.Handle                     := Db_Handle;
   pKodSetupBeg                  := CurrentKodSetup(DB.Handle);
   pKodSetupEnd                  := pKodSetupBeg;
//******************************************************************************
   PanelPeople.Visible:=false;
   cxSplitter1.Visible:=false;
   cxSplitter3.Visible:=false;
   Grid2.Visible      :=false;
   PostFilterPanel.Visible:=false;
   AddManBtn.Visible:=ivNever;
   Grid3.Align:=alClient;
//******************************************************************************
   DSet4.SelectSQL.Text:='select FIO from Z_GET_MAN_BY_RMOVING('+IntToStr(pRMoving)+',NULL)';
   DSet4.Open;
   Caption:=DSet4.FieldByName('fio').AsString;
//******************************************************************************
   RefreshBtnClick(self);
//******************************************************************************
   dxStatusBar1.Panels[0].Text   := InsertBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[1].Text   := UpdateBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[2].Text   := DeleteBtn_Hint[PLanguageIndex];
   dxStatusBar2.Panels[0].Text   := RefreshBtn_Hint[PLanguageIndex];
   dxStatusBar2.Panels[1].Text   := DetailBtn_Hint[PLanguageIndex];
   dxStatusBar2.Panels[2].Text   := ExitBtn_Hint[PLanguageIndex];

   dxStatusBar1.Panels[5].Destroy;
   dxStatusBar1.Panels[4].Destroy;
   dxStatusBar1.Panels[3].Destroy;

   dxStatusBar2.Panels[5].Destroy;
   dxStatusBar2.Panels[4].Destroy;
   dxStatusBar2.Panels[3].Destroy;

   for i:=0 to dxStatusBar1.Panels.Count-1 do
     dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
//******************************************************************************
   Width:=400;
   FormStyle:=fsNormal;
   BorderStyle:=bsDialog;
   if ModalResult=mrNone then
     ShowModal;
//******************************************************************************
  end;
end;

procedure TFZRmovingExc.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZRmovingExc.Grid1DBTableView1KeyPress(Sender: TObject;
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

procedure TFZRmovingExc.Grid_CurrentRMoving_Column_KodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZRmovingExc.Grid_Current_Column_KodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZRmovingExc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if FormStyle=fsMDIChild then Action:=caFree;
if FormStyle=fsNormal then Action:=caFree;
end;

procedure TFZRmovingExc.Grid3DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
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

procedure TFZRmovingExc.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System Information',
             'ID_MAN = '+IfThen(DSet1.Active,VarToStr(DSet1['ID_MAN']),'0')+#13+
             'RMOVING = '+IfThen(DSet2.Active,VarToStr(DSet2['RMOVING']),'0')+#13+
             'ID = '+IfThen(DSet4.Active,VarToStr(DSet4['ID']),'0'),
              mtInformation,[mbOK]);
end;

procedure TFZRmovingExc.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TFZRmovingExc.AddManBtnClick(Sender: TObject);
var Man:variant;
begin
Man := LoadPeopleModal(self,db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DSet1.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DSet1.SQLs.RefreshSQL.Text  := 'SELECT * FROM Z_DATAPEOPLE_BY_ID_MAN('+VarToStr(Man[0])+')';
   DSet1.SQLs.InsertSQL.Text   := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   if DSet4.Active then DSet4.Close;
   if DSet3.Active then DSet3.Close;
   if DSet2.Active then DSet2.Close;
   DSet1.Insert;
   DSet1.Post;
   DSet1.SQLs.RefreshSQL.Clear;
   DSet1.SQLs.InsertSQL.Clear;
   DSet2.Open;
   DSet3.Open;
   DSet4.Open;
  end;
end;

procedure TFZRmovingExc.InsertBtnClick(Sender: TObject);
var id:integer;
begin

 if pRMoving=0 then
  id:=ShowRmovingExcCtrlForm(self,DB.Handle,zcfsInsert,DSet2['RMOVING'])
 else
  id:=ShowRmovingExcCtrlForm(self,DB.Handle,zcfsInsert,pRMoving);
 if id>0 then
  begin
   DSet4.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
   DSet4.SQLs.RefreshSQL.Text := 'select * from Z_RMOVING_EXC_S_BY_ID('+IntToStr(id)+')';
   DSet4.Insert;
   DSet4.Post;
   DSet4.SQLs.InsertSQL.Clear;
   DSet4.SQLs.RefreshSQL.Clear;
  end;
end;

procedure TFZRmovingExc.UpdateBtnClick(Sender: TObject);
var id:integer;
begin
 id:=ShowRmovingExcCtrlForm(self,DB.Handle,zcfsUpdate,DSet4['ID']);
 if id>0 then
  begin
   DSet4.SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';
   DSet4.SQLs.RefreshSQL.Text := 'select * from Z_RMOVING_EXC_S_BY_ID('+IntToStr(id)+')';
   DSet4.Edit;
   DSet4.Post;
   DSet4.SQLs.UpdateSQL.Clear;
   DSet4.SQLs.RefreshSQL.Clear;
  end;
end;

procedure TFZRmovingExc.DetailBtnClick(Sender: TObject);
begin
ShowRmovingExcCtrlForm(self,DB.Handle,zcfsShowDetails,DSet4['ID']);
end;

procedure TFZRmovingExc.DeleteBtnClick(Sender: TObject);
begin
 if ShowRmovingExcCtrlForm(self,DB.Handle,zcfsDelete,DSet4['ID'])>0 then
  begin
   DSet4.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
   DSet4.Delete;
   DSet4.SQLs.DeleteSQL.Clear;
  end;
end;

procedure TFZRmovingExc.FilterBtnClick(Sender:TObject);
begin
 pKodSetupBeg := PBarFilter.KodSetupBeg;
 pKodSetupEnd := PBarFilter.KodSetupEnd;
 RefreshBtnClick(Sender);
end;

procedure TFZRmovingExc.RefreshBtnClick(Sender: TObject);
var wf:TForm;
begin
 wf:=ShowWaitForm(Application.MainForm);
 if pRMoving = 0 then
  begin
    if DSet4.Active then DSet4.Close;
    if DSet3.Active then DSet3.Close;
    if DSet2.Active then DSet2.Close;
    if DSet1.Active then DSet1.Close;
    DSet1.SQLs.SelectSQL.Text     := 'select * from Z_RMOVING_EXC_S_FIO('+IntToStr(pKodSetupBeg)+','+IntToStr(pKodSetupEnd)+') order by TN';
    DSet2.SQLs.SelectSQL.Text     := 'select * from Z_RMOVING_S_BY_ID_MAN(?ID_MAN) order by Date_beg descending';
    DSet3.SQLs.SelectSQL.Text     := 'select * from Z_MOVINGS_S_BY_ID_MAN(?ID_MAN) ';
    DSet4.SQLs.SelectSQL.Text     := 'select * from Z_RMOVING_EXC_S(?RMOVING) order by DATE_BEG';
    DSet1.Open;
    DSet2.Open;
    DSet3.Open;
    DSet4.Open;
  end
 else
  begin
    if DSet4.Active then DSet4.Close;
    DSet4.SQLs.SelectSQL.Text:='select * from Z_RMOVING_EXC_S('+IntToStr(pRMoving)+') order by DATE_BEG';
    DSet4.Open;
  end;
 CloseWaitForm(wf);
end;

procedure TFZRmovingExc.Grid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
InsertBtn.Enabled := not(AFocusedRecord=nil);
Grid3DBTableView1FocusedRecordChanged(Grid3DBTableView1,nil,Grid3DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFZRmovingExc.PostFilterCheckBoxPropertiesChange(
  Sender: TObject);
begin
  if PostFilterCheckBox.Checked then
   begin
    if PBarFilter.KodSetupBeg<=PBarFilter.KodSetupEnd then
     begin
      pDateBeg:=ConvertKodToDate(PBarFilter.KodSetupBeg);
      pDateEnd:=ConvertKodToDate(PBarFilter.KodSetupEnd+1)-1;
     end
    else
     begin
      pDateBeg:=ConvertKodToDate(PBarFilter.KodSetupEnd);
      pDateEnd:=ConvertKodToDate(PBarFilter.KodSetupBeg+1)-1;
     end;
     DSet3.Filtered:=true;
     DSet2.Filtered:=true;
//     DSet1.Filtered:=true;
   end
  else
   begin
    DSet3.Filtered:=false;
    DSet2.Filtered:=false;
//    DSet1.Filtered:=false;
   end;
end;

procedure TFZRmovingExc.DSet3FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
BpB,BpE,EpB,EpE: boolean;
begin
  Accept:=FALSE;
  BpB:=CompareDate(DSet3.FieldByName('DATE_BEG').AsDateTime,pDateBeg)>-1;
  BpE:=CompareDate(DSet3.FieldByName('DATE_BEG').AsDateTime,pDateEnd)<1;
  EpB:=CompareDate(DSet3.FieldByName('DATE_END').AsDateTime,pDateBeg)>-1;
  EpE:=CompareDate(DSet3.FieldByName('DATE_END').AsDateTime,pDateEnd)<1;
  if  ((BpB and BpE) or (EpB and EpE))
    or (not(BpB) and not(EpE)) then Accept:=true;
end;

procedure TFZRmovingExc.DSet2FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
BpB,BpE,EpB,EpE: boolean;
begin
  Accept:=FALSE;
  BpB:=CompareDate(DSet2.FieldByName('DATE_BEG').AsDateTime,pDateBeg)>-1;
  BpE:=CompareDate(DSet2.FieldByName('DATE_BEG').AsDateTime,pDateEnd)<1;
  EpB:=CompareDate(DSet2.FieldByName('DATE_END').AsDateTime,pDateBeg)>-1;
  EpE:=CompareDate(DSet2.FieldByName('DATE_END').AsDateTime,pDateEnd)<1;
  if  ((BpB and BpE) or (EpB and EpE))
    or (not(BpB) and not(EpE)) then Accept:=true;
end;


procedure TFZRmovingExc.DSet1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  DSet2.Close;
  DSet2.Open;
  DSet4.Close;
  DSet4.Open;
  if DSet2.VisibleRecNo>0 then
    Accept:=true
  else
    Accept:=false;
end;

end.
