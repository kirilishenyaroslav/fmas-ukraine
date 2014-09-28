unit BaseTypes;

interface
uses Dialogs, pFIBDataBase, FIBDataBase;
const
 INI_FILENAME    = 'app.ini';
 DELETE_QUESTION = 'Ви дійсно хочете видалити виділений запис?';
 EMPTY_WARNING   = 'Необхідно заповнити всі дані';
 ST_REMOTE       = 0;//Server type
 ST_LOCAL        = 1;
 SYS_DIGITS_AFTER_DOT = 2;
 ID_ACTION_ADD   = 1;
 ID_ACTION_MOD   = 2;
 ID_ACTION_DEL   = 3;
 SYSTEM_CODE     = 1;
 SYSTEM_F        = 'SYSTEM_F';
 
type
 TReportFormFunc = function(AppHandle : THandle; DataBase : PCHAR; User : PCHAR; Password : PCHAR; id_report : integer; id_template : integer) : boolean; stdcall;

 TReportColumn = packed record
  name_column : string;
  name_filed  : string;
  type_filed  : string;
  visible     : boolean;
 end;
 TReportData = array of TReportColumn;


 TIntArray2 = array of integer;
 TSpravAction = (saAdd, saMod, saView);
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
 DEF_OPTIONS : TSpravOptions = (canAdd: true; canEdit: true; canDelete: true; canSelect: true; canSelect2: false; HideButtons: false; isModal: true);

 procedure CheckInteger(var Key : char);
 procedure CheckFloat(var Key : char);
 function isFloat(const s : string) : boolean;
 function isInteger(const s : string) : boolean;

 function agCurrToStr(const cur : currency) : string;

 function  agMessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
 procedure agShowMessage(const Msg : string);


implementation
uses Forms, StdCtrls, SysUtils, IniFiles;


function agCurrToStr(const cur : currency) : string;
begin
 Result := CurrToStrF(cur, ffFixed, SYS_DIGITS_AFTER_DOT);
end;



procedure CheckInteger(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13]) then Key := #0;
end;

procedure CheckFloat(var Key : char);
begin
 if not (Key in ['0'..'9',#8, #13, DecimalSeparator]) then Key := #0;
end;

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

procedure agShowMessage(const Msg : string);
begin
 agMessageDlg('Увага', Msg, mtWarning, [mbOk]);
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
 
end.
