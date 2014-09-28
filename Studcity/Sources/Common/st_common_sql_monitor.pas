unit st_common_sql_monitor;

interface
uses FIBSQLMonitor, st_Common_DM, QStdCtrls;

procedure start;
function  get_result : String;

implementation
var
 result_text : String;
 DM : TDM_st_Common;

procedure start;
Begin
  result_text := '';

  DM := TDM_st_Common.Create(nil);

  DM.FIBSQLMonitor1.OnSQL := DM.FIBSQLMonitor1SQL;
  DM.FIBSQLMonitor1.Active := True;
End;

function get_result : String;
var
  result_text : String;
begin
  Result_text := DM.result_text;

  DM.FIBSQLMonitor1.Active := False;

  DM.Free;

  Result := result_text;
End;

end.
 