unit uAdditionalPageData;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TdmPCAdditionalPage = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTrans: TpFIBTransaction;
    ManDSet: TpFIBDataSet;
    WriteTrans: TpFIBTransaction;
    StorProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPCAdditionalPage: TdmPCAdditionalPage;

implementation

{$R *.dfm}

end.
