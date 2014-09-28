unit f1dfMainFormm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, f1df_DMm,
  dxStatusBar, ZcxLocateBar, zMessages, cxGridBandedTableView,
  cxGridDBBandedTableView, f1df_addReportm, cxCheckBox, f1df_ctrlm, f1df_PrintDMm,
  cxGridCustomPopupMenu, cxGridPopupMenu, Menus, f1df_exportm, ImgList,
  f1df_reportsm, cxBlobEdit, cxCurrencyEdit, f1df_Insertm, dxDockPanel,
  dxDockControl, cxShellDlgs, cxShellBrowserDialog, Halcn6db, zWait, Registry,
  f1df_exportmXML,  upi_resources, upi_Loader;

type
  TMainFormF1df = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddReportBtn: TdxBarLargeButton;
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
    dxStatusBar1: TdxStatusBar;
    PanelPeople: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClYear: TcxGridDBColumn;
    Grid1ClKvartal: TcxGridDBColumn;
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
    InsertBtn: TdxBarLargeButton;
    dxStatusBar2: TdxStatusBar;
    DeleteBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    grid1ClPachka: TcxGridDBColumn;
    UpdateBtn: TdxBarLargeButton;
    DelReportBtn: TdxBarLargeButton;
    PrintReport: TdxBarLargeButton;
    cxGridPopupMenu1: TcxGridPopupMenu;
    PopupMenu: TPopupMenu;
    PopupInsertBtn: TMenuItem;
    PopupUpdateBtn: TMenuItem;
    PopupDeleteBtn: TMenuItem;
    PopupDetailBtn: TMenuItem;
    PopupOtherManBtn: TMenuItem;
    N1: TMenuItem;
    PopupExitBtn: TMenuItem;
    PopupOtherWithReplBtn: TMenuItem;
    ExportDBFBtn: TMenuItem;
    Grid1ClType: TcxGridDBColumn;
    PopupToCorrectBtn: TMenuItem;
    Grid2: TcxGrid;
    Grid2DBBandedTableView1: TcxGridDBBandedTableView;
    Grid2ClIsAdd: TcxGridDBBandedColumn;
    Grid2ClTinPasport: TcxGridDBBandedColumn;
    Grid2ClSumNar: TcxGridDBBandedColumn;
    Grid2ClSumVipl: TcxGridDBBandedColumn;
    Grid2ClSumUd: TcxGridDBBandedColumn;
    Grid2ClSumPerer: TcxGridDBBandedColumn;
    Grid2ClKod1df: TcxGridDBBandedColumn;
    Grid2ClPSoc: TcxGridDBBandedColumn;
    Grid2ClDateCame: TcxGridDBBandedColumn;
    Grid2ClDateLeave: TcxGridDBBandedColumn;
    Grid2ClFio: TcxGridDBBandedColumn;
    Grid2Level1: TcxGridLevel;
    BarDockLocate: TdxBarDockControl;
    Grid3: TcxGrid;
    Grid3Level1: TcxGridLevel;
    Grid3DBTableView1: TcxGridDBTableView;
    Grid3DBTableView1DBKodSetup: TcxGridDBColumn;
    Grid3DBTableView1DBIdReestr: TcxGridDBColumn;
    Grid3DBTableView1DBSchTitle: TcxGridDBColumn;
    Grid3DBTableView1DBSumma: TcxGridDBColumn;
    dxDockSite1: TdxDockSite;
    ContainerDockSite: TdxTabContainerDockSite;
    DockPanel1: TdxDockPanel;
    DockPanel2: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    Grid1DBTableView1DBColumnIsGrantInclude: TcxGridDBColumn;
    Grid1DBTableView1DBColumnIsWorkInclude: TcxGridDBColumn;
    Grid1DBTableView1DBColumnIsInn: TcxGridDBColumn;
    Grid1DBTableView1DBColumnFirm: TcxGridDBColumn;
    DockPanel3: TdxDockPanel;
    Grid4: TcxGrid;
    Grid4DBBandedTableView: TcxGridDBBandedTableView;
    cxGridDBBandedColumnIsAdd: TcxGridDBBandedColumn;
    cxGridDBBandedColumnTin: TcxGridDBBandedColumn;
    cxGridDBBandedColumnSNar: TcxGridDBBandedColumn;
    cxGridDBBandedColumnSDoh: TcxGridDBBandedColumn;
    cxGridDBBandedColumnSTaxn: TcxGridDBBandedColumn;
    cxGridDBBandedColumnSTaxp: TcxGridDBBandedColumn;
    cxGridDBBandedColumnOznDoh: TcxGridDBBandedColumn;
    cxGridDBBandedColumnOznPilg: TcxGridDBBandedColumn;
    cxGridDBBandedColumnDPtiyn: TcxGridDBBandedColumn;
    cxGridDBBandedColumnDZviln: TcxGridDBBandedColumn;
    cxGridDBBandedColumnFIO: TcxGridDBBandedColumn;
    Grid4Level: TcxGridLevel;
    ImportBtn: TdxBarLargeButton;
    GenerateBtn: TdxBarLargeButton;
    DeleteTempBtn: TdxBarLargeButton;
    OpenDialog: TOpenDialog;
    SettingsBtn: TdxBarLargeButton;
    ExportToXMLBtn: TMenuItem;
    ConnectBtn: TdxBarLargeButton;
    UnConnectBtn: TdxBarLargeButton;
    LargeImages: TImageList;
    procedure ExitBtnClick(Sender: TObject);
    procedure AddReportBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure DelReportBtnClick(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure PrintReportClick(Sender: TObject);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid2DBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormShow(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure PopupInsertBtnClick(Sender: TObject);
    procedure PopupUpdateBtnClick(Sender: TObject);
    procedure PopupDeleteBtnClick(Sender: TObject);
    procedure PopupDetailBtnClick(Sender: TObject);
    procedure PopupExitBtnClick(Sender: TObject);
    procedure ReMan(Is_ReSum:boolean);
    procedure PopupOtherManBtnClick(Sender: TObject);
    procedure PopupOtherWithReplBtnClick(Sender: TObject);
    procedure Grid2DBBandedTableView1KeyPress(Sender: TObject;
      var Key: Char);
    procedure ExportDBFBtnClick(Sender: TObject);
    procedure PopupToCorrectBtnClick(Sender: TObject);
    procedure SystemActionExecute(Sender: TObject);
    procedure Grid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid3DBTableView1DBKodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid1DBTableView1DblClick(Sender: TObject);
    procedure ContainerDockSiteActiveChildChanged(
      Sender: TdxContainerDockSite; Child: TdxCustomDockControl);
    procedure ImportBtnClick(Sender: TObject);
    procedure DeleteTempBtnClick(Sender: TObject);
    procedure GenerateBtnClick(Sender: TObject);
    procedure Grid4DBBandedTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure SettingsBtnClick(Sender: TObject);
    procedure ClearCurrentBuffer(Sender:TObject);
    procedure ExportToXMLBtnClick(Sender: TObject);
    procedure ConnectBtnClick(Sender: TObject);
  private
    DM:TDM;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    pNumPredpr :integer;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math, FIBQuery, pFIBStoredProc;

{$R *.dfm}

constructor TMainFormF1df.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
begin
     inherited Create(AOwner);
     PLanguageIndex:=LanguageIndex;
    //******************************************************************************
     Caption                   := f1Df_Caption[PLanguageIndex];
     AddReportBtn.Caption      := AddReport_Caption[PLanguageIndex];
     DelReportBtn.Caption      := DelReport_Caption[PLanguageIndex];
     InsertBtn.Caption         := InsertBtn_Caption[PLanguageIndex];
     DeleteBtn.Caption         := DeleteBtn_Caption[PLanguageIndex];
     UpdateBtn.Caption         := UpdateBtn_Caption[PLanguageIndex];
     DetailBtn.Caption         := DetailBtn_Caption[PLanguageIndex];
     ExitBtn.Caption           := ExitBtn_Caption[PLanguageIndex];
     RefreshBtn.Caption        := RefreshBtn_Caption[PLanguageIndex];
     PrintReport.Caption       := PrintBtn_Caption[PLanguageIndex];
     PopupInsertBtn.Caption    := InsertBtn.Caption;
     PopupUpdateBtn.Caption    := UpdateBtn.Caption;
     PopupDeleteBtn.Caption    := DeleteBtn.Caption;
     PopupDetailBtn.Caption    := DetailBtn.Caption;
     PopupToCorrectBtn.Caption := ToCorrect_Caption[PLanguageIndex];
     PopupExitBtn.Caption      := ExitBtn.Caption;
     ExportDBFBtn.Caption      := ExportBtn_Caption[PLanguageIndex];
     PopupOtherManBtn.Caption  := EditManBtn_Caption[PLanguageIndex];
     PopupOtherWithReplBtn.Caption := EditManWithZamenaBtn_Caption[PLanguageIndex];
     ImportBtn.Caption         := 'Імпортувати';
     SettingsBtn.Caption       := 'Налаштування';
     GenerateBtn.Caption       := FormBtn_Caption[PLanguageIndex];
     DeleteTempBtn.Caption     := ClearBtn_Caption[PLanguageIndex];
     Grid2DBBandedTableView1.Bands[0].Caption := GridClMan_Caption[PLanguageIndex];
     Grid2DBBandedTableView1.Bands[1].Caption := GridClP1_Text_True[PLanguageIndex];
     Grid2DBBandedTableView1.Bands[2].Caption := GridClP1_Text_False[PLanguageIndex];
     Grid2DBBandedTableView1.Bands[3].Caption := GridClTerm_Caption[PLanguageIndex];
     Grid2ClFio.Caption        := GridClFIO_Caption[PLanguageIndex];
     Grid2ClTinPasport.Caption := GridClTin_Caption[PLanguageIndex];
     Grid1ClKvartal.Caption    := GridClKvartal_Caption[PLanguageIndex];
     Grid1ClYear.Caption       := GridClYear_Caption[PLanguageIndex];
     grid1ClPachka.Caption     := GridClNumber_Caption[PLanguageIndex];
     Grid1ClType.Caption       := GridClType_Caption[PLanguageIndex];
     Grid2ClKod1df.Caption     := GridClKod1DF_Caption[PLanguageIndex];
     Grid2ClPSoc.Caption       := GridClLgota_Caption[PLanguageIndex];
     Grid2ClDateCame.Caption   := GridClDateCame_Caption[PLanguageIndex];
     Grid2ClDateLeave.Caption  := GridClDateLeave_Caption[PLanguageIndex];
     Grid2ClSumNar.Caption     := GridClSumNar_Caption[PLanguageIndex];
     Grid2ClSumPerer.Caption   := GridClSumPerer_Caption[PLanguageIndex];
     Grid2ClSumUd.Caption      := GridClSumUd_Caption[PLanguageIndex];
     Grid2ClSumVipl.Caption    := GridClSumVipl_Caption[PLanguageIndex];

     Grid3DBTableView1DBKodSetup.Caption  := GridClKodSetup_Caption[PLanguageIndex];
     Grid3DBTableView1DBIdReestr.Caption  := ReeVed_Text[PLanguageIndex];
    // Grid3DBTableView1DBSmetaKod.Caption  := GridClKodSmeta_Caption[PLanguageIndex];
    // Grid3DBTableView1DBSmetaTitle.Caption:= LabelSmeta_Caption[PLanguageIndex];
     Grid3DBTableView1DBSchTitle.Caption:= GridClFullNameSch_Caption[PLanguageIndex];
     Grid3DBTableView1DBSumma.Caption     := GridClSumma_Caption[PLanguageIndex];

     Grid4DBBandedTableView.Bands[0].Caption := GridClMan_Caption[PLanguageIndex];
     Grid4DBBandedTableView.Bands[1].Caption := GridClP1_Text_True[PLanguageIndex];
     Grid4DBBandedTableView.Bands[2].Caption := GridClP1_Text_False[PLanguageIndex];
     Grid4DBBandedTableView.Bands[3].Caption := GridClTerm_Caption[PLanguageIndex];
     cxGridDBBandedColumnFIO.Caption        := GridClFIO_Caption[PLanguageIndex];
     cxGridDBBandedColumnTin.Caption := GridClTin_Caption[PLanguageIndex];
     cxGridDBBandedColumnOznDoh.Caption     := GridClKod1DF_Caption[PLanguageIndex];
     cxGridDBBandedColumnOznPilg.Caption       := GridClLgota_Caption[PLanguageIndex];
     cxGridDBBandedColumnDPtiyn.Caption   := GridClDateCame_Caption[PLanguageIndex];
     cxGridDBBandedColumnDZviln.Caption  := GridClDateLeave_Caption[PLanguageIndex];
     cxGridDBBandedColumnSNar.Caption     := GridClSumNar_Caption[PLanguageIndex];
     cxGridDBBandedColumnSDoh.Caption   := GridClSumPerer_Caption[PLanguageIndex];
     cxGridDBBandedColumnSTaxn.Caption      := GridClSumUd_Caption[PLanguageIndex];
     cxGridDBBandedColumnSTaxp.Caption    := GridClSumVipl_Caption[PLanguageIndex];

     DockPanel1.Caption     := LabelFIO_Caption[PLanguageIndex];
     DockPanel2.Caption     := ReeVed_Text[PLanguageIndex];
    //******************************************************************************
     dxStatusBar1.Panels[0].Text:= 'Ctrl+Ins - '+AddReportBtn.Caption;
     dxStatusBar1.Panels[1].Text:= 'Ctrl+Del - '+DelReportBtn.Caption;
     dxStatusBar1.Panels[2].Text:= 'F5 - '+RefreshBtn.Caption;
     dxStatusBar1.Panels[3].Text:= 'F7 - '+LocateBtn_Caption[PLanguageIndex];
     dxStatusBar1.Panels[4].Text:= 'Ctrl+F7 - '+LocateNextBtn_Caption[PLanguageIndex];

     for i:=0 to dxStatusBar1.Panels.Count-1 do
       dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

     dxStatusBar2.Panels[0].Text:= 'Ins - '+InsertBtn.Caption;
     dxStatusBar2.Panels[1].Text:= 'F2 - '+UpdateBtn.Caption;
     dxStatusBar2.Panels[2].Text:= 'Del - '+DeleteBtn.Caption;
     dxStatusBar2.Panels[3].Text:= 'Space - '+DetailBtn.Caption;
     dxStatusBar2.Panels[4].Text:= 'Esc - '+ExitBtn.Caption;

     for i:=0 to dxStatusBar2.Panels.Count-1 do
       dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
    //******************************************************************************
     DM := TDM.Create(self,Db_Handle);
     PBarLocate:=TZBarLocate.Create(BarManager);

     PBarLocate.DataSet := DM.DSet2;
     PBarLocate.BorderStyle := bbsNone;
     PBarLocate.AddLocateItem('FIO',
                               Grid2ClFIO.Caption,
                               [loCaseInsensitive,loPartialKey]);
     PBarLocate.AddLocateItem('TIN_PASPORT',
                               Grid2ClTinPasport.Caption,
                               [loCaseInsensitive,loPartialKey]);
     PBarLocate.DigitalField := 'TIN_PASPORT';
     PBarLocate.DockControl  := BarDockLocate;
    //******************************************************************************
     Grid1DBTableView1.DataController.DataSource := DM.DSource1;
     Grid2DBBandedTableView1.DataController.DataSource := DM.DSource2;
     Grid3DBTableView1.DataController.DataSource := DM.DSource3;
     Grid4DBBandedTableView.DataController.DataSource := DM.DSource4;
    //******************************************************************************
     if (ValueFieldZSetup(DM.DB.Handle,'IS_UNIVER')='F')then
     begin
       Grid1DBTableView1DBColumnIsGrantInclude.Visible:=false;
     end;
     pNumPredpr                                := StrToInt(VarToStrDef(ValueFieldZSetup(DM.DB.Handle,'NUM_PREDPR'),'0'));

     if((pNumPredpr=2) or(pNumPredpr=5)) then
     begin
         ConnectBtn.Visible   := ivalways;
         UnConnectBtn.Visible := ivalways;
     end;
    //******************************************************************************
     WindowState := wsMaximized;
    //******************************************************************************
end;

procedure TMainFormF1df.ExitBtnClick(Sender: TObject);
begin
    Close;
end;

procedure TMainFormF1df.AddReportBtnClick(Sender: TObject);
Var Id:Integer;
begin
Id:=ShowFormAddReport(Self,DM.DB.Handle);
if Id<>0 then
 begin
  DM.DSet1.sqls.RefreshSQL.Text := 'SELECT * FROM Z_1DF_HEADERS_S_BY_KEY('+IntToStr(Id)+')';
  DM.DSet1.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
  DM.DSet1.Insert;
  DM.DSet1.Post;
 end;
end;

procedure TMainFormF1df.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearCurrentBuffer(Sender);
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TMainFormF1df.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TMainFormF1df.FormDestroy(Sender: TObject);
begin
if not(DM=nil) then DM.Destroy;
end;

procedure TMainFormF1df.RefreshBtnClick(Sender: TObject);
begin
  // DataSetsCloseOpen(DM.DSet1,DM.DSet2,'ID');
   //DataSetsCloseOpen(DM.DSet1,DM.DSet3,'ID');
  // DataSetsCloseOpen(DM.DSet1,DM.DSet4,'ID');
   DM.DSet1.Close;
   DM.DSet2.Close;
   DM.DSet3.Close;
   DM.DSet4.Close;
   DM.DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_HEADERS_S ORDER BY KVARTAL_1DF,NUM_PACHKA';
   DM.DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S(?ID) order by tin_pasport';
   DM.DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REE_S(?ID)';
   DM.DSet4.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_TEMP_S(?ID) order by tin';
   DM.DSet1.Open;
   DM.DSet2.Open;
   DM.DSet3.Open;
   DM.DSet4.Open;
end;

procedure TMainFormF1df.DelReportBtnClick(Sender: TObject);
begin
if ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
with DM do
 try
  StProc.StoredProcName := 'Z_1DF_HEADERS_D';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID').AsInteger := DSet1['ID'];
  StProc.ExecProc;
  StProc.Transaction.Commit;
  DSet1.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
  DSet1.Delete;
 except
 on E:exception do
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
   StProc.Transaction.Rollback;
  end;
 end;
end;

procedure TMainFormF1df.InsertBtnClick(Sender: TObject);
var ID:integer;
    Form: TFInsert;
begin
case ContainerDockSite.ActiveChildIndex of 0:
begin
ID:=f1df_ctrl_show(self,DM.DB.Handle,zcfsInsert,DM.DSet1['ID'],(DM.DSet1['ID_TYPE']=2));
if ID<>0 then
 begin
  DM.DSet2.SQLs.InsertSQL.Text  := 'execute procedure Z_EMPTY_PROC';
  DM.DSet2.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S_BY_KEY('+IntToStr(ID)+')';
  DM.DSet2.Insert;
  DM.DSet2.Post;
 end;
end;
1:
begin
  Form:=TFInsert.Create(self,DM.DB.Handle,DM.DSet1['ID'],DM.DSet1['KVARTAL_1DF'],DM.DSet1['YEAR_1DF']);
  Form.ShowModal;
  DM.DSet3.FullRefresh;
end;
2:
begin
ID:=f1df_ctrl_show(self,DM.DB.Handle,zcfsInsert,DM.DSet1['ID'],
                   (DM.DSet1['ID_TYPE']=2),ContainerDockSite.ActiveChildIndex);
DM.DSet4.CloseOpen(true);
{if ID<>0 then
  begin
   DM.DSet4.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
   DM.DSet4.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_1DF_TEMP_S('+IntToStr(ID)+')';
   DM.DSet4.Edit;
   DM.DSet4.Post;

  end;}
end;
end;
end;

procedure TMainFormF1df.UpdateBtnClick(Sender: TObject);
var Id:integer;
begin
case ContainerDockSite.ActiveChildIndex of
0:
begin
Id:=f1df_ctrl_show(self,DM.DB.Handle,zcfsUpdate,DM.DSet2['ID'],(DM.DSet1['ID_TYPE']=2));
 if ID<>0 then
  begin
   DM.DSet2.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
   DM.DSet2.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S_BY_KEY('+IntToStr(ID)+')';
   DM.DSet2.Edit;
   DM.DSet2.Post;
  end;
end;
2:
begin
Id:=f1df_ctrl_show(self,DM.DB.Handle,zcfsUpdate,DM.DSet4['ID'],
                  (DM.DSet1['ID_TYPE']=2),ContainerDockSite.ActiveChildIndex);
if ID<>0 then
  begin
   DM.DSet4.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
   DM.DSet4.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_1DF_TEMP_S_BY_KEY('+IntToStr(ID)+')';
   DM.DSet4.Edit;
   DM.DSet4.Post;
  end;
end;
end;
end;

procedure TMainFormF1df.DeleteBtnClick(Sender: TObject);
begin
case ContainerDockSite.ActiveChildIndex of
0:
begin
if f1df_ctrl_show(self,DM.DB.Handle,zcfsDelete,
                  DM.DSet2['ID'],true,ContainerDockSite.ActiveChildIndex)=True
  then
  begin
   DM.DSet2.SQLs.DeleteSQL.Text  := 'execute procedure Z_EMPTY_PROC';
   DM.DSet2.Delete;
  end;
end;
1:
begin
  try
    DM.StProc.StoredProcName := 'Z_1DF_VEDOMOST_D';
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.Prepare;
    DM.StProc.ParamByName('ID').AsInteger := DM.DSet3['ID'];
    DM.StProc.ExecProc;
    DM.StProc.Transaction.Commit;
    DM.DSet3.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_1DF_REE_S(?ID)';
    DM.DSet3.FullRefresh;
  except
    on e:exception do
    begin
      dm.StProc.Transaction.Rollback;
      ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
    end
  end;
end;
2:
begin
if f1df_ctrl_show(self,DM.DB.Handle,zcfsDelete,
                  DM.DSet4['ID'],true,ContainerDockSite.ActiveChildIndex)=True
  then
  begin
   DM.DSet4.SQLs.DeleteSQL.Text  := 'execute procedure Z_EMPTY_PROC';
   DM.DSet4.Delete;
  end;
end;
end;
end;

procedure TMainFormF1df.DetailBtnClick(Sender: TObject);
begin
case ContainerDockSite.ActiveChildIndex of
0:
 f1df_ctrl_show(self,DM.DB.Handle,zcfsShowDetails,DM.DSet2['ID'],(DM.DSet1['ID_TYPE']=2),ContainerDockSite.ActiveChildIndex);
2:
begin
  f1df_ctrl_show(self,DM.DB.Handle,zcfsShowDetails,DM.DSet4['ID'],true,ContainerDockSite.ActiveChildIndex);
end;
end;
end;

procedure TMainFormF1df.PrintReportClick(Sender: TObject);
begin
CreateReport(Self,DM.DB.Handle,DM.DSet1['ID']);
end;

procedure TMainFormF1df.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if (AFocusedRecord=nil) or (AFocusedRecord.Expandable)
     then
         begin
              Grid2DBBandedTableView1.DataController.DataSource:=nil;
              Grid3DBTableView1.DataController.DataSource:=nil;
              InsertBtn.Enabled := False;
              DelReportBtn.Enabled := False;
              PrintReport.Enabled  := False;
         end
     else
         begin
              Grid2DBBandedTableView1.DataController.DataSource:=DM.DSource2;
              Grid3DBTableView1.DataController.DataSource:=DM.DSource3;
              InsertBtn.Enabled := True;
              DelReportBtn.Enabled := True;
              PrintReport.Enabled  := True;
         end;
  Grid2DBBandedTableView1FocusedRecordChanged(Grid2DBBandedTableView1,nil,Grid2DBBandedTableView1.Controller.FocusedRecord,True);
  Grid3DBTableView1FocusedRecordChanged(Grid3DBTableView1,nil,Grid3DBTableView1.Controller.FocusedRecord,True);
  if VarIsNull(DM.DSet1['ID_TYPE']) or (DM.DSet1['ID_TYPE']<>2) then Grid2ClIsAdd.Visible:=False
  else Grid2ClIsAdd.Visible:=True;
end;

procedure TMainFormF1df.Grid2DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if ContainerDockSite.ActiveChildIndex=0 then
 if (AFocusedRecord=nil) or (AFocusedRecord.Expandable)
     then
         begin
              UpdateBtn.Enabled := False;
              DeleteBtn.Enabled := False;
              DetailBtn.Enabled := False;
              PopupOtherManBtn.Enabled := False;
              PopupOtherWithReplBtn.Enabled := False;
              PopupToCorrectBtn.Enabled := False;
              ExportDBFBtn.Enabled := False;
         end
     else
         begin
              UpdateBtn.Enabled := True;
              DeleteBtn.Enabled := True;
              DetailBtn.Enabled := True;
              PopupOtherManBtn.Enabled := True;
              PopupOtherWithReplBtn.Enabled := True;
              PopupToCorrectBtn.Enabled := True;
              ExportDBFBtn.Enabled := True;
         end;
end;

procedure TMainFormF1df.FormShow(Sender: TObject);
begin
 Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
end;

procedure TMainFormF1df.PopupMenuPopup(Sender: TObject);
begin
PopupInsertBtn.Enabled := InsertBtn.Enabled;
PopupUpdateBtn.Enabled := UpdateBtn.Enabled;
PopupDeleteBtn.Enabled := DeleteBtn.Enabled;
PopupDetailBtn.Enabled := DetailBtn.Enabled;
PopupExitBtn.Enabled   := ExitBtn.Enabled;
end;

procedure TMainFormF1df.PopupInsertBtnClick(Sender: TObject);
begin
InsertBtnClick(sender);
end;

procedure TMainFormF1df.PopupUpdateBtnClick(Sender: TObject);
begin
UpdateBtnClick(sender);
end;

procedure TMainFormF1df.PopupDeleteBtnClick(Sender: TObject);
begin
DeleteBtnClick(sender);
end;

procedure TMainFormF1df.PopupDetailBtnClick(Sender: TObject);
begin
DetailBtnClick(Sender);
end;

procedure TMainFormF1df.PopupExitBtnClick(Sender: TObject);
begin
ExitBtnClick(sender);
end;

procedure TMainFormF1df.ReMan(Is_ReSum:boolean);
var NewMan:Variant;
begin
    NewMan:=LoadPeopleModal(Self,Dm.DB.Handle);
    if VarArrayDimCount(NewMan)> 0 then
       If NewMan[0]<>NULL then
         try
          DM.StProc.StoredProcName := 'Z_1DF_REPORT_U_MAN ';
          DM.StProc.Transaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID').AsInteger := DM.DSet2['ID'];
          DM.StProc.ParamByName('ID_MAN').AsInteger := NewMan[0];
          DM.StProc.ParamByName('IS_REPL_SUMS').AsString := IfThen(Is_ReSum,'T','F');
          DM.StProc.ExecProc;
          DM.StProc.Transaction.Commit;
          DM.DSet2.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
          DM.DSet2.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S_BY_KEY('+VarToStr(DM.DSet2['ID'])+')';
          DM.DSet2.Edit;
          DM.DSet2.Post;
         except
         on e:exception do
          begin
           dm.StProc.Transaction.Rollback;
           ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
          end
         end;
end;

procedure TMainFormF1df.PopupOtherManBtnClick(Sender: TObject);
begin
ReMan(False);
end;

procedure TMainFormF1df.PopupOtherWithReplBtnClick(Sender: TObject);
begin
ReMan(True);
end;

procedure TMainFormF1df.Grid2DBBandedTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (Grid2DBBandedTableView1.OptionsBehavior.IncSearchItem<>Grid2ClTinPasport)then
    begin
     Grid2DBBandedTableView1.Controller.IncSearchingText   := '';
     Grid2DBBandedTableView1.OptionsBehavior.IncSearchItem := Grid2ClTinPasport;
    end
  end
 else
  if (Grid2DBBandedTableView1.OptionsBehavior.IncSearchItem<>Grid2ClFio)then
   begin
    Grid2DBBandedTableView1.Controller.IncSearchingText   := '';
    Grid2DBBandedTableView1.OptionsBehavior.IncSearchItem := Grid2ClFIO;
   end;
end;

procedure TMainFormF1df.ExportDBFBtnClick(Sender: TObject);
begin
 ExportToDBF(self,DM.DB.Handle,DM.DSet1['ID']);
end;

procedure TMainFormF1df.PopupToCorrectBtnClick(Sender: TObject);
var id:integer;
begin
 id:=GetReport(self,DM.DB.Handle,dm.DSet1['ID']);
 if id>0 then
  try
   DM.StProc.StoredProcName := 'Z_1DF_COPY_TO';
   DM.StProc.Transaction.StartTransaction;
   DM.StProc.Prepare;
   DM.StProc.ParamByName('ID_DATA').AsInteger := DM.DSet2['ID'];
   DM.StProc.ParamByName('ID_REPORT').AsInteger := Id;
   DM.StProc.ExecProc;
   DM.StProc.Transaction.Commit;
  except
   on e:exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
     DM.StProc.Transaction.Rollback;
    end;
  end;
end;

procedure TMainFormF1df.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System',
             'ID_1DF_REPORT = '+VarToStrDef(DM.DSet1['ID'],'NULL'),
             mtInformation,[mbOK]);
end;

procedure TMainFormF1df.Grid3DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if ContainerDockSite.ActiveChildIndex=1 then
 if (AFocusedRecord=nil) or (AFocusedRecord.Expandable)
 then
   begin
     UpdateBtn.Enabled := False;
     DeleteBtn.Enabled := False;
     DetailBtn.Enabled := False;
     PopupOtherManBtn.Enabled := False;
     PopupOtherWithReplBtn.Enabled := False;
     PopupToCorrectBtn.Enabled := False;
     ExportDBFBtn.Enabled := False;
   end
 else
   begin
     UpdateBtn.Enabled := false;
     DeleteBtn.Enabled := True;
     DetailBtn.Enabled := false;
     PopupOtherManBtn.Enabled := True;
     PopupOtherWithReplBtn.Enabled := True;
     PopupToCorrectBtn.Enabled := True;
     ExportDBFBtn.Enabled := True;
   end;
end;

procedure TMainFormF1df.Grid3DBTableView1DBKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText<>'' then
  AText:=KodSetupToPeriod(strToInt(AText),1);
end;

procedure TMainFormF1df.Grid1DBTableView1DblClick(Sender: TObject);
begin
  cxSplitter1.State:=ssClosed;
end;

procedure TMainFormF1df.ContainerDockSiteActiveChildChanged(
  Sender: TdxContainerDockSite; Child: TdxCustomDockControl);
begin
  if(ContainerDockSite.ActiveChildIndex=2)then
  begin
    ImportBtn.Visible:=ivAlways;
    DeleteTempBtn.Visible:=ivAlways;
    InsertBtn.Enabled := True;
    UpdateBtn.Enabled := False;
    DeleteBtn.Enabled := False;
    DetailBtn.Enabled := False;
  end
  else
    if(ImportBtn<>nil)then
    begin
      ImportBtn.Visible:=ivNever;
      DeleteTempBtn.Visible:=ivNever;
    end;
end;

procedure TMainFormF1df.ImportBtnClick(Sender: TObject);
var DSet:THalcyonDataSet;
    PFileName:String;
    wf:TForm;
begin
  if OpenDialog.Execute then
    PFileName:=OpenDialog.FileName;
  if not FileExists(PFileName) then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFileNotExist_Text[PLanguageIndex]+#13+PFileName,mtWarning,[mbOK]);
    Exit;
  end;
  try
    DSet:=THalcyonDataSet.Create(Self);
    DSet.TableName := PFileName;
    DSet.Open;
  except
    on E:Exception do
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      DSet.Destroy;
      Exit;
    end;
  end;
  if DSet.FindField('TIN')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'TIN',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('S_NAR')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'S_NAR',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('S_DOX')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'S_DOX',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('S_TAXN')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'S_TAXN',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('S_TAXP')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'S_TAXP',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('OZN_DOX')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'OZN_DOX',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('D_PRIYN')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'D_PRIYN',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('D_ZVILN')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'D_ZVILN',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('OZN_PILG')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'OZN_PILG',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  if DSet.FindField('OZNAKA')=nil then
  begin
    ZShowMessage(Error_Caption[PLanguageIndex],
                 ZeFieldNotExist_Text[PLanguageIndex]+#13+'OZNAKA',mtWarning,[mbOK]);
    DSet.Destroy;
    Exit;
  end;
  with DM do
  try
    wf:=ShowWaitForm(self);
    WriteTransaction.StartTransaction;
    DSet.First;
    with StProc do
    begin
      StoredProcName:='Z_1DF_TEMP_I';
      Prepare;
      while not DSet.Eof
      do
      begin
        ParamByName('TIN').AsString:=VarToStr(DSet['TIN']);
        ParamByName('S_NAR').AsCurrency:=DSet['S_NAR'];
        ParamByName('S_DOH').AsCurrency:=DSet['S_DOX'];
        ParamByName('S_TAXN').AsCurrency:=DSet['S_TAXN'];
        ParamByName('S_TAXP').AsCurrency:=DSet['S_TAXP'];
        ParamByName('OZN_DOH').AsInteger:=DSet['OZN_DOX'];
        if(DSet['D_PRIYN']<>null)then
          ParamByName('D_PRIYN').AsDate:=VarToDateTime(DSet['D_PRIYN'])
        else
          ParamByName('D_PRIYN').AsVariant:=null;
        if(DSet['D_ZVILN']<>null)then
          ParamByName('D_ZVILN').AsDate:=VarToDateTime(DSet['D_ZVILN'])
        else
          ParamByName('D_ZVILN').AsVariant:=null;
        ParamByName('OZN_PILG').AsInteger:=DSet['OZN_PILG'];
        ParamByName('OZNAKA').AsInteger:=DSet['OZNAKA'];
        ParamByName('ID_1DF_HEADER').AsInteger:=DM.DSet1['ID'];
        ExecProc;
        DSet.Next;
      end;
    end;
    WriteTransaction.Commit;
    CloseWaitForm(wf);
    DM.DSet4.CloseOpen(true);
    except
      on E:Exception do
      begin
        ZShowMessage(Error_Caption[PLanguageIndex],
                     E.Message+#13+LabelTin_Caption[PLanguageIndex]+': '+
                     VarToStr(DSet['TIN']),mtError,[mbOK]);
        if WriteTransaction.InTransaction then WriteTransaction.Rollback;
        CloseWaitForm(wf);
      end;
    end;
end;

procedure TMainFormF1df.DeleteTempBtnClick(Sender: TObject);
var wf:TForm;
begin
if ZShowMessage(Caption_Delete[PLanguageIndex],DelAllRecordsQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
then
 begin
  with DM do
  try
    wf:=ShowWaitForm(self);
    WriteTransaction.StartTransaction;
    with StProc do
    begin
      StoredProcName:='Z_1DF_TEMP_CLE';
      Prepare;
      ParamByName('ID').AsInteger:=DSet1['ID'];
      ExecProc;
    end;
    WriteTransaction.Commit;
    CloseWaitForm(wf);
    DM.DSet4.CloseOpen(true);
  except
    on E:Exception do
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],
                   E.Message,mtError,[mbOK]);
      if WriteTransaction.InTransaction then WriteTransaction.Rollback;
        CloseWaitForm(wf);
    end;
  end;
 end;
end;

procedure TMainFormF1df.GenerateBtnClick(Sender: TObject);
var wf:TForm;
    id :integer;
begin
  with DM do
  try
    wf:=ShowWaitForm(self);
    ID:=DSet1['ID'];
    WriteTransaction.StartTransaction;
    with StProc do
    begin
      StoredProcName:='Z_1DF_DNDZ';
      Prepare;
      ParamByName('ID_1DF').AsInteger:=DSet1['ID'];
      ExecProc;
    end;
    WriteTransaction.Commit;
    DSet1.CloseOpen(true);
    DSet2.CloseOpen(true);
    DSet4.CloseOpen(true);
    Grid1DBTableView1.DataController.LocateByKey(ID);
    CloseWaitForm(wf);
  except
    on E:Exception do
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],
                   E.Message,mtError,[mbOK]);
      if WriteTransaction.InTransaction then WriteTransaction.Rollback;
        CloseWaitForm(wf);
    end;
  end;
end;

procedure TMainFormF1df.Grid4DBBandedTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if ContainerDockSite.ActiveChildIndex=2 then
    if (AFocusedRecord=nil) or (AFocusedRecord.Expandable)then
    begin
      UpdateBtn.Enabled := False;
      DeleteBtn.Enabled := False;
      DetailBtn.Enabled := False;
      PopupOtherManBtn.Enabled := False;
      PopupOtherWithReplBtn.Enabled := False;
      PopupToCorrectBtn.Enabled := False;
      ExportDBFBtn.Enabled := False;
    end
    else
    begin
      UpdateBtn.Enabled := true;
      DeleteBtn.Enabled := True;
      DetailBtn.Enabled := true;
      PopupOtherManBtn.Enabled := True;
      PopupOtherWithReplBtn.Enabled := True;
      PopupToCorrectBtn.Enabled := True;
      ExportDBFBtn.Enabled := True;
    end;
end;

procedure TMainFormF1df.SettingsBtnClick(Sender: TObject);
var Aparameter : TZSimpleParamFull;
begin
   AParameter := TZSimpleParamFull.Create;
   AParameter.Owner := self;
   AParameter.Db_Handle := DM.DB.Handle;
   AParameter.Formstyle := fsMDIChild;
   ZLoadFromPackage(AParameter, ['Zarplata\f1dfFirm.bpl', 'View_FZ_F1dfFirm_Sp']);
   AParameter.Free;
end;

procedure TMainFormF1df.ClearCurrentBuffer(Sender:TObject);
var reg: TRegistry;
    Key:string;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Zarplata\F1dfCtrl',True);
  reg.WriteString('IsBuffer','0');
  reg.DeleteValue('Tin');
  reg.DeleteValue('FIO');
  reg.DeleteValue('SummaNar');
  reg.DeleteValue('SummaVipl');
  reg.DeleteValue('SummaUd');
  reg.DeleteValue('SummaPerer');
  reg.DeleteValue('DateCame');
  reg.DeleteValue('DateLeave');
  reg.DeleteValue('Kod1Df');
  reg.DeleteValue('Priv');
 finally
  reg.Free;
 end;
end;

procedure TMainFormF1df.ExportToXMLBtnClick(Sender: TObject);
begin
   ExportToXML(self,DM.DB.Handle,DM.DSet1['ID']);
end;

procedure TMainFormF1df.ConnectBtnClick(Sender: TObject);
var
    AParameter: TPiParamPacks;
    res : variant;
    id_doc_header, locate_id :variant;
begin
   AParameter := TPiParamPacks.Create;
    AParameter.Owner := self;
    AParameter.Db_Handle := dm.Db.Handle;
    AParameter.Formstyle := fsNormal;
    AParameter.ID_Locate := DM.DSet1['id'];
    AParameter.str_text  := inttostr(DM.DSet1['kvartal_1df'])+'/'+inttostr(DM.DSet1['year_1df'])+' №'+inttostr(DM.DSet1['num_pachka']);
    res := DoFunctionFromPackage(AParameter, ['Personal_income\Pi_PrepareDoc1df.bpl', 'ShowPiPrepareDoc1df']);
    AParameter.Free;
    locate_id := DM.DSet1['id'];
    DM.DSet2.Close;
    DM.DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S(?ID) order by tin_pasport';
    DM.DSet2.Open;
    DM.DSet1.Locate('id', locate_id, []);
end;


end.
