unit uTemplateReceipt29; {Тимчасове переведення на інше місце роботи}

interface

uses SysUtils, Classes, Dialogs, ibase, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, pFIBStoredProc,
     Windows, Messages, Variants, Graphics, Controls, Forms, StdCtrls, ActnList, Registry, ExtCtrls;

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

exports GetTemplateString;

implementation

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;
var szResult, stavka_str : String;            //  Строка для формирования результирующей строки
    szTemp, s, s1, WorkModeInfo{, shablon, shadow} : String;            //  Строка для хранения текстовой строки
    cTemp               : Char;              //  ¦хЁхьхээр  фы  їЁрэхэш  ёшьтюыр
    iTemp, k, i, j, m   : Integer;           //  Переменная для хранения значения целого типа
    iLength, mm, iT     : Integer;           //  Переменная для хранения значения целого типа длины цикла
    fTemp, rate_count   : Currency;            //  Переменная для хранения значения вещественного типа
    db                  : TpFIBDatabase;     //  База
    TR, TW              : TpFIBTransaction;  //  Транзакция
    DS                  : TpFIBDataSet;      //  Датасэт
    Stored              : TpFIBStoredProc;
    is_b_p, UseDigit    : Integer;  //Печатать расшифровку по сметам в надбавках, Проверка тариф или оклад
//    id_ses, id_item_shadow : int64;

//    HandlePack : HModule;
//    func : function(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

    d_inf               : TDateTime;
    flag_bonus, flag_name_cond, flagok : boolean;
    max_date, min_date, d, d1  : TDateTime;

begin
  try
    min_date := StrToDate('01.01.1000');
    max_date := StrToDate('01.01.1000');

    db                    := TpFIBDatabase.Create(NIL);
    TR                    := TpFIBTransaction.Create(NIL);
    TW                    := TpFIBTransaction.Create(NIL);
    DS                    := TpFIBDataSet.Create(NIL);
    Stored                := TpFIBStoredProc.Create(NIL);
    db.SQLDialect         := 3;
    db.Handle             := hConnection;
    TR.DefaultDatabase    := db;

    TW.DefaultDatabase    := db;
    db.DefaultTransaction := TR;
    DS.Database           := db;
    DS.Transaction        := TR;
    Stored.Database       := db;
    Stored.Transaction    := TW;
    TR.StartTransaction;
    //  Формирование шаблона
    szResult := '';

    DS.Close;
    DS.SQLs.SelectSQL.Text:='select is_bonus_print from UP_SYS_INI_CONSTS';
    DS.Open;
    if varIsNull(DS['is_bonus_print']) then is_b_p:=0 else
    is_b_p:=DS['is_bonus_print'];

    DS.Close;
    DS.SQLs.SelectSQL.Text := 'SELECT * FROM INI_ASUP_CONSTS';
    DS.Open;

    stavka_str := ds.fbn('STAVKI_DISP_FORMAT').Asstring;
    DS.Close;
    DS.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
    DS.Open;
    try d_inf := DS.fbn('INFINITY_DATE').AsDateTime; except d_inf := StrToDate('31.12.2050'); end;
    DS.Close;


    DS.SQLs.SelectSQL.Text := 'SELECT * FROM up_dt_order_item_body WHERE id_session ='+IntToStr(id_session)+'';
    DS.Open;

    if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS', []) then
    begin
        if DS.FBN('PARAMETR_VALUE').AsInteger >= 1 then
        begin
            k := DS.FBN('PARAMETR_VALUE').AsInteger;
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_1_1', [])
                then min_date := DS.FBN('PARAMETR_VALUE').AsDateTime
                else min_date := StrToDate('31.12.9999');
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_1_1', [])
                then max_date := DS.FBN('PARAMETR_VALUE').AsDateTime
                else max_date := StrToDate('01.01.1000');
            for i := 2 to k+1 do
            begin
                if DS.Locate('PARAMETR_NAME', 'COUNT_MOVING_INST_'+IntToStr(i), []) then
                begin
                    for j := 1 to DS.FBN('PARAMETR_VALUE').AsInteger do
                    begin
                        if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_'+IntToStr(i)+ '_' +IntToStr(j), [])
                            then if min_date > DS.FBN('PARAMETR_VALUE').AsDateTime then
                                     min_date := DS.FBN('PARAMETR_VALUE').AsDateTime;

                        if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_'+IntToStr(i)+ '_' +IntToStr(j), [])
                            then if max_date < DS.FBN('PARAMETR_VALUE').AsDateTime then
                                     max_date := DS.FBN('PARAMETR_VALUE').AsDateTime;
                    end;
                end;
            end;
        end else
        begin
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_1_1', [])
                then min_date := DS.FBN('PARAMETR_VALUE').AsDateTime
                else min_date := StrToDate('01.01.1000');
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_1_1', [])
                then max_date := DS.FBN('PARAMETR_VALUE').AsDateTime
                else max_date := StrToDate('01.01.1000');
        end;
    end;

    if DS.Locate('PARAMETR_NAME', 'INST_USE_DIGIT_1_1', []) then
       if not DS.FBN('PARAMETR_VALUE').IsNull then
          UseDigit:=DS.FBN('PARAMETR_VALUE').AsInteger;

    //  Номер пункта
    if DS.Locate('PARAMETR_NAME', 'NUM_ITEM_1', []) then
        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '.';
    //  Номер подпункта
    if DS.Locate('PARAMETR_NAME', 'NUM_SUB_ITEM_1', []) then
        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '. ';
    //  Фамилия
    szResult := szResult + '<u>ПІБ:</u> <b>';
    if DS.Locate('PARAMETR_NAME', 'INST_SECOND_NAME_UA_1_1', []) then
    //  Заглавными буквами
        szResult := szResult + AnsiUpperCase(DS.FBN('PARAMETR_VALUE').AsString) + ' ';
    //  Имя
    szTemp := '';
    if DS.Locate('PARAMETR_NAME', 'INST_FIRST_NAME_UA_1_1', []) then
    begin
        szResult := szResult + AnsiUpperCase(DS.FBN('PARAMETR_VALUE').AsString) + ' ';
        //  Первая буква заглавная, а остальные маленькие
{        szTemp := DS.FBN('PARAMETR_VALUE').AsString;
        cTemp := UpCase(szTemp[1]);
        szTemp := AnsiLowerCase(szTemp);
        szTemp[1] := cTemp;}
    end;
    //  Отчество
    szTemp := '';
    if DS.Locate('PARAMETR_NAME', 'INST_LAST_NAME_UA_1_1', []) then
    begin
        szResult := szResult + AnsiUpperCase(DS.FBN('PARAMETR_VALUE').AsString) + ' ';
        //  Первая буква заглавная, а остальные маленькие
{        szTemp := DS.FBN('PARAMETR_VALUE').AsString;
        cTemp := UpCase(szTemp[1]);
        szTemp := AnsiLowerCase(szTemp);
        szTemp[1] := cTemp;}
    end;
//    szResult := szResult + szTemp;

    if DS.Locate('PARAMETR_NAME', 'INST_TN_1_1', [])
        then szResult := szResult + '(TH ' + DS.FBN('PARAMETR_VALUE').AsString + ')';

    szResult := szResult + '</b>, ';


    if DS.Locate('PARAMETR_NAME', 'TO_EDUC_ZVANIE_AND_ST_1_1', []) then
        if (not DS.FBN('PARAMETR_VALUE').isNull) and (DS.FBN('PARAMETR_VALUE').AsString <> '')
            then szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';

    if DS.Locate('PARAMETR_NAME', 'TO_HOSPITAL_1_1', []) then
    begin
        if DS.Locate('PARAMETR_NAME', 'TO_NAME_TYPE_AWAY_1_1', []) then
            szResult := szResult + '(' +DS.FBN('PARAMETR_VALUE').AsString + ' ';

        if DS.Locate('PARAMETR_NAME', 'TO_HOSPITAL_MAN_1_1', []) then
        begin
            if DS.Locate('PARAMETR_NAME', 'TO_SECOND_NAME_UA_H_1_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';
            if DS.Locate('PARAMETR_NAME', 'TO_FIRST_NAME_UA_H_1_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';
            if DS.Locate('PARAMETR_NAME', 'TO_LAST_NAME_UA_H_1_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';
            if DS.Locate('PARAMETR_NAME', 'TO_TN_H_1_1', []) then
                szResult := szResult + '(ТН ' + DS.FBN('PARAMETR_VALUE').AsString + ')), ';
        end;
    end;

    if DS.Locate('PARAMETR_NAME', 'TO_DATE_END_MAX_W_1_1', []) then
    begin
        if not DS.FBN('PARAMETR_VALUE').isNull then
        begin
            d := DS.FBN('PARAMETR_VALUE').AsDateTime;
            DS.Locate('PARAMETR_NAME', 'INST_DATE_END_1_1', []);
            d1 := DS.FBN('PARAMETR_VALUE').AsDateTime;

            if d > d1 then
            begin
                if DS.Locate('PARAMETR_NAME', 'INST_WITH_RETURN_1_1', []) then
                    if DS.FBN('PARAMETR_VALUE').AsInteger = 1 then
                    begin
                        szResult := szResult + ' основний трудовий договір до ' + DateToStr(d) + ', ';
                        flag_name_cond := false;
                    end else
                        flag_name_cond := true;
            end else
                flag_name_cond := true;
        end else
            flag_name_cond := true;
    end else
    begin
        flag_name_cond := true;
    end;
    if flag_name_cond then
    begin
        if DS.Locate('PARAMETR_NAME', 'INST_NAME_ACCEPT_COND_PRINT_1_1', []) then
            if (trim(DS.FBN('PARAMETR_VALUE').AsString) <> '') and (DS.FBN('PARAMETR_VALUE').AsString <> ' ') then
            begin
                s := DS.FBN('PARAMETR_VALUE').AsString;
//                if DS.Locate('PARAMETR_NAME', 'INST_IS_PPS_1_1', []) then
//                    if not DS.FBN('PARAMETR_VALUE').IsNull then
//                        if DS.FBN('PARAMETR_VALUE').AsString = 'T' then
                        begin
                            szResult := szResult + 'на умовах ' + s;
                            if DS.Locate('PARAMETR_NAME', 'INST_A_DATE_END_1_1', []) then
                            begin
                                if not DS.FBN('PARAMETR_VALUE').isNull then
                                begin
                                    if DS.FBN('PARAMETR_VALUE').AsDateTime < StrToDate('31.12.2050') then
                                    begin
                                        szResult := szResult + ' по ' + DS.FBN('PARAMETR_VALUE').AsString + ', ';
                                    end else
                                    begin
                                        szResult := szResult + ', ';
                                    end
                                end else
                                   szResult := szResult + ', ';
                            end else
                            begin
                                szResult := szResult + ', ';
                            end;
                        end;
                s := '';
            end;
    end;

    if DS.Locate('PARAMETR_NAME', 'INST_HOSPITAL_1_1', []) then
    begin
        if DS.Locate('PARAMETR_NAME', 'INST_NAME_TYPE_AWAY_1_1', []) then
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';

        if DS.Locate('PARAMETR_NAME', 'INST_HOSPITAL_MAN_1_1', []) then
        begin
            if DS.Locate('PARAMETR_NAME', 'INST_SECOND_NAME_UA_H_1_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';
            if DS.Locate('PARAMETR_NAME', 'INST_FIRST_NAME_UA_H_1_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';
            if DS.Locate('PARAMETR_NAME', 'INST_LAST_NAME_UA_H_1_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';
            if DS.Locate('PARAMETR_NAME', 'INST_TN_H_1_1', []) then
                szResult := szResult + '(ТН ' + DS.FBN('PARAMETR_VALUE').AsString + '), ';
        end;
    end;

    if DS.Locate('PARAMETR_NAME', 'INST_WORK_REASON_1_1', []) then
        if (DS.FBN('PARAMETR_VALUE').AsString <> '') and (DS.FBN('PARAMETR_VALUE').AsString <> ' ') then
            szResult := szResult + '<u>тип роботи:</u> ' + DS.FBN('PARAMETR_VALUE').AsString + ', ';


    szResult := szResult + '<u>посада</u>: ';
    if DS.Locate('PARAMETR_NAME', 'INST_NAME_POST_1_1', []) then
//        szResult := szResult + '<b>' + DS.FBN('PARAMETR_VALUE').AsString + '</b>, ';
    begin
        szTemp    := DS.FBN('PARAMETR_VALUE').AsString;
        s         := copy(szTemp, 2, 1);
        if ((ord(s[1])<=223) and (ord(s[1])>=192)) or (ord(s[1])=175) or (ord(s[1])=178) or (ord(s[1])=170) or (ord(s[1])=73) then
        begin
            szResult  := szResult + '<b>' + szTemp + '</b>, ';
        end else
        begin
            cTemp     := ansiLowerCase(szTemp)[1];
            szTemp[1] := cTemp;
            szResult  := szResult + '<b>' + szTemp + '</b>, ';
        end;
        szTemp    := '';


    end;


    szResult := szResult + '<u>підрозділ:</u> ';
    if DS.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_VERH_1_1', []) then
    begin
        szResult  := szResult + '<b>' + DS.FBN('PARAMETR_VALUE').AsString + '</b>, ';
    end;
    if DS.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_1_1', []) then
        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString;

    if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS_NOT5', []) then
    begin
        k := DS.FBN('PARAMETR_VALUE').AsInteger;
        for j := 1 to k+1 do
        begin
            szTemp := '';
            fTemp    := 0;
            iLength  := 0;

            if DS.Locate('PARAMETR_NAME', 'INST_COUNT_SM_'+IntToStr(j)+'_1', []) then
                iLength     := DS.FBN('PARAMETR_VALUE').AsInteger;
            rate_count  := 0;
            DecimalSeparator    := '.';
            for iTemp := 1 to iLength do
            begin
                if DS.Locate('PARAMETR_NAME', 'INST_RATE_COUNT_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []) then
                begin
                    rate_count := rate_count + DS.FBN('PARAMETR_VALUE').AsFloat;
                end;

                if iLength > 1 then
                begin
                    if iTemp=1 then szTemp := ' з оплатою ';
                    szTemp := szTemp + FormatFloat(stavka_str, DS.FBN('PARAMETR_VALUE').AsFloat) + ' ставки ';
                end;

                szTemp := szTemp + ' (';

                DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_PPS_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);
                if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                begin
                    flagok := true;
                end else
                    flagok := false;

                DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);
                fTemp := fTemp + DS.FBN('PARAMETR_VALUE').AsFloat;

                if (iLength > 1) or (flagok) then
                begin
                    szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
                end else
                begin
                    szTemp := szTemp + 'за рахунок ';
                end;

                DS.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);

                szTemp := szTemp + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' (';

                DS.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);
                szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString+')';


                DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_PPS_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);
                if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                begin
                    fTemp  := fTemp + DS.FBN('PARAMETR_VALUE').AsFloat;
                    szTemp := szTemp + ', ' + DS.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                    DS.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_PPS_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' (';

                    DS.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_PPS_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString;

                    DS.Locate('PARAMETR_NAME', 'INST_KOEFF_PPS_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);
                    if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                    begin
                        DS.Locate('PARAMETR_NAME', 'INST_KOEFF_PPS_'+IntToStr(j)+'_1_' + IntToStr(iTemp), []);
                        szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + DS.FBN('PARAMETR_VALUE').AsString+'))';
                    end else
                    begin
                        szTemp := szTemp + ')';
                    end;
                end;

        {        else
                begin
                    szTemp := szTemp + '),';
                end;
         }
                if not (iTemp = iLength) then
                begin
                    szTemp := szTemp + '), ';
                end
                else begin

                    if k > 0 then
                    begin
                        if j = k+1
                            then szTemp := szTemp + ').'
                            else szTemp := szTemp + '),';
                    end else
                    begin
                         szTemp := szTemp + ').';
                    end;
                end;

            end;

            if k > 0 then
            begin
                if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_'+IntToStr(j)+'_1', [])
                    then szResult := szResult + #13 + '<b> з ' + DS.FBN('PARAMETR_VALUE').AsString;

                if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_'+IntToStr(j)+'_1', []) then
                begin
                    if DS.FBN('PARAMETR_VALUE').AsDateTime < d_inf then
                        szResult := szResult + ' по ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';

                end;
                szResult := szResult + '</b>';
            end;


            szResult := szResult + '<b> на ' + FormatFloat(stavka_str, rate_count);
            szResult := szResult + ' ставки</b> ';
            if UseDigit=2 then szResult := szResult + 'з тарифом '+ FormatFloat('0.00', fTemp) + ' грн. ' + szTemp
            else szResult := szResult + 'з окладом ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp;

            szResult := szResult + ' ';


            if (k> 0) and (j=k+1) then
            begin
                szResult := szResult + #13;
            end;

        end;
    end;
    //  Тип персонала
    szResult := szResult + '<u>Тип персоналу:</u> ';
    if DS.Locate('PARAMETR_NAME', 'INST_TYPE_POST_NAME_1_1', []) then
        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';

    if DS.Locate('PARAMETR_NAME', 'NOTE_1', []) then
        if (DS.FBN('PARAMETR_VALUE').AsString <> '') and (DS.FBN('PARAMETR_VALUE').AsString <> ' ') then
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '.';

    //szResult := szResult + #13;

    if DS.Locate('PARAMETR_NAME', 'INST_WORK_MODE_INFO_1_1', []) then
       if (DS.FBN('PARAMETR_VALUE').AsString <> '') then
       begin
           WorkModeInfo:=DS.FBN('PARAMETR_VALUE').AsString;
           szResult := szResult + 'встановити режим роботи ';
           szResult := szResult + 'з ';
           if min_date <> StrToDate('01.01.1000') then
              szResult := szResult + DateToStr(min_date) + ' '
           else
             if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_1_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';

           if max_date <> StrToDate('01.01.1000') then
           begin
              if max_date < d_inf then
              begin
                 szResult := szResult + 'по ';
                 szResult := szResult + DateToStr(max_date) + ' ';
              end;
           end;
           szResult := szResult + 'на ';
           if DS.Locate('PARAMETR_NAME', 'INST_NAME_TARIF_1_1', []) then
              szResult := szResult + '<b>' + DS.FBN('PARAMETR_VALUE').AsString;
           szResult := szResult + ' (' + WorkModeInfo+')</b>.';
       end;
    szResult := szResult + #13;   
    //  Установить при приёме доплаты и надбавки
   { if DS.Locate('PARAMETR_NAME', 'COUNT_BONUS', []) then
    begin

        k := DS.FBN('PARAMETR_VALUE').AsInteger;

        if k>=1 then
        begin
            flag_bonus := true;
            for i := 2 to k+1 do
            begin
                if DS.Locate('PARAMETR_NAME', 'MOVING_TYPE_' + IntToStr(i), []) then
                begin
                    if DS.FBN('PARAMETR_VALUE').AsInteger = 5 then
                    begin
                        if flag_bonus then
                            szResult := szResult + '<u>Доплати та надбавки:</u> ';
                        flag_bonus := false;
                    end;
                end;
            end;
        end;
        for i := 2 to k+1 do
        begin
            if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_INST_' + IntToStr(i), []) then
            begin
                iLength := DS.FBN('PARAMETR_VALUE').AsInteger;
                for iTemp := 1 to iLength do
                begin
                    szResult := szResult + '<b>';
                    if DS.Locate('PARAMETR_NAME', 'BONUS_DATE_BEG_'+ IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                        szResult := szResult + ' з ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';
                    if DS.Locate('PARAMETR_NAME', 'BONUS_END_BEG_'+ IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                        if DS.FBN('PARAMETR_VALUE').AsDateTime < d_inf then
                            szResult := szResult + 'по ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';
                    szResult := szResult + '</b>';
              

                    if DS.Locate('PARAMETR_NAME', 'BONUS_RAISE_NAME_BONUS_'+ IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                    szResult := szResult + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' - ';

                    if DS.Locate('PARAMETR_NAME', 'BONUS_PERCENT_'+ IntToStr(i)+ '_' + IntToStr(iTemp), [])
                        then begin
                            if not DS.FBN('PARAMETR_VALUE').isNull
                                then begin
                                    szResult := szResult + FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + '% ';
                                    //расшифровка
                                    if is_b_p = 1 then
                                    begin
                                    szResult:=szResult+'(';
                                    if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_BONUS_SMET_'+ IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                                        m := DS.FBN('PARAMETR_VALUE').AsInteger
                                        else m := 0;
                                    for mm := 1 to m do
                                    begin
                                        if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_'+ IntToStr(i)+ '_' + IntToStr(iTemp)+'_'+IntToStr(mm), []) then
                                            szResult := szResult + 'за рахунок ' + DS.FBN('PARAMETR_VALUE').AsString;
                                        if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_'+ IntToStr(i)+ '_' + IntToStr(iTemp)+'_'+IntToStr(mm), []) then
                                            szResult := szResult + ' (' +DS.FBN('PARAMETR_VALUE').AsString + ')';
                                        if (m <> mm) then szResult := szResult + ', '
                                        else szResult := szResult + ')'
                                    end;
                                end;
                                end
                                else begin
                                    if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_BONUS_SMET_'+ IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                                        m := DS.FBN('PARAMETR_VALUE').AsInteger
                                        else m := 0;
                                    for mm := 1 to m do
                                    begin
                                        if DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_'+ IntToStr(i)+ '_' + IntToStr(iTemp)+'_'+IntToStr(mm), [])
                                            then begin
                                                szResult := szResult + FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                                if is_b_p=1 then
                                                begin
                                                szResult:=szResult+'(за рахунок ';
                                                if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_'+ IntToStr(i)+ '_' + IntToStr(iTemp)+'_'+IntToStr(mm), []) then
                                                    szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString;
                                                if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_'+ IntToStr(i)+ '_' + IntToStr(iTemp)+'_'+IntToStr(mm), []) then
                                                    szResult := szResult + ' (' +DS.FBN('PARAMETR_VALUE').AsString + '))';
                                              end;
                                            end;
                                        if (m <> mm) then szResult := szResult + ', ';
                                    end;
                                 end;
                        end;

//                end;



                    if (i = k+1)
                        then szResult := szResult + '. '+#13
                        else szResult := szResult + ', ';
                end;
            end else
            begin
                szResult := copy(szResult, 1, LENGTH(szResult)-2) + '. '+#13;
            end;
        end;
    end;  }
    //  Причина
    szResult := szResult + '<u>Підстава: </u> ';
    DS.Locate('PARAMETR_NAME', 'REASON_1', []);
    szTemp := DS.FBN('PARAMETR_VALUE').AsString;
    iT:=0;
    for i:=0 to length(szTemp)-1 do
    begin
        s1:=copy(szTemp,i,1);
        if s1=' ' then inc(iT)
        else break;
    end;
    s := AnsiLowerCase(Copy(szTemp,1,iT+1));
    szResult := szResult + s + Copy(szTemp,iT+2,Length(szTemp));
    //szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString;

{    if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS', []) then
    begin
        k := DS.FBN('PARAMETR_VALUE').AsInteger;
        for i := 1 to k do
        begin
            if DS.Locate('PARAMETR_NAME', IntToStr(id_item) + '_ID_SES_' + IntToStr(i), []) then
            begin
                id_ses := StrToInt64(DS.FBN('PARAMETR_VALUE').AsString);

                DS.Locate('PARAMETR_NAME', IntToStr(id_item) + '_BPL_NAME_' + IntToStr(i), []);

                shablon    := DS.FBN('PARAMETR_VALUE').AsString;

                DS.Locate('PARAMETR_NAME', IntToStr(id_item) + '_ID_ITEM_' + IntToStr(i), []);
                id_item_shadow := StrToInt64(DS.FBN('PARAMETR_VALUE').AsString);

                HandlePack := GetModuleHandle(PCHar(shablon));
                if HandlePack<32 then
                begin
                    HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + '\UP\' + shablon);
                end;

                if HandlePack > 0 then
                begin
                    @func := GetProcAddress(HandlePack,PChar('GetTemplateString'));
                    if @func<>nil
                        then shadow := func(DB.Handle, id_ses, id_item_shadow)
                        else begin
                            MessageDlg('Неможливо зформувати шаблон - ' + shablon, mtError, [mbOk], 0);
                            Result := szResult;
                            EXIT;
                        end;
                end;

                TW.StartTransaction;
                try
                    Stored.StoredProcName := 'UP_DT_ORDER_ITEM_BODY_DELETE';
                    Stored.Prepare;
                    Stored.ParamByName('D_ID_SESSION').AsInt64 := id_ses;
                    Stored.ExecProc;
                    TW.Commit;
                except on E:Exception do
                begin
                    TW.Rollback;
                    ShowMessage(E.Message);
                end;
                end;
                szResult := szResult + #13 + #13 + shadow;
            end;
        end;
    end;
 }
    TR.Rollback;
    DS.Free;
    TR.Free;
    db.Free;
    DecimalSeparator    := ',';
  except on Error: Exception do begin
    MessageDlg('Неможливо зформувати шаблон', mtError, [mbOk], 0);
//    szResult := '';
  end;
  end;
    Result := szResult;
end;

end.
