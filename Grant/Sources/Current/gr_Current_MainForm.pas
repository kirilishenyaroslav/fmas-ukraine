unit gr_Current_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, cxTextEdit,
  cxCalendar, cxCurrencyEdit, cxSplitter, cxLabel, cxContainer, cxMaskEdit,
  cxDBEdit, iBase, registry, Menus,
  gr_uCommonProc, gr_dmCommonStyles, gr_uCommonConsts, gr_Current_Filter,
  gr_uCommonLoader, zTypes, zcxLocateBar,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxCheckBox, ActnList,
  dxStatusBar;

type
  TFCurrent = class(TForm)
    BarManager: TdxBarManager;
    AddManBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Panel1: TPanel;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2Level1: TcxGridLevel;
    Grid2: TcxGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    EditDepartment: TcxDBMaskEdit;
    EditPrikaz: TcxDBMaskEdit;
    EditSmeta: TcxDBMaskEdit;
    LabelSmeta: TcxLabel;
    LabelDepartment: TcxLabel;
    LabelPrikaz: TcxLabel;
    Splitter33: TcxSplitter;
    Grid3: TcxGrid;
    Grid3DBTableView1: TcxGridDBTableView;
    Grid3ClKodVidopl: TcxGridDBColumn;
    Grid3ClNameVidopl: TcxGridDBColumn;
    Grid3ClKodSetup: TcxGridDBColumn;
    Grid3ClSumma: TcxGridDBColumn;
    Grid3ClKodSmeta: TcxGridDBColumn;
    Grid3ClKodDepartment: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Grid1ClTin: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid2ClDateBeg: TcxGridDBColumn;
    Grid2ClDateEnd: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    FilterBtn: TdxBarLargeButton;
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    DSet3: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DSource1: TDataSource;
    DSource2: TDataSource;
    DSource3: TDataSource;
    Grid2ClContract: TcxGridDBColumn;
    ActionList: TActionList;
    SystemAction: TAction;
    dxBarDockControl1: TdxBarDockControl;
    dxBarDockControl2: TdxBarDockControl;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure SetFilter(Sender:TObject);
    procedure SystemActionExecute(Sender: TObject);
    procedure Grid3ClKodSetupGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure AddManBtnClick(Sender: TObject);
    procedure Grid3DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ClearCurrentBuffer(Sender:TObject);
    procedure dxStatusBar1Resize(Sender: TObject);
    procedure dxStatusBar2Resize(Sender: TObject);
  private
    pStylesDM:TStylesDM;
    pLanguageIndex:byte;
    pWidth:integer;
    pgrCurrentFilter:TgrCurrentFilter;
    pBarLocate:TZBarLocate;
  public
    constructor Create(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;CurrentFilter:TgrCurrentFilter);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFCurrent.Create(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;CurrentFilter:TgrCurrentFilter);
begin
 inherited Create(AOwner);
//------------------------------------------------------------------------------
 pLanguageIndex               := IndexLanguage;
 Caption                      := CurrentOperationsData_Text[PLanguageIndex];
 InsertBtn.Caption            := InsertBtn_Caption[pLanguageIndex];
 UpdateBtn.Caption            := UpdateBtn_Caption[pLanguageIndex];
 DeleteBtn.Caption            := DeleteBtn_Caption[pLanguageIndex];
 DetailBtn.Caption            := DetailBtn_Caption[pLanguageIndex];
 FilterBtn.Caption            := FilterBtn_Caption[pLanguageIndex];
 ExitBtn.Caption              := ExitBtn_Caption[pLanguageIndex];
 RefreshBtn.Caption           := RefreshBtn_Caption[pLanguageIndex];
 AddManBtn.Caption            := AddManBtn_Caption[pLanguageIndex];
 LabelDepartment.Caption      := LabelDepartment_Caption[pLanguageIndex];
 LabelSmeta.Caption           := LabelSmeta_Caption[pLanguageIndex];
 LabelPrikaz.Caption          := LabelPrikaz_Caption[pLanguageIndex];
 Grid1ClTin.Caption           := GridClTin_Caption[pLanguageIndex];
 Grid1ClFIO.Caption           := GridClFIO_Caption[pLanguageIndex];
 Grid2ClDateBeg.Caption       := GridClDateBeg_Caption[pLanguageIndex];
 Grid2ClDateEnd.Caption       := GridClDateEnd_Caption[pLanguageIndex];
 Grid2ClContract.Caption      := GridClContract_Caption[pLanguageIndex];
 Grid3ClKodVidopl.Caption     := GridClKodVo_Caption[pLanguageIndex];
 Grid3ClNameVidopl.Caption    := GridClNameVo_Caption[pLanguageIndex];
 Grid3ClKodSmeta.Caption      := GridClKodSmeta_Caption[pLanguageIndex];
 Grid3ClKodDepartment.Caption := GridClKodDepartment_Caption[pLanguageIndex];
 Grid3ClSumma.Caption         := GridClSumma_Caption[pLanguageIndex];
 Grid3ClKodSetup.Caption      := GridClKodSetup_Caption[pLanguageIndex];
//------------------------------------------------------------------------------
 SetOptionsBarManager(BarManager);
 SetOptionsGridView(Grid1DBTableView1);
 SetOptionsGridView(Grid2DBTableView1);
 SetOptionsGridView(Grid3DBTableView1);
//------------------------------------------------------------------------------
 pStylesDM := TStylesDM.Create(self);
 Grid1DBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
 Grid2DBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
 Grid3DBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
 Panel3.Color                        := Grid3DBTableView1.Styles.Background.Color;
//------------------------------------------------------------------------------
 pWidth := Panel3.Width-EditDepartment.Width;
//------------------------------------------------------------------------------
 pgrCurrentFilter := CurrentFilter;
 db.Handle := ADb_Handle;
 SetFilter(Self);
//------------------------------------------------------------------------------
 pBarLocate := TZBarLocate.Create(BarManager);
 pBarLocate.DataSet := DSet1;
 pBarLocate.BorderStyle := bbsNone;
 pBarLocate.AddLocateItem('TIN',Grid1ClTin.Caption,[loCaseInsensitive,loPartialKey]);
 pBarLocate.AddLocateItem('FIO',Grid1ClFio.Caption,[loCaseInsensitive,loPartialKey]);
 pBarLocate.DigitalField := 'TIN';
 pBarLocate.DockControl := dxBarDockControl1;
 pBarLocate.DockControl.SunkenBorder := False;
//------------------------------------------------------------------------------
 dxStatusBar1.Panels[0].Text  := ShortCutToText(InsertBtn.ShortCut)+' - '+InsertBtn.Caption;
 dxStatusBar1.Panels[1].Text  := ShortCutToText(UpdateBtn.ShortCut)+' - '+UpdateBtn.Caption;
 dxStatusBar1.Panels[2].Text  := ShortCutToText(DeleteBtn.ShortCut)+' - '+DeleteBtn.Caption;
 dxStatusBar1.Panels[3].Text  := ShortCutToText(DetailBtn.ShortCut)+' - '+DetailBtn.Caption;
 dxStatusBar1.Panels[4].Text  := ShortCutToText(ExitBtn.ShortCut)+' - '+ExitBtn.Caption;
 dxStatusBar2.Panels[0].Text  := ShortCutToText(AddManBtn.ShortCut)+' - '+AddManBtn.Caption;
 dxStatusBar2.Panels[1].Text  := ShortCutToText(RefreshBtn.ShortCut)+' - '+RefreshBtn.Caption;
 dxStatusBar2.Panels[2].Text  := ShortCutToText(FilterBtn.ShortCut)+' - '+FilterBtn.Caption;
 dxStatusBar2.Panels[3].Text  := ShortCutToText(pBarLocate.LocateBtn.ShortCut)+' - '+pBarLocate.LocateBtn.Caption;
 dxStatusBar2.Panels[4].Text  := ShortCutToText(pBarLocate.LocateNextBtn.ShortCut)+' - '+pBarLocate.LocateNextBtn.Caption;

 WindowState := wsMaximized;
end;

procedure TFCurrent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ClearCurrentBuffer(Sender);
Action:=caFree;
end;

procedure TFCurrent.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFCurrent.Panel3Resize(Sender: TObject);
begin
  EditDepartment.Width := Panel3.Width - pWidth;
  EditPrikaz.Width := EditDepartment.Width;
  EditSmeta.Width := EditDepartment.Width;
end;

procedure TFCurrent.FilterBtnClick(Sender: TObject);
begin
 pgrCurrentFilter:=ViewFilter(self,DB.Handle,pgrCurrentFilter);
 if pgrCurrentFilter.ModalResult=mrYes then SetFilter(Sender);
end;

procedure TFCurrent.SetFilter(Sender:TObject);
begin
 if DSet3.Active then DSet3.Close;
 if DSet2.Active Then DSet2.Close;
 if DSet1.Active then DSet1.Close;

 DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CURRENT_SELECT_FIO('+
                               grIfThen(pgrCurrentFilter.Is_KodSetup,IntToStr(pgrCurrentFilter.Kod_Setup1)+','+
                                                                IntToStr(pgrCurrentFilter.Kod_Setup2),'NULL,NULL')+','+
                               grIfThen(pgrCurrentFilter.Is_Man,IntToStr(pgrCurrentFilter.Id_man),'NULL')+','+
                               grIfThen(pgrCurrentFilter.Is_Department,IntToStr(pgrCurrentFilter.Id_department),'NULL')+','+
                               grIfThen(pgrCurrentFilter.Is_VidOpl,IntToStr(pgrCurrentFilter.Id_VidOpl),'NULL')+','+
                               grIfThen(pgrCurrentFilter.Is_Smeta,IntToStr(pgrCurrentFilter.Id_smeta),'NULL')+','+
                               grIfThen(pgrCurrentFilter.Is_Prikaz,''''+grStringPrepareToQueryText(pgrCurrentFilter.Prikaz)+'''','NULL')+') ORDER BY TIN';
 DSet2.SQLs.SelectSQL.text := 'SELECT * FROM GR_CN_DT_STUD_S(?ID_MAN,''T'') order by date_beg descending';
 if pgrCurrentFilter.Is_OperationsFilter then
    DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CURRENT_S_BY_FILTER(?ID_STUD,'+
                                 grIfThen(pgrCurrentFilter.Is_KodSetup,IntToStr(pgrCurrentFilter.Kod_Setup1)+','+
                                                                       IntToStr(pgrCurrentFilter.Kod_Setup2),'NULL,NULL')+','+
                                 grIfThen(pgrCurrentFilter.Is_Department,IntToStr(pgrCurrentFilter.Id_department),'NULL')+','+
                                 grIfThen(pgrCurrentFilter.Is_VidOpl,IntToStr(pgrCurrentFilter.Id_VidOpl),'NULL')+','+
                                 grIfThen(pgrCurrentFilter.Is_Smeta,IntToStr(pgrCurrentFilter.Id_smeta),'NULL')+','+
                                 grIfThen(pgrCurrentFilter.Is_Prikaz,''''+grStringPrepareToQueryText(pgrCurrentFilter.Prikaz)+'''','NULL')+') ORDER BY kod_setup,KOD_VIDOPL'
 else
    DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CURRENT_S_BY_FILTER(?ID_STUD,NULL,NULL,NULL,NULL,NULL,NULL) order by kod_setup,kod_vidopl';

 Dset1.Open;
 DSet2.Open;
 DSet3.Open;

 Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFCurrent.SystemActionExecute(Sender: TObject);
begin
 ShowMessage('DSet1 = '+DSet1.SQLs.SelectSQL.Text+#13+#13+
             'DSet2 = '+DSet1.SQLs.SelectSQL.Text+#13+#13+
             'DSet3 = '+DSet1.SQLs.SelectSQL.Text+#13+#13+
             'ID_MAN = '+VarToStrDef(DSet1['ID_MAN'],'NULL')+#13+
             'ID_STUD = '+grIfThen(VarIsNULL(DSet2['ID_STUD']),'NULL',FloatToStrF(DSet2['ID_STUD'],ffFixed,16,0))+#13+
             'ID_CURRENT = '+grIfThen(VarIsNULL(DSet3['ID_CURRENT']),'NULL',FloatToStrF(DSet3['ID_CURRENT'],ffFixed,16,0)));
end;

procedure TFCurrent.Grid3ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if Trim(AText)<>'' then AText:=grConvertKodSetupToStrPeriod(StrToInt(AText));
end;

procedure TFCurrent.Grid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord<>APrevFocusedRecord then
   Grid3DBTableView1.ViewData.Expand(True);
InsertBtn.Enabled := not(AFocusedRecord=nil);
Grid3DBTableView1FocusedRecordChanged(Grid3DBTableView1,nil,Grid3DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFCurrent.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
Grid2DBTableView1FocusedRecordChanged(Grid2DBTableView1,nil,Grid2DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFCurrent.InsertBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DB.Handle;
Param.Id := DSet2['ID_STUD'];
Param.fs := zcfsInsert;
Key:=DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DSet3.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CURRENT_S_BY_KEY('+IntToStr(Key)+')';
    DSet3.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
    DSet3.Insert;
    DSet3.Post
   end;
Param.Destroy;
end;

procedure TFCurrent.UpdateBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DB.Handle;
Param.Id := DSet3['ID_CURRENT'];
Param.fs := zcfsUpdate;
Key:=DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack);
  if not VarIsNULL(Key) then
   begin
    DSet3.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_CURRENT_S_BY_KEY('+IntToStr(Key)+')';
    DSet3.SQLs.UpdateSQL.Text := 'execute procedure z_empty_proc';
    DSet3.Edit;
    DSet3.Post;
   end;
Param.Destroy;
end;

procedure TFCurrent.DeleteBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DB.Handle;
Param.Id := DSet3['ID_CURRENT'];
Param.fs := zcfsDelete;
  if DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack)=True then
   begin
    DSet3.SQLs.DeleteSQL.Text := 'execute procedure z_empty_proc';
    DSet3.Delete;
   end;
Param.Destroy;
end;

procedure TFCurrent.DetailBtnClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
begin
param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DB.Handle;
Param.Id := DSet3['ID_CURRENT'];
Param.fs := zcfsShowDetails;
DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack);
Param.Destroy;
end;

procedure TFCurrent.RefreshBtnClick(Sender: TObject);
begin
Dset3.Close;
DSet2.Close;
DSet1.Close;
DSet1.Open;
DSet2.Open;
DSet3.Open;
end;

procedure TFCurrent.AddManBtnClick(Sender: TObject);
var Man:variant;
begin
Man := ShowSpPeople(self,db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DSet1.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_MAN_BY_ID('+VarToStr(Man[0])+')';
   DSet1.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   DSet1.Insert;
   DSet1.Post;
  end;
end;

procedure TFCurrent.Grid3DBTableView1FocusedRecordChanged(
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
  EditSmeta.DataBinding.DataSource := nil;
  EditPrikaz.DataBinding.DataSource := nil;
 end
else
 begin
  UpdateBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DetailBtn.Enabled := True;
  EditDepartment.DataBinding.DataSource := DSource3;
  EditSmeta.DataBinding.DataSource := DSource3;
  EditPrikaz.DataBinding.DataSource := DSource3;
 end;
end;

procedure TFCurrent.ClearCurrentBuffer(Sender:TObject);
var reg: TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Grant\CurrentCtrl\Current',True);
  reg.WriteString('IsBuffer','0');
 finally
  reg.Free;
 end;
end;

procedure TFCurrent.dxStatusBar1Resize(Sender: TObject);
var i:byte;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFCurrent.dxStatusBar2Resize(Sender: TObject);
var i:byte;
begin
for i:=0 to dxStatusBar2.Panels.Count-1 do
    dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

end.

