unit cn_Lgots_funcs;

interface
uses
  Windows,
  SysUtils,
  cxGridTableView, Forms, Classes;

function  cn_CheckCrossPeriods(View : TcxGridTableView; beg_d_index: byte; end_d_index: byte;
                               perc_index: byte; sum_index: byte; Percent : boolean):boolean;

implementation

 function  cn_CheckCrossPeriods(View : TcxGridTableView; beg_d_index: byte; end_d_index: byte;
                                perc_index: byte; sum_index: byte; Percent : boolean):boolean;
 var i, k : byte;
 begin
  Result := false;
  if View.DataController.RecordCount = 0 then exit;

  if View.DataController.RecordCount > 1 then
  for i := 0 to View.DataController.RecordCount - 1 do
  for k := 0 to View.DataController.RecordCount - 1 do
   begin
    if i<>k then
    if (View.DataController.Values[k, beg_d_index] >= View.DataController.Values[i, beg_d_index]) and
       (View.DataController.Values[k, beg_d_index] <  View.DataController.Values[i, end_d_index])
     then
     begin
     if Percent then
      if (View.DataController.Values[k, perc_index] <> 0) and (View.DataController.Values[i, perc_index] <> 0)
        then Result := true;

      if not Percent then
      if (View.DataController.Values[k, sum_index] <> 0) and (View.DataController.Values[i, sum_index] <> 0)
        then Result := true;
     end;
   end;
 end;

end.
