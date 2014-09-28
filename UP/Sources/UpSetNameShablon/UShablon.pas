unit UShablon;

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
var szResult, Stavki            : String;
    fdbTemplateReceipt  : TpFIBDatabase;
    ftrTemplateReceipt  : TpFIBTransaction;
    fdsTemplateReceipt  : TpFIBDataSet;
    szTemp, s, s1       : String;
    iT, i               : Integer;
    IsPrintUpDep        : Byte;
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

    fdsTemplateReceipt.Close;
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
    else MessageDlg('Помилка під час формування тіла наказу 0!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY2', []) //Старая фамилия
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +' '
    else MessageDlg('Помилка під час формування тіла наказу 2!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY3', []) //Старое имя
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +' '
    else MessageDlg('Помилка під час формування тіла наказу 3!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY4', []) //Старое отчество
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу 4!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY10', []) //TN
    then
    begin
        if not (VarIsNull(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsVariant))
        then
        szResult := szResult + '(ТН ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+'),'
    end
    else MessageDlg('Помилка під час формування тіла наказу 10!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY8', []) //должность
    then
    begin
        if not VarIsNull(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsVariant) then
        szResult := szResult + ' посада: ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +', '
    end
    else MessageDlg('Помилка під час формування тіла наказу 8!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY11', []) //Ставка
    then
    begin
        if not VarIsNull(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsVariant) then
        begin
            decimalSeparator := '.';
            szResult := szResult + ' з оплатою: '+ FormatFloat(Stavki,fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsFloat)  +' ставки ';
        end;
    end
    else MessageDlg('Помилка під час формування тіла наказу 11!!', mtError, [mbOk], 0);

    szResult := szResult + ' підрозділ: ';

    IsPrintUpDep:=0;
    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY13', []) //Подразделение
    then
    begin
        if not VarIsNull(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsVariant) then
        IsPrintUpDep := fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger;
    end
    else MessageDlg('Помилка під час формування тіла наказу 12!!', mtError, [mbOk], 0);

    if IsPrintUpDep=1 then
    begin
        fdsTemplateReceipt.First;
        if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY12', []) //Подразделение
        then
        begin
            if not VarIsNull(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsVariant) then
            szResult := szResult + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + ', ';
        end
        else MessageDlg('Помилка під час формування тіла наказу 12!!', mtError, [mbOk], 0);
    end;
    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY9', []) //Подразделение
    then
    begin
        if not VarIsNull(fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsVariant) then
        szResult := szResult +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +', '
    end
    else MessageDlg('Помилка під час формування тіла наказу 9!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY5', []) //Новая фамилия
    then szResult := szResult + ' іменувати надалі як <b>' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +' '
    else MessageDlg('Помилка під час формування тіла наказу 5!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY6', []) //Новое имя
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +' '
    else MessageDlg('Помилка під час формування тіла наказу 6!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY7', []) //Новое отчетство
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +'</b>'+#13
    else MessageDlg('Помилка під час формування тіла наказу 7!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY1', []) //Новое отчетство
    then
    begin
        szResult := szResult + '<u>Підстава</u>: ';
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
    else MessageDlg('Помилка під час формування тіла наказу підст.!!', mtError, [mbOk], 0);


  except on Error: Exception do begin
    MessageDlg('Помилка під час формування тіла наказу 1111!!'+Error.Message, mtError, [mbOk], 0);
    szResult := '';
  end;
  end;
    Result := szResult;
end;

end.
