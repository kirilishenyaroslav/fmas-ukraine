unit LoaderFiltrUrFn;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,FilterformFiltrDogUrFn, LoadDogManedger,RezultFilterDogUrFn;

function View_FiltrDogUrFn(AOwner : TComponent;DBHandle : TISC_DB_HANDLE):Variant;stdcall;
exports View_FiltrDogUrFn;

implementation

function View_FiltrDogUrFn(AOwner : TComponent;DBHandle : TISC_DB_HANDLE):Variant;
var ViewForm: TRezultFilterForm;
begin
  //if ((IsMDIChildFormShow(TFStudentCards)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
  //ViewForm := TFilterForm.Create(TTiSimpleParam(AParameter).Owner,TTiSimpleParam(AParameter).DB_Handle);

  ViewForm := TRezultFilterForm.Create(AOwner,DBHandle);
  ViewForm.FormStyle := fsMDIChild;
  ViewForm.show;
  //if(ViewForm.ShowModal=mrYes)then

end;
end.
