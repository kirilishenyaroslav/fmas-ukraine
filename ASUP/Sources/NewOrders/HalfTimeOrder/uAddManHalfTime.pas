unit uAddManHalfTime;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, uInvisControl,
    uLogicCheck, uSimpleCheck, uFormControl, uEnumControl, uCharControl,
    uFloatControl, uDateControl, StdCtrls, Buttons, pFIBDatabase, DB,
    FIBDataSet, pFIBDataSet;

type
    TfmAddManHalfTime = class(TForm)
        FIO: TqFSpravControl;
        Date_Beg: TqFDateControl;
        Date_End: TqFDateControl;
        From_Where: TqFEnumControl;
        FormControl: TqFFormControl;
        qFSimpleCheck1: TqFSimpleCheck;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        WorkPlace: TqFSpravControl;
        IdOrder: TqFInvisControl;
        SelectCurWorkPlace: TpFIBDataSet;
        SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
        SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField;
        SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
        SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
        SelectCurWorkPlaceDATE_BEG: TFIBDateField;
        SelectCurWorkPlaceDATE_END: TFIBDateField;
        SelectCurWorkPlaceREAL_DATE_END: TFIBDateField;
        Hours_F: TqFFloatControl;
        NumItem: TqFSpravControl;
    Reason: TqFCharControl;
        procedure FIOOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkButtonClick(Sender: TObject);
        procedure FIOChange(Sender: TObject);
        procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure NumItemOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    private
        ReadTransaction: TpFIBTransaction;
    public
        procedure Prepare(tran: TpFIBTransaction; Id_Order: Integer; Date_Order: TDate);
    end;

var
    fmAddManHalfTime: TfmAddManHalfTime;

implementation

{$R *.dfm}

uses uCommonSp, uSelectForm, qFTools;

procedure TfmAddManHalfTime.FIOOpenSprav(Sender: TObject;
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
            FieldValues['DBHandle'] := Integer(ReadTransaction.DefaultDatabase.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
            Reason.Value := 'Заява ' + sp.Output['FIO_SMALL'];
        end;
        sp.Free;
    end;
end;

procedure TfmAddManHalfTime.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmAddManHalfTime.FIOChange(Sender: TObject);
begin
    if VarIsNull(Fio.Value) then
        exit;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := Date_Beg.Value;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := Fio.Value;
    SelectCurWorkPlace.Open;
    SelectCurWorkPlace.FetchAll;

    if SelectCurWorkPlace.RecordCount = 1 then
    begin
        WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
        WorkPlace.DisplayText := SelectCurWorkPlaceNAME_POST_SALARY.Value +
            ' (' + SelectCurWorkPlaceNAME_DEPARTMENT.Value + ')';
    end;
end;

procedure TfmAddManHalfTime.Prepare(tran: TpFIBTransaction;
    Id_Order: Integer; Date_Order: TDate);
begin
    ReadTransaction := tran;
    SelectCurWorkPlace.Transaction := ReadTransaction;
    SelectCurWorkPlace.Database := ReadTransaction.DefaultDatabase;
    IdOrder.Value := Id_Order;
    Date_Beg.Value := Date_Order;
    Date_End.Value := Date_Order;
end;

procedure TfmAddManHalfTime.WorkPlaceOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if VarIsNull(FIO.Value) then begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;

    if qSelect(SelectCurWorkPlace) then
    begin
        Value := SelectCurWorkPlace['ID_MAN_MOVING'];
        DisplayText := SelectCurWorkPlace['NAME_POST'] + ' (' +
            SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
    end;
end;

procedure TfmAddManHalfTime.NumItemOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('Asup\OrderItems');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(SelectCurWorkPlace.Database.Handle);
            FieldValues['Id_Order'] := IdOrder.Value;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Num_Item'];
            DisplayText := IntToStr(sp.Output['Num_Item']);
        end;
        sp.Free;
    end;
end;



initialization
    RegisterClass(TfmAddManHalfTime);

end.

