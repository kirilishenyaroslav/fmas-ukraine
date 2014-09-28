unit JO5_Proc;

interface

uses Windows, Classes, Forms, IBase, Jo5_Types, Jo5_dmStorProc, dxBar, Controls;
//Procedures
procedure Jo5_CloseAllWindows;

//Functions
function IndexLanguage:byte;
function GetSysInfo(AOwner:TComponent; AHandle:TISC_DB_HANDLE;id_system:Integer):TJo5SysInfo;
function GetRegInfo(AOwner:TComponent; AHandle:TISC_DB_HANDLE;id_reg:Integer):string;
function MDIFormExists(MDIClass:String):Boolean;
function MDIGetForm(MDIClass:String):TForm;
function DisableServiceMenu:Boolean;

implementation

uses SysUtils, FIBQuery;

procedure Jo5_CloseAllWindows;
var
  i:integer;
begin
  for i:=0 to Application.MainForm.MDIChildCount-1 do
    Application.MainForm.MDIChildren[i].Close;
end;

function IndexLanguage:byte;
begin
 Result:=1;
end;

function GetRegInfo(AOwner:TComponent; AHandle:TISC_DB_HANDLE;id_reg:Integer):string;
var
  pDM:TStoredProcDM;
begin
  pDM:=TStoredProcDM.Create(AOwner,AHandle);
  pDM.StorProc.Transaction.StartTransaction;
  pDM.StorProc.StoredProcName:='JO5_GET_REG_UCH';
  pDM.StorProc.Prepare;
  pDM.StorProc.ParamByName('id_reg_uch').Value:=id_reg;
  pDM.StorProc.ExecProc;
  Result   := pDM.StorProc.FN('reg_title').Value;
  pDM.StorProc.Transaction.Commit;
  pDM.Free;
end;

function GetSysInfo(AOwner:TComponent; AHandle:TISC_DB_HANDLE;id_system:Integer):TJo5SysInfo;
var
  pDM:TStoredProcDM;
begin
  pDM:=TStoredProcDM.Create(AOwner,AHandle);
  pDM.StorProc.Transaction.StartTransaction;
  pDM.StorProc.StoredProcName:='JO5_GET_SETUP_OPTIONS';
  pDM.StorProc.Prepare;
  pDM.StorProc.ParamByName('IN_ID_SYSTEM').Value:=id_system;
  pDM.StorProc.ExecProc;
  Result.KodSystem   := pDM.StorProc.FN('OUT_KOD_SYSTEM').AsInteger;
  Result.DefIdRegUch := pDM.StorProc.FN('OUT_DEF_ID_REG_UCH').AsInt64;
  Result.SetupDate   := pDM.StorProc.FN('OUT_DATE_SETUP').AsDate;
  Result.SystemName  := pDM.StorProc.FN('OUT_NAME_SYSTEM').AsString;
  Result.IdSchTypeObj:= pDM.StorProc.FN('OUT_ID_SCH_TYPE_OBJ').AsInteger;
  Result.KodSetup    := pDM.StorProc.FN('OUT_KOD_CURR_PERIOD').AsInteger;
  Result.CurrDate    := pDM.StorProc.FN('OUT_DATE_CURR_PERIOD').AsDate;
  Result.DefCaseKey  := pDM.StorProc.FN('OUT_DEF_CASE_KEY_PRT_JRNL').AsInteger;
  Result.DateFirstImport:=pDM.StorProc.FN('OUT_DATE_FIRST_IMPORT').AsDate;
  Result.LanguageID  := pDM.StorProc.FN('OUT_LANGUAGE_ID').AsInteger;
  Result.id_system   := pDM.StorProc.FN('OUT_ID_SYSTEM').AsInteger;
  pDM.StorProc.Transaction.Commit;
  pDM.Free;
end;




function MDIFormExists(MDIClass:String):Boolean;
var i:integer;
begin
  Result:=False;
  for i:=0 to Application.MainForm.MDIChildCount-1 do
    if UpperCase(Application.MainForm.MDIChildren[i].ClassName)=UpperCase(MDIClass) then
     begin
      Result:=True;
      Application.MainForm.MDIChildren[i].SetFocus;
     end;
end;

function MDIGetForm(MDIClass:String):TForm;
var i:integer;
begin
  Result:=nil;
  for i:=0 to Application.MainForm.MDIChildCount-1 do
    if UpperCase(Application.MainForm.MDIChildren[i].ClassName)=UpperCase(MDIClass) then
     begin
      Result:=Application.MainForm.MDIChildren[i]; 
     end;
end;

function DisableServiceMenu:Boolean;
var i:Integer;
begin
  i:=0;
  Result:=False;
  while (i<Application.MainForm.ComponentCount)
    and (UpperCase(Application.MainForm.Components[i].Name)<>UpperCase('mnuService')) do
      i:=i+1;
  if UpperCase(Application.MainForm.Components[i].Name)=UpperCase('mnuService') then
    begin
      (Application.MainForm.Components[i] as TdxBarItem).Enabled:=False;
      Result:=False;
    end
end;
end.
