unit Sp_VidOpl_DataModule;

interface

uses
  SysUtils, Classes, RxMemDS, DB, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  TDMVidOpl = class(TDataModule)
    DB: TpFIBDatabase;
    DSetUD1: TpFIBDataSet;
    DSetUD2: TpFIBDataSet;
    RTransaction: TpFIBTransaction;
    WTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DSourceUD2: TDataSource;
    DSourceUD1: TDataSource;
    DSetNar1: TpFIBDataSet;
    DSourceNar1: TDataSource;
    DSourceNar2: TDataSource;
    DSetNar2: TpFIBDataSet;
    DSetCor1: TpFIBDataSet;
    DSourceCor1: TDataSource;
    DSetConsts1: TpFIBDataSet;
    DSourceConsts1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVidOpl: TDMVidOpl;

implementation

{$R *.dfm}

end.
