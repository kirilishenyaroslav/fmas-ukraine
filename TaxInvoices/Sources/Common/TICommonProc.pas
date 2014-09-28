unit TiCommonProc;

interface

uses Forms, Windows, Registry, IBase, pFibStoredProc,
     TiStProcDM, Variants, SysUtils, TiMessages,
     Dialogs, IniFiles,TiCommonConsts,Winsock ;

function TiNameFirm(DB_Handle:TISC_DB_HANDLE;FieldName:string='NAME_FULL'):variant;
function GetConst(ConstName:string;ConstType:string):string;
function TiDesignReport:boolean;
function CurrentKodSetup(DB_Handle:TISC_DB_HANDLE):integer;
function TiGetCompName: string;
function TiGetIPAddress: string;
function LanguageIndex:byte;
function GetMonthList:string;
function GetMonthList2:string; //для номенклатуры поставки
function GetFullName(DB_Handle:TISC_DB_HANDLE;short_name: string):string;

const tcButton = 'Button';
const tcLabel = 'Label';
const tcTabSheet = 'TabSheet';
const tcGridColumn = 'GridColumn';
const tcRadioButton = 'RadioButton';
const tcGroupBox = 'GroupBox';
const tcCheckBox = 'CheckBox';
const tcForm = 'Form';
const tcOtherConst = 'OtherConsts';

implementation

function GetConst(ConstName:string;ConstType:string):string;
var IniFile:TIniFile;
    IniFilePath:string;
begin
    IniFilePath:='TaxInvoices\Ukrainian.lng';

    if FileExists(ExtractFilePath(Application.ExeName)+IniFilePath) then
    begin
       IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+IniFilePath);
       Result := IniFile.ReadString(ConstType,ConstName,ConstName);
       IniFile.Destroy;
    end
    else Result := ConstName;
end;

function TiNameFirm(DB_Handle:TISC_DB_HANDLE;FieldName:string='NAME_FULL'):variant;
var DM:TStProcDM;
begin
 Result:=NULL;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_GET_SYSDATA_NAMEFIRM';
   Prepare;
   ExecProc;
   Result := ParamByName(FieldName).AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     TiShowMessage(GetConst('Caption','Error'),e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
end;

function TiDesignReport:boolean;
var Registry:TRegistry;
begin
 Result:=False;
 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  Result:=Registry.OpenKey('\Software\Grant\DesignReport\',False);
 finally
  Registry.Free;
 end;
end;

function CurrentKodSetup(DB_Handle:TISC_DB_HANDLE):integer;
var DM:TStProcDM;
    res:integer;
begin
 Res:=0;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_KOD_SETUP_RETURN';
   Prepare;
   ExecProc;
   Res := ParamByName('KOD_SETUP').AsInteger;
   Transaction.Commit;
  except
   on E:exception do
    begin
     TiShowMessage(GetConst('Caption','Error'),e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;
function TiGetCompName: string;
var
    s: string;
    sLen: Longword;
begin
    SetLength(s, 255);
    sLen := 255;
    GetHostName(@s[1], sLen);
    Result := Trim(StrPas(PAnsiChar(s)));
end;

function TiGetIPAddress: string;
var
    wVerReq: WORD;
    wsaData: TWSAData;
    i: pchar;
    h: PHostEnt;
    c: array[0..128] of char;
begin
    wVerReq := MAKEWORD(1, 1);
    WSAStartup(wVerReq, wsaData);
    GetHostName(@c, 128);
    h := GetHostByName(@c);
    i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
    Result := i; //O
    WSACleanup;
end;

function LanguageIndex:byte;
begin
 Result:=1;
end;

function GetMonthList:string;
begin
 result := GetConst('MonthJanuary',tcOtherConst)+#13+
           GetConst('MonthFebruary',tcOtherConst)+#13+
           GetConst('MonthMarch',tcOtherConst)+#13+
           GetConst('MonthApril',tcOtherConst)+#13+
           GetConst('MonthMay',tcOtherConst)+#13+
           GetConst('MonthJune',tcOtherConst)+#13+
           GetConst('MonthJuly',tcOtherConst)+#13+
           GetConst('MonthAutumn',tcOtherConst)+#13+
           GetConst('MonthSeptember',tcOtherConst)+#13+
           GetConst('MonthOctober',tcOtherConst)+#13+
           GetConst('MonthNovember',tcOtherConst)+#13+
           GetConst('MonthDecember',tcOtherConst);
end;

function GetMonthList2:string;
begin
 result := GetConst('MonthJanuary2',tcOtherConst)+#13+
           GetConst('MonthFebruary2',tcOtherConst)+#13+
           GetConst('MonthMarch2',tcOtherConst)+#13+
           GetConst('MonthApril2',tcOtherConst)+#13+
           GetConst('MonthMay2',tcOtherConst)+#13+
           GetConst('MonthJune2',tcOtherConst)+#13+
           GetConst('MonthJuly2',tcOtherConst)+#13+
           GetConst('MonthAutumn2',tcOtherConst)+#13+
           GetConst('MonthSeptember2',tcOtherConst)+#13+
           GetConst('MonthOctober2',tcOtherConst)+#13+
           GetConst('MonthNovember2',tcOtherConst)+#13+
           GetConst('MonthDecember2',tcOtherConst);
end;

function GetFullName(DB_Handle:TISC_DB_HANDLE;short_name: string):string;
var
  DM:TStProcDM;
  i : Integer;
  short_name_abbreviature : string;
  full_name_customer      : string;
  long_name_abbreviature  : string;
  p :Integer;
begin
  Result := '';
  DM := TStProcDM.Create(Application);
  DM.DB.Handle := DB_Handle;
  DM.AbbreviatureDSet.Close;
  DM.AbbreviatureDSet.SelectSQL.Text := 'select * from TI_SP_ABBREVIATIONS';
  DM.AbbreviatureDSet.Open;
  DM.AbbreviatureDSet.FetchAll;
  DM.AbbreviatureDSet.First;
  //ShowMessage(IntToStr(TaxInvoicesEditDM.AbbreviatureDSet.RecordCount));
  for i:=1 to DM.AbbreviatureDSet.RecordCount do
  begin
   short_name_abbreviature := DM.AbbreviatureDSet['short_name'];
   long_name_abbreviature  := DM.AbbreviatureDSet['long_name'];

   if Pos(short_name_abbreviature,short_name)<>0 then
   begin
     p :=Pos(short_name_abbreviature,short_name);
     if (p=1) then      //если стоит в начале строки
     begin
       if(short_name[p+Length(short_name_abbreviature)] = ' ') then
       begin
         Delete(short_name,1,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,p);
       end;
     end;

     if (p = (Length(short_name) - Length(short_name_abbreviature)+1)) then   //в конце строки
     begin
       if(short_name[p-1] = ' ') then
       begin
         Delete(short_name,p,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,1);
       end;
     end;


     if ((p<>1) and (p <> (Length(short_name) - Length(short_name_abbreviature)+1))) then  //если в середине
     begin
      if((short_name[p-1] = ' ') and (short_name[p+Length(short_name_abbreviature)] = ' '))then
       begin
         Delete(short_name,p,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,p);
       end;
     end;
   end;
   DM.AbbreviatureDSet.Next;
  end;
  full_name_customer := short_name;
  Result             := full_name_customer;
end;
end.

