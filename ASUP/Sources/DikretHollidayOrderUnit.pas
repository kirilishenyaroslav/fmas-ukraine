unit DikretHollidayOrderUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ComCtrls, DB, IBCustomDataSet, IBQuery,
    PersonalCommon, SpCommon, ExtCtrls, SpComboBox, uFControl,
    uLabeledFControl, uCharControl;

type
    TDikretHollidayOrderForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        OutputQuery: TIBQuery;
        Panel1: TPanel;
        Label1: TLabel;
        SelectPersonButton: TSpeedButton;
        Label5: TLabel;
        Label11: TLabel;
        Label7: TLabel;
        WorkDateBeg: TLabel;
        Label8: TLabel;
        Label17: TLabel;
        Label2: TLabel;
        FIO: TEdit;
        NameDepartment: TEdit;
        SelectPodrazdAndPostButton: TButton;
        NamePost: TEdit;
        DateBeg: TDateTimePicker;
        DateEnd: TDateTimePicker;
        InputQuery: TIBQuery;
        InputQueryFIO: TIBStringField;
        InputQueryTN: TIntegerField;
        InputQueryDEPARTMENT_NAME: TIBStringField;
        InputQueryPOST: TIBStringField;
        InputQueryKOL_STAVOK: TIBBCDField;
        InputQueryWORKCOND_NAME: TIBStringField;
        InputQueryPERIOD_BEG: TDateField;
        InputQueryPERIOD_END: TDateField;
        InputQueryHOLIDAY_BEG: TDateField;
        InputQueryHOLIDAY_END: TDateField;
        InputQueryPERIOD_DAYS: TIntegerField;
        InputQueryHOLIDAY_DAYS: TIntegerField;
        InputQueryDIGIT: TIntegerField;
        InputQueryNAME_CATEGORY: TIBStringField;
        InputQueryNAME_TAR_NET: TIBStringField;
        InputQueryMONEY: TIBBCDField;
        InputQueryID_MAN_MOV: TIntegerField;
        InputQueryID_PCARD: TIntegerField;
        InputQueryMOV_BEG: TDateField;
        InputQueryMOV_END: TDateField;
        InputQuery2: TIBQuery;
        EndLessLabel: TLabel;
        WorkDateEnd: TLabel;
        InputQueryIDHOLIDAYGR: TIntegerField;
        VoplComboBox: TSpComboBox;
        Label3: TLabel;
        GetDekrVopl: TIBQuery;
        GetDekrVoplID_VIDOPL: TIntegerField;
        GetDekrVoplNAME_VIDOPL: TIBStringField;
        InputQueryID_VIDOPL: TIntegerField;
        InputQueryNAME_VIDOPL: TIBStringField;
        Reason: TqFCharControl;
    InputQueryHOL_1_SUM: TIntegerField;
    InputQueryHOL_2_SUM: TIntegerField;
    InputQueryHOL_3_SUM: TIntegerField;
    InputQueryHOL_4_SUM: TIntegerField;
    InputQueryHOL_5_SUM: TIntegerField;
    InputQueryYEAR_1: TIntegerField;
    InputQueryYEAR_2: TIntegerField;
    InputQueryYEAR_3: TIntegerField;
    InputQueryYEAR_4: TIntegerField;
    InputQueryYEAR_5: TIntegerField;
    InputQueryDATE_BEG_1: TDateField;
    InputQueryDATE_BEG_2: TDateField;
    InputQueryDATE_BEG_3: TDateField;
    InputQueryDATE_BEG_4: TDateField;
    InputQueryDATE_BEG_5: TDateField;
    InputQueryDATE_END_1: TDateField;
    InputQueryDATE_END_2: TDateField;
    InputQueryDATE_END_3: TDateField;
    InputQueryDATE_END_4: TDateField;
    InputQueryDATE_END_5: TDateField;
    InputQueryMAIN_PERIOD_BEG: TDateField;
    InputQueryMAIN_PERIOD_END: TDateField;
    InputQueryMAIN_HOLIDAY_BEG: TDateField;
    InputQueryMAIN_HOLIDAY_END: TDateField;
    InputQueryMAIN_HOLIDAY_DAYS: TIntegerField;
    InputQuerySUM_1: TIntegerField;
    InputQuerySUM_2: TIntegerField;
    InputQuerySUM_3: TIntegerField;
    InputQuerySUM_4: TIntegerField;
    InputQuerySUM_5: TIntegerField;
    InputQueryHOL_SUM: TIntegerField;
    InputQueryREASON: TIBStringField;
        procedure FormCreate(Sender: TObject);
        function Prepare: Boolean;
        procedure FormClick(Sender: TObject);
        procedure SelectPersonButtonClick(Sender: TObject);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    //In
        FMode: TEditMode;
        ID_ORDER: Integer;
        NUM_ITEM: Integer;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;
    //Out
        Id_Holiday_Group: Integer;
        ID_PCARD: Integer;
        ID_MAN_MOVING: Integer;
    end;

var
    DikretHollidayOrderForm: TDikretHollidayOrderForm;

implementation

uses PCardsViewUnit, SpFormUnit, GoodFunctionsUnit;

{$R *.dfm}

function TDikretHollidayOrderForm.Prepare: Boolean;
begin
    Result := True;

    if FMode = emNew
        then begin
        Caption := Caption + ' (додавання)';

        ID_ORDER := -1;
        ID_PCARD := -1;
        ID_MAN_MOVING := -1;
        Id_Holiday_Group := -1;

        DateBeg.Date := Date;
        DateEnd.Date := Date + 365 * 2;

        WorkDateBeg.Caption := '';
        WorkDateEnd.Caption := '';
        EndLessLabel.Visible := False;

        GetDekrVopl.Close;
        GetDekrVopl.Open;
        VoplComboBox.Prepare(GetDekrVoplID_VIDOPL.Value, GetDekrVoplNAME_VIDOPL.Value);
        GetDekrVopl.Close;
    end;

    if (FMode = emModify) or (FMode = emView)
        then begin
        InputQuery.Close;
        InputQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        InputQuery.Params.ParamValues['NUM_ITEM'] := NUM_ITEM;
        InputQuery.Open;

        if (InputQuery.IsEmpty) then begin
            MessageDlg('Можливо хтось додав наказ, але ще на заповнив усю необхідну інформацію, зачекайте. Або у базі данних виникла помилка.', mtError, [mbOk], 0);
            result := false;
            Exit;
        end;

        ID_PCARD := InputQueryID_PCARD.Value;
        ID_MAN_MOVING := InputQueryID_MAN_MOV.Value;
        Id_Holiday_Group := InputQueryIDHOLIDAYGR.Value;

        Fio.Text := InputQueryFIO.Value;
        NameDepartment.Text := InputQueryDEPARTMENT_NAME.Value;
        NamePost.Text := InputQueryPOST.Value;
        WorkDateBeg.Caption := DateToStr(InputQueryMOV_BEG.Value);
        WorkDateEnd.Caption := DateToStr(InputQueryMOV_END.Value);
        DateBeg.Date := InputQueryHOLIDAY_BEG.Value;
        DateEnd.Date := InputQueryHOLIDAY_END.Value;
        VoplComboBox.Prepare(InputQueryID_VIDOPL.Value, InputQueryNAME_VIDOPL.Value);

        Reason.Value := InputQuery['Reason'];
    end;

    if FMode = emModify
        then begin
        Caption := Caption + ' (редагування)';
    end;

    if FMode = emView
        then begin
        Caption := Caption + ' (перегляд)';
        Panel1.Enabled := False;
        CancelButton.Visible := False;
        OkButton.Left := 184;
    end;
end;

procedure TDikretHollidayOrderForm.FormCreate(Sender: TObject);
begin
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    InputQuery.Transaction := PersonalCommon.ReadTransaction;
    InputQuery2.Transaction := PersonalCommon.ReadTransaction;
    GetDekrVopl.Transaction := PersonalCommon.ReadTransaction;
end;

procedure TDikretHollidayOrderForm.FormClick(Sender: TObject);
begin
    if FMode = emView then MessageDlg('Ця інформація доступна тільки для перегляду!', mtError, [mbOk], 0);
end;

procedure TDikretHollidayOrderForm.SelectPersonButtonClick(
    Sender: TObject);
var
    temp: TPCardsViewForm;
    ID_SHTATRAS: Integer;

begin
    temp := TPCardsViewForm.Create(Self, True, False, Date);
    temp.Select := True;
    temp.ShowModal;

    if temp.ModalResult = mrOk then begin
    // Если мы выбрали другого человека, то нужно обнулить мувинг, если тот выбран
        if (ID_PCARD <> -1) and (ID_PCARD <> temp.ResultQueryID_PCARD.Value) then begin
            ID_MAN_MOVING := -1;
            NameDepartment.Text := '';
            NamePost.Text := '';
            SelectPodrazdAndPostButton.Enabled := True;
        end;
    // Проыеряем есть ли для текущего человека хотя бы одна запись в Man_Moving
        InputQuery2.Close;
        InputQuery2.SQL.Text := 'SELECT DATE_BEG, DATE_END, ID_MAN_MOVING, ID_SHTATRAS  FROM GET_CUR_MOVING( ''' + DateToStr(Date) + ''') GCM WHERE GCM.ID_PCARD = ' + IntToStr(temp.ResultQueryID_PCARD.Value);
        InputQuery2.Open;

        if not InputQuery2.IsEmpty then
        begin
            ID_PCARD := temp.ResultQueryID_PCARD.Value;
            FIO.Text := temp.ResultQuery['FAMILIA'] + ' ' + temp.ResultQuery['IMYA'] + ' ' + temp.ResultQuery['OTCHESTVO'];
            Reason.Value := 'заява ' + temp.ResultQuery['FAMILIA'] + ' ' +
                Copy(temp.ResultQuery['IMYA'], 1, 1) + '.' +
                Copy(temp.ResultQuery['OTCHESTVO'], 1, 1);

      // Проверяем, если эта запись одна, то сразу проставляем отдел и должность человека и дисейблим кнопку выбора жтих штук
            InputQuery2.FetchAll;
            if InputQuery2.RecordCount = 1 then begin

                WorkDateBeg.Caption := DateToStr(InputQuery2['DATE_BEG']);
                WorkDateEnd.Caption := DateToStr(InputQuery2['DATE_END']);

                if WorkDateEnd.Caption <> DateToStr(PersonalCommon.Consts_Query['DATE_END'])
                    then begin
                    EndLessLabel.Visible := False;
                    WorkDateEnd.Visible := True;
                end
                else begin
                    WorkDateEnd.Visible := False;
                    EndLessLabel.Visible := True;
                end;

                SelectPodrazdAndPostButton.Enabled := False;
                ID_MAN_MOVING := InputQuery2['ID_MAN_MOVING'];
                ID_SHTATRAS := InputQuery2['ID_SHTATRAS'];

                InputQuery2.Close;
                InputQuery2.SQL.Text := 'SELECT DEPARTMENT_FULL, NAME_POST FROM GET_SHTATRAS_INFO(' + IntToStr(ID_SHTATRAS) + ',''' + DateToStr(Date) + ''');';
                InputQuery2.Open;
                NameDepartment.Text := InputQuery2['DEPARTMENT_FULL'];
                NamePost.Text := InputQuery2['NAME_POST'];
            end;
        end else MessageDlg('Вибрана людина ніде не працює', mtError, [mbOk], 0);
    end;
    temp.Free;
end;

procedure TDikretHollidayOrderForm.SelectPodrazdAndPostButtonClick(
    Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin
    if ID_PCARD = -1 then MessageDlg('Потрібно спочатку вибрати людину!', mtError, [mbOk], 0)
    else begin
        temp := TSpForm.Create(Self);
        params := TSpParams.Create;
        params.IdField := 'ID_MAN_MOVING';
        params.SpFields := 'NAME_DEPARTMENT_FULL, POST, DATE_BEG, DATE_END';
        params.Title := 'Виберіть підрозділ та посаду';
        params.ColumnNames := 'Підрозділ,Посада, Дата початку,Дата кінця';
        params.ReadOnly := True;
        params.Table := 'GET_PCARD_MOVINGS(' + IntToStr(ID_PCARD) + ',''' + DateToStr(Date) + ''')';
        params.SpMode := spmSelect;
        temp.Init(params);
        temp.ShowModal;

        if temp.ModalResult = mrOk then begin
            ID_MAN_MOVING := temp.ResultQuery['ID_MAN_MOVING'];
            NameDepartment.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            NamePost.Text := temp.ResultQuery['POST'];
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

procedure TDikretHollidayOrderForm.OkButtonClick(Sender: TObject);
begin
    if FMode = emView then
        exit;

    if ID_PCARD = -1 then begin
        MessageDlg('Виберіть людину!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if ID_MAN_MOVING = -1 then begin
        MessageDlg('Виберіть підрозділ, на якому працює людина!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if VoplComboBox.GetId = -1 then begin
        MessageDlg('Виберіть вид оплати!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if DateBeg.Date > DateEnd.Date then begin
        MessageDlg('Дата початку відпустки повинна бути раніше, ніж дата кінця відпустки!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if FMode = emNew then begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';

            ID_ORDER := ExecQuery(OutputQuery);

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_HOLIDAY_GROUP_INSERT_2(' + QuotedStr(DateToStr(DateBeg.Date)) + ','
                + QuotedStr(DateToStr(DateEnd.Date)) + ','
                + QuotedStr(DateToStr(DateBeg.Date)) + ','
                + QuotedStr(DateToStr(DateEnd.Date)) + ','
                + IntToStr(Trunc(DateEnd.Date - DateBeg.Date)) + ','
                + '0' + ','
                + IntToStr(VoplComboBox.GetId) + ','
                + IntToStr(ID_MAN_MOVING) + ','
                + IntToStr(ID_ORDER) + ','
                + IntToStr(NUM_ITEM) + ','
                + QuotedStr(Reason.Value)
                + ')';
            ExecQuery(OutputQuery);
        except on E: Exception
            do begin
                PersonalCommon.WriteTransaction.Rollback;
                ModalResult := mrNone;
                MessageDlg('При занесенні данних у базу виникла помилка: ' + E.Message, mtError, [mbOk], 0);
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;
    end;

    if FMode = emModify then begin
        try
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_HOLIDAY_GROUP_UPDATE_2(' + QuotedStr(DateToStr(DateBeg.Date)) + ','
                + QuotedStr(DateToStr(DateEnd.Date)) + ','
                + QuotedStr(DateToStr(DateBeg.Date)) + ','
                + QuotedStr(DateToStr(DateEnd.Date)) + ','
                + IntToStr(Trunc(DateEnd.Date - DateBeg.Date)) + ','
                + '0' + ','
                + IntToStr(ID_MAN_MOVING) + ','
                + IntToStr(ID_ORDER) + ','
                + IntToStr(NUM_ITEM) + ','
                + IntToStr(Id_Holiday_Group) + ',' +
                IntToStr(VoplComboBox.GetId) + ',' +
                QuotedStr(Reason.Value) + ')';
            ExecQuery(OutputQuery);
        except on E: exception
            do begin
                ErrMsg(E.message);
                ModalResult := mrNone;
                Exit;
            end;
        end;
    end;
end;

end.

