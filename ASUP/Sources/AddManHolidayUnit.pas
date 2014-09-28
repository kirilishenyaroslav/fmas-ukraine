unit AddManHolidayUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, SpComboBox,
    ComCtrls, SpFormUnit, PersonalCommon, SpCommon, Mask, CheckEditUnit;

type
    TAddManHolidayForm = class(TForm)
        Label7: TLabel;
        PeriodDateBeg: TDateTimePicker;
        Label2: TLabel;
        Label1: TLabel;
        PeriodDateEnd: TDateTimePicker;
        Label3: TLabel;
        DateBeg: TDateTimePicker;
        Label4: TLabel;
        DateEnd: TDateTimePicker;
        Label5: TLabel;
        ResultQuery: TIBQuery;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        WriteQuery: TIBQuery;
        HolidayEdit: TEdit;
        SelectHolidayButton: TButton;
        ResultQueryID_HOLIDAY: TIntegerField;
        ResultQueryPERIOD_BEG: TDateField;
        ResultQueryPERIOD_END: TDateField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryH_TERM: TIntegerField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryNAME_HOLIDAY: TIBStringField;
        TermEdit: TCheckEdit;
        CheckQuery: TIBQuery;
        SpeedButton1: TSpeedButton;
        SpeedButton2: TSpeedButton;
        CheckQueryHTERM: TIntegerField;
        HolidayQuery: TIBQuery;
        HolidayQueryHCOUNT: TIntegerField;
        HolidayQuery2: TIBQuery;
        HolidayQuery2DONT_CALC_HOLIDAYS: TIBStringField;
        constructor Create(aOwner: TCOmponent; AId_Man_Holiday: Integer; AId_Man_Moving: Integer; AId_Order: Integer); reintroduce;
        procedure SelectHolidayButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure SpeedButton2Click(Sender: TObject);
        procedure PeriodDateBegChange(Sender: TObject);
    private
    { Private declarations }
    public
        ID_HOLIDAY: Integer;
        ID_MAN_HOLIDAY: Integer;
        ID_MAN_MOVING: Integer;
        ID_ORDER: Integer;
        Reason: string;
        DontCalcHolidays: string;
    end;

var
    AddManHolidayForm: TAddManHolidayForm;
    OldTerm: Integer;

implementation

uses SpHolidayUnit, DateUtils;

constructor TAddManHolidayForm.Create(aOwner: TCOmponent; AId_Man_Holiday: Integer; AId_Man_Moving: Integer; AId_Order: Integer);
begin
    inherited Create(aOwner);

    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    CheckQuery.Transaction := PersonalCommon.ReadTransaction;
    HolidayQuery.Transaction := PersonalCommon.ReadTransaction;
    HolidayQuery2.Transaction := PersonalCommon.ReadTransaction;
    WriteQuery.Transaction := PersonalCommon.WriteTransaction;

    Id_MAn_Holiday := aId_Man_Holiday;
    ID_MAN_MOVING := aId_Man_Moving;
    ID_ORDER := aID_ORDER;

    if (Id_Man_Holiday = -1)
        then begin
        ID_HOLIDAY := -1;
        PeriodDateBeg.Date := EncodeDate(YearOf(Date), 1, 1);
        PeriodDateEnd.Date := EncodeDate(YearOf(Date), 12, 31);
        DateBeg.Date := Date;
        DateEnd.Date := Date;
    end
    else begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_MAN_HOLIDAY'] := ID_MAN_HOLIDAY;
        ResultQuery.Open;

        ID_HOLIDAY := ResultQueryID_HOLIDAY.Value;
        PeriodDateBeg.Date := ResultQueryPERIOD_BEG.Value;
        PeriodDateEnd.Date := ResultQueryPERIOD_END.Value;
        DateBeg.Date := ResultQueryDATE_BEG.Value;
        DateEnd.Date := ResultQueryDATE_END.Value;
        HolidayEdit.Text := ResultQueryNAME_HOLIDAY.Value;
        TermEdit.Text := ResultQueryH_TERM.AsString;
    end;

end;

{$R *.dfm}

procedure TAddManHolidayForm.SelectHolidayButtonClick(Sender: TObject);
var
    form: TSpHolidayForm;
    Params: TSpParams;
begin
    form := TSpHolidayForm.Create(Self);

    Params := TSpParams.Create;

    with Params do
    begin
        Table := 'Sp_Holiday';
        Title := 'Основні відпустки';
        IdField := 'Id_Holiday';
        SpFields := 'Name_Holiday';
        ColumnNames := 'Відпустки';
        InsertProcName := 'Sp_Holiday_Insert';
        UpdateProcName := 'Sp_Holiday_Update';
        DeleteProcName := 'Sp_Holiday_Delete';
        SpMode := spmSelect;
    end;

    form.Init(Params);

    if form.ShowModal = mrOk then
    begin

        HolidayEdit.Text := form.ResultQuery['Name_Holiday'];
        Id_Holiday := form.ResultQuery['Id_holiday'];
        DontCalcHolidays := Form.ResultQueryDONT_CALC_HOLIDAYS.Value;

        TermEdit.Text := IntToStr(form.resultQuery['Default_Term']);

        DateEnd.Date := DateBeg.Date + StrToInt(TermEdit.Text) - 1;

        SpeedButton1.Click;
    end;

    Form.Free;
end;

procedure TAddManHolidayForm.OkButtonClick(Sender: TObject);
var
    Query: TIBQuery;
    IDPCARD: Integer;
begin
    if ID_HOLIDAY = -1
        then begin
        MessageDlg('Потрібно вибрати відпустку', mtError, [mbOk], 0);
        exit;
    end;

    if TermEdit.Text = ''
        then begin
        MessageDlg('Потрібно ввести термін відпустки', mtError, [mbOk], 0);
        exit;
    end;

      // проверить Не болеет ли человек (Валик, 28.02.2005)
    try
        Query := TIbQuery.Create(Self);
        Query.Transaction := PersonalCommon.ReadTransaction;

        Query.SQL.Text := 'SELECT id_pcard from man_moving where id_man_moving = ' +
            IntToStr(ID_Man_Moving);
        Query.Open;

        IDPCARD := Query['ID_PCARD'];
        Query.Close;

        Query.SQL.Text := 'SELECT * from ORDERS_CHECK_MAN_FOR_HOLIDAY(' +
            IntToStr(IDPCARD) + ',' + QuotedStr(DateToStr(DateBeg.Date)) + ')';
        Query.Open;


        if Query['BOLEET'] = 'T' then
        begin
            if MessageDlg('Увага, на дату початку відпустки вибрана людина має листок непрацездатності!', mtWarning, [mbYes, mbNo], 0) <> ID_YES
                then begin
                Query.Free;
                exit;
            end;
        end;

        Query.Free;
    except
    end;

    WriteQuery.Close;

    if ID_MAN_HOLIDAY = -1 then
        WriteQuery.SQL.Text := 'EXECUTE PROCEDURE MAN_HOLIDAY_INSERT(' +
            IntToStr(ID_HOLIDAY) + ',' +
            QuotedStr(DateToStr(PERIODDATEBEG.Date)) + ',' +
            QuotedStr(DateToStr(PERIODDATEEND.Date)) + ',' +
            QuotedStr(DateToStr(DATEBEG.Date)) + ',' +
            QuotedStr(DateToStr(DATEEND.Date)) + ',' +
            QuotedStr(TERMEdit.Text) + ',' +
            IntToStr(ID_MAN_MOVING) + ',' +
            IntToStr(ID_ORDER) + ',' +
            QuotedStr(Reason) + ')'
    else
        WriteQuery.SQL.Text := 'EXECUTE PROCEDURE MAN_HOLIDAY_UPDATE(' +
            IntToStr(id_man_holiday) + ',' +
            IntToStr(ID_HOLIDAY) + ',' +
            QuotedStr(DateToStr(PERIODDATEBEG.Date)) + ',' +
            QuotedStr(DateToStr(PERIODDATEEND.Date)) + ',' +
            QuotedStr(DateToStr(DATEBEG.Date)) + ',' +
            QuotedStr(DateToStr(DATEEND.Date)) + ',' +
            QuotedStr(TERMEdit.Text) + ',' +
            IntToStr(ID_MAN_MOVING) + ',' +
            IntToStr(ID_ORDER) + ',' +
            QuotedStr(Reason) + ')';

    WriteTransaction.StartTransaction;

    try

        ExecQuery(WriteQuery);

    except on E: Exception
        do begin
            MessageDlg('Виникла помилка: ' + E.message, mtError, [mbOk], 0);
            WriteTransaction.Rollback;
            exit;
        end;
    end;

    WriteTransaction.Commit;
    ModalResult := mrOk;
end;

procedure TAddManHolidayForm.SpeedButton1Click(Sender: TObject);
var
    hcount: Integer;
    doexit: Boolean;
begin
    HolidayQuery2.Close;
    HolidayQuery2.Params.ParamValues['ID_HOLIDAY'] := Id_Holiday;
    HolidayQuery2.Open;

    DontCalcHolidays := HolidayQuery2DONT_CALC_HOLIDAYS.Value;

    DateEnd.Date := DateBeg.Date + StrToInt(TermEdit.Text) - 1;

    doexit := False;
    hcount := 0;

    while not doexit do begin
        HolidayQuery.Close;
        HolidayQuery.Params.ParamValues['DATE1'] := DateToStr(DateBeg.Date);
        HolidayQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Date);
        HolidayQuery.Open;

        if (DontCalcHolidays = 'T') then
            DateEnd.Date := DateEnd.Date + HolidayQueryHCOUNT.Value - hcount;

        if hcount = HolidayQueryHCOUNT.Value then
            doexit := True;

        hcount := HolidayQueryHCOUNT.Value;
    end;
end;

procedure TAddManHolidayForm.SpeedButton2Click(Sender: TObject);
begin
    CheckQuery.Close;
    CheckQuery.Params.ParamValues['ID_HOLIDAY'] := IntToStr(Id_Holiday);
    CheckQuery.Params.ParamValues['DATE1'] := DateToStr(DateBeg.Date);
    CheckQuery.Params.ParamValues['DATE2'] := DateToStr(DateEnd.Date);
    CheckQuery.Open;

    TermEdit.Text := IntToStr(CheckQueryHTERM.value);
end;

procedure TAddManHolidayForm.PeriodDateBegChange(Sender: TObject);
begin
    PeriodDateEnd.Date := EncodeDate(YearOf(PeriodDateBeg.Date) + 1, MonthOf(PeriodDateBeg.Date), DayOf(PeriodDateBeg.Date));
end;

end.
