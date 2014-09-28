unit dmReportShRSocrForm;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass,
  frxExportXLS, frxExportHTML, frxExportRTF, frxDesgn, frxDBSet,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxExportPDF,
  frxExportXML;

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
    DSetData: TpFIBDataSet;
    DSet: TpFIBDataSet;
    PDFExp: TfrxPDFExport;
    XMLExp: TfrxXMLExport;
    ReportShrFio: TfrxDBDataset;
    ShrFioSet: TpFIBDataSet;
    DSource: TDataSource;
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
