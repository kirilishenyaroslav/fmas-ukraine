unit zPersModule4_intf;

interface
uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils, Controls, U4mainForm,
     pFibDataBase,  pFibDataSet, pFibQuery, Variants;
type
     TZPersModule4=class(TFMASAppModule,IFMASModule)
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


constructor TZPersModule4.Create(AOwner: TComponent);
begin
     inherited Create(Aowner);
end;

destructor TZPersModule4.Destroy;
begin
     if Assigned(self.WorkMainForm)   then self.WorkMainForm.Free;
     inherited Destroy;
end;
{$WARNINGS ON}


procedure TZPersModule4.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZPersModule4.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZPersModule4.Run;
var I:Integer;
    ExistFlag:Boolean;
begin
     ExistFlag:=False;
     for i:=0 to Application.MainForm.MDIChildCount-1 do
     begin
          if (Application.MainForm.MDIChildren[i] is TfrmZPersModule4)
          then begin

                    if  TfrmZPersModule4(Application.MainForm.MDIChildren[i]).getKodSetup=PInteger(self.InParams.Items['KodSetup'])^
                    then begin
                              Application.MainForm.MDIChildren[i].BringToFront;
                              ExistFlag:=True;
                    end;

          end;


     end;

     if not ExistFlag
     then begin
               WorkMainForm:=TfrmZPersModule4.Create(TComponent(self.InParams.Items['AOwner']^),
                                                 TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                                                PInteger(self.InParams.Items['Id_User'])^,
                                                                PInteger(self.InParams.Items['KodSetup'])^,
                                                                PInteger(self.InParams.Items['IdReport'])^,
                                                                null);
               WorkMainForm.Show;


     end;

end;



initialization
     //Регистрация класса в глобальном реестре
     RegisterAppModule(TZPersModule4,'ZPersModule4');
end.

