//***********************************************************************
//* Проект "Студгородок"                                                *
//* Юнит утилит - вспомагательные функции                               *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************

unit Unit_of_Utilits;

interface
 uses Forms, SysUtils, cxGridDBTableView, pFIBDataSet, Messages,
  Classes, Graphics,  Controls, Menus,
  StdCtrls, Dialogs, Buttons, ExtCtrls, ComCtrls, StdActns;
function IntegerCheck(const s : string) : boolean;
function FloatCheck(const s : string) : boolean;
function BoolConvert(const b : boolean) : shortint;
function SurNameChecker(const s: string) : boolean;
function NalogNomerChecker(const IntStr: string;  DateBorn: TdateTime) : boolean;
function GetChildPosition (Form: TForm; Cap: TCaption): boolean;
var
 SYS_MAX_TIMESTAMP : TDateTime;

implementation
uses DateUtils, MAIN;

function GetChildPosition (Form: TForm; Cap: TCaption) : boolean;
var i: integer;
begin
  Result:=false;
     for i:=0 to MainForm.MDIChildCount-1 do
      begin
        if  MainForm.MDIChildren[i].Caption = Cap then
         begin
         Form.WindowState:= wsNormal;
         Form.Position:=poOwnerFormCenter;
         Form.BringToFront;
         Result:=true;
         end;
      end;
end;

function BoolConvert(const b : boolean) : shortint;
begin
 if b then Result := 1 else Result := 0;
end;

function NalogNomerChecker(const IntStr: string;  DateBorn: TDateTime) : boolean;
var
c1, c2, c3, c4, c5: char;
First5Digits : string;
BasicDate : TDateTime;
First5DoubleMinus :double;
DaySpanDouble  : double;
begin
Result:=false;
DateSeparator:='.';
ShortDateFormat:= 'dd/mm/yyyy';
if datetostr(DateBorn)='' then
begin
ShowMessage('Необходимо ввести дату рождения !');
exit;
end;
First5Digits:='';
BasicDate:=StrToDate('01'+DateSeparator+'01'+DateSeparator+'1900');
if Length(IntStr)>=5 then
begin
c1:=IntStr[1];
c2:=IntStr[2];
c3:=IntStr[3];
c4:=IntStr[4];
c5:=IntStr[5];
First5Digits:=c1+c2+c3+c4+c5;
end
else exit;
First5DoubleMinus:= strtofloat( First5Digits)-1;
DaySpanDouble:=DaySpan(BasicDate,DateBorn);
if DaySpanDouble - First5DoubleMinus = 0 then
begin
Result:=true;
end
else exit;
end;


function SurNameChecker(const s: string) : boolean;
  begin
  Result := false;
  if s = '' then exit;
  if s[Length(s)]='А' then Result:=true;
 end;


function IntegerCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  if not (k in ['0'..'9',#8, #13]) then k := #0;
  if k = #0 then exit;
 end;
 Result := true;
end;

function FloatCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
 if not (k in ['0'..'9',#8, #13, DecimalSeparator]) then k := #0;
  if k = #0 then exit;
 end;
 i := pos(DecimalSeparator, s);
 if i <> 0 then if Copy(s, i + 1, Length(s) - i) = '' then exit;
 if pos(DecimalSeparator, Copy(s, i + 1, Length(s) - i)) <> 0 then exit;
 Result := true;
end;


begin
 SYS_MAX_TIMESTAMP := StrToDateTime('01.01.2050');
end.
