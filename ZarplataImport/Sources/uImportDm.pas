unit uImportDm;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase;

type
  TImportDm = class(TDataModule)
    MainDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportDm: TImportDm;

implementation

{$R *.dfm}

end.
