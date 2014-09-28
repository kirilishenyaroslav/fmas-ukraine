unit uTemplateReceipt14; {продолжение периода работы}

interface

uses SysUtils, Classes, Dialogs, ibase, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, pFIBStoredProc,
    Windows, Messages, Variants, Graphics, Controls, Forms, StdCtrls, ActnList, Registry, ExtCtrls;

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item: Int64): string; stdcall;

exports GetTemplateString;

implementation

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item: Int64): string; stdcall;
var
    szResult, s, stavka_str, s1, s2: string; //  Строка для формирования результирующей строки
    szTemp {, {shablon, shadow}: string; //  Строка для хранения текстовой строки
    cTemp: Char;
    iTemp, k, i, j, m, iT: Integer; //  Переменная для хранения значения целого типа
    iLength, mm, iR: Integer; //  Переменная для хранения значения целого типа длины цикла
    fTemp, rate_count: Currency; //  Переменная для хранения значения вещественного типа
    db: TpFIBDatabase; //  База
    TR, TW: TpFIBTransaction; //  Транзакция
    DS: TpFIBDataSet; //  Датасэт
    Stored: TpFIBStoredProc;
    is_b_p, UseDigit: Integer; //Печатать расшифровку по сметам в надбавках, Проверка тариф или оклад
    PayForm, IdAwayType: Integer;
    StrRaise, StrRaiseTemp, sT, sMaxDate: string;
    flR: Boolean;
    BonusSumma, BonusSummaPps: string;
    //    id_ses, id_item_shadow : int64;

//    HandlePack : HModule;
//    func : function(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

    d_inf: TDateTime;
    flag_bonus, flagok: boolean;
    max_date, min_date: TDateTime;
    id_server: integer;
    AddInfo: string;
begin
    try
        IdAwayType := -1;
        min_date := StrToDate('01.01.1000');
        max_date := StrToDate('01.01.1000');
        db := TpFIBDatabase.Create(nil);
        TR := TpFIBTransaction.Create(nil);
        TW := TpFIBTransaction.Create(nil);
        DS := TpFIBDataSet.Create(nil);
        Stored := TpFIBStoredProc.Create(nil);
        db.SQLDialect := 3;
        db.Handle := hConnection;
        TR.DefaultDatabase := db;
        TW.DefaultDatabase := db;
        db.DefaultTransaction := TR;
        DS.Database := db;
        DS.Transaction := TR;
        Stored.Database := db;
        Stored.Transaction := TW;

        TR.StartTransaction;
    //  Формирование шаблона
        szResult := '';

        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select is_bonus_print from UP_SYS_INI_CONSTS';
        DS.Open;
        if varIsNull(DS['is_bonus_print']) then is_b_p := 0 else
            is_b_p := DS['is_bonus_print'];

        DS.Close;
        DS.SQLs.SelectSQL.Text := 'SELECT * FROM INI_ASUP_CONSTS';
        DS.Open;

        stavka_str := ds.fbn('STAVKI_DISP_FORMAT').Asstring;
        PayForm := ds.fbn('PAY_FORM_VIDRYAD').AsInteger;
        DS.Close;

        DS.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
        DS.Open;
        id_server := DS.fbn('ID_SERVER').AsInteger;
        try d_inf := DS.fbn('INFINITY_DATE').AsDateTime;
        except d_inf := StrToDate('31.12.2050');
        end;
        DS.Close;

        DS.SQLs.SelectSQL.Text := 'SELECT * FROM up_dt_order_item_body WHERE id_session =' + IntToStr(id_session) + '';
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
                for i := 2 to k + 1 do
                begin
                    if DS.Locate('PARAMETR_NAME', 'COUNT_MOVING_INST_' + IntToStr(i), []) then
                    begin
                        for j := 1 to DS.FBN('PARAMETR_VALUE').AsInteger do
                        begin
                            if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_' + IntToStr(i) + '_' + IntToStr(j), [])
                                then if min_date > DS.FBN('PARAMETR_VALUE').AsDateTime then
                                    min_date := DS.FBN('PARAMETR_VALUE').AsDateTime;

                            if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_' + IntToStr(i) + '_' + IntToStr(j), [])
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
                UseDigit := DS.FBN('PARAMETR_VALUE').AsInteger;

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
        szResult := szResult + szTemp;

        if DS.Locate('PARAMETR_NAME', 'INST_TN_1_1', [])
            then szResult := szResult + '(TH ' + DS.FBN('PARAMETR_VALUE').AsString + ')';

        szResult := szResult + '</b>, ';

        if DS.Locate('PARAMETR_NAME', 'INST_EDUC_ZVANIE_AND_ST_1_1', []) then
            if (not DS.FBN('PARAMETR_VALUE').isNull) and (DS.FBN('PARAMETR_VALUE').AsString <> '')
                then szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';

        szResult := szResult + '<u>тип персоналу:</u> ';

        if DS.Locate('PARAMETR_NAME', 'TO_TYPE_POST_NAME_1_1', []) then
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';

//    if DS.Locate('PARAMETR_NAME', 'TO_DATE_END_1_1', []) then
//        szResult := szResult + ', '+'основний договір до ' + DS.FBN('PARAMETR_VALUE').AsString + ', ';

        szResult := szResult + '<u>посада</u>: ';
        if DS.Locate('PARAMETR_NAME', 'TO_NAME_POST_SALARY_REAL_1_1', []) then
//        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';
        begin
            szTemp := DS.FBN('PARAMETR_VALUE').AsString;
            s := copy(szTemp, 2, 1);
            if ((ord(s[1]) <= 223) and (ord(s[1]) >= 192)) or (ord(s[1]) = 175) or (ord(s[1]) = 178) or (ord(s[1]) = 170) or (ord(s[1]) = 73) then
            begin
                szResult := szResult + szTemp + ', ';
            end else
            begin
                cTemp := ansiLowerCase(szTemp)[1];
                szTemp[1] := cTemp;
                szResult := szResult + szTemp + ', ';
            end;
            szTemp := '';
        end;

        szResult := szResult + '<u>підрозділ:</u> ';
        if DS.Locate('PARAMETR_NAME', 'TO_NAME_DEPARTMENT_VERH_1_1', []) then
        begin
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';
        end;
        if DS.Locate('PARAMETR_NAME', 'TO_NAME_DEPARTMENT_1_1', []) then
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString;

        fTemp := 0;
        iLength := 0;

        if DS.Locate('PARAMETR_NAME', 'TO_COUNT_SM_1_1', []) then
            iLength := DS.FBN('PARAMETR_VALUE').AsInteger;

        rate_count := 0;
        DecimalSeparator := '.';
        for iTemp := 1 to iLength do begin
            if DS.Locate('PARAMETR_NAME', 'TO_RATE_COUNT_1_1_' + IntToStr(iTemp), []) then
            begin
                rate_count := rate_count + DS.FBN('PARAMETR_VALUE').AsFloat;
            end;

            if iLength > 1 then
            begin
                if iTemp = 1 then szTemp := ' з оплатою ';
                szTemp := szTemp + FormatFloat(stavka_str, DS.FBN('PARAMETR_VALUE').AsFloat) + ' ставки ';
            end;

            szTemp := szTemp + ' (';

            DS.Locate('PARAMETR_NAME', 'TO_SUMMA_SMETA_PPS_1_1_' + IntToStr(iTemp), []);
            if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat <> 0) then
            begin
                flagok := true
            end else
                flagok := false;

            DS.Locate('PARAMETR_NAME', 'TO_SUMMA_SMETA_1_1_' + IntToStr(iTemp), []);
            fTemp := fTemp + DS.FBN('PARAMETR_VALUE').AsFloat;

            if (iLength > 1) or (flagok) then
            begin
                szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
            end else
            begin
                szTemp := szTemp + 'за рахунок ';
            end;

            DS.Locate('PARAMETR_NAME', 'TO_SMETA_TITLE_1_1_' + IntToStr(iTemp), []);

            szTemp := szTemp + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' (';

            DS.Locate('PARAMETR_NAME', 'TO_SMETA_KOD_1_1_' + IntToStr(iTemp), []);
            szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString + ')';

            DS.Locate('PARAMETR_NAME', 'TO_SUMMA_SMETA_PPS_1_1_' + IntToStr(iTemp), []);
            if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat <> 0) then
            begin
                fTemp := fTemp + DS.FBN('PARAMETR_VALUE').AsFloat;
                szTemp := szTemp + ', ' + DS.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                DS.Locate('PARAMETR_NAME', 'TO_SMETA_TITLE_PPS_1_1_' + IntToStr(iTemp), []);
                szTemp := szTemp + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' (';

                DS.Locate('PARAMETR_NAME', 'TO_SMETA_KOD_PPS_1_1_' + IntToStr(iTemp), []);
                szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString;

                DS.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_1_' + IntToStr(iTemp), []);
                if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                begin
                    DS.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + DS.FBN('PARAMETR_VALUE').AsString + '))';
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
                szTemp := szTemp + '),';
            end;

        end;

        szResult := szResult + ', працюючого на <b> ' + FormatFloat(stavka_str, rate_count);
        szResult := szResult + ' ставки</b> ';
        if UseDigit = 2 then szResult := szResult + 'з тарифом ' + FormatFloat('0.00', fTemp) + ' грн.' + szTemp
        else szResult := szResult + 'з окладом  ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp;

        szTemp := '';
//    rate_count := 0;

        szResult := szResult + ' з ';
        if min_date <> StrToDate('01.01.1000')
            then szResult := szResult + DateToStr(min_date) + ' '
        else
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_1_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';

        if max_date <> StrToDate('01.01.1000') then
        begin
            if max_date < d_inf then
            begin
                sMaxDate := 'по ';
                sMaxDate := sMaxDate + DateToStr(max_date) + ' ';
            end;
        end;

        if DS.Locate('PARAMETR_NAME', 'INST_HOSPITAL_1_1', []) then
        begin
            if ((DS.Locate('PARAMETR_NAME', 'ID_AWAY_TYPE_1_1', [])) and
                (not DS.FBN('PARAMETR_VALUE').IsNull)) then IdAwayType := DS.FBN('PARAMETR_VALUE').AsInteger;

            if ((IdAwayType = 1) or (IdAwayType = -1)) then
            begin
                if max_date <> StrToDate('01.01.1000') then
                begin
                    if max_date < d_inf then
                    begin
                        szResult := szResult + 'по ';
                        szResult := szResult + DateToStr(max_date) + ' ';
                    end;
                end;
            end;

            if DS.Locate('PARAMETR_NAME', 'INST_AWAY_ENDING_1_1', []) then
            begin
               if DS.FBN('PARAMETR_VALUE').AsInteger <> 2 then
               begin
                   if DS.Locate('PARAMETR_NAME', 'INST_HOSP_DATE_END_1_1', []) then
                   szResult := szResult + 'по ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';
               end;    
            end;

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
        end
        else szResult := szResult + sMaxDate;

        if DS.Locate('PARAMETR_NAME', 'INST_YEARS_ACCEPT_COND_PRINT_1_1', []) then
        begin
            if DS.FBN('PARAMETR_VALUE').AsInteger > 0 then
                szResult := szResult + 'на ' + DS.FBN('PARAMETR_VALUE').AsString + ' років ';
        end;

        if DS.Locate('PARAMETR_NAME', 'INST_NAME_ACCEPT_COND_PRINT_1_1', []) then
            if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsString <> '') then
                szResult := szResult + 'на умовах ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';

        if DS.Locate('PARAMETR_NAME', 'INST_A_DATE_END_1_1', []) then
            if (not DS.FBN('PARAMETR_VALUE').IsNull) then
                szResult := szResult + 'по ' + DS.FBN('PARAMETR_VALUE').AsString + ', ';

        szResult := szResult + '<u>тип роботи</u> ';
        if DS.Locate('PARAMETR_NAME', 'INST_WORK_REASON_1_1', []) then
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';

        szResult := szResult + '<u>посада</u>: ';
        if DS.Locate('PARAMETR_NAME', 'INST_NAME_POST_1_1', []) then
        begin
//        szResult  := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';
            szTemp := DS.FBN('PARAMETR_VALUE').AsString;
            s := copy(szTemp, 2, 1);
            if ((ord(s[1]) <= 223) and (ord(s[1]) >= 192)) or (ord(s[1]) = 175) or (ord(s[1]) = 178) or (ord(s[1]) = 170) or (ord(s[1]) = 73) then
            begin
                szResult := szResult + szTemp + ', ';
            end else
            begin
                cTemp := ansiLowerCase(szTemp)[1];
                szTemp[1] := cTemp;
                szResult := szResult + szTemp + ', ';
            end;
            szTemp := '';
        end;
        szResult := szResult + '<u>підрозділ:</u> ';
        if DS.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_VERH_1_1', []) then
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';
        if DS.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_1_1', []) then
            szResult := szResult + '<b>' + DS.FBN('PARAMETR_VALUE').AsString + '</b>';

        if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS_NOT5', []) then
        begin
            k := DS.FBN('PARAMETR_VALUE').AsInteger;
            for j := 1 to k + 1 do
            begin
                szTemp := '';

                fTemp := 0;
                iLength := 0;

                if DS.Locate('PARAMETR_NAME', 'INST_COUNT_SM_' + IntToStr(j) + '_1', []) then
                    iLength := DS.FBN('PARAMETR_VALUE').AsInteger;
                rate_count := 0;
                DecimalSeparator := '.';
                for iTemp := 1 to iLength do begin
                    if DS.Locate('PARAMETR_NAME', 'INST_RATE_COUNT_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []) then
                    begin
                        rate_count := rate_count + DS.FBN('PARAMETR_VALUE').AsFloat;
                    end;

                    if iLength > 1 then
                    begin
                        if iTemp = 1 then szTemp := ' з оплатою ';
                        szTemp := szTemp + FormatFloat(stavka_str, DS.FBN('PARAMETR_VALUE').AsFloat) + ' ставки ';
                    end;

                    szTemp := szTemp + ' (';

                    DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                    if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                    begin
                        flagok := true;
                    end else
                        flagok := false;

                    DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                    fTemp := fTemp + DS.FBN('PARAMETR_VALUE').AsFloat;

                    if (iLength > 1) or (flagok) then
                    begin
                        szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
                    end else
                    begin
                        szTemp := szTemp + 'за рахунок ';
                    end;

                    DS.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);

                    szTemp := szTemp + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' (';

                    DS.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString + ')';

                    DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                    if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                    begin
                        fTemp := fTemp + DS.FBN('PARAMETR_VALUE').AsFloat;
                        szTemp := szTemp + ', ' + DS.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                        DS.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                        szTemp := szTemp + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' (';

                        DS.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                        szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString;

                        DS.Locate('PARAMETR_NAME', 'INST_KOEFF_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                        if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                        begin
                            DS.Locate('PARAMETR_NAME', 'INST_KOEFF_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                            szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + DS.FBN('PARAMETR_VALUE').AsString + '))';
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
                            if j = k + 1
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
                    if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_' + IntToStr(j) + '_1', [])
                        then szResult := szResult + #13 + '<b> з ' + DS.FBN('PARAMETR_VALUE').AsString;

                    if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_' + IntToStr(j) + '_1', []) then
                    begin
                        if DS.FBN('PARAMETR_VALUE').AsDateTime < d_inf then
                            szResult := szResult + ' по ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';

                    end;
                    szResult := szResult + '</b>';
                end;

                szResult := szResult + '<b> на ' + FormatFloat(stavka_str, rate_count);
                szResult := szResult + ' ставки</b> ';
           { if UseDigit=2 then szResult := szResult + 'з тарифом ' + FormatFloat('0.00', fTemp) + ' грн.' + szTemp
            else szResult := szResult + 'з окладом  ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp; }
                if DS.Locate('PARAMETR_NAME', 'INST_ID_PAY_FORM_' + IntToStr(j) + '_1', []) then
                begin
                    if not DS.FBN('PARAMETR_VALUE').isNull then
                        if DS.FBN('PARAMETR_VALUE').AsInteger = PayForm then
                            szResult := szResult + ' з відрядною оплатою праці' + szTemp
                        else
                        begin
                            if UseDigit = 2 then szResult := szResult + ' з тарифом ' + FormatFloat('0.00', fTemp) + ' грн.' + szTemp
                            else szResult := szResult + ' з окладом ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp
                        end
                    else
                    begin
                        if UseDigit = 2 then szResult := szResult + ' з тарифом ' + FormatFloat('0.00', fTemp) + ' грн.' + szTemp
                        else szResult := szResult + ' з окладом ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp;
                    end;
                end;
                szResult := szResult + ' ';
                if (k > 0) and (j = k + 1) then
                begin
                    szResult := szResult + #13;
                end;

            end;
        end;

    //  Тип персонала
        szResult := szResult + '<u>Тип персоналу:</u> ';
        if DS.Locate('PARAMETR_NAME', 'INST_TYPE_POST_NAME_1_1', []) then
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '. ';

        if DS.Locate('PARAMETR_NAME', 'NOTE_1', []) then
            if (DS.FBN('PARAMETR_VALUE').AsString <> '') and (DS.FBN('PARAMETR_VALUE').AsString <> ' ') then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '.';

        szResult := szResult + #13;
    //  Установить при приёме доплаты и надбавки
        if DS.Locate('PARAMETR_NAME', 'COUNT_BONUS', []) then
        begin

            k := DS.FBN('PARAMETR_VALUE').AsInteger;

            if k >= 1 then
            begin
                flag_bonus := true;
                for i := 2 to k + 1 do
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
            for i := 2 to k + 1 do
            begin
                if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_INST_' + IntToStr(i), []) then
                begin
                    iLength := DS.FBN('PARAMETR_VALUE').AsInteger;
                    for iTemp := 1 to iLength do
                    begin
                        szResult := szResult + '<b>';
                        if DS.Locate('PARAMETR_NAME', 'BONUS_DATE_BEG_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                            szResult := szResult + ' з ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';
                        if DS.Locate('PARAMETR_NAME', 'BONUS_END_BEG_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                            if ((DS.FBN('PARAMETR_VALUE').AsDateTime < d_inf) and
                                (IdAwayType <> 0)) then
                                szResult := szResult + 'по ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';
                        szResult := szResult + '</b>';

                        StrRaiseTemp := '';
                        if DS.Locate('PARAMETR_NAME', 'BONUS_RAISE_NAME_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                            StrRaiseTemp := DS.FBN('PARAMETR_VALUE').AsString;
                        StrRaise := '';
                        flR := False;
                        iR := 1;
                        while (iR <= Length(StrRaiseTemp)) do
                        begin
                            sT := copy(StrRaiseTemp, iR, 1);
                            if (flR = False) then
                            begin
                                if (sT = '"') then
                                begin
                                    Inc(iR);
                                    StrRaise := StrRaise + '"' + copy(StrRaiseTemp, iR, 1);
                                    flR := True;
                                end
                                else StrRaise := StrRaise + AnsiLowerCase(sT);
                            end
                            else
                            begin
                                if (sT = '"') then
                                begin
                                    StrRaise := StrRaise + AnsiLowerCase(sT);
                                    flR := False;
                                end
                                else StrRaise := StrRaise + sT;
                            end;
                            Inc(iR);
                        end;

                        szResult := szResult + StrRaise + ' - ';

                        if DS.Locate('PARAMETR_NAME', 'BONUS_PERCENT_' + IntToStr(i) + '_' + IntToStr(iTemp), [])
                            then begin
                            if not DS.FBN('PARAMETR_VALUE').isNull
                                then begin
                                szResult := szResult + FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + '% посадового окладу ';
                                if is_b_p = 1 then
                                begin
                                    szResult := szResult + '(';
                                    if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_BONUS_SMET_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                                        m := DS.FBN('PARAMETR_VALUE').AsInteger
                                    else m := 0;
                                    for mm := 1 to m do
                                    begin
                                        BonusSumma := '';
                                        DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                        BonusSumma := FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                        if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                            szResult := szResult + BonusSumma + '- за рахунок ' + DS.FBN('PARAMETR_VALUE').AsString;
                                        if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                            szResult := szResult + ' (' + DS.FBN('PARAMETR_VALUE').AsString + ')';

                                        BonusSummaPps := '';
                                        DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                        if ((not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat > 0)) then
                                        begin
                                            BonusSummaPps := FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                            if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_TITLE_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                                szResult := szResult + ', ' + BonusSummaPps + '- за рахунок ' + DS.FBN('PARAMETR_VALUE').AsString;
                                            if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_KOD_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                                szResult := szResult + ' (' + DS.FBN('PARAMETR_VALUE').AsString + ')'; //', коефіціент підвищення посадового окладу '+KoeffPps+')';
                                        end;
                                        if (m <> mm) then szResult := szResult + ', '
                                        else szResult := szResult + ')'
                                    end;
                                end;
                            end
                            else begin
                                if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_BONUS_SMET_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                                    m := DS.FBN('PARAMETR_VALUE').AsInteger
                                else m := 0;
                                for mm := 1 to m do
                                begin
                                    if DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), [])
                                        then begin
                                        szResult := szResult + FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                        if is_b_p = 1 then
                                        begin
                                            BonusSumma := '';
                                            DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                            BonusSumma := FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                            szResult := szResult + {+BonusSumma+-} ' (за рахунок ';
                                            if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString;
                                            if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                                szResult := szResult + ' (' + DS.FBN('PARAMETR_VALUE').AsString + '))';

                                            BonusSummaPps := '';
                                            DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                            if ((not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat > 0)) then
                                            begin
                                                BonusSummaPps := FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                                if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_TITLE_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                                    szResult := szResult + ', ' + BonusSummaPps + '- за рахунок ' + DS.FBN('PARAMETR_VALUE').AsString;
                                                if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_KOD_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                                    szResult := szResult + ' (' + DS.FBN('PARAMETR_VALUE').AsString + ')'; // ', коефіціент підвищення посадового окладу '+KoeffPps+')';
                                            end;
                                        end;
                                    end;
                                    if (m <> mm) then szResult := szResult + ', ';
                                end;
                            end;
                        end;

//                end;

                        if (i = k + 1)
                            then szResult := szResult + '. ' + #13
                        else szResult := szResult + ', ';
                    end;
                end else
                begin
                    szResult := copy(szResult, 1, LENGTH(szResult) - 2) + '. ' + #13;
                end;
            end;
        end;
    //  Причина
        szResult := szResult + '<u>Підстава:</u> ';
        DS.Locate('PARAMETR_NAME', 'REASON_1', []);
        szTemp := DS.FBN('PARAMETR_VALUE').AsString;
        iT := 0;
        for i := 0 to length(szTemp) - 1 do
        begin
            s1 := copy(szTemp, i, 1);
            if s1 = ' ' then
            begin
                inc(iT);
            end
            else break;
        end;
        s := AnsiLowerCase(Copy(szTemp, 1, iT + 1));
        szResult := szResult + s + Copy(szTemp, iT + 2, Length(szTemp));

        if (id_server = 99) then
        begin
            DS.Locate('PARAMETR_NAME', 'INST_ADD_INFO_1_1', []);
            AddInfo := DS.FBN('PARAMETR_VALUE').AsString;
            if AddInfo = 'T' then
            begin
                szResult := szResult + #13 + '<i><u>Додатково:</u> основне місце роботи - ';
                szTemp := '';
                if (DS.Locate('PARAMETR_NAME', 'INST_OSN_POST_NAME_1_1', [])) then
                    szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';
                if (DS.Locate('PARAMETR_NAME', 'INST_OSN_RATE_COUNT_1_1', [])) then
                    szTemp := szTemp + '( ' + FormatFloat(stavka_str, DS.FBN('PARAMETR_VALUE').AsFloat) + ' ставка), ';
                szResult := szResult + szTemp;
                if (DS.Locate('PARAMETR_NAME', 'INST_OSN_NAME_DEPARTMENT_1_1', [])) then
                    szResult := szResult + '<u>підрозділ:</u> ' + DS.FBN('PARAMETR_VALUE').AsString + '.</i>';
            end;
        end;
    //szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '.';

  //  szTemp := DS.FBN('PARAMETR_VALUE').AsString;
  //  s := AnsiLowerCase(Copy(szTemp,1,1));
  //  szResult := szResult + s + Copy(szTemp,2,Length(szTemp)) + '.';
    //szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '.';

 {   if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS', []) then
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
        DecimalSeparator := ',';
    except on Error: Exception do begin
            MessageDlg('Невозможно сформировать шаблон', mtError, [mbOk], 0);
//    szResult := '';
        end;
    end;
    Result := szResult;
end;

end.

