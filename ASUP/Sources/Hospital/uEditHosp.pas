
{ -$Id: uEditHosp.pas,v 1.7 2008/10/10 10:07:17 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Больничные листы"                              }
{    Отображение, редактирование и добавлении информации по больничному листу. }
{    Ответственный:Данил Збуривский.                                           }

unit uEditHosp;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, ComCtrls,
    Halcn6db, Buffer, Grids, ValEdit, uAddExceptPeriodUnit, uSelectHospUnit,
    Variants, Spin, DateUtils, WorkModeCentral, TableCentral;

type
    TfmEditHosp = class(TAddForm)
        DetailsQueryVOPL: TIntegerField;
        GetHospDetInfoQuery: TIBQuery;
        PeriodInsertQuery: TIBQuery;
        PeriodDeleteQuery: TIBQuery;
        GetNewIdQuery: TIBQuery;
        DetailsQueryID_PARENT: TIntegerField;
        ParentInfoQuery: TIBQuery;
        ParentInfoQueryNOMER: TIBStringField;
        PeriodInfoQuery: TIBQuery;
        DetailsQueryPERCENT: TIBBCDField;
        DetailsQueryKOD: TIBStringField;
        DetailsQueryILLNESS_TYPE: TIntegerField;
        DetailsQueryENDING: TIntegerField;
        FirstPage: TTabSheet;
        SecondPage: TTabSheet;
        GroupBox1: TGroupBox;
        SERIALabel: TLabel;
        NOMERLabel: TLabel;
        FC_SERIA: TFieldControl;
        FC_NOMER: TFieldControl;
        Label3: TLabel;
        ParentButton: TSpeedButton;
        Label8: TLabel;
        SERIAEdit: TCheckEdit;
        NOMEREdit: TCheckEdit;
        ParentEdit: TCheckEdit;
        ListTypeBox: TComboBox;
        GroupBox2: TGroupBox;
        Label5: TLabel;
        FC_Kod: TFieldControl;
        Label6: TLabel;
        Label7: TLabel;
        FC_IllType: TFieldControl;
        FC_Ending: TFieldControl;
        KodEdit: TCheckEdit;
        IllTypeBox: TComboBox;
        EndingBox: TComboBox;
        DATE_BEGLabel: TLabel;
        DATE_BEGPicker: TDateTimePicker;
        FC_DATE_BEG: TFieldControl;
        DATE_ENDLabel: TLabel;
        DATE_ENDPicker: TDateTimePicker;
        FC_DATE_END: TFieldControl;
        GroupBox3: TGroupBox;
        Label1: TLabel;
        FC_VOPL: TFieldControl;
        Label4: TLabel;
        FC_PERCENT: TFieldControl;
        VoplComboBox: TSpComboBox;
        PercentEdit: TCheckEdit;
        Label2: TLabel;
        ExceptPeriodList: TValueListEditor;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        IlNESS_NOTESLabel: TLabel;
        NoteMemo: TMemo;
        FC_IlNESS_NOTES: TFieldControl;
        Label63: TLabel;
        WorkModeBox: TSpComboBox;
        ShiftLabel: TLabel;
        ShiftSpin: TSpinEdit;
        FC_WORKMODE: TFieldControl;
        FC_SHIFT: TFieldControl;
        FirstDateQuery: TIBQuery;
        FirstDateQueryDATE_BEG: TDateField;
        HolidaysMemo: TMemo;
        Label9: TLabel;
        Label10: TLabel;
        AllLabel: TLabel;
        Label11: TLabel;
        WorkingDays: TLabel;
        DetailsQueryID_WORK_MODE: TIntegerField;
        DetailsQuerySHIFT: TIntegerField;
        GetDefaultWorkModeQuery: TIBQuery;
        SetDefaultMode: TBitBtn;
        TINQuery: TIBQuery;
        HospVersion: TComboBox;
        Label12: TLabel;
        DetailsQueryID_MAN_HOSP: TIntegerField;
        DetailsQueryID_ILLCAUSE: TIntegerField;
        DetailsQueryHOSP_VERSION: TIntegerField;
        FC_HospVersion: TFieldControl;
        StringsCombo: TComboBox;
        BufferQuery: TIBQuery;
        HospPageControl: TPageControl;
        procedure FormCreate(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ParentButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure IllTypeBoxChange(Sender: TObject);
        procedure ListTypeBoxChange(Sender: TObject);
        procedure KodEditExit(Sender: TObject);
        procedure KodEditEnter(Sender: TObject);
        procedure HospPageControlChange(Sender: TObject);
        procedure AcceptButtonClick(Sender: TObject);
        procedure DATE_BEGPickerChange(Sender: TObject);
        procedure SetDefaultModeClick(Sender: TObject);
        procedure FC_SHIFTGet(Sender: TObject);
        procedure VoplComboBoxEnter(Sender: TObject);
        procedure DATE_BEGPickerEnter(Sender: TObject);
        procedure IllTypeBoxEnter(Sender: TObject);
        procedure HospVersionChange(Sender: TObject);

    published
        DetailsQuery: TIBQuery;
        DetailsQueryID_PCARD: TIntegerField;
        DetailsQuerySERIA: TIBStringField;
        DetailsQueryNOMER: TIBStringField;
        DetailsQueryIlNESS_NOTES: TIBStringField;
        DetailsQueryDATE_BEG: TDateField;
        DetailsQueryDATE_END: TDateField;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);

    public
        FormControl: TEditControl;
        Mode: TEditMode;
        ID_MAN: Integer;
        ID_MAN_HOSP, IDHOSP: Integer;
        IDPCARD: Integer;
        TNUM: Integer;
        TIN: string;
        IDParent: Integer;
        PeriodCount: Integer;
        IDMOVING: INTEGER;

        procedure Prepare(Mode: TEditMode; id: Integer; NewVersion: Variant);
        function GetId: Integer; override;
    private
        Default_Work_Mode: Integer;
        Default_Shift: Integer;
        NewVersion: Variant;

        function Check: Boolean;
        procedure WriteExcept;
        procedure ShowHolidays;
        procedure GetDefaultWorkMode(Date_Beg: TDate);
        procedure SetDefaultWorkMode;
        procedure RenderDefaultMode;
    end;

var
    fmEditHosp: TfmEditHosp;

implementation

{$R *.DFM}

uses uBuffer2, Math, qFTools;

procedure TfmEditHosp.SetDefaultWorkMode;
var
    shift: Integer;
begin
    WorkModeBox.Prepare(Default_Work_Mode);
        // считать сдвижку
    shift := Default_Shift;
        // теперь используем реальную сдвижку!
//    shift := ConvertShift(shift, Date_BegPicker.Date, False);
        // преобразовать к нормальному виду
    WorkModeCenter.Id_Work_Mode := Default_Work_Mode;
    WorkModeCenter.Shift := shift;
    shift := WorkModeCenter.NormalizedShift;

    ShiftSpin.Value := shift;
end;

procedure TfmEditHosp.RenderDefaultMode;
begin
    GetDefaultWorkMode(Date_BegPicker.Date);
    if Mode = emNew then SetDefaultWorkMode;
end;

procedure TfmEditHosp.GetDefaultWorkMode(Date_Beg: TDate);
begin
    with GetDefaultWorkModeQuery do
    begin
        Close;
        with Params do
        begin
            ParamByName('Id_PCard').AsInteger := IDPCARD;
            ParamByName('Date_Beg').AsDate := Date_Beg;
        end;
        Open;
        Default_Work_Mode := FieldByName('Id_Work_Mode').AsInteger;
        Default_Shift := FieldByName('Shift').AsInteger;
    end;
end;

procedure TfmEditHosp.Prepare(Mode: TEditMode; id: Integer; NewVersion: Variant);
begin
    Self.Mode := Mode;
    Self.NewVersion := NewVersion;

    if Mode = emNew then Caption := 'Додати листок непрацездатності'
    else
        if Mode = emModify then Caption := 'Змінити листок непрацездатності'
        else Caption := 'Додаткова інформація по листку непрацездатності';

    DetailsQuery.Transaction := ReadTransaction;

    ID_MAN_HOSP := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['ID_MAN_HOSP'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
            if not (VarIsNull(DetailsQuery['ID_Parent'])) then
            begin
                if (DetailsQuery['ID_PARENT'] <> -1) then
                begin
                    IDPARENT := DetailsQuery['ID_Parent'];
                    ParentInfoQuery.Params.ParamByName('ID_PARENT').Value :=
                        IDPARENT;
                    ParentInfoQuery.Open;
                    ParentEdit.Text := ParentInfoQuery['NOMER'];
                end;
                PeriodInfoQuery.Params.ParamByName('ID_MAN_HOSP').Value :=
                    ID_MAN_HOSP;
                PeriodInfoQuery.Open;

                if (PeriodInfoQuery.IsEmpty) then PeriodCount := 0
                else PeriodCount := ExceptPeriodList.RowCount - 1;

                if (not PeriodInfoQuery.IsEmpty) then
                begin
                    while (not PeriodInfoQuery.Eof) do
                    begin
                        ExceptPeriodList.InsertRow(PeriodInfoQuery['Date_Beg'],
                            PeriodInfoQuery['Date_End'], True);
                        PeriodInfoQuery.Next;
                    end;
                    PeriodInfoQuery.Close;
                end;
            end;
        end;

    if Mode <> emNew then
    begin
        HospVersion.ItemIndex := DetailsQuery['Hosp_Version'] - 1;
        HospVersionChange(HospVersion);
    end;



    FormControl := TEditControl.Create;
    FormControl.Add([FC_SERIA, FC_NOMER, FC_IlNESS_NOTES, FC_DATE_BEG,
        FC_DATE_END, FC_VOPL, FC_PERCENT, FC_KOD, FC_IllType, FC_Ending,
            FC_WORKMODE, FC_SHIFT, FC_HospVersion]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);
    if Mode = emNew then
    begin
        DATE_BEGPICKER.Date := Date();
        DATE_ENDPICKER.Date := Date();

        HospVersion.ItemIndex := 1;
        HospVersionChange(HospVersion);
    end;

    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;

    if Mode = emNew then VoplComboBox.Prepare(24312); // ??
    if IDPARENT <> -1 then ListTypeBox.ItemIndex := 1;

            // получить соответствующий режим работы
    RenderDefaultMode;

    HospPageControl.ActivePage := FirstPage;
    if Mode = emView then
    begin
        FirstPage.Enabled := False;
        SecondPage.Enabled := False;
    end;
end;

function TfmEditHosp.GetId: Integer;
begin
    Result := ID_MAN_HOSP;
end;

procedure TfmEditHosp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    VoplComboBox.SaveIntoRegistry;
    WorkModeBox.SaveIntoRegistry;
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;
end;

function TfmEditHosp.Check: Boolean;
var
    Query: TIBQuery;
    holiday: Boolean;
    holiday_str: string;
    zeroPerc: Boolean;
    perc: double;
    work_str: String;
begin
    Result := True;

    if FormControl.CheckFill then
    begin
                // проверить даты
        if Date_BegPicker.Date > Date_EndPicker.Date then
        begin
            MessageDlg('Невірний період: дата початку більше дати закінчення',
                mtError, [mbOK], 0);
            Result := False;
            Exit;
        end;

                // проверить корректность информации по продолжению
        if (IdParent > 0) <> (ListTypeBox.ItemIndex = 1) then
        begin
            MessageDlg('Дані по продовженню не співпадають!', mtError, [mbOk],
                0);
            Result := False;
            Exit;
        end;

        Query := TIbQuery.Create(Self);
        Query.Transaction := ReadTransaction;

            // проверить Не находится ли человек в отпуске на дату начала больничного (Валик, 28.02.2005)
        holiday_str := '';
        if VarIsNull(NewVersion) or (NewVersion = False) then
        begin
            Query.SQL.Text := 'SELECT * from ORDERS_CHECK_MAN_FOR_HOLIDAY(' +
                IntToStr(IDPCARD) + ',' + QuotedStr(DateToStr(Date_BegPicker.Date)) + ')';
            Query.Open;

            holiday := Query['OTPUSK'] = 'T';
        end
        else
        begin
            Query.Close;
            Query.SQL.Text := 'SELECT * FROM HL_LIST_HOLIDAYS_BY_PCARDPERIOD(:ID_PCARD, :PERIOD_BEG, :PERIOD_END)';
            Query.ParamByName('Id_PCard').AsInteger := IDPCARD;
            Query.ParamByName('Period_Beg').AsDate := DATE_BEGPicker.Date;
            Query.ParamByName('Period_End').AsDate := DATE_ENDPicker.Date;
            Query.Open;

            holiday := not Query.IsEmpty;

            Query.First;
            while not Query.Eof do
            begin
                holiday_str := holiday_str + #13#10 + Query['Type_Holiday'] +
                    ' з ' + DateToStr(Query['Holiday_Beg']) + ' по ' +
                    DateToStr(Query['Holiday_End']) + ' наказ ' +
                    Query['ORDER_STR'];
                Query.Next;
            end;
        end;

        holiday_str := holiday_str + #13#10;

        if holiday then
        begin
            if
                MessageDlg('На цей період людина знаходиться у відпустці. ' +
                holiday_str + 'Додати лист непрацездатності?',
                mtWarning, [mbOk, mbCancel], 0) <> mrOk then
            begin
                Result := False;
                Exit;
            end;
        end;

        {проверить, соответствует процент законодательству:
         должно быть 0, 60, 80 или 100 (см. баг 5091)}

        perc := StrToFloat(PercentEdit.Text);

        if ((perc <> 0) and (perc <> 60) and (perc <> 80) and (perc <> 100))
        then begin
            MessageDlg('Занесений процент не входить до можливо'+
            'допустимих значень (0, 60, 80 і 100)!', mtError, [mbOk],
                0);
            Result := False;
            Exit;
        end;

            // проверить, не выходит ли больничный за пределы трудового договора
        if NewVersion then
        begin
            perc := StrToFloat(PercentEdit.Text);

            if perc >= 0.01 then
            begin
                Query.Close;
                Query.SQL.Text := 'SELECT * FROM UP_WORK_PERIOD_BY_PCARD(:Id_Pcard)';
                Query.Open;

                if Query.IsEmpty or VarIsNull(Query['Period_Beg'])
                    or VarIsNull(Query['Period_End'])
                    or (Date_BegPicker.Date < Query['Period_Beg'])
                    or (DATE_EndPicker.Date > Query['Period_End'])
                    then
                begin
                    work_str := '';
                    if not VarIsNull(Query['Period_Beg'])
                        and not VarIsNull(Query['Period_End']) then
                    work_str := '(період роботи з ' +
                        DateToStr(Query['Period_Beg']) + ' по ' +
                        DateToStr(Query['Period_End']) + ')';

                    Result := qFConfirm('Ця людина не працює на період хвороби '
                        + work_str + '. Занести лист непрацездатності?');
                end;

                if StrToFloat(PercentEdit.Text) = 0 then zeroPerc := True;

                Query.Free;
            end;
        end;
    end
    else Result := False;
end;

procedure TfmEditHosp.WriteExcept;
var
    i, idpbkey: Integer;
begin
        // запись нарушений режима ???
    PeriodDeleteQuery.Params.ParamByName('ID').Value := ID_MAN_HOSP;
    ExecQuery(PeriodDeleteQuery);

    if (PeriodCount > 0) then
    begin
        for i := 1 to ExceptPeriodList.RowCount - 1 do
        begin
            PeriodInsertQuery.Params.ParamByName('ID_MAN_HOSP').Value :=
                ID_MAN_HOSP;
            PeriodInsertQuery.Params.ParamByName('DATE_BEG').Value :=
                ExceptPeriodList.Cells[0, i];
            PeriodInsertQuery.Params.ParamByName('DATE_END').Value :=
                ExceptPeriodList.Cells[1, i]; ;

            ExecQuery(PeriodInsertQuery);
        end;
    end;
end;

procedure TfmEditHosp.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    if Mode = emView then Exit;

    FormControl.Read;
    HospPageControl.ActivePage := FirstPage; // sic!

    if not Check then
    begin
        ModalResult := 0;
        Exit;
    end;

    BufTran2 := nil;
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;
    try
            // запись основной информации
        if Mode = emNew then
        begin
            GetNewIdQuery.Open;
            ID_MAN_HOSP := GetNewIdQuery['ID_MAN_HOSP'];
            ok := FormControl.ExecProc('MAN_HOSPITAL_Insert', [IDPCARD,
                ID_MAN_HOSP, IDPARENT], True);
            idHosp := Id_Man_Hosp;
        end
        else
        begin
            ok := FormControl.ExecProc('MAN_HOSPITAL_Update', [IDPCARD,
                DetailsQuery.Params.ParamValues['ID_MAN_HOSP'], IDPARENT]);
            IdHosp := DetailsQuery.Params.ParamValues['ID_MAN_HOSP'];
        end;

        if not ok then
        begin
            WriteTransaction.Rollback;
            ModalResult := mrNone;
            Exit;
        end;

        WriteExcept;

        if ok and not DontWriteToDbf and (VarIsNull(NewVersion) or (NewVersion = False)) then
        begin
            BufferQuery.Transaction := WriteTransaction;
            BufferQuery.Close;
            BufferQuery.ParamByName('Id_Hosp').AsInteger := idHosp;
            BufferQuery.Open;

            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('HOSPITAL,HOSP_DET', 'BUF_HOSPITAL,BUF_HOSP_DET', WriteTransaction);
            BufTran2.WriteRange(First_PBKey, Last_PBKey);
        end;
        WriteTransaction.Commit;

    except on e: Exception do
        begin
            WriteTransaction.Rollback;
            if BufTran2 <> nil then BufTran2.RollbackOnError;

            MessageDlg('При занесенні інформації виникла помилка: ' +
                e.Message, mtError, [mbOk], 0);
        end;
    end;

    if BufTran2 <> nil then BufTran2.Free;
end;

procedure TfmEditHosp.FormCreate(Sender: TObject);
begin
    IDPARENT := -1;
    PeriodCount := 0;

    GetHospDetInfoQuery.Transaction := ReadTransaction;
    PeriodInsertQuery.Transaction := WriteTransaction;
    PeriodDeleteQuery.Transaction := WriteTransaction;
    GetNewIdQuery.Transaction := ReadTransaction;
    ParentInfoQuery.Transaction := ReadTransaction;
    PeriodInfoQuery.Transaction := ReadTransaction;
    GetDefaultWorkModeQuery.Transaction := ReadTransaction;
end;

procedure TfmEditHosp.AddButtonClick(Sender: TObject);
var
    form: TfmAddExceptPeriod;
    DateBeg: string;
    DateEnd: string;

begin
    form := TfmAddExceptPeriod.Create(Self);

    if form.ShowModal = mrOK then
    begin
        DateBeg := DateToStr(form.DateBeg.Date);
        DateEnd := DateToStr(form.DateEnd.Date);

        ExceptPeriodList.InsertRow(DateBeg, DateEnd, True);
        Inc(PeriodCount);
        if WorkModeBox.GetId <> -1 then ShowHolidays;
    end;
end;

procedure TfmEditHosp.ParentButtonClick(Sender: TObject);
var
    form: TSelectHospForm;
begin
    form := TSelectHospForm.Create(Self);

    form.Prepare(IdPcard);

    if (form.ShowModal = mrOk) and (not form.HospQuery.IsEmpty) then
    begin
        if form.HospQueryENDING.AsInteger = 1 then
        begin
            MessageDlg('Неможливо продовжувати закритий лист непрацездатності!',
                mtError, [mbOk], 0);
            Exit;
        end;

        IDParent := form.HospQuery['ID_MAN_HOSP'];
        ParentEdit.Text := form.HospQuery['NOMER'];
        ListTypeBox.ItemIndex := 1;


            // Подставляем кое-какую инфу из прошлого больничного
        HospVersion.ItemIndex := form.HospQuery['Hosp_Version'] - 1;
        HospVersionChange(HospVersion);
        DATE_BEGPicker.Date := form.HospQueryDATE_END.Value + 1;
//              зачем это??
//        Date_EndPicker.Date := form.HospQueryDATE_END.Value + 2;
        KodEdit.Text := form.HospQueryKOD.Value;
        IllTypeBox.ItemIndex := Form.HospQueryILLNESS_TYPE.Value - 1;
        PercentEdit.Text := Form.HospQueryPERCENT.AsString;
        VoplComboBox.Prepare(Form.HospQueryVOPL.AsInteger);
    end;
    form.Free;
end;

procedure TfmEditHosp.DeleteButtonClick(Sender: TObject);
begin
    if PeriodCount > 0 then
    begin
        ExceptPeriodList.DeleteRow(ExceptPeriodList.RowCount - 1);
        Dec(PeriodCount);
        if WorkModeBox.GetId <> -1 then ShowHolidays;
    end;
end;

procedure TfmEditHosp.IllTypeBoxChange(Sender: TObject);
begin
    if HospVersion.ItemIndex = 0 then
        case IllTypeBox.ItemIndex + 1 of
            0: ;
            4, 5, 6: VoplComboBox.Prepare(25112);
            8: VoplComboBox.Prepare(29812);
            10: VoplComboBox.Prepare(24212);
        else VoplComboBox.Prepare(24312);
        end
    else
        case IllTypeBox.ItemIndex + 1 of
            0: ;
            2, 4, 5: VoplComboBox.Prepare(25112);
            10: VoplComboBox.Prepare(29812);
            8: VoplComboBox.Prepare(24212);
        else VoplComboBox.Prepare(24312);
        end

end;

procedure TfmEditHosp.ListTypeBoxChange(Sender: TObject);
begin
    if ListTypeBox.ItemIndex = 0 then
    begin
        IDParent := -1;
        ParentEdit.Text := '';
    end;
end;

procedure TfmEditHosp.AcceptButtonClick(Sender: TObject);
begin
    if WorkModeBox.GetId <> -1 then ShowHolidays;
end;

        // отображение выходных дней

procedure TfmEditHosp.ShowHolidays;
var
    i, j, wDays, hDays, eDays, curMonth, d_b, d_e: Integer;
    span: TTableDaySpan;
    d1, d2: TDate;
    s: string;
begin
        // если больничный бессрочный, то смысла считать выходные нет
    if DATE_ENDPicker.DateTime >= EncodeDate(2050, 1, 1) then
    begin
        HolidaysMemo.Lines.Clear;
        HolidaysMemo.Lines.Add('безстроковий лист непрацездатності');
        AllLabel.Caption := '';
        WorkingDays.Caption := '';
        Exit;
    end;
        // создать промежуток дней табеля
    span := TTableDaySpan.Create(Date_BegPicker.Date, Date_EndPicker.Date);
        // выбрать все клетки
    span.SelectAll;
        // установить режим и сдвижку - РЕАЛЬНУЮ
//    span.SetMode(WorkModeBox.GetId, ConvertShift(ShiftSpin.Value, Date_BegPicker.Date, True));
    span.SetMode(WorkModeBox.GetId, ShiftSpin.Value, 1);

        // подсчитать часы
    span.CalcDays;

    edays := 0;
    for i := 1 to ExceptPeriodList.RowCount - 1 do
        if ExceptPeriodList.Cells[0, i] <> '' then
        begin
            d1 := StrToDate(ExceptPeriodList.Cells[0, i]);
            d2 := StrToDate(ExceptPeriodList.Cells[1, i]);

            d_b := Trunc(d1 - span.Date_Beg) + 1;
            d_e := Trunc(d2 - span.Date_Beg) + 1;
            if d_b < 0 then d_b := 0;
            if d_e > span.Count then d_e := span.Count;

            for j := d_b to d_e do
                if span[j].WorkDay2 then inc(edays);
        end;


    HolidaysMemo.Text := '';
    hDays := 0;
    wDays := 0;
    curMonth := -1;

    for i := 1 to span.Count do
        if span[i].WorkDay2 then
            inc(wDays)
        else
        begin
            inc(hDays);
                // заголовок для месяца
            if curMonth <> MonthOf(span[i].CurDate) then
            begin
                curMonth := MonthOf(span[i].CurDate);
                if curMonth < 10 then s := '0' + IntToStr(curMonth)
                else s := IntToStr(curMonth);
                s := 'за ' + s + '.' + IntToStr(YearOf(span[i].CurDate));
                HolidaysMemo.Text := HolidaysMemo.Text + #13#10 + s + ':   ';
            end;
            HolidaysMemo.Text := HolidaysMemo.Text +
                IntToStr(DayOf(span[i].CurDate)) + ' ';
        end;

    HolidaysMemo.Lines.Delete(0);
    AllLabel.Caption := IntToStr(hDays);
    WorkingDays.Caption := IntToStr(wDays - eDays);

    span.Free;
end;

procedure TfmEditHosp.KodEditExit(Sender: TObject);
begin
    LoadKeyboardLayout('00000422', KLF_ACTIVATE or KLF_SUBSTITUTE_OK)
end;

procedure TfmEditHosp.KodEditEnter(Sender: TObject);
begin
    LoadKeyboardLayout('00000409', KLF_ACTIVATE or KLF_SUBSTITUTE_OK)
end;

procedure TfmEditHosp.HospPageControlChange(Sender: TObject);
begin
    if Sender = FirstPage then Exit;

    ShowHolidays;
end;

procedure TfmEditHosp.DATE_BEGPickerChange(Sender: TObject);
begin
    RenderDefaultMode;
end;

procedure TfmEditHosp.SetDefaultModeClick(Sender: TObject);
begin
    SetDefaultWorkMode;
end;

procedure TfmEditHosp.FC_SHIFTGet(Sender: TObject);
begin
        // преобразовать в реальную сдвижку - не нужно, нормализовать
    WorkModeCenter.Id_Work_Mode := FC_WorkMode.Value;
//    FC_Shift.Value := ConvertShift(ShiftSpin.Value, Date_BegPicker.Date, True);
    WorkModeCenter.Shift := ShiftSpin.Value;
    FC_Shift.Value := WorkModeCenter.NormalizedShift;
end;

procedure TfmEditHosp.VoplComboBoxEnter(Sender: TObject);
begin
    if IDParent > 0 then
    begin
        MessageDlg('Вид оплати повинен бути таким, як у попереднього листа непрацездатності!',
            mtError, [mbOk], 0);
        Date_EndPicker.SetFocus;
    end;
end;

procedure TfmEditHosp.DATE_BEGPickerEnter(Sender: TObject);
begin
    if IDParent > 0 then
    begin
        MessageDlg('Не можна змінити дату початку листа, бо вона визначається ' +
            'попереднім листом непрацездатності!',
            mtError, [mbOk], 0);
        Date_EndPicker.SetFocus;
    end;
end;

procedure TfmEditHosp.IllTypeBoxEnter(Sender: TObject);
begin
    if IDParent > 0 then
    begin
        MessageDlg('Не можна змінити тип захворювання, бо він визначається ' +
            'попереднім листом непрацездатності!',
            mtError, [mbOk], 0);
        Date_EndPicker.SetFocus;
    end;
end;

procedure TfmEditHosp.HospVersionChange(Sender: TObject);
var
    i: Integer;
begin
    if HospVersion.ItemIndex = 0 then
    begin
        IllTypeBox.Clear;
        for i := 0 to 12 do
            IllTypeBox.Items.Add(StringsCombo.Items[i]);
        IllTypeBox.ItemIndex := 0;
    end
    else
    begin
        IllTypeBox.Clear;
        for i := 13 to 22 do
            IllTypeBox.Items.Add(StringsCombo.Items[i]);
        IllTypeBox.ItemIndex := 0;
    end;
end;

initialization
    RegisterClass(TfmEditHosp);
end.

