unit SpWorkModeEditDays_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TDModule = class(TDataModule)
    RTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    DSetDays: TpFIBDataSet;
    DSourceDays: TDataSource;
    WTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DModule: TDModule;

implementation

{$R *.dfm}
uses  SpWorkModeEditDays;

end.
