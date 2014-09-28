//******************************************************************************
// Проект "ГорВодоКанал" (BS)
// Файл функций загрузки
// Перчак А.Л.
// создан 18/01/2010
// последние изменения Перчак А.Л. 18/01/2010
//******************************************************************************
unit uCommon_Loader;

interface

uses uCommon_Types, uCommon_WaitForm, uCommon_Messages, uConsts, uCommon_Funcs,
     Classes, Windows, Forms, Controls, SysUtils, Variants, Dialogs;

function  RunFunctionFromPackage(AParameter:TbsSimpleParams;Bpl_Name:string;Func_Name:string):variant;
function  Load_bsAccess(AOwner:TComponent):TbsAccessResult;
function  Load_Final(AOwner : TComponent):boolean;
procedure LoadAboutInfo(Aowner:TComponent);
procedure Load_bs_WhatsNew(AOwner : TComponent);

implementation

const Bpl_bs_Access_Name   = 'BillingSystem\bs_Access.bpl';
const Bpl_bs_Final        = 'BillingSystem\bs_lxsFinal.bpl';

function RunFunctionFromPackage(AParameter:TbsSimpleParams;Bpl_Name:string;Func_Name:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   : function(AParameter:TbsSimpleParams):Variant;stdcall;
  Res:Variant;
  wf:TForm;
  PLanguageIndex:Byte;
begin
  PLanguageIndex := bsLanguageIndex;
  HandlePack:=GetModuleHandle(PChar(Bpl_Name));
  if HandlePack<32
  then
   try
    Screen.Cursor := crHourGlass;
    wf := ShowWaitForm(AParameter.WaitPakageOwner,wfLoadPackage);
    HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Name);
   finally
    CloseWaitForm(wf);
    Screen.Cursor:=crDefault;
   end;
  if HandlePack > 0 then
   begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Name));
    if @MDIFUNC<>nil then Res:=MDIFUNC(AParameter);
   end
  else
   begin
    bsShowMessage(bs_Error_Caption[PLanguageIndex],bs_Error_LoadBPL_Text[PLanguageIndex]+#13+Bpl_Name,mtError,[mbOk]);
    Res:=NULL;
   end;
  Result:=Res;
end;

//Загрузка справки о продукте
procedure LoadAboutInfo(Aowner:TComponent);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent);stdcall;
  PLanguageIndex:Byte;
begin
  PLanguageIndex := bsLanguageIndex;
  HandlePack := GetModuleHandle('bs_About.bpl');
  if HandlePack<32
  then
   try
    Screen.Cursor:=crHourGlass;
    HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\BillingSystem\bs_About.bpl');
   finally
    Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
   @MDIFUNC:=GetProcAddress(HandlePack,'ShowAboutInfo');
   if @MDIFUNC<>nil then MDIFUNC(Aowner);
  end
  else
   bsShowMessage(bs_Error_Caption[PLanguageIndex],bs_Error_LoadBPL_Text[PLanguageIndex]+#13+ExtractFilePath(Application.ExeName)+'\BillingSystem\bs_About.bpl',mtError,[mbOk]);
end;

//Загрузка формы логина и пароля
function Load_bsAccess(AOwner:TComponent):TbsAccessResult;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent):TbsAccessResult;stdcall;
  Res:TbsAccessResult;
  PLanguageIndex:Byte;
begin
  PLanguageIndex:=bsLanguageIndex;
  HandlePack:=GetModuleHandle(Bpl_bs_Access_Name);
  if HandlePack<32
  then
   try
    Screen.Cursor:=crHourGlass;
    HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_bs_Access_Name);
   finally
    Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
   @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAccess'));
   if @MDIFUNC<>nil then Res:=MDIFUNC(AOwner);
  end
  else
   begin
    bsShowMessage(bs_Error_Caption[PLanguageIndex],bs_Error_LoadBPL_Text[PLanguageIndex]+#13+ExtractFilePath(Application.ExeName)+ Bpl_bs_Access_Name,mtError,[mbOk]);
    Res.ID_User:=-1;
   end;
  Load_bsAccess := Res;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////
function Load_Final(AOwner : TComponent):boolean;
var
  HandlePack : HModule;
  MDIFUNC    : function(AOwner : TComponent):boolean;stdcall;
  Res : boolean;
  PLanguageIndex : Byte;
begin
  PLanguageIndex := bsLanguageIndex;
  HandlePack:=GetModuleHandle(Bpl_bs_Final);
  if HandlePack<32 then
   try
    Screen.Cursor:=crHourGlass;
    HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_bs_Final);
   finally
    Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
   begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar('View_Final'));
    if @MDIFUNC<>nil then Res:=MDIFUNC(AOwner);
   end
  else
   begin
    bsShowMessage(bs_Error_Caption[PLanguageIndex],bs_Error_LoadBPL_Text[PLanguageIndex]+#13+ExtractFilePath(Application.ExeName)+ Bpl_bs_Final,mtError,[mbOk]);
    Res:=NULL;
   end;
  Load_Final:=Res;
end;

/////////////////////////////////////////////////////////////////////////////////////
procedure Load_bs_WhatsNew(Aowner:TComponent);
var
  HandlePack     : HModule;
  MDIFUNC        : procedure(AOwner:TComponent);stdcall;
  PLanguageIndex : Byte;
begin
  PLanguageIndex := bsLanguageIndex;
  HandlePack:=GetModuleHandle('bs_WhatsNew.bpl');
  if HandlePack<32 then
   try
    Screen.Cursor:=crHourGlass;
    HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\BillingSystem\bs_WhatsNew.bpl');
   finally
    Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
   begin
    @MDIFUNC:=GetProcAddress(HandlePack,'View_WhatsNew');
    if @MDIFUNC<>nil then MDIFUNC(Aowner);
   end
  else
   bsShowMessage(bs_Error_Caption[PLanguageIndex],bs_Error_LoadBPL_Text[PLanguageIndex]+#13+ExtractFilePath(Application.ExeName)+'\BillingSystem\bs_WhatsNew.bpl',mtError,[mbOk]);
end;

end.
