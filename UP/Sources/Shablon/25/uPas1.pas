unit uPas1; {прием}

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

procedure SelMaxMinDate;
begin

end;

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item: Int64): string; stdcall;
var
    szResult, s1, s2: string; //  Строка для формирования результирующей строки
    szTemp, s, stavka_str, hours_str: string; //  Строка для хранения текстовой строки
    cTemp: Char; //  Переменная для хранения символа
    iTemp, iT, iR: Integer; //  Переменная для хранения значения целого типа
    iLength, IdAwayType: Integer; //  Переменная для хранения значения целого типа длины цикла
    fTemp, rate_count, hours_count: Currency; //  Переменная для хранения значения вещественного типа
    fdbTemplateReceipt: TpFIBDatabase; //  База
    ftrTemplateReceipt: TpFIBTransaction; //  Транзакция
    fdsTemplateReceipt: TpFIBDataSet; //  Датасэт
    k, i, j, mm, m, id_serv: integer;
    d_inf: TDateTime;
    flag_bonus, flagok, flR, Is_Ped_Work: boolean;
    max_date, min_date: TDateTime;
    pay_form, UseDigit, ending: Integer;
    IsInSovm, AddInfo: string;
    StrRaise, StrRaiseTemp, sT: string;

begin
    try
        IdAwayType := -1;
        min_date := StrToDate('01.01.1000');
        max_date := StrToDate('01.01.1000');
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

        hours_str := '#######0.00';

        fdsTemplateReceipt.Close;
        fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT * FROM INI_ASUP_CONSTS';
        fdsTemplateReceipt.Open;
        stavka_str := fdsTemplateReceipt.fbn('STAVKI_DISP_FORMAT').AsString;
        pay_form := fdsTemplateReceipt.fbn('PAY_FORM_VIDRYAD').AsInteger;
        fdsTemplateReceipt.Close;
        fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
        fdsTemplateReceipt.Open;
        id_serv := fdsTemplateReceipt['ID_SERVER'];
        try d_inf := fdsTemplateReceipt.fbn('INFINITY_DATE').AsDateTime;
        except d_inf := StrToDate('31.12.2050');
        end;
        fdsTemplateReceipt.Close;
//    d_inf := StrToDate('31.12.2050');

        fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT parametr_name, parametr_value ' +
            'FROM   up_dt_order_item_body ' +
            'WHERE  id_session = ' + IntToStr(id_session);
        fdsTemplateReceipt.Open;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'COUNT_ITEMS', []) then
        begin
            if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger >= 1 then
            begin
                k := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_BEG_1_1', [])
                    then min_date := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime
                else min_date := StrToDate('31.12.9999');
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_END_1_1', [])
                    then max_date := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime
                else max_date := StrToDate('01.01.1000');
                for i := 2 to k + 1 do
                begin
                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'COUNT_MOVING_INST_' + IntToStr(i), []) then
                    begin
                        for j := 1 to fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger do
                        begin
                            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_BEG_' + IntToStr(i) + '_' + IntToStr(j), [])
                                then if min_date > fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime then
                                    min_date := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime;

                            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_END_' + IntToStr(i) + '_' + IntToStr(j), [])
                                then if max_date < fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime then
                                    max_date := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime;
                        end;
                    end;
                end;
            end else
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_BEG_1_1', [])
                    then min_date := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime
                else min_date := StrToDate('01.01.1000');
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_END_1_1', [])
                    then max_date := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime
                else max_date := StrToDate('01.01.1000');
            end;
        end;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_USE_DIGIT_1_1', []) then
            if not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull then
                UseDigit := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;

    //  Номер пункта
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'NUM_ITEM_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '.';
    //  Номер подпункта
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'NUM_SUB_ITEM_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '. ';
    //  Фамилия
        szResult := szResult + '<u>ПІБ:</u> <b>';
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SECOND_NAME_UA_1_1', []) then
    //  Заглавными буквами
            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
    //  Имя
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_FIRST_NAME_UA_1_1', []) then
        begin
            szTemp := AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);
        //  Первая буква заглавная, а остальные маленькие

{        szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        cTemp := UpCase(szTemp[1]);
        szTemp := AnsiLowerCase(szTemp);
        szTemp[1] := cTemp;}
        end;
        szResult := szResult + szTemp + ' ';
    //  Отчество
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_LAST_NAME_UA_1_1', []) then
        begin
            szTemp := AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);
        //  Первая буква заглавная, а остальные маленькие
{        szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        cTemp := UpCase(szTemp[1]);
        szTemp := AnsiLowerCase(szTemp);
        szTemp[1] := cTemp;}
        end;
        szResult := szResult + szTemp;

        szTemp := '';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_TN_1_1', [])
            then szResult := szResult + ' (TH ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

        szResult := szResult + '</b>, ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_EDUC_ZVANIE_AND_ST_1_1', [])
            then if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> ''
            then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';

    //  Дата начала сотрудничества
        szResult := szResult + 'з ';
        if min_date <> StrToDate('01.01.1000')
            then szResult := szResult + DateToStr(min_date) + ' '
        else
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_BEG_1_1', []) then
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_HOSPITAL_1_1', []) then
        begin
            if ((fdsTemplateReceipt.Locate('PARAMETR_NAME', 'ID_AWAY_TYPE_1_1', [])) and
                (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull)) then IdAwayType := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;

         {   if ((IdAwayType = 1) or (IdAwayType = -1)) then
            begin
                if max_date <> StrToDate('01.01.1000') then
                begin
                    if max_date < d_inf then
                    begin
                        szResult := szResult + 'по ';
                        szResult := szResult + DateToStr(max_date) + ' ';
                    end;
                end else
                begin
                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_END_1_1', []) then

                        if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime < d_inf then
                        begin
                            szResult := szResult + 'по ';
                            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                        end;
                end;
            end;
          }

          //начало вставки
            if ((IdAwayType = 1) or (IdAwayType = -1)) then
            begin
                if max_date <> StrToDate('01.01.1000') then
                begin
                    if max_date <= d_inf then
                    begin
                        szResult := szResult + 'по ';
                        szResult := szResult + DateToStr(max_date) + ' ';
                    end;
                end;
            end
            else
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_AWAY_ENDING_1_1', []) then
                begin
                   ending := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;

                   if ending <> 2 then
                   begin
                       if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_HOSP_DATE_END_1_1', []) then
                       szResult := szResult + 'по ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                   end;
                end;
            end;
            //конец вставки
            
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_TYPE_AWAY_1_1', []) then
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_HOSPITAL_MAN_1_1', []) then
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SECOND_NAME_UA_H_1_1', []) then
                    szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_FIRST_NAME_UA_H_1_1', []) then
                    szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_LAST_NAME_UA_H_1_1', []) then
                    szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_TN_H_1_1', []) then
                    szResult := szResult + '(ТН ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '), ';

            end;
        end else
        begin
        //  Дата конца сотрудничества
            if max_date <> StrToDate('01.01.1000') then
            begin
                if max_date < d_inf then
                begin
                    szResult := szResult + 'по ';
                    szResult := szResult + DateToStr(max_date);

            //  Условия принятия
                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_ACCEPT_COND_PRINT_1_1', []) then
                        if not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull
                            then szResult := szResult + ' на умовах ' + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ', '
                        else szResult := szResult + ', ';
                end;
            end else
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_END_1_1', []) then

                    if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime < d_inf then
                    begin
                        szResult := szResult + 'по ';
                        szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

            //  Условия принятия
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_ACCEPT_COND_PRINT_1_1', []) then
                            if not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull
                                then szResult := szResult + ' на умовах ' + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ', '
                            else szResult := szResult + ', ';
                    end;
            end;
        end;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_OSN_1_1', []) then
        begin
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_IS_EXT_SOVM_1_1', []) then
            begin
                if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString = 'T' then
                begin
                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_OSN_1_1', []);
                    if (trim(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) <> ' ') and (trim(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) <> '')
                        then szResult := szResult + '<u>основне місце роботи:</u> ' + {AnsiLowerCase(} fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString {)} + ', ';

                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_POST_OSN_1_1', []) then
                        if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> ' ') and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '') then
                            szResult := szResult + {AnsiLowerCase(} fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString {)} + ', ';
                end;
            end;
        end;

    // Педработник или нет
        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_IS_PED_WORK_1_1', []);
        if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger = 1 then
            Is_Ped_Work := true
        else Is_Ped_Work := false;

    //  Должность
        szResult := szResult + '<u>посада:</u> <b>';
        if Is_Ped_Work then
        begin
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_POST_SALARY_1_1', []) then
//        szResult := szResult + '<b>' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>, ';
            begin
                szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                s := copy(szTemp, 2, 1);
                if ((ord(s[1]) <= 223) and (ord(s[1]) >= 192)) or (ord(s[1]) = 175) or (ord(s[1]) = 178) or (ord(s[1]) = 170) or (ord(s[1]) = 73) then
                begin
                    szResult := szResult + '<b>' + szTemp + '</b>, ';
                end else
                begin
                    cTemp := ansiLowerCase(szTemp)[1];
                    szTemp[1] := cTemp;
                    szResult := szResult + '<b>' + szTemp + '</b>, ';
                end;
                szTemp := '';
            end;
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_POST_BASE_SALARY_1_1', []) then
//        szResult := szResult + '<b>' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>, ';
                if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '') then
                begin
                    szResult := szResult + '<u>кваліфікаційна категорія</u>: ';
                    szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                    s := copy(szTemp, 2, 1);
                    if ((ord(s[1]) <= 223) and (ord(s[1]) >= 192)) or (ord(s[1]) = 175) or (ord(s[1]) = 178) or (ord(s[1]) = 170) or (ord(s[1]) = 73) then
                    begin
                        szResult := szResult + '<b>' + szTemp + '</b>, ';
                    end else
                    begin
                        cTemp := ansiLowerCase(szTemp)[1];
                        szTemp[1] := cTemp;
                        szResult := szResult + '<b>' + szTemp + '</b>, ';
                    end;
                    szTemp := '';
                end;
        end
        else begin
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_POST_1_1', []) then
            begin
                szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                s := copy(szTemp, 2, 1);
                if ((ord(s[1]) <= 223) and (ord(s[1]) >= 192)) or (ord(s[1]) = 175) or (ord(s[1]) = 178) or (ord(s[1]) = 170) or (ord(s[1]) = 73) then
                begin
                    szResult := szResult + szTemp + '</b>, ';
                end else
                begin
                    cTemp := ansiLowerCase(szTemp)[1];
                    szTemp[1] := cTemp;
                    szResult := szResult + szTemp + '</b>, ';
                end;
                szTemp := '';
            end;
        end;
    //  Подразделение
        szResult := szResult + '<u>підрозділ:</u> ';
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_VERH_1_1', []) then
        begin
            szResult := szResult + '<b>' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ',</b> ';
        end;
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_1_1', []) then
        begin
{        szTemp    := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        cTemp     := ansiLowerCase(szTemp)[1];
        szTemp[1] := cTemp;
        szResult  := szResult + '<b>' + szTemp + '</b>, ';
        szTemp    := '';}
            szResult := szResult + '<b>' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>, ';

        end;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_WORK_REASON_DEFUALT_1_1', []) then
        begin
            if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString = '1'
                then
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_WORK_REASON_1_1', []) then
                begin
                    szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                    cTemp := ansiLowerCase(szTemp)[1];
//                szTemp    := szTemp;
                    szTemp[1] := cTemp;
                    szResult := szResult + '<u>тип роботи:</u> ' + szTemp + ',';
                    szTemp := '';
                end
                else szResult := szResult + ', ';
        end;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'COUNT_ITEMS_NOT5', []) then
        begin
            k := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
            for j := 1 to k + 1 do
            begin
                if Is_Ped_Work then
                    szTemp := '('
                else
                    szTemp := '';
                fTemp := 0;

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_COUNT_SM_' + IntToStr(j) + '_1', []);
                iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
                rate_count := 0;
                hours_count := 0;
                DecimalSeparator := '.';
                for iTemp := 1 to iLength do begin
                    if Is_Ped_Work then
                    begin
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_HOURS_COUNT_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []) then
                        begin
                            hours_count := hours_count + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                        end;
                        if iLength > 1 then
                        begin
                            szTemp := szTemp + FormatFloat(hours_str, fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' год. за рахунок ';
                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);

                            szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                            szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';
                        end
                        else
                        begin
                            szTemp := szTemp + ' за рахунок ';
                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);

                            szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                            szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';
                        end;
                        if not (iTemp = iLength) then
                        begin
                            szTemp := szTemp + ', ';
                        end
                        else
                        begin
                            if k > 0 then
                            begin
                                if j = k + 1
                                    then szTemp := szTemp + '), '
                                else szTemp := szTemp + '),';
                            end else
                            begin
                                szTemp := szTemp + '), ';
                            end;
                        end;

                    end
                    else begin
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_RATE_COUNT_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []) then
                        begin
                            rate_count := rate_count + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                        end;

                        if iLength > 1 then
                        begin
                            if iTemp = 1 then szTemp := ' з оплатою ';
                            szTemp := szTemp + FormatFloat(stavka_str, fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' ставки ';
                        end;

                        szTemp := szTemp + ' (';

                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                        if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                        begin
                            flagok := true
                        end else
                            flagok := false;

                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                        fTemp := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;

                        if (iLength > 1) or (flagok) then
                        begin
                            szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
                        end else
                        begin
                            szTemp := szTemp + 'за рахунок ';
                        end;

                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);

                        szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                        szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                        if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                        begin
                            fTemp := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                            szTemp := szTemp + ', ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                            szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                            szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_KOEFF_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                            if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                            begin
                                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_KOEFF_PPS_' + IntToStr(j) + '_1_' + IntToStr(iTemp), []);
                                szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '))';
                            end else
                            begin
                                szTemp := szTemp + ')';
                            end;
                        end;
{              else
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
                end;

                if k > 0 then
                begin
                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_BEG_' + IntToStr(j) + '_1', [])
                        then szResult := szResult + #13 + '<b>з ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_DATE_END_' + IntToStr(j) + '_1', []) then
                    begin
                        if ((j = k + 1) and (IdAwayType = 0)) //если это больничный, последнюю дату в разбивке не печатаем 
                        then
                            szResult := szResult // ничего не добавляем
                        else
                        begin
                            if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime < d_inf then
                                szResult := szResult + ' по ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                        end
                    end;
                    szResult := szResult + '</b>';
                end;

                if is_ped_work then
                begin
                    szResult := szResult + '<b> з педагогічним навантаженням ' + FormatFloat(hours_str, hours_count);
                    szResult := szResult + ' год. / ';
                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_MONTH_HOURS_COUNT_' + IntToStr(j) + '_1', []);
                    szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' міс. </b> ' + szTemp;
                end
                else
                begin
                    szResult := szResult + '<b> на ' + FormatFloat(stavka_str, rate_count);
                end;

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_ID_PAY_FORM_' + IntToStr(j) + '_1', []) then
                begin
                    if not fdsTemplateReceipt.FBN('PARAMETR_VALUE').isNull then
                        if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger = pay_form then
                            szResult := szResult + ' ставки</b> з відрядною оплатою праці' + szTemp
                        else
                        begin
                            if UseDigit = 2 then szResult := szResult + ' ставки</b> з тарифом ' + FormatFloat('0.00', fTemp) + ' грн.' + szTemp
                            else
                                if Is_ped_Work then
                                begin
                                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SALARY_SUM_' + IntToStr(j) + '_1', []) then
                                    begin

                                        szResult := szResult + ' ставка заробітної плати ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн.'
                                    end
                                end
                                else
                                    szResult := szResult + ' ставки</b> з окладом ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp
                        end
                    else
                    begin
                        if UseDigit = 2 then szResult := szResult + ' ставки</b> з тарифом ' + FormatFloat('0.00', fTemp) + ' грн.' + szTemp
                        else
                        begin
                            if Is_ped_Work then
                            begin
                                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_SALARY_SUM_' + IntToStr(j) + '_1', []) then
                                begin

                                    szResult := szResult + ' ставка заробітної плати ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн.'
                                end
                            end else
                                szResult := szResult + ' ставки</b> з окладом ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp;
                        end;
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
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_TYPE_POST_NAME_1_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '. ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'NOTE_1', []) then
            if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '') and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> ' ') then
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '. ';
    //  Установить при приёме доплаты и надбавки
        szResult := szResult + #13;
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'COUNT_BONUS', []) then
        begin

            k := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;

            if k >= 1 then
            begin
                flag_bonus := true;
                for i := 2 to k + 1 do
                begin
                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'MOVING_TYPE_' + IntToStr(i), []) then
                    begin
                        if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger = 5 then
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
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_COUNT_INST_' + IntToStr(i), []) then
                begin
                    iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
                    for iTemp := 1 to iLength do
                    begin
                        szResult := szResult + '<b>';
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_DATE_BEG_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                            szResult := szResult + ' з ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_END_BEG_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                            if ((fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsDateTime < d_inf)
                                // по устному согласованию с ОК ХАИ (Ковалишина) дата окончания надбавок печатается и в случае больничного листа тоже
                                //and (IdAwayType <> 0)
                                ) then
                                szResult := szResult + 'по ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
                        szResult := szResult + '</b>';

                        StrRaiseTemp := '';
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_RAISE_NAME_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
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

                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_PERCENT_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                        begin
                            if not fdsTemplateReceipt.FBN('PARAMETR_VALUE').isNull then
                            begin
                                szResult := szResult + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + '% посадового окладу';
                                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_COUNT_BONUS_SMET_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                                    m := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
                                else m := 0;
                                if (m <> 0) then szResult := szResult + ' (';
                                for mm := 1 to m do
                                begin
                                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), [])
                                        then begin
                                        szResult := szResult + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. - за рахунок ';
                                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                            szResult := szResult + ' (' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')'; //комментарий

                                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                        if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                                        begin
                                            //fTemp  := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                                            szResult := szResult + ', ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
                                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_TITLE_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                            szResult := szResult + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_KOD_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                                            szResult := szResult + ')'; //[ППС]';
                                        end;
                                        if (mm <> m) then szResult := szResult + ', ';

                                    end
                                    else
                                    begin
                                    //szResult := szResult + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                    end;
                                end;
                                if (m <> 0) then szResult := szResult + ')';
                              //if (m <> mm) then szResult := szResult + ' ';
                              //  end;
                            end
                            else
                            begin
                                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_' + IntToStr(i) + '_' + IntToStr(iTemp), []) then
                                    szResult := szResult + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн';
                                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'COUNT_BONUS', []) then
                                    m := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
                                else m := 0;
                                for mm := 1 to m do
                                begin
                                    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), [])
                                        then begin
                                        szResult := szResult + {' ('+FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. - } ' (за рахунок ';
                                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
                                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []) then
                                            szResult := szResult + ' (' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')'; //комментарий

                                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                        if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                                        begin
                                        //fTemp  := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                                            szResult := szResult + ', ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
                                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_TITLE_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                            szResult := szResult + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                                            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_SMETA_KOD_PPS_BONUS_' + IntToStr(i) + '_' + IntToStr(iTemp) + '_' + IntToStr(mm), []);
                                            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                                            szResult := szResult + ')[ППС]';
                                        end;
                                        szResult := szResult + ')';
                                    end
                                    else
                                    begin
                                //szResult := szResult + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                    end;
                                end;
                           //if (m <> mm) then szResult := szResult + ' ';
                           //  end;
                            end;
                        end;

                        if (i = k + 1)
                            then szResult := szResult + '. '#13
                        else szResult := szResult + ', ';
                    end;
                end else
                begin
               // szResult := copy(szResult, 1, LENGTH(szResult)-2) + '. '+#13;
                end;
            end;
        end;
    //  Причина
        szResult := szResult + '<u>Підстава:</u> ';
        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'REASON_1', []);
        szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        iT := 0;
        for i := 0 to Length(szTemp) - 1 do
        begin
            s1 := copy(szTemp, i, 1);
            if s1 = ' ' then inc(iT)
            else break;
        end;

        s := AnsiLowerCase(Copy(szTemp, 1, iT + 1));
    //szTemp := AnsiLowerCase(szTemp);
    //szTemp[1] := s;
        szResult := szResult + s + Copy(szTemp, iT + 2, Length(szTemp));
        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_ADD_INFO_1_1', []);
        AddInfo := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        if AddInfo = 'T' then
        begin
            szResult := szResult + #13 + '<i><u>Додатково:</u> основне місце роботи - ';
            szTemp := '';
            if (fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_OSN_POST_NAME_1_1', [])) then
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';
            if (fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_OSN_RATE_COUNT_1_1', [])) then
                szTemp := szTemp + '( ' + FormatFloat(stavka_str, fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' ставка), ';
            szResult := szResult + szTemp;
            if (fdsTemplateReceipt.Locate('PARAMETR_NAME', 'INST_OSN_NAME_DEPARTMENT_1_1', [])) then
                szResult := szResult + '<u>підрозділ:</u> ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '.</i>';
        end;

    //  Отсоединение от базы
        ftrTemplateReceipt.Rollback;
    //  Удаление динамически созданных компонент
        fdsTemplateReceipt.Free;
        ftrTemplateReceipt.Free;
        fdbTemplateReceipt.Free;
        DecimalSeparator := ',';
    except on Error: Exception do begin
            MessageDlg('Невозможно сформировать шаблон', mtError, [mbOk], 0);
//    szResult := '';
        end;
    end;
    Result := szResult;
end;

end.

