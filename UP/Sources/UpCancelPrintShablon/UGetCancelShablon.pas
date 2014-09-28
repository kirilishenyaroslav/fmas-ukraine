unit UGetCancelShablon;

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
var szResult,num_item_str,num_subitem_str,
    num_proj_str, date_proj_str  : String;
    fdbTemplateReceipt  : TpFIBDatabase;
    ftrTemplateReceipt  : TpFIBTransaction;
    trCancelBody        : TpFIBTransaction;
    fdsTemplateReceipt  : TpFIBDataSet;
    CancelBody          : TpFIBDataSet;
    szTemp, s, s1       : String;
    iT, i               : Integer;
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
    CancelBody                    := TpFIBDataSet.Create(NIL);
    trCancelBody                  := TpFIBTransaction.Create(NIL);
    trCancelBody.DefaultDatabase  := fdbTemplateReceipt;
    CancelBody.Database           := fdbTemplateReceipt;
    CancelBody.Transaction        := trCancelBody;
    szResult := '';
    fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT * FROM up_dt_order_item_body WHERE id_session = '+IntToStr(id_session)+'';
    fdsTemplateReceipt.Open;

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY0', []) //Номер пункта
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY6', [])  //Номер пункта
    then
    begin
        szResult := szResult +  ' Пункт №  <b>'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+'</b>';
        num_item_str:=fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY7', [])  //Номер подпункта
    then
    begin
        szResult := szResult +  '<b>.'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+'</b>';
        num_subitem_str:=fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY2', []) //Номер приказа
    then szResult := szResult +  ' наказу № <b>'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+'</b>'
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY4', []) //Номер приказа
    then szResult := szResult +  ' від <b>'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+'</b>'
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY3', []) //Номер проекта
    then
    begin
        szResult := szResult +  ' (проект № '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        num_proj_str:=fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY5', []) //Дата проекта
    then
    begin
        szResult := szResult +  ' від '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
        date_proj_str:=fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString;
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    if ((num_proj_str<>'') and  (date_proj_str<>'') and (num_item_str<>'')
         and (num_subitem_str<>''))
    then begin
         trCancelBody.StartTransaction;
         CancelBody.SelectSQL.Text:='SELECT OUT_BODY FROM UP_GET_CANCEL_ORDER_ITEM_TMP(:IN_NUM_PROJ_CANCEL_ORDER,:IN_DATE_PROJ_CANCEL_ORDER,:IN_NUM_CANCEL_ITEM,:IN_NUM_CANCEL_SUB_ITEM)';
         CancelBody.ParamByName('IN_NUM_PROJ_CANCEL_ORDER').AsVariant:=num_proj_str;
         CancelBody.ParamByName('IN_DATE_PROJ_CANCEL_ORDER').AsDate:=StrToDate(date_proj_str);
         CancelBody.ParamByName('IN_NUM_CANCEL_ITEM').AsInteger:= StrToInt(num_item_str);
         CancelBody.ParamByName('IN_NUM_CANCEL_SUB_ITEM').AsInteger:=StrToInt(num_subitem_str);
         CancelBody.Open;
         CancelBody.FetchAll;
         if ((not CancelBody.FieldByName('OUT_BODY').IsNull) and (CancelBody.FieldByName('OUT_BODY').Value<>''))
         then
           szResult := szResult +#13+CancelBody.FieldByName('OUT_BODY').AsString;
    end;
    szResult := szResult + ')' + #13;
    trCancelBody.Commit;

 {  fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY8', []) //Тело отменяемого пункта
    then
    begin
      if ((not fdsTemplateReceipt.FBN('PARAMETR_VALUE').IsNull)
      and (fdsTemplateReceipt.FBN('PARAMETR_VALUE').Value<>''))
      then szResult := szResult +':'+#13+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+#13
      else szResult := szResult + #13;
    end
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);
   }
    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY1', []) //Причина
    then begin
             szResult := szResult +  '<u> Підстава:</u> ';
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
            // +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
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
