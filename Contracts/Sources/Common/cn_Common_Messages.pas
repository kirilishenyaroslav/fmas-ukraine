unit cn_Common_Messages;

interface

uses Classes, SysUtils,Dialogs,Graphics,Forms,StdCtrls,cnConsts_Messages,
      cn_Common_Funcs, ShellApi;


function cnShowMessage(Title:String;Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons):Integer;
function cnShowMessageBuffer(Title:String;Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons):Integer;
implementation



function cnShowMessage(Title:String;Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons):Integer;
var ViewMessageForm:TForm;
    i:integer;
    PLanguageIndex:Byte;

begin
PLanguageIndex:=cnLanguageIndex;
if Pos(#13,Msg)=0 then Msg:=#13+Msg;
ViewMessageForm:=CreateMessageDialog(Msg,DlgType,Buttons);
with ViewMessageForm do
 begin
 for i:=0 to ComponentCount-1 do
  if (Components[i].ClassType=TButton) then
   begin
    if UpperCase((Components[i] as TButton).Caption)='OK' then
       (Components[i] as TButton).Caption := OkBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption)='CANCEL' then
       (Components[i] as TButton).Caption := CancelBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption)='&YES' then
       (Components[i] as TButton).Caption := YesBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption)='&NO' then
       (Components[i] as TButton).Caption := NoBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption)='&ABORT' then
       (Components[i] as TButton).Caption := AbortBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption)='&RETRY' then
       (Components[i] as TButton).Caption := RetryBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption)='&IGNORE' then
       (Components[i] as TButton).Caption := IgnoreBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption) = '&ALL' then
       (Components[i] as TButton).Caption := AllBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption) = '&HELP' then
       (Components[i] as TButton).Caption := HelpBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption) = 'N&O TO ALL' then
       (Components[i] as TButton).Caption := NoToAllBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption) = 'YES TO &ALL' then
       (Components[i] as TButton).Caption := YesToAllBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption) = 'NOW' then
       (Components[i] as TButton).Caption := NowBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption) = 'NEVER' then
       (Components[i] as TButton).Caption := NeverBtnCaption[PLanguageIndex];
   end;
 Caption:=Title;
 i:=ShowModal;
 Free;
end;
 cnShowMessage:=i;
end;

function cnShowMessageBuffer(Title:String;Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons):Integer;
var ViewMessageForm:TForm;
    i:integer;
    PLanguageIndex:Byte;

begin
PLanguageIndex:=cnLanguageIndex;
if Pos(#13,Msg)=0 then Msg:=#13+Msg;
ViewMessageForm:=CreateMessageDialog(Msg,DlgType,Buttons);
with ViewMessageForm do
 begin
 for i:=0 to ComponentCount-1 do
  if (Components[i].ClassType=TButton) then
   begin
    if UpperCase((Components[i] as TButton).Caption)='CANCEL' then
       (Components[i] as TButton).Caption := CancelBtnCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption)='&YES' then
       (Components[i] as TButton).Caption := YesFromBufferCaption[PLanguageIndex];
    if UpperCase((Components[i] as TButton).Caption)='&NO' then
       (Components[i] as TButton).Caption := NoFromBufferCaption[PLanguageIndex];
   end;
 Caption:=Title;
 i:=ShowModal;
 Free;
end;
 cnShowMessageBuffer:=i;
end;

end.
