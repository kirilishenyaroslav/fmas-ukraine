unit TICommonDates;

interface

uses SysUtils, Controls, DateUtils,TiCommonProc, Unit_ZGlobal_Consts, TiCommonTypes;

function KodSetupToPeriod(KodSetup:integer;TypeResault:byte):string;
function YearMonthFromKodSetup(KodSetup:integer;IsYear:boolean=True):integer;
function PeriodToKodSetup(Year:integer;Month:integer):integer;
function DateToKodSetup(ADate:TDate):integer;
function MonthNumToName(ANumber:integer):string;
function ConvertDateToKod(InDate:TDateTime):Integer;
function ConvertKodToDate(Kod:Integer):TDateTime;


implementation

uses Math, StrUtils;

const YearBeg=1995;
const MonthBeg=1;

const mJanuary   = '01-Січень';
const mFebruary  = '02-Лютий';
const mMarch     = '03-Березень';
const mApril     = '04-Квітень';
const mMay       = '05-Травень';
const mJune      = '06-Червень';
const mJuly      = '07-Липень';
const mAugust    = '08-Серпень';
const mSeptember = '09-Вересень';
const mOctober   = '10-Жовтень';
const mNovember  = '11-Листопад';
const mDecember  = '12-Грудень';
const YearText   = 'року';
const YearTextShort = 'р.';
const MonthText  = 'місяць';

const maJanuary   :array[1..2,1..6] of string =(('Січень','Січня','Січню','Січень','Січнем','Січня'),
                                                ('Январь','Января','Январю','Январь','Январем','Январю'));
const maFebruary  :array[1..2,1..6] of string =(('Лютий','Лютого','Лютому','Лютий','Лютим','Лютого'),
                                                ('Февраль','Февраяя','Февралюю','Февраль','Февралём','Февралю'));
const maMarch     :array[1..2,1..6] of string =(('Березень','Березня','Березню','Березень','Березнем','Березня'),
                                                ('Март','Марта','Марту','Март','Мартом','Марту'));
const maApril     :array[1..2,1..6] of string =(('Квітень','Квітня','Квітню','Квітень','Квітнем','Квітня'),
                                                ('Апрель','Апреля','Апрелю','Апрель','Апрелем','Апрелю'));
const maMay       :array[1..2,1..6] of string =(('Травень','Травня','Травню','Травень','Травнем','Травня'),
                                                ('Май','Мая','Маю','Май','Маем','Маю'));
const maJune      :array[1..2,1..6] of string =(('Червень','Червня','Червню','Червень','Червнем','Червня'),
                                                ('Июнь','Июня','Июню','Июнь','Июнем','Июню'));
const maJuly      :array[1..2,1..6] of string =(('Липень','Липня','Липню','Липень','Липнем','Липня'),
                                                ('Июля','Июля','Июлю','Июль','Июлем','Июлю'));
const maAugust    :array[1..2,1..6] of string =(('Серпень','Серпня','Серпню','Серпень','Серпнем','Серпня'),
                                                ('Август','Августа','Августу','Август','Августом','Августу'));
const maSeptember :array[1..2,1..6] of string =(('Вересень','Вересня','Вересню','Вересень','Вреснем','Вересня'),
                                                ('Сентябрь','Сентября','Сентябрю','Сентябрь','Сентябрём','Сентябрю'));
const maOctober   :array[1..2,1..6] of string =(('Жовтень','Жовтня','Жовтню','Жовтень','Жовтнем','Жовтня'),
                                                ('Октябрь','Октября','Октябрю','Октябрь','Октябрём','Октябрю'));
const maNovember  :array[1..2,1..6] of string =(('Листопад','Листопада','Листопаду','Листопад','Листопадом','Листопада'),
                                                ('Ноябрь','Ноября','Ноябрю','Ноябрь','Ноябрём','Ноябрю'));
const maDecember  :array[1..2,1..6] of string =(('Грудень','Грудня','Грудню','Грудень','Груднем','Грудня'),
                                                ('Декабрь','Декабря','Декабрю','Декабрь','Декабрём','Декабрю'));
function MonthNumToName(ANumber:integer):string;
begin
 case ANumber of
   1: MonthNumToName := mJanuary;
   2: MonthNumToName := mFebruary;
   3: MonthNumToName := mMarch;
   4: MonthNumToName := mApril;
   5: MonthNumToName := mMay;
   6: MonthNumToName := mJune;
   7: MonthNumToName := mJuly;
   8: MonthNumToName := mAugust;
   9: MonthNumToName := mSeptember;
  10: MonthNumToName := mOctober;
  11: MonthNumToName := mNovember;
  12: MonthNumToName := mDecember;
 end;
end;

function YearMonthFromKodSetup(KodSetup:integer;IsYear:boolean=True):integer;
var TYear,TMonth:integer;
begin
 TYear  := (KodSetup - MonthBeg + 1) div 12;
 TMonth := MonthBeg + KodSetup - TYear * 12 - 1;
 if (TMonth mod 12 = 0) then
  begin
   TYear  := TYear + YearBeg + TMonth div 12 - 1;
   TMonth := 12;
  end
 else
  begin
   TYear  := TYear + YearBeg + TMonth div 12;
   TMonth := TMonth mod 12;
  end;
 YearMonthFromKodSetup:=IfThen(IsYear,TYear,TMonth);
end;

function KodSetupToPeriod(KodSetup:integer;TypeResault:byte):string;
var TYear,TMonth:integer;
begin
 TYear  := (KodSetup - MonthBeg + 1) div 12;
 TMonth := MonthBeg + KodSetup - TYear * 12 - 1;
 if (TMonth mod 12 = 0) then
  begin
   TYear  := TYear + YearBeg + TMonth div 12 - 1;
   TMonth := 12;
  end
 else
  begin
   TYear  := TYear + YearBeg + TMonth div 12;
   TMonth := TMonth mod 12;
  end;
 case TypeResault of
  0:if TMonth<10 then KodSetupToPeriod:='0'+IntToStr(TMonth)+'/'+IntToStr(TYear)
    else KodSetupToPeriod := IntToStr(TMonth)+'/'+IntToStr(TYear);
  1:
   begin
    TYear:=TYear mod 100;
    KodSetupToPeriod:=IfThen(TMonth<10,'0'+IntToStr(TMonth),IntToStr(TMonth))+'/'+
                      IfThen(TYear<10,'0'+IntToStr(TYear),IntToStr(TYear));
   end;
  2:KodSetupToPeriod := MonthNumToName(TMonth)+ ' '+IntToStr(TYear)+' '+YearText;
  3:KodSetupToPeriod := MonthNumToName(TMonth)+ ' '+IntToStr(TYear);
  4:KodSetupToPeriod := MonthNumToName(TMonth)+ ' '+IntToStr(TYear)+' '+YearTextShort;
  5:KodSetupToPeriod := MonthNumToName(TMonth)+ ' '+MonthText+' '+IntToStr(TYear)+' '+YearTextShort;
  6:KodSetupToPeriod := '1.'+IntToStr(TMonth)+'.'+IntToStr(TYear);
 end;
end;

function PeriodToKodSetup(Year:integer;Month:integer):integer;
begin
 PeriodToKOdSetup := (Year - YearBeg) * 12 + (Month - MonthBeg + 1);
end;

function DateToKodSetup(ADate:TDate):integer;
var Day, Year, Month:Word;
begin
 DecodeDate(ADate,Year,Month,Day);
 DateToKodSetup:=PeriodToKodSetup(Year,Month);
end;

function ConvertDateToKod(InDate:TDateTime):Integer;
var
Month:Integer;
Year:Integer;
begin
    Month:=Monthof(InDate);
    Year:=Yearof(InDate);
    ConvertDateToKod:=(Year-1995)*12+(Month-1)+1;
end;

function ConvertKodToDate(Kod:Integer):TDateTime;
var
Year:Integer;
Month:Integer;
begin
  Year:=Kod div 12;
  Month:=Kod-Year*12;
  Year:=Year+1995;
  if Month=0 then
   begin
    Month:=12;
    Dec(year);
   end;

  ConvertKodToDate:=EncodeDate(Year,Month,1);
end;


end.
