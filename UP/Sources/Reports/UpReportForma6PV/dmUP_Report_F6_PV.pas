unit dmUP_Report_F6_PV;

interface

uses
  SysUtils, Classes, frxExportRTF, frxExportHTML, frxExportXLS,
  frxExportXML, frxClass, frxExportPDF, frxDBSet, frxDesgn, FIBQuery,
  pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, Variants;

type
  TDM = class(TDataModule)
    WriteTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    DSetData: TpFIBDataSet;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Designer: TfrxDesigner;
    ReportDsetData: TfrxDBDataset;
    PDFExp: TfrxPDFExport;
    XMLExp: TfrxXMLExport;
    XLSExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    RTFExport: TfrxRTFExport;
    DsPension: TpFIBDataSet;
    ReportDsPension: TfrxDBDataset;
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
