unit uSt_married_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet, frxDesgn;

type
  TfrmMarried_DM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction_Read: TpFIBTransaction;
    dstSelAll: TpFIBDataSet;
    frxSelAll: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    Report_main: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarried_DM: TfrmMarried_DM;

implementation

{$R *.dfm}

end.
