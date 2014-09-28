{ -$Id: uVihodsReg.pas,v 1.1 2005/12/01 08:48:50 oleg Exp $ }

unit uVihodsReg;

interface

uses WorkModeCentral, Controls, TableCentral;

type
    TVihodCount = record
        vihod: TVihod;
        count: Integer;
    end;

    TVihodsReg = class(TObject)
        private
            VCounts: array of TVihodCount;

            function GetVihodCount(vihod: Integer): Integer;
            function GetTotalVihodsCount: Integer;
            function GetCount: Integer;
            function GetCell(ind: Integer): TVihodCount;
        public
            property Count: Integer read GetCount;
            property Cells[ind: Integer]: TVihodCount read GetCell;
            property VihodCount[vihod: Integer]: Integer
                read GetVihodCount; default;
            property TotalVihodsCount: Integer read GetTotalVihodsCount;

            procedure AddVihodCount(vihod: TVihod; count: Integer = 1);
            procedure Clear;
            procedure AddReg(VihodsReg: TVihodsReg);
    end;

implementation

function TVihodsReg.GetCell(ind: Integer): TVihodCount;
begin
    Result := VCounts[ind];
end;

function TVihodsReg.GetCount: Integer;
begin
    Result := Length(VCounts);
end;

procedure TVihodsReg.AddReg(VihodsReg: TVihodsReg);
var
    i: Integer;
begin
    for i:=0 to VihodsReg.Count-1 do
        AddVihodCount(VihodsReg.Cells[i].vihod, VihodsReg.Cells[i].count);
end;

procedure TVihodsReg.Clear;
begin
    SetLength(VCounts, 0);
end;

function TVihodsReg.GetTotalVihodsCount: Integer;
var
    i: Integer;
begin
    Result := 0;
    for i:=0 to High(VCounts) do
        Result := Result + VCounts[i].count;
end;

function TVihodsReg.GetVihodCount(vihod: Integer): Integer;
var
    i: Integer;
begin
    Result := 0;
    for i:=0 to High(VCounts) do
        if VCounts[i].vihod.Id_Vihod = vihod then
            Result := Result + VCounts[i].count;
end;

procedure TVihodsReg.AddVihodCount(vihod: TVihod; count: Integer = 1);
var
    i: Integer;
begin
    if vihod = nil then Exit;

    for i:=0 to High(VCounts) do
        if VCounts[i].vihod = vihod then
        begin
            VCounts[i].count := VCounts[i].count + count;
            Exit;
        end;
    SetLength(VCounts, Length(VCounts)+1);
    VCounts[High(VCounts)].vihod := vihod;
    VCounts[High(VCounts)].count := count;
end;

end.
