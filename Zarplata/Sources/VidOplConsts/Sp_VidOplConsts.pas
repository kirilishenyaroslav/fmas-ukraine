unit Sp_VidOplConsts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxBar, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, IBase, dxBarExtItems, cxGridBandedTableView,
  cxTextEdit, cxGridDBBandedTableView,
  ZProc,
  ZTypes,
  Unit_ZGlobal_Consts, zMessages, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxButtonEdit,
  PackageLoad, dxStatusBar,
  ZcxLocateBar;

type
  TFZSp_VidOplConsts = class(TForm)
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
    DB: TpFIBDatabase;
    DSetConsts: TpFIBDataSet;
    DSourceConst: TDataSource;
    WTransaction: TpFIBTransaction;
    RTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    CxGrid1Level1: TcxGridLevel;
    CxGrid1: TcxGrid;
    CxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    ColumnNameShort: TcxGridDBBandedColumn;
    ColumnNameFull: TcxGridDBBandedColumn;
    ColumnVidOpl: TcxGridDBBandedColumn;
    ColumnKodVidOpl: TcxGridDBBandedColumn;
    dxStatusBar1: TdxStatusBar;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ColumnKodVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
  private
    PlanguageIndex:byte;
    PBarLocate:TZBarLocate;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
  end;

function View_FZ_VidOplConsts(AOwner : TComponent; DB:TISC_DB_HANDLE):Variant;stdcall;
 exports View_FZ_VidOplConsts;

implementation

const ClearBtn_Hint               :array[1..2] of string = ('Del - Очистити','Del - Очистить');
const ClearRecordQuestion_Text    :array[1..2] of string = ('Ви дійсно бажаєте'+#13+
                                                             'очистити обраний запис?',
                                                             'Вы действительно хотите'+#13+
                                                             'очистить выбранную запись?');
const GridClNameFull_Caption      :array[1..2] of string = ('Повна назва','Полное название');
const GridClConst_Caption         :array[1..2] of string = ('Константи','Константы');

{$R *.dfm}
function View_FZ_VidOplConsts(AOwner : TComponent; DB:TISC_DB_HANDLE):Variant;
var
ViewForm: TFZSp_VidOplConsts;
begin
if not IsMDIChildFormShow(TFZSp_VidOplConsts) then
  ViewForm:=TFZSp_VidOplConsts.Create(AOwner, DB);
  View_FZ_VidOplConsts:=NULL;
end;

constructor TFZSp_VidOplConsts.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);
var
  i:byte;
begin
inherited Create(ComeComponent);
PlanguageIndex := LanguageIndex;
//******************************************************************************//
DB.Handle:=ComeDB;
RTransaction.StartTransaction;
//******************************************************************************//
cxGrid1DBBandedTableView1.DataController.DataSource:=DSourceConst;
//******************************************************************************//
DSetConsts.SQLs.SelectSQL.Text:='SELECT * FROM Z_DT_VIDOPL_CONST_SELECT(NULL,NULL)';
cxGrid1DBBandedTableView1.DataController.DataSource:=DSourceConst;
//******************************************************************************//
self.UpdateBtn.Caption      := UpdateBtn_Caption[PLanguageIndex];
self.DeleteBtn.Caption      := ClearBtn_Caption[PLanguageIndex];
self.RefreshBtn.Caption     := RefreshBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption        := ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
ColumnNameShort.Caption            := GridClName_Caption[PLanguageIndex];
ColumnVidOpl.Caption               := GridClName_Caption[PLanguageIndex];
ColumnKodVidOpl.Caption            := GridClKod_Caption[PLanguageIndex];
ColumnNameFull.Caption             := GridClNameFull_Caption[PLanguageIndex];
CxGrid1DBBandedTableView1.Bands[0].Caption := GridClConst_Caption[PLanguageIndex];
CxGrid1DBBandedTableView1.Bands[1].Caption := GridClNameVidOpl_Caption[PLanguageIndex];
//******************************************************************************//
dxStatusBar1.Panels[0].Text   := UpdateBtn_Hint[PLanguageIndex];
dxStatusBar1.Panels[1].Text   := ClearBtn_Hint[PLanguageIndex];
dxStatusBar1.Panels[2].Text   := RefreshBtn_Hint[PLanguageIndex];
dxStatusBar1.Panels[3].Text   := ExitBtn_Hint[PLanguageIndex];
dxStatusBar1.Panels[4].Text   := LocateBtn_Hint[PLanguageIndex];
dxStatusBar1.Panels[5].Text   := LocateNextBtn_Hint[PLanguageIndex];
for i:=0 to dxStatusBar1.Panels.Count-1 do
  dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
//******************************************************************************
PBarLocate:=TZBarLocate.Create(BarManager);

PBarLocate.DataSet := DSetConsts;
PBarLocate.BorderStyle := bbsNone;
PBarLocate.AddLocateItem('NAME_SHORT',
                          ColumnNameShort.Caption,
                          [loCaseInsensitive]);
PBarLocate.DigitalField := 'NAME_SHORT';
PBarLocate.DockControl  := BarDockLocate;
//******************************************************************************
self.FormStyle         := fsMDIChild;
self.BorderStyle       := bsSizeable;
self.Position          := poMainFormCenter;
end;


procedure TFZSp_VidOplConsts.FormCreate(Sender: TObject);
begin
  DB.Open;
  DSetConsts.Open;
end;

procedure TFZSp_VidOplConsts.DeleteBtnClick(Sender: TObject);
begin
  if(DSetConsts['ID_CONSTVIDOPL']<>NULL) then
  if ZShowMessage(Caption_Delete[PlanguageIndex],
    ClearRecordQuestion_Text[PlanguageIndex],
    mtConfirmation,[mbYes,mbNo])=mrYes then
  try
    StProc.Database                               := DB;
    StProc.Transaction                            := WTransaction;
    StProc.Transaction.StartTransaction;
    StProc.StoredProcName                         := 'Z_DT_VIDOPL_CONST_DELETE';
    StProc.Prepare;
    if(DSetConsts['ID_CONSTVIDOPL']<>NULL) then
      StProc.ParamByName('ID_CONSTVIDOPL').AsInteger:=DSetConsts['ID_CONSTVIDOPL'];
    StProc.ExecProc;
    StProc.Transaction.Commit;
    DSetConsts.SQLs.RefreshSQL.Text:='select * from Z_DT_VIDOPL_CONST_SELECT(?ID_CONST,NULL)';
    DSetConsts.Refresh;
  except
    on E: Exception do
    begin
      ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StProc.Transaction.Rollback;
    end;
  end;
end;

procedure TFZSp_VidOplConsts.RefreshBtnClick(Sender: TObject);
begin
  DSetConsts.SQLs.RefreshSQL.Text:='select * from Z_DT_VIDOPL_CONST_SELECT(?ID_CONST,NULL)';
  DSetConsts.FullRefresh;
end;

procedure TFZSp_VidOplConsts.ColumnKodVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   DB.Handle,zfsModal,
                   ValueFieldZSetup(DB.Handle,'ID_VO_PROP_CURRENT'),
                   ValueFieldZSetup(DB.Handle,'Z_ID_SYSTEM'));
 if VarArrayDimCount(VidOpl)>0 then
 begin
  try
    StProc.Database                               := DB;
    StProc.Transaction                            := WTransaction;
    StProc.Transaction.StartTransaction;
    StProc.StoredProcName                         := 'Z_DT_VIDOPL_CONST_UPDATE';
    StProc.Prepare;
    if(DSetConsts['ID_CONSTVIDOPL']<>NULL) then
      StProc.ParamByName('ID_CONSTVIDOPL').AsInteger:=DSetConsts['ID_CONSTVIDOPL'];
    StProc.ParamByName('ID_CONST').AsInteger:=DSetConsts['ID_CONST'];
    StProc.ParamByName('ID_VIDOPL').AsInteger:=VidOpl[0];
    StProc.ExecProc;
    StProc.Transaction.Commit;
    DSetConsts.SQLs.RefreshSQL.Text:='select * from Z_DT_VIDOPL_CONST_SELECT(?ID_CONST,NULL)';
    DSetConsts.Refresh;
  except
    on E: Exception do
    begin
      ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      StProc.Transaction.Rollback;
    end;
  end;
 end
end;

procedure TFZSp_VidOplConsts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if RTransaction.InTransaction then RTransaction.Commit;
  if Self.FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZSp_VidOplConsts.ExitBtnClick(Sender: TObject);
begin
  self.Close;
end;

procedure TFZSp_VidOplConsts.FormResize(Sender: TObject);
var
  i:byte;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFZSp_VidOplConsts.UpdateBtnClick(Sender: TObject);
begin
  ColumnKodVidOplPropertiesButtonClick(Sender, 0);
end;

end.
