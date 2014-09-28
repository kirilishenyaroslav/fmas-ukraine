{-$Id: PrivUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Форма редактирования приказа по льготам"       }
{    Добвление/изменение/удаление льгот по приказу                             }
{    Ответственный: Кропов Валентин                                            }

unit PrivUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, DBGrids, Db, IBCustomDataSet, IBQuery, PersonalCommon,
    Buttons, DBCtrls, ExtCtrls, StdCtrls, SpComboBox, Mask, CheckEditUnit,
    PCardsViewUnit, MainUnit, ManPunishingUnit, SpCommon, variants;

type
    TManPrivForm = class(TForm)
        ManPrivGrid: TDBGrid;
        InfoPanel: TPanel;
        Label7: TLabel;
        Label8: TLabel;
        DBText1: TDBText;
        DBText2: TDBText;
        CancelButton: TBitBtn;
        ManPrivQuery: TIBQuery;
        ManPrivSource: TDataSource;
        WorkQuery: TIBQuery;
        GroupBox1: TGroupBox;
        Label1: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        OrderLabel: TLabel;
        NumItemLabel: TLabel;
        Label6: TLabel;
        Date: TLabel;
        Label9: TLabel;
        Label11: TLabel;
        FIOEdit: TCheckEdit;
        DeleteButton: TBitBtn;
        AddButton: TBitBtn;
        Podrazd: TEdit;
        Post: TEdit;
        SelectPodrazdAndPostButton: TButton;
        Label2: TLabel;
        PrivSpComboBox: TSpComboBox;
        TempQuery: TIBQuery;
        ManPrivQueryID_MAN_PRIV: TIntegerField;
        ManPrivQueryID_MAN_MOVING: TIntegerField;
        ManPrivQueryID_PRIV: TIntegerField;
        ManPrivQueryNAME_PRIV: TIBStringField;
        ManPrivQueryID_PRIV_TYPE: TIntegerField;
        ManPrivQueryNAME_PRIV_TYPE: TIBStringField;
        ManPrivQueryFIO: TIBStringField;
        ManPrivQueryDEPARTMENT_NAME: TIBStringField;
        ManPrivQueryPOST_NAME: TIBStringField;
        ManPrivQueryID_ORDER_BEG: TIntegerField;
        ManPrivQueryID_STATUS_BEG: TIntegerField;
        ManPrivQueryNUM_ITEM_BEG: TIntegerField;
        ManPrivQueryID_PCARD: TIntegerField;
        ManPrivQueryNUM_ORDER_BEG: TIBStringField;
        ManPrivQueryDATE_ORDER_BEG: TDateField;
        ManPrivQueryID_ORDER_END: TIntegerField;
        ManPrivQueryNUM_ORDER_END: TIBStringField;
        ManPrivQueryNUM_ITEM_END: TIntegerField;
        ManPrivQueryDATE_ORDER_END: TDateField;
        ManPrivQueryID_STATUS_END: TIntegerField;
        PCardsButton: TBitBtn;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure PcardsButtonClick(Sender: TObject);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
        function CheckInputData: Boolean;
        procedure AddButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ManPrivQueryAfterOpen(DataSet: TDataSet);
        procedure FormResize(Sender: TObject);
    private
    { Private declarations }
    public
        FMode: TEditMode;
        ID_ORDER: Integer;
        NUM_ITEM: Integer;
        ID_PCARD: Integer;
        ID_MAN_MOVING: Integer;
        PCardsForm: TPCardsViewForm;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

        procedure PrepareForm;
    end;

var
    ManPrivForm: TManPrivForm;

implementation
uses SPFormUnit;
{$R *.DFM}


function TManPrivForm.CheckInputData: Boolean;
begin
    CheckInputData := True;
    if Id_PCard = -1 then begin
        MessageDlg('Потрібно вибрати працівника!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;
    if Id_Man_Moving = -1 then begin
        MessageDlg('Потрібно вибрати місце роботи для вибраного працівника!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;
    if PrivSpComboBox.GetId = -1 then begin
        MessageDlg('Потрібно вибрати пільгу!', mtWarning, [mbOk], 0);
        CheckInputData := False;
    end;
end;


procedure TManPrivForm.PrepareForm;

begin

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

    OrderLabel.Caption := NUM_ORDER;
    NumItemLabel.Caption := IntToStr(NUM_ITEM);
    Date.Caption := dateToStr(Order_Date);
  //
    Caption := 'Додавання пільг';

    Id_PCard := -1;
    ID_MAN_MOVING := -1;
    PrivSpComboBox.Prepare(-1, '');

    if FMode = emView then begin
        Caption := 'Список пільг наказу №' + Num_Order + ' пункту №' + IntToStr(Num_Item) + ' від "' + DateToStr(Order_Date) + '" (перегляд)';
        GroupBox1.Visible := False;
    end;
  // Создаем для форму просмотра сотрудников для того, чтобы каждый раз её не создавать и не удалять
    PCardsForm := TPCardsViewForm.Create(Self, true, false, Order_Date);
    PCardsForm.Select := True;
  //
    ManPrivQuery.Close;
    ManPrivQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    ManPrivQuery.Params.ParamValues['NUM_ITEM'] := NUM_ITEM;
    ManPrivQuery.Open;
end;


procedure TManPrivForm.FormCreate(Sender: TObject);
begin
    if not GPP then PrivSpComboBox.SpParams.SpMode := spmReadOnly;

    ManPrivQuery.Transaction := PersonalCommon.ReadTransaction;
    TempQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
end;


procedure TManPrivForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    PCardsForm.Free;
    PrivSpComboBox.SaveIntoRegistry;
    if formStyle = fsMDIChild then Action := caFree;
end;


procedure TManPrivForm.PcardsButtonClick(Sender: TObject);
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


procedure TManPrivForm.SelectPodrazdAndPostButtonClick(Sender: TObject);
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
            ID_MAN_MOVING := temp.ResultQuery['ID_MAN_MOVING'];
            Podrazd.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            Post.Text := temp.ResultQuery['POST'];
        end;
        temp.free;
    end;
end;

procedure TManPrivForm.AddButtonClick(Sender: TObject);
begin
    if CheckInputData then begin
        if ManPrivQuery.Locate('ID_MAN_MOVING;ID_PRIV', VarArrayOf([ID_MAN_MOVING, PrivSpComboBox.GetID]), []) then begin
            MessageDlg('Для цієї людини з цього підрозділу та з такою посадою вже додане це стягнення цим наказом!', mtError, [mbOk], 0);
            exit;
        end;
        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PRIV_INSERT(' + IntToStr(ID_MAN_MOVING) + ',' + IntToStr(PrivSpComboBox.GetId) + ',' + IntToStr(Id_Order) + ',' + IntToStr(Num_Item) + ');';
        ExecQuery(WorkQuery);
        ManPrivQuery.Close;
        ManPrivQuery.Open;
        ManPrivQuery.Locate('ID_MAN_MOVING;ID_PRIV', VarArrayOf([ID_MAN_MOVING, PrivSpComboBox.GetID]), [])
    end;
end;

procedure TManPrivForm.DeleteButtonClick(Sender: TObject);
begin
    if (not ManPrivQuery.IsEmpty) and (MessageDlg('Ви справді бажаєте вилучити пільгу "' + ManPrivQuery['NAME_PRIV'] + '" з робітника "' + ManPrivQuery['FIO'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_PRIV_DELETE(' + IntToStr(ManPrivQuery['ID_MAN_PRIV']) + ')';
        ExecQuery(WorkQuery);
        ManPrivQuery.Close;
        ManPrivQuery.Open;
    end;
end;

procedure TManPrivForm.ManPrivQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(ManPrivGrid);
    if ManPrivQuery.IsEmpty then DeleteButton.Enabled := False else DeleteButton.Enabled := True;
end;

procedure TManPrivForm.FormResize(Sender: TObject);
begin
    GridResize(ManPrivGrid);
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

end.
