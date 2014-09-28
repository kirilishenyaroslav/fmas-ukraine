unit uHolidayOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, uFormControl, ActnList, StdCtrls,
  Buttons, uInvisControl, uCharControl, uIntControl, uDateControl,
  uFControl, uLabeledFControl, uSpravControl, uCommonSp, qFTools, DB,
  FIBDataSet, pFIBDataSet, uSelectForm, DateUtils;

type
  TfmHolidayOrder = class(TForm)
    LocalDatabase: TpFIBDatabase;
    FormControl: TqFFormControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    WorkPlace: TqFSpravControl;
    PeriodBeg: TqFDateControl;
    PeriodEnd: TqFDateControl;
    Holiday: TqFSpravControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    HTerm: TqFIntControl;
    Fio: TqFSpravControl;
    Reason: TqFCharControl;
    SelectCurWorkPlace: TpFIBDataSet;
    SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
    SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField;
    SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField;
    SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
    SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
    SelectCurWorkPlaceDATE_BEG: TFIBDateField;
    SelectCurWorkPlaceDATE_END: TFIBDateField;
    SelectCurWorkPlaceREAL_DATE_END: TFIBDateField;
    SelectCurWorkPlaceWORK_REASON: TFIBStringField;
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
    HolidayQuery: TpFIBDataSet;
    HolidayQueryHCOUNT: TFIBIntegerField;
    CheckQuery: TpFIBDataSet;
    IdOrderType: TqFInvisControl;
    NumItem: TqFInvisControl;
    SubItem: TqFInvisControl;
    IdOrderGroup: TqFInvisControl;
    Intro: TqFInvisControl;
    DontCalcHolidays: TqFInvisControl;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    CheckQueryHTERM: TFIBIntegerField;
    GetIdOrderQuery: TpFIBDataSet;
    GetIdOrderQueryID_ORDER: TFIBIntegerField;
    IdOrder: TqFInvisControl;
    IdManHoliday: TqFInvisControl;
    DateOrder: TqFInvisControl;
    GetIdManHolidayQuery: TpFIBDataSet;
    GetIdManHolidayQueryID_MAN_HOLIDAY: TFIBIntegerField;
    HolidayQuery2: TpFIBDataSet;
    HolidayQuery2DONT_CALC_HOLIDAYS: TFIBStringField;
    procedure CancelActionExecute(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure HolidayOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PeriodBegChange(Sender: TObject);
    procedure FormControlNewRecordAfterPrepare(Sender: TObject);
    procedure FormControlAfterRecordAdded(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  fmHolidayOrder: TfmHolidayOrder;

implementation

{$R *.dfm}

procedure TfmHolidayOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmHolidayOrder.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmHolidayOrder.FioOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    sp: TSprav;
begin
    // создать справочник
    sp :=  GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['ActualDate'] := DateOrder.Value;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := False;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := False;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];

            SelectCurWorkPlace.Close;
            SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := DateBeg.Value;
            SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := FIO.Value;
            SelectCurWorkPlace.Open;
            SelectCurWorkPlace.FetchAll;

            if SelectCurWorkPlace.RecordCount = 1 then begin
                WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
                WorkPlace.DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] +
                            ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
            end
            else begin
                WorkPlace.Value := Null;
                WorkPlace.DisplayText := '';
            end;

            Reason.Value := 'Заява ' + sp.Output['FIO_SMALL'];
        end;
        sp.Free;
    end;
end;

procedure TfmHolidayOrder.WorkPlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if VarIsNull(FIO.Value) then begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := DateBeg.Value;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := FIO.Value;
    SelectCurWorkPlace.Open;

    if qSelect(SelectCurWorkPlace) then
    begin
        Value := SelectCurWorkPlace['ID_MAN_MOVING'];
        DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
    end;
end;

procedure TfmHolidayOrder.HolidayOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    SpHolidaySelect.Close;
    SpHolidaySelect.Open;

    if qSelect(SpHolidaySelect, 'Довідник типів відпусток') then
    begin
        Value := SpHolidaySelectID_HOLIDAY.Value;
        DisplayText := SpHolidaySelectNAME_HOLIDAY.Value;

        DontCalcHolidays.Value := SpHolidaySelectDONT_CALC_HOLIDAYS.Value;
    end;
end;

procedure TfmHolidayOrder.SpeedButton1Click(Sender: TObject);
var
    hcount : Integer;
    doexit : Boolean;
begin
    HolidayQuery2.Close;
    HolidayQuery2.ParamByName('ID_HOLIDAY').AsInteger := Holiday.Value;
    HolidayQuery2.Open;

    DontCalcHolidays.Value := HolidayQuery2DONT_CALC_HOLIDAYS.Value;

    DateEnd.Value := DateBeg.Value + HTerm.Value - 1;

    doexit := False;
    hcount := 0;

    while not doexit do begin
        HolidayQuery.Close;
        HolidayQuery.ParamByName('DATE1').AsDate := DateBeg.Value;
        HolidayQuery.ParamByName('DATE2').AsDate := DateEnd.Value;
        HolidayQuery.Open;

        if (not VarIsNull(DontCalcHolidays.Value)) and (DontCalcHolidays.Value = 'T') then
            DateEnd.Value := DateEnd.Value + HolidayQueryHCOUNT.Value - hcount;

        if hcount = HolidayQueryHCOUNT.Value then
            doexit := True;

        hcount := HolidayQueryHCOUNT.Value;            
    end;
end;

procedure TfmHolidayOrder.SpeedButton2Click(Sender: TObject);
begin
    if VarIsNull(Holiday.Value) then begin
        qFErrorDialog('Треба вибрати тип відпустки!');
        exit;
    end;

    CheckQuery.Close;
    CheckQuery.ParamByName('ID_HOLIDAY').AsInteger := Holiday.Value;
    CheckQuery.ParamByName('DATE1').AsDate := DateBeg.Value;
    CheckQuery.ParamByName('DATE2').AsDate := DateEnd.Value;
    CheckQuery.Open;

    HTerm.Value := CheckQueryHTERM.value;
end;

procedure TfmHolidayOrder.PeriodBegChange(Sender: TObject);
begin
    PeriodEnd.Value := EncodeDate(YearOf(PeriodBeg.Value) + 1, MonthOf(PeriodBeg.Value), DayOf(PeriodBeg.Value)) - 1;
end;

procedure TfmHolidayOrder.FormControlNewRecordAfterPrepare(
  Sender: TObject);
begin
    PeriodBeg.Value := EncodeDate(YearOf(Date) - 1, 9, 1);
    PeriodEnd.Value := EncodeDate(YearOf(Date), 8, 31);
end;

procedure TfmHolidayOrder.FormControlAfterRecordAdded(Sender: TObject);
begin
    IdManHoliday.Value := FormControl.LastId;

    GetIdOrderQuery.Close;
    GetIdOrderQuery.ParamByName('ID_MAN_HOLIDAY').AsInteger := IdManHoliday.Value;
    GetIdOrderQuery.Open;

    IdOrder.Value := GetIdOrderQueryID_ORDER.Value;
end;

end.
