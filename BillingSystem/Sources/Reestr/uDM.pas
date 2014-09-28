//******************************************************************************
//* Проект "Горводоканал"                                                      *
//* Выполнил: Перчак А.Л. 2010г                                                *
//******************************************************************************
unit uDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList;

type
  TfrmReestr_DM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    CURRENT_DATE : TDateTime;
    MAX_TIMESTAMP : TDateTime;
  end;

var
  frmReestr_DM: TfrmReestr_DM;

implementation

{$R *.dfm}



end.
