unit uRunOnce;

interface

uses PersonalCommon, uCommonDB, DB, Controls, SysUtils;

procedure RunOnce;

implementation

resourcestring histSQL = 'SELECT * FROM Act_History WHERE Name_Action = ''TableFHoursFix''';
resourcestring CurDateSelectSQL = 'SELECT DISTINCT Tbl_Day, Table_MONTH, Table_YEAR FROM Dt_Table';
resourcestring UpdateDateSQL = 'UPDATE Dt_Table SET Cur_Date = :Cur_Date WHERE ' +
    ' Tbl_Day = :Tbl_Day AND Table_YEAR = :Year AND Table_MONTH = :Month';
resourcestring SelectHoursSQL = 'SELECT DISTINCT Hours FROM Dt_Table';
resourcestring UpdateHoursSQL = 'UPDATE Dt_Table SET Hours_F=:Hours_F WHERE Hours=:Hours';

resourcestring SelectNHoursSQL = 'SELECT DISTINCT NHours FROM Dt_Table';
resourcestring UpdateNHoursSQL = 'UPDATE Dt_Table SET NHours_F=:NHours_F WHERE NHours=:NHours';

resourcestring SelectGHoursSQL = 'SELECT DISTINCT GHours FROM Dt_Table';
resourcestring UpdateGHoursSQL = 'UPDATE Dt_Table SET GHours_F=:GHours_F WHERE GHours=:GHours';

resourcestring SelectPHoursSQL = 'SELECT DISTINCT PHours FROM Dt_Table';
resourcestring UpdatePHoursSQL = 'UPDATE Dt_Table SET PHours_F=:PHours_F WHERE PHours=:PHours';

resourcestring SelectVHoursSQL = 'SELECT DISTINCT VHours FROM Dt_Table';
resourcestring UpdateVHoursSQL = 'UPDATE Dt_Table SET VHours_F=:VHours_F WHERE VHours=:VHours';

procedure TableFHoursFix;
var
    histDs: TDataSet;
    CurDateSelect: TDataSet;
    Cur_Date: Variant;
    TmpDS: TDataSet;
begin
    histDs := Curr_DB.QueryData(histSQL);

    if not histDs.Locate('Info', 'Cur_Date', []) then
    begin
        CurDateSelect := Curr_DB.QueryData(CurDateSelectSQL);
        CurDateSelect.First;
        while not CurDateSelect.Eof do
        begin
            Curr_DB.StoreFields(CurDateSelect, 'Tbl_Day, Table_Year, Table_Month');
            Cur_Date := EncodeDate(Curr_DB['Table_Year'], Curr_DB['Table_Month'], Curr_DB['Tbl_Day']);
            Curr_DB['Cur_Date'] := Cur_Date;
            Curr_DB.ExecQuery(UpdateDateSQL, 'Cur_Date, Tbl_Day, Table_Month, Table_Year');
            CurDateSelect.Next;
        end;
        Curr_DB.RemoveDataset(CurDateSelect);
        Log_Action('TableFHoursFix', 'Cur_Date');
    end;

    if not histDs.Locate('Info', 'Hours_F', []) then
    begin
        TmpDs := Curr_DB.QueryData(SelectHoursSQL);
        TmpDs.First;
        while not TmpDs.Eof do
        begin
            Curr_DB.StoreFields(TmpDs, 'Hours');
            Curr_DB['Hours_F'] := 24 * Curr_DB['Hours'];
            Curr_DB.ExecQuery(UpdateHoursSQL, 'Hours_F, Hours');
            TmpDs.Next;
        end;
        Curr_DB.RemoveDataset(TmpDs);
        Log_Action('TableFHoursFix', 'Hours_F');
    end;

    if not histDs.Locate('Info', 'GHours_F', []) then
    begin
        TmpDs := Curr_DB.QueryData(SelectGHoursSQL);
        TmpDs.First;
        while not TmpDs.Eof do
        begin
            Curr_DB.StoreFields(TmpDs, 'GHours');
            Curr_DB['GHours_F'] := 24 * Curr_DB['GHours'];
            Curr_DB.ExecQuery(UpdateGHoursSQL, 'GHours_F, GHours');
            TmpDs.Next;
        end;
        Curr_DB.RemoveDataset(TmpDs);
        Log_Action('TableFHoursFix', 'GHours_F');
    end;

    if not histDs.Locate('Info', 'NHours_F', []) then
    begin
        TmpDs := Curr_DB.QueryData(SelectNHoursSQL);
        TmpDs.First;
        while not TmpDs.Eof do
        begin
            Curr_DB.StoreFields(TmpDs, 'NHours');
            Curr_DB['NHours_F'] := 24 * Curr_DB['NHours'];
            Curr_DB.ExecQuery(UpdateNHoursSQL, 'NHours_F, NHours');
            TmpDs.Next;
        end;
        Curr_DB.RemoveDataset(TmpDs);
        Log_Action('TableFHoursFix', 'NHours_F');
    end;

    if not histDs.Locate('Info', 'PHours_F', []) then
    begin
        TmpDs := Curr_DB.QueryData(SelectPHoursSQL);
        TmpDs.First;
        while not TmpDs.Eof do
        begin
            Curr_DB.StoreFields(TmpDs, 'PHours');
            Curr_DB['PHours_F'] := 24 * Curr_DB['PHours'];
            Curr_DB.ExecQuery(UpdatePHoursSQL, 'PHours_F, PHours');
            TmpDs.Next;
        end;
        Curr_DB.RemoveDataset(TmpDs);
        Log_Action('TableFHoursFix', 'PHours_F');
    end;

    if not histDs.Locate('Info', 'VHours_F', []) then
    begin
        TmpDs := Curr_DB.QueryData(SelectVHoursSQL);
        TmpDs.First;
        while not TmpDs.Eof do
        begin
            Curr_DB.StoreFields(TmpDs, 'VHours');
            Curr_DB['VHours_F'] := 24 * Curr_DB['VHours'];
            Curr_DB.ExecQuery(UpdateVHoursSQL, 'VHours_F, VHours');
            TmpDs.Next;
        end;
        Curr_DB.RemoveDataset(TmpDs);
        Log_Action('TableFHoursFix', 'VHours_F');
    end;

    Curr_DB.RemoveDataset(histDs);
end;


procedure RunOnce;
begin
    TableFHoursFix;
end;


end.
