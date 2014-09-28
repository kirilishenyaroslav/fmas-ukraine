unit JO5_DataModule;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase;

type
  TJO5_DM = class(TDataModule)
    JO5_DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JO5_DM: TJO5_DM;

implementation

{$R *.dfm}

end.
