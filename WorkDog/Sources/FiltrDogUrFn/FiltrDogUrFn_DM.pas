unit FiltrDogUrFn_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,Ibase,
  FIBQuery, pFIBQuery, pFIBStoredProc, frxExportPDF, frxExportXLS,
  frxClass, frxExportHTML, frxDBSet, frxDesgn, frxExportXML;

type
  TFiltrDogUrFnDM = class(TDataModule)
    DB: TpFIBDatabase;
    TransWrite: TpFIBTransaction;
    TransRead: TpFIBTransaction;
    DSetDog: TpFIBDataSet;
    DSetSmet: TpFIBDataSet;
    DSourceDog: TDataSource;
    DSourceSmet: TDataSource;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBQuery1: TpFIBQuery;
    DSetUrOb: TpFIBDataSet;
    DSetFnOb: TpFIBDataSet;
    DSetPlat: TpFIBDataSet;
    DSourceUrOb: TDataSource;
    DSourceFnOb: TDataSource;
    DSourcePlat: TDataSource;
    DataSet: TpFIBDataSet;
    DSetGroupDog: TpFIBDataSet;
    DSourceGroupDog: TDataSource;
    Report: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxDBDsetDog: TfrxDBDataset;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxXMLExport1: TfrxXMLExport;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  FiltrDogUrFnDM: TFiltrDogUrFnDM;

implementation

{$R *.dfm}
constructor TFiltrDogUrFnDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 //ReadTransaction.StartTransaction;
end;

end.
