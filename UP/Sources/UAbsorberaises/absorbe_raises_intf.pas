unit absorbe_raises_intf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils, MainForm, Controls,
     pFibDataBase,  pFibDataSet;

type
     TUPAbRaises=class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
     public
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

destructor TUPAbRaises.Destroy;
begin
     if Assigned(self.WorkMainForm)   then self.WorkMainForm.Free;
     inherited Destroy;
end;
{$WARNINGS ON}

procedure TUPAbRaises.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TUPAbRaises.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TUPAbRaises.Run;
begin
end;

initialization
     //Регистрация класса в глобальном реестре
     RegisterAppModule(TUPAbRaises,'UpAbsorbeRaises');
end.
