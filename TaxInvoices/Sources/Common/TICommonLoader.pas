unit TICommonLoader;


interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TiWaitForm,TiMessages,TiCommonProc,
     TiCommonTypes,TICommonConsts;

////////////////////////////////////////////////////////////////////////////////
//type
type TTiSimpleParam = class(TObject)
  public
    DB_Handle:TISC_DB_HANDLE;
    Owner:TComponent;
    KodSetup:variant;
    id:variant;
end;
////////////////////////////////////////////////////////////////////////////////
//const
const Tu_WhatsNew_Pack       :array [1..2] of string=('TimeKeeping\TuWhatsNew.bpl','WhatsNewShow');
const TaxInvoices_Const      :array [1..2] of string=('TaxInvoices\TaxInvoices.bpl','View_TaxInvoices');
const TaxInvoicesEdit_Const  :array [1..2] of string=('TaxInvoices\TaxInvoicesEdit.bpl','View_TaxInvoicesEdit');
const SpecialNotes_Const     :array [1..2] of string=('TaxInvoices\SpecialNotes.bpl','View_SpecialNotes');
const TermsDelivery_Const    :array [1..2] of string=('TaxInvoices\TermsDelivery.bpl','View_TermsDelivery');
const FormCalculations_Const :array [1..2] of string=('TaxInvoices\FormCalculations.bpl','View_FormCalculations');
const Measures_Const         :array [1..2] of string=('TaxInvoices\Measures.bpl','View_Measures');
const TaxKredit_Const        :array [1..2] of string=('TaxInvoices\TaxKredit.bpl','View_TaxKredit');
const TaxLiabilities_Const   :array [1..2] of string=('TaxInvoices\TaxLiabilities.bpl','View_TaxLiabilities');
const RangeOfDelivery_Const  :array [1..2] of string=('TaxInvoices\RangeOfDelivery.bpl','View_RangeOfDelivery');
const TypeReestr_Const       :array [1..2] of string=('TaxInvoices\TypeReestr.bpl','View_TypeReestr');
const MortgageTara_Const     :array [1..2] of string=('TaxInvoices\MortgageTara.bpl','View_MortgageTara');
const PDVTaxInvoces_Const    :array [1..2] of string=('TaxInvoices\PDVTaxInvoces.bpl','View_PDVTaxInvoces');
const TIAuthors_Const        :array [1..2] of string=('TaxInvoices\TIAuthors.bpl','View_TIAuthors');
const ImportXML_Const        :array [1..2] of string=('TaxInvoices\ImportXML.bpl','View_ImportXML');
const KodTovar_Const         :array [1..2] of string=('TaxInvoices\KodTovar.bpl','View_KodTovar');
const Notes_Const            :array [1..2] of string=('TaxInvoices\Notes.bpl','View_Notes');
const ImportBank_Const       :array [1..2] of string=('TaxInvoices\ImportBank.bpl','View_ImportBank');
const Subdivision_Const      :array [1..2] of string=('TaxInvoices\Subdivision.bpl','View_Subdivision');
const TaxInvoicesKorig_Const :array [1..2] of string=('TaxInvoices\TaxInvoicesKorig.bpl','View_TaxInvoicesKorig');
const SettingProvodka_Const  :array [1..2] of string=('TaxInvoices\SettingProvodka.bpl','View_SettingProvodka');
const Load_Error             = 'Файл пакета не знайдено!!!';
const Error_Caption          = 'Помилка';

////////////////////////////////////////////////////////////////////////////////
//const bpl

////////////////////////////////////////////////////////////////////////////////
//const func

////////////////////////////////////////////////////////////////////////////////
//function
function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;
function LoadTiAccess(AOwner: TComponent):TUser;
function LoadTypeDocumentPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;id_spr:integer):Variant;
function LoadImportXMLPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;ReestrParam:TReestrParam):Variant;
function LoadTaxLiabilitiesPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;type_nakl:integer):Variant;
function LoadTaxInvoicesEditPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;id_vid_Nakl:integer;id_vid_Nakl_Doc:integer;id_reestr:integer;is_print:Integer):TTITaxInvoicesInfo;
function LoadTaxInvoicesKorigPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;id_vid_Nakl:integer;id_vid_Nakl_Doc:integer;id_reestr:integer;is_print:Integer):TTITaxInvoicesInfo;
function LoadWhatsNew(AOwner: TComponent;FileName:string):variant;
function LoadImportBankPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;ReestrParam:TReestrParam):Variant;
function LoadTaxInvoicesFilterPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string; type_filter:Integer):Variant;
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
    TiShowMessage(GetConst('Caption','Error'),GetConst('LoadBPLText','Error')+#13+Bpl[0],mtError,[mbOk]);
    Result:=NULL;
  end;
end;

function LoadTiAccess(AOwner: TComponent):TUser;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent):TUser;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(ExtractFilePath(Application.ExeName)+'TaxInvoices\TiAccess.bpl'));
  if HandlePack<32 then
    try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'TaxInvoices\TiAccess.bpl');
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
    TiShowMessage(GetConst('Caption','Error'),GetConst('ELoadBPLText','Error')+#13+'TiAccess.bpl',mtError,[mbOk]);
    Result.ID:=0;
  end;
end;

function LoadTypeDocumentPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;id_spr:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;id_spr:integer):Variant;stdcall;
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
            then Res:=MDIFUNC(AOwner,DB_HANDLE,id_spr);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadTypeDocumentPackage:=Res;
end;


function LoadImportXMLPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;ReestrParam:TReestrParam):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ReestrParam:TReestrParam):Variant;stdcall;
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

    if @MDIFUNC<>nil then
    begin
      Res:=MDIFUNC(AOwner,DB_HANDLE,ReestrParam);
    end;

  end
  else
  begin
    MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
    Res:=NULL;
  end;
  LoadImportXMLPackage:=Res;

end;

function LoadImportBankPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;ReestrParam:TReestrParam):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ReestrParam:TReestrParam):Variant;stdcall;
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

    if @MDIFUNC<>nil then
    begin
      Res:=MDIFUNC(AOwner,DB_HANDLE,ReestrParam);
    end;

  end
  else
  begin
    MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
    Res:=NULL;
  end;
  LoadImportBankPackage:=Res;

end;

function LoadTaxInvoicesFilterPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string; type_filter : Integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE; type_filter : Integer):Variant;stdcall;
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

    if @MDIFUNC<>nil then
    begin
      Res:=MDIFUNC(AOwner,DB_HANDLE,type_filter);
    end;

  end
  else
  begin
    MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
    Res:=NULL;
  end;
  LoadTaxInvoicesFilterPackage:=Res;
end;

function LoadTaxLiabilitiesPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;type_nakl:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;id_spr:integer):Variant;stdcall;
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
            then Res:=MDIFUNC(AOwner,DB_HANDLE,type_nakl);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadTaxLiabilitiesPackage:=Res;
end;

function LoadTaxInvoicesEditPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;id_vid_Nakl:integer;id_vid_Nakl_Doc:integer;id_reestr:integer;is_print:Integer):TTITaxInvoicesInfo;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;id_vid_Nakl:integer;id_vid_Nakl_Doc:integer;id_reestr:integer;is_print:Integer):TTITaxInvoicesInfo;stdcall;
  Res:TTITaxInvoicesInfo;
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
            then
            begin
              Res:=MDIFUNC(AOwner,DB_HANDLE,id_vid_Nakl,id_vid_Nakl_Doc,id_reestr,is_print);
            end;

  end
  else
  begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        //Res:=NULL;
  end;
  LoadTaxInvoicesEditPackage:=Res;
end;

function LoadTaxInvoicesKorigPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;id_vid_Nakl:integer;id_vid_Nakl_Doc:integer;id_reestr:integer;is_print:Integer):TTITaxInvoicesInfo;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;id_vid_Nakl:integer;id_vid_Nakl_Doc:integer;id_reestr:integer;is_print:Integer):TTITaxInvoicesInfo;stdcall;
  Res:TTITaxInvoicesInfo;
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
            then Res:=MDIFUNC(AOwner,DB_HANDLE,id_vid_Nakl,id_vid_Nakl_Doc,id_reestr,is_print);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        //Res:=NULL;
  end;
  LoadTaxInvoicesKorigPackage:=Res;
end;

function LoadWhatsNew(AOwner: TComponent;FileName:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent;FileName:string):variant;stdcall;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(Bpl_WhatsNew_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_WhatsNew_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_WhatsNew_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,FileName);
  end
  else
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_WhatsNew_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
end;

end.
