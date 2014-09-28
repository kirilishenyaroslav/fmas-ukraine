unit BoHolidayForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, PersonalCommon,
    SpCommon, StdCtrls;

type
    TBoHoliday = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        CancelButton: TSpeedButton;
        ResultQuery: TIBQuery;
        ResultSource: TDataSource;
        HolidayGrid: TDBGrid;
        WorkQuery: TIBQuery;
        ResultQueryID_MAN_HOLIDAY: TIntegerField;
        ResultQueryID_PCARD: TIntegerField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryTN: TIntegerField;
        ResultQueryFIO: TIBStringField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryH_TERM: TIntegerField;
        ResultQueryNAME_HOLIDAY: TIBStringField;
        ResultQueryID_BO_REASON: TIntegerField;
        ResultQueryBO_REASON: TIBStringField;
        ResultQueryREASON: TIBStringField;
        ResultQueryPOST_NAME: TIBStringField;
        ResultQueryDEPARTMENT_NAME: TIBStringField;
        Panel3: TPanel;
        Label2: TLabel;
        Label9: TLabel;
        SearchEdit: TEdit;
        OrderItemsButton: TSpeedButton;
        ResultQueryID_ADD_HOLIDAY_TYPE: TIntegerField;
        ResultQueryADD_HOLIDAY_TYPE_NAME: TIBStringField;
        ResultQueryADD_HOLIDAY_TYPE_NAME_RP: TIBStringField;
        ViewButton: TSpeedButton;
        SearchNextButton: TBitBtn;
        procedure FormResize(Sender: TObject);
        procedure HolidayGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure HolidayGridKeyPress(Sender: TObject; var Key: Char);
        procedure SearchEditChange(Sender: TObject);

        constructor Create(AOwner: TComponent; ID_ORDER_TYPE: Integer; aOrder_Date: TDate; aNUM_ORDER: string; Note_Order: string; Mode: TEditMode; idOrder: Integer = -1); reintroduce;
        procedure OrderItemsButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ViewButtonClick(Sender: TObject);
        procedure SearchNextButtonClick(Sender: TObject);

    private
    { Private declarations }
    public
        id_order: Integer;
        Order_Date: TDate;
        Num_Order: string;
        FMode: TEditMode;

    end;

var
    BoHoliday: TBoHoliday;

implementation

uses DtManBonusItemsUnit, AddBoHolidayUnit, GoodFunctionsUnit;

{$R *.dfm}

constructor TBoHoliday.Create(AOwner: TComponent; ID_ORDER_TYPE: Integer; aOrder_Date: TDate; aNUM_ORDER: string; Note_Order: string; Mode: TEditMode; idOrder: Integer = -1);
begin
    inherited Create(AOwner);

    FMode := Mode;
    Num_Order := aNUM_ORDER;
    Order_Date := aOrder_Date;
    Id_Order := idOrder;

    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;

    if FMode = emNew then begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try

            WorkQuery.Close;
            WorkQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            Id_Order := ExecQuery(WorkQuery);

        except on e: exception
            do begin
                PersonalCommon.WriteTransaction.Rollback;
                ModalResult := mrNone;
                MessageDlg('При занесенні данних у базу виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;

    end;

    Caption := 'Додаткові відпустки за наказом №' + NUM_ORDER;

    if FMode = emView then begin

        AddButton.Enabled := False;
        ModifyButton.Enabled := False;
        DeleteButton.Enabled := False;
        //OrderItemsButton.Enabled := False;

        Caption := Caption + ' (перегляд)';
    end;

    ResultQuery.Close;
    ResultQuery.Params.ParamValues['ID_ORDER'] := id_Order;
    ResultQuery.Open;
end;

procedure TBoHoliday.FormResize(Sender: TObject);
begin
    GridResize(HolidayGrid);
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TBoHoliday.HolidayGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Man_Holiday: ' + IntToStr(ResultQuery['Id_Man_Holiday']));
    except
    end;
end;

procedure TBoHoliday.HolidayGridKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TBoHoliday.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TBoHoliday.OrderItemsButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.FMode := FMode;
    Form.id_order := ID_ORDER;
    Form.OkButton.Visible := False;
    Form.Prepare;

    Form.ShowModal;

    Form.Free;
end;

procedure TBoHoliday.AddButtonClick(Sender: TObject);
var
    Form: TAddBoHoliday;
begin
    Form := TAddBoHoliday.Create(Self, emNew, Id_Order, Order_Date);

    if Form.ShowModal = mrOk then begin
        ResultQuery.Close;
        ResultQuery.Open;
    end;

    Form.Free;
end;

procedure TBoHoliday.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TBoHoliday.DeleteButtonClick(Sender: TObject);
begin
    if GoodFunctionsUnit.CheckQueryForDel(ResultQuery)
        then begin
        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE MAN_HOLIDAY_DELETE(' + ResultQueryID_MAN_HOLIDAY.AsString + ')';
        ExecQuery(WorkQuery);

        ResultQuery.Close;
        ResultQuery.Open; ;
    end;
end;

procedure TBoHoliday.ModifyButtonClick(Sender: TObject);
var
    Form: TAddBoHoliday;
begin
    if not GoodFunctionsUnit.CheckQueryForModify(ResultQuery) then exit;

    Form := TAddBoHoliday.Create(Self, emModify, Id_Order, Order_Date, ResultQueryNUM_ITEM.Value);

    if Form.ShowModal = mrOk then begin
        QueryCloseOpen(ResultQuery, 'ID_MAN_HOLIDAY', ResultQueryID_MAN_HOLIDAY.Value);
    end;

    Form.Free;
end;

procedure TBoHoliday.ViewButtonClick(Sender: TObject);
var
    Form: TAddBoHoliday;
begin
    if not GoodFunctionsUnit.CheckQueryForModify(ResultQuery) then exit;

    Form := TAddBoHoliday.Create(Self, emView, Id_Order, Order_Date, ResultQueryNUM_ITEM.Value);

    Form.ShowModal;

    Form.Free;
end;

procedure TBoHoliday.SearchNextButtonClick(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery.LocateNext('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery.LocateNext('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

end.
