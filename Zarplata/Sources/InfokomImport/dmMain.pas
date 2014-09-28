unit dmMain;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, Halcn6db,IBase;

type
  TMainDM = class(TDataModule)
    MainDataBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    InsertProc: TpFIBStoredProc;
    INFOKOM: THalcyonDataSet;
  private
    { Private declarations }
  public
    
  end;



var
  MainDM: TMainDM;

implementation

function ShowInfokomImport(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
                            stdcall;
begin

end;


{$R *.dfm}

end.
