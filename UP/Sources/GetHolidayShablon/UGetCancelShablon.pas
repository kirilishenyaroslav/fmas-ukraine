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
var szResult            : String;
    fdbTemplateReceipt  : TpFIBDatabase;
    ftrTemplateReceipt  : TpFIBTransaction;
    fdsTemplateReceipt  : TpFIBDataSet;
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
    then szResult := szResult + ' ' +fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString +' '
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);


    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY6', [])  //Номер пункта
    then szResult := szResult +  ' Пункт №  '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY7', [])  //Номер подпункта
    then szResult := szResult +  '.'+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);


    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY2', []) //Номер приказа
    then szResult := szResult +  ' наказу № '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY4', []) //Номер приказа
    then szResult := szResult +  ' від '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY3', []) //Номер проекта
    then szResult := szResult +  '(проект № '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY5', []) //Дата проекта
    then szResult := szResult +  ' від '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString+')'+#13
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

    fdsTemplateReceipt.First;
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'BODY1', []) //Причина
    then szResult := szResult +  '<u> Підстава:</u> '+fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString
    else MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);

  except on Error: Exception do begin
    MessageDlg('Помилка під час формування тіла наказу!!', mtError, [mbOk], 0);
    szResult := '';
  end;
  end;
    Result := szResult;
end;

end.
