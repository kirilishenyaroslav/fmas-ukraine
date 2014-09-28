unit EmailProtEX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxHyperLinkEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxTextEdit;

type
  TfrmEmailProtokolEx = class(TForm)
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    WorkDatabase1: TpFIBDatabase;
    ProtoDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    DataSource1: TDataSource;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;dbhandle:TISC_DB_HANDLE;id_use:Int64;id_contact:Int64);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmEmailProtokolEx.Create(AOwner: TComponent; dbhandle: TISC_DB_HANDLE; id_use: Int64; id_contact:Int64);
begin
     inherited Create(AOwner);
     WorkDatabase1.Handle:=dbhandle;
     ReadTransaction.StartTransaction;
     ProtoDataSet.SelectSQL.Text:='SELECT * FROM Z_EMAIL_PROTOCOL_SEL('+IntToStr(id_contact)+')';
     ProtoDataSet.Open;
end;

end.
