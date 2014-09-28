unit History;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridTableView, cxTL, cxGridCustomTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, iBase,
  LoadDogManedger, FIBDatabase, pFIBDatabase, StdCtrls, Buttons, ExtCtrls;

type
  TfrmHistory = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    pFIBDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    Panel1: TPanel;
    ToolButton_view: TSpeedButton;
    ToolButton_del: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton_viewClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create (AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; id_dog_1: Variant; frmStyle:TFormStyle);reintroduce;

    { Public declarations }
  end;

  function History_dog(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; id_dog: Variant; frmStyle:TFormStyle):Variant; stdcall;
  exports  History_dog;

implementation

{$R *.dfm}

constructor TfrmHistory.Create(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; id_dog_1: Variant; frmStyle:TFormStyle);
begin
  inherited Create (Aowner);
  pFIBDatabase.Handle := DBHANDLE;
  FormStyle := frmStyle;
  pFIBDataSet.Database := pFIBDatabase;
  pFIBDataSet.Transaction := pFIBTransactionRead;
  pFIBDataSet.Active := false;
  pFIBDataSet.ParamByName('id_dog').AsInt64 := StrToInt64(VarToStr(id_dog_1));
  pFIBDataSet.Active := true;
end;


function History_dog(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; id_dog: Variant; frmStyle:TFormStyle):Variant;
var
  hist: TfrmHistory;
begin
  Hist:=TfrmHistory.Create(AOwner, DBHANDLE, id_dog, frmStyle);
  if hist.FormStyle = fsNormal then hist.ShowModal;
end;

procedure TfrmHistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmHistory.ToolButton_viewClick(Sender: TObject);
begin
  LoadDogManedger.LoadShablon(Owner.Owner.Owner, pFIBDatabase.Handle, fsMDIChild, pFIBDataSet.FieldByName('ID_History').AsVariant, 'hist', pFIBDataSet.FieldByName('id_tip_dog').AsVariant, PChar(pFIBDataSet.FieldByName('name_shablon').asString), Nil);
end;

procedure TfrmHistory.ToolButton_delClick(Sender: TObject);
begin
  Close;
end;

end.
