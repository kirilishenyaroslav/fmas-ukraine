unit gr_Account_Loader;

interface

uses Classes, IBase, gr_Account_MainForm, ZProc,
     Controls, gr_uCommonLoader, gr_Account_FullForm;

function View_SpisokCount(AParameter:TObject):Variant;stdcall;
 exports View_SpisokCount;

function View_FullSpisokCount(AParameter:TObject):Variant;stdcall;
 exports View_FullSpisokCount;

implementation

function NeedExit(ClassType:TClass):boolean;
begin
 Result:=IsMDIChildFormShow(TFSpisokCount) or (ClassType<>TgrSimpleParam) or IsMDIChildFormShow(TFSpisokCountFull);
end;

function View_SpisokCount(AParameter:TObject):Variant;
var ViewForm: TFSpisokCount;
begin
if NeedExit(AParameter.ClassType) then Exit;
ViewForm  :=  TFSpisokCount.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle);
end;

function View_FullSpisokCount(AParameter:TObject):Variant;
var ViewForm: TFSpisokCountFull;
begin
if NeedExit(AParameter.ClassType) then Exit;
ViewForm  :=  TFSpisokCountFull.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle);
end;

end.

