unit ConstSumsDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc,ZMessages,Dialogs,IBase;

type
  TMainDM = class(TDataModule)
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    DSource1: TDataSource;
    DSource2: TDataSource;
    StProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  MainDM: TMainDM;

implementation
{$R *.dfm}

constructor TMainDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle:=AHandle;
 DefaultTransaction.StartTransaction;
//******************************************************************************
 DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SP_CONSTS_S';
 DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CONST_SUSM_S(?ID)';
 DSet1.Open;
 DSet2.Open;
//******************************************************************************
end;

end.
