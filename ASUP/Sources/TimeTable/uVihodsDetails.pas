unit uVihodsDetails;

interface

const
    AddVihods = [12, 18, 21, 22, 23, 24, 25, 33, 34, 37];

type

    TVihodDayCount = class(TObject)
    private
        FWorked: Double;
        FNotWorked: Double;
        FVihods: array of Integer;
        FCounts: array of Double;
        function GetVihodCount(Id_Vihod: Integer): Double;
        function GetOtherPaidCount: Double;
        function GetOtherNotPaidCount: Double;
    public
        property VihodCount[Id_Vihod: Integer]: Double read GetVihodCount; default;
        property Worked: Double read FWorked;
        property NotWorked: Double read FNotWorked;
        property OtherPaidCount: Double read GetOtherPaidCount;
        property OtherNotPaidCount: Double read GetOtherNotPaidCount;

        procedure Add(Id_Vihod: Integer; Kol_Stavok: Double);
        procedure AddWorked(Kol_Stavok: Double);
        procedure AddNotWorked(Kol_Stavok: Double);
        procedure Clear;

        procedure AddVihodCount(VihodCount: TVihodDayCount);
    end;

    TVihodDetails = array of TVihodDayCount;

implementation

uses WorkModeCentral;

procedure TVihodDayCount.AddVihodCount(VihodCount: TVihodDayCount);
var
    i: Integer;
begin
    FWorked := FWorked + VihodCount.Worked;
    FNotWorked := FNotWorked + VihodCount.NotWorked;

    for i := 0 to High(VihodCount.FVihods) do
        Add(VihodCount.FVihods[i], VihodCount.FCounts[i]);
end;

function TVihodDayCount.GetOtherPaidCount: Double;
var
    vihod: TVihod;
    i: Integer;
begin
    Result := 0;

    for i := 0 to High(FVihods) do
        if (FVihods[i] in AddVihods) or (FVihods[i] > 37) then
        begin
            vihod := AllVihods[FVihods[i]];
            if (vihod <> nil) and (not vihod.Is_Work) and (vihod.Is_Paid) then
                Result := Result + FCounts[i];
        end;
end;

function TVihodDayCount.GetOtherNotPaidCount: Double;
var
    vihod: TVihod;
    i: Integer;
begin
    Result := 0;

    for i := 0 to High(FVihods) do
        if (FVihods[i] in AddVihods) or (FVihods[i] > 37) then
        begin
            vihod := AllVihods[FVihods[i]];
            if (vihod <> nil) and (not vihod.Is_Work) and (not vihod.Is_Paid) then
                Result := Result + FCounts[i];
        end;
end;


procedure TVihodDayCount.AddWorked(Kol_Stavok: Double);
begin
    FWorked := FWorked + Kol_Stavok;
end;

procedure TVihodDayCount.AddNotWorked(Kol_Stavok: Double);
begin
    FNotWorked := FNotWorked + Kol_Stavok;
end;


function TVihodDayCount.GetVihodCount(Id_Vihod: Integer): Double;
var
    i: Integer;
begin
    for i := 0 to High(FVihods) do
        if FVihods[i] = Id_Vihod then
        begin
            Result := FCounts[i];
            Exit;
        end;
    Result := 0;
end;

procedure TVihodDayCount.Add(Id_Vihod: Integer; Kol_Stavok: Double);
var
    i: Integer;
begin
    for i := 0 to High(FVihods) do
        if FVihods[i] = Id_Vihod then
        begin
            FCounts[i] := FCounts[i] + Kol_Stavok;
            Exit;
        end;
    SetLength(FVihods, Length(FVihods) + 1);
    SetLength(FCounts, Length(FCounts) + 1);
    FVihods[High(FVihods)] := Id_Vihod;
    FCounts[High(FCounts)] := Kol_Stavok;
end;

procedure TVihodDayCount.Clear;
begin
    SetLength(FVihods, 0);
    SetLength(FCounts, 0);
end;

end.
