unit ZSvodLoaderUnit;

interface

uses ZSvodTypesUnit, ZSvodConstsUnit, ZMessages,ZTypes,
     Classes,Windows,Forms,Controls,SysUtils,Variants,Dialogs,iBase;

function PrintReeVed(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id:integer):variant;
function PrintSvodSch(Param:TSvodBySchParam):variant;
function PrintSvodSchSm(Param:TSvodBySchSmParam):variant;
function PrintSvodSm(Param:TSvodParam):variant;
function PrintSvodFOD(Param:TSvodParam):variant;
function PrintSvodOtchisl(Param:TSvodParam):variant;
function PrintSvodFOT(Param:TSvodParam;IsFullSvod:boolean=True):variant;
function LoadDepartmentForSvod(Param:TSvodParam):variant;
function PrintSvodDepartment(Param:TSvodByDepartmentParam):variant;
function PrintRaschVed(Param:TSvodParam;ASystem:TZChildSystems):variant;
function PrintReeHosp(Param:TReeHospParam):variant;
function PrintSimpleReestr(Param:TSimpleReestrParam):variant;
function PrintAvgHosp(Param:TAvgHospParam):variant;
function PrintAvgHol(Param:TAvgHolParam):variant;
function PrintSheetToBank(Param:TSheetToBankParameter):variant;
function PrintSheetAllToBank(Param:TSheetToBankAllParameter):variant;
function PrintRaschList(Param:TZAccListParameter):variant;
function PrintRaschListShort(Param:TZAccListParameter):variant;
function PrintRaschListBySmet(Param:TZAccListParameter):variant;
function PrintAccList(Aowner: TComponent;DB:TISC_DB_HANDLE;AParameter:TZPrintAccListParameter):variant;
function PrintReeList(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_reestr:integer):variant;
function PrintSvodGroupSm(Param:TSvodParam):variant;
function PrintSvodGroupPr(Param:TSvodParam):variant;
function PrintAvgSocInsurance(Param:TAvgSocInsurance):variant;
function PrintSvodP49(Param:TSvodParam):variant;

implementation

function PrintReeVed(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id:integer):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintReeVed_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintReeVed_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintReeVed_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_handle,Id);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintReeVed:=Res;
end;

function PrintSvodSch(Param:TSvodBySchParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodBySchParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(ZSvodConstsUnit.Bpl_PrintSvodSch_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ZSvodConstsUnit.Bpl_PrintSvodSch_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(ZSvodConstsUnit.Func_PrintSvodSch_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintSvodSch:=Res;
end;

function PrintSvodSm(Param:TSvodParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(ZSvodConstsUnit.Bpl_PrintSvodSm_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ZSvodConstsUnit.Bpl_PrintSvodSm_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(ZSvodConstsUnit.Func_PrintSvodSm_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintSvodOtchisl(Param:TSvodParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintSvodOtchisl_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintSvodOtchisl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintSvodOtchisl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintSvodFOD(Param:TSvodParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintSvodFOD_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintSvodFOD_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintSvodFOD_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintSvodFOD:=Res;
end;

function PrintSvodFOT(Param:TSvodParam;IsFullSvod:boolean=True):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam;IsFullSvod:boolean):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintSvodFOT_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintSvodFOT_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintSvodFOT_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param,IsFullSvod);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintSvodFOT:=Res;
end;

function LoadDepartmentForSvod(Param:TSvodParam):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_Department_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Department_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_DepForSvod_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else begin
            MessageBox(TForm(Param.AOwner).Handle,PChar(Load_Error+Bpl_Department_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadDepartmentForSvod:=Res;
end;

function PrintSvodDepartment(Param:TSvodByDepartmentParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodByDepartmentParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintSvodDepartment_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintSvodDepartment_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintSvodDepartment_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintSvodDepartment:=Res;
end;

function PrintRaschVed(Param:TSvodParam;ASystem:TZChildSystems):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintRaschVed_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintRaschVed_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintRaschVed_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintRaschVed:=Res;
end;

function PrintReeHosp(Param:TReeHospParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TReeHospParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_ReeHosp_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ReeHosp_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ReeHosp_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintSimpleReestr(Param:TSimpleReestrParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSimpleReestrParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_SimpleReestr_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SimpleReestr_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SimpleReestr_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintSimpleReestr:=Res;
end;

function PrintAvgHosp(Param:TAvgHospParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TAvgHospParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintAvgHosp_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintAvgHosp_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintAvgHosp_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintAvgSocInsurance(Param:TAvgSocInsurance):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TAvgSocInsurance):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintAvgSocInsurance_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintAvgSocInsurance_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintAvgSocInsurance_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintAvgHol(Param:TAvgHolParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TAvgHolParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_PrintAvgHol_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintAvgHol_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintAvgHol_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintSheetToBank(Param:TSheetToBankParameter):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSheetToBankParameter):Variant;stdcall;
  Res:Variant;
begin

  HandlePack:=GetModuleHandle(PChar(Bpl_PrintSheetToBank_Name));
  if HandlePack<32
  then
             try
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintSheetToBank_Name);
             finally
                Screen.Cursor:=crDefault;
             end;


  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintSheetToBank_Name));
            if @MDIFUNC<>nil then Res:=MDIFUNC(Param);
  end
  else begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
  end;
  Result:=Res;
end;

function PrintSheetAllToBank(Param:TSheetToBankAllParameter):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSheetToBankAllParameter):Variant;stdcall;
  Res:Variant;
begin

  HandlePack:=GetModuleHandle(PChar(Bpl_PrintSheetToBank_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintSheetToBank_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
              @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintSheetAllToBank_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintRaschList(Param:TZAccListParameter):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TZAccListParameter):variant;stdcall;
  Res:Variant;
begin

  HandlePack:=GetModuleHandle(PChar(Bpl_RaschList_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_RaschList_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_RaschList_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintRaschListShort(Param:TZAccListParameter):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TZAccListParameter):variant;stdcall;
  Res:Variant;
begin

  HandlePack:=GetModuleHandle(PChar(Bpl_RaschListShort_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_RaschListShort_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_RaschListShort_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintRaschListBySmet(Param:TZAccListParameter):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TZAccListParameter):variant;stdcall;
  Res:Variant;
begin

  HandlePack:=GetModuleHandle(PChar(Bpl_RaschListBySmeta_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_RaschListBySmeta_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_RaschListBySmeta_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintAccList(Aowner: TComponent;DB:TISC_DB_HANDLE;AParameter:TZPrintAccListParameter):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent;DB:TISC_DB_HANDLE;AParameter:TZPrintAccListParameter):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_AccList_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
//      ShowMessage(ExtractFilePath(Application.ExeName)+Bpl_AccList_Name);
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_AccList_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_AccList_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AParameter);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_AccList_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;

function PrintReeList(Aowner: TComponent;DB_Handle:TISC_DB_HANDLE;id_reestr:integer):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent;DB:TISC_DB_HANDLE;id_reestr:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_ReeList_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
//      ShowMessage(ExtractFilePath(Application.ExeName)+Bpl_AccList_Name);
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ReeList_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ReeList_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_Handle,id_reestr);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ReeList_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;

function PrintSvodGroupSm(Param:TSvodParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(ZSvodConstsUnit.Bpl_PrintSvodGroupSm_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ZSvodConstsUnit.Bpl_PrintSvodGroupSm_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(ZSvodConstsUnit.Func_PrintSvodGroupSm_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintSvodGroupPr(Param:TSvodParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(ZSvodConstsUnit.Bpl_PrintSvodGroupPr_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ZSvodConstsUnit.Bpl_PrintSvodGroupPr_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(ZSvodConstsUnit.Func_PrintSvodGroupPr_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;


function PrintSvodP49(Param:TSvodParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(ZSvodConstsUnit.Bpl_PrintSvodP49_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ZSvodConstsUnit.Bpl_PrintSvodP49_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(ZSvodConstsUnit.Func_PrintSvodP49_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

function PrintSvodSchSm(Param:TSvodBySchSmParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodBySchSmParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(ZSvodConstsUnit.Bpl_PrintSvodSchSm_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+ZSvodConstsUnit.Bpl_PrintSvodSchSm_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(ZSvodConstsUnit.Func_PrintSvodSchSm_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            ZShowMessage(Error_Caption,Load_Error,mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintSvodSchSm:=Res;
end;

end.
