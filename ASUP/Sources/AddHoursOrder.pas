unit AddHoursOrder;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Grids, DBGrids, Buttons,
    ExtCtrls, PersonalCommon, SpCommon;

type
    TAddHoursOrderForm = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        OrderItemsButton: TSpeedButton;
        BonusGrid: TDBGrid;
        Panel3: TPanel;
        CancelButton: TSpeedButton;
        Label2: TLabel;
        Label9: TLabel;
        SearchEdit: TEdit;
        ResultQuery: TIBQuery;
        ResultSource: TDataSource;
        WriteQuery: TIBQuery;
        ResultQueryID_ADD_HOURS: TIntegerField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryADD_DATE: TDateField;
        ResultQueryREASON: TIBStringField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryIS_ACTIVE: TIntegerField;
        ResultQueryFIO: TIBStringField;
        ResultQueryFIO_SMALL: TIBStringField;
        ResultQueryPOST_NAME: TIBStringField;
        ResultQueryDEPARTMENT_NAME: TIBStringField;
        ResultQueryTN: TIntegerField;
        ResultQueryTYPE_SMALL_NAME: TIBStringField;
        ResultQueryTYPE_FULL_NAME: TIBStringField;
        ResultQueryHOURS: TIBBCDField;
        ResultQueryID_TYPE: TIntegerField;
        procedure OrderItemsButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ResultQueryAfterOpen(DataSet: TDataSet);
        procedure SearchEditChange(Sender: TObject);
        procedure BonusGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure BonusGridKeyPress(Sender: TObject; var Key: Char);
        procedure ModifyButtonClick(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);

    private

        FMode: TEditMode;
        NUM_ORDER: string;

    public
        ID_ORDER: Integer;
        Order_Date: TDate;

        constructor Create(AOwner: TComponent;
            ID_ORDER_TYPE: Integer;
            aOrder_Date: TDate;
            aNUM_ORDER: string;
            Note_Order: string;
            Mode: TEditMode;
            idOrder: Integer = -1); reintroduce;

    end;

var
    AddHoursOrderForm: TAddHoursOrderForm;

implementation

uses GoodFunctionsUnit, DtManBonusItemsUnit, AddHoursOrderEdit;

{$R *.dfm}


constructor TAddHoursOrderForm.Create(AOwner: TComponent;
    ID_ORDER_TYPE: Integer;
    aOrder_Date: TDate;
    aNUM_ORDER: string;
    Note_Order: string;
    Mode: TEditMode;
    idOrder: Integer = -1);
begin
    inherited Create(AOwner);

    FMode := Mode;
    Num_Order := aNUM_ORDER;
    Order_Date := aOrder_Date;

    WriteQuery.Transaction := PersonalCommon.WriteTransaction;
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Order := idOrder;

    if FMode = emNew then begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            WriteQuery.Close;
            WriteQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' +
                QuotedStr(Num_ORDER) + ',''' +
                DateToStr(Order_DATE) + ''',' +
                QuotedStr(NOTE_ORDER) + ',' +
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

    Caption := 'Наказ про понаднормову працю №' + NUM_ORDER;

    if FMode = emView then begin
        Panel1.Visible := False;
        Caption := Caption + ' (перегляд)';
    end;

end;

procedure TAddHoursOrderForm.OrderItemsButtonClick(Sender: TObject);
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

procedure TAddHoursOrderForm.DeleteButtonClick(Sender: TObject);
begin
    if not CheckQueryForDel(ResultQuery) then exit;

    WriteQuery.Close;
    WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_ADD_HOURS_D(' + IntToStr(ResultQueryID_ADD_HOURS.Value) + ')';
    ExecQuery(WriteQuery);

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TAddHoursOrderForm.AddButtonClick(Sender: TObject);
var
    Form: TAddHoursOrderEditForm;
begin
    Form := TAddHoursOrderEditForm.Create(self, emNew, ID_ORDER, Order_Date, NUM_ORDER, -1);

    if Form.ShowModal = mrOk
        then begin
        ResultQuery.Close;
        ResultQuery.Open;
    end;

    Form.Free;
end;

procedure TAddHoursOrderForm.ResultQueryAfterOpen(DataSet: TDataSet);
begin
    Gridresize(BonusGrid);
end;

procedure TAddHoursOrderForm.SearchEditChange(Sender: TObject);
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

procedure TAddHoursOrderForm.BonusGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Add_Hours: ' + IntToStr(ResultQueryID_ADD_HOURS.Value));
    except
    end;
end;

procedure TAddHoursOrderForm.BonusGridKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TAddHoursOrderForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddHoursOrderEditForm;
begin
    Form := TAddHoursOrderEditForm.Create(self, emModify, ID_ORDER, Order_Date, NUM_ORDER, ResultQueryID_ADD_HOURS.Value);

    if Form.ShowModal = mrOk
        then begin
        ResultQuery.Close;
        ResultQuery.Open;

        ResultQuery.Locate('Id_Add_Hours', ResultQueryID_ADD_HOURS.Value, []);
    end;

    Form.Free;
end;

procedure TAddHoursOrderForm.FormResize(Sender: TObject);
begin
    Gridresize(BonusGrid);
end;

procedure TAddHoursOrderForm.CancelButtonClick(Sender: TObject);
begin
    Close();
end;

end.
