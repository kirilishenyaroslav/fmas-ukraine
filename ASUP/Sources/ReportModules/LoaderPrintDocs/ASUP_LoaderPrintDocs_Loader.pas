unit ASUP_LoaderPrintDocs_Loader;

interface

uses ASUP_LoaderPrintDocs_Types, ASUP_LoaderPrintDocs_Consts,
     ASUP_LoaderPrintDocs_Messages, ASUP_LoaderPrintDocs_WaitForm,
     Classes,Windows,Forms,Controls,SysUtils,Variants,Dialogs;

function DoFunctionFromPackage(AParameter:TObject;Bpl_Name:string;Func_Name:string):variant;

implementation

function DoFunctionFromPackage(AParameter:TObject;Bpl_Name:string;Func_Name:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TObject):Variant;stdcall;
  Res:Variant;
  wf:TForm;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_Name));
  if HandlePack<32
  then
   try
      wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Name);
      CloseWaitForm(wf);
   finally
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
            AsupShowMessage(Error_Caption,Error_LoadBPL_Text+#13+Bpl_Name,mtError,[mbOk]);
            Res:=NULL;
   end;
  Result:=Res;
end;

end.
