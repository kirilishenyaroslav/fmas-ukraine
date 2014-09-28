unit uDocumentType_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TDocumentType_DM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    StProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    DocPropDSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  DocumentType_DM: TDocumentType_DM;}

implementation

{$R *.dfm}

end.
