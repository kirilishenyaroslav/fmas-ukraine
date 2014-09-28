unit jo9_PackageLoader;

interface

uses Forms, Windows, IBase, Classes, Dialogs, SysUtils, Variants, Controls,
     LoadDogManedger, tagTypes;

function ShowOstatki(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; Kredit : boolean; Info : Pjo9_SYS_INFO) : variant;
function ShowAllDoc(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; Kredit : boolean; Info : Pjo9_SYS_INFO): variant;
function CheckMoveOst(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; Info : Pjo9_SYS_INFO): variant;
function DoBlockSch(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO): variant;
function PrintR(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind): variant;
function PrintREx(AOwner : TComponent; Filter : TFilterRecord; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO): variant;
function SaveSaldoOut(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean = True) : boolean;
function RollbackSystem(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean = True) : boolean;
function ShowOptions(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; fs : TFormStyle) : boolean;
function SpecOperations(SPEC_OPER_STRUCTURE : TSPEC_OPER_STRUCTURE) : variant;
function PrintAkt(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind): variant;

implementation

const
 ErrorCaption    = 'Помилка!';
 LoadError       = 'Неможу завантажити пакет ';
 OstatkiBPL      = 'JO9\jo9_ostatki_pack.bpl';
 AllDocBPL       = 'JO9\JO9_Docs_Pack.bpl';
 AdminBPL        = 'JO9\JO9_Admin_Pack.bpl';
 PrintBPL        = 'JO9\JO9_PrintPack.bpl';
 SpecOpBPL       = 'JO9\jo9_SpecOper_Pack.bpl';

function ShowOstatki(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle; Kredit : boolean; Info : Pjo9_SYS_INFO): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; Kredit : boolean; Info : Pjo9_SYS_INFO): variant; stdcall;
 Res : Variant;
begin
 HandlePack := GetModuleHandle(OstatkiBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(OstatkiBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('Ostatki'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, FS, Kredit, Info);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + OstatkiBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;
 ShowOstatki := Res;
end;

function ShowAllDoc(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle; Kredit : boolean; Info : Pjo9_SYS_INFO): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; Kredit : boolean; Info : Pjo9_SYS_INFO): variant; stdcall;
 Res : Variant;
begin
 HandlePack := GetModuleHandle(AllDocBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(AllDocBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('All_Doc'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, FS, Kredit, Info);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + AllDocBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;
 ShowAllDoc := Res;
end;

function CheckMoveOst(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; Info : Pjo9_SYS_INFO): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; Info : Pjo9_SYS_INFO): variant; stdcall;
 Res : Variant;
begin
 HandlePack := GetModuleHandle(OstatkiBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(OstatkiBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('CheckOstatki'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, Info);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + OstatkiBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;
 CheckMoveOst := Res;
end;

function DoBlockSch(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO): variant; stdcall;
 Res : Variant;
begin
 HandlePack := GetModuleHandle(AdminBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(AdminBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('BlockSch'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, FS, Info);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + AdminBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;
 DoBlockSch := Res;
end;

function PrintR(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind): variant; stdcall;
 Res : Variant;
begin
 HandlePack := GetModuleHandle(PrintBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(PrintBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('DoPrintReport'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, FS, Info, PrintKind);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + PrintBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;
 PrintR := Res;
end;

function PrintREx(AOwner : TComponent; Filter : TFilterRecord; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; Filter : TFilterRecord; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO): variant; stdcall;
 Res        : Variant;
begin
 HandlePack := GetModuleHandle(PrintBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(PrintBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('DoPrintReportEx'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, Filter, DBHandle, RTrans, INFO);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + PrintBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;
 PrintREx := Res;
end;

function PrintAkt(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind): variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind): variant; stdcall;
 Res : Variant;
begin
 HandlePack := GetModuleHandle(PrintBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(PrintBPL);
 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('DoPrintReport'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, FS, Info, PrintKind);
 end else begin
  MessageBox(TForm(AOwner).Handle, PChar(LoadError + PrintBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);
  Res:=NULL;
 end;
 PrintAkt := Res;
end;

function SaveSaldoOut(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean = True) : boolean;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean = True) : boolean; stdcall;
 Res : boolean;
begin
 Res := False;

 HandlePack := GetModuleHandle(PrintBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(PrintBPL);

 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('DoSaveSaldoOut'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, WTrans, Info, USE_MAIN_BOOK);
 end else MessageBox(TForm(AOwner).Handle, PChar(LoadError + PrintBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);

 SaveSaldoOut := Res;
end;

function RollbackSystem(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean = True) : boolean;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean = True) : boolean; stdcall;
 Res        : boolean;
begin
 Res := False;

 HandlePack := GetModuleHandle(PrintBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(PrintBPL);

 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('DoRollbackSystem'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(DBHandle, RTrans, WTrans, Info, USE_MAIN_BOOK);
 end else MessageBox(TForm(AOwner).Handle, PChar(LoadError + PrintBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);

 RollbackSystem := Res;
end;

function ShowOptions(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; fs : TFormStyle) : boolean;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; fs : TFormStyle) : boolean; stdcall;
 Res        : boolean;
begin
 Res := False;

 HandlePack := GetModuleHandle(AdminBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(AdminBPL);

 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('DoShowOptions'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(AOwner, DBHandle, RTrans, Info, fs);
 end else MessageBox(TForm(AOwner).Handle, PChar(LoadError + AdminBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);

 ShowOptions := Res;
end;

function SpecOperations(SPEC_OPER_STRUCTURE : TSPEC_OPER_STRUCTURE) : variant;
var
 HandlePack : HModule;
 SPRAVFUNC  : function (SPEC_OPER_STRUCTURE : TSPEC_OPER_STRUCTURE) : variant; stdcall;
 Res        : boolean;
begin
 Res := False;

 HandlePack := GetModuleHandle(SpecOpBPL);
 if HandlePack < 32 then HandlePack := LoadPackage(SpecOpBPL);

 if HandlePack > 0 then begin
  @SPRAVFUNC := GetProcAddress(HandlePack,PChar('SpecOp'));
  if @SPRAVFUNC <> NIL then Res := SPRAVFUNC(SPEC_OPER_STRUCTURE);
 end else MessageBox(TForm(SPEC_OPER_STRUCTURE.AOwner).Handle, PChar(LoadError + SpecOpBPL), PChar(ErrorCaption), MB_OK and MB_ICONWARNING);

 SpecOperations := Res;
end;

end.
