unit LoaderUnit;

interface
uses Windows, AArray, Dialogs;

resourcestring
  msgLoadError         = 'Ошибка при загрузке bpl модуля';
  msgLoadErrorNoExists = 'Файл не найден';
  msgLoadErrorNoProc   = 'Не найдена процедура "Load" в модуле';

type
  TSpravProc = procedure (input, Result : TAArray);

function LoadSprav(const BplName : string; input, res : TAArray) : boolean;

implementation

uses SysUtils;

function LoadSprav(const BplName : string; input, res : TAArray) : boolean;
var
  proc : TSpravProc;
  ModuleHandle : DWORD;
begin
  LoadSprav := False;
  ModuleHandle := GetModuleHandle(PAnsiChar(ExtractFileName(BplName)));
  if ModuleHandle < 32 then
  begin
    if not FileExists(BplName) then
    begin
      ShowMessage(msgLoadErrorNoExists + ' "' + BplName + '"');
      Exit;
    end;
    ModuleHandle := LoadPackage(PAnsiChar(BplName));
    if ModuleHandle = 0 then
    begin
      ShowMessage(msgLoadError + ' "' + BplName + '"');
      Exit;
    end;  
  end;
  proc := GetProcAddress(ModuleHandle, 'Load');
  if not Assigned(proc) then
  begin                      
    ShowMessage(msgLoadErrorNoProc + ' "' + BplName + '"');
    Exit;
  end;
  Result := True;
  proc(input, Res);
end;

end.
