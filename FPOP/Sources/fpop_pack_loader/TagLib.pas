{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{               Модуль "Библиотека дополнительных функций и процедур"          }
{   Содержит дополнительные функции и процедуры по работе с датами и периодами }
{                                               ответственный: Андрей Таганский}

unit TagLib;

interface

uses cxGrid, cxGridDBTableView;

 function isItLastDayOfMonth(Date : TDateTime) : boolean;
 function isItMonth(Date_Beg, Date_End : TDateTime) : boolean;
 function isItQuarter(Date_Beg, Date_End : TDateTime) : boolean;
 function isItYear(Date_Beg, Date_End : TDateTime) : boolean;
 function GetMonthName(Date : TDateTime; SubjCase : boolean) : string;
 function GetPeriodName(Date_Beg, Date_End : TDateTime; ShowYear : boolean = False; Short : boolean = False) : string;
 function GetYear(Date : TDateTime) : word;
 function GetMonth(Date : TDateTime) : word;
 function GetDay(Date : TDateTime) : word;
 function GetQuarterName(Date : TDateTime; Short : boolean = False) : string;

implementation

uses SysUtils, cxGridCustomTableView, DateUtils;


function isItLastDayOfMonth(Date : TDateTime) : boolean;
var
 Day1, Day2     : word;
 Month1, Month2 : word;
 Year1, Year2   : word;
begin
 DecodeDate(Date, Year1, Month1, Day1);
 DecodeDate(Date + 1, Year2, Month2, Day2);
 if Month1 = Month2 then  Result := False
 else Result := True;
end;

function isItMonth(Date_Beg, Date_End : TDateTime) : boolean;
begin
 if (GetYear(Date_Beg) = GetYear(Date_End)) then
  if (GetMonth(Date_Beg) = GetMonth(Date_End)) then
   if (GetDay(Date_Beg) = 1) then
    if isItLastDayOfMonth(Date_End) then begin
     Result := True;
     Exit;
    end;

 Result := False;
end;

function isItQuarter(Date_Beg, Date_End : TDateTime) : boolean;
begin
 Result := (GetMonth(Date_End) - GetMonth(Date_Beg) = 2) and (GetMonth(Date_Beg) in [1, 4, 7, 10])
        and (GetDay(Date_Beg) = 1) and (GetMonth(Date_End) <> GetMonth(Date_End + 1)) and (YearOf(Date_Beg) = YearOf(Date_End));
end;

function isItYear(Date_Beg, Date_End : TDateTime) : boolean;
var
 Day1, Day2     : word;
 Month1, Month2 : word;
 Year1, Year2   : word;
begin
 DecodeDate(Date_Beg, Year1, Month1, Day1);
 DecodeDate(Date_End, Year2, Month2, Day2);
 if Year1 = Year2 then
  if (Month1 = 1) and (Month2 = 12) then
   if (Day1 = 1) and (Day2 = 31) then begin
    Result := True;
    Exit;
   end;

 Result := False;
end;

function GetQuarterName(Date : TDateTime; Short : boolean = False) : string;
begin
 if Short then
  case GetMonth(Date) of
   1  : Result := 'І кв';
   4  : Result := 'ІI кв';
   7  : Result := 'ІII кв';
   10 : Result := 'ІV кв';
  end
 else
  case GetMonth(Date) of
   1  : Result := 'І квартал';
   4  : Result := 'ІI квартал';
   7  : Result := 'ІII квартал';
   10 : Result := 'ІV квартал';
  end;
end;

function GetMonthName(Date : TDateTime; SubjCase : boolean) : string;
var
 Day, Month, Year : Word;
begin
 // WhatCase is var of Падеж
 DecodeDate(Date, Year, Month, Day);
 if SubjCase then begin
  case Month of
   1  : Result := 'Січень';
   2  : Result := 'Лютий';
   3  : Result := 'Березень';
   4  : Result := 'Квітень';
   5  : Result := 'Травень';
   6  : Result := 'Червень';
   7  : Result := 'Липень';
   8  : Result := 'Серпень';
   9  : Result := 'Вересень';
   10 : Result := 'Жовтень';
   11 : Result := 'Листопад';
   12 : Result := 'Грудень';
  end;
 end
 else begin
  case Month of
   1  : Result := 'Січня';
   2  : Result := 'Лютого';
   3  : Result := 'Березня';
   4  : Result := 'Квітня';
   5  : Result := 'Травня';
   6  : Result := 'Червня';
   7  : Result := 'Липня';
   8  : Result := 'Серпня';
   9  : Result := 'Вересня';
   10 : Result := 'Жовтня';
   11 : Result := 'Листопада';
   12 : Result := 'Грудня';
  end;
 end;
end;

function GetYear(Date : TDateTime) : word;
var
 Day, Month, Year : Word;
begin
 DecodeDate(Date, Year, Month, Day);
 Result := Year;
end;

function GetMonth(Date : TDateTime) : word;
var
 Day, Month, Year : Word;
begin
 DecodeDate(Date, Year, Month, Day);
 Result := Month;
end;

function GetDay(Date : TDateTime) : word;
var
 Day, Month, Year : Word;
begin
 DecodeDate(Date, Year, Month, Day);
 Result := Day;
end;

function GetPeriodName(Date_Beg, Date_End : TDateTime; ShowYear : boolean = False; Short : boolean = False) : string;
var
 NameYear : string;
begin
 if isItMonth(Date_Beg, Date_End) then begin
  Result := GetMonthName(Date_Beg, True) + NameYear;
  Exit;
 end
 else if isItYear(Date_Beg, Date_End) then begin
  Result := IntToStr(GetYear(Date_Beg)) + ' рік';
  Exit;
 end
 else begin
  if GetYear(Date_Beg) = GetYear(Date_End) then begin
   if ShowYear then NameYear := ' ' + IntToStr(GetYear(Date_Beg)) + ' року'
   else NameYear := '';

   if GetMonth(Date_Beg) = GetMonth(Date_End) then begin
    if GetDay(Date_Beg) = GetDay(Date_End) then
     Result := IntToStr(GetDay(Date_Beg)) + ' ' + GetMonthName(Date_Beg, False) + NameYear
    else Result := IntToStr(GetDay(Date_Beg)) + ' - ' + IntToStr(GetDay(Date_End)) + ' '
         + GetMonthName(Date_Beg, False) + NameYear;
    Exit;
   end
   else begin
    if isItQuarter(Date_Beg, Date_End) then
     Result := GetQuarterName(Date_Beg, Short) + NameYear
    else begin
     if (GetDay(Date_Beg) = 1) and (isItLastDayOfMonth(Date_End))
     then Result := GetMonthName(Date_Beg, True) + ' - ' + GetMonthName(Date_End, True) + NameYear
     else Result := DateToStr(Date_Beg) + ' - ' + DateToStr(Date_End);
    end;

    Exit;
   end;
  end
  else begin
   if GetDay(Date_Beg) = 1 then Result := GetMonthName(Date_Beg, True)
   + ' ' + IntToStr(GetYear(Date_Beg)) + ' - '
   else Result := DateToStr(Date_Beg) + ' - ';

   if isItLastDayOfMonth(Date_End) then Result := Result + GetMonthName(Date_End, True)
   + ' ' + IntToStr(GetYear(Date_End)) + ' року'
   else Result := Result + DateToStr(Date_End);

   Exit;
  end;
 end;
end;

end.
