unit dmMainExport;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, Halcn6db,IBase, FIBDataSet, pFIBDataSet;

type
  TMainDMexport = class(TDataModule)
    MainDataBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    InsertProc: TpFIBStoredProc;
    INFOKOM: THalcyonDataSet;
    DSetAccountData: TpFIBDataSet;
  private
    { Private declarations }
  public
    
  end;



var
  MainDMexport: TMainDMexport;

implementation

function ShowExportAccount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
                            stdcall;
begin

end;


{$R *.dfm}

end.
