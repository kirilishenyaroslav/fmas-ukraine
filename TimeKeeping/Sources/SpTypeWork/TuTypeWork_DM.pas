unit TuTypeWork_DM;

interface

uses
  SysUtils, Classes,   DB, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    StTransaction: TpFIBTransaction;
    DSourceMain: TDataSource;
    DSetMain: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    DSourcePermis: TDataSource;
    DSetPermis: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
