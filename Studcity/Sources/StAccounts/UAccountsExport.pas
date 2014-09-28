unit UAccountsExport;

interface

uses UMainAccounts, Ibase, Classes, Forms;

procedure GetStAccounts(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:String);stdcall;
  exports GetStAccounts;

implementation

procedure GetStAccounts(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:String);
var i:Integer;
    f:boolean;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmAccountMain)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then TfrmAccountMain.Create(AOwner,DBHandle,Id_user,Login,Pswrd);
end;

end.
