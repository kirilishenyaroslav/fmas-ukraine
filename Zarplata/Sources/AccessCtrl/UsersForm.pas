unit UsersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid,
  ComCtrls, ToolWin, FIBDatabase,ZProc,
  pFIBDatabase, FIBDataSet, pFIBDataSet, IBase, dxBar, dxBarExtItems;

type
  TFSpUsers = class(TForm)
    DSource: TDataSource;
    DataBase: TpFIBDatabase;
    DSet: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
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
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridClFIO: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridClLogin: TcxGridDBColumn;
    procedure GridDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure RefreshBtnClick(Sender: TObject);
  private
    pResult:Variant;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
    property Result: Variant read pResult;
  end;


function ShowZUsers(AOwner: TComponent; ADBHandle: TISC_DB_HANDLE):variant; stdcall;
 exports ShowZUsers;

implementation

{$R *.dfm}

function ShowZUsers(AOwner: TComponent; ADBHandle: TISC_DB_HANDLE):variant; stdcall;
var Users:TFSpUsers;
begin
  Users := TFSpUsers.Create(AOwner,ADBHandle);
  Users.Show;
end;

constructor TFSpUsers.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);
begin
  inherited Create(ComeComponent);
  DataBase.Handle := ComeDB;
  pResult     := VarArrayCreate([0,0],varVariant);
//******************************************************************************
  DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACC_S_USERS';
  DSet.Open;
end;

procedure TFSpUsers.GridDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then SelectBtnClick(Sender);
if key=#27 then ModalResult:=mrNo;
end;

procedure TFSpUsers.GridDBTableView1DblClick(Sender: TObject);
begin
  SelectBtnClick(Sender);
end;

procedure TFSpUsers.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFSpUsers.SelectBtnClick(Sender: TObject);
begin
  pResult[0]     := DSet['ID_USER'];
  ModalResult:=mrYes;
end;

procedure TFSpUsers.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
If AFocusedRecord = nil then SelectBtn.Enabled := False
                        else SelectBtn.Enabled := True;
end;

procedure TFSpUsers.RefreshBtnClick(Sender: TObject);
begin
  DataSetCloseOpen(DSet,'ID_USER');
end;

end.
