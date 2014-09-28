//******************************************************************************
// Проект "Контракты"
// Файл типов функций
// Чернявский А.Э. 2005г.
// последние изменения Перчак А.Л. 28/10/2008
//******************************************************************************
unit cn_Common_Funcs;

interface

uses
  Windows,
  SysUtils,
  cn_Common_GridStyles, cxGridTableView, Forms, Classes,
  ShellAPI,
  cn_Common_Types, cnConsts, cnConsts_Messages,
  Registry,
  FIBDataSet, pFIBDataSet,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer, cxEdit,
  cxTextEdit, cxButtonEdit, cn_Common_DM, Variants, ibase,
  inifiles, uPwdDecrypt, FIBDatabase, pFIBDatabase, AccMGMT,
  cn_common_sql_monitor, Dialogs, AppEvnts, AppStruClasses, RxMemDS;


function  cnLanguageIndex:byte;
function  GridStyle(AOwner:tcomponent):TcxGridTableViewStyleSheet;
function  UpperCaseRusUkr(const S: string): string;
function  cnGetKeyBoardState(Key : Word): boolean; // 0 - выкл, 1 - вкл
function  IsMDIChildFormShow(AClass:TClass):boolean;
function  IntegerCheck(const s : string) : boolean;
function  FloatCheck(const s : string) : boolean;
function  AcademicYear(CurrentServerDate:TDateTime): TcnAcademicYear;
function  AcademicYearCompare(CurrentServerDate:TDateTime; CompareMonth : byte): TcnAcademicYear;
function  ExtractAcademicYears(DateBeg:TDateTime; DateEnd:TDateTime ): TcnExAcademicYear;
function  ExtractNumYear(DateBeg:TDateTime; DateEnd:TDateTime; Separator: string ): string;
function  StringPrepareToQueryText(AText:string):string;
function  PercentOfNumber(FullNumber : integer; PercentNumber : integer): string;
function  GetCodeBudjet (ReadDataSet: TPFibDataset; Id_pk : int64; StProcName: string; OutParamName: string; SecondParam: string) : variant;
function  CheckControls(ViewForm : TForm; PLanguageIndex : byte): boolean;
function  GetCnCalc(AParams : TcnCalcIn) : TcnCalcOut;
function  GetCnPay (AParams : TcnPayIn) : TcnPayOut;
procedure LanguageSwitch;
procedure LogException;
procedure DoAnnulContract (AParams : TcnAnnulContractIn) ;
procedure ReadIniFileImage (DB : TpFIBDataBase);
function  StringPrepareToApostrofText(AText:string):string;
Function  CheckPermission(Path:string;Action: String):byte;
procedure start_sql_monitor;
procedure stop_sql_monitor;
procedure save_sql_monitor;
procedure Load_Help(aOwner : TComponent; aDB_handle : TISC_DB_HANDLE; name_object : string);
procedure SynchEDBO(aOwner : TComponent; aDB_handle : TISC_DB_HANDLE; Hand_made : Integer; set_synchEDBO : TSelectSynchEDBO);


implementation

uses cn_Common_Messages, cn_Common_WaitForm, cn_Common_WaitForm_progress;

const LogName : string = '\cn_errors.log';

// процедура заполнения лог-файла ошибок и исключений
procedure LogException;
 var
  fs  : TFileStream;
  m   : word;
  buf : array[0..511] of char;
begin
  if FileExists(ExtractFileDir(Application.ExeName)+ LogName) then m := fmOpenReadWrite else m := fmCreate;
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
var IsFormShow:boolean;
    i:integer;
begin
IsFormShow:=False;
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = AClass) then
  begin
     IsFormShow:=True;
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
    case cnLanguageIndex() of
      1: LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
      2: LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
    else
         LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
    end;
  end;

// чтение настроек языковых предпочтений клиента из реестра
function cnLanguageIndex:byte;
var
  reg: TRegistry;
  Index : string;
begin
     reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       if  reg.OpenKey('\Software\Contracts\Options\Language',False) then
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

// передача стиля для грида
function GridStyle(AOwner:TComponent):TcxGridTableViewStyleSheet;
  var
    DM:TDM_Styles;
  begin
    DM := TDM_Styles.Create(AOwner);
    Result := DM.GridTableViewStyleSheetDevExpress;
    DM.GridTableViewStyleSheetDevExpress := nil;
    DM.Free;
  end;

// проверка состояния клавиши клавиатуры
function  cnGetKeyBoardState(Key : Word): boolean; // 0 - выкл, 1 - вкл
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
 for i := 1 to Length(s) do begin
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
 for i := 1 to Length(s) do begin
  k := s[i];
 if not (k in ['0'..'9',#8, #13, DecimalSeparator]) then k := #0;
  if k = #0 then exit;
 end;
 i := pos(DecimalSeparator, s);
 if i <> 0 then if Copy(s, i + 1, Length(s) - i) = '' then exit;
 if pos(DecimalSeparator, Copy(s, i + 1, Length(s) - i)) <> 0 then exit;
 Result := true;
end;

// извлечение из заданной даты академического года
function AcademicYear(CurrentServerDate:TDateTime): TcnAcademicYear;
var
    Now_Year, Now_Month, Now_Day: Word;
    End_Year, End_Month, End_Day: Word;
    cnAcademicYear: TcnAcademicYear;
begin
  DecodeDate(CurrentServerDate,Now_Year,Now_Month,Now_Day);
  End_Day:=1;
  End_Month:=7;
  If Now_Month >=7 then
   begin
    Now_Month := 9;
    Now_Day:=1;
    End_Year := Now_Year+1;
    cnAcademicYear.Date_Beg :=EncodeDate(Now_Year,Now_Month,Now_Day);
    cnAcademicYear.Date_End :=EncodeDate(End_Year,End_Month,End_Day);
   end
  else
   begin
    End_Year := Now_Year;
    Now_Month := 9;
    Now_Day:=1;
    cnAcademicYear.Date_Beg :=EncodeDate(Now_Year-1,Now_Month,Now_Day);
    cnAcademicYear.Date_End :=EncodeDate(End_Year,End_Month,End_Day);
   end;
  AcademicYear:= cnAcademicYear;
end;

// извлечение массива академических лет из заданного интервала дат
function ExtractAcademicYears(DateBeg:TDateTime; DateEnd:TDateTime ): TcnExAcademicYear;
var
    Now_Year, Now_Month, Now_Day : Word;
    cnAcademicYear               : TcnAcademicYear;
    cnAYArray                    : TcnExAcademicYear;
    EndDateCurrentAY             : TDateTime;
    i                            : integer;
begin
  SetLength(cnAYArray, 1);
  EndDateCurrentAY := DateBeg;
  i := 1;
  cnAcademicYear := AcademicYear(DateBeg);
  cnAYArray[0].Date_Beg:= cnAcademicYear.Date_Beg;
  cnAYArray[0].Date_End:= cnAcademicYear.Date_End;
  EndDateCurrentAY:= cnAYArray[0].Date_End;

  DecodeDate(EndDateCurrentAY,Now_Year,Now_Month,Now_Day);
  EndDateCurrentAY:=EncodeDate(Now_Year,Now_Month+2,Now_Day);

  while DateEnd > EndDateCurrentAY do
   begin
    cnAcademicYear := AcademicYear(EndDateCurrentAY);

    SetLength(cnAYArray, Length(cnAYArray)+1 );
    cnAYArray[i].Date_Beg:= cnAcademicYear.Date_Beg;
    cnAYArray[i].Date_End:= cnAcademicYear.Date_End;

    EndDateCurrentAY:= cnAYArray[i].Date_End;

    DecodeDate(EndDateCurrentAY,Now_Year,Now_Month,Now_Day);
    EndDateCurrentAY:=EncodeDate(Now_Year,Now_Month+2,Now_Day);

    i:= i+1;
   end;
  Result := cnAYArray;
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

// пдготовка строки к запросу
function StringPrepareToQueryText(AText:string):string;
var I:integer;
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


// пдготовка строки к запросу
function StringPrepareToApostrofText(AText:string):string;
var I:integer;
    TStr:string;
begin
 i:=1;
 While i<>Length(AText)+1 do
  begin
   if copy(Atext,i,1)='''' then
    begin
     TStr:=copy(Atext,i+1,Length(Atext)-i);
     delete(Atext,i+1,Length(Atext)-i);
     AText:=AText+''''+ '''' + ''''+ TStr;
     inc(i);
     inc(i);
     inc(i);
    end;
    inc(i);
  end;
 result:=Atext;
end;

// извлечение из заданной даты академического года со сравнением с месяцем года
function AcademicYearCompare(CurrentServerDate:TDateTime; CompareMonth : byte): TcnAcademicYear;
var
    EndAc_Year, EndAc_Month, EndAc_Day: Word;
    cnAcademicYear: TcnAcademicYear;
begin
 // получили академ год
 cnAcademicYear:= AcademicYear(CurrentServerDate);
 // Декодировали на части дату окончания ак года
 DecodeDate(cnAcademicYear.Date_End, EndAc_Year,EndAc_Month,EndAc_Day);
 // Закодировали в дату конца месяц сравнения - потолок
 cnAcademicYear.Date_End := EncodeDate( EndAc_Year,CompareMonth,EndAc_Day);
 // проверка на превышение
 if CurrentServerDate < cnAcademicYear.Date_End then
  AcademicYearCompare:= AcademicYear(CurrentServerDate)
 else
  AcademicYearCompare:= AcademicYear(EncodeDate(EndAc_Year+1,CompareMonth,EndAc_Day));
end;

 function GetCodeBudjet (ReadDataSet: TPFibDataset; Id_pk : int64; StProcName: string; OutParamName: string; SecondParam: string) : variant;
  var
     SQLText: string;
  begin
     if SecondParam = '' then
      SQLText:= 'select * from ' + StProcName + '(' + inttostr(Id_pk) + ')'
     else
      SQLText:= 'select * from ' + StProcName + '(' + inttostr(Id_pk) + ',' + ''''+ SecondParam +''''+ ')';

     ReadDataSet.Close;
     ReadDataSet.SelectSQL.Clear;
     ReadDataSet.SelectSQL.Text := SQLText;
     ReadDataSet.Open;
     Result := ReadDataSet[OutParamName];
     ReadDataSet.Close;
  end;

  function  PercentOfNumber(FullNumber : integer; PercentNumber : integer): string;
   var Resulting : Currency;
   begin
      Resulting := PercentNumber * 100 / FullNumber;
      Result:= ' (' + CurrToStr(Resulting) + '%)';
   end;

function CheckControls (ViewForm : TForm; PLanguageIndex : byte): boolean;
  var i: integer;
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
       MessageBox(Handle,PChar( cn_Some_Need[PLanguageIndex]),PChar(cn_Error_Caption [PLanguageIndex]),MB_OK or MB_ICONERROR);
       Result:= true; // error exists
      end
     else
      begin
       Result:= false; // error's not exists
      end;
  end;
 end;

function  GetCnCalc(AParams : TcnCalcIn) : TcnCalcOut;
 var DM: TDM_Common;
     CnCalcOut : TCnCalcOut;
begin
  DM:=TDM_Common.Create(AParams.Owner);
  DM.DB.Handle:=AParams.DB_Handle;

    with DM.StProc do
     begin
      try
        StoredProcName := 'CN_CALC';
        Transaction.StartTransaction;
        ParamByName('ID_STUD').AsInt64     := AParams.ID_STUD;
        ParamByName('BEG_CHECK').AsDate    := AParams.BEG_CHECK;
        ParamByName('END_CHECK').AsDate    := AParams.END_CHECK;
        ParamByName('CNUPLSUM').AsCurrency := AParams.CNUPLSUM;
        Prepare;
        ExecProc;
           CnCalcOut.CN_SNEED   := ParamByName('CN_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
           CnCalcOut.CNDATEOPL  := ParamByName('CNDATEOPL').AsDateTime;   // дата, по которую оплачено
           CnCalcOut.CN_SNEEDL  := ParamByName('CN_SNEEDL').AsCurrency;
           CnCalcOut.ID_SESSION := ParamByName('ID_SESSION').AsInt64;
        Transaction.Commit;
        Close;
         Result:= CnCalcOut;
      except
        Transaction.Rollback;
        raise;
         //ShowMessage('Error in stored procedure CN_CALC');
        exit;
      end;
     end;

  with DM.StProc do
   begin
      StoredProcName := 'CN_CALC_TMP_CLEAR';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_SESSION').AsInt64 := CnCalcOut.ID_SESSION;
      ExecProc;
      Transaction.Commit;
      Close;
   end;
   DM.Free;
end;


function  GetCnPay (AParams : TcnPayIn) : TcnPayOut;
 var DM: TDM_Common;
     CnPayOut : TCnPayOut;
begin
  DM:=TDM_Common.Create(AParams.Owner);
  DM.DB.Handle:=AParams.DB_Handle;

    with DM.StProc do
     begin
      try
        StoredProcName := 'CN_PAY';
        Transaction.StartTransaction;
        Prepare;
        ParamByName('ID_STUD').AsInt64 := AParams.ID_STUD;
        ParamByName('DATE_PROV_CHECK').AsShort := AParams.DATE_PROV_CHECK;
        ParamByName('IS_DOC_GEN').AsShort := AParams.IS_DOC_GEN;
        ParamByName('IS_PROV_GEN').AsShort := AParams.IS_PROV_GEN;
        ParamByName('IS_SMET_GEN').AsShort := AParams.IS_SMET_GEN;
        ParamByName('NOFPROV').AsShort := AParams.NOFPROV;
        ParamByName('DIGNORDOCID').AsShort := AParams.DIGNORDOCID;
        ExecProc;
           CnPayOut.SUMMA_ALL   := ParamByName('SUMMA_ALL') .AsCurrency;
           CnPayOut.CNUPLSUM    := ParamByName('CNUPLSUM')  .AsCurrency;
           CnPayOut.CNSUMDOC    := ParamByName('CNSUMDOC')  .AsCurrency;
           CnPayOut.CNINSOST    := ParamByName('CNINSOST')  .AsCurrency;
           CnPayOut.ID_SESSION  := ParamByName('ID_SESSION').AsInt64;
        Transaction.Commit;
        Close;
         Result:= CnPayOut;
      except
        Transaction.Rollback;
        raise;
         //ShowMessage('Error in stored procedure CN_CALC');
        exit;
      end;
     end;

  with DM.StProc do
   begin
      StoredProcName := 'CN_PAY_TMP_CLEAR';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_SESSION').AsInt64 := CnPayOut.ID_SESSION;
      ExecProc;
      Transaction.Commit;
      Close;
   end;
   DM.Free;
end;


procedure  DoAnnulContract (AParams : TcnAnnulContractIn) ;
 var DM: TDM_Common;
begin
  DM:=TDM_Common.Create(AParams.Owner);
  DM.DB.Handle:=AParams.DB_Handle;

         with DM.StProc do
          try
            Transaction.StartTransaction;
            StoredProcName := 'CN_DT_DOG_DISS_ANNUL_CONTRACT';

              ParamByName('ID_DOG_ROOT').AsInt64 := AParams.ID_DOG_ROOT;
              ParamByName('ID_DOG_LAST').AsInt64 := AParams.ID_DOG;
              ParamByName('ID_STUD').AsInt64     := AParams.ID_STUD;
              ParamByName('DATE_DISS').AsDate    := AParams.DATE_DISS;
              ParamByName('ID_TYPE_DISS').AsInt64:= AParams.ID_TYPE_DISS;
              ParamByName('ORDER_DATE').AsDate   := AParams.ORDER_DATE;
              ParamByName('ORDER_NUM').AsString  := AParams.ORDER_NUM;
              ParamByName('COMMENT').AsString    := AParams.COMMENT;
              ParamByName('IS_COLLECT').AsInteger :=AParams.IS_COLLECT;
              ParamByName('ID_DOG_DISS_IN').AsVariant := null;
            Prepare;
            ExecProc;
            Transaction.Commit;
            except
            on E:Exception do
             begin
              Transaction.Rollback;
              raise;
             end;
          end; //------------------vvvvvvvvvv-
   DM.Free;
end;

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

Function CheckPermission(Path:string;Action: String):byte;
Begin
 Result:=fibCheckPermission(Path,Action);
End;

procedure Load_Help(aOwner : TComponent; aDB_handle : TISC_DB_HANDLE; name_object : string);
var
  FileName : String;
  FullName : PAnsiChar;
  DM: TDM_Common;
begin
  DM := TDM_Common.Create(aOwner);
  DM.DB.Handle := aDB_handle;
  DM.ReadTransaction.StartTransaction;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from pub_sp_help where name_object = :object and name_system = :system';
  DM.DataSet.ParamByName('object').AsString := name_object;
  DM.DataSet.ParamByName('system').AsString := 'contracts';
  DM.DataSet.Open;


  If DM.DataSet.RecordCount = 0 then
   begin
    cnShowMessage('Help not found',
                  'Help not Found' + #13 + cnConsts_Messages.cn_GoToAdmin[cnLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
    DM.Free;
   end;

  FileName := DM.DataSet.FieldByName('NAME_FILE').AsString;
  FullName := PChar(ExtractFilePath(Application.ExeName) + 'Help\Contracts\' + FileName);
  if not FileExists(FullName) then
   Begin
    cnShowMessage('File not found',
                   FullName + #13 + cnConsts_Messages.cn_GoToAdmin[cnLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
    DM.Free;
   end;

  ShellExecute(Application.Handle, 'open', FullName, nil, nil, SW_SHOWNORMAL);
  
  DM.Free;
End;

procedure start_sql_monitor;
begin
  cn_common_sql_monitor.start;
end;

procedure stop_sql_monitor;
begin
  cn_common_sql_monitor.stop;
end;

procedure save_sql_monitor;
begin
  cn_common_sql_monitor.Save_result;
end;

procedure SynchEDBO(aOwner : TComponent; aDB_handle : TISC_DB_HANDLE; Hand_made : integer; set_synchedbo : TSelectSynchEDBO);
var
  EDBOGuidesIntf, EDBOPersonIntf : TFMASAppModule;
  path_str, UniversityKode : string;
  i, page : integer;
  wf : TForm;
  Synch_Facul, Synch_Spec, Synch_Kurs, Synch_Group : Boolean;
  MemoryData_EDBO : TRxMemoryData;
  DM: TDM_Common;
  Id_PersonRequestSeasons, Id_AcademicYear : Integer;
  cnWaitForm_progress :TcnWaitForm_progress;
begin
  DM := TDM_Common.Create(aOwner);
  DM.DB.Handle := aDB_handle;
  DM.DB.Connected := True;

  Synch_Facul := False;
  Synch_Spec  := False;
  Synch_Kurs  := False;
  Synch_Group := False;

  with TFMASAppModuleCreator.Create do
  begin
   path_str:=ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

   //Экземпляр для работы с веб-сервисом EDBOGuides
   EDBOGuidesIntf:= CreateFMASModule(path_str, 'EDBOIntf');
   EDBOPersonIntf:= CreateFMASModule(path_str, 'EDBOIntf');

   If ((EDBOGuidesIntf = nil) or (EDBOGuidesIntf = nil))
    then MessageBox(application.Handle, 'Помилка при роботі з модулем взаємодії з ЄДЕБО', 'Увага!', MB_OK or MB_ICONWARNING)
    else
     begin
      if (((EDBOGuidesIntf as IEDBOTools).InitEDBOConnection('EDBOGuides', aDB_Handle)) and
          ((EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', aDB_Handle)))
      then
       Begin
        cnWaitForm_progress  := TcnWaitForm_progress.create(aOwner);
        cnWaitForm_progress.Show;

        //cxProgressBar1
        cnWaitForm_progress.cxProgressBar1.Position := 0;

        try
         DM.DataSet.Close;
         DM.DataSet.SQLs.SelectSQL.Text := 'Select * from CN_WEB_INI';
         DM.DataSet.Open;

          //факультет
         if set_synchEDBO.SynchEDBO_facul then
          begin
             (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('UniversityFacultetsGet', MemoryData_EDBO);

             DM.WriteTransaction.StartTransaction;

             DM.StProc.StoredProcName := 'CN_WEB_STACK_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 2;
             cnWaitForm_progress.Update;

             DM.StProc.StoredProcName := 'CN_WEB_SP_FACUL_LINK_EDBO_LOAD';
             DM.StProc.Prepare;

             MemoryData_EDBO.Open;
             MemoryData_EDBO.First;
             For i := 0 to MemoryData_EDBO.RecordCount - 1 do
              Begin
               DM.StProc.ParamByName('ID_FACUL_EDBO').AsInt64    := MemoryData_EDBO['fid_UniversityFacultet'];

               if MemoryData_EDBO['fUniversityFacultetFullName'] <> null
                then DM.StProc.ParamByName('Name_facul_edbo').AsString := MemoryData_EDBO['fUniversityFacultetFullName']
                else DM.StProc.ParamByName('Name_facul_edbo').AsString := '';

               if MemoryData_EDBO['fUniversityFacultetKode'] <> null
                then DM.StProc.ParamByName('KOD_FACUL_EDBO').AsString := MemoryData_EDBO['fUniversityFacultetKode']
                else DM.StProc.ParamByName('KOD_FACUL_EDBO').AsString := '';

               DM.StProc.ParamByName('HAND_MADE').AsInteger := Hand_made;

               cnWaitForm_progress.cxProgressBar1.Position := 2 + Round(21 * ((i+1)/MemoryData_EDBO.RecordCount));
               cnWaitForm_progress.Update;

               DM.StProc.ExecProc;
               MemoryData_EDBO.Next;
              end;
             MemoryData_EDBO.Close;

             cnWaitForm_progress.cxProgressBar1.Position := 23;
             cnWaitForm_progress.Update;

             DM.StProc.StoredProcName := 'CN_WEB_STACK_UPDATE';
             DM.StProc.Prepare;
             DM.StProc.ParamByName('number_table').AsInteger := 1;
             DM.StProc.ExecProc;

             try
              Dm.WriteTransaction.Commit;
              Synch_Facul := True;
             except
               on E:Exception do
                begin
                 DM.WriteTransaction.Rollback;
                 ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_FACUL_LINK_EDBO_LOAD!' + #13#10 + E.Message);
                end; 
             End;
             DM.StProc.Close;

             cnWaitForm_progress.cxProgressBar1.Position := 25;
             cnWaitForm_progress.Update;
          end;

          //специальность, форма, ОКР
          if ((set_synchEDBO.SynchEDBO_spec) or (set_synchEDBO.SynchEDBO_okr)) then
           begin

             //специальности вуза
             Id_PersonRequestSeasons := DM.DataSet['ID_SEASON'];
             EDBOGuidesIntf.InParams.Items['Id_PersonRequestSeasons'] := PInteger(@Id_PersonRequestSeasons);
             (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('UniversityFacultetSpecialitiesGet', MemoryData_EDBO);


             DM.WriteTransaction.StartTransaction;

             //очистели буфер
             DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_EDBO_BUFFER_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 27;
             cnWaitForm_progress.Update;

             //начали загружать все информацию
             DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_EDBO_BUFFER_INS';
             DM.StProc.Prepare;

             MemoryData_EDBO.Open;
             MemoryData_EDBO.First;
             For i := 0 to MemoryData_EDBO.RecordCount - 1 do
              Begin
               if MemoryData_EDBO['FSPECCODE'] <> null
                then DM.StProc.ParamByName('FSPECCODE').AsString := MemoryData_EDBO['FSPECCODE']
                else DM.StProc.ParamByName('FSPECCODE').AsString := '';

               if MemoryData_EDBO['FSPECCLASIFIERCODE'] <> null
                then DM.StProc.ParamByName('FSPECCLASIFIERCODE').AsString := MemoryData_EDBO['FSPECCLASIFIERCODE']
                else DM.StProc.ParamByName('FSPECCLASIFIERCODE').AsString := '';

               if MemoryData_EDBO['FSPECSPECIALITYCLASIFIERCODE'] <> null
                then DM.StProc.ParamByName('FSPECSPECIALITYCLASIFIERCODE').AsString := MemoryData_EDBO['FSPECSPECIALITYCLASIFIERCODE']
                else DM.StProc.ParamByName('FSPECSPECIALITYCLASIFIERCODE').AsString := '';

               if MemoryData_EDBO['FSPECDIRECTIONNAME'] <> null
                then DM.StProc.ParamByName('FSPECDIRECTIONNAME').AsString := MemoryData_EDBO['FSPECDIRECTIONNAME']
                else DM.StProc.ParamByName('FSPECDIRECTIONNAME').AsString := '';

               if MemoryData_EDBO['FSPECSPECIALITYNAME'] <> null
                then DM.StProc.ParamByName('FSPECSPECIALITYNAME').AsString := MemoryData_EDBO['FSPECSPECIALITYNAME']
                else DM.StProc.ParamByName('FSPECSPECIALITYNAME').AsString := '';

               if MemoryData_EDBO['FUNIVERSITYFACULTETKODE'] <> null
                then DM.StProc.ParamByName('FUNIVERSITYFACULTETKODE').AsString := MemoryData_EDBO['FUNIVERSITYFACULTETKODE']
                else DM.StProc.ParamByName('FUNIVERSITYFACULTETKODE').AsString := '';

               DM.StProc.ParamByName('FID_PERSONEDUCATIONFORM').AsInt64 := MemoryData_EDBO['FID_PERSONEDUCATIONFORM'];

               DM.StProc.ParamByName('FID_QUALIFICATION').AsInt64 := MemoryData_EDBO['FID_QUALIFICATION'];

               if MemoryData_EDBO['FPERSONEDUCATIONFORMNAME'] <> null
                then DM.StProc.ParamByName('FPERSONEDUCATIONFORMNAME').AsString := MemoryData_EDBO['FPERSONEDUCATIONFORMNAME']
                else DM.StProc.ParamByName('FPERSONEDUCATIONFORMNAME').AsString := '';

               if MemoryData_EDBO['FQUALIFICATIONNAME'] <> null
                then DM.StProc.ParamByName('FQUALIFICATIONNAME').AsString := MemoryData_EDBO['FQUALIFICATIONNAME']
                else DM.StProc.ParamByName('FQUALIFICATIONNAME').AsString := '';

               if MemoryData_EDBO['FSPECSPECIALIZATIONNAME'] <> null
                then DM.StProc.ParamByName('FSPECSPECIALIZATIONNAME').AsString := MemoryData_EDBO['FSPECSPECIALIZATIONNAME']
                else DM.StProc.ParamByName('FSPECSPECIALIZATIONNAME').AsString := '';

               if MemoryData_EDBO['FDURATIONEDUCATION'] <> null
                then DM.StProc.ParamByName('DURATIONEDUCATION').AsString := MemoryData_EDBO['FDURATIONEDUCATION']
                else DM.StProc.ParamByName('DURATIONEDUCATION').AsString := '';

               if MemoryData_EDBO['FISSECONDEDUCATION'] <> null
                then DM.StProc.ParamByName('IS_SECOND_EDUCATION').AsInteger := MemoryData_EDBO['FISSECONDEDUCATION']
                else DM.StProc.ParamByName('IS_SECOND_EDUCATION').AsInteger := 0;

               cnWaitForm_progress.cxProgressBar1.Position := 27 + Round(5*((i+1)/MemoryData_EDBO.RecordCount));
               cnWaitForm_progress.Update;

               DM.StProc.ExecProc;
               MemoryData_EDBO.Next;
              end;
             MemoryData_EDBO.Close;

             //все специальности
             MemoryData_EDBO.Open;
             (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('SpecGet', MemoryData_EDBO);

             //очистили буфер
             DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_ALL_EDBO_BUF_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 32;
             cnWaitForm_progress.Update;

             //начали записывать
             DM.StProc.Close;
             DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_ALL_EDBO_BUF_INS'; //проблема зависания приложения в этой процедуре
             DM.StProc.Prepare;

             MemoryData_EDBO.Open;
             MemoryData_EDBO.First;
             For i := 0 to MemoryData_EDBO.RecordCount - 1 do
              Begin
               if MemoryData_EDBO['fSpecDirectionName'] <> null
                then DM.StProc.ParamByName('fSpecDirectionName').AsString := MemoryData_EDBO['fSpecDirectionName']
                else DM.StProc.ParamByName('fSpecDirectionName').AsString := '';

               if MemoryData_EDBO['fSpecSpecializationName'] <> null
                then DM.StProc.ParamByName('fSpecSpecializationName').AsString := MemoryData_EDBO['fSpecSpecializationName']
                else DM.StProc.ParamByName('fSpecSpecializationName').AsString := '';

               if MemoryData_EDBO['fSpecCode'] <> null
                then DM.StProc.ParamByName('fSpecCode').AsString := MemoryData_EDBO['fSpecCode']
                else DM.StProc.ParamByName('fSpecCode').AsString := '';

               if MemoryData_EDBO['fSpecSpecialityName'] <> null
                then DM.StProc.ParamByName('fSpecSpecialityName').AsString := MemoryData_EDBO['fSpecSpecialityName']
                else DM.StProc.ParamByName('fSpecSpecialityName').AsString := '';

               DM.StProc.ParamByName('fid_Spec').AsInt64 := MemoryData_EDBO['fid_Spec'];

               cnWaitForm_progress.cxProgressBar1.Position := 32 + Round(6*((i+1)/MemoryData_EDBO.RecordCount));
               cnWaitForm_progress.Update;

               DM.StProc.ExecProc;
               MemoryData_EDBO.Next;
              end;
             MemoryData_EDBO.Close;

             //проверяем специальности
             //очистили стек
             DM.StProc.Close;
             DM.StProc.StoredProcName := 'CN_WEB_STACK_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 40;
             cnWaitForm_progress.Update;

             DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_LINK_EDBO_LOAD';
             DM.StProc.Prepare;
             DM.StProc.ParamByName('HAND_MADE').AsInteger := Hand_made;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 42;
             cnWaitForm_progress.Update;

             DM.StProc.StoredProcName := 'CN_WEB_STACK_UPDATE';
             DM.StProc.Prepare;
             DM.StProc.ParamByName('number_table').AsInteger := 2;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 44;
             cnWaitForm_progress.Update;

             //работаем с формами и ОКР

             //очистили стек
             DM.StProc.StoredProcName := 'CN_WEB_STACK_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 46;
             cnWaitForm_progress.Update;

             DM.StProc.StoredProcName := 'CN_WEB_SP_OKR_LINK_EDBO_LOAD';
             DM.StProc.Prepare;
             DM.StProc.ParamByName('HAND_MADE').AsInteger := Hand_made;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 48;
             cnWaitForm_progress.Update;

             DM.StProc.StoredProcName := 'CN_WEB_STACK_UPDATE';
             DM.StProc.Prepare;
             DM.StProc.ParamByName('number_table').AsInteger := 3;
             DM.StProc.ExecProc;

             
             //очистели буфер
             DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_EDBO_BUFFER_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;
             
             //очистили буфер
             DM.StProc.StoredProcName := 'CN_WEB_SP_SPEC_ALL_EDBO_BUF_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;

             try
              Dm.WriteTransaction.Commit;
              Synch_Spec := True;
             except
              on E:Exception do
               begin
                DM.WriteTransaction.Rollback;
                ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_SPEC_LINK_EDBO_LOAD!' + #13#10 + E.Message);
               End;
             end; 
             DM.StProc.Close;

             cnWaitForm_progress.cxProgressBar1.Position := 50;
             cnWaitForm_progress.Update; 
            end;

          //курс
          if set_synchEDBO.SynchEDBO_kurs then
           begin
             (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('CoursesGet', MemoryData_EDBO);

             DM.WriteTransaction.StartTransaction;

             DM.StProc.StoredProcName := 'CN_WEB_STACK_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 52;
             cnWaitForm_progress.Update;

             DM.StProc.StoredProcName := 'CN_WEB_SP_KURS_LINK_EDBO_LOAD';
             DM.StProc.Prepare;

             MemoryData_EDBO.Open;
             MemoryData_EDBO.First;
             For i := 0 to MemoryData_EDBO.RecordCount - 1 do
              Begin
               DM.StProc.ParamByName('id_kurs_edbo').AsString := MemoryData_EDBO['fid_course'];

               if MemoryData_EDBO['FCourseName'] <> null
                then DM.StProc.ParamByName('NAME_KURS_EDBO').AsString := MemoryData_EDBO['FCourseName']
                else DM.StProc.ParamByName('NAME_KURS_EDBO').AsString := '';

               DM.StProc.ParamByName('HAND_MADE').AsInteger := Hand_made;

               cnWaitForm_progress.cxProgressBar1.Position := 52 + round(23*((i+1)/MemoryData_EDBO.RecordCount));
               cnWaitForm_progress.Update;

               DM.StProc.ExecProc;
               MemoryData_EDBO.Next;
              end;
             MemoryData_EDBO.Close;

             DM.StProc.StoredProcName := 'CN_WEB_STACK_UPDATE';
             DM.StProc.Prepare;
             DM.StProc.ParamByName('number_table').AsInteger := 4;
             DM.StProc.ExecProc;

             try
              Dm.WriteTransaction.Commit;
              Synch_Kurs := True;
             except
              on E:Exception do
               begin
                DM.WriteTransaction.Rollback;
                ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_KURS_LINK_EDBO_LOAD!'+#13#10 + E.Message);
               End;
             End;

             DM.StProc.Close;

             cnWaitForm_progress.cxProgressBar1.Position := 75;
             cnWaitForm_progress.cxProgressBar1.Update;
            end;

           //группы
          if set_synchEDBO.SynchEDBO_group then
          begin
             (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('AcademicYearsGet',MemoryData_EDBO);

             DM.WriteTransaction.StartTransaction;

             Id_AcademicYear := DM.DataSet['Id_AcademicYear'];

             MemoryData_EDBO.Open;
             MemoryData_EDBO.First;
             For i := 0 to MemoryData_EDBO.RecordCount - 1 do
              begin
               if MemoryData_EDBO['facademicyearisactive'] = 1
                then Id_AcademicYear := MemoryData_EDBO['fid_academicyear'];
               MemoryData_EDBO.Next;
              end;
             MemoryData_EDBO.Close;

             cnWaitForm_progress.cxProgressBar1.Position := 77;
             cnWaitForm_progress.cxProgressBar1.Update;

             //загружаем формы обучения для групп
             (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationFormsGet',MemoryData_EDBO);


             DM.StProc.StoredProcName := 'CN_WEB_SP_FORM_STUD_ALL_INS';
             DM.StProc.Prepare;


             MemoryData_EDBO.Open;
             MemoryData_EDBO.First;
             For i := 0 to MemoryData_EDBO.RecordCount - 1 do
              Begin
               DM.StProc.ParamByName('id_form_stud_edbo').AsInt64 := MemoryData_EDBO['fid_personEducationForm'];

               if MemoryData_EDBO['fPersonEducationFormName'] <> null
                then DM.StProc.ParamByName('NAME_FORM_STUD_EDBO').AsString := MemoryData_EDBO['fPersonEducationFormName']
                else DM.StProc.ParamByName('NAME_FORM_STUD_EDBO').AsString := '';

               DM.StProc.ExecProc;
               MemoryData_EDBO.Next;
              end;
             MemoryData_EDBO.Close;

             //категории для групп
             (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('QualificationsGet',MemoryData_EDBO);


             DM.StProc.StoredProcName := 'CN_WEB_SP_KAT_STUD_ALL_INS';
             DM.StProc.Prepare;


             MemoryData_EDBO.Open;
             MemoryData_EDBO.First;
             For i := 0 to MemoryData_EDBO.RecordCount - 1 do
              Begin
               DM.StProc.ParamByName('id_kat_stud_edbo').AsInt64 := MemoryData_EDBO['fid_Qualification'];

               if MemoryData_EDBO['fQualificationName'] <> null
                then DM.StProc.ParamByName('NAME_KAT_STUD_EDBO').AsString := MemoryData_EDBO['fQualificationName']
                else DM.StProc.ParamByName('NAME_KAT_STUD_EDBO').AsString := '';

               DM.StProc.ExecProc;
               MemoryData_EDBO.Next;
              end;
             MemoryData_EDBO.Close;

             UniversityKode := DM.DataSet['KOD_UNIVERSITY']; //получить из EDBOGuides.UniversitiesGet

             EDBOPersonIntf.InParams.Items['UniversityKode']:=PAnsiString(@UniversityKode);
             EDBOPersonIntf.InParams.Items['Id_AcademicYear']:=PInteger(@Id_AcademicYear);
             (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsStudentsGrupsGet', MemoryData_EDBO);

             DM.StProc.StoredProcName := 'CN_WEB_STACK_DEL';
             DM.StProc.Prepare;
             DM.StProc.ExecProc;

             cnWaitForm_progress.cxProgressBar1.Position := 79;
             cnWaitForm_progress.Update;

             DM.StProc.StoredProcName := 'CN_WEB_SP_GROUP_LINK_EDBO_LOAD';
             DM.StProc.Prepare;

             MemoryData_EDBO.Open;
             MemoryData_EDBO.First;
             For i := 0 to MemoryData_EDBO.RecordCount - 1 do
              Begin
               DM.StProc.ParamByName('id_group_edbo').AsInt64 := MemoryData_EDBO['fid_UniversityGroup'];

               If MemoryData_EDBO['fUniversityFacultetKode'] <> null
                then DM.StProc.ParamByName('KOD_FACUL_EDBO').AsString := MemoryData_EDBO['FUniversityFacultetKode']
                else DM.StProc.ParamByName('KOD_FACUL_EDBO').AsString := '';

               If MemoryData_EDBO['fUniversityGroupFullName'] <> null
                then DM.StProc.ParamByName('NAME_GROUP_EDBO').AsString := MemoryData_EDBO['fUniversityGroupFullName']
                else DM.StProc.ParamByName('NAME_GROUP_EDBO').AsString := '';

               DM.StProc.ParamByName('fid_course').AsInt64 := MemoryData_EDBO['fid_course'];

               DM.StProc.ParamByName('fid_qualification').AsInt64 := MemoryData_EDBO['fid_qualification'];

               DM.StProc.ParamByName('fid_PersonEducationForm').AsInt64 := MemoryData_EDBO['fid_PersonEducationForm'];

               DM.StProc.ParamByName('HAND_MADE').AsInteger := Hand_made;

               cnWaitForm_progress.cxProgressBar1.Position := 79 + round(20*((i+1)/MemoryData_EDBO.RecordCount));
               cnWaitForm_progress.Update;

               DM.StProc.ExecProc;
               MemoryData_EDBO.Next;
              end;
             MemoryData_EDBO.Close;

             DM.StProc.StoredProcName := 'CN_WEB_STACK_UPDATE';
             DM.StProc.Prepare;
             DM.StProc.ParamByName('number_table').AsInteger := 5;
             DM.StProc.ExecProc;

             try
              Dm.WriteTransaction.Commit;
              Synch_Group := True;
             except
              on E:Exception do
               begin
                DM.WriteTransaction.Rollback;
                ShowMessage('Возникли ошибки при работе процедуры CN_WEB_SP_GROUP_LINK_EDBO_LOAD!'+#13#10+e.Message);
               end; 
             End;

             DM.StProc.Close;
             cnWaitForm_progress.cxProgressBar1.Position := 99;
             cnWaitForm_progress.cxProgressBar1.Update;   
            end;
        except
         on E:Exception do
          begin
           DM.WriteTransaction.Rollback;
           showmessage('Что то пошло не так!' + #13#10 + E.Message);
          end;
        end
       end; 
     End;
  end;

  if (Synch_Facul and Synch_Spec and Synch_Kurs and Synch_Group) then
   Begin
    DM.WriteTransaction.StartTransaction;
    DM.StProc.StoredProcName := 'CN_WEB_INI_UPD_DATE_SYNCHEDBO';
    DM.StProc.Prepare;
    DM.StProc.ExecProc;
    try
     DM.WriteTransaction.Commit;
    except
     on E:Exception do
      begin
       DM.WriteTransaction.Rollback;
       ShowMessage('Возникли ошибки при работе процедуры CN_WEB_INI_UPD_DATE_SYNCHEDBO!'+ #13#10 + E.Message);
      end; 
    end;
    DM.StProc.Close;
   end;
   
   cnWaitForm_progress.cxProgressBar1.Position := 100;
   cnWaitForm_progress.cxProgressBar1.Update;

   cnWaitForm_progress.Free;
  //Освобождаем ресурсы
  //DM.Free;
  if Assigned(EDBOGuidesIntf) then EDBOGuidesIntf.Destroy;
  if Assigned(EDBOPersonIntf) then EDBOPersonIntf.Destroy;
End;

end.
