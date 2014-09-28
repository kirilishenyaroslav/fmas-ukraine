unit ViewClBankAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Ibase, Buttons, ToolWin, ComCtrls, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, cxGridBandedTableView, cxClasses, cxStyles,
  cxGridTableView, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, StdCtrls;

type
  TfrmViewClBank = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    StyleRepository: TcxStyleRepository;
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
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Transaction: TpFIBTransaction;
    Database: TpFIBDatabase;
    pFIBDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    NATIVE_RS: TcxGridDBColumn;
    DATE_VIP: TcxGridDBColumn;
    NUM_DOC: TcxGridDBColumn;
    DATE_DOC: TcxGridDBColumn;
    CUSTOMER_NAME: TcxGridDBColumn;
    SUM_DOC_PR: TcxGridDBColumn;
    SUM_DOC_RAS: TcxGridDBColumn;
    TYPE_DOC: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TComponent;DBH:TISC_DB_HANDLE);overload;
    { Public declarations }
  end;
  function ViewClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  exports ViewClBank;
var
  frmViewClBank: TfrmViewClBank;

implementation

{$R *.dfm}
function ViewClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
var
  View: TfrmViewClBank;
begin
  View:=TfrmViewClBank.Create(AOwner,DB);
end;

constructor TfrmViewClBank.Create(AOwner : TComponent;DBH:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  Database.Handle:=DBH;
  pFIBDataSet.Active:=false;
  pFIBDataSet.Active:=true;
end;

procedure TfrmViewClBank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
