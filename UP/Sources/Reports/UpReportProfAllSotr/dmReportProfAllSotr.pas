unit dmReportProfAllSotr;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass,
  frxExportXLS, frxExportHTML, frxExportRTF, frxDesgn, frxDBSet,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxExportXML,
  frxExportPDF;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ReportDsetData: TfrxDBDataset;
    ReportDSetGlobalData: TfrxDBDataset;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Designer: TfrxDesigner;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    DSetData: TpFIBDataSet;
    DSetGlobalData: TpFIBDataSet;
    DSet: TpFIBDataSet;
    DataSource1: TDataSource;
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