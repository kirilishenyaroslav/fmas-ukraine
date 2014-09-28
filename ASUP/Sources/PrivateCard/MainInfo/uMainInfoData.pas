unit uMainInfoData;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TdmPCMainInfo = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPCMainInfo: TdmPCMainInfo;

implementation

{$R *.dfm}

end.
