unit ReeDepVo_ULoader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants, ReeDepVo_UFilter;

function ReportDepVo(AOwner:TComponent;AHandle:TISC_DB_HANDLE):variant;stdcall;
exports ReportDepVo;

implementation

uses Math;

function ReportDepVo(AOwner:TComponent;AHandle:TISC_DB_HANDLE):variant;stdcall;
var FilterForm:TfzReeDepVOFilter;
begin
  FilterForm:=TfzReeDepVOFilter.Create(AOwner,AHandle);
  FilterForm.ShowModal;
  FilterForm.Free;
end;

end.
