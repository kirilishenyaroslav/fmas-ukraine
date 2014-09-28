unit uComandShablon; {Шаблон печати командировок}

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
    iT, i, id_sex       :Integer;
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
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body0', []) //Номер пункта
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);


    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body1', []) //ФИО
    then szResult := szResult +  '<b>'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>, '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body14', []) //ФИО
    then szResult := szResult +  '<b>'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '</b>,'
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body2', []) then id_sex:=fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body3', []) then
    begin
       if id_sex=1 then szResult:=szResult+' що був відправлений до '
       else szResult:=szResult+' що була відправлена до ';
       szResult := szResult + ''+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', '
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    if id_sex=1 then szResult:=szResult+' фактично знаходився  у відрядженні '
    else szResult:=szResult+' фактично знаходилась  у відрядженні ';

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body12', [])then
    begin
       szResult:=szResult+ '(№ ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' '
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body13', [])then
    begin
       szResult:=szResult+ 'від ' + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ') '
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body6', [])then
    begin
       szResult:=szResult+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ' днів '
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body4', [])then
    begin
       szResult:=szResult+ ' з '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body5', [])then
    begin
       szResult:=szResult+ ' по '+ fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+' '
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body11', []) //примечание
    then iT:=fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger
    else MessageDlg('Помилка під час формування тіла наказу111111!!', mtError, [mbOk], 0);

    for i:=1 to iT do
    begin
       if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body7_'+IntToStr(i), []) then
       begin
          szTemp:=szTemp+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+' % від ';
       end;

       if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body8_'+IntToStr(i), []) then
       begin
          szTemp:=szTemp+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
       end;
       if i<>iT then szTemp:=szTemp+', ';
    end;

    if szTemp<>'' then szResult:=szResult+' <b>за рахунок:</b> '+szTemp+'. ';

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body9', []) //примечание
    then szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'Body10', []) //пидстава
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
