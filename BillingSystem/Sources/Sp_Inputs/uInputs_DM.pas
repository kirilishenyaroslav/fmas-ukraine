unit uInputs_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, RxMemDS;

type
  TInputs_DM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    DataSource_Read: TDataSource;
    KodInputDS: TDataSource;
    InputParentDS: TDataSource;
    PercentPayDS: TDataSource;
    TnEngineerDS: TDataSource;
    TypeCustServDS: TDataSource;
    CustServDS: TDataSource;
    KodCustServDS: TDataSource;
    RegionDS: TDataSource;
    CityAreaDS: TDataSource;
    TypeStreetDS: TDataSource;
    StreetDS: TDataSource;
    DomDS: TDataSource;
    DataSet_context: TpFIBDataSet;
    DataSet_TreeList: TpFIBDataSet;
    DataSource_TreeList: TDataSource;
    KodInputDSet: TpFIBDataSet;
    InputParentDSet: TpFIBDataSet;
    PercentPayDSet: TpFIBDataSet;
    TnEngineerDSet: TpFIBDataSet;
    TypeCustServDSet: TpFIBDataSet;
    CustServDSet: TpFIBDataSet;
    KodCustServDSet: TpFIBDataSet;
    RegionDSet: TpFIBDataSet;
    CityAreaDSet: TpFIBDataSet;
    TypeStreetDSet: TpFIBDataSet;
    StreetDSet: TpFIBDataSet;
    DomDSet: TpFIBDataSet;
    TempDSet: TpFIBDataSet;
    ConstsDSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses  uInputs_main, Math, Variants;

{$R *.dfm}

end.
