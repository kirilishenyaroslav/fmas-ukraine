unit st_common_funcs;

interface

uses Classes, cxGridTableView, st_Common_Types, pFIBDataSet, Forms,
     pFIBDatabase, SysUtils, Windows, Registry, st_Common_DM,
     st_Common_GridStyles, cxTextEdit, st_ConstUnit, cxCalendar, cxButtonEdit,
     Variants, inifiles, uPwdDecrypt, AccMGMT, iBase, st_common_sql_monitor,
     st_common_Mail, st_Consts_Messages, Dialogs, ShellAPI;

function  stLanguageIndex:byte;
function  GridStyle(AOwner:TComponent):TcxGridTableViewStyleSheet;
function  UpperCaseRusUkr(const S: string): string;
function  stGetKeyBoardState(Key : Word): boolean; // 0 - ????, 1 - ???
function  IsMDIChildFormShow(AClass:TClass):boolean;
function  IntegerCheck(const s : string) : boolean;
function  FloatCheck(const s : string) : boolean;
function  AcademicYear(CurrentServerDate:TDateTime): TstAcademicYear;
function  AcademicYearCompare(CurrentServerDate:TDateTime; CompareMonth : byte): TstAcademicYear;
function  ExtractAcademicYears(DateBeg:TDateTime; DateEnd:TDateTime ): TstExAcademicYear;
function  ExtractNumYear(DateBeg:TDateTime; DateEnd:TDateTime; Separator: string ): string;
function  StringPrepareToQueryText(AText:string):string;
function  PercentOfNumber(FullNumber : integer; PercentNumber : integer): string;
function  GetCodeBudjet (ReadDataSet: TpFibDataSet; Id_pk : int64; StProcName: string; OutParamName: string; SecondParam: string) : variant;
function  CheckControls(ViewForm : TForm; PLanguageIndex : byte): boolean;
function  GetStCalc(AParams : TstCalcIn) : TstCalcOut;
function  GetStPay (AParams : TstPayIn) : TstPayOut;
procedure LanguageSwitch;
procedure LogException;
procedure DoAnnulContract (AParams : TstAnnulContractIn) ;
procedure ReadIniFileImage (DB : TpFIBDataBase);
function  StringPrepareToApostrofText(AText:string):string;
Function  CheckPermission(Path:string;Action: String):byte;
procedure start_sql_monitor;
function  stop_sql_monitor : string;
procedure Send_mail(Text : String); 
procedure Load_Help(aOwner : TComponent; aDB_handle : TISC_DB_HANDLE; name_object : string);



implementation

uses st_Common_Messages;

const LogName : string = '\st_errors.log';

// ????????? ?????????? ???-????? ?????? ? ??????????
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

// ????? mdi-???? ????????? ??????
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

// ???????????? ????????? ?????????? (???, ???, ????)
procedure LanguageSwitch;
  var
    Layout: array[0.. KL_NAMELENGTH] of char;
  begin
    case stLanguageIndex() of
      1: LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
      2: LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
    else
         LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
    end;
  end;

// ?????? ???????? ???????? ???????????? ??????? ?? ???????
function stLanguageIndex:byte;
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

// ?????????????? ?????? ? ???????? ????????
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
        if (Ch >= '?') and (Ch <= '?') then Dec(Ch, 32);
        if Ch = '?' then Ch := '?';
        if Ch = '?' then Ch := '?';
        if Ch = '?' then Ch := '?';
        Dest^ := Ch;
        Inc(Source);
        Inc(Dest);
        Dec(L);
      end;
end;

// ???????? ????? ??? ?????
function GridStyle(AOwner:TComponent):TcxGridTableViewStyleSheet;
var
    DM:TDM_st_Styles;
begin
  DM := TDM_st_Styles.Create(AOwner);
  Result := DM.GridTableViewStyleSheetDevExpress;
  DM.GridTableViewStyleSheetDevExpress := nil;
  DM.Free;
end;

// ???????? ????????? ??????? ??????????
function  stGetKeyBoardState(Key : Word): boolean; // 0 - ????, 1 - ???
 var
   KState: TKeyboardState;
 begin
   Result:=false;
   GetKeyboardState(KState);
   if Odd(KState[Key]) then
   Result := true; //??????? "????????"
 end;



 // MathPack ---------------------------------------------

// ???????? ?????? ?? ??? Integer
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

// ???????? ?????? ?? ??? Float
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

// ?????????? ?? ???????? ???? ?????????????? ????
function AcademicYear(CurrentServerDate:TDateTime): TstAcademicYear;
var
    Now_Year, Now_Month, Now_Day: Word;
    End_Year, End_Month, End_Day: Word;
    stAcademicYear: TstAcademicYear;
begin
  DecodeDate(CurrentServerDate,Now_Year,Now_Month,Now_Day);
  End_Day:=1;
  End_Month:=7;
  If Now_Month >=7 then
   begin
    Now_Month := 9;
    Now_Day:=1;
    End_Year := Now_Year+1;
    stAcademicYear.Date_Beg :=EncodeDate(Now_Year,Now_Month,Now_Day);
    stAcademicYear.Date_End :=EncodeDate(End_Year,End_Month,End_Day);
   end
  else
   begin
    End_Year := Now_Year;
    Now_Month := 9;
    Now_Day:=1;
    stAcademicYear.Date_Beg :=EncodeDate(Now_Year-1,Now_Month,Now_Day);
    stAcademicYear.Date_End :=EncodeDate(End_Year,End_Month,End_Day);
   end;
  AcademicYear:= stAcademicYear;
end;

// ?????????? ??????? ????????????? ??? ?? ????????? ????????? ???
function ExtractAcademicYears(DateBeg:TDateTime; DateEnd:TDateTime ): TstExAcademicYear;
var
    Now_Year, Now_Month, Now_Day : Word;
    stAcademicYear               : TstAcademicYear;
    stAYArray                    : TstExAcademicYear;
    EndDateCurrentAY             : TDateTime;
    i                            : integer;
begin
  SetLength(stAYArray, 1);
  EndDateCurrentAY := DateBeg;
  i := 1;
  stAcademicYear := AcademicYear(DateBeg);
  stAYArray[0].Date_Beg:= stAcademicYear.Date_Beg;
  stAYArray[0].Date_End:= stAcademicYear.Date_End;
  EndDateCurrentAY:= stAYArray[0].Date_End;

  DecodeDate(EndDateCurrentAY,Now_Year,Now_Month,Now_Day);
  EndDateCurrentAY:=EncodeDate(Now_Year,Now_Month+2,Now_Day);

  while DateEnd > EndDateCurrentAY do
   begin
    stAcademicYear := AcademicYear(EndDateCurrentAY);

    SetLength(stAYArray, Length(stAYArray)+1 );
    stAYArray[i].Date_Beg:= stAcademicYear.Date_Beg;
    stAYArray[i].Date_End:= stAcademicYear.Date_End;

    EndDateCurrentAY:= stAYArray[i].Date_End;

    DecodeDate(EndDateCurrentAY, Now_Year, Now_Month, Now_Day);
    EndDateCurrentAY:=EncodeDate(Now_Year, Now_Month + 2, Now_Day);

    i:= i+1;
   end;
  Result := stAYArray;
end;

// ?????????? ?????? ???? ?? ???????? ????? ????????? ??????? ('2005/2006')
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

// ????????? ?????? ? ???????
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


// ????????? ?????? ? ???????
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

// ?????????? ?? ???????? ???? ?????????????? ???? ?? ?????????? ? ??????? ????
function AcademicYearCompare(CurrentServerDate:TDateTime; CompareMonth : byte): TstAcademicYear;
var
    EndAc_Year, EndAc_Month, EndAc_Day: Word;
    stAcademicYear: TstAcademicYear;
begin
 // ???????? ?????? ???
 stAcademicYear:= AcademicYear(CurrentServerDate);
 // ???????????? ?? ????? ???? ????????? ?? ????
 DecodeDate(stAcademicYear.Date_End, EndAc_Year,EndAc_Month,EndAc_Day);
 // ???????????? ? ???? ????? ????? ????????? - ???????
 stAcademicYear.Date_End := EncodeDate( EndAc_Year,CompareMonth,EndAc_Day);
 // ???????? ?? ??????????
 if CurrentServerDate < stAcademicYear.Date_End then
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
var
  i    : integer;
  flag : boolean;
begin
  flag := False;
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
       MessageBox(Handle,PChar(st_Some_Need[PLanguageIndex]),PChar(st_Error_Caption [PLanguageIndex]),MB_OK or MB_ICONERROR);
       Result:= true; // error exists
      end
     else
      begin
       Result:= false; // error's not exists
      end;
   end;
end;

function  GetstCalc(AParams : TstCalcIn) : TstCalcOut;
 var DM: TDM_st_Common;
     StCalcOut : TstCalcOut;
begin
  DM:=TDM_st_Common.Create(AParams.Owner);
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
           stCalcOut.CN_SNEED   := ParamByName('CN_SNEED').AsCurrency;      //  ?????, ??????????? ??? ?????? ?? ???? ??????
           stCalcOut.CNDATEOPL  := ParamByName('CNDATEOPL').AsDateTime;   // ????, ?? ??????? ????????
           stCalcOut.CN_SNEEDL  := ParamByName('CN_SNEEDL').AsCurrency;
           stCalcOut.ID_SESSION := ParamByName('ID_SESSION').AsInt64;
        Transaction.Commit;
        Close;
         Result:= stCalcOut;
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
      ParamByName('ID_SESSION').AsInt64 := stCalcOut.ID_SESSION;
      ExecProc;
      Transaction.Commit;
      Close;
   end;
   DM.Free;
end;


function  GetstPay (AParams : TstPayIn) : TstPayOut;
 var DM: TDM_st_Common;
     stPayOut : TstPayOut;
begin
  DM:=TDM_st_Common.Create(AParams.Owner);
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
           stPayOut.SUMMA_ALL   := ParamByName('SUMMA_ALL') .AsCurrency;
           stPayOut.CNUPLSUM    := ParamByName('CNUPLSUM')  .AsCurrency;
           stPayOut.CNSUMDOC    := ParamByName('CNSUMDOC')  .AsCurrency;
           stPayOut.CNINSOST    := ParamByName('CNINSOST')  .AsCurrency;
           stPayOut.ID_SESSION  := ParamByName('ID_SESSION').AsInt64;
        Transaction.Commit;
        Close;
         Result:= stPayOut;
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
      ParamByName('ID_SESSION').AsInt64 := stPayOut.ID_SESSION;
      ExecProc;
      Transaction.Commit;
      Close;
   end;
   DM.Free;
end;


procedure  DoAnnulContract (AParams : TstAnnulContractIn) ;
 var DM: TDM_st_Common;
begin
  DM:=TDM_st_Common.Create(AParams.Owner);
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
     MessageBox(Application.Handle,'???????? ????????? ??????????','???????', MB_OK +MB_ICONERROR);
   end;
end;

Function CheckPermission(Path:string;Action: String):byte;
Begin
 Result:=fibCheckPermission(Path,Action);
End;


procedure start_sql_monitor;
Begin
 st_common_sql_monitor.start;
end;

function  stop_sql_monitor : string;
Begin
 result := st_common_sql_monitor.get_result;
end;

procedure Send_mail(Text : String);
Begin
 st_common_Mail.Send_mail(Text + ' ' + st_common_sql_monitor.get_result);
end;

procedure Load_Help(aOwner : TComponent; aDB_handle : TISC_DB_HANDLE; name_object : string);
var
  FileName : String;
  FullName : PAnsiChar;
  DM: TDM_st_Common;
begin
  DM := TDM_st_Common.Create(aOwner);
  DM.DB.Handle := aDB_handle;
  DM.ReadTransaction.StartTransaction;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from pub_sp_help where name_object = :object and name_system = :system';
  DM.DataSet.ParamByName('object').AsString := name_object;
  DM.DataSet.ParamByName('system').AsString := 'studcity';
  DM.DataSet.Open;


  If DM.DataSet.RecordCount = 0 then
   begin
    stShowMessage('Help not found',
                  'Help not Found' + #13 + st_Consts_Messages.st_GoToAdmin[stLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
    DM.Free;
   end;

  FileName := DM.DataSet.FieldByName('NAME_FILE').AsString;
  FullName := PChar(ExtractFilePath(Application.ExeName) + 'Help\Studcity\' + FileName);
  if not FileExists(FullName) then
   Begin
    stShowMessage('File not found',
                   FullName + #13 + st_Consts_Messages.st_GoToAdmin[stLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
    DM.Free;
   end;

  ShellExecute(Application.Handle, 'open', FullName, nil, nil, SW_SHOWNORMAL);
  
  DM.Free;
End;  


end.
