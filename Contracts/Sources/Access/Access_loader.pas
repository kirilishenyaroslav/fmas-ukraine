unit Access_loader;

interface
uses AccMGMT,
     Classes,
     cn_Common_Types,
     Forms, Windows,
     Access_Unit, Dialogs,Variants, Controls;

function ShowAccess(AOwner:TComponent):TcnAccessResult;stdcall;
exports  ShowAccess;

implementation

function ShowAccess(AOwner:TComponent):TcnAccessResult;stdcall;
var FormAccess:TfrmAccess;
    Res:TcnAccessResult;
//    FormResult:TModalResult;
begin
 if NotViewFormAccess then
  begin
   res.ID_User:=-999;
   Res.Name_user:='Безпарольний доступ';
   Res.User_Id_Card:=-999;
   Res.User_Fio:='Безпарольний доступ';
   Result:=Res;
   Exit;
  end;
 FormAccess:=TfrmAccess.Create(AOwner);
 Res.ID_User:=0;
 if FormAccess.ShowModal=mrYes then
    Res:=FormAccess.Result;
 FormAccess.Free;
 Result:=Res;
end;

end.
