{-$Id: MoveManUnit.pas,v 1.15 2008/03/18 14:41:59 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Перевод работника по приказу"                  }
{    Ввод информации по переводу на другое место работы                        }
{    Ответственный: Кропов Валентин                                            }

unit MoveManUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, CheckEditUnit, Db,
    IBCustomDataSet, IBQuery, PersonalCommon, SpCommon, variants, Grids,
    DBGrids, SpComboBox, WorkModeCentral, GoodFunctionsUnit, Spin, uFControl,
    uLabeledFControl, uMemoControl, uSpravControl;

type
    TMoveManForm = class(TForm)
        CancelButton: TBitBtn;
        OkButton: TBitBtn;
        ShtatQuery: TIBQuery;
        ShtatQueryDEPARTMENT_FULL: TIBStringField;
        ShtatQueryDEPARTMENT_SHORT: TIBStringField;
        ShtatQueryNAME_POST: TIBStringField;
        ShtatQueryDIGIT: TIntegerField;
        ShtatQueryDATE_BEG: TDateField;
        ShtatQueryDATE_END: TDateField;
        ShtatQueryWORK_COND: TIBStringField;
        ShtatQueryPAY_FORM: TIBStringField;
        ShtatQueryMONEY: TIBBCDField;
        ShtatQueryNAME_TAR_NET: TIBStringField;
        ShtatQueryVACANT_STAVOK: TIBBCDField;
        InputQuery: TIBQuery;
        OutputQuery: TIBQuery;
        CheckPersonQuery: TIBQuery;
        InputQuery2: TIBQuery;
        CheckPersonQueryNUM_ORDER: TIBStringField;
        InputQueryOLD_ID_MAN_MOVING: TIntegerField;
        InputQueryNEW_ID_MAN_MOVING: TIntegerField;
        InputQueryID_PCARD: TIntegerField;
        InputQueryFIO: TIBStringField;
        InputQueryOLD_DATE_BEG: TDateField;
        InputQueryOLD_DATE_END: TDateField;
        InputQueryMOVE_DATE_BEG: TDateField;
        InputQueryMOVE_DATE_END: TDateField;
        InputQueryIS_TEMP: TIntegerField;
        InputQueryNEW_ID_MOVING_TYPE: TIntegerField;
        InputQueryMOVE_REASON: TIBStringField;
        InputQueryOLD_ID_SHTATRAS: TIntegerField;
        InputQueryNEW_ID_SHTATRAS: TIntegerField;
        InputQueryNEW_KOL_STAVOK: TIBBCDField;
        InputQueryOLD_DEPARTMENT_NAME: TIBStringField;
        InputQueryOLD_POST_NAME: TIBStringField;
        InputQueryNEW_NAME_MOVING_TYPE: TIBStringField;
        CheckPersonQueryDATE_ORDER: TDateField;
        CheckPersonQueryNAME_STATUS: TIBStringField;
        PageControl1: TPageControl;
        MainSheet: TTabSheet;
        BonusSheet: TTabSheet;
        BonusPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        BonusGrid: TDBGrid;
        Panel3: TPanel;
        GroupBox1: TGroupBox;
        SelectPersonButton: TSpeedButton;
        Label1: TLabel;
        Label5: TLabel;
        Label11: TLabel;
        Label7: TLabel;
        WorkDateBeg: TLabel;
        Label8: TLabel;
        EndLessLabel: TLabel;
        WorkDateEnd: TLabel;
        SpeedButton1: TSpeedButton;
        Label17: TLabel;
        Label19: TLabel;
        Label20: TLabel;
        FIO: TEdit;
        OldDepartment: TEdit;
        OldPost: TEdit;
        SelectPodrazdAndPostButton: TButton;
        GroupBox3: TGroupBox;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label6: TLabel;
        Label10: TLabel;
        Label9: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label12: TLabel;
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
        MoveDateBeg: TDateTimePicker;
        GroupBox2: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        GroupBox4: TGroupBox;
        RadioButton4: TRadioButton;
        RadioButton3: TRadioButton;
        MoveDateEnd: TDateTimePicker;
        MoveReason: TEdit;
        StavkiNumber: TCheckEdit;
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
        InputQueryNEW_ID_WORK_MODE: TIntegerField;
        InputQueryNEW_NAME_WORK_MODE: TIBStringField;
        SpeedButton2: TSpeedButton;
        WorkModeTabSheet: TTabSheet;
        Label63: TLabel;
        WorkModeBox: TSpComboBox;
        Label13: TLabel;
        ShiftSpin: TSpinEdit;
        Label21: TLabel;
        WorkModeGrid: TStringGrid;
        InputQueryNEW_SHIFT: TIntegerField;
        Label18: TLabel;
        MovingType: TEdit;
        Button5: TButton;
        InputQueryOLD_KOL_STAVOK: TIBBCDField;
        ShtatQueryID_WORK_MODE: TIntegerField;
        ShtatQueryNAME_WORK_MODE: TIBStringField;
        Note: TqFMemoControl;
        InputQueryNOTE: TIBStringField;
        Hospital: TqFSpravControl;
        IsHospital: TCheckBox;
        InputQueryID_MAN_HOSPITAL: TIntegerField;
        InputQueryHOSP_STR: TIBStringField;
        HolidayPanel: TPanel;
        Holiday: TqFSpravControl;
        IsHoliday: TCheckBox;
        UseKolStavokBox: TCheckBox;
        InputQueryOLD_IS_MAIN: TIntegerField;
        InputQueryNEW_DEPARTMENT_NAME: TIBStringField;
        InputQueryNEW_ID_DEPARTMENT: TIntegerField;
        InputQueryOLD_CATEGORY_NAME: TIBStringField;
        InputQueryNEW_WORK_COND: TIBStringField;
        InputQueryNEW_PAY_FORM: TIBStringField;
        InputQueryNEW_CATEGORY_NAME: TIBStringField;
        InputQueryNEW_POST_NAME: TIBStringField;
        InputQueryOLD_NAME_TAR_NET: TIBStringField;
        InputQueryOLD_MONEY: TIBBCDField;
        InputQueryOLD_DIGIT: TIntegerField;
        InputQueryNEW_NAME_TAR_NET: TIBStringField;
        InputQueryNEW_MONEY: TIBBCDField;
        InputQueryNEW_DIGIT: TIntegerField;
        InputQueryBONUS_STRING: TIBStringField;
        InputQueryOLD_BONUS_STRING: TIBStringField;
        InputQueryOLD_OKL_STR: TIBStringField;
        InputQueryNEW_OKL_STR: TIBStringField;
        InputQueryOLD_PARENT_DEPARTMENT: TIBStringField;
        InputQueryNEW_PARENT_DEPARTMENT: TIBStringField;
        InputQueryOLD_ID_DEPARTMENT: TIntegerField;
        InputQueryOLD_ID_POST: TIntegerField;
        InputQueryNEW_ID_POST: TIntegerField;
        InputQueryUSE_KOL_STAVOK_IN_TABLE: TIntegerField;
    BonusQueryPERCENT: TIBBCDField;
    BonusQueryOKLAD_STR: TIBStringField;
    BonusQueryPRIM: TIBStringField;
    BonusQueryPATH: TIBStringField;
    BonusQueryID_POST: TIntegerField;
    BonusQueryIS_SHADOW: TIntegerField;
        procedure FormCreate(Sender: TObject);
        function Prepare: Boolean;
        procedure ClearShtatBlock;
        procedure RefreshShtatBlock;
        procedure StavkiNumberKeyPress(Sender: TObject; var Key: Char);
        procedure SelectPersonButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure Button5Click(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        function CheckPersonForMove(TEST_ID_MAN_MOVING: Integer): Boolean;
        procedure RadioButton1Click(Sender: TObject);
        procedure RadioButton2Click(Sender: TObject);
        procedure RadioButton3Click(Sender: TObject);
        procedure RadioButton4Click(Sender: TObject);
        procedure FormClick(Sender: TObject);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure BonusQueryAfterOpen(DataSet: TDataSet);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure SpeedButton2Click(Sender: TObject);
        procedure MoveDateBegChange(Sender: TObject);
        procedure WorkModeBoxChange(Sender: TObject);
        procedure IsHospitalClick(Sender: TObject);
        procedure HospitalOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
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
        ID_PCARD: Integer;
        ID_MAN_MOVING: Integer;
        ID_MOVING_TYPE: Integer;
        ID_SHTATRAS: Integer;
        OLD_ID_SHTATRAS: Integer;

        Previus_Id_Shtatras: Integer;
        NEW_ID_MAN_MOVING: Integer;
        New_Kol_Stavok: Double;
        Old_Kol_Stavok: Double;

        real_shift: Integer;
    end;

var
    MoveManForm: TMoveManForm;

implementation

uses SpMovingTypeUnit, ShtatRas, SpFormUnit, AddPostBonus, uCommonSp;

{$R *.DFM}

//Функйия проверяет пытается ли кто-то уже перевести с указанного мувинга человека на другую должность

function TMoveManForm.CheckPersonForMove(TEST_ID_MAN_MOVING: Integer): Boolean;
begin
    if TEST_ID_MAN_MOVING <> ID_MAN_MOVING then
    begin
        CheckPersonQuery.Close;
        CheckPersonQuery.Params.ParamValues['ID_MAN_MOVING'] := TEST_ID_MAN_MOVING;
        CheckPersonQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        CheckPersonQuery.Open;
        result := not CheckPersonQuery.IsEmpty;
        if result = True then
            MessageDlg('Вибрану людину вже хтось намагаеться перевести на іншу посаду наказом № ' +
                CheckPersonQueryNUM_ORDER.Value + ' від ' +
                CheckPersonQueryDATE_ORDER.AsString + ', який має статус "' +
                CheckPersonQueryNAME_STATUS.Value + '"', mtError, [mbOk], 0);
    end
    else
        result := False;
end;

procedure TMoveManForm.RefreshShtatBlock;
var
    tmp: Double;
begin

    ShtatQuery.Close;
    ShtatQuery.SQL.Text := 'SELECT * FROM GET_SHTATRAS_INFO(' + IntToStr(ID_SHTATRAS) + ',''' +
        DateToStr(MoveDateBeg.Date) + ''');';
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

        if (ID_MOVING_TYPE = 2) then
            tmp := old_kol_stavok
        else
            tmp := 0;

        Stavki.Caption := FloatToStr(ShtatQueryVACANT_STAVOK.Value + New_Kol_Stavok + tmp);
        Tarnet.Caption := ShtatQueryNAME_TAR_NET.Value;
        PostDateBeg.Caption := ShtatQueryDATE_BEG.AsString;
        PostDateEnd.Caption := ShtatQueryDATE_END.AsString;
        PayForm.Caption := ShtatQueryPAY_FORM.Value;
        WorkCond.Caption := ShtatQueryWORK_COND.Value;

        WorkModeBox.Prepare(ShtatQueryID_WORK_MODE.Value, ShtatQueryNAME_WORK_MODE.Value);
    end
    else
    begin
        ID_SHTATRAS := -1;
        ClearShtatBlock;
    end;
end;

procedure TMoveManForm.ClearShtatBlock;
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

function TMoveManForm.Prepare: Boolean;
begin

    result := True;

    if FMode = emNew then
    begin
        Caption := 'Переведення людини (нове)';
        ID_PCARD := -1;
        ID_MAN_MOVING := -1;
        ID_MOVING_TYPE := -1;
        ID_SHTATRAS := -1;
        ClearShtatBlock;
        WorkDateBeg.Caption := '';
        WorkDateEnd.Caption := '';
        EndLessLabel.Visible := False;
        MoveDateEnd.Date := EncodeDate(CurrentYear, 12, 31);
        MoveDateBeg.Date := ORDER_DATE;

        BonusSheet.TabVisible := False;

        WorkModeBox.Prepare(-1, '');
    end;

    if (FMode = emModify) or (FMode = emView) then
    begin
        InputQuery.Close;
        InputQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        InputQuery.Params.ParamValues['NUM_ITEM'] := NUM_ITEM;
        InputQuery.Open;

        if (InputQuery.IsEmpty) or (VarIsNull(InputQuery['OLD_ID_MAN_MOVING'])) then
        begin
            MessageDlg('Можливо хтось додав наказ, але ще на заповнив усю необхідну інформацію, зачекайте. Або у базі данних виникла помилка.', mtError, [mbOk], 0);
            result := false;
            Exit;
        end;

        MoveDateBeg.Date := InputQueryMOVE_DATE_BEG.Value;

        New_Kol_Stavok := InputQueryNEW_KOL_STAVOK.Value;
        ID_PCARD := InputQueryID_PCARD.Value;
        ID_MAN_MOVING := InputQueryOLD_ID_MAN_MOVING.Value;
        NEW_ID_MAN_MOVING := InputQueryNEW_ID_MAN_MOVING.Value;
        ID_MOVING_TYPE := InputQueryNEW_ID_MOVING_TYPE.Value;
        ID_SHTATRAS := InputQueryNEW_ID_SHTATRAS.Value;
        Previus_Id_Shtatras := Id_Shtatras;
        OLD_ID_SHTATRAS := InputQueryOLD_ID_SHTATRAS.Value;
        FIO.Text := InputQueryFIO.Value;
        OldDepartment.Text := InputQueryOLD_DEPARTMENT_NAME.Value;
        OldPost.Text := InputQueryOLD_POST_NAME.Value;
        WorkDateBeg.Caption := InputQueryOLD_DATE_BEG.AsString;
        WorkDateEnd.Caption := InputQueryOLD_DATE_END.AsString;
        Old_Kol_Stavok := InputQueryOLD_KOL_STAVOK.Value;
        Note.Value := InputQueryNOTE.Value;

        if (not VarIsNull(InputQuery['Id_Man_Hospital'])) and (not VarIsNull(InputQuery['Hosp_Str'])) then
        begin
            IsHospital.Checked := True;
            Hospital.Value := InputQueryID_MAN_HOSPITAL.Value;
            Hospital.DisplayText := InputQueryHOSP_STR.Value;
        end;

        if WorkDateEnd.Caption <> DateToStr(PersonalCommon.Consts_Query['DATE_END']) then
        begin
            EndLessLabel.Visible := False;
            WorkDateEnd.Visible := True;
        end
        else
        begin
            WorkDateEnd.Visible := False;
            EndLessLabel.Visible := True;
        end;

        if InputQueryIS_TEMP.Value = 0 then
            RadioButton1.Checked := True
        else
            RadioButton2.Checked := True;

        if InputQueryMOVE_DATE_END.Value = PersonalCommon.Consts_Query['DATE_END'] then
        begin
            RadioButton4.Checked := True;
            MoveDateEnd.Date := Date;
        end
        else
        begin
            RadioButton3.Checked := True;
            MoveDateEnd.Date := InputQueryMOVE_DATE_END.Value;
        end;

        if RadioButton2.Checked then RadioButton4.Enabled := false;

        MovingType.Text := InputQueryNEW_NAME_MOVING_TYPE.Value;
        MoveReason.Text := InputQueryMOVE_REASON.Value;
        RefreshShtatBlock;
        StavkiNumber.Text := InputQueryNEW_KOL_STAVOK.AsString;

        WorkModeBox.Prepare(InputQueryNEW_ID_WORK_MODE.Value, InputQueryNEW_NAME_WORK_MODE.Value);

        if InputQuery['Use_Kol_Stavok_In_Table'] = 1 then
            UseKolStavokBox.Checked := True
        else
            UseKolStavokBox.Checked := False;

//    ShiftSpin.Value := ConvertShift(InputQueryNEW_SHIFT.Value, InputQueryMOVE_DATE_BEG.Value, False);

        // юзаем РЕАЛЬНУЮ сдвижку, нормализуем
        WorkModeCenter.Id_Work_Mode := InputQueryNEW_ID_WORK_MODE.Value;
        WorkModeCenter.Shift := InputQueryNEW_SHIFT.Value;
        ShiftSpin.Value := WorkModeCenter.NormalizedShift;

        BonusSheet.TabVisible := True;

        BonusQuery.Close;
        BonusQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        BonusQuery.Open;
    end;

    if FMode = emModify then Caption := 'Переведення людини (редагування)';

    if FMode = emView then
    begin
        Caption := 'Переведення людини (тільки перегляд)';
        GroupBox1.Enabled := False;
        OkButton.Visible := False;
        SelectPersonButton.Visible := False;
        SelectPodrazdAndPostButton.Visible := False;
        SpeedButton1.Visible := False;
        CancelButton.Left := 168;
        CancelButton.Caption := 'Закрити';
        BonusPanel.Visible := False;
        WorkModeTabSheet.Visible := False;
        WorkModeBox.Enabled := False;
        ShiftSpin.Enabled := False;
        WorkModeGrid.Enabled := False;
        Note.Enabled := False;
        Note.Blocked := True;
        IsHospital.Enabled := False;
        Hospital.Enabled := False;
    end;
end;

procedure TMoveManForm.FormCreate(Sender: TObject);
begin
    InputQuery.Transaction := PersonalCommon.ReadTransaction;
    InputQuery2.Transaction := PersonalCommon.ReadTransaction;
    ShtatQuery.Transaction := PersonalCommon.ReadTransaction;
    CheckPersonQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    BonusQuery.Transaction := PersonalCommon.ReadTransaction;
    PageControl1.ActivePageIndex := 0;
    Top := 0;
end;

procedure TMoveManForm.StavkiNumberKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Pos(StavkiNumber.Text, ',') <> 0 then Key := #0;
    if Key = '.' then Key := ',';
end;

procedure TMoveManForm.SelectPersonButtonClick(Sender: TObject);
var
    new_id_pcard: Integer;
begin
    new_id_pcard := GoodfunctionsUnit.getpcard(MoveDateBeg.Date);

    if new_id_pcard <> -1 then
    begin
    // Если мы выбрали другого человека, то нужно обнулить мувинг, если тот выбран
        if (ID_PCARD <> -1) and (ID_PCARD <> new_id_pcard) then
        begin
            ID_MAN_MOVING := -1;
            OldDepartment.Text := '';
            OldPost.Text := '';
            SelectPodrazdAndPostButton.Enabled := True;
        end;
    // Проыеряем есть ли для текущего человека хотя бы одна запись в Man_Moving
        InputQuery2.Close;
        InputQuery2.SQL.Text := 'SELECT DATE_BEG, DATE_END, ID_MAN_MOVING, ID_SHTATRAS, KOL_STAVOK FROM GET_CUR_MOVING_BY_ID_PCARD(' + IntToStr(new_Id_PCard) + ',' + QuotedStr(DateToStr(MoveDateBeg.Date)) + ')';
        InputQuery2.Open;

        if not InputQuery2.IsEmpty then
        begin
            ID_PCARD := new_id_pcard;
            FIO.Text := GoodFunctionsUnit.Fam;

      // Проверяем, если эта запись одна, то сразу проставляем отдел и должность человека и дисейблим кнопку выбора жтих штук
            InputQuery2.FetchAll;
            if InputQuery2.RecordCount = 1 then
            begin

{        if InputQuery2['DATE_BEG'] = InputQuery2['DATE_END'] then begin
          FIO.Text := '';
          ID_PCARD := -1;
          MessageDlg('Неможливо перевести цю людину з цієї посади, бо вона принята на один день!',mtError,[mbOk],0);
          exit;
        end;
}

                if CheckPersonForMove(InputQuery2['ID_MAN_MOVING']) then
                begin
                    FIO.Text := '';
                    ID_PCARD := -1;
                    exit;
                end;

                WorkDateBeg.Caption := DateToStr(InputQuery2['DATE_BEG']);
                WorkDateEnd.Caption := DateToStr(InputQuery2['DATE_END']);

                if WorkDateEnd.Caption <> DateToStr(PersonalCommon.Consts_Query['DATE_END']) then
                begin
                    EndLessLabel.Visible := False;
                    WorkDateEnd.Visible := True;
                end
                else
                begin
                    WorkDateEnd.Visible := False;
                    EndLessLabel.Visible := True;
                end;

                SelectPodrazdAndPostButton.Enabled := False;

                ID_MAN_MOVING := InputQuery2['ID_MAN_MOVING'];

                OLD_ID_SHTATRAS := InputQuery2['ID_SHTATRAS'];

                Old_Kol_Stavok := InputQuery2['KOL_STAVOK'];

        // Если это изменение процента ставки, то проставляем старый идентификатор
                if (ID_MOVING_TYPE = 2) then
                begin
                    ID_SHTATRAS := OLD_ID_SHTATRAS;
                    RefreshShtatBlock;
                end;

                InputQuery2.Close;
                InputQuery2.SQL.Text := 'SELECT NAME_FULL, NAME_POST ' +
                    'FROM   DT_SHTATRAS S, SP_DEPARTMENT D, SP_POST P ' +
                    'WHERE  S.Id_Shtatras = ' + IntToStr(OLD_ID_SHTATRAS) +
                    'AND    S.Id_Department = D.Id_Department ' +
                    'and    s.Id_Post = p.Id_Post ' +
                    'and    (CURRENT_TIMESTAMP between s.Use_Beg and s.Use_End) ' +
                    'and    (CURRENT_TIMESTAMP between d.Use_Beg and d.Use_End)';
                InputQuery2.Open;
                OldDepartment.Text := InputQuery2['NAME_FULL'];
                OldPost.Text := InputQuery2['NAME_POST'];
            end;
        end
        else
            MessageDlg('Неможливо звільнити вибраного робітника, бо він ніде не працює', mtError, [mbOk], 0);
    end;
end;

procedure TMoveManForm.OkButtonClick(Sender: TObject);
var
    IS_TEMP: Integer;
    Stavki_: Real;
    OldDecimalSeparator: Char;
    Hosp_Str, Hol_Str: string;
    Use_Kol_Stavok: Integer;
begin
    if UseKolStavokBox.Checked then Use_Kol_Stavok := 1
    else Use_Kol_Stavok := 0;

    if ID_PCARD = -1 then
    begin
        MessageDlg('Виберіть людину, яку треба перевести!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if ID_MAN_MOVING = -1 then
    begin
        MessageDlg('Виберіть підрозділ, на якому працює людина!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        Button5.SetFocus;
        exit;
    end;

    if (MoveDateBeg.Date) < StrToDate(WorkDateBeg.Caption) then
    begin
        MessageDlg('Дата початку переведення не може бути меньш ніж дата початку роботи на попередньому місці!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        if MoveDateBeg.Enabled then
            MoveDateBeg.SetFocus;
        exit;
    end;

    if ((MoveDateEnd.Date > StrToDate(WorkDateEnd.Caption)) and (EndLessLabel.Visible = False) and (RadioButton3.Checked)) then
    begin
        MessageDlg('Дата кінця переведення не може бути більш ніж дата початку роботи на попередньому місці!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        if MoveDateEnd.Enabled then
            MoveDateEnd.SetFocus;
        exit;
    end;

    if ((MoveDateEnd.Date = StrToDate(WorkDateEnd.Caption)) and (RadioButton2.Checked) and (RadioButton3.Checked)) then
    begin
        MessageDlg('Дата кінця переведення не може бути такою же як дата початку роботи на попередньому місці при тимчасовому переведенні!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        if MoveDateEnd.Enabled then
            MoveDateEnd.SetFocus;
        exit;
    end;

    if (MoveDateBeg.Date > MoveDateEnd.Date) and (not RadioButton4.Checked) then
    begin
        MessageDlg('Термін переведення повинен бути більше ніж дата переведення!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        if MoveDateEnd.Enabled then
            MoveDateEnd.SetFocus;
        exit;
    end;

    if ID_MOVING_TYPE = -1 then
    begin
        MessageDlg('Потрібно вибрати тип переміщення!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if MoveReason.Text = '' then
    begin
        MessageDlg('Введіть підставу для переведення людини!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        MoveReason.SetFocus;
        exit;
    end;

    if (ID_SHTATRAS = -1) then
    begin
        MessageDlg('Виберіть вакансію з штатного розкладу!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        exit;
    end;

    if StavkiNumber.Text = '' then
    begin
        MessageDlg('Потрібно ввести кількість ставок!', mtError, [mbOk], 0);
        ModalResult := mrNone;
        StavkiNumber.SetFocus;
        exit;
    end;

    if (ID_SHTATRAS <> -1) then
    begin

        // RefreshShtatBlock;

        if (Stavki.Caption = '0') then
        begin
            MessageDlg('Такої вакансії вже немає, мабуть ії вже хтось заняв або вилучив з штатного розкладу. Виберіть іншу вакансію!', mtError, [mbOk], 0);
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

    if IsHoliday.Checked and (VarIsNull(Holiday.Value) or (Holiday.DisplayText = '')) then
    begin
        MessageDlg('Виберіть наказ про відпустку!', mtError, [mbOk], 0);
        exit;
    end;

    // Пишем данные
    IS_TEMP := 0;

    if RadioButton2.Checked then IS_TEMP := 1;

    OldDecimalSeparator := DecimalSeparator;
    DecimalSeparator := ',';
    Stavki_ := StrToFloat(StavkiNumber.Text);
    //DecimalSeparator := '.';
    DecimalSeparator := OldDecimalSeparator;

    if RadioButton4.Checked then MoveDateEnd.Date := PersonalCommon.Consts_Query['DATE_END'];

    New_Kol_Stavok := Stavki_;

    if (IsHospital.Checked) and (not varIsNull(Hospital.Value)) then
        Hosp_Str := IntToStr(Hospital.Value)
    else
        Hosp_Str := 'null';

    if (IsHoliday.Checked) and (not varIsNull(Holiday.Value)) then
        Hol_Str := IntToStr(Holiday.Value)
    else
        Hol_Str := 'null';

    if FMode = emNew then
    begin

        if not OutputQuery.Transaction.Active then OutputQuery.Transaction.StartTransaction;

        try

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' +
                QuotedStr(Num_ORDER) + ',''' +
                DateToStr(Order_DATE) + ''',' +
                QuotedStr(NOTE_ORDER) + ',' +
                IntToStr(1) + ');';
            ID_ORDER := ExecQuery(OutputQuery);

            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_MAN_MOVING FROM MOVE_MAN(' + IntToStr(ID_ORDER) + ',' +
                IntToStr(NUM_ITEM) + ',' +
                IntToStr(ID_MAN_MOVING) + ',' +
                IntToStr(ID_SHTATRAS) + ',' +
                IntToStr(IS_TEMP) + ',''' +
                DateToStr(MoveDateBeg.Date) + ''',''' +
                DateToStr(MoveDateEnd.Date) + ''',' +
                IntToStr(ID_MOVING_TYPE) + ',' +
                QuotedStr(MoveReason.Text) + ',' +
                StringReplace(FloatToStr(Stavki_), ',', '.', []) + ',' +
                IntToStr(WorkModeBox.GetId) + ',' +
                IntToStr(real_shift) + ',' +
                IntToStr(Use_Kol_Stavok) + ');';
            NEW_ID_MAN_MOVING := ExecQuery(OutputQuery);

            // Пишем примечание
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'update MAN_MOVING set NOTE = ' + QuotedStr(Note.Value) + ',' +
                ' id_man_hospital = ' + Hosp_str +
                ' where id_man_moving = ' + IntToStr(NEW_ID_MAN_MOVING);
            ExecQuery(OutputQuery);

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

        BonusSheet.TabVisible := True;

        MessageDlg('Основну інформацію занесено. Тепер потрібно перевірити забрані зі штатного розкладу надбавки, та, якщо це потрібно, додати нових надбавок, які надаються при прийомі на роботу. А також перевірте режим праці!', mtInformation, [mbOk], 0);

        BonusQuery.Close;
        BonusQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        BonusQuery.Open;

        PageControl1.ActivePageIndex := 1;

        FMode := emModify;

        ModalResult := mrNone;

        exit;

    end;

    if FMode = emModify then
    begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE MOVE_MAN_UPDATE(' + IntToStr(ID_ORDER) + ',' +
                IntToStr(NUM_ITEM) + ',' +
                IntToStr(ID_MAN_MOVING) + ',' +
                IntToStr(ID_SHTATRAS) + ',' +
                IntToStr(IS_TEMP) + ',''' +
                DateToStr(MoveDateBeg.Date) + ''',''' +
                DateToStr(MoveDateEnd.Date) + ''',' +
                IntToStr(ID_MOVING_TYPE) + ',' +
                QuotedStr(MoveReason.Text) + ',' +
                StringReplace(FloatToStr(Stavki_), ',', '.', []) + ',' +
                IntToStr(WorkModeBox.GetId) + ',' +
                IntToStr(real_shift) + ',' +
                IntToStr(Use_Kol_Stavok) + ')';
            ExecQuery(OutputQuery);

            // Пишем примечание
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'update MAN_MOVING set NOTE = ' + QuotedStr(Note.Value) + ',' +
                ' id_man_hospital = ' + Hosp_str +
                ' where id_man_moving = ' + IntToStr(NEW_ID_MAN_MOVING);
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
                MessageDlg('При занесенні данних у базу виникла помилка:' + E.message, mtError, [mbOk], 0);
                exit;
            end;
        end;

        PersonalCommon.WriteTransaction.Commit;

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

procedure TMoveManForm.Button5Click(Sender: TObject);
var
    temp: TSpMovingTypeForm;
begin

    if ID_MAN_MOVING = -1 then
    begin
        MessageDlg('Треба вибрати людину, підрозділ та посаду!', mtError, [mbOk], 0);
        exit;
    end;

    temp := TSpMovingTypeForm.Create(Self, 0);
    temp.ShowModal;

    if (temp.ModalResult = mrOk) then
    begin

        ID_MOVING_TYPE := temp.InputQuery['ID_MOVING_TYPE'];
        MovingType.Text := temp.InputQuery['NAME_MOVING_TYPE'];

        // Если это изменение процента ставки, то проставляем старый идентификатор
        if (ID_MOVING_TYPE = 2) then
        begin
            ID_SHTATRAS := OLD_ID_SHTATRAS;
        end;

        if ID_SHTATRAS > 0 then RefreshShtatBlock;
    end;

    temp.Free;
end;

procedure TMoveManForm.SpeedButton1Click(Sender: TObject);
var
    temp: TShtatRasForm;
begin

    if ID_MAN_MOVING = -1 then
    begin
        MessageDlg('Треба вибрати людину, підрозділ та посаду!', mtError, [mbOk], 0);
        exit;
    end;

    if not CheckForFillBool(ID_MOVING_TYPE <> -1, 'Спочатку виберіть тип переміщення!') then exit;

    // Если это изменение процента ставки, то проставляем старый идентификатор
    if (ID_MOVING_TYPE = 2) then
    begin
        MessageDlg('Вибрано тип переміщення "' + MovingType.Text + '". Для цього типу переміщення неможлива зміна позиції штатного розкладу.', mtError, [mbOk], 0);
        exit;
    end;

    temp := TShtatRasForm.Create(Self, spmReadOnly + [spfCantRemoveFilter], -1, -1, True, MoveDateBeg.Date);
    temp.WindowState := wsMaximized;

    temp.ShowModal;

    if temp.ModalResult = mrOk then
    begin

        if FMode = emModify then
            Previus_Id_Shtatras := ID_SHTATRAS;

        ID_SHTATRAS := temp.ShtatQuery['ID_SHTATRAS'];

        if FMode = emNew then
            Previus_Id_Shtatras := ID_SHTATRAS;

{    if ID_SHTATRAS = OLD_ID_SHTATRAS then begin
      MessageDlg('Ця людина вже працює на такій посаді з штатного розкладу! Треба вибрати іншу вакансію з штатного розкладу!',mtError,[mbOk],0);
      ID_SHTATRAS := -1;
      temp.free;
      exit;
    end;
}
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

        WorkModeBox.Prepare(temp.ShtatQueryID_WORK_MODE.Value, temp.ShtatQueryNAME_WORK_MODE.Value);
    end;

    temp.Free;
end;

procedure TMoveManForm.RadioButton1Click(Sender: TObject);
begin
    RadioButton4.Enabled := True;
    RadioButton4.Checked := True;
    RadioButton4Click(Self);
end;

procedure TMoveManForm.RadioButton2Click(Sender: TObject);
begin
    RadioButton4.Enabled := False;
    RadioButton3.Checked := True;
    MoveDateEnd.Enabled := True;
end;

procedure TMoveManForm.RadioButton3Click(Sender: TObject);
begin
    MoveDateEnd.Enabled := True;

    MoveDateEnd.Date := EncodeDate(CurrentYear, 12, 31);
end;

procedure TMoveManForm.RadioButton4Click(Sender: TObject);
begin
    MoveDateEnd.Enabled := False;

    MoveDateEnd.Date := EncodeDate(2150, 12, 31);
end;

procedure TMoveManForm.FormClick(Sender: TObject);
begin
    if FMode = emView then
        MessageDlg('Ця інформація доступна тільки для перегляду!', mtError, [mbOk], 0);
end;

procedure TMoveManForm.SelectPodrazdAndPostButtonClick(Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin
    if ID_PCARD = -1 then
        MessageDlg('Потрібно спочатку вибрати звільняєму людину!', mtError, [mbOk], 0)
    else
    begin

        temp := TSpForm.Create(Self);
        params := TSpParams.Create;
        params.IdField := 'ID_MAN_MOVING';
        params.SpFields := 'NAME_DEPARTMENT_FULL, POST, DATE_BEG, DATE_END, ID_SHTATRAS, KOL_STAVOK';
        params.Title := 'Виберіть підрозділ та посаду, з яких треба звільнити людину';
        params.ColumnNames := 'Підрозділ,Посада, Дата початку,Дата кінця,-,-';
        params.ReadOnly := True;
        params.Table := 'GET_PCARD_MOVINGS(' + IntToStr(ID_PCARD) + ',''' + DateToStr(MoveDateBeg.Date) + ''')';
        params.SpMode := spmSelect;
        temp.Init(params);
        temp.ShowModal;

        if temp.ModalResult = mrOk then
        begin

            ID_MAN_MOVING := temp.ResultQuery['ID_MAN_MOVING'];
            OldDepartment.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            OldPost.Text := temp.ResultQuery['POST'];
            WorkDateBeg.Caption := DateToStr(temp.ResultQuery['DATE_BEG']);
            WorkDateEnd.Caption := DateToStr(temp.ResultQuery['DATE_END']);

            OLD_ID_SHTATRAS := temp.ResultQuery['ID_SHTATRAS'];

            Old_Kol_Stavok := temp.ResultQuery['KOL_STAVOK'];

            // Если это изменение процента ставки, то проставляем старый идентификатор
            if (ID_MOVING_TYPE = 2) then
            begin
                ID_SHTATRAS := OLD_ID_SHTATRAS;
                RefreshShtatBlock;
            end;

            if WorkDateEnd.Caption <> DateToStr(PersonalCommon.Consts_Query['DATE_END']) then
            begin
                EndLessLabel.Visible := False;
                WorkDateEnd.Visible := True;
            end
            else
            begin
                WorkDateEnd.Visible := False;
                EndLessLabel.Visible := True;
            end;
        end;

        temp.free;
    end;
end;

procedure TMoveManForm.CancelButtonClick(Sender: TObject);
begin
    if FMode = emNew then
        ModalResult := mrCancel
    else
        ModalResult := mrOk;
end;

procedure TMoveManForm.AddButtonClick(Sender: TObject);
var
    form: TAddPostBonusForm;
begin

    form := TAddPostBonusForm.Create(Self, emNew, abmManBonus);
    form.Id_Order := Id_Order;
    form.Num_Item := Num_Item;
    form.Id_Man_Bonus := -1;
    form.Id_Man_Moving := New_Id_Man_Moving;
    if form.ShowModal = mrOk then
    begin
        BonusQuery.Close;
        BonusQuery.Open;
        GridResize(BonusGrid);
    end;
    form.Free;
end;

procedure TMoveManForm.BonusQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(BonusGrid);
end;

procedure TMoveManForm.ModifyButtonClick(Sender: TObject);
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
    Form.MinDateBeg := MoveDateBeg.Date;

    if RadioButton3.Checked then
        Form.MaxDateBeg := MoveDateEnd.Date
    else
        Form.MaxDateBeg := StrToDate('31.12.2150');

    if form.ShowModal = mrOk then
    begin
        BonusQuery.Close;
        BonusQuery.Open;
        GridResize(BonusGrid);
    end;
end;

procedure TMoveManForm.DeleteButtonClick(Sender: TObject);
begin
    if BonusQuery.IsEmpty then
    begin
        MessageDlg('Немає записів для вилучення!', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи справді ви бажаєте вилучити цю надбавку?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_DELETE(' +
        IntToStr(BonusQuery['Id_Man_Bonus']) +
        ',' + IntToStr(Id_Order) + ');';
    ExecQuery(OutputQuery);

    BonusQuery.Close;
    BonusQuery.Open;
    GridResize(BonusGrid);
end;

procedure TMoveManForm.SpeedButton2Click(Sender: TObject);
begin
    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE COPY_BONUSES_TO_MAN_BONUS(' + IntToStr(ID_ORDER) + ',1)';
    ExecQuery(OutputQuery);

    BonusQuery.Close;
    BonusQuery.Open;
end;

procedure TMoveManForm.MoveDateBegChange(Sender: TObject);
begin
    // Обнуляем айдишки и едиты

    ID_PCARD := -1;
    ID_MAN_MOVING := -1;
    ID_SHTATRAS := -1;

    Fio.Text := '';
    OldDepartment.Text := '';
    OldPost.Text := '';

    WorkDateBeg.Caption := '';
    WorkDateEnd.Caption := '';
    EndLessLabel.visible := False;

    ClearShtatBlock;

    WorkModeBox.OnChange(Sender);
end;

procedure TMoveManForm.WorkModeBoxChange(Sender: TObject);
begin
    if (WorkModeBox.GetId <> -1) and (MoveDateBeg.Date <= MoveDateEnd.Date) then Real_Shift := DrawWorkModeExample(WorkModeGrid, MoveDateBeg.Date, MoveDateEnd.Date, WorkModeBox.GetId, ShiftSpin.Value, 9);
end;

procedure TMoveManForm.IsHospitalClick(Sender: TObject);
var
    TmpBool: Boolean;
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
        IsHospital.Checked := False;
        Hospital.Value := null;
        Hospital.DisplayText := '';
    end
    else
    begin
        Holiday.Value := null;
        Holiday.DisplayText := '';
    end;

    TmpBool := (IsHospital.Checked) or (IsHoliday.Checked);
    RadioButton2.Checked := TmpBool;
    RadioButton1.Enabled := not TmpBool;
    RadioButton1.Checked := not TmpBool;
    RadioButton3.Checked := TmpBool;
    RadioButton4.Enabled := not TmpBool;
    RadioButton4.Checked := not TmpBool;
    MoveDateEnd.Enabled := (not RadioButton4.Checked) and (not TmpBool);
end;

procedure TMoveManForm.HospitalOpenSprav(Sender: TObject;
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
            FieldValues['NewVersion'] := NewVersion;
            Post;
        end;
                // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Man_Hosp'];
            DisplayText := sp.Output['DisplayText'];
            MoveDateEnd.Date := sp.Output['Date_End'];
        end;
        sp.Free;
    end;
end;


end.
