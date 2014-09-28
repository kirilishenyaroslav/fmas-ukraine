unit mo_intf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils;

type
     TMOMainBook=class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
     public
           procedure Run;
           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           destructor Destroy;
     end;

implementation

uses MOMainForm;
{ TMOMainBook }

destructor TMOMainBook.Destroy;
begin
     if Assigned(self.WorkMainForm) then self.WorkMainForm.Free;
     inherited Destroy;
end;

procedure TMOMainBook.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TMOMainBook.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TMOMainBook.Run;
//var OtherInstanse:HWND;
begin
      //OtherInstanse:=Self.GetOtherObjInstance(TTMoMainForm);
      //if (OtherInstanse=0)
      //then begin
                //Создаем MDI форму для показа результатов формирования
                //мемориального ордера "ГОЛОВНА_КНИГА"
                WorkMainForm:=
                TTMoMainForm.Create(    TComponent(self.InParams.Items['AOwner']^),
                           TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                          PInteger(self.InParams.Items['Id_User'])^);
      //end
      //else SetForegroundWindow(OtherInstanse);
end;

initialization
      //Регистрация класса в глобальном реестре
      RegisterAppModule(TMOMainBook,'mo_mainbook');

end.
