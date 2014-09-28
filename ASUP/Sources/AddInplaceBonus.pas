unit AddInplaceBonus;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, SpComboBox, Mask, CheckEditUnit, ComCtrls,
    GoodFunctionsUnit, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, PersonalCommon,
    PCardsViewUnit, SpCommon;

type
    TAddInplaceBonusForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label1: TLabel;
        FIOEdit: TEdit;
        PCardButton: TBitBtn;
        Label2: TLabel;
        Label3: TLabel;
        DateBegPicker: TDateTimePicker;
        Label4: TLabel;
        DateEndPicker: TDateTimePicker;
        PercentEdit: TCheckEdit;
        Label5: TLabel;
        SumEdit: TCheckEdit;
        Label6: TLabel;
        BonusBox: TSpComboBox;
        MovGrid: TDBGrid;
        Label7: TLabel;
        InfoQuery: TIBQuery;
        Label9: TLabel;
        CurTimePicker: TDateTimePicker;
        InfoQueryID_MAN_MOVING: TIntegerField;
        InfoQueryNAME_DEPARTMENT: TIBStringField;
        InfoQueryNAME_POST: TIBStringField;
        InfoQueryOKLAD: TIBBCDField;
        InfoQueryDATE_BEG: TDateField;
        InfoQueryDATE_END: TDateField;
        InfoQueryIN_TYPE: TIntegerField;
        MovingsSource: TDataSource;
        Label8: TLabel;
        DepartmentLabel: TLabel;
        Label10: TLabel;
        StatusLabel: TLabel;
        WriteQuery: TIBQuery;
        WriteQuery2: TIBQuery;
        GroupBox1: TGroupBox;
        Label11: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        Label12: TLabel;
        FioLabel: TLabel;
        SelectInplacerButton: TBitBtn;
        procedure PCardButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CurTimePickerChange(Sender: TObject);
        procedure InfoQueryAfterScroll(DataSet: TDataSet);
        procedure PercentEditChange(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure SelectInplacerButtonClick(Sender: TObject);
        constructor Create(aOwner: TComponent; aFMode: TEditMode; aId_Order: Integer; aOrder_Date: TDate; aId_Man_Bonus_Inplace: Integer = -1);
    private
        function Check: Boolean;
    public
        Id_Order: Integer;
        Id_Hosp: Integer;
        Order_Date: TDate;
        Id_Man_Moving: Integer;
        FMode: TEditMode;
        Id_Man_Bonus: Integer;
        Id_Man_Bonus_Inplace: Integer;
    end;

var
    AddInplaceBonusForm: TAddInplaceBonusForm;

implementation

uses DtManBonusItemsUnit;
{$R *.dfm}

constructor TAddInplaceBonusForm.Create(aOwner: TComponent; aFMode: TEditMode; aId_Order: Integer; aOrder_Date: TDate; aId_Man_Bonus_Inplace: Integer = -1);
begin
    inherited Create(aOwner);

    InfoQuery.Transaction := ReadTransaction;
    WriteQuery.Transaction := WriteTransaction;
    WriteQuery2.Transaction := WriteTransaction;

    FMode := aFMode;
    Id_Order := aId_Order;
    Order_Date := aOrder_Date;
    Id_Man_Bonus_Inplace := aId_Man_Bonus_Inplace;

    if FMode = emNew then begin
        Id_Man_Moving := -1;
    end;
end;

procedure TAddInplaceBonusForm.PCardButtonClick(Sender: TObject);
var
    Id_PCard: Integer;
    PCardForm: TPCardsViewForm;

begin
    PCardForm := TPCardsViewForm.Create(Self, False, True, CurTimePicker.Date);
    PCardForm.Select := True;
    if PCardForm.ShowModal = mrOk then
    begin
        Id_PCard := PCardForm.ResultQuery['Id_PCard'];
        FIOEdit.Text := PCardForm.ResultQuery['FIO'] + '(т/н ' +
            IntToStr(PCardForm.ResultQuery['TN']) + ')';

        DepartmentLabel.Caption := '';
        StatusLabel.Caption := 'не працює';

        InfoQuery.Close;
        InfoQuery.Params.ParamValues['Id_PCard'] := Id_PCard;
        InfoQuery.Params.ParamValues['Cur_Date'] := CurTimePicker.Date;
        InfoQuery.Open;
        GridResize(MovGrid);
        InfoQuery.AfterScroll(InfoQuery);
    end;
    PCardForm.Free;
end;

procedure TAddInplaceBonusForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    BonusBox.SaveIntoRegistry;
end;

procedure TAddInplaceBonusForm.CurTimePickerChange(Sender: TObject);
begin
    InfoQuery.Close;
    InfoQuery.Params.ParamValues['Cur_Date'] := CurTimePicker.Date;
    InfoQuery.Open;
    GridResize(MovGrid);
    InfoQuery.AfterScroll(InfoQuery);
end;

procedure TAddInplaceBonusForm.InfoQueryAfterScroll(DataSet: TDataSet);
var
    percent: Integer;
begin
    if InfoQuery.IsEmpty then Exit;

    DepartmentLabel.Caption := InfoQuery['Name_Department'];

    if InfoQuery['In_Type'] = 1 then
        StatusLabel.Caption := 'хворіє'
    else
        if InfoQuery['In_Type'] = 2 then
            StatusLabel.Caption := 'відпустка'
        else StatusLabel.Caption := 'працює!';

    if not VarIsNull(InfoQuery['Date_Beg']) then
        DateBegPicker.Date := InfoQuery['Date_Beg'];
    if not VarIsNull(InfoQuery['Date_End']) then
        DateEndPicker.Date := InfoQuery['Date_End'];

    try
        percent := StrToInt(PercentEdit.Text);
        SumEdit.Text := FloatToStr(percent * InfoQuery['Oklad'] / 100);
    except
        SumEdit.Text := '';
    end;
end;

procedure TAddInplaceBonusForm.PercentEditChange(Sender: TObject);
var
    percent: Integer;
begin
    if InfoQuery.IsEmpty then Exit;

    try
        percent := StrToInt(PercentEdit.Text);
        SumEdit.Text := FloatToStr(percent * InfoQuery['Oklad'] / 100);
    except
        SumEdit.Text := '';
    end;
end;

function TAddInplaceBonusForm.Check: Boolean;
var
    summa: Double;
begin

    if (Id_Man_Moving = -1) then
    begin
        MessageDlg('Потрібно вибрати людину, яка заміщує!', mtError, [mbOk], 0);
        Result := False;
        exit;
    end;

    if (NumItemEdit.Text = '') then
    begin
        MessageDlg('Потрібно вибрати пункт наказу!', mtError, [mbOk], 0);
        NumItemEdit.SetFocus;
        Result := False;
        exit;
    end;

    if InfoQuery.IsEmpty then
    begin
        MessageDlg('Вибрана людина взагалі не працює на вибрану дату!', mtError, [mbOk], 0);
        Result := False;
        Exit;
    end;

    if InfoQuery['In_Type'] = 3 then
        if MessageDlg('Людина, яку заміщають працює на вибрану дату! Продовжити?',
            mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        begin
            Result := False;
            Exit;
        end;

    try
        SumEdit.Text := StringReplace(SumEdit.Text, '.', DecimalSeparator, []);
        SumEdit.Text := StringReplace(SumEdit.Text, ',', DecimalSeparator, []);
        summa := StrToFloat(SumEdit.Text);
    except
        begin
            MessageDlg('Невірна сума доплати!', mtError, [mbOk], 0);
            Result := False;
            Exit;
        end;
    end;

    if DateBegPicker.Date > DateEndPicker.Date then
    begin
        MessageDlg('Дата початку періоду повинна бути менша за дату кінця',
            mtError, [mbOk], 0);
        Result := False;
        Exit;
    end;

    Result := True;
end;

procedure TAddInplaceBonusForm.OkButtonClick(Sender: TObject);
var
    id_man_bonus: Integer;
begin
    if not Check then
    begin
        ModalResult := 0;
        Exit;
    end;

    WriteTransaction.StartTransaction;

    try

        with WriteQuery.Params do
        begin
            ParamValues['Id_Bonus'] := BonusBox.GetId;
            ParamValues['Summa'] := StrToFloat(SumEdit.Text);
            ParamValues['Date_Beg'] := DateBegPicker.Date;
            ParamValues['Date_End'] := DateEndPicker.Date;
            ParamValues['Id_Man_Moving'] := Id_Man_Moving;
            ParamValues['Id_Order'] := Id_Order;
            ParamValues['Num_Item'] := NumItemEdit.Text;
        end;

        id_man_bonus := ExecQuery(WriteQuery);

        WriteQuery2.Close;
        WriteQuery2.Params.ParamValues['ID_MAN_BONUS'] := Id_Man_Bonus;
        WriteQuery2.Params.ParamValues['ID_MAN_MOVING'] := InfoQueryID_MAN_MOVING.Value;
        WriteQuery2.Params.ParamValues['PERCENT'] := StrToInt(PercentEdit.Text);
        WriteQuery2.Params.ParamValues['DATE_BEG'] := DateBegPicker.Date;
        WriteQuery2.Params.ParamValues['DATE_END'] := DateEndPicker.Date;

        ExecQuery(WriteQuery2);

    except on E: exception
        do begin
            PersonalCommon.WriteTransaction.Rollback;
            ModalResult := mrNone;
            MessageDlg('При занесенні данних у базу виникла помилка: ' + E.message, mtError, [mbOk], 0);
            exit;
        end;
    end;

    WriteTransaction.Commit;
end;

procedure TAddInplaceBonusForm.SelectNumItemButtonClick(Sender: TObject);
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

procedure TAddInplaceBonusForm.SelectInplacerButtonClick(Sender: TObject);
var
    mov_info: TMovingInfo;
    old_caption: string;
begin
    if GoodFunctionsUnit.pcardform <> nil
        then GoodFunctionsUnit.pcardform.Caption := 'Виберіть працівника, який буде заміщувати'
    else old_caption := '';

    if not Select_Man_Moving(mov_info, Order_Date)
        then exit;

    if old_caption <> ''
        then GoodFunctionsUnit.pcardform.Caption := old_caption;

    Id_Man_Moving := mov_info.Id_Man_Moving;
    FioLabel.Caption := mov_info.FIO;

end;

end.
