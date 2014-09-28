unit dmReportCard;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass,
  frxExportXLS, frxExportHTML, frxExportRTF, frxDesgn, frxDBSet,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    CardDataSet: TpFIBDataSet;
    RegardDataSet: TpFIBDataSet;
    StajDataSet: TpFIBDataSet;
    MovingsDataSet: TpFIBDataSet;
    HolydaysDataSet: TpFIBDataSet;
    CardDS: TfrxDBDataset;
    RegardDS: TfrxDBDataset;
    StajDS: TfrxDBDataset;
    MovingsDS: TfrxDBDataset;
    HolydaysDS: TfrxDBDataset;
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
