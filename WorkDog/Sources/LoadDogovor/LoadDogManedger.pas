unit LoadDogManedger;

interface
uses
     Forms, Windows, IBase, Dialogs, SysUtils, Variants, Classes, Controls, GlobalSPR,
     pFIBDataBase, pFIBDataSet, IB_Externals, cxGridDBTableView, AccMgmt, IniFiles,
     pFIBStoredProc, Halcn6db, DB;

resourcestring
     LoadErrorG=           'Помилка при роботі з бібліотекою ';
     ErrorCaptionG=        'Увага помилка!';

type
 TResAction = (raAdd, raEdit, raView, raClose);

 TResProc = procedure (id : int64; action : TResAction) of object;




 TShablonInputData = record
  bUse     : Boolean;  //использовать ли присланные параметры
  num      : string;   //номер договора
  date_dog : TDate;    //дата договора
  note     : string;   //основание договора
  summa    : currency; //сумма договора
  id_rate_account    : Integer; //ид-р счета контрагента
  id_rate_acc_native : Integer; //ид-р собственного счета
 end;
 PShablonInputData = ^TShablonInputData;

{PATH}

const PathDogovor ='WorkDog\';
const PathPeople ='';

const ARND_SCH_TYPE_MDI_CHILD = 1;
const ARND_SCH_TYPE_MDI_NORMAL =2;
const ARND_SCH_TYPE_IMPORT =3;

{name bpl}
const WorkTypeDogSPRbpl      ='SprTypeDog.bpl';
const WorkSpMfoRschbpl       ='SprMfoRsch.bpl';
const WorkShablonbpl         ='ShablonDogovora.bpl';
const WorkNdsProcentbpl      ='NdsProcent.bpl';
const WorkDogbpl             ='WorkDog.bpl';
const WorkGroupDocbpl        ='GroupDoc.bpl';
const WorkDogPlbpl           ='WorkDogPl.bpl';
const Add_smetabpl           ='Add_smeta.bpl';
const SavePlDocbpl           ='SavePlDoc.bpl';
const PlatProsmbpl           ='PlatProsm.bpl';
const ArndSchBPL             ='ArndSch.bpl';
const Shablon_VCVbpl         ='Shablon_vcv.bpl';
const SprPeoplebpl           ='SpAllPeople.bpl';
const Predoplbpl             ='Predoplata.bpl';
const AddKoshtbpl            ='AddKosht.bpl';
const AddKoshtPrbpl          ='AddKoshtPr.bpl';
const History_dogbpl         ='History_dog.bpl';
const ZayavInfobpl           ='ZayavInfo.bpl';
const BankBufferbpl          ='BankBuffer.bpl';
const EditSumbpl             ='EditSum.bpl';
const Commentbpl             ='Comment.bpl';
//////////////////
const Shablon_1bpl           ='Shablon_1.bpl';
const Shablon_2bpl           ='Shablon_2.bpl';
const Shablon_3bpl           ='Shablon_3.bpl';
const Shablon_4bpl           ='Shablon_4.bpl';
const Shablon_5bpl           ='Shablon_5.bpl';
//////////////////
const ReeUrzbbpl             ='ReeUrzb.bpl';
const ReeFnzbbpl             ='ReeFnzb.bpl';
const Optimizationbpl        ='Optimization.bpl';
const FavourBpl              ='SpFavour.bpl';

const Load_Error             = 'Файл пакета не знайдено!!!';
const Error_Caption          = 'Помилка';

/////////////////////////////////////////////
procedure FillBufferTable(WriteTransaction : TpFIBTransaction; WorkDataBase : TpFIBDatabase);

function GetIBType(HalcyonField :TField): String;

function GetBuffPath : string;

function WorkTypeDogSPR(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Get_param:String; proc : TResProc; Group: Variant; const data: PShablonInputData):Variant;

function WorkSpMfoRsch(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String; id_rate_native: Variant):Variant;

function WorkNdsProcent(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;

function WorkDog(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;

function WorkDogRed(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant):Variant;

function WorkGroupDoc(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String):Variant;

function WorkDogPl(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;
// Работа с шаблонами
function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant; name_shablon: PAnsiChar; proc : TResProc; data : PShablonInputData = nil):Variant;
//Добавление сметы
function Add_smeta(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;
//сохранение платекжи
function SavePlDoc(AOwner : TComponent;pFIBDataSet_work_dog : TpFIBDataSet; Database : PVOID; TransHandle : PVOID; id_dog: Variant; Data_pl:TDate;num_pl : integer) : integer;
//просмотр платежки
function PlatProsm(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle; id_key: Variant; Pr_vizova: String; proc : TResProc):Variant;
//справочник физических лиц
function SprPeople(AOwner:TComponent; DBHANDLE:TISC_DB_HANDLE; MultiSelect:Boolean; CanEdit:Boolean; id_people: Variant):Variant; stdcall;
//вызов предоплаты
function LoadShablonPr(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant; name_shablon:  PAnsiChar; proc : TResProc; sum_predopl: Variant):Variant;
//добавление сметы, раздела, статьи
function AddKosht(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency; Mode: Integer {1-добавить,2-редактировать};
                  id_s, id_r, id_st, id_k: Integer; s_smet: Currency; DateDog: TDate):Variant;
//добавление сметы, раздела, статьи
function AddKoshtPr(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency; Mode: Integer {1-добавить,2-редактировать};
                  id_s, id_r, id_st, id_k: Integer; s_smet: Currency; DateDog: TDate;DateBeg:TDate;DateEnd:TDate):Variant;
//добавление услуги под под договором аренды
function AddFavour(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;Mode: string):Variant;
//Реестр выставленных счетов на аренду
function ShowArndSch(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : Integer; group: Integer; id_dog: Integer): variant;
//Шаблон на ВЦВ
function Shablon_VCV(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE):Variant;
//история изменений договора
function History_dog(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; id_dog: Variant; frmStyle:TFormStyle):Variant;
//Просмотр заявок и оплаты по р/счету
function ZayavInfo(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; where_cond: String; id_rate_acc_native: Variant):Variant;
//буфер
function BankBuffer(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
//Изменение суммы договора
function EditSum(AOwner : TComponent; is_nds: Integer; sum_pay, nds_pay, sum_dog, sum_nds: Currency):Variant;
//Реестр юридических обязательств
function ReeUrzb(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
//Реестр финансовых обязательств
function ReeFnzb(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
//Ввод комментариев
function Comment(AOwner : TComponent; text: String; Mode: String):Variant;
//filterDogURFN
function LoadfilterDogURFNPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string):Variant;
//Диплом
function Optimization(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
function MyRoundTo(y:Double):Double;

implementation

uses FIBDatabase, Registry, FIBDataSet, pFIBProps,pFIBQuery;

//////////////////////////////////////////////////
//Типы договоров
function WorkTypeDogSPR(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Get_param:String; proc : TResProc; Group: Variant; const data: PShablonInputData):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Get_param:String; proc : TResProc; Group: Variant; const data: PShablonInputData):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(WorkTypeDogSPRbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+WorkTypeDogSPRbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('WorkTypeDogSPR'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle,get_param, proc, group, data);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkTypeDogSPRbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  WorkTypeDogSPR:=Res;
end;

//Справочник банковских и регистрационных реквизитов ДонНУ
function WorkSpMfoRsch(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String;id_rate_native: Variant):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String; id_rate_native: Variant):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(WorkSpMfoRschbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+WorkSpMfoRschbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('WorkSpMfoRsch'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle,Pr_vizova,id_rate_native);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkSpMfoRschbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  WorkSpMfoRsch:=Res;
end;


//Процент НДС
function WorkNdsProcent(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(WorkNdsProcentbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+WorkNdsProcentbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('WorkNdsProcent'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkNdsProcentbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  WorkNdsProcent:=Res;
end;

//////////////////Работа с договорами (добавление)
function WorkDog(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(WorkDogbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+WorkDogbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('WorkDog'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkDogbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  WorkDog:=Res;
end;

//////////////////Работа с договорами (редактирование)
function WorkDogRed(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle; id_dokument: Variant):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(WorkDogbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+WorkDogbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('WorkDogRed'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle,id_dokument);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkDogbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  WorkDogRed:=Res;
end;

////////////////////////////////////////////////////////////
//Справочник груп документов
function WorkGroupDoc(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(WorkGroupDocbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+WorkGroupDocbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('WorkGroupDoc'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle,pr_vizova);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkSpMfoRschbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  WorkGroupDoc:=Res;
end;


//////////////////Работа с платежками
function WorkDogPl(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(WorkDogbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+WorkDogPlbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('WorkDogPl'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+WorkDogbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  WorkDogPl:=Res;
end;


//Вызов шаблонов
//////////////////////////////////////////////////////////////////////////////////////
function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; name_shablon:  PAnsiChar; proc : TResProc; data : PShablonInputData = nil):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant;
                      Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
  Res:Variant;
  Name_sh : PAnsiChar;
  Query :  TpFIBQuery;
  DataSet : TpFIBDataSet;
  res_q   : Integer;
begin
 Name_sh:=name_shablon;

// 
 // if TForm(aowner).FormStyle <> fsMDIForm then frmStyle := fsNormal;
  HandlePack:=GetModuleHandle(name_shablon);

   if HandlePack<32
     then begin
        Screen.Cursor:=crHourGlass;
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Name_sh);
        Screen.Cursor:=crDefault;
     end;
    if HandlePack > 0 then
    begin
              @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadShablon'));
//              @MDIFUNC:=GetProcAddress(HandlePack,PChar('Load'+Name_sh));
              if @MDIFUNC<>nil
              then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle,id_dokument,Pr_vizova,id_t_d, proc, data);
    end
    else begin
              MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_sh),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
              Res:=NULL;
    end;
LoadShablon:=Res;
end;


//Вызов предоплаты
//////////////////////////////////////////////////////////////////////////////////////
function LoadShablonPr(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; name_shablon:  PAnsiChar; proc : TResProc; sum_predopl: Variant):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant;
                      Pr_vizova: String; Id_t_d: Variant; proc : TResProc; sum_predopl: Variant):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Predoplbpl);

   if HandlePack<32
     then begin
        Screen.Cursor:=crHourGlass;
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Predoplbpl);
        Screen.Cursor:=crDefault;
     end;
    if HandlePack > 0 then
    begin
              @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadShablonPr'));
              if @MDIFUNC<>nil
              then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle,id_dokument,Pr_vizova,id_t_d, proc, sum_predopl);
    end
    else begin
              MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Predoplbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
              Res:=NULL;
    end;
LoadShablonPr:=Res;
end;

//Добавление сметы/раздела/статьи
function Add_smeta(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Add_smetabpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Add_smetabpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('Add_smeta'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Add_smetabpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Add_smeta:=Res;
end;
//добавление услуги под под договором аренды
function AddFavour(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;Mode: string):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;Mode: string):Variant;stdcall;
  Res:Variant;
begin
 ShowMessage('W0W!');
end;

//Сохранение платежки
function SavePlDoc(AOwner : TComponent;pFIBDataSet_work_dog : TpFIBDataSet; Database : PVOID; TransHandle : PVOID; id_dog: Variant; Data_pl:TDate;num_pl : integer) : integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(pFIBDataSet_work_dog : TpFIBDataSet; Database : PVOID; TransHandle : PVOID; id_dog: Variant; Data_pl:TDate;num_pl : integer): integer;stdcall;
begin
  Result:= 0;
  HandlePack:=GetModuleHandle(SavePlDocbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+SavePlDocbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('SavePlDoc'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(pFIBDataSet_work_dog, Database, TransHandle, id_dog, data_pl, num_pl);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+SavePlDocbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
end;

//просмотр/изменение платежки
function PlatProsm(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_key: Variant; Pr_vizova: String; proc : TResProc):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_key: Variant; Pr_vizova: String; proc : TResProc):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PlatProsmbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+PlatProsmbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('PlatProsm'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,frmStyle, id_key, pr_vizova, proc);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+PlatProsmbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  PlatProsm:=Res;
end;

//справочник физических лиц
function SprPeople(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; MultiSelect: Boolean; CanEdit: Boolean; id_people: Variant):Variant;stdcall;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; MultiSelect: Boolean; CanEdit: Boolean; id_people: Integer):Variant;stdcall;
  Res:Variant;
  I:Integer;
begin

  HandlePack:=GetModuleHandle(SprPeoplebpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathPeople+SprPeoplebpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMan'));
            if @MDIFUNC<>nil
            then
            begin
              i:=(id_people);
              Res:=MDIFUNC(AOwner,DBHANDLE,MultiSelect,CanEdit,i);
            end;
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+SprPeoplebpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  SprPeople := Res;

end;

//Добавление сметы, раздела, статьи
function AddKosht(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency; Mode: Integer {1-добавить,2-редактировать};
                  id_s, id_r, id_st, id_k: Integer; s_smet: Currency; DateDog: TDate):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency; Mode: Integer {1-добавить,2-редактировать};
                  id_s, id_r, id_st, id_k: Integer; s_smet: Currency; DateDog: TDate):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(AddKoshtbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+AddKoshtbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('AddKosht'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,sum_doc,mode,id_s,id_r,id_st,id_k,s_smet,DateDog);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+AddKoshtbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  AddKosht:=Res;
end;
// -------------------------------------------------------------------------------
// Добавление Кошториса/сметы с возможностью указания разрядности
function AddKoshtPr(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency; Mode: Integer {1-добавить,2-редактировать};
                  id_s, id_r, id_st, id_k: Integer; s_smet: Currency; DateDog: TDate;DateBeg: TDate;DateEnd: TDate):Variant;
var
 HandlePack: HModule;
 MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency; Mode: Integer {1-добавить,2-редактировать};
                  id_s, id_r, id_st, id_k: Integer; s_smet: Currency; DateDog: TDate;DateBeg:TDate;DateEnd:TDate):Variant;stdcall;
 Res:Variant;
begin
  HandlePack:=GetModuleHandle(AddKoshtPrbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+AddKoshtPrbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('AddKosht'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,sum_doc,mode,id_s,id_r,id_st,id_k,s_smet,DateDog,DateBeg,DateEnd);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+AddKoshtbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  AddKoshtPr:=Res;
end;
// -------------------------------------------------------------------------------

//аренда
function ShowArndSch(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : Integer; group: Integer; id_dog: Integer): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : Integer; group: Integer; id_dog: Integer): variant; stdcall;
 Res : Variant;
begin
 try
 HandlePack := GetModuleHandle(ArndSchBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(PathDogovor + ArndSchBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('ArndSch'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, WTrans, FS, group, id_dog);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadErrorG + ArndSchBPL), PChar(ErrorCaptionG), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;
 ShowArndSch := Res;

   except
  on E:Exception do begin

  end;
  end;


end;

function Shablon_VCV(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Shablon_VCVbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Shablon_VCVbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('Shablon_VCV'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Shablon_VCVbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Shablon_VCV:=Res;
end;

//история договора
function History_dog(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; id_dog: Variant; frmStyle:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; id_dog: Variant; frmStyle:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(History_dogbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+History_dogbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('History_dog'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,id_dog,fsMDIChild); ///WARNING
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+History_dogbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  History_dog:=Res;
end;

function GetBuffPath : string;
begin
 Result := ExtractFileDir(Application.ExeName) + '\';
end;

procedure FillBufferTable(WriteTransaction : TpFIBTransaction; WorkDataBase : TpFIBDatabase);
var
  IniFile : TMemIniFile;
  i, k, j, lh : integer;
  StorProc: TpFIBStoredProc;
  DataSet : TpfibDataset;
  isExists : boolean;
  HalcyonDataset: THalcyonDataSet;
  s, name_buff: String;
  q : TpFIBQuery;
begin
  if not FileExists(GetBuffPath + 'buffer.ini') then exit;
  IniFile := TMemIniFile.Create(GetBuffPath + 'buffer.ini');

  StorProc := TpFIBStoredProc.Create(Nil);
  StorProc.Database := WorkDataBase;
  StorProc.Transaction := WriteTransaction;

  DataSet := TpfibDataset.Create(Nil);
  DataSet.Database := WorkDataBase;
  DataSet.Transaction := WriteTransaction;
  DataSet.SQLs.SelectSQL.Text := 'select * from dog_dt_bankbuff';
  DataSet.PrepareOptions := DataSet.PrepareOptions + [psAskRecordCount];
  DataSet.Active := true;

  //пройтись по таблице dog_dt_bankbuff и проверить существует ли данная запись
    i := 1;
    isExists := false;
    while IniFile.SectionExists(IntToStr(i)) do
    begin
    //записи датасета
     DataSet.Active := false;
     DataSet.Active := true;
     DataSet.First;
     for k := 0 to DataSet.RecordCount-1 do
      begin
        if (Trim(AnsiUpperCase(DataSet.FieldByName('path_buff').Value)) = Trim(AnsiUpperCase(IniFile.ReadString(IntToStr(i),'path','')))) then
        begin
          isExists := true;
          break;
        end;
        DataSet.Next;
      end;
      if not isExists then
      begin
        StorProc.StoredProcName := 'DOG_DT_BANKBUFF_INSERT';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('comment').Value := IniFile.ReadString(IntToStr(i),'comment','');
        StorProc.ParamByName('path_buff').Value := IniFile.ReadString(IntToStr(i),'path','');
        StorProc.ParamByName('prog_dele').Value := IniFile.ReadString(IntToStr(i),'prog_save','');
        StorProc.ParamByName('prog_save').Value := IniFile.ReadString(IntToStr(i),'prog_dele','');
        StorProc.ExecProc;
        StorProc.Transaction.Commit;
        //для нового банка нужно создать таблицу и процедуру добавления в дублирующий буфер в интербейз

        q := TpFIBQuery.Create(Nil);
        q.DataBase := WorkDataBase;
        q.Transaction := WriteTransaction;
        q.Transaction.StartTransaction;


       name_buff := ExtractFileName(IniFile.ReadString(IntToStr(i),'path',''));
       lh := Length(name_buff);
       Delete(name_buff,lh-4,4);

       //создаем генератор
       q.SQL.Text := 'CREATE GENERATOR BUFF_' + name_buff + '_ID;';
       q.ExecQuery;


 //       'SET GENERATOR '+
 //        Copy(ExtractFileName(IniFile.ReadString(IntToStr(i),'path',''), 1, Length(Pos('.', ExtractFileName(IniFile.ReadString(IntToStr(i),'path',''))) - Pos('.', ExtractFileName(IniFile.ReadString(IntToStr(i),'path',''))) +
 //        + '_ID' + ' TO 1';

        //из dbf забираем типы полей
        HalcyonDataset := THalcyonDataSet.Create(Nil);
        HalcyonDataSet.Close;
        HalcyonDataSet.DatabaseName := ExtractFilePath(IniFile.ReadString(IntToStr(i),'path',''));
        HalcyonDataSet.TableName := ExtractFileName(IniFile.ReadString(IntToStr(i),'path',''));
        HalcyonDataSet.Open;

        for j := 0 to  HalcyonDataSet.FieldCount - 1 do
        begin
         s := s + HalcyonDataSet.Fields[j].FieldName + ' ' + GetIBType(HalcyonDataSet.Fields[j]) + ', ';
        end;




//        HalcyonDataSet.Fields[0].FieldName;

        //создаем таблицу
        // 'CREATE TABLE BUFF_' +

      end;
      i := i + 1;
    end;

  StorProc.Free;
  DataSet.Free;
end;

function GetIBType(HalcyonField : TField): String;
begin
  if HalcyonField.DataType = ftString then
  begin
    Result := 'VARCHAR ' + '(' + IntToStr(HalcyonField.DataSize - 1) + ')';
  end;
  if HalcyonField.DataType = ftInteger then Result := 'INTEGER';
  if HalcyonField.DataType = ftSmallint then Result := 'SMALLINT';
  if HalcyonField.DataType = ftWord then Result := 'INTEGER';
  if HalcyonField.DataType = ftBoolean then Result := 'INTEGER';
  if HalcyonField.DataType = ftFloat then Result := 'NUMERIC(16,2)';
  if HalcyonField.DataType = ftCurrency then Result := 'NUMERIC(16,2)';
  if HalcyonField.DataType = ftDate then Result := 'DATE';
  if HalcyonField.DataType = ftTime then Result := 'TIME';
  if HalcyonField.DataType = ftDateTime then Result := 'TIMESTAMP';
end;


function ZayavInfo(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; where_cond: String; id_rate_acc_native: Variant):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; where_cond: String; id_rate_acc_native: Variant):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(ZayavInfobpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+ZayavInfobpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ZayavInfo'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,where_cond,id_rate_acc_native);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+ZayavInfobpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  ZayavInfo:=Res;
end;

function BankBuffer(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(BankBufferbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+BankBufferbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('BankBuffer'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,RTrans,WTrans);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+BankBufferbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  BankBuffer:=Res;
end;

function EditSum(AOwner : TComponent; is_nds: Integer; sum_pay, nds_pay, sum_dog, sum_nds: Currency):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; is_nds: Integer; sum_pay, nds_pay, sum_dog, sum_nds: Currency):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(EditSumbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+EditSumbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('EditSum'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,is_nds,sum_pay,nds_pay,sum_dog,sum_nds);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+EditSumbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  EditSum:=Res;
end;

function ReeUrzb(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(ReeUrzbbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+ReeUrzbbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ReeUrzb'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,RTrans,WTrans);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+ReeUrzbbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  ReeUrzb:=Res;
end;

function ReeFnzb(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(ReeFnzbbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+ReeFnzbbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ReeFnzb'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,RTrans,WTrans);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+ReeFnzbbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  ReeFnzb:=Res;
end;

function Comment(AOwner : TComponent; text: String; Mode: String):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; text: String; Mode: String):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Commentbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Commentbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('Comment'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner, text, Mode);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Commentbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Comment:=Res;
end;

function Optimization(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Optimizationbpl);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Optimizationbpl);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('Optimization'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,RTrans,WTrans);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Optimizationbpl),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Optimization:=Res;
end;

function MyRoundTo(y:Double):Double;
var
  x:Double;
begin

 x:=y;
 x:=x*100;
 if(abs(x - System.int(x)) >= 0.5) then
  if (x<0) then  x:=System.int(x)-1
  else x:=System.int(x)+1
 else
  x:=System.int(x);
 x:=x/100;
 Result:=x;
end;

function LoadfilterDogURFNPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(BplName));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+BplName);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(FunctionName));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadfilterDogURFNPackage:=Res;
end;

end.
