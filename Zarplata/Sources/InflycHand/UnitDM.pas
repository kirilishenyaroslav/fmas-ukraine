unit UnitDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ZTypes, IBAse, FIBQuery, pFIBQuery, pFIBStoredProc, gr_uCommonProc;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    pFIBDatabase1: TpFIBDatabase;
    pFIBDataSet1: TpFIBDataSet;
    RTransaction: TpFIBTransaction;
    WTransaction: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    constructor create(AOwner:TComponent; DB:TISC_DB_HANDLE); reintroduce;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

constructor TDM.create(AOwner:TComponent; DB:TISC_DB_HANDLE);
begin
  inherited create(AOwner);
  pFIBDatabase1.Handle:=DB;
  DataSource1.DataSet:=pFIBDataSet1;
  RTransaction.StartTransaction;



  pFIBDataSet1.close;
  pFIBDataSet1.SQLs.SelectSQL.Text := 'Select * from Z_INDEX_INFLYACII_S(' +IntToStr(grKodSetup(DB)-1)+')';
  pFIBDataSet1.Open;
end;

end.
