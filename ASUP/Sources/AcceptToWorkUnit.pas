{-$Id: AcceptToWorkUnit.pas,v 1.15 2008/03/18 14:41:59 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Приказ по принятию на работу"                  }
{    Заполнение информации по приказу о принятии на работу                     }
{    Ответственный: Кропов Валентин                                            }

unit AcceptToWorkUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, ComCtrls, ExtCtrls, SpComboBox, Buttons, Db, IBCustomDataSet,
    IBQuery, SpCommon, Mask, CheckEditUnit, Grids, DBGrids, Spin, WorkModeCentral,
    GoodFunctionsUnit, uFControl, uLabeledFControl, uMemoControl,
    uSpravControl, uCommonSp, uCharControl;

type
    TAcceptToWorkForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        OutputQuery: TIBQuery;
        InputQuery: TIBQuery;
        InputQueryID_PCARD: TIntegerField;
        InputQueryID_SHTATRAS: TIntegerField;
        InputQueryID_MAN_MOVING: TIntegerField;
        InputQueryDATE_BEG: TDateField;
        InputQueryDATE_END: TDateField;
        InputQueryID_MOVING_TYPE: TIntegerField;
        InputQueryID_ORDER: TIntegerField;
        InputQueryNUM_ITEM: TIntegerField;
        InputQueryKOL_STAVOK: TIBBCDField;
        InputQueryTEST_TERM: TIntegerField;
        InputQuerySTAJIROVKA_TERM: TIntegerField;
        InputQueryIS_MAIN: TIntegerField;
        ShtatQuery: TIBQuery;
        ShtatQueryDEPARTMENT_FULL: TIBStringField;
        ShtatQueryDEPARTMENT_SHORT: TIBStringField;
        ShtatQueryNAME_POST: TIBStringField;
        ShtatQueryDIGIT: TIntegerField;
        ShtatQueryDATE_BEG: TDateField;
        ShtatQueryDATE_END: TDateField;
        ShtatQueryWORK_COND: TIBStringField;
        ShtatQueryPAY_FORM: TIBStringField;
        InputQueryFIO: TIBStringField;
        InputQueryNAME_MOVING_TYPE: TIBStringField;
        ShtatQueryMONEY: TIBBCDField;
        ShtatQueryNAME_TAR_NET: TIBStringField;
        ShtatQueryVACANT_STAVOK: TIBBCDField;
        CheckForManQuery: TIBQuery;
        CheckForManQueryNUM_ORDER: TIBStringField;
        CheckForManQueryNAME_STATUS: TIBStringField;
        CheckForManQueryDATE_ORDER: TDateField;
        InputQueryID_MAN: TIntegerField;
        CheckManForMainWorkQuery: TIBQuery;
        CheckManForMainWorkQueryID_MAN_MOVING: TIntegerField;
        CheckForPassportQuery: TIBQuery;
        CheckForPCardQuery: TIBQuery;
        PageControl1: TPageControl;
        MainSheet: TTabSheet;
        BonusSheet: TTabSheet;
        GroupBox1: TGroupBox;
        Label1: TLabel;
        SelectPersonButton: TSpeedButton;
        Label12: TLabel;
        Label13: TLabel;
        Label4: TLabel;
        FIO: TEdit;
        RadioGroup2: TRadioGroup;
        RadioButton3: TRadioButton;
        RadioButton4: TRadioButton;
        DateEnd: TDateTimePicker;
        IspitSrok: TEdit;
        CheckBox1: TCheckBox;
        StagirovkaSrok: TEdit;
        CheckBox2: TCheckBox;
        MovingType: TEdit;
        Button5: TButton;
        GroupBox2: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        StavkiNumber: TCheckEdit;
        GroupBox3: TGroupBox;
        Label2: TLabel;
        Label3: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label10: TLabel;
        Label11: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label9: TLabel;
        Department: TLabel;
        Post: TLabel;
        Digit: TLabel;
        Money: TLabel;
        Stavki: TLabel;
        Tarnet: TLabel;
        PostDateBeg: TLabel;
        PostDateEnd: TLabel;
        PayForm: TLabel;
        WorkCond: TLabel;
        SpeedButton1: TSpeedButton;
        DateBegin: TDateTimePicker;
        BonusPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        BonusGrid: TDBGrid;
        Panel3: TPanel;
        BonusQuery: TIBQuery;
        BonusQueryID_VIDOPL: TIntegerField;
        BonusQueryFIO_SMALL: TIBStringField;
        BonusQueryID_DEPARTMENT: TIntegerField;
        BonusQueryID_STATUS: TIntegerField;
        BonusQueryNUM_ORDER: TIBStringField;
        BonusQueryDATE_ORDER: TDateField;
        BonusQueryID_MAN_BONUS: TIntegerField;
        BonusQueryID_MAN_MOVING: TIntegerField;
        BonusQueryID_BONUS: TIntegerField;
        BonusQueryIS_PERCENT: TIBStringField;
        BonusQuerySUMMA: TIBBCDField;
        BonusQueryBONUS_DATE_BEG: TDateField;
        BonusQueryBONUS_DATE_END: TDateField;
        BonusQueryNUM_ITEM: TIntegerField;
        BonusQueryFIO: TIBStringField;
        BonusQueryDEPARTMENT_NAME: TIBStringField;
        BonusQueryPOST_NAME: TIBStringField;
        BonusQueryWORK_DATE_BEG: TDateField;
        BonusQueryWORK_DATE_END: TDateField;
        BonusQueryNAME_BONUS: TIBStringField;
        BonusQueryTHE_BONUS: TIBStringField;
        BonusQueryTN: TIntegerField;
        BonusSource: TDataSource;
        ShtatQueryID_WORK_MODE: TIntegerField;
        ShtatQueryNAME: TIBStringField;
        InputQueryID_WORK_MODE: TIntegerField;
        InputQueryNAME: TIBStringField;
        SpeedButton2: TSpeedButton;
        WorkModeTabSheet: TTabSheet;
        Label63: TLabel;
        WorkModeBox: TSpComboBox;
        Label5: TLabel;
        ShiftSpin: TSpinEdit;
        Label6: TLabel;
        WorkModeGrid: TStringGrid;
        InputQueryWORK_MODE_SHIFT: TIntegerField;
        Note: TqFMemoControl;
        InputQueryNOTE: TIBStringField;
        IsHospital: TCheckBox;
        Hospital: TqFSpravControl;
        HolidayPanel: TPanel;
        Holiday: TqFSpravControl;
        IsHoliday: TCheckBox;
        InputQueryBUHG_PODR: TIntegerField;
        InputQueryID_SPZ: TIntegerField;
        InputQueryB_MOVING: TIntegerField;
        InputQueryRMOVING: TIntegerField;
        InputQueryREAL_DATE_END: TDateField;
        InputQueryID_DEPARTMENT: TIntegerField;
        InputQueryID_POST: TIntegerField;
        InputQueryREAL_OKLAD: TIBBCDField;
        InputQueryNUM_DIGIT: TIntegerField;
        InputQueryTN: TIntegerField;
        InputQueryID_TAR_NET: TIntegerField;
        InputQuerySHTAT_ORDER: TIntegerField;
        InputQueryDEPT_ORDER: TIntegerField;
        InputQueryID_CATEGORY: TIntegerField;
        InputQueryTARIF: TIntegerField;
        InputQueryID_POST_SALARY: TIntegerField;
        InputQueryOKLAD: TIBBCDField;
        InputQueryID_WORK_COND: TIntegerField;
        InputQueryID_PAY_FORM: TIntegerField;
        InputQueryID_TYPE_POST: TIntegerField;
        InputQueryRECORD_TYPE: TIntegerField;
        InputQueryBASED_ON: TIntegerField;
        InputQueryREASON: TIBStringField;
        InputQueryID_MAN_HOSPITAL: TIntegerField;
        InputQueryID_MAN_HOLIDAY: TIntegerField;
        InputQueryIS_MAIN_POST: TIBStringField;
        InputQueryACCEPT_COND_DATE_BEG: TDateField;
        InputQueryACCEPT_COND_DATE_END: TDateField;
        InputQueryID_ACCEPT_COND: TIntegerField;
        InputQueryID_WORK_REASON: TIntegerField;
        InputQueryACCEPT_COND_YEARS: TIBBCDField;
        InputQueryNUM_ORDER: TIBStringField;
        InputQueryDATE_ORDER: TDateField;
        InputQuerySTD_BEG: TDateField;
        InputQuerySTD_END: TDateField;
        InputQueryEXCEPT_DATE: TDateField;
        InputQuerySTD_ORDER: TIBStringField;
        InputQuerySTD_DORDER: TDateField;
        InputQueryHOSPITAL_ID_PCARD: TIntegerField;
        InputQueryHOLIDAY_ID_PCARD: TIntegerField;
        InputQueryID_MAN1: TIntegerField;
        InputQueryHOSP_STR: TIBStringField;
        UseKolStavokBox: TCheckBox;
        InputQueryUSE_KOL_STAVOK_IN_TABLE: TIntegerField;
    BonusQueryPERCENT: TIBBCDField;
    BonusQueryOKLAD_STR: TIBStringField;
    BonusQueryPRIM: TIBStringField;
    BonusQueryPATH: TIBStringField;
    BonusQueryID_POST: TIntegerField;
    BonusQueryIS_SHADOW: TIntegerField;
    Reason: TqFCharControl;
        procedure IspitSrokKeyPress(Sender: TObject; var Key: Char);
        procedure CheckBox1Click(Sender: TObject);
        procedure RadioButton4Click(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure Button2Click(Sender: TObject);
        procedure CheckBox2Click(Sender: TObject);
        procedure SelectPersonButtonClick(Sender: TObject);
        function Prepare: Boolean;
        procedure Button5Click(Sender: TObject);
        procedure StavkiNumberKeyPress(Sender: TObject; var Key: Char);
        procedure FormClick(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure RefreshShtatBlock;
        procedure ClearShtatBlock;
        function CheckForMan(TEST_ID_MAN: Integer; TEST_ID_SHTATRAS: Integer; CUR_DATE: TDATE): boolean;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure BonusQueryAfterOpen(DataSet: TDataSet);
        procedure SpeedButton2Click(Sender: TObject);
        procedure DateBeginChange(Sender: TObject);
        procedure WorkModeBoxChange(Sender: TObject);
        procedure HospitalOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure IsHospitalClick(Sender: TObject);
    private

    public
    //
        FMode: TEditMode;
        ID_ORDER: integer;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

        NUM_ITEM: integer;

        ID_MAN: integer;
        ID_PCARD: Integer;
        ID_SPZ: integer;
        ID_SHTATRAS: Integer;
        ID_Moving_Type: integer;
        Previus_Id_Shtatras: Integer;
        ID_MAN_MOVING: Integer;
        Kol_Stavok: Double;
        Real_Shift: Integer;

    end;
var
    AcceptToWorkForm: TAcceptToWorkForm;

implementation
uses PCardsDetailsUnit, ShtatRas, DepartmentsViewUnit, SpPostUnit,
    SpFormUnit, TarDigits, PeopleViewUnit, PersonalCommon,
    SpMovingTypeUnit, AddPostBonus, Variants;
{$R *.DFM}

// Проверяем, чтобы такого МЭНа с таким штатным расписанием на дату прийома не было среди текущих мувингов

function TAcceptToWorkForm.CheckForMan(TEST_ID_MAN: Integer; TEST_ID_SHTATRAS: Integer; CUR_DATE: TDATE): boolean;
begin
    CheckForManQuery.Close;
    CheckForManQuery.Params.ParamValues['CUR_DATE'] := DateToStr(CUR_DATE);
    CheckForManQuery.Params.ParamValues['ID_MAN'] := TEST_ID_MAN;
    CheckForManQuery.Params.ParamValues['ID_SHTATRAS'] := TEST_ID_SHTATRAS;
    CheckForManQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;

    if FMode = emModify then
        CheckForManQuery.Params.ParamValues['ID_MAN_MOVING'] := ID_MAN_MOVING
    else
        CheckForManQuery.Params.ParamValues['ID_MAN_MOVING'] := -1;

    CheckForManQuery.Open;
    result := not CheckForManQuery.IsEmpty;
end;

// Процедура обновления основной квери и отображения блока информации по штатному расписанию

procedure TAcceptToWorkForm.RefreshShtatBlock;
begin
    ShtatQuery.Close;
    ShtatQuery.Params.ParamValues['ID_SHTATRAS'] := ID_SHTATRAS;
    ShtatQuery.Params.ParamValues['CUR_DATETIME'] := DateBegin.Date;
    ShtatQuery.Open;

    // Подсвечиваем блок информации по Штатному расписанию

    if not ShtatQuery.IsEmpty then
    begin
        Department.Caption := ShtatQueryDEPARTMENT_FULL.Value;
        Post.Caption := ShtatQueryNAME_POST.Value;

        if ShtatQueryDigit.Value <= 0 then
            Digit.Caption := 'оклад'
        else
            Digit.Caption := IntToStr(ShtatQueryDigit.Value);

        Money.Caption := ShtatQueryMONEY.AsString;
        Stavki.Caption := FloatToStr(ShtatQueryVACANT_STAVOK.Value + KOL_STAVOK);
        Tarnet.Caption := ShtatQueryNAME_TAR_NET.Value;
        PostDateBeg.Caption := ShtatQueryDATE_BEG.AsString;
        PostDateEnd.Caption := ShtatQueryDATE_END.AsString;
        PayForm.Caption := ShtatQueryPAY_FORM.Value;
        WorkCond.Caption := ShtatQueryWORK_COND.Value;
    end
    else
    begin
        ID_SHTATRAS := -1;
        ClearShtatBlock;
    end;
end;

procedure TAcceptToWorkForm.ClearShtatBlock;
begin
    // Нулим лейблі в информационном блоке штатного розкладу

    Department.Caption := '';
    Post.Caption := '';
    Digit.Caption := '';
    Money.Caption := '';
    Stavki.Caption := '';
    Tarnet.Caption := '';
    PostDateBeg.Caption := '';
    PostDateEnd.Caption := '';
    PayForm.Caption := '';
    WorkCond.Caption := '';
end;

function TAcceptToWorkForm.Prepare: Boolean;
begin

    result := True;

    if (FMode = emNew) {// if new} then
    begin
        Caption := 'Заповніть форму для прийняття людини на роботу';
        FIO.Text := '';
        MovingType.Text := '';
        StavkiNumber.Text := '';
        DateBegin.Date := ORDER_DATE;
        IspitSrok.Text := '0';
        StagirovkaSrok.Text := '0';
        DateEnd.Date := EncodeDate(CurrentYear, 12, 31);
        ID_MAN := 0;
        ID_SPZ := 0;
        ID_SHTATRAS := -1;
        ID_MOVING_TYPE := 0;

        // Вызываем процедуру очистки блока информации штатного расписания и отображения по нему информации

        ClearShtatBlock;

        BonusSheet.TabVisible := False;

        WorkModeBox.Prepare(-1, '');
    end;

    if (FMode = emModify) or (FMode = emView) {//Редактирование} then
    begin
        DecimalSeparator := ',';
        InputQuery.Close;
        InputQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        InputQuery.Params.ParamValues['NUM_ITEM'] := NUM_ITEM;
        InputQuery.Open;

        if InputQuery.IsEmpty then
        begin
            MessageDlg('Можливо хтось додав наказ, але ще на заповнив усю необхідну інформацію, зачекайте. Або у базі данних виникла помилка.', mtError, [mbOk], 0);
            result := false;
            Exit;
        end;

        // Preparing Form

        DateBegin.Date := InputQuery['DATE_BEG'];
        ID_MAN_MOVING := InputQueryID_MAN_MOVING.Value;
        ID_MAN := InputQueryID_MAN.Value;
        ID_PCARD := InputQuery['Id_PCard'];
        ID_SHTATRAS := InputQueryID_SHTATRAS.Value;
        Previus_ID_SHTATRAS := InputQueryID_SHTATRAS.Value;
        FIO.Text := InputQueryFIO.Value;
        MovingType.Text := InputQueryNAME_MOVING_TYPE.Value;
        ID_Moving_Type := InputQueryID_MOVING_TYPE.Value;
        IspitSrok.Text := IntToStr(InputQueryTEST_TERM.Value);
        Kol_Stavok := InputQueryKOL_STAVOK.Value;
        if InputQueryTEST_TERM.Value <> 0 then
            CheckBox1.Checked := True
        else
            CheckBox1.Checked := False;
        StagirovkaSrok.Text := IntToStr(InputQuerySTAJIROVKA_TERM.value);
        if InputQuerySTAJIROVKA_TERM.Value <> 0 then
            CheckBox2.Checked := True
        else
            CheckBox2.Checked := False;
        StavkiNumber.Text := FloatToStr(InputQueryKOL_STAVOK.Value);
        DateEnd.Date := InputQuery['DATE_END'];

        if InputQuery['DATE_END'] = PersonalCommon.Consts_Query['DATE_END'] then
            RadioButton4.Checked := True
        else
            RadioButton4.Checked := False;
        if InputQueryIS_MAIN.Value = 0 then
            RadioButton2.Checked := True
        else
            RadioButton2.Checked := False;

//        ShiftSpin.Value := ConvertShift(InputQueryWORK_MODE_SHIFT.Value, InputQueryDATE_BEG.Value, False);

            // юзаем РЕАЛЬНУЮ сдвижку, нормализуем
        WorkModeCenter.Id_Work_Mode := InputQueryID_WORK_MODE.Value;
        WorkModeCenter.Shift := InputQueryWORK_MODE_SHIFT.Value;
        ShiftSpin.Value := WorkModeCenter.NormalizedShift;

        Note.Value := InputQueryNOTE.Value;

        WorkModeBox.Prepare(InputQueryID_WORK_MODE.Value, InputQueryNAME.Value);

        if InputQuery['Use_Kol_Stavok_In_Table'] = 1 then
            UseKolStavokBox.Checked := True
        else UseKolStavokBox.Checked := False;

        Reason.Value := InputQuery['Reason'];

        // Вызываем процедуру обновления блока информации штатного расписания и отображения по нему информации

        RefreshShtatBlock;

        BonusSheet.TabVisible := True;

        BonusQuery.Close;
        BonusQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        BonusQuery.Open;

        if (not VarIsNull(InputQuery['Id_Man_Hospital'])) and (not VarIsNull(InputQuery['Hosp_Str'])) then
        begin
            IsHospital.Checked := True;
            Hospital.Value := InputQueryID_MAN_HOSPITAL.Value;
            Hospital.DisplayText := InputQueryHOSP_STR.Value;
        end;
    end;

    if (FMode = emModify) then
    begin
        Caption := 'Редагування інформації наказу про прийом на роботу';
        OkButton.Caption := 'Змінити';
        CancelButton.Caption := 'Відмінити';
    end;

    if (FMode = emView) then
    begin
        Caption := 'Перегляд інформації наказу про прийом на роботу';
        OkButton.Visible := False;
        CancelButton.Caption := 'Закрити';
        GroupBox1.Enabled := False;
        SpeedButton1.Visible := False;
        CancelButton.Left := 184;
        SelectPersonButton.Visible := False;
        BonusPanel.Visible := False;
        WorkModeTabSheet.Enabled := False;
        WorkModeBox.Enabled := False;
        ShiftSpin.Enabled := False;
        WorkModeGrid.Enabled := False;
        Note.Enabled := False;


        IsHospital.Enabled := False;
        Hospital.Enabled := False;
    end;
end;

procedure TAcceptToWorkForm.IspitSrokKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ((Ord(Key) < Ord('0')) or (Ord(Key) > Ord('9'))) and (Key <> #8) then Key := Chr(0);
end;

procedure TAcceptToWorkForm.CheckBox1Click(Sender: TObject);
begin
    IspitSrok.Enabled := CheckBox1.Checked;

    if CheckBox1.Checked = False then IspitSrok.Text := '0';
end;

procedure TAcceptToWorkForm.RadioButton4Click(Sender: TObject);
begin
    DateEnd.Visible := not RadioButton4.Checked;

    if not RadioButton4.Checked then
        DateEnd.Date := EncodeDate(2150, 12, 31)
    else
        DateEnd.Date := EncodeDate(2150, 12, 31);
end;

procedure TAcceptToWorkForm.OkButtonClick(Sender: TObject);
var
    IS_MAIN: integer;
    Stavki_: Real;
    Hosp_Str: string;
    Use_Kol_Stavok: Integer;
begin
    if UseKolStavokBox.Checked then Use_Kol_Stavok := 1
    else Use_Kol_Stavok := 0;

        // здесь идет проверка данных
    if (FMode = emNew) and (ID_MAN = 0) then
    begin
        MessageDlg('Потрібно вибрати людину!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if (FMode = emNew) and (ID_SHTATRAS = -1) then
    begin
        MessageDlg('Потрібно вибрати позицію з штатного розкладу', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if IspitSrok.Text = '' then
    begin
        MessageDlg('Потрібно ввести випробний термін!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if StagirovkaSrok.Text = '' then
    begin
        MessageDlg('Потрібно ввести термін стажировки!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if ID_MOVING_TYPE = 0 then
    begin
        MessageDlg('Потрібно вибрати тип переміщення!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if (DateBegin.Date >= DateEnd.Date) and (not RadioButton4.Checked) then
    begin
        MessageDlg('Дата кінця трудового договору повинна бути більшею за дату прийняття!', mtError, [mbOk], 0); ModalResult := mrNone;
        DateEnd.SetFocus;
        exit;
    end;

    if StavkiNumber.Text = '' then
    begin
        MessageDlg('Потрібно ввести кількість ставок!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if (ID_SHTATRAS = -1) then
    begin
        MessageDlg('Виберіть вакансію з штатного розкладу!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if (ID_SHTATRAS <> -1) then
    begin
        RefreshShtatBlock;
        if (Stavki.Caption = '0') or ((Department.Caption = '') and (Post.Caption = '')) then
        begin
            MessageDlg('Не існує такої вакансії у штатному розкладі на таку дату прийому! Можливо, що її створено вже після заданої дати прийому, або хтось вже прийняв когось на цю вакансію, або хтось вилучив позицію штатного розкладу.', mtError, [mbOk], 0);
            ModalResult := mrNone;
            exit;
        end;

        if (StrToFloat(StavkiNumber.Text) > StrToFloat(Stavki.Caption)) then
        begin
            MessageDlg('Кількість ставок не може перевищувати кількість вакантних ставок!', mtError, [mbOk], 0);
            ModalResult := mrNone;
            StavkiNumber.SelectAll;
            StavkiNumber.SetFocus;
            exit;
        end;
    end;

    if WorkModeBox.GetId = -1 then
    begin
        MessageDlg('Виберіть режим праці!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if IsHospital.Checked and (VarIsNull(Hospital.Value) or (Hospital.DisplayText = '')) then
    begin
        MessageDlg('Виберіть листок непрацездатності!', mtError, [mbOk], 0);
        exit;
    end;

    // if ID_SPZ        = 0  then begin MessageDlg('Потрібно вибрати ШПЗ!',mtError,[mbOk],0); ModalResult := mrNone; exit; end;

    // Проверяем, чтобы такого МЭНа с таким штатным расписанием на дату прийома не было среди текущих мувингов

    if CheckForMan(ID_MAN, ID_SHTATRAS, DateBegin.Date) then
    begin
        MessageDlg('Цю людину вже хтось намагається прийняти (або вже принято) на цю ж саму посаду з штатного розкладу за наказом №' + CheckForManQueryNUM_ORDER.Value + ' від ' + CheckForManQueryDATE_ORDER.AsString + ', який має статус "' + CheckForManQueryNAME_STATUS.Value, mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    // Проверяем, чтобы у данного человека уже не было основного места работы

    if (RadioButton1.Checked) then
    begin
        CheckManForMainWorkQuery.Close;

        if ID_ORDER = -1 then
            CheckManForMainWorkQuery.SQL.Text := 'SELECT ID_MAN_MOVING FROM GET_CUR_MOVING_PLAN(''' + DateToStr(Order_Date) + ''') GCM, PRIVATE_CARDS PC WHERE PC.ID_PCARD=GCM.ID_PCARD AND PC.ID_PCARD = ' + IntToStr(ID_PCARD)
        else
            CheckManForMainWorkQuery.SQL.Text := 'SELECT ID_MAN_MOVING FROM GET_CUR_MOVING_PLAN(''' + DateToStr(Order_Date) + ''') GCM, PRIVATE_CARDS PC WHERE PC.ID_PCARD=GCM.ID_PCARD AND PC.ID_PCARD = ' + IntToStr(ID_PCARD) + ' AND ID_ORDER <> ' + IntToStr(ID_ORDER);

        CheckManForMainWorkQuery.Open;

        CheckManForMainWorkQuery.FetchAll;
        if (not CheckManForMainWorkQuery.IsEmpty) then
        begin
            MessageDlg('Цю людину вже прийнято (або є невиконаний наказ про його прийом) на головне місце роботи! У однієї людини повинно бути лише одне місце роботи, помічене як головне.', mtError, [mbOk], 0);
            ModalResult := mrNone;
            exit;
        end;
    end;

    if FMode = emNew then
    begin

        // Writing Data in Man_Moving

        if RadioButton4.Checked then DateEnd.Date := PersonalCommon.Consts_Query['DATE_END'];

        IS_MAIN := 0;

        if RadioButton1.Checked then IS_MAIN := 1;

        DecimalSeparator := ',';
        Stavki_ := StrToFloat(StavkiNumber.Text);
        DecimalSeparator := '.';
        Kol_Stavok := Stavki_;


        if not OutputQuery.Transaction.Active then OutputQuery.Transaction.StartTransaction;

        try
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            ID_ORDER := ExecQuery(OutputQuery);

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT ID_MAN_MOVING FROM INSERT_MAN_MOVING(' + IntToStr(ID_PCARD) + ',''' +
                DateToStr(DateBegin.Date) + ''',''' +
                DateToStr(DateEnd.Date) + ''',' +
                IntToStr(ID_Moving_Type) + ',' +
                IntToStr(ID_ORDER) + ',' +
                IntToStr(NUM_ITEM) + ',''' +
                FloatToStr(Stavki_) + ''',' +
                IspitSrok.Text + ',' +
                StagirovkaSrok.Text + ',' +
                IntToStr(ID_SHTATRAS) + ',' +
                IntToStr(IS_MAIN) + ',null,' +
                IntToStr(WorkModeBox.GetId) + ',' +
                IntToStr(real_shift) + ',' +
                IntToStr(Use_Kol_Stavok) + ',' +
                QuotedStr(Reason.Value) + ')';
            ID_MAN_MOVING := ExecQuery(OutputQuery);

            if (IsHospital.Checked) and (not varIsNull(Hospital.Value)) then
                Hosp_Str := IntToStr(Hospital.Value)
            else
                Hosp_Str := 'null';

            // Пишем примечание
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'update MAN_MOVING set NOTE = ' + QuotedStr(Note.Value) + ',' +
                ' id_man_hospital = ' + Hosp_str +
                ' where id_man_moving = ' + IntToStr(ID_MAN_MOVING);
            ExecQuery(OutputQuery);

        // Копируем надбавки
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE COPY_BONUSES_TO_MAN_BONUS(' + IntToStr(ID_ORDER) + ',1)';
            ExecQuery(OutputQuery);

        except on E: Exception do
            begin
                PersonalCommon.WriteTransaction.Rollback;
                ModalResult := mrNone;
                MessageDlg('При занесенні данних у базу виникла помилка: ' + E.message, mtError, [mbOk], 0);
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;

        DecimalSeparator := ',';
        BonusSheet.TabVisible := True;

        MessageDlg('Основну інформацію занесено. Тепер потрібно перевірити забрані зі штатного розкладу надбавки, та, якщо це потрібно, додати нових надбавок, які надаються при прийомі на роботу. А також перевірте режим праці!', mtInformation, [mbOk], 0);

        BonusQuery.Close;
        BonusQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        BonusQuery.Open;
        PageControl1.ActivePageIndex := 1;
        FMode := emModify;
        ModalResult := mrNone;
    end
    else if FMode = emModify then
    begin

            // Updating Data in Man_Moving

        if RadioButton4.Checked then DateEnd.Date := PersonalCommon.Consts_Query['DATE_END'];

        IS_MAIN := 0;

        if RadioButton1.Checked then IS_MAIN := 1;

        Stavki_ := StrToFloat(StavkiNumber.Text);

        Kol_Stavok := Stavki_;

        DecimalSeparator := '.';

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_MAN_MOVING(' + IntToStr(ID_MAN_MOVING) + ',' +
                IntToStr(ID_PCARD) + ',''' +
                DateToStr(DateBegin.Date) + ''',''' +
                DateToStr(DateEnd.Date) + ''',' +
                IntToStr(ID_Moving_Type) + ',''' +
                FloatToStr(Stavki_) + ''',' +
                IspitSrok.Text + ',' +
                StagirovkaSrok.Text + ',' +
                IntToStr(IS_MAIN) + ',' +
                IntToStr(ID_SHTATRAS) + ',' +
                IntToStr(WorkModeBox.GetId) + ',' +
                IntToStr(real_shift) + ',' +
                IntToStr(Use_Kol_Stavok) + ',' +
                QuotedStr(Reason.Value) + ')';
            ExecQuery(OutputQuery);

                    // Пишем примечание
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'update MAN_MOVING set NOTE = ' + QuotedStr(Note.Value) +
                ' where id_man_moving = ' + IntToStr(ID_MAN_MOVING);
            ExecQuery(OutputQuery);

            if (id_shtatras <> previus_id_shtatras) then
            begin
                OutputQuery.Close;
                OutputQuery.SQL.Text := 'EXECUTE PROCEDURE COPY_BONUSES_TO_MAN_BONUS(' + IntToStr(ID_ORDER) + ',1)';
                ExecQuery(OutputQuery);
            end;

        except on E: Exception do
            begin
                PersonalCommon.WriteTransaction.Rollback;
                ModalResult := mrNone;
                MessageDlg('При занесенні данних у базу виникла помилка: ' + E.message, mtError, [mbOk], 0);
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;
        DecimalSeparator := ',';

        if (id_shtatras <> previus_id_shtatras) then
        begin
            MessageDlg('Було змінено посаду штатного розкладу. Тепер потрібно перевірити забрані зі штатного розкладу надбавки, та, якщо це потрібно, додати нових надбавок, які надаються при прийомі на роботу.', mtInformation, [mbOk], 0);

            BonusQuery.Close;
            BonusQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
            BonusQuery.Open;

            PageControl1.ActivePageIndex := 1;

            previus_id_shtatras := id_shtatras;

            ModalResult := mrNone;
        end;
    end;
end;

procedure TAcceptToWorkForm.CancelButtonClick(Sender: TObject);
begin
    if FMode = emNew then
        ModalResult := mrCancel
    else
        ModalResult := mrOk;
end;

procedure TAcceptToWorkForm.Button2Click(Sender: TObject);
var
    Params: TSpParams;
    Temp: TSpForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'ini_SPZ';
        IdField := 'Id_SPZ';
        SpFields := 'SPZ';
        ComboField := 'SPZ';
        ReadOnly := True;
        SelectProcName := 'Ini_SPZ_Select';
        ColumnNames := 'Шифр,Найменування';
        Title := 'Шифри виробничих витрат';
        SpMode := spmSelect;
    end;

    Temp := TSpForm.Create(Self);
    Temp.Init(Params);
    Temp.ShowModal;

    if (Temp.ModalResult = mrOk) then
    begin
        ID_SPZ := Temp.ResultQuery['ID_SPZ'];
    end;

    Temp.Free;
end;

procedure TAcceptToWorkForm.CheckBox2Click(Sender: TObject);
begin
    StagirovkaSrok.Enabled := CheckBox2.Checked;
    if CheckBox2.Checked = False then
        StagirovkaSrok.Text := '0';
end;

procedure TAcceptToWorkForm.SelectPersonButtonClick(Sender: TObject);
var
    temp: TPeopleViewForm;
    PCard: TPCardsDetailsForm;
begin
    temp := TPeopleViewForm.Create(Self);
    temp.Select := True;
    temp.Prepare(True);
    temp.ShowModal;

    if (temp.ModalResult = mrOk) then
    begin
        CheckForPassportQuery.Close;
        CheckForPassportQuery.Params.ParamValues['ID_MAN'] := temp.ResultQuery['ID_MAN'];
        CheckForPassportQuery.Open;

        if not CheckForPassportQuery.IsEmpty then
        begin
            CheckForPCardQuery.Close;
            CheckForPCardQuery.Params.ParamValues['ID_MAN'] := temp.ResultQuery['ID_MAN'];
            CheckForPCardQuery.ParamByName('Date_Accept').AsDate := DateBegin.Date;
            CheckForPCardQuery.Open;

            if CheckForPCardQuery.IsEmpty then
            begin
                PCard := TPCardsDetailsForm.Create(self);
                PCard.Mode := emNew;
                PCard.Id_PCard := -1;
                PCard.Id_Man := temp.ResultQuery['ID_MAN'];
                PCard.PrepareForm;
                MessageDlg('Для вибраної людини немає особистої картки (або картка закрита), тому зараз треба її створити.', mtInformation, [mbOk], 0);
                PCard.ShowModal;

                if PCard.ModalResult = mrOk then
                begin
                    ID_MAN := temp.ResultQuery['ID_MAN'];
                    ID_PCARD := PCard.IdPCard;
                    FIO.Text := temp.ResultQuery['FIO'];
                end;
            end
            else
            begin
                ID_MAN := temp.ResultQuery['ID_MAN'];
                ID_PCARD := CheckForPCardQuery['Id_PCard'];
                FIO.Text := temp.ResultQuery['FIO'];
                Reason.Value := 'заява ' + temp.ResultQuery['Familia'] +
                    ' ' + Copy(temp.ResultQuery['Imya'], 1, 1) + '.' +
                    Copy(temp.ResultQuery['Otchestvo'], 1, 1) + '.';

            end;
        end
        else
            MessageDlg('Для вибраної людини немає паспортних данних. Треба спочатку заповнити їх у довіднику "Фізичні особи".', mtError, [mbOk], 0);
    end;

    temp.Free;
end;

procedure TAcceptToWorkForm.Button5Click(Sender: TObject);
var
    temp: TSpMovingTypeForm;
begin
    temp := TSpMovingTypeForm.Create(Self, 1);
    temp.ShowModal;

    if (temp.ModalResult = mrOk) then
    begin
        ID_MOVING_TYPE := temp.InputQuery['ID_MOVING_TYPE'];
        MovingType.Text := temp.InputQuery['NAME_MOVING_TYPE'];
    end;

    temp.Free;
end;

procedure TAcceptToWorkForm.StavkiNumberKeyPress(Sender: TObject;
    var Key: Char);
begin
    if (Pos(StavkiNumber.Text, ',') <> 0) and (Key <> #08) then Key := #0;

    if Key = '.' then Key := ',';
end;

procedure TAcceptToWorkForm.FormClick(Sender: TObject);
begin
    if FMode = emView then MessageDlg('Ця інформація доступна тільки для перегляду', mtError, [mbOk], 0);
end;

procedure TAcceptToWorkForm.SpeedButton1Click(Sender: TObject);
var
    temp: TShtatRasForm;
begin
    temp := TShtatRasForm.Create(Self, spmReadOnly + [spfCantRemoveFilter], -1, -1, True, DateBegin.Date);
    temp.WindowState := wsMaximized;
    temp.ShowModal;

    if temp.ModalResult = mrOk then
    begin

        if FMode = emModify then Previus_Id_Shtatras := ID_SHTATRAS;

        ID_SHTATRAS := temp.ShtatQuery['ID_SHTATRAS'];

        if FMode = emNew then Previus_Id_Shtatras := ID_SHTATRAS;

        // Проставляем данные в информационный блок Посада штатного розкладу

        Department.Caption := temp.DepartmentsQuery['NAME_SHORT'];
        Post.Caption := temp.ShtatQuery['NAME_POST'];

        if temp.ShtatQuery['Num_Digit'] <= 0 then
            Digit.Caption := 'оклад'
        else
            Digit.Caption := IntToStr(temp.ShtatQuery['Num_Digit']);

        Money.Caption := temp.ShtatQuery['MONEY'];
        Stavki.Caption := temp.ShtatQuery['KOL_STAVOK'];
        Tarnet.Caption := temp.ShtatQuery['NAME_TAR_NET'];
        PostDateBeg.Caption := temp.ShtatQuery['DATE_BEG'];
        PostDateEnd.Caption := temp.ShtatQuery['DATE_END'];
        PayForm.Caption := temp.ShtatQuery['NAME_PAY_FORM'];
        WorkCond.Caption := temp.ShtatQuery['NAME_WORK_COND'];

        // Меняем срок принятия в соответствии с полученным штатным расписанием

        DateEnd.Date := temp.ShtatQuery['DATE_END'];
        WorkModeBox.Prepare(temp.ShtatQueryID_WORK_MODE.Value, temp.ShtatQueryNAME_WORK_MODE.Value);
    end;

    temp.Free;
end;

procedure TAcceptToWorkForm.FormCreate(Sender: TObject);
begin
    InputQuery.Transaction := PersonalCommon.ReadTransaction;
    ShtatQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    CheckForManQuery.Transaction := PersonalCommon.ReadTransaction;
    CheckManForMainWorkQuery.Transaction := PersonalCommon.ReadTransaction;
    CheckForPassportQuery.Transaction := PersonalCommon.ReadTransaction;
    CheckForPCardQuery.Transaction := PersonalCommon.ReadTransaction;
    BonusQuery.Transaction := PersonalCommon.ReadTransaction;
    PageControl1.ActivePageIndex := 0;
    Top := 0;
end;

procedure TAcceptToWorkForm.AddButtonClick(Sender: TObject);
var
    form: TAddPostBonusForm;
begin
    form := TAddPostBonusForm.Create(Self, emNew, abmManBonus);
    form.Id_Order := Id_Order;
    form.Num_Item := Num_Item;
    form.Id_Man_Bonus := -1;
    form.Id_Man_Moving := Id_Man_Moving;
    if form.ShowModal = mrOk then
    begin
        BonusQuery.Close;
        BonusQuery.Open;
        GridResize(BonusGrid);
    end;
    form.Free;
end;

procedure TAcceptToWorkForm.ModifyButtonClick(Sender: TObject);
var
    form: TAddPostBonusForm;
begin
    if BonusQuery.IsEmpty then
    begin
        MessageDlg('Немає записів для редагування!', mtError, [mbOk], 0);
        exit;
    end;

    form := TAddPostBonusForm.Create(Self, emModify, abmManBonus);
    form.Id_Order := Id_Order;
    form.Num_Item := Num_Item;
    form.Id_Man_Bonus := BonusQuery['Id_Man_Bonus'];

    Form.NeedDateCheck := True;
    Form.MinDateBeg := DateBegin.Date;

    if RadioButton3.Checked then
        Form.MaxDateBeg := DateEnd.Date
    else
        Form.MaxDateBeg := StrToDate('31.12.2150');

    if form.ShowModal = mrOk then
    begin
        BonusQuery.Close;
        BonusQuery.Open;
        GridResize(BonusGrid);
    end;
end;

procedure TAcceptToWorkForm.DeleteButtonClick(Sender: TObject);
begin
    if BonusQuery.IsEmpty then
    begin
        MessageDlg('Немає записів для вилучення!', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи справді ви бажаєте вилучити цю надбавку?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_DELETE(' +
        IntToStr(BonusQuery['Id_Man_Bonus']) +
        ',' + IntToStr(Id_Order) + ');';
    ExecQuery(OutputQuery);

    BonusQuery.Close;
    BonusQuery.Open;
    GridResize(BonusGrid);
end;

procedure TAcceptToWorkForm.BonusQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(BonusGrid);
end;

procedure TAcceptToWorkForm.SpeedButton2Click(Sender: TObject);
begin
    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE COPY_BONUSES_TO_MAN_BONUS(' + IntToStr(ID_ORDER) + ',1)';
    ExecQuery(OutputQuery);

    BonusQuery.Close;
    BonusQuery.Open;
end;

procedure TAcceptToWorkForm.DateBeginChange(Sender: TObject);
begin
    // Обнуляем айдишки и едиты

    ID_SHTATRAS := -1;

    ClearShtatBlock;

    WorkModeBox.OnChange(Sender);

    FIO.Text := '';

end;

procedure TAcceptToWorkForm.WorkModeBoxChange(Sender: TObject);
begin
    if (WorkModeBox.GetId <> -1) and (DateBegin.Date <= DateEnd.Date) then Real_Shift := DrawWorkModeExample(WorkModeGrid, DateBegin.Date, DateEnd.Date, WorkModeBox.GetId, ShiftSpin.Value, 9);
end;

procedure TAcceptToWorkForm.HospitalOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('Asup\AsupHospital');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(FibDatabase.Handle);
            FieldValues['Select'] := 1;
            FieldValues['NewVersion'] := PersonalCommon.NewVersion;
            Post;
        end;
                // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Man_Hosp'];
            DisplayText := sp.Output['DisplayText'];
        end;
        sp.Free;
    end;
end;

procedure TAcceptToWorkForm.IsHospitalClick(Sender: TObject);
begin
    if IsHospital.Checked then
    begin
        IsHoliday.Checked := False;
        Holiday.Value := null;
        Holiday.DisplayText := '';
    end
    else
    begin
        Hospital.Value := null;
        Hospital.DisplayText := '';
    end;

    if IsHoliday.Checked then
    begin
        RadioButton3.Checked := True;
    end
    else
    begin
    end;
end;

end.
