{Общий модуль для разработки системы финансового и бухгалтеркого менеджмента}
unit GlobalSPR;

interface
uses Forms, Windows, IBase, Dialogs,DateUtils, Resources_unitb,
     SysUtils,Variants,Classes,Controls,pFIBDatabase,IB_EXTERNALS,
     Check_User;
type
{=================Custom Types===================================================}
    TPublicSmetaMode=(psmGroup,psmSmet,psmSmetWithoutPeriod,psmRazdSt,psmSmetAcc);
    TPublicAdressShowMode=(SHOWALLADRESSES,SHOWONLYADRESS);
    TPublicAdressSelectMode=(WORK,WORK_SELECT,SELECT);
    TCustomerSelectMode=(csmNone,csmCustomers,csmContactMen,csmRateAcc);
    TRegim = (Multy, Single);
    TVibor = (Group, Tovar, GroupAndtovar);
    TLinearSpravFunc = function (AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id : int64) : Variant; stdcall;
    TCusomersSpravFunc = function (AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_customer, id_rate_account, id_man : int64) : Variant; stdcall;
    TViewMode = (vmFixSch, vmFixProp);
    TRazdStViewMode = (allEnable, allData, allEnableValid, allEProfitUnderBudget, allENotProfitUnderBudget, allNotExistInPlan,
    allExistInPlan, allExistInPlanSt, allEnableProfit, allRazdOnly);
    TRazdStChMode = (cmNone, cmRazd, cmSt);
    TPropType = (ptSch, ptOper, ptRazdSt, ptKekv, ptSmeta, ptVidOpl);

    TConfigConnStructure=record
     DB_PATH       : ShortString;
     DB_SERVER     : ShortString;
     DB_USER       : ShortString;
     DB_PASSWORD   : ShortString;
     end;

    TSmetaFilterValues=record
           GroupValues: Array of Integer;
           PlanBeg    : TDateTime;
           PlanEnd    : TDateTime;
           DateFilter : Boolean;
           GroupFilter: Boolean;
           NOTEqual   : Integer;
     end;

{=================Custom Resources===================================================}
resourcestring
     LoadErrorG=           'Помилка при роботі з бібліотекою ';
     ErrorCaptionG=        'Увага помилка!';
     psmGroup_str=         'Виберіть групу ';
     psmSmet_str=          'Виберіть кошторис';
     psmRazdSt_str=        'Виберіть кошторис, розділ/статтю';
{=================Custom Paths===================================================}
const  CUST_PATH   ='Customer\';
const  ADDR_PATH   ='Adresses\';
const  SMETA_PATH  ='Smeta\';
const  KERNEL_PATH ='Kernell\';
const  MATAS_PATH  ='Matas\';
const  ZAR_PATH    ='Zarplata\';
const  KASSA_PATH  ='Kassa\';
const  PUBLIC_PATH ='Public\';
const  PROP_PATH   ='Properties\';
const  STUDCITY    ='StudCity\';
const  JO5_PATH    ='JO5\';
const  CONTRACTS   ='Contracts\';
{=================Custom Libs===================================================}
{Наименование подгружаемых модулей}
const   PropAnDll            ='AnalizePackage.bpl';  //Анализ выставления свойств на объектах
const   RazdDll              ='RazdPackage.bpl';     //Справочник разделов
const   SprSchDll            ='SchPackage.bpl';      //Справочник счетов
const   SprOper              ='OperPackage.bpl';     //Справочник операций
const   SprProp              ='SprPropPackage.bpl';  //Справочник свойств
const   SprKekv              ='KekvPackage.bpl';     //Справочник КЕКВов
const   UseProp              ='PropPackage.bpl';     //Использование свойств по конкретному объекту
const   SprSmeta             ='SmetaPackage.bpl';    //Справочник смет
const   UseSmetaDll          ='USmetPackage.bpl';    //Работа со сметой
const   CustSpr              ='CustPackage.bpl';
const   Banks                ='SpBankPac.bpl';
const   PubSmetI             ='PublicSmeta.bpl';
const   IniAccI              ='Accounts.bpl';
const   Customers            ='CustPackage.bpl';
const   IniTM                ='IniTypeMen.bpl';
const   BranModule           ='Branches.bpl';
const   SprIsts              ='SpIst.bpl';
const   TypeCont             ='TypeContact.bpl';
const   GrCont               ='GroupContact.bpl';
const   TypePlace            ='IniTypePlace.bpl';
const   TypeRegion           ='TypeRegion.bpl';
const   TypeStreet           ='TypeStreet.bpl';
const   Coutry               ='counties.bpl';
const   Distinct             ='Distincts.bpl';
const   Place                ='Places.bpl';
const   Region               ='Regions.bpl';
const   Adresses             ='AdressPackage.bpl';
const   People               ='SpAllPeople.bpl';
const   ProvsSel             ='GetProvs.bpl';
const   EnumTypeMod          ='CustomEnums.bpl';
const   AutoKodMod           ='AutoKodBPL.bpl';
const   AutoKodPr            ='SpAutokodProperty.bpl';
const   AutoKodL             ='SpRazdLevel.bpl';
const   UnitMeasModule       ='unit_meas.bpl';
const   SchAnMod             ='SchAnalize.bpl';
const   UseDocProv           ='GetProvs.bpl';
const   EditBook             ='edtmbk.bpl';
const   SysApp               ='SysDPK.bpl';
const   SysAppBu             ='BuSysDPK.bpl';
const   SmGroup              ='smgrpintf.bpl';
const   SmPkv                ='smpkvintf.bpl';
const   SmReport             ='usesmreports.bpl';
const   OMatrix              ='omatrix.bpl';
const   htmlmod              ='GenHTML.bpl';
const   budocs               ='UDocReestr.bpl';
const   schoban              ='obranalize.bpl';
const   otchintfmod          ='otchintf.bpl';
const   spvalute             ='spvalute.bpl';
const   bugetdoc             ='GetDoc.bpl';
const   mreports             ='reports.bpl';
const   studacc              ='StAccounts.bpl';
const   jo5saldo             ='saldobysmrzst.bpl';
const   fin_main             ='getfinfrm.bpl';
const   matostmod            ='zadanalize.bpl';
const   krdbzmod             ='KrDbAnalize.bpl';
const   smrestmod            ='restanalize.bpl';
const   cn_prices            ='cn_prices.bpl';
const   typefinanceapp       ='typefinance.bpl';
const   SmGlobalMod          ='smglobalization.bpl';
const   cn_accounts          ='cn_accounts.bpl';
const   acards               ='ACards.bpl';
const   acardsex             ='ACardsEx.bpl';
const   zimportapp           ='zdocimport.bpl';
const   wizard_reports       ='wizardreports.bpl';
const   akardkv              ='AkardKV.bpl';
{=================System consts===================================================}

const DEFAULT_ROOT_ID                    = 1;
const INI_FILENAME        : String       = 'config.ini';
      BASE_YEAR           : Integer      = 2000;
      YEARS_COUNT         : Integer      = 100;
{=================Custom apps===================================================}
procedure ZDocImportConfigure(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64);
procedure ZDocImportAppRun(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64; id_system:Integer);
procedure GetACardKassaRasx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
procedure GetACardEx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
procedure GetACardFactRasx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
procedure GetACardGetAssign(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
function GetPricesByPeriod(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; DateBeg,DateEnd:TDateTime;Id_user:Int64):Variant;
procedure GetPrice(AOwner:TComponent; DbHandle:TISC_DB_HANDLE;Id_price:Int64;Id_User:Int64);
procedure GetPrices(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; Id_user:Int64);
function GetSmetsEx(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;Id_sm,id_rz,id_st:Integer):Variant;
procedure GetDocsUnderBudget(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_PLAN:Int64;ID_SM:Integer;ID_RZ:Integer;ID_ST:Integer);
procedure CalcBuRests(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Integer);
function GetValute(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Id_Valute:Integer;Id_User:Integer):Variant;
Procedure GetOtchIntf(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_PLAN:Int64;ID_USER:Integer;FS:TFormStyle);
procedure GetOborAnalize(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
procedure GetOborAnalizeEx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer;id_sch:Int64;act_date:TDateTime);
procedure GetMOst(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
procedure GetSmDReestr(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Integer);
procedure ShowHtmlReport(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);
function MonthTitle(ADate:TdateTime):String;
function GetSmPKV(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer):Variant;
function GetTypeFinance(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;id_user:Int64):Variant;
function UseSmeta(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Id_smeta:Int64;Id_plan:Int64):integer;
function GetOperationsSpr(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; FS:TFormStyle; Id_Sch:Integer; Curr_Date:TdateTime; ChooseDB:Boolean):Variant;
procedure EditBookSch(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_SCH:Int64;ACTUAL_DATE:TDateTime);
procedure GetMBOOK(AOwner:TComponent;DBHandle:TISC_DB_HANDLE);
procedure GetSysOpt(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
function GetSmetaSpr(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_user:Integer):integer;
function GetSmGrp(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer;Id_user:Int64):Variant;
function GetRazdStSpr(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode):Variant;
function GetAnalize(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle):Integer;
function GetSchAnalitic(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
function GetKEKVSpr(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer):Variant;
function ShowUnitMeas(AOwner : TComponent; DBHandle : Pvoid; fs : TFormStyle; id_unit_meas : int64) : Variant;
function ShowGroupUnitMeas(AOwner : TComponent; DBHandle : Pvoid; fs : TFormStyle; id_group_unit : int64) : Variant;
function LoadSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; regim : TRegim; vibor : TVibor; posicirovanie : int64): Variant;
function LoadEditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
function LoadSpEditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; regim : TRegim; vibor : TVibor; posicirovanie : int64):Variant;
function LoadSpAutokodProp(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
function LoadEditAutokodProp(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
function LoadSpEditAutokodProp(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;
function LoadSpRazdAutokod(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
function LoadEditSpRazdAutokod(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
function LoadSpEditSpRazdAutokod(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;
function LGetSprMdi  (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;
function LGetSprModal(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):variant;
function GetIniAnalitic(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
function GetEnumTypeFilter(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;Id_filter_Value:integer):Variant;
function GetEnums(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
function GetProvs(AOwner:TComponent;DBHandle:TISC_DB_HANDLE; ActualDate:TDateTime; DB_CR_FLAG:Integer;Id_user:Integer;login,user:string;id_form_uch:integer):Variant;
function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE):Variant;
function GetBanks(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetSmets(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime; Mode:TPublicSmetaMode):Variant;
function GetIniAcc(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetCustomers(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode):Variant;
function GetIniTypeMen(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetBranches(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetIsts(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetTypeContact(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetGroupContact(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetIniTypePlace(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetIniTypeRegion(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetIniTypeStreet(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetCountries(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetDistincts(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetPlaces(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetRegions(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
function GetAdresses(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;
                     ShowMode:TPublicAdressShowMode;SelectMode:TPublicAdressSelectMode; Id_adress:integer=-1):Variant;
function GetSearchTemplate(Instr:String):string;
function GetBallanceSpr(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):variant;
function GetSch(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;stdcall;
function GetSchEx(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;stdcall;
function GetSchWithOperFilterEx(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer;In_sch_in_credit:Integer):variant;stdcall;export;
function GetSchWithOperFilter(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;Id_sch:Integer;Id_sch_In:Integer;In_sch_in_credit:Integer):variant;stdcall;
function GetPropByObj(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;         Id_Object:Integer; Curr_Date:TdateTime; PT:TPropType):Integer;
function GetPropertiesSpr(AOwner:TComponent; DBhandle:TISC_DB_HANDLE;Actualdate:TdateTime):integer;
procedure GetSheets(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime);
function GetDoc(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;PK_ID:int64;id_user:Int64;Mode:Boolean;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime):Int64;
procedure GetDocBySession(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime;KEY_SESSION:Int64);
function GetComputerNetName: string;
procedure GetSchSaldo(AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
procedure GetSchAnalize(AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
procedure GetExtendedSmReport(AOwner: TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
procedure GetSmResults(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;Id_smeta:Int64;Id_plan:Int64);
procedure PrintSmetPlusPeriods(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
procedure GetOMatrix(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ActualDate:TDateTime);
procedure DoTch(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
procedure GetSysOptBu(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
procedure GetMBookReports(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Int64);
procedure DoSmRecalc(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64);
procedure GetStAccounts(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:String);
procedure GetCnAccounts(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:String);
procedure GetJO5SchSaldo(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_sch:Int64;ActualDate:TDateTime);
procedure GetFinForms(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64);
procedure GetKrDbZ(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
procedure GetSmRest(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
procedure GetSmGlobalization(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:int64);
procedure WIZARDInsertBudget(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer);
function WIZARD_GetPlan(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_user:Integer):int64;
function WIZARD_GetSmPeriod(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer;Id_smeta:Int64):Variant;
procedure Wizard_GetPlanValuesReport(AOwner:TComponent;DBhandle:TISC_DB_Handle;Id_smeta:Int64;Date_beg:TDateTime;Date_end:TDateTime;id_user:Int64);
procedure PrintSmetaValues(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
procedure getBalance(AOwner:TComponent; DB_handle:TISC_DB_HANDLE; id_user:Int64);
procedure GetACardKassaKV(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);

var
   APP_PATH         :  string;
   DB_PATH          :  string;
   DB_USER          :  string;
   DB_PASSWORD      :  string;
   DB_SERVER        :  string;
   CORRECT_CONFIG   :  boolean;
   CORRECT_CONNECT  :  boolean;

implementation

function MonthTitle(ADate:TdateTime):String;
var Num:WORD;
begin
    Num:=MonthOf(ADate);
    if Num=1  then  MonthTitle:=BU_Month_01;
    if Num=2  then  MonthTitle:=BU_Month_02;
    if Num=3  then  MonthTitle:=BU_Month_03;
    if Num=4  then  MonthTitle:=BU_Month_04;
    if Num=5  then  MonthTitle:=BU_Month_05;
    if Num=6  then  MonthTitle:=BU_Month_06;
    if Num=7  then  MonthTitle:=BU_Month_07;
    if Num=8  then  MonthTitle:=BU_Month_08;
    if Num=9  then  MonthTitle:=BU_Month_09;
    if Num=10 then  MonthTitle:=BU_Month_10;
    if Num=11 then  MonthTitle:=BU_Month_11;
    if Num=12 then  MonthTitle:=BU_Month_12;
end;

function GetPricesByPeriod(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; DateBeg,DateEnd:TDateTime;Id_user:Int64):Variant;
var
  HandlePack: HModule;
  MDIFUNC:function(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; DateBeg,DateEnd:TDateTime;Id_user:Int64):Variant;stdcall;
  Res:Variant;
begin
      Res:=NULL;
      HandlePack:=GetModuleHandle(cn_prices);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+CONTRACTS+cn_prices);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetPricesByPeriod'));
                if (@MDIFUNC<>nil)
                then Res:=MDIFUNC(AOwner,DbHandle,DateBeg,DateEnd,Id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+cn_prices),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
      Result:=Res;
end;

procedure GetACardKassaKV(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
var
    HandlePack: HModule;
    MDIFUNC: procedure (AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);stdcall;
begin
      HandlePack:=GetModuleHandle(akardkv);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+akardkv);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetACardKassaKV'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,Id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+akardkv),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;


procedure GetACardFactRasx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);stdcall;
begin
      HandlePack:=GetModuleHandle(acards);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+acards);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetACardFactRasx'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,Id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+acards),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;

procedure ZDocImportConfigure(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64);stdcall;
begin
      HandlePack:=GetModuleHandle(zimportapp);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ZAR_PATH+zimportapp);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('ZDocImportConfigure'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,Id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+acards),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;


procedure ZDocImportAppRun(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64; id_system :Integer);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64; id_system:Integer);stdcall;
begin
      HandlePack:=GetModuleHandle(zimportapp);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ZAR_PATH+zimportapp);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('ZDocImportAppRun'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,Id_user, id_system);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+acards),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;


procedure GetACardKassaRasx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);stdcall;
begin
      HandlePack:=GetModuleHandle(acards);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+acards);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetACardKassaRasx'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,Id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+acards),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;

procedure GetACardEx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);stdcall;
begin
      HandlePack:=GetModuleHandle(acardsex);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+acardsex);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetACardEx'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,Id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+acards),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;


procedure GetACardGetAssign(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Int64);stdcall;
begin
      HandlePack:=GetModuleHandle(acards);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+acards);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetACardGetAssign'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,Id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+acards),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;


procedure GetSmGlobalization(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:int64);stdcall;
begin
      HandlePack:=GetModuleHandle(SmGlobalMod);
      if (HandlePack<32)
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SmGlobalMod);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSmGlobalization'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DB_Handle,id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmGlobalMod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;


procedure GetPrice(AOwner:TComponent; DbHandle:TISC_DB_HANDLE;Id_price:Int64;Id_User:Int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent; DbHandle:TISC_DB_HANDLE;Id_price:Int64;Id_User:Int64);stdcall;
begin
      HandlePack:=GetModuleHandle(cn_prices);
      if HandlePack<32
      then begin
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+CONTRACTS+cn_prices);
                Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetPrice'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,id_price,id_user);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+cn_prices),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;


procedure GetPrices(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; Id_user:Int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; Id_user:Int64);stdcall;
begin
  HandlePack:=GetModuleHandle(cn_prices);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+CONTRACTS+cn_prices);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetPrices'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,id_user);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+cn_prices),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;


procedure GetFinForms(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64);stdcall;
begin
  HandlePack:=GetModuleHandle(fin_main);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+fin_main);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetFinForms'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,id_user);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+fin_main),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;


procedure GetJO5SchSaldo(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_sch:Int64;ActualDate:TDateTime);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;ActualDate:TDateTime);stdcall;
begin
  HandlePack:=GetModuleHandle(jo5saldo);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+JO5_PATH+jo5saldo);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetJO5SchSaldo'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHANDLE,Id_sch,ActualDate);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+jo5saldo),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;




procedure GetDocsUnderBudget(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_PLAN:Int64;ID_SM:Integer;ID_RZ:Integer;ID_ST:Integer);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_PLAN:Int64;ID_SM:Integer;ID_RZ:Integer;ID_ST:Integer);stdcall;
begin
  HandlePack:=GetModuleHandle(bugetdoc);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+bugetdoc);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetDocsUnderBudget'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DB_HANDLE,ID_PLAN,ID_SM,ID_RZ,ID_ST);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+bugetdoc),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;


function GetValute(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Id_Valute:Integer;Id_User:Integer):Variant;
var
  HandlePack: HModule;
  Res:variant;
  MDIFUNC:function (AOwner:TComponent;DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Id_Valute:Integer;Id_User:Integer):Variant;stdcall;
begin
  HandlePack:=GetModuleHandle(spvalute);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+spvalute);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetValute'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,FS,Id_Valute,Id_User);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+spvalute),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
  Result:=Res;
end;


Procedure GetOtchIntf(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_PLAN:Int64;ID_USER:Integer;FS:TFormStyle);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_PLAN:Int64;ID_USER:Integer;FS:TFormStyle);stdcall;
begin
  HandlePack:=GetModuleHandle(otchintfmod);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+otchintfmod);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetOtchIntf'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,ID_PLAN,ID_USER,FS);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+otchintfmod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;

procedure GetSmRest(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);stdcall;
begin
      HandlePack:=GetModuleHandle(smrestmod);
      if HandlePack<32
      then begin
         Screen.Cursor:=crHourGlass;
         HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+smrestmod);
         Screen.Cursor:=crDefault;
      end;
      if (HandlePack > 0)
      then begin
                @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSmRest'));
                if @MDIFUNC<>nil
                then MDIFUNC(AOwner,DBHandle,Id_User);
      end
      else begin
                MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+smrestmod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
      end;
end;

procedure GetKrDbZ(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);stdcall;
begin
  HandlePack:=GetModuleHandle(krdbzmod);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+krdbzmod);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetKrDbZ'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,Id_User);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+krdbzmod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;


procedure GetMOst(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);stdcall;
begin
  HandlePack:=GetModuleHandle(matostmod);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+matostmod);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMOst'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,Id_User);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+matostmod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;


procedure GetOborAnalize(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer);stdcall;
begin
  HandlePack:=GetModuleHandle(schoban);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+schoban);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetOborAnalize'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,Id_User);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+schoban),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;

procedure GetOborAnalizeEx(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer; id_sch:Int64; act_date:TDateTime);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_User:Integer;id_sch:Int64;Act_date:TDateTime);stdcall;
begin
  HandlePack:=GetModuleHandle(schoban);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+schoban);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetOborAnalizeEx'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner, DBHandle, Id_User, id_sch, act_date);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+schoban),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;



procedure PrintSmetaValues(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
begin
  HandlePack:=GetModuleHandle(SmReport);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SmReport);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('PrintSmetaValues'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmReport),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;

procedure PrintSmetPlusPeriods(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
begin
  HandlePack:=GetModuleHandle(SmReport);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SmReport);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('PrintSmetPlusPeriods'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmReport),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;

procedure GetOMatrix(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ActualDate:TDateTime);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ActualDate:TDateTime);stdcall;
begin
  HandlePack:=GetModuleHandle(OMatrix);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+OMatrix);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetOMatrix'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DB_Handle,ActualDate);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmReport),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;




procedure GetSmResults(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;Id_smeta:Int64;Id_plan:Int64);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;Id_smeta:Int64;Id_plan:Int64);stdcall;
begin
  HandlePack:=GetModuleHandle(SmReport);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SmReport);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSmResults'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,FS,ActualDate,Id_smeta,Id_plan);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmReport),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;


procedure GetExtendedSmReport(AOwner: TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner: TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
begin
  HandlePack:=GetModuleHandle(SmReport);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SmReport);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetExtendedSmReport'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmReport),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

procedure EditBookSch(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_SCH:Int64;ACTUAL_DATE:TDateTime);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_SCH:Int64;ACTUAL_DATE:TDateTime);stdcall;
begin
  HandlePack:=GetModuleHandle(EditBook);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+EditBook);
     Screen.Cursor:=crDefault;
  end;
  if (HandlePack > 0)
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('EditMbookSch'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DB_HANDLE,ID_SCH,ACTUAL_DATE);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+EditBook),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

end;

procedure GetSchAnalize(AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner: TComponent;DBhandle:TISC_DB_HANDLE;Actual_Date:TDateTime;Root:Integer);stdcall;
begin
  HandlePack:=GetModuleHandle(SprSchDll);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprSchDll);
     Screen.Cursor:=crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSchAnalize'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBhandle,Actual_Date,DEFAULT_ROOT_ID);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseDocprov),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

procedure GetSchSaldo(AOwner: TComponent;DBhandle: TISC_DB_HANDLE;  Actual_Date: TDateTime; Root: Integer);
var
  HandlePack: HModule;
  MDIFUNC:procedure(AOwner: TComponent;DBhandle:TISC_DB_HANDLE;Actual_Date:TDateTime;Root:Integer);stdcall;
begin
  HandlePack:=GetModuleHandle(SprSchDll);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprSchDll);
     Screen.Cursor:=crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSchSaldo'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBhandle,Actual_Date,DEFAULT_ROOT_ID);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseDocprov),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

function GetComputerNetName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

procedure GetSysOpt(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
var
  HandlePack: HModule;
  MDIFUNC   :procedure (AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);stdcall;
begin
  HandlePack:=GetModuleHandle(SysApp);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SysApp);
     Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSysOptions'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DB_Handle);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SysApp),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

procedure GetMBookReports(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Int64);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Int64);stdcall;
begin
  HandlePack:=GetModuleHandle(mreports);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+mreports);
     Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMBookReports'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,id_user);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+mreports),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

procedure GetSysOptBu(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
var
  HandlePack: HModule;
  MDIFUNC   :procedure (AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);stdcall;
begin
  HandlePack:=GetModuleHandle(SysAppBu);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SysAppBu);
     Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSysOptionsBu'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DB_Handle);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SysApp),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;


procedure GetMBOOK(AOwner:TComponent;DBHandle:TISC_DB_HANDLE);
var
  HandlePack: HModule;
  MDIFUNC   :procedure (AOwner:TComponent;DBHandle:TISC_DB_HANDLE);stdcall;
begin
  HandlePack:=GetModuleHandle(UseDocprov);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+UseDocprov);
     Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMBOOK'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseDocprov),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

procedure GetDocBySession(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime;KEY_SESSION:Int64);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime;KEY_SESSION:Int64);stdcall;
begin
  HandlePack:=GetModuleHandle(UseDocprov);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+UseDocprov);
     Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetDocBySession'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,id_user,login,user,id_form_kod,WorkPeriod,KEY_SESSION);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseDocprov),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

function GetDoc(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;PK_ID:int64;id_user:Int64;Mode:Boolean;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime):Int64;
var
  HandlePack: HModule;
  MDIFUNC   :function (AOwner:TComponent;DBHandle:TISC_DB_HANDLE;PK_ID:int64;id_user:Int64;Mode:Boolean;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime):int64;stdcall;
  retPK_ID  :int64;
begin
  RetPK_ID:=-1;
  HandlePack:=GetModuleHandle(UseDocprov);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+UseDocprov);
     Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetDoc'));
            if @MDIFUNC<>nil
            then retPK_ID:=MDIFUNC(AOwner,DBHandle,PK_ID,id_user,Mode,login,user,id_form_kod,WorkPeriod);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseDocprov),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;

  result:=RetPK_ID;
end;

procedure GetSheets(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime);
var
  HandlePack: HModule;
  MDIFUNC :procedure(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime);stdcall;
begin
  HandlePack:=GetModuleHandle(UseDocprov);
  if HandlePack<32
  then begin
     Screen.Cursor:=crHourGlass;
     HandlePack   := LoadPackage(ExtractFilePath(Application.ExeName) + KERNEL_PATH+UseDocprov);
     Screen.Cursor:=crDefault;
  end;

  if HandlePack > 32 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('FUNC'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBhandle,FS,Book_Date);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseDocprov),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;


function GetPropertiesSpr(AOwner:TComponent; DBhandle:TISC_DB_HANDLE;Actualdate:TdateTime):integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DBhandle:TISC_DB_HANDLE;Actualdate:TdateTime):integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprProp);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PROP_PATH+SprProp);

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBhandle,Actualdate);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprProp),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetPropertiesSpr:=Res;
end;


function GetPropByObj(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;         Id_Object:Integer; Curr_Date:TdateTime; PT:TPropType):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;         Id_Object:Integer; Curr_Date:TdateTime; PT:TPropType):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(UseProp);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PROP_PATH+UseProp);

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,Id_Object,Curr_Date,PT);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(UseProp),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetPropByObj:=Res;

end;




function ShowGroupUnitMeas(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_group_unit : int64) : Variant;
var
 hPack     : HModule;
 SpravFunc : TLinearSpravFunc;
begin
 hPack := GetModuleHandle(UnitMeasModule);
 if hPack < 32 then hPack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+UnitMeasModule);
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('ShowSprav'));
  if @SpravFunc <> NIL then Result := SpravFunc(AOwner, DBHandle, fs, id_group_unit);
 end else begin
  ShowMessage(PChar(LoadErrorG + UnitMeasModule));
  Result := NULL;
 end;
end;

function ShowUnitMeas(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_unit_meas : int64) : Variant;
var
 hPack     : HModule;
 SpravFunc : TLinearSpravFunc;
 Res:Variant;
begin
 hPack := GetModuleHandle(UnitMeasModule);
 if hPack < 32 then hPack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+UnitMeasModule);
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('ShowSprav2'));
  if @SpravFunc <> NIL then Res := SpravFunc(AOwner, DBHandle, fs, id_unit_meas);
 end else begin
  ShowMessage(PChar(LoadErrorG + UnitMeasModule));
  Res := NULL;
 end;
 ShowUnitMeas:=Res;
end;




function LoadSpAutoKod(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase; regim : TRegim; vibor : TVibor; posicirovanie : int64): Variant;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase; regim : TRegim; vibor : TVibor; posicirovanie : int64): Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack:=GetModuleHandle('AutoKodBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodMod);
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('SpAutoKod'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle, regim, vibor, posicirovanie);
  end;
  LoadSpAutoKod := Res;
end;

function LoadEditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('AutoKodBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodMod);
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('EditSpAutoKod'));
            if @func<>nil
            then func(AOwner, id_user, DBHandle);
  end;
  LoadEditSpAutoKod := -1;
end;


function LoadSpEditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; regim : TRegim; vibor : TVibor; posicirovanie : int64): Variant;
var func:function(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase; regim : TRegim; vibor : TVibor; posicirovanie : int64):Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack := GetModuleHandle('AutoKodBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodMod);
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpEditSpAutoKod'));
            if @func<>nil
            then Res := func(AOwner, id_user, DBHandle, regim, vibor, posicirovanie);
  end;
  LoadSpEditSpAutoKod := Res;
end;

function LoadSpAutokodProp(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Variant;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack:=GetModuleHandle('SpAutokodProperty.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodPr);
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('SpAutokodProp'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle);
  end;
  LoadSpAutokodProp := Res;
end;

function LoadEditAutokodProp(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('SpAutokodProperty.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodPr);
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('EditAutokodProp'));
            if @func<>nil
            then func(AOwner, id_user, DBHandle);
  end;
  LoadEditAutokodProp := -1;
end;

function LoadSpEditAutokodProp(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
var func:function(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase):Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack := GetModuleHandle('SpAutokodProperty.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodPr);
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpEditAutokodProp'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle);
  end;
  LoadSpEditAutokodProp := Res;
end;

function LoadSpRazdAutokod(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
var func:function(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase):Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack := GetModuleHandle('SpRazdLevel.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodL);
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpRazdAutokod'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle);
  end;
  LoadSpRazdAutokod := Res;
end;


function LoadEditSpRazdAutokod(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase):Integer;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase):integer; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('SpRazdLevel.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodL);
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('EditSpRazdAutokod'));
            if @func<>nil
            then func(AOwner, id_user, DBHandle);
  end;
  LoadEditSpRazdAutokod := -1;
end;



function LoadSpEditSpRazdAutokod(AOwner: TComponent; id_user: int64; DBHandle: TpFIBDatabase):Variant;
var func:function(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase):Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack := GetModuleHandle('SpRazdLevel.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+MATAS_PATH+AutoKodL);
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpEditSpRazdAutokod'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle);
  end;
  LoadSpEditSpRazdAutokod := Res;
end;

function LGetSprMdi  (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;
var func:function(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  Res:=0;
  HandlePack:=GetModuleHandle('SchPackage.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('SchPackage.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @func<>nil
            then Res := func(AOwner, DBHandle, fs, Book_date, Root);
  end;
  LGetSprMdi := Res;
end;


function LGetSprModal(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):variant;
var func:function(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):variant;stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack:=GetModuleHandle('SchPackage.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('SchPackage.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('GetSprModal'));
            if @func<>nil
            then Res := func(AOwner, DBHandle, fs, Book_date, Root);
  end;
  LGetSprModal := Res;
end;


function GetIniAnalitic(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(EnumTypeMod);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+EnumTypeMod);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetIniAnalitic'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,FS);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+EnumTypeMod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetIniAnalitic:=Res;
end;



function GetSchAnalitic(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SchAnMod);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SchAnMod);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSchAnalitic'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,FS);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+EnumTypeMod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetSchAnalitic:=Res;
end;


function GetEnumTypeFilter(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;Id_filter_Value:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;Id_filter_Value:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(EnumTypeMod);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+EnumTypeMod);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetEnumTypeFilter'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,FS,Id_filter_Value);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+EnumTypeMod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetEnumTypeFilter:=Res;
end;




function GetEnums(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(EnumTypeMod);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+EnumTypeMod);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetEnumType'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,FS);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+EnumTypeMod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetEnums:=Res;
end;

function GetSchWithOperFilter(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;Id_sch:Integer;Id_sch_In:Integer;In_sch_in_credit:Integer):variant;
var
  HandlePack: HModule;
  MODALFUNC :function (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;Id_sch:Integer;Id_sch_In:Integer;In_sch_in_credit:Integer):variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprSchDll);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprSchDll);

  if HandlePack > 0 then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSchWithOperFilter'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBhandle,FS,Book_Date,Root,Id_sch,Id_sch_In,In_sch_in_credit);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSchDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetSchWithOperFilter:=Res;
end;



function GetSch(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;
var
  HandlePack: HModule;
  MODALFUNC :function (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprSchDll);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprSchDll);

  if HandlePack > 0 then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSch'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBhandle,FS,Book_Date,Root,ID_FU,Id_sch);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSchDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetSch:=Res;
end;

function  GetSchWithOperFilterEx(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer;In_sch_in_credit:Integer):variant;stdcall;
var
  HandlePack: HModule;
  MODALFUNC :function (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer;In_sch_in_credit:Integer):variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprSchDll);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprSchDll);

  if HandlePack > 0 then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSchWithOperFilterEx'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBhandle,FS,Book_Date,Root,ID_FU,Id_sch,In_sch_in_credit);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSchDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetSchWithOperFilterEx:=Res;
end;


function GetSchEx(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;
var
  HandlePack: HModule;
  MODALFUNC :function (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer;ID_FU:Integer;Id_sch:Integer):variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprSchDll);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprSchDll);

  if HandlePack > 0 then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSchEx'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBhandle,FS,Book_Date,Root,ID_FU,Id_sch);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSchDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetSchEx:=Res;
end;



function GetBallanceSpr(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;stdcall;
  MODALFUNC :function(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprSchDll);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprSchDll);

  if HandlePack > 0 then
  begin
    if fs=fsMDIChild //Запускаем справочник в режиме дочернего окна
    then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBhandle,FSMdiChild,Book_Date,Root);
    end;
    if fs=fsNormal  //Запускаем справочник в модальном режиме
    then begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSprModal'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBhandle,FSNormal,Book_Date,Root);
    end;
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSchDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;

  GetBallanceSpr:=Res;
end;


function GetSearchTemplate(Instr:String):string;
var retstr:string;
    i:Integer;
begin
    retstr:=Instr;
    for i:=0 to Length(instr)-1 do
    begin
        if instr[i]='*' then retstr[i]:='%';
        if instr[i]='?' then retstr[i]:='_';
    end;

    GetSearchTemplate:=retstr;
end;


function GetProvs(AOwner:TComponent;DBHandle:TISC_DB_HANDLE; ActualDate:TDateTime; DB_CR_FLAG:Integer;Id_user:Integer;login,user:string;id_form_uch:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DBHandle:TISC_DB_HANDLE; ActualDate:TDateTime; DB_CR_FLAG:Integer;Id_user:Integer;login,user:string;id_form_uch:integer):Variant;stdcall;
  Res:Variant;
  temp_path:string;
begin
  HandlePack:=GetModuleHandle(ProvsSel);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+KERNEL_PATH+ProvsSel;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetProvs'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,ActualDate,DB_CR_FLAG,Id_user,login,user,id_form_uch);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+ProvsSel),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetProvs:=Res;
end;

function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(People);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PUBLIC_PATH+People);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMan'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,false,true,0);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+People),PChar('Увага!'),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetMan:=Res;
end;


function GetAdresses(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;
                     ShowMode:TPublicAdressShowMode;SelectMode:TPublicAdressSelectMode; Id_adress:integer=-1):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;
                      ShowMode:TPublicAdressShowMode;SelectMode:TPublicAdressSelectMode; Id_adress:integer=-1):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Adresses);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+ADDR_PATH+Adresses;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetAdresses'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate,ShowMode,SelectMode,Id_adress);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Adresses),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetAdresses:=Res;
end;


function GetRegions(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Region);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+ADDR_PATH+Region;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetRegions'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Region),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetRegions:=Res;
end;


function GetPlaces(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Place);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+ADDR_PATH+Place;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetPlaces'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Place),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetPlaces:=Res;
end;


function GetDistincts(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Distinct);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+ADDR_PATH+Distinct;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetDistincts'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Distinct),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetDistincts:=Res;
end;


function GetCountries(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Coutry);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+ADDR_PATH+Coutry;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetCountries'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Coutry),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetCountries:=Res;
end;


function GetIniTypeStreet(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(TypeStreet);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+ADDR_PATH+TypeStreet;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetIniTypeStreet'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+TypeStreet),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetIniTypeStreet:=Res;
end;



function GetIniTypeRegion(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(TypeRegion);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+ADDR_PATH+TypeRegion;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetIniTypeRegion'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+TypeRegion),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetIniTypeRegion:=Res;
end;


function GetIniTypePlace(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(TypePlace);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+ADDR_PATH+TypePlace;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetIniTypePlace'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+TypePlace),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetIniTypePlace:=Res;
end;


function GetGroupContact(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(GrCont);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+CUST_PATH+GrCont;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetGroupContact'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+GrCont),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetGroupContact:=Res;
end;


function GetTypeContact(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(TypeCont);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+CUST_PATH+TypeCont;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetTypeContact'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+TypeCont),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetTypeContact:=Res;
end;



function GetIsts(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprIsts);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+CUST_PATH+SprIsts;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetIsts'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+SprIsts),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetIsts:=Res;
end;


function GetBranches(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(BranModule);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+CUST_PATH+BranModule;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetBranches'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+BranModule),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetBranches:=Res;

end;





function GetIniTypeMen(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(IniTM);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path:=ExtractFilePath(Application.ExeName)+CUST_PATH+IniTM;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetIniTypeMen'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+IniTM),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetIniTypeMen:=Res;
end;


function GetCustomers(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode):Variant;
var
  temp_path:string;
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Customers);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      temp_path  :=ExtractFilePath(Application.ExeName)+CUST_PATH+Customers;
      HandlePack := LoadPackage(temp_path);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetCustomers'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate,SeleMode);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Customers),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetCustomers:=Res;
end;


function GetIniAcc(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(IniAccI);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+CUST_PATH+IniAccI);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetIniAcc'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+IniAccI),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetIniAcc:=Res;
end;

function GetSmetsEx(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;Id_sm,id_rz,id_st:Integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode;Id_sm,id_rz,id_st:Integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PubSmetI);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack :=LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+PubSmetI);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSmetsEx'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,ActualDate,Mode,Id_sm,id_rz,id_st);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+PubSmetI),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetSmetsEx:=Res;
end;



function GetSmets(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;ActualDate:TDateTime;Mode:TPublicSmetaMode):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PubSmetI);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack :=LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+PubSmetI);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSmets'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,ActualDate,Mode);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+PubSmetI),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetSmets:=Res;
end;

function GetBanks(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Banks);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+CUST_PATH+Banks);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetBanks'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,FS,ActualDate);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Banks),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetBanks:=Res;
end;

function UseSmeta(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Id_smeta:Int64;Id_plan:Int64):integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Id_smeta:Int64;Id_plan:Int64):integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(UseSmetaDll);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+UseSmetaDll);
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,FS,Book_Date,Id_smeta,Id_plan);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseSmetaDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  UseSmeta:=Res;
end;

procedure GetCnAccounts(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:String);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:String);stdcall;
begin
  HandlePack:=GetModuleHandle(cn_accounts);
  if HandlePack<32
  then begin
            HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+CONTRACTS+cn_accounts);
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetCnAccounts'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,id_user,Login,Pswrd);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+studacc),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

procedure GetStAccounts(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:String);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:String);stdcall;
begin
  HandlePack:=GetModuleHandle(studacc);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+STUDCITY+studacc);
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetStAccounts'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,id_user,Login,Pswrd);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+studacc),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;



procedure DoSmRecalc(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64);stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(UseSmetaDll);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+UseSmetaDll);
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('DoSmRecalc'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DB_Handle,id_user);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseSmetaDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
end;

procedure CalcBuRests(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Integer);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Integer);stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(UseSmetaDll);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+UseSmetaDll);
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('CalcBuRests'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,id_user);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseSmetaDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
end;




procedure DoTch(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(UseSmetaDll);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+UseSmetaDll);
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('DoOtch'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+UseSmetaDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
end;


function GetSmGrp(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer;Id_user:Int64):Variant;
var
  HandlePack: HModule;
  MODALFUNC :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer;Id_user:Int64):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SmGroup);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SmGroup);
  end;

  if HandlePack > 0 then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSmGrp'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DB_HANDLE,FS,ID_FOR_LOCATION,Id_user);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmGroup),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;

function GetTypeFinance(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;id_user:Int64):Variant;
var
  HandlePack: HModule;
  MODALFUNC :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;id_user:Int64):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(typefinanceapp);
  if (HandlePack<32)
  then begin
            HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+typefinanceapp);
  end;
  if (HandlePack>0) then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetTypeFinance'));
            if (@MODALFUNC<>nil)
            then Res:=MODALFUNC(AOwner,DB_HANDLE,fs,id_user);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmPkv),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;


function GetSmPKV(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer):Variant;
var
  HandlePack: HModule;
  MODALFUNC :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SmPkv);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SmPkv);
  end;

  if HandlePack > 0 then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSmPKV'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DB_HANDLE,FS,ID_FOR_LOCATION);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SmPkv),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;



function GetSmetaSpr(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_user:Integer):integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_user:Integer):integer;stdcall;
  MODALFUNC :function(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_user:Integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprSmeta);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SprSmeta);
  end;

  if HandlePack > 0 then
  begin
      if FS=fsMdiChild
      then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,FS,Book_Date,Filter,Id_user);
      end
      else begin

            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSprModal'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBHandle,FS,Book_Date,Filter,Id_user);

      end
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSmeta),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetSmetaSpr:=Res;
end;

procedure Wizard_GetPlanValuesReport(AOwner:TComponent;DBhandle:TISC_DB_Handle;Id_smeta:Int64;Date_beg:TDateTime;Date_end:TDateTime;id_user:Int64);
var
  HandlePack: HModule;
  MODALFUNC :procedure(AOwner:TComponent;DBhandle:TISC_DB_Handle;Id_smeta:Int64;Date_beg:TDateTime;Date_end:TDateTime;id_user:Int64);stdcall;
  Res:Variant;
begin
     HandlePack:=GetModuleHandle(wizard_reports);

     if (HandlePack<32)
     then begin
               HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+wizard_reports);
     end;

     if (HandlePack > 0)
     then begin
               @MODALFUNC:=GetProcAddress(HandlePack,PChar('Wizard_GetPlanValuesReport'));
               if @MODALFUNC<>nil
               then MODALFUNC(AOwner,DBHandle,id_smeta,date_beg,date_end,Id_user);
     end
     else begin
               MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+wizard_reports),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
               Res:=NULL;
     end;
end;


function WIZARD_GetPlan(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_user:Integer):int64;
var
  HandlePack: HModule;
  MODALFUNC :function(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_user:Integer):Variant;stdcall;
  Res:Variant;
begin
     HandlePack:=GetModuleHandle(SprSmeta);

     if (HandlePack<32)
     then begin
               HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SprSmeta);
     end;

     if (HandlePack > 0)
     then begin
               @MODALFUNC:=GetProcAddress(HandlePack,PChar('GL_WIZARD_GetPlan'));
               if @MODALFUNC<>nil
               then Res:=MODALFUNC(AOwner,DBHandle,FS,Book_Date,Filter,Id_user);
     end
     else begin
               MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSmeta),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
               Res:=NULL;
     end;
     WIZARD_GetPlan:=Res;
end;


function WIZARD_GetSmPeriod(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer;Id_smeta:Int64):Variant;
var
  HandlePack: HModule;
  MODALFUNC :function(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer;Id_smeta:Int64):Variant;stdcall;
  Res:Variant;
begin
     HandlePack:=GetModuleHandle(SprSmeta);

     if (HandlePack<32)
     then begin
               HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SprSmeta);
     end;

     if (HandlePack > 0)
     then begin
               @MODALFUNC:=GetProcAddress(HandlePack,PChar('GL_WIZARD_GetSmPeriod'));
               if @MODALFUNC<>nil
               then Res:=MODALFUNC(AOwner,DBHandle,Id_user,Id_smeta);
     end
     else begin
               MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSmeta),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
               Res:=NULL;
     end;
     WIZARD_GetSmPeriod:=Res;
end;



procedure WIZARDInsertBudget(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer);
var
  HandlePack: HModule;
  MDIFUNC   :procedure (AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer);stdcall;
begin
  HandlePack:=GetModuleHandle(SprSmeta);
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+SprSmeta);
  end;

  if HandlePack > 0
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GL_WIZARDInsertBudget'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DBHandle,Id_user);
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprSmeta),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
  end;
end;

function GetAnalize(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle):Integer;stdcall;
  MODALFUNC :function(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; Curr_Date:TdateTime; Id_filter_obj:Integer; ViewMode:TViewMode;FS:TFormStyle):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PropAnDll);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PROP_PATH+PropAnDll);

  if HandlePack > 0 then
  begin
    if fs=fsMDIChild //Запускаем справочник в режиме дочернего окна
    then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMDI'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,Curr_Date,Id_filter_obj,ViewMode,FSMdiChild);
    end;
    if fs=fsNormal  //Запускаем справочник в модальном режиме
    then begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSprModal'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBHandle,Curr_Date,Id_filter_obj,ViewMode,FSNormal);
    end;
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+PropAnDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;

  GetAnalize:=Res;
end;



function GetKEKVSpr(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer):integer;stdcall;
  MODALFUNC :function(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime; Root:Integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprKekv);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprKekv);

  if HandlePack > 0 then
  begin

      if FS=fsNormal
      then begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSprModal'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBHandle,FS,Book_Date,Root);
      end
      else begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,FS,Book_Date,Root);
      end;
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprKekv),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetKEKVSpr:=Res;
end;


function GetRazdStSpr(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode):Variant;stdcall;
  MODALFUNC :function(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Root:Int64;Mode:TRazdStViewMode;Choose:TRazdStChMode):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(RazdDll);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+RazdDll);

  if HandlePack > 0 then
  begin
       if FS=fsMdiChild
       then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMDI'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,FS,Book_Date,Root,Mode,Choose);
       end
       else begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSprModal'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBHandle,FS,Book_Date,Root,Mode,Choose);
       end;
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+RazdDll),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  GetRazdStSpr:=Res;
end;


function GetOperationsSpr(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; FS:TFormStyle; Id_Sch:Integer; Curr_Date:TdateTime; ChooseDB:Boolean):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime):integer;stdcall;
  MODALFUNC :function(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime;ChooseDB:Boolean):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(SprOper);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+SprOper);

  if HandlePack > 0 then
  begin
    if fs=fsMDIChild //Запускаем справочник в режиме дочернего окна
    then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHandle,Id_Sch,Curr_Date);
    end;
    if fs=fsNormal  //Запускаем справочник в модальном режиме
    then begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSprModal'));
            if @MODALFUNC<>nil
            then Res:=MODALFUNC(AOwner,DBHandle,Id_Sch,Curr_Date,ChooseDB);
    end;
  end
  else begin
            MessageBox(TForm(Aowner).Handle,PChar(LoadErrorG+SprOper),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;

  GetOperationsSpr:=Res;
end;


procedure GetSmDReestr(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Integer);
var
  HandlePack: HModule;
  MODALFUNC :procedure(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Integer);stdcall;
begin
  HandlePack:=GetModuleHandle(budocs);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+budocs);

  if HandlePack > 0 then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('GetSmDReestr'));
            if @MODALFUNC<>nil
            then MODALFUNC(AOwner,DBHandle,Id_USER);
  end
  else MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+htmlmod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;


procedure ShowHtmlReport(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);
var
  HandlePack: HModule;
  MODALFUNC :procedure(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);stdcall;
begin
  HandlePack:=GetModuleHandle(htmlmod);
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+SMETA_PATH+htmlmod);

  if HandlePack > 0 then
  begin
            @MODALFUNC:=GetProcAddress(HandlePack,PChar('ShowHtmlReport'));
            if @MODALFUNC<>nil
            then MODALFUNC(AOwner,DB_Handle,Id_USER);
  end
  else MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+htmlmod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;

procedure getBalance(AOwner:TComponent; DB_handle:TISC_DB_HANDLE; id_user:Int64);
var
  HandlePack: HModule;
  MDIFUNC :procedure(AOwner:TComponent; DB_Handle:TISC_DB_HANDLE; Id_USER:Int64);stdcall;
begin
  HandlePack:=GetModuleHandle('Balance.bpl');
  if HandlePack<32
  then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+KERNEL_PATH+'\Balance.bpl');

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('get_Balance'));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DB_Handle,Id_USER);
  end
  else MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+htmlmod),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
end;


initialization

   DB_USER      :='';
   DB_PASSWORD  :='';
   DB_SERVER    :='';
   CORRECT_CONFIG   :=false;
   CORRECT_CONNECT  :=false;
end.
