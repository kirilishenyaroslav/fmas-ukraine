unit TuCommonLoader;

interface

uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,
     TuCommonTypes,TuWaitForm,TuMessages,TuCommonProc;


type TtuFormStyleTh = (tfsEditPast, tfsWork, tfsPast);
type TtuFormStyleOfficialNoteEdit = (tfsOnI, tfsOnU, tfsOnD,tfsOnFromTshI,tfsOnTshE,tfsOnTransI,tfsOnTransU,tfsOnTransD );

type TTuSimpleParam = class(TObject)
 public
  DB_Handle:TISC_DB_HANDLE;
  Owner:TComponent;
  CFStyle:TTuFormStyle;
  KodSetup:variant;
  id:variant;
end;

type TTuWorkModeEditParam = class(TTuSimpleParam)
 public
  Id:variant;
  CFStyle:TTuControlFormStyle;

end;
type TTuWorkModeTranscript = class(TTuSimpleParam)
 public
  Id:variant;
  TypeView:integer;
  NameWorkMode:string;
end;



type TTuSpOfficialNoteEditParam = class(TTuSimpleParam)
public
  DateBeg:Tdate;
  DateEnd:Tdate;
  IdOfficialNote:variant;
  IdVihod:variant;
  IdOfficialNoteTrans:variant;
  IdMan:variant;
  Rmoving:variant;
  IdPostMoving:variant;
  IdWorkMode:variant;
  WorkModeShift:variant;
  CFStyle :TtuFormStyleOfficialNoteEdit;
  Note:string;
  FIO:string;
  WorkModeName:string;
  VihodName:string;
  IsWork:string;
  Num:variant;
  datedoc:Tdate;
end;

function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;
function LoadTuAccess(AOwner: TComponent):TUser;
function LoadWhatsNew(AOwner: TComponent; FileName:string):variant;
function LoadTuSpPost(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):variant;
function LoadTuSpDepartment(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;
                           Root:Integer;DateActual:TDate;
                           ShowDelete:Integer;IdProperty:Integer):variant;
function LoadTuSpTemplet(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; KodSetup:variant;tuFormStyle:TtuFormStyle;idtemplate:variant):variant;
function LoadTuTimeSheet(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Aid_man:integer; KodSetup:variant;tuFormStyleTh:TtuFormStyleTh):variant;
function LoadTuSpDog(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; KodSetup:variant;AIdMan:variant):variant;

const Tu_WhatsNew_Pack            :array [1..2] of string=('TimeKeeping\TuWhatsNew.bpl','WhatsNewShow');
const Tu_Calendar_Pack            :array [1..2] of string=('TimeKeeping\Calendar.bpl','View_Calendar');
const Tu_SpWorkMode_Pack          :array [1..2] of string=('TimeKeeping\SpWorkMode.bpl','View_SpWorkMode');
const Tu_SpWorkModeEdit_Pack      :array [1..2] of string=('TimeKeeping\WorkModeEdit.bpl','View_SpWorkModeEdit');
const Tu_WorkModeTranscript_Pack  :array [1..2] of string=('TimeKeeping\WorkModeTranscript.bpl','View_WorkModeTranscript');
const Tu_WorkModeEditDays_Pack    :array [1..2] of string=('TimeKeeping\WorkModeEditDays.bpl' ,'View_WorkModeEditDays');
const Tu_SpPost_Pack              :array [1..2] of string=('TimeKeeping\TuSpPost.bpl' ,'View_TuSpPost');
const Tu_SpTemplet_Pack           :array [1..2] of string=('TimeKeeping\TuTemplet.bpl' ,'View_TuSpTemplet');
const Tu_SpDep_Pack               :array [1..2] of string=('TimeKeeping\TuSpDepartment.bpl' ,'View_TuSpDep');
const Tu_Timesheet_Pack           :array [1..2] of string=('TimeKeeping\TuTimesheet.bpl' ,'View_TuTimesheet');
const Tu_SpDog_Pack               :array [1..2] of string=('TimeKeeping\TuSpDog.bpl' ,'View_TuSpDog');
const Tu_SpTypeWork_Pack          :array [1..2] of string=('TimeKeeping\TuSpTypeWork.bpl' ,'View_TuSpTypeWork');
const Tu_SpOfficialNote_Pack      :array [1..2] of string=('TimeKeeping\TuSpOfficialNote.bpl' ,'View_TuSpOfficialNote');
const Tu_SpOfficialNoteEdit_Pack  :array [1..2] of string=('TimeKeeping\TuSpOfficialNoteEdit.bpl' ,'View_TuSpOfficialNoteEdit');
implementation

function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TObject):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32 then
    try

      wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl[0]);

    finally
      Screen.Cursor:=crDefault;
      CloseWaitForm(wf);
    end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
    if @MDIFUNC<>nil then
      Result:=MDIFUNC(AParameter);
  end
  else
  begin
    TuShowMessage(GetConst('Caption','Error'),GetConst('LoadBPLText','Error')+#13+Bpl[0],mtError,[mbOk]);
    Result:=NULL;
  end;
end;

function LoadTuAccess(AOwner: TComponent):TUser;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent):TUser;stdcall;
begin
   HandlePack:=GetModuleHandle(PChar(ExtractFilePath(Application.ExeName)+'TimeKeeping\TuAccess.bpl'));
  if HandlePack<32 then
    try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'TimeKeeping\TuAccess.bpl');
    finally
      Screen.Cursor:=crDefault;
    end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAccess'));
    if @MDIFUNC<>nil then
      Result:=MDIFUNC(AOwner);
  end
  else
  begin
    TuShowMessage(GetConst('Caption','Error'),GetConst('ELoadBPLText','Error')+#13+'TuAccess.bpl',mtError,[mbOk]);
    Result.ID:=0;
  end;
end;

function LoadWhatsNew(AOwner: TComponent;FileName:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent;FileName:string):variant;stdcall;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Tu_WhatsNew_Pack[1]));
  if HandlePack<32 then
    try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PChar(Tu_WhatsNew_Pack[1]));
    finally
      Screen.Cursor:=crDefault;
     end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Tu_WhatsNew_Pack[2]));
    if @MDIFUNC<>nil
      then Result:=MDIFUNC(AOwner,FileName);
  end
  else
    MessageBox(TForm(AOwner).Handle,PChar(GetConst('LoadBPLText','Error')+Tu_WhatsNew_Pack[1]),PChar(GetConst('Caption','Error')),MB_OK and MB_ICONWARNING);
end;

function LoadTuSpPost(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Tu_SpPost_Pack[1]));
  if HandlePack<32 then
    try

      wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Tu_SpPost_Pack[1]);

    finally
      Screen.Cursor:=crDefault;
      CloseWaitForm(wf);
    end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Tu_SpPost_Pack[2]));
    if @MDIFUNC<>nil then
      Result:=MDIFUNC(AOwner,ADB_Handle);
  end
  else
  begin
    TuShowMessage(GetConst('Caption','Error'),GetConst('LoadBPLText','Error')+#13+Tu_SpPost_Pack[1],mtError,[mbOk]);
    Result:=NULL;
  end;
end;


function LoadTuSpDepartment(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;
                           Root:Integer;DateActual:TDate;
                           ShowDelete:Integer;IdProperty:Integer):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;
                           Root:Integer;DateActual:TDate;
                           ShowDelete:Integer;IdProperty:Integer):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Tu_SpDep_Pack[1]));
  if HandlePack<32 then
    try

      wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Tu_SpDep_Pack[1]);

    finally
      Screen.Cursor:=crDefault;
      CloseWaitForm(wf);
    end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Tu_SpDep_Pack[2]));
    if @MDIFUNC<>nil then
      Result:=MDIFUNC(AOwner,ADB_Handle, Root,DateActual,ShowDelete,IdProperty);
  end
  else
  begin
    TuShowMessage(GetConst('Caption','Error'),GetConst('LoadBPLText','Error')+#13+Tu_SpDep_Pack[1],mtError,[mbOk]);
    Result:=NULL;
  end;
end;

function LoadTuSpTemplet(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; KodSetup:variant;tuFormStyle:TtuFormStyle;idtemplate:variant):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; KodSetup:variant;tuFormStyle:TtuFormStyle;idtemplate:variant):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Tu_SpTemplet_Pack[1]));
  if HandlePack<32 then
    try

      wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Tu_SpTemplet_Pack[1]);

    finally
      Screen.Cursor:=crDefault;
      CloseWaitForm(wf);
    end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Tu_SpTemplet_Pack[2]));
    if @MDIFUNC<>nil then
      Result:=MDIFUNC(AOwner,ADB_Handle, KodSetup,tuFormStyle,idtemplate);
  end
  else
  begin
    TuShowMessage(GetConst('Caption','Error'),GetConst('LoadBPLText','Error')+#13+Tu_SpTemplet_Pack[1],mtError,[mbOk]);
    Result:=NULL;
  end;
end;

function LoadTuTimeSheet(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Aid_man:integer; KodSetup:variant;tuFormStyleTh:TtuFormStyleTh):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Aid_man:integer; KodSetup:variant;tuFormStyleTh:TtuFormStyleTh):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Tu_Timesheet_Pack[1]));
  if HandlePack<32 then
    try

      wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Tu_Timesheet_Pack[1]);

    finally
      Screen.Cursor:=crDefault;
      CloseWaitForm(wf);
    end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Tu_Timesheet_Pack[2]));
    if @MDIFUNC<>nil then
      Result:=MDIFUNC(AOwner,ADB_Handle, Aid_man,KodSetup,tuFormStyleTh);
  end
  else
  begin
    TuShowMessage(GetConst('Caption','Error'),GetConst('LoadBPLText','Error')+#13+Tu_Timesheet_Pack[1],mtError,[mbOk]);
    Result:=NULL;
  end;
end;
//******************************************************************************
function LoadTuSpDog(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; KodSetup:variant; AIdMan:variant):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; KodSetup:variant;AIdMan:variant):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Tu_SpDog_Pack[1]));
  if HandlePack<32 then
    try

      wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Tu_SpDog_Pack[1]);

    finally
      Screen.Cursor:=crDefault;
      CloseWaitForm(wf);
    end;

  if HandlePack > 0 then
  begin
    @MDIFUNC:=GetProcAddress(HandlePack,PChar(Tu_SpDog_Pack[2]));
    if @MDIFUNC<>nil then
      Result:=MDIFUNC(AOwner,ADB_Handle, KodSetup,AIdMan);
  end
  else
  begin
    TuShowMessage(GetConst('Caption','Error'),GetConst('LoadBPLText','Error')+#13+Tu_SpDog_Pack[1],mtError,[mbOk]);
    Result:=NULL;
  end;
end;
//******************************************************************************
end.
