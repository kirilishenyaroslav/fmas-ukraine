{ -internal}
{-$Id: SpTimeUtils.pas,v 1.2 2006/10/13 09:20:40 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 7                     }
{                        (c) Qizz 2002-2004                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{                      Общие функции работы со временем                      }

unit SpTimeUtils;

interface

uses SysUtils, Controls, ComCtrls, Math, DateUtils;

procedure   DecodeTimeString(s: String;var h,m, sec: Integer);
function    EncodeTimeString(t: TTime; dec: Boolean): String;
function    EncodeTimeString2(Hours: Double; dec: Boolean): String;
procedure   SetPickerTime(picker: TDateTimePicker; time: TTime);
function    StringToTime(s: String): TTime;
function    TimeDiff(Time_Beg, Time_End: TTime): TTime;
function    TimeInside(cTime, Time_Beg, Time_End: TTime): Boolean;
function    PeriodInside(Period_Beg, Period_End, Time_Beg, Time_End: TTime): Boolean;
function    CalcNightHours(Time_Beg, Time_End, Night_Beg, Night_End: TTime): Double;
procedure   SplitHours(Time_Beg, Time_End: TTime; Yesterday: Boolean; var W_Beg, W_End: TTime);

implementation

procedure    SplitHours(Time_Beg, Time_End: TTime; Yesterday: Boolean; var W_Beg, W_End: TTime);
begin
    if Yesterday then
    begin
        W_Beg := 0;
        if Time_Beg > Time_End then W_End := Time_End
        else W_End := 0;
    end
    else
    begin
        W_Beg := Time_Beg;
        if Time_Beg > Time_End then W_End := 1
        else W_End := Time_End;
    end;
end;

function    CalcNightHours(Time_Beg, Time_End, Night_Beg, Night_End: TTime): Double;
begin
    Result := Max(Min(Night_End, Time_End) - Time_Beg, 0) +
                Max(Time_End - Max(Night_Beg, Time_Beg), 0);
end;

function    PeriodInside(Period_Beg, Period_End, Time_Beg, Time_End: TTime): Boolean;
begin
    if not TimeInside(Period_Beg, Time_Beg, Time_End) then Result := False
    else
    if not TimeInside(Period_End, Time_Beg, Time_End) then Result := False
    else
    if (Period_Beg > Period_End) and (Time_Beg < Time_End) then Result := False
    else Result := True;
end;

function    TimeInside(cTime, Time_Beg, Time_End: TTime): Boolean;
begin
    if Time_Beg < Time_End then
        Result := (Time_Beg < cTime) and (cTime < Time_End)
    else
        Result := (cTime > Time_Beg) or (cTime < Time_End);
end;

function    TimeDiff(Time_Beg, Time_End: TTime): TTime;
begin
    Result := Time_End - Time_Beg;
    if Time_Beg > Time_End then Result := Result + 1;
end;

procedure DecodeTimeString(s: String;var h,m, sec: Integer);
var
    p: Integer;
    hours: Double;
begin
    p := Pos(':', s);
    if p = 0 then
        try
            s := StringReplace(s, '.', DecimalSeparator, []);
            s := StringReplace(s, ',', DecimalSeparator, []);
            hours := StrToFloat(s)/24;
            h := HourOf(hours);
            if hours >= 1 then h := 24;
            m := MinuteOf(hours);
            sec := SecondOf(hours);
        except
            h := 0;
            m := 0;
            sec := 0;
        end
    else
    begin
        try
            h := StrToInt(Copy(s, 1, p-1));
        except
            h := 0;
        end;

        s := Copy(s, p+1, Length(s));

        p := Pos(':', s);

        if p <> 0 then
        begin
            try
                m := StrToInt(Copy(s, 1, p-1));
            except
                m := 0;
            end;

            try
                sec := StrToInt(Copy(s, p+1, Length(s)));
            except
                sec := 0;
            end;
        end
        else
        begin
            try
                m := StrToInt(s);
            except
                m := 0;
            end;
            sec := 0;
        end;
    end;
end;

function    StringToTime(s: String): TTime;
var
    h,m,sec: Integer;
begin
    DecodeTimeString(s, h, m, sec);
    Result := (h+m/60+sec/3600)/24;
    if Result > 1 then Result := 1;
end;

function    EncodeTimeString2(Hours: Double; dec: Boolean): String;
var
    h, m, s, msec: Word;
    mstr: String;
begin
    if dec then
    try
        Result := FormatFloat('#0.###', Hours);
    except
    end
    else
    begin
        DecodeTime(Hours/24, h, m, s, msec);

        if Hours >= 24 then h := h + 24;

        Result := IntToStr(h);

        if m > 0 then
        begin
            mstr := IntToStr(m);
            if Length(mstr) < 2 then mstr := '0' + mstr;
            Result := Result + ':' + mstr;
        end;

        if s > 0 then
        begin
            mstr := IntToStr(s);
            if Length(mstr) < 2 then mstr := '0' + mstr;
            Result := Result + ':' + mstr;
        end;
    end;
end;


function EncodeTimeString(t: TTime; dec: Boolean): String;
var
    h, m, s, msec: Word;
    mstr: String;
begin
    if dec then
    try
        Result := FormatFloat('0.###', 24*t);
    except
    end
    else
    begin
        DecodeTime(t, h, m, s, msec);
        mstr := IntToStr(m);
        if Length(mstr) < 2 then mstr := '0' + mstr;
        Result := IntToStr (h) + ':' + mstr;

        if s <> 0 then
        begin
            mstr := IntToStr(s);
            if Length(mstr) < 2 then mstr := '0' + mstr;
            Result := Result + ':' + mstr;
        end;
    end;
end;

procedure SetPickerTime(picker: TDateTimePicker; time: TTime);
begin
    picker.Time := time;
    picker.Date := 0;
    picker.ShowCheckbox := False;
end;

end.
