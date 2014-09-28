unit Un_func_file_Alex;

interface

function ConvTo(S : string):string;
function AddNol(Chislo : string; var proverka : integer):string;
function AllChislo_ukr(z : string) : string;
function AllChislo(z : string) : string;
function Chislo_grn_kop(z : string) : string;
function perevod (m : string) : string;
function perevod_ukr (m : string; fl: boolean) : string;
function edinici_ukr(s : integer; flag : boolean):string;
function Desyatki_ukr(S : word): string;
function Tisyacha_ukr (S : word): string;
function des_ukr (s : word) : string;
function gugol_ukr (s: integer; m : word) : string;
function Kopy_ukr (s : word) : string;
function Grivna_ukr (s : word) : string;
function edinici(s : integer; flag : boolean):string;
function Desyatki(S : word): string;
function Tisyacha (S : word): string;
function des (s : word) : string;
function gugol (s: integer; m : word) : string;
function Kopy (s : word) : string;
function Grivna (s : word) : string;
function MonthFromChislo (m : integer) : string;
function Nomer(z : string) : string;

procedure SummToGrivAdnKop_ukr(z : string; var grivna, kopeyka : string);
procedure SummToGrivAdnKop_rus(z : string; var grivna, kopeyka : string);

implementation

uses SysUtils, Un_R_file_Alex, Dialogs;

function ConvTo(S : string):string;
var
    l, i : integer;
begin
    l := length(S);
    result := S;
    for i := 1 to l do
    begin
        if copy(s, i, 1) = ',' then
            result := copy(S, 1, i+2);
    end;
end;

function AddNol(Chislo : string; var proverka : integer):string;
var
    l : integer;
    s, Chi : string;
    sum : double;
begin
{    if (Chislo = '')     then begin proverka := 1; AddNol := '0,00'; exit; end;
    if (Chislo = '0')    then begin proverka := 1; AddNol := '0,00'; exit; end;
    if (Chislo = '0,')   then begin proverka := 1; AddNol := '0,00'; exit; end;
    if (Chislo = '0,0')  then begin proverka := 1; AddNol := '0,00'; exit; end;
    if (Chislo = '0,00') then begin proverka := 1; AddNol := '0,00'; exit; end;
    if (Chislo = '0.')   then begin proverka := 1; AddNol := '0,00'; exit; end;
    if (Chislo = '0.0')  then begin proverka := 1; AddNol := '0,00'; exit; end;
    if (Chislo = '0.00') then begin proverka := 1; AddNol := '0,00'; exit; end;
    Chi := ConvTo(Chislo);
    l := length(Chi);
    s := Chi;
    if (copy(Chi, l, 1) <> ',') and (copy(Chi, l-1, 1) = ',') then
        s := Chi + '0';
    if (copy(Chi, l, 1) = ',') then
        s := Chi + '00';
    if (copy(Chi, l, 1) <> ',') and (copy(Chi, l-1, 1) <> ',') and (copy(Chi, l-2, 1) <> ',') then
        s := Chi + ',00';
    result := s;}
    if (Chislo <> '')
        then begin
            if TryStrToFloat(Chislo, sum) then sum := StrToFloat(Chislo);
        end
        else sum := 0;

    result := FormatFloat('0.00', sum);
    if proverka = 1 then
    begin
        if length(s)-3 > 16 then proverka := -1;
    end;
end;

function edinici_ukr(s : integer; flag : boolean):string;
begin
      Case S of
        0 : edinici_ukr := '';
        1 : if flag then edinici_ukr := 'одна ' else edinici_ukr := 'один ';
        2 : if flag then edinici_ukr := 'дв≥ ' else edinici_ukr := 'два ';
        3 : edinici_ukr := 'три ';
        4 : edinici_ukr := 'чотири ';
        5 : edinici_ukr := 'п''€ть ';
        6 : edinici_ukr := 'ш≥сть ';
        7 : edinici_ukr := 'с≥м ';
        8 : edinici_ukr := 'в≥с≥м ';
        9 : edinici_ukr := 'дев''€ть ';
      end;
end;

function Desyatki_ukr(S : word): string;
begin
      Case S of
         1 :  Desyatki_ukr := 'дес€ть ';
         2 :  Desyatki_ukr := 'двадц€ть ';
         3 :  Desyatki_ukr := 'тридц€ть ';
         4 :  Desyatki_ukr := 'сорок ';
         5 :  Desyatki_ukr := 'п''€тдес€т ';
         6 :  Desyatki_ukr := 'ш≥стдес€т ';
         7 :  Desyatki_ukr := 'с≥мдес€т ';
         8 :  Desyatki_ukr := 'в≥с≥мдес€т ';
         9 :  Desyatki_ukr := 'дев''€носто ';
      end;
end;

function Tisyacha_ukr (S : word): string;
begin
      Case S of
          0 : Tisyacha_ukr := '';
          1 : Tisyacha_ukr := 'сто ';
          2 : Tisyacha_ukr := 'дв≥ст≥ ';
          3 : Tisyacha_ukr := 'триста ';
          4 : Tisyacha_ukr := 'чотириста ';
          5 : Tisyacha_ukr := 'п''€тьсот ';
          6 : Tisyacha_ukr := 'ш≥стсот ';
          7 : Tisyacha_ukr := 'с≥мсот ';
          8 : Tisyacha_ukr := 'в≥с≥мсот ';
          9 : Tisyacha_ukr := 'дев''€тсот ';
       end;
end;

function des_ukr (s : word) : string;
begin
      Case S of
        1 :  des_ukr := 'одинадц€ть ';
        2 :  des_ukr := 'дванадц€ть ';
        3 :  des_ukr := 'тринадц€ть ';
        4 :  des_ukr := 'чотирнадц€ть ';
        5 :  des_ukr := 'п''€тнадц€ть ';
        6 :  des_ukr := 'ш≥стнадц€ть ';
        7 :  des_ukr := 'с≥мнадц€ть ';
        8 :  des_ukr := 'в≥с≥мнадц€ть ';
        9 :  des_ukr := 'дев''€тнадц€ть ';
      end;
end;

function gugol_ukr (s: integer; m : word) : string;
begin
//showmessage('i-'+IntToStr(s)+', m-'+IntToStr(m));
   Case S of
                   1 : begin
                        case m of
                           1      : gugol_ukr := 'тис€ча ';
                           2..4   : gugol_ukr := 'тис€ч≥ ';
                           0,5..9 : gugol_ukr := 'тис€ч ';
                        end;
                       end;
                  10 : begin
                         case m of
                           1       : gugol_ukr := 'м≥льйон ';
                           2..4    : gugol_ukr := 'м≥льйона ';
                           0,5..9  : gugol_ukr := 'м≥льйон≥в ';
                         end;
                       end;
                 100 : begin
                         case m of
                            1      : gugol_ukr := 'м≥ль€рд ';
                            2..4   : gugol_ukr := 'м≥ль€рда ';
                            0,5..9 : gugol_ukr := 'м≥ль€рд≥в ';
                         end;
                       end;
               1000  : begin
                          case m of
                            1      : gugol_ukr := 'трил≥он ';
                            2..4   : gugol_ukr := 'трил≥она ';
                            0,5..9 : gugol_ukr := 'трил≥он≥в ';
                          end;
                        end;
   end;
end;

function Kopy_ukr (s : word) : string;
begin
    case s of
        1        : Kopy_ukr := 'коп≥йка ';
           2..4  : Kopy_ukr := 'коп≥йки ';
        5..9,0   : Kopy_ukr := 'коп≥йок ';
    end;
end;

function Grivna_ukr (s : word) : string;
begin
    case s of
        1      : Grivna_ukr := 'гривн€ ';
        5..9,0 : Grivna_ukr := 'гривень ';
        2..4   : Grivna_ukr := 'гривн≥ ';
    end;
end;

function Chislo_grn_kop(z : string) : string;
var
    summa, kop, griv : string;
    j : int64;
    flag : boolean;
begin
    summa := z;
    j := 1;
    flag := true;
    griv := '';
    kop := '';
    while j <= Length(summa) do
    begin
        if (copy(summa,j,1) <> ',') and flag
            then griv := griv + copy(summa,j,1)
            else flag := false;
        if (copy(summa,j,1) <> ',') and not flag then
            kop := kop + copy(summa,j,1);
        j := j+1;
    end;
    if length(kop)=1 then kop := kop +'0';
    Chislo_grn_kop := '';
    if (kop = '') and (griv <> '0') then Chislo_grn_kop := griv + 'грн. 00 коп.' {grivna((StrToInt(griv) mod 10))};
    if (griv = '0') and (kop <> '') then Chislo_grn_kop := '0 ' + {perevod(}kop{)} + ' коп.'{Kopy((StrToInt(kop) mod 10))};
    if (griv = '0') and (kop = '')
    then Chislo_grn_kop := '0 грн. 00 коп.';
    if (griv <> '0') and (kop <> '') then Chislo_grn_kop := griv + ' грн. '{grivna((StrToInt(griv) mod 10))} + {perevod(}kop{)} + ' коп.'{Kopy((StrToInt(kop) mod 10))};
end;

function perevod_ukr (m : string; fl : boolean) : string;
var
    name, n, razrad  : string;
    i, j, cifra, len : integer;
    flag : boolean;
begin
//    if n = '0'
//    then perevod := 'ноль' else
//    begin
//showmessage('m- '+m);
    i := 1;
    flag := fl;
    len := Length(m);
    n := m;
    name := '';
    while i <= len do
    begin
         if length(n) >= 3 then
         begin
             razrad := copy(n, length(n)-2, 3);
  // showmessage('1razrad -'+razrad);
             if razrad <> '000' then
             begin
                 cifra := (StrToInt64(razrad) mod 10);
    //    showmessage('cifra - '+IntToStr(cifra));
                 if ((i div 3) = 1) and (i mod 3 =1) then
                        if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol_ukr(1,0) + name//gugol_ukr(1,cifra) + name
                                                                      else name := gugol_ukr(1,cifra) + name;//gugol_ukr(1,0) + name;
                 if ((i div 3) = 2) and (i mod 3 =1) then
                        if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol_ukr(10,cifra) + name
                                                                      else name := gugol_ukr(10,0) + name;
                 if ((i div 3) = 3) and (i mod 3 =1) then
                        if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol_ukr(100,cifra) + name
                                                                      else name := gugol_ukr(100,0) + name;
                 if ((i div 3) = 4) and (i mod 3 =1) then
                        if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol_ukr(1000,cifra) + name
                                                                      else name := gugol_ukr(1000,0) + name;
                // showmessage('2razrad -'+razrad);
                // showmessage('name -'+name);
                 for j := 1 to 3 do
                 begin
                     cifra := (StrToInt64(razrad) mod 10);
                    // showmessage('cifra - '+IntToStr(cifra));
                     if ((j mod 3) = 0)  then
                          name := Tisyacha_ukr(cifra)+ name;
                   // showmessage('name -'+name+' j '+IntToStr(j));
                     if ((j mod 3) = 2) and (cifra <> 1) and (cifra <> 0) then
                          name := Desyatki_ukr(cifra)+ name;
                   //  showmessage('name -'+name);
                     if ((j mod 3) = 1) {and (cifra <> 0)}
                     then
                     begin
                         if (StrToInt64(copy(razrad,1,2)) mod 10 = 1)
                             then
                             begin
                                 if cifra = 0
                                       then name := Desyatki_ukr(1)+ name
                                       else name := Des_ukr(cifra)+ name
                             end
                          else name := edinici_ukr(cifra, flag) + name;
//                          showmessage('name -'+name);
                     end;
                     razrad := copy(razrad,1,3-j);

                 end;
             end;
             n := copy(n,1,length(n)-3);

         end else
         begin
             cifra := (StrToInt64(n) mod 10);


             if ((i div 3) = 1) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if (StrToInt64(n) div 10 <> 1) then name := gugol_ukr(1,cifra) + name else name := gugol_ukr(1,0) + name end
                                                                  else name := gugol_ukr(1,strToInt(n)) + name;
             if ((i div 3) = 2) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol_ukr(10,cifra) + name else name := gugol_ukr(10,0) + name end
                                                                  else name := gugol_ukr(10,StrToInt(n)) + name;
             if ((i div 3) = 3) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol_ukr(100,cifra) + name else name := gugol_ukr(100,0) + name end
                                                                  else name := gugol_ukr(100,StrToInt(n)) + name;
             if ((i div 3) = 4) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol_ukr(1000,cifra) + name else name := gugol_ukr(1000,0) + name end
                                                                  else name := gugol_ukr(1000,StrToInt(n)) + name;


                 cifra := (StrToInt64(n) mod 10);
                 if (length(n) = 1) then
                      case (i div 3) of
                      1,0    : name := edinici_ukr(cifra,flag)+ name;
                      2..4 : name := edinici_ukr(cifra,false)+ name;
                      end;

                 if (length(n) = 2) and (StrToInt64(n) div 10 <> 1) then
                      name := edinici_ukr(cifra,flag)+ name;

                 if (length(n) = 2) then
                  if (StrToInt64(n) div 10 = 1) then
                      begin
                      if cifra = 0
                             then name := Desyatki_ukr(1)+ name
                             else name := Des_ukr(cifra)+ name;
                      end
                      else name := Desyatki_ukr(StrToInt64(n) div 10)+ name;
         end;
         i := i+3;
    end;
    perevod_ukr := name;
//    end;
end;

function AllChislo_ukr(z : string) : string;
var
    summa, kop, griv : string;
    j : int64;
    flag : boolean;
begin
    summa := z;
    j := 1;
    flag := true;
    griv := '';
    kop := '';
    while j <= Length(summa) do
    begin
        if (copy(summa,j,1) <> ',') and flag
            then griv := griv + copy(summa,j,1)
            else flag := false;
        if (copy(summa,j,1) <> ',') and not flag then
            kop := kop + copy(summa,j,1);
        j := j+1;
    end;
    if length(kop)=1 then kop := kop +'0';
    AllChislo_ukr := '';
    if (kop = '') and (griv <> '0') then AllChislo_ukr := perevod_ukr(griv, true) + 'грн. 00 коп.' {grivna((StrToInt(griv) mod 10))};
    if (griv = '0') and (kop <> '') then AllChislo_ukr := 'нуль гривень ' + {perevod(}kop{)} + ' коп.'{Kopy((StrToInt(kop) mod 10))};
    if (griv = '0') and (kop = '')
    then AllChislo_ukr := 'нуль гривень 00 коп.';

    if (griv <> '0') and (kop <> '') then AllChislo_ukr := perevod_ukr(griv,true) + ' грн. '{grivna((StrToInt(griv) mod 10))} + {perevod(}kop{)} + ' коп.'{Kopy((StrToInt(kop) mod 10))};
end;

function edinici(s : integer; flag : boolean):string;
begin
      Case S of
        0 : edinici := '';
        1 : if flag then edinici := 'одна ' else edinici := 'один ';
        2 : if flag then edinici := 'две ' else edinici := 'два ';
        3 : edinici := 'три ';
        4 : edinici := 'четыре ';
        5 : edinici := 'п€ть ';
        6 : edinici := 'шесть ';
        7 : edinici := 'семь ';
        8 : edinici := 'восемь ';
        9 : edinici := 'дев€ть ';
      end;
end;

function Desyatki(S : word): string;
begin
      Case S of
         1 :  Desyatki := 'дес€ть ';
         2 :  Desyatki := 'двадцать ';
         3 :  Desyatki := 'тридцать ';
         4 :  Desyatki := 'сорок ';
         5 :  Desyatki := 'п€тьдес€т ';
         6 :  Desyatki := 'шестьдес€т ';
         7 :  Desyatki := 'семьдес€т ';
         8 :  Desyatki := 'восемьдес€т ';
         9 :  Desyatki := 'дев€носто ';
      end;
end;

function Tisyacha (S : word): string;
begin
      Case S of
          1 : Tisyacha := 'сто ';
          2 : Tisyacha := 'двести ';
          3 : Tisyacha := 'триста ';
          4 : Tisyacha := 'четыреста ';
          5 : Tisyacha := 'п€тьсот ';
          6 : Tisyacha := 'шестьсот ';
          7 : Tisyacha := 'семьсот ';
          8 : Tisyacha := 'восемьсот ';
          9 : Tisyacha := 'дев€тьсот ';
       end;
end;

function des (s : word) : string;
begin
      Case S of
        1 :  des := 'одиннадцать ';
        2 :  des := 'двенадцать ';
        3 :  des := 'тринадцать ';
        4 :  des := 'четырнадцать ';
        5 :  des := 'п€тнадцать ';
        6 :  des := 'шестнадцать ';
        7 :  des := 'семнадцать ';
        8 :  des := 'восемнадцать ';
        9 :  des := 'дев€тнадцать ';
      end;
end;

function gugol (s: integer; m : word) : string;
begin
   Case S of
                   1 : begin
                        case m of
                           1      : gugol := 'тыс€ча ';
                           2..4   : gugol := 'тыс€чи ';
                           0,5..9 : gugol := 'тыс€ч ';
                        end;
                       end;
                  10 : begin
                         case m of
                           1       : gugol := 'миллион ';
                           2..4    : gugol := 'миллиона ';
                           0,5..9  : gugol := 'миллионов ';
                         end;
                       end;
                 100 : begin
                         case m of
                            1      : gugol := 'миллиард ';
                            2..4   : gugol := 'миллиарда ';
                            0,5..9 : gugol := 'миллиардов ';
                         end;
                       end;
               1000  : begin
                          case m of
                            1      : gugol := 'триллион ';
                            2..4   : gugol := 'триллиона ';
                            0,5..9 : gugol := 'триллионов ';
                          end;
                        end;
   end;
end;

function Kopy (s : word) : string;
begin
    case s of
        1      : Kopy := 'копейка ';
           2..4   : Kopy := 'копейки ';
        5..9,0 : Kopy := 'копеек ';
    end;
end;

function Grivna (s : word) : string;
begin
    case s of
        1      : Grivna := 'гривна ';
        5..9,0 : Grivna := 'гривень ';
        2..4   : Grivna := 'гривни ';
    end;
end;

function perevod (m : string) : string;
var
    name, n, razrad  : string;
    i, j, cifra, len : integer;
    flag : boolean;
begin
//    if n = '0'
//    then perevod := 'ноль' else
//    begin
    i := 1;
    flag := true;
    len := Length(m);
    n := m;
    name := '';
    while i <= len do
    begin
         if length(n) >= 3 then
         begin
             razrad := copy(n, length(n)-2, 3);
             if razrad <> '000' then
             begin
             if ((i div 3) = 1) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(1,cifra) + name
                                                                  else name := gugol(1,0) + name;
             if ((i div 3) = 2) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(10,cifra) + name
                                                                  else name := gugol(10,0) + name;
             if ((i div 3) = 3) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(100,cifra) + name
                                                                  else name := gugol(100,0) + name;
             if ((i div 3) = 4) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(1000,cifra) + name
                                                                  else name := gugol(1000,0) + name;

             for j := 1 to 3 do
             begin
                 cifra := (StrToInt64(razrad) mod 10);
                 if ((j mod 3) = 0)  then
                      name := Tisyacha(cifra)+ name;

                 if ((j mod 3) = 2) and (cifra <> 1) and (cifra <> 0) then
                      name := Desyatki(cifra)+ name;

                 if (j mod 3) = 1
                 then
                 begin
                     if (StrToInt64(copy(razrad,1,2)) mod 10 = 1)
                         then
                         begin
                             if cifra = 0
                                   then name := Desyatki(1)+ name
                                   else name := Des(cifra)+ name
                         end
                      else name := edinici(cifra, flag) + name
                 end;
                 razrad := copy(razrad,1,3-j);

             end;
             end;
             n := copy(n,1,length(n)-3);
         end else
         begin
             cifra := (StrToInt64(n) mod 10);

             if ((i div 3) = 1) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if (StrToInt64(n) div 10 <> 1) then name := gugol(1,cifra) + name else name := gugol(1,0) + name end
                                                                  else name := gugol(1,strToInt(n)) + name;
             if ((i div 3) = 2) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(10,cifra) + name else name := gugol(10,0) + name end
                                                                  else name := gugol(10,StrToInt(n)) + name;
             if ((i div 3) = 3) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(100,cifra) + name else name := gugol(100,0) + name end
                                                                  else name := gugol(100,StrToInt(n)) + name;
             if ((i div 3) = 4) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(1000,cifra) + name else name := gugol(1000,0) + name end
                                                                  else name := gugol(1000,StrToInt(n)) + name;

                 cifra := (StrToInt64(n) mod 10);
                 if (length(n) = 1) then
                      case (i div 3) of
                      1,0    : name := edinici(cifra,true)+ name;
                      2..4 : name := edinici(cifra,false)+ name;
                      end;

                 if (length(n) = 2) and (StrToInt64(n) div 10 <> 1) then
                      name := edinici(cifra,true)+ name;

                 if (length(n) = 2) then
                  if (StrToInt64(n) div 10 = 1) then
                      begin
                      if cifra = 0
                             then name := Desyatki(1)+ name
                             else name := Des(cifra)+ name;
                      end
                      else name := Desyatki(StrToInt64(n) div 10)+ name;
         end;
         i := i+3;
    end;
    perevod := name;
//    end;
end;

function AllChislo(z : string) : string;
var
    summa, kop, griv : string;
    j : int64;
    flag : boolean;
begin
    summa := z;
    j := 1;
    flag := true;
    griv := '';
    kop := '';
    while j <= Length(summa) do
    begin
        if (copy(summa,j,1) <> ',') and flag
            then griv := griv + copy(summa,j,1)
            else flag := false;
        if (copy(summa,j,1) <> ',') and not flag then
            kop := kop + copy(summa,j,1);
        j := j+1;
    end;
    AllChislo := '';
    if length(kop)=1 then kop := kop + '0';
    if (kop = '') and (griv <> '0') then AllChislo := perevod(griv) + 'грн. 00 коп.' {grivna((StrToInt(griv) mod 10))};
    if (griv = '0') and (kop <> '') then AllChislo := 'ноль гривень ' + {perevod(}kop{)} + ' коп.'{Kopy((StrToInt(kop) mod 10))};
    if (griv = '0') and (kop = '')
    then AllChislo := 'ноль гривень 00 коп.';
    if (griv <> '0') and (kop <> '') then AllChislo := perevod(griv) + ' грн. '{grivna((StrToInt(griv) mod 10))} + {perevod(}kop{)} + ' коп.'{Kopy((StrToInt(kop) mod 10))};
end;

function MonthFromChislo (m : integer) : string;
begin
      Case m of
          1 : MonthFromChislo := Un_R_file_Alex.MY_JANUARY;
          2 : MonthFromChislo := Un_R_file_Alex.MY_FEBRIARY;
          3 : MonthFromChislo := Un_R_file_Alex.MY_MARCH;
          4 : MonthFromChislo := Un_R_file_Alex.MY_APRILE;
          5 : MonthFromChislo := Un_R_file_Alex.MY_MAY;
          6 : MonthFromChislo := Un_R_file_Alex.MY_JUNE;
          7 : MonthFromChislo := Un_R_file_Alex.MY_JULY;
          8 : MonthFromChislo := Un_R_file_Alex.MY_AUGUST;
          9 : MonthFromChislo := Un_R_file_Alex.MY_SEPTEMBER;
         10 : MonthFromChislo := Un_R_file_Alex.MY_OCTOBER;
         11 : MonthFromChislo := Un_R_file_Alex.MY_NOVEMBER;
         12 : MonthFromChislo := Un_R_file_Alex.MY_DESEMBER;
       end;
end;

procedure SummToGrivAdnKop_ukr(z : string; var grivna, kopeyka : string);
var
    summa, kop, griv : string;
    j : int64;
    flag : boolean;
begin
    summa := z;
    j := 1;
    flag := true;
    griv := '';
    kop := '';
    while j <= Length(summa) do
    begin
        if (copy(summa,j,1) <> ',') and flag
            then griv := griv + copy(summa,j,1)
            else flag := false;
        if (copy(summa,j,1) <> ',') and not flag then
            kop := kop + copy(summa,j,1);
        j := j+1;
    end;
    if length(kop)=1 then kop := kop +'0';
    grivna  := '';
    kopeyka := '';
    if (kop = '')   and (griv <> '0') then
    begin
        grivna  := perevod_ukr(griv,flag);
        kopeyka := '00';
    end;
    if (griv = '0') and (kop <> '') then
    begin
        grivna  := 'нуль';
        kopeyka := kop;
    end;
    if (griv = '0') and (kop = '') then
    begin
        grivna  := 'нуль';
        kopeyka := '00';
    end;
    if (griv <> '0') and (kop <> '') then
    begin
        grivna  := perevod_ukr(griv, flag);// ' грн. '{grivna((StrToInt(griv) mod 10))} + {perevod(}kop{)} + ' коп.'{Kopy((StrToInt(kop) mod 10))};
        kopeyka := kop;
    end;
end;

procedure SummToGrivAdnKop_rus(z : string; var grivna, kopeyka : string);
var
    summa, kop, griv : string;
    j : int64;
    flag : boolean;
begin
    summa := z;
    j := 1;
    flag := true;
    griv := '';
    kop := '';
    while j <= Length(summa) do
    begin
        if (copy(summa,j,1) <> ',') and flag
            then griv := griv + copy(summa,j,1)
            else flag := false;
        if (copy(summa,j,1) <> ',') and not flag then
            kop := kop + copy(summa,j,1);
        j := j+1;
    end;
    grivna  := '';
    kopeyka := '';
    if length(kop)=1 then kop := kop + '0';
    if (kop = '') and (griv <> '0') then
    begin
        grivna  := perevod(griv);
        kopeyka := '00';
    end;
    if (griv = '0') and (kop <> '') then
    begin
        grivna  := 'ноль';
        kopeyka := kop;
    end;
    if (griv = '0') and (kop = '') then
    begin
        grivna := 'ноль';
        kopeyka := '00';
    end;
    if (griv <> '0') and (kop <> '') then
    begin
        grivna := perevod(griv);
        kopeyka := kop;
    end;
end;

function Nomer(z : string) : string;
var
    num, num1, num2 : string;
    j : int64;
    flag : boolean;
begin
    num   := z;
    j     := 1;
    flag  := true;
    Nomer := '';
    while j <= Length(num) do
    begin
        if (copy(num,j,1) <> 'є') and flag
            then num1 := num1 + copy(num,j,1)
            else flag := false;
        if (copy(num,j,1) <> 'є') and not flag then
            num2 := num2 + copy(num,j,1);
        j := j+1;
    end;
    Nomer := num2;
end;


end.
