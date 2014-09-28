unit zPersModule8_intf;
//
interface
//
//uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
//     Dialogs, SysUtils, Controls, UmainForm8,
//     pFibDataBase,  pFibDataSet, pFibQuery, Variants;
//
//type
//     TZPersModule8=class(TFMASAppModule,IFMASModule)
//     private
//           WorkMainForm:TForm;
//     public
//           procedure Run;
//           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
//           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
//           {$WARNINGS OFF}
//           destructor Destroy; override;
//           constructor Create(AOwner: TComponent);override;
//           {$WARNINGS ON}
//     end;
//
implementation
//
//uses AssociationList;
//
//{ TUPFilter }
//
//{$WARNINGS OFF}
//
//
//constructor TZPersModule8.Create(AOwner: TComponent);
//begin
//     inherited Create(Aowner);
//end;
//
//destructor TZPersModule8.Destroy;
//begin
//     if Assigned(self.WorkMainForm)   then self.WorkMainForm.Free;
//     inherited Destroy;
//end;
//{$WARNINGS ON}
//
//procedure TZPersModule8.OnGridStylesChange(var Msg: TMessage);
//begin
//     //Для будущей реализации
//end;
//
//procedure TZPersModule8.OnLanguageChange(var Msg: TMessage);
//begin
//     //Для будущей реализации
//end;
//
//procedure TZPersModule8.Run;
//var I:Integer;
//    ExistFlag:Boolean;
//begin
//   {  ExistFlag:=False;
//     for i:=0 to Application.MainForm.MDIChildCount-1 do
//     begin
//          if (Application.MainForm.MDIChildren[i] is TfrmZPersModule8)
//          then begin
//
//                    if  TfrmZPersModule8(Application.MainForm.MDIChildren[i]).getKodSetup=PInteger(self.InParams.Items['KodSetup'])^
//                    then begin
//                              Application.MainForm.MDIChildren[i].BringToFront;
//                              ExistFlag:=True;
//                    end;
//
//          end;
//
//
//     end;
//
//     if not ExistFlag
//     then begin
//               WorkMainForm:=TfrmZPersModule8.Create(TComponent(self.InParams.Items['AOwner']^),
//                                                 TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
//                                                                PInteger(self.InParams.Items['Id_User'])^,
//                                                                PInteger(self.InParams.Items['KodSetup'])^,
//                                                                PInteger(self.InParams.Items['IdReport'])^);
//               WorkMainForm.Show;
//     end;
//     }
//end;
//
//
//
//initialization
//     //Регистрация класса в глобальном реестре
//     RegisterAppModule(TZPersModule8,'ZPersModule8');

end.


