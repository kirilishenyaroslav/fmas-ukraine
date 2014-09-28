unit uMassHolidayAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDateControl, uFControl, uLabeledFControl, uSpravControl, DB,
  IBCustomDataSet, IBQuery, StdCtrls, Buttons, dmMassHolidayOrder,
  uCharControl, uIntControl, uCommonSP, qFTools, uSelectForm, ActnList,
  uFormControl, uFloatControl, uInvisControl, uLogicCheck, uSimpleCheck;

type
  TfmMassHolidayAdd = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    HolidayEdit: TEdit;
    ResultQuery: TIBQuery;
    ResultQueryID_HOLIDAY: TIntegerField;
    ResultQueryPERIOD_BEG: TDateField;
    ResultQueryPERIOD_END: TDateField;
    ResultQueryDATE_BEG: TDateField;
    ResultQueryDATE_END: TDateField;
    ResultQueryH_TERM: TIntegerField;
    ResultQueryID_MAN_MOVING: TIntegerField;
    ResultQueryNAME_HOLIDAY: TIBStringField;
    WriteQuery: TIBQuery;
    CheckQuery: TIBQuery;
    CheckQueryHCOUNT: TIntegerField;
    Fio: TqFSpravControl;
    WorkPlace: TqFSpravControl;
    PeriodBeg: TqFDateControl;
    PeriodEnd: TqFDateControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    Reason: TqFCharControl;
    Note: TqFCharControl;
    HTerm: TqFIntControl;
    Holiday: TqFSpravControl;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    FormControl: TqFFormControl;
    MatHelp: TqFFloatControl;
    Label1: TLabel;
    Dont_Calc_Holidays: TqFInvisControl;
    IdOrder: TqFInvisControl;
    qFSimpleCheck1: TqFSimpleCheck;
    qFSimpleCheck2: TqFSimpleCheck;
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FioChange(Sender: TObject);
    procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure HolidayOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormControlAfterPrepare(Sender: TObject; Form: TForm;
      Mode: TFormMode);
  private
    { Private declarations }
  public

  end;

var
  fmMassHolidayAdd: TfmMassHolidayAdd;

implementation

{$R *.dfm}

procedure TfmMassHolidayAdd.FioOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
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
            FieldValues['DBHandle'] := Integer(Dm.LocalDatabase.Handle);
            FieldValues['ActualDate'] := Dm.DateOrder;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];

            Reason.Value := 'Заява ' + DisplayText;
        end;
        sp.Free;
    end;
end;

procedure TfmMassHolidayAdd.FioChange(Sender: TObject);
begin
    if VarIsNull(Fio.Value) then
        exit;

    Dm.SelectCurWorkPlace.Close;
    Dm.SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := DateBeg.Value;
    Dm.SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := Fio.Value;
    Dm.SelectCurWorkPlace.Open;
    Dm.SelectCurWorkPlace.FetchAll;

    if Dm.SelectCurWorkPlace.RecordCount = 1 then begin
        WorkPlace.Value := Dm.SelectCurWorkPlaceID_MAN_MOVING.Value;
        WorkPlace.DisplayText := Dm.SelectCurWorkPlaceNAME_POST_SALARY.Value + ' (' + Dm.SelectCurWorkPlaceNAME_DEPARTMENT.Value + ')';
    end;
end;

procedure TfmMassHolidayAdd.WorkPlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if VarIsNull(FIO.Value) then begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;

    if qSelect(Dm.SelectCurWorkPlace) then
    begin
        Value := Dm.SelectCurWorkPlace['ID_MAN_MOVING'];
        DisplayText := Dm.SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + Dm.SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
    end;
end;

procedure TfmMassHolidayAdd.HolidayOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    Dm.SpHolidaySelect.Close;
    Dm.SpHolidaySelect.Open;

    Dm.SpHolidaySelect.Locate('ID_HOLIDAY', 112, []);

    if qSelect(Dm.SpHolidaySelect, 'Довідник типів відпусток') then
    begin
        Value := Dm.SpHolidaySelectID_HOLIDAY.Value;
        DisplayText := Dm.SpHolidaySelectNAME_HOLIDAY.Value;
        Dont_Calc_Holidays.Value := Dm.SpHolidaySelectDONT_CALC_HOLIDAYS.Value;
    end;
end;

procedure TfmMassHolidayAdd.OkActionExecute(Sender: TObject);
begin
    PeriodBeg.Value := Null;
    PeriodEnd.Value := Null;
    FormControl.Ok;
end;

procedure TfmMassHolidayAdd.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmMassHolidayAdd.SpeedButton1Click(Sender: TObject);
var
    Date1 : String;
begin
    if (VarIsNull(Holiday.Value)) or (Holiday.DisplayText = '') then begin
        qFErrorDialog('Потрібно вибрати тип відпустки!');
        exit;
    end;

    if (VarIsNull(HTerm.Value)) then begin
        qFErrorDialog('Потрібно вести кілкість днів відпустки!');
        exit;
    end;

    DateEnd.Value := DateBeg.Value + HTerm.Value - 1;

    if DONT_CALC_HOLIDAYS.Value = 'F' then
        exit;

    CheckQuery.Close;
    CheckQuery.Params.ParamValues['DATE1'] := DateToStr(DateBeg.Value);
    CheckQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Value);
    CheckQuery.Open;

    while CheckQueryHCOUNT.Value > 0
    do begin
        Date1 := DateToStr(DateEnd.Value + 1);
        DateEnd.Value := DateEnd.Value + CheckQueryHCOUNT.Value;

        CheckQuery.Close;
        CheckQuery.Params.ParamValues['DATE1'] := Date1;
        CheckQuery.Params.ParamValues['DATE2'] :=DateToStr(DateEnd.Value);
        CheckQuery.Open;
    end;
end;

procedure TfmMassHolidayAdd.SpeedButton2Click(Sender: TObject);
var
  int : Integer;
begin
    if (VarIsNull(Holiday.Value)) or (Holiday.DisplayText = '') then begin
        qFErrorDialog('Потрібно вибрати тип відпустки!');
        exit;
    end;

    int := Trunc(DateEnd.Value - DateBeg.Value) + 1;

    HTerm.Value := int;

    if DONT_CALC_HOLIDAYS.Value = 'F' then
        exit;

    CheckQuery.Close;
    CheckQuery.Params.ParamValues['DATE1'] := DateToStr(DateBeg.Value);
    CheckQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Value);
    CheckQuery.Open;

    HTerm.Value := int - CheckQueryHCOUNT.value;
end;

procedure TfmMassHolidayAdd.FormControlAfterPrepare(Sender: TObject;
  Form: TForm; Mode: TFormMode);
begin
    IdOrder.Value := Dm.IdOrder;

    DateBeg.Value := Date;
    DateEnd.Value := Date;
end;

initialization
    RegisterClass(TfmMassHolidayAdd);

end.
