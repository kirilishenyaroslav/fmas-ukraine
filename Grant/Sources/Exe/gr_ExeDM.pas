unit gr_ExeDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL;

var grDB_Server,grDB_Path,grDB_User,grDB_PASSWORD:string;

type
  TExeDM = class(TDataModule)
    MainDB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
  private
  public
  end;

var
  ExeDM: TExeDM;

implementation

uses StrUtils;

{$R *.dfm}

end.
