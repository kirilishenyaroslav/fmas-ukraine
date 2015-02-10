unit uSp_post_DM;

interface

uses
  SysUtils, Classes, frxExportImage, frxExportPDF, frxExportRTF,
  frxExportXLS, frxClass, frxExportTXT, frxBarcode, frxDBSet, frxDesgn,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase;

type
  TfrmPost_DM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction_Read: TpFIBTransaction;
    Transaction_write: TpFIBTransaction;
    DataSet_read: TpFIBDataSet;
    DataSet_context: TpFIBDataSet;
    DataSet_main: TpFIBDataSet;
    DataSource_read: TDataSource;
    DataSource_context: TDataSource;
    DataSource_main: TDataSource;
    StoredProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
  end;

var
  frmPost_DM: TfrmPost_DM;

implementation

{$R *.dfm}

{ TfrmDM }

end.
