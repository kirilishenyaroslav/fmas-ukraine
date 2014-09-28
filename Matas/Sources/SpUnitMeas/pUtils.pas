unit pUtils;

interface
uses Windows, Controls, Dialogs, ib_externals;

type
    TResultArray = array of variant;
    TSpravOptions = packed record
     canAdd     : boolean;
     canEdit    : boolean;
     canDelete  : boolean;
     canSelect  : boolean;
     canSelect2 : boolean;
     HideButtons : boolean;
     isModal    : boolean;
 end;


const
 DeleteQuestion = 'Ви дійсно бажаєте видалити обраний запис?';
 WarningCaption = 'Увага';

procedure InitializeCommonVars(dbHandle : PVOID);
function  agMessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
procedure agShowMessage(const Msg : string);


function GetMonth(const from_date, to_date : TDate) : string;

function isInteger(const s : string) : boolean;
function isFloat(const s : string) : boolean;
function BoolToInt(const b : boolean) : shortint;
function CurrToStrFmt(const cur : currency; const digits : integer = 2) : string;

procedure ShowMessage(const Msg : string);
function MessageDlgU(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;

procedure ChangeKeyboardLayout;

var
 AutoChangeKeyboardLayout : boolean = true;
 KeyboardLayout : string = '00000422';//Украинский
 GlobalDBHandle : PVOID;
//                         '00000409' - english
implementation
uses SysUtils, DateUtils, Forms, StdCtrls;


function agMessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
var
 form : TForm;
 i    : integer;
begin
 if Buttons = [] then begin
  Result := 0;
  exit;
 end;
 form := CreateMessageDialog(Msg, DlgType, Buttons);
 form.Caption := Caption;
 for i := 0 to form.ComponentCount - 1 do if form.Components[i] is TButton then begin
  if UpperCase(TButton(form.Components[i]).Caption) = 'OK' then TButton(form.Components[i]).Caption := 'Прийняти';
  if UpperCase(TButton(form.Components[i]).Caption) = 'CANCEL' then TButton(form.Components[i]).Caption := 'Відмінити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&YES' then TButton(form.Components[i]).Caption := 'Да';
  if UpperCase(TButton(form.Components[i]).Caption) = '&NO' then TButton(form.Components[i]).Caption := 'Ні';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ABORT' then TButton(form.Components[i]).Caption := 'Відмінити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&RETRY' then TButton(form.Components[i]).Caption := 'Повторити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&IGNORE' then TButton(form.Components[i]).Caption := 'Ігнорувати';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ALL' then TButton(form.Components[i]).Caption := 'Все';
  if UpperCase(TButton(form.Components[i]).Caption) = '&HELP' then TButton(form.Components[i]).Caption := 'Допомога';
  if UpperCase(TButton(form.Components[i]).Caption) = 'N&O TO ALL' then TButton(form.Components[i]).Caption := 'Ні для всіх';
  if UpperCase(TButton(form.Components[i]).Caption) = 'YES TO &ALL' then TButton(form.Components[i]).Caption := 'Да для всіх';
 end;
 Result := form.ShowModal;
end;

procedure agShowMessage(const Msg : string);
begin
 agMessageDlg('Увага', Msg, mtWarning, [mbOk]);
end;


procedure InitializeCommonVars(dbHandle : PVOID);
begin
 ChangeKeyboardLayout;
 ShortDateFormat  := 'dd.mm.yyyy';
 LongDateFormat   := 'dd.mm.yyyy';
 DecimalSeparator := ',';
 GlobalDBHandle := dbHandle;
end;

function GetMonth(const from_date, to_date : TDate) : string;
var
 fy, fm, ty, tm, d1, d2 : word;
begin
 Result := '';
 DecodeDate(from_date, fy, fm, d1);
 DecodeDate(to_date, ty, tm, d2);
 if (DateToStr(EndOfAMonth(fy, fm)) = DateToStr(to_date)) and (DateToStr(StartOfAMonth(ty, tm)) = DateToStr(from_date)) then begin
  case tm of
   1 : Result := 'январь';
   2 : Result := 'февраль';
   3 : Result := 'март';
   4 : Result := 'апрель';
   5 : Result := 'май';
   6 : Result := 'июнь';
   7 : Result := 'июль';
   8 : Result := 'август';
   9 : Result := 'сентябрь';
   10 : Result := 'октябрь';
   11 : Result := 'ноябрь';
   12 : Result := 'декабрь';
  end;
 end;
end;

procedure CheckInteger(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13]) then Key := #0;
end;

procedure CheckFloat(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13, DecimalSeparator]) then Key := #0;
end;

function isInteger(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  CheckInteger(k);
  if k = #0 then exit;
 end;
 Result := true;
end;

function isFloat(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  CheckFloat(k);
  if k = #0 then exit;
 end;
 i := pos(DecimalSeparator, s);
 if i <> 0 then if Copy(s, i + 1, Length(s) - i) = '' then exit;
 if pos(DecimalSeparator, Copy(s, i + 1, Length(s) - i)) <> 0 then exit;
 Result := true;
end;

function BoolToInt(const b : boolean) : shortint;
begin
 if b then Result := 1 else Result := 0;
end;

function CurrToStrFmt(const cur : currency; const digits : integer = 2) : string;
begin
 Result := CurrToStrF(cur, ffFixed, digits);
end;

function MessageDlgU(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
var
 form : TForm;
 i    : integer;
begin
 if Buttons = [] then begin
  Result := 0;
  exit;
 end;
 form := CreateMessageDialog(Msg, DlgType, Buttons);
 form.Caption := Caption;
 for i := 0 to form.ComponentCount - 1 do if form.Components[i] is TButton then begin
  if UpperCase(TButton(form.Components[i]).Caption) = 'OK' then TButton(form.Components[i]).Caption := 'Прийняти';
  if UpperCase(TButton(form.Components[i]).Caption) = 'CANCEL' then TButton(form.Components[i]).Caption := 'Відмінити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&YES' then TButton(form.Components[i]).Caption := 'Так';
  if UpperCase(TButton(form.Components[i]).Caption) = '&NO' then TButton(form.Components[i]).Caption := 'Ні';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ABORT' then TButton(form.Components[i]).Caption := 'Відмінити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&RETRY' then TButton(form.Components[i]).Caption := 'Повторити';
  if UpperCase(TButton(form.Components[i]).Caption) = '&IGNORE' then TButton(form.Components[i]).Caption := 'Ігнорувати';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ALL' then TButton(form.Components[i]).Caption := 'Все';
  if UpperCase(TButton(form.Components[i]).Caption) = '&HELP' then TButton(form.Components[i]).Caption := 'Допомога';
  if UpperCase(TButton(form.Components[i]).Caption) = 'N&O TO ALL' then TButton(form.Components[i]).Caption := 'Ні для всіх';
  if UpperCase(TButton(form.Components[i]).Caption) = 'YES TO &ALL' then TButton(form.Components[i]).Caption := 'Да для всіх';
 end;
 Result := form.ShowModal;
end;

procedure ShowMessage(const Msg : string);
begin
 MessageDlgU(WarningCaption, Msg, mtWarning, [mbOk]);
end;

procedure ChangeKeyboardLayout;
begin
 if AutoChangeKeyboardLayout then	LoadKeyboardLayout(PAnsiChar(KeyboardLayout), KLF_ACTIVATE or KLF_SUBSTITUTE_OK);
end;

end.
