unit uCheckHospital;

interface

uses IBQuery, PersonalCommon, StdCtrls, Controls, SysUtils, Variants, ProcessUnit,
    WorkModeCentral, SpCommon;

procedure CheckAllHospitals(LogMemo: TMemo; Date_Beg, Date_End: TDate; Fix: Boolean);
function CheckHospital(Id_Man_Hosp: Integer; Fix: Boolean): String;

implementation

procedure CheckAllHospitals(LogMemo: TMemo; Date_Beg, Date_End: TDate; Fix: Boolean);
var
    AllHospQuery: TIBQuery;
    err: String;
    form: TProcessForm;
begin
    AllHospQuery := TIBQuery.Create(nil);
    AllHospQuery.Transaction := ReadTransaction;
    AllHospQuery.SQL.Text := 'SELECT * FROM Get_Hospitals_Date(:From_Date, :To_Date)';
    with AllHospQuery.Params do
    begin
        ParamByName('From_Date').AsDate := Date_Beg;
        ParamByName('To_Date').AsDate := Date_End;
    end;

    AllHospQuery.Open;
    AllHospQuery.FetchAll;
    AllHospQuery.First;

    form := TProcessForm.Create(nil);
    form.Caption := 'Перевірка листів непрацездатності, зачекайте...';
    form.Show;
    form.Progress.Max := AllHospQuery.RecordCount;

    while not AllHospQuery.Eof do
    begin
        err := CheckHospital(AllHospQuery['Id_Man_Hosp'], Fix);

        if (err <> '') and (LogMemo <> nil) then
        begin
            LogMemo.Lines.Add('т/н ' + IntToStr(AllHospQuery['TN']) +
                ' ' + AllHospQuery['FIO'] + ' лист ' + AllHospQuery['Seria']
                + ' №' + AllHospQuery['Nomer'] + ' з ' +
                DateToStr(AllHospQuery['Date_Beg']) + ' - ' + err);
            LogMemo.Lines.Add('');
        end;

        if Stop then break;
            form.Step;

        AllHospQuery.Next;
    end;
    AllHospQuery.Free;
    form.Close;
end;

function CheckHospital(Id_Man_Hosp: Integer; Fix: Boolean): String;
var
    HospInfo: TIBQuery;
    WorkQuery: TIBQuery;
    Norm_Shift, Norm_Default_Shift: Integer;
begin
    HospInfo := TIBQuery.Create(nil);
    HospInfo.Transaction := ReadTransaction;
    HospInfo.SQL.Text := 'SELECT * FROM GET_HOSPITAL_INFO(' + IntToStr(Id_Man_Hosp) + ')';
    HospInfo.Open;

    WorkQuery := TIBQuery.Create(nil);
    WorkQuery.Transaction := WriteTransaction;

    Result := '';

    WorkModeCenter.Id_Work_Mode := HospInfo['Default_Mode'];
    WorkModeCenter.Shift := HospInfo['Default_Shift'];
    Norm_Default_Shift := WorkModeCenter.NormalizedShift;

    if VarIsNull(HospInfo['Id_Work_Mode']) then
        Result := 'Не заповнений режим праці'
    else
    if VarIsNull(HospInfo['Shift']) then
        Result := 'Не заповнений зсув режиму праці'
    else
    begin
        WorkModeCenter.Id_Work_Mode := HospInfo['Id_Work_Mode'];
        WorkModeCenter.Shift := HospInfo['Shift'];
        Norm_Shift := WorkModeCenter.NormalizedShift;

        if ( HospInfo['Id_Work_Mode'] <> HospInfo['Default_Mode'] )
                or ( Norm_Shift <> Norm_Default_Shift ) then
            Result := 'Режим праці на листі непрацездатності не співпадає з режимом праці згідно наказів на прийом, перевод та зміну графіку'
        else
            if HospInfo['Shift'] <> Norm_Shift then
                Result := 'Попередження: зсув ненормалізований!';
    end;

    if Fix and ( Result <> '' ) then
    begin
        WorkQuery.SQL.Text := 'UPDATE Man_Hospital SET Id_Work_Mode = ' +
            IntToStr(HospInfo['Default_Mode']) + ', Shift = ' +
            IntToStr(Norm_Default_Shift) + ' WHERE Id_Man_Hosp='+
            IntToStr(Id_Man_Hosp);
        ExecQuery(WorkQuery);
    end;

    HospInfo.Free;
    WorkQuery.Free;
end;

end.
