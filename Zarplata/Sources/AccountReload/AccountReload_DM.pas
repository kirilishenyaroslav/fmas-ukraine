unit AccountReload_DM;

interface

uses
  SysUtils, Classes,ibase,DB, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet,Messages,Dialogs, Controls, Forms, RxMemDS, FIBQuery,
  pFIBQuery, pFIBStoredProc;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSourceMain: TDataSource;
    DSetMain: TpFIBDataSet;
    MemoryData: TRxMemoryData;
    pFIBStoredProc: TpFIBStoredProc;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;



implementation

{$R *.dfm}
constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle:=AHandle;
 ReadTransaction.StartTransaction;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then
  ReadTransaction.Commit;
end;

end.
