{ $Id: uMovingTable.pas,v 1.23 2007/09/03 07:47:32 oleg Exp $ }

unit uMovingTable;

interface

uses TableCentral, IBQuery, uVihodsReg, Controls, IBDatabase, DateUtils,
    SysUtils, SpCommon, WorkModeCentral, Variants, SpTimeUtils, uTableCommon,
    DB;

type
            // табель на мувинг
    TMovingTable = class(TObject)
    private
        FQuery: TIBQuery;
        FTableDaySpan: TTableDaySpan;
        FStatus: TTableStatus;
        FVihodsReg: TVihodsReg;

        FHours_Norm: Double;
        FDays_Norm: Integer;

        function GetTableDay(ind: Integer): TTableDay;
    public
        ErrorMessage: string;
        Kol_Stavok: array of Double;
        Id_Moving_Type: array of Double;
        FIO: string;
        TN: Integer;
        Tarif: Integer; // тариф или нет
        Post: string;
        Id_Man_Moving: Integer;
        Id_PCard: Integer;
        Num_Digit: Integer;
        Oklad: Double;

        Calc_In_Hours: Integer;

        Year: Integer;
        Month: Integer;

        Dept_Order: Integer;
        Shtat_Order: Integer;
        Name_Department: string;

        Version: Integer;

                // дата начала и конца работы
        Start_Date: TDate;
        End_Date: TDate;

        property Status: TTableStatus read FStatus;
        property VihodsReg: TVihodsReg read FVihodsReg;

        constructor Create;
        destructor Destroy; override;

                // подготовить данные
        procedure Prepare(Id_Man_Moving: Integer; Date1, Date2: TDate);
                // подготовить табель из запроса (считать Id_Man_Moving и т.д.)
        procedure PrepareFromQuery(Query: TDataSet; Date1: TDate = 0; Date2: TDate = 0);
                // считать или сформировать
        procedure Get;
                // просчитать заново (только график или все остальное)
        procedure FormTable(OnlyGraphic: Boolean = False);
                // записать табель в базу (результат: ошибка или пустая строка)
        function Write(Sys: Integer; Comment: string; Id_Table_Group: Integer): string;
                // считать табель из базы (результат: удалось или нет)
        function ReadFromBase: Boolean;
                // подсчитать количество типов (не)выходов
        procedure CalcVihods;
                // добавить в группу (при подписании)
        procedure AddToGroup(Id_Table_Group: Integer);
                // возвращает строку с выходными (сб, вс)
        function GetVihodnString: string;
                // возвращает строку с праздничными днями
        function GetPraznString: string;
                // подписан ли табель
        function Signed: Boolean;
                // установить норму
        procedure SetNorm(nHours: Double; nDays: Integer);


        property Span: TTableDaySpan read FTableDaySpan;
        property Cells[ind: Integer]: TTableDay read GetTableDay; default;


        property Hours_Norm: Double read FHours_Norm;
        property Days_Norm: Integer read FDays_Norm;
    end;

var
    TableUserLogin: string;
    TableUserName: string;
    TableUserFlags: Integer;

implementation

uses Math;

function TMovingTable.Signed: Boolean;
var
    query: TIBQuery;
begin
    query := TIBQuery.Create(nil);
    query.Transaction := TableReadTransaction;
    query.SQL.Text := 'SELECT * FROM Table_Sign_Info(:Year, :Month, :Id_Man_Moving)';
    with query.Params do
    begin
        ParamByName('Year').AsInteger := YearOf(FTableDaySpan.Date_Beg);
        ParamByName('Month').AsInteger := MonthOf(FTableDaySpan.Date_Beg);
        ParamByName('Id_Man_Moving').AsInteger := Id_Man_Moving;
    end;
    query.Open;
    Result := not query.IsEmpty;
    query.Free;
end;

function TMovingTable.GetVihodnString: string;
var
    i: Integer;
begin
    Result := ' ';
    for i := 1 to FTableDaySpan.Count do
        if DayOfTheWeek(FTableDaySpan[i].CurDate) in [6, 7] then
            Result := Result + IntToStr(DayOfTheMonth(FTableDaySpan[i].CurDate))
                + ' ';
end;

function TMovingTable.GetPraznString: string;
var
    i: Integer;
begin
    Result := ' ';
    for i := 1 to FTableDaySpan.Count do
        if FTableDaySpan[i].Is_Prazn then
            Result := Result + IntToStr(DayOfTheMonth(FTableDaySpan[i].CurDate))
                + ' ';
end;

procedure TMovingTable.AddToGroup(Id_Table_Group: Integer);
var
    query: TIBQuery;
begin
    query := TIBQuery.Create(nil);
    query.Transaction := TableWriteTransaction;
    query.SQL.Text := 'EXECUTE PROCEDURE Table_Add_To_Group' +
        ' :Id_Table_Group, :Id_Man_Moving, :Year, :Month';
    with query.Params do
    begin
        ParamByName('Id_Table_Group').AsInteger := Id_Table_Group;
        ParamByName('Id_Man_Moving').AsInteger := Id_Man_Moving;
        ParamByName('Year').AsInteger := YearOf(FTableDaySpan.Date_Beg);
        ParamByName('Month').AsInteger := MonthOf(FTableDaySpan.Date_Beg);
    end;
    ExecQuery(query);
    query.Free;
end;

procedure TMovingTable.CalcVihods;
var
    i, day1, day2: Integer;
    dBeg, dEnd: TDate;
begin
    FVihodsReg.Clear;
    if Start_Date > Span.Date_Beg then
        dBeg := Start_Date
    else
        dBeg := Span.Date_Beg;

    if End_Date < Span.Date_End then
        dEnd := End_Date
    else
        dEnd := Span.Date_End;

    day1 := DaysBetween(Span.Date_Beg, dBeg) + 1;
    day2 := DaysBetween(Span.Date_Beg, dEnd) + 1;
    for i := day1 to day2 do
        FVihodsReg.AddVihodCount(Span[i].Vihod, 1);
end;

constructor TMovingTable.Create;
begin
    inherited Create;
    Calc_In_Hours := 1;
    FVihodsReg := TVihodsReg.Create;
    Version := -1;
end;


function TMovingTable.Write(Sys: Integer; Comment: string; Id_Table_Group: Integer): string;
var
    query: TIBQuery;
    id_Table_Header: Integer;
    day: Integer;
    intran: Boolean;
begin
    intran := TableWriteTransaction.InTransaction;

    if not intran then TableWriteTransaction.StartTransaction;
    query := nil;
    try
        query := TIBQuery.Create(nil);
        query.Transaction := TableWriteTransaction;

            // записать заголовок и получить его идентификатор
        {if NoPassMode then flags := 4
        else if AdminMode then flags := 8
        else if Developer then flags :=  16
        else flags := 0;}

        query.SQL.Text := 'SELECT * FROM Dt_Table_Header_Insert(:Id_Man_Moving,'
            + ':Year, :Month, :Comment, :User_Login, :User_FIO,'
            + ':Flags, :Sys, :Hours_Norm, :Days_Norm, :Calc_In_Hours)';
        with query.Params do
        begin
            ParamByName('Id_Man_Moving').AsInteger := Id_Man_Moving;
            ParamByName('Year').AsInteger := YearOf(Span.Date_Beg);
            ParamByName('Month').AsInteger := MonthOf(Span.Date_Beg);
            ParamByName('Comment').AsString := Comment;
            ParamByName('User_Login').AsString := TableUserLogin;
            ParamByName('User_FIO').AsString := TableUserName;
            ParamByName('Flags').AsInteger := TableUserFlags;
            ParamByName('Sys').AsInteger := Sys;
            ParamByName('Hours_Norm').AsFloat := Hours_Norm;
            ParamByName('Days_Norm').AsInteger := Days_Norm;
            ParamByName('Calc_In_Hours').AsInteger := Calc_In_Hours;
        end;
        id_Table_Header := ExecQuery(query);
        if id_Table_Header = -1 then
            raise Exception.Create('Не вдалося додати заголовок табеля!');
            // добавить информацию о днях
        query.SQL.Text := 'EXECUTE PROCEDURE Dt_Table_Insert_2 :Id_Table_Header,' +
            ':Tbl_Day, :Work_Beg, :Work_End, :Id_Vihod, :Break_Beg,:Break_End,' +
            ':Hours, :NHours, :PHours, :GHours, :SHours, :VHours, :Add_Flags,' +
            ':Hours_F, :GHours_F, :PHours_F, :VHours_F, :NHours_F, :Cur_Date,' +
            ':Year, :Month';
        for day := 1 to Span.Count do
            with query, query.Params, Span[day] do
            begin
                ParamByName('Id_Table_Header').AsInteger := id_Table_Header;
                ParamByName('Tbl_Day').AsInteger := day;
                ParamByName('Work_Beg').AsTime := ThisHours.WorkReg.Work_Beg;
                ParamByName('Work_End').AsTime := ThisHours.WorkReg.Work_End;
                ParamByName('Id_Vihod').AsInteger := Vihod.Id_Vihod;
                ParamByName('Break_Beg').Value := ThisHours.WorkReg.Break_Beg;
                ParamByName('Break_End').Value := ThisHours.WorkReg.Break_End;
                ParamByName('Hours').AsTime := Hours.Hours / 24;
                ParamByName('NHours').AsTime := Hours.NHours / 24;
                ParamByName('PHours').AsTime := Hours.PHours / 24;
                ParamByName('GHours').AsTime := Hours.GHours / 24;
                ParamByName('SHours').AsBCD := Hours.SHours;
                ParamByName('VHours').AsTime := Hours.VHours / 24;
                ParamByName('Add_Flags').AsInteger := Add_Flags;
                ParamByName('Hours_F').AsBCD := Hours.Hours;
                ParamByName('GHours_F').AsBCD := Hours.GHours;
                ParamByName('NHours_F').AsBCD := Hours.NHours;
                ParamByName('PHours_F').AsBCD := Hours.PHours;
                ParamByName('VHours_F').AsBCD := Hours.VHours;
                ParamByName('Cur_Date').AsDate := CurDate;
                ParamByName('Year').AsInteger := YearOf(CurDate);
                ParamByName('Month').AsInteger := MonthOf(CurDate);
                ExecQuery(query);
            end;
        if not intran then TableWriteTransaction.Commit;

        FStatus := tsWritten;
        query.Free;
        Result := '';

    except on e: Exception do
        begin
            Result := e.Message;
            if not intran then TableWriteTransaction.Rollback;
            query.Free;
        end;
    end;
end;

function TMovingTable.GetTableDay(ind: Integer): TTableDay;
begin
    Result := Span[ind];
end;


procedure TMovingTable.Get;
begin
    if not ReadFromBase then FormTable(False);
end;

        // табель - это зло!
procedure TMovingTable.FormTable(OnlyGraphic: Boolean = False);
var
    Date_Beg, Date_End, Period_Beg, Period_End, Base_Date, End2: TDate;
    i, day1, day2, vihod, lastDay: Integer;
    Birth_Date, _18Date: TDate;
    firstChange, lastChange, zero: Boolean;
    id_work_mode, shift: Integer;
    Use_Hours, Smena, Use_Less_Exc: Boolean;
    Old_Date_Beg: TDate;
    bookmark: TBookmark;
    Use_Kol_Stavok: Integer;
    BeremHospital: Boolean;
begin
    FStatus := tsNew;

    try
        Base_Date := FTableDaySpan.Date_Beg;
        Date_Beg := Base_Date;
        Date_End := FTableDaySpan.Date_End;
        lastDay := DaysBetween(Base_Date, Date_End) + 1;

            // подготовить запрос
        FQuery.Close;
        FQuery.SQL.Text := 'SELECT * FROM Table_Get_Data(' +
            IntToStr(Id_Man_Moving) + ',''' + DateToStr(Date_Beg) + ''',''' +
            DateToStr(Date_End) + ''')';
        FQuery.Open;

        if Date_Beg < EncodeDate(2006, 03, 01) then
            Use_Hours := False
        else
            Use_Hours := True;

            // очистить все
        for i := 0 to FTableDaySpan.Count do
            FTableDaySpan[i].Clear;

            // считать календарь
        FTableDaySpan.ReadCalendar(Calendar);

    // считать в днях, пока не появятся показания для расчета в часах
        if Use_Hours then
            Calc_In_Hours := 0
        else
            Calc_In_Hours := 1;

                  // если тариф, считаем в часах
        if Use_Hours and (Tarif = 1) then Calc_In_Hours := 1;

                  // если неполная ставка, считаем в часах
        if Use_Hours then
            for i := 1 to High(Kol_Stavok) do
                if Kol_Stavok[i] <> 1 then Calc_In_Hours := 1;

            // считать и применить информацию о графиках человека
        firstChange := True;
        FQuery.First;
        FQuery.Locate('The_Type', 4, []);
        while not FQuery.Eof and (FQuery['The_Type'] = 4) do
        begin
            Period_Beg := FQuery['Date_Beg'];
            Period_End := FQuery['Date_End'];
            Old_Date_Beg := FQuery['Date_Beg'];
            id_work_mode := FQuery['Id_Work_Mode'];
            if VarIsNull(FQuery['Shift']) then
                shift := 0
            else
                shift := FQuery['Shift'];

            Smena := FQuery['Is_Smena'] = 'T';

            Use_Kol_Stavok := FQuery['Use_Kol_Stavok'];

            FQuery.Next;
            lastChange := FQuery.Eof or (FQuery['The_Type'] <> 4);

            if Period_Beg < Date_Beg - 1 then Period_Beg := Date_Beg - 1;
            if Period_End > Date_End then Period_End := Date_End;

            // если человек принят в середине месяца, считать график с начала
            // !!! только если это первое изменение по RMOVING (иначе перевод)
            if firstChange and (Start_Date > Date_Beg - 1) then
                Period_Beg := Date_Beg - 1;

            // если человек был уволен в конце месяца, считать график до конца
            // !!! только если последние изменение по RMOVING (иначе перевод)
            // ! учесть увольнения, когда человек был принят не на постоянную работу
            if lastChange and (End_Date < Date_End) and (Period_End < Date_End) then Period_End := Date_End;


                 // учесть количество ставок в плане использования исключений
                 // "на час меньше"
            Use_Less_Exc := True;
            for i := Trunc(Period_Beg - Date_Beg + 2) to Trunc(Period_End - Date_Beg + 1) do
                if Kol_Stavok[i] <= 0.999 then Use_Less_Exc := False;
            WorkModeCenter.Account_Less_Exceptions := Use_Less_Exc;

            FTableDaySpan.UnSelectAll;
            FTableDaySpan.SelectRange(Period_Beg, Period_End);
            FTableDaySpan.SetMode(id_work_mode, shift, Use_Kol_Stavok);

              // если изменение режима работы в этом периоде
             // и режим посменный, считать по часам
             // только если эта запись не перекрывается полностью следующей
            if Use_Hours and Smena and (Period_Beg <= End_Date)
                and (lastChange or (Max(Old_Date_Beg, Max(Start_Date, Date_Beg - 1)) <>
                Max(FQuery['Date_Beg'], Max(Start_Date, Date_Beg - 1)))) then
                Calc_In_Hours := 1;

            firstChange := False;
        end;

        FTableDaySpan.CalcDays;
        FTableDaySpan.CalcGraphic;

        if not OnlyGraphic then
        begin
             // считать информацию о дне рождения (для несовершеннолетних)
            for i := 1 to FTableDaySpan.Count do
                FTableDaySpan[i].Add_Flags := 0;

            FQuery.First;
            if FQuery.Locate('The_Type', 7, []) then
            begin
                Birth_Date := FQuery['Date_Beg'];
                _18Date := IncYear(Birth_Date, 18);

                for i := 1 to FTableDaySpan.Count do
                    if _18Date > FTableDaySpan[i].CurDate then
                        FTableDaySpan[i].Add_Flags := 1;
            end;


            // считать информацию о неполном графике
            FQuery.First;
            FQuery.Locate('The_Type', 9, []);
            while not FQuery.Eof and (FQuery['The_Type'] = 9) do
            begin
                Period_Beg := FQuery['Date_Beg'];
                Period_End := FQuery['Date_End'];
                if Period_Beg < Date_Beg-1 then Period_Beg := Date_Beg-1;
                if Period_End > Date_End then Period_End := Date_End;

                day1 := Round(Period_Beg - Base_Date) + 1;
                day2 := Round(Period_End - Base_Date) + 1;

                if Use_Hours then Calc_In_Hours := 1;

                for i := day1 to day2 do
                    if FTableDaySpan[i].WorkDay then
                    begin
                        FTableDaySpan[i].WorkHalfTime := True;
                        FTableDaySpan[i].EatHours(FQuery['Hours'],
                            FQuery['From_Where']);
                    end;

                FQuery.Next;
            end;

            // считать информацию об отпусках
            FQuery.First;
            FQuery.Locate('The_Type', 1, []);
            while not FQuery.Eof and (FQuery['The_Type'] = 1) do
            begin
                Period_Beg := FQuery['Date_Beg'];
                Period_End := FQuery['Date_End'];
                if Period_Beg < Date_Beg-1 then Period_Beg := Date_Beg-1;
                if Period_End > Date_End then Period_End := Date_End;

                day1 := DaysBetween(Base_Date - 1, Period_Beg);
                day2 := DaysBetween(Base_Date - 1, Period_End);

                for i := day1 to day2 do
                begin
                    vihod := FQuery['Id_Vihod'];
                    // праздничный день в отпуске заменить выходным
                    // в случае, если установлена соотв. настройка
                    if FTableDaySpan[i].Is_Prazn and
                        (FQuery['Dont_Calc_Holidays'] = 'T') then
                        vihod := WorkModeCenter.Vihodnoi_Id_Vihod;

                    // в случае, когда последний день отпуска - переходящий,
                    // заменить следующий день выходным по графику
                    if (i = day2) and (FTableDaySpan[i].Is_Perehod)
                        and (i <> lastDay) then
                    begin
                        zero := True;
                            // проверить, если дальше впритык больничный, то
                            // замену на выходной делать не надо!
                        if not FQuery.IsEmpty then
                        begin
                            bookmark := FQuery.GetBookmark;

                            FQuery.First;
                            while not FQuery.Eof do
                            begin
                              if (FQuery['The_Type'] = 2) and
                                  (FQuery['Date_Beg'] = Period_End + 1) then zero := False;
                              FQuery.Next;
                            end;
                            FQuery.GotoBookmark(bookmark);
                            FQuery.FreeBookmark(bookmark);
                        end;
                        if zero then FTableDaySpan.ZeroGraphic(i + 1);
                    end;

                    FTableDaySpan.SetVihod(i, vihod);
                end;
                FQuery.Next;
            end;

            FTableDaySpan.CalcDays;

                    // считать информацию о больничных
            FQuery.First;
            FQuery.Locate('The_Type', 2, []);
            while not FQuery.Eof and (FQuery['The_Type'] = 2) do
            begin
                Period_Beg := FQuery['Date_Beg'];
                Period_End := FQuery['Date_End'];
                if Period_Beg < Date_Beg-1 then Period_Beg := Date_Beg-1;
                if Period_End > Date_End then Period_End := Date_End;

                if FQuery['Ending'] = 2 then
                    End2 := Date_End
                else
                    End2 := Period_End;

                FTableDaySpan.UnSelectAll;
                FTableDaySpan.SelectRange(Period_Beg, End2);
                FTableDaySpan.SetMode_NoClear(FQuery['Id_Work_Mode'], FQuery['Shift']);
                FTableDaySpan.CalcDays;

                day1 := Round(Period_Beg - Base_Date) + 1;
                day2 := Round(Period_End - Base_Date) + 1;

                if FQuery['Ending'] = 2 then day2 := lastDay;

                for i := day1 to day2 do
                begin
                    // учесть случаи, когда больничный не служит основанием
                    // для продления отпуска
                    // ЗЫ: если больничный пересекается в отпуском без оплаты
                    // больничный не учитывать!
                    // учесть версию больничного при учете
                    // не пересекаем больничный с отпуском, если отпуск не типа
                    // "основной" (в), либо больничный у нас по родам
                    BeremHospital := ( (FQuery['Hosp_Version'] = 2 ) and ( FQuery['Illness_Type'] <> 8 ) )
                        or ( (FQuery['Hosp_Version'] = 1 ) and ( FQuery['Illness_Type'] <> 10 ) );
                    if (FTableDaySpan[i].Vihod <> nil) and
                        (FTableDaySpan[i].Vihod.Id_Vihod <> 11) and
                        (FTableDaySpan[i].Vihod.Id_Vihod <> 35) and
                        BeremHospital then continue;

                    // в случае, когда последний день больничного - переходящий,
                    // заменить следующий день выходным по графику
                    if (i = day2) and (FTableDaySpan[i].Is_Perehod)
                        and (i <> lastDay) then
                    begin
                        zero := True;
                            // проверить, если дальше впритык больничный, то
                            // замену на выходной делать не надо!
                        if not FQuery.IsEmpty then
                        begin
                            FQuery.Next;
                            if (FQuery['The_Type'] = 2) and
                                (FQuery['Date_Beg'] = Period_End + 1) then zero := False;
                            FQuery.Prior;
                        end;
                        if zero then FTableDaySpan.ZeroGraphic(i + 1);
                    end;

                  // учесть родовой отпуск (больничный)
                    if ((FQuery['Hosp_Version'] = 1) and
                        (FQuery['Illness_Type'] = 10)) or
                        ((FQuery['Hosp_Version'] = 2) and
                        (FQuery['Illness_Type'] = 8)) then
                        vihod := WorkModeCenter.Rody_Id_Vihod
                    else {// отметить только рабочие дни в больничном} if FTableDaySpan[i].Hours.GHours < eps then
                            vihod := 35
                        else
                            vihod := WorkModeCenter.Boln_Id_Vihod;

                    FTableDaySpan.SetVihod(i, vihod);
                end;

                FQuery.Next;
            end;

            FTableDaySpan.CalcDays;

                    // считать информацию о сверхурочных и работе в выходной
            FQuery.First;
            FQuery.Locate('The_Type', 5, []);
            while not FQuery.Eof and (FQuery['The_Type'] = 5) do
            begin
                if (FQuery['Date_Beg'] <= End_Date)
                    and (FQuery['Date_Beg'] >= Start_Date)
                    and ( FQuery['Date_Beg'] >= Base_Date ) then
                begin
                    i := DaysBetween(Base_Date, FQuery['Date_Beg'])+1;
                    with FTableDaySpan[i] do
                        if FQuery['Type2'] = 1 then // сверхурочные
                        begin
                            // по последним данным мы просто прибавляем часы
                            // время работы не меняем (чтоб не было ночных и т.д.)
                 //       with ThisHours.WorkReg do
                 //           Work_End := SimpleRoundTo(24*Work_End + FQuery['Hours'], -3)/24;
                            AddSHours(FQuery['Hours']);
                        end
                        else // работа в выходной
                        begin
                            with ThisHours.WorkReg do
                            begin
                                Work_Beg := 8 / 24;
                                Work_End := SimpleRoundTo(8 + FQuery['Hours'], -3) / 24;
                                Break_Beg := Null;
                                Break_End := Null;
                            end;
                            AddVHours(FQuery['Hours']);
                        end;
                end;
                FQuery.Next;
            end;

//        FTableDaySpan.CalcDays;

                      // считать информацию о невыходах по служебке
            FQuery.First;
            FQuery.Locate('The_Type', 6, []);
            while not FQuery.Eof and (FQuery['The_Type'] = 6) do
            begin
                if (FQuery['Date_Beg'] <= End_Date)
                    and (FQuery['Date_Beg'] >= Start_Date) then
                begin
                    i := DaysBetween(Base_Date, FQuery['Date_Beg']) + 1;
                    FTableDaySpan.SetVihod(i, FQuery['Id_Vihod']);
                    // в случае замены выходным считать, что так и надо
                    if FQuery['Id_Vihod'] = 35 then
                        FTableDaySpan.ZeroGraphic(i);
                end;
                FQuery.Next;
            end;

            // считать информацию о командировках
            FQuery.First;
            FQuery.Locate('The_Type', 8, []);
            while not FQuery.Eof and (FQuery['The_Type'] = 8) do
            begin
                Period_Beg := FQuery['Date_Beg'];
                Period_End := FQuery['Date_End'];
                if Period_Beg < Date_Beg-1 then Period_Beg := Date_Beg-1;
                if Period_End > Date_End then Period_End := Date_End;

                day1 := DaysBetween(Base_Date-1, Period_Beg);
                day2 := DaysBetween(Base_Date-1, Period_End);

                for i := day1 to day2 do
                    if FTableDaySpan[i].WorkDay then
                    if WorkModeCenter.Consts_Query['COMAND_WORK_HOURS'] = 1 then
                        FTableDaySpan.SetVihodNoHours(i, WorkModeCenter.Command_Id_Vihod)
                    else FTableDaySpan.SetVihod(i, WorkModeCenter.Command_Id_Vihod);


                FQuery.Next;
            end;

        //        FTableDaySpan.CalcDays;
        end;

        FTableDaySpan.CalcDays;

         // поставить выходной в период, когда человек не работал
        for i := 0 to FTableDaySpan.Count do
            if (FTableDaySpan[i].CurDate < Start_Date) or
                (FTableDaySpan[i].CurDate > End_Date) then
                FTableDaySpan[i].Zero;

        // учесть количество ставок
        if not OnlyGraphic then
            for i := 1 to FTableDaySpan.Count do
                if Id_Moving_Type[i] <>
                    WorkModeCenter.Consts_Query['Apprentice_Moving_Type'] then
                    FTableDaySpan[i].Use_Kol_Stavok(Kol_Stavok[i]);

        FTableDaySpan.CalcTotal;
        FTableDaySpan.CalcCalDays(Start_Date, End_Date);

        FTableDaySpan.SetDefaultVihods;
        CalcVihods;
    except on e: Exception do
    begin
        FStatus := tsError;
        ErrorMessage := e.Message;
    end;
    end
end;

function TMovingTable.ReadFromBase: Boolean;
var
    ind: Integer;
    y, m, d: Word;
    CurDate, Date_Beg: TDate;
    WorkReg: TWorkReg;
    WorkHours: TWorkHours;
    TableHours: TTableHours;
begin
    Date_Beg := FTableDaySpan.Date_Beg;
    y := YearOf(Date_Beg);
    m := MonthOf(Date_Beg);

                    // подготовить запрос
    FQuery.Close;
    if Version = -1 then
        FQuery.SQL.Text := 'SELECT * FROM Table_Read(' +
            IntToStr(Id_Man_Moving) + ',''' + DateToStr(Date_Beg)
            + ''',''' + DateToStr(FTableDaySpan.Date_End) + ''')'
    else
        FQuery.SQL.Text := 'SELECT * FROM Table_Read_By_Version(' +
            IntToStr(Id_Man_Moving) + ',' + IntToStr(Version) + ',''' +
            DateToStr(Date_Beg) + ''',''' + DateToStr(FTableDaySpan.Date_End)
            + ''')';
    FQuery.Open;

    if FQuery.IsEmpty then
    begin
        Result := False;
        FStatus := tsUnknown;
        Exit;
    end
    else
    begin
        Result := True;
        FStatus := tsRead;
    end;

            // считать все из базы
    FQuery.First;
    FHours_Norm := FQuery['Hours_Norm'];
    FDays_Norm := FQuery['Days_Norm'];
    Calc_In_Hours := FQuery['Calc_In_Hours'];
    while not FQuery.Eof do
    begin
        d := FQuery['Tbl_Day'];

        CurDate := EncodeDate(y, m, d);
        ind := DaysBetween(Date_Beg, CurDate) + 1;

                // считать тип выхода
        Span.SetVihod(ind, FQuery['Id_Vihod']);
        with WorkReg do
        begin
            Work_Beg := FQuery['Work_Beg'];
            Work_End := FQuery['Work_End'];
            Break_Beg := FQuery['Break_Beg'];
            Break_End := FQuery['Break_End'];
        end;
                // считать время работы
        WorkHours := TWorkHours.Create(WorkModeCenter.Consts_Query['Default_Night_Beg'],
            WorkModeCenter.Consts_Query['Default_Night_End']);
        WorkHours.WorkReg := WorkReg;
                // считать количество часов
        with TableHours do
        begin
            Hours := TimeToHours(FQuery['Hours'], FQuery['Hours_F']);
            NHours := TimeToHours(FQuery['NHours'], FQuery['NHours_F']);
            PHours := TimeToHours(FQuery['PHours'], FQuery['PHours_F']);
            GHours := TimeToHours(FQuery['GHours'], FQuery['GHours_F']);
            
            if not VarIsNull(FQuery['SHours']) then
                SHours := FQuery['SHours'];
            if not VarIsNull(FQuery['VHours']) then
                VHours := 24 * FQuery['VHours'];
        end;
        Span[ind].ThisHours := WorkHours;
        Span[ind].Hours := TableHours;
                // считать дополнительные флаги
        Span[ind].Add_Flags := FQuery['Add_Flags'];

        FQuery.Next;
    end;
    Span.CalcGraphic;
    Span.CalcTotal;
    FTableDaySpan.CalcCalDays(Start_Date, End_Date);
    CalcVihods;
end;


procedure TMovingTable.Prepare(Id_Man_Moving: Integer; Date1, Date2: TDate);
var
    i, day1, day2: Integer;
    Date_Beg, Date_End: TDate;
begin
    FTableDaySpan.Free;
    FTableDaySpan := TTableDaySpan.Create(Date1, Date2);
    Self.Id_Man_Moving := Id_Man_Moving;
    Year := YearOf(Date1);
    Month := MonthOf(Date1);

    FQuery.Free;
    FQuery := TIBQuery.Create(nil);
    FQuery.Transaction := TableReadTransaction;

        // получить количество ставок
    SetLength(Kol_Stavok, DaysBetween(Date1, Date2) + 2);
    SetLength(Id_Moving_Type, DaysBetween(Date1, Date2) + 2);

    for i := 0 to High(Kol_Stavok) do
        Kol_Stavok[i] := 0;

    FQuery.SQL.Text := 'SELECT * FROM ASUP_TABLE_GET_KOL_STAVOK' +
        '(:Id_Man_Moving, :Period_Beg, :Period_End)';
    FQuery.ParamByName('Id_Man_Moving').AsInteger := Id_Man_Moving;
    FQuery.ParamByName('Period_Beg').AsDate := Date1;
    FQuery.ParamByName('Period_End').AsDate := Date2;
    FQuery.Open;
    while not FQuery.Eof do
    begin
        Date_Beg := FQuery['Date_Beg'];
        Date_End := FQuery['Date_End'];
        if Date_Beg < Date1 - 1 then Date_Beg := Date1 - 1;
        if Date_End > Date2 then Date_End := Date2;
        day1 := DaysBetween(Date1 - 1, Date_Beg);
        day2 := DaysBetween(Date1 - 1, Date_End);
        for i := day1 to day2 do
        begin
            Kol_Stavok[i] := Kol_Stavok[i] + FQuery['Kol_Stavok'];
            Id_Moving_Type[i] := FQuery['Id_Moving_Type'];
        end;
        FQuery.Next;
    end;
    FQuery.Close;

    FStatus := tsUnknown;
end;

destructor TMovingTable.Destroy;
begin
    FTableDaySpan.Free;
    FQuery.Free;
    FVihodsReg.Free;
    inherited Destroy;
end;

procedure TMovingTable.PrepareFromQuery(Query: TDataSet; Date1: TDate = 0; Date2: TDate = 0);
begin
    if Date1 = 0 then
    begin
        Date1 := EncodeDate(Query['Table_YEAR'], Query['Table_MONTH'], 1);
        Date2 := EndOfTheMonth(Date1);

        Year := Query['Table_YEAR'];
        Month := Query['Table_MONTH'];
    end;

    Prepare(Query['Id_Man_Moving'], Date1, Date2);

    if Query.FindField('FIO') <> nil then FIO := Query['FIO'];
    if Query.FindField('Name_Post') <> nil then Post := Query['Name_Post'];
    if Query.FindField('TN') <> nil then TN := Query['TN'];

    Start_Date := Query['Date_Beg'];

    if Query.FindField('Date_End') <> nil then
        End_Date := Query['Date_End']
    else if Query.FindField('Real_Date_End') <> nil then
        End_Date := Query['Real_Date_End'];

    if Query.FindField('Num_Digit') <> nil then
        if VarIsNull(Query['Num_Digit']) then
            Num_Digit := -1
        else
            Num_Digit := Query['Num_Digit'];

    if Query.FindField('Oklad') <> nil then
        if VarIsNull(Query['Oklad']) then
            Oklad := 0
        else
            Oklad := Query['Oklad'];

    if Query.FindField('Version_Num') <> nil then
        Version := Query['Version_Num']
    else
        Version := -1;

    if Query.FindField('Dept_Order') <> nil then
        if VarIsNull(Query['Dept_Order']) then
            Dept_Order := 1
        else
            Dept_Order := Query['Dept_Order']
    else
        Dept_Order := 1;

    if Query.FindField('Shtat_Order') <> nil then
        if not VarIsNull(Query['Shtat_Order']) then
            Shtat_Order := Query['Shtat_Order']
        else
            Shtat_Order := 1
    else
        Shtat_Order := 1;

    if Query.FindField('Name_Department') <> nil then
        if VarIsNull(Query['Name_Department']) then
            Name_Department := ''
        else
            Name_Department := Query['Name_Department']
    else
        Name_Department := '';

    if Query.FindField('Id_PCard') <> nil then
        Id_PCard := Query['Id_PCard'];

    if Query.FindField('Tarif') <> nil then
        Tarif := Query['Tarif']
    else
        Tarif := 0;
end;

procedure TMovingTable.SetNorm(nHours: Double; nDays: Integer);
begin
    FHours_Norm := nHours;
    FDays_Norm := nDays;
    FStatus := tsModified;
end;

end.

