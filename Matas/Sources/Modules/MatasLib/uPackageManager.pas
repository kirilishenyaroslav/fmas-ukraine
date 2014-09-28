{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uPackageManager;

interface
uses Forms, Windows, IBase, Dialogs, SysUtils, Variants, Classes, Controls,
     pFIBDataBase, IB_EXTERNALS, uCommonSp, uMatasVars, uResources, uMatasUtils;

type
  TfmMyShablon = (Shablon_doc, Shablon_ostatok);
  TFormMode = (fmAdd, fmModify);
  TLinearSpravFunc = function (AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id : int64) : Variant; stdcall;
  TCusomersSpravFunc = function (AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_customer, id_rate_account, id_man : int64) : Variant; stdcall;
  TPublicAdressShowMode=(SHOWALLADRESSES, SHOWONLYADRESS);
  TPublicAdressSelectMode=(WORK, WORK_SELECT, SELECT);

//Работа со справочником единиц измерения
function ShowUnitMeas(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_unit_meas : int64) : Variant;
function ShowGroupUnitMeas(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_group_unit : int64) : Variant;

function LGetSprMdi  (AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;
function LGetSprModal(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):variant;

// Работа со справочником операций
function LGetSprOperMdi  (AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime):integer;stdcall;
function LGetSprOperModal(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime; ChooseDB:Boolean):Variant;stdcall;

// Справочник подразделений
function ShowSpDepartment(AOwner : TComponent; DBHandle : PVoid; id_user: int64) : Variant;

// Справочник физ.лиц
//function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE):Variant;
function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; aID_MAN: integer):Variant;

// Справочник норм износа
procedure ShowNormIzn(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;

// Работа с печатью шаблонов
function LPrtShablon(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;  TransactionHandle : TISC_TR_HANDLE; id_tipd, id_doc : integer; modeShablon : TfmMyShablon):integer;

//Работа со Номенклатор
function LGetNomn(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aFS: TFormStyle; aID_USER : INT64;
                  aID_NOMN: int64;  aID_PROP: int64; aNType: integer; aMView: integer;
                  aMSelect:integer; aLang: integer):Variant;

// Работа со документами
procedure LDocWork(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime);stdcall;
procedure LDocWork_Compare(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE;  aID_USER : INT64;WORK_PERIOD: TDateTime; doc:integer);stdcall;
procedure LOstWork(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

// Работа с остатками, оборотками и отчетами
procedure ShowMoOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowOperProv(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowOper51(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowOstBase(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
procedure ShowOstCur(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
procedure ShowOstIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
procedure ShowOborotByMO(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
procedure ShowOstReport(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowBegOst(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
procedure ShowInvReport(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ViewDoc(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_DOC: integer);stdcall;
procedure ShowSchOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowOperIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowMBook(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowAnalize(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowAnalizeTMC(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ViewOborot(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;
procedure ShowDragMetRepForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
procedure ShowNoMoves(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowWareHouseKart(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowVedPereoc(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
procedure ShowSchCommonOborot(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
procedure ShowIstFinOborot(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: INT64);stdcall;
procedure ShowPrintOstForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: INT64);stdcall;
procedure ShowIznosMNAForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: INT64);stdcall;
procedure ShowRoshifrIznosMNAForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: INT64);stdcall;
procedure ShowBSOKart(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
procedure ShowOstBaseIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

function ShowMORep(AOwner:TComponent; DB: TISC_DB_HANDLE):Integer;

// работа с фильтром по ТМЦ
function GetGruppTMC(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String; POS:Integer):Variant;stdcall;
function GetTMC(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;stdcall;

// дополнительные функции
procedure ShowTools(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
procedure DoSchSaldoManager(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
procedure DoSchManager(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

function SaveMainBookInProv(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime):boolean;stdcall;

function InvKartWork(AOwner:TComponent; aID_USER: int64; aDB: TpFIBDatabase):Integer;stdcall;

procedure MnaKartWork(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

// Фильтр номенклатуры
function ShowNomnFilter(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Int64; var aNomnList: string):boolean;stdcall;

// Фильтр по счетам, бюджетам, статьям, КЕКЗам
//function ShowUniFilter(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Int64; var aNomnList: string):boolean;stdcall;

{
// Работа со справочниками
// Справочник МОЛов
function LGetMatOtv(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_MO: integer):Variant;stdcall;
procedure LShowSpMatOtv(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

// Справочник счетов (материальных)
function LGetMatSch(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; ID_SCH: integer):Variant; stdcall;
function LGetMatSchEx(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aMode: integer; ID_SCH: integer; SCH_NUMBER: string):Variant; stdcall;

// Справочник образцов операций
function LGetOper(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; ID_OPER: integer):Variant;stdcall;
procedure LShowSpOper(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

// СПравочник типов докумнтов
function LGetTipDoc(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aIsOsn: integer):Variant; stdcall;
function LGetTipDocEx(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_TIPD: integer):Variant; stdcall;
procedure LShowSpTipDoc(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64); stdcall;
}

implementation

procedure LDocWork(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasDoc.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasDoc.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('DocWork'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, WORK_PERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasDoc.bpl'));
 end;
end;

procedure LDocWork_Compare(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime; doc:integer);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; WORK_PERIOD: TDateTime; doc:integer);stdcall;
begin
 hPack := GetModuleHandle('MatasDoc.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasDoc.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('DocWork_Compare'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, WORK_PERIOD, doc);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasDoc.bpl'));
 end;
end;

procedure LOstWork(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasDoc.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasDoc.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('OstWork'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasDoc.bpl'));
 end;
end;

procedure ShowNoMoves(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepNoMoves'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowOstBaseIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasMain.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasMain.bpl');
 if hPack > 0 then
 begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOstBaseIstFin'));
  if @SpravProc <> NIL then
  begin
    SpravProc(AOwner, DBHANDLE, aID_USER);
  end;
 end
 else
 begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasMain.bpl'));
 end;
end;
//procedure ShowRepOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
procedure ShowOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepOborot'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowBSOKart(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('MatasBSOKart.bpl');
 if hPack < 32 then  hPack := LoadPackage('Matas\MatasBSOKart.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowBsoKarts'));
  if @SpravProc <> NIL then  SpravProc(AOwner, aDBHANDLE); 
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasBsoKart.bpl'));
 end;
end;


procedure ShowWareHouseKart(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasWHKart.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasWHKart.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowWareHouseKart'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasWHKart.bpl'));
 end;
end;

procedure ShowVedPereoc(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasPereoc.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasPereoc.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowVedPereoc'));
  if @SpravProc <> NIL then SpravProc(aOwner, aDBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasPereoc.bpl'));
 end;
end;

procedure ShowNormIzn(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('MatasSpr.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasSpr.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowSpNormIzn'));
  if @SpravProc <> NIL then SpravProc(aOwner, aDBHANDLE);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasSpr.bpl'));
 end;
end;

procedure ShowSchOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepSchOborot'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowMoOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepMoOborot'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowOperProv(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepOperProv'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowMBook(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasMBook.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasMBook.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepMainBook'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasMBook.bpl'));
 end;
end;

procedure ShowOper51(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepOper51'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowOperIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepOperIstFin'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowAnalize(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasAnalize.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasAnalize.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepAnalize'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasAnalize.bpl'));
 end;
end;

procedure ShowAnalizeTMC(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasAnalizeTMC.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasAnalizeTMC.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepAnalizeTMC'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasAnalizeTMC.bpl'));
 end;
end;

procedure ShowDragMetRepForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasDragMet.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasDragMet.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepDragMetForm'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasDragMet.bpl'));
 end;
end;

procedure ViewOborot(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('MatasOborot.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasOborot.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOborot'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasOborot.bpl'));
 end;
end;


procedure ShowOstReport(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepOst'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowInvReport(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 hPack := GetModuleHandle('MatasRep.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasRep.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRepInv'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER, aPERIOD);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasRep.bpl'));
 end;
end;

procedure ShowOstBase(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasMain.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasMain.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOstBase'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasMain.bpl'));
 end;
end;

procedure ShowBegOst(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasMain.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasMain.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowBegOst'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasMain.bpl'));
 end;
end;

procedure ShowOstIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasMain.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasMain.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOstIstFin'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasMain.bpl'));
 end;
end;

procedure ShowOstCur(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasMain.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasMain.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOstCur'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasMain.bpl'));
 end;
end;

procedure ShowOborotByMO(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasMain.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasMain.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOborotByMO'));
  if @SpravProc <> NIL then SpravProc(AOwner, DBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasMain.bpl'));
 end;
end;

function LGetNomn(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aFS: TFormStyle; aID_USER : INT64;
                  aID_NOMN: int64;  aID_PROP: int64; aNType: integer; aMView: integer;
                  aMSelect:integer; aLang: integer):Variant;
var
 hPack     : HModule;
 SpravFunc : function (aOwner:TComponent;
                     DBHANDLE : TISC_DB_HANDLE;
                     aFS: TFormStyle;   {стиль формы: fsModal или fsMDIChild}
                     aID_USER : INT64; {ид.пользователя}
                     aID_NOMN: int64;  {ид.номенклатуры, если >0, то пытаемся позицироваться}
                     aID_PROP: int64;  {ид. свойства, если >0, то фильтруем записи по свойству, (пока не реализовано!)}
                     aNType: integer;  {фильтр на тип записей: 0 - все, 1 -  ТМЦ, 2 - услуги}
                     aMView: integer;  {пока не используется }
                     aMSelect:integer; {тип выбора записей: 0 - выбор одной записи, 1 - мультивыбор записей, 2 - выбор группы }
                     aLang: integer    {язык интерфейса: 0 - русский (по умолчанию), 1 - украинский}
  ):Variant;stdcall;
 Res:Variant;
begin
 hPack := GetModuleHandle('SpNom.bpl');
 if hPack < 32 then hPack := LoadPackage('SpNom.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetNomnEx'));
  if @SpravFunc <> NIL then Res := SpravFunc(aOwner, DBHANDLE, aFS, aID_USER, aID_NOMN, aID_PROP, aNType, aMView, aMSelect, aLang);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'SpNom.bpl'));
 end;
 LGetNomn:=Res;
end;

function LGetSprOperMdi(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime):integer;
var func:function(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime):integer;stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('OperPackage.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('Kernell\OperPackage.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('GetSprMdi'));
            if @func<>nil
            then Res := func(AOwner, DBHandle, id_sch, curr_date);
  end;
  LGetSprOperMdi := Res;
end;

function LGetSprOperModal(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime; ChooseDB:Boolean):variant;
var func:function(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; Id_Sch:Integer; Curr_Date:TdateTime; ChooseDB:Boolean):variant;stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('OperPackage.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('Kernell\OperPackage.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('GetSprModal'));
            if @func<>nil
            then Res := func(AOwner, DBHandle, id_sch, curr_date, ChooseDB);
  end;
  LGetSprOperModal := Res;
end;

function LPrtShablon(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;  TransactionHandle : TISC_TR_HANDLE; id_tipd, id_doc : integer; modeShablon : TfmMyShablon):integer;
var func:function(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;  TransactionHandle : TISC_TR_HANDLE; id_tipd, id_doc : integer; modeShablon : TfmMyShablon):integer;stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  HandlePack:=GetModuleHandle('MatasLib.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('MatasLib.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('PrtShablon'));
            if @func<>nil
            then Res := func(AOwner, DBHANDLE, TransactionHandle, id_tipd, id_doc, modeShablon);
  end;
  LPrtShablon := -1;
end;

function ShowSpDepartment(AOwner : TComponent; DBHandle : PVoid; id_user: int64) : Variant;
var
 sp: TSprav;
begin
 // создать справочник
 sp := GetSprav('SpDepartment.bpl');
 if sp <> nil then
  begin
   // заполнить входные параметры
   with sp.Input do
   begin
    Append;
    FieldValues['DBHandle'] := Integer(DBHandle);
    // MDI-окно
    FieldValues['ShowStyle'] := 1;
    // без выборки
    FieldValues['Select'] := 0;
    FieldValues['Root_Department'] := _ID_DEP_ROOT;
    // смотрим на текущую дату
    FieldValues['Actual_Date'] := Date;
    Post;
   end;
  end;
 sp.Show;
end;

function LGetSprMdi(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;
var func:function(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; FS:TFormStyle; Book_Date:TDateTime;Root:Integer):integer;stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
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


function LoadSpAutoKod(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Variant;
var func:function(AOwner:TComponent; id_user : int64;DBHandle: TpFIBDatabase): Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack:=GetModuleHandle('AutoKodBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('Matas\AutoKodBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func:=GetProcAddress(HandlePack,PChar('SpAutoKod'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle);
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
      HandlePack := LoadPackage('Matas\AutoKodBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('EditSpAutoKod'));
            if @func<>nil
            then func(AOwner, id_user, DBHandle);
  end;
  LoadEditSpAutoKod := -1;
end;

function LoadSpEditSpAutoKod(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase): Variant;
var func:function(AOwner:TComponent; id_user : int64; DBHandle: TpFIBDatabase):Variant; stdcall;
    HandlePack: HModule;
    Res: Variant;
begin
  HandlePack := GetModuleHandle('AutoKodBPL.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('Matas\AutoKodBPL.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpEditSpAutoKod'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle);
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
      HandlePack := LoadPackage('SpAutokodProperty.bpl');
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
      HandlePack := LoadPackage('SpAutokodProperty.bpl');
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
      HandlePack := LoadPackage('SpAutokodProperty.bpl');
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
      HandlePack := LoadPackage('SpRazdLevel.bpl');
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
      HandlePack := LoadPackage('SpRazdLevel.bpl');
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
      HandlePack := LoadPackage('SpRazdLevel.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SpEditSpRazdAutokod'));
            if @func<>nil
            then Res := func(AOwner, id_user,DBHandle);
  end;
  LoadSpEditSpRazdAutokod := Res;
end;

function ShowUnitMeas(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_unit_meas : int64) : Variant;
var
 hPack     : HModule;
 SpravFunc : TLinearSpravFunc;
 Res:Variant;
begin
 hPack := GetModuleHandle('SpUnitMeas.bpl');
 if hPack < 32 then hPack := LoadPackage('SpUnitMeas.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('ShowSprav2'));
  if @SpravFunc <> NIL then Res := SpravFunc(AOwner, DBHandle, fs, id_unit_meas);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'SpUnitMeas.bpl'));
  Res := NULL;
 end;
 ShowUnitMeas:=Res;
end;

function ShowGroupUnitMeas(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_group_unit : int64) : Variant;
var
 hPack     : HModule;
 SpravFunc : TLinearSpravFunc;
begin
 hPack := GetModuleHandle('Unit_Meas.bpl');
 if hPack < 32 then hPack := LoadPackage('Unit_Meas.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('ShowSprav'));
  if @SpravFunc <> NIL then Result := SpravFunc(AOwner, DBHandle, fs, id_group_unit);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'Unit_Meas.bpl'));
  Result := NULL;
 end;
end;

function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; aID_MAN: integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; aMultiEdit: boolean; aAllowEdit: boolean; aID_MAN: integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle('SpAllPeople.bpl');
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'SpAllPeople.bpl');
      Screen.Cursor:=crDefault;
  end;
  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMan'));
    if @MDIFUNC<>nil
    then Res:=MDIFUNC(AOwner, DBHANDLE, false, false, aID_MAN);
  end
  else begin
   MessageBox(TForm(AOwner).Handle,PChar(MAT_STR_LOAD_BPL_ERROR+'SpAllPeople.bpl'),PChar(MAT_STR_ERROR),MB_OK and MB_ICONWARNING);
   Res:=NULL;
  end;
  GetMan:=Res;
end;

procedure ViewDoc(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_DOC: integer);stdcall;
var
  HandlePack: HModule;
  MDIFUNC   :procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_DOC: integer);stdcall;
begin
  HandlePack:=GetModuleHandle('MatasDoc.bpl');
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'Matas\MatasDoc.bpl');
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar('ViewDoc'));
    if @MDIFUNC<>nil
    then MDIFUNC(AOwner, aDBHANDLE, aID_DOC);
  end
  else begin
   MessageBox(TForm(AOwner).Handle,PChar(MAT_STR_LOAD_BPL_ERROR+' MatasDoc.bpl'),PChar(MAT_STR_ERROR),MB_OK and MB_ICONWARNING);
  end;
end;

function InvKartWork(AOwner:TComponent; aID_USER : int64; aDB: TpFIBDatabase):Integer;
var func:function(AOwner:TComponent; id_user : int64; DB: TpFIBDatabase): Integer; stdcall;
    HandlePack: HModule;
    Res: Integer;
begin
  Res:=-1;
  HandlePack := GetModuleHandle('MatasInvKart.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ 'Matas\MatasInvKart.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('InvWork'));
            if @func<>nil
            then Res := func(AOwner, aID_USER, aDB);
  end
  else begin
   MessageBox(TForm(AOwner).Handle,PChar(MAT_STR_LOAD_BPL_ERROR+' MatasInvKart.bpl'),PChar(MAT_STR_ERROR),MB_OK and MB_ICONWARNING);
  end;
  InvKartWork := Res;
end;

procedure MnaKartWork(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasMna.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasMna.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowMnaKart'));
  if @SpravProc <> NIL then SpravProc(AOwner, aDBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasMna.bpl'));
 end;
end;

procedure DoSchSaldoManager(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasTools.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasTools.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('SchSaldoManager'));
  if @SpravProc <> NIL then SpravProc(AOwner, aDBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasTools.bpl'));
 end;
end;

procedure DoSchManager(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasTools.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasTools.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('SchManager'));
  if @SpravProc <> NIL then SpravProc(AOwner, aDBHANDLE, aID_USER);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasTools.bpl'));
 end;
end;

procedure ShowTools(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('MatasTools.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasTools.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowTools'));
  if @SpravProc <> NIL then SpravProc(AOwner, aDBHANDLE);
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasTools.bpl'));
 end;
end;

function ShowMORep(AOwner:TComponent; DB: TISC_DB_HANDLE):Integer;
var
 func:function(AOwner:TComponent; DB: TISC_DB_HANDLE): Integer; stdcall;
 HandlePack: HModule;
 Res: Integer;
begin
  HandlePack := GetModuleHandle('MatasMO.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'Matas\MatasMO.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('ShowReport'));
            if @func<>nil
            then Res := func(AOwner, DB);
  end;
end;

function ShowNomnFilter(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Int64; var aNomnList: string):boolean;stdcall;
var
 hPack     : HModule;
 SpravProc : function (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Int64; var aNomnList: string):boolean;stdcall;
begin
 hPack := GetModuleHandle('MatasFilter.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasFilter.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowNomnFilter'));
  if @SpravProc <> nil then
  begin
   Result:=SpravProc(aOwner, aDBHANDLE, aID_SESSION, aNomnList);
  end
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasFilter.bpl'));
 end;
end;

procedure ShowSchCommonOborot(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('MatasOborot.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasOborot.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowSchCommonOborot'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE);
  end
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasOborot.bpl'));
 end;
end;

procedure ShowIstFinOborot(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasIstFin.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasIstFin.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowIstFinOborot'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE, aID_USER);
  end
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasIstFin.bpl'));
 end;
end;

procedure ShowPrintOstForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasInvObject.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasInvObject.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowPrintOstForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE, aID_USER);
  end
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasInvObject.bpl'));
 end;
end;

procedure ShowIznosMNAForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasIznosMNA.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasIznosMNA.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowIznosMNAForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE, aID_USER);
  end
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasIznosMNA.bpl'));
 end;
end;

procedure ShowRoshifrIznosMNAForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: INT64);stdcall;
begin
 hPack := GetModuleHandle('MatasIznosMNA.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasIznosMNA.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowRazshifrIznosMNAForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE, aID_USER);
  end
 end else begin
  ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasIznosMNA.bpl'));
 end;
end;

function GetGruppTMC(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String; POS:Integer):Variant;
var func:function(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String; POS:Integer):Variant; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('MatasFilterNomn.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('Matas\MatasFilterNomn.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('GetGruppTMC'));
            if @func<>nil
            then result:=func(AOwner,DBHANDLE, ID_USER ,_ID_SESSION,_ID_OBJECT, DATE_SESSION,NameForm, POS);
  end;
end;

function GetTMC(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;
var func:function(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant; stdcall;
    HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('MatasFilterNomn.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('Matas\MatasFilterNomn.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('GetTMC'));
            if @func<>nil
            then result:=func(AOwner,DBHANDLE, ID_USER ,_ID_SESSION,_ID_OBJECT, DATE_SESSION,NameForm);
  end;
end;

function SaveMainBookInProv(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime):boolean;
var
  func:function(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime):boolean;stdcall;
  HandlePack: HModule;
begin
  HandlePack := GetModuleHandle('MatasMBook.bpl');
  if HandlePack<32
  then begin
      HandlePack := LoadPackage('Matas\MatasMBook.bpl');
  end;

  if HandlePack > 0 then
  begin
            @func := GetProcAddress(HandlePack,PChar('SaveMainBookInProv'));
            if @func<>nil
            then result:=func(aOwner, DBHANDLE, aID_USER, aPERIOD);
  end;
end;

end.


