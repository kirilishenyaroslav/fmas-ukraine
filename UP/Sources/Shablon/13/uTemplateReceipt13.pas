unit uTemplateReceipt13; {увольнение с почасовой работы}

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

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

exports GetTemplateString;

implementation

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;
var szResult,s          : String;            //  Строка для формирования результирующей строки
    szTemp              : String;            //  Строка для хранения текстовой строки
    cTemp               : Char;              //  Переменная для хранения символа
    iTemp               : Integer;           //  Переменная для хранения значения целого типа
    iLength             : Integer;           //  Переменная для хранения значения целого типа длины цикла
    fTemp               : Currency;          //  Переменная для хранения значения вещественного типа
    fdbTemplateReceipt  : TpFIBDatabase;     //  База
    ftrTemplateReceipt  : TpFIBTransaction;  //  Транзакция
    fdsTemplateReceipt  : TpFIBDataSet;      //  Датасэт

begin
  try
    fdbTemplateReceipt                    := TpFIBDatabase.Create(NIL);
    ftrTemplateReceipt                    := TpFIBTransaction.Create(NIL);
    fdsTemplateReceipt                    := TpFIBDataSet.Create(NIL);
    fdbTemplateReceipt.SQLDialect         := 3;
    fdbTemplateReceipt.Handle             := hConnection;
    ftrTemplateReceipt.DefaultDatabase    := fdbTemplateReceipt;
    fdbTemplateReceipt.DefaultTransaction := ftrTemplateReceipt;
    fdsTemplateReceipt.Database           := fdbTemplateReceipt;
    fdsTemplateReceipt.Transaction        := ftrTemplateReceipt;
    ftrTemplateReceipt.StartTransaction;

    szResult := '';
    fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT * FROM up_dt_order_item_body WHERE id_session = '+IntToStr(id_session)+'';
    fdsTemplateReceipt.Open;
    //  Номер пункта
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_NUM_ITEM_1', []) then
        szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '.';
    //  Номер подпункта
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_NUM_SUB_ITEM_1', []) then
    szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '. ';
    //  Фамилия
    szResult := szResult + '<u>ПІБ:</u> <b>';
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_SECOND_NAME_UA_1', []) then
    //  Заглавными буквами
    szResult := szResult + AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString) + ' ';
    //  Имя
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_FIRST_NAME_UA_1', []) then
    begin
       //  Заглавными буквами
        szTemp := AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);
        szResult := szResult + szTemp + ' ';
    end;
        //  Отчество
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_LAST_NAME_UA_1', []) then
    begin
         //  Заглавными буквами
        szTemp := AnsiUpperCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);
        szResult := szResult + szTemp + ' ';
    end;

    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_TN_1', [])
        then szResult := szResult + '(TH ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ')';

    szResult := szResult + '</b>, ';

    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_EDUC_ZVANIE_AND_ST_1', []) then
    if (not fdsTemplateReceipt.FBN('PARAMETR_VALUE').isNull) and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString <> '')
        then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';
    //  Подразделение

    szResult := szResult + '<u>підрозділ:</u> ';
    //  Подразделение
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_NAME_DEPARTMENT_VERH_1', []) then
    begin
        szResult  := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';
    end;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_NAME_DEPARTMENT_1', []) then
        szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+', ';

    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_COUNT_SM_1', []) then
    begin
        szTemp := '';
        iLength := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
        for iTemp := 1 to iLength do begin
//            if iLength >1 then
//                if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'PR_SUMMA_SMETA_1_1_' + IntToStr(iTemp), []) then
//                    szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
            szTemp := szTemp + ' за рахунок ';

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_SMETA_TITLE_1_' + IntToStr(iTemp), []) then
                szTemp := szTemp + AnsiLowerCase(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString);
            szTemp := szTemp + ' (';

            if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_SMETA_KOD_1_' + IntToStr(iTemp), []) then
                szTemp := szTemp + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
            szTemp := szTemp + ')';
            if not (iTemp = iLength) then
            begin
                szTemp := szTemp + ', ';
            end
            else begin
                szTemp := szTemp + '.';
            end;
        end;

            szResult := szResult + szTemp;
    end;
    szResult := szResult + '<b> ';
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_DATE_DISMISSION_1', []) then
        szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
    szResult := szResult + '</b> ';
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_NAME_DISMISSION_1', []) then
        szResult := szResult + '<b> '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b> ';

    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_DES_KZOT_ST_1', []);
    szResult := szResult + '<b> ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>. ';

    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_NOTE_1', []) then
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
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '%';

            if (iTemp = iLength)
                then szResult := szResult + '.'
                else szResult := szResult + ', ';
        end;
        szResult := szResult + #13;
    end;
    szResult := szResult + '<u>Підстава:</u> ';
    fdsTemplateReceipt.Locate('PARAMETR_NAME', 'DES_POCHAS_REASON_1', []);
    szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
    s := AnsiLowerCase(Copy(szTemp,1,1));
    szResult := szResult + s + Copy(szTemp,2,Length(szTemp));
   // szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
    //  Отсоединение от базы
    ftrTemplateReceipt.Rollback;
    //  Удаление динамически созданных компонент
    fdsTemplateReceipt.Free;
    ftrTemplateReceipt.Free;
    fdbTemplateReceipt.Free;
    DecimalSeparator    := ',';
  except on Error: Exception do begin
    MessageDlg('Невозможно сформировать шаблон', mtError, [mbOk], 0);
    szResult := '';
  end;
  end;
    Result := szResult;

end;

end.
