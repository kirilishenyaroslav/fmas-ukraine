unit uCS_Loader;

interface
uses
    Forms, Windows, SysUtils,  Variants, Classes, Controls, Ibase, uCS_Resources,
    Dialogs,AArray, uCs_types;

resourcestring
     LoadErrorPrK        ='Помилка при роботі з бібліотекою ';
     LoadErrorCaptionPrK ='Увага помилка!';


const PathCS ='Contingent_Student\';

{name bpl}
const PrK_Spravochnikibpl    ='PrK_Spravochniki.bpl';
const PrK_Vuz_Licensebpl     ='PrK_Vuz_License.bpl';
const PrK_Abitbpl            ='PrK_Abit.bpl';
const Cs_Stud                ='CS_Stud.bpl';
const Cs_StudPrivateCard     ='Cs_PrivateCard.bpl';


const CSPremiaOrder           :array [1..2] of string=('Contingent_Student\CsTypeOrderPremia.bpl','View_CSTypeOrderPremia');
const CSPremiaOrderFrame      :array [1..2] of string=('Contingent_Student\CsTypeOrderPremia.bpl','GetFrame_CSTypeOrderPremia');
const CSPaymentType           :array [1..2] of string=('Contingent_Student\CSPaymentType.bpl','View_CSPaymentType');
const CSVidOpl                :array [1..2] of string=('Zarplata\VidOpl.bpl','View_FZ_VidOpl_Sp');


const Error_Caption             = 'Помилка';
const Load_Error                = 'Файл пакета не знайдено!!!';

// загрузчик справочников
function ShowPrkSprav (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aNamePrKSprav: TNamePrKSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;
procedure ShowVuzLicense (aOwner: TComponent;aParam :TAArray);
// загрузчик контингента студентов
procedure LoadCsStud (aOwner: TComponent;aParam :TAArray);
// загрузчик личной карточки студента
procedure LoadCsStudPrivateCard (aOwner: TComponent;aParam :TAArray);
// загрузчик карточки абитуриента
procedure ShowAbit (aOwner: TComponent;aParam :TAArray);
// загрузчик остальных bpl
procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
// загрузчик всех прочих bpl )
function LoadSimplePackage(AOwner:TComponent;AParam:TAArray;
    BplName:String;FunctionName:String):Variant;overload;
function LoadSimplePackage(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:String):Variant;overload;
//_________________________________________________________________________________
// загрузчик всех прочих bpl через человеческий параметр)
function DoFunctionFromPackage(const Parameter:TcsSimpleParam; const Bpl:array of string):variant;

// загрузчик типов приказов, можно грузить через загрузчик всех прочих bpl с явным преобраз типов,
// но сделаем для удобства и красоты отдельно )
function LoadTypeOrderPackage(const Parameter:TcsTypeOrderParam; const Bpl:array of string):variant;


function LoadPaymentTypePackage(Parameter:TcsPaymentTypeParam; const Bpl:array of string):variant; //тип выплат контингента

function LoadVidOpl(Param:TcsVidOplParam; const Bpl:array of string):Variant;
            //AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle;Id_VoplFilter:Integer;Id_System:integer=0

implementation

function LoadVidOpl(Param:TcsVidOplParam; const Bpl:array of string):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle;Id_VoplFilter:Integer;Id_System:integer):Variant;stdcall;
  //Id_System=999 ъюёшь яюф ёЄшяєїє
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
            then Res:=MDIFUNC(Param.Owner,Param.DB_Handle,Param.PZFormStyle,0,999);
  end
  else begin
            MessageBox(TForm(Param.Owner).Handle,PChar(Load_Error+Bpl[0]),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVidOpl:=Res;
end;



function LoadPaymentTypePackage(Parameter:TcsPaymentTypeParam; const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TcsPaymentTypeParam):Variant;stdcall;
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

function LoadTypeOrderPackage(const Parameter:TcsTypeOrderParam; const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TcsTypeOrderParam):Variant;stdcall;
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


function DoFunctionFromPackage(const Parameter:TcsSimpleParam; const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TcsSimpleParam):Variant;stdcall;
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

function ShowPrkSprav (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;
                       aNamePrKSprav: TNamePrKSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;
var
  HandlePack: HModule;
  MDIFUNC   : function(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;
                       aNamePrKSprav: TNamePrKSprav; aFrmStyle:TFormStyle; aParam: TAArray=nil):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PrK_Spravochnikibpl);
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathCS+PrK_Spravochnikibpl);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowPrkSprav'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,aDBHANDLE,aNamePrKSprav,aFrmStyle,aParam);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorPrK+PrK_Spravochnikibpl),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  ShowPrkSprav:=Res;
end;          

procedure ShowVuzLicense (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
begin
  HandlePack:=GetModuleHandle(PrK_Vuz_Licensebpl);
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathCS+PrK_Vuz_Licensebpl);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowVuzLicense'));
            if @MDIFUNC<>nil
            then MDIFUNC(aOwner,aParam);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorPrK+PrK_Vuz_Licensebpl),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
  end;
end;

procedure ShowAbit (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
begin
  HandlePack:=GetModuleHandle(PrK_Abitbpl);
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathCS+PrK_Abitbpl);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAbit'));
            if @MDIFUNC<>nil
            then MDIFUNC(aOwner,aParam);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorPrK+PrK_Abitbpl),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
  end;
end;

procedure LoadCsStud (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
  str : string;
begin
  HandlePack:=GetModuleHandle(Cs_Stud);
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathCS+Cs_Stud);
      Screen.Cursor := crDefault;

  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowCsStud'));
            if @MDIFUNC<>nil
            then MDIFUNC(aOwner,aParam);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Cs_Stud),
                       PChar(Error_Caption),MB_OK and MB_ICONWARNING);
  end;
end;

procedure LoadCsStudPrivateCard (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
  str : string;
begin
  HandlePack:=GetModuleHandle(Cs_Stud);
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathCS+Cs_StudPrivateCard);
      Screen.Cursor := crDefault;

  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowCsStudPrivateCard'));
            if @MDIFUNC<>nil
            then MDIFUNC(aOwner,aParam);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Cs_StudPrivateCard),
                       PChar(Error_Caption),MB_OK and MB_ICONWARNING);
  end;
end;


procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
begin
  HandlePack:=GetModuleHandle(Pchar(aParam['Name_Bpl'].AsString));
  if HandlePack<32
  then begin
      Screen.Cursor := crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathCS+aParam['Name_Bpl'].AsString);
      Screen.Cursor := crDefault;
  end;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAllPrkBpl'));
            if @MDIFUNC<>nil
            then begin
              // ViewArray(nil,aParam);
              MDIFUNC(aOwner,aParam);
            end;
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(LoadErrorPrK+aParam['Name_Bpl'].AsString),
                       PChar(LoadErrorCaptionPrK),MB_OK and MB_ICONWARNING);
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

function LoadSimplePackage(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:String):Variant;overload;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
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
            then Res:=MDIFUNC(AOwner,ADB_HANDLE);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadSimplePackage:=Res;
end;


end.
