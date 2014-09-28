unit uAbitCn_Resources;

interface

uses Dialogs, StdCtrls, Classes, IBase, FIBDataSet, pFIBDataSet, FIBDatabase,
pFIBDatabase, IniFiles;

function SelectLanguage   : integer; stdcall;
function SelectShemaColor : integer; stdcall;
//exports  SelectLanguage;

function uAbitCnMessageDlg(const Caption : string; const Msg : string;const DlgType: TMsgDlgType;
                       const Buttons: TMsgDlgButtons;aIndexLanguage: integer) : word;stdcall;
//exports  agMessageDlg;

implementation

uses Forms,SysUtils,Windows,Variants,registry, uConstants,
     AccMgmt;

{ выбор языка:  0-украинский, 1-русский}

function SelectLanguage: integer;
var
    reg           :TRegistry;
    RegisterValue :integer;
begin
   //вслучае боков по умолчанию будет украинский язык
   RegisterValue:=0;
   //чтение из регистра
   reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\EXCH_AbitCn\Languegies\',false) then
        begin
           RegisterValue:=reg.ReadInteger('Index');
        end;
     finally
         reg.Free;
     end;
     result:=RegisterValue;
end;

{ выбор цветовой схемы:  0-желтая, 1-голубая}

function SelectShemaColor : integer;
var
    reg           :TRegistry;
    RegisterValue :integer;
begin
   //вслучае боков по умолчанию будет желтая схема язык
   RegisterValue:=0;
   //чтение из регистра
   reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\EXCH_AbitCn\ShemaColor\',false) then
        begin
           RegisterValue:=reg.ReadInteger('Color');
        end;
     finally
         reg.Free;
     end;
     result:=RegisterValue;
end;

{Переделанный MessageDlg}

function uAbitCnMessageDlg(const Caption : string; const Msg : string;
                       const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons;
                       aIndexLanguage: integer) : word;
var
 formD : TForm;
 i    : integer;
begin
 if Buttons = [] then begin
  Result := 0;
  exit;
 end;
 formD := CreateMessageDialog(Msg, DlgType, Buttons);
 formD.Caption := Caption;
 for i := 0 to formD.ComponentCount - 1 do if formD.Components[i] is TButton then begin
  if UpperCase(TButton(formD.Components[i]).Caption) = 'OK'     then TButton(formD.Components[i]).Caption := nMsgDlgOk[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = 'CANCEL' then TButton(formD.Components[i]).Caption := nMsgDlgCansel[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&YES'   then TButton(formD.Components[i]).Caption := nMsgDlgYes[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&NO'    then TButton(formD.Components[i]).Caption := nMsgDlgNo[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&ABORT' then TButton(formD.Components[i]).Caption := nMsgDlgAbort[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&RETRY' then TButton(formD.Components[i]).Caption := nMsgDlgRetry[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&IGNORE'then TButton(formD.Components[i]).Caption := nMsgDlgIgnore[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&ALL'   then TButton(formD.Components[i]).Caption := nMsgDlgAll[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&HELP'  then TButton(formD.Components[i]).Caption := nMsgDlgHelp[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = 'N&O TO ALL'  then TButton(formD.Components[i]).Caption := nMsgDlgNoToAll[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = 'YES TO &ALL' then TButton(formD.Components[i]).Caption := nMsgDlgYesToAll[aIndexLanguage];
 end;
 Result := formD.ShowModal;
end;  


end.
