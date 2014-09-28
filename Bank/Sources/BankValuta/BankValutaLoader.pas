unit BankValutaLoader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,BankValutaMainForm, Un_lo_file_Alex;

function View_BankValuta(Aparametr:TBankSimpleParam):Variant;stdcall;
exports View_BankValuta;

implementation

function View_BankValuta(Aparametr:TBankSimpleParam):Variant;
var ViewForm: TMainForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  {ViewForm := TMainForm.Create(TBankSimpleParam(AParameter).Owner,TBankSimpleParam(AParameter).DB_Handle);
  ViewForm.ShowModal;
  ViewForm.
  //if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.PRes;
  ViewForm.Free;  }

  ViewForm := TMainForm.Create(Aparametr);
  ViewForm.FormStyle:= Aparametr.Formstyle;

  case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
  else
   begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;

  Result:=ViewForm.pres;
end;

end.
