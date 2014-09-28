unit Splash_Loader;
interface

uses Classes, Splash_Unit,   Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs;

procedure ShowSplash(AOwner:TComponent);stdcall;
  exports ShowSplash;

implementation

procedure ShowSplash(AOwner:TComponent);stdcall;
var ViewForm:TfrmSplash;
begin
 ViewForm := TfrmSplash.Create(Application);
 ViewForm.Show;
end;

end.
