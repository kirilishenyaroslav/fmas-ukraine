unit cn_common_sql_monitor;

interface
uses FIBSQLMonitor, cn_Common_DM, QStdCtrls;

procedure start;
procedure Save_result;
procedure stop;

implementation
var
 result_text : String;
 DM : TDM_Common;

procedure start;
Begin
  result_text := '';

  DM := TDM_Common.Create(nil);

  DM.FIBSQLMonitor1.OnSQL := DM.FIBSQLMonitor1SQL;
  DM.FIBSQLMonitor1.Active := True;
End;

procedure save_result;
var
  result_text : String;
begin
  Result_text := DM.result_text;

  DM.FIBSQLMonitor1.Active := False;

  DM.Free;

  //Result := result_text;
End;

procedure stop;
begin
  DM.FIBSQLMonitor1.Active := False;

  DM.Free;
End;

end.
