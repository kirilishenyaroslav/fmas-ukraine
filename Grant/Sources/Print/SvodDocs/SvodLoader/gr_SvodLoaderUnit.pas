unit gr_SvodLoaderUnit;

interface

uses gr_SvodTypesUnit, gr_SvodConstsUnit, gr_uMessage,ZTypes,
     Classes,Windows,Forms,Controls,SysUtils,Variants,Dialogs,iBase,
     gr_uCommonConsts, gr_uCommonProc;

function PrintSvodSch(Param:TSvodBySchParam):variant;
function PrintRaschList(Param:TZAccListParameter):variant;

implementation

function PrintSvodSch(Param:TSvodBySchParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TSvodBySchParam):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Stud_SvodBySch[1]));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Stud_SvodBySch[1]);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Stud_SvodBySch[2]));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            grShowMessage(ECaption[IndexLanguage],ELoadBPLText[IndexLanguage]+#13+PChar(Stud_SvodBySch[1]),mtError,[mbOk]);
            Res:=NULL;
   end;
  PrintSvodSch:=Res;
end;

function PrintRaschList(Param:TZAccListParameter):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TZAccListParameter):variant;stdcall;
  Res:Variant;
begin

  HandlePack:=GetModuleHandle(PChar(Stud_RaschList[2]));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Stud_RaschList[1]);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Stud_RaschList[2]));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param);
  end
  else
   begin
            grShowMessage(ECaption[IndexLanguage],ELoadBPLText[IndexLanguage]+#13+PChar(Stud_SvodBySch[1]),mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

end.
