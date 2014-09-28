unit uPrintRegDog_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxBarcode, frxDesgn, frxClass, frxDBSet, frxExportXLS, frxExportRTF,
  frxExportImage, frxExportPDF, frxExportHTML;

type
  TfrmPrintRegDog_DM = class(TDataModule)
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    DBDataset: TfrxDBDataset;
    Report: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxBarCodeObject1: TfrxBarCodeObject;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintRegDog_DM: TfrmPrintRegDog_DM;

implementation

{$R *.dfm}

end.
