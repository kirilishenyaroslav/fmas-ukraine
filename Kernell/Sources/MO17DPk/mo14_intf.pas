unit mo14_intf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils;

type
     TMO14MainBook=class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
     public
           procedure Run;
           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           destructor Destroy;
     end;

implementation

uses MO14MainForm;
{ TMOMainBook }

destructor TMO14MainBook.Destroy;
begin
     if Assigned(self.WorkMainForm) then self.WorkMainForm.Free;
     inherited Destroy;
end;

procedure TMO14MainBook.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TMO14MainBook.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TMO14MainBook.Run;
begin
    //Создаем MDI форму для показа результатов формирования
    //мемориального ордера "ГОЛОВНА_КНИГА"
    WorkMainForm:=
    TTMo14MainForm.Create(    TComponent(self.InParams.Items['AOwner']^),
               TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                              PInteger(self.InParams.Items['Id_User'])^);
end;

initialization
      //Регистрация класса в глобальном реестре
      RegisterAppModule(TMO14MainBook,'mo_14form');
end.
