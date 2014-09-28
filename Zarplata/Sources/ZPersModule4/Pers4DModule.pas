unit Pers4DModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TDModule = class(TDataModule)
    DSetWorkDog: TpFIBDataSet;
    TransactionR: TpFIBTransaction;
    TransactionW: TpFIBTransaction;
    SProc: TpFIBStoredProc;
    DSourceWorkDog: TDataSource;
    DB: TpFIBDatabase;
    DSetForm: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DModule: TDModule;

implementation

{$R *.dfm}

end.
