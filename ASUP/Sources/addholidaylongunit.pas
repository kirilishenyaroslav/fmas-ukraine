unit addholidaylongunit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, Mask, CheckEditUnit, StdCtrls,
    Buttons, ComCtrls, SpComboBox, ExtCtrls, PersonalCommon, SpCommon,
    GoodFunctionsUnit, SpFormUnit, SpHolidayUnit;

type
    TaddholidaylongForm = class(TForm)
        ResultQuery: TIBQuery;
        WriteQuery: TIBQuery;
        CheckQuery: TIBQuery;
        CheckQueryHCOUNT: TIntegerField;
        TopPanel: TPanel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        DatesReCalc: TSpeedButton;
        TermReCalc: TSpeedButton;
        DateBeg: TDateTimePicker;
        DateEnd: TDateTimePicker;
        SelectHolidayButton: TButton;
        TermEdit: TCheckEdit;
        Label1: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        LongReasonBox: TSpComboBox;
        Label9: TLabel;
        Label10: TLabel;
        OrderPanel: TGroupBox;
        Label12: TLabel;
        Label13: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        NumItemText: TMemo;
        NewNumItemEdit: TCheckEdit;
        BottomPanel: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ReasonMemo: TMemo;
        DepartmentPostLabel: TLabel;
        FioLabel: TLabel;
        HolidayEdit: TEdit;
        PeriodBegLabel: TLabel;
        PeriodEndLabel: TLabel;
        Label11: TLabel;
        RemoveDateLabel: TLabel;
        Label14: TLabel;
        ForWhatLabel: TLabel;
        RemoveHolidaySelectButton: TSpeedButton;
        RemoveQuery: TIBQuery;
        RemoveQueryNUM_ITEM: TIntegerField;
        RemoveQueryID_HOLIDAY_ORDER: TIntegerField;
        RemoveQueryDATE_REMOVE: TDateField;
        RemoveQueryFOR_WHAT: TIBStringField;
        RemoveQueryFIO_SMALL: TIBStringField;
        RemoveQueryTN: TIntegerField;
        RemoveQueryPOST_NAME: TIBStringField;
        RemoveQueryDEP_NAME: TIBStringField;
        RemoveQueryHOLIDAY_BEG: TDateField;
        RemoveQueryHOLIDAY_END: TDateField;
        RemoveQueryORDER_NUM: TIBStringField;
        RemoveQueryID_MAN_MOVING: TIntegerField;
        Label15: TLabel;
        DateBegLabel: TLabel;
        Label17: TLabel;
        DateEndLabel: TLabel;
        RemoveQueryPERIOD_BEG: TDateField;
        RemoveQueryPERIOD_END: TDateField;
        WorkQuery2: TIBQuery;
        IntegerField1: TIntegerField;
        IntegerField2: TIntegerField;
        DateField1: TDateField;
        DateField2: TDateField;
        IBStringField1: TIBStringField;
        IntegerField3: TIntegerField;
        IBBCDField1: TIBBCDField;
        ResultQueryID_ORDER: TIntegerField;
        ResultQueryID_HOLIDAY: TIntegerField;
        ResultQueryPERIOD_BEG: TDateField;
        ResultQueryPERIOD_END: TDateField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryH_TERM: TIntegerField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryDAY_USED: TIntegerField;
        ResultQueryDAY_UNUSED: TIntegerField;
        ResultQueryRMOVING: TIntegerField;
        ResultQueryID_STATUS: TIntegerField;
        ResultQueryREASON: TIBStringField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryID_HOLIDAY_REMOVE_PROLONG: TIntegerField;
        ResultQueryID_HOLIDAY_LONG_REASON: TIntegerField;
        ResultQueryDEPARTMENT_NAME: TIBStringField;
        ResultQueryPOST_NAME: TIBStringField;
        ResultQueryFIO_SMALL: TIBStringField;
        ResultQueryTN: TIntegerField;
        ResultQueryNAME_REASON: TIBStringField;
        ResultQueryNAME_HOLDIAY: TIBStringField;
        procedure FormNumItem;
        procedure SelectHolidayButtonClick(Sender: TObject);
        constructor Create(aOwner: TComponent;
            aFMode: TEditMode;
            aid_order: Integer;
            aOrder_Date: TDate;
            aId_Man_Holiday: Integer = -1); reintroduce;
        procedure DatesReCalcClick(Sender: TObject);
        procedure TermReCalcClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
        procedure DisplayRemoveInfo(aId_Holiday_Remove_Prolong: Integer);
        procedure RemoveHolidaySelectButtonClick(Sender: TObject);
        procedure DateBegChange(Sender: TObject);
        procedure TermEditChange(Sender: TObject);
        procedure LongReasonBoxChange(Sender: TObject);
        procedure ReasonMemoChange(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Holiday_Remove_Prolong: Integer;
        Id_Holiday: Integer;

        Id_Order: Integer;
        Order_Date: TDate;
        FMode: TEditMode;
        Id_Man_Holiday: Integer;
        Id_Man_Moving: Integer;
    end;

var
    addholidaylongForm: TAddHolidayLongForm;

implementation

{$R *.dfm}

procedure TAddHolidayLongForm.DisplayRemoveInfo(aId_Holiday_Remove_Prolong: Integer);
begin
    RemoveQuery.Close;
    RemoveQuery.Params.ParamValues['Id_Holiday_Remove_Prolong'] := aId_Holiday_Remove_Prolong;
    RemoveQuery.Open;

    FioLabel.Caption := RemoveQueryFIO_SMALL.Value;
    DepartmentPostLabel.Caption := RemoveQueryDEP_NAME.Value + ' (' + RemoveQueryPOST_NAME.Value + ')';
    PeriodBegLabel.Caption := RemoveQueryPERIOD_BEG.AsString;
    PeriodEndLabel.Caption := RemoveQueryPERIOD_END.AsString;
    DateBegLabel.Caption := RemoveQueryHOLIDAY_BEG.AsString;
    DateEndLabel.Caption := RemoveQueryHOLIDAY_END.AsString;
    RemoveDateLabel.Caption := RemoveQueryDATE_REMOVE.AsString;
    ForWhatLabel.Caption := RemoveQueryFOR_WHAT.Value;

    RemoveQuery.Close;
end;

constructor TaddholidaylongForm.Create(aOwner: TComponent; aFMode: TEditMode; aid_order: Integer; aOrder_Date: TDate; aId_Man_Holiday: Integer = -1);
begin
    inherited Create(aOwner);

    FMode := aFMode;
    Id_Order := aId_Order;
    Order_Date := aOrder_Date;
    Id_Man_Holiday := aId_Man_Holiday;

    RemoveQuery.Transaction := ReadTransaction;
    ResultQuery.Transaction := ReadTransaction;
    CheckQuery.Transaction := ReadTransaction;
    WriteQuery.Transaction := WriteTransaction;
    WorkQuery2.Transaction := WriteTransaction;

    LongReasonBox.SpParams.ReadOnly := not GPP_CHECK;

    if FMode = emNew then begin
        Id_Holiday_Remove_Prolong := -1;
        Id_Holiday := -1;
        Id_Man_Moving := -1;

        DateBeg.Date := Date;
        DateEnd.Date := Date;

        LongReasonBox.LoadFromRegistry;

        NewNumItemEdit.Text := IntToStr(GetMaxOrderNumItem(id_order));

        Caption := Caption + ' (створення нового)';
    end;

    if (FMode = emModify) or (FMode = emView) then begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_MAN_HOLIDAY'] := Id_Man_Holiday;
        ResultQuery.Open;

        Id_Holiday_Remove_Prolong := ResultQueryID_HOLIDAY_REMOVE_PROLONG.Value;
        Id_Holiday := ResultQueryID_HOLIDAY.Value;
        HolidayEdit.Text := ResultQueryNAME_HOLDIAY.Value;
        Id_Man_Moving := ResultQueryID_MAN_MOVING.Value;

        DateBeg.Date := ResultQueryDATE_BEG.Value;
        DateEnd.Date := ResultQueryDATE_END.Value;

        TermEdit.Text := ResultQueryH_TERM.AsString;

        LongReasonBox.Prepare(ResultQueryID_HOLIDAY_LONG_REASON.Value, ResultQueryNAME_REASON.Value);

        ReasonMemo.Text := ResultQueryREASON.value;

        NewNumItemEdit.Text := ResultQueryNUM_ITEM.AsString;

        DisplayRemoveInfo(Id_Holiday_Remove_Prolong);

        FormNumItem;
    end;

    if FMode = emModify then begin
        Caption := Caption + ' (редагування)';
    end;

    if FMode = emView then begin
        OrderPanel.Enabled := False;
        TopPanel.Enabled := False;
        OkButton.Visible := False;
        CancelButton.Left := 232;

        Caption := Caption + ' (перегляд)';
    end;
end;

procedure TaddholidaylongForm.FormNumItem;
begin
    if not Enabled then exit;

    if (Id_Holiday_Remove_Prolong = -1) or
        (Id_Holiday = -1) or
        (TermEdit.Text = '') or
        (LongReasonBox.GetId = -1) or
        (ReasonMemo.Text = '')
        then begin
        NumItemText.Text := '';
        exit;
    end;

    if RadioButton2.Checked then begin
        NumItemText.Text := '   ' + FIOLabel.Caption + ', ' + DepartmentPostLabel.Caption + ', ' +
            'продовжити планову відпустку з ' + DateToStr(DateBeg.Date) + ' по ' +
            DateToStr(DateEnd.Date) + ', ' + LongReasonBox.Text + '.'
            + #13#10 + 'Підстава: ' + ReasonMemo.Text;
    end;
end;

procedure TaddholidaylongForm.SelectHolidayButtonClick(Sender: TObject);
var
    form: TSpHolidayForm;
    Params: TSpParams;
    Date1: string;
begin
    form := TSpHolidayForm.Create(Self);

    Params := TSpParams.Create;

    with Params do
    begin
        Table := 'Sp_Holiday';
        Title := 'Основні відпустки';
        IdField := 'Id_Holiday';
        SpFields := 'Name_Holiday';
        ColumnNames := 'Відпустки';
        InsertProcName := 'Sp_Holiday_Insert';
        UpdateProcName := 'Sp_Holiday_Update';
        DeleteProcName := 'Sp_Holiday_Delete';
        SpMode := spmSelect;
    end;

    form.Init(Params);

    if form.ShowModal = mrOk then
    begin

        HolidayEdit.Text := form.ResultQuery['Name_Holiday'];
        Id_Holiday := form.ResultQuery['Id_holiday'];

        TermEdit.Text := IntToStr(form.resultQuery['Default_Term']);

        DateEnd.Date := DateBeg.Date + StrToInt(TermEdit.Text) - 1;

        CheckQuery.Close;
        CheckQuery.Params.ParamValues['DATE1'] := DateToStr(DateBeg.Date);
        CheckQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Date);
        CheckQuery.Open;

        while CheckQueryHCOUNT.Value > 0
            do begin
            Date1 := DateToStr(DateEnd.Date + 1);
            DateEnd.Date := DateEnd.Date + CheckQueryHCOUNT.Value;

            CheckQuery.Close;
            CheckQuery.Params.ParamValues['DATE1'] := Date1;
            CheckQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Date);
            CheckQuery.Open;
        end;
    end;

    Form.Free;
    Params.Free;

    FormNumItem;
end;

procedure TaddholidaylongForm.DatesReCalcClick(Sender: TObject);
var
    Date1: string;
begin

    DateEnd.Date := DateBeg.Date + StrToInt(TermEdit.Text) - 1;

    CheckQuery.Close;
    CheckQuery.Params.ParamValues['DATE1'] := DateToStr(DateBeg.Date);
    CheckQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Date);
    CheckQuery.Open;

    while CheckQueryHCOUNT.Value > 0
        do begin
        Date1 := DateToStr(DateEnd.Date + 1);
        DateEnd.Date := DateEnd.Date + CheckQueryHCOUNT.Value;

        CheckQuery.Close;
        CheckQuery.Params.ParamValues['DATE1'] := Date1;
        CheckQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Date);
        CheckQuery.Open;
    end;

    FormNumItem;
end;

procedure TaddholidaylongForm.TermReCalcClick(Sender: TObject);
var
    int: Integer;
begin

    int := Trunc(DateEnd.Date - DateBeg.Date) + 1;

    CheckQuery.Close;
    CheckQuery.Params.ParamValues['DATE1'] := DateToStr(DateBeg.Date);
    CheckQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Date);
    CheckQuery.Open;

    TermEdit.Text := IntToStr(int - CheckQueryHCOUNT.value);

    FormNumItem;
end;

procedure TaddholidaylongForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    LongReasonBox.SaveIntoRegistry;
end;

procedure TaddholidaylongForm.OkButtonClick(Sender: TObject);
var
    Query: TIBQuery;
    IDPCARD: Integer;
    NumItem: Integer;
begin
    if Id_Holiday_Remove_Prolong = -1 then begin
        ErrMsg('Потрібно вибрати відпустку, яку буде продовжено!');
        exit;
    end;

    if Id_Holiday = -1 then begin
        ErrMsg('Потрібно вибрати тип відпустки!');
        exit;
    end;

    if TermEdit.Text = ''
        then begin
        ErrMsg('Потрібно ввести термін продовження відпустки');
        TermEdit.SetFocus;
        exit;
    end;

    if LongReasonBox.GetId = -1 then begin
        ErrMsg('Потрібно вибрати у зв`язку з чим продовжується відпустка!');
        LongReasonBox.SetFocus;
        exit;
    end;

    if ReasonMemo.Text = ''
        then begin
        ErrMsg('Потрібно ввести підставу для продовження відпустки!');
        ReasonMemo.SetFocus;
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

      // проверить Не болеет ли человек (Валик, 17.03.2005)
    try
        Query := TIbQuery.Create(Self);
        Query.Transaction := PersonalCommon.ReadTransaction;

        Query.SQL.Text := 'SELECT id_pcard from man_moving where id_man_moving = ' +
            IntToStr(ID_Man_Moving);
        Query.Open;

        IDPCARD := Query['ID_PCARD'];
        Query.Close;

        Query.SQL.Text := 'SELECT * from ORDERS_CHECK_MAN_FOR_HOLIDAY(' +
            IntToStr(IDPCARD) + ',' + QuotedStr(DateToStr(DateBeg.Date)) + ')';
        Query.Open;


        if Query['BOLEET'] = 'T' then
        begin
            if MessageDlg('Увага, на дату початку відпустки вибрана людина має листок непрацездатності!', mtWarning, [mbYes, mbNo], 0) <> ID_YES
                then begin
                Query.Free;
                exit;
            end;
        end;

        Query.Free;
    except
    end;

    if RadioButton1.Checked then
        NumItem := StrToInt(NumItemEdit.Text)
    else
        NumItem := StrToInt(NewNumItemEdit.Text);

    WriteTransaction.StartTransaction;

    try

        WriteQuery.Close;
        WriteQuery.Params.ParamValues['ID_MAN_HOLIDAY'] := Id_Man_Holiday;
        WriteQuery.Params.ParamValues['ID_HOLIDAY'] := Id_Holiday;
        WriteQuery.Params.ParamValues['PERIOD_BEG'] := PeriodBegLabel.Caption;
        WriteQuery.Params.ParamValues['PERIOD_END'] := PeriodEndLabel.Caption;
        WriteQuery.Params.ParamValues['DATE_BEG'] := DateToStr(DateBeg.Date);
        WriteQuery.Params.ParamValues['DATE_END'] := DateToStr(DateEnd.Date);
        WriteQuery.Params.ParamValues['H_TERM'] := TermEdit.Text;
        WriteQuery.Params.ParamValues['ID_MAN_MOVING'] := Id_Man_Moving;
        WriteQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
        WriteQuery.Params.ParamValues['REASON'] := ReasonMemo.Text;
        WriteQuery.Params.ParamValues['NUM_ITEM'] := NumItem;
        WriteQuery.Params.ParamValues['ID_HOLIDAY_REMOVE_PROLONG'] := ID_HOLIDAY_REMOVE_PROLONG;
        WriteQuery.Params.ParamValues['ID_HOLIDAY_LONG_REASON'] := LongReasonBox.GetId;
        ExecQuery(WriteQuery);

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

procedure TaddholidaylongForm.RemoveHolidaySelectButtonClick(
    Sender: TObject);
var
    Form: TSpForm;
    Params: TSpParams;
begin
    form := TSpForm.Create(Self);

    Params := TSpParams.Create;

    with Params do
    begin
        Title := 'Відпустки, з яких було відкликано, але які не було продовжено';
        IdField := 'Id_Holiday_Remove';
        ComboField := 'FIO_SMALL';
        ColumnNames := 'ТН, ПІБ, Підрозділ, Посада, Відпустка з, по, Відкликано,-,-,-';
        SpFields := 'TN, FIO_SMALL, DEP_NAME, POST_NAME, HOLIDAY_BEG, HOLIDAY_END, DATE_REMOVE, ID_MAN_MOVING, Warning_text, Holiday_Long_Beg';
        Table := 'MAN_HOLIDAY_REMOVE_SELECT_LONG(' + IntToStr(Id_Order) + ')';
        SpMode := spmSelect;
        ReadOnly := True;
    end;

    form.Init(Params);
    Form.SpGrid.Columns[6].Width := Form.SpGrid.Columns[5].Width;

    if form.ShowModal = mrOk then
    begin
        Id_Holiday_Remove_Prolong := Form.ResultQuery['Id_Holiday_Remove'];
        DisplayRemoveInfo(Id_Holiday_Remove_Prolong);
        Id_Man_Moving := Form.ResultQuery['ID_MAN_MOVING'];

        if (Form.ResultQuery['WARNING_TEXT'] <> '') then
            Messagedlg(Form.ResultQuery['WARNING_TEXT'], mtWarning, [mbOk], 0);

        DateBeg.Date := Form.ResultQuery['HOLIDAY_LONG_BEG'];
        DateEnd.Date := DateBeg.Date + Form.ResultQuery['HOLIDAY_END'] - Form.ResultQuery['DATE_REMOVE'];
        DateEnd.OnChange(Self);
    end;

    Form.Free;
    Params.Free;

    FormNumItem;
end;

procedure TaddholidaylongForm.DateBegChange(Sender: TObject);
begin
    FormNumItem;
    TermReCalc.Click;
end;

procedure TaddholidaylongForm.TermEditChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TaddholidaylongForm.LongReasonBoxChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TaddholidaylongForm.ReasonMemoChange(Sender: TObject);
begin
    FormNumItem;
end;

end.
