unit PeopleModUnit;

interface
uses Classes, IBase, Variants, Controls, SpPeople_MainForm, SpPeople_ModForm, SpPeople_Types, AllPeopleDataModule;

procedure ShowModForm(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; Mode: TEditMode; Id_Man: Integer = -1); stdcall;
exports ShowModForm;

implementation

procedure ShowModForm(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; Mode: TEditMode; Id_Man: Integer = -1);
var
    ViewForm: TfModifyMan;
begin
    ViewForm := TfModifyMan.Create(AOwner, DBHANDLE, GetImageDBHandle(DBHANDLE), Mode, Id_Man);
    ViewForm.ShowModal;
    ViewForm.Free;
end;

end.
