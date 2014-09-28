unit TimeKeepingDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxStyles, cxClasses, cxGridTableView, iniFiles, ActnList, cxTL, FIBQuery,
  pFIBQuery, pFIBStoredProc;

var TuDB_Server,TuDB_Path,TuDB_User,TuDB_PASSWORD:string;

type
  TTimeKeepingDataModule = class(TDataModule)
    DBTimeKeeping: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    TransactionW: TpFIBTransaction;
    StProc: TpFIBStoredProc;
  private
  public
  end;

var
  ExeDM: TTimeKeepingDataModule;

implementation

uses StrUtils;

{$R *.dfm}

end.
