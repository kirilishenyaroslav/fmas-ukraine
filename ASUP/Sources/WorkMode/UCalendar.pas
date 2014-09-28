
{ -$Id: UCalendar.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                             Модуль "Календарь"                               }
{                     Ведение списка праздничных дней                          }
{                                                  ответственный: Олег Волков  }

unit UCalendar;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, PersonalCommon, Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
    ExtCtrls, Mask, CheckEditUnit, SpFormUnit, SpCommon, Menus,
    DBGrids, Buffer, WorkModeCentral;

type
    TCalendarForm = class(TForm)
        DaysGrid: TStringGrid;
        CalendarQuery: TIBQuery;
        Panel1: TPanel;
        ModifyButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        Panel2: TPanel;
        CancelButton: TSpeedButton;
        Label2: TLabel;
        Label3: TLabel;
        FIOLabel: TLabel;
        DepartmentLabel: TLabel;
        PostLabel: TLabel;
        WorkQuery: TIBQuery;
        YearEdit: TCheckEdit;
        StatusPanel: TPanel;
        FormButton: TSpeedButton;
        BufferQuery: TIBQuery;
        MonthBox: TComboBox;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure MonthBoxChange(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure DaysGridDrawCell(Sender: TObject; ACol, ARow: Integer;
            Rect: TRect; State: TGridDrawState);
        procedure CancelButtonClick(Sender: TObject);
        procedure YearEditExit(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DaysGridDblClick(Sender: TObject);
        procedure DaysGridSelectCell(Sender: TObject; ACol, ARow: Integer;
            var CanSelect: Boolean);
        procedure FormButtonClick(Sender: TObject);
        procedure DaysGridMouseUp(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
    private
        procedure MakeCalendar(SelectToday: Boolean = False);
        procedure ReRead;
        procedure FormCalendar;
    public
        Cur_Date: TDate;
        Month_Beg: TDate;
        Month_End: TDate;
        MCalendar: array[1..31] of Bool;
        Days: Integer;
        Year, Month: Word;
        Modified: Boolean;
    end;

var
    CalendarForm: TCalendarForm;

implementation

{$R *.DFM}

uses uBuffer2;

procedure TCalendarForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if Modified then
        if MessageDlg('Дані не були занесени у базу. Занести?', mtConfirmation,
            [mbYes, mbNo], 0) = mrYes then FormCalendar;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TCalendarForm.FormCreate(Sender: TObject);
var
    i: Integer;
    y, m, d: Word;
begin
    DaysGrid.Cells[0, 0] := 'пн';
    DaysGrid.Cells[1, 0] := 'вт';
    DaysGrid.Cells[2, 0] := 'ср';
    DaysGrid.Cells[3, 0] := 'чт';
    DaysGrid.Cells[4, 0] := 'пт';
    DaysGrid.Cells[5, 0] := 'сб';
    DaysGrid.Cells[6, 0] := 'нд';

    if Cur_Date = 0 then Cur_Date := Date;

    DecodeDate(Cur_Date, y, m, d);
    YearEdit.Text := IntToStr(y);
    MonthBox.ItemIndex := m - 1;

    CalendarQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    BufferQuery.Transaction := BufferTransaction;

    ReRead;
    MakeCalendar(True);
end;

procedure TCalendarForm.ReRead;
var
    i: Integer;
begin
    Month := MonthBox.ItemIndex + 1;
    Year := StrToInt(YearEdit.Text);

    CalendarQuery.Params.ParamValues['Year'] := Year;
    CalendarQuery.Params.ParamValues['Month'] := Month;

    CalendarQuery.Close;
    CalendarQuery.Open;
    for i := 1 to 31 do
    begin
        if CalendarQuery.Locate('Tbl_Day', i, []) then
            MCalendar[i] := (CalendarQuery['Holiday'] = 'T')
        else
            MCalendar[i] := False;
    end;
end;

procedure TCalendarForm.MakeCalendar(SelectToday: Boolean = False);
var
    i, j, k: Integer;
    d: Word;
begin
    for i := 0 to 6 do
        for j := 1 to 6 do
            DaysGrid.Cells[i, j] := '';

    Month_Beg := EncodeDate(Year, Month, 1);
    Days := 28;
    case Month of
        1, 3, 5, 7, 8, 10, 12: Days := 31;
        4, 6, 9, 11: Days := 30;
        2: if IsLeapYear(Year) then
                Days := 29
            else
                Days := 28;
    end;
    Month_End := EncodeDate(Year, Month, Days);

    j := DayOfWeek(EncodeDate(Year, Month, 1));
    dec(j);
    if j = 0 then j := 7;

    with CalendarQuery do
    begin
        Close;
        Params.ParamValues['Year'] := Year;
        Params.ParamValues['Month'] := Month;
        Open;
    end;

    k := 1;
    for i := 1 to Days do
        with DaysGrid do
        begin
            EncodeDate(Year, Month, i);

            Cells[j - 1, k] := IntToStr(i);

            if SelectToday then
            begin
                DecodeDate(Cur_Date, Year, Month, d);
                if d = i then
                begin
                    Row := k;
                    Col := j - 1;
                end;
            end;

            if j = 7 then
            begin
                j := 1;
                inc(k);
            end
            else
                inc(j);
        end;
end;

procedure TCalendarForm.MonthBoxChange(Sender: TObject);
begin
    ReRead;
    MakeCalendar;
end;

procedure TCalendarForm.RefreshButtonClick(Sender: TObject);
begin
    ReRead;
    MakeCalendar;
end;

procedure TCalendarForm.DaysGridDrawCell(Sender: TObject; ACol, ARow: Integer;
    Rect: TRect; State: TGridDrawState);
var
    d, w, h: Integer;
    s: string;
    sz: TSize;
    r: TRect;
begin
    w := DaysGrid.DefaultColWidth + DaysGrid.GridLineWidth;
    h := DaysGrid.DefaultRowHeight + DaysGrid.GridLineWidth;

    with DaysGrid.Canvas do
        if (ARow > 0) and (DaysGrid.Cells[ACol, ARow] <> '') then
        begin
            MoveTo(ACol * w - 1, ARow * h + h - 1);
            LineTo(ACol * w + w - 1, ARow * h - 1);

            d := StrToInt(DaysGrid.Cells[ACol, ARow]);

            if MCalendar[d] then
            begin
                s := 'св';
                sz := TextExtent(s);
                Font.Color := clBlue;

                TextOut(ACol * w + w - 5 - sz.cx, ARow * h + h - 5 - sz.cy, s);
            end;

            Brush.Color := clBlack;
            r.Left := ACol * w;
            r.Right := ACol * w + w - 1;
            r.Top := ARow * h;
            r.Bottom := ARow * h + h - 1;
            FrameRect(r);
        end;
end;

procedure TCalendarForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TCalendarForm.YearEditExit(Sender: TObject);
begin
    ReRead;
    MakeCalendar;
end;

procedure TCalendarForm.ModifyButtonClick(Sender: TObject);
var
    d: Integer;
begin
    if not GPP_Check then Exit;
    try
        d := StrToInt(DaysGrid.Cells[DaysGrid.Col, DaysGrid.Row]);
        MCalendar[d] := not MCalendar[d];
        MakeCalendar;
        Modified := True;
    except
        Exit
    end;
end;

procedure TCalendarForm.DaysGridDblClick(Sender: TObject);
begin
    ModifyButton.Click;
end;

procedure TCalendarForm.DaysGridSelectCell(Sender: TObject; ACol,
    ARow: Integer; var CanSelect: Boolean);
var
    Day: Integer;
begin
    if DaysGrid.Cells[ACol, ARow] = '' then
        StatusPanel.Caption := ''
    else
    try
        Day := StrToInt(DaysGrid.Cells[ACol, ARow]);

        if MCalendar[Day] then
            StatusPanel.Caption := 'святковий день'
        else
            StatusPanel.Caption := 'робочий день';
    except
        StatusPanel.Caption := '';
    end;
end;

procedure TCalendarForm.FormButtonClick(Sender: TObject);
begin
    if MessageDlg('Сформувати календар на цей місяць?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        FormCalendar;
end;

procedure TCalendarForm.FormCalendar;
var
    i: Integer;
    h: string;
    dayString: string;
    Id_PBKey: Integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
          // начать транзакцию
    BufTran2 := nil;
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;

    try
                 // записываем данные по месяцу в базу
        for i := 1 to Days do
        begin
            WorkQuery.Params.ParamValues['Tbl_Year'] := Year;
            WorkQuery.Params.ParamValues['Tbl_Month'] := Month;
            WorkQuery.Params.ParamValues['Tbl_Day'] := i;
            if MCalendar[i] then h := 'T'
            else h := 'F';
            WorkQuery.Params.ParamValues['Holiday'] := h;
            ExecQuery(WorkQuery);
        end;

        if not DontWriteToDbf then
        begin
            BufferQuery.Transaction := WriteTransaction;
            BufferQuery.Close;
            BufferQuery.ParamByName('Tbl_Year').AsInteger := Year;
            BufferQuery.ParamByName('Tbl_Month').AsInteger := Month;
            BufferQuery.Open;

            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('CALENDER', 'BUFF_CALENDER', WriteTransaction);
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

    Calendar.Reload;
    Modified := False;
end;

procedure TCalendarForm.DaysGridMouseUp(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then ModifyButton.Click;
end;

end.
