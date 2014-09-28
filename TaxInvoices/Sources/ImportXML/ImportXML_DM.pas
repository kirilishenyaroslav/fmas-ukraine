unit ImportXML_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, ibase,DB, FIBDataSet, pFIBDataSet;

type
  TImportXMLDM = class(TDataModule)
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    UserDSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  ImportXMLDM: TImportXMLDM;

implementation

{$R *.dfm}
constructor TImportXMLDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;
end.
