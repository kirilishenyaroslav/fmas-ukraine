unit AddHolidayBackUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, Buttons, GoodFunctionsUnit, ExtCtrls, SpCommon,
    PersonalCommon, DB, IBCustomDataSet, IBQuery, Mask, CheckEditUnit,
    uFControl, uLabeledFControl, uSpravControl;

type
    TAddHolidayBackForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel1: TPanel;
        Label1: TLabel;
        DateRemove: TDateTimePicker;
        Label2: TLabel;
        OrderEdit: TEdit;
        SelectOrderButton: TButton;
        Label3: TLabel;
        ForWhatMemo: TMemo;
        ResultQuery: TIBQuery;
        ResultQueryORDER_NUM: TIBStringField;
        Label4: TLabel;
        DateBegLabel: TLabel;
        DateEndLabel: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        PeriodBegLabel: TLabel;
        Label9: TLabel;
        PeriodEndLabel: TLabel;
        OrderPanel: TGroupBox;
        Label12: TLabel;
        Label13: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        NumItemText: TMemo;
        NewNumItemEdit: TCheckEdit;
        Label10: TLabel;
        Label14: TLabel;
        FioLabel: TLabel;
        DepartmentPostLabel: TLabel;
        DetailsQuery: TIBQuery;
        WriteQuery: TIBQuery;
        WorkQuery2: TIBQuery;
        IntegerField1: TIntegerField;
        IntegerField2: TIntegerField;
        DateField1: TDateField;
        DateField2: TDateField;
        IBStringField2: TIBStringField;
        IntegerField3: TIntegerField;
        IBBCDField1: TIBBCDField;
        DetailsQueryFIO: TIBStringField;
        DetailsQueryTN: TIntegerField;
        DetailsQueryPOST_NAME: TIBStringField;
        DetailsQueryDEP_NAME: TIBStringField;
        DetailsQueryHOLIDAY_BEG: TDateField;
        DetailsQueryHOLIDAY_END: TDateField;
        DetailsQueryPERIOD_BEG: TDateField;
        DetailsQueryPERIOD_END: TDateField;
        DetailsQueryREMOVE_DATE: TDateField;
        DetailsQueryID_MAN_HOSPITAL: TIntegerField;
        DetailsQueryHOSP_STR: TIBStringField;
        Hospital: TqFSpravControl;
        IsHospital: TCheckBox;
        Label5: TLabel;
        DateRemoveEnd: TDateTimePicker;
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure SelectOrderButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure Prepare(aFMode: TEditMode;
            aId_Order: Integer;
            aDateRemove: TDate;
            aDateRemoveEnd: TDate;
            aId_Holiday_Order: Integer = -1;
            aOrderEdit: string = '';
            aForWhat: string = '';
            aNumItemEdit: Integer = -1;
            aId_Holiday_Remove: Integer = -1;
            Id_Man_Hospital: Integer = -1;
            Hosp_Str: string = '');
        procedure FormCreate(Sender: TObject);
        procedure ShowDetails(aId_Order: Integer);
        procedure FormNumItem;
        procedure DateRemoveChange(Sender: TObject);
        procedure ForWhatMemoChange(Sender: TObject);
        procedure IsHospitalClick(Sender: TObject);
        procedure HospitalOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);

    private
    { Private declarations }
    public
        ID_ORDER: Integer;
        ID_HOLIDAY_ORDER: Integer;
        Id_Holiday_Remove: Integer;
        FMode: TEditMode;
        new_id: Integer;
    end;

var
    AddHolidayBackForm: TAddHolidayBackForm;

implementation

uses DtManBonusItemsUnit, OrdersViewUnit, uCommonSp;

{$R *.dfm}

procedure TAddHolidayBackForm.ShowDetails(aId_Order: Integer);
begin
    DetailsQuery.Close;
    DetailsQuery.Params.ParamValues['ID_HOLIDAY_ORDER'] := aId_Order;
    DetailsQuery.Open;

    FioLabel.Caption := DetailsQueryFIO.Value;
    DepartmentPostLabel.Caption := DetailsQueryDEP_NAME.Value + ' (' + DetailsQueryPOST_NAME.Value + ')';
    PeriodBegLabel.Caption := DetailsQueryPERIOD_BEG.AsString;
    PeriodEndLabel.Caption := DetailsQueryPERIOD_END.AsString;
    DateBegLAbel.Caption := DetailsQueryHOLIDAY_BEG.AsString;
    DateEndLAbel.Caption := DetailsQueryHOLIDAY_END.AsString;

    //DetailsQuery.Close;
end;

procedure TAddHolidayBackForm.FormNumItem;
var
    ToStr: string;
begin
    if not Enabled then exit;

    if (Id_Holiday_Order = -1) or
        (ForWhatMemo.Text = '')
        then begin
        NumItemText.Text := '';
        exit;
    end;

    if IsHospital.Checked then
        ToStr := ' на час хвороби '
    else
        ToStr := ' по ' + DateToStr(DateRemoveEnd.Date) + ' ';

    if RadioButton2.Checked then begin
        NumItemText.Text := '   Відізвати з чергової відпустки з ' + DateToStr(DateRemove.Date) + ' ' +
            ToStr +
            FIOLabel.Caption + ', ' + DepartmentPostLabel.Caption + ', ' +
            ForWhatMemo.Text + '.';
    end;
end;


procedure TAddHolidayBackForm.Prepare(aFMode: TEditMode;
    aId_Order: Integer;
    aDateRemove: TDate;
    aDateRemoveEnd: TDate;
    aId_Holiday_Order: Integer = -1;
    aOrderEdit: string = '';
    aForWhat: string = '';
    aNumItemEdit: Integer = -1;
    aId_Holiday_Remove: Integer = -1;
    Id_Man_Hospital: Integer = -1;
    Hosp_Str: string = '');
begin
//
    FMode := aFMode;
    Id_Order := aId_Order;

    if FMode = emNew then begin
        DateRemove.Date := aDateRemove;
        DateRemoveEnd.Date := aDateRemoveEnd;
        Id_Holiday_order := -1;
        OrderEdit.Text := '';
        ForWhatMemo.Text := '';
        NumItemEdit.Text := '';
        Id_holiday_remove := -1;
        NewNumItemEdit.Text := IntToStr(GetMaxOrderNumItem(id_order));
    end
    else begin
        DateRemove.Date := aDateRemove;
        DateRemoveEnd.Date := aDateRemoveEnd;
        Id_Holiday_order := aId_Holiday_Order;
        OrderEdit.Text := aOrderEdit;
        ForWhatMemo.Text := aForWhat;
        NewNumItemEdit.Text := IntToStr(aNumItemEdit);
        Id_Holiday_Remove := aId_Holiday_Remove;

        Hospital.Value := Id_Man_Hospital;
        Hospital.DisplayText := Hosp_Str;

        if Hosp_Str <> '' then begin
            IsHospital.Checked := True;
        end;

        ShowDetails(Id_Holiday_order);
        FormNumItem;
    end;

    if FMode = emView then begin
        Panel1.Enabled := False;
        OkButton.Visible := False;
        CancelButton.Left := 232;
    end;

end;

procedure TAddHolidayBackForm.SelectNumItemButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.aID_TYPE := 25;

    Form.Prepare;

    if Form.ShowModal = mrOk
        then begin
        NumItemEdit.Text := IntToStr(form.ResultQueryNUM_ITEM.Value);
    end;

    Form.Free;
end;

procedure TAddHolidayBackForm.SelectOrderButtonClick(Sender: TObject);
var
    Form: TOrdersViewForm;
begin
    Form := TOrdersViewForm.Create(Self);
    Form.SelectButton.Visible := True;
    Form.CBTypeOrders.EditValue := 16;
    Form.FilterType.Checked := True;

    if Form.ShowModal = mrOk then begin

        if (Form.InputQueryID_ORDER_TYPE.Value <> 16) and (Form.InputQueryID_ORDER_TYPE.Value <> 18) and ((Form.InputQueryID_ORDER_TYPE.Value <> 25))
            then
            MessageDlg('Вибраний наказ не є наказом про надання відпустки!', mtError, [mbOk], 0)
        else
            if (Form.InputQueryID_STATUS.Value <> 5)
                then
                MessageDlg('Неможливо вибрати невиконаний наказ!', mtError, [mbOk], 0)
            else begin
                ID_HOLIDAY_ORDER := Form.InputQuery['ID_ORDER'];
                OrderEdit.Text := 'Наказ № ' + Form.InputQuery['NUM_ORDER'] + ' від ' + DateToStr(Form.InputQuery['DATE_ORDER']);
                ShowDetails(ID_HOLIDAY_ORDER);

                if ((DetailsQueryREMOVE_DATE.Value <> StrToDate('01.01.1900')) and (DetailsQueryREMOVE_DATE.Value <> StrToDate('31.12.2150'))) then begin
                    DateRemove.Date := DetailsQueryREMOVE_DATE.Value;
                    IsHospital.Checked := True;
                    Hospital.Value := DetailsQueryID_MAN_HOSPITAL.Value;
                    Hospital.DisplayText := DetailsQueryHOSP_STR.Value;
                end
                else begin
                    Messagedlg('Не знайдено жодного листа непрацездатності на час відпустки!', mtWarning, [mbOk], 0);
                end;

                FormNumItem;

            end;
    end;

    Form.Free;
end;

procedure TAddHolidayBackForm.OkButtonClick(Sender: TObject);
var
    NumItem: Integer;
    HospStr: string;
begin
    if ((not CheckForFillBool((id_holiday_order <> -1), 'Виберіть наказ, на підставі якого було надано відпустку!')) or
        (not CheckForFill(ForWhatMemo, 'підстава для відкликання')))
        then exit;

    if (RadioButton1.Checked) and (NumItemEdit.Text = '')
        then begin
        ErrMsg('Треба вибрати пункт наказу!');
        NumItemEdit.SetFocus;
        exit;
    end;

    if (RadioButton2.Checked) and ((NewNumItemEdit.Text = '') or (NumItemText.Text = ''))
        then begin
        ErrMsg('Треба ввести № нового пункту наказу та ввести текст наказу!');
        NewNumItemEdit.SetFocus;
        exit;
    end;

    if (DateRemove.Date < StrToDate(DateBegLabel.Caption)) or
        (DateRemove.Date > StrToDate(DateEndLabel.Caption))
        then begin
        ErrMsg('Дата відкликання з відпустки повинна бути між датами відпустки!');
        DateRemove.SetFocus;
        exit;
    end;

    if IsHospital.Checked and VarIsNull(Hospital.Value)
        then begin
        ErrMsg('Треба вибрати лікарняний лист!');
        exit;
    end;

    if not IsHospital.Checked then
        HospStr := 'null'
    else
        HospStr := IntToStr(Hospital.Value);

    if RadioButton1.Checked then
        NumItem := StrToInt(NumItemEdit.Text)
    else
        NumItem := StrToInt(NewNumItemEdit.Text);

    ResultQuery.Close;
    ResultQuery.Params.ParamValues['ID_HOLIDAY_ORDER'] := Id_Holiday_Order;
    ResultQuery.Params.ParamValues['ID_HOLIDAY_REMOVE'] := Id_Holiday_Remove;
    ResultQuery.Open;

    if (not ResultQuery.IsEmpty) and (MessageDlg('Вже існує наказ про відкликання з відпустки за наказом ' +
        ResultQueryORDER_NUM.Value +
        '. Ви справді бажаєте додати ще одне відкликання?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        exit;

    WriteTransaction.StartTransaction;

    try

        if (FMode = emNew) then begin
            WriteQuery.Close;
            WriteQuery.SQL.Text := 'SELECT ID_HOLIDAY_REMOVE FROM MAN_HOLIDAY_REMOVE_INSERT(' +
                IntToStr(ID_ORDER) + ',' +
                IntToStr(NumItem) + ',' +
                IntToStr(ID_HOLIDAY_ORDER) + ',' +
                QuotedStr(DateToStr(DateRemove.Date)) + ',' +
                QuotedStr(ForWhatMemo.Text) + ',' +
                HospStr + ',' +
                QuotedStr(DateToStr(DateRemoveEnd.Date)) + ')';
            new_id := ExecQuery(WriteQuery);
        end;

        if (FMode = emModify) then begin
            WriteQuery.Close;
            WriteQuery.SQL.Text := 'EXECUTE PROCEDURE MAN_HOLIDAY_REMOVE_UPDATE(' +
                IntToStr(ID_HOLIDAY_REMOVE) + ',' +
                IntToStr(ID_ORDER) + ',' +
                IntToStr(NumItem) + ',' +
                IntToStr(ID_HOLIDAY_ORDER) + ',' +
                QuotedStr(DateToStr(DateRemove.Date)) + ',' +
                QuotedStr(ForWhatMemo.Text) + ',' +
                HospStr + ',' +
                QuotedStr(DateToStr(DateRemoveEnd.Date)) + ')';
            ExecQuery(WriteQuery);
        end;

        if RadioButton2.Checked then begin
            WorkQuery2.Params.ParamValues['ID_ORDER'] := id_order;
            WorkQuery2.Params.ParamValues['Num_Item'] := NewNumItemEdit.Text;
            WorkQuery2.Params.ParamValues['Text'] := NumItemText.Text;
            ExecQuery(WorkQuery2);
        end;

    except on E: Exception
        do begin
            ErrMsg('При занесенні даних винкла помилка "' + E.Message + '"');
            WriteTransaction.Rollback;
            exit;
        end;
    end;

    WriteTransaction.Commit;

    ModalResult := mrOk;
end;

procedure TAddHolidayBackForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    WriteQuery.Transaction := PersonalCommon.WriteTransaction;
    WorkQuery2.Transaction := PersonalCommon.WriteTransaction;
end;

procedure TAddHolidayBackForm.DateRemoveChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddHolidayBackForm.ForWhatMemoChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddHolidayBackForm.IsHospitalClick(Sender: TObject);
begin
    if not IsHospital.Checked then begin
        Hospital.Value := null;
        Hospital.DisplayText := '';
    end;
end;

procedure TAddHolidayBackForm.HospitalOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('Asup\AsupHospital');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(FibDatabase.Handle);
            FieldValues['Select'] := 1;
            FieldValues['NewVersion'] := PersonalCommon.NewVersion;
            Post;
        end;
                // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Man_Hosp'];
            DisplayText := sp.Output['DisplayText'];
            DateRemove.Date := sp.Output['Date_Beg'];
        end;
        sp.Free;
    end;
end;

end.
