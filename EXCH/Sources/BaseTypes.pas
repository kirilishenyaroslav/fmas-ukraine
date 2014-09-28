{******************************************************************************}
{*                        Автоматизированная система                          *}
{*       «Обмен данными между структурными подразделениями предприятия»       *}
{*            (c) Донецкий национальный университет, 2002-2007                *}
{******************************************************************************}

{                  Модуль "Основные типы(функции) системы"                     }
{ Содержит информацию необходимую для функционирования системы, а также базовые}
{ функции часто используемые системой.                                         }
{                                               ответственный: Таганский Андрей}

unit BaseTypes;

interface
uses Dialogs, pFIBDataBase, FIBDataBase, Controls, Forms, IB_Externals, Classes;

const
 REG_KEY = '\Software\FMAS\EXCH\';

 INI_FILENAME    = 'config.ini';
 DELETE_QUESTION = 'Ви дійсно хочете видалити виділений запис?';
 EMPTY_WARNING   = 'Необхідно заповнити всі дані';
 EXISTS_WARNING  = 'Даний запис використовується в інших довідниках. Видалення неможливе.';
 ST_REMOTE       = 0;//Server type
 ST_LOCAL        = 1;
 SYS_DIGITS_AFTER_DOT = 4;
 ID_ACTION_ADD   = 1;
 ID_ACTION_MOD   = 2;
 ID_ACTION_DEL   = 3;
 SYSTEM_CODE     = 1;
 SYSTEM_F        = 'SYSTEM_F';
 FilterNames : array [0..1] of string =('Справочник контрагентов', 'Справочник подразделений');

 fCustomers = 0;
 fDepartments = 1;
type

 TFilter = set of byte;

 TReportFormFunc = function(AppHandle : THandle; dm : TDataModule; dbHandle : PVOID; id_report : integer; id_template : integer) : boolean; stdcall;

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
  MoveUp     : boolean;
  MoveDown   : boolean;
 end;
const
 DEF_OPTIONS : TSpravOptions = (canAdd: true; canEdit: true; canDelete: true; canSelect: true; canSelect2: false; HideButtons: false; isModal: true);
var
 APP_PATH         : string;
 DB_PATH          : string;
 DB_USER          : string;
 DB_PASSWORD      : string;
 DB_SERVER_TYPE   : integer;// 0 - remote  1 - local
 DB_SERVER_NAME   : string;
 CURRENT_USER     : string;
 CURRENT_PASSWORD : string;
 DEF_EXP_PATH     : string = '';
 EXCH_ADMIN       : boolean = False;

 SYS_TOP    : integer;       //
 SYS_BOTTOM : integer;      //
 SYS_LEFT   : integer;     //
 SYS_RIGHT  : integer;    //   options for plan's print
 SYS_FONT   : string;    //
 SYS_FSIZE  : integer;  //
 SYS_COLW   : integer; //  Column's width but for complicated plan's report only

 NO_PASS_MODE      : boolean = False;
 ADMIN_MODE        : boolean = False;
 Sys_User_Name     : string;
 Sys_User_Password : string;
 CurrentID_PCARD   : integer;
 id_user           : integer;

 procedure CheckInteger(var Key : char);
 procedure CheckFloat(var Key : char);
 function isFloat(const s : string) : boolean;
 function isInteger(const s : string) : boolean;

 function agCurrToStr(const cur : currency) : string;

 function  MessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word; overload;
 procedure ShowMessage(const Msg : string);

 function ReadIniFile : boolean;
 procedure WriteIniFile;

 function GetMonth(const from_date, to_date : TDate) : string;

implementation

uses StdCtrls, SysUtils, IniFiles, DateUtils, uPwdDeCrypt;

function GetMonth(const from_date, to_date : TDate) : string;
var
 fy, fm, ty, tm, d1, d2 : word;
begin
 Result := '';
 DecodeDate(from_date, fy, fm, d1);
 DecodeDate(to_date, ty, tm, d2);
 if (DateToStr(EndOfAMonth(fy, fm)) = DateToStr(to_date)) and (DateToStr(StartOfAMonth(ty, tm)) = DateToStr(from_date)) then begin
  case tm of
{   1 : Result := 'январь';
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
   12 : Result := 'декабрь';}
   1 : Result := 'січень';
   2 : Result := 'лютий';
   3 : Result := 'березень';
   4 : Result := 'квітень';
   5 : Result := 'травень';
   6 : Result := 'червень';
   7 : Result := 'липень';
   8 : Result := 'серпень';
   9 : Result := 'вересень';
   10 : Result := 'жовтень';
   11 : Result := 'листопад';
   12 : Result := 'грудень';
  end;
 end;
end;

function agCurrToStr(const cur : currency) : string;
begin
 Result := CurrToStrF(cur, ffFixed, SYS_DIGITS_AFTER_DOT);
end;

function ReadIniFile : boolean;
var
 IniFile : TMemIniFile;
 pwd     : string;
begin
 Result := False;

 if not FileExists(APP_PATH + INI_FILENAME) then exit;

 try
  IniFile        := TMemIniFile.Create(APP_PATH + INI_FILENAME);
  DB_PATH        := IniFile.ReadString('CONNECTION', 'Path', DB_PATH);

  pwd            := IniFile.ReadString('CONNECTION', 'Password_Crypted', '');
  pwd            := PwdDeCrypt(pwd);

  DB_USER        := IniFile.ReadString('CONNECTION', 'User', '');
  DB_PASSWORD    := pwd;

  DB_SERVER_NAME := IniFile.ReadString('CONNECTION', 'Server', DB_SERVER_NAME);

  DEF_EXP_PATH   := IniFile.ReadString('Exchange', 'Exp_Path', DEF_EXP_PATH);

  SYS_LEFT   := IniFile.ReadInteger('PrintPlan', 'Left', 36);
  SYS_BOTTOM := IniFile.ReadInteger('PrintPlan', 'Bottom', 36);
  SYS_TOP    := IniFile.ReadInteger('PrintPlan', 'Top', 36);
  SYS_RIGHT  := IniFile.ReadInteger('PrintPlan', 'Right', 36);
  SYS_FONT   := IniFile.ReadString('PrintPlan',  'Font', 'Arial');
  SYS_FSIZE  := IniFile.ReadInteger('PrintPlan', 'Font_Size', 10);
  SYS_COLW   := IniFile.ReadInteger('PrintPlan', 'ColWidth', 80);

  EXCH_ADMIN := IniFile.ReadString('Exchange', 'Exch_Admin', '') = 'T';

 finally
  IniFile.Free;
 end;

 if DB_SERVER_NAME <> '' then DB_PATH := DB_SERVER_NAME + ':' + DB_PATH;

 Result  := True;
// if DB_SERVER_TYPE = ST_REMOTE then DB_PATH := DB_SERVER_NAME + ':' + DB_PATH;
end;

procedure WriteIniFile;
var
 IniFile : TIniFile;
begin
 try
  IniFile := TIniFile.Create(APP_PATH + INI_FILENAME);

  IniFile.WriteInteger('PrintPlan', 'Left', SYS_LEFT);
  IniFile.WriteInteger('PrintPlan', 'Bottom', SYS_BOTTOM);
  IniFile.WriteInteger('PrintPlan', 'Top', SYS_TOP);
  IniFile.WriteInteger('PrintPlan', 'Right', SYS_RIGHT);
  IniFile.WriteString('PrintPlan', 'Font', SYS_FONT);
  IniFile.WriteInteger('PrintPlan', 'Font_Size', SYS_FSIZE);
  IniFile.WriteInteger('PrintPlan', 'ColWidth', SYS_COLW);
 finally
  IniFile.Free;
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

function MessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
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

procedure ShowMessage(const Msg : string);
begin
 MessageDlg('Увага', Msg, mtWarning, [mbOk]);
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
