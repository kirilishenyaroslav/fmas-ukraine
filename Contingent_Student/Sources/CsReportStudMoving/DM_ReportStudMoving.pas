unit DM_ReportStudMoving;

interface

uses
  SysUtils, Classes, frxCross, frxClass, DB, frxExportPDF, frxExportXML,
  FIBDataSet, pFIBDataSet, frxExportXLS, frxExportHTML, frxExportRTF,
  frxDesgn, FIBQuery, pFIBQuery, pFIBStoredProc, frxDBSet, FIBDatabase,
  pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ReportDsetData: TfrxDBDataset;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Designer: TfrxDesigner;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    DSetDataReport: TpFIBDataSet;
    XMLExp: TfrxXMLExport;
    PDFExp: TfrxPDFExport;
    DataSetKurs: TpFIBDataSet;
    ReportDsetDataKurs: TfrxDBDataset;
    DataSourceKurs: TDataSource;
    DSet: TpFIBDataSet;
    DataSource: TDataSource;
    frxCrossObject1: TfrxCrossObject;
    Report: TfrxReport;
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
