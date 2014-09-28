unit ManIoUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, PersonalCommon, SpCommon, StdCtrls, Grids, DBGrids, Buttons,
    ExtCtrls, DB, IBCustomDataSet, IBQuery;

type
    TManIoForm = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        CancelButton: TSpeedButton;
        OrderItemsButton: TSpeedButton;
        ViewButton: TSpeedButton;
        ResultGrid: TDBGrid;
        Panel3: TPanel;
        Label2: TLabel;
        Label9: TLabel;
        SearchEdit: TEdit;
        ResultQuery: TIBQuery;
        ResultSource: TDataSource;
        WorkQuery: TIBQuery;
        ResultQueryID_MAN_BONUS_IO: TIntegerField;
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
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        ResultQuerySUMMA_PERCENT_STR: TIBStringField;
        procedure OrderItemsButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure ResultGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure ResultGridKeyPress(Sender: TObject; var Key: Char);
        procedure SearchEditChange(Sender: TObject);
        constructor Create(AOwner: TComponent; ID_ORDER_TYPE: Integer; aOrder_Date: TDate; aNUM_ORDER: string; Note_Order: string; Mode: TEditMode; idOrder: Integer = -1);
        procedure AddButtonClick(Sender: TObject);
        procedure ResultQueryAfterOpen(DataSet: TDataSet);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ViewButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        id_order: Integer;
        Order_Date: TDate;
        Num_Order: string;
        FMode: TEditMode;

    end;

var
    ManIoForm: TManIoForm;

implementation

uses GoodFunctionsUnit, DtManBonusItemsUnit, AddManIoUnit;

{$R *.dfm}

constructor TManIoForm.Create(AOwner: TComponent; ID_ORDER_TYPE: Integer; aOrder_Date: TDate; aNUM_ORDER: string; Note_Order: string; Mode: TEditMode; idOrder: Integer = -1);
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

    Caption := 'Наказ про виконання обов`язків №' + NUM_ORDER;

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

procedure TManIoForm.OrderItemsButtonClick(Sender: TObject);
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

procedure TManIoForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TManIoForm.FormResize(Sender: TObject);
begin
    GridResize(ResultGrid);
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TManIoForm.ResultGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Man_Bonus: ' + IntToStr(ResultQuery['Id_Man_Bonus']) + #13#10 + 'Id_Man_Bonus_Io: ' + IntToStr(ResultQuery['Id_Man_Bonus_Io']));
    except
    end;
end;

procedure TManIoForm.ResultGridKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TManIoForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        if RadioButton1.Checked then
            ResultQuery.Locate('TN1', SearchEdit.Text, [loPartialKey])
        else
            ResultQuery.Locate('TN2', SearchEdit.Text, [loPartialKey])
    else
        if RadioButton1.Checked then
            ResultQuery.Locate('FIO1', SearchEdit.Text, [loPartialKey, loCaseInsensitive])
        else
            ResultQuery.Locate('FIO2', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TManIoForm.AddButtonClick(Sender: TObject);
var
    Form: TAddManIoForm;
begin
    Form := TAddManIoForm.Create(Self, emNew, Id_Order, Order_Date);

    if Form.ShowModal = mrOk then begin
        ResultQuery.Close;
        ResultQuery.Open;
    end;

    Form.Free;
end;

procedure TManIoForm.ResultQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(ResultGrid);
end;

procedure TManIoForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddManIoForm;
begin
    if not CheckQueryForModify(ResultQuery) then exit;

    Form := TAddManIoForm.Create(Self, emModify, Id_Order, Order_Date, ResultQueryID_MAN_BONUS_IO.Value);

    if Form.ShowModal = mrOk then begin
        QueryCloseOpen(ResultQuery, 'ID_MAN_BONUS_IO', ResultQueryID_MAN_BONUS_IO.Value);
    end;

    Form.Free;
end;

procedure TManIoForm.ViewButtonClick(Sender: TObject);
var
    Form: TAddManIoForm;
begin
    if not CheckQueryForModify(ResultQuery) then exit;

    Form := TAddManIoForm.Create(Self, emView, Id_Order, Order_Date, ResultQueryID_MAN_BONUS_IO.Value);

    Form.ShowModal;

    Form.Free;
end;

procedure TManIoForm.DeleteButtonClick(Sender: TObject);
begin
    if not CheckQueryForDel(ResultQuery) then exit;

    WorkQuery.Close;
    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_IO_DELETE(:ID)';
    WorkQuery.Params.ParamValues['ID'] := ResultQueryID_MAN_BONUS_IO.Value;
    ExecQuery(WorkQuery);

    ResultQuery.Close;
    resultQuery.Open;
end;

end.
