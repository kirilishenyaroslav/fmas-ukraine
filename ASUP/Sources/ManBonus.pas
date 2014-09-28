{-$Id: ManBonus.pas,v 1.7 2008/01/29 09:32:29 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система «Управление персоналом              }
{       государственного производственного предприятия «Укрпромводчермет»      }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                       Модуль "Форма редактирования приказа по надбавкам"     }
{    Добвление/изменение/удаление надбавок по приказу                          }
{    Ответственный: Кропов Валентин                                            }

unit ManBonus;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery,
    ExtCtrls, Grids, DBGrids, PersonalCommon, SpCommon, AddPostBonus,
    ComCtrls, DBCtrls, AddInplaceBonus, AddSovmBonusUnit, DateUtils;

type
    TManBonusForm = class(TForm)
        TempQuery: TIBQuery;
        Panel1: TPanel;
        BonusQuery: TIBQuery;
        BonusSource: TDataSource;
        BonusGrid: TDBGrid;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        Panel3: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        Label7: TLabel;
        OutputQuery: TIBQuery;
        Label8: TLabel;
        DepartmentName: TDBText;
        PostName: TDBText;
        WorkDateBeg: TDBText;
        WorkDateEnd: TDBText;
        BonusQueryID_VIDOPL: TIntegerField;
        BonusQueryFIO_SMALL: TIBStringField;
        BonusQueryID_DEPARTMENT: TIntegerField;
        BonusQueryID_STATUS: TIntegerField;
        BonusQueryNUM_ORDER: TIBStringField;
        BonusQueryDATE_ORDER: TDateField;
        BonusQueryID_MAN_BONUS: TIntegerField;
        BonusQueryID_MAN_MOVING: TIntegerField;
        BonusQueryID_BONUS: TIntegerField;
        BonusQueryIS_PERCENT: TIBStringField;
        BonusQuerySUMMA: TIBBCDField;
        BonusQueryBONUS_DATE_BEG: TDateField;
        BonusQueryBONUS_DATE_END: TDateField;
        BonusQueryNUM_ITEM: TIntegerField;
        BonusQueryFIO: TIBStringField;
        BonusQueryDEPARTMENT_NAME: TIBStringField;
        BonusQueryPOST_NAME: TIBStringField;
        BonusQueryWORK_DATE_BEG: TDateField;
        BonusQueryWORK_DATE_END: TDateField;
        BonusQueryNAME_BONUS: TIBStringField;
        BonusQueryTHE_BONUS: TIBStringField;
        InplaceButton: TSpeedButton;
        Label2: TLabel;
        SearchEdit: TEdit;
        Label9: TLabel;
        BonusQueryTN: TIntegerField;
        BonusQueryPRIM: TIBStringField;
        OrderItemsButton: TSpeedButton;
        ActiveBonusesButton: TSpeedButton;
        SovmButton: TSpeedButton;
        CancelButton: TSpeedButton;
        SovmQuery: TIBQuery;
        SovmQueryID_MAN_BONUS_SOVM: TIntegerField;
        SovmQueryID_SHTATRAS: TIntegerField;
        SovmQuerySOVM_TYPE: TIntegerField;
        SovmQuerySOVM_PERCENT: TIBBCDField;
        SovmQueryID_MAN_BONUS: TIntegerField;
        Panel2: TPanel;
        Label3: TLabel;
        DateBegPicker: TDateTimePicker;
        Label1: TLabel;
        DateEndPicker: TDateTimePicker;
    BonusQueryPERCENT: TIBBCDField;
    BonusQueryOKLAD_STR: TIBStringField;
    BonusQueryPATH: TIBStringField;
    BonusQueryID_POST: TIntegerField;
    BonusQueryIS_SHADOW: TIntegerField;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure BonusQueryWORK_DATE_ENDGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure TempQueryDATE_ENDGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure ActiveBonusesButtonClick(Sender: TObject);
        procedure InplaceButtonClick(Sender: TObject);
        procedure BonusGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SearchEditChange(Sender: TObject);
        procedure BonusGridKeyPress(Sender: TObject; var Key: Char);
        procedure BonusGridCellClick(Column: TColumn);
        procedure OrderItemsButtonClick(Sender: TObject);
        procedure CloseButtonClick(Sender: TObject);
        procedure SovmButtonClick(Sender: TObject);
        procedure BonusQueryAfterScroll(DataSet: TDataSet);
    private

        Num_Item: Integer;
        FMode: TEditMode;
        NUM_ORDER: string;

    public
        ID_ORDER: Integer;
        Order_Date: TDate;

        constructor Create(AOwner: TComponent; ID_ORDER_TYPE: Integer; aOrder_Date: TDate; aNUM_ORDER: string; Note_Order: string; Mode: TEditMode; idOrder: Integer = -1; numItem: Integer = -1);
            reintroduce;
    end;

var
    ManBonusForm: TManBonusForm;

implementation
uses SpFormUnit, GoodFunctionsUnit, AddManBonusUnit, DtManBonusItemsUnit,
    Clipbrd;
{$R *.DFM}

constructor TManBonusForm.Create(AOwner: TComponent; ID_ORDER_TYPE: Integer; aOrder_Date: TDate; aNUM_ORDER: string; Note_Order: string; Mode: TEditMode; idOrder: Integer = -1; numItem: Integer = -1);
begin
    inherited Create(AOwner);

    FMode := Mode;
    Num_Order := aNUM_ORDER;
    Order_Date := aOrder_Date;

    TempQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    BonusQuery.Transaction := PersonalCommon.ReadTransaction;
    SovmQuery.Transaction := PersonalCommon.ReadTransaction;
 //BonusQuery.Open;

    Id_Order := idOrder;
    Num_Item := numItem;


    if FMode = emNew then
    begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            Id_Order := ExecQuery(OutputQuery);
        except on e: exception do
            begin
                PersonalCommon.WriteTransaction.Rollback;
                ModalResult := mrNone;
                MessageDlg('При занесенні данних у базу виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;

    end;

    DateBegPicker.Date := EncodeDate(YearOf(Order_Date), 1, 1);
    DateEndPicker.Date := EncodeDate(YearOf(Order_Date), 12, 31);

    BonusQuery.Close;
    BonusQuery.Params.ParamValues['ID_ORDER'] := id_Order;
    BonusQuery.Open;

    Caption := 'Надбавки працівникам за наказом №' + NUM_ORDER;

    if FMode = emView then
    begin

        AddButton.Enabled := False;
        ModifyButton.Enabled := False;
        DeleteButton.Enabled := False;
        InplaceButton.Enabled := False;
        SovmButton.Enabled := False;
        OrderItemsButton.Enabled := False;

        Caption := Caption + ' (перегляд)';
    end;
end;

procedure TManBonusForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TManBonusForm.FormResize(Sender: TObject);
begin
    GridResize(BonusGrid);
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TManBonusForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TManBonusForm.AddButtonClick(Sender: TObject);
var
    Form: TAddManBonusForm;
    i: Integer;
    is_percent: CHAR;
    percent: string;
    summa: string;
begin
    Form := TAddManBonusForm.Create(self);

    form.ID_ORDER := id_order;
    form.Order_Date := order_date;

    Form.DateBegPicker.Date := DateBegPicker.Date;
    Form.DateEndPicker.Date := DateEndPicker.Date;

    if Form.ShowModal = mrOk then
    begin

        if form.BonusGroup.ItemIndex = 0 then
            is_percent := 'T'
        else
            is_percent := 'F';

        if is_percent = 'T' then
            Percent := form.PercentEdit.Text
        else
            Percent := '0';


        if is_percent = 'T' then
            Summa := '0'
        else
            Summa := form.SumEdit.Text;

        for i := 0 to form.movings_count - 1 do
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_INSERT(' +
                IntToStr(form.BonusBox.GetId) + ',' +
                QuotedStr(DateToStr(form.DateBegPicker.Date)) + ',' +
                QuotedStr(DateToStr(form.DateEndPicker.Date)) + ',' +
                QuotedStr(is_percent) + ',' +
                QuotedStr(StringReplace(percent, ',', '.', [])) + ',' +
                QuotedStr(summa) + ',' +
                '-1' + ',' +
                IntToStr(form.movings[i]) + ',' +
                IntToStr(ID_ORDER) + ',' +
                form.NumItemEdit.Text + ')';
            ExecQuery(OutputQuery);

            BonusQuery.Close;
            BonusQuery.Open;
        end;

    end;

    Form.Free;
end;

procedure TManBonusForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddManBonusForm;
    i: Integer;
    is_percent: CHAR;
    percent: string;
    summa: string;
    id_man_bonus: Integer;
begin
    if BonusQuery.IsEmpty then
    begin
        MessageDlg('Немає записів для редагування!', mtError, [mbOk], 0);
        Exit;
    end;

    SovmQuery.Close;
    SovmQuery.ParamByName('id_man_bonus').AsInteger := BonusQueryID_MAN_BONUS.Value;
    SovmQuery.Open;

    if not SovmQuery.IsEmpty then
    begin
        MessageDlg('Функція редагування надбавки за суміщення тимчасово відсутня. Вам необхідно вилучити її і створити знову.', mtError, [mbOk], 0);
        Exit;
    end;

    SovmQuery.Close;

    Form := TAddManBonusForm.Create(self);

    form.ID_ORDER := id_order;
    form.Order_Date := order_date;
    form.Panel2.Visible := False;
    Form.BonusBox.Prepare(BonusQueryID_VIDOPL.Value, BonusQueryNAME_BONUS.Value);
    Form.DateBegPicker.Date := BonusQueryBONUS_DATE_BEG.Value;
    Form.DateEndPicker.Date := BonusQueryBONUS_DATE_End.Value;

    if BonusQueryIS_PERCENT.Value = 'T' then
    begin
        form.BonusGroup.ItemIndex := 0;
        form.PercentEdit.Text := BonusQueryPERCENT.AsString;
    end
    else
    begin
        form.BonusGroup.ItemIndex := 1;
        form.SumEdit.Text := BonusQuerySUMMA.AsString;
    end;

    form.NumItemEdit.Text := BonusQueryNUM_ITEM.AsString;

    id_man_bonus := BonusQueryID_MAN_BONUS.Value;

    if Form.ShowModal = mrOk then
    begin

        if form.BonusGroup.ItemIndex = 0 then
            is_percent := 'T'
        else
            is_percent := 'F';

        if is_percent = 'T' then
            Percent := form.PercentEdit.Text
        else
            Percent := '0';


        if is_percent = 'T' then
            Summa := '0'
        else
            Summa := form.SumEdit.Text;


        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_UPDATE(' +
            IntToStr(form.BonusBox.GetId) + ',' +
            QuotedStr(DateToStr(form.DateBegPicker.Date)) + ',' +
            QuotedStr(DateToStr(form.DateEndPicker.Date)) + ',' +
            QuotedStr(is_percent) + ',' +
            QuotedStr(StringReplace(percent, ',', '.', [])) + ',' +
            QuotedStr(summa) + ',' +
            IntToStr(ID_ORDER) + ',' +
            form.NumItemEdit.Text + ',' +
            IntToStr(id_man_bonus) + ')';
        ExecQuery(OutputQuery);

        BonusQuery.Close;
        BonusQuery.Open;

        BonusQuery.Locate('ID_MAN_BONUS', id_man_bonus, []);
    end;

    Form.Free;
end;

procedure TManBonusForm.DeleteButtonClick(Sender: TObject);
begin
    if BonusQuery.IsEmpty then
    begin
        MessageDlg('Немає записів для вилучення!', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи справді ви бажаєте вилучити цю надбавку?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_DELETE(' +
        IntToStr(BonusQuery['Id_Man_Bonus']) +
        ',' + IntToStr(Id_Order) + ');';
    ExecQuery(OutputQuery);

    BonusQuery.Close;
    BonusQuery.Open;
    GridResize(BonusGrid);
end;

procedure TManBonusForm.BonusQueryWORK_DATE_ENDGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if Sender.Value = PersonalCommon.Consts_Query['DATE_END'] then
        Text := 'Безстроково'
    else
        Text := Sender.AsString;
end;

procedure TManBonusForm.TempQueryDATE_ENDGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if Sender.Value = PersonalCommon.Consts_Query['DATE_END'] then
        Text := 'Безстроково'
    else
        Text := Sender.AsString;
end;

procedure TManBonusForm.ActiveBonusesButtonClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpForm;
begin
    if not BonusQuery.IsEmpty then
    begin
        Params := TSpParams.Create;
        with Params do
        begin
            ReadOnly := True;
            Table := 'GET_MAN_BONUS_ACTIVE(''' + DateToStr(Order_Date) + ''',' + IntToStr(BonusQueryID_MAN_MOVING.Value) + ')';
            IdField := 'Id_Man_Bonus';
            ColumnNames := 'Назва надбавки, Дійсна з, Дійсна по, Надбавка';
            SpFields := 'NAME_BONUS, BONUS_DATE_BEG, BONUS_DATE_END, THE_BONUS';
            Title := 'Перегляд діючих надбавок для ' + BonusQueryFIO.Value;
        end;
        Form := TSpForm.Create(Self);
        Form.Init(Params);
        Form.SpGrid.Columns[4].Width := 20;
        if (Form.ResultQuery.IsEmpty) then
            MessageDlg('Для вибраного працівника немає діючих на "' + DateToStr(Order_Date) + '" надбавок!', mtInformation, [mbOk], 0)
        else
            Form.ShowModal;
        Form.Free;
        Params.Free;
    end
    else
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
end;

procedure TManBonusForm.InplaceButtonClick(Sender: TObject);
var
    form: TAddInplaceBonusForm;
begin
    MessageDlg('Доплати за заміщення відтепер заносяться окремим наказом "Про виконання обов`язків"!', mtInformation, [mbOk], 0);
    exit;
    {
 form := TAddInplaceBonusForm.Create(Self, emNew, Id_Order, Order_Date);

 if form.ShowModal = mrOk then
 begin
  BonusQuery.Close;
  BonusQuery.Open;
  GridResize(BonusGrid);
 end;}
end;

procedure TManBonusForm.BonusGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        Clipboard.AsText := IntToStr(BonusQuery['Id_Man_Bonus']);
        ShowMessage('Id_Man_Bonus: ' + IntToStr(BonusQuery['Id_Man_Bonus']));
    except
    end;
end;

procedure TManBonusForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        BonusQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        BonusQuery.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TManBonusForm.BonusGridKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TManBonusForm.BonusGridCellClick(Column: TColumn);
begin
    SearchEdit.Text := '';
end;

procedure TManBonusForm.OrderItemsButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.OkButton.Visible := False;
    Form.Prepare;

    Form.ShowModal;

    Form.Free;
end;

procedure TManBonusForm.CloseButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TManBonusForm.SovmButtonClick(Sender: TObject);
var
    Form: TAddSovmBonusForm;
begin
    Form := TAddSovmBonusForm.Create(Self, Id_ORder, Order_Date);

    if Form.ShowModal = mrOk then
    begin
        BonusQuery.Close;
        BonusQuery.Open;
        GridResize(BonusGrid);
    end;

    Form.Free;
end;

procedure TManBonusForm.BonusQueryAfterScroll(DataSet: TDataSet);
begin
    DateBegPicker.Date := BonusQuery['Bonus_Date_Beg'];
    DateEndPicker.Date := BonusQuery['Bonus_Date_End'];
end;

end.
