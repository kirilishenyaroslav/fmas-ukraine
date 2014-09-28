unit dmReportAwayHoliday;

interface

uses
  SysUtils, Classes, frxExportRTF, frxExportHTML, frxClass, frxExportXLS,
  frxDBSet, frxDesgn, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxExportPDF, frxExportXML;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DSetData: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    ReportDsetData: TfrxDBDataset;
    XLSExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    RTFExport: TfrxRTFExport;
    Report: TfrxReport;
    PDFExp: TfrxPDFExport;
    XMLExp: TfrxXMLExport;
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
