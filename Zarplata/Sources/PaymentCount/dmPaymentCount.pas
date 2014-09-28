unit dmPaymentCount;

interface

uses
  SysUtils, Classes, FIBDataSet, DB, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery,Controls, pFIBStoredProc, pFIBErrorHandler;

type
  TMainDm = class(TDataModule)
    MainDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    CheckOrdersDataSet: TpFIBDataSet;
    CheckOrdersDataSetNUM_ORDER: TFIBStringField;
    CheckOrdersDataSetDATE_ORDER: TFIBDateField;
    CheckOrdersDataSetNOTE: TFIBStringField;
    CheckOrdersDataSetID_ORDER: TFIBIntegerField;
    CheckOrdersDataSetNAME_TYPE: TFIBStringField;
    GetMonthBoundsQuery: TpFIBQuery;
    ConvertQuery: TpFIBDataSet;
    ConvertQueryKOD_SETUP: TFIBIntegerField;
    GetCurPeriod: TpFIBQuery;
    PeopleDataSet: TpFIBDataSet;
    PeopleDataSource: TDataSource;
    UVProc: TpFIBStoredProc;
    GetGroupQuery: TpFIBQuery;
    ClearSpisokProc: TpFIBStoredProc;
    FillSpisokForCountQuery: TpFIBStoredProc;
    CountProc: TpFIBQuery;
    DeleteFromTableTmpQuery: TpFIBQuery;
    UniversalCountProc: TpFIBQuery;
  private
    { Private declarations }
  public
    Year:     Integer;
    Month:    Integer;
    KodSetup2:Integer;
    DateBeg:  TDate;
    DateEnd:  TDate;
    KodSetup1:  Integer;
    procedure GetDates();

  end;

var
  MainDm: TMainDm;

implementation

procedure TMainDm.GetDates();
var
    S:String;
begin
    GetCurPeriod.ExecQuery;

    Year:=GetCurPeriod['Year_Set'].Value;
    Month:=GetCurPeriod['Month_Set'].Value;

    GetMonthBoundsQuery.Params.ParamByName('YEAR').Value:=Year;
    GetMonthBoundsQuery.Params.ParamByName('MONTH').Value:=Month;

    GetMonthBoundsQuery.ExecQuery;


    DateBeg:=GetMonthBoundsQuery['MONTH_BEG'].value;
    DateEnd:=GetMonthBoundsQuery['MONTH_END'].value;

    S:=DateToStr(DateBeg);
    ConvertQuery.ParamByName('DATE_IN').Value:=S;
    ConvertQuery.Open;
    KodSetup1:=ConvertQuery['KOD_SETUP'];
    KodSetup2:=KodSetup1;
end;

{$R *.dfm}

end.
