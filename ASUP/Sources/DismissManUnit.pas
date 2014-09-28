{-$Id: DismissManUnit.pas,v 1.8 2009/12/01 08:38:15 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Увольнение работника по приказу"               }
{    Ввод информации по увольнению                                             }
{    Ответственный: Кропов Валентин                                            }

unit DismissManUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ComCtrls, StdCtrls, Buttons, SpComboBox, Db, IBCustomDataSet, IBQuery,
    SpCommon, DBCtrls, variants, Mask, CheckEditUnit;

type
    TDismissManForm = class(TForm)
        GroupBox1: TGroupBox;
        SelectPersonButton: TSpeedButton;
        Label1: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label11: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label6: TLabel;
        FIO: TEdit;
        DateEnd: TDateTimePicker;
        Podrazd: TEdit;
        Post: TEdit;
        SelectPodrazdAndPostButton: TButton;
        Prichina: TEdit;
        Profkom: TEdit;
        Osnovanye: TSpComboBox;
        InputQuery: TIBQuery;
        OutputQuery: TIBQuery;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        InputQuery2: TIBQuery;
        InputQuery2NAME_FULL: TIBStringField;
        InputQuery2NAME_POST: TIBStringField;
        Label7: TLabel;
        Label8: TLabel;
        WorkDateBeg: TLabel;
        WorkDateEnd: TLabel;
        EndLessLabel: TLabel;
        CheckForDismissionQuery: TIBQuery;
        CheckForDismissionQueryNUM_ORDER: TIBStringField;
        CheckForDismissionQueryDATE_ORDER: TDateField;
        CheckForDismissionQueryNAME_STATUS: TIBStringField;
        Label9: TLabel;
        Label12: TLabel;
        UnWorkedEdit: TCheckEdit;
        NotUsedEdit: TCheckEdit;
        Label10: TLabel;
        UderjDayEdit: TCheckEdit;
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
        procedure SelectPersonButtonClick(Sender: TObject);
        function PrepareForm: boolean;
        procedure OkButtonClick(Sender: TObject);
        procedure FormClick(Sender: TObject);
        function CheckMovingForDismiss(TEST_ID_MAN_MOVING: Integer): Boolean;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure DateEndChange(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
        FMode: TEditMode; //0 - new, 1 - Edit, 2 - View

        ID_ORDER: Integer;
        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

        NUM_ITEM: Integer;
    //
        ID_PCARD: Integer;
        ID_MAN_MOVING: Integer;
        ID_MAN_DISMISSION: Integer;
    end;

var
    DismissManForm: TDismissManForm;

implementation
uses PersonalCommon, GoodFunctionsUnit, SpFormUnit, qFTools;
{$R *.DFM}

// Функция, проверяющая: пытается ли кто-то уже удалить по данному мувингу человека или нет

function TDismissManForm.CheckMovingForDismiss(TEST_ID_MAN_MOVING: Integer): Boolean;
begin
    result := False;
    if TEST_ID_MAN_MOVING <> ID_MAN_MOVING then begin
        CheckForDismissionQuery.Close;
        CheckForDismissionQuery.Params.ParamValues['ID_MAN_MOVING'] := TEST_ID_MAN_MOVING;
        CheckForDismissionQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        CheckForDismissionQuery.Open;
        result := not CheckForDismissionQuery.IsEmpty;

        if result = True then begin
            ID_MAN_MOVING := -1;
            Podrazd.Text := '';
            Post.Text := '';
            WorkDateBeg.Caption := '';
            WorkDateEnd.Caption := '';
            EndLessLabel.Visible := False;
            MessageDlg('Цю людину вже хтось намагається звільнити (або вже звільнено) за наказом №' +
                CheckForDismissionQueryNUM_ORDER.Value + ' від ' +
                CheckForDismissionQueryDATE_ORDER.AsString + ', який має статус "' +
                CheckForDismissionQueryNAME_STATUS.Value + '"', mtError, [mbOk], 0);
        end;
    end;
end;

function TDismissManForm.PrepareForm: Boolean;
begin

    result := True;

    if Fmode = emNew then begin
        ID_PCARD := -1;
        ID_MAN_MOVING := -1;
        ID_MAN_DISMISSION := -1;
        Osnovanye.Prepare(-1, '');
        DateEnd.Date := Date;
        WorkDateBeg.Caption := '';
        WorkDateEnd.Caption := '';
        EndLessLabel.Visible := False;
        Caption := 'Форма звільнення людини (додавання)';
    end
    else begin
    //Общие для режимов 1 и 2
        if (FMode = emModify) or (FMode = emView) then begin
            InputQuery.Close;
            InputQuery.SQL.Text := 'SELECT * FROM GET_DISMISSION_INFO(' + IntToStr(ID_ORDER) + ',' + IntToStr(NUM_ITEM) + ');';
            InputQuery.Open;

            if (InputQuery.IsEmpty) or (VarIsNull(InputQuery['ID_MAN_DISMISSION'])) then begin
                MessageDlg('Можливо хтось додав наказ, але ще на заповнив усю необхідну інформацію, зачекайте. Або у базі данних виникла помилка.', mtError, [mbOk], 0);
                result := false;
                Exit;
            end;

            ID_MAN_DISMISSION := InputQuery['ID_MAN_DISMISSION'];
            ID_PCARD := InputQuery['ID_PCARD'];
            FIO.Text := InputQuery['FIO'];
            ID_MAN_MOVING := InputQuery['ID_MAN_MOVING'];
            Podrazd.Text := InputQuery['DEPARTMENT_NAME'];
            Post.Text := InputQuery['POST_NAME'];
            DateEnd.Date := InputQuery['DATE_DISMISSION'];
            Prichina.Text := InputQuery['DISMISSION_REASON'];
            Osnovanye.Prepare(InputQuery['ID_DISMISSION'], InputQuery['NAME_DISMISSION']);
            Profkom.Text := InputQuery['PROFKOM_AGREE'];
            WorkDateBeg.Caption := InputQuery['WORK_DATE_BEG'];
            WorkDateEnd.Caption := InputQuery['WORK_DATE_END'];

            UnWorkedEdit.Text := Coalesce(InputQuery['UnWork'], '');
            NotUsedEdit.Text := Coalesce(InputQuery['NotUsed'], '');
            UderjDayEdit.Text := Coalesce(InputQuery['Uderj_Day'], '');

            if WorkDateEnd.Caption <> DateToStr(PersonalCommon.Consts_Query['DATE_END'])
                then begin
                EndLessLabel.Visible := False;
                WorkDateEnd.Visible := True;
            end
            else begin
                WorkDateEnd.Visible := False;
                EndLessLabel.Visible := True;
            end;
        end;
        if FMode = emModify then begin
            Caption := 'Форма звільнення людини (редагування)';
      //SelectPersonButton.Enabled := False;
        end
        else
            if FMode = emView then begin
                Caption := 'Форма звільнення людини (перегляд)';
                GroupBox1.Enabled := False;
                OkButton.Visible := False;
                SelectPersonButton.Visible := False;
                CancelButton.Caption := 'Закрити';
                CancelButton.Left := 152;
            end;
    end;
end;

procedure TDismissManForm.SelectPodrazdAndPostButtonClick(Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin
    if ID_PCARD = -1 then MessageDlg('Потрібно спочатку вибрати звільняєму людину!', mtError, [mbOk], 0)
    else begin
        temp := TSpForm.Create(Self);
        params := TSpParams.Create;
        params.IdField := 'ID_MAN_MOVING';
        params.SpFields := 'NAME_DEPARTMENT_FULL, POST, DATE_BEG, DATE_END,ID_SHTATRAS, KOL_STAVOK';
        params.Title := 'Виберіть підрозділ та посаду, з яких треба звільнити людину';
        params.ColumnNames := 'Підрозділ,Посада, Дата початку,Дата кінця,-,-';
        params.ReadOnly := True;
        params.Table := 'GET_PCARD_MOVINGS(' + IntToStr(ID_PCARD) + ',''' + DateToStr(DateEnd.Date) + ''')';
        params.SpMode := spmSelect;
        temp.Init(params);
        temp.ShowModal;
        if temp.ModalResult = mrOk then begin
            if temp.ResultQuery['DATE_BEG'] = temp.ResultQuery['DATE_END'] then begin
                MessageDlg('Неможливо звілнити цю людину з цієї посади, бо вона принята на один день!', mtError, [mbOk], 0);
                exit;
            end;
            if CheckMovingForDismiss(temp.ResultQuery['ID_MAN_MOVING'])
                then exit;
            ID_MAN_MOVING := temp.ResultQuery['ID_MAN_MOVING'];
            Podrazd.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            Post.Text := temp.ResultQuery['POST'];
            WorkDateBeg.Caption := DateToStr(temp.ResultQuery['DATE_BEG']);
            WorkDateEnd.Caption := DateToStr(temp.ResultQuery['DATE_END']);
            if WorkDateEnd.Caption <> DateToStr(PersonalCommon.Consts_Query['DATE_END'])
                then begin
                EndLessLabel.Visible := False;
                WorkDateEnd.Visible := True;
            end
            else begin
                WorkDateEnd.Visible := False;
                EndLessLabel.Visible := True;
            end;
        end;
        temp.free;
    end;
end;

procedure TDismissManForm.SelectPersonButtonClick(Sender: TObject);
var
    new_id_pcard: integer;
begin

    new_id_pcard := getpcard(DateEnd.Date);

    if new_id_pcard <> -1 then begin
    // Проверяем есть ли для текущего человека хотя бы одна запись в Man_Moving
        InputQuery.Close;
        InputQuery.SQL.Text := 'SELECT Rmoving, DATE_BEG, DATE_END, ID_MAN_MOVING, ID_SHTATRAS FROM GET_CUR_MOVING_BY_ID_PCARD(' + IntToStr(new_Id_PCard) + ',' + QuotedStr(DateToStr(DateEnd.Date)) + ')';
        try
        InputQuery.Open;
        except
        on E:Exception do
            begin
            ShowMessage(E.Message);
            Exit;
            end
        end;
        if not InputQuery.IsEmpty then begin
      // Если мы выбрали другого человека, то нужно обнулить мувинг, если тот выбран
            if (ID_PCARD <> -1) and (ID_PCARD <> new_id_pcard) then begin
                ID_MAN_MOVING := -1;
                Podrazd.Text := '';
                Post.Text := '';
                SelectPodrazdAndPostButton.Enabled := True;
            end;

            ID_PCARD := new_id_pcard;
            FIO.Text := GoodFunctionsUnit.Fam;

      // Проверяем, если эта запись одна, то сразу проставляем отдел и должность человека и дисейблим кнопку выбора жтих штук
            InputQuery.FetchAll;
            if InputQuery.RecordCount = 1 then begin
                if InputQuery['DATE_BEG'] = InputQuery['DATE_END'] then begin
                    FIO.Text := '';
                    ID_PCARD := -1;
                    ID_MAN_MOVING := -1;
                    Podrazd.Text := '';
                    Post.Text := '';
                    WorkDateBeg.Caption := '';
                    WorkDateEnd.Caption := '';
                    EndLessLabel.visible := False;
                    MessageDlg('Неможливо звілнити цю людину з цієї посади, бо вона принята на один день!', mtError, [mbOk], 0);
                    exit;
                end;

                if CheckMovingForDismiss(InputQuery['ID_MAN_MOVING'])
                    then exit;

                SelectPodrazdAndPostButton.Enabled := False;
                ID_MAN_MOVING := InputQuery['ID_MAN_MOVING'];
                InputQuery2.Close;
                InputQuery2.SQL.Text := 'SELECT NAME_FULL, NAME_POST ' +
                    'FROM   DT_SHTATRAS S, SP_DEPARTMENT D, SP_POST P ' +
                    'WHERE  S.Id_Shtatras = ' + IntToStr(InputQuery['ID_SHTATRAS']) +
                    'AND    S.Id_Department = D.Id_Department ' +
                    'and    s.Id_Post = p.Id_Post ' +
                    'and    (CURRENT_TIMESTAMP between s.Use_Beg and s.Use_End) ' +
                    'and    (CURRENT_TIMESTAMP between d.Use_Beg and d.Use_End)';
                InputQuery2.Open;

                Podrazd.Text := InputQuery2NAME_FULL.Value;
                Post.Text := InputQuery2NAME_POST.Value;

                WorkDateBeg.Caption := DateToStr(GetDateBegByRMoving(InputQuery['Rmoving']));
                WorkDateEnd.Caption := DateToStr(InputQuery['DATE_END']);

                if WorkDateEnd.Caption <> DateToStr(PersonalCommon.Consts_Query['DATE_END'])
                    then begin
                    EndLessLabel.Visible := False;
                    WorkDateEnd.Visible := True;
                end
                else begin
                    WorkDateEnd.Visible := False;
                    EndLessLabel.Visible := True;
                end;

            end;
        end else MessageDlg('Неможливо звільнити вибраного робітника, бо він ніде не працює', mtError, [mbOk], 0);
    end;

end;

procedure TDismissManForm.OkButtonClick(Sender: TObject);
begin

    if UnWorkedEdit.Text = ''
        then UnWorkedEdit.Text := '0';

    if NotUsedEdit.Text = ''
        then NotUsedEdit.Text := '0';

    if UderjDayEdit.Text = ''
        then UderjDayEdit.Text := '0';

    if ID_PCARD = -1 then begin
        MessageDlg('Виберіть людину, яку треба звільнити!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;
    if ID_MAN_MOVING = -1 then begin
        MessageDlg('Виберіть підрозділ, на якому працює людина!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;
{  if DateToStr(DateEnd.Date) = WorkDateBeg.Caption then begin
    MessageDlg('Неможна звільнити людину у той же день, коли його було прийнято!', mtError, [mbOk], 0);
    ModalResult := mrNone;
    DateEnd.SetFocus;
    exit;
  end;
}

{  if (DateEnd.Date <= StrToDate(WorkDateBeg.Caption)) or (DateEnd.Date > StrToDate(WorkDateEnd.Caption)) then begin
    if StrToDate(WorkDateBeg.Caption)+1 <> StrToDate(WorkDateEnd.Caption)
      then begin
        if EndLessLabel.Visible = False
          then MessageDlg('Дата звільнення повинна бути між "' + DateToStr(StrToDate(WorkDateBeg.Caption)+1) + '" та "' + WorkDateEnd.Caption + '"!',mtError,[mbOk],0)
          else MessageDlg('Дата звільнення повинна бути більше "' + DateToStr(StrToDate(WorkDateBeg.Caption)) + '"!',mtError,[mbOk],0)
      end
      else MessageDlg('Дата звільнення може бути тільки "' + WorkDateEnd.Caption + '"!',mtError,[mbOk],0);
    ModalResult := mrNone;
    DateEnd.SetFocus;
    exit;
  end; }
    if Osnovanye.GetId = -1 then begin
        MessageDlg('Виберіть підставу для звільнення людини!', mtError, [mbOK], 0);
        ModalResult := mrNone;
        Exit;
    end;
    if Prichina.Text = '' then begin
        MessageDlg('Потрібно ввести причину для звільнення людини!', mtError, [mbOK], 0);
        ModalResult := mrNone;
        Exit;
    end;
    if Profkom.Text = '' then begin
        MessageDlg('Потрібно ввести номер та дату постанови профкому!', mtError, [mbOK], 0);
        ModalResult := mrNone;
        Exit;
    end;

  // Пишем данные
    PersonalCommon.WriteTransaction.StartTransaction;

    try
        OutputQuery.Close;

        if Fmode = emNew then begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            ID_ORDER := ExecQuery(OutputQuery);
        end;

        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DISMISS_MAN(' + IntToStr(ID_MAN_DISMISSION) + ',' +
            IntToStr(ID_MAN_MOVING) + ',''' +
            DateToStr(DateEnd.Date) + ''',' +
            IntToStr(Osnovanye.GetId) + ',' +
            QuotedStr(Prichina.Text) + ',' +
            QuotedStr(Profkom.Text) + ',' +
            IntToStr(ID_ORDER) + ',' +
            IntToStr(NUM_ITEM) + ',' +
            UnWorkedEdit.Text + ',' +
            NotUsedEdit.Text + ',' +
            UderjDayEdit.Text + ');';
        ExecQuery(OutputQuery);

    except on e: Exception do
        begin
            PersonalCommon.WriteTransaction.Rollback;
            ModalResult := mrNone;
            MessageDlg('При занесенні данних у базу виникла помилка: ' + e.mEssage, mtError, [mbOk], 0);
            exit;
        end
    end;

    PersonalCommon.WriteTransaction.Commit;

end;

procedure TDismissManForm.FormClick(Sender: TObject);
begin
    if FMode = emView then MessageDlg('Ця інформація доступна тільки для перегляду', mtError, [mbOK], 0);
end;

procedure TDismissManForm.FormCreate(Sender: TObject);
begin
    InputQuery.Transaction := PersonalCommon.ReadTransaction;
    InputQuery2.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    CheckForDismissionQuery.Transaction := PersonalCommon.ReadTransaction;
end;

procedure TDismissManForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    Osnovanye.SaveIntoRegistry;
    if FormStyle = fsMDIChild then Close;
end;

procedure TDismissManForm.DateEndChange(Sender: TObject);
begin
    FIO.Text := '';
    ID_PCARD := -1;
    ID_MAN_MOVING := -1;
    Podrazd.Text := '';
    Post.Text := '';
    WorkDateBeg.Caption := '';
    WorkDateEnd.Caption := '';
    EndLessLabel.visible := False;
end;

end.
