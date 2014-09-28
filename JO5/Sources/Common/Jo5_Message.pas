unit Jo5_Message;

interface

uses Classes, SysUtils,Dialogs,Graphics,Forms,StdCtrls, Controls, Jo5_Proc;

function Jo5ShowMessage(Title:String;Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons):Integer;

implementation

const OkBtnCaption       :array [1..2] of string = ('Гаразд','Хорошо');
const CancelBtnCaption   :array [1..2] of string = ('Відмінити','Отменить');
const YesBtnCaption      :array [1..2] of string = ('Так','Да');
const NoBtnCaption       :array [1..2] of string = ('Ні','Нет');
const AbortBtnCaption    :array [1..2] of string = ('Прервати','Прервать');
const RetryBtnCaption    :array [1..2] of string = ('Повторити','Повторить');
const IgnoreBtnCaption   :array [1..2] of string = ('Продовжити','Продолжить');
const AllBtnCaption      :array [1..2] of string = ('Для усіх','Для всех');
const HelpBtnCaption     :array [1..2] of string = ('Допомога','Помощь');
const NoToAllBtnCaption  :array [1..2] of string = ('Ні для усіх','Нет для всех');
const YesToAllBtnCaption :array [1..2] of string = ('Так для усіх','Да для всех');

function Jo5ShowMessage(Title:String;Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons):Integer;
var ViewMessageForm:TForm;
    i:integer;
    CurrentIndexLanguage:Byte;
begin
Result:=mrNone;
CurrentIndexLanguage := IndexLanguage;
if Pos(#13,Msg)=0 then Msg:=#13+Msg;
ViewMessageForm:=CreateMessageDialog(Msg,DlgType,Buttons);
with ViewMessageForm do
 begin
 for i:=0 to ComponentCount-1 do
  if (Components[i].ClassType=TButton) then
   begin
    if UpperCase((Components[i] as TButton).Caption)='OK' then
       (Components[i] as TButton).Caption := OkBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='CANCEL' then
       (Components[i] as TButton).Caption := CancelBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&YES' then
       (Components[i] as TButton).Caption := YesBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&NO' then
       (Components[i] as TButton).Caption := NoBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&ABORT' then
       (Components[i] as TButton).Caption := AbortBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&RETRY' then
       (Components[i] as TButton).Caption := RetryBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&IGNORE' then
       (Components[i] as TButton).Caption := IgnoreBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption) = '&ALL' then
       (Components[i] as TButton).Caption := AllBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption) = '&HELP' then
       (Components[i] as TButton).Caption := HelpBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption) = 'N&O TO ALL' then
       (Components[i] as TButton).Caption := NoToAllBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption) = 'YES TO &ALL' then
       (Components[i] as TButton).Caption := YesToAllBtnCaption[CurrentIndexLanguage];
   end;
 Caption:=Title;
 Result:=ShowModal;
 Free;
end;
end;

end.
 