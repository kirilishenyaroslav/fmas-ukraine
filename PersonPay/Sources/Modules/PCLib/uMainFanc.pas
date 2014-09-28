unit uMainFanc;

interface

uses Windows, Messages, SysUtils, Variants, Dialogs, Controls,
  DateUtils, Forms, StdCtrls, AccMGMT,  Classes,
  cxDropDownEdit, FIBDatabase, ibase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Registry;

function GetVersionStrInfo:string;
function GetMonth(n_month:integer):string;
function PCCheckAccess(Path:string;Action:String;DisplayMessage:Boolean=False):Integer;
function GetRazryad(chislo:string):string;

implementation

function GetMonth(n_month:integer):string;
begin
  case n_month of
  1: GetMonth:='січень';
  2: GetMonth:='лютий';
  3: GetMonth:='березень';
  4: GetMonth:='квітень';
  5: GetMonth:='травень';
  6: GetMonth:='червень';
  7: GetMonth:='липень';
  8: GetMonth:='серпень';
  9: GetMonth:='вересень';
  10: GetMonth:='жовтень';
  11: GetMonth:='листопад';
  12: GetMonth:='грудень';
  else GetMonth:='';
  end;
end;

function GetVersionStrInfo: string;
var
 VerInfoSize: DWORD;
 VerInfo: Pointer;
 VerValueSize: DWORD;
 VerValue: PVSFixedFileInfo;
 Dummy: DWORD;
 V1,V2,V3,V4:DWORD;
begin
 VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
 if VerInfoSize = 0 then begin
 GetVersionStrInfo:='';
 end
 else begin
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do begin
   V1 := dwFileVersionMS shr 16;
   V2 := dwFileVersionMS and $FFFF;
   V3 := dwFileVersionLS shr 16;
   V4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
  GetVersionStrInfo:=' '+IntToStr(V1)+'.'+IntToStr(V2)+'.'+IntToStr(V3)+'.'+IntToStr(V4)+' ';
 end;
end;

function PCCheckAccess(Path:string;Action:String;DisplayMessage:Boolean=False):Integer;
var
 i:Integer;
begin
 i:=fibCheckPermission(Path, Action);
 if i<>0 then
 begin
  if DisplayMessage then MessageDlg(AcMgmtErrMsg(i),mtError,[mbOk],0);
 end;
 PCCheckAccess:=i;
end;

function GetRazryad(chislo:string):string;
var l,i, without, k:Integer;
    itog:string;
begin
  without:=0;
  k:=0;
  itog:='';
  if StrToFloat(chislo) = Trunc(StrToFloat(chislo)) then without:=1;
  l:=Length(chislo);
  i:=l;
  while i<>0 do
  begin
    if without = 0 then
     if Copy(chislo,i,1)=DecimalSeparator then begin itog:= Copy(chislo,i,1)+itog; without:=1; i:=i-1 end
     else begin itog:= Copy(chislo,i,1)+itog; i:=i-1; end
   else
   begin
     itog:=Copy(chislo,i,1)+itog;
     k:=k+1;
     if k=3 then
     begin
       k:=0;
       itog:=' '+itog;
     end;
     i:=i-1;
   end;
  end;
  Result:=itog;
end;
end.
