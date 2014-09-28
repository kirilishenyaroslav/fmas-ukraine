unit dmHolidaySovmestOrder;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DateUtils, Controls, DB,
  FIBDataSet, pFIBDataSet;

type
  TDM = class(TDataModule)
    LocalWriteTransaction: TpFIBTransaction;
    LocalReadTransaction: TpFIBTransaction;
    LocalDatabase: TpFIBDatabase;
    ResultQuery: TpFIBDataSet;
    ResultQueryID_MAN_HOLIDAY: TFIBIntegerField;
    ResultQueryID_HOLIDAY: TFIBIntegerField;
    ResultQueryPERIOD_BEG: TFIBDateField;
    ResultQueryPERIOD_END: TFIBDateField;
    ResultQueryDATE_BEG: TFIBDateField;
    ResultQueryDATE_END: TFIBDateField;
    ResultQueryH_TERM: TFIBIntegerField;
    ResultQueryID_MAN_MOVING: TFIBIntegerField;
    ResultQueryNAME_HOLIDAY: TFIBStringField;
    ResultQueryFIO: TFIBStringField;
    ResultQueryTN: TFIBIntegerField;
    ResultDataSource: TDataSource;
    ResultQueryWORK_PLACE: TFIBStringField;
    SelectCurWorkPlace: TpFIBDataSet;
    SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
    SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField;
    SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField;
    SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
    SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
    SelectCurWorkPlaceDATE_BEG: TFIBDateField;
    SelectCurWorkPlaceDATE_END: TFIBDateField;
    SelectCurWorkPlaceREAL_DATE_END: TFIBDateField;
    SpHolidaySelect: TpFIBDataSet;
    SpHolidaySelectID_HOLIDAY: TFIBIntegerField;
    SpHolidaySelectNAME_HOLIDAY: TFIBStringField;
    SpHolidaySelectIS_MAIN: TFIBStringField;
    SpHolidaySelectDEFAULT_TERM: TFIBIntegerField;
    SpHolidaySelectIS_PAY: TFIBStringField;
    SpHolidaySelectID_VIDOPL: TFIBIntegerField;
    SpHolidaySelectVIHOD_TYPE: TFIBIntegerField;
    SpHolidaySelectVIHOD_NAME: TFIBStringField;
    SpHolidaySelectDONT_CALC_HOLIDAYS: TFIBStringField;
    SpHolidaySelectIS_MAIN_STR: TFIBStringField;
    SpHolidaySelectIS_PAY_STR: TFIBStringField;
    SpHolidaySelectIS_CALC_HOLIDAY_STR: TStringField;
    WorkQuery: TpFIBDataSet;
    ResultQueryDEPARMTENT_NAME: TFIBStringField;
    ResultQueryPOST_NAME: TFIBStringField;
    ResultQueryFIRM_NAME: TFIBStringField;
    ResultQueryCITY: TFIBStringField;
    ResultQueryINTRO: TFIBStringField;
    ResultQueryHOLIDAY_STR: TFIBStringField;
    ResultQueryPERIOD_STR: TFIBStringField;
    ResultQueryPARENT_DEPARTMENT: TFIBStringField;
    ResultQueryWORK_TYPE: TFIBStringField;
    procedure SpHolidaySelectCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    IdOrder : Integer;
    DateOrder : TDate;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.SpHolidaySelectCalcFields(DataSet: TDataSet);
begin
    if SpHolidaySelectIS_MAIN.Value = 'T' then
        SpHolidaySelectIS_MAIN_STR.Value := 'връ'
    else
        SpHolidaySelectIS_MAIN_STR.Value := 'ЭГ';

    if SpHolidaySelectIS_PAY.Value = 'T' then
        SpHolidaySelectIS_PAY_STR.Value := 'връ'
    else
        SpHolidaySelectIS_PAY_STR.Value := 'ЭГ';

    if SpHolidaySelectDONT_CALC_HOLIDAYS.Value = 'T' then
        SpHolidaySelectIS_CALC_HOLIDAY_STR.Value := 'ЭГ'
    else
        SpHolidaySelectIS_CALC_HOLIDAY_STR.Value := 'връ';
end;

end.
