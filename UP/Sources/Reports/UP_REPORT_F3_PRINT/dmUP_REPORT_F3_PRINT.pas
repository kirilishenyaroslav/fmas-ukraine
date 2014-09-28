unit dmUP_REPORT_F3_PRINT;

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
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Designer: TfrxDesigner;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    DSetData: TpFIBDataSet;
    DSet: TpFIBDataSet;
    ReportDsetDetail: TfrxDBDataset;
    DSetDataDetail: TpFIBDataSet;
    DSourseDetail: TDataSource;
    RepDSetFac: TfrxDBDataset;
    DSetFac: TpFIBDataSet;
    DSourseFac: TDataSource;
    RepDSetRoot: TfrxDBDataset;
    DSetRoot: TpFIBDataSet;
    DSourseRoot: TDataSource;
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
