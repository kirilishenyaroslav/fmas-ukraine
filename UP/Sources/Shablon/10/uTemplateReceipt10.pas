unit uTemplateReceipt10; {снятие надбавки}

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
    szTemp, stavka_str: string; //  Строка для хранения текстовой строки
    cTemp: Char; //  Переменная для хранения символа
    iTemp, iT: Integer; //  Переменная для хранения значения целого типа
    iLength, i, l: Integer; //  Переменная для хранения значения целого типа длины цикла
    fTemp, rate_count, f: Currency; //  Переменная для хранения значения вещественного типа
    fdbTemplateReceipt: TpFIBDatabase; //  База
    ftrTemplateReceipt: TpFIBTransaction; //  Транзакция
    fdsTemplateReceipt: TpFIBDataSet; //  Датасэт
    IsShowPost: string; //  Признак "Отображать должность" в расшифровке надбавки

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
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SECOND_NAME_UA_1', []) then
    //  Заглавными буквами
            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
    //  Имя
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_FIRST_NAME_UA_1', []) then
        begin
        //  Первая буква заглавная, а остальные маленькие
{        szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        cTemp := UpCase(szTemp[1]);
        szTemp := AnsiLowerCase(szTemp);
        szTemp[1] := cTemp;}
            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
        end;
        szResult := szResult + szTemp + ' ';
    //  Отчество
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_LAST_NAME_UA_1', []) then
        begin
        //  Первая буква заглавная, а остальные маленькие
{        szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        cTemp := UpCase(szTemp[1]);
        szTemp := AnsiLowerCase(szTemp);
        szTemp[1] := cTemp;}
            szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
        end;
//    szResult := szResult + szTemp;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_TN_1', [])
            then szResult := szResult + '(TH ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

        szResult := szResult + '</b>, ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_EDUC_ZVANIE_AND_ST_1', [])
            then if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> ''
            then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';

        szResult := szResult + '<u>тип персоналу:</u> ';
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_TYPE_POST_NAME_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';

        szResult := szResult + '<u>посада:</u> ';
    //  1
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_POST_1', []) then
//        szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +', ';
        begin
            szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
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

        szResult := szResult + '<u>підрозділ:</u><b> ';
    //  Подразделение
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_DEPARTMENT_VERH_1', []) then
        begin
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';
        end;
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_NAME_DEPARTMENT_1', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>';

        //szResult := szResult + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + '</b>';

        fTemp := 0;
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_COUNT_SM_1', [])
            then iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
        else iLength := 0;
        rate_count := 0;
        DecimalSeparator := '.';
        for iTemp := 1 to iLength do begin
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_RATE_COUNT_1_' + IntToStr(iTemp), []) then
            begin
                rate_count := rate_count + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
            end;

            if iLength > 1 then
            begin
                if iTemp = 1 then szTemp := ' з оплатою ';
                szTemp := szTemp + FormatFloat(stavka_str, fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' ставки ';
            end;

            szTemp := szTemp + ' (';

            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SUMMA_SMETA_1_' + IntToStr(iTemp), []);
            fTemp := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;

//        if iLength > 1 then
//        begin
            szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
//        end else
//        begin
//            szTemp := szTemp + 'за рахунок ';
//        end;

            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_TITLE_1_' + IntToStr(iTemp), []);

            szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_KOD_1_' + IntToStr(iTemp), []);
            szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

            fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SUMMA_SMETA_PPS_1_' + IntToStr(iTemp), []);
            if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
            begin
                fTemp := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                szTemp := szTemp + ', ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_TITLE_PPS_1_' + IntToStr(iTemp), []);
                szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_SMETA_KOD_PPS_1_' + IntToStr(iTemp), []);
                szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_' + IntToStr(iTemp), []);
                if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                begin
                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_' + IntToStr(iTemp), []);
                    szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '))';
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
                szTemp := szTemp + '), ';
            end;

        end;

        szResult := szResult + ' на ' + FormatFloat(stavka_str, rate_count);
        szResult := szResult + ' ставки ' {</b> з окладом ' + FormatFloat('0.00', fTemp) + ' грн. на місяць'} + szTemp;

//    szResult := szResult + ' ';

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_WORK_REASON_DEFUALT_1', []) then
        begin
            if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString = '1'
                then
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_WORK_REASON_1', []) then
                    szResult := szResult + '<u>тип роботи:</u> ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ','

                //szResult := szResult + '<u>тип роботи:</u> ' + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString)+ ','

                else szResult := szResult + ', ';
        end;

{    szResult := szResult + '<u>тип роботи:</u> ';

    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_WORK_REASON_1', []) then
        szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+', ';
 }
{    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'COUNT_MOVING_INST_1', [])
        then iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
        else iLength := 0;
 }
        iLength := 1;
        for iTemp := 1 to iLength do
        begin
            szResult := szResult + 'зняти';
            szResult := szResult + '<b> з ';
            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'REMOVE_DATE_1', []) then
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ';

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'IS_SHOW_POST_1_' + IntToStr(iTemp), []) then
                IsShowPost := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

            if IsShowPost = 'T' then
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_RAISE_NAME_BONUS_1_' + IntToStr(iTemp), []) then
                    szResult := szResult + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + '</b> ';

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVM_NAME_POST_1_' + IntToStr(iTemp), []) then
                    szResult := szResult + '(' + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVM_SUM_POST_SALARY_1_' + IntToStr(iTemp), []) then
                    szResult := szResult + '(оклад ' + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн.)';

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SOVNM_NAME_DEPARTMENT_1_' + IntToStr(iTemp), []) then
                    szResult := szResult + ', підрозділ: ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ') ';
            end
            else
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_RAISE_NAME_BONUS_1_' + IntToStr(iTemp), []) then
                    szResult := szResult + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + '</b> ';
            end;
            szResult := szResult + ' - ';

            s := '';
            f := 0;

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_COUNT_BONUS_SMET_1_' + IntToStr(iTemp), [])
                then l := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
            else l := 0;
            s := s + '(';
            for i := 1 to l do
            begin
                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SUMMA_SMETA_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []) then
                begin
                    s := s + FormatFloat('0.00', fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' грн.';
                    f := f + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                end;

                s := s + ' - за рахунок ';

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SMETA_BONUS_TITLE_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []) then
                    s := s + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);

                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SMETA_BONUS_KOD_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []) then
                    s := s + '(' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

                szTemp := '';
                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SUMMA_SMETA_PPS_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0) then
                begin
                    fTemp := fTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat;
                    szTemp := szTemp + ', ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SMETA_TITLE_PPS_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                    szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' (';

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_SMETA_KOD_PPS_BONUS_1_' + IntToStr(iTemp) + '_' + IntToStr(i), []);
                    szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;

                    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_' + IntToStr(iTemp), []);
                    if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').Asfloat <> 0) then
                    begin
                        fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TO_KOEFF_PPS_1_' + IntToStr(iTemp), []);
                        szTemp := szTemp + ', коефіціент підвіщення посадового окладу ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';
                    end else
                    begin
                        szTemp := szTemp + ')';
                    end;
                end;
                s := s + szTemp;
                if (i < l)
                    then s := s + ', ';
            end;
            s := s + ')';

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'B_PERCENT_BONUS_1_' + IntToStr(iTemp), [])
                then begin
                if not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull
                    then
                    if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat <> 0
                        then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '% посадового окладу ' + s
                    else szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s
                else szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s;
            end else begin
                szResult := szResult + FormatFloat('0.00', f) + ' грн. ' + s;
            end;

            if (iTemp < iLength)
                then szResult := szResult + ', '
            else szResult := szResult + '.';

        end;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'NOTE_1', []) then
            if (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '') and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> ' ') then
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '. ';

        szResult := szResult + #13;

        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_COUNT_INST_2', []) then
        begin
            szResult := szResult + '<u>Доплати та надбавки:</u> ';
            iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;

            for iTemp := 1 to iLength do
            begin
                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_RAISE_NAME_BONUS_2_' + IntToStr(iTemp), []);
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' - ';

                fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BONUS_PERCENT_2_' + IntToStr(iTemp), []);
                szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '% посадового окладу';

                if (iTemp = iLength)
                    then szResult := szResult + '.' + #13
                else szResult := szResult + ', ';
            end;
        end;

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
        szResult := szResult + s + Copy(szTemp, iT + 2, Length(szTemp));
    //szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        ftrTemplateReceipt.Rollback;
        fdsTemplateReceipt.Free;
        ftrTemplateReceipt.Free;
        fdbTemplateReceipt.Free;
        DecimalSeparator := ',';
    except on Error: Exception do begin
            MessageDlg('Неможливо зформувати пункт наказу!', mtError, [mbOk], 0);
        end;
    end;
    Result := szResult;

end;

end.

