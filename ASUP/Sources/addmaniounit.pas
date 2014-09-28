unit AddManIoUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, SpComboBox, PersonalCommon, SpCommon, GoodFunctionsUnit,
    Mask, CheckEditUnit, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
    ComCtrls, TextShablonsUnit;

type
    TAddManIoForm = class(TForm)
        Panel4: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        GroupBox1: TGroupBox;
        Label2: TLabel;
        Label8: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        NumItemText: TMemo;
        NewNumItemEdit: TCheckEdit;
        Label5: TLabel;
        IoReasonBox: TSpComboBox;
        SelectFirstManButton: TButton;
        Label1: TLabel;
        FioLabel: TLabel;
        PostLabel: TLabel;
        Panel1: TPanel;
        ResultQuery: TIBQuery;
        WorkQuery: TIBQuery;
        Label3: TLabel;
        DateBegPicker: TDateTimePicker;
        Label4: TLabel;
        DateEndPicker: TDateTimePicker;
        Label6: TLabel;
        FioLabel2: TLabel;
        PostLabel2: TLabel;
        SelectSecondManButton: TButton;
        WorkQuery2: TIBQuery;
        IntegerField1: TIntegerField;
        IntegerField2: TIntegerField;
        DateField1: TDateField;
        DateField2: TDateField;
        IBStringField1: TIBStringField;
        IntegerField3: TIntegerField;
        IBBCDField1: TIBBCDField;
        Label7: TLabel;
        OkladLabel: TLabel;
        Label9: TLabel;
        OkladLabel2: TLabel;
        Label10: TLabel;
        IoTypeBox: TSpComboBox;
        Label11: TLabel;
        BonusBox: TSpComboBox;
        MoneyLabel: TLabel;
        MoneyEdit: TCheckEdit;
        Label12: TLabel;
        ReasonMemo: TMemo;
        GetSexQuery: TIBQuery;
        GetSexQueryID_SEX: TIntegerField;
        Label13: TLabel;
        RealMoneyEdit: TCheckEdit;
        Label14: TLabel;
        ResultQueryID_IO_REASON: TIntegerField;
        ResultQueryID_MAN_MOVING1: TIntegerField;
        ResultQueryID_IO_TYPE: TIntegerField;
        ResultQueryID_MAN_BONUS: TIntegerField;
        ResultQueryREASON: TIBStringField;
        ResultQueryID_MAN_MOVING2: TIntegerField;
        ResultQueryID_BONUS: TIntegerField;
        ResultQuerySUMMA: TIBBCDField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryFIO1: TIBStringField;
        ResultQueryFIO2: TIBStringField;
        ResultQueryNAME_POSTDEP1: TIBStringField;
        ResultQueryNAME_POSTDEP2: TIBStringField;
        ResultQueryNAME_BONUS: TIBStringField;
        ResultQueryIO_REASON: TIBStringField;
        ResultQueryIO_TYPE: TIBStringField;
        ResultQueryTN1: TIntegerField;
        ResultQueryTN2: TIntegerField;
        ResultQueryID_ORDER: TIntegerField;
        EndLabel: TLabel;
        Label15: TLabel;
        HospitalLabel: TLabel;
        ResultQueryID_MAN_HOSPITAL: TIntegerField;
        ResultQueryHOSPITAL_STRING: TIBStringField;
        ResultQueryITEM_TEXT: TBlobField;
        ResultQueryIO_PERCENT: TIntegerField;
        SelectReasonButton: TButton;
        procedure SelectFirstManButtonClick(Sender: TObject);
        constructor Create(AOwner: TComponent; Mode: TEditMode; idOrder: Integer; DateOrder: TDate; IdManBonusIo: Integer = -1); reintroduce;
        procedure SelectSecondManButtonClick(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure IoTypeBoxChange(Sender: TObject);
        procedure RadioButton1Click(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormNumItem;
        procedure MoneyEditChange(Sender: TObject);
        procedure IoReasonBoxChange(Sender: TObject);
        procedure DateBegPickerChange(Sender: TObject);
        procedure DateEndPickerChange(Sender: TObject);
        procedure BonusBoxChange(Sender: TObject);
        procedure RealMoneyEditChange(Sender: TObject);
        procedure ReasonMemoChange(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure Sub1;
        procedure sub2;
        procedure SelectReasonButtonClick(Sender: TObject);
    private

        FMode: TEditMode;
        Id_Order: Integer;
        Date_Order: TDate;
        Id_Man_Bonus_Io: Integer;
        id_man_bonus: Integer;

        id_man_moving1, id_man_moving2: Integer;
        Money1, Money2: Double;

        Id_Man_Hospital: Integer;
    public
    { Public declarations }
    end;

var
    AddManIoForm: TAddManIoForm;

implementation

uses DtManBonusItemsUnit, uCommonSp;

{$R *.dfm}

procedure TAddManIoForm.FormNumItem;
var
    Sex_Str, Oplata_str: string;
begin
    if not Enabled then exit;

    if (IoReasonBox.GetId = -1) or
        (Id_man_moving1 = -1) or
        (Id_man_moving2 = -1) or
        (IoTypeBox.GetId = -1) or
        (BonusBox.GetId = -1) or
        (RealMoneyEdit.Text = '') or
        (ReasonMemo.Text = '')
        then begin
        NumItemText.Text := '';
        exit;
    end;

    GetSexQuery.Close;
    GetSexQuery.Params.ParamValues['id_man_moving'] := id_man_moving1;
    GetSexQuery.Open;

    try
        if GetSexQuery['ID_SEX'] = 1 then
            sex_str := 'його'
        else
            sex_str := 'її'
    except
    end;

    GetSexQuery.Close;

    if IoTypeBox.GetId = 1 then
        oplata_str := ', з доплатою у розмірі ' + MoneyEdit.Text + '% від окладу тимчасово відсутнього.';

    if IoTypeBox.GetId = 2 then
        oplata_str := ', з виплатою різниці у окладах.';

    if IoTypeBox.GetId = 3 then
        oplata_str := ', з виплатою ' + RealMoneyEdit.Text + ' грн на місяць.';

    if RadioButton2.Checked then begin
        NumItemText.Text := '   ' + IoReasonBox.Text + ' ' + FioLabel.Caption + ', ' +
            PostLabel.Caption + ' з ' + DateToStr(DateBegPicker.Date);

        if Id_Man_Hospital = -1 then
            NumItemText.Text := NumItemText.Text + ' по ' +
                DateToStr(DateEndPicker.Date);

        NumItemText.Text := NumItemText.Text + ', виконання ' + sex_str + ' обов`язків покласти на ' +
            FioLabel2.Caption + ', ' + PostLabel2.Caption + oplata_str +
            #13#10 + #13#10 + 'Підстава: ' + ReasonMemo.Text;
    end;
end;

constructor TAddManIoForm.Create(AOwner: TComponent; Mode: TEditMode; idOrder: Integer; DateOrder: TDate; IdManBonusIo: Integer = -1);
begin
    inherited Create(aOwner);

    FMode := Mode;
    Id_Order := IdOrder;
    Date_Order := DateOrder;
    Id_Man_Bonus_Io := IdManBonusIo;

    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    WorkQuery2.Transaction := PersonalCommon.WriteTransaction;

    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    GetSexQuery.Transaction := PersonalCommon.ReadTransaction;

    if FMode = emNew then begin
        DateBegPicker.Date := Date;
        DateEndPicker.Date := Date;

        IoReasonBox.Prepare(-1, '');
        IoTypeBox.LoadFromRegistry;
        BonusBox.LoadFromRegistry;

        id_man_moving1 := -1;
        id_man_moving2 := -1;
        id_man_bonus := -1;
        Id_Man_Hospital := -1;
        Money1 := 0;
        Money2 := 0;

        Caption := Caption + ' (створення нового)';
    end
    else begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_MAN_BONUS_IO'] := Id_Man_Bonus_Io;
        ResultQuery.Open;

        DateBegPicker.Date := ResultQueryDATE_BEG.Value;
        DateEndPicker.Date := ResultQueryDATE_END.Value;

        IoReasonBox.Prepare(ResultQueryID_IO_REASON.Value, ResultQueryIO_REASON.Value);
        IoTypeBox.Prepare(ResultQueryID_IO_TYPE.Value, ResultQueryIO_TYPE.Value);
        BonusBox.Prepare(ResultQueryID_BONUS.Value, ResultQueryNAME_BONUS.Value);

        MoneyEdit.Text := ResultQueryIO_PERCENT.AsString;

        id_man_moving1 := ResultQueryID_MAN_MOVING1.Value;
        id_man_moving2 := ResultQueryID_MAN_MOVING2.Value;
        id_man_bonus := ResultQueryID_MAN_BONUS.Value;

        Id_Man_Hospital := ResultQueryID_MAN_HOSPITAL.Value;

        if (id_man_hospital > 0) then begin
            HospitalLabel.Caption := ResultQueryHOSPITAL_STRING.Value;
            //DateBegPicker.Enabled := False;
            DateEndPicker.Visible := False;
        end;

        GetManMoney(id_man_moving1, Date_Order, Money1);
        GetManMoney(id_man_moving2, Date_Order, Money2);

        FioLabel.Caption := ResultQueryFIO1.Value;
        PostLabel.Caption := ResultQueryNAME_POSTDEP1.Value;
        OkladLabel.Caption := FloatToStr(Money1);

        FioLabel2.Caption := ResultQueryFIO2.Value;
        PostLabel2.Caption := ResultQueryNAME_POSTDEP2.Value;
        OkladLabel2.Caption := FloatToStr(Money2);

        ReasonMemo.Text := ResultQueryREASON.Value;
        RealMoneyEdit.Text := ResultQuerySUMMA.AsString;

        NewNumItemEdit.Text := ResultQueryNUM_ITEM.AsString;
        NumItemText.Text := ResultQueryITEM_TEXT.Value;

        ResultQuery.Close;
    end;

    if FMode = emModify then begin
        Caption := Caption + ' (редагування)';
    end;

    if FMode = emView then begin
        Panel1.Enabled := False;
        GroupBox1.Enabled := False;
        OkButton.Visible := False;
        CancelButton.Left := 208;
        CancelButton.Caption := 'Закрити';
        Caption := Caption + ' (перегляд)';
    end;
end;

procedure TAddManIoForm.SelectFirstManButtonClick(Sender: TObject);
var
    mov_info: TMovingInfo;
begin
    if Select_Man_Moving(mov_info, Date_Order)
        then begin
        FioLabel.Caption := mov_info.FIO;
        PostLabel.Caption := mov_info.PostName + ' (' + mov_info.Department_Full + ')';
        id_man_moving1 := mov_info.Id_Man_Moving;

        GetManMoney(id_man_moving1, Date_Order, Money1);
        OkladLabel.Caption := FloatToStr(Money1) + ' грн';

        MoneyEditChange(Self);
        FormNumItem;
    end;
end;

procedure TAddManIoForm.SelectSecondManButtonClick(Sender: TObject);
var
    mov_info: TMovingInfo;
begin
    if Select_Man_Moving(mov_info, Date_Order)
        then begin
        FioLabel2.Caption := mov_info.FIO;
        PostLabel2.Caption := mov_info.PostName + ' (' + mov_info.Department_Full + ')';
        id_man_moving2 := mov_info.Id_Man_Moving;

        GetManMoney(id_man_moving2, Date_Order, Money2);
        OkladLabel2.Caption := FloatToStr(Money2) + ' грн';

        MoneyEditChange(Self);
        FormNumItem
    end;
end;

procedure TAddManIoForm.SelectNumItemButtonClick(Sender: TObject);
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

procedure TAddManIoForm.IoTypeBoxChange(Sender: TObject);
begin
    if IoTypeBox.GetId = 1 then begin
        MoneyLabel.Visible := True;
        MoneyEdit.Visible := True;

        Label13.Visible := False;
        Label14.Visible := False;
        RealMoneyEdit.Visible := False;

        RealMoneyEdit.Enabled := False;
    end;

    if IoTypeBox.GetId = 2 then begin
        MoneyLabel.Visible := False;
        MoneyEdit.Visible := False;

        Label13.Visible := True;
        Label14.Visible := True;
        RealMoneyEdit.Visible := True;

        RealMoneyEdit.Enabled := False;
    end;

    if IoTypeBox.GetId = 3 then begin
        MoneyLabel.Visible := False;
        MoneyEdit.Visible := False;

        Label13.Visible := True;
        Label14.Visible := True;
        RealMoneyEdit.Visible := True;

        RealMoneyEdit.Enabled := True;
    end;

    MoneyEditChange(Self);
    FormNumItem;
end;

procedure TAddManIoForm.RadioButton1Click(Sender: TObject);
begin
    NumItemEdit.Enabled := RadioButton1.Checked;
    SelectNumItemButton.Enabled := RadioButton1.Checked;

    NewNumItemEdit.Enabled := RadioButton2.Checked;
    NumItemText.Enabled := RadioButton2.Checked;
end;

procedure TAddManIoForm.OkButtonClick(Sender: TObject);
var
    NumItem: Integer;
begin
    if IoReasonBox.GetId = -1
        then begin
        ErrMsg('Треба вибрати тип виконання обов`язків!');
        IoReasonBox.SetFocus;
        exit;
    end;

    if id_man_moving1 = -1
        then begin
        ErrMsg('Треба вибрати працівника, який відсутній!');
        exit;
    end;

    if id_man_moving2 = -1
        then begin
        ErrMsg('Треба вибрати працівника, який буде виконувати обов`язки!');
        exit;
    end;

    if IoTypeBox.GetId = -1
        then begin
        ErrMsg('Треба вибрати тип оплати виконання обов`язків!');
        IoTypeBox.SetFocus;
        exit;
    end;

    if BonusBox.GetId = -1
        then begin
        ErrMsg('Треба вибрати тип доплати!');
        BonusBox.SetFocus;
        exit;
    end;

    if (MoneyEdit.Visible) and (MoneyEdit.Text = '') then begin
        ErrMsg('Треба ввести процент від окладу відсутнього!');
        MoneyEdit.SetFocus;
        exit;
    end;

    if RealMoneyEdit.Text = ''
        then begin
        ErrMsg('Треба ввести суму оплати!');
        RealMoneyEdit.SetFocus;
        exit;
    end;

    if ReasonMemo.Text = ''
        then begin
        ErrMsg('Треба ввести підставу!');
        ReasonMemo.SetFocus;
        exit;
    end;

    if DateEndPicker.Date < DateBegPicker.Date
        then begin
        ErrMsg('Дата кінця виконання обов`язків не може бути меньшою ніж дата початку!');
        DateEndPicker.SetFocus;
        exit;
    end;

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

    if RadioButton1.Checked then
        NumItem := StrToInt(NumItemEdit.Text)
    else
        NumItem := StrToInt(NewNumItemEdit.Text);

    WorkQuery.Transaction.StartTransaction;

    try

        if MoneyEdit.Visible then
            WorkQuery.Params.ParamValues['IO_PERCENT'] := MoneyEdit.Text
        else
            WorkQuery.Params.ParamValues['IO_PERCENT'] := null;

        WorkQuery.Params.ParamValues['ID_MAN_BONUS_IO'] := id_man_bonus_io;
        WorkQuery.Params.ParamValues['ID_IO_REASON'] := IoReasonBox.GetId;
        WorkQuery.Params.ParamValues['ID_MAN_MOVING'] := id_man_moving1;
        WorkQuery.Params.ParamValues['ID_IO_TYPE'] := IoTypeBox.GetId;
        WorkQuery.Params.ParamValues['ID_MAN_BONUS'] := id_man_bonus;
        WorkQuery.Params.ParamValues['REASON'] := ReasonMemo.Text;
        WorkQuery.Params.ParamValues['ID_MAN_MOVING2'] := id_man_moving2;
        WorkQuery.Params.ParamValues['ID_BONUS'] := BonusBox.GetId;
        WorkQuery.Params.ParamValues['SUMMA'] := StrToFloat(RealMoneyEdit.Text);
        WorkQuery.Params.ParamValues['DATE_BEG'] := DateToStr(DateBegPicker.Date);
        WorkQuery.Params.ParamValues['DATE_END'] := DateToStr(DateEndPicker.Date); ;
        WorkQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
        WorkQuery.Params.ParamValues['NUM_ITEM'] := NumItem;
        WorkQuery.Params.ParamValues['Id_Man_Hospital'] := Id_Man_Hospital;

        ExecQuery(WorkQuery);

        if RadioButton2.Checked then begin
            WorkQuery2.Params.ParamValues['ID_ORDER'] := id_order;
            WorkQuery2.Params.ParamValues['Num_Item'] := NumItem;
            WorkQuery2.Params.ParamValues['Text'] := NumItemText.Text;

            ExecQuery(WorkQuery2);
        end;

    except on E: Exception
        do begin
            ErrMsg('Виникла помилка: "' + E.Message + '"');
            WorkQuery.Transaction.Rollback;
            exit;
        end;
    end;

    WorkQuery.Transaction.Commit;

    ModalResult := mrOk;

end;

procedure TAddManIoForm.MoneyEditChange(Sender: TObject);
begin
    if (IoTypeBox.GetId = -1) then
        exit
    else begin

        if (IoTypeBox.GetId = 1) and (id_man_moving1 <> -1) and (MoneyEdit.Text <> '') then
            RealMoneyEdit.Text := FormatFloat('0.00', money1 * StrToInt(MoneyEdit.Text) / 100);

        if (IoTypeBox.GetId = 2) and (id_man_moving2 <> -1) and (id_man_moving1 <> -1) then
            RealMoneyEdit.Text := FormatFloat('0.00', Money1 - Money2);

    end;
end;

procedure TAddManIoForm.sub2;
begin
    //IoReasonBox.Prepare(-1, '');
    DateBegPicker.Enabled := True;
    DateEndPicker.Visible := True;

    Money1 := 0;
    Id_Man_Hospital := -1;
    Id_Man_Moving1 := -1;
    FioLabel.Caption := '---';
    PostLabel.Caption := '---';
    OkladLabel.Caption := '---';
    HospitalLabel.Caption := '---';
end;

procedure TAddManIoForm.sub1;
begin
    IoReasonBox.Prepare(-1, '');
    DateBegPicker.Enabled := True;
    DateEndPicker.Visible := True;

    Money1 := 0;
    Id_Man_Hospital := -1;
    Id_Man_Moving1 := -1;
    FioLabel.Caption := '---';
    PostLabel.Caption := '---';
    OkladLabel.Caption := '---';
    HospitalLabel.Caption := '---';
end;

procedure TAddManIoForm.IoReasonBoxChange(Sender: TObject);
var
    Id_moving: Integer;
    Post, Dep: string;
    sp: TSprav;
begin
    if not Visible then exit;

    if IoReasonBox.GetId = 2 then
    begin
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
                if not GetCurrentWorkPlace(sp.Output['Id_PCard'], Date_Order, Id_Moving, Post, Dep) then
                begin
                    ErrMsg('Помилка: неможливо встановити місце роботи та посаду працівника ' + sp.Output['FIO']);
                    Sub1;
                    sp.Free;
                    FormNumItem;
                    exit;
                end;

                Id_Man_Hospital := sp.Output['Id_Man_Hosp'];
                Id_Man_Moving1 := Id_Moving;
                HospitalLabel.Caption := sp.Output['DisplayText'];
                FioLabel.Caption := sp.Output['Fio'];
                PostLabel.Caption := Post + ' (' + Dep + ')';

                GetManMoney(id_moving, Date_Order, Money1);

                OkladLabel.Caption := FloatToStr(Money1) + ' грн';

                DateBegPicker.Date := sp.Output['Date_Beg'];

                if sp.Output['Ending'] = 2 then
                    DateEndPicker.Date := EncodeDate(2150, 12, 31)
                else
                    DateEndPicker.Date := sp.Output['Date_End'];

            //DateBegPicker.Enabled := False;
                DateEndPicker.Visible := False;
            end;
            sp.Free;
        end
        else
        begin
            Sub1;
        end;
    end
    else
        Sub2;

    FormNumItem;
end;

procedure TAddManIoForm.DateBegPickerChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddManIoForm.DateEndPickerChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddManIoForm.BonusBoxChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddManIoForm.RealMoneyEditChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddManIoForm.ReasonMemoChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddManIoForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    IoTypeBox.SaveIntoRegistry;
    BonusBox.SaveIntoRegistry;
end;

procedure TAddManIoForm.SelectReasonButtonClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(16);

    if Form.ShowModal = mrOk
        then begin
        ReasonMemo.Text := Form.ResultQueryTEXT1.Value;
    end;

    form.Free;
end;



end.
