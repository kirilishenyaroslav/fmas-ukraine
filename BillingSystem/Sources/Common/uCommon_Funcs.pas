//******************************************************************************
// Проект "ГорВодоКанал" (bs)
// Файл типов функций
// Перчак А.Л.
// создан 18/01/2010
// последние изменения Перчак А.Л. 18/01/2010
//******************************************************************************
unit uCommon_Funcs;

interface

uses Windows, SysUtils, cxGridTableView, Forms, Classes, ShellAPI, Menus,
     uCommon_Types, uConsts, uConsts_Messages, Registry, FIBDataSet,
     pFIBDataSet, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar,
     cxContainer, cxEdit, cxTextEdit, cxButtonEdit, uCommon_DM, Variants,
     iBase, IniFiles, uPwdDecrypt, FIBDatabase, pFIBDatabase, AccMGMT, cxSpinEdit,
     cxControls, cxLabel, cxCheckBox, cxLookupEdit, cxDBLookupEdit,
     cxDBLookupComboBox, cxMemo, DB, Dialogs;


function  bsLanguageIndex:byte;
function  UpperCaseRusUkr(const S: string): string;
function  bsGetKeyBoardState(Key : Word): boolean; // 0 - выкл, 1 - вкл
function  IsMDIChildFormShow(AClass:TClass):boolean;
function  IntegerCheck(const s : string) : boolean;
function  FloatCheck(const s : string) : boolean;
function  DateCheck(const s : string) : Boolean;
function  ExtractNumYear(DateBeg:TDateTime; DateEnd:TDateTime; Separator: string ): string;
function  StringPrepareToQueryText(AText:string):string;
function  PercentOfNumber(FullNumber : integer; PercentNumber : integer): string;
function  CheckControls(ViewForm : TForm; PLanguageIndex : byte): boolean;
procedure LanguageSwitch;
procedure LogException;
procedure ReadIniFileImage (DB : TpFIBDataBase);
function  LoadShortCut (dbHandle : TISC_DB_HANDLE; aOwner : TComponent): TbsShortCut;
procedure BsSetKeyBoardLanguage(Lang:char);
function GetValueByNameComponent(AOwner:TComponent; NameComponent:String):Variant;
procedure ShowDataSetInfo(DataSet : TDataSet);

implementation

uses  uCommon_Messages;

const LogName : string = '\bs_errors.log';



// процедура заполнения лог-файла ошибок и исключений
procedure LogException;
var
  fs  : TFileStream;
  m   : word;
  buf : array[0..511] of char;
begin
  if FileExists(ExtractFileDir(Application.ExeName)+ LogName)
   then m := fmOpenReadWrite
   else m := fmCreate;

  fs:= TFileStream.Create(ExtractFileDir(Application.ExeName)+ LogName, m);
  fs.Seek(0, soFromEnd);
  StrPCopy(buf, DateTimeToStr(now)+'. ');
  ExceptionErrorMessage
  (ExceptObject, ExceptAddr, @buf[strlen(buf)], sizeof(buf)-strlen(buf));
  strcat(buf, #13#10);
  fs.WriteBuffer(buf, strlen(buf));
  fs.Free;
end;

// поиск mdi-окна заданного класса
function IsMDIChildFormShow(AClass:TClass):boolean;
var
  IsFormShow : boolean;
  i : integer;
begin
  IsFormShow := False;
  for i := Application.MainForm.MDIChildCount-1 downto 0 do
   if (Application.MainForm.MDIChildren[i].ClassType = AClass) then
    begin
     IsFormShow := True;
     Application.MainForm.MDIChildren[i].BringToFront;
     Application.MainForm.MDIChildren[i].SetFocus;
     FlashWindow(Application.MainForm.MDIChildren[i].Handle, true);
     break;
    end;
  IsMDIChildFormShow:=IsFormShow;
end;

// переключение раскладки клавиатуры (рус, укр, англ)
procedure LanguageSwitch;
var
  Layout: array[0.. KL_NAMELENGTH] of char;
begin
  case bsLanguageIndex() of
   1: LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
   2: LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
  else
   LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
  end;
end;

procedure BsSetKeyBoardLanguage(Lang:char);
var
  Layout: array [0.. KL_NAMELENGTH] of char;
begin
  case Lang of
     'E' : LoadKeyboardLayout(StrCopy(Layout, '00000409'), KLF_ACTIVATE);
     'R' : LoadKeyboardLayout(StrCopy(Layout, '00000419'), KLF_ACTIVATE);
     'U' : LoadKeyboardLayout(StrCopy(Layout, '00000422'), KLF_ACTIVATE);
  end;
end;

// чтение настроек языковых предпочтений клиента из реестра
function bsLanguageIndex:byte;
var
  reg: TRegistry;
  Index : string;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\bs\Options\Language',False) then
    begin
     Index := reg.ReadString('Index');
    end
   else Index := '1';
  finally
   reg.Free;
  end;
  Result := StrToInt(Index);
end;

// преобразование строки к верхнему регистру
function UpperCaseRusUkr(const S: string): string;
var
  Ch: Char;
  L: Integer;
  Source, Dest: PChar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest := Pointer(Result);
  while L <> 0 do
   begin
    Ch := Source^;
    if (Ch >= 'а') and (Ch <= 'я') then Dec(Ch, 32);
    if Ch = 'і' then Ch := 'І';
    if Ch = 'ї' then Ch := 'Ї';
    if Ch = 'є' then Ch := 'Є';
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
   end;
end;

// проверка состояния клавиши клавиатуры
function  bsGetKeyBoardState(Key : Word): boolean; // 0 - выкл, 1 - вкл
var
  KState: TKeyboardState;
begin
  Result:=false;
  GetKeyboardState(KState);
  if Odd(KState[Key]) then
  Result := true; //клавиша "включена"
end;

 // MathPack ---------------------------------------------

// проверка строки на тип Integer
function IntegerCheck(const s : string) : boolean;
var
  i : integer;
  k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do
  begin
   k := s[i];
   if not (k in ['0'..'9',#8, #13]) then k := #0;
   if k = #0 then exit;
  end;
 Result := true;
end;

// проверка строки на тип Float
function FloatCheck(const s : string) : boolean;
var
  i : integer;
  k : char;
begin
  Result := false;
  if s = '' then exit;
  for i := 1 to Length(s) do
   begin
    k := s[i];
    if not (k in ['0'..'9',#8, #13, DecimalSeparator]) then k := #0;
    if k = #0 then exit;
   end;
  i := pos(DecimalSeparator, s);
  if i <> 0 then if Copy(s, i + 1, Length(s) - i) = '' then exit;
  if pos(DecimalSeparator, Copy(s, i + 1, Length(s) - i)) <> 0 then exit;
  Result := true;
end;

// проверка строки на тип Date
function DateCheck(const s : string) : boolean;
var
  d : TDateTime; 
begin
  Result := false;
  try
   d := StrToDate(S);
   Result := true;
   except
    Result := False;
  End;
end;

// извлечение номера года по заданным датам заданного формата ('2005/2006')
function ExtractNumYear(DateBeg:TDateTime; DateEnd:TDateTime; Separator: string ): string;
var
    Now_Year, Now_Month, Now_Day: Word;
    BResult: string;
begin
    DecodeDate(DateBeg,Now_Year,Now_Month,Now_Day);
    BResult := inttostr(Now_Year)+ Separator;
    DecodeDate(DateEnd,Now_Year,Now_Month,Now_Day);
    BResult := BResult + inttostr(Now_Year);
    Result := BResult;
end;

// пидготовка строки к запросу
function StringPrepareToQueryText(AText:string):string;
var
  I:integer;
  TStr:string;
begin
  i:=1;
  While i<>Length(AText)+1 do
   begin
    if copy(Atext,i,1)='''' then
     begin
      TStr:=copy(Atext,i+1,Length(Atext)-i);
      delete(Atext,i+1,Length(Atext)-i);
      AText:=AText+''''+TStr;
      inc(i);
     end;
    inc(i);
   end;
  result:=Atext;
end;

//вычисление процентного соотношения между двумя числами
function PercentOfNumber(FullNumber : integer; PercentNumber : integer): string;
var
  Resulting : Currency;
begin
  Resulting := PercentNumber * 100 / FullNumber;
  Result:= ' (' + CurrToStr(Resulting) + '%)';
end;

// ????????
function CheckControls (ViewForm : TForm; PLanguageIndex : byte): boolean;
var
  i: integer;
  flag : boolean;
begin
 with ViewForm do
  begin
   for i:=0 to ComponentCount-1 do
    begin
     if (Components[i].ClassType= TcxTextEdit) then
      if (Components[i] as TcxTextEdit).Text = '' then
       begin
        flag := true;
        (Components[i] as TcxTextEdit).SetFocus;
        break;
       end;
     if (Components[i].ClassType= TcxDateEdit) then
      if (Components[i] as TcxDateEdit).Text = '' then
       begin
        flag := true;
        (Components[i] as TcxDateEdit).SetFocus;
        break;
       end;
     if (Components[i].ClassType= TcxButtonEdit) then
      if (Components[i] as TcxButtonEdit).Text = '' then
       begin
        flag := true;
        (Components[i] as TcxButtonEdit).SetFocus;
        break;
       end;
    end;

    if flag then
     begin
      MessageBox(Handle,PChar( bs_Some_Need[PLanguageIndex]),PChar(bs_Error_Caption [PLanguageIndex]),MB_OK or MB_ICONERROR);
      Result:= true; // error exists
     end
    else
     begin
      Result:= false; // error's not exists
     end;
  end;
end;

//Чтение пути к базе фотографий
procedure ReadIniFileImage (DB : TpFIBDataBase);
var
  IniFile : TIniFile;
  INI_FILENAME, APP_PATH,DB_PATH, DB_SERVER, DB_USER, DB_PASSWORD : string;
begin
  INI_FILENAME:='config.ini';
  APP_PATH := ExtractFileDir(Application.ExeName) + '\';

  IniFile          := TIniFile.Create(APP_PATH + INI_FILENAME);
  DB_PATH          := IniFile.ReadString('IMAGE_CONNECTION', 'Path', DB_PATH);
  DB_SERVER        := IniFile.ReadString('IMAGE_CONNECTION', 'Server', DB_SERVER);
  DB_USER          := IniFile.ReadString('IMAGE_CONNECTION', 'User', DB_USER);
  DB_PASSWORD      := PwdDeCrypt(IniFile.ReadString('IMAGE_CONNECTION', 'Password_Crypted', DB_PASSWORD));
  IniFile.Free;

  if DB.Connected then DB.Close;

  DB.DatabaseName :=DB_SERVER+ ':'+DB_PATH;
  DB.DBParams.Values['USER_NAME']:=DB_USER;
  DB.DBparams.Values['PASSWORD'] :=DB_PASSWORD  ;
  try
   DB.Open;
  except
   raise;
   MessageBox(Application.Handle,'Невідоме програмне виключення','Помилка', MB_OK +MB_ICONERROR);
  end;
end;

function  LoadShortCut (dbHandle : TISC_DB_HANDLE; aOwner : TComponent): TbsShortCut;
var
  DM : TDM_Common;
Begin
  DM := TDM_Common.Create(aOwner);
  DM.DB.Handle := dbHandle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;
  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'Select * from BS_SHORTCUT';
  DM.DataSet.Open;

  LoadShortCut.View      := TextToShortCut(DM.DataSet['act_View']);
  LoadShortCut.Edit      := TextToShortCut(DM.DataSet['act_Edit']);
  LoadShortCut.Add       := TextToShortCut(DM.DataSet['act_Add']);
  LoadShortCut.Del       := TextToShortCut(DM.DataSet['act_Del']);
  LoadShortCut.Print     := TextToShortCut(DM.DataSet['act_Print']);
  LoadShortCut.Block     := TextToShortCut(DM.DataSet['act_Block']);
  LoadShortCut.Close     := TextToShortCut(DM.DataSet['act_Close']);
  LoadShortCut.Work      := TextToShortCut(DM.DataSet['act_Work']);
  LoadShortCut.Done      := TextToShortCut(DM.DataSet['act_Done']);
  LoadShortCut.UnDone    := TextToShortCut(DM.DataSet['act_UnDone']);
  LoadShortCut.Rejection := TextToShortCut(DM.DataSet['act_Rejection']);
  LoadShortCut.Sign      := TextToShortCut(DM.DataSet['act_Sign']);
  LoadShortCut.Configure := TextToShortCut(DM.DataSet['act_Configure']);
  LoadShortCut.UnSign    := TextToShortCut(DM.DataSet['act_UnSign']);
  LoadShortCut.Change    := TextToShortCut(DM.DataSet['act_Change']);
  LoadShortCut.Choice    := TextToShortCut(DM.DataSet['act_Choice']);
  LoadShortCut.Search    := TextToShortCut(DM.DataSet['act_Search']);
  LoadShortCut.StepUp    := TextToShortCut(DM.DataSet['act_StepUp']);
  LoadShortCut.StepDown  := TextToShortCut(DM.DataSet['act_StepDown']);
  LoadShortCut.Clear     := TextToShortCut(DM.DataSet['act_Clear']);
  LoadShortCut.Refresh   := TextToShortCut(DM.DataSet['act_Refresh']);

  DM.DataSet.Close;
  DM.ReadTransaction.Commit;
  DM.DB.Connected := False;
  DM.Free;
End;

function GetValueByNameComponent(AOwner:TComponent; NameComponent:string):Variant;
begin
      if AOwner.FindComponent(NameComponent) is TcxTextEdit then
         Result:=(AOwner.FindComponent(NameComponent) as TcxTextEdit).Text
      else if AOwner.FindComponent(NameComponent) is TcxCheckBox then
              Result:=(AOwner.FindComponent(NameComponent) as TcxCheckBox).Checked
           else if AOwner.FindComponent(NameComponent) is TcxDateEdit then
                   Result:=(AOwner.FindComponent(NameComponent) as TcxDateEdit).Date
                else if AOwner.FindComponent(NameComponent) is TcxLookupComboBox then
                        Result:=(AOwner.FindComponent(NameComponent) as TcxLookupComboBox).EditValue
                     else if AOwner.FindComponent(NameComponent) is TcxComboBox then
                             Result:=(AOwner.FindComponent(NameComponent) as TcxComboBox).ItemIndex
                          else if AOwner.FindComponent(NameComponent) is TcxMemo then
                                  Result:=(AOwner.FindComponent(NameComponent) as TcxMemo).Text
                                else if AOwner.FindComponent(NameComponent) is TcxSpinEdit then
                                     Result:=(AOwner.FindComponent(NameComponent) as TcxSpinEdit).Value;
end;

procedure ShowDataSetInfo(DataSet : TDataSet);
var i:Integer;
    str:string;
begin
   str:='';
   for i:=0 to DataSet.RecordCount-1 do
   begin
      str:=str+DataSet.Fields.Fields[i].DisplayName+': '+VarToStr(DataSet.Fields.Fields[i].Value)+#13;
   end;
   bsShowMessage(Application.Title, str, mtInformation, [mbOK]);
end;

end.
