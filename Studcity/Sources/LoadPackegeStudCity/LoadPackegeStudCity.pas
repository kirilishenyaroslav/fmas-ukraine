unit LoadPackegeStudCity;

interface

uses Forms, Windows,Dialogs,SysUtils,Variants,Classes,
     Controls,pFIBDataBase,IBase;


resourcestring
     LoadErrorG=           'Ошибка при работе с библиотекой';
     ErrorCaptionG=        'Внимание ошибка!';




{PATH}
const Path_studcity ='studcity\';
{Name_BPL}
const Name_st_sp_build          ='st_sp_build.bpl';
const Name_LoadReports          ='RepotsFromDPK.bpl';
const Name_LoadReportsFilter    ='ReportsFilterDPK.bpl';
const Name_LoadReportsView      ='ReportsViewDPK.bpl';
const Name_LoadSubsReestr       ='SubsReestrDPK.bpl';
const Name_LoadGetFileSubsOtdel ='GetFileSubsOtdelDPK.bpl';
const Name_LoadWorkSubsOtdel    ='WorkSubsOtdelDPK.bpl';
const Name_LoadViewBuildsRooms  ='ViewBuildsRoomsDPK.bpl';
const Name_LoadWorkWithNarush   ='WorkWithNarushDPK.bpl';
const Name_LoadWorkListROVD     ='List_ROVDDPK.bpl';
const Name_LoadGetSpravZarplata ='GetSpravZPDPK.bpl';
const Name_LoadConfig           ='GetSpravZPDPK.bpl';
const Name_LoadReestrSubs       ='RegNachSub.bpl';
const Name_LoadPrintForms       ='PrintsFormsPack.bpl';


function Loadst_sp_build(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;


function LoadReports(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

function LoadReportsForm(AOwner : TComponent;DB:TISC_DB_HANDLE;NameBPL:String):Integer;

function LoadReportsFilter(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_TRANS:Int64):Integer;

function LoadReportsFilterEX(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_TRANS:Int64;StyleFilter:Variant):Integer;

function LoadReportsView(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer; is_debug:Boolean=false):Integer;

function LoadSudsReestr(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

//забор данных из службы субсидий
function LoadGetFileSubsOtdel(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

//обработка списка из службы субсидий
function LoadWorkSubsOtdel(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

//просмотр данных по общежитиям и комнатам
function LoadViewBuildsRooms(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

//справочник нарушений
function LoadSpNarush(AOwner : TComponent;DB:TISC_DB_HANDLE;frmST:TFormStyle):Variant;

//работа с нарушителями
function LoadWorkWithNarush(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;id_user:Int64):Integer;

//Форма печатных форм
function LoadViewDocPrint(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;


//вызов печатных форм по прописке и документах оплаты
function LoadViewPrintPropi(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer;Name_Shablon:String):Integer;

//Печать списка в РОВД
function LoadListROVD(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

//Забор справок из ЗП
function LoadGetSpravZP(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

function LoadReportsViewPayOnDay(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,sql_master_add,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer):Integer;

Function LoadReestrSuds(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

Function LoadPrintForms(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

//Настройки
function LoadConfig(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;

implementation

function Loadst_sp_build(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_st_sp_build);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_st_sp_build);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('Loadst_sp_build'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_st_sp_build),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Loadst_sp_build:=Res;
end;

function LoadReports(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadReports);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadReports);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadReports'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadReports),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReports:=Res;
end;

function LoadReportsForm(AOwner : TComponent;DB:TISC_DB_HANDLE;NameBPL:String):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PAnsiChar(NameBPL+'.bpl'));
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+NameBPL+'.bpl');
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(NameBPL));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadReports),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReportsForm:=Res;
end;

function LoadReportsFilter(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_TRANS:Int64):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_TRANS:Int64):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadReportsFilter);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadReportsFilter);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadReportsFilter'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,ID_TRANS);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadReportsFilter),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReportsFilter:=Res;
end;

function LoadReportsFilterEX(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_TRANS:Int64;StyleFilter:Variant):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_TRANS:Int64;StyleFilter:Variant):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadReportsFilter);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadReportsFilter);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadReportsFilterEX'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,ID_TRANS,StyleFilter);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadReportsFilter),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReportsFilterEX:=Res;
end;


function LoadReportsView(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer;is_debug:boolean = false):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer;is_debug : boolean):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadReportsView);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadReportsView);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ReportsView'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Type_Report,Sql_Master,Sql_detail,FieldView,NotFieldView,FieldNameReport,Report_Name,LastIgnor,is_debug);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadReportsView),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReportsView:=Res;
end;

function LoadSudsReestr(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadSubsReestr);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadSubsReestr);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadSudsReestr'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadSubsReestr),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadSudsReestr:=Res;
end;

function LoadGetFileSubsOtdel(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadGetFileSubsOtdel);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadGetFileSubsOtdel);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadGetFileSubsOtdel'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadGetFileSubsOtdel),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadGetFileSubsOtdel:=Res;
end;

function LoadWorkSubsOtdel(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadWorkSubsOtdel);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadWorkSubsOtdel);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadWorkSubsOtdel'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadWorkSubsOtdel),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadWorkSubsOtdel:=Res;
end;

function LoadViewBuildsRooms(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadWorkSubsOtdel);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadViewBuildsRooms);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadViewBuildsRooms'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadViewBuildsRooms),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadViewBuildsRooms:=Res;
end;

function LoadSpNarush(AOwner : TComponent;DB:TISC_DB_HANDLE;frmST:TFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;frmST:TFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadWorkWithNarush);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadWorkWithNarush);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadSpNarush'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,frmST);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadWorkWithNarush),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadSpNarush:=Res;
end;

function LoadWorkWithNarush(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;id_user:Int64):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;id_user:Int64):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadWorkWithNarush);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadWorkWithNarush);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadWorkWithNarush'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,id_people,id_user);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadWorkWithNarush),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadWorkWithNarush:=Res;
end;


function LoadViewDocPrint(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadReportsView);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadReportsView);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ViewDocPrintR'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,id_people,type_doc_print);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadReportsView),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadViewDocPrint:=Res;
end;


function LoadViewPrintPropi(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer;Name_Shablon:String):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Name_Shablon+'DPK.bpl'));
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_Shablon+'DPK.bpl');
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Name_Shablon));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,id_people,type_doc_print);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_Shablon),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadViewPrintPropi:=Res;
end;

function LoadListROVD(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadGetFileSubsOtdel);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadWorkListROVD);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ListROVD'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadWorkListROVD),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadListROVD:=Res;
end;

function LoadGetSpravZP(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadGetSpravZarplata);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadGetSpravZarplata);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetSprav'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadGetSpravZarplata),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadGetSpravZP:=Res;
end;


function LoadReportsViewPayOnDay(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,sql_master_add,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_Report:Integer;
          Sql_Master,sql_master_add,Sql_Detail:String;FieldView,NotFieldView,FieldNameReport:Variant;Report_Name:String;LastIgnor:Integer):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadReportsView);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadReportsView);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ReportsViewOnDay'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Type_Report,Sql_Master,sql_master_add,Sql_detail,FieldView,NotFieldView,FieldNameReport,Report_Name,LastIgnor);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadReportsView),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReportsViewPayOnDay:=Res;
end;

function LoadConfig(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_st_sp_build);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadConfig);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadConfig'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadConfig),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadConfig:=Res;
end;

function LoadReestrSuds(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadReestrSubs);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadReestrSubs);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadReestrSuds'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadReestrSubs),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReestrSuds:=Res;
end;


function LoadPrintForms(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Name_LoadPrintForms);
  if HandlePack<32
  then begin
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_studcity+Name_LoadPrintForms);
      Screen.Cursor:=crDefault;
  end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadPrintForms'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorG+Name_LoadPrintForms),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPrintForms:=Res;
end;

end.
