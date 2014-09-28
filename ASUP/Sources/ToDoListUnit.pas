{-$Id: ToDoListUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Назначение задания работнику по приказу"       }
{    Ввод информации по заданию работнику                                      }
{    Ответственный: Кропов Валентин                                            }

unit ToDoListUnit;

interface

uses
    PersonalCommon, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Buttons, SpCommon, ComCtrls, Db, IBCustomDataSet, Variants, IBQuery, PCardsViewUnit;

type
    TToDoListForm = class(TForm)
        GroupBox1: TGroupBox;
        Label1: TLabel;
        FIOEdit: TEdit;
        SelectPersonButton: TSpeedButton;
        Label5: TLabel;
        Podrazd: TEdit;
        Label11: TLabel;
        Post: TEdit;
        SelectPodrazdAndPostButton: TButton;
        Label2: TLabel;
        Note: TEdit;
        Label3: TLabel;
        Label4: TLabel;
        ComplexMarkButton: TButton;
        ComplexMarkName: TLabel;
        ComplexMarkValue: TLabel;
        Label6: TLabel;
        DateBeg: TDateTimePicker;
        Label7: TLabel;
        PlanDateEnd: TDateTimePicker;
        InputQuery: TIBQuery;
        OutputQuery: TIBQuery;
        TempQuery: TIBQuery;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        InputQueryID_TODOLIST: TIntegerField;
        InputQueryID_ORDER: TIntegerField;
        InputQueryDATE_ORDER: TDateField;
        InputQueryNUM_ITEM: TIntegerField;
        InputQueryDATE_BEG: TDateField;
        InputQueryPLAN_DATE_END: TDateField;
        InputQueryID_COMPLEX_MARK: TIntegerField;
        InputQueryCOMPLEX_MARK_NAME: TIBStringField;
        InputQueryCOMPLEX_MARK_VALUE: TFloatField;
        InputQueryREAL_DATE_END: TDateField;
        InputQueryID_QUALITY_MARK: TIntegerField;
        InputQueryMARK_NAME: TIBStringField;
        InputQueryMARK_VALUE: TFloatField;
        InputQueryNOTE: TIBStringField;
        InputQueryID_MAN_MOVING: TIntegerField;
        InputQueryDEPARTMENT_NAME: TIBStringField;
        InputQueryPOST_NAME: TIBStringField;
        InputQueryID_SHTATRAS: TIntegerField;
        InputQueryID_PCARD: TIntegerField;
        InputQueryFIO: TIBStringField;
        procedure SelectPersonButtonClick(Sender: TObject);
        function PrepareForm: Boolean;
        function CheckInputData: Boolean;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
        procedure ComplexMarkButtonClick(Sender: TObject);
    private
        PCardsForm: TPCardsViewForm;

    public
        FMode: TEditMode;
        ID_ORDER: Integer;
        NUM_ITEM: Integer;
        ID_PCARD: Integer;
        ID_MAN_MOVING: Integer;
        ID_COMPLEX_MARK: Integer;
        ID_TODOLIST: Integer;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;
    end;

var
    ToDoListForm: TToDoListForm;

implementation
uses SpFormUnit;
{$R *.DFM}

function TToDoListForm.CheckInputData: Boolean;
begin

    CheckInputData := True;

    if ID_PCARD = -1 then begin
        MessageDlg('Потрібно вибрати фізичну особу!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;

    if Id_Man_Moving = -1 then begin
        MessageDlg('Потрібно вибрати підрозділ та посаду вибраного працівника!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;

    if Note.Text = '' then begin
        MessageDlg('Потрібно ввести завдання для працівника!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Note.SetFocus;
        Exit;
    end;

    if ID_COMPLEX_MARK = -1 then begin
        MessageDlg('Потрібно вибрати Оцінку складності та коефіцієнт складності!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        ComplexMarkButton.SetFocus;
        Exit;
    end;

    if PlanDateEnd.Date < DateBeg.Date then begin
        MessageDlg('Дата планованого кінця виконання робот не може бути раніше, ніж дата початку виконання робот!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        PlanDateEnd.SetFocus;
        Exit;
    end;
end;

function TToDoListForm.PrepareForm: Boolean;
begin
    result := True;

    Caption := 'Надання завдання працівнику';

    if Fmode = emNew then begin
        ID_PCARD := -1;
        ID_MAN_MOVING := -1;
        ID_COMPLEX_MARK := -1;
        ComplexMarkName.Caption := 'Не вибрано';
        ComplexMarkValue.Caption := 'Не вибрано';
        DateBeg.Date := Date;
        PlanDateEnd.Date := Date;
    end;

    if FMode = emView then begin
        Caption := Caption + ' (тільки перегляд)';
        CancelButton.Caption := 'Закрити';
        OkButton.Visible := False;
        CancelButton.Left := 224;
        GroupBox1.Enabled := False;
    end;

    if (FMode = emModify) or (FMode = emView) then begin
        InputQuery.Close;
        InputQuery.Params.ParamValues['ID_ORDER'] := Id_Order;
        InputQuery.Params.ParamValues['NUM_ITEM'] := NUM_ITEM;
        InputQuery.Open;

        if (InputQuery.IsEmpty) or (VarIsNull(InputQuery['ID_TODOLIST'])) then begin
            MessageDlg('Можливо хтось додав наказ, але ще на заповнив усю необхідну інформацію, зачекайте. Або у базі данних виникла помилка.', mtError, [mbOk], 0);
            result := false;
            Exit;
        end;

        ID_TODOLIST := InputQuery['ID_TODOLIST'];
        ID_PCARD := InputQuery['ID_PCARD'];
        ID_COMPLEX_MARK := InputQuery['ID_COMPLEX_MARK'];
        ID_MAN_MOVING := InputQuery['ID_MAN_MOVING'];
        FIOEdit.Text := InputQuery['FIO'];
        Podrazd.Text := InputQuery['DEPARTMENT_NAME'];
        Post.Text := InputQuery['POST_NAME'];
        Note.Text := InputQuery['NOTE'];
        DateBeg.Date := InputQuery['DATE_BEG'];
        PlanDateEnd.Date := InputQuery['PLAN_DATE_END'];
        ComplexMarkName.Caption := InputQuery['COMPLEX_MARK_NAME'];
        ComplexMarkValue.Caption := FloatToStr(InputQuery['COMPLEX_MARK_VALUE']);
    end;

end;


procedure TToDoListForm.SelectPersonButtonClick(Sender: TObject);
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

procedure TToDoListForm.FormCreate(Sender: TObject);

begin
    PCardsForm := TPCardsViewForm.Create(Self, True, False);
    PCardsForm.Select := True;
    TempQuery.Transaction := PersonalCommon.ReadTransaction;
    InputQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
end;

procedure TToDoListForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if formStyle = fsMDIChild then Action := caFree;
    PCardsForm.Free;
end;

procedure TToDoListForm.FormClick(Sender: TObject);
begin
    if Fmode = emView then MessageDlg('Ця інформація доступна тільки для перегляду!', mtError, [mbOk], 0);
end;

procedure TToDoListForm.OkButtonClick(Sender: TObject);
begin

    if not CheckInputData then begin
        ModalResult := mrNone;
        exit;
    end
    else begin
        if FMode = emNew then begin
            PersonalCommon.WriteTransaction.StartTransaction;

            try
                OutputQuery.Close;
                OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
                ID_ORDER := ExecQuery(OutputQuery);

                OutputQuery.Close;
                OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_TODOLIST_INSERT(' + IntToStr(ID_ORDER) + ',' + IntToStr(NUM_ITEM) + ',''' + DateToStr(DateBeg.Date) + ''',''' + DateToStr(PlanDateEnd.Date) + ''',' + IntToStr(ID_COMPLEX_MARK) + ',null,null,' + QuotedStr(Note.Text) + ',' + IntToStr(ID_MAN_MOVING) + ');';
                ExecQuery(OutputQuery);
            except
                PersonalCommon.WriteTransaction.Rollback;
                ModalResult := mrNone;
                MessageDlg('При занесенні данних у базу виникла помилка!', mtError, [mbOk], 0);
                exit;
            end;

            PersonalCommon.WriteTransaction.Commit;

        end;
        if FMode = emModify then begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_TODOLIST_UPDATE(' + IntToStr(ID_TODOLIST) + ',' + IntToStr(ID_ORDER) + ',' + IntToStr(NUM_ITEM) + ',''' + DateToStr(DateBeg.Date) + ''',''' + DateToStr(PlanDateEnd.Date) + ''',' + IntToStr(ID_COMPLEX_MARK) + ',null,null,' + QuotedStr(Note.Text) + ',' + IntToStr(ID_MAN_MOVING) + ');';
            ExecQuery(OutputQuery);
        end;
    end;

end;

procedure TToDoListForm.SelectPodrazdAndPostButtonClick(Sender: TObject);
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

procedure TToDoListForm.ComplexMarkButtonClick(Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin

    temp := TSpForm.Create(Self);
    params := TSpParams.Create;
    params.IdField := 'ID_COMPLEX_MARK';
    params.SpFields := 'COMPLEX_MARK_NAME, COMPLEX_MARK_VALUE';
    params.Title := 'Виберіть оцінку складності';
    params.ColumnNames := 'Назва оцінки, Коефіцієнт складності';
    params.ReadOnly := True;
    params.Table := 'INI_COMPLEX_MARK';
    params.SpMode := spmSelect;
    temp.Init(params);
    temp.ShowModal;
    if temp.ModalResult = mrOk then begin
        Id_COMPLEX_MARK := temp.ResultQuery['ID_COMPLEX_MARK'];
        ComplexMarkName.Caption := temp.ResultQuery['COMPLEX_MARK_NAME'];
        ComplexMarkValue.Caption := FloatToStr(temp.ResultQuery['COMPLEX_MARK_VALUE']);
    end;
    temp.free;

end;

end.
