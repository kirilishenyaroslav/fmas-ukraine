unit SettingProv_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TSettingProvDM = class(TDataModule)
    DB: TpFIBDatabase;
    SettingDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    SettingDSource: TDataSource;
    pFIBStoredProc: TpFIBStoredProc;
    BudgetDSet: TpFIBDataSet;
    BudgetDSource: TDataSource;
    UserDSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  SettingProvDM: TSettingProvDM;


implementation

{$R *.dfm}
constructor TSettingProvDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
