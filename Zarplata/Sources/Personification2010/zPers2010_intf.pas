unit zPers2010_intf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils, UPers2010Docs, Controls,
     pFibDataBase,  pFibDataSet, pFibQuery, Variants;

type
     TZPersonification2010=class(TFMASAppModule,IFMASModule)
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


constructor TZPersonification2010.Create(AOwner: TComponent);
begin
     inherited Create(Aowner);
end;

destructor TZPersonification2010.Destroy;
begin
     if Assigned(self.WorkMainForm)   then self.WorkMainForm.Free;
     inherited Destroy;
end;
{$WARNINGS ON}


procedure TZPersonification2010.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZPersonification2010.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZPersonification2010.Run;
begin
     WorkMainForm:=TfrmMainPers.Create(TComponent(self.InParams.Items['AOwner']^),
                                       TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                                      PInteger(self.InParams.Items['Id_User'])^);
     WorkMainForm.Show;

end;



initialization
     //Регистрация класса в глобальном реестре
     RegisterAppModule(TZPersonification2010,'ZPersonification2010');
end.
