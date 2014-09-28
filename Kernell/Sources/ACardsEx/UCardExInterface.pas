unit UCardExInterface;


interface

uses Ibase, Classes, forms, UCardGetConfigure;

procedure GetACardEx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);stdcall;

exports GetACardEx;

implementation

procedure GetACardEx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
var i:Integer;
    f:Boolean;
begin
      f:=False;
      for i:=0 to application.MainForm.MDIChildCount-1 do
      begin
           if application.MainForm.MDIChildren[i] is TfrmConfigureFrm
           then begin
                     f:=true;
                     application.MainForm.MDIChildren[i].BringToFront;

           end;
      end;


      if not f
      then
      with TfrmConfigureFrm.Create(AOwner,DBHandle,Id_user) do
      begin

      end;
end;


end.
