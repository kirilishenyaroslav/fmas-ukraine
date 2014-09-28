{ -$Id: uTableFrame.pas,v 1.13 2007/01/30 15:48:52 oleg Exp $ }
unit uTableFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Grids, TableCentral, IBQuery, DateUtils, WorkModeCentral,
    StdCtrls, Spin, Mask, CheckEditUnit, SpComboBox, ExtCtrls, SpTimeUtils,
    Buttons, WorkModeChanges, uNevihod, uTableGroup, cxControls, cxSplitter,
    DB, ProcessUnit, IBCustomDataSet, ActnList;

type
        // информация о текущей ячейке, табеле...
    TTableCoords = record
        ind: Integer; // индекс табеля
        day: Integer; // день месяца
        DataRow: Boolean; // строка с табелем (не оформление)
        DataCell: Boolean; // ячейка ли с данными (не оформление)
        InsideWork: Boolean; // ячейка внутри периода работы человека
        CurDate: TDate; // текущая дата
    end;

    TfrmTable = class(TFrame)
        TableGrid: TStringGrid;
        StatusPanel: TPanel;
        StatusCaptionLabel: TLabel;
        StatusLabel: TLabel;
        SearchLabel: TLabel;
        WeekDayLabel: TLabel;
        SearchEdit: TEdit;
        InfoPanel: TPanel;
        AllPanel: TPanel;
        TotalHoursCaption: TLabel;
        TotalNHoursCaption: TLabel;
        TotalHoursLabel: TLabel;
        TotalNHoursLabel: TLabel;
        TotalPHoursCaption: TLabel;
        TotalPHoursLabel: TLabel;
        TotalDaysCaption: TLabel;
        TotalDaysLabel: TLabel;
        TotalLabel: TLabel;
        TotalVihHoursCaption: TLabel;
        TotalVHoursLabel: TLabel;
        ManPanel: TPanel;
        AHLabel: TLabel;
        AllHoursLabel: TLabel;
        AllNHoursLabel: TLabel;
        AllPHoursLabel: TLabel;
        AGLabel: TLabel;
        AllGHoursLabel: TLabel;
        SverhLabel: TLabel;
        DaysCaptionLabel: TLabel;
        DaysLabel: TLabel;
        AllManLabel: TLabel;
        AVihLabel: TLabel;
        AllVHoursLabel: TLabel;
        ACLabel: TLabel;
        CalDaysLabel: TLabel;
        Work1Label: TLabel;
        Work2Label: TLabel;
        DateBegLabel: TLabel;
        DateEndLabel: TLabel;
        StavokLabel: TLabel;
        Label1: TLabel;
        Label2: TLabel;
        SverhEdit: TCheckEdit;
        HoursPanel: TPanel;
        HoursCaptionLabel: TLabel;
        HoursLabel: TLabel;
        VihodCaptionLabel: TLabel;
        VihodLabel: TLabel;
        NHLabel: TLabel;
        NHoursLabel: TLabel;
        PHLabel: TLabel;
        PHoursLabel: TLabel;
        GHLabel: TLabel;
        GHoursLabel: TLabel;
        WBegLabel: TLabel;
        WorkBegLabel: TLabel;
        WEndLabel: TLabel;
        WorkEndLabel: TLabel;
        VihLabel: TLabel;
        VHoursLabel: TLabel;
        WorkModePanel: TPanel;
        WorkModeChanges: TBitBtn;
        NevihodButton: TBitBtn;
        cxSplitter1: TcxSplitter;
        DepartmentLabel: TLabel;
        HalfTimeButton: TBitBtn;
        BufferQuery: TIBQuery;
        Hours_Norm_Edit: TCheckEdit;
        Label4: TLabel;
        Label5: TLabel;
        Days_Norm_Edit: TCheckEdit;
        SetNorm: TBitBtn;
        CalcInHoursLabel: TLabel;
        ActionList1: TActionList;
        WorkModes: TAction;
        procedure TableGridDrawCell(Sender: TObject; ACol, ARow: Integer;
            Rect: TRect; State: TGridDrawState);
        procedure TableGridSelectCell(Sender: TObject; ACol, ARow: Integer;
            var CanSelect: Boolean);
        procedure SearchEditChange(Sender: TObject);
        procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure TableGridMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure NevihodButtonClick(Sender: TObject);
        procedure HalfTimeButtonClick(Sender: TObject);
        procedure SetNormClick(Sender: TObject);
        procedure WorkModesExecute(Sender: TObject);
    private
        TableGroup: TTableGroup;
        dayBeg: Integer;
        dayEnd: Integer;

        DateBeg: TDate;
        DateEnd: TDate;

        // получить координаты текущей ячейки...
        procedure GetCoords(ARow, ACol: Integer; var coords: TTableCoords);
        procedure DrawSelect(NewRow, NewCol: Integer);
        function GetDistCount: Integer;
        function GetNewCount: Integer;
        function GetCount: Integer;
        procedure ShowStatus(coo: TTableCoords);
    public
        ShowTitle: Boolean;
        ShowNumber: Boolean;
        ShowFIO: Boolean;
        ShowPost: Boolean;
        ShowTN: Boolean;

        SelectedRow: Integer;
        SelectedCol: Integer;

        SelectI, SelectDay, oSelectI, oSelectDay: Integer;

        property DistCount: Integer read GetDistCount;
        property NewCount: Integer read GetNewCount;
        property Count: Integer read GetCount;

        // создать список табелей из запроса
        procedure Prepare(query: TDataSet; Date_Beg, Date_End: TDate);
        // пересчитать из базы, или переформировать
        procedure ReRead;

        // отобразить день day для табеля ind
        procedure Render(ind: Integer; day: Integer);
        // отобразить все дни в гриде
        procedure RenderAll;
        // подготовить грид (заголовки, количество столбцов и т.д.)
        procedure PrepareGrid;
        // сформировать табель, подготовить грид и отобразить его
        procedure ShowTable;
        // записать такой-то табель (в т.ч. и в буффер)
        function WriteOneTable(Idx: Integer; Sys: Integer; Comment: string;
            Id_Table_Group: Integer): string;
        // записать текущий табель в базу (результат: строка с ошибкой или пустая)
        function WriteCurrent(Sys: Integer; Comment: string; Id_Table_Group: Integer): string;
            // записать текущий табель в базу (результат: строка с ошибкой или пустая)
        function WriteAll(Sys: Integer; GroupSigned: Boolean; Id_Table_Group: Integer): string;
        // переформировать текущий табель
        procedure ReformCurrent;
        // добавить табеля в группу
        procedure AddToGroup(Id_Table_Group: Integer);
        // подписан ли текущий табель
        function CurrentSigned: Boolean;
        // проверки, нет ли непереданных записей
        function OrdersCheck: Boolean;

        destructor Destroy; override;
    end;

implementation

uses uMovingTable, uTableSignCheck, uOrdersNotInZP, PersonalCommon,
    uWorkHalfTime, qFTools, uBuffer2, uTableCommon, Buffer;

{$R *.dfm}

function TfrmTable.OrdersCheck: Boolean;
var
    TableSignCheck: TTableSignCheck;
    form: TfmOrdersNotInZP;
begin
    TableSignCheck := TTableSignCheck.Create(PersonalCommon.TableData);
    Result := TableSignCheck.Check(TableGroup);

    if not Result then
    begin
        form := TfmOrdersNotInZP.Create(Self, PersonalCommon.TableData.OrdersCheckSource);
        form.ShowModal;
        form.Free;
    end;

    TableSignCheck.Free;
end;

function TfrmTable.CurrentSigned: Boolean;
var
    coo: TTableCoords;
begin
    GetCoords(TableGrid.Row, TableGrid.Col, coo);
    if not coo.DataRow then
    begin
        Result := False;
        Exit;
    end;

    Result := TableGroup[coo.ind].Signed;
end;

procedure TfrmTable.AddToGroup(Id_Table_Group: Integer);
begin
    TableGroup.AddToGroup(Id_Table_Group);
end;

function TfrmTable.GetCount: Integer;
begin
    Result := TableGroup.Count;
end;

function TfrmTable.GetNewCount: Integer;
begin
    Result := TableGroup.NewCount;
end;

procedure TfrmTable.ReformCurrent;
var
    coo: TTableCoords;
    day: Integer;
begin
    GetCoords(TableGrid.Row, TableGrid.Col, coo);
    if not coo.DataRow then Exit;

    TableGroup[coo.ind].FormTable(False);
    for day := 1 to dayEnd do
        Render(coo.ind, day);
    TableGroup.CalcOverall;
    ShowStatus(coo);
    TableGrid.Repaint;
end;

function TfrmTable.WriteOneTable(Idx: Integer; Sys: Integer; Comment: string;
    Id_Table_Group: Integer): string;
var
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    BufferQuery.Transaction := TableWriteTransaction;
    if TableWriteTransaction.Active then TableWriteTransaction.Rollback;

    BufTran2 := nil;
    TableWriteTransaction.StartTransaction;
    try
        Result := TableGroup[Idx].Write(Sys, Comment, Id_Table_Group);

            // если получилось, пишем в дублирующий буфер в Interbase
        if (Result = '') and not DontWriteToDbf then
        begin
            BufferQuery.Close;
            BufferQuery.ParamByName('Id_PCard').AsInteger := TableGroup[Idx].Id_PCard;
            BufferQuery.ParamByName('Tbl_Year').AsInteger := TableGroup[Idx].Year;
            BufferQuery.ParamByName('Tbl_Month').AsInteger := TableGroup[Idx].Month;
            BufferQuery.Open;

            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('TABLE,TAB_HOUR', 'BUFF_TABLE,BUFF_TAB_HOUR', WriteTransaction);
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

function TfrmTable.WriteCurrent(Sys: Integer; Comment: string;
    Id_Table_Group: Integer): string;
var
    coo: TTableCoords;
begin
    Result := '';
    GetCoords(TableGrid.Row, TableGrid.Col, coo);
    if not coo.DataRow then Exit;
    if (TableGroup[coo.ind].Status = tsRead) or
        (TableGroup[coo.ind].Status = tsWritten) or
        (TableGroup[coo.ind].Status = tsError) then Exit;
    Result := WriteOneTable(coo.ind, Sys, Comment, Id_Table_Group);
    ShowStatus(coo);
    TableGrid.Repaint;
end;

function TfrmTable.WriteAll(Sys: Integer; GroupSigned: Boolean; Id_Table_Group: Integer): string;
var
    ind: Integer;
    comment: string;
    res: string;
    form: TProcessForm;
begin
    form := TProcessForm.Create(nil);
    form.Caption := 'Занесення табелю, зачекайте...';
    form.Show;
    form.Progress.Max := TableGroup.Count;

    Result := '';
    for ind := 0 to TableGroup.Count - 1 do
    begin
        if (TableGroup[ind].Status <> tsRead) and
            (TableGroup[ind].Status <> tsWritten) then
        begin
            if TableGroup[ind].Signed or GroupSigned then
            begin
                comment := '';
                while Trim(comment) = '' do
                    if not InputQuery('Введення коментаря', 'Цей табель вже ' +
                        'було підписано. Введіть підставу для коректування табеля',
                        comment)
                        then Exit;
            end
            else comment := 'занесення табеля';

            res := WriteOneTable(ind, Sys, comment, Id_Table_Group);
            if res <> '' then Result := Result + res + #13#10;
        end;

        if Stop then break;
        form.Step;
    end;
    form.Close;
    TableGrid.Repaint;
end;

function TfrmTable.GetDistCount: Integer;
begin
    Result := TableGroup.DistCount;
end;

procedure TfrmTable.PrepareGrid;
var
    colN, i: Integer;
begin
    with TableGrid do
    begin
        Enabled := True;

        if ShowTitle then
        begin
            RowCount := 2;
            FixedRows := 1;
        end;

      // подготовить заголовки столбцов
        colN := 0;

        if ShowNumber then
        begin
            if ShowTitle then Cells[colN, 0] := '№';
            ColWidths[colN] := 25;
            inc(colN);
        end;

        if ShowFIO then
        begin
            if ShowTitle then Cells[colN, 0] := 'ПІБ';
            ColWidths[colN] := 120;
            inc(colN);
        end;

        if ShowTN then
        begin
            if ShowTitle then Cells[colN, 0] := 'Т/н';
            ColWidths[colN] := 35;
            inc(colN);
        end;

        if ShowPost then
        begin
            if ShowTitle then Cells[colN, 0] := 'Посада';
            ColWidths[colN] := 200;
            inc(colN);
        end;

        ColCount := colN + dayEnd - dayBeg + 1;
        FixedCols := colN;

            // подготовить строчку дней
        if ShowTitle then
            for i := 1 to 31 do
                Cells[FixedCols + i - 1, 0] := IntToStr(i);
    end;
end;

procedure TfrmTable.ShowTable;
var
    coo: TTableCoords;
begin
    ReRead;
    PrepareGrid;
    RenderAll;
    TableGrid.SetFocus;

    if TableGroup.Count > 0 then
    begin
        coo.ind := 0;
        coo.day := 1;
        ShowStatus(coo);
    end;
end;

procedure TfrmTable.Render(ind: Integer; day: Integer);
begin
    with TableGrid do
        if TableGroup[ind].Status = tsError then
            Cells[FixedCols + day - 1, FixedRows + ind] := '?'
        else
            Cells[FixedCols + day - 1, FixedRows + ind] := TableGroup.ToString(ind, day);
end;

procedure TfrmTable.RenderAll;
var
    ind, day, colN: Integer;
begin
    if TableGroup.Count = 0 then
    begin
        for ind := 0 to TableGrid.ColCount - 1 do
            TableGrid.Cells[ind, 1] := '';
        Exit;
    end;

    with TableGrid do
    begin
        RowCount := TableGroup.Count + FixedRows;

        for ind := 0 to TableGroup.Count - 1 do
        begin
            colN := 0;

            if ShowNumber then
            begin
                Cells[colN, FixedRows + ind] :=
                    IntToStr(TableGroup.GetDistNumber(ind));
                inc(colN);
            end;

            if ShowFIO then
            begin
                Cells[colN, FixedRows + ind] := TableGroup[ind].FIO;
                inc(colN);
            end;

            if ShowTN then
            begin
                Cells[colN, FixedRows + ind] := IntToStr(TableGroup[ind].TN);
                inc(colN);
            end;

            if ShowPost then
                Cells[colN, FixedRows + ind] := TableGroup[ind].Post;

            for day := dayBeg to dayEnd do
                Render(ind, day);
        end;
        Repaint;
    end;
end;

procedure TfrmTable.ReRead;
begin
    TableGroup.Get;
    TableGroup.CalcOverall;
end;

procedure TfrmTable.Prepare(query: TDataSet; Date_Beg, Date_End: TDate);
begin
    if TableGroup <> nil then TableGroup.Free;
    TableGroup := TTableGroup.Create(query, Date_Beg, Date_End);

    dayBeg := DayOfTheMonth(Date_Beg);
    dayEnd := DayOfTheMonth(Date_End);

    Self.DateBeg := Date_Beg;
    Self.DateEnd := Date_End;

    ShowTitle := True;
    ShowNumber := True;
    ShowFIO := True;
    ShowPost := True;
    ShowTN := True;
end;

destructor TfrmTable.Destroy;
begin
    TableGroup.Free;
    inherited Destroy;
end;

procedure TfrmTable.GetCoords(ARow, ACol: Integer; var coords: TTableCoords);
begin
    with coords do
    begin
        ind := ARow - TableGrid.FixedRows;
        day := ACol - TableGrid.FixedCols + 1;

        CurDate := DateBeg + day - 1;

        DataRow := (ind >= 0) and (ind < TableGroup.Count);

        DataCell := DataRow and (day >= 1) and (day <= dayEnd);

        if DataCell then
            InsideWork := (CurDate <= TableGroup[ind].End_Date)
                and (CurDate >= TableGroup[ind].Start_Date)
        else InsideWork := False;
    end;
end;

procedure Circle(canvas: TCanvas; Rect: TRect; color: TColor; a, R: Integer);
var
    oldColor: TColor;
    rect2: TRect;
begin
    with canvas do
    begin
        oldColor := Brush.Color;
        Brush.Color := color;

        rect2.Left := Rect.Left + a;
        rect2.Top := Rect.Top + a;
        rect2.Right := rect2.Left + 2 * R;
        rect2.Bottom := rect2.Top + 2 * R;

        Ellipse(rect2);

        Brush.Color := oldColor;
    end;
end;

procedure TfrmTable.TableGridDrawCell(Sender: TObject; ACol, ARow: Integer;
    Rect: TRect; State: TGridDrawState);
var
    coo: TTableCoords;
    cColor: TColor;
begin
    if TableGroup = nil then Exit;

    GetCoords(ARow, ACol, coo);

    with coo, TableGrid, TableGrid.Canvas do
    begin
                    // часы в период, когда человек не работает (малиновый фон)
        if DataCell and TableGroup[ind][day].WorkDay and not InsideWork then
        begin
            Brush.Color := RGB(255, 204, 237);
            FillRect(Rect);
        end
        else
   // покрасить фон чересполосицей
            if (ARow >= FixedRows) then
            begin
                    // сначала основную часть
                if (ACol >= FixedCols) then
                        // голубой крест для позиционирования текущей позиции
                    if (ACol = SelectedCol) or (ARow = SelectedRow) then
                        Brush.Color := RGB(220, 250, 255)
                    else
                        // желтым/белым остальное
                        if ARow mod 2 = 0 then Brush.Color := clInfoBk
                        else Brush.Color := clWhite
                    else // теперь информацию слева
                        // голубым выделенное
                        if ARow = SelectedRow then Brush.Color := RGB(220, 250, 255)
                        else // синим/зеленым остальное
                            if ARow mod 2 = 0 then Brush.Color := clMoneyGreen
                            else Brush.Color := clSkyBlue;

                        FillRect(Rect);
            end;

   // подкрасить статус табеля (кружок у порядкового номера слева
        if ShowNumber and (ACol = 0) and (ARow >= FixedRows) then
        begin
            if not DataRow then Exit;

            case TableGroup[ind].Status of
                tsUnknown: cColor := clBlack;
                tsRead: cColor := clGray;
                tsNew: cColor := clYellow;
                tsModified: cColor := clRed;
                tsWritten: cColor := clGreen;
                tsError: cColor := clRed;
            end;

                // отобразить кружок статуса (побольше, если текущая строка)
            if TableGroup[ind].Status = tsError then
                Circle(TableGrid.Canvas, Rect, cColor, 12, 6)
            else
                if ARow = SelectedRow then
                    Circle(TableGrid.Canvas, Rect, cColor, 5, 8)
                else Circle(TableGrid.Canvas, Rect, cColor, 12, 6);
        end;

                // подкрасить числа вверху в заголовке
        if ShowTitle and (ARow = 0) and (FixedRows > 0) and
            (ACol >= TableGrid.FixedCols) and (ACol < ColCount) then
        begin
                    // выделение дня (синим фоном числа месяца в заголовке)
            if ACol = SelectedCol then
            begin
                Brush.Color := clSkyBlue;
                FillRect(Rect);
                TextRect(Rect, Rect.Left, Rect.Top, TableGrid.Cells[ACol, ARow]);
            end;
     // праздники (красный кружок у числа в заголовке)
            if Calendar[CurDate] then
                Circle(TableGrid.Canvas, Rect, clRed, 15, 4)
            else // суббота и воскресенье (желтый кружок у числа месяца)
                if DayOfTheWeek(CurDate) in [6, 7] then
                    Circle(TableGrid.Canvas, Rect, clYellow, 15, 4);
        end;

   // подкрасить типы выходов
        if DataCell then
            if not TableGroup[ind][day].WorkDay then Font.Color := clRed
            else if TableGroup[ind][day].VihodnoiWork then Font.Color := clGreen
            else if TableGroup[ind][day].SverhWork then Font.Color := clPurple
            else if TableGroup[ind][day].Night then Font.Color := clBlue
            else if TableGroup[ind][day].WorkHalfTime then Font.Color := $606060
            else Font.Color := clBlack;

   // вывести текст
        if (ARow >= FixedRows) then
            if ACol > 0 then
                TextRect(Rect, Rect.Left, Rect.Top, TableGrid.Cells[ACol, ARow])
            else TextOut(Rect.Left, Rect.Top, TableGrid.Cells[ACol, ARow]);

                // небольшая рамочка вокруг выделенной ячейки
        if DataCell and (ARow = SelectedRow) and (ACol = SelectedCol) then
        begin
            Brush.Color := clRed;
            FrameRect(Rect);
        end;
    end;
end;

procedure TfrmTable.DrawSelect(NewRow, NewCol: Integer);
begin
    SelectedRow := NewRow;
    SelectedCol := NewCol;

    TableGrid.Refresh;
end;

procedure TfrmTable.TableGridSelectCell(Sender: TObject; ACol,
    ARow: Integer; var CanSelect: Boolean);
var
    coo: TTableCoords;
begin
    SelectedRow := ARow;

    GetCoords(ARow, ACol, coo);

    if not coo.DataCell then Exit;

    oSelectI := SelectI;
    oSelectDay := SelectDay;
    SelectI := coo.ind;
    SelectDay := coo.day;

    ShowStatus(coo);

    DrawSelect(ARow, ACol);
end;

procedure TfrmTable.ShowStatus(coo: TTableCoords);
var
    dec: Boolean;
    dBeg, dEnd: TDate;
begin
    dec := True;

    if not coo.DataCell then Exit;

    with TableGroup[coo.ind] do
    begin
            // подразделение
        if Trim(Name_Department) <> '' then
            DepartmentLabel.Caption := Name_Department
        else DepartmentLabel.Caption := '';

        with Span[coo.day].ThisHours.WorkReg do
            if Work_Beg <> Work_End then
            begin
                WorkBegLabel.Caption := EncodeTimeString(Work_Beg, False);
                WorkEndLabel.Caption := EncodeTimeString(Work_End, False);
            end
            else
            begin
                WorkBegLabel.Caption := '-';
                WorkEndLabel.Caption := '-';
            end;

            // часы по дню
        with Span[coo.day].Hours do
        begin
            HoursLabel.Caption := EncodeTimeString2(Hours, dec);
            NHoursLabel.Caption := EncodeTimeString2(NHours, dec);
            PHoursLabel.Caption := EncodeTimeString2(PHours, dec);
            GHoursLabel.Caption := EncodeTimeString2(GHours, dec);
            VHoursLabel.Caption := EncodeTimeString2(VHours, dec);
        end;

            // норма
        if Hours_Norm > eps then
            Hours_Norm_Edit.Text := FormatFloat('##0.###', Hours_Norm)
        else Hours_Norm_Edit.Text := '';

        if Days_Norm <> 0 then
            Days_Norm_Edit.Text := IntToStr(Days_Norm)
        else Days_Norm_Edit.Text := '';

            // общие часы по мувингу
        with Span.TotalHours do
        begin
            AllHoursLabel.Caption := FormatFloat('##0.###', Hours);
            DaysLabel.Caption := IntToStr(Days);
            CalDaysLabel.Caption := IntToStr(CalDays);

            AllNHoursLabel.Caption := FormatFloat('##0.###', NHours);
            AllPHoursLabel.Caption := FormatFloat('##0.###', PHours);
            AllGHoursLabel.Caption := FormatFloat('##0.###', GHours);
            AllVHoursLabel.Caption := FormatFloat('##0.###', VHours);
            SverhEdit.Text := FormatFloat('##0.###', SHours);
        end;

        if Start_Date < DateBeg then dBeg := DateBeg
        else dBeg := Start_Date;

        if End_Date > DateEnd then dEnd := DateEnd
        else dEnd := End_Date;

        DateBegLabel.Caption := DateToStr(Start_Date);
        DateEndLabel.Caption := DateToStr(End_Date) + ' (' +
            IntToStr(DayOfTheMonth(dBeg)) +
            '-' + IntToStr(DayOfTheMonth(dEnd)) + ')';

        if Tarif = 0 then
            StavokLabel.Caption := FormatFloat('0.###', Kol_Stavok[1]) + ' ст.'
        else StavokLabel.Caption := FormatFloat('0.###', Kol_Stavok[1]) + ' ст. (тар.)';

            // общие часы по группе
        with TableGroup.OverallHours do
        begin
            TotalHoursLabel.Caption := FormatFloat('##0.###', Hours);
            TotalDaysLabel.Caption := IntToStr(Days);
            TotalNHoursLabel.Caption := FormatFloat('##0.###', NHours);
            TotalPHoursLabel.Caption := FormatFloat('##0.###', PHours);
            TotalVHoursLabel.Caption := FormatFloat('##0.###', VHours);
        end;

        if Span[coo.day].Vihod <> nil then
            VihodLabel.Caption := Span[coo.day].Vihod.Name_Full
        else VihodLabel.Caption := '-';

        if Status = tsWritten then StatusLabel.Caption := 'записано до бази'
        else if Status = tsModified then StatusLabel.Caption := 'змінено'
        else if Status = tsRead then StatusLabel.Caption := 'прочитано з бази'
        else if Status = tsNew then StatusLabel.Caption := 'новий'
        else if Status = tsError then
            StatusLabel.Caption := 'помилка: ' + ErrorMessage
        else StatusLabel.Caption := 'невідомо';

        if Calc_In_Hours = 1 then
        begin
            CalcInHoursLabel.Caption := 'год.';
            CalcInHoursLabel.Font.Color := clMaroon;
        end
        else
        begin
            CalcInHoursLabel.Caption := 'дн.';
            CalcInHoursLabel.Font.Color := clNavy;
        end;

        case DayOfTheWeek(DateBeg + coo.day - 1) of
            1: WeekDayLabel.Caption := 'понеділок';
            2: WeekDayLabel.Caption := 'вівторок';
            3: WeekDayLabel.Caption := 'середа';
            4: WeekDayLabel.Caption := 'четвер';
            5: WeekDayLabel.Caption := 'п''ятниця';
            6: WeekDayLabel.Caption := 'субота';
            7: WeekDayLabel.Caption := 'неділя';
        end;
    end;
end;


procedure TfrmTable.SearchEditChange(Sender: TObject);
var
    ind: Integer;
begin
    ind := TableGroup.Find(SearchEdit.Text);
    if ind = -1 then Exit;

    TableGrid.Row := TableGrid.FixedRows + ind;
    TableGrid.Col := TableGrid.FixedCols;
    DrawSelect(TableGrid.Row, TableGrid.Col);
end;

procedure TfrmTable.SearchEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then TableGrid.SetFocus;
end;

procedure TfrmTable.TableGridMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    coo: TTableCoords;
begin
    SearchEdit.Text := '';

    if (ssCtrl in Shift) and (ssAlt in Shift) then
    begin
        GetCoords(TableGrid.Row, TableGrid.Col, coo);
        if coo.DataRow then
            ShowMessage('Id_Man_Moving: ' + IntToStr(TableGroup[coo.ind].Id_Man_Moving));
    end;
end;

procedure TfrmTable.NevihodButtonClick(Sender: TObject);
var
    form: TfmNevihod;
    coo: TTableCoords;
begin
    if TableGroup = nil then
    begin
        qFErrorDialog('Треба отримати дані!');
        Exit;
    end;

    GetCoords(TableGrid.Row, TableGrid.Col, coo);
    if not coo.DataRow then Exit;

    form := TfmNevihod.Create(Self, TableGroup[coo.ind].Id_Man_Moving,
        TableGroup[coo.ind].FIO, TableGroup[coo.ind].Span.Date_Beg,
        TableGroup[coo.ind].Span.Date_End);
    form.ShowModal;
    form.Free;
end;

procedure TfrmTable.HalfTimeButtonClick(Sender: TObject);
var
    form: TfmWorkHalfTime;
    coo: TTableCoords;
begin
    if TableGroup = nil then
    begin
        qFErrorDialog('Треба отримати дані!');
        Exit;
    end;

    GetCoords(TableGrid.Row, TableGrid.Col, coo);
    if not coo.DataRow then Exit;

    form := TfmWorkHalfTime.Create(Self, TableGroup[coo.ind].Id_Man_Moving,
        TableGroup[coo.ind].FIO);
    form.ShowModal;
    form.Free;
end;

procedure TfrmTable.SetNormClick(Sender: TObject);
var
    coo: TTableCoords;
    Hours_Norm: Double;
    Days_Norm: Integer;
    ds: Char;
begin
    if TableGroup = nil then
    begin
        qFErrorDialog('Треба отримати дані!');
        Exit;
    end;

    GetCoords(TableGrid.Row, TableGrid.Col, coo);
    if not coo.DataRow then Exit;

    ds := DecimalSeparator;
    try
        Hours_Norm := StrToFloat(Hours_Norm_Edit.Text);
    except
        Hours_Norm := 0;
    end;
    try
        Days_Norm := StrToInt(Days_Norm_Edit.Text);
    except
        Days_Norm := 0;
    end;

    DecimalSeparator := ds;

    TableGroup[coo.ind].SetNorm(Hours_Norm, Days_Norm);
    TableGrid.Repaint;
end;

procedure TfrmTable.WorkModesExecute(Sender: TObject);
var
    form: TWorkModeChangesForm;
    coo: TTableCoords;
begin
    if TableGroup = nil then
    begin
        qFErrorDialog('Треба отримати дані!');
        Exit;
    end;

    GetCoords(TableGrid.Row, TableGrid.Col, coo);
    if not coo.DataRow then Exit;

    form := TWorkModeChangesForm.Create(Self, TableGroup[coo.ind].Id_Man_Moving);
    form.ShowModal;
    form.Free;
end;

end.
