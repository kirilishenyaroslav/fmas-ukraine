unit Gar_DMFilterWaybill;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,gr_uCommonLoader;

type
  TDMFilterWaybill = class(TDataModule)
    DB: TpFIBDatabase;
    FilterSeriesWaybillDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    FilterSeriesWaybillDSource: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(Param:TgrSimpleParam); reintroduce;
  end;

var
  DMFilterWaybill: TDMFilterWaybill;

implementation

{$R *.dfm}
constructor TDMFilterWaybill.Create(Param:TgrSimpleParam);
begin
  inherited Create(Param.Owner);
  DB.Handle:=Param.DB_Handle;
end;

end.
