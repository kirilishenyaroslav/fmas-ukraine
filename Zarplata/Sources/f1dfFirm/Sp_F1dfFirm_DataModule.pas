unit Sp_F1dfFirm_DataModule;

interface

uses
  SysUtils, Classes, RxMemDS, DB, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  TDMF1dfFirm = class(TDataModule)
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    RTransaction: TpFIBTransaction;
    WTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DSource2: TDataSource;
    DSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMF1dfFirm: TDMF1dfFirm;

implementation

{$R *.dfm}

end.
