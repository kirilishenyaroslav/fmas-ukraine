unit Current_Ctrl_Loader;

interface

uses Classes, IBase, gr_uCommonLoader, Current_Ctrl_MainForm, Variants, ZTypes, Controls;

function View_grCurrentCtrl(AParameter:TgrCtrlSimpleParam):Variant;stdcall;
 exports View_grCurrentCtrl;

implementation

function View_grCurrentCtrl(AParameter:TgrCtrlSimpleParam):Variant;stdcall;
var Form:TFgrCurrentCtrl;
begin
 Form:=TFgrCurrentCtrl.Create(TgrCtrlSimpleParam(AParameter).Owner);
 if TgrCtrlSimpleParam(AParameter).fs=zcfsDelete then
    result:=Form.DeleteRecord(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).Id)
 else
  begin
   result := Form.PrepareData(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).fs,
                              TgrCtrlSimpleParam(AParameter).Id);
   if Result<>False then
    begin
     Result := Form.ShowModal;
     if Result=mrYes then  Result:=Form.result
     else Result := NULL;
    end
   else Result:=NULL;
  end;
  Form.Destroy;
end;

end.
