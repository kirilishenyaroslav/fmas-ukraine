unit report_intf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils, UZNachResult, Controls,
     pFibDataBase,  pFibDataSet, pFibQuery, Variants;

type
     TZNachReport=class(TFMASAppModule,IFMASModule)
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


constructor TZNachReport.Create(AOwner: TComponent);
begin
     inherited Create(Aowner);
end;

destructor TZNachReport.Destroy;
begin
     if Assigned(self.WorkMainForm)   then self.WorkMainForm.Free;
     inherited Destroy;
end;
{$WARNINGS ON}


procedure TZNachReport.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZNachReport.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZNachReport.Run;
begin
     WorkMainForm:=TfrmZNachResults.Create(TComponent(self.InParams.Items['AOwner']^),
                                       TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                                      PInteger(self.InParams.Items['Id_User'])^);
     WorkMainForm.Show;

end;



initialization
     //Регистрация класса в глобальном реестре
     RegisterAppModule(TZNachReport,'nachreport');
end.
