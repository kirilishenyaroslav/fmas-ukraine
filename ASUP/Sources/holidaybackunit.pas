unit HolidayBackUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB,
    IBCustomDataSet, IBQuery, SpCommon, PersonalCommon, GoodFunctionsUnit,
    cxControls, cxSplitter, ComCtrls;

type
    THolidayBackForm = class(TForm)
        ResultQuery: TIBQuery;
        ResultSource: TDataSource;
        WriteQuery: TIBQuery;
        ResultQueryID_HOLIDAY_REMOVE: TIntegerField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryID_HOLIDAY_ORDER: TIntegerField;
        ResultQueryDATE_REMOVE: TDateField;
        ResultQueryFOR_WHAT: TIBStringField;
        ResultQueryFIO_SMALL: TIBStringField;
        ResultQueryTN: TIntegerField;
        ResultQueryPOST_NAME: TIBStringField;
        ResultQueryDEP_NAME: TIBStringField;
        ResultQueryHOLIDAY_BEG: TDateField;
        ResultQueryHOLIDAY_END: TDateField;
        ResultQueryORDER_NUM: TIBStringField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        PageControl1: TPageControl;
        TabSheet1: TTabSheet;
        TabSheet2: TTabSheet;
        Panel4: TPanel;
        Panel3: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        DepartmentName: TDBText;
        PostName: TDBText;
        Label2: TLabel;
        Label9: TLabel;
        Label1: TLabel;
        Label3: TLabel;
        HolidayBeg: TDBText;
        HolidayEnd: TDBText;
        SearchEdit: TEdit;
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        OrderItemsButton: TSpeedButton;
        CancelButton: TSpeedButton;
        ViewButton: TSpeedButton;
        Panel2: TPanel;
        ResultGrid2: TDBGrid;
        Panel5: TPanel;
        Label6: TLabel;
        Label7: TLabel;
        DBText1: TDBText;
        DBText2: TDBText;
        Label8: TLabel;
        Label10: TLabel;
        SearchEdit2: TEdit;
        Panel6: TPanel;
        AddButton2: TSpeedButton;
        ModifyButton2: TSpeedButton;
        DeleteButton2: TSpeedButton;
        OrderItemsButton2: TSpeedButton;
        CancelButton2: TSpeedButton;
        ViewButton2: TSpeedButton;
        ResultQuery2: TIBQuery;
        ResultSource2: TDataSource;
        ResultGrid: TDBGrid;
        ResultQuery2ID_MAN_HOLIDAY: TIntegerField;
        ResultQuery2ID_HOLIDAY: TIntegerField;
        ResultQuery2PERIOD_BEG: TDateField;
        ResultQuery2PERIOD_END: TDateField;
        ResultQuery2DATE_BEG: TDateField;
        ResultQuery2DATE_END: TDateField;
        ResultQuery2H_TERM: TIntegerField;
        ResultQuery2ID_MAN_MOVING: TIntegerField;
        ResultQuery2DAY_USED: TIntegerField;
        ResultQuery2DAY_UNUSED: TIntegerField;
        ResultQuery2RMOVING: TIntegerField;
        ResultQuery2ID_STATUS: TIntegerField;
        ResultQuery2REASON: TIBStringField;
        ResultQuery2NUM_ITEM: TIntegerField;
        ResultQuery2ID_HOLIDAY_REMOVE_PROLONG: TIntegerField;
        ResultQuery2ID_HOLIDAY_LONG_REASON: TIntegerField;
        ResultQuery2DEPARTMENT_NAME: TIBStringField;
        ResultQuery2POST_NAME: TIBStringField;
        ResultQuery2FIO_SMALL: TIBStringField;
        ResultQuery2TN: TIntegerField;
        ResultQuery2NAME_REASON: TIBStringField;
        ResultQueryID_MAN_HOSPITAL: TIntegerField;
        ResultQueryHOSP_STR: TIBStringField;
        ResultQueryDATE_REMOVE_END: TDateField;
        procedure OrderItemsButtonClick(Sender: TObject);
        constructor Create(aOwner: TComponent;
            aID_ORDER_TYPE: Integer;
            aDate_Order: TDate;
            aNum_Order: string;
            aNote: string;
            aEditMode: TEditMode;
            aID_ORDER: Integer); reintroduce;
        procedure AddButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ResultQueryAfterOpen(DataSet: TDataSet);
        procedure SearchEditChange(Sender: TObject);
        procedure BonusGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure BonusGridKeyPress(Sender: TObject; var Key: Char);
        procedure ViewButtonClick(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure ResultGrid2KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure ResultGrid2KeyPress(Sender: TObject; var Key: Char);
        procedure AddButton2Click(Sender: TObject);
        procedure ResultQuery2AfterOpen(DataSet: TDataSet);
        procedure SearchEdit2Change(Sender: TObject);
        procedure DeleteButton2Click(Sender: TObject);
        procedure ModifyButton2Click(Sender: TObject);
        procedure ViewButton2Click(Sender: TObject);
    private
    { Private declarations }
    public
        ID_ORDER: Integer;
        FMode: TEditMode;
        Order_Date: TDate;

    end;

var
    HolidayBackForm: THolidayBackForm;

implementation

uses DtManBonusItemsUnit, AddHolidayBackUnit, AddHolidayLongUnit,
    AddManHolidayUnit;

{$R *.dfm}

constructor THolidayBackForm.Create(aOwner: TComponent;
    aID_ORDER_TYPE: Integer;
    aDate_Order: TDate;
    aNum_Order: string;
    aNote: string;
    aEditMode: TEditMode;
    aID_ORDER: Integer);
begin
    inherited Create(aOwner);

    FMode := aEditMode;
    Order_Date := aDate_Order;

    PageControl1.ActivePage := TabSheet1;

    WriteQuery.Transaction := PersonalCommon.WriteTransaction;
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery2.Transaction := PersonalCommon.ReadTransaction;

    Id_Order := aid_Order;

    if FMode = emNew then begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            WriteQuery.Close;
            WriteQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(aID_ORDER_TYPE) + ',' +
                QuotedStr(aNum_Order) + ',''' +
                DateToStr(aDate_Order) + ''',' +
                QuotedStr(aNote) + ',' +
                IntToStr(1) + ');';
            Id_Order := ExecQuery(WriteQuery);

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

    ResultQuery.Close;
    ResultQuery.Params.ParamValues['ID_ORDER'] := id_Order;
    ResultQuery.Open;

    ResultQuery2.Close;
    ResultQuery2.Params.ParamValues['ID_ORDER'] := id_Order;
    ResultQuery2.Open;

    if FMode = emView then begin
        AddButton.Enabled := False;
        ModifyButton.Enabled := False;
        DeleteButton.Enabled := False;
        AddButton2.Enabled := False;
        ModifyButton2.Enabled := False;
        DeleteButton2.Enabled := False;
        Caption := Caption + ' (перегляд)';
    end;

end;

procedure THolidayBackForm.OrderItemsButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.aID_TYPE := 25;
    Form.FMode := FMode;
    Form.Prepare;
    Form.ShowModal;
    Form.Free;
end;

procedure THolidayBackForm.AddButtonClick(Sender: TObject);
var
    Form: TAddHolidayBackForm;
begin
    Form := TAddHolidayBackForm.Create(Self);
    Form.Prepare(emNew, Id_Order, Order_Date, Order_Date);

    if Form.ShowModal = mrOk then begin
        ResultQuery.Close;
        ResultQuery.Open;
        ResultQuery.Locate('ID_HOLIDAY_REMOVE', Form.new_id, []);
    end;

    Form.Free;
end;

procedure THolidayBackForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure THolidayBackForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddHolidayBackForm;
    old_id: Integer;
begin
    if not CheckQueryForModify(ResultQuery)
        then exit;

    Form := TAddHolidayBackForm.Create(Self);

    Form.Prepare(emModify,
        Id_Order,
        ResultQueryDATE_REMOVE.Value,
        ResultQueryDATE_REMOVE_END.Value,
        ResultQueryID_HOLIDAY_ORDER.Value,
        ResultQueryORDER_NUM.Value,
        ResultQueryFOR_WHAT.Value,
        ResultQueryNUM_ITEM.Value,
        ResultQueryID_HOLIDAY_REMOVE.value,
        ResultQueryID_MAN_HOSPITAL.Value,
        ResultQueryHOSP_STR.Value);

    if Form.ShowModal = mrOk then begin
        old_id := ResultQueryID_HOLIDAY_REMOVE.Value;
        ResultQuery.Close;
        ResultQuery.Open;
        ResultQuery.Locate('ID_HOLIDAY_REMOVE', old_id, []);
    end;

    Form.Free;
end;

procedure THolidayBackForm.DeleteButtonClick(Sender: TObject);
begin
    if not CheckQueryForDel(ResultQuery)
        then exit;

    WriteQuery.Close;
    WriteQuery.SQL.Text := 'EXECUTE PROCEDURE MAN_HOLIDAY_REMOVE_DELETE(' +
        IntToStr(ResultQueryID_HOLIDAY_REMOVE.Value) + ')';
    ExecQuery(WriteQuery);

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure THolidayBackForm.ResultQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(ResultGrid);
end;

procedure THolidayBackForm.SearchEditChange(Sender: TObject);
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
        ResultQuery.Locate('FIO_SMALL', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure THolidayBackForm.BonusGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Holiday_Remove: ' + IntToStr(ResultQuery['Id_Holiday_Remove']));
    except
    end;

end;

procedure THolidayBackForm.BonusGridKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure THolidayBackForm.ViewButtonClick(Sender: TObject);
var
    Form: TAddHolidayBackForm;
begin
    if not CheckQueryForModify(ResultQuery)
        then exit;

    Form := TAddHolidayBackForm.Create(Self);

    Form.Prepare(emView,
        Id_Order,
        ResultQueryDATE_REMOVE.Value,
        ResultQueryDATE_REMOVE_END.Value,
        ResultQueryID_HOLIDAY_ORDER.Value,
        ResultQueryORDER_NUM.Value,
        ResultQueryFOR_WHAT.Value,
        ResultQueryNUM_ITEM.Value,
        ResultQueryID_HOLIDAY_REMOVE.value,
        ResultQueryID_MAN_HOSPITAL.Value,
        ResultQueryHOSP_STR.Value);

    Form.ShowModal;

    Form.Free;
end;

procedure THolidayBackForm.FormResize(Sender: TObject);
begin
    CancelButton.Left := Self.Width - CancelButton.Width - 10;
    CancelButton2.Left := Self.Width - CancelButton.Width - 10;
    GridResize(ResultGrid);
    GridResize(ResultGrid2);
end;

procedure THolidayBackForm.ResultGrid2KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit2.Text := '';

    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Man_Holiday: ' + IntToStr(ResultQuery2['Id_Man_Holdiay']));
    except
    end;

end;

procedure THolidayBackForm.ResultGrid2KeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit2.Text := SearchEdit2.Text + Key;
end;

procedure THolidayBackForm.AddButton2Click(Sender: TObject);
var
    Form: TAddHolidayLongForm;
begin
    Form := TAddHolidayLongForm.Create(Self, emNew, Id_ORder, Order_Date, -1);

    if Form.ShowModal = mrOk then begin
        ResultQuery2.Close;
        ResultQuery2.Open;
    end;

    Form.Free;
end;

procedure THolidayBackForm.ResultQuery2AfterOpen(DataSet: TDataSet);
begin
    GridResize(ResultGrid2);
end;

procedure THolidayBackForm.SearchEdit2Change(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit2.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery2.Locate('TN', SearchEdit2.Text, [loPartialKey])
    else
        ResultQuery2.Locate('FIO_SMALL', SearchEdit2.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure THolidayBackForm.DeleteButton2Click(Sender: TObject);
begin
    if not CheckQueryForDel(ResultQuery2)
        then exit;

    WriteQuery.Transaction.StartTransaction;
    WriteQuery.Close;
    WriteQuery.SQL.Text := 'EXECUTE PROCEDURE MAN_HOLIDAY_DELETE(' +
        IntToStr(ResultQuery2ID_MAN_HOLIDAY.Value) + ')';
    ExecQuery(WriteQuery);
    WriteQuery.Transaction.Commit;


    ResultQuery2.Close;
    ResultQuery2.Open;
end;

procedure THolidayBackForm.ModifyButton2Click(Sender: TObject);
var
    Form: TAddHolidayLongForm;
begin
    if not CheckQueryForModify(ResultQuery)
        then exit;

    Form := TAddHolidayLongForm.Create(Self, emModify, Id_ORder, Order_Date, ResultQuery2ID_Man_HOLIDAY.Value);

    if Form.ShowModal = mrOk then begin
        QueryCloseOpen(ResultQuery2, 'ID_MAN_HOLIDAY', ResultQuery2ID_MAN_HOLIDAY.Value);
    end;

    Form.Free;
end;

procedure THolidayBackForm.ViewButton2Click(Sender: TObject);
var
    Form: TAddHolidayLongForm;
begin
    if not CheckQueryForModify(ResultQuery)
        then exit;

    Form := TAddHolidayLongForm.Create(Self, emView, Id_ORder, Order_Date, ResultQuery2ID_Man_Holiday.Value);

    Form.ShowModal;

    Form.Free;
end;

end.
