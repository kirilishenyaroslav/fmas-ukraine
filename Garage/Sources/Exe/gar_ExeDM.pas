unit gar_ExeDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL, DB,
  FIBDataSet, pFIBDataSet;

//var grDB_Server,grDB_Path,grDB_User,grDB_PASSWORD:string;

type
  TExeDM = class(TDataModule)
    MainDB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
  end;

var
  ExeDM: TExeDM;

implementation

uses StrUtils;

{$R *.dfm}

procedure TExeDM.DataModuleDestroy(Sender: TObject);
begin
  if ReadTransaction.InTransaction then ReadTransaction.Rollback;
end;

end.
