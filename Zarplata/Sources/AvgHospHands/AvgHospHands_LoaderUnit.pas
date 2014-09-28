unit AvgHospHands_LoaderUnit;

interface

uses ZTypes, AvgHospHands_MainForm;

function View_AvgSumHands(Parameter:TZAvgSumParameter):Variant;stdcall;
 exports View_AvgSumHands;

implementation

function View_AvgSumHands(Parameter:TZAvgSumParameter):Variant;
var ViewForm:TFAvgHospHands;
begin
 ViewForm:=TFAvgHospHands.Create(Parameter);
 if ViewForm.IsOk then ViewForm.ShowModal;
 ViewForm.Free;
end;

end.
