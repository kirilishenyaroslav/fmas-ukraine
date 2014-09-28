unit UBeginWorkOrderShablon;

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
var szResult            : String;
    fdbTemplateReceipt  : TpFIBDatabase;
    ftrTemplateReceipt  : TpFIBTransaction;
    fdsTemplateReceipt  : TpFIBDataSet;
    szTemp, s, s1       :String;
    iT, i               :Integer;
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

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY0', []) //Номер пункта
    then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+' '
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);


    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY1', []) //ФИО
    then szResult := szResult +  '<u>ПІБ:</u>  <b>'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>,'
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY2', []) //Тип персонала
    then szResult := szResult + ' <u>тип персоналу:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ','
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY3', []) //должность
    then szResult := szResult + ' <u>посада:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString {+ ',' }
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);
   ////////
    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY6', []) //должность
    then szResult := szResult + ' на '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ставки,'
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY4', []) //подразделение
    then szResult := szResult + ' <u>підрозділ:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString // + ','
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY15', []) //приступила к работе
    then szResult := szResult + ' <b>стала до роботи з '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString  + ' під час</b>'
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY7', []) //Тип отпуска
    then szResult := szResult + ' <u>відпустки:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

    {fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY8', []) //количество дней
    then szResult := szResult + ' на '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' календарних днів '
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0); }

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY9', []) //дата начала отпуска
    then szResult := szResult + ' з '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY10', []) //дата окончания отпуска
    then szResult := szResult + ' по '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' р.'
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

   { fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY12', []) //количество дней на который отзывается
    then szResult := szResult + ' на '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' день(ів) '
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);


    //Проверяем необходимо ли печатать фразу Невикористані.....
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY15', []) //количество дней
    then begin
              if (fdsTemplateReceipt.FieldByName('PARAMETR_VALUE').Value='1')
              then begin
                        fdsTemplateReceipt.First;
                        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY12', []) //количество дней
                        then szResult := szResult + ' Невикористані '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+' календарних днів відпустки надати за заявою.'+#13
                        else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);
              end
              else begin
                        szResult := szResult + #13;
              end
    end
    else begin
              fdsTemplateReceipt.First;
              if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY12', []) //количество дней
              then szResult := szResult + ' Невикористані '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+' календарних днів відпустки надати за заявою.'+#13
              else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);
    end; }

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY16', []) //дата окончания отпуска
    then begin
            If fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString<>'' then
               szResult := szResult + #13 + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    end
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY11', []) //причина
    then
    begin
            szResult := szResult + #13+'<u>Підстава</u>: ';
            szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
    iT:=0;
    for i:=0 to Length(szTemp)-1 do
    begin
        s1:=copy(szTemp,i,1);
        if s1=' ' then inc(iT)
        else break;
    end;

    s := AnsiLowerCase(Copy(szTemp,1,iT+1));
    //szTemp := AnsiLowerCase(szTemp);
    //szTemp[1] := s;
    szResult := szResult + s + Copy(szTemp,iT+2,Length(szTemp));
    end
    else MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);

  except on Error: Exception do begin
    MessageDlg('Помилка під час формування тіла наказу!', mtError, [mbOk], 0);
    szResult := '';
  end;
  end;
    Result := szResult;
end;

end.
