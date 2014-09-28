unit DM_SvodSrudMoving;

interface

uses
  SysUtils, Classes, frxClass, DB, frxExportPDF, frxExportXML, FIBDataSet,
  pFIBDataSet, frxExportXLS, frxExportHTML, frxExportRTF, frxDesgn,
  FIBQuery, pFIBQuery, pFIBStoredProc, frxDBSet, FIBDatabase, pFIBDatabase;

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
    DataSetInfo: TpFIBDataSet;
    ReportDsetDataInfo: TfrxDBDataset;
    DataSourceInfo: TDataSource;
    DSet: TpFIBDataSet;
    DataSource: TDataSource;
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
