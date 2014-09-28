unit SpTuTemplet_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    TransactionR: TpFIBTransaction;
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    DSetTemplet: TpFIBDataSet;
    TransactionW: TpFIBTransaction;
    DSourceTemplet: TDataSource;
    DSetTempletDep: TpFIBDataSet;
    DSourceTempletDep: TDataSource;
    DSetTempletCat: TpFIBDataSet;
    DSourceTempletCat: TDataSource;
    DSetTempletDog: TpFIBDataSet;
    DSourceTempletDog: TDataSource;
    DSetTempletBalDep: TpFIBDataSet;
    DSourceTempletBalDep: TDataSource;
    DSetCat: TpFIBDataSet;
    DSourceCat: TDataSource;
    DSourceTempletBalCat: TDataSource;
    DSetTempletBalCat: TpFIBDataSet;
    DSetTemp: TpFIBDataSet;
    DSourceTemp: TDataSource;
    DSourceWorkContract: TDataSource;
    DSetWorkContract: TpFIBDataSet;
    DSourceEditWarning: TDataSource;
    DsetEditWarning: TpFIBDataSet;
  private
    DM:TDM;
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

end.
