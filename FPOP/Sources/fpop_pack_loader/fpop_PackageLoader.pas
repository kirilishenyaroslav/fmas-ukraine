unit fpop_PackageLoader;

interface

uses Forms, Windows, IBase, Classes, Dialogs, SysUtils, Variants, Controls;

type
 TCustSelectMode = (selNone, selCustomer, selRateAccount, selPeople);

 TSpravParams = class
 private
   fValues : array of Variant;
   fNames  : array of string;
   function IndexOf(const param_name : string) : Integer;
   procedure SetParam(param_name : string; val : Variant);
   function GetParam(param_name : string) : Variant;
   function GetParamCount : Integer;
   function GetName(Index : Integer) : string;
 public
   constructor Create;
   destructor Destroy;
   procedure ApplyOnForm(frm : TForm);
   property Values[Index : string] : Variant read GetParam write SetParam; default;
   property ParamCount : Integer read GetParamCount;
   property Name[Index : Integer] : string read GetName;
 end;
 PSpravParams = ^TSpravParams;
 TSpravProc = procedure (Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;

procedure LoadSprav(const BplName : string; Owner : TComponent; input : TSpravParams; output : TSpravParams);

function ShowCatCustomer(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): variant;
function Show_ini_Group_UnitM(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): PSpravParams;
function Show_ini_Unit_Meas(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): PSpravParams;
function Show_sp_Product(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): variant;

implementation

const
 ErrorCaption    = 'Помилка!';
 LoadError       = 'Неможу завантажити пакет ';

 iniCatCustBPL      = 'FPOP\ini_Cat_Customer.bpl';
 ini_Unit_MeasBPL   = 'FPOP\ini_Unit_Meas.bpl';
 ini_Group_UnitmBPL = 'FPOP\ini_Group_Unitm.bpl';
 sp_ProductBPL      = 'FPOP\sp_Product_Pack.bpl';

function ShowCatCustomer(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): variant; stdcall;
 Res : Variant;
begin
 HandlePack := GetModuleHandle(iniCatCustBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(iniCatCustBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('Show_ini_Cat_Customer'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, FS);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + iniCatCustBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;

 ShowCatCustomer := Res;
end;

function Show_ini_Unit_Meas(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle): PSpravParams;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): PSpravParams; stdcall;
 Res : PSpravParams;
begin
 HandlePack := GetModuleHandle(ini_Unit_MeasBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(ini_Unit_MeasBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('Load'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, FS);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + ini_Unit_MeasBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
 end;

 Show_ini_Unit_Meas := Res;
end;

function Show_ini_Group_UnitM(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle): PSpravParams;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): PSpravParams; stdcall;
 Res : PSpravParams;
begin
 HandlePack := GetModuleHandle(ini_Group_UnitmBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(ini_Group_UnitmBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('Load'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, FS);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + ini_Group_UnitmBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
 end;

 Show_ini_Group_UnitM := Res;
end;

function Show_sp_Product(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle): variant; stdcall;
 Res : variant;
begin
 HandlePack := GetModuleHandle(sp_ProductBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(sp_ProductBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('Show_sp_Product'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, FS);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + sp_ProductBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
 end;

 Show_sp_Product := Res;
end;

{ TSpravParams }

procedure TSpravParams.ApplyOnForm(frm : TForm);
begin
 frm.FormStyle := Values['FormStyle'];
end;

constructor TSpravParams.Create;
begin
  inherited;
  fValues := nil;
  fNames  := nil;
end;

destructor TSpravParams.Destroy;
begin
  fValues := nil;
  fNames  := nil;
  inherited;
end;

function TSpravParams.GetName(Index: Integer): string;
begin
 Result := '';
 if ParamCount = 0 then Exit;
 if Index > ParamCount - 1 then Exit;
 Result := fNames[Index];
end;

function TSpravParams.GetParam(param_name: string): Variant;
var
 i : Integer;
begin
 Result := Null;
 i := IndexOf(param_name);
 if i <> -1 then Result := fValues[i];
end;

function TSpravParams.GetParamCount: Integer;
begin
 Result := Length(fValues);
end;

function TSpravParams.IndexOf(const param_name: string): Integer;
var
 i : Integer;
begin
 Result := -1;
 if fNames = nil then Exit;
 for i := 0 to Length(fNames) - 1 do if AnsiUpperCase(fNames[i]) = AnsiUpperCase(param_name) then
 begin
   Result := i;
   Exit;
 end;
end;

procedure TSpravParams.SetParam(param_name: string; val: Variant);
var
 i : Integer;
begin
 i := IndexOf(param_name);
 if i = -1 then
 begin
   SetLength(fValues, ParamCount + 1);
   fValues[ParamCount - 1] := val;
   SetLength(fNames, ParamCount);
   fNames[ParamCount - 1] := param_name;
 end
 else
   fValues[i] := val;
end;

procedure LoadSprav(const BplName : string; Owner : TComponent; input : TSpravParams; output : TSpravParams);
var
 SprProc : TSpravProc;
 HandlePack: HModule;
begin
 HandlePack:=GetModuleHandle(PAnsiChar(BplName));
 if HandlePack < 32 then
 begin
   Screen.Cursor:=crHourGlass;
   HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + BplName);
   Screen.Cursor:=crDefault;
 end;
 if HandlePack > 0 then
 begin
   @SprProc:=GetProcAddress(HandlePack, PChar('Load'));
   try
    if @SprProc <> nil then SprProc(Owner, @input, @output);
   except
    on E: Exception do ShowMessage('Произошла ошибка при вызове справочника: ' + BplName + #13 + E.Message);
   end
 end
 else ShowMessage('Ошибка загрузки bpl: ' + BplName);
end;

end.
