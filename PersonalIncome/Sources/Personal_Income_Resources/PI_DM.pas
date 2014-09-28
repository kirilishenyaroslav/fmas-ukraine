unit PI_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TPI_DataMod = class(TDataModule)
    Transaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    DSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PI_DataMod: TPI_DataMod;

implementation

{$R *.dfm}

end.
