unit HolidayDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs, pFIBStoredProc;

type
  TdmHoliday = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    Holiday_Select: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
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
    CheckQuery: TpFIBDataSet;
    CheckQueryHCOUNT: TFIBIntegerField;
    DeleteQ: TpFIBQuery;
    SelectAutoPlan: TpFIBDataSet;
    DelAutoPlan: TpFIBQuery;
    SelectCurWorkPlaceRMOVING: TFIBIntegerField;
    Holiday_SelectID: TFIBIntegerField;
    Holiday_SelectID_PARENT: TFIBIntegerField;
    Holiday_SelectCAPTION: TFIBStringField;
    Holiday_SelectPERIOD_STR: TFIBStringField;
    Holiday_SelectTYPE_HOLIDAY: TFIBStringField;
    Holiday_SelectCOUNT_DAYS: TFIBIntegerField;
    Holiday_SelectCOUNT_DAYS_UNUSED: TFIBIntegerField;
    Holiday_SelectNUM_ORDER: TFIBStringField;
    Holiday_SelectDATE_ORDER: TFIBStringField;
    Holiday_SelectYEAR_BEG: TFIBStringField;
    Holiday_SelectYEAR_END: TFIBStringField;
    Holiday_SelectRMOVING: TFIBIntegerField;
    Holiday_SelectIS_PPS: TFIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
  end;

var
  Dm: TdmHoliday;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}
procedure TdmHoliday.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
begin
end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;
end.
