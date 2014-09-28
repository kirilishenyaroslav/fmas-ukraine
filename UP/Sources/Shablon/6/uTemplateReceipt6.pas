unit uTemplateReceipt6; {надбавка}

interface

uses SysUtils,
    Classes,
    Dialogs,
    ibase,
    DB,
    FIBDatabase,
    pFIBDatabase,
    FIBDataSet,
    pFIBDataSet;

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item: Int64): string; stdcall;

exports GetTemplateString;

implementation

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item: Int64): string; stdcall;
var
    szResult, s, s1, s2: string; //  Строка для формирования результирующей строки
    szTemp, stavka_str, hours_str: string; //  Строка для хранения текстовой строки
    cTemp: Char; //  Переменная для хранения символа
    iTemp, n, iT, iR: Integer; //  Переменная для хранения значения целого типа
    iLength, i, l, l_b: Integer; //  Переменная для хранения значения целого типа длины цикла
    fTemp, rate_count, f, hours_count: Currency; //  Переменная для хранения значения вещественного типа
    fdbTemplateReceipt: TpFIBDatabase; //  База
    ftrTemplateReceipt: TpFIBTransaction; //  Транзакция
    fdsTemplateReceipt: TpFIBDataSet; //  Датасэт
    flagok, flR, Is_Ped_Work: boolean;
    StrRaise, StrRaiseTemp, sT: string;
begin
    try
        fdbTemplateReceipt := TpFIBDatabase.Create(nil);
        ftrTemplateReceipt := TpFIBTransaction.Create(nil);
        fdsTemplateReceipt := TpFIBDataSet.Create(nil);
        fdbTemplateReceipt.SQLDialect := 3;
        fdbTemplateReceipt.Handle := hConnection;
        ftrTemplateReceipt.DefaultDatabase := fdbTemplateReceipt;
        fdbTemplateReceipt.DefaultTransaction := ftrTemplateReceipt;
        fdsTemplateReceipt.Database := fdbTemplateReceipt;
        fdsTemplateReceipt.Transaction := ftrTemplateReceipt;
        ftrTemplateReceipt.StartTransaction;

        szResult := '';
        fdsTemplateReceipt.Close;
        fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT * FROM INI_ASUP_CONSTS';
        fdsTemplateReceipt.Open;

        hours_str := '#######0.00';
        stavka_str := fdsTemplateReceipt.fbn('STAVKI_DISP_FORMAT').Asstring;
        fdsTemplateReceipt.Close;

        fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT * FROM up_dt_order_item_body WHERE id_session = ' + IntToStr(id_session) + '';
        fdsTemplateReceipt.Open;
        //  Номер пункта
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'NUM_ITEM_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '.';
        //  Номер подпункта
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'NUM_SUB_ITEM_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '. ';
        //  Фамилия
        szResult := szResult + '<u>ПІБ:</u> <b>';
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SECOND_NAME_UA_1_1', []) then
            //  Заглавными буквами
            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
        //  Имя
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_FIRST_NAME_UA_1_1', []) then
        begin
            //  Первая буква заглавная, а остальные маленькие
    {        szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
            cTemp := UpCase(szTemp[1]);
            szTemp := AnsiLowerCase(szTemp);
            szTemp[1] := cTemp;}
            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
        end;
        szResult := szResult + szTemp;
        //  Отчество
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_LAST_NAME_UA_1_1', []) then
        begin
            //  Первая буква заглавная, а остальные маленькие
    {        szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
            cTemp := UpCase(szTemp[1]);
            szTemp := AnsiLowerCase(szTemp);
            szTemp[1] := cTemp;}
            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
        end;
        //    szResult := szResult + szTemp;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_TN_1_1', []) then
            szResult := szResult + '(TH ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

        szResult := szResult + '</b>, ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_EDUC_ZVANIE_AND_ST_1_1', []) then
            if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '' then
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';

        szResult := szResult + '<u>тип персоналу:</u> ';
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_TYPE_POST_NAME_1_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_DEPARTMENT_OSN_1_1', []) then
        begin
            if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> ' ') and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '') then
                szResult := szResult + ' <u>основне місце роботи:</u> ' + {AnsiLowerCase(} fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString {)} +
                    ', '
            else
                szResult := szResult + ' <u>основне місце роботи:</u> нема, ';

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_POST_OSN_1_1', []) then
                if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> ' ') and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '') then
                    szResult := szResult + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ', ';
        end;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_IS_PED_WORK_1_1', []) then
        begin
            if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger = 1) then
                Is_Ped_Work := True
            else
                Is_Ped_Work := False;
        end;

        szResult := szResult + '<u>посада:</u> ';
        //  1
        if Is_Ped_Work then
        begin
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_POST_SALARY_1_1', []) then
                //        szResult := szResult + '<b>' + DS.FBN('PARAMETR_VALUE').AsString + '</b>, ';
            begin
                szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                s := copy(szTemp, 2, 1);
                if ((ord(s[1]) <= 223) and (ord(s[1]) >= 192)) or (ord(s[1]) = 175) or (ord(s[1]) = 178) or (ord(s[1]) = 170) or (ord(s[1]) = 73)
                    then
                begin
                    szResult := szResult + '<b>' + szTemp + '</b>, ';
                end
                else
                begin
                    cTemp := ansiLowerCase(szTemp)[1];
                    szTemp[1] := cTemp;
                    szResult := szResult + '<b>' + szTemp + '</b>, ';
                end;
                szTemp := '';
            end;
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_POST_BASE_SALARY_1_1', []) then
                //        szResult := szResult + '<b>' + DS.FBN('PARAMETR_VALUE').AsString + '</b>, ';
                if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '') then
                begin
                    szResult := szResult + '<u>кваліфікаційна категорія</u>: ';
                    szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                    s := copy(szTemp, 2, 1);
                    if ((ord(s[1]) <= 223) and (ord(s[1]) >= 192)) or (ord(s[1]) = 175) or (ord(s[1]) = 178) or (ord(s[1]) = 170) or (ord(s[1]) = 73)
                        then
                    begin
                        szResult := szResult + '<b>' + szTemp + '</b>, ';
                    end
                    else
                    begin
                        cTemp := ansiLowerCase(szTemp)[1];
                        szTemp[1] := cTemp;
                        szResult := szResult + '<b>' + szTemp + '</b>, ';
                    end;
                    szTemp := '';
                end;
        end
        else
        begin

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_POST_1_1', []) then
                //        szResult := szResult + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) +', ';
            begin
                szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                s := copy(szTemp, 2, 1);
                if ((ord(s[1]) <= 223) and (ord(s[1]) >= 192)) or (ord(s[1]) = 175) or (ord(s[1]) = 178) or (ord(s[1]) = 170) or (ord(s[1]) = 73)
                    then
                begin
                    szResult := szResult + szTemp + ', ';
                end
                else
                begin
                    cTemp := ansiLowerCase(szTemp)[1];
                    szTemp[1] := cTemp;
                    szResult := szResult + szTemp + ', ';
                end;
                szTemp := '';
            end;
        end;

        szResult := szResult + '<u>підрозділ:</u><b> ';
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_DEPARTMENT_VERH_1_1', []) then
        begin
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';
        end;
        //  Подразделение
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_DEPARTMENT_1_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        szResult := szResult + ' </b>';

        fTemp := 0;
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_COUNT_SM_1_1', []) then
            iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
        else
            iLength := 0;
        rate_count := 0;
        hours_count := 0;
        DecimalSeparator := '.';
        for iTemp := 1 to iLength do
        begin
            if Is_Ped_Work then
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_HOURS_COUNT_1_1_' + IntToStr(iTemp), []) then
                begin
                    hours_count := hours_count + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                end;
                if iLength > 1 then
                begin

                    szTemp := szTemp + FormatFloat(hours_str, fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' год. за рахунок ';
                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_TITLE_1_1_' + IntToStr(iTemp), []);

                    szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_KOD_1_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

                end
                else
                begin
                    szTemp := szTemp + ' за рахунок ';
                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_TITLE_1_1_' + IntToStr(iTemp), []);

                    szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_KOD_1_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';
                end;
                if not (iTemp = iLength) then
                begin
                    szTemp := szTemp + ', ';
                end
                else
                begin
                    szTemp := szTemp + '), ';
                end;

            end
            else
            begin

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_RATE_COUNT_1_1_' + IntToStr(iTemp), []) then
                begin
                    rate_count := rate_count + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                end;

                if iLength > 1 then
                begin
                    if iTemp = 1 then
                        szTemp := ' з оплатою ';
                    szTemp := szTemp + FormatFloat(stavka_str, fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' ставки ';
                end;

                szTemp := szTemp + ' (';

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SUMMA_SMETA_PPS_1_1_' + IntToStr(iTemp), []);
                if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                begin
                    flagok := true;
                end
                else
                    flagok := false;

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SUMMA_SMETA_1_1_' + IntToStr(iTemp), []);
                fTemp := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;

                if (iLength > 1) or (flagok) then
                begin
                    szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
                end
                else
                begin
                    szTemp := szTemp + 'за рахунок ';
                end;

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_TITLE_1_1_' + IntToStr(iTemp), []);

                szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_KOD_1_1_' + IntToStr(iTemp), []);
                szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SUMMA_SMETA_PPS_1_1_' + IntToStr(iTemp), []);
                if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                begin
                    fTemp := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                    szTemp := szTemp + ', ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_TITLE_PPS_1_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_KOD_PPS_1_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_1_' + IntToStr(iTemp), []);
                    if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                    begin
                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_1_' + IntToStr(iTemp), []);
                        szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '))';
                    end
                    else
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
                else
                begin
                    szTemp := szTemp + '), ';
                end;
            end;
        end;

        if is_ped_work then
        begin
            szResult := szResult + '<b> з педагогічним навантаженням ' + FormatFloat(hours_str, hours_count);
            szResult := szResult + ' год. / ';
            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_MONTH_HOURS_COUNT_1_1', []);
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' міс. </b>' + szTemp;
            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SALARY_SUM_1_1', []);
            szResult := szResult + ' ставка заробітної плати ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн.';
        end
        else
        begin
            szResult := szResult + '<b> на ' + FormatFloat(stavka_str, rate_count);
            szResult := szResult + ' ставки</b>  з окладом ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp;
        end;
        //    szResult := szResult + ' ';

        szResult := szResult + '<u>тип роботи:</u> ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_WORK_REASON_1_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'COUNT_MOVING_INST_1', []) then
            iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
        else
            iLength := 0;
        szResult := szResult + 'призначити ';
        for iTemp := 1 to iLength do
        begin
            StrRaiseTemp := '';
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_RAISE_NAME_BONUS_1_' + IntToStr(iTemp), []) then
                StrRaiseTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
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
                    else
                        StrRaise := StrRaise + AnsiLowerCase(sT);
                end
                else
                begin
                    if (sT = '"') then
                    begin
                        StrRaise := StrRaise + AnsiLowerCase(sT);
                        flR := False;
                    end
                    else
                        StrRaise := StrRaise + sT;
                end;
                Inc(iR);
            end;
            szResult := szResult + '<b>' + StrRaise + '</b> ';

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_RAISE_ID_CALC_TYPE_1_' + IntToStr(iTemp), []) then
            begin
                if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger = 4 then
                begin
                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVM_NAME_POST_1_' + IntToStr(iTemp), []) then
                        szResult := szResult + {'<u>посада:</u> '} '(' + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);

                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVM_SUM_POST_SALARY_1_' + IntToStr(iTemp), []) then
                        szResult := szResult + ', оклад ' + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн.), ';

                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVNM_NAME_DEPARTMENT_1_' + IntToStr(iTemp), []) then
                    begin
                        szResult := szResult + '<u>підрозділ:</u> ';
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVNM_NAME_DEPARTMENT_VERH_1_' + IntToStr(iTemp), []) then
                        begin
                            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';
                        end;
                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVNM_NAME_DEPARTMENT_1_' + IntToStr(iTemp), []);
                        szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                    end;

                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVM_SECOND_NAME_UA_1_' + IntToStr(iTemp), []) then
                    begin
                        szResult := szResult + 'на час відсутності ' + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';

                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVM_FIRST_NAME_UA_1_' + IntToStr(iTemp), []) then
                            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';

                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVM_LAST_NAME_UA_1_' + IntToStr(iTemp), []) then
                            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
                    end;

                end;
            end;

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_BONUS_DATE_BEG_1_' + IntToStr(iTemp), []) then
                szResult := szResult + 'з ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_BONUS_END_BEG_1_' + IntToStr(iTemp), []) then
            begin
                if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime < StrToDate('31.12.2050') then
                    szResult := szResult + ' по ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
            end;
            szResult := szResult + ' - ';

            s := '';
            f := 0;

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_COUNT_BONUS_SMET_1_' + IntToStr(iTemp), []) then
                l := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
            else
                l := 0;
            s := s + '(';
            for i := 1 to l do
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SUMMA_SMETA_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []) then
                begin
                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_PERCENT_BONUS_1_' + IntToStr(iTemp), []) then
                    begin
                        if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                        begin
                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SUMMA_SMETA_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                            s := s + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. - ';
                            f := f + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                        end
                        else
                        begin
                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SUMMA_SMETA_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                            if l > 1 then
                                s := s + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. - ';
                            f := f + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                        end;
                    end
                    else
                    begin
                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SUMMA_SMETA_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                        if l > 1 then
                            s := s + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. - ';
                        f := f + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                    end;
                end;

                s := s + 'за рахунок ';

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SMETA_BONUS_TITLE_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []) then
                    s := s + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SMETA_BONUS_KOD_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []) then
                    s := s + '(' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SUMMA_SMETA_PPS_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                begin
                    //            fTemp  := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                    s := s + ', ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SMETA_TITLE_PPS_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                    s := s + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SMETA_KOD_PPS_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                    s := s + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                    {            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_1_' + IntToStr(iTemp), []);
                                if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                                begin
                                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_1_' + IntToStr(iTemp), []);
                                    szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+'))';
                                end else
                                begin
                     }s := s + ')'; //[ППС]';
                    //            end;
                end;

                if (i < l) then
                    s := s + ', ';

            end;
            s := s + ')';

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_PERCENT_BONUS_1_' + IntToStr(iTemp), []) then
            begin
                if not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull then
                    if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0 then
                        szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '% посадового окладу ' + s
                    else
                        szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s
                else
                    szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s;
            end
            else
            begin
                szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s;
            end;

            if (iTemp < iLength) then
                szResult := szResult + ', '
            else
                szResult := szResult;

        end;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'COUNT_ITEMS', []) then
        begin
            if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger >= 1 then
            begin
                iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
                szResult := szResult + ', ' + #13;
            end
            else
            begin
                iLength := 0;
                szResult := szResult + '. ' + #13;
            end
        end
        else
        begin
            iLength := 0;
            szResult := szResult + '. ' + #13;
        end;

        for iTemp := 2 to iLength + 1 do
        begin

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_COUNT_INST_' + IntToStr(iTemp), []) then
                l_b := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
            else
                l_b := 0;
            for n := 1 to l_b do
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_RAISE_NAME_BONUS_' + IntToStr(iTemp) + '_' + IntToStr(n), []) then
                    szResult := szResult + '<b>' + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + '</b> з ';

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_DATE_BEG_' + IntToStr(iTemp) + '_' + IntToStr(n), []) then
                    szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_END_BEG_' + IntToStr(iTemp) + '_' + IntToStr(n), []) then
                begin
                    if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime < StrToDate('31.12.2050') then
                        szResult := szResult + ' по ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                end;
                szResult := szResult + ' - ';

                s := '';
                f := 0;
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_COUNT_BONUS_SMET_' + IntToStr(iTemp) + '_' + IntToStr(n), []) then
                    l := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
                else
                    l := 0;
                s := s + '(';
                for i := 1 to l do
                begin
                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' +
                        IntToStr(i), []) then
                    begin
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_PERCENT_' + IntToStr(iTemp) + '_' + IntToStr(n), []) then
                        begin
                            if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                            begin
                                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' +
                                    IntToStr(i), []);
                                s := s + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. - ';
                                f := f + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                            end
                            else
                            begin
                                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' +
                                    IntToStr(i), []);
                                if l > 1 then
                                    s := s + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. - ';
                                f := f + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                            end;
                        end
                        else
                        begin
                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' +
                                IntToStr(i), []);
                            if l > 1 then
                                s := s + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. - ';
                            f := f + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                        end;
                    end;

                    s := s + 'за рахунок ';

                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' +
                        IntToStr(i), []) then
                        s := s + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);

                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' + IntToStr(i),
                        []) then
                        s := s + '(' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_PPS_BONUS_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' +
                        IntToStr(i), []);
                    if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                    begin
                        //                fTemp  := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                        s := s + ', ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_TITLE_PPS_BONUS_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' +
                            IntToStr(i), []);
                        s := s + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_KOD_PPS_BONUS_' + IntToStr(iTemp) + '_' + IntToStr(n) + '_' +
                            IntToStr(i), []);
                        s := s + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                        {            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_1_' + IntToStr(iTemp), []);
                                    if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                                    begin
                                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_1_' + IntToStr(iTemp), []);
                                        szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+'))';
                                    end else
                                    begin
                         }s := s + ')'; //[ППС]';
                        //            end;
                    end;

                    if (i < l) then
                        s := s + ', ';

                end;
                s := s + ')';

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_PERCENT_' + IntToStr(iTemp) + '_' + IntToStr(n), []) then
                begin
                    if not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull then
                        if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0 then
                            szResult := szResult + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + '% посадового окладу ' + s
                        else
                            szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s
                    else
                        szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s;
                end
                else
                begin
                    szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s;
                end;

                if (iTemp < iLength) then
                    szResult := szResult + ', ' + #13
                else
                    szResult := szResult + '.' + #13;

            end;
        end;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'NOTE_1', []) then
            if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '') and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> ' ') then
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '. ' + #13;

        //    szResult := szResult + #13;

        {    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_COUNT_INST_2', []) then
            begin
                szResult := szResult + '<u>Доплати та надбавки:</u> ';
                iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
                for iTemp := 1 to iLength do
                begin
                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_RAISE_NAME_BONUS_2_' + IntToStr(iTemp), []);
                    szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' - ';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_PERCENT_2_' + IntToStr(iTemp), []);
                    szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '%';

                    if (iTemp = iLength)
                        then szResult := szResult + '.'+#13
                        else szResult := szResult + ', ';
                end;
            end;
         }
        szResult := szResult + '<u>Підстава:</u> ';
        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'REASON_1', []);
        // szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        iT := 0;
        for i := 0 to Length(szTemp) - 1 do
        begin
            s1 := copy(szTemp, i, 1);
            if s1 = ' ' then
                inc(iT)
            else
                break;
        end;

        s := AnsiLowerCase(Copy(szTemp, 1, iT + 1));
        //szTemp := AnsiLowerCase(szTemp);
        //szTemp[1] := s;
        szResult := szResult + s + Copy(szTemp, iT + 2, Length(szTemp));

        ftrTemplateReceipt.Rollback;
        fdsTemplateReceipt.Free;
        ftrTemplateReceipt.Free;
        fdbTemplateReceipt.Free;
        DecimalSeparator := ',';
    except on Error: Exception do
        begin
            MessageDlg('Неможливо зформувати пункт наказу!', mtError, [mbOk], 0);
        end;
    end;
    Result := szResult;

end;

end.

