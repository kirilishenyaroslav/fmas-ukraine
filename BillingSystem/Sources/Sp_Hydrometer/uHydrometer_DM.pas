unit uHydrometer_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, RxMemDS;

type
  TdmHydrometer_DM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    DataSource_Read: TDataSource;
    KodInputDS: TDataSource;
    HydrTypeDS: TDataSource;
    HydrVidDS: TDataSource;
    ServiceDS: TDataSource;
    InvNumberDS: TDataSource;
    InitStateDS: TDataSource;
    NomerTUDS: TDataSource;
    RegionDS: TDataSource;
    CityAreaDS: TDataSource;
    StreetDS: TDataSource;
    TypeStreetDS: TDataSource;
    TempDSet: TpFIBDataSet;
    LocationDS: TDataSource;
    CustServDS: TDataSource;
    KodCustServDS: TDataSource;
    StateDS: TDataSource;
    LastStateDS: TDataSource;
    CustomerSetDS: TDataSource;
    TypeCustServDS: TDataSource;
    OwnerDS: TDataSource;
    KodInputDSet: TpFIBDataSet;
    HydrTypeDSet: TpFIBDataSet;
    HydrVidDSet: TpFIBDataSet;
    ServiceDSet: TpFIBDataSet;
    InvNumberDSet: TpFIBDataSet;
    InitStateDSet: TpFIBDataSet;
    NomerTUDSet: TpFIBDataSet;
    StateDSet: TpFIBDataSet;
    CustomerSetDSet: TpFIBDataSet;
    LastSateDSet: TpFIBDataSet;
    LocationDSet: TpFIBDataSet;
    TypeCustServDSet: TpFIBDataSet;
    KodCustServDSet: TpFIBDataSet;
    CustServDSet: TpFIBDataSet;
    RegionDSet: TpFIBDataSet;
    CityAreaDSet: TpFIBDataSet;
    StreetDSet: TpFIBDataSet;
    TypeStreetDSet: TpFIBDataSet;
    OwnerDSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
