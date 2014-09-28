{-$Id: ManPunishingUnit.pas,v 1.5 2007/12/11 12:43:55 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Форма редактирования приказа по взысканиям"    }
{    Добвление/изменение/удаление взысканий по приказу                         }
{    Ответственный: Кропов Валентин                                            }

unit ManPunishingUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, DBGrids, Db, IBCustomDataSet, IBQuery, PersonalCommon,
    Buttons, DBCtrls, ExtCtrls, StdCtrls, SpComboBox, Mask, CheckEditUnit,
    PCardsViewUnit, MainUnit, EditControl, SpCommon, Variants, cxControls,
    cxContainer, cxEdit, cxTextEdit, cxMemo, uFControl, uLabeledFControl,
  uCharControl, uFloatControl;

type
    TPunishMode = (pmAdd, pmRemove);
    TManPunishingAddForm = class(TForm)
        GroupBox1: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        OrderLabel: TLabel;
        FIOEdit: TCheckEdit;
        PunishingSpComboBox: TSpComboBox;
        ManPunishingGrid: TDBGrid;
        InfoPanel: TPanel;
        WorkQuery: TIBQuery;
        ManPunishingSource: TDataSource;
        ManPunishingQuery: TIBQuery;
        DeleteButton: TBitBtn;
        AddButton: TBitBtn;
        Label5: TLabel;
        Date: TLabel;
        Podrazd: TEdit;
        Label6: TLabel;
        Label11: TLabel;
        Post: TEdit;
        SelectPodrazdAndPostButton: TButton;
        TempQuery: TIBQuery;
        Label7: TLabel;
        Label8: TLabel;
        CancelButton: TBitBtn;
        DBText1: TDBText;
        DBText2: TDBText;
        ManPunishingQueryID_MAN_PUNISHING: TIntegerField;
        ManPunishingQueryID_MAN_MOVING: TIntegerField;
        ManPunishingQueryID_PUNISHING: TIntegerField;
        ManPunishingQueryNAME_PUNISHING: TIBStringField;
        ManPunishingQueryFIO: TIBStringField;
        ManPunishingQueryDEPARTMENT_NAME: TIBStringField;
        ManPunishingQueryPOST_NAME: TIBStringField;
        ManPunishingQueryID_ORDER_BEG: TIntegerField;
        ManPunishingQueryID_STATUS_BEG: TIntegerField;
        ManPunishingQueryNUM_ITEM_BEG: TIntegerField;
        ManPunishingQueryID_PCARD: TIntegerField;
        ManPunishingQueryNUM_ORDER_BEG: TIBStringField;
        ManPunishingQueryDATE_ORDER_BEG: TDateField;
        ManPunishingQueryID_ORDER_END: TIntegerField;
        ManPunishingQueryNUM_ORDER_END: TIBStringField;
        ManPunishingQueryNUM_ITEM_END: TIntegerField;
        ManPunishingQueryDATE_ORDER_END: TDateField;
        PCardsButton: TBitBtn;
        Label9: TLabel;
        ReasonEdit: TEdit;
        ManPunishingQueryREASON: TIBStringField;
        Label4: TLabel;
        cxMemoOsnovanie: TcxMemo;
        PremiaRemovePercent: TqFFloatControl;
        procedure FormCreate(Sender: TObject);
        procedure PcardsButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure GroupBox1Click(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ManPunishingQueryAfterOpen(DataSet: TDataSet);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
    procedure PunishingSpComboBoxChange(Sender: TObject);
    private
    { Private declarations }
    public
        FMode: TEditMode;
        Id_Order: Integer;
        Num_Item: Integer;
        Id_PCard: Integer;
        ID_MAN_MOVING: Integer;
        PCardsForm: TPCardsViewForm;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

        procedure Prepare;
        function CheckInputData: Boolean;
    end;

var
    ManPunishingAddForm: TManPunishingAddForm;

implementation
uses SpFormUnit;
{$R *.DFM}

function TManPunishingAddForm.CheckInputData: Boolean;
begin
    CheckInputData := True;

    if Id_PCard = -1 then begin
        MessageDlg('Потрібно вибрати працівника!', mtError, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;

    if Id_Man_Moving = -1 then begin
        MessageDlg('Потрібно вибрати місце роботи для вибраного працівника!', mtError, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;

    if PunishingSpComboBox.GetId = -1 then begin
        MessageDlg('Потрібно вибрати стягнення!', mtError, [mbOk], 0);
        CheckInputData := False;
    end;

    if ReasonEdit.Text = '' then begin
        MessageDlg('Потрібно ввести причину стягнення!', mtError, [mbOk], 0);
        ReasonEdit.SetFocus;
        CheckInputData := False;
    end;
end;

procedure TManPunishingAddForm.Prepare;
begin
    OrderLabel.Caption := Num_Order;
    Date.Caption := dateToStr(Order_Date);
    Caption := 'Додавання стягненнь';

    Id_PCard := -1;
    ID_MAN_MOVING := -1;

    PremiaRemovePercent.Visible := False;
    if FMode = emNew then
    begin
        PersonalCommon.WriteTransaction.StartTransaction;

        try
            WorkQuery.Close;
            WorkQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',''' + Num_ORDER + ''',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            Id_Order := ExecQuery(WorkQuery);
        except
            PersonalCommon.WriteTransaction.Rollback;
            ModalResult := mrNone;
            MessageDlg('При занесенні данних у базу виникла помилка!', mtError, [mbOk], 0);
            exit;
        end;

        PersonalCommon.WriteTransaction.Commit;

    end;

    if FMode = emView then begin
        Caption := 'Список стягнень наказу №' + Num_Order + ' пункту №' + IntToStr(Num_Item) + ' від "' + DateToStr(Order_Date) + '" (перегляд)';
        GroupBox1.Visible := False;
    end;

    PunishingSpComboBox.Prepare(-1, '');
    // Создаем для форму просмотра сотрудников для того, чтобы каждый раз её не создавать и не удалять
    PCardsForm := TPCardsViewForm.Create(Self, true, false, Order_Date);
    PCardsForm.Select := True;
    //
    ManPunishingQuery.Params.ParamValues['ID_ORDER'] := Id_Order;

    ManPunishingQuery.Close;
    ManPunishingQuery.Open;

    GridResize(ManPunishingGrid);
end;


procedure TManPunishingAddForm.FormCreate(Sender: TObject);
begin
    ManPunishingQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    TempQuery.Transaction := PersonalCommon.ReadTransaction;

    if not GPP then PunishingSpComboBox.SpParams.SpMode := spmReadOnly;
end;

procedure TManPunishingAddForm.PcardsButtonClick(Sender: TObject);
var
    ID_SHTATRAS: Integer;
begin
    if PCardsForm.ShowModal = mrOK then begin

            // Если мы выбрали другого человека, то нужно обнулить мувинг, если тот выбран
        if (ID_PCARD <> -1) and (ID_PCARD <> PCardsForm.ResultQueryID_PCARD.Value) then begin
            ID_MAN_MOVING := -1;
            Podrazd.Text := '';
            Post.Text := '';
            SelectPodrazdAndPostButton.Enabled := True;
        end;

        Id_PCard := PCardsForm.ResultQuery['Id_Pcard'];
        FIOEdit.Text := PCardsForm.ResultQuery['Familia'] + ' ' + PCardsForm.ResultQuery['Imya'] + ' ' + PCardsForm.ResultQuery['Otchestvo'];

            //Проверяем, если есть только один мувинг, то проставляем его автоматически!
        TempQuery.Close;
        TempQuery.SQL.Text := 'SELECT ID_MAN_MOVING, ID_SHTATRAS FROM man_moving where (' +
            QuotedStr(DateToStr(Order_Date)) +
            ' between date_beg and real_date_end)' +
            ' and id_pcard = ' + IntToStr(Id_PCard);
        TempQuery.Open;
        TempQuery.FetchAll;

        if TempQuery.RecordCount = 1 then begin
            SelectPodrazdAndPostButton.Enabled := False;
            ID_MAN_MOVING := TempQuery['ID_MAN_MOVING'];
            ID_SHTATRAS := TempQuery['ID_SHTATRAS'];
            TempQuery.Close;
            TempQuery.SQL.Text := 'SELECT DEPARTMENT_FULL, NAME_POST FROM GET_SHTATRAS_INFO(' + IntToStr(ID_SHTATRAS) + ',''' + DateToStr(Order_Date) + ''');';
            TempQuery.Open;
            Podrazd.Text := TempQuery['DEPARTMENT_FULL'];
            Post.Text := TempQuery['NAME_POST'];
        end;
    end;
end;

procedure TManPunishingAddForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    PCardsForm.Free;
    PunishingSpComboBox.SaveIntoRegistry;

    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TManPunishingAddForm.GroupBox1Click(Sender: TObject);
begin
    if FMode = emView then
        MessageDlg('Ця інформація доступна тільки для перегляду', mtError, [mbOk], 0);
end;

procedure TManPunishingAddForm.FormResize(Sender: TObject);
begin
    GridResize(ManPunishingGrid);
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TManPunishingAddForm.AddButtonClick(Sender: TObject);
var
    perc_str: String;
begin
    if CheckInputData then begin

        if ManPunishingQuery.Locate('ID_MAN_MOVING;ID_PUNISHING', VarArrayOf([ID_MAN_MOVING, PunishingSpComboBox.GetID]), []) then begin
            MessageDlg('Для цієї людини з цього підрозділу та з такою посадою вже додане це стягнення цим наказом!', mtError, [mbOk], 0);
            exit;
        end;

        if not PremiaRemovePercent.Visible or VarIsNUll(PremiaRemovePercent.Value)
            or VarIsEmpty(PremiaRemovePercent.Value) then perc_str := 'NULL'
        else
        begin
            perc_str := FloatToStr(PremiaRemovePercent.Value);
            perc_str :=  StringReplace(perc_str, ',', '.', [rfReplaceAll]);
        end;

        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PUNISHING_INSERT(' + IntToStr(ID_MAN_MOVING) + ',' +
            IntToStr(PunishingSpComboBox.GetId) + ',' +
            IntToStr(Id_Order) + ',' +
            IntToStr(Num_Item) + ',' +
            QuotedStr(ReasonEdit.Text) + ',' +
            QuotedStr(cxMemoOsnovanie.Text) + ',' +
            perc_str + ');';
        ExecQuery(WorkQuery);

        ManPunishingQuery.Close;
        ManPunishingQuery.Open;

        ManPunishingQuery.Locate('ID_MAN_MOVING;ID_PUNISHING', VarArrayOf([ID_MAN_MOVING, PunishingSpComboBox.GetID]), []);
        GridResize(ManPunishingGrid);
    end;
end;

procedure TManPunishingAddForm.DeleteButtonClick(Sender: TObject);
begin
    if (not ManPunishingQuery.IsEmpty) and (MessageDlg('Ви справді бажаєте вилучити стягнення "' + ManPunishingQuery['NAME_PUNISHING'] + '" з робітника "' + ManPunishingQuery['FIO'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PUNISHING_DELETE(' + IntToStr(ManPunishingQuery['ID_MAN_PUNISHING']) + ')';
        ExecQuery(WorkQuery);
        ManPunishingQuery.Close;
        ManPunishingQuery.Open;
        GridResize(ManPunishingGrid);
    end;
end;

procedure TManPunishingAddForm.ManPunishingQueryAfterOpen(
    DataSet: TDataSet);
begin
    if ManPunishingQuery.IsEmpty then
        DeleteButton.Enabled := False
    else
        DeleteButton.Enabled := True;
end;

procedure TManPunishingAddForm.SelectPodrazdAndPostButtonClick(
    Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin
    if Id_Pcard = -1 then
        MessageDlg('Потрібно спочатку вибрати працівника!', mtError, [mbOk], 0)
    else begin
        temp := TSpForm.Create(Self);
        params := TSpParams.Create;
        params.IdField := 'ID_MAN_MOVING';
        params.SpFields := 'NAME_DEPARTMENT_FULL, POST, DATE_BEG, DATE_END';
        params.Title := 'Виберіть підрозділ та посаду';
        params.ColumnNames := 'Підрозділ,Посада, Дата початку,Дата кінця';
        params.ReadOnly := True;
        params.Table := 'GET_PCARD_MOVINGS(' + IntToStr(Id_Pcard) + ',''' + DateToStr(Order_Date) + ''')';
        params.SpMode := spmSelect;
        temp.Init(params);
        temp.ShowModal;

        if temp.ModalResult = mrOk then begin
            ID_MAN_MOVING := temp.ResultQuery['ID_MAN_MOVING'];
            Podrazd.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            Post.Text := temp.ResultQuery['POST'];
        end;

        temp.free;
    end;
end;

procedure TManPunishingAddForm.PunishingSpComboBoxChange(Sender: TObject);
begin
    if PunishingSpComboBox.GetId = 812 then
        PremiaRemovePercent.Visible := True
    else PremiaRemovePercent.Visible := False;
end;

end.

