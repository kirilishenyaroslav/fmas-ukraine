unit Sp_VidOplConstsDataModule;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TDMVidOplConsts = class(TDataModule)
    DB: TpFIBDatabase;
    WTransaction: TpFIBTransaction;
    RTransaction: TpFIBTransaction;
    DSetConsts: TpFIBDataSet;
    DSourceConsts: TDataSource;
    StProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  DMVidOplConsts: TDMVidOplConsts;

implementation

{$R *.dfm}

end.
