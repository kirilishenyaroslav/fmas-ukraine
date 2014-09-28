unit cn_Common_Loader;

interface

uses cn_Common_Types, cn_Common_WaitForm, cn_Common_Messages, cnConsts,
     cn_Common_Funcs,
     Classes,Windows,Forms,Controls,SysUtils,Variants,Dialogs;

function RunFunctionFromPackage(AParameter:TcnSimpleParams;Bpl_Name:string;Func_Name:string):variant;
function RunFunctionFromPackageForBank(AParameter:TcnSimpleParamsEx;Bpl_Name:string;Func_Name:string):variant;
function RunDissInfoFromPackage(AParameter:TcnSimpleParams;Bpl_Name:string;Func_Name:string):TDissInfo;
function  Load_cnAccess(AOwner:TComponent):TcnAccessResult;
function  Load_Final(AOwner : TComponent):boolean;
procedure LoadAboutInfo(Aowner:TComponent);
procedure Load_cn_WhatsNew(AOwner : TComponent);

implementation

const Bpl_cnAccess_Name   = 'Contracts\cn_Access.bpl';
const Bpl_st_Final        = 'Contracts\cn_lxsFinal.bpl';

function RunFunctionFromPackage(AParameter:TcnSimpleParams;Bpl_Name:string;Func_Name:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TcnSimpleParams):Variant;stdcall;
  Res:Variant;
  wf:TForm;
  PLanguageIndex:Byte;
begin
  PLanguageIndex:=cnLanguageIndex;
  HandlePack:=GetModuleHandle(PChar(Bpl_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      //if Assigned(AParameter.Db_Handle) then ShowMessage('Handle in LoadFromPackage');
      wf:=ShowWaitForm(AParameter.WaitPakageOwner,wfLoadPackage);
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Name);
   finally
      CloseWaitForm(wf);
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
           cnShowMessage(cn_Error_Caption[PLanguageIndex],cn_Error_LoadBPL_Text[PLanguageIndex]+#13+Bpl_Name,mtError,[mbOk]);
           Res:=NULL;
   end;
  Result:=Res;
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function RunFunctionFromPackageForBank(AParameter:TcnSimpleParamsEx;Bpl_Name:string;Func_Name:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TcnSimpleParamsEx):Variant;stdcall;
  Res:Variant;
  wf:TForm;
  PLanguageIndex:Byte;
begin
  PLanguageIndex := cnLanguageIndex;
  HandlePack:=GetModuleHandle(PChar(Bpl_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      //if Assigned(AParameter.Db_Handle) then ShowMessage('Handle in LoadFromPackage');
      wf:=ShowWaitForm(AParameter.WaitPakageOwner,wfLoadPackage);
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Name);
   finally
      CloseWaitForm(wf);
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
           cnShowMessage(cn_Error_Caption[PLanguageIndex],cn_Error_LoadBPL_Text[PLanguageIndex]+#13+Bpl_Name,mtError,[mbOk]);
           Res:=NULL;
   end;
  Result:=Res;
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function RunDissInfoFromPackage(AParameter:TcnSimpleParams;Bpl_Name:string;Func_Name:string):TDissInfo;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TcnSimpleParams):TDissInfo;stdcall;
  Res:TDissInfo;
  wf:TForm;
  PLanguageIndex:Byte;
begin
  PLanguageIndex:=cnLanguageIndex;
  HandlePack:=GetModuleHandle(PChar(Bpl_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      wf:=ShowWaitForm(AParameter.WaitPakageOwner,wfLoadPackage);
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Name);
   finally
      CloseWaitForm(wf);
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
           cnShowMessage(cn_Error_Caption[PLanguageIndex],cn_Error_LoadBPL_Text[PLanguageIndex]+#13+Bpl_Name,mtError,[mbOk]);
          // Res:=NULL;
   end;
  Result:=Res;
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure LoadAboutInfo(Aowner:TComponent);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent);stdcall;
//  wf:TForm;
  PLanguageIndex:Byte;
begin
  PLanguageIndex:=cnLanguageIndex;
  HandlePack:=GetModuleHandle('cn_About.bpl');
  if HandlePack<32
  then
   try
      //wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\Contracts\cn_About.bpl');
     // CloseWaitForm(wf);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,'ShowAboutInfo');
            if @MDIFUNC<>nil
            then MDIFUNC(Aowner);
  end
  else
   cnShowMessage(cn_Error_Caption[PLanguageIndex],cn_Error_LoadBPL_Text[PLanguageIndex]+#13+ExtractFilePath(Application.ExeName)+'\Contracts\cn_About.bpl',mtError,[mbOk]);
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Load_cnAccess(AOwner:TComponent):TcnAccessResult;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent):TcnAccessResult;stdcall;
  Res:TcnAccessResult;
  PLanguageIndex:Byte;
begin
  PLanguageIndex:=cnLanguageIndex;
  HandlePack:=GetModuleHandle(Bpl_cnAccess_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_cnAccess_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAccess'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner);
  end
  else
   begin
               cnShowMessage(cn_Error_Caption[PLanguageIndex],cn_Error_LoadBPL_Text[PLanguageIndex]+#13+ExtractFilePath(Application.ExeName)+ Bpl_cnAccess_Name,mtError,[mbOk]);
            Res.ID_User:=-1;
   end;
  Load_cnAccess:=Res;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////
function Load_Final(AOwner : TComponent):boolean;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent):boolean;stdcall;
  Res:boolean;
  PLanguageIndex:Byte;
begin
  PLanguageIndex:=cnLanguageIndex;
  HandlePack:=GetModuleHandle(Bpl_st_Final);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_st_Final);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('View_Final'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner);
  end
  else
   begin
            cnShowMessage(cn_Error_Caption[PLanguageIndex],cn_Error_LoadBPL_Text[PLanguageIndex]+#13+ExtractFilePath(Application.ExeName)+ Bpl_st_Final,mtError,[mbOk]);
            Res:=NULL;
   end;
  Load_Final:=Res;
end;
/////////////////////////////////////////////////////////////////////////////////////
procedure Load_cn_WhatsNew(Aowner:TComponent);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner:TComponent);stdcall;
  PLanguageIndex:Byte;
begin
  PLanguageIndex:=cnLanguageIndex;
  HandlePack:=GetModuleHandle('cn_WhatsNew.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\Contracts\cn_WhatsNew.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,'View_WhatsNew');
            if @MDIFUNC<>nil
            then MDIFUNC(Aowner);
  end
  else
   cnShowMessage(cn_Error_Caption[PLanguageIndex],cn_Error_LoadBPL_Text[PLanguageIndex]+#13+ExtractFilePath(Application.ExeName)+'\Contracts\cn_WhatsNew.bpl',mtError,[mbOk]);
end;

end.
