unit PremiaOrderUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, Grids, DBGrids, IBQuery, Buttons, DBCtrls,
    StdCtrls, ExtCtrls, PersonalCommon, SpCommon, ComCtrls, Mask,
    CheckEditUnit, FIBDataSet, pFIBDataSet;

type
    TPremiaOrderForm = class(TForm)
        Panel3: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        DepartmentName: TDBText;
        PostName: TDBText;
        CancelButton: TSpeedButton;
        OutputQuery: TIBQuery;
        PremiaGrid: TDBGrid;
        PremiaSource: TDataSource;
        ManPanel: TPanel;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        Label3: TLabel;
        DateBegPicker: TDateTimePicker;
        Label1: TLabel;
        DateEndPicker: TDateTimePicker;
        ModifyButton: TSpeedButton;
        Label2: TLabel;
        SearchEdit: TEdit;
        Label9: TLabel;
        BitBtn2: TBitBtn;
        Label6: TLabel;
        MonthEdit: TCheckEdit;
        Label7: TLabel;
        YearEdit: TCheckEdit;
        Label8: TLabel;
        CommonButton: TSpeedButton;
        CommonPremia: TIBQuery;
        Label10: TLabel;
        Label11: TLabel;
        PYear: TDBText;
        PMonth: TDBText;
        Label12: TLabel;
        DateBeg: TDBText;
        Label13: TLabel;
        DateEnd: TDBText;
        Label14: TLabel;
        SortBox: TComboBox;
        PremiaQuery: TpFIBDataSet;
        PremiaQueryID_PCARD: TFIBIntegerField;
        PremiaQueryID_MAN_PREMIA: TFIBIntegerField;
        PremiaQueryID_MAN_MOVING: TFIBIntegerField;
        PremiaQueryID_VIDOPL: TFIBIntegerField;
        PremiaQueryIS_PERCENT: TFIBStringField;
        PremiaQueryPERCENT: TFIBFloatField;
        PremiaQuerySUMMA: TFIBFloatField;
        PremiaQueryDATE_BEG: TFIBDateField;
        PremiaQueryDATE_END: TFIBDateField;
        PremiaQueryTHE_BONUS: TFIBStringField;
        PremiaQueryNAME_PREMIA: TFIBStringField;
        PremiaQueryDEPARTMENT_NAME: TFIBStringField;
        PremiaQueryPOST_NAME: TFIBStringField;
        PremiaQueryDATE_ORDER: TFIBDateField;
        PremiaQueryFIO: TFIBStringField;
        PremiaQueryID_DEPARTMENT: TFIBIntegerField;
        PremiaQueryID_POST: TFIBIntegerField;
        PremiaQueryTN: TFIBIntegerField;
        PremiaQueryNUM_ITEM: TFIBIntegerField;
        PremiaQueryP_YEAR: TFIBIntegerField;
        PremiaQueryP_MONTH: TFIBIntegerField;
        PremiaQueryPATH: TFIBStringField;
        procedure AddButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure Prepare;
        procedure FormResize(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure PremiaGridCellClick(Column: TColumn);
        procedure PremiaGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PremiaGridKeyPress(Sender: TObject; var Key: Char);
        procedure BitBtn2Click(Sender: TObject);
        procedure CommonButtonClick(Sender: TObject);
        procedure SortBoxChange(Sender: TObject);
    private
    { Private declarations }
    public
        FMode: TEditMode;
        ID_ORDER: Integer;
        NUM_ITEM: Integer;
        Order_Date: TDate;
        ID_ORDER_TYPE: Integer;
        NUM_ORDER: string;
        Note_Order: string;
    end;

var
    PremiaOrderForm: TPremiaOrderForm;

implementation

uses PremiaFilterUnit, NagScreenUnit, DtManBonusItemsUnit, uAddCommonPremia,
    DateUtils, qFTools;
{$R *.dfm}

procedure TPremiaOrderForm.Prepare;
var
    Year, Month, Day: Word;
begin
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    PremiaQuery.Database := FIBDatabase;
    PremiaQuery.Transaction := FIBReadTransaction;

    if FMode = emNew then
    begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            Id_Order := ExecQuery(OutputQuery);
        except
            PersonalCommon.WriteTransaction.Rollback;
            ModalResult := mrNone;
            MessageDlg('При занесенні данних у базу виникла помилка!', mtError, [mbOk], 0);
            exit;
        end;

        PersonalCommon.WriteTransaction.Commit;

    end;

    if FMode = emView then
    begin
        ManPanel.Visible := False;
        if id_order_type = 17 then Caption := 'Перегляд премій за наказом № ' + NUM_ORDER + ' від "' + DateToStr(ORDER_DATE) + '"';

        if id_order_type = 21 then Caption := 'Перегляд мат. допомог за наказом № ' + NUM_ORDER + ' від "' + DateToStr(ORDER_DATE) + '"';
    end
    else
    begin
        if id_order_type = 21 then Caption := 'Матеріальні допомоги за наказом № ' + NUM_ORDER + ' від "' + DateToStr(ORDER_DATE) + '"';

        if id_order_type = 17 then Caption := 'Премії за наказом № ' + NUM_ORDER + ' від "' + DateToStr(ORDER_DATE) + '"';
    end;

    if id_order_type = 21 then
    begin
        Label1.Visible := False;
        Label3.Visible := False;

        DateBegPicker.Visible := False;
        DateEndPicker.Visible := False;
    end;

    PremiaQuery.Close;
    //PremiaQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    PremiaQuery.Params.ParamByName('ID_ORDER').AsInteger := ID_ORDER;
    PremiaQuery.Open;

    if (FMode = emNew) or (PremiaQuery.IsEmpty) then
    begin
        if id_order_type = 17 then
        begin
            DateBegPicker.Date := EncodeDate(YearOf(Order_Date), MonthOf(Order_Date), 1);
            DateEndPicker.Date := EncodeDate(YearOf(Order_Date), MonthOf(Order_Date),
                DaysInAMonth(YearOf(Order_Date), MonthOf(Order_Date)));
            MonthEdit.Text := IntToStr(MonthOf(Order_Date));
            YearEdit.Text := IntToStr(YearOf(Order_Date));
        end;

        if id_order_type = 21 then
        begin
            DateBegPicker.Date := EncodeDate(YearOf(Order_Date), MonthOf(Order_Date), 1);
            DateEndPicker.Date := EncodeDate(YearOf(Order_Date), MonthOf(Order_Date),
                DaysInAMonth(YearOf(Order_Date), MonthOf(Order_Date)));
            MonthEdit.Text := IntToStr(MonthOf(Order_Date));
            YearEdit.Text := IntToStr(YearOf(Order_Date));
        end;
    end
    else
    begin
        if id_order_type = 17 then
        begin
            DateBegPicker.Date := PremiaQueryDATE_BEG.Value;
            DateBegPicker.Enabled := False;
            DateEndPicker.Date := PremiaQueryDATE_END.Value;
            DateEndPicker.Enabled := False;
        end;

        if id_order_type = 21 then
        begin
            DecodeDate(PremiaQueryDATE_BEG.Value, Year, Month, Day);

{            MonthEdit.Text := IntToStr(Month);
            YearEdit.Text := IntToStr(Year);

            MonthEdit.Enabled := False;
            YearEdit.Enabled := False;}
        end;
    end;

end;

procedure TPremiaOrderForm.AddButtonClick(Sender: TObject);
var
    PremiaFilter: TPremiaFilterForm;
    F: Char;
    Percent: string;
    Summa: string;
    t: string;
    Nag: TNagScreen;
begin
    if (MonthEdit.Text = '') then
    begin
        MessageDlg('Не вибран місяць, у якому треба провести нарахування!', mtError, [mbOk], 0);
        MonthEdit.SetFocus;
        Exit;
    end;

    if (YearEdit.Text = '') then
    begin
        MessageDlg('Не вибран рік, у якому треба провести нарахування!', mtError, [mbOk], 0);
        YearEdit.SetFocus;
        Exit;
    end;

    if (ID_ORDER_TYPE = 21) then
    begin

        DateBegPicker.Date := EncodeDate(StrToInt(YearEdit.Text), StrToInt(MonthEdit.Text), 1);
        DateEndPicker.Date := DateBegPicker.Date;
    end;

    PremiaFilter := TPremiaFilterForm.Create(self);
    PremiaFilter.Order_Date := Order_Date;
    PremiaFilter.ID_ORDER := ID_ORDER;
    PremiaFilter.ID_ORDER_TYPE := ID_ORDER_TYPE;

    if not PremiaQuery.IsEmpty then
    begin
        PremiaFilter.BonusBox.Prepare(PremiaQueryID_VIDOPL.Value, PremiaQueryNAME_PREMIA.Value);
        if PremiaQueryIS_PERCENT.Value = 'T' then
        begin
            PremiaFilter.BonusGroup.ItemIndex := 0;
            PremiaFilter.PercentEdit.Text := FloatToStr(PremiaQueryPERCENT.value);
        end
        else
        begin
            PremiaFilter.BonusGroup.ItemIndex := 1;
            PremiaFilter.SumEdit.Text := FloatToStr(PremiaQuerySUMMA.value);
        end;
    end;

    if PremiaFilter.ShowModal = mrOk then
    begin
        Nag := TNagScreen.Create(self);
        Nag.Show;
        Nag.SetStatusText('додавання премій...');

        t := StringReplace(PremiaFilter.SumEdit.Text, ',', '.', [rfReplaceAll]);

        if PremiaFilter.BonusGroup.ItemIndex = 0 then
            F := 'T'
        else
            F := 'F';
        if F = 'T' then
            Percent := PremiaFilter.PercentEdit.Text
        else
            Percent := '0';
        if F = 'T' then
            Summa := '0'
        else
            Summa := t;

        percent := StringReplace(percent, ',', '.', []);

        if PremiaFilter.RadioButton1.Checked then
        begin

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PREMIA_INSERT_EX ' +
                IntToStr(PremiaFilter.ID_MAN_MOVING) + ',' +
                IntToStr(PremiaFilter.BonusBox.GetId) + ',''' +
                F + ''',' +
                Percent + ',''' +
                Summa + ''',''' +
                DateToStr(DateBegPicker.Date) + ''',''' +
                DateToStr(DateEndPicker.Date) + ''',' +
                IntToStr(ID_ORDER) + ',' +
                PremiaFilter.NumItemEdit.Text + ',' +
                YearEdit.Text + ',' +
                MonthEdit.Text;
            ExecQuery(OutputQuery);
        end;

        if PremiaFilter.RadioButton2.Checked then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PREMIA_GROUP_INSERT '
                + IntToStr(ID_ORDER) + ',' +
                PremiaFilter.NumItemEdit.Text + ',' +
                IntToStr(PremiaFilter.BonusBox.GetId) + ',''' +
                F + ''',' +
                Percent + ',''' +
                Summa + ''',''' +
                DateToStr(DateBegPicker.Date) + ''',''' +
                DateToStr(DateEndPicker.Date) + ''',' +
                IntToStr(PremiaFilter.ID_Department) + ',' +
                IntToStr(PremiaFilter.SpComboBox1.GetId) + ',' +
                YearEdit.Text + ',' +
                MonthEdit.Text;
            ExecQuery(OutputQuery);

        end;

        PremiaQuery.Close;
        PremiaQuery.Open;

        if (id_order_type = 17) then
        begin
            DateBegPicker.Checked := not (PremiaQuery.IsEmpty);
            DateBegPicker.Enabled := (PremiaQuery.IsEmpty);
            DateEndPicker.Checked := not (PremiaQuery.IsEmpty);
            DateEndPicker.Enabled := (PremiaQuery.IsEmpty);
        end;

        if (id_order_type = 21) then
        begin
            MonthEdit.Enabled := (PremiaQuery.IsEmpty);
            YearEdit.Enabled := (PremiaQuery.IsEmpty);
        end;

        GridResize(premiaGrid);

        Nag.Free;
    end;

    PremiaFilter.Free;
end;

procedure TPremiaOrderForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TPremiaOrderForm.FormResize(Sender: TObject);
begin
    GridResize(premiaGrid);
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TPremiaOrderForm.DeleteButtonClick(Sender: TObject);
begin
    if PremiaQuery.IsEmpty then
        MessageDlg('Немає записів.', mtError, [mbOk], 0)
    else
    begin
        if MessageDlg('Чи справді ви бажаєте вилучити цю премію?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PREMIA_DELETE(' + IntToStr(PremiaQueryID_MAN_PREMIA.Value) + ');';
        ExecQuery(OutputQuery);
        PremiaQuery.Close;
        PremiaQuery.Open;

        if (id_order_type = 17) then
        begin
            DateBegPicker.Checked := not (PremiaQuery.IsEmpty);
            DateBegPicker.Enabled := (PremiaQuery.IsEmpty);
            DateEndPicker.Checked := not (PremiaQuery.IsEmpty);
            DateEndPicker.Enabled := (PremiaQuery.IsEmpty);
        end;

        GridResize(premiaGrid);
    end;
end;

procedure TPremiaOrderForm.ModifyButtonClick(Sender: TObject);
var
    PremiaFilter: TPremiaFilterForm;
    F: Char;
    Percent: string;
    Summa: string;
    t: string;
    Nag: TNagScreen;
    OldIdManPremia: Integer;
begin

    if PremiaQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    PremiaFilter := TPremiaFilterForm.Create(self);
    PremiaFilter.Order_Date := Order_Date;
    PremiaFilter.FIOEdit.Text := PremiaQueryFIO.Value;
    PremiaFilter.BonusBox.Prepare(PremiaQueryID_VIDOPL.Value, PremiaQueryNAME_PREMIA.Value);
    PremiaFilter.RadioButton2.Visible := False;
    PremiaFilter.Podrazd.Text := PremiaQueryDEPARTMENT_NAME.Value;
    PremiaFilter.Post.Text := PremiaQueryPOST_NAME.Value;
    PremiaFilter.ID_PCARD := PremiaQueryID_PCARD.Value;
    PremiaFilter.ID_MAN_MOVING := PremiaQueryID_MAN_MOVING.Value;
    PremiaFilter.NumItemEdit.Text := IntToStr(PremiaQueryNUM_ITEM.value);
    PremiaFilter.ID_ORDER := ID_ORDER;
    PremiaFilter.ID_ORDER_TYPE := ID_ORDER_TYPE;

    if PremiaQueryIS_PERCENT.Value = 'T' then
    begin
        PremiaFilter.BonusGroup.ItemIndex := 0;
        PremiaFilter.PercentEdit.Text := FloatToStr(PremiaQueryPERCENT.value);
    end
    else
    begin
        PremiaFilter.BonusGroup.ItemIndex := 1;
        PremiaFilter.SumEdit.Text := FloatToStr(PremiaQuerySUMMA.value);
    end;

    if PremiaFilter.ShowModal = mrOk then
    begin
        Nag := TNagScreen.Create(self);
        Nag.Show;
        Nag.SetStatusText('додавання премій...');

        t := StringReplace(PremiaFilter.SumEdit.Text, ',', '.', [rfReplaceAll]);

        if PremiaFilter.BonusGroup.ItemIndex = 0 then
            F := 'T'
        else
            F := 'F';
        if F = 'T' then
            Percent := PremiaFilter.PercentEdit.Text
        else
            Percent := '0';
        if F = 'T' then
            Summa := '0'
        else
            Summa := t;

        Percent := StringReplace(Percent, ',', '.', []);

        if PremiaFilter.RadioButton1.Checked then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PREMIA_UPDATE(' + IntToStr(PremiaQueryID_MAN_PREMIA.Value) + ',' +
                IntToStr(PremiaFilter.ID_MAN_MOVING) + ',' +
                IntToStr(PremiaFilter.BonusBox.GetId) + ',''' +
                F + ''',' +
                Percent + ',''' +
                Summa + ''',''' +
                DateToStr(DateBegPicker.Date) + ''',''' +
                DateToStr(DateEndPicker.Date) + ''',' +
                IntToStr(ID_ORDER) + ',' +
                IntToStr(NUM_ITEM) + ');';
            ExecQuery(OutputQuery);
        end;

        OldIdMAnPremia := PremiaQueryID_MAN_PREMIA.Value;
        PremiaQuery.Close;
        PremiaQuery.Open;

        PremiaQuery.Locate('ID_MAN_PREMIA', OldIdManPremia, []);

        GridResize(premiaGrid);

        Nag.Free;
    end;
    PremiaFilter.Free;

end;

procedure TPremiaOrderForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        PremiaQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        PremiaQuery.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TPremiaOrderForm.PremiaGridCellClick(Column: TColumn);
begin
    SearchEdit.Text := '';
end;

procedure TPremiaOrderForm.PremiaGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Man_Premia: ' + IntToStr(PremiaQuery['Id_Man_Premia']));
    except
    end;
end;

procedure TPremiaOrderForm.PremiaGridKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TPremiaOrderForm.BitBtn2Click(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.OkButton.Visible := False;
    Form.aID_TYPE := 1;
    Form.Prepare;

    Form.ShowModal;

    Form.Free;
end;

procedure TPremiaOrderForm.CommonButtonClick(Sender: TObject);
var
    form: TfmAddCommonPremia;
    NagScreen: TNagScreen;
begin
    form := TfmAddCommonPremia.Create(Self, Id_Order, Order_Date);
    if form.ShowModal = mrOk then
    begin
        NagScreen := TNagScreen.Create(Self);
        NagScreen.Show;
        NagScreen.SetStatusText('додавання премій...');

        try
            with CommonPremia do
            begin
                Transaction := WriteTransaction;
                WriteTransaction.StartTransaction;
                ParamByName('Id_Order').AsInteger := ID_ORDER;
                ParamByName('Num_Item').AsInteger := NUM_ITEM;
                ParamByName('Itr_Vidopl').AsInteger := form.Itr_Vidopl.GetId;
                ParamByName('Workers_Vidopl').AsInteger := form.Workers_Vidopl.GetId;
                ParamByName('Date_Beg').AsDate := DateBegPicker.Date;
                ParamByName('Date_End').AsDate := DateEndPicker.Date;
                ParamByName('Id_Department_Parent').AsInteger := form.Department.Value;
                ParamByName('Itr_Percent').Value := form.ITRPercent.Value;
                ParamByName('P_Year').AsInteger := StrToInt(YearEdit.Text);
                ParamByName('P_Month').AsInteger := StrToInt(MonthEdit.Text);
                if form.WorkersPremia.Value then
                    ParamByName('Workers').AsInteger := 1
                else
                    ParamByName('Workers').AsInteger := 0;
                ExecSQL;
                WriteTransaction.Commit;
            end;
            NagScreen.Free;

            PremiaQuery.Close;
            PremiaQuery.Open;
        except on e: Exception do
            begin
                qFErrorDialog('При занесенні в базу даних виникла помилка: ' + e.Message);
                WriteTransaction.Rollback;
                NagScreen.Free;
            end;
        end

    end;
    form.Free;
end;

procedure TPremiaOrderForm.SortBoxChange(Sender: TObject);
begin
    if SortBox.ItemIndex = 0 then PremiaQuery.DoSort(['FIO'], [True])
    else
        if SortBox.ItemIndex = 1 then PremiaQuery.DoSort(['TN'], [True])
        else
            if SortBox.ItemIndex = 2 then
                PremiaQuery.DoSort(['Num_Item', 'Path', 'Percent'], [True, True, True]);
end;

end.
