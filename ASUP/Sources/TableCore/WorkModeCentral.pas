
{ -$Id: WorkModeCentral.pas,v 1.8 2009/07/31 15:13:14 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                   Модуль "Работа с режимами работы (внутренняя)"             }
{       Загрузка режимов работы, подсчет часов по графику для дня и прочее     }
{                                                  ответственный: Олег Волков  }


unit WorkModeCentral;

interface

uses IBQuery, Controls, IBDataBase, SysUtils, DateUtils, Variants;

const    eps = 0.0001;

type
        // типы выхода
    TVihod = class(TObject)
        public
            Id_Vihod: Integer;
            Is_Work: Boolean;
            Is_Paid: Boolean;
            Name_Full: String;
            Name_Short: String;
    end;
        // все типы выходов
    TAllVihods = class(TObject)
        private
            FQuery: TIBQuery;
            FVihods: array of TVihod;
            function FindVihod(id_vihod: Integer): TVihod;
        public
            constructor Create(Transaction: TIBTransaction);
            destructor Destroy; override;
            procedure ReLoad;
            property Vihods[id_vihod: Integer]: TVihod read FindVihod; default;
    end;

        // календарь
    TCalendar = class(TObject)
        private
            FHolidays: array of TDate;
            FQuery: TIBQuery;
            function Check_Is_Holiday(Cur_Date: TDate): Boolean;
        public
            constructor Create(Transaction: TIBTransaction);
            destructor  Destroy; override;
            procedure ReLoad;
            property Is_Holiday[Cur_Date: TDate]: Boolean read Check_Is_Holiday;default;
    end;

        // единичная запись о времени работы в данный день
    TWorkReg = record
            Work_Beg: TTime;
            Work_End: TTime;
            Break_Beg: Variant;
            Break_End: Variant;
    end;

        // исключение режима работы
    TWorkExc = record
        Exc_Date: TDate;
        Exc_Type: Integer;
        Hours: TTime;
    end;

        // режим работы
    TWorkMode = record
        Id_Work_Mode: Integer;
        Nomer: Integer;
        Name: String;
        Name_Short: String;
        Night_Beg: TTime;
        Night_End: TTime;

        WorkReg: array of TWorkReg;
        WorkExc: array of TWorkExc;
    end;

        // класс для загрузки режимов работы и подсчета времени в данный день
    TWorkModeCenter = class(TObject)
       private
            WorkModes: array of TWorkMode;
            WorkModesQuery: TIBQuery;
            WorkRegQuery: TIBQuery;
            WorkExcQuery: TIBQuery;
            FShift: Integer;
            FId_Work_Mode: Integer;
            FMode_Index: Integer;
            FCurDate: TDate;

            procedure SetWorkMode(Work_Mode: Integer);
            function GetTimes: TWorkReg;
            function NormalizeShift: Integer;
            procedure SetDate(The_Date: TDate);
            function GetNightBegin: TTime;
            function GetNightEnd: TTime;

            function Get_Vihodnoi_Id_Vihod: Integer;
            function Get_Command_Id_Vihod: Integer;
            function Get_Rody_Id_Vihod: Integer;
            function Get_Dekret_Id_Vihod: Integer;
            function Get_Boln_Id_Vihod: Integer;

       public
              // Если 1, то в табеле часы смены, переходящей через полночь,
              // разбиваются на два дня (-5-7), если 0, не разбиваются (12)
            Table_Split_Days: Integer;

            ReadTransaction: TIBTransaction;
            Consts_Query: TIBQuery;
                // учитывать ли исключения типа "меньше на час"
                // (для полставочников они не учитываются)
            Account_Less_Exceptions: Boolean;

            constructor Create(Transaction: TIBTransaction);
            destructor Destroy;override;
            procedure ReLoad;       // (пере)загрузить из базы
        published
                // установить режим
            property Id_Work_Mode: Integer read FId_Work_Mode write SetWorkMode;
                // установить сдвижку
            property Shift: Integer read FShift write FShift;
                // установить рабочий день
            property CurDate: TDate read FCurDate write SetDate;
                // возвращает времена выхода по графику для выбранных ^^^^
            property Times: TWorkReg read GetTimes;
                // возвращает сдвижку в отрезке 0..период-1
            property NormalizedShift: Integer read NormalizeShift;

            property Night_Begin: TTime read GetNightBegin;
            property Night_End: TTime read GetNightEnd;

            property Vihodnoi_Id_Vihod: Integer read Get_Vihodnoi_Id_Vihod;
            property Command_Id_Vihod: Integer read Get_Command_Id_Vihod;
            property Rody_Id_Vihod: Integer read Get_Rody_Id_Vihod;
            property Dekret_Id_Vihod: Integer read Get_Dekret_Id_Vihod;
            property Boln_Id_Vihod: Integer read Get_Boln_Id_Vihod;
    end;

        // рабочее время сегодня и завтра в данном промежутке (обычные, ночные...)
    TWorkTime = class(TObject)
        private
            FToday_Hours: TTime;
            FTomorrow_Hours: TTime;
        public
            Period_Beg: TTime;
            Period_End: TTime;

                // начала периода сегодня - конец периода завтра
                // пр: полные часы (0, 1) ночные (22/24, 6/24)
            constructor Create(Period_Beg: TTime = 0; Period_End: TTime =0);
            procedure CalcTime(WorkReg: TWorkReg);
        published
            property Today_Hours: TTime read FToday_Hours; // часы сегодня
            property Tomorrow_Hours: TTime read FTomorrow_Hours; // часы завтра
    end;

        // разные часы работы по дню
    TWorkHours = class(TObject)
        private
            FHours: TWorkTime;
            FNightHours: TWorkTime;
            FGraficHours: TWorkTime;

            FWorkReg: TWorkReg;
            FGraficReg: TWorkReg;
        public
            constructor Create(Night_Beg, Night_End: TTime);
            destructor Destroy; override;
                // подсчитывает часы из времени работы
            procedure CalcHours;
        published
            property Hours: TWorkTime read FHours;
            property NightHours: TWorkTime read FNightHours;
            property GraficHours: TWorkTime read FGraficHours;

            property WorkReg: TWorkReg read FWorkReg write FWorkReg;
            property GraficReg: TWorkReg read FGraficReg write FGraficReg;
    end;

        // возвращает реальную сдвижку, исходя из сдвижки относительно
        // заданной даты, или наоборот
    function ConvertShift(Shift: Integer; From_Date: TDate; ReturnReal: Boolean = True): Integer;

        // возвращает время, соотв. нерабочему дню
    function ZeroReg: TWorkReg;
        // возвращает время работы соотв. количеству часов
    function HoursReg(Hours: TTime): TWorkReg;
        // изменяет количество часов на плюс или минус число
    procedure HoursChangeReg(var Reg: TWorkReg; Hours: TTime);

    function TimeToHours(Hours: Variant; Hours_F: Variant): Double;
var
    WorkModeCenter: TWorkModeCenter;
    Calendar: TCalendar;
    AllVihods: TAllVihods;
    Shift_Begin: TDate;

implementation

uses Math;

function TimeToHours(Hours: Variant; Hours_F: Variant): Double;
begin
  if VarIsNull(Hours) then Result := 0
  else
  if Hours > eps then Result := 24*Hours
  else
  if Hours_F > eps then Result := Hours_F
  else Result := 0;
end;

function TWorkModeCenter.Get_Vihodnoi_Id_Vihod: Integer;
begin
     Result := Consts_Query['Vihodnoi_Id_Vihod'];
end;

function TWorkModeCenter.Get_Command_Id_Vihod: Integer;
begin
     Result := Consts_Query['Command_Id_Vihod'];
end;

function TWorkModeCenter.Get_Rody_Id_Vihod: Integer;
begin
     Result := Consts_Query['Rody_Id_Vihod'];
end;

function TWorkModeCenter.Get_Dekret_Id_Vihod: Integer;
begin
     Result := Consts_Query['Dekret_Id_Vihod'];
end;

function TWorkModeCenter.Get_Boln_Id_Vihod: Integer;
begin
     Result := Consts_Query['Boln_Id_Vihod'];
end;


function TWorkModeCenter.GetNightBegin: TTime;
begin
    Result := WorkModes[FMode_Index].Night_Beg;
end;

function TWorkModeCenter.GetNightEnd: TTime;
begin
    Result := WorkModes[FMode_Index].Night_End;
end;


procedure TWorkModeCenter.SetDate(The_Date: TDate);
begin
    FCurDate := Trunc(The_Date);
end;

function TWorkModeCenter.NormalizeShift: Integer;
var
    m: Integer;
begin
    m := Length(WorkModes[FMode_Index].WorkReg);
    if m <> 0 then
    begin
        Result := FShift mod m;
        if Result < 0 then Result := m + Result;
    end
    else Result := FShift;
end;

procedure TWorkHours.CalcHours;
begin
    FHours.CalcTime(FWorkReg);
    FNightHours.CalcTime(FWorkReg);
    FGraficHours.CalcTime(FGraficReg);
end;

constructor TWorkHours.Create(Night_Beg, Night_End: TTime);
begin
    inherited Create;
    FHours := TWorkTime.Create(0, 1);
    FNightHours := TWorkTime.Create(Night_Beg, Night_End);
    FGraficHours := TWorkTime.Create(0, 1);
end;

destructor TWorkHours.Destroy;
begin
    FHours.Free;
    FNightHours.Free;
    FGraficHours.Free;
end;

constructor TWorkTime.Create(Period_Beg: TTime = 0; Period_End: TTime = 0);
begin
    inherited Create;
    Self.Period_Beg := Period_Beg;
    Self.Period_End := Period_End;
end;

procedure TWorkTime.CalcTime(WorkReg: TWorkReg);
var
    Today_End, Tomorrow_End: TTime; // конец работы сегодня и завтра
    LBound, RBound: TTime;
begin
    with WorkReg do
    begin
            // переходящие через полночь часы
        if Work_End < Work_Beg then
        begin
            Today_End := 1;
            Tomorrow_End := Work_End;
        end
        else    // непереходящие часы
        begin
            Today_End := Work_End;
            Tomorrow_End := 0;
        end;

            // период полностью в одном дне
            //  | [****] |
        if Period_Beg < Period_End then
        begin
            LBound := Max(Work_Beg, Period_Beg);
            RBound := Min(Today_End, Period_End);

            if LBound < RBound then FToday_Hours := RBound - LBound
            else FToday_Hours := 0;
        end
        else    // период затрагивает два дня
                // |**]   [***|
        begin
            FToday_Hours := 0;
                // учесть первый кусок (от полуночи до конца)
            if Work_Beg < Period_End then
                FToday_Hours := FToday_Hours + Min(Today_End, Period_End) - Work_Beg;
                // учесть второй кусок (от начала до полуночи)
            if Today_End > Period_Beg then
                FToday_Hours := FToday_Hours + Today_End - Max(Work_Beg, Period_Beg);
        end;

          FTomorrow_Hours := Min(Tomorrow_End, Period_End);
            // учет перерыва - считаем, что он в первом дне до точки Х :)
        if not ( VarIsNull(Break_Beg) or VarIsNull(Break_End) ) then
            //перерыв в первом дне
              if ( (Break_Beg > Work_Beg) and (FToday_Hours > eps) ) then
                FToday_Hours := FToday_Hours - (Break_End - Break_Beg)
            //перерыв во втором дне
              else if ((Break_Beg < Work_Beg) and (FTomorrow_Hours > eps) ) then
                    FTomorrow_Hours := FTomorrow_Hours - (Break_End - Break_Beg);


    end;
end;

function ConvertShift(Shift: Integer; From_Date: TDate; ReturnReal: Boolean = True): Integer;
begin
    if ReturnReal then
        Result := Shift + DaysBetween(Shift_Begin, From_Date)
    else Result := Shift - DaysBetween(Shift_Begin, From_Date)
end;

function ZeroReg: TWorkReg;
begin
    with Result do
    begin
        Work_Beg := 8/24;
        Work_End := Work_Beg;
        Break_Beg := Null;
        Break_End := Null;
    end;
end;

function HoursReg(Hours: TTime): TWorkReg;
begin
    with Result do
    begin
        Work_Beg := 8/24;
        Work_End := Work_Beg + Hours;
        Break_Beg := Null;
        Break_End := Null;
    end;
end;

procedure HoursChangeReg(var Reg: TWorkReg; Hours: TTime);
begin
    with Reg do
    if (Hours > 0) or (Work_End <> Work_Beg) then
    begin
        Work_End := Work_End + Hours;
        if Work_End > 1 then Work_End := 1;
    end;
end;

function TWorkModeCenter.GetTimes: TWorkReg;
var
    i, j, m: Integer;
    dayz_between: Integer;
begin
    m := Length(WorkModes[FMode_Index].WorkReg);

    dayz_between := Trunc(FCurDate - Shift_Begin);
    if m <> 0 then
        i := (dayz_between - Shift) mod m
    else i := 0;

    if ( i < 0 ) then i := m + i;

    with WorkModes[FMode_Index] do
    for j:=0 to High(WorkExc) do
        if WorkExc[j].Exc_Date = FCurDate then
        begin
            if WorkExc[j].Exc_Type = 0 then
            begin
                Result := HoursReg(WorkExc[j].Hours);
                Exit;
            end
            else
            if Account_Less_Exceptions and ( WorkExc[j].Exc_Type = -1 ) then
            begin
                Result := WorkModes[FMode_Index].WorkReg[i];
                HoursChangeReg(Result, -WorkExc[j].Hours);
                Exit;
            end
            else
            if WorkExc[j].Exc_Type = +1 then
            begin
                Result := WorkModes[FMode_Index].WorkReg[i];
                HoursChangeReg(Result, +WorkExc[j].Hours);
                Exit;
            end;
        end;

    if m <> 0 then
        Result := WorkModes[FMode_Index].WorkReg[i]
    else Result := ZeroReg;
end;

procedure TWorkModeCenter.SetWorkMode(Work_Mode: Integer);
var
    ind: Integer;
begin
    FId_Work_Mode := Work_Mode;
    for ind := 0 to High(WorkModes) do
        if WorkModes[ind].Id_Work_Mode = Work_Mode then
        begin
            FMode_Index := ind;
            Exit;
        end;
    raise Exception.Create('TWorkModeCenter: Не знайдено режим праці ' +
          IntToStr(Work_Mode));
end;

constructor TWorkModeCenter.Create(Transaction: TIBTransaction);
begin
    inherited Create;

    WorkModesQuery := TIBQuery.Create(nil);
    WorkRegQuery := TIBQuery.Create(nil);
    WorkExcQuery := TIBQuery.Create(nil);
    Consts_Query := TIBQuery.Create(nil);

    WorkModesQuery.Transaction := Transaction;
    WorkRegQuery.Transaction := Transaction;
    WorkExcQuery.Transaction := Transaction;
    Consts_Query.Transaction := Transaction;

    WorkModesQuery.SQL.Text := 'SELECT * FROM Dt_Work_Mode ORDER BY Id_Work_Mode';
    WorkRegQuery.SQL.Text := 'SELECT * FROM Dt_WorkReg ORDER BY Id_Work_Mode, Id_Day_Week';
    WorkExcQuery.SQL.Text := 'SELECT * FROM Work_Exc ORDER BY Id_Work_Mode, Exc_Date';
    Consts_Query.SQL.Text := 'SELECT * FROM Ini_Asup_Consts';
    Consts_Query.Open;

    ReadTransaction := Transaction;
    Account_Less_Exceptions := True;

    Table_Split_Days := Consts_Query['Table_Split_Days'];
end;

destructor TWorkModeCenter.Destroy;
begin
    Consts_Query.Free;
    WorkModesQuery.Free;
    WorkRegQuery.Free;
    WorkExcQuery.Free;
                      
    inherited;
end;

procedure TWorkModeCenter.ReLoad;
var
    mode, reg, exc: Integer;
begin
    if not Consts_Query.Active then Consts_Query.Open;
    Shift_Begin := Consts_Query['Shift_Begin'];

    WorkModesQuery.Close;
    WorkRegQuery.Close;
    WorkExcQuery.Close;

    WorkModesQuery.Open;
    WorkRegQuery.Open;
    WorkExcQuery.Open;

    mode := 0;
    WorkModesQuery.First;
    while not WorkModesQuery.Eof do
    begin
        SetLength(WorkModes, mode+1);
        with WorkModes[mode] do
        begin
            Id_Work_Mode := WorkModesQuery['Id_Work_Mode'];
            Nomer := WorkModesQuery['Nomer'];
            Name := WorkModesQuery['Name'];
            Name_Short := WorkModesQuery['Name_Short'];
            Night_Beg := WorkModesQuery['Night_Beg'];
            Night_End := WorkModesQuery['Night_End'];

            reg := 0;
            WorkRegQuery.Locate('Id_Work_Mode', Id_Work_Mode, []);
            while (WorkRegQuery['Id_Work_Mode'] = Id_Work_Mode)
                and not WorkRegQuery.Eof do
            begin
                SetLength(WorkReg, reg+1);
                with WorkReg[reg] do
                begin
                    Work_Beg := WorkRegQuery['Work_Beg'];
                    Work_End := WorkRegQuery['Work_End'];
                    Break_Beg := WorkRegQuery['Break_Beg'];
                    Break_End := WorkRegQuery['Break_End'];
                end;
                inc(reg);
                WorkRegQuery.Next;
            end;

            exc := 0;
            WorkExcQuery.Locate('Id_Work_Mode', Id_Work_Mode, []);
            while (WorkExcQuery['Id_Work_Mode'] = Id_Work_Mode)
                and not WorkExcQuery.Eof do
            begin
                SetLength(WorkExc, exc+1);
                with WorkExc[exc] do
                begin
                    Exc_Type := WorkExcQuery['Exc_Type'];
                    Exc_Date := WorkExcQuery['Exc_Date'];
                    Hours := WorkExcQuery['Hours'];
                end;
                inc(exc);
                WorkExcQuery.Next;
            end;
        end;
        inc(mode);
        WorkModesQuery.Next;
    end;

    FMode_Index := 0;
    FShift := 0;
end;

function TCalendar.Check_Is_Holiday(Cur_Date: TDate): Boolean;
var
    i: Integer;
begin
    Result := False;
    for i:=0 to High(FHolidays) do
        if FHolidays[i] = Cur_Date then
        begin
            Result := True;
            Exit;
        end;
end;

constructor TCalendar.Create(Transaction: TIBTransaction);
begin
    inherited Create;
    FQuery := TIBQuery.Create(nil);
    FQuery.Transaction := Transaction;
    FQuery.SQL.Text := 'SELECT Tbl_Year, Tbl_Month, Tbl_Day FROM Calendar' +
        ' WHERE Holiday = ''T'' ORDER BY Tbl_Year, Tbl_Month, Tbl_Day';
end;

destructor TCalendar.Destroy;
begin
    FQuery.Free;
    inherited Destroy;
end;

procedure TCalendar.ReLoad;
var
    i: Integer;
begin
    SetLength(FHolidays, 0);
    FQuery.Close;
    FQuery.Open;
    FQuery.First;
    i := 0;
    while not FQuery.Eof do
    begin
        SetLength(FHolidays, i+1);
        FHolidays[i] := EncodeDate(FQuery['Tbl_Year'], FQuery['Tbl_Month'],
            FQuery['Tbl_Day']);
        FQuery.Next;
        inc(i);
    end;
end;

constructor TAllVihods.Create(Transaction: TIBTransaction);
begin
    inherited Create;
    FQuery := TIBQuery.Create(nil);
    FQuery.Transaction := Transaction;
    FQuery.SQL.Text := 'SELECT Id_Vihod, Name_Full, Name_Short, Is_Work, Is_Paid FROM Sp_Vihod';
end;

destructor TAllVihods.Destroy;
var
    i: Integer;
begin
    for i:=0 to High(FVihods) do
        FVihods[i].Free;
    FQuery.Free;
    inherited Destroy;
end;

procedure TAllVihods.ReLoad;
var
    i: Integer;
begin
    FQuery.Close;
    FQuery.Open;
    FQuery.First;
    i := 0;
    while not FQuery.Eof do
    begin
        SetLength(FVihods, i+1);
        FVihods[i] := TVihod.Create;
        FVihods[i].Id_Vihod := FQuery['Id_Vihod'];
        FVihods[i].Name_Full := FQuery['Name_Full'];
        FVihods[i].Name_Short := FQuery['Name_Short'];
        FVihods[i].Is_Work := ( FQuery['Is_Work'] = 'T' );
        FVihods[i].Is_Paid := ( FQuery['Is_Paid'] = 'T' );
        FQuery.Next;
        inc(i);
    end;
end;

function TAllVihods.FindVihod(id_vihod: Integer): TVihod;
var
    i: Integer;
begin
    Result := nil;
    for i:=0 to High(FVihods) do
        if FVihods[i].Id_Vihod = id_vihod then
        begin
            Result := FVihods[i];
            Exit;
        end;
end;


end.