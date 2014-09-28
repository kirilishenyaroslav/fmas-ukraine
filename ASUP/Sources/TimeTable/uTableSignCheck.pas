{*******************************************************************************
* uTableSignCheck                                                              *
*                                                                              *
* Проверка табеля перед подписью (все ли приказы переданы в зарплату)          *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uTableSignCheck;

interface

uses RxMemDs, uTableGroup, uMovingTable, IBase, pFIBDatabase, Classes,
    uTableData, DB, SysUtils, DateUtils;

type
    TTableSignCheck = class(TObject)
    private
        DM: TTableData;

    public
        constructor Create(DM: TTableData);

        function Check(TableGroup: TTableGroup): Boolean;
    end;

implementation

constructor TTableSignCheck.Create(DM: TTableData);
begin
    inherited Create;

    Self.DM := DM;
end;

function TTableSignCheck.Check(TableGroup: TTableGroup): Boolean;
var
    i, Year, Month: Integer;
begin
    DM.OrdersCheck.EmptyTable;

    for i := 0 to TableGroup.Count - 1 do
    begin
        Year := TableGroup[i].Year;
        Month := TableGroup[i].Month;

        DM.MovingCheck.Close;
        DM.MovingCheck.ParamByName('Id_Man_Moving').AsInteger := TableGroup[i].Id_Man_Moving;
        DM.MovingCheck.ParamByName('Month_Beg').AsDate := EncodeDate(Year, Month, 1);
        DM.MovingCheck.ParamByName('Month_End').AsDate :=
            EncodeDate(Year, Month, DaysInAMonth(Year, Month));
        DM.MovingCheck.Open;

        DM.OrdersCheck.Open;
        DM.MovingCheck.First;
        while not DM.MovingCheck.Eof do
        begin
            if not DM.OrdersCheck.Locate('Id_Order', DM.MovingCheck['Id_Order'], [])
                then
            begin
                DM.OrdersCheck.Append;
                DM.OrdersCheck['Id_Order'] := DM.MovingCheck['Id_Order'];
                DM.OrdersCheck['Num_Order'] := DM.MovingCheck['Num_Order'];
                DM.OrdersCheck['Note'] := DM.MovingCheck['Note'];
                DM.OrdersCheck.Post;
            end;
            DM.MovingCheck.Next;
        end;
    end;

    Result := DM.OrdersCheck.IsEmpty;
end;


end.
