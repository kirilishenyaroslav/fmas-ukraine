unit PI_AuthorsLoader;

interface

uses Classes;

procedure AuthorShow(AOwner: TComponent);stdcall;
exports AuthorShow;

implementation

uses uPI_AboutAuthors;

procedure AuthorShow(AOwner: TComponent);
var FormData:TfmAboutAuthors;
begin
 FormData := TfmAboutAuthors.Create(AOwner);
 FormData.ShowModal;
 FormData.Free;
end;

end.
