unit DM_ReportSvKatPay;

interface

uses
  SysUtils, Classes, frxExportPDF, frxExportXML, DB, FIBDataSet,
  pFIBDataSet, frxExportXLS, frxExportHTML, frxClass, frxExportRTF,
  frxDesgn, FIBQuery, pFIBQuery, pFIBStoredProc, frxDBSet, FIBDatabase,
  pFIBDatabase, frxCross;

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
    Report: TfrxReport;
    frxCrossObject1: TfrxCrossObject;
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
