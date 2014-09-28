unit UPochasOrdersNS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxTextEdit, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Ibase, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet;

type
  TfrmPochasOrders = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClOklad: TcxGridDBColumn;
    Grid1ClDateBeg: TcxGridDBColumn;
    Grid1ClDateEnd: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
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
    WorkDatabase: TpFIBDatabase;
    OrdersDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    OrdersDataSource: TDataSource;
    Grid1DBTableView1DBColumn1: TcxGridDBColumn;
    Grid1DBTableView1DBColumn2: TcxGridDBColumn;
    Grid1DBTableView1DBColumn3: TcxGridDBColumn;
    Grid1DBTableView1DBColumn4: TcxGridDBColumn;
    Grid1DBTableView1DBColumn5: TcxGridDBColumn;
    Grid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxStyle15: TcxStyle;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    FId_man:Int64;
    FKodSetup:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHanlde:TISC_DB_HANDLE; id_man:Int64; kod_setup:Integer);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmPochasOrders.Create(AOwner: TComponent; DBHanlde: TISC_DB_HANDLE; id_man: Int64; kod_setup: Integer);
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHanlde;
     ReadTransaction.StartTransaction;
     FKodSetup:=kod_setup;
     FId_man  :=id_man;

     OrdersDataSet.SelectSQL.Text:=' SELECT * FROM Z_POCHAS_GET_ORDERS_BY_PC('+IntToStr(FKodSetup)+','+IntToStr(FId_man)+') ';
     OrdersDataSet.Open;
     FId_man:=id_man;
     FKodSetup:=kod_setup;
end;

procedure TfrmPochasOrders.cxButton1Click(Sender: TObject);
begin
     if OrdersDataSet.RecordCount>0
     then begin
               ModalResult:=mrYes;
     end;
end;

procedure TfrmPochasOrders.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
