unit Un_lo_file_Alex;

interface

uses Forms, Windows, IBase, Dialogs, SysUtils, Variants, Classes, Controls, pFIBDataBase;

type
 TD = record
  kod_dog         : Variant;
  id_dog          : Variant;
  id_tip_dog      : Variant;
  name_tip_dog    : Variant;
  n_dog           : Variant;
  d_dog           : Variant;
  nomn_dog        : Variant;
  nomd_dog        : Variant;
  id_customer     : Variant;
  name_customer   : Variant;
  id_rate_acc     : Variant;
  rate_acc        : Variant;
  mfo             : Variant;
  bank            : Variant;
  id_rate_acc_nat : Variant;
  IDSmeta         : Variant;
  IDRazd          : Variant;
  IDStat          : Variant;
  id_Kekv         : Variant;
  Summa           : double;
  NSumma          : double;
  nameSmeta       : string[180];
  nameRazd        : string[180];
  nameState       : string[180];
  nameKekv        : string[180];
  kodSmeta        : integer;
  kodRazd         : integer;
  kodState        : integer;
  kodKekv         : integer;
  id_kor_sch      : int64;
  kod_kor_sch     : string;
  title_kor_sch   : string;
  block_debet     : integer;
  block_kredit    : integer;
  block_saldo     : integer;
  is_valuta       : Integer;
  id_valuta       : Integer;
  name_valuta     : string;
 end;

 TDRes = record
  ModalResult     : integer;
  res : array of TD;
 end;

 TAlexDogInput = record
  Owner      : TComponent;
  DBHandle   : TISC_DB_HANDLE;
  WriteTrans : TISC_TR_HANDLE;
  ReadTrans  : TISC_TR_HANDLE;
  FormStyle  : TFormStyle;
  //--------------------------
  Summa       : Currency;
  id_TypeDog  : integer;
  id_Group    : integer;
  id_Group_add: integer;
  id_Customer : integer;
  MFO         : string;
  RateAcc     : string;
  DateSys     : TDate;
  NumDoc      : string;
  DateDoc     : TDate;
  id_dog      : integer;
 end;

 TAlexDogSmeta = record
  NumSmeta : integer;
  NumRazd  : integer;
  NumStat  : integer;
  NumKekv  : integer;
  Summa    : currency;
  NSumma   : currency;
  id_people: integer;
  tn       : string[20];
  kod_payer: string[20];
 end;

 TAlexDogResult = record
  ModalResult     : integer;
  kod_dog         : Variant;
  id_dog          : Variant;
  id_tip_dog      : Variant;
  name_tip_dog    : Variant;
  n_dog           : Variant;
  d_dog           : Variant;
  nomn_dog        : Variant;
  nomd_dog        : Variant;
  id_customer     : Variant;
  name_customer   : Variant;
  id_rate_acc     : Variant;
  rate_acc        : Variant;
  mfo             : Variant;
  bank            : Variant;
  id_rate_acc_nat : Variant;
  date_beg        : Variant;
  date_end        : Variant;
  summa           : Variant;
  continue        : Variant;
  not_summa       : Variant;
  close           : Variant;
  dog_note        : Variant;
  fio_donnu       : Variant;
  fio_postav      : Variant;
  krit_date       : Variant;
  nds_sum         : Variant;
  nds_pay         : Variant;
  sum_fulfil      : Variant;
  sum_pay         : Variant;
  sum_today       : Variant;
  before_pay      : Variant;
  before_prcn     : Variant;
  regest_num      : Variant;
  comment         : Variant;
  name_shablon    : Variant;
  Smets           : array of TAlexDogSmeta;
  handle          : THandle;
 end;

type TBankSimpleParam = class(TObject)
  public
    DB_Handle:TISC_DB_HANDLE;
    Owner:TComponent;
    KodSetup:variant;
    id:variant;
    formstyle : TFormStyle;
end;

type TcnParamsToPakages = record
  ID_DOG_ROOT : int64;
  ID_DOG      : int64;
  ID_STUD     : int64;
  ID_RATE_ACCOUNT : int64;
  ID_DOC      : int64;
  FIO         : String;
  Num_Doc     : String;
  Note        : String;
  DATE_DOG    : TDateTime;
  Summa       : Currency;
  IsWithSumma : Boolean;
  DissDownAllContract : boolean;
  Is_collect  : byte;
  IsUpload    : Boolean; // признак переоформления договора
  Is_Admin    : Boolean;  //Признак админестратора
  BarCode     : String;
end;

Type TcnSimpleParamss = class
 public
  Owner: TComponent;
  Db_Handle: TISC_DB_HANDLE;
  Formstyle: TFormStyle;
  WaitPakageOwner : TForm;
  //SMode  : TSelectMode;
  //AMode  : TActionMode;
  ID_SESSION: Int64;
  Type_Report:Integer;
  Sql_Master,Sql_Detail,Report_Name:String;
  FieldView,NotFieldView,FieldNameReport:Variant;
  LastIgnor:Integer;
  Date_beg,Date_end:TDateTime;
  ID_User : Int64;
  User_Name: string;
  ID_Locate : int64;
  ID_Locate_1 : int64;
  ID_Locate_2 : int64;
  DontShowGroups : boolean;
  DontShowFacs : boolean;
  ID_PRICE: Int64;
  is_admin: boolean;   //признак админа
  is_debug : boolean;  //признак редактирования отчета
  CN_USE_EDBO_FIZ_LIC : Integer; //использовать ли справочник физических лиц ЕДБО - 1 или наш - 0
end;

type TcnSimpleParamsExs = class(TcnSimpleParamss)
 public
  cnParamsToPakage : TcnParamsToPakages;
  ReturnMode : string; // Single, Multy
  // для рапортов
  TypeDoc    : byte; // 1-отчисление, 2-восстановление
  TR_Handle  : TISC_TR_HANDLE;
 end;

  TResBankSPProc = procedure (id : int64; dd : HWND) of object;

    TMyRegim = (MMulty, MSingle);
    TMVibor = (MGroup, MTovar, MGroupAndtovar);
    TModeDog = (MultyDog, SingleDog);


resourcestring
     ErrorLLibrary   =           'Внимание, ошибка при работе с библиотекой ';
     ErrorWarningC   =           'Внимание ошибка!';

const   MY_KASSA      ='Kassa\';
const   MY_People     ='SpAllPeople.bpl';
const   AVANCE_PATH   ='Avance\';
const   Bank          ='Bank\';
const   Path_ClBank   ='ClBank\';

const Name_ConfigClBank ='ConfigClBank.bpl';
const Name_RunClBank    ='RunClBank.bpl';
const Name_ViewClBank   ='ViewClBank.bpl';
const Name_AddDocClBank ='AddDocClBank.bpl';
const BankValuta_Const :array [1..2] of string=('Bank\BankValuta.bpl','View_BankValuta');
const BankSchValuta_Const :array [1..2] of string=('Bank\BankSchValuta.bpl','View_BankSchValuta');

//загрузка стандартных пакетов из банка
function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;

//работа с кассовыми днями
function LKassaDayShow(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
function LKassaDayEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;

//Работа с кассами и счетами системы 'Касса'
function LSpSchSystemKassa(AOwner:TComponent; id_user: int64; DB :TpFIBDatabase): integer;stdcall;

//работа с кассовыми ордерами
function LKassaDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;stdcall;
function LKassaDocEdit(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;stdcall;
function LHistoryInfoShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_doc : int64):Integer;stdcall;

//работа с кассовыми шаблонами

//function LSpOperetionKassa(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase): integer;stdcall;
function LEditOperetionKassa(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase):Integer;stdcall;
function LSpEditSpOperetionKassa(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase):Variant;stdcall;

//  Касса   загрузка поиска кассовых ордеров
function LoadKassaShowFindOrder(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;stdcall;
//Касса   показ удаленных ордеров
function LKassaShowDelete(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;

//rabota so vstrechnimi provodkami
function LErVstrechProvs(AOwner:TComponent; id_user: int64; DB: TpFIBDatabase; id_form_uch : integer; id_sch : int64; date_beg_per : TDate):Integer;stdcall;

function MY_GetManEx(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;stdcall;
function NEW_GMEx(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; MultiSelect : Boolean=False; CanEdit : Boolean=False; Id_Man:Integer=-1) : Variant; stdcall;
function MY_GetManExAo(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; Date_Beg: TDate; Date_End: TDate;MultiSelect:Boolean=False;CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;stdcall;



function LoadSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
function LoadEditSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
function LoadSpEditSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;

function LoadSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
function LoadEditSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
function LoadSpEditSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;

{Avance Otchet}
function AvanceShowLoad(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;

//Работа со справочником действующих счетов системы
function LoadSpSchSystem(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;

// Авансовый отчет  загрузка поиска кассовых ордеров
function LoadAvanceShowFindOrder(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;


function LoadAvanceShowReestr(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;

// Авансовый отчет  справочник остатков
function LShowOstatkiAvance(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; regim : TMyRegim; vibor : TMVibor; posicirovanie : int64): Integer;


//загрызка банковского дня
//function LKassaDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;stdcall;
function LBankDayEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;STDCALL;

//работа с банковскими ордерами
function LBankDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):Integer;stdcall;
function LBankDocEdit(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):Integer;stdcall;

function LBankShowFindOrder(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;

function LBankShowAnalyzErrorProvs(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;

function LSelectMyltyDog(AOwner:TComponent; id_us: int64; DB : TpFIBDatabase; n : TModeDog; Input : TDRes; All_summa : double) : TDRes;stdcall;

function LDogMain(input_params : TAlexDogInput) : TAlexDogResult;

function LAvanceShowOborot(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : integer; stdcall;
function LAvanceShowOborotNew(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : integer; stdcall;


//загрузка, для работы с клиент-банком
function LEditDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant; id_valuta : Integer; name_valuta : string):Integer;
function LClonDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
function LViewDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
function LAddDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_native:int64;DateDoc:TDateTime;id_valuta : Integer; name_valuta : string):Integer;
function LDelDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;

function LoadNastroyka(AOwner: TComponent; id_us: int64; Handle: TISC_DB_HANDLE) : Integer; stdcall;

function LoadKassaSys(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; m : Smallint; regim : integer) : Variant; stdcall;

function LShow_Neosnov(AO : TComponent; d : TpfibDatabase; style : TFormStyle; dd : Tdate) : Variant; stdcall;

function LShowBankServicePereschet(AO : tcomponent; D : Tpfibdatabase; id : int64) : integer; stdcall;

function LShow_Bank_nastroyka(AO : tcomponent; D : Tpfibdatabase; id : int64) : integer; stdcall;

function LShow_Bank_nastroyka_tranz(AO : tcomponent; D : Tpfibdatabase; id : int64) : integer; stdcall;

function LShow_Bank_nastroyka_invoice(AO : tcomponent; D : Tpfibdatabase; id : int64) : integer; stdcall;

function LoadJNastroyka(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : Integer; stdcall;

function LBankProsmotrNeobr(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_szyazka : int64; rs, name_rs, sch, name_sch : string):Integer; stdcall;

function LShowKassaAnalitRes(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):integer; stdcall;

function LBank_sp_sch (AOwner: TComponent; db : Tpfibdatabase; id_sch, id_ras, id_sv : int64; d1, d2 : TDate; ST : TResBankSPProc) : integer; stdcall;

function LShowMemorialBank (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;

function LShowMemorialAvance (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;

function LShowMemorialZvedAvance (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;

Function LShowInsertOstatokBank(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase) : Integer; stdcall;

function LAvanceVedomost(AOwner : TComponent; id_user : int64; DB : TpFIBDatabase) : Integer; stdcall;

function  RunFunctionFromPackage(AParameter:TBankSimpleParam;Bpl_Name:string;Func_Name:string):variant;

function  RunFunctionFromPackageForKassa(AParameter:TcnSimpleParamsExs;Bpl_Name:string;Func_Name:string):variant;

procedure LCreateVedomost_3_2(AO : TComponent; DB : TpFibDataBase; id_sch, id_system : int64; date_month : TDate); stdcall;

var
    x : function(A : TComponent; D : TISC_DB_HANDLE; M : Boolean=False; C : Boolean=False; I:Integer=-1) : Variant; stdcall;

implementation

function RunFunctionFromPackage(AParameter:TBankSimpleParam;Bpl_Name:string;Func_Name:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TBankSimpleParam):Variant;stdcall;
  Res:Variant;
  wf:TForm;
  PLanguageIndex:Byte;
begin

  HandlePack:=GetModuleHandle(PChar(Bpl_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      //if Assigned(AParameter.Db_Handle) then ShowMessage('Handle in LoadFromPackage');
      //wf:=ShowWaitForm(AParameter.WaitPakageOwner,wfLoadPackage);
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Name);
   finally
      //CloseWaitForm(wf);
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AParameter);
  end
  else
   begin
           ShowMessage('Виникла помилка під час загрузки пакету '+#13+Bpl_Name);
           Res:=NULL;
   end;
  Result:=Res;
end;


function RunFunctionFromPackageForKassa(AParameter:TcnSimpleParamsExs;Bpl_Name:string;Func_Name:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TcnSimpleParamsExs):Variant;stdcall;
  Res:Variant;
  wf:TForm;
  PLanguageIndex:Byte;
begin

  HandlePack:=GetModuleHandle(PChar(Bpl_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      //if Assigned(AParameter.Db_Handle) then ShowMessage('Handle in LoadFromPackage');
      //wf:=ShowWaitForm(AParameter.WaitPakageOwner,wfLoadPackage);
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Name);
   finally
      //CloseWaitForm(wf);
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AParameter);
  end
  else
   begin
           ShowMessage('Виникла помилка під час загрузки пакету '+#13+Bpl_Name);
           Res:=NULL;
   end;
  Result:=Res;
end;

function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TObject):Variant;stdcall;
  wf:TForm;
  Res:Variant;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32 then
    try
      //wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl[0]);
    finally
      Screen.Cursor:=crDefault;
      //CloseWaitForm(wf);
    end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
    if @MDIFUNC<>nil then
      Result:=MDIFUNC(AParameter);
  end
  else
  begin
    ShowMessage('Виникла помилка під час загрузки пакету '+#13+Bpl[0]);
    Result:=NULL;
  end;
end;


function LEditOperetionKassa(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase): integer;stdcall;
var func:function(AOwner:TComponent; id_user : int64; DB: TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('SpOperationSys.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'SpOperationSys.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('EditOperetionKassa'));
            if @func<>nil
            then func(AOwner, id_user, DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'SpOperationSys.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
  end;
  LEditOperetionKassa := -1;
end;

function LSpEditSpOperetionKassa(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase) : Variant;stdcall;
var func:function(AOwner:TComponent; id_user : int64; DB: TpFIBDatabase) : Variant; stdcall;
    HandlePack : HModule;
    Res : Variant;
begin
  HandlePack := GetModuleHandle('SpOperationSys.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'SpOperationSys.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpEditSpOperetionKassa'));
            if @func<>nil
            then res := func(AOwner, id_user, DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'SpOperationSys.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LSpEditSpOperetionKassa := res;
end;

function LKassaDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;stdcall;
var func:function(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):integer; stdcall;
    HandlePack: HModule;
    res : integer;
begin
  HandlePack := GetModuleHandle('KassaDocBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaDocBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('KassaDocShow'));
            if @func<>nil
            then res := func(AOwner, id_us, DB, id_kass, id_day, id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'KassaDocBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;

  LKassaDocShow := res;
END;

function LKassaDocEdit(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):Integer;stdcall;
var func:function(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64):integer; stdcall;
    HandlePack: HModule;
    res : integer;
begin
  HandlePack := GetModuleHandle('KassaDocBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaDocBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('KassaDocEdit'));
            if @func<>nil
            then res := func(AOwner, id_us, DB, id_kass, id_day, id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'KassaDocBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;

  LKassaDocEdit := res;
end;

function LSpSchSystemKassa(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase): integer;stdcall;
var func:function(AOwner:TComponent; id_user : int64; DB: TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('KassaSchSys.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaSchSys.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpSchSystemKassa'));
            if @func<>nil
            then func(AOwner, id_user, DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'KassaSchSys.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
  end;

  LSpSchSystemKassa := -1;
end;

function LKassaDayShow(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
var func:function(AOwner:TComponent; id_user : int64; DB : TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
    res : integer;
begin
  HandlePack := GetModuleHandle('KassaDayBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaDayBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('KassaDayShow'));
            if @func<>nil
            then res := func(AOwner, id_user, DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'KassaDayBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;

  LKassaDayShow := res;
end;


function LKassaDayEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
var func:function(AOwner:TComponent; id_user : int64;DB : TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
    res : integer;
begin
  HandlePack := GetModuleHandle('KassaDayBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaDayBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('KassaDayEdit'));
            if @func<>nil
            then res := func(AOwner, id_user, DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'KassaDayBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LKassaDayEdit := res;
end;

function MY_GetManEx(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;stdcall;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(MY_People);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_People);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            if ID_MAN=0 then Id_Man:=-1;
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMan'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,MultiSelect,CanEdit,Id_Man);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+MY_People),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  MY_GetManEx:=Res;
end;

function MY_GetManExAo(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; Date_Beg: TDate; Date_End: TDate;MultiSelect:Boolean=False;CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;stdcall;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; Date_Beg: TDate; Date_End: TDate;MultiSelect:Boolean=False;CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(MY_People);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_People);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            if ID_MAN=0 then Id_Man:=-1;
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetManWorked'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,Date_Beg, Date_End,MultiSelect,CanEdit,Id_Man);

  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+MY_People),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  MY_GetManExAo:=Res;
end;

function AvanceShowLoad(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase):Integer;
var func:function(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack := GetModuleHandle('AvanceOtchet.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'AvanceOtchet.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('AvanceShow'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'AvanceOtchet.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;
  end;
  AvanceShowLoad := -1;
end;

function LoadSpRazdelAvanse(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Variant;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack:=GetModuleHandle('SpRazdelenieBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'SpRazdelenieBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('SpRazdelAvanse'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'SpRazdelenieBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadSpRazdelAvanse := Res;
end;

function LoadEditSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('SpRazdelenieBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'SpRazdelenieBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('EditSpRazdelAvanse'));
            if @func<>nil
            then func(AOwner, id_user, DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'SpRazdelenieBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadEditSpRazdelAvanse := -1;
end;

function LoadSpEditSpRazdelAvanse(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
var func:function(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase):Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack := GetModuleHandle('SpRazdelenieBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'SpRazdelenieBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpEditSpRazdelAvanse'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'SpRazdelenieBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadSpEditSpRazdelAvanse := Res;
end;

function LoadSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack:=GetModuleHandle('TypeDoc.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'TypeDoc.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('SpTypeDoc'));
            if @func<>nil
            then Res := func(AOwner, id_user, DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'TypeDoc.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadSpTypeDoc := Res;
end;

function LoadEditSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('TypeDoc.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'TypeDoc.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('EditSpTypeDoc'));
            if @func<>nil
            then func(AOwner, id_user, DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'TypeDoc.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadEditSpTypeDoc := -1;
end;

function LoadSpEditSpTypeDoc(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;
var func:function(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase):Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack := GetModuleHandle('TypeDoc.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'TypeDoc.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpEditSpTypeDoc'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'TypeDoc.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadSpEditSpTypeDoc := Res;
end;

function LoadSpSchSystem(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('Spschsys.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'Spschsys.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('SpSchSystem'));
            if @func<>nil
            then Res := func(AOwner, id_user, DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'Spschsys.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadSpSchSystem := -1;
end;

function LoadKassaShowFindOrder(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('KassaFindOrder.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaFindOrder.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('KassaShowFindOrder'));
            if @func<>nil
            then Res := func(AOwner, id_user, DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'KassaFindOrder.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadKassaShowFindOrder := -1;
end;

function LShowOstatkiAvance(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; regim : TMyRegim; vibor : TMVibor; posicirovanie : int64): Integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase; regim : TMyRegim; vibor : TMVibor; posicirovanie : int64): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('AvanceOstatok.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'AvanceOstatok.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('ShowOstatkiAvance'));
            if @func<>nil
            then Res := func(AOwner, id_user, DBHandle, regim, vibor, posicirovanie)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'AvanceOstatok.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;
  end;
  LShowOstatkiAvance := -1;
end;

function LoadAvanceShowFindOrder(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('AvanceFindDocument.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'AvanceFindDocument.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('AvanceShowFindOrder'));
            if @func<>nil
            then Res := func(AOwner, id_user, DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'AvanceFindDocument.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadAvanceShowFindOrder := -1;
end;

function LoadAvanceShowReestr(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('AvanceReestrMan.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'AvanceReestrMan.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('AvanceShowReestr'));
            if @func<>nil
            then Res := func(AOwner, id_user, DBHandle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'AvanceReestrMan.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadAvanceShowReestr := -1;
end;



function LBankDayEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
var func:function(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
    HandlePack: HModule;
    res : Integer;
begin
  HandlePack := GetModuleHandle('BankDay.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bank+'BankDay.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('BankDayEdit'));
            if @func<>nil
            then res := func(AOwner, id_user, DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'BankDay.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            res := null
  end;

  LBankDayEdit := res;
end;

function LBankDocShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):Integer;stdcall;
var func:function(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):integer; stdcall;
    HandlePack: HModule;
    res : integer;
begin
  HandlePack := GetModuleHandle('BankDocument.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bank+'BankDocument.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('BankDocShow'));
            if @func<>nil
            then res := func(AOwner, id_us, DB, id_kass, id_day, id_doc, param);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'BankDocument.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;

  LBankDocShow := res;
END;

function LBankDocEdit(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):Integer;stdcall;
var func:function(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_kass, id_day, id_doc : int64; param : td):integer; stdcall;
    HandlePack: HModule;
    res : integer;
begin

  HandlePack := GetModuleHandle('BankDocument.bpl');

  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bank+'BankDocument.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('BankDocEdit'));
            if @func<>nil
            then res := func(AOwner, id_us, DB, id_kass, id_day, id_doc, param);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'BankDocument.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;

  LBankDocEdit := res;
end;

function LSelectMyltyDog(AOwner:TComponent; id_us: int64; DB : TpFIBDatabase; n : TModeDog; Input : TDRes; All_summa : double) : TDRes;stdcall;
var func : function(AOwner:TComponent; id_us: int64; DB : TpFIBDatabase; n : TModeDog; Input : TDRes; All_summa : double) : TDRes;stdcall;
    HandlePack: HModule;
    res : TDRes;
begin
  HandlePack := GetModuleHandle('SpMultyDog.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'SpMultyDog.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SelectMyltyDog'));
            if @func<>nil
            then res := func(AOwner, id_us, DB, n, Input,All_summa);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'SpMultyDog.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res.ModalResult := 0;
  end;

  LSelectMyltyDog := res;
end;

function LDogMain(input_params : TAlexDogInput) : TAlexDogResult;
var
 HandlePack : HModule;
 MDIFunc    : function(input_params : TAlexDogInput) : TAlexDogResult;stdcall;
begin
 Result.ModalResult := mrCancel;
 HandlePack := GetModuleHandle('dogMain.bpl');
 if HandlePack < 32 then begin
  Screen.Cursor := crHourGlass;
  HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName)+'WorkDog\'+'dogMain.bpl');
  Screen.Cursor := crDefault;
 end;
 if HandlePack > 0 then begin
  @MDIFunc := GetProcAddress(HandlePack,PChar('GetSpr'));
  if @MDIFUNC <> nil then Result := MDIFunc(input_params);
 end else MessageBox(TForm(input_params.Owner).Handle,PChar(ErrorLLibrary+'dogMain.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
end;

function LBankShowFindOrder(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('BankFindDocument.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bank+'BankFindDocument.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('BankShowFindOrder'));
            if @func<>nil
            then Res := func(AOwner, id_us, DB)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'BankFindDocument.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LBankShowFindOrder := -1;
end;

function LBankShowAnalyzErrorProvs(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('BankAnalyzErrorProvs.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bank+'BankAnalyzErrorProvs.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('BankShowAnalyzErrorProvs'));
            if @func<>nil
            then Res := func(AOwner, id_us, DB)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'BankAnalyzErrorProvs.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LBankShowAnalyzErrorProvs := -1;
end;

function LAvanceShowOborot(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : integer; stdcall;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('AvanceShowOborot.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'AvanceShowOborot.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('AvanceShowOborot'));
            if @func<>nil
            then Res := func(AOwner, id_us, DB)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'AvanceShowOborot.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LAvanceShowOborot := -1;
end;

function LAddDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_native:int64;DateDoc:TDateTime;id_valuta : Integer; name_valuta : string):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_native:int64;DateDoc:TDateTime;id_valuta : Integer; name_valuta : string):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('AddDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_acc_native,DateDoc,id_valuta, name_valuta);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+Name_ViewClBank),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LAddDocClBank:=Res;
end;

function LEditDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant; id_valuta : Integer; name_valuta : string):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant; id_valuta : Integer; name_valuta : string):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('EditDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_doc, id_valuta, name_valuta);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+Name_ViewClBank),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LEditDocClBank:=Res;
end;

function LClonDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ClonDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+Name_ViewClBank),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LClonDocClBank:=Res;
end;

function LViewDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ViewDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+Name_ViewClBank),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LviewDocClBank:=Res;
end;

function LDelDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_AddDocClBank);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_ClBank+Name_AddDocClBank);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('DelDocClBank'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmSt,id_doc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+Name_ViewClBank),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LDelDocClBank:=Res;
end;

function LKassaShowDelete(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
var func:function(AOwner:TComponent; id_user : int64; DB: TpFIBDatabase): Integer;stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('KassaDeleteOrder.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaDeleteOrder.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('KassaShowDelete'));
            if @func<>nil
            then Res := func(AOwner, id_user, DB)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'KassaDeleteOrder.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LKassaShowDelete := -1;
end;

function LAvanceShowOborotNew(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : integer; stdcall;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('ShowOborotNewAlg.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+AVANCE_PATH+'ShowOborotNewAlg.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('AvanceShowOborotNew'));
            if @func<>nil
            then Res := func(AOwner, id_us, DB)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'ShowOborotNewAlg.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LAvanceShowOborotNew := -1;
end;

function LoadNastroyka(AOwner: TComponent; id_us: int64; Handle: TISC_DB_HANDLE) : Integer; stdcall;
var func:function(AOwner: TComponent; id_us: int64; Handle: TISC_DB_HANDLE): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('KassaNastroykaBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaNastroykaBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('Nastroyka'));
            if @func<>nil
            then Res := func(AOwner, id_us, Handle)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'KassaNastroykaBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadNastroyka := -1;
end;

function LoadKassaSys(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; m : Smallint; regim : integer) : Variant; stdcall;
var func:function(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; m : Smallint; regim : integer): Variant; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('KassaSystemBpl.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'KassaSystemBpl.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('KassaSys'));
            if @func<>nil
            then LoadKassaSys := func(AOwner, id_user, DBHandle, m, regim)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'KassaSystemBpl.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
end;

function LShow_Neosnov(AO : TComponent; d : TpfibDatabase; style : TFormStyle; dd : Tdate) : Variant; stdcall;
var func:function(AO : TComponent; d : TpfibDatabase; style : TFormStyle; dd : Tdate): Variant; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('AvanceNeosnovnieProv.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ AVANCE_PATH +'AvanceNeosnovnieProv.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('Show_Neosnov'));
            if @func<>nil
            then LShow_Neosnov := func(AO, d, style, dd)
            else begin
                MessageBox(TForm(AO).Handle,PChar(ErrorLLibrary + 'AvanceNeosnovnieProv.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;
  end;
end;

function LShowBankServicePereschet(AO : tcomponent; D : Tpfibdatabase; id : int64) : integer; stdcall;
var func:function(AO : TComponent; d : TpfibDatabase; id : int64): Integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('BankService.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ Bank +'BankService.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('ShowBankServicePereschet'));
            if @func<>nil
            then LShowBankServicePereschet := func(AO, d, id)
            else begin
                MessageBox(TForm(AO).Handle,PChar(ErrorLLibrary + 'BankService.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;
  end;
end;

function LShow_Bank_nastroyka(AO : tcomponent; D : Tpfibdatabase; id : int64) : integer; stdcall;
var func:function(AO : TComponent; d : TpfibDatabase; id : int64): Integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('BankNastroykaBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ Bank +'BankNastroykaBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('Show_Bank_nastroyka'));
            if @func<>nil
            then LShow_Bank_nastroyka := func(AO, d, id)
            else begin
                MessageBox(TForm(AO).Handle,PChar(ErrorLLibrary + 'BankNastroykaBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;
  end;
end;

function LShow_Bank_nastroyka_tranz(AO : tcomponent; D : Tpfibdatabase; id : int64) : integer; stdcall;
var func:function(AO : TComponent; d : TpfibDatabase; id : int64): Integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('BankNastroykaBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ Bank +'BankNastroykaBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('Show_Bank_nastroyka_tranz'));
            if @func<>nil
            then LShow_Bank_nastroyka_tranz := func(AO, d, id)
            else begin
                MessageBox(TForm(AO).Handle,PChar(ErrorLLibrary + 'BankNastroykaBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;
  end;
end;

function LShow_Bank_nastroyka_invoice(AO : tcomponent; D : Tpfibdatabase; id : int64) : integer; stdcall;
var func:function(AO : TComponent; d : TpfibDatabase; id : int64): Integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('BankNastroykaBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ Bank +'BankNastroykaBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('Show_Bank_nastroyka_invoice'));
            if @func<>nil
            then LShow_Bank_nastroyka_invoice := func(AO, d, id)
            else begin
                MessageBox(TForm(AO).Handle,PChar(ErrorLLibrary + 'BankNastroykaBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;
  end;
end;

function LoadJNastroyka(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase) : Integer; stdcall;
var func:function(AOwner:TComponent; id_user : int64; DB: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('JNastroyka.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + AVANCE_PATH + 'JNastroyka.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('JNastroyka'));
            if @func<>nil
            then Res := func(AOwner, id_us, DB)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'JNastroyka.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end;
  LoadJNastroyka := -1;
end;

function LBankProsmotrNeobr(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_szyazka : int64; rs, name_rs, sch, name_sch : string):Integer; stdcall;
var func:function(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_szyazka : int64; rs, name_rs, sch, name_sch : string):Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('BankProsmNeob.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Bank + 'BankProsmNeob.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('ShowNeobrobotBank'));
            if @func<>nil
            then Res := func(AOwner, id_us, DB, id_szyazka, rs, name_rs, sch, name_sch)
            else begin
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'BankProsmNeob.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end else
  LBankProsmotrNeobr := -1;
end;

function LShowKassaAnalitRes(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):integer; stdcall;
var func:function(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('AnalitGotOper.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + MY_KASSA + 'AnalitGotOper.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('ShowKassaAnalitRes'));
            if @func<>nil
            then LShowKassaAnalitRes := func(AOwner, id_us, DB)
            else begin
                LShowKassaAnalitRes := -1;
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'AnalitGotOper.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end else
end;

function LBank_sp_sch (AOwner: TComponent; db : Tpfibdatabase; id_sch, id_ras, id_sv : int64; d1, d2 : TDate; ST : TResBankSPProc) : integer; stdcall;
var func:function(AOwner: TComponent; db : Tpfibdatabase; id_sch, id_ras, id_sv : int64; d1, d2 : TDate; ST : TResBankSPProc):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('BankSchBpl.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Bank + 'BankSchBpl.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('Bank_sp_sch'));
            if @func<>nil
            then LBank_sp_sch := func(AOwner, db, id_sch, id_ras, id_sv, d1, d2, st)
            else begin
                LBank_sp_sch := -1;
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'BankSchBpl.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

  end else
end;

function LShowMemorialBank (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
var func:function(AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('BankMemorial.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Bank + 'BankMemorial.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('ShowMemorialBank'));
            if @func<>nil
            then LShowMemorialBank := func(AOwner, db, id_user)
            else begin
                LShowMemorialBank  := -1;
                MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'BankMemorial.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

  end else
end;

function LShowMemorialAvance (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
var func:function(AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('AvanceMemorialBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + AVANCE_PATH + 'AvanceMemorialBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('ShowMemorialAvance'));
            if @func<>nil
            then LShowMemorialAvance := func(AOwner, db, id_user)
            else begin
                LShowMemorialAvance  := -1;
                MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'AvanceMemorialBPL.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

  end else
end;

function LShowMemorialZvedAvance (AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
var func:function(AOwner : Tcomponent; db : Tpfibdatabase; id_user : int64) : integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack:=GetModuleHandle('AvanceMemorialZvedenii.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + AVANCE_PATH + 'AvanceMemorialZvedenii.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('ShowMemorialAvance'));
            if @func<>nil
            then LShowMemorialZvedAvance := func(AOwner, db, id_user)
            else begin
                LShowMemorialZvedAvance  := -1;
                MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'AvanceMemorialZvedenii.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

  end else
end;

Function LShowInsertOstatokBank(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase) : Integer; stdcall;
var func:function(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase) : integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('BankOstatki.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Bank + 'BankOstatki.bpl');
  end;

  if HandlePack > 0 then
  begin
       @func := GetProcAddress(HandlePack,PChar('ShowInsertOstatokBank'));
       if @func<>nil
       then LShowInsertOstatokBank := func(AOwner, id_user, DBHandle)
       else begin
            LShowInsertOstatokBank := -1;
            MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'BankOstatki.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
       end;
  end else
end;

function LAvanceVedomost(AOwner : TComponent; id_user : int64; DB : TpFIBDatabase) : Integer; stdcall;
var func : function(AOwner : TComponent; id_user : int64; DB : TpFIBDatabase) : integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('AvanceVedomost.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + AVANCE_PATH + 'AvanceVedomost.bpl');
  end;

  if HandlePack > 0 then
  begin
       @func := GetProcAddress(HandlePack,PChar('AvanceVedomost'));
       if @func<>nil
       then LAvanceVedomost := func(AOwner, id_user, DB)
       else begin
            LAvanceVedomost := -1;
            MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'AvanceVedomost.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
       end;
  end else
end;

function NEW_GMEx(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; MultiSelect : Boolean=False; CanEdit : Boolean=False; Id_Man:Integer=-1) : Variant; stdcall;
var
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('SpAllPeople.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'SpAllPeople.bpl');
    end;

    if HandlePack > 0 then
    begin
        @x := GetProcAddress(HandlePack, PChar('GetManWithDog'));
        if @x<>nil
            then NEW_GMEx := x(AOwner, DBHANDLE, MultiSelect, CanEdit, Id_Man)
            else begin
                NEW_GMEx := -1;
                MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'SpAllPeople.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        NEW_GMEx := -1;
end;

procedure LCreateVedomost_3_2(AO : TComponent; DB : TpFibDataBase; id_sch, id_system : int64; date_month : TDate);
var
    func : procedure(AO : TComponent; DB : TpFibDataBase; id_sch, id_system : int64; date_month : TDate); stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('Vedomost3_2_new_alg.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + AVANCE_PATH + 'Vedomost3_2_new_alg.bpl');
  end;

  if HandlePack > 0 then
  begin
       @func := GetProcAddress(HandlePack, PChar('CreateVedomost_3_2'));
       if @func<>nil
       then func(AO, DB, id_sch, id_system, date_month)
       else begin
            MessageBox(TForm(AO).Handle, PChar(ErrorLLibrary + 'Vedomost3_2_new_alg.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
       end;
  end else
end;

function LHistoryInfoShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase;  id_doc : int64):Integer;stdcall;
var func:function(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase;  id_doc : int64):integer; stdcall;
    HandlePack: HModule;
    res : integer;
begin
  HandlePack := GetModuleHandle('HistoryInfoBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MY_KASSA+'HistoryInfoBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
      @func := GetProcAddress(HandlePack, PChar('HistoryInfoShow'));
      if @func<>nil
      then res := func(AOwner, id_us, DB, id_doc);
  end
  else begin
      MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'HistoryInfoBPL.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
      Res:=NULL;
  end;

  LHistoryInfoShow := res;
end;



function LErVstrechProvs(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase;  id_form_uch : integer; id_sch : int64; date_beg_per : TDate): integer;stdcall;
var func:function(AOwner:TComponent; id_user : int64; DB: TpFIBDatabase; id_form_uch : integer; id_sch : int64; date_beg_per : TDate):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('WorkWithErVstrech.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bank+'WorkWithErVstrech.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('ErVstrechProvs'));
            if @func<>nil
            then func(AOwner, id_user, DB, id_form_uch, id_sch, date_beg_per);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary+'WorkWithErVstrech.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
  end;
  LErVstrechProvs := -1;
end;


end.
