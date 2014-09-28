unit Current_Ctrl_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, ZTypes, ZProc, IBase, UpKernelUnit;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DSetAllData: TpFIBDataSet;
    DSourceMoving: TDataSource;
    DSetMoving: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    DSourceAllData: TDataSource;
    DSetDelMass: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
    procedure WriteTransactionAfterStart(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function Activate(DB_Handle:TISC_DB_HANDLE):boolean;
  end;

implementation

uses Variants;

{$R *.dfm}

constructor TDM.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
end;

function TDM.Activate(DB_Handle:TISC_DB_HANDLE):boolean;
begin
 DB.Handle := DB_Handle;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

procedure TDM.WriteTransactionAfterStart(Sender: TObject);
begin
  UpKernelUnit.StartHistory(WriteTransaction,ValueFieldZSetup(DB.Handle,'GR_ID_SYSTEM'));
end;

end.
