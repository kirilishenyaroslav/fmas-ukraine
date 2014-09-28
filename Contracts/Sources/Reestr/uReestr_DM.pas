unit uReestr_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TfrmReestr_DM = class(TDataModule)
    DB: TpFIBDatabase;
    Tran_Read: TpFIBTransaction;
    Tran_write: TpFIBTransaction;
    StorProc_add: TpFIBStoredProc;
    DataSet_Reg: TpFIBDataSet;
    Source_Reg: TDataSource;
    DataSet_read: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestr_DM: TfrmReestr_DM;

implementation

{$R *.dfm}

end.
