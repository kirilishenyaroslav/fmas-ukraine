unit TuSpDog_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    DSource1: TDataSource;
    TransactionR: TpFIBTransaction;
    DSource11: TDataSource;
    DSet11: TpFIBDataSet;
    DSource111: TDataSource;
    DSet111: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
