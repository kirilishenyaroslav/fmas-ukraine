unit OrderListDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TOrderList_Dm = class(TDataModule)
    pFIBD_OrderList: TpFIBDatabase;
    pFIBDS_OrderList: TpFIBDataSet;
    pFIBTR_OrderList: TpFIBTransaction;
    pFIBTW_OrderList: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrderList_Dm: TOrderList_Dm;

implementation

{$R *.dfm}

end.
