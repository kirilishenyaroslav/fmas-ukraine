unit uMainOpl_DM;

interface

uses
  SysUtils, Classes, DB, Halcn6db, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase;

type
  TMainOpl_DM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  MainOpl_DM: TMainOpl_DM;}

implementation

{$R *.dfm}

end.
