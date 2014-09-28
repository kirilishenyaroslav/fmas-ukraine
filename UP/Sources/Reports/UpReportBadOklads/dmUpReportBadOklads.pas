Unit dmUpReportBadOklads;

Interface

Uses
    SysUtils, Classes, frxExportXML, frxExportPDF, frxExportXLS, frxClass,
    frxDBSet, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
    pFIBStoredProc, frxDesgn, frxExportHTML, frxExportRTF, FIBDatabase,
    pFIBDatabase;

Type
    TDM = Class(TDataModule)
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        RTFExport: TfrxRTFExport;
        HTMLExport: TfrxHTMLExport;
        Designer: TfrxDesigner;
        StoredProc: TpFIBStoredProc;
        WriteTransaction: TpFIBTransaction;
        DSetData: TpFIBDataSet;
        DSet: TpFIBDataSet;
        ReportDsetData: TfrxDBDataset;
        XLSExport: TfrxXLSExport;
        PDFExp: TfrxPDFExport;
        XMLExp: TfrxXMLExport;
        Report: TfrxReport;
    private
        { Private declarations }
    public
        { Public declarations }
    End;

Var
    DM: TDM;

Implementation

{$R *.dfm}

End.

