{ -internal}
{-$Id: ExportUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}

unit ExportUnit;
interface
uses IBDatabase, Forms,
    IBQuery, Controls, Variants, Buffer, SysUtils, PersonalCommon;

procedure WriteToExportFile(IdServer: Integer);


implementation

procedure WriteToExportFile(IdServer: Integer);
var
    ServerTablesQuery: TIBQuery;
    LogRecQuery: TIBQuery;
    TableDataQuery: TIBQuery;
    NameTable: string;
    ExprFieldsStr: string;
    ValExprStr: string;
    ExprFields: array[1..5] of string;
    ValExpr: array[1..5] of string;
    x, i: Integer;
    ExprCount: Integer;
    S: string;
begin

    ServerTablesQuery.Create(nil);
    LogRecQuery.Create(nil);
    TableDataQuery.Create(nil);

    ServerTablesQuery.Transaction := PersonalCommon.ReadTransaction;
    LogRecQuery.Transaction := PersonalCommon.ReadTransaction;

    ServerTablesQuery.SQL.Text := 'SELECT J.Name_table,P.Expression_Fields from exch_jn_servers_subject_area S,exch_sp_subject_area SP,' +
        'exch_jn_table_subject J,Pub_Sp_Table P WHERE S.id_server=' + IntToStr(IdServer) +
        ' AND SP.id_subject_area=S.id_suject_area'
        + 'AND J.id_subject_area=SP.id_subject_area and J.name_table=P.Name_table';

    ServerTablesQuery.Open;
    ServerTablesQuery.First;

    while (not ServerTablesQuery.Eof) do
    begin
        NameTable := ServerTablesQuery['Name_Table'];
        LogRecQuery.SQL.Text := 'SELECT L.Id_Log_Rec, L.Id_User,L.Name_Table,L.Sys_TimeStamp,L.Value_Expressions'
            + ' FROM exch_log_rec_servers R,exch_log_rec L WHERE R.id_server=' + IntToStr(IdServer) + ' and'
            + ' R.id_log_rec=l.id_log_rec and l.name_table=:' + NameTable;
        LogRecQuery.Open;
        LogRecQuery.First;
        ExprFieldsStr := ServerTablesQuery['Expression_Fields'];
        ExprCount := 1;


        repeat
            x := Pos(ExprFieldsStr, ';');
            if (x = 0) then
            begin
                ExprFields[ExprCount] := ExprFieldsStr;

            end
            else
            begin
                ExprFields[ExprCount] := Copy(ExprFieldsStr, 0, x);
                ExprFieldsStr := Copy(ExprFieldsStr, x + 1, Length(ExprFieldsStr));
                ExprCount := ExprCount + 1;
            end;

        until (x = 0);
        while (not LogRecQuery.Eof) do
        begin
            ValExprStr := LogRecQuery['Value_Expressions'];
            for i := 1 to ExprCount do
            begin
                ValExpr[i] := Copy(ValExprStr, 1, Pos(ValExprStr, ';') - 1);
                ValExprStr := Copy(ValExprStr, Pos(ValExprStr, ';') + 1, Length(ValExprStr));
            end;
            TableDataQuery.SQL.Text := 'SELECT * FROM ' + NameTable + ' WHERE ';
            for i := 1 to ExprCount do
            begin
                if (i <> ExprCount) then TableDataQuery.SQL.Add(ExprFields[i] + '=' + ValExpr[i] + ' and ')
                else TableDataQuery.SQL.Add(ExprFields[i] + '=' + ValExpr[i]);

            end;


        end;




    end;
end;
end.
