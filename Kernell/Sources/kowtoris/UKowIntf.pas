unit UKowIntf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils;

type
     TKowtoris=class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
     public
           procedure Run;
           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           destructor Destroy;
     end;

implementation

uses UKowMainForm;


destructor TKowtoris.Destroy;
begin
     if Assigned(self.WorkMainForm) then self.WorkMainForm.Free;
     inherited Destroy;
end;

procedure TKowtoris.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TKowtoris.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TKowtoris.Run;
var i:Integer;
    f:Boolean;
begin
    f:=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if Application.MainForm.MDIChildren[i] is TfrmKowtoris
         then begin
                   (Application.MainForm.MDIChildren[i] as TForm).BringToFront;
                   f:=not f;
                   break;
         end;
    end;

    if f then
          WorkMainForm:=
          TfrmKowtoris.Create(    TComponent(self.InParams.Items['AOwner']^),
                     TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                    PInteger(self.InParams.Items['Id_User'])^);

end;

initialization
      //Регистрация класса в глобальном реестре
      RegisterAppModule(TKowtoris,'kowtoris');
end.
