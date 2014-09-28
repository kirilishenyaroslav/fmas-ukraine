unit dmForma6_P4;

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
    Report: TfrxReport;
    PDFExport: TfrxPDFExport;
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
