unit f1dfMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, f1df_DM,
  dxStatusBar, ZcxLocateBar, zMessages, cxGridBandedTableView,
  cxGridDBBandedTableView, f1df_addReport, cxCheckBox, f1df_ctrl, f1df_PrintDM,
  cxGridCustomPopupMenu, cxGridPopupMenu, Menus, f1df_export, ImgList,
  f1df_reports;

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
    PanelCurrent: TPanel;
    Grid2Level1: TcxGridLevel;
    dxStatusBar1: TdxStatusBar;
    PanelPeople: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClYear: TcxGridDBColumn;
    Grid1ClKvartal: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    ActionList: TActionList;
    SystemAction: TAction;
    Grid2DBBandedTableView1: TcxGridDBBandedTableView;
    Grid2: TcxGrid;
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
    BarDockLocate: TdxBarDockControl;
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
    Grid2ClIsAdd: TcxGridDBBandedColumn;
    PopupToCorrectBtn: TMenuItem;
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
  private
    DM:TDM;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math, FIBQuery;

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
 DataSetsCloseOpen(DM.DSet1,DM.DSet2,'ID');
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

procedure TMainFormF1df.UpdateBtnClick(Sender: TObject);
var Id:integer;
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

procedure TMainFormF1df.DeleteBtnClick(Sender: TObject);
begin
if f1df_ctrl_show(self,DM.DB.Handle,zcfsDelete,DM.DSet2['ID'])=True then
  begin
   DM.DSet2.SQLs.DeleteSQL.Text  := 'execute procedure Z_EMPTY_PROC';
   DM.DSet2.Delete;
  end;
end;

procedure TMainFormF1df.DetailBtnClick(Sender: TObject);
begin
 f1df_ctrl_show(self,DM.DB.Handle,zcfsShowDetails,DM.DSet2['ID'],(DM.DSet1['ID_TYPE']=2));
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
              InsertBtn.Enabled := False;
              DelReportBtn.Enabled := False;
              PrintReport.Enabled  := False;
         end
     else
         begin
              Grid2DBBandedTableView1.DataController.DataSource:=DM.DSource2;
              InsertBtn.Enabled := True;
              DelReportBtn.Enabled := True;
              PrintReport.Enabled  := True;
         end;
  Grid2DBBandedTableView1FocusedRecordChanged(Grid2DBBandedTableView1,nil,Grid2DBBandedTableView1.Controller.FocusedRecord,True);
  if VarIsNull(DM.DSet1['ID_TYPE']) or (DM.DSet1['ID_TYPE']<>2) then Grid2ClIsAdd.Visible:=False
  else Grid2ClIsAdd.Visible:=True;
end;

procedure TMainFormF1df.Grid2DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
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

end.
