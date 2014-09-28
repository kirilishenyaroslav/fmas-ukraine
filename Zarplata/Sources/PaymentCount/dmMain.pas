unit dmMain;

interface

uses
  SysUtils, Classes, FIBDataSet, DB, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TMainDm = class(TDataModule)
    MainDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    CheckOrdersDataSet: TpFIBDataSet;
    CheckOrdersDataSetNUM_ORDER: TFIBStringField;
    CheckOrdersDataSetDATE_ORDER: TFIBDateField;
    CheckOrdersDataSetNOTE: TFIBStringField;
    CheckOrdersDataSetID_ORDER: TFIBIntegerField;
    CheckOrdersDataSetNAME_TYPE: TFIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDm: TMainDm;

implementation

{$R *.dfm}

end.
