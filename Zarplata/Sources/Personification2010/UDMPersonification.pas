unit UDMPersonification;

interface

uses
  SysUtils, Classes, frxDesgn, frxClass, frxDBSet, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet,ibase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    PrintDataSet: TpFIBDataSet;
    TransRead: TpFIBTransaction;
    Report: TfrxReport;
    DBDataset: TfrxDBDataset;
    Designer: TfrxDesigner;
    DSetConst: TpFIBDataSet;
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
 TransRead.StartTransaction;
end;

end.
