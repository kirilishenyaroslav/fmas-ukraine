unit TaxInvoicesFilter_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, ibase,DB, FIBDataSet, pFIBDataSet, frxClass, frxDBSet,
  frxDesgn, RxMemDS, frxExportXLS, frxExportPDF, frxExportRTF;

type
  TTaxInvoicesFilterDM = class(TDataModule)
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    UserDSet: TpFIBDataSet;
    CustomerDSet: TpFIBDataSet;
    CustomerVidNaklDSet: TpFIBDataSet;
    CustomerOtrNaklDSet: TpFIBDataSet;
    Report: TfrxReport;
    frxDesigner1: TfrxDesigner;
    CustomerVidNaklfrxDBDset: TfrxDBDataset;
    CustomerOtrNaklfrxDBDataset: TfrxDBDataset;
    SubdivisionFilterDSet: TpFIBDataSet;
    SubdivisionFilterfrxDBDset: TfrxDBDataset;
    BudgetDSet: TpFIBDataSet;
    BudgetfrxDBDset: TfrxDBDataset;
    TypeNaklDSet: TpFIBDataSet;
    TypeNaklfrxDBDSet: TfrxDBDataset;
    SubdivisionDSet: TpFIBDataSet;
    SubdivisionDSource: TDataSource;
    MemoryData: TRxMemoryData;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  TaxInvoicesFilterDM: TTaxInvoicesFilterDM;

implementation

{$R *.dfm}
constructor TTaxInvoicesFilterDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;
end.
