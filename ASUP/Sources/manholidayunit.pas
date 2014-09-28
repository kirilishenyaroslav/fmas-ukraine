unit ManHolidayUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery, PersonalCommon,
    SpCommon, SpFormUnit, Grids, DBGrids, GoodFunctionsUnit, uFControl,
    uLabeledFControl, uSpravControl, FIBDataSet, pFIBDataSet, qFTools,
    uSelectForm, uCharControl, uBoolControl, uIntControl, FIBQuery,
    pFIBQuery;

type
    TManHolidayForm = class(TForm)
        TopPanel: TPanel;
        Label1: TLabel;
        FIO: TEdit;
        SelectPersonButton: TSpeedButton;
        ButtonsPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        HolidayGrid: TDBGrid;
        ResultQuery: TIBQuery;
        ResultSource: TDataSource;
        OutputQuery: TIBQuery;
        ResultQueryID_MAN_HOLIDAY: TIntegerField;
        ResultQueryID_HOLIDAY: TIntegerField;
        ResultQueryPERIOD_BEG: TDateField;
        ResultQueryPERIOD_END: TDateField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryH_TERM: TIntegerField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryNAME_HOLIDAY: TIBStringField;
        ResultQuery2: TIBQuery;
        DoButton: TBitBtn;
        CancelButton: TBitBtn;
        WorkPlace: TqFSpravControl;
        SelectCurWorkPlace: TpFIBDataSet;
        SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
        SelectCurWorkPlaceNAME_POST: TFIBStringField;
        SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
        SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
        SelectCurWorkPlaceDATE_BEG: TFIBDateField;
        SelectCurWorkPlaceDATE_END: TFIBDateField;
        SelectCurWorkPlaceREAL_DATE_END: TFIBDateField;
        Reason: TqFCharControl;
        ResultQueryDONT_CALC_HOLIDAYS: TIBStringField;
        MatPom: TqFBoolControl;
        PercentMat: TqFIntControl;
        MatPomQuery: TpFIBQuery;
        ResultQuery2ID_MAN_MOVING: TIntegerField;
        ResultQuery2ID_PCARD: TIntegerField;
        ResultQuery2DEPARTMENT_NAME: TIBStringField;
        ResultQuery2POST_NAME: TIBStringField;
        ResultQuery2FIO: TIBStringField;
        ResultQuery2REASON: TIBStringField;
        ResultQuery2USE_MAT_POM: TIntegerField;
        ResultQuery2PERCENT: TIBBCDField;
        procedure SelectPersonButtonClick(Sender: TObject);
        procedure Prepare;
        procedure DoButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ResultQueryAfterOpen(DataSet: TDataSet);
        procedure FormResize(Sender: TObject);
        procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure MatPomChange(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
        procedure WriteMatPomInfo;
    public
    //In
        FMode: TEditMode;
        ID_ORDER: Integer;
        NUM_ITEM: Integer;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

    // out
        ID_PCARD: Integer;
        ID_MAN_MOVING: Integer;
    end;

var
    ManHolidayForm: TManHolidayForm;

implementation

uses AddManHolidayUnit, Math;
{$R *.dfm}

procedure TManHolidayForm.Prepare;
begin
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery2.Transaction := PersonalCommon.ReadTransaction;

    SelectCurWorkPlace.Transaction := FIBReadTransaction;


    if FMode = emNew then
    begin
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

        ID_PCARD := -1;
        ID_MAN_MOVING := -1;
        PercentMat.Visible := False;
    end;

    if (FMode = emView) or (FMode = emModify)
        then begin

        ResultQuery2.Close;
        ResultQuery2.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        ResultQuery2.Open;

        if ResultQuery2.IsEmpty
            then begin
            ID_PCARD := -1;
            ID_MAN_MOVING := -1;
            WorkPlace.Value := -1;
        end
        else begin
            ID_PCARD := ResultQuery2ID_PCARD.Value;
            ID_MAN_MOVING := ResultQuery2ID_MAN_MOVING.Value;
            WorkPlace.DisplayText := ResultQuery2POST_NAME.Value + '(' + ResultQuery2DEPARTMENT_NAME.Value + ')';
            FIO.Text := ResultQuery2FIO.Value;
            Reason.Value := ResultQuery2REASON.Value;
        end;
        if ResultQuery2['Use_Mat_Pom'] = 1 then
        begin
            MatPom.Value := True;
            PercentMat.Visible := True;
            PercentMat.Value := ResultQuery2['Percent'];
        end
        else
        begin
            MatPom.Value := False;
            PercentMat.Visible := False;
        end;
    end;

    if FMode = emView
        then begin
        ButtonsPanel.Visible := False;
        TopPanel.Enabled := False;
        DoButton.Visible := False;

        Caption := 'Перегляд відпусток за наказом №' + NUM_ORDER + ' від "' + DateToStr(ORDER_DATE) + '"';
    end;

    ResultQuery.Close;
    ResultQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    ResultQuery.Open;
end;

procedure TManHolidayForm.SelectPersonButtonClick(Sender: TObject);
var

    new_id_pcard: Integer;
begin

    new_id_pcard := GoodfunctionsUnit.getpcard(Order_DAte);

    if new_id_pcard <> -1 then begin

            // Если мы выбрали другого человека, то нужно обнулить мувинг, если тот выбран
        if (ID_PCARD <> -1) and (ID_PCARD <> new_id_pcard) then begin
            ID_MAN_MOVING := -1;
            WorkPlace.DisplayText := '';
            WorkPlace.Value := -1;
        end;

            // Проыеряем есть ли для текущего человека хотя бы одна запись в Man_Moving
        SelectCurWorkPlace.Close;
        SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := Order_Date;
        SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := new_Id_Pcard;
        SelectCurWorkPlace.Open;
        SelectCurWorkPlace.FetchAll;

        if not SelectCurWorkPlace.IsEmpty then begin
            ID_PCARD := new_id_pcard;
            FIO.Text := GoodFunctionsUnit.Fam;
            Reason.Value := 'Заява ' + GoodFunctionsUnit.pcardform.ResultQueryFIO.Value;

            if SelectCurWorkPlace.RecordCount = 1 then begin
                WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
                Id_Man_Moving := SelectCurWorkPlaceID_MAN_MOVING.Value;
                WorkPlace.DisplayText := SelectCurWorkPlaceNAME_POST.Value + ' (' + SelectCurWorkPlaceNAME_DEPARTMENT.Value + ')';
            end;

        end else
            MessageDlg('Вибрана людина ніде не працює', mtError, [mbOk], 0);
    end;
end;

procedure TManHolidayForm.DoButtonClick(Sender: TObject);
begin
    if (ID_PCARD = -1) or (ID_MAN_MOVING = -1) then begin
        MessageDlg('Потрібно вибрати працівника та місце його роботи!', mtError, [mbOk], 0);
        exit;
    end;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE MAN_HOLIDAY_UPDATE_HEADER(' +
        IntToStr(ID_ORDER) + ',' +
        IntToStr(ID_MAN_MOVING) + ',' +
        QuotedStr(Reason.Value) + ')';
    ExecQuery(OutputQuery);

    ResultQuery.Close;
    ResultQuery.Open;

    WriteMatPomInfo;
end;

procedure TManHolidayForm.AddButtonClick(Sender: TObject);
var
    Form: TAddManHolidayForm;
begin
    if (ID_PCARD = -1) or (ID_MAN_MOVING = -1) then begin
        MessageDlg('Потрібно вибрати працівниката місце його роботи!', mtError, [mbOk], 0);
        exit;
    end;

    Form := TAddManHolidayForm.Create(self, -1, Id_Man_Moving, Id_Order);
    Form.Reason := Reason.Value;

    if not ResultQuery.IsEmpty then begin
        ResultQuery.Last;
        Form.DateBeg.Date := ResultQueryDATE_END.Value + 1;
        //Form.DateBeg.Enabled := False;

        Form.PeriodDateBeg.Date := ResultQueryPERIOD_BEG.Value;
        Form.PeriodDateEnd.Date := ResultQueryPERIOD_End.Value;

        //Form.PeriodDateBeg.Enabled := False;
        //Form.PeriodDateEnd.Enabled := False;


        Form.ID_HOLIDAY := 212;
        Form.HolidayEdit.Text := 'Додаткова відпуска за работу із шкідливими та важкими умовами праці';

        Form.TermEdit.Text := '4';

        Form.SpeedButton1.Click;
    end
    else begin
        Form.ID_HOLIDAY := 112;
        Form.HolidayEdit.Text := 'Основна відпустка';

        Form.TermEdit.text := '24';
        Form.SpeedButton1.Click;
    end;

    Form.DontCalcHolidays := 'T';

    if Form.ShowModal = mrOk then begin
        ResultQuery.close;
        ResultQuery.open;
    end;

    Form.free;
end;

procedure TManHolidayForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddManHolidayForm;
begin
    if ResultQuery.IsEmpty then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    Form := TAddManHolidayForm.Create(self, ResultQueryID_MAN_HOLIDAY.Value, Id_Man_Moving, Id_Order);
    Form.Reason := Reason.Value;

    if ResultQuery.RecNo <> 1 then begin
        //Form.DateBeg.Enabled := False;
        //Form.PeriodDateBeg.Enabled := False;
        //Form.PeriodDateEnd.Enabled := False;
    end;

    Form.DontCalcHolidays := ResultQueryDONT_CALC_HOLIDAYS.Value;

    if Form.ShowModal = mrOk then begin
        ResultQuery.close;
        ResultQuery.open;
    end;

    Form.free;
end;

procedure TManHolidayForm.DeleteButtonClick(Sender: TObject);
begin
    if ResultQuery.IsEmpty then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    if MessageDlg('Чи справді ви бажаєте вилучити цей запис?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE MAN_HOLIDAY_DELETE(' + IntToStr(ResultQueryID_MAN_HOLIDAY.value) + ')';
    ExecQuery(OutputQuery);

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TManHolidayForm.ResultQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(HolidayGrid);
end;

procedure TManHolidayForm.FormResize(Sender: TObject);
begin
    GridResize(HolidayGrid);
end;

procedure TManHolidayForm.WorkPlaceOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if ID_PCARD = -1 then begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;

    if qSelect(SelectCurWorkPlace) then
    begin
        Value := SelectCurWorkPlace['ID_MAN_MOVING'];
        Id_Man_Moving := SelectCurWorkPlace['ID_MAN_MOVING'];
        DisplayText := SelectCurWorkPlace['NAME_POST'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
    end;
end;

procedure TManHolidayForm.MatPomChange(Sender: TObject);
begin
    PercentMat.Visible := MatPom.Value;
end;

procedure TManHolidayForm.WriteMatPomInfo;
begin
        // запись информации о матпомощи
    MatPomQuery.Transaction := PersonalCommon.FIBWriteTransaction;
    MatPomQuery.Transaction.StartTransaction;
    MatPomQuery.ParamByName('Id_Order').AsInteger := ID_ORDER;
    if MatPom.Value then
        MatPomQuery.ParamByName('Use_Mat_Pom').AsInteger := 1
    else MatPomQuery.ParamByName('Use_Mat_Pom').AsInteger := 0;
    MatPomQuery.ParamByName('Percent').AsVariant := PercentMat.Value;
    MatPomQuery.ExecQuery;
    MatPomQuery.Transaction.Commit;
end;

procedure TManHolidayForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FMode <> emNew then
    begin
        WriteMatPomInfo;
    end;
end;

end.

