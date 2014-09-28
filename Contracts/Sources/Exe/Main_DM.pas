unit Main_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cn_common_funcs;

type
  TMainDM = class(TDataModule)
    Main_DB: TpFIBDatabase;
    ReadTimestampDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSet_synchEDBO: TpFIBDataSet;
  private
    { Private declarations }
  public
    is_admin:boolean;
    CURRENT_TIMESTAMP:  TDatetime;
  end;

var
  MainDM: TMainDM;

implementation

{$R *.dfm}

end.
