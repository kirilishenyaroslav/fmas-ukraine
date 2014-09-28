unit TuTypeWork_Loader;

interface
uses SysUtils, Classes,Controls,Variants,iBase,TuTypeWork_Main,TuTypeWork_DM,
TuCommonLoader,TuCommonTypes,Forms,dxBar;
function View_TuSpTypeWork(AParameter:TObject):Variant; stdcall;
 exports View_TuSpTypeWork;
implementation

function View_TuSpTypeWork(AParameter:TObject):Variant;stdcall;
var Form: TFormTypeWork;
begin

  Dm:=TDm.create(TTuSimpleParam(AParameter).Owner);
  DM.DB.Handle:=TTuSimpleParam(AParameter).DB_Handle;
  Form:=TFormTypeWork.create(TTuSimpleParam(AParameter).Owner);
  if  TTuSimpleParam(AParameter).CFStyle=tfsModal then
  begin
    Form.FormStyle:=fsnormal;
    Form.ButtonUpdate.Visible:=ivNever;
    Form.ButtonDelete.Visible:=ivNever;
    Form.ButtonPermis.Visible:=ivNever;
    Form.ButtonInsert.Visible:=ivNever;
    if form.ShowModal=mrYes then
    begin
      Result:=VarArrayCreate([0,3], varVariant);
      Result[0]:=Dm.DSetMain['ID_VIHOD'];
      Result[1]:=Dm.DSetMain['NAME_FULL'];
      Result[2]:=Dm.DSetMain['IS_WORK'];
    end
  end
  else
  begin
    Form.ButtonOk.Visible:=ivNever;
    Form.FormStyle:=fsMDIChild;
    Form.Show;
  end


end;

end.
