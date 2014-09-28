unit gr_Recount_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxTextEdit, cxMaskEdit,
  cxSpinEdit, ExtCtrls, cxControls, cxContainer, cxEdit, cxProgressBar,
  StdCtrls, cxButtons, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, iBase,
  zProc, dxBar, dxBarExtItems, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGridBandedTableView, PackageLoad,
  Dates, ZcxLocateBar, zThread, Gauges, 
  gr_uMessage, gr_uCommonProc, gr_uCommonConsts, cxSplitter, cxMemo, Menus,
  cxGridCustomPopupMenu, cxGridPopupMenu,
  gr_Recount_CtrlForm, zTypes;

type
  TFSpisokReCount = class(TForm)
    Panel1: TPanel;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    Panel3: TPanel;
    BarManager: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    GridClFio: TcxGridDBColumn;
    GridClBirthDate: TcxGridDBColumn;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    DelAllBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    DSource: TDataSource;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    ExitBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    DoCountBtn: TdxBarLargeButton;
    GridClTin: TcxGridDBColumn;
    Panel2: TPanel;
    Gauge: TGauge;
    MemoErrors: TcxMemo;
    cxSplitter1: TcxSplitter;
    cxGridPopupMenu: TcxGridPopupMenu;
    GridPopupMenu: TPopupMenu;
    InsertPopupBtn: TMenuItem;
    DeletePopupBtn: TMenuItem;
    DelAllPopupBtn: TMenuItem;
    RefreshPopupBtn: TMenuItem;
    DoCountPopupBtn: TMenuItem;
    N1: TMenuItem;
    ExitPopupBtn: TMenuItem;
    UpdateBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    ActionList: TActionList;
    Action1: TAction;
    GridClKodSetupB: TcxGridDBColumn;
    GridClKodSetupE: TcxGridDBColumn;
    DSet2: TpFIBDataSet;
    InsertMenu: TdxBarPopupMenu;
    InsertAllBtn: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    InsertByDep: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    procedure ActionCancelExecute(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure DelAllBtnClick(Sender: TObject);
    procedure DoCountBtnClick(Sender: TObject);
    procedure GridPopupMenuPopup(Sender: TObject);
    procedure InsertPopupBtnClick(Sender: TObject);
    procedure DeletePopupBtnClick(Sender: TObject);
    procedure DelAllPopupBtnClick(Sender: TObject);
    procedure RefreshPopupBtnClick(Sender: TObject);
    procedure DoCountPopupBtnClick(Sender: TObject);
    procedure ExitPopupBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure GridClKodSetupBGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridClKodSetupEGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure InsertAllBtnClick(Sender: TObject);
    procedure InsertByDepClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
  private
    PDB_handle:TISC_DB_HANDLE;
    PLanguageIndex:Byte;
    PId_Report:Integer;
    PIdUser:String;
    PBarLocate:TZBarLocate;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
    property Id_report:integer read PId_Report write PId_Report;
  end;

implementation


uses DateUtils;

{$R *.dfm}
var CtrlForm:TFRecountCtrl;

constructor TFSpisokReCount.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
var tKodSetup:integer;
begin
 inherited Create(AOwner);
 PDB_handle     := ADB_Handle;
 PLanguageIndex := IndexLanguage;
//------------------------------------------------------------------------------
 Caption                 := Recount_Text[PLanguageIndex];
 InsertBtn.Caption       := InsertBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption       := DeleteBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption      := RefreshBtn_Caption[PLanguageIndex];
 ExitBtn.Caption         := ExitBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption       := UpdateBtn_Caption[PLanguageIndex];
 DelAllBtn.Caption       := ClearBtn_Caption[PLanguageIndex];
 DoCountBtn.Caption      := DoCountBtn_Caption[PLanguageIndex];
 InsertPopupBtn.Caption  := InsertBtn_Caption[PLanguageIndex];
 DeletePopupBtn.Caption  := DeleteBtn_Caption[PLanguageIndex];
 RefreshPopupBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
 DetailBtn.Caption       := DetailBtn_Caption[PLanguageIndex];
 ExitPopupBtn.Caption    := ExitBtn_Caption[PLanguageIndex];
 DelAllPopupBtn.Caption  := ClearBtn_Caption[PLanguageIndex];
 DoCountPopupBtn.Caption := DoCountBtn_Caption[PLanguageIndex];
 GridClTin.Caption       := GridClTin_Caption[PLanguageIndex];
 GridClFio.Caption       := GridClFIO_Caption[PLanguageIndex];
 GridClBirthDate.Caption := GridClBirthDate_Caption[PLanguageIndex];
 GridClKodSetupB.Caption := GridClBegin_Caption[PLanguageIndex];
 GridClKodSetupE.Caption := GridClEnd_Caption[PLanguageIndex];
//------------------------------------------------------------------------------
 PBarLocate:=TZBarLocate.Create(BarManager);

 PBarLocate.DataSet := DSet;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('TIN',
                           GridClTin.Caption,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('FIO',
                           GridClFIO.Caption,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TIN';
 PBarLocate.DockControl  := BarDockLocate;
//------------------------------------------------------------------------------
 DB.Handle := PDB_handle;
 PIdUser:=zIdUser;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM GR_REE_FOR_RECOUNT_S';
 DSet.Open;
//------------------------------------------------------------------------------
 WindowState := wsMaximized;
 MemoErrors.Text := '';
// cxSplitter1.CloseSplitter;
//------------------------------------------------------------------------------
 SetOptionsBarManager(BarManager);
 SetOptionsGridView(GridDBTableView1);
 GridDBTableView1.OptionsView.Footer := True;
//------------------------------------------------------------------------------
 GridDBTableView1FocusedRecordChanged(GridDBTableView1,nil,GridDBTableView1.Controller.FocusedRecord,True);
 CtrlForm := TFRecountCtrl.Create(aOwner,ADB_Handle);
 tKodSetup:=CurrentKodSetup(ADB_Handle);
 CtrlForm.MonthesList1.ItemIndex:=YearMonthFromKodSetup(tKodSetup,False)-2;
 CtrlForm.MonthesList2.ItemIndex:=YearMonthFromKodSetup(tKodSetup,False)-2;
 CtrlForm.YearSpinEdit1.Value := YearMonthFromKodSetup(tKodSetup);
 CtrlForm.YearSpinEdit2.Value := YearMonthFromKodSetup(tKodSetup);
end;

procedure TFSpisokReCount.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSpisokReCount.InsertBtnClick(Sender: TObject);
var ResView:integer;
begin
ResView:=0;
CtrlForm.GetData(zcfsInsert,0);
   if CtrlForm.ShowModal=mrYes then
      ResView:=CtrlForm.id;
if ResView<>0 then
 begin
  DSet.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_REE_FOR_RECOUNT_S_BY_KEY('+IntToStr(ResView)+')';
  DSet.SQLs.InsertSQL.Text  := 'execute procedure Z_EMPTY_PROC';
  DSet.Insert;
  DSet.Post;
  DSet.SQLs.RefreshSQL.Text := '';
  DSet.SQLs.InsertSQL.Text  := '';
 end;
end;

procedure TFSpisokReCount.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  UpdateBtn.Enabled := False;
  DetailBtn.Enabled := False;
  DelAllBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DoCountBtn.Enabled := False;
 end
else
 begin
  UpdateBtn.Enabled := True;
  DetailBtn.Enabled := True;
  DelAllBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DoCountBtn.Enabled := True;
 end;
end;

procedure TFSpisokReCount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree
end;

procedure TFSpisokReCount.DeleteBtnClick(Sender: TObject);
var ResView:integer;
begin
ResView:=IfThen(CtrlForm.DeleteRecord(DSet['ID']),1,0);
if ResView<>0 then
 begin
  DSet.SQLs.DeleteSQL.Text  := 'execute procedure Z_EMPTY_PROC';
  DSet.Delete;
  DSet.SQLs.DeleteSQL.Text  := '';
 end;
end;

procedure TFSpisokReCount.ExitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TFSpisokReCount.DelAllBtnClick(Sender: TObject);
begin
if  grShowMessage(Caption_Delete[PLanguageIndex],
                  DelAllRecordsQuestion_Text[PLanguageIndex],
                  mtConfirmation,[mbYes,mbNo])=mrYes then
   try
     StProc.StoredProcName := 'GR_REE_FOR_RECOUNT_CLEAR';
     StProc.Transaction.StartTransaction;
     StProc.Prepare;
     StProc.ExecProc;
     StProc.Transaction.Commit;
     DSet.CloseOpen(True);
   except
    on e:Exception do
     begin
      grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StProc.Transaction.Rollback;
     end;
   end;
end;

procedure TFSpisokReCount.DoCountBtnClick(Sender: TObject);
var pIdGroupAccount:integer;
begin
  pIdGroupAccount := grGetIdGroupAccount(PDB_handle);
  if pIdGroupAccount<>0 then
   begin
    DB.Handle := DB.Handle;
    DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM GR_REE_FOR_RECOUNT_S2';
    DSet2.Open;
    DSet2.First;
    Gauge.MinValue := 0;
    Gauge.MaxValue := DSet2.RecordCount;
    Gauge.Progress := 0;

    grSetBeginAction(DB.Handle,14);
    while not DSet2.Eof do
    begin
     try
        Gauge.Progress := Gauge.Progress + 1;
        StProc.StoredProcName := 'GR_RECOUNT';
        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('ID_GROUP_ACCOUNT').AsInteger := pIdGroupAccount;
        StProc.ParamByName('ID_MAN').AsInteger           := DSet2['ID_MAN'];
        StProc.ParamByName('KOD_SETUP').AsInteger        := DSet2['KOD_SETUP'];
        StProc.ExecProc;
        StProc.Transaction.Commit;
     except
      on E:Exception do
         begin
          MemoErrors.Lines.Add(VarToStrDef(DSet2['ID_MAN'],'NULL')+'-('+
                               VarToStrDef(DSet2['TIN'],'NULL')+') '+
                               VarToStrDef(DSet2['FIO'],'NULL')+': '+e.Message);
          StProc.Transaction.Rollback;
         end;
     end;
     DSet2.Next;
     Application.ProcessMessages;
    end;

    DSet2.Close;
    DSet.CloseOpen(True);
    grShowMessage('Завершення','Операцію було завершено!',mtInformation,[mbOk]);
    grSetEndAction(DB.Handle,'T');
   end;
end;

procedure TFSpisokReCount.GridPopupMenuPopup(Sender: TObject);
begin
 InsertPopupBtn.Enabled  := (InsertBtn.Enabled) and (InsertBtn.Visible=ivAlways);
 DeletePopupBtn.Enabled  := (DeleteBtn.Enabled) and (DeleteBtn.Visible=ivAlways);
 DelAllPopupBtn.Enabled  := (DelAllBtn.Enabled) and (DelAllBtn.Visible=ivAlways);
 RefreshPopupBtn.Enabled := (RefreshBtn.Enabled) and (RefreshBtn.Visible=ivAlways);
 DoCountPopupBtn.Enabled := (DoCountBtn.Enabled) and (DoCountBtn.Visible=ivAlways);
 ExitPopupBtn.Enabled    := (ExitBtn.Enabled) and (ExitBtn.Visible=ivAlways);
end;

procedure TFSpisokReCount.InsertPopupBtnClick(Sender: TObject);
begin
InsertBtnClick(Sender);
end;

procedure TFSpisokReCount.DeletePopupBtnClick(Sender: TObject);
begin
DeleteBtnClick(Sender);
end;

procedure TFSpisokReCount.DelAllPopupBtnClick(Sender: TObject);
begin
DelAllBtnClick(Sender);
end;

procedure TFSpisokReCount.RefreshPopupBtnClick(Sender: TObject);
begin
RefreshBtnClick(Sender);
end;

procedure TFSpisokReCount.DoCountPopupBtnClick(Sender: TObject);
begin
DoCountBtnClick(Sender);
end;

procedure TFSpisokReCount.ExitPopupBtnClick(Sender: TObject);
begin
ExitBtnClick(Sender);
end;

procedure TFSpisokReCount.RefreshBtnClick(Sender: TObject);
begin
DSet.CloseOpen(True);
end;

procedure TFSpisokReCount.UpdateBtnClick(Sender: TObject);
var ResView:integer;
begin
CtrlForm.SpravType:=True;
CtrlForm.GetData(zcfsUpdate,DSet['ID']);
if CtrlForm.ShowModal=mrYes then
  ResView:=CtrlForm.id;

if ResView<>0 then
 begin
  DSet.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_REE_FOR_RECOUNT_S_BY_KEY('+IntToStr(ResView)+')';
  DSet.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
  DSet.Edit;
  DSet.Post;
  DSet.SQLs.RefreshSQL.Text := '';
  DSet.SQLs.UpdateSQL.Text  := '';
 end;
end;

procedure TFSpisokReCount.DetailBtnClick(Sender: TObject);
begin
CtrlForm.GetData(zcfsShowDetails,DSet['ID']);
end;

procedure TFSpisokReCount.Action1Execute(Sender: TObject);
begin
grShowMessage('System Data','ID = '+VarToStrDef(DSet['ID'],'')+#13+
                            'ID_MAN = '+VarToStrDef(DSet['ID_MAN'],''),mtInformation,[mbOK]);
end;

procedure TFSpisokReCount.GridClKodSetupBGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText<>'' then Atext:=KodSetupToPeriod(StrToInt(AText),1);
end;

procedure TFSpisokReCount.GridClKodSetupEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText<>'' then Atext:=KodSetupToPeriod(StrToInt(AText),1);
end;

procedure TFSpisokReCount.InsertAllBtnClick(Sender: TObject);
begin
  CtrlForm.GetData(zcfsInsert,1);
  if CtrlForm.ShowModal=mrYes then
  begin
    DSet.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_REE_FOR_RECOUNT_S';
    DSet.FullRefresh;
  end;
end;

procedure TFSpisokReCount.InsertByDepClick(Sender: TObject);
var ResView:integer;
begin
ResView:=0;
CtrlForm.GetData(zcfsInsert,2);
CtrlForm.ShowModal;
DSet.FullRefresh;
end;

procedure TFSpisokReCount.dxBarLargeButton2Click(Sender: TObject);
begin
    LoadAccountReloadPackage(self,DB.Handle,'Zarplata\AccountReload.bpl','View_AccountReload','F');
    RefreshBtn.Click;
end;

end.
