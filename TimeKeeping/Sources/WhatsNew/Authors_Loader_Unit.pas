unit Authors_Loader_Unit;

interface

uses Classes;

procedure AuthorShow(AOwner: TComponent);stdcall;
exports AuthorShow;

implementation

uses Authors_Main_Unit;

procedure AuthorShow(AOwner: TComponent);
var FormData:TAuthorForm;
begin
 FormData := TAuthorForm.Create(AOwner);
 FormData.ShowModal;
 FormData.Free;
end;

end.
