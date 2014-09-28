{-$Id: ManAwardUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Форма редактирования приказа по поощрениям"    }
{    Добвление/изменение/удаление поощрений по приказу                         }
{    Ответственный: Кропов Валентин                                            }

unit ManAwardUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, DBGrids, Db, IBCustomDataSet, IBQuery, PersonalCommon,
    Buttons, DBCtrls, ExtCtrls, StdCtrls, SpComboBox, Mask, CheckEditUnit,
    PCardsViewUnit, MainUnit, ManPunishingUnit, SpCommon, variants;

type
    TManAwardForm = class(TForm)
        Panel1: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        OrderLabel: TLabel;
        NumItemLabel: TLabel;
        FIOEdit: TCheckEdit;
        PrivSpComboBox: TSpComboBox;
        ManPrivQuery: TIBQuery;
        ManPrivSource: TDataSource;
        WorkQuery: TIBQuery;
        AddButton: TBitBtn;
        ManPrivGrid: TDBGrid;
        InfoPanel: TPanel;
        CancelButton: TBitBtn;
        DeleteButton: TBitBtn;
        Label5: TLabel;
        DateOrderLabel: TLabel;
        Label6: TLabel;
        Podrazd: TEdit;
        SelectPodrazdAndPostButton: TButton;
        Post: TEdit;
        Label11: TLabel;
        TempQuery: TIBQuery;
        ManPrivQueryID_MAN_AWARD: TIntegerField;
        ManPrivQueryID_MAN_MOVING: TIntegerField;
        ManPrivQueryID_PCARD: TIntegerField;
        ManPrivQueryID_AWARD: TIntegerField;
        ManPrivQueryNAME_AWARD: TIBStringField;
        ManPrivQueryID_AWARD_TYPE: TIntegerField;
        ManPrivQueryNAME_AWARD_TYPE: TIBStringField;
        ManPrivQueryFIO: TIBStringField;
        ManPrivQueryID_ORDER: TIntegerField;
        ManPrivQueryNUM_ITEM: TIntegerField;
        ManPrivQueryDEPARTMENT_NAME: TIBStringField;
        ManPrivQueryPOST_NAME: TIBStringField;
        Label13: TLabel;
        DBText6: TDBText;
        Label14: TLabel;
        DBText7: TDBText;
        PCardsButton: TBitBtn;
        procedure FormCreate(Sender: TObject);
        procedure PcardsButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure FormClick(Sender: TObject);
        function CheckInputData: Boolean;
        procedure DeleteButtonClick(Sender: TObject);
        procedure ManPrivQueryAfterOpen(DataSet: TDataSet);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
    private
        PCardsForm: TPCardsViewForm;
    { Private declarations }
    public
        FMode: TEditMode;
        Id_Order: Integer;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

    //NumOrder    : String;
        Num_Item: Integer;
        Id_PCard: Integer;
        Id_Man_Moving: Integer;
        procedure Prepare(IOrder: Integer; NOrder: string; NItem: Integer; DateO: TDate);
    end;

var
    ManAwardForm: TManAwardForm;

implementation
uses SpFormUnit;
{$R *.DFM}

function TManAwardForm.CheckInputData: Boolean;
begin
    CheckInputData := True;
    if Id_PCard = -1 then begin
        MessageDlg('Потрібно вибрати фізичну особу!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;
    if Id_Man_Moving = -1 then begin
        MessageDlg('Потрібно вибрати підрозділ та посаду вибраного працівника!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;
    if PrivSpComboBox.GetId = -1 then begin
        MessageDlg('Потрібно вибрати заохочення!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;
  //Проверяем чтобы небыло уже такого поощрения
    if ManPrivQuery.Locate('ID_MAN_MOVING;ID_AWARD', VarArrayOf([Id_Man_Moving, PrivSpComboBox.GetID]), []) then begin
        CheckInputData := False;
        MessageDlg('Для цієї людини з цього підрозділу та з такою посадою вже додане це заохочення!', mtError, [mbOk], 0);
        exit;
    end;
end;

procedure TManAwardForm.Prepare(IOrder: Integer; NOrder: string;
    NItem: Integer; DateO: TDate);
begin
    Id_Order := IOrder;
    Num_Order := NOrder;
    Num_Item := NItem;
    Caption := 'Додати заохочення';
    OrderLabel.Caption := Num_Order;
    NumItemLabel.Caption := IntToStr(Num_Item);
    Order_DATE := DateO;
    DateOrderLabel.Caption := DateToStr(DateO);
  //
    Id_PCard := -1;
    Id_Man_Moving := -1;
    PrivSpComboBox.Prepare(-1, '');
  //
    if FMode = emNew then begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            WorkQuery.Close;
            WorkQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
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
        Caption := 'Список заохочень наказу №' + Num_Order + ' пункту №' + IntToStr(num_Item) + ' (перегляд)';
        Panel1.Visible := False;
    end;
    ManPrivQuery.Close;
    ManPrivQuery.Params.ParamValues['ID_ORDER'] := id_Order;
    ManPrivQuery.Params.ParamValues['NUM_ITEM'] := Num_Item;
    ManPrivQuery.Open;
end;


procedure TManAwardForm.FormCreate(Sender: TObject);

begin
    PCardsForm := TPCardsViewForm.Create(Self, True, False);
    PCardsForm.Select := True;
    TempQuery.Transaction := PersonalCommon.ReadTransaction;
    ManPrivQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;

    if not GPP then PrivSpComboBox.SpParams.SpMode := spmReadOnly;
end;

procedure TManAwardForm.PcardsButtonClick(Sender: TObject);
var
    ID_SHTATRAS: Integer;
begin
    if PCardsForm.ShowModal = mrOK then
    begin
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
        TempQuery.SQL.Text := 'SELECT ID_MAN_MOVING, ID_SHTATRAS FROM GET_CUR_MOVING( ''' + DateToStr(Order_Date) + ''') GCM WHERE GCM.ID_PCARD = ' + IntToStr(Id_PCard);
        TempQuery.Open;
        TempQuery.FetchAll;
        if TempQuery.RecordCount = 1 then begin
            SelectPodrazdAndPostButton.Enabled := False;
            Id_Man_Moving := TempQuery['ID_MAN_MOVING'];
            ID_SHTATRAS := TempQuery['ID_SHTATRAS'];
            TempQuery.Close;
            TempQuery.SQL.Text := 'SELECT DEPARTMENT_FULL, NAME_POST FROM GET_SHTATRAS_INFO(' + IntToStr(ID_SHTATRAS) + ',''' + DateToStr(Order_Date) + ''');';
            TempQuery.Open;
            Podrazd.Text := TempQuery['DEPARTMENT_FULL'];
            Post.Text := TempQuery['NAME_POST'];
        end;
    end;
end;

procedure TManAwardForm.AddButtonClick(Sender: TObject);
begin
    if not CheckInputData then exit;
    PersonalCommon.WriteTransaction.StartTransaction;
    try
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_AWARD_INSERT ' +
            IntToStr(Id_Man_Moving) + ',' + IntToStr(PrivSpComboBox.GetId) +
            ',' + IntToStr(Id_Order) + ',' + IntToStr(Num_Item);
        ExecQuery(WorkQuery);
    except
        on E: Exception do
        begin
            MessageDlg('При занесенні у базу даних виникла помилка:'
                + E.Message, mtError, [mbOk], 0);
            PersonalCommon.WriteTransaction.Rollback;
            Exit
        end;
    end;
    PersonalCommon.WriteTransaction.Commit;
    ManPrivQuery.Close;
    ManPrivQuery.Open;
end;

procedure TManAwardForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if formStyle = fsMDIChild then Action := caFree;
    PrivSpComboBox.SaveIntoRegistry;
    PCardsForm.Free;
end;


procedure TManAwardForm.FormResize(Sender: TObject);
begin
    GridResize(ManPrivGrid);
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TManAwardForm.FormClick(Sender: TObject);
begin
    if FMode = emView then MessageDlg('Ця інформація доступна тільки для перегляду', mtError, [mbOk], 0);
end;

procedure TManAwardForm.DeleteButtonClick(Sender: TObject);
begin
    if not ManPrivQuery.IsEmpty then begin
        if MessageDlg('Ви справді бажаєте вилучити з наказу №' + IntToStr(id_Order) + ' запис про надання заохочення: "' + ManPrivQuery['NAME_AWARD'] + '" для робітника "' + ManPrivQuery['FIO'] + '"', mtConfirmation, [mbYes, mbNo], 0) = ID_NO then exit;
        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_AWARD_DELETE(' + IntToStr(ManPrivQuery['ID_MAN_AWARD']) + ')';
        ExecQuery(WorkQuery);
        ManPrivQuery.Close;
        ManPrivQuery.Open;
    end
    else MessageDlg('Немає записів!', mtError, [mbOk], 0);
end;

procedure TManAwardForm.ManPrivQueryAfterOpen(DataSet: TDataSet);
begin
    if ManPrivQuery.IsEmpty then DeleteButton.Enabled := False else DeleteButton.Enabled := True;
    GridResize(ManPrivGrid);
end;

procedure TManAwardForm.SelectPodrazdAndPostButtonClick(Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin
    if Id_Pcard = -1 then MessageDlg('Потрібно спочатку вибрати працівника!', mtError, [mbOk], 0)
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
            Id_Man_Moving := temp.ResultQuery['ID_MAN_MOVING'];
            Podrazd.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            Post.Text := temp.ResultQuery['POST'];
        end;
        temp.free;
    end;
end;

end.
