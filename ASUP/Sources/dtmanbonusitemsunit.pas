unit DtManBonusItemsUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, SpFormUnit, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
    Buttons, StdCtrls, ExtCtrls, PersonalCommon, SpCommon, uSearchFrame,
    FIBDataSet, pFIBDataSet, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
    cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid;

type
    TDtManBonusItemsForm = class(TSpForm)
        ResultQueryID_TEXT_ITEM: TIntegerField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryTEXT: TMemoField;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
        cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
        procedure FormCreate(Sender: TObject);
        procedure Prepare;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FindButtonClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure SearchNextClick(Sender: TObject);
        procedure DetailsButtonClick(Sender: TObject);
        procedure cxGrid1DBTableView1DblClick(Sender: TObject);
        procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
    { Private declarations }
    public
        ID_ORDER: Integer;
        aID_TYPE: Integer;
        FMode: TEditMode;
    end;

var
    DtManBonusItemsForm: TDtManBonusItemsForm;

implementation

uses AddAdditionalActionsUnit;

{$R *.dfm}

procedure TDtManBonusItemsForm.Prepare;
begin
    if FMode = emView then begin
        AddButton.Enabled := False;
        ModifyButton.Enabled := False;
        DeleteButton.Enabled := False;

    end;

    ResultQuery.Close;
    ResultQuery.ParamByName('ID_ORDER').AsInteger := ID_ORDER;
    ResultQuery.Open;
end;

procedure TDtManBonusItemsForm.FormCreate(Sender: TObject);
begin
    inherited;

    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;

    Params := TSpParams.Create;
    Params.IdField := 'ID_TEXT_ITEM';
    Params.SpFields := 'NUM_ITEM, TEXT';
end;

procedure TDtManBonusItemsForm.AddButtonClick(Sender: TObject);
var
    Form: TAddAdditionalActionsForm;
    new_id: Integer;
begin
    Form := TAddAdditionalActionsForm.Create(self);

    Form.ID_TYPE := 10;

    if ResultQuery.IsEmpty
        then
        Form.PoryadokEdit.Text := '1'
    else begin
        ResultQuery.Last;
        Form.PoryadokEdit.Text := IntToStr(ResultQueryNUM_ITEM.value + 1);
    end;

    if Form.ShowModal = mrOk
        then begin
        WorkQuery.Close;
        WorkQuery.SQL.Clear;
        WorkQuery.SQL.add('SELECT ID_TEXT_ITEM FROM DT_MAN_BONUS_ORDER_ITEM_INSERT(:id_order, :num_item, :text)');
        WorkQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        WorkQuery.Params.ParamValues['num_item'] := Form.PoryadokEdit.Text;
        WorkQuery.Params.ParamValues['text'] := Form.TextEdit.Text;

        new_id := ExecQuery(WorkQuery);

        ResultQuery.Close;
        ResultQuery.Open;

        ResultQuery.Locate('ID_TEXT_ITEM', new_id, []);
    end;

    Form.Free;
end;

procedure TDtManBonusItemsForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddAdditionalActionsForm;
    old_id: Integer;
begin

    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    Form := TAddAdditionalActionsForm.Create(self);

    Form.ID_TYPE := 10;

    Form.PoryadokEdit.Text := IntToStr(ResultQueryNUM_ITEM.value);
    Form.TextEdit.Text := ResultQueryTEXT.Value;

    old_id := ResultQueryID_TEXT_ITEM.Value;

    if Form.ShowModal = mrOk
        then begin
        WorkQuery.Close;
        WorkQuery.SQL.Clear;
        WorkQuery.SQL.add('EXECUTE PROCEDURE DT_MAN_BONUS_ORDER_ITEM_UPDATE(:old_id, :id_order, :num_item, :text)');
        WorkQuery.Params.ParamValues['old_id'] := old_id;
        WorkQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        WorkQuery.Params.ParamValues['num_item'] := Form.PoryadokEdit.Text;
        WorkQuery.Params.ParamValues['text'] := Form.TextEdit.Text;

        ExecQuery(WorkQuery);

        ResultQuery.Close;
        ResultQuery.Open;

        ResultQuery.Locate('ID_TEXT_ITEM', old_id, []);
    end;

    Form.Free;
end;

procedure TDtManBonusItemsForm.DeleteButtonClick(Sender: TObject);
begin
    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    if MessageDlg('Ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) <> ID_YES
        then exit;

    WorkQuery.Close;
    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_ORDER_ITEM_DELETE(' + IntTOStr(ResultQueryID_TEXT_ITEM.value) + ')';
    ExecQuery(WorkQuery);

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TDtManBonusItemsForm.OkButtonClick(Sender: TObject);
begin
    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    ModalResult := mrOk;
end;

procedure TDtManBonusItemsForm.FindButtonClick(Sender: TObject);
begin
    inherited;
//
end;

procedure TDtManBonusItemsForm.SearchEditChange(Sender: TObject);
begin
    inherited;
 //
end;

procedure TDtManBonusItemsForm.SearchNextClick(Sender: TObject);
begin
    inherited;
//
end;

procedure TDtManBonusItemsForm.DetailsButtonClick(Sender: TObject);
var
    Form: TAddAdditionalActionsForm;
begin

    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    Form := TAddAdditionalActionsForm.Create(self);

    Form.ID_TYPE := 10;

    Form.PoryadokEdit.Text := IntToStr(ResultQueryNUM_ITEM.value);
    Form.TextEdit.Text := ResultQueryTEXT.Value;

    Form.TextEdit.Enabled := False;
    Form.PoryadokEdit.Enabled := False;
    Form.AddExist.Enabled := False;

    Form.ShowModal;

    Form.Free;
end;

procedure TDtManBonusItemsForm.cxGrid1DBTableView1DblClick(
    Sender: TObject);
begin
    inherited;
    OkButton.Click;
end;

procedure TDtManBonusItemsForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    inherited;
    if Key = VK_RETURN then OkButton.Click;
end;

end.
