unit UGetHLShablon;

interface

uses SysUtils,
     Classes,
     Dialogs,
     ibase,
     DB,
     FIBDatabase,
     pFIBDatabase,
     FIBDataSet,
     pFIBDataSet,
     Variants;

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

exports GetTemplateString;

implementation

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;
var szResult,Stavki, szTemp, s, s1     : String;
    fdbTemplateReceipt  : TpFIBDatabase;
    ftrTemplateReceipt  : TpFIBTransaction;
    fdsTemplateReceipt  : TpFIBDataSet;
    PrintDays           : Integer;
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

    fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT Stavki_Disp_Format FROM Ini_Asup_Consts';
    fdsTemplateReceipt.Open;
    Stavki:=fdsTemplateReceipt['Stavki_Disp_Format'];

    szResult := '';
    fdsTemplateReceipt.Close;
    fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT * FROM up_dt_order_item_body WHERE id_session = '+IntToStr(id_session)+'';
    fdsTemplateReceipt.Open;

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY0', []) //Номер пункта
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +' ' 
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

    szResult := szResult + ' <u>підрозділ:</u> ';
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'WITH_UP_DEP', []) then //Вышестоящее подразделение
    begin
      if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString='T' then
      begin
         if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'UP_DEPARTMENT', []) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', '
         else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);
      end;
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY4', []) //подразделение
    then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ','
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY6', []) //Ставка
    then
    begin
        decimalSeparator := '.';
        szResult := szResult + ' з оплатою: '+ FormatFloat(Stavki,fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat) + ' ставки '
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY12', []) //тип роботи
    then szResult := szResult + '<u>тип роботи: </u>'+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY7', []) //подразделение
    then szResult := szResult + ' <u>відпустка:</u> <b>'+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    PrintDays:=1;
    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY17', []) //проверка печатать ли дни
    then
    begin
        if VarIsNull(fdsTemplateReceipt.FBN('PARAMETR_VALUE').Value)
        then PrintDays:=1
        else  PrintDays := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    if PrintDays<>0 then
    begin
      fdsTemplateReceipt.First;
      if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY8', []) //кол-во дней
      then szResult := szResult + ' на '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' календарних днів '
      else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);
    end;

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY9', []) //с
    then szResult := szResult + ' з '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY10', []) //по
    then szResult := szResult + ' по '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' р.</b>'
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    
    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY16', []) //примечание
    then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY11', []) //пидстава
    then
    begin
     szResult := szResult + #13 +' <u>Підстава:</u> ';
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
    //+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);



  except on Error: Exception do begin
    MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);
    szResult := '';
  end;
  end;
    Result := szResult;
end;

end.
