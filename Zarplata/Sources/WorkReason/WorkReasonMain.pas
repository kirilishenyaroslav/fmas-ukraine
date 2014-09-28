unit WorkReasonMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems, ZProc,
  Unit_ZGlobal_Consts,  IBase,
  ActnList, ZTypes, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Kernel, cxTextEdit,
  PackageLoad, Unit_NumericConsts, zMessages, dxStatusBar, Menus;

type
  TFZWorkReason = class(TForm)
    BarManager: TdxBarManager;
    UpdateBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridClNameShort: TcxGridDBColumn;
    GridClNameFull: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    DataSource: TDataSource;
    DataBase: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Styles: TcxStyleRepository;
    ReadTransaction: TpFIBTransaction;
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
    GridClKodVidopl: TcxGridDBColumn;
    GridClNameVidopl: TcxGridDBColumn;
    StatusBar: TdxStatusBar;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure UpdateBtnClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    Ins_Resault:Variant;
    Ins_ZFormStyle:TZFormStyle;
    pLanguageIndex:integer;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
    property Resault:variant read Ins_Resault;
    property ZFormStyle:TZFormStyle read Ins_ZFormStyle;
  end;

function ViewForm(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
 exports ViewForm;

implementation

{$R *.dfm}

function ViewForm(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZWorkReason;
begin
   if not IsMDIChildFormShow(TFZWorkReason) then ViewForm  :=  TFZWorkReason.Create(AOwner, DB);
end;


constructor TFZWorkReason.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);
begin
 inherited Create(ComeComponent);
//------------------------------------------------------------------------------
 pLanguageIndex := LanguageIndex;

 Caption := FSpAsupIniWorkReason_Caption[pLanguageIndex];
 RefreshBtn.Caption := RefreshBtn_Caption[pLanguageIndex];
 UpdateBtn.Caption  := UpdateBtn_Caption[pLanguageIndex];
 ExitBtn.Caption    := ExitBtn_Caption[pLanguageIndex];

 GridClNameFull.Caption   := GridClFullName_Caption[pLanguageIndex];
 GridClNameShort.Caption  := GridClShortName_Caption[pLanguageIndex];
 GridClKodVidopl.Caption  := GridClKodVidOpl_Caption[pLanguageIndex];
 GridClNameVidopl.Caption := GridClNameVidopl_Caption[pLanguageIndex];

 StatusBar.Panels[0].Text := ShortCutToText(RefreshBtn.ShortCut)+' - '+RefreshBtn.Caption;
 StatusBar.Panels[1].Text := ShortCutToText(UpdateBtn.ShortCut)+' - '+UpdateBtn.Caption;
 StatusBar.Panels[2].Text := ShortCutToText(ExitBtn.ShortCut)+' - '+ExitBtn.Caption;
//------------------------------------------------------------------------------
 DataBase.Handle := ComeDB;
 DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ASUP_INI_WORK_REASON_S(NULL)';
 DataSet.Open;
 UpdateBtn.Enabled := DataSet.VisibleRecordCount>0;
//------------------------------------------------------------------------------
 WindowState := wsMaximized; 
end;

procedure TFZWorkReason.ExitBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TFZWorkReason.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFZWorkReason.RefreshBtnClick(Sender: TObject);
begin
DataSetCloseOpen(DataSet);
end;

procedure TFZWorkReason.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  UpdateBtn.Enabled:=not(AFocusedRecord=nil);
end;

procedure TFZWorkReason.UpdateBtnClick(Sender: TObject);
var Id:variant;
begin
 Id:=LoadVidOpl(self,DataBase.Handle,zfsModal,0,Id_System);
 if not VarIsNull(Id) then
    try
      StoredProc.StoredProcName := 'Z_ASUP_INI_WORK_REASON_U';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_WORK_REASON').AsInteger := DataSet['ID_WORK_REASON'];
      StoredProc.ParamByName('ID_VIDOPL').AsInteger := Id[0];
      StoredProc.ExecProc;
      StoredProc.Transaction.Commit;

      DataSet.SQLs.RefreshSQL.Text := 'select * from Z_ASUP_INI_WORK_REASON_S('+VarToStr(DataSet['ID_WORK_REASON'])+')';
      DataSet.SQLs.UpdateSQL.Text  := 'execute procedure Z_EMPTY_PROC';
      DataSet.Edit;
      DataSet.Post;
      DataSet.SQLs.UpdateSQL.Clear;
      DataSet.SQLs.RefreshSQL.Clear;
    except
     on E:Exception do
       begin
         ZShowMessage(Error_Caption[pLanguageIndex],e.Message,mtWarning,[mbOk]);
         StoredProc.Transaction.Rollback;
       end;
    end;
end;

procedure TFZWorkReason.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
var i:integer;
begin
  for i:=0 to StatusBar.Panels.Count-1 do
    StatusBar.Panels[i].Width := StatusBar.Width div StatusBar.Panels.Count; 
end;

end.
