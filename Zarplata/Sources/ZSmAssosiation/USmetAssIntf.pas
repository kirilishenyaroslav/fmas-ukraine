unit USmetAssIntf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils, Controls,     USmAssMainForm,
     pFibDataBase,  pFibDataSet, pFibQuery, Variants;

type
     TZSmAssModule=class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
     public
           procedure Run;
           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           {$WARNINGS OFF}
           destructor Destroy; override;
           constructor Create(AOwner: TComponent);override;
           {$WARNINGS ON}
     end;


implementation

uses AssociationList;

{ TUPFilter }

{$WARNINGS OFF}


constructor TZSmAssModule.Create(AOwner: TComponent);
begin
     inherited Create(Aowner);
end;

destructor TZSmAssModule.Destroy;
begin
     if Assigned(self.WorkMainForm)   then self.WorkMainForm.Free;
     inherited Destroy;
end;
{$WARNINGS ON}


procedure TZSmAssModule.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZSmAssModule.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZSmAssModule.Run;
var I:Integer;
    ExistFlag:Boolean;
begin
     ExistFlag:=False;
     for i:=0 to Application.MainForm.MDIChildCount-1 do
     begin
          if (Application.MainForm.MDIChildren[i] is TfrmSmAssForm)
          then begin
                    Application.MainForm.MDIChildren[i].BringToFront;
                    ExistFlag:=True;
          end;


     end;

     if not ExistFlag
     then begin
               WorkMainForm:=TfrmSmAssForm.Create(TComponent(self.InParams.Items['AOwner']^),
                                                 TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                                                PInteger(self.InParams.Items['Id_User'])^);
               WorkMainForm.Show;
     end;

end;



initialization
     //Регистрация класса в глобальном реестре
     RegisterAppModule(TZSmAssModule,'ZSmAss');
end.
