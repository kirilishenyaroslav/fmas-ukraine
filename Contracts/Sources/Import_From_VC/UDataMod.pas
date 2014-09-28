unit UDataMod;

interface

uses
  SysUtils, Classes,  Ibase, FIBDatabase, pFIBDatabase;

type
  TDataModuleForBase = class(TDataModule)
    DatabaseMain: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    TransactionWR: TpFIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    constructor CreateM(AOwner: TComponent; DataBasemain: TISC_DB_HANDLE); reintroduce; overload;
  end;

var
  DataModuleForBase: TDataModuleForBase;

implementation

{$R *.dfm}

constructor TDataModuleForBase.CreateM(AOwner: TComponent; DataBasemain: TISC_DB_HANDLE);
begin
    inherited Create (AOwner);
    DatabaseMain.Handle := DataBasemain;
    //TransactionRead.DefaultDatabase := DatabaseMain;
    //TransactionWR.DefaultDatabase   := DatabaseMain;
    DatabaseMain.Connected := true;
end;

end.
