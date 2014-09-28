unit uTableCheck;

interface

uses DB, uCommonDB, StdCtrls, uMovingTable, TableCentral, Controls, SysUtils,
    DateUtils, PersonalCommon, ProcessUnit;

procedure CheckTables(LogMemo: TMemo; Year, Month: Integer);
function CompareTable(table1, table2: TMovingTable): String;

implementation

function CompareTable(table1, table2: TMovingTable): String;
var
    i, cnt: Integer;
begin
    Result := '';
    cnt := table1.Span.Count;

    if table2.Span.Count <> cnt then
    begin
        Result := 'різная довжина табелів!';
        Exit;
    end;

    for i:=1 to cnt do
    begin
        if table1[i].Hours.Hours <> table2[i].Hours.Hours then
        begin
            Result := 'різна кількість годин у день ' + IntToStr(i);
            Exit;
        end;

        if table1[i].Vihod <> table2[i].Vihod then
        begin
            Result := 'різні типи виходів у день ' + IntToStr(i);
            Exit;
        end;

        if table1[i].Hours.GHours <> table2[i].Hours.GHours then
        begin
            Result := 'різна кількість годин за графіком у день ' + IntToStr(i);
            Exit;
        end;

        if table1[i].Hours.NHours <> table2[i].Hours.NHours then
        begin
            Result := 'різна кількість нічних годин у день ' + IntToStr(i);
            Exit;
        end;

        if table1[i].Hours.PHours <> table2[i].Hours.PHours then
        begin
            Result := 'різна кількість святкових годин у день ' + IntToStr(i);
            Exit;
        end;

        if table1[i].Hours.SHours <> table2[i].Hours.SHours then
        begin
            Result := 'різна кількість понаднормових годин у день ' + IntToStr(i);
            Exit;
        end;

        if table1[i].Hours.VHours <> table2[i].Hours.VHours then
        begin
            Result := 'різна кількість годин роботи у вихідний день ' + IntToStr(i);
            Exit;
        end;

        if table1[i].Add_Flags <> table2[i].Add_Flags then
        begin
            Result := 'різні додаткові флаги у день ' + IntToStr(i);
            Exit;
        end;
    end;
end;

procedure CheckTables(LogMemo: TMemo; Year, Month: Integer);
var
    table1, table2: TMovingTable;
    Date_Beg, Date_End: Variant;
    people: TDataSet;
    form: TProcessForm;
    err: String;
begin
    form := TProcessForm.Create(nil);
    form.Caption := 'Перевірка табелів, зачекайте...';
    form.Show;

    Date_Beg := EncodeDate(Year, Month, 1);
    Date_End := EncodeDate(Year, Month, DaysInAMonth(Year, Month));

    Curr_DB['Date_Beg'] := Date_Beg;
    Curr_DB['Date_End'] := Date_End;
    people := Curr_DB.
        QueryData('SELECT * FROM Get_Cur_Moving_Period(:Date_Beg,:Date_End)',
            'Date_Beg, Date_End');

    people.Last;
    form.Progress.Max := people.RecNo;

    table1 := TMovingTable.Create;
    table2 := TMovingTable.Create;

    people.First;
    while not people.Eof do
    begin
        table1.PrepareFromQuery(people, Date_Beg, Date_End);
        table2.PrepareFromQuery(people, Date_Beg, Date_End);

        table1.FormTable;
        if not table2.ReadFromBase then
        begin
            if LogMemo <> nil then
                LogMemo.Lines.Add('Т/н ' + IntToStr(people['TN']) +
                    ' - табель не занесений!');
        end
        else
        begin
            err := CompareTable(table1, table2);
            if err <> '' then
                LogMemo.Lines.Add('Т/н ' + IntToStr(people['TN']) + ' - ' + err);
        end;



        if Stop then break;
        form.Step;

        people.Next;
    end;

    form.Close;
    table2.Free;
    table1.Free;
    Curr_DB.RemoveDataset(people);
end;

end.
