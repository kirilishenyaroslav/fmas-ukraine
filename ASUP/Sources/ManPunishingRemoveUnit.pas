{-$Id: ManPunishingRemoveUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Форма редактирования приказа по снятию взысканий" }
{    Добвление/изменение/удаление снятий взысканий по приказу                     }
{    Ответственный: Кропов Валентин                                               }

unit ManPunishingRemoveUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, DBGrids, Db, IBCustomDataSet, IBQuery, PersonalCommon,
    Buttons, DBCtrls, ExtCtrls, StdCtrls, SpComboBox, Mask, CheckEditUnit,
    PCardsViewUnit, MainUnit, SpCommon, ComCtrls;

type
    TManPunishingRemoveForm = class(TForm)
        Grid2: TDBGrid;
        InfoPanel: TPanel;
        CancelButton: TBitBtn;
        OutputQuery: TIBQuery;
        DataSource2: TDataSource;
        InputQuery1: TIBQuery;
        Panel1: TPanel;
        OrderLabel: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        NumItemLabel: TLabel;
        Panel2: TPanel;
        DeleteButton: TBitBtn;
        AddButton: TBitBtn;
        DataSource1: TDataSource;
        InputQuery2: TIBQuery;
        Panel4: TPanel;
        Label2: TLabel;
        OrderBeg: TDBText;
        Label5: TLabel;
        DateOrder: TDBText;
        Label6: TLabel;
        NumItemBeg: TDBText;
        Splitter1: TSplitter;
        Grid1: TDBGrid;
        Label7: TLabel;
        DBText1: TDBText;
        Label8: TLabel;
        DBText2: TDBText;
        Label9: TLabel;
        DBText3: TDBText;
        FIOEdit: TCheckEdit;
        Label1: TLabel;
        DateOrderLabel: TLabel;
        Label10: TLabel;
        CheckQuery: TIBQuery;
        Label13: TLabel;
        DBText6: TDBText;
        Label14: TLabel;
        DBText7: TDBText;
        InputQuery1ID_MAN_PUNISHING: TIntegerField;
        InputQuery1ID_MAN_MOVING: TIntegerField;
        InputQuery1ID_PUNISHING: TIntegerField;
        InputQuery1NAME_PUNISHING: TIBStringField;
        InputQuery1FIO: TIBStringField;
        InputQuery1DEPARTMENT_NAME: TIBStringField;
        InputQuery1POST_NAME: TIBStringField;
        InputQuery1ID_ORDER_BEG: TIntegerField;
        InputQuery1ID_STATUS_BEG: TIntegerField;
        InputQuery1NUM_ITEM_BEG: TIntegerField;
        InputQuery1ID_PCARD: TIntegerField;
        InputQuery1NUM_ORDER_BEG: TIBStringField;
        InputQuery1DATE_ORDER_BEG: TDateField;
        InputQuery1ID_ORDER_END: TIntegerField;
        InputQuery1NUM_ORDER_END: TIBStringField;
        InputQuery1NUM_ITEM_END: TIntegerField;
        InputQuery1DATE_ORDER_END: TDateField;
        InputQuery1ID_STATUS_END: TIntegerField;
        InputQuery2ID_MAN_PUNISHING_REMOVE: TIntegerField;
        InputQuery2ID_MAN_PUNISHING: TIntegerField;
        InputQuery2NUM_ORDER_BEG: TIBStringField;
        InputQuery2NUM_ITEM_BEG: TIntegerField;
        InputQuery2DATE_ORDER_BEG: TDateField;
        InputQuery2FIO: TIBStringField;
        InputQuery2NAME_PUNISHING: TIBStringField;
        InputQuery2DEPARTMENT_NAME: TIBStringField;
        InputQuery2POST_NAME: TIBStringField;
        CheckQueryNUM_ORDER: TIBStringField;
        CheckQueryDATE_ORDER: TDateField;
        CheckQueryNAME_STATUS: TIBStringField;
        Label11: TLabel;
        Label12: TLabel;
        PCardsButton: TBitBtn;
        procedure FormCreate(Sender: TObject);
        procedure PcardsButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure GroupBox1Click(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure InputQuery1AfterOpen(DataSet: TDataSet);
    private
    { Private declarations }
    public
        FMode: TEditMode;
        Id_Order: Integer;
        Num_Item: Integer;
        Id_PCard: Integer;
        PCardsForm: TPCardsViewForm;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

        procedure Prepare;
        function CheckPunishingForRemove(TEST_ID_MAN_PUNISHING: Integer): boolean;
    end;

var
    ManPunishingRemoveForm: TManPunishingRemoveForm;

implementation

{$R *.DFM}

function TManPunishingRemoveForm.CheckPunishingForRemove(TEST_ID_MAN_PUNISHING: Integer): boolean;
begin
  //result := True;
    CheckQuery.Close;
    CheckQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
    CheckQuery.Params.ParamValues['ID_MAN_PUNISHING'] := TEST_ID_MAN_PUNISHING;
    CheckQuery.Open;
    result := not CheckQuery.IsEmpty;
    if result then MessageDlg('Це стягнення вже хтось намагається зняти (або вже знято) за наказом №' + CheckQueryNUM_ORDER.Value + ' від ' + CheckQueryDATE_ORDER.AsString + ', який має статус "' + CheckQueryNAME_STATUS.Value + '"', mtError, [mbOk], 0);
end;

procedure TManPunishingRemoveForm.Prepare;

begin

    OrderLabel.Caption := Num_Order;
    NumItemLabel.Caption := IntToStr(Num_Item);
    DateOrderLabel.Caption := DateToStr(Order_Date);

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

  //
    if FMode = emNew then Caption := 'Зняття стягнень (нове)';
    if FMode = emModify then Caption := 'Зняття стягнень (редагування)';
    if FMode = emView then begin
        Caption := 'Список стягнень, знятих за наказом №' + Num_Order + ' пунктом №' + IntToStr(Num_Item) + ' від "' + DateToStr(Order_Date) + '" (перегляд)';
        Panel1.Visible := False;
        Panel2.Visible := False;
        Panel4.Visible := False;
        Grid1.Visible := False;
    end;
  // Создаем для форму просмотра сотрудников для того, чтобы каждый раз её не создавать и не удалять
    PCardsForm := TPCardsViewForm.Create(Self, true, false, Order_Date);
    PCardsForm.Select := True;
  //
    InputQuery1.Close;
    InputQuery1.Params.ParamValues['ID_ORDER'] := Id_Order;

    InputQuery2.Close;
    InputQuery2.Params.ParamValues['ID_ORDER'] := Id_Order;
    InputQuery2.Params.ParamValues['NUM_ITEM'] := Num_Item;
    InputQuery2.Open;
end;

procedure TManPunishingRemoveForm.FormCreate(Sender: TObject);
begin
    InputQuery1.Transaction := PersonalCommon.ReadTransaction;
    InputQuery2.Transaction := PersonalCommon.ReadTransaction;
    CheckQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
end;

procedure TManPunishingRemoveForm.PcardsButtonClick(Sender: TObject);
begin
    if PCardsForm.ShowModal = mrOK then
    begin
        Id_PCard := PCardsForm.ResultQuery['Id_Pcard'];
        FIOEdit.Text := PCardsForm.ResultQuery['Familia'] + ' ' + PCardsForm.ResultQuery['Imya'] + ' ' + PCardsForm.ResultQuery['Otchestvo'];
        InputQuery1.Close;
        InputQuery1.PARAMS.ParamValues['ID_PCARD'] := IntToStr(Id_PCard);
        InputQuery1.PARAMS.ParamValues['CUR_DATE'] := DateToStr(Order_Date);
        InputQuery1.Open;
    end;
end;

procedure TManPunishingRemoveForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    PCardsForm.Free;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TManPunishingRemoveForm.GroupBox1Click(Sender: TObject);
begin
  //if FMode = emView then MessageDlg('Ця інформація доступна тільки для перегляду', mtError, [mbOk], 0);
end;

procedure TManPunishingRemoveForm.FormResize(Sender: TObject);
begin
    GridResize(Grid1);
    GridResize(Grid2);
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TManPunishingRemoveForm.AddButtonClick(Sender: TObject);
begin
    if not InputQuery1.IsEmpty then begin
        if CheckPunishingForRemove(InputQuery1ID_MAN_PUNISHING.Value) then exit;
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PUNISHING_REMOVE_INSERT(' + IntToStr(InputQuery1ID_MAN_PUNISHING.Value) + ',' + IntToStr(Id_Order) + ',' + IntToStr(Num_Item) + ');';
        ExecQuery(OutputQuery);
        InputQuery2.Close;
        InputQuery2.Open;
        InputQuery1.Close;
        InputQuery1.Open;
    //InputQuery2.Locate('ID_PCARD',IdPCard,[]);
    end;
end;

procedure TManPunishingRemoveForm.DeleteButtonClick(Sender: TObject);
begin
    if (not InputQuery2.IsEmpty) and (MessageDlg('Ви справді бажаєте вилучити зняття стягнення "' + InputQuery2['NAME_PUNISHING'] + '" з робітника "' + InputQuery2['FIO'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PUNISHING_REMOVE_DELETE(' + IntToStr(InputQuery2ID_MAN_PUNISHING_REMOVE.Value) + ');';
        ExecQuery(OutputQuery);
        InputQuery2.Close;
        InputQuery2.Open;
        InputQuery1.Close;
        InputQuery1.Open;
    end;
end;

procedure TManPunishingRemoveForm.InputQuery1AfterOpen(DataSet: TDataSet);
begin
    if InputQuery1.IsEmpty then AddButton.Enabled := False else AddButton.Enabled := True;
    if InputQuery2.IsEmpty then DeleteButton.Enabled := False else DeleteButton.Enabled := True;
    GridResize(Grid1);
    GridResize(Grid2);
end;

end.
