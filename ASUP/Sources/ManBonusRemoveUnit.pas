{-$Id: ManBonusRemoveUnit.pas,v 1.4 2009/08/28 12:01:47 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Форма редактирования приказа по снятию надбавок" }
{    Добвление/изменение/удаление снятий надбавок по приказу                     }
{    Ответственный: Кропов Валентин                                              }

unit ManBonusRemoveUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, DBCtrls, Db,
    IBCustomDataSet, IBQuery, SpCommon, PersonalCommon, OrdersViewUnit,
    DtManBonusItemsUnit;

type
    TManBonusRemoveForm = class(TForm)
        ManPanel: TPanel;
        Label1: TLabel;
        ManEdit: TEdit;
        Panel2: TPanel;
        DeleteButton: TBitBtn;
        AddButton: TBitBtn;
        ActiveBonusGrid: TDBGrid;
        Label2: TLabel;
        RemoveBonusGrid: TDBGrid;
        Panel3: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        DepartmentName: TDBText;
        PostName: TDBText;
        Panel1: TPanel;
        Label6: TLabel;
        Label9: TLabel;
        DBText1: TDBText;
        DBText2: TDBText;
        ActiveBonusQuery: TIBQuery;
        RemoveBonusQuery: TIBQuery;
        OutputQuery: TIBQuery;
        ActiveBonusDataSource: TDataSource;
        RemoveBonusDataSource: TDataSource;
        PCardButton: TBitBtn;
        ActiveBonusQueryID_MAN_BONUS: TIntegerField;
        ActiveBonusQueryID_MAN_MOVING: TIntegerField;
        ActiveBonusQueryID_BONUS: TIntegerField;
        ActiveBonusQueryNAME_BONUS: TIBStringField;
        ActiveBonusQueryIS_PERCENT: TIBStringField;
        ActiveBonusQuerySUMMA: TIBBCDField;
        ActiveBonusQueryBONUS_DATE_BEG: TDateField;
        ActiveBonusQueryBONUS_DATE_END: TDateField;
        ActiveBonusQueryID_ORDER: TIntegerField;
        ActiveBonusQueryNUM_ITEM: TIntegerField;
        ActiveBonusQueryDEPARTMENT_NAME: TIBStringField;
        ActiveBonusQueryPOST_NAME: TIBStringField;
        ActiveBonusQueryTHE_BONUS: TIBStringField;
        CancelButton: TSpeedButton;
        CheckQuery: TIBQuery;
        CheckQueryNUM_ORDER: TIBStringField;
        CheckQueryDATE_ORDER: TDateField;
        CheckQueryNAME_STATUS: TIBStringField;
        RemoveBonusQueryID_MAN_BONUS_REMOVE: TIntegerField;
        RemoveBonusQueryID_MAN_BONUS: TIntegerField;
        RemoveBonusQueryREMOVE_DATE: TDateField;
        RemoveBonusQueryNAME_BONUS: TIBStringField;
        RemoveBonusQueryID_BONUS: TIntegerField;
        RemoveBonusQueryID_MAN_MOVING: TIntegerField;
        RemoveBonusQueryID_PCARD: TIntegerField;
        RemoveBonusQueryDEPARTMENT_NAME: TIBStringField;
        RemoveBonusQueryPOST_NAME: TIBStringField;
        RemoveBonusQuerySUMMA: TIBBCDField;
        RemoveBonusQueryTHE_BONUS: TIBStringField;
        RemoveBonusQueryBONUS_DATE_BEG: TDateField;
        RemoveBonusQueryBONUS_DATE_END: TDateField;
        RemoveBonusQueryIS_PERCENT: TIBStringField;
        Label7: TLabel;
        OrderRemoveButton: TBitBtn;
        Label8: TLabel;
        SearchEdit: TEdit;
        Label10: TLabel;
        RemoveBonusQueryTN: TIntegerField;
        RemoveBonusQueryFIO_SMALL: TIBStringField;
        RemoveBonusQueryFIO: TIBStringField;
        AllLabel: TLabel;
        OrderItemsButton: TSpeedButton;
        ModifyButton: TBitBtn;
        RemoveBonusQueryNUM_ITEM: TIntegerField;
    ActiveBonusQueryPERCENT: TIBBCDField;
    RemoveBonusQueryID_VIDOPL: TIntegerField;
    RemoveBonusQueryNUM_ORDER: TIBStringField;
    RemoveBonusQueryDATE_ORDER: TDateField;
    RemoveBonusQueryID_STATUS: TIntegerField;
    RemoveBonusQueryID_DEPARTMENT: TIntegerField;
    RemoveBonusQueryPERCENT: TIBBCDField;

        procedure Prepare;
        function CheckBonusForRemove: Boolean;
        procedure PCardButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure ActiveBonusQueryAfterOpen(DataSet: TDataSet);
        procedure RemoveBonusQueryAfterOpen(DataSet: TDataSet);
        procedure DeleteButtonClick(Sender: TObject);
        procedure OrderRemoveButtonClick(Sender: TObject);
        procedure AllLabelClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure RemoveBonusGridKeyPress(Sender: TObject; var Key: Char);
        procedure OrderItemsButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
    private
    { Private declarations }
    public

        FMode: TEditMode;
        ID_ORDER: Integer;
        ID_PCARD: Integer;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

    { Public declarations }
    end;

var
    ManBonusRemoveForm: TManBonusRemoveForm;

implementation
uses GoodFunctionsUnit, AddManBonusRemoveUnit;
{$R *.DFM}

function TManBonusRemoveForm.CheckBonusForRemove: Boolean;
begin
    result := true;
    if not ActiveBonusQuery.IsEmpty then begin
        CheckQuery.Close;
        CheckQuery.Params.ParamValues['ID_MAN_BONUS'] := ActiveBonusQuery['ID_MAN_BONUS'];
        CheckQuery.Open;
        result := CheckQuery.IsEmpty;
        if result = False then MessageDlg('Неможливо зняти цю надбавку! Її вже хтось намагається зняти (або вже зняв) за наказом №' + CheckQuery['NUM_ORDER'] + ' від "' + DateToStr(CheckQuery['DATE_ORDER']) + '", який має статус "' + CheckQuery['NAME_STATUS'] + '"', mtError, [mbOk], 0);
    end;
end;

procedure TManBonusRemoveForm.Prepare;
begin

    if FMode = emNew then begin

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

    ID_PCARD := -1;
    ActiveBonusQuery.Close;
    ActiveBonusQuery.Params.ParamValues['CUR_DATE'] := DateToStr(ORDER_DATE);

    RemoveBonusQuery.Close;
    RemoveBonusQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;


    if (FMode = emModify) or (FMode = emView) then RemoveBonusQuery.Open;

    Caption := 'Зняті надбавки з працівників за наказом №' + NUM_Order;

    Label7.Caption := Label7.Caption + DateToStr(ORDER_DATE) + ':';

    if FMode = emView then begin
        Caption := Caption + '(тільки перегляд)';
        ManPanel.Visible := False;
        Panel1.Visible := False;
        ActiveBonusGrid.Visible := False;
        Panel2.Visible := False;
    end;
end;

procedure TManBonusRemoveForm.PCardButtonClick(Sender: TObject);
begin

    id_pcard := getpcard(ORDER_DATE);

    if id_pcard <> -1 then
    begin

        ManEdit.Text := GoodFunctionsUnit.Fam;

        with ActiveBonusQuery do
        begin
            Params.ParamValues['Id_PCard'] := Id_PCard;
            Close;
            Open;
            GridResize(ActiveBonusGrid);
        end;

    end;

end;

procedure TManBonusRemoveForm.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TManBonusRemoveForm.FormCreate(Sender: TObject);
begin
    ActiveBonusQuery.Transaction := PersonalCommon.ReadTransaction;
    RemoveBonusQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    CheckQuery.Transaction := PersonalCommon.ReadTransaction;
end;

procedure TManBonusRemoveForm.AddButtonClick(Sender: TObject);
var
    Form: TAddManBonusRemoveForm;
begin
    if ID_PCARD = -1 then begin
        MessageDlg('Виберіть робітника!', mtError, [mbOk], 0);
        exit;
    end;
    if ActiveBonusQuery.IsEmpty then begin
        MessageDlg('Немає надбавок у цієї людини!', mtError, [mbOk], 0);
        exit;
    end;

  {
  if (DateToStr(RemoveDate.Date) = DateToStr(ActiveBonusQueryBONUS_DATE_BEG.Value)) then begin
    MessageDlg('Неможиво зняти надбавку у той самий день, коли її було встановлено!',mtError,[mbOk],0);
    RemoveDate.SetFocus;
    exit;
  end;
  if (RemoveDate.Date < ActiveBonusQueryBONUS_DATE_BEG.Value) or (RemoveDate.Date > ActiveBonusQueryBONUS_DATE_END.Value) then begin
    MessageDlg('Дата зняття надбавки повинна бути між датою початку та датою кінця дії надбавки!',mtError,[mbOk],0);
    RemoveDate.SetFocus;
    exit;
  end;
  }

    if not CheckBonusForRemove then exit;

    Form := TAddManBonusRemoveForm.Create(self);
    Form.id_order := ID_ORDER;

    if RemoveBonusQuery.IsEmpty
        then
        Form.DateRemove.Date := ORDER_DATE
    else
        Form.DateRemove.Date := RemoveBonusQueryREMOVE_DATE.Value;

    if Form.ShowModal = mrOk
        then begin

        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_REMOVE_INSERT(' +
            ActiveBonusQueryID_MAN_BONUS.AsString + ',' +
            QuotedStr(DateToStr(Form.DateRemove.Date)) + ',' +
            IntToStr(ID_ORDER) + ',' +
            Form.NumItemEdit.Text + ')';
        ExecQuery(OutputQuery);

        ActiveBonusQuery.Close;
        ActiveBonusQuery.Open;

        RemoveBonusQuery.Close;
        RemoveBonusQuery.Open;
    end;

    Form.free;
end;

procedure TManBonusRemoveForm.FormResize(Sender: TObject);
begin
    GridResize(ActiveBonusGrid);
    GridResize(RemoveBonusGrid);
end;

procedure TManBonusRemoveForm.ActiveBonusQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(ActiveBonusGrid);
    GridResize(RemoveBonusGrid);
end;

procedure TManBonusRemoveForm.RemoveBonusQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(ActiveBonusGrid);
    GridResize(RemoveBonusGrid);
end;

procedure TManBonusRemoveForm.DeleteButtonClick(Sender: TObject);
begin
    if RemoveBonusQuery.IsEmpty then begin
        MessageDlg('Немає записів, які можна вилучити!', mtError, [mbOk], 0);
        exit;
    end;

    if MessageDlg('Чі ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_REMOVE_DELETE(' + IntToStr(RemovebonusQuery['ID_MAN_BONUS_REMOVE']) + ');';
    ExecQuery(OutputQuery);

    RemoveBonusQuery.Close;
    RemoveBonusQuery.Open;

    ActiveBonusQuery.Close;
    ActiveBonusQuery.Open;
end;

procedure TManBonusRemoveForm.OrderRemoveButtonClick(Sender: TObject);
var
    Form: TOrdersViewForm;
    Form2: TAddManBonusRemoveForm;
begin
    Form := TOrdersViewForm.Create(Self);
    Form.UnFormButton.Visible := False;
    Form.SelectButton.Visible := True;

    Form.ShowModal;

    if Form.ModalResult = mrOk
        then begin
        Form2 := TAddManBonusRemoveForm.Create(self);
        Form2.id_order := ID_ORDER;

        if RemoveBonusQuery.IsEmpty
            then
            Form2.DateRemove.Date := ORDER_DATE
        else
            Form2.DateRemove.Date := RemoveBonusQueryREMOVE_DATE.Value;

        if Form2.ShowModal = mrOk
            then begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_REMOVE_GROUP_INS (' +
                IntToStr(Form.InputQueryID_ORDER.Value) + ',' +
                QuotedStr(DateToStr(Form2.DateRemove.Date)) + ',' +
                IntToStr(ID_ORDER) + ',' +
                Form2.NumItemEdit.Text + ')';
            ExecQuery(OutputQuery);
        end;

        Form2.Free;

        RemoveBonusQuery.Close;
        RemoveBonusQuery.Open;
    end;

    Form.Free;
end;

procedure TManBonusRemoveForm.AllLabelClick(Sender: TObject);
begin
    RemoveBonusQuery.FetchAll;
    AllLabel.Caption := 'Усьго записів : ' + IntToStr(RemoveBonusQuery.RecordCount);
end;

procedure TManBonusRemoveForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        RemoveBonusQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        RemoveBonusQuery.Locate('FIO_SMALL', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TManBonusRemoveForm.RemoveBonusGridKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TManBonusRemoveForm.OrderItemsButtonClick(Sender: TObject);
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

procedure TManBonusRemoveForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddManBonusRemoveForm;
begin

    if not CheckQueryForModify(RemoveBonusQuery)
        then exit;

    Form := TAddManBonusRemoveForm.Create(self);
    Form.id_order := ID_ORDER;

    Form.DateRemove.Date := RemoveBonusQueryREMOVE_DATE.Value;
    Form.NumItemEdit.Text := RemoveBonusQueryNUM_ITEM.AsString;

    if Form.ShowModal = mrOk
        then begin

        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_REMOVE_UPDATE(' +
            IntToStr(RemoveBonusQueryID_MAN_BONUS_REMOVE.Value) + ',' +
            QuotedStr(DateToStr(Form.DateRemove.Date)) + ',' +
            Form.NumItemEdit.Text + ')';
        ExecQuery(OutputQuery);

        ActiveBonusQuery.Close;
        ActiveBonusQuery.Open;

        RemoveBonusQuery.Close;
        RemoveBonusQuery.Open;
    end;

    Form.free;

end;

end.
