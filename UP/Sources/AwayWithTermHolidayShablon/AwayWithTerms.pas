unit AwayWithTerms;

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
var szResult, szTemp, s,s1            : String;
    fdbTemplateReceipt  : TpFIBDatabase;
    ftrTemplateReceipt  : TpFIBTransaction;
    fdsTemplateReceipt  : TpFIBDataSet;
    i, iT: integer;
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
    then szResult := szResult + '<b>' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' </b>'
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);


    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY1', []) //ФИО
    then szResult := szResult +  '<u>ПІБ:</u>  <b>'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>,'
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY2', []) //Тип персонала
    then szResult := szResult + ' <u>тип персоналу:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ','
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY3', []) //должность
    then szResult := szResult + ' <u>посада:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ','
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY4', []) //подразделение
    then szResult := szResult + ' <u>підрозділ:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ','
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY6', []) //Ставка
    then szResult := szResult + ' з оплатою: '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' ставки '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY17', []) //тип роботи
    then szResult := szResult + '<u>тип роботи:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    {fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY5', []) //Оклад
    then szResult := szResult + ' з окладом   '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' грн., '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);}

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY7', []) //подразделение
    then szResult := szResult + ' <u>відпустка:</u> '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY8', []) //подразделение
    then szResult := szResult + ' на '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' календарних дні(в) '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY9', []) //подразделение
    then szResult := szResult + ' з '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY10', []) //подразделение
    then szResult := szResult + ' по '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY18', []) //подразделение
    then szResult := szResult + '<b> перенести з '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY19', []) //подразделение
    then szResult := szResult + ' по '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY13', []) //подразделение
    then szResult := szResult + ' на період з '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY14', []) //подразделение
    then szResult := szResult + 'по '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY12', []) //подразделение
    then szResult := szResult + ' на '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' дні(в). </b> '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);



    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY16', []) //примечание
    then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY11', []) //подразделение
    then
    begin
      szResult := szResult +#13+ ' <u>Підстава:</u> ';
      szTemp := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
      iT:=0;
       for i:=0 to length(szTemp)-1 do
       begin
          s1:=copy(szTemp,i,1);
          if s1=' '  then
          begin
              inc(iT);
          end
          else break;
       end;
     s := AnsiLowerCase(Copy(szTemp,1,iT+1));
     szResult := szResult + s + Copy(szTemp,iT+2,Length(szTemp));
      end
      //+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

  except on Error: Exception do begin
    MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);
    szResult := '';
  end;
  end;
    Result := szResult;
end;

end.
