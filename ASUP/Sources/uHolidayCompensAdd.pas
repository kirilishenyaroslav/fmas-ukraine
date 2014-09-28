unit uHolidayCompensAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, uFormControl, uCharControl,
    uDateControl, uFControl, uLabeledFControl, uSpravControl, DB, FIBDataSet,
    pFIBDataSet, ActnList, uCommonSp, uSelectForm, PersonalCommon, SpCommon,
    qFTools, uIntControl, Mask, CheckEditUnit, GoodFunctionsUnit,
    uInvisControl, IBCustomDataSet, IBQuery, DateUtils;

type
    TfmHolidayCompensAdd = class(TForm)
        BottomPanel: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FormControl: TqFFormControl;
        Fio: TqFSpravControl;
        WorkPlace: TqFSpravControl;
        DateBeg: TqFDateControl;
        DateEnd: TqFDateControl;
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
        KeyList: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        DAYSCOUNT: TqFIntControl;
        GroupBox1: TGroupBox;
        Label2: TLabel;
        Label8: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        NumItemText: TMemo;
        NewNumItemEdit: TCheckEdit;
        NumItem: TqFInvisControl;
        WorkQuery2: TIBQuery;
        IntegerField1: TIntegerField;
        IntegerField2: TIntegerField;
        DateField1: TDateField;
        DateField2: TDateField;
        IBStringField1: TIBStringField;
        IntegerField3: TIntegerField;
        IBBCDField1: TIBBCDField;
        procedure FioChange(Sender: TObject);
        procedure FioOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure NumItemOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure RadioButton1Click(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure FormNumItem;
        procedure WorkPlaceChange(Sender: TObject);
        procedure DateBegChange(Sender: TObject);
        procedure DateEndChange(Sender: TObject);
        procedure DAYSCOUNTChange(Sender: TObject);
        procedure ReasonChange(Sender: TObject);
        procedure FormControlAfterPrepare(Sender: TObject; Form: TForm;
            Mode: TFormMode);
        procedure FormControlNewRecordAfterPrepare(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Order: Integer;
    end;

var
    fmHolidayCompensAdd: TfmHolidayCompensAdd;

implementation

uses DtManBonusItemsUnit;

{$R *.dfm}

procedure TfmHolidayCompensAdd.FormNumItem;
begin
    if (VarIsNull(Fio.Value) or
        VarIsNull(WorkPlace.Value) or
        VarIsNull(DateBeg.Value) or
        VarIsNull(DateEnd.Value) or
        VarIsNull(DaysCount.Value) or
        VarIsNull(Reason.Value))
        then
        exit;

    NumItemText.Text := 'Виплатити компенсацію за ' + IntToStr(DaysCount.Value) +
        ' невикористаних днів відпустки за період з ' + DateToStr(DateBeg.Value) +
        ' по ' + DateToStr(DateEnd.Value) + ' ' + Fio.DisplayText +
        ', який працює на посаді ' +
        WorkPlace.DisplayText;
end;

procedure TfmHolidayCompensAdd.FioChange(Sender: TObject);
begin
    if VarIsNull(Fio.Value) then
        exit;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := DateEnd.Value;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := Fio.Value;
    SelectCurWorkPlace.Open;
    SelectCurWorkPlace.FetchAll;

    if SelectCurWorkPlace.RecordCount = 1 then begin
        WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
        WorkPlace.DisplayText := SelectCurWorkPlaceNAME_POST_SALARY.Value + ' (' + SelectCurWorkPlaceNAME_DEPARTMENT.Value + ')';
    end;

    FormNumitem;
end;

procedure TfmHolidayCompensAdd.FioOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PersonalCommon.FibDatabase.Handle);
            FieldValues['ActualDate'] := DateEnd.Value;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];

            Reason.Value := 'Заява ' + DisplayText;
        end;
        sp.Free;
    end;
end;

procedure TfmHolidayCompensAdd.WorkPlaceOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if VarIsNull(FIO.Value) then begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;

    if qSelect(SelectCurWorkPlace) then
    begin
        Value := SelectCurWorkPlace['ID_MAN_MOVING'];
        DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
    end;
end;

procedure TfmHolidayCompensAdd.NumItemOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := Id_Order;
    Form.aID_TYPE := 1;

    Form.Prepare;

    if Form.ShowModal = mrOk
        then begin
        Value := form.ResultQueryNUM_ITEM.Value;
        DisplayText := IntToStr(form.ResultQueryNUM_ITEM.Value);
    end;

    Form.Free;
end;

procedure TfmHolidayCompensAdd.OkActionExecute(Sender: TObject);
begin
    if (RadioButton2.Checked) and ((NewNumItemEdit.Text = '') or (NumItemText.Text = '')) then begin
        ErrMsg('Треба ввести № нового пункту наказу та ввести текст наказу!');
        NewNumItemEdit.SetFocus;
        exit;
    end;

    if (RadioButton1.Checked) and (NumItemEdit.Text = '') then begin
        ErrMsg('Треба вибрати пункт наказу!');
        NumItemEdit.SetFocus;
        exit;
    end;

    if RadioButton1.Checked then
        NumItem.Value := StrToInt(NumItemEdit.Text)
    else
        NumItem.Value := StrToInt(NewNumItemEdit.Text);

    try
        FormControl.Ok;
    except on E: exception do begin
            ErrMsg(E.Message);
            exit;
        end;
    end;

    if RadioButton2.Checked then begin
        WorkQuery2.Params.ParamValues['ID_ORDER'] := id_order;
        WorkQuery2.Params.ParamValues['Num_Item'] := NumItem.Value;
        WorkQuery2.Params.ParamValues['Text'] := NumItemText.Text;

        ExecQuery(WorkQuery2);
    end;
end;

procedure TfmHolidayCompensAdd.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmHolidayCompensAdd.FormCreate(Sender: TObject);
begin
    SelectCurWorkPlace.Transaction := PersonalCommon.FIBReadTransaction;
    WorkQuery2.Transaction := WriteTransaction;
end;

procedure TfmHolidayCompensAdd.RadioButton1Click(Sender: TObject);
begin
    NumItemEdit.Enabled := RadioButton1.Checked;
    SelectNumItemButton.Enabled := RadioButton1.Checked;

    NewNumItemEdit.Enabled := RadioButton2.Checked;
    NumItemText.Enabled := RadioButton2.Checked;
end;

procedure TfmHolidayCompensAdd.SelectNumItemButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.aID_TYPE := 10;

    Form.Prepare;

    if Form.ShowModal = mrOk
        then begin
        NumItemEdit.Text := IntToStr(form.ResultQueryNUM_ITEM.Value);
    end;

    Form.Free;
end;

procedure TfmHolidayCompensAdd.WorkPlaceChange(Sender: TObject);
begin
    FormNumitem;
end;

procedure TfmHolidayCompensAdd.DateBegChange(Sender: TObject);
begin
    DateEnd.Value := EncodeDate(YearOf(DateBeg.Value) + 1, MonthOf(DateBeg.Value), DayOf(DateBeg.Value));
    FormNumitem;
end;

procedure TfmHolidayCompensAdd.DateEndChange(Sender: TObject);
begin
    FormNumitem;
end;

procedure TfmHolidayCompensAdd.DAYSCOUNTChange(Sender: TObject);
begin
    FormNumitem;
end;

procedure TfmHolidayCompensAdd.ReasonChange(Sender: TObject);
begin
    FormNumitem;
end;

procedure TfmHolidayCompensAdd.FormControlAfterPrepare(Sender: TObject;
    Form: TForm; Mode: TFormMode);
begin
    if not VarIsNull(Numitem.Value) then
        (Form as TfmHolidayCompensAdd).NewNumItemEdit.Text := IntToStr(Numitem.Value);
end;

procedure TfmHolidayCompensAdd.FormControlNewRecordAfterPrepare(
    Sender: TObject);
begin
    DateBeg.Value := EncodeDate(YearOf(Date), 1, 1);
    DateEnd.Value := EncodeDate(YearOf(Date), 12, 31);
end;

initialization

    RegisterClass(TfmHolidayCompensAdd);

end.
