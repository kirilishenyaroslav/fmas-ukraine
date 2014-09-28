unit SpAllPeople_DataModule;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM:TDM;

implementation

{$R *.dfm}

end.
