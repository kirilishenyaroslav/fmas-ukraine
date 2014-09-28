{ -$Id: uTableGroup.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $ }
unit uTableGroup;

interface

uses TableCentral, uMovingTable, uVihodsReg, IBQuery, IBDataBase, Controls,
    SysUtils, NagScreenUnit, Math, DateUtils, ProcessUnit, PersonalCommon,
    DB, uVihodsDetails, WorkModeCentral;

type
            // группа табелей
    TTableGroup = class
    private
        FTables: array of TMovingTable;
        FOverallHours: TTableHours;
        FOverallVihods: TVihodsReg;
        FDistCount: Integer;
        FVihodDetails: TVihodDetails;
        FOverallVihodDetails: TVihodDayCount;

        function GetTable(ind: Integer): TMovingTable;
        function GetCount: Integer;
        function GetNewCount: Integer;
    public
        property OverallHours: TTableHours read FOverallHours;
        property Tables[ind: Integer]: TMovingTable read GetTable; default;
        property Count: Integer read GetCount;
        property DistCount: Integer read FDistCount;
        property NewCount: Integer read GetNewCount;
        property OverallVihodsReg: TVihodsReg read FOverallVihods;
        property VihodDetails: TVihodDetails read FVihodDetails;
        property OverallVihodDetails: TVihodDayCount read FOverallVihodDetails;

        constructor Create(query: TDataSet; DateBeg: TDate = 0; DateEnd: TDate = 0);
        destructor Destroy; override;

        procedure CalcOverall;
        procedure Get;
        function Find(findStr: string): Integer;
        function FindByVers(Id_Man_Moving: Integer; Year: Integer;
            Month: Integer; Version_Num: Integer): Integer;
        function ToString(ind, day: Integer): string;
        function GetDistNumber(ind: Integer): Integer;
        procedure CalcVihods;
        procedure Add(MovingTable: TMovingTable);

        procedure AddToGroup(Id_Table_Group: Integer);

                // значение переменной для отчета
        function GetParam(ParName: string; CurrentTable, CurrentDay: Integer): Variant;

        procedure AddPreviosVersions;

        procedure CalcVihodDetails;
    end;

implementation

procedure TTableGroup.CalcVihodDetails;
var
    i, day: Integer;
    vihod: TVihod;
begin
    if Length(FTables) < 1 then Exit;

    SetLength(FVihodDetails, FTables[0].Span.Count);
    for i := 0 to High(FVihodDetails) do
        FVihodDetails[i] := TVihodDayCount.Create;

    for i := 0 to High(FTables) do
        for day := 1 to FTables[i].Span.Count do
            if (FTables[i][day].CurDate >= FTables[i].Start_Date) and
                (FTables[i][day].CurDate <= FTables[i].End_Date) then
            begin
                vihod := FTables[i].Span[day].Vihod;
                if vihod <> nil then
                    FVihodDetails[day - 1].Add(vihod.Id_Vihod, FTables[i].Kol_Stavok[day]);

                if FTables[i][day].WorkDay then
                    FVihodDetails[day - 1].AddWorked(FTables[i].Kol_Stavok[day])
                else FVihodDetails[day - 1].AddNotWorked(FTables[i].Kol_Stavok[day])
            end;

    FOverallVihodDetails := TVihodDayCount.Create;
    FOverallVihodDetails.Clear;
    for i := 0 to High(FVihodDetails) do
        FOverallVihodDetails.AddVihodCount(FVihodDetails[i]);
end;

procedure TTableGroup.Add(MovingTable: TMovingTable);
begin
    SetLength(FTables, Length(FTables) + 1);
    FTables[High(FTables)] := MovingTable;
end;

function TTableGroup.GetParam(ParName: string; CurrentTable, CurrentDay: Integer): Variant;
var
    VihodsReg: TVihodsReg;
    Hours: TTableHours;
    ParValue: Variant;
    p, day: Integer;
begin
    ParName := UpperCase(ParName);

        // Проверить, чтоб не вылезти за диапазон
    if CurrentTable < 0 then Exit;

    if ParName = 'VIHODNSTRING' then
    begin
        ParValue := FTables[CurrentTable].GetVihodnString;
        Exit;
    end
    else
        if ParName = 'PRAZNSTRING' then
        begin
            ParValue := FTables[CurrentTable].GetPraznString;
            Exit;
        end
        else
            if CurrentTable >= Count then
            begin
                VihodsReg := OverallVihodsReg;
                Hours := OverallHours;
            end
            else
            begin
                p := Pos('DAYCELL', ParName);
                if p = 1 then
                try
                    day := StrToInt(Copy(ParName, Length('DAYCELL') + 1, Length(ParName)));
                    ParValue := ToString(CurrentTable, day)
                except
                end
                else
                    with FTables[CurrentTable] do
                    begin
                        if ParName = 'YEAR' then ParValue := YearOf(Span.Date_Beg)
                        else
                            if ParName = 'MONTH' then ParValue := MonthOf(Span.Date_Beg)
                            else
                                if ParName = 'FIO' then ParValue := FIO
                                else if ParName = 'CELL' then
                                    ParValue := ToString(CurrentTable, CurrentDay)
                                else if ParName = 'TN' then ParValue := TN
                                else if ParName = 'NAME_POST' then ParValue := Post
                                else if ParName = 'NOMER' then
                                    ParValue := GetDistNumber(CurrentTable)
                                else if ParName = 'RAZR' then
                                    if Num_Digit > -1 then ParValue := Num_Digit
                                    else ParValue := {Oklad} ''
                    end;

                VihodsReg := FTables[CurrentTable].VihodsReg;
                Hours := FTables[CurrentTable].Span.TotalHours;
            end;

    if ParName = 'WDAYS' then ParValue := Hours.Days
    else if ParName = 'VIHODSVYAT' then ParValue := VihodsReg[35]
    else if ParName = 'PROST' then ParValue := VihodsReg[19]
    else if ParName = 'OTPUSK' then ParValue := VihodsReg[11]
    else if ParName = 'BEREM' then ParValue := VihodsReg[17]
    else if ParName = 'BOLEZN' then ParValue := VihodsReg[16]
    else if ParName = 'PROGUL' then ParValue := VihodsReg[32]
    else if ParName = 'PROST2' then ParValue := VihodsReg[20]
    else if ParName = 'COMAND' then ParValue := VihodsReg[37]
    else if ParName = 'OPOZD' then
        ParValue := VihodsReg[33] + VihodsReg[34]
    else if ParName = 'ADMINO' then ParValue := VihodsReg[210312]
    else if ParName = 'CALDAYS' then ParValue := Hours.CalDays
    else if ParName = 'ABSENT' then ParValue := Hours.CalDays - Hours.Days
    else if ParName = 'HOURS' then ParValue := Hours.Hours
    else if ParName = 'NHOURS' then ParValue := Hours.NHours
    else if ParName = 'PHOURS' then ParValue := Hours.PHours
    else if ParName = 'SHOURS' then ParValue := Hours.SHours
    else if ParName = 'VHOURS' then ParValue := Hours.VHours
    else
        if ParName = 'OTHER' then
            ParValue := Hours.CalDays - Hours.Days - VihodsReg[35] - VihodsReg[19] -
                VihodsReg[11] - VihodsReg[17] - VihodsReg[16] - VihodsReg[32] -
                VihodsReg[20] - VihodsReg[33] - VihodsReg[34] - VihodsReg[210312] -
                VihodsReg[37]
        else if ParName = 'DAY' then
            ParValue := DayOfTheMonth(FTables[CurrentTable][CurrentDay].CurDate);

    Result := ParValue;
end;

function TTableGroup.GetNewCount: Integer;
var
    i: Integer;
begin
    Result := 0;
    for i := 0 to High(FTables) do
        if FTables[i].Status = tsNew then inc(Result);
end;

function TTableGroup.GetDistNumber(ind: Integer): Integer;
var
    i, TN: Integer;
begin
    Result := 0;
    TN := -1;
    for i := 0 to ind do
        if FTables[i].TN <> TN then
        begin
            inc(Result);
            TN := FTables[i].TN;
        end;
end;

function TTableGroup.ToString(ind, day: Integer): string;
var
    CurDate: TDate;
begin
    CurDate := FTables[ind].Span.Date_Beg + day - 1;

    with FTables[ind] do
        if day > DaysInAMonth(Year, Month) then Result := '-'
        else
                // до начала или после конца отображать пустые клетки
                // (если нет часов)
            if ((CurDate < Start_Date) or (CurDate > End_Date)
                and not Span[day].WorkDay) then Result := ''
            else Result := FTables[ind][day].ToString;
end;

function TTableGroup.Find(findStr: string): Integer;
var
    i: Integer;
begin
    for i := 0 to High(FTables) do
        if (Pos(AnsiUpperCase(findStr), AnsiUpperCase(FTables[i].FIO)) <> 0) or
            (Pos(findStr, IntToStr(FTables[i].TN)) <> 0) then
        begin
            Result := i;
            Exit;
        end;
    Result := -1;
end;

function TTableGroup.FindByVers(Id_Man_Moving: Integer; Year: Integer;
    Month: Integer; Version_Num: Integer): Integer;
var
    i: Integer;
begin
    for i := 0 to High(FTables) do
        if (FTables[i].Id_Man_Moving = Id_Man_Moving) and
            (FTables[i].Year = Year) and
            (FTables[i].Month = Month) and
            (FTables[i].Version = Version_Num) then
        begin
            Result := i;
            Exit;
        end;
    Result := -1;
end;

function TTableGroup.GetCount: Integer;
begin
    Result := Length(FTables);
end;

procedure TTableGroup.Get;
var
    i: Integer;
    form: TProcessForm;
begin
    form := TProcessForm.Create(nil);
    form.Caption := 'Формування табелю, зачекайте...';
    form.Show;
    form.Progress.Max := Length(FTables);

    for i := 0 to High(FTables) do
    begin
        FTables[i].Get;
        if Stop then break;
        form.Step;
    end;
    form.Close;
end;

procedure TTableGroup.CalcOverall;
var
    i: Integer;
begin
    with FOverallHours do
    begin
        Hours := 0;
        NHours := 0;
        PHours := 0;
        SHours := 0;
        VHours := 0;
        GHours := 0;
        Days := 0;
        CalDays := 0;

        for i := 0 to High(FTables) do
        begin
            Hours := Hours + FTables[i].Span.TotalHours.Hours;
            NHours := NHours + FTables[i].Span.TotalHours.NHours;
            PHours := PHours + FTables[i].Span.TotalHours.PHours;
            VHours := VHours + FTables[i].Span.TotalHours.VHours;
            SHours := SHours + FTables[i].Span.TotalHours.SHours;
            GHours := GHours + FTables[i].Span.TotalHours.GHours;
            Days := Days + FTables[i].Span.TotalHours.Days;
            CalDays := CalDays + FTables[i].Span.TotalHours.CalDays;

                // округлить, чтобы не было лишнего
            GHours := SimpleRoundTo(GHours, -3);
            Hours := SimpleRoundTo(Hours, -3);
            PHours := SimpleRoundTo(PHours, -3);
            NHours := SimpleRoundTo(NHours, -3);
            VHours := SimpleRoundTo(VHours, -3);
            SHours := SimpleRoundTo(SHours, -3);
        end;
    end;
end;

constructor TTableGroup.Create(query: TDataSet; DateBeg: TDate = 0; DateEnd: TDate = 0);
var
    i: Integer;
    oldTN: Integer;
    NagScreen: TNagScreen;
begin
    inherited Create;

    NagScreen := TNagScreen.Create(nil);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримуються дані для табеля з бази даних, зачекайте...');

    query.Open;
    query.Last;

    NagScreen.Free;

    FOverallVihods := TVihodsReg.Create;
    SetLength(FTables, query.RecNo);
    query.First;
    FDistCount := 0;
    oldTN := -1;
    for i := 0 to High(FTables) do
    begin
        if query.FindField('TN') <> nil then
            if oldTN <> query['TN'] then
            begin
                oldTN := query['TN'];
                inc(FDistCount);
            end;

        FTables[i] := TMovingTable.Create;
        FTables[i].PrepareFromQuery(query, DateBeg, DateEnd);

        query.Next;
    end;
end;

function TTableGroup.GetTable(ind: Integer): TMovingTable;
begin
    Result := FTables[ind];
end;

procedure TTableGroup.AddToGroup(Id_Table_Group: Integer);
var
    i: Integer;
begin
    for i := 0 to High(FTables) do
        FTables[i].AddToGroup(Id_Table_Group);
end;

destructor TTableGroup.Destroy;
var
    i: Integer;
begin
    inherited Destroy;
    FOverallVihods.Free;

    for i := 0 to High(FTables) do
        FTables[i].Free;

    for i := 0 to High(FVihodDetails) do
        FVihodDetails[i].Free;

    FOverallVihodDetails.Free;
end;

procedure TTableGroup.CalcVihods;
var
    i: Integer;
begin
    FOverallVihods.Clear;
    for i := 0 to High(FTables) do
        FOverallVihods.AddReg(FTables[i].VihodsReg);
end;

procedure TTableGroup.AddPreviosVersions;
var
    i, hi: Integer;
    t: TMovingTable;
begin
    hi := High(FTables);
    for i := 0 to hi do
        if (FTables[i].Version > 1) and
            (FindByVers(FTables[i].Id_Man_Moving, FTables[i].Year, FTables[i].Month,
            FTables[i].Version - 1) = -1) then
        begin
            t := TMovingTable.Create;

            t.Prepare(FTables[i].Id_Man_Moving, FTables[i].Span.Date_Beg,
                FTables[i].Span.Date_End);
            t.FIO := FTables[i].FIO;
            t.Post := FTables[i].Post;
            t.TN := FTables[i].TN;
            t.Start_Date := FTables[i].Start_Date;
            t.End_Date := FTables[i].End_Date;
            t.Version := FTables[i].Version - 1;

            SetLength(FTables, Length(FTables) + 1);
            FTables[High(FTables)] := t;
        end;
end;

end.
