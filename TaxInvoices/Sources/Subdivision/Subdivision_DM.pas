unit Subdivision_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TSubdivisionDM = class(TDataModule)
    DB: TpFIBDatabase;
    SubdivisionDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    SubdivisionDSource: TDataSource;
    pFIBStoredProc: TpFIBStoredProc;
    BudgetDSet: TpFIBDataSet;
    BudgetDSource: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  SubdivisionDM: TSubdivisionDM;


implementation

{$R *.dfm}
constructor TSubdivisionDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
