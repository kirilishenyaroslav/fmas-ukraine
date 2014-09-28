unit uPI_Loader;

interface
uses
    Forms, Windows, SysUtils,  Variants, Classes, Controls, Ibase,
    Dialogs,AArray, uPI_Resources;

resourcestring
     LoadErrorPrK        ='Помилка при роботі з бібліотекою ';
     LoadErrorCaptionPrK ='Увага помилка!';


const PathPI ='Personal_income\';


const Bpl_Authors_Name  ='Personal_income\PI_Authors.bpl';
const Func_Authors_Name  ='AuthorShow';


const PIFilial                :array [1..2] of string=('Zarplata\f1dfFirm.bpl','View_FZ_F1dfFirm_Sp');
const PI1dfReports            :array [1..2] of string=('Zarplata\f1dfm.bpl','View_F1df');
const PIVidOpl                :array [1..2] of string=('Zarplata\VidOpl.bpl','View_FZ_VidOpl_Sp');

const Error_Caption             = 'Помилка';
const Load_Error                = 'Файл пакета не знайдено!!!';



function LoadSimplePackage(AOwner:TComponent;AParam:TAArray;
    BplName:String;FunctionName:String):Variant;overload;

function DoFunctionFromPackage(const Parameter:TpiSimpleParam; const Bpl:array of string):variant;

function LoadVidOpl(Param:TpiVidOplParam; const Bpl:array of string):Variant;
procedure LoadAuthors(AOwner : TComponent);


implementation

procedure LoadAuthors(AOwner : TComponent);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner : TComponent);stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Authors_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Authors_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Authors_Name));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Authors_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
end;

function LoadVidOpl(Param:TPIVidOplParam; const Bpl:array of string):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;PIFormStyle:TZFormStyle;Id_VoplFilter:Integer;Id_System:integer):Variant;stdcall;
  //Id_System=999
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl[0]);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param.Owner,Param.DB_Handle,Param.PIFormStyle,0,999);
  end
  else begin
            MessageBox(TForm(Param.Owner).Handle,PChar(Load_Error+Bpl[0]),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVidOpl:=Res;
end;



function LoadPaymentTypePackage(Parameter:TpiPaymentTypeParam; const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TpiPaymentTypeParam):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));

  if HandlePack<32
  then
   try

      //wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;

      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl[0]);

   finally
      Screen.Cursor:=crDefault;
      //CloseWaitForm(wf);
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
            if @MDIFUNC<>nil then
             Result:=MDIFUNC(Parameter);

  end
  else
   begin
            MessageBox(TForm(Parameter.Owner).Handle,PChar(LoadErrorPrK+#13+Bpl[0]),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
            Result:=NULL;
   end;
end;


function DoFunctionFromPackage(const Parameter:TpiSimpleParam; const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TpiSimpleParam):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32
  then
   try

      //wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;

      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl[0]);



   finally
      Screen.Cursor:=crDefault;
      //CloseWaitForm(wf);
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
            if @MDIFUNC<>nil then
             Result:=MDIFUNC(Parameter);

  end
  else
   begin
            //grShowMessage(ECaption[IndexLanguage],ELoadBPLText[IndexLanguage]+#13+Bpl[0],mtError,[mbOk]);
            MessageBox(TForm(Parameter.Owner).Handle,PChar(LoadErrorPrK+#13+Bpl[0]),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
            Result:=NULL;
   end;
end;



function LoadSimplePackage(AOwner:TComponent;AParam:TAArray;
    BplName:String;FunctionName:String):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;AParam:TAArray):Variant;stdcall;
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
            then Res:=MDIFUNC(AOwner,AParam);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadSimplePackage:=Res;
end;


end.
