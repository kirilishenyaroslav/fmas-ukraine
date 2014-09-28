unit ReeDepVo_ULoader;

interface
uses Classes, IBase, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants, ReeDepVo_UFilter;

function ReportDepVo(AOwner:TComponent;AHandle:TISC_DB_HANDLE;System:boolean):variant;stdcall;
exports ReportDepVo;

implementation

uses Math;

function ReportDepVo(AOwner:TComponent;AHandle:TISC_DB_HANDLE;System:boolean):variant;stdcall;
var FilterForm:TfzReeDepVOFilter;
begin
  FilterForm:=TfzReeDepVOFilter.Create(AOwner,AHandle,System);
  FilterForm.ShowModal;
  FilterForm.Free;
end;

end.
