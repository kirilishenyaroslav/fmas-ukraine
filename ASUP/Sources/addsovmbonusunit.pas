unit AddSovmBonusUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, DB, IBCustomDataSet, IBQuery, StdCtrls, SpComboBox,
    Mask, CheckEditUnit, ComCtrls, PersonalCommon, SpCommon, GoodFunctionsUnit,
    DtManBonusItemsUnit, SpFormUnit;

type
    TAddSovmBonusForm = class(TForm)
        Label3: TLabel;
        Label4: TLabel;
        Label6: TLabel;
        Label9: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DateBegPicker: TDateTimePicker;
        DateEndPicker: TDateTimePicker;
        BonusBox: TSpComboBox;
        CurTimePicker: TDateTimePicker;
        GroupBox1: TGroupBox;
        Label11: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        WriteQuery: TIBQuery;
        Label7: TLabel;
        FIO: TEdit;
        SelectPersonButton: TSpeedButton;
        Podrazd: TEdit;
        Label12: TLabel;
        Post: TEdit;
        Label13: TLabel;
        SelectPodrazdAndPostButton: TButton;
        GroupBox2: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        Label2: TLabel;
        OkladLabel: TLabel;
        InputQuery: TIBQuery;
        InputQuery2: TIBQuery;
        InputQuery2NAME_FULL: TIBStringField;
        InputQuery2NAME_POST: TIBStringField;
        InputQuery2OKLAD: TIBBCDField;
        GroupBox3: TGroupBox;
        Label10: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label22: TLabel;
        DepartmentLabel: TLabel;
        PostLabel: TLabel;
        DigitLabel: TLabel;
        MoneyLabel: TLabel;
        StavkiLabel: TLabel;
        SelectShtatButton: TSpeedButton;
        GroupBox4: TGroupBox;
        IsPercent: TRadioButton;
        IsSumma: TRadioButton;
        PercentEdit: TCheckEdit;
        SumEdit: TCheckEdit;
        procedure SelectPersonButtonClick(Sender: TObject);
        constructor Create(aOwner: TComponent; aID_Order: Integer; aOrder_Date: TDate); reintroduce;
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
        procedure SelectShtatButtonClick(Sender: TObject);
        procedure RadioButton1Click(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public

        id_order: Integer;
        Order_DAte: TDate;
        id_pcard: Integer;
        id_man_moving: Integer;
        oklad: Double;
        id_shtatras: Integer;

    end;

var
    AddSovmBonusForm: TAddSovmBonusForm;

implementation

uses ShtatRas;

{$R *.dfm}

constructor TAddSovmBonusForm.Create(aOwner: TComponent; aID_Order: Integer; aOrder_Date: TDate);
begin
    inherited Create(aOwner);

    InputQuery.Transaction := ReadTransaction;
    InputQuery2.Transaction := ReadTransaction;
    WriteQuery.Transaction := WriteTransaction;

    id_order := aId_Order;
    Order_Date := aOrder_Date;

    CurTimePicker.Date := aOrder_Date;
    DateBegPicker.Date := aOrder_Date;
    DateEndPicker.Date := aOrder_Date;

    id_pcard := -1;
    id_man_moving := -1;
    id_shtatras := -1;

    DepartmentLabel.Caption := '';
    PostLabel.Caption := '';
    DigitLabel.Caption := '';
    MoneyLabel.Caption := '';
    StavkiLabel.Caption := '';

    BonusBox.Prepare(17412, 'Доплата за суміщення професій');
end;

procedure TAddSovmBonusForm.SelectPersonButtonClick(Sender: TObject);
var
    new_id_pcard: integer;

begin

    new_id_pcard := getpcard(order_date);

    if new_id_pcard <> -1 then begin

        // Проверяем есть ли для текущего человека хотя бы одна запись в Man_Moving
        InputQuery.Close;
        InputQuery.SQL.Text := 'SELECT DATE_BEG, DATE_END, ID_MAN_MOVING, ID_SHTATRAS FROM GET_CUR_MOVING_BY_ID_PCARD(' + IntToStr(new_Id_PCard) + ',' + QuotedStr(DateToStr(Order_Date)) + ')';
        InputQuery.Open;

        if not InputQuery.IsEmpty then begin

            // Если мы выбрали другого человека, то нужно обнулить мувинг, если тот выбран
            if (ID_PCARD <> -1) and (ID_PCARD <> new_id_pcard) then begin
                ID_MAN_MOVING := -1;
                Podrazd.Text := '';
                Post.Text := '';
                SelectPodrazdAndPostButton.Enabled := True;
            end;

            ID_PCARD := new_id_pcard;
            FIO.Text := GoodFunctionsUnit.Fam;

            // Проверяем, если эта запись одна, то сразу проставляем отдел и должность человека и дисейблим кнопку выбора жтих штук
            InputQuery.FetchAll;

            if InputQuery.RecordCount = 1 then begin
                if InputQuery['DATE_BEG'] = InputQuery['DATE_END'] then begin
                    FIO.Text := '';
                    ID_PCARD := -1;
                    ID_MAN_MOVING := -1;
                    Podrazd.Text := '';
                    Post.Text := '';
                    exit;
                end;

                SelectPodrazdAndPostButton.Enabled := False;

                ID_MAN_MOVING := InputQuery['ID_MAN_MOVING'];

                InputQuery2.Close;
                InputQuery2.SQL.Text := 'SELECT NAME_FULL, NAME_POST, OKLAD ' +
                    'FROM   DT_SHTATRAS S, SP_DEPARTMENT D, SP_POST P ' +
                    'WHERE  S.Id_Shtatras = ' + IntToStr(InputQuery['ID_SHTATRAS']) +
                    'AND    S.Id_Department = D.Id_Department ' +
                    'and    s.Id_Post = p.Id_Post ' +
                    'and    (CURRENT_TIMESTAMP between s.Use_Beg and s.Use_End) ' +
                    'and    (CURRENT_TIMESTAMP between d.Use_Beg and d.Use_End)';
                InputQuery2.Open;

                Podrazd.Text := InputQuery2NAME_FULL.Value;
                Post.Text := InputQuery2NAME_POST.Value;
                oklad := InputQuery2OKLAD.Value;

                OkladLabel.Caption := FloatToStr(oklad) + ' грн.';
            end;
        end else
            MessageDlg('Неможливо вибрати цього робітника, бо він ніде не працює', mtError, [mbOk], 0);
    end;
end;

procedure TAddSovmBonusForm.SelectNumItemButtonClick(Sender: TObject);
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

procedure TAddSovmBonusForm.SelectPodrazdAndPostButtonClick(
    Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin
    if ID_PCARD = -1 then MessageDlg('Потрібно спочатку вибрати звільняєму людину!', mtError, [mbOk], 0)
    else begin
        temp := TSpForm.Create(Self);
        params := TSpParams.Create;
        params.IdField := 'ID_MAN_MOVING';
        params.SpFields := 'NAME_DEPARTMENT_FULL, POST, DATE_BEG, DATE_END';
        params.Title := 'Виберіть підрозділ та посаду, з яких треба звільнити людину';
        params.ColumnNames := 'Підрозділ,Посада, Дата початку,Дата кінця';
        params.ReadOnly := True;
        params.Table := 'GET_PCARD_MOVINGS(' + IntToStr(ID_PCARD) + ',''' + DateToStr(Order_Date) + ''')';
        params.SpMode := spmSelect;
        temp.Init(params);
        temp.ShowModal;

        if temp.ModalResult = mrOk then begin
            if temp.ResultQuery['DATE_BEG'] = temp.ResultQuery['DATE_END'] then begin
                MessageDlg('Неможливо звілнити цю людину з цієї посади, бо вона принята на один день!', mtError, [mbOk], 0);
                exit;
            end;

            ID_MAN_MOVING := temp.ResultQuery['ID_MAN_MOVING'];
            Podrazd.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            Post.Text := temp.ResultQuery['POST'];
        end;
        temp.free;
    end;
end;

procedure TAddSovmBonusForm.SelectShtatButtonClick(Sender: TObject);
var
    temp: TShtatRasForm;
begin
    temp := TShtatRasForm.Create(Self, spmReadOnly + [spfCantRemoveFilter], -1, -1, True, CurTimePicker.Date);
    temp.WindowState := wsMaximized;
    temp.ShowModal;

    if temp.ModalResult = mrOk then begin

        ID_SHTATRAS := temp.ShtatQuery['ID_SHTATRAS'];

        // Проставляем данные в информационный блок Посада штатного розкладу

        DepartmentLabel.Caption := temp.DepartmentsQuery['NAME_SHORT'];
        PostLabel.Caption := temp.ShtatQuery['NAME_POST'];

        if temp.ShtatQuery['Num_Digit'] <= 0
            then
            DigitLabel.Caption := 'оклад'
        else
            DigitLabel.Caption := IntToStr(temp.ShtatQuery['Num_Digit']);

        MoneyLabel.Caption := temp.ShtatQuery['MONEY'];
        StavkiLabel.Caption := temp.ShtatQuery['KOL_STAVOK'];
    end;

    temp.Free;

end;

procedure TAddSovmBonusForm.RadioButton1Click(Sender: TObject);
begin

    if RadioButton1.Checked then begin
        IsSumma.Enabled := True;
        SumEdit.Enabled := True;
    end
    else begin
        IsSumma.Enabled := False;
        SumEdit.Enabled := False;

        if IsSumma.Checked then
            IsPercent.Checked := True;
    end;
end;

procedure TAddSovmBonusForm.OkButtonClick(Sender: TObject);
var
    SovmType: Integer;
    Is_Percent: Char;
begin

    if IsPercent.Checked then begin
        SumEdit.Text := '0';
        Is_Percent := 'T';
    end
    else begin
        PercentEdit.Text := '0';
        Is_Percent := 'F';
    end;

    if Id_Man_Moving = -1
        then begin
        ErrMsg('Потрібно вибрати робітника!');
        exit;
    end;

    if Id_Shtatras = -1
        then begin
        ErrMsg('Потрібно вибрати посаду!');
        exit;
    end;

    if (IsPercent.Checked) and (not CheckForFill(PercentEdit, 'Потрібно ввести процент оплати!')) then
        exit;


    if (IsSumma.Checked) and (not CheckForFill(SumEdit, 'Потрібно ввести суму оплати!')) then
        exit;

    if (StrToFloat(PercentEdit.Text) * 0.01 > StrToFloat(StavkiLabel.Caption)) and
        (RadioButton2.Checked)
        then begin
        ErrMsg('Коли встановлен тип оплати "Від окладу посади, яка суміщюється" процент не може бути більшим, ніж кількість вакантних ставок!');
        exit;
    end;

    if (StrToFloat(SumEdit.Text) > StrToFloat(StavkiLabel.Caption) * StrToFloat(MoneyLabel.Caption)) and
        (RadioButton1.Checked) and IsSumma.Checked
        then begin
        ErrMsg('Коли встановлен тип оплати "Від окладу робітника" сума доплати не може бути більшою, ніж сума, передбачена на оплату посади штатного розкладу (кількість ставок помножена на оклад однієї ставки)!');
        exit;
    end;

    if DateBegPicker.Date > DateEndPicker.Date
        then begin
        ErrMsg('Дата кінця дії доплати повинна буди більш ніж дата початку!');
        exit;
    end;

    if BonusBox.GetId = -1
        then begin
        ErrMsg('Потрібно вибрати тип виду оплати!');
        exit;
    end;

    if not CheckForFill(NumItemEdit, 'Потрібно вибрати пункт наказу!') then
        exit;

    WriteTransaction.StartTransaction;

    try

        if RadioButton1.Checked then
            SovmType := 1
        else
            SovmType := 2;

        WriteQuery.Close;
        WriteQuery.Params.ParamValues['ID_MAN_MOVING'] := id_man_moving;
        WriteQuery.Params.ParamValues['ID_SHTATRAS'] := id_shtatras;
        WriteQuery.Params.ParamValues['SOVM_TYPE'] := SovmType;
        WriteQuery.Params.ParamValues['SOVM_PERCENT'] := PercentEdit.Text;
        WriteQuery.Params.ParamValues['SOVM_SUMMA'] := SumEdit.Text;
        WriteQuery.Params.ParamValues['DATE_BEG'] := DateBegPicker.Date;
        WriteQuery.Params.ParamValues['DATE_END'] := DateEndPicker.Date;
        WriteQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
        WriteQuery.Params.ParamValues['NUM_ITEM'] := NumItemEdit.Text;
        WriteQuery.Params.ParamValues['ID_BONUS'] := BonusBox.GetId;
        WriteQuery.Params.ParamValues['IS_PERCENT'] := Is_Percent;
        ExecQuery(WriteQuery);

    except on E: Exception
        do begin
            WriteTransaction.Rollback;
            ErrMsg('Виникла помилка: "' + E.Message + '"');
            exit;
        end;
    end;

    WriteTransaction.Commit;

    ModalResult := mrOk;

end;

end.
