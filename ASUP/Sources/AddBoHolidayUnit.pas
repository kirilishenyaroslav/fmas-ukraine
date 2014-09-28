unit AddBoHolidayUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, Buttons, Grids, DBGrids, StdCtrls,
    SpComboBox, ComCtrls, ExtCtrls, PersonalCommon, SpCommon, GoodFunctionsUnit, DtManBonusItemsUnit,
    Mask, CheckEditUnit, cxControls, cxSplitter, DepartmentsViewUnit;

type
    TAddBoHoliday = class(TForm)
        Panel1: TPanel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        DateEndPicker: TDateTimePicker;
        DateBegPicker: TDateTimePicker;
        HolidayBox: TSpComboBox;
        WorkQueryID_POST: TIntegerField;
        WorkQueryID_BONUS: TIntegerField;
        WorkQueryDATE_BEG: TDateField;
        WorkQueryDATE_END: TDateField;
        WorkQueryIS_PERCENT: TIBStringField;
        WorkQueryPERCENT: TIntegerField;
        WorkQuerySUMMA: TIBBCDField;
        PeopleDataSource: TDataSource;
        PeopleQuery: TIBQuery;
        PeopleQueryTN: TIntegerField;
        PeopleQueryNAME_FULL: TIBStringField;
        PeopleQueryNAME_POST: TIBStringField;
        PeopleQueryFIO: TIBStringField;
        PeopleQueryID_MAN_MOVING: TIntegerField;
        Label5: TLabel;
        Label6: TLabel;
        BoReasonBox: TSpComboBox;
        Label7: TLabel;
        ReasonMemo: TMemo;
        WorkQuery: TIBQuery;
        HTermEdit: TCheckEdit;
        Label9: TLabel;
        Label10: TLabel;
        WorkQuery2: TIBQuery;
        IntegerField1: TIntegerField;
        IntegerField2: TIntegerField;
        DateField1: TDateField;
        DateField2: TDateField;
        IBStringField1: TIBStringField;
        IntegerField3: TIntegerField;
        IBBCDField1: TIBBCDField;
        ResultQuery: TIBQuery;
        WorkQuery3: TIBQuery;
        IntegerField4: TIntegerField;
        IntegerField5: TIntegerField;
        DateField3: TDateField;
        DateField4: TDateField;
        IBStringField2: TIBStringField;
        IntegerField6: TIntegerField;
        IBBCDField2: TIBBCDField;
        ResultQueryID_PCARD: TIntegerField;
        ResultQueryTN: TIntegerField;
        ResultQueryFIO: TIBStringField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryH_TERM: TIntegerField;
        ResultQueryNAME_HOLIDAY: TIBStringField;
        ResultQueryID_BO_REASON: TIntegerField;
        ResultQueryBO_REASON: TIBStringField;
        ResultQueryREASON: TIBStringField;
        ResultQueryPOST_NAME: TIBStringField;
        ResultQueryDEPARTMENT_NAME: TIBStringField;
        ResultQueryID_ADD_HOLIDAY_TYPE: TIntegerField;
        ResultQueryADD_HOLIDAY_TYPE_NAME: TIBStringField;
        ResultQueryADD_HOLIDAY_TYPE_NAME_RP: TIBStringField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryID_MAN_HOLIDAY: TIntegerField;
        ResultQueryID_HOLIDAY: TIntegerField;
        Panel4: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        GroupBox2: TGroupBox;
        BonusGrid: TDBGrid;
        Panel5: TPanel;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        GroupBox1: TGroupBox;
        Label1: TLabel;
        Label8: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        NumItemText: TMemo;
        NewNumItemEdit: TCheckEdit;
        OrderSplitter: TcxSplitter;
        SearchPanel: TPanel;
        Label11: TLabel;
        Label12: TLabel;
        SearchEdit: TEdit;
        AddGroupButton: TSpeedButton;
        ResultQuery2: TIBQuery;
        RecCountLabel: TLabel;
        ResultQuery3: TIBQuery;
        ResultQuery3NUM_ITEM: TIntegerField;
        CheckQuery: TIBQuery;
        CheckQueryID_TEXT_ITEM: TIntegerField;
        CheckQueryID_ORDER: TIntegerField;
        CheckQueryNUM_ITEM: TIntegerField;
        PeopleQueryID_PCARD: TIntegerField;
        ResultQuery2ID_MAN_MOVING: TIntegerField;
        CheckQueryTEXT: TMemoField;
        ResultQueryITEM_TEXT: TBlobField;
        SpeedButton1: TSpeedButton;
        SpeedButton2: TSpeedButton;
        HTermQuery: TIBQuery;
        HTermQueryHTERM: TIntegerField;
        HolidayQuery: TIBQuery;
        HolidayQueryHCOUNT: TIntegerField;
        HolidayQuery2: TIBQuery;
        HolidayQuery2DONT_CALC_HOLIDAYS: TIBStringField;
        Button1: TButton;
    GetAddInfo: TIBQuery;
    AddHolidayTypeBox: TSpComboBox;
        constructor Create(AOwner: TComponent; Mode: TEditMode; idOrder: Integer; DateOrder: TDate; NumItem: Integer = -1); reintroduce;
        procedure AddButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ReopenQuerys;
        procedure AddHolidayTypeBox1Change(Sender: TObject);
        procedure RadioButton1Click(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure DateBegPickerChange(Sender: TObject);
        procedure FormNumItem;
        procedure HolidayBoxChange(Sender: TObject);
        procedure BoReasonBoxChange(Sender: TObject);
        procedure ReasonMemoChange(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OrderSplitterAfterOpen(Sender: TObject);
        procedure OrderSplitterAfterClose(Sender: TObject);
        procedure BonusGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure BonusGridKeyPress(Sender: TObject; var Key: Char);
        procedure SearchEditChange(Sender: TObject);
        procedure PeopleQueryAfterOpen(DataSet: TDataSet);
        procedure AddGroupButtonClick(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure SpeedButton2Click(Sender: TObject);
        procedure Button1Click(Sender: TObject);
    procedure AddHolidayTypeBoxChange(Sender: TObject);
    private

        FMode: TEditMode;
        Id_Order: Integer;
        Num_Item: Integer;
        Date_Order: TDate;

        movings: array[0..10000] of integer;
        movings_count: Integer;
        DontCalcHolidays: string;
    public
    { Public declarations }
    end;

var
    AddBoHoliday: TAddBoHoliday;

implementation

{$R *.dfm}

procedure TAddBoHoliday.FormNumItem;
var
    date_str, add_holiday_name: string;
begin
    if not Enabled then exit;

    if (AddHolidayTypeBox.GetId = -1) or
        (HolidayBox.GetId = -1) or
        (BoReasonBox.GetId = -1) or
        (movings_count <= 0)
        then begin
        NumItemText.Text := '';
        exit;
    end;

    if (DateBegPicker.Date = DateEndPicker.Date)
        then
        date_str := ' ' + DateToStr(DateBegPicker.Date) + ' '
    else
        date_str := ' з ' + DateToStr(DateBegPicker.Date) + ' по ' +
            DateToStr(DateEndPicker.Date) + ' ';

    GetAddInfo.Close;
    GetAddInfo.ParamByName('ID_ADD_HOLDIAY_TYPE').AsInteger := AddHolidayTypeBox.GetId;
    GetAddInfo.Open;
    if not GetAddInfo.IsEmpty then add_holiday_name := GetAddInfo['NAME_ADD_HOLIDAY_RP']
    else add_holiday_name := '';

    if RadioButton2.Checked then begin
        NumItemText.Text := '   Надати ' + add_holiday_name +
            date_str +
            BoReasonBox.Text + ' наступним працівникам:';

        NumItemText.Text := NumItemText.Text + #13#10;

        PeopleQuery.First;

        while not PeopleQuery.Eof do begin
            NumItemText.Text := NumItemText.Text + #13#10 + '   - ' + PeopleQueryFIO.Value
                + ', ' + PeopleQueryNAME_POST.Value + ', ' +
                PeopleQueryNAME_FULL.Value + ';';

            PeopleQuery.Next;
        end;

        NumItemText.Text := NumItemText.Text + #13#10 + #13#10 + 'Підстава: ' + ReasonMemo.Text;
    end;
end;

procedure TAddBoHoliday.ReopenQuerys;
var
    i: integer;
begin
    PeopleQuery.Close;
    PeopleQuery.SQL.Clear;
    PeopleQuery.SQL.add('SELECT pc.TN, p.FAMILIA || '' '' || p.IMYA || '' '' || p.OTCHESTVO || '' '' as FIO, sd.name_full, sp.name_post, mm.id_man_moving, mm.id_pcard ');
    PeopleQuery.SQL.add('FROM   man_moving mm, private_cards pc, people p, dt_shtatras ds, sp_department sd, sp_post sp ');
    PeopleQuery.SQL.add('WHERE  mm.id_pcard = pc.id_pcard and ');
    PeopleQuery.SQL.add('       pc.id_man = p.id_man and ');
    PeopleQuery.SQL.add('       mm.id_shtatras = ds.id_shtatras and ');
    PeopleQuery.SQL.add('       ds.id_department = sd.id_department and ');
    PeopleQuery.SQL.add('       ds.id_post = sp.id_post and ');
    PeopleQuery.SQL.add('       (CURRENT_TIMESTAMP between ds.use_beg and ds.use_end) and ');
    PeopleQuery.SQL.add('       (CURRENT_TIMESTAMP between sd.use_beg and sd.use_end) ');

    if movings_count > 0
        then PeopleQuery.SQL.add('and (');

    for i := 0 to movings_count - 1
        do begin

        PeopleQuery.SQL.Add('mm.ID_MAN_MOVING = ' + IntToStr(movings[i]));

        if i < movings_count - 1 then PeopleQuery.SQL.Add(' or ')

    end;

    if movings_count > 0
        then begin
        PeopleQuery.SQL.Add(')');
        PeopleQuery.SQL.Add('ORDER BY name_full, p.familia, p.imya, p.otchestvo');

        PeopleQuery.Open;
    end;
end;

constructor TAddBoHoliday.Create(AOwner: TComponent; Mode: TEditMode; idOrder: Integer; DateOrder: TDate; NumItem: Integer = -1);
begin
    inherited Create(aOwner);

    FMode := Mode;
    Id_Order := IdOrder;
    Num_Item := NumItem;
    Date_Order := DateOrder;

    if FMode <> emView then
        BoReasonBox.SpParams.ReadOnly := not GPP_CHECK;

    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    WorkQuery2.Transaction := PersonalCommon.WriteTransaction;
    WorkQuery3.Transaction := PersonalCommon.WriteTransaction;

    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery2.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery3.Transaction := PersonalCommon.ReadTransaction;
    CheckQuery.Transaction := PersonalCommon.ReadTransaction;

    PeopleQuery.Transaction := PersonalCommon.ReadTransaction;
    HTermQuery.Transaction := PersonalCommon.ReadTransaction;
    HolidayQuery.Transaction := PersonalCommon.ReadTransaction;
    HolidayQuery2.Transaction := PersonalCommon.ReadTransaction;
    GetAddInfo.Transaction := PersonalCommon.ReadTransaction;

    if FMode = emNew then begin
        DateBegPicker.Date := Date;
        DateEndPicker.Date := Date;
        AddHolidayTypeBox.LoadFromRegistry;
        HolidayBox.LoadFromRegistry;
        BoReasonBox.LoadFromRegistry;

        ResultQuery3.Close;
        ResultQuery3.Params.ParamValues['ID_Order'] := Id_Order;
        ResultQuery3.Open;

        if ResultQuery3.IsEmpty then
            NewNumItemEdit.Text := '1'
        else
            NewNumItemEdit.Text := ResultQuery3NUM_ITEM.AsString;

        Caption := Caption + ' (створення нової)';
    end
    else begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_Order'] := Id_Order;
        ResultQuery.Params.ParamValues['Num_Item'] := Num_Item;

        ResultQuery.Open;

        AddHolidayTypeBox.Prepare(ResultQueryID_ADD_HOLIDAY_TYPE.Value, ResultQueryADD_HOLIDAY_TYPE_NAME.Value);
        HolidayBox.Prepare(ResultQueryID_HOLIDAY.Value, ResultQueryNAME_HOLIDAY.Value);
        BoReasonBox.Prepare(ResultQueryID_BO_REASON.Value, ResultQueryBO_REASON.Value);
        ReasonMemo.Text := ResultQueryREASON.Value;
        DateBegPicker.Date := ResultQueryDATE_BEG.Value;
        DateEndPicker.Date := ResultQueryDATE_END.Value;
        HTermEdit.Text := ResultQueryH_TERM.AsString;
        NewNumItemEdit.Text := IntToStr(Num_Item);
        NumItemText.Text := ResultQueryITEM_TEXT.Value;

        movings_count := 0;

        ResultQuery.First;
        ResultQuery.FetchAll;

        while not ResultQuery.Eof do begin
            movings_count := movings_count + 1;
            movings[movings_count - 1] := ResultQueryID_MAN_MOVING.Value;
            ResultQuery.Next;
        end;

        ResultQuery.Close;

        ReopenQuerys;
    end;

    if FMode = emModify then begin
        Caption := Caption + ' (редагування)';
    end;

    if FMode = emView then begin
        Panel1.Enabled := False;
        AddButton.Enabled := False;
        AddGroupButton.Enabled := False;
        DeleteButton.Enabled := False;
        GroupBox1.Enabled := False;
        OkButton.Visible := False;
        CancelButton.Left := 208;
        CancelButton.Caption := 'Закрити';
        Caption := Caption + ' (перегляд)';
    end;
end;


procedure TAddBoHoliday.AddButtonClick(Sender: TObject);
var
    mov_info: TMovingInfo;
begin
    if Select_Man_Moving(mov_info, Date_Order)
        then begin
        Movings[movings_count] := mov_info.Id_Man_Moving;
        movings_count := movings_count + 1;

        ReopenQuerys;

        PeopleQuery.Locate('ID_MAN_MOVING', mov_info.Id_Man_Moving, []);
    end;

    FormNumItem;
end;

procedure TAddBoHoliday.DeleteButtonClick(Sender: TObject);
var
    i: Integer;
    old_i: Integer;
begin
    if PeopleQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    for i := 0 to movings_count - 1
        do begin
        if movings[i] = PeopleQueryID_MAN_MOVING.value
            then begin
            movings[i] := movings[movings_count - 1];
            movings_count := movings_count - 1;

            if i > 0 then
                old_i := i - 1;
        end;
    end;

    ReopenQuerys;

    if movings_count > 0
        then PeopleQuery.Locate('ID_MAN_MOVING', movings[old_i], []);

    FormNumItem;
end;

procedure TAddBoHoliday.AddHolidayTypeBox1Change(Sender: TObject);
begin
    BoReasonBox.Prepare(-1, '');
    BoReasonBox.SpParams.SelectProcName := 'INI_BO_HOLDIAY_REASON_SELECT(' + IntToStr(AddHolidayTypeBox.GetId) + ')';
    BoReasonBox.SpParams.InsertProcName := 'INI_BO_HOLDIAY_REASON_INSERT_' + IntToStr(AddHolidayTypeBox.GetId);

    FormNumItem;
end;

procedure TAddBoHoliday.RadioButton1Click(Sender: TObject);
begin
    NumItemEdit.Enabled := RadioButton1.Checked;
    SelectNumItemButton.Enabled := RadioButton1.Checked;

    NewNumItemEdit.Enabled := RadioButton2.Checked;
    NumItemText.Enabled := RadioButton2.Checked;

    FormNumItem;
end;

procedure TAddBoHoliday.OkButtonClick(Sender: TObject);
var
    NumItem: Integer;
    Query: TIBQuery;
begin
    if AddHolidayTypeBox.GetId = -1
        then begin
        ErrMsg('Треба вибрати тип додаткової відпустки!');
        AddHolidayTypeBox.SetFocus;
        exit;
    end;

    if HolidayBox.GetId = -1
        then begin
        ErrMsg('Треба вибрати тип відпустки!');
        HolidayBox.SetFocus;
        exit;
    end;

    if BoReasonBox.GetId = -1
        then begin
        ErrMsg('Треба вибрати текст статті (навіщо надається відпустка)!');
        BoReasonBox.SetFocus;
        exit;
    end;

    if ReasonMemo.Text = ''
        then begin
        ErrMsg('Треба ввести підставу!');
        ReasonMemo.SetFocus;
        exit;
    end;

    if HTermEdit.Text = ''
        then begin
        ErrMsg('Треба ввести кількість днів!');
        HTermEdit.SetFocus;
        exit;
    end;

    if DateEndPicker.Date < DateBegPicker.Date
        then begin
        ErrMsg('Дата кінця відпустки не може бути меньшою ніж дата початку відпустки!');
        DateEndPicker.SetFocus;
        exit;
    end;

    if movings_count <= 0
        then begin
        ErrMsg('Треба вибрати хочаб одного працівника!');
        BonusGrid.SetFocus;
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

    if (FMode = emNew) and (RadioButton2.Checked) then begin
        CheckQuery.Close;
        CheckQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
        CheckQuery.Params.ParamValues['NUM_ITEM'] := Num_Item;
        CheckQuery.Open;

        if not CheckQuery.IsEmpty then begin
            ErrMsg('Такий № пункту вже зайнято, треба його редагувати, а не свторювати новий!');
            NewNumItemEdit.SetFocus;
            exit;
        end;
    end;

    WorkQuery.Transaction.StartTransaction;

    try
        if FMode = emModify then begin
            WorkQuery3.Params.ParamValues['ID_ORDER'] := Id_Order;
            WorkQuery3.Params.ParamValues['NUM_ITEM'] := Num_Item;
            ExecQuery(WorkQuery3);
        end;

        PeopleQuery.First;
        PeopleQuery.FetchAll;

        Query := TIbQuery.Create(Self);
        Query.Transaction := PersonalCommon.ReadTransaction;

        while not PeopleQuery.Eof do begin

            Query.Close;
            Query.SQL.Text := 'SELECT * from ORDERS_CHECK_MAN_FOR_HOLIDAY(' +
                IntToStr(PeopleQueryID_PCARD.Value) + ',' + QuotedStr(DateToStr(DateBegPicker.Date)) + ')';
            Query.Open;

            // проверить Не болеет ли человек (Валик, 28.02.2005)
            if Query['BOLEET'] = 'T' then
            begin
                MessageDlg('Увага, на дату початку відпустки працівник "' +
                    PeopleQueryFIO.Value + '" має листок непрацездатності!', mtWarning, [mbOk], 0);
            end;


            WorkQuery.Params.ParamValues['ID_MAN_HOLIDAY'] := -1;
            WorkQuery.Params.ParamValues['ID_HOLIDAY'] := HolidayBox.GetId;
            WorkQuery.Params.ParamValues['DATE_BEG'] := DateToStr(DateBegPicker.Date);
            WorkQuery.Params.ParamValues['DATE_END'] := DateToStr(DateEndPicker.Date);
            WorkQuery.Params.ParamValues['H_TERM'] := StrToInt(HTermEdit.Text);
            WorkQuery.Params.ParamValues['ID_MAN_MOVING'] := PeopleQueryID_MAN_MOVING.Value;
            WorkQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
            WorkQuery.Params.ParamValues['ID_BO_REASON'] := BoReasonBox.GetId;
            WorkQuery.Params.ParamValues['REASON'] := ReasonMemo.Text;
            WorkQuery.Params.ParamValues['NUM_ITEM'] := NumItem;
            WorkQuery.Params.ParamValues['ID_ADD_HOLIDAY_TYPE'] := AddHolidayTypeBox.GetId;

            ExecQuery(WorkQuery);

            PeopleQuery.Next;
        end;

        Query.Free;

        if RadioButton2.Checked then begin
            WorkQuery2.Params.ParamValues['ID_ORDER'] := id_order;
            WorkQuery2.Params.ParamValues['Num_Item'] := NumItem;
            WorkQuery2.Params.ParamValues['Text'] := NumItemText.Text;

            ExecQuery(WorkQuery2);
        end;


    except on E: Exception
        do begin
            ErrMsg('При занесенні відпустки для працівника "' + PeopleQueryFIO.Value + '" виникла помилка: "' + E.Message + '"');
            WorkQuery.Transaction.Rollback;
            exit;
        end;
    end;

    WorkQuery.Transaction.Commit;

    ModalResult := mrOk;
end;

procedure TAddBoHoliday.SelectNumItemButtonClick(Sender: TObject);
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

procedure TAddBoHoliday.DateBegPickerChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddBoHoliday.HolidayBoxChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddBoHoliday.BoReasonBoxChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddBoHoliday.ReasonMemoChange(Sender: TObject);
begin
    FormNumItem;
end;

procedure TAddBoHoliday.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    AddHolidayTypeBox.SaveIntoRegistry;
    HolidayBox.SaveIntoRegistry;
    BoReasonBox.SaveIntoRegistry;
end;

procedure TAddBoHoliday.OrderSplitterAfterOpen(Sender: TObject);
begin
    SearchPanel.Visible := False;
end;

procedure TAddBoHoliday.OrderSplitterAfterClose(Sender: TObject);
begin
    SearchPanel.Visible := True;
end;

procedure TAddBoHoliday.BonusGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
end;

procedure TAddBoHoliday.BonusGridKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TAddBoHoliday.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        PeopleQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        PeopleQuery.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TAddBoHoliday.PeopleQueryAfterOpen(DataSet: TDataSet);
begin
    PeopleQuery.FetchAll;
    RecCountLabel.Caption := 'Кіл-ть: ' + IntToStr(PeopleQuery.RecordCount);
    GridResize(BonusGrid);
end;

procedure TAddBoHoliday.AddGroupButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, Date_Order);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then begin
        ResultQuery2.Params.ParamValues['CUR_DATE'] := DateToStr(Date_Order);
        ResultQuery2.Params.ParamValues['ID_DEPARTMENT'] := Form.Selected_Id;
        ResultQuery2.Open;

        ResultQuery2.FetchAll;

        ResultQuery2.First;

        while not ResultQuery2.Eof do begin
            movings[movings_count] := ResultQuery2ID_MAN_MOVING.Value;
            movings_count := movings_count + 1;

            ResultQuery2.Next;
        end;

        ResultQuery2.Close;

        ReopenQuerys;

        FormNumItem;
    end;

    form.Free;
end;

procedure TAddBoHoliday.SpeedButton1Click(Sender: TObject);
begin
    HolidayQuery2.Close;
    HolidayQuery2.Params.ParamValues['ID_HOLIDAY'] := HolidayBox.GetId;
    HolidayQuery2.Open;

    DontCalcHolidays := HolidayQuery2DONT_CALC_HOLIDAYS.Value;

    DateEndPicker.Date := DateBegPicker.Date + StrToInt(HTermEdit.Text) - 1;

    HolidayQuery.Close;
    HolidayQuery.Params.ParamValues['DATE1'] := DateToStr(DateBegPicker.Date);
    HolidayQuery.Params.ParamValues['DATE2'] := DateToStr(DateEndPicker.Date);
    HolidayQuery.Open;

    if (DontCalcHolidays = 'T') then
        DateEndPicker.Date := DateEndPicker.Date + HolidayQueryHCOUNT.Value;
end;

procedure TAddBoHoliday.SpeedButton2Click(Sender: TObject);
begin
    HTermQuery.Close;
    HTermQuery.Params.ParamValues['ID_HOLIDAY'] := IntToStr(HolidayBox.GetId);
    HTermQuery.Params.ParamValues['DATE1'] := DateToStr(DateBegPicker.Date);
    HTermQuery.Params.ParamValues['DATE2'] := DateToStr(DateEndPicker.Date);
    HTermQuery.Open;

    HTermEdit.Text := IntToStr(HTermQueryHTERM.value);
end;

procedure TAddBoHoliday.Button1Click(Sender: TObject);
begin
    if (AddHolidayTypeBox.GetId = -1) then
    begin
        MessageDlg('Потрібно ввести тип додаткової відпустки!', mtError, [mbOk], 0);
        Exit;
    end;

    if (HolidayBox.GetId = -1) then
    begin
        MessageDlg('Потрібно ввести відпустку!', mtError, [mbOk], 0);
        Exit;
    end;

    if (BoReasonBox.GetId = -1) then
    begin
        MessageDlg('Потрібно ввести поле "навіщо надається (текст статті)"!', mtError, [mbOk], 0);
        Exit;
    end;

    if (movings_count <= 0) then
    begin
        MessageDlg('Потрібно вибрати співробітників!', mtError, [mbOk], 0);
        Exit;
    end;

    FormNumItem;
end;

procedure TAddBoHoliday.AddHolidayTypeBoxChange(Sender: TObject);
begin
    FormNumItem;
end;

end.

