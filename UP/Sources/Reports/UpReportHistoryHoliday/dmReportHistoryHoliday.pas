unit dmReportHistoryHoliday;

interface

uses
  SysUtils, Classes, frxExportRTF, frxExportHTML, frxExportXLS,
  frxExportPDF, frxClass, frxExportXML, frxDBSet, frxDesgn, FIBQuery,
  pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    DSetData: TpFIBDataSet;
    DSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    ReportDsetData: TfrxDBDataset;
    XMLExp: TfrxXMLExport;
    PDFExp: TfrxPDFExport;
    XLSExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    RTFExport: TfrxRTFExport;
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
