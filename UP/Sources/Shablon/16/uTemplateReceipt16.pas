unit uTemplateReceipt16; {повышение оклада}

interface

uses SysUtils, Classes, Dialogs, ibase, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, pFIBStoredProc,
     Windows, Messages, Variants, Graphics, Controls, Forms, StdCtrls, ActnList, Registry, ExtCtrls;

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

exports GetTemplateString;

implementation

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;
var szResult, stavka_str : String;            //  Строка для формирования результирующей строки
    szTemp, s{, shablon, shadow}, s1, s2 : String;            //  Строка для хранения текстовой строки
    cTemp               : Char;              //  ¦хЁхьхээр  фы  їЁрэхэш  ёшьтюыр
    iTemp, k, i, j, m, mCnt  : Integer;           //  Переменная для хранения значения целого типа
    iLength, count_i, z : Integer;           //  Переменная для хранения значения целого типа длины цикла
    fTemp, rate_count   : Currency;            //  Переменная для хранения значения вещественного типа
    db                  : TpFIBDatabase;     //  База
    TR, TW              : TpFIBTransaction;  //  Транзакция
    DS                  : TpFIBDataSet;      //  Датасэт
    Stored              : TpFIBStoredProc;
    BonusSumma, BonusSummaPps :string;
    IsShowBonusSmet :Smallint;
//    id_ses, id_item_shadow : int64;

//    HandlePack : HModule;
//    func : function(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

    d_inf               : TDateTime;
    flag_bonus, flagok  : boolean;
    max_date, min_date  : TDateTime;

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
    if varIsNull(DS['is_bonus_print']) then IsShowBonusSmet:=0 else
    IsShowBonusSmet:=DS['is_bonus_print'];

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

    //  Номер пункта
    if DS.Locate('PARAMETR_NAME', 'NUM_ITEM', []) then
        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '.';
        s1 := DS.FBN('PARAMETR_VALUE').AsString;
    //  Номер подпункта
    if DS.Locate('PARAMETR_NAME', 'NUM_SUB_ITEM', []) then
        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '. ';
        s2 := DS.FBN('PARAMETR_VALUE').AsString;

  if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS_NOT5', []) then
  begin
    count_i := DS.FBN('PARAMETR_VALUE').AsInteger;
    for z := 1 to count_i do
    begin

    if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS_'+IntToStr(z), []) then
    begin
        if DS.FBN('PARAMETR_VALUE').AsInteger >= 1 then
        begin
            k := DS.FBN('PARAMETR_VALUE').AsInteger;
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_'+IntToStr(z)+'_1', [])
                then min_date := DS.FBN('PARAMETR_VALUE').AsDateTime
                else min_date := StrToDate('31.12.9999');
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_'+IntToStr(z)+'_1', [])
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
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_'+IntToStr(z)+'_1', [])
                then min_date := DS.FBN('PARAMETR_VALUE').AsDateTime
                else min_date := StrToDate('01.01.1000');
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_'+IntToStr(z)+'_1', [])
                then max_date := DS.FBN('PARAMETR_VALUE').AsDateTime
                else max_date := StrToDate('01.01.1000');
        end;
    end;




    //  Фамилия
    szResult := szResult + '<u>ПІБ:</u> <b>';
    if DS.Locate('PARAMETR_NAME', 'INST_SECOND_NAME_UA_'+IntToStr(z)+'_1', []) then
    //  Заглавными буквами
        szResult := szResult + AnsiUpperCase(DS.FBN('PARAMETR_VALUE').AsString) + ' ';
    //  Имя
    szTemp := '';
    if DS.Locate('PARAMETR_NAME', 'INST_FIRST_NAME_UA_'+IntToStr(z)+'_1', []) then
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
    if DS.Locate('PARAMETR_NAME', 'INST_LAST_NAME_UA_'+IntToStr(z)+'_1', []) then
    begin
        szResult := szResult + AnsiUpperCase(DS.FBN('PARAMETR_VALUE').AsString) + ' ';
        //  Первая буква заглавная, а остальные маленькие
{        szTemp := DS.FBN('PARAMETR_VALUE').AsString;
        cTemp := UpCase(szTemp[1]);
        szTemp := AnsiLowerCase(szTemp);
        szTemp[1] := cTemp;}
    end;
//    szResult := szResult + szTemp;

    if DS.Locate('PARAMETR_NAME', 'INST_TN_'+IntToStr(z)+'_1', [])
        then szResult := szResult + '(TH ' + DS.FBN('PARAMETR_VALUE').AsString + ')';

    szResult := szResult + '</b>, ';


{    if DS.Locate('PARAMETR_NAME', 'TO_EDUC_ZVANIE_AND_ST_1_1', []) then
        if (not DS.FBN('PARAMETR_VALUE').isNull) and (DS.FBN('PARAMETR_VALUE').AsString <> '')
            then szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';

 }
    szTemp   := '';
//    rate_count := 0;

    szResult := szResult + '<b>встановити новий оклад</b> з ';
    if min_date <> StrToDate('01.01.1000')
        then szResult := szResult + DateToStr(min_date) + ' '
        else
            if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_'+IntToStr(z)+'_1', []) then
                szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + ' ';

    if max_date <> StrToDate('01.01.1000') then
    begin
        if max_date < d_inf then
        begin
            szResult := szResult + 'по ';
                szResult := szResult + DateToStr(max_date) + ', ';
        end;
    end;

    if DS.Locate('PARAMETR_NAME', 'INST_NAME_ACCEPT_COND_PRINT_'+IntToStr(z)+'_1', []) then
        if (trim(DS.FBN('PARAMETR_VALUE').AsString) <> '') and (DS.FBN('PARAMETR_VALUE').AsString <> ' ') then
        begin
            s := DS.FBN('PARAMETR_VALUE').AsString;
            if DS.Locate('PARAMETR_NAME', 'INST_IS_PPS_'+IntToStr(z)+'_1', []) then
                if not DS.FBN('PARAMETR_VALUE').IsNull then
                    if DS.FBN('PARAMETR_VALUE').AsString = 'T' then
                    begin
                        szResult := szResult + ' на умовах ' + s;
                        if DS.Locate('PARAMETR_NAME', 'INST_A_DATE_END_'+IntToStr(z)+'_1', []) then
                        begin
                            If not VarIsNull(DS.FBN('PARAMETR_VALUE').AsVariant) then
                            begin
                               if DS.FBN('PARAMETR_VALUE').AsDateTime < StrToDate('31.12.2050') then
                               begin
                                  szResult := szResult + ' по ' + DS.FBN('PARAMETR_VALUE').AsString + ', ';
                               end else
                               begin
                                  szResult := szResult + ', ';
                               end;
                            end
                            else  szResult := szResult +', ';
                        end else
                        begin
                            szResult := szResult + ', ';
                        end;
                    end;
            s := '';
        end;


    if DS.Locate('PARAMETR_NAME', 'INST_WORK_REASON_'+IntToStr(z)+'_1', []) then
        if (DS.FBN('PARAMETR_VALUE').AsString <> '') and (DS.FBN('PARAMETR_VALUE').AsString <> ' ') then
            szResult := szResult + '<u>тип роботи</u> ' + DS.FBN('PARAMETR_VALUE').AsString + ', ';


    szResult := szResult + '<u>посада</u>: ';
    if DS.Locate('PARAMETR_NAME', 'INST_NAME_POST_'+IntToStr(z)+'_1', []) then
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

    szResult := szResult + '<u>підрозділ:</u> <b>';
    if DS.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_VERH_'+IntToStr(z)+'_1', []) then
    begin
//        szResult  := szResult + DS.FBN('PARAMETR_VALUE').AsString + ', ';
        szTemp    := DS.FBN('PARAMETR_VALUE').AsString;
        s         := copy(szTemp, 2, 1);
        if ((ord(s[1])<=223) and (ord(s[1])>=192)) or (ord(s[1])=175) or (ord(s[1])=178) or (ord(s[1])=170) or (ord(s[1])=73) then
        begin
            szResult  := szResult + szTemp + ', ';
        end else
        begin
            cTemp     := ansiLowerCase(szTemp)[1];
            szTemp[1] := cTemp;
            szResult  := szResult + szTemp + ', ';
        end;
        szTemp    := '';
    end;
    if DS.Locate('PARAMETR_NAME', 'INST_NAME_DEPARTMENT_'+IntToStr(z)+'_1', []) then
        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString;

    if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS_NOT5_'+IntToStr(z), []) then
    begin
        k := DS.FBN('PARAMETR_VALUE').AsInteger;
        for j := 1 to k+1 do
        begin
            szTemp := '';


    fTemp    := 0;
    iLength  := 0;

    if DS.Locate('PARAMETR_NAME', 'INST_COUNT_SM_'+IntToStr(z)+'_'+IntToStr(j), []) then
        iLength     := DS.FBN('PARAMETR_VALUE').AsInteger;
    rate_count  := 0;
    DecimalSeparator    := '.';
    for iTemp := 1 to iLength do begin
        if DS.Locate('PARAMETR_NAME', 'INST_RATE_COUNT_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []) then
        begin
            rate_count := rate_count + DS.FBN('PARAMETR_VALUE').AsFloat;
        end;

        if iLength > 1 then
        begin
            if iTemp=1 then szTemp := ' з оплатою ';
            szTemp := szTemp + FormatFloat(stavka_str, DS.FBN('PARAMETR_VALUE').AsFloat) + ' ставки ';
        end;

        szTemp := szTemp + ' (';

        DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);
        fTemp := fTemp + DS.FBN('PARAMETR_VALUE').AsFloat;

        DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_PPS_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);
        if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat <> 0) then
        begin
            flagok := true
        end else
            flagok := false;

        DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);

        if (iLength > 1) or (flagok) then
        begin
            szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';
        end else
        begin
            szTemp := szTemp + 'за рахунок ';
        end;

        DS.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);

        szTemp := szTemp + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' (';

        DS.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);
        szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString+')';


        DS.Locate('PARAMETR_NAME', 'INST_SUMMA_SMETA_PPS_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);
        if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').AsFloat <> 0) then
        begin
            fTemp  := fTemp + DS.FBN('PARAMETR_VALUE').AsFloat;
            szTemp := szTemp + ', ' + DS.FBN('PARAMETR_VALUE').AsString + ' грн. - за рахунок ';

            DS.Locate('PARAMETR_NAME', 'INST_SMETA_TITLE_PPS_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);
            szTemp := szTemp + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' (';

            DS.Locate('PARAMETR_NAME', 'INST_SMETA_KOD_PPS_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);
            szTemp := szTemp + DS.FBN('PARAMETR_VALUE').AsString;

            DS.Locate('PARAMETR_NAME', 'INST_KOEFF_PPS_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);
            if (not DS.FBN('PARAMETR_VALUE').IsNull) and (DS.FBN('PARAMETR_VALUE').Asfloat <> 0) then
            begin
                DS.Locate('PARAMETR_NAME', 'INST_KOEFF_PPS_'+IntToStr(z)+'_'+IntToStr(j)+ '_' + IntToStr(iTemp), []);
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
                if DS.Locate('PARAMETR_NAME', 'INST_DATE_BEG_'+IntToStr(z)+'_'+IntToStr(j), [])
                    then szResult := szResult + #13 + '<b> з ' + DS.FBN('PARAMETR_VALUE').AsString;

                if DS.Locate('PARAMETR_NAME', 'INST_DATE_END_'+IntToStr(z)+'_'+IntToStr(j), []) then
                begin
                    if DS.FBN('PARAMETR_VALUE').AsDateTime < d_inf then
                        szResult := szResult + ' по ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';

                end;
                szResult := szResult + '</b>';
            end;


            szResult := szResult + ' на ' + FormatFloat(stavka_str, rate_count);
            szResult := szResult + ' ставки</b> з окладом ' + FormatFloat('0.00', fTemp) + ' грн. на місяць' + szTemp;

            szResult := szResult + ' ';


            if (k> 0) and (j=k+1) then
            begin
                szResult := szResult + #13;
            end;

        end;
    end;



    //  Тип персонала
    szResult := szResult + '<u>Тип персоналу:</u> ';
    if DS.Locate('PARAMETR_NAME', 'INST_TYPE_POST_NAME_'+IntToStr(z)+'_1', []) then
        szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '. ';
    if DS.Locate('PARAMETR_NAME', 'NOTE_'+IntToStr(z)+'', []) then
        if (DS.FBN('PARAMETR_VALUE').AsString <> '') and (DS.FBN('PARAMETR_VALUE').AsString <> ' ') then
            szResult := szResult + DS.FBN('PARAMETR_VALUE').AsString + '.';

    szResult := szResult + #13;
    //  Установить при приёме доплаты и надбавки
    if DS.Locate('PARAMETR_NAME', 'COUNT_ITEMS_P_'+IntToStr(z), []) then
    begin
        k := DS.FBN('PARAMETR_VALUE').AsInteger;

        if k>=0 then
        begin
            flag_bonus := true;
            for i := 2 to k+1 do
            begin
                if DS.Locate('PARAMETR_NAME', 'MOVING_TYPE_'+IntToStr(z)+ '_' + IntToStr(i), []) then
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
            if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_INST_'+IntToStr(z) + '_' + IntToStr(i), []) then
            begin
                iLength := DS.FBN('PARAMETR_VALUE').AsInteger;
                for iTemp := 1 to iLength do
                begin
                    szResult := szResult + '<b>';
                    if DS.Locate('PARAMETR_NAME', 'BONUS_DATE_BEG_' + IntToStr(z) + '_' + IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                    begin
                        szResult := szResult + ' з ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';
                    end;
                    if DS.Locate('PARAMETR_NAME', 'BONUS_END_BEG_'+ IntToStr(z) + '_' + IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                        if DS.FBN('PARAMETR_VALUE').AsDateTime < StrToDate('31.12.2050') then
                            szResult := szResult + 'по ' + DS.FBN('PARAMETR_VALUE').AsString + ' ';  
                    szResult := szResult + '</b>';

                    DS.Locate('PARAMETR_NAME', 'BONUS_RAISE_NAME_BONUS_'+IntToStr(z) + '_' + IntToStr(i)+ '_' + IntToStr(iTemp), []);
                    szResult := szResult + AnsiLowerCase(DS.FBN('PARAMETR_VALUE').AsString) + ' - ';

                    if (DS.Locate('PARAMETR_NAME', 'BONUS_PERCENT_'+IntToStr(z) + '_' + IntToStr(i)+ '_' + IntToStr(iTemp), [])) and (not DS.FBN('PARAMETR_VALUE').isNull) then
                    begin
                        szResult := szResult + FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + '% посадового окладу ';
                        if IsShowBonusSmet=1 then
                        begin
                            szResult := szResult + '(';
                            BonusSumma:='';
                            if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_BONUS_SMET_'+IntToStr(z) + '_' + IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                               mCnt:=DS.FBN('PARAMETR_VALUE').AsInteger
                            else mCnt:=0;
                            for m:=1 to mCnt do
                            begin
                               DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_BONUS_'+ IntToStr(z)+ '_' + IntToStr(i)+'_'+IntToStr(iTemp)+'_'+IntToStr(m), []);
                               BonusSumma:=FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                               if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_'+ IntToStr(z)+ '_' + IntToStr(i)+'_'+IntToStr(iTemp)+'_'+IntToStr(m), []) then
                                  szResult := szResult + BonusSumma + '- за рахунок ' + DS.FBN('PARAMETR_VALUE').AsString;
                               if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_'+ IntToStr(z)+ '_' + IntToStr(i)+'_'+IntToStr(iTemp)+'_'+IntToStr(m), []) then
                                  szResult := szResult + ' (' +DS.FBN('PARAMETR_VALUE').AsString + ')';

                               BonusSummaPps:='';
                               DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_SMETA_PPS_BONUS_'+IntToStr(z)+ '_' + IntToStr(i)+'_'+IntToStr(iTemp)+'_'+IntToStr(m), []);
                               if DS.FBN('PARAMETR_VALUE').AsFloat>0 then
                               begin
                                   BonusSummaPps:=FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн. ';
                                   if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_TITLE_PPS_BONUS_'+IntToStr(z)+ '_' + IntToStr(i)+'_'+IntToStr(iTemp)+'_'+IntToStr(m), []) then
                                      szResult := szResult + ', '+BonusSummaPps+'- за рахунок ' + DS.FBN('PARAMETR_VALUE').AsString;
                                   if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_KOD_PPS_BONUS_'+IntToStr(z)+ '_' + IntToStr(i)+'_'+IntToStr(iTemp)+'_'+IntToStr(m), []) then
                                      szResult := szResult + ' (' +DS.FBN('PARAMETR_VALUE').AsString + ')';//', коефіціент підвищення посадового окладу '+KoeffPps+')';
                               end;
                               if (m <> mCnt) then szResult := szResult + ', '
                               else szResult := szResult + ')';
                            end;
                        end;
                    end
                    else
                    begin
                        DS.Locate('PARAMETR_NAME', 'BONUS_SUMMA_'+IntToStr(z) + '_' + IntToStr(i)+ '_' + IntToStr(iTemp), []);
                        szResult := szResult + FormatFloat('0.00', DS.FBN('PARAMETR_VALUE').AsFloat) + ' грн.';
                        if IsShowBonusSmet=1 then
                        begin
                            BonusSumma:='';
                            if DS.Locate('PARAMETR_NAME', 'BONUS_COUNT_BONUS_SMET_'+IntToStr(z) + '_' + IntToStr(i)+ '_' + IntToStr(iTemp), []) then
                               mCnt:=DS.FBN('PARAMETR_VALUE').AsInteger
                            else mCnt:=0;
                            for m:=1 to mCnt do
                            begin
                               if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_TITLE_'+ IntToStr(z)+ '_' + IntToStr(i)+'_'+IntToStr(iTemp)+'_'+IntToStr(m), []) then
                                  szResult := szResult + BonusSumma + ' (за рахунок ' + DS.FBN('PARAMETR_VALUE').AsString;
                               if DS.Locate('PARAMETR_NAME', 'BONUS_SMETA_BONUS_KOD_'+ IntToStr(z)+ '_' + IntToStr(i)+'_'+IntToStr(iTemp)+'_'+IntToStr(m), []) then
                                  szResult := szResult + ' (' +DS.FBN('PARAMETR_VALUE').AsString + ')';
                               if (m <> mCnt) then szResult := szResult + ', '
                               else szResult := szResult + ')';
                            end;
                        end;
                    end;

                    if (i = k+1)
                        then szResult := szResult + '. '+#13
                        else szResult := szResult + ', ';
                end;
            end else
            begin
                szResult := copy(szResult, 1, LENGTH(szResult)-2) + '. '+#13;
            end;

        end;
    end;
    //  Причина

//        if count_i > z then szResult := szResult + #13;
    end;
    end;
    szResult := szResult + '<u>Підстава: </u> ';
    DS.Locate('PARAMETR_NAME', 'REASON_1', []);
    szTemp := DS.FBN('PARAMETR_VALUE').AsString;
    s := AnsiLowerCase(Copy(szTemp,1,1));
    szResult := szResult + s + Copy(szTemp,2,Length(szTemp));

    TR.Rollback;
    DS.Free;
    TR.Free;
    db.Free;
    DecimalSeparator    := ',';
  except on Error: Exception do begin
    MessageDlg('Неможливо зформувати шаблон по пункту ' + s1 +'. ' + s2, mtError, [mbOk], 0);
//    szResult := '';
  end;
  end;
    Result := szResult;
end;

end.
