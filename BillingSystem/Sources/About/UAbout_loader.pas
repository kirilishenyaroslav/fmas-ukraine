unit uAbout_loader;

interface

uses Classes, uAbout;

procedure ShowAboutInfo(AOwner:TComponent);stdcall;
  exports ShowAboutInfo;

implementation

procedure ShowAboutInfo(AOwner:TComponent);stdcall;
var
  ViewForm:TfrmAboutForm;
begin
  ViewForm := TfrmAboutForm.Create(AOwner);
  ViewForm.ShowModal;
  ViewForm.Destroy;
end;

end.
