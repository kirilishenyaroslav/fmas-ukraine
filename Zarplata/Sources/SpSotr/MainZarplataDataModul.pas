unit MainZarplataDataModul;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL;

var ZDB_Server,ZDB_Path,ZDB_User,ZDB_PASSWORD:string;

type
  TZDataModule = class(TDataModule)
    DBZarplata: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
  private
  public
  end;

var
  ZDataModule: TZDataModule;

implementation

uses StrUtils;

{$R *.dfm}

end.
