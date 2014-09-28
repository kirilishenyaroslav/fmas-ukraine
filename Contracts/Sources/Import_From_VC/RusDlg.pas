unit RusDlg;

interface
implementation

uses Classes, Forms, Consts, Dialogs; //, RtpCtrls;

resourcestring
    SMsgDlgRusWarning = 'Предупреждение';
    SMsgDlgRusError = 'Ошибка';
    SMsgDlgRusInformation = 'Информация';
    SMsgDlgRusConfirm = 'Подтверждение';
    SMsgDlgRusYes = '&Да';
    SMsgDlgRusNo = '&Нет';
    SMsgDlgRusOK = 'Ясно';
    SMsgDlgRusCancel = 'Отмена';
    SMsgDlgRusHelp = '&Помощь';
    SMsgDlgRusHelpNone = 'Помощь недоступна';
    SMsgDlgRusHelpHelp = 'Помощь';
    SMsgDlgRusAbort = '&Прервать';
    SMsgDlgRusRetry = 'По&вторить';
    SMsgDlgRusIgnore = '&Игнорировать';
    SMsgDlgRusAll = '&Все';
    SMsgDlgRusNoToAll = 'H&ет для всех';
    SMsgDlgRusYesToAll = 'Д&а для всех';

const
    Captions: array[TMsgDlgType] of Pointer = (@SMsgDlgRusWarning, 
    @SMsgDlgRusError,
    @SMsgDlgRusInformation, @SMsgDlgRusConfirm, nil);

    ButtonCaptions: array[TMsgDlgBtn] of Pointer = (
    @SMsgDlgRusYes, @SMsgDlgRusNo, @SMsgDlgRusOK, @SMsgDlgRusCancel, 
    @SMsgDlgRusAbort,
    @SMsgDlgRusRetry, @SMsgDlgRusIgnore, @SMsgDlgRusAll, @SMsgDlgRusNoToAll, 
    @SMsgDlgRusYesToAll,
    @SMsgDlgRusHelp);

procedure _ChangeCaptions(List: PPointerList;Last: Pointer);
var  i, Max: Integer;
       IsFind: Boolean;
begin
    Max := (Integer(Last)-Integer(List)) div SizeOf(Pointer);
    IsFind := False;
    for i := 0 to Max - 2 do
    if (List[i] = @SMsgDlgWarning) and (List[i+2] = @SMsgDlgInformation) then 
      begin
       IsFind := True;
       break;
      end;
    if IsFind then Move(Captions, List[i], SizeOf(Captions));
    IsFind := False;
    for i := i to Max - 2 do
      if (List[i] = @SMsgDlgYes) and (List[i+2] = @SMsgDlgOK) then 
        begin
          IsFind := True;
          break;
        end;
    if IsFind then Move(ButtonCaptions, List[i], SizeOf(ButtonCaptions));
end;

initialization
_ChangeCaptions(@DebugHook, @Application);
end.
 