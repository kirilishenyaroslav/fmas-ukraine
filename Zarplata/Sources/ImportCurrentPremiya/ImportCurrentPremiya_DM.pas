unit ImportCurrentPremiya_DM;

interface

uses
  SysUtils, Classes,ibase,DB, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet,Messages,Dialogs, Controls, Forms, RxMemDS, FIBQuery,
  pFIBQuery, pFIBStoredProc;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTranzaction: TpFIBTransaction;
    DSetMain: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    DSourceMain: TDataSource;
    DSetImport: TpFIBDataSet;
    DSetType: TpFIBDataSet;
    DSourseType: TDataSource;
    MemoryData: TRxMemoryData;
    pFIBStoredProc: TpFIBStoredProc;
    DSet_: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle:=AHandle;
 ReadTranzaction.StartTransaction;
end;
procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTranzaction.InTransaction then ReadTranzaction.Commit;
end;

end.
