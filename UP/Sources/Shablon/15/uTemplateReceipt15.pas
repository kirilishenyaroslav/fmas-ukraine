unit uTemplateReceipt15;  {текстовый пункт}

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
     Forms;

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;

exports GetTemplateString;

implementation

function GetTemplateString(hConnection: TISC_DB_HANDLE; id_session, id_item : Int64): String; stdcall;
var szResult, s         : String;            //  Строка для формирования результирующей строки
    fdbTemplateReceipt  : TpFIBDatabase;     //  База
    ftrTemplateReceipt  : TpFIBTransaction;  //  Транзакция
    fdsTemplateReceipt  : TpFIBDataSet;      //  Датасэт
//    l                   : integer;
begin
  try
    fdbTemplateReceipt                    := TpFIBDatabase.Create(NIL);
    ftrTemplateReceipt                    := TpFIBTransaction.Create(NIL);
    fdsTemplateReceipt                    := TpFIBDataSet.Create(nil);
    fdbTemplateReceipt.SQLDialect         := 3;
    fdbTemplateReceipt.Handle             := hConnection;
    fdsTemplateReceipt                    := TpFIBDataSet.Create(nil);
    ftrTemplateReceipt.DefaultDatabase    := fdbTemplateReceipt;
    fdbTemplateReceipt.DefaultTransaction := ftrTemplateReceipt;
    fdsTemplateReceipt.Database           := fdbTemplateReceipt;
    fdsTemplateReceipt.Transaction        := ftrTemplateReceipt;
    ftrTemplateReceipt.StartTransaction;

    szResult := '';
    s        := '';
    fdsTemplateReceipt.SQLs.SelectSQL.Text := 'SELECT parametr_name, parametr_value ' +
                                              'FROM   up_dt_order_item_body '         +
                                              'WHERE  id_session = ' + IntToStr(id_session);
    fdsTemplateReceipt.Open;
    //  Номер пункта
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TEXT_NUM_ITEM_1', []) then
        s := s + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '.';
    //  Номер подпункта
    if fdsTemplateReceipt.Locate('PARAMETR_NAME', 'TEXT_NUM_SUB_ITEM_1', []) then
        if fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsInteger <> 0 then
            s := s + fdsTemplateReceipt.FBN('PARAMETR_VALUE').AsString + '.';
    fdsTemplateReceipt.Close;
    fdsTemplateReceipt.SQLs.SelectSQL.Text := 'select body from UP_DT_TEXT_DATA_INST where ID_ORDER_ITEM= ' + IntToStr(id_item);
    fdsTemplateReceipt.Open;
    if not fdsTemplateReceipt.FBN('BODY').IsNull then
    begin
//        szResult := s + ' ' + trim(fdsTemplateReceipt.FBN('BODY').AsString);
        if Pos(s, fdsTemplateReceipt.FBN('BODY').AsString)=1
            then
            begin
                szResult := trim(fdsTemplateReceipt.FBN('BODY').AsString);
            end
            else
            begin
                szResult := s + ' ' + trim(fdsTemplateReceipt.FBN('BODY').AsString);
            end;

    end;
{        if Pos(s, fdsTemplateReceipt.FBN('BODY').AsString)=1
            then
            begin
                szResult := trim(fdsTemplateReceipt.FBN('BODY').AsString);
            end
            else
            begin
                szResult := s + ' ' + trim(fdsTemplateReceipt.FBN('BODY').AsString);
            end;
    end;}

    ftrTemplateReceipt.Rollback;
    //  Удаление динамически созданных компонент
    fdsTemplateReceipt.Free;
    ftrTemplateReceipt.Free;
    fdbTemplateReceipt.Free;
  except on Error: Exception do begin
    MessageDlg('Неможливо зформувати шаблон: '+#10#13+Error.Message, mtError, [mbOk], 0);
//    szResult := '';
  end;
  end;
    Result := szResult;
end;

end.
