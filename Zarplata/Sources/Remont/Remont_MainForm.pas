unit Remont_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, Remont_DM,
  dxStatusBar, ZcxLocateBar, zMessages, cxGridBandedTableView,
  cxGridDBBandedTableView;

type
  TFZRemont = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
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
    Grid3Level1: TcxGridLevel;
    dxStatusBar1: TdxStatusBar;
    PanelPeople: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClTn: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    Grid2: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2Level1: TcxGridLevel;
    Splitter1: TSplitter;
    Grid2ClPeriodBeg: TcxGridDBColumn;
    Grid2ClPeriodEnd: TcxGridDBColumn;
    ActionList: TActionList;
    SystemAction: TAction;
    Grid3DBBandedTableView1: TcxGridDBBandedTableView;
    Grid3ClDayMonth: TcxGridDBBandedColumn;
    Grid3: TcxGrid;
    Grid3ClGHours: TcxGridDBBandedColumn;
    Grid3ClHours: TcxGridDBBandedColumn;
    Grid3ClTarifRemont: TcxGridDBBandedColumn;
    Grid3ClClockRemont: TcxGridDBBandedColumn;
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
    Grid3ClTarif: TcxGridDBBandedColumn;
    TableBtn: TdxBarLargeButton;
    SaveBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    dxStatusBar2: TdxStatusBar;
    DeleteBtn: TdxBarLargeButton;
    FilterBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    procedure ExitBtnClick(Sender: TObject);
    procedure Grid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure AddManBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SystemActionExecute(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Grid3ClGHoursGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid3DBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableBtnClick(Sender: TObject);
    procedure Grid3DBBandedTableView1DblClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure Grid3DBBandedTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SaveBtnClick(Sender: TObject);
    procedure Grid2DBTableView1DblClick(Sender: TObject);
    procedure Grid1DBTableView1DblClick(Sender: TObject);
    procedure Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Grid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    DM:TDM;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    PrMoving:Integer;
    PKodSetup:integer;
    PIsEdited:boolean;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math, ZWait;

{$R *.dfm}

constructor TFZRemont.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
  wf:TForm;
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption                    := ZRemont_Caption[PLanguageIndex];
 AddManBtn.Caption          := AddManBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption         := RefreshBtn_Caption[PLanguageIndex];
 TableBtn.Caption           := TableBtn_Caption[PLanguageIndex];
 SaveBtn.Caption            := SaveBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption          := UpdateBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption          := DeleteBtn_Caption[PLanguageIndex];
 FilterBtn.Caption          := FilterBtn_Caption[PLanguageIndex];
 ExitBtn.Caption            := ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
 Grid1ClTn.Caption          := GridClTn_Caption[PLanguageIndex];
 Grid1ClFIO.Caption         := GridClFIO_Caption[PLanguageIndex];
//******************************************************************************
 Grid2ClPeriodBeg.Caption   := GridClBegPeriod_Caption[PLanguageIndex];
 Grid2ClPeriodEnd.Caption   := GridClEndPeriod_Caption[PLanguageIndex];
//******************************************************************************
 Grid3ClGHours.Caption      := GridClGHours_Caption[PLanguageIndex];
 Grid3ClHours.Caption       := GridClHours_Caption[PLanguageIndex];
 Grid3ClTarifRemont.Caption := GridClTarif_Caption[PLanguageIndex];
 Grid3ClClockRemont.Caption := GridClClock_Caption[PLanguageIndex];
 Grid3ClTarif.Caption       := GridClTarif_Caption[PLanguageIndex];
 Grid3ClDayMonth.Caption    := GridClDayMonth_Caption[PLanguageIndex];
 Grid3DBBandedTableView1.Bands[2].Caption := ZRemont_Caption_Short[PLanguageIndex];
//******************************************************************************
 dxStatusBar1.Panels[0].Text:= AddManBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[1].Text:= TableBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[2].Text:= UpdateBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[3].Text:= DeleteBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[4].Text:= SaveBtn_Hint[PLanguageIndex];

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
 (Grid3ClTarifRemont.Properties as TcxMaskEditProperties).EditMask := '\d\d?\d?\d?\d?\d?(['+ZSystemDecimalSeparator+']\d\d?)?';
 (Grid3ClTarifRemont.Properties as TcxMaskEditProperties).MaskKind := emkRegExpr;
 (Grid3ClTarifRemont.Properties as TcxMaskEditProperties).ReadOnly := False;
 (Grid3ClClockRemont.Properties as TcxMaskEditProperties).EditMask := '\d\d?\d?\d?(['+ZSystemDecimalSeparator+']\d\d?\d?)?';
 (Grid3ClClockRemont.Properties as TcxMaskEditProperties).MaskKind := emkRegExpr;
 (Grid3ClClockRemont.Properties as TcxMaskEditProperties).ReadOnly := False;
//******************************************************************************
 Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[5].Format := Itogo_Caption[PLanguageIndex];
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
 PBarLocate.DockControl  := BarDockLocate;
//******************************************************************************
 PKodSetup:=CurrentKodSetup(DM.DB.Handle);
 Grid3DBBandedTableView1.Bands[1].Caption := KodSetupToPeriod(PKodSetup,1);
//******************************************************************************
 Grid1DBTableView1.DataController.DataSource := DM.DSource1;
 Grid2DBTableView1.DataController.DataSource := DM.DSource2;
 Grid3DBBandedTableView1.DataController.DataSource := DM.DSource3;
//******************************************************************************
 Grid1ClTn.DataBinding.FieldName := 'TN';
 Grid1ClFio.DataBinding.FieldName := 'FIO';
 Grid2ClPeriodBeg.DataBinding.FieldName := 'PERIOD_BEG';
 Grid2ClPeriodEnd.DataBinding.FieldName := 'PERIOD_END';
//******************************************************************************
 WindowState := wsMaximized;
 PIsEdited:=False;
//******************************************************************************
Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFZRemont.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZRemont.Grid1DBTableView1KeyPress(Sender: TObject;
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

procedure TFZRemont.AddManBtnClick(Sender: TObject);
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
//   if not DM.DSet2.IsEmpty then DM.DSet3.Open;
  end;
end;

procedure TFZRemont.FormClose(Sender: TObject; var Action: TCloseAction);
var ModalRes:TModalResult;
begin
if PIsEdited then
 begin
  ModalRes:=ZShowMessage(Confirm_Caption[PLanguageIndex],SaveDataQuestion_Text[PLanguageIndex],mtWarning,[mbYes,mbNo,mbCancel]);
  case ModalRes of
   mrYes:
    begin
     SaveBtnClick(Sender);
     if FormStyle=fsMDIChild then Action:=caFree;
    end;
   mrNo: if FormStyle=fsMDIChild then Action:=caFree;
   mrCancel: Action:=caNone;
  end;
 end
else
 if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZRemont.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System Information',
             'ID_MAN = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_MAN']),'0')+#13+
             'RMOVING = '+IfThen(DM.DSet2.Active,VarToStr(DM.DSet2['RMOVING']),'0'),
              mtInformation,[mbOK]);
end;

procedure TFZRemont.RefreshBtnClick(Sender: TObject);
var wf:TForm;
begin
 wf:=ShowWaitForm(Self);
 with DM do
  begin
   rxDSet3.EmptyTable;
   if DSet3.Active then DSet3.Close;
   if DSet2.Active then DSet2.Close;
   if DSet1.Active then DSet1.Close;
   DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REMONT_SELECT_FIO('+IntToStr(PKodSetup)+') ORDER BY TN';
   DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REMONT_S(?RMOVING,'+IntToStr(PKodSetup)+') ORDER BY DAYMONTH';
   DSet1.Open;
   DSet2.Open;
   Grid3DBBandedTableView1.Bands[1].Caption := KodSetupToPeriod(PKodSetup,1);
   Grid3DBBandedTableView1.Bands[0].Caption := '';
  end;
 CloseWaitForm(wf);
end;

procedure TFZRemont.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TFZRemont.Grid3ClGHoursGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if (AText='0') then AText:='';
end;

procedure TFZRemont.Grid3DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord=nil then
 begin
  UpdateBtn.Enabled:=False;
  DeleteBtn.Enabled:=False;
  SaveBtn.Enabled := False;
 end
else
 begin
  UpdateBtn.Enabled:=true;
  DeleteBtn.Enabled:=True;
  SaveBtn.Enabled := True;
 end;
Grid3DBBandedTableView1.OptionsSelection.CellSelect:=False;
end;

procedure TFZRemont.TableBtnClick(Sender: TObject);
var ModalRes:TModalResult;
begin
if PIsEdited then
 begin
  ModalRes:=ZShowMessage(Confirm_Caption[PLanguageIndex],SaveDataQuestion_Text[PLanguageIndex],mtWarning,[mbYes,mbNo,mbCancel]);
  case ModalRes of
   mrYes:
    begin
     SaveBtnClick(Sender);
     Grid3DBBandedTableView1.Bands[0].Caption := VarToStr(DM.DSet1['TN'])+' - '+VarToStr(DM.DSet1['FIO']);
     if (DM.DSet2.Active) and (not DM.DSet2.IsEmpty) then DM.DSet3.Open;
     PrMoving:=DM.DSet2['RMOVING'];
    end;
   mrNo:
    begin
     Grid3DBBandedTableView1.Bands[0].Caption := VarToStr(DM.DSet1['TN'])+' - '+VarToStr(DM.DSet1['FIO']);
     if (DM.DSet2.Active) and (not DM.DSet2.IsEmpty) then DM.DSet3.Open;
     PrMoving:=DM.DSet2['RMOVING'];
    end;
   mrCancel: Exit;
  end;
 end
else
 begin
  Grid3DBBandedTableView1.Bands[0].Caption := VarToStr(DM.DSet1['TN'])+' - '+VarToStr(DM.DSet1['FIO']);
  if (DM.DSet2.Active) and (not DM.DSet2.IsEmpty) then DM.DSet3.Open;
  PrMoving:=DM.DSet2['RMOVING'];
 end;
end;

procedure TFZRemont.Grid3DBBandedTableView1DblClick(Sender: TObject);
begin
 UpdateBtnClick(Sender);
end;

procedure TFZRemont.UpdateBtnClick(Sender: TObject);
begin
if Grid3DBBandedTableView1.Controller.FocusedRecord=nil then Exit;
Grid3.SetFocus;
if (VarIsNUll(Grid3DBBandedTableView1.Controller.FocusedRecord.Values[Grid3ClTarifRemont.Index]))
   or (VarToStr(Grid3DBBandedTableView1.Controller.FocusedRecord.Values[Grid3ClTarifRemont.Index])='') then
 begin
  DM.rxDSet3.Edit;
  DM.rxDSet3['TARIF_REMONT']:=DM.rxDSet3['TARIF'];
  DM.rxDSet3.Post;
  PIsEdited:=True;
 end;
if (VarIsNUll(Grid3DBBandedTableView1.Controller.FocusedRecord.Values[Grid3ClClockRemont.Index]))
   or (VarToStr(Grid3DBBandedTableView1.Controller.FocusedRecord.Values[Grid3ClClockRemont.Index])='') then
 begin
  DM.rxDSet3.Edit;
  DM.rxDSet3['CLOCK_REMONT']:=DM.rxDSet3['HOURS'];
  DM.rxDSet3.Post;
  PIsEdited:=True;
 end;
Grid3DBBandedTableView1.OptionsSelection.CellSelect:=True;
end;

procedure TFZRemont.Grid3DBBandedTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key=VK_RETURN then
if Grid3DBBandedTableView1.Controller.FocusedRecord<>nil then
 Grid3DBBandedTableView1.OptionsSelection.CellSelect:=True;
end;

procedure TFZRemont.SaveBtnClick(Sender: TObject);
begin
with DM do
 try
  StProc.StoredProcName := 'Z_REMONT_IUD';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  rxDSet3.First;
  while not rxDSet3.Eof do
   begin
    StProc.ParamByName('ID_REMONT').AsVariant := rxDSet3['ID_REMONT'];
    StProc.ParamByName('RMOVING').AsInteger   := PrMoving;

    StProc.ParamByName('DATE_REMONT').AsDate  := StrToDate(VarToStr(rxDSet3['DAYMONTH'])+
                                                 ifThen(YearMonthFromKodSetup(PKodSetup,False)<10,'.0','.')+
                                                 IntToStr(YearMonthFromKodSetup(PKodSetup,False))+'.'+
                                                 IntToStr(YearMonthFromKodSetup(PKodSetup)));
    StProc.ParamByName('TARIF').AsVariant     := IfThen(VarToStr(rxDSet3['TARIF_REMONT'])='',NULL,rxDSet3['TARIF_REMONT']);
    StProc.ParamByName('CLOCK').Asvariant     := IfThen(VarToStr(rxDSet3['CLOCK_REMONT'])='',NULL,rxDSet3['CLOCK_REMONT']);
    StProc.ExecProc;
    rxDSet3.Next;
   end;
  StProc.Transaction.Commit;
  DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REMONT_S('+IntToStr(PrMOVING)+','+IntToStr(PKodSetup)+') order by DayMonth';
  DM.DSet3.Open;
  DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REMONT_S(?RMOVING,'+IntToStr(PKodSetup)+') order by DayMonth';
  PIsEdited:=False;
 except
  on E:Exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    StProc.Transaction.Rollback;
   end;
 end;
end;

procedure TFZRemont.Grid2DBTableView1DblClick(Sender: TObject);
begin
TableBtnClick(Sender);
end;

procedure TFZRemont.Grid1DBTableView1DblClick(Sender: TObject);
begin
TableBtnClick(Sender);
end;

procedure TFZRemont.Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClClockRemont) and
     (AItem.Kind = skSum) and (AItem.Position = spFooter) then
  begin
   if (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClTarifRemont.Index]) ='0') or
      (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClTarifRemont.Index]) ='') then
      OutArguments.Value:=Null;
  end;

  if (AItem.Column = Grid3ClTarifRemont) and
     (AItem.Kind = skSum) and (AItem.Position = spFooter) then
  begin
   if (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClClockRemont.Index]) ='0') or
      (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClClockRemont.Index]) ='') then
      OutArguments.Value:=Null
   else
      OutArguments.Value:=1;
  end;
end;

procedure TFZRemont.DeleteBtnClick(Sender: TObject);
begin
 if Grid3DBBandedTableView1.Controller.FocusedRecord=nil then Exit;
 DM.rxDSet3.Edit;
 DM.rxDSet3['TARIF_REMONT']:=NULL;
 DM.rxDSet3['CLOCK_REMONT']:=NULL;
 DM.rxDSet3.Post;
 PIsEdited:=True;
end;

procedure TFZRemont.FilterBtnClick(Sender: TObject);
var KodSetup:integer;
begin
KodSetup:=LoadFilterKodSetup(self,DM.DB.Handle,PKodSetup);
if KodSetup<>PKodSetup then
 begin
  PKodSetup:=KodSetup;
  RefreshBtnClick(Sender);
 end;
end;

procedure TFZRemont.FormDestroy(Sender: TObject);
begin
if not(DM=nil) then DM.Destroy;
end;

procedure TFZRemont.Grid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
TableBtn.Enabled := AFocusedRecord<>nil;
Grid3DBBandedTableView1FocusedRecordChanged(Grid3DBBandedTableView1,nil,Grid3DBBandedTableView1.Controller.FocusedRecord,True);
end;

procedure TFZRemont.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
Grid2DBTableView1FocusedRecordChanged(Grid2DBTableView1,nil,Grid2DBTableView1.Controller.FocusedRecord,True);
end;

end.
