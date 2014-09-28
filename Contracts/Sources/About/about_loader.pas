unit about_loader;

interface

uses Classes, About;

procedure ShowAboutInfo(AOwner:TComponent);stdcall;
  exports ShowAboutInfo;

implementation

procedure ShowAboutInfo(AOwner:TComponent);stdcall;
var ViewForm:TAboutForm;
begin
 ViewForm := TAboutForm.Create(AOwner);
 ViewForm.ShowModal;
 ViewForm.Destroy;
end;

end.
