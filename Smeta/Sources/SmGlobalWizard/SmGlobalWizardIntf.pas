unit SmGlobalWizardIntf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils, SmGlobalWizardForm, Controls,
     pFibDataBase,  pFibDataSet, pFibQuery;

type
     TBUGlobalWizard=class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
     public
           Count:Integer;
           procedure Run;
           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           {$WARNINGS OFF}
           destructor Destroy; override;
           {$WARNINGS ON}
     end;


implementation

{ TUPFilter }

{$WARNINGS OFF}


destructor TBUGlobalWizard.Destroy;
begin
     if Assigned(self.WorkMainForm)   then self.WorkMainForm.Free;
     self.WorkMainForm:=nil;
     inherited Destroy;
end;
{$WARNINGS ON}

procedure TBUGlobalWizard.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TBUGlobalWizard.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TBUGlobalWizard.Run;
begin
     if not Assigned(WorkMainForm)
     then begin
               WorkMainForm:=TfrmSmGlobalWizard.Create(TComponent(self.InParams.Items['AOwner']^),
                                                       TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                                       PInteger(self.InParams.Items['Id_User'])^,
                                                       PInteger(self.InParams.Items['FirstOnce'])^);
     end;
end;

initialization
     //Регистрация класса в глобальном реестре
     RegisterAppModule(TBUGlobalWizard,'SmGlobalWizard');
end.
