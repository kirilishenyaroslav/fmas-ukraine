unit ProlongManOrder;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uDateControl, uSpravControl, uFControl,
    uLabeledFControl, uCharControl, DB, FIBDataSet, pFIBDataSet, PersonalCommon,
    uBoolControl, uInvisControl, uCommonSP, qFTools, uSelectForm,
    uFormControl, SpCommon;

type
    TfmProlongManOrder = class(TForm)
        Reason: TqFCharControl;
        Fio: TqFSpravControl;
        WorkPlace: TqFSpravControl;
        DateBeg: TqFDateControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        SelectCurWorkPlace: TpFIBDataSet;
        SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
        SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField;
        SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField;
        SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
        SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
        SelectCurWorkPlaceDATE_BEG: TFIBDateField;
        SelectCurWorkPlaceDATE_END: TFIBDateField;
        SelectCurWorkPlaceREAL_DATE_END: TFIBDateField;
        FormControl: TqFFormControl;
        IdOrder: TqFInvisControl;
        IdOrderType: TqFInvisControl;
        NumOrder: TqFInvisControl;
        NoteOrder: TqFInvisControl;
        DateOrder: TqFInvisControl;
        DateEnd: TqFDateControl;
        procedure FioOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormCreate(Sender: TObject);
        procedure Prepare;
        procedure FioChange(Sender: TObject);
        procedure FormControlAfterRecordAdded(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        aFMode: TEditMode;
        aDateOrder: TDate;
        aIdOrder: Integer;
        aIdOrderType: Integer;
        aNumOrder: string;
        aNoteOrder: string;
    end;

var
    fmProlongManOrder: TfmProlongManOrder;

implementation

{$R *.dfm}

procedure TfmProlongManOrder.Prepare;
begin
    if aFmode = emNew then begin
        DateBeg.Value := Date;
        DateEnd.Value := StrToDate('31.12.2150');
    end;

    case AFmode of
        emNew: FormControl.Mode := fmAdd;
        emModify: FormControl.Mode := fmModify;
        emView: FormControl.Mode := fmInfo;
    end;

    DateOrder.Value := QuotedStr(DateToStr(aDateOrder));
    IdOrder.Value := aIdOrder;
    IdOrderType.Value := aIdOrderType;
    NumOrder.Value := QuotedStr(aNumOrder);
    NoteOrder.Value := QuotedStr(aNoteOrder);

    FormControl.Prepare(FibDatabase, FormControl.Mode, IdOrder.Value, null);
end;

procedure TfmProlongManOrder.FioOpenSprav(Sender: TObject;
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
            FieldValues['DBHandle'] := Integer(PersonalCommon.FIBDatabase.Handle);
            FieldValues['ActualDate'] := DateBeg.Value - 1;
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

procedure TfmProlongManOrder.WorkPlaceOpenSprav(Sender: TObject;
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

procedure TfmProlongManOrder.FormCreate(Sender: TObject);
begin
    SelectCurWorkPlace.Transaction := FIBReadTransaction;
end;

procedure TfmProlongManOrder.FioChange(Sender: TObject);
begin
    if VarIsNull(Fio.Value) then
        exit;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := DateBeg.Value - 1;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := Fio.Value;
    SelectCurWorkPlace.Open;
    SelectCurWorkPlace.FetchAll;

    if SelectCurWorkPlace.RecordCount = 1 then begin
        WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
        WorkPlace.DisplayText := SelectCurWorkPlaceNAME_POST_SALARY.Value + ' (' + SelectCurWorkPlaceNAME_DEPARTMENT.Value + ')';
    end;
end;

procedure TfmProlongManOrder.FormControlAfterRecordAdded(Sender: TObject);
begin
    IdOrder.Value := FormControl.LastId;
end;

procedure TfmProlongManOrder.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

end.
