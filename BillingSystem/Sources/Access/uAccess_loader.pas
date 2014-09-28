unit uAccess_loader;

interface
uses AccMGMT, Classes, uCommon_Types, Forms, Windows, uAccess_Unit, Dialogs,
     Variants, Controls;

function ShowAccess(AOwner:TComponent):TbsAccessResult;stdcall;
exports  ShowAccess;

implementation

function ShowAccess(AOwner:TComponent):TbsAccessResult;stdcall;
var
  FormAccess:TfrmAccess;
  Res:TbsAccessResult;
begin
  if NotViewFormAccess then
   begin
    res.ID_User:=-999;
    Res.User_Id_Card:=-999;
    Res.User_Fio:='Безпарольний доступ';
    Res.Name_user:='Безпарольний доступ';
    res.is_admin := True;
    Result:=Res;
    Exit;
   end
  else
   Begin
    FormAccess:=TfrmAccess.Create(AOwner);
    Res.ID_User:=0;

    if FormAccess.ShowModal = mrYes then
     begin
      Res:=FormAccess.Result;
      Res.is_admin := FormAccess.is_admin;
     End;

    FormAccess.Free;
    Result:=Res;
   End;  
end;

end.
