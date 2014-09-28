unit dmReportSvod;

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
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Designer: TfrxDesigner;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    DSet: TpFIBDataSet;
    SetkaDataSet: TpFIBDataSet;
    BaseDataSet: TpFIBDataSet;
    ReportMain: TfrxDBDataset;
    MainDataSet: TpFIBDataSet;
    ReportUPSVODFUNDSZP: TfrxDBDataset;
    DsUPSVODFUNDSZP: TpFIBDataSet;
    ReportUPSVODFUNDSONCAT: TfrxDBDataset;
    DsUPSVODFUNDSONCAT: TpFIBDataSet;
    ReportUPSVODSUMOTPUSK: TfrxDBDataset;
    DsUPSVODSUMOTPUSK: TpFIBDataSet;
    ReportUPSVODPODOHODNALOG: TfrxDBDataset;
    DsUPSVODPODOHODNALOG: TpFIBDataSet;
    ReportUPSVODPROGULS: TfrxDBDataset;
    DsUPSVODPROGULS: TpFIBDataSet;
    ReportUPSVODALLSOTRUDS: TfrxDBDataset;
    DsUPSVODALLSOTRUDS: TpFIBDataSet;
    ReportUPSVODCHISLPERSS: TfrxDBDataset;
    DsUPSVODCHISLPERSS: TpFIBDataSet;
    ReportUPSVODCHISLPERSONCATS: TfrxDBDataset;
    DsUPSVODCHISLPERSONCATS: TpFIBDataSet;
    ReportUPSVODFUNDWTS: TfrxDBDataset;
    DsUPSVODFUNDWTS: TpFIBDataSet;
    ReportUPSVODWORKERZP: TfrxDBDataset;
    DsUPSVODWORKERZP: TpFIBDataSet;
    ReportUPSVODONWORKERSS: TfrxDBDataset;
    DsUPSVODONWORKERSS: TpFIBDataSet;
    ReportUPSVODONWORKEXT: TfrxDBDataset;
    DsUPSVODONWORKEXT: TpFIBDataSet;
    ReportUPSVODWORKERSOVM: TfrxDBDataset;
    DsUPSVODWORKERSOVM: TpFIBDataSet;
    ReportUPSVODEXTSOVMS: TfrxDBDataset;
    DsUPSVODEXTSOVMS: TpFIBDataSet;
    ReportUPSVODCHISLPERSR: TfrxDBDataset;
    DsUPSVODCHISLPERSR: TpFIBDataSet;
    DsUPSVODALLSOTRUDR: TpFIBDataSet;
    ReportUPSVODALLSOTRUDR: TfrxDBDataset;
    DsUPSVODCHISLPERSONCATR: TpFIBDataSet;
    ReportUPSVODCHISLPERSONCATR: TfrxDBDataset;
    DsUPSVODFUNDWTR: TpFIBDataSet;
    ReportUPSVODFUNDWTR: TfrxDBDataset;
    ReportUPSVODONWORKERSR: TfrxDBDataset;
    DsUPSVODONWORKERSR: TpFIBDataSet;
    ReportUPSVODEXTSOVMR: TfrxDBDataset;
    DsUPSVODEXTSOVMR: TpFIBDataSet;
    DsUPSVODPROGULR: TpFIBDataSet;
    ReportUPSVODPROGULR: TfrxDBDataset;
    DsUPSVODRASHNACH: TpFIBDataSet;
    ReportUPSVODRASHNACH: TfrxDBDataset;
    DsUPSVODRASHNEO: TpFIBDataSet;
    ReportUPSVODRASHNEO: TfrxDBDataset;
    ReportUPSVODFUNDSUD: TfrxDBDataset;
    DsUPSVODFUNDSUD: TpFIBDataSet;
    ReportUPSVODWORKREASON: TfrxDBDataset;
    DsUPSVODWORKREASON: TpFIBDataSet;
    ReportUPSVODFUNDALLR: TfrxDBDataset;
    DsUPSVODFUNDALLR: TpFIBDataSet;
    ReportUPSVODFUNDALLS: TfrxDBDataset;
    DsUPSVODFUNDALLS: TpFIBDataSet;
    DsUPSVODRASHPPS: TpFIBDataSet;
    ReportUPSVODRASHPPS: TfrxDBDataset;
    DsUPSVODRASHPOCH: TpFIBDataSet;
    ReportUPSVODRASHPOCH: TfrxDBDataset;
    PDFExp: TfrxPDFExport;
    XMLExp: TfrxXMLExport;
    ReportUPSVODCHISLDISMISS: TfrxDBDataset;
    DsUPSVODCHISLDISMISS: TpFIBDataSet;
    DsUPSVODCHISLACCEPT: TpFIBDataSet;
    ReportUPSVODCHISLACCEPT: TfrxDBDataset;
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
 //ModalResult := mrOk;

end.
