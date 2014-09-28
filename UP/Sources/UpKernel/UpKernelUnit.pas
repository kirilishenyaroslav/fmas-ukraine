unit UpKernelUnit;

interface

uses Classes, Ibase, pFibStoredProc, pFibDatabase, pFibDataSet, SysUtils,
     BaseTypes, Dialogs, Kernel, Variants, RxMemDS, DB, WinSock, Windows,
     Forms, AccMgmt, Clipbrd, Controls;


type
UP_KERNEL_MODE_STRUCTURE =packed record
          AOWNER:TComponent;
          ID_ORDER:Int64;
          ID_ORDER_ITEM_IN:Int64;
          KEY_SESSION:Int64;
          FILL_INST :Integer;
          FILL_MAIN_DATA:Integer;
          CHECK_DATA:Integer;
          USE_BUFF_TABLES:Integer;
          DBHANDLE:TISC_DB_HANDLE;
          TRHANDLE:TISC_TR_HANDLE;
end;

PUP_KERNEL_MODE_STRUCTURE  = ^UP_KERNEL_MODE_STRUCTURE;

function  UpInitSession(DATA_STRUCTURE:PUP_KERNEL_MODE_STRUCTURE ;var DB:TpFibDatabase; var TR:TpFibTransaction):Boolean; forward;
procedure UpCloseSession(var DB:TpFibDatabase; var TR:TpFibTransaction);forward;
function  CheckUpKernellBlocking(var DB:TpFibDatabase; var TR:TpFibTransaction):Boolean;forward;
function  UpKernelDo(VAL:PUP_KERNEL_MODE_STRUCTURE):Boolean;stdcall;
function  UpKernelDoEx(VAL:PUP_KERNEL_MODE_STRUCTURE):Boolean;stdcall;
procedure GetUpSessionErrors(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;KEY_SESSION:Int64;id_order_item:Int64);stdcall;
procedure ShowInfo(DataSet: TDataSet);
function  StartHistory(WriteTransaction: TpFIBTransaction; CodeSystem: Integer=10; IdSession : integer=0): Int64;stdcall;
procedure AutoLoadFromRegistry(Owner: TComponent; Parent: TComponent = nil; id_user:integer=0);stdcall;
procedure AutoSaveIntoRegistry(Owner: TComponent; Parent: TComponent = nil; id_user:integer =0);stdcall;
function GetOrderByRegInfo(Owner: TComponent;DbHandle:TISC_DB_HANDLE):Int64; stdcall;
function KYVLoadFromRegistry(KeyIn:string;id_user:integer =0):String;stdcall;
procedure KYVSaveIntoRegistry(KeyIn:string;Value:string;id_user:integer =0);stdcall;


exports  UpKernelDo,UpKernelDoEx, GetUpSessionErrors, ShowInfo, StartHistory, AutoLoadFromRegistry, AutoSaveIntoRegistry, GetOrderByRegInfo,KYVLoadFromRegistry,KYVSaveIntoRegistry;


implementation

uses UpShowErrors, uFControl, Registry, UGetOrderInfo;

function GetOrderByRegInfo(Owner: TComponent;DbHandle:TISC_DB_HANDLE):Int64;
var Res:Int64;
begin
     Res:=-1;
     with TfrmGetOrderInfo.Create(owner,DbHandle) do
     begin
          if ShowModal=mrYes
          then begin
                    Res:=Id_Order;
          end;

          Free;
     end;

     Result:=Res;
end;


procedure DatasetToFile(aDataset: TDataSet; aStrList: TStrings);
var s: String;
    i: Integer;
begin
       aDataSet.Open;
       aStrList.Clear;

       //Первой строкой в список добавляем названия полей
       s := '';
       for i := 0 to (aDataset.FieldCount-1) do
       s := s + UpperCase(aDataset.Fields[i].FieldName) + ' ';


       aStrList.Add(s);
       aDataSet.First;
       while not aDataSet.EOF do
       begin
             s := '';
             for i := 0 to (aDataset.FieldCount-1) do
             s := s + aDataset.Fields[i].AsString + ' ';
             aStrList.Add(s);
             aDataSet.Next;
       end;
end;

function KYVLoadFromRegistry(KeyIn:string;id_user:integer =0):String;
var reg: TRegistry;
    key:string;
    res:string;
begin

              reg := TRegistry.Create;

              try
                  reg.RootKey := HKEY_CURRENT_USER;

                  key := '\Software\KYV\user_'+IntToStr(id_user) + '\'+ keyIn;

                  if reg.OpenKey(key, False) then
                  begin
                      res:=reg.ReadString(key);
                      reg.CloseKey;
                  end;

              except;
              end;

              reg.Free;

              result:=res;

end;

procedure KYVSaveIntoRegistry(KeyIn:string;Value:string;id_user:integer =0);
var reg: TRegistry;
    key:string;
begin
              reg := TRegistry.Create;

              try
                  reg.RootKey := HKEY_CURRENT_USER;

                  key := '\Software\KYV\user_'+IntToStr(id_user) + '\'+ keyIn;

                  if reg.OpenKey(key, True) then
                  begin
                      reg.WriteString(key,Value);
                      Reg.CloseKey;
                  end;
              finally
                  reg.Free;
              end;

end;



procedure AutoLoadFromRegistry(Owner: TComponent; Parent: TComponent = nil; id_user:integer=0);
var
    i: Integer;
    ctrl: TqFControl;
    reg: TRegistry;
    key, ownerName: string;
begin
     for i := 0 to Owner.ComponentCount - 1 do
     begin
          if Owner.Components[i] is TqFControl then
          begin
              ctrl := Owner.Components[i] as TqFControl;

              if (Parent <> nil) and (ctrl.Parent <> Parent) then continue;

              if not ctrl.AutoSaveToRegistry then
                  continue;

              reg := TRegistry.Create;

              try
                  reg.RootKey := HKEY_CURRENT_USER;

                  if Owner <> nil then ownerName := Owner.Name
                  else ownerName := '<unknown owner>';

                  key := '\Software\Qizz Software\TqFControl\user_'+IntToStr(id_user) + '\'+
                      ExtractFileName(Application.ExeName) + '\' + ownerName + '\' + ctrl.Name;

                  if reg.OpenKey(key, False) then
                  begin
                      ctrl.LoadFromRegistry(reg);
                      reg.CloseKey;
                  end;

              except;
              end;

              reg.Free;

          end;
     end;
end;

procedure AutoSaveIntoRegistry(Owner: TComponent; Parent: TComponent = nil; id_user:integer =0);
var i: Integer;
    ctrl: TqFControl;
    reg: TRegistry;
    key, ownerName: string;
begin
    for i := 0 to Owner.ComponentCount - 1 do
    begin
          if Owner.Components[i] is TqFControl then
          begin
              ctrl := Owner.Components[i] as TqFControl;

              if (Parent <> nil) and (ctrl.Parent <> Parent) then continue;

              if not ctrl.AutoSaveToRegistry then
                  continue;

              reg := TRegistry.Create;

              try
                  reg.RootKey := HKEY_CURRENT_USER;

                  if Owner <> nil then
                      ownerName := Owner.Name
                  else
                      ownerName := '<unknown owner>';

                  key := '\Software\Qizz Software\TqFControl\user_'+IntToStr(id_user)+'\' +
                      ExtractFileName(Application.ExeName) + '\' + ownerName + '\' + ctrl.Name;

                  if reg.OpenKey(key, True) then
                  begin
                      ctrl.SaveIntoRegistry(reg);
                      Reg.CloseKey;
                  end;
              finally
                  reg.Free;
              end;

          end;
    end;
end;



procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
  begin
       text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13+#10;
  end;     

  ClipBoard.AsText:=text;

  ShowMessage(text);
end;


function CheckUpKernellBlocking(var DB:TpFibDatabase; var TR:TpFibTransaction):Boolean;
var Res:RESULT_STRUCTURE;
    LRI:RECORD_INFO_STRUCTURE;
begin
    LRI.DBHANDLE:=db.Handle;
    LRI.TRHANDLE:=tr.Handle;
    LRI.ID_RECORD:=VarArrayOf([1]);
    LRI.TABLE_NAME:='UP_DT_KERNELL_SYS_BLOCK';
    LRI.PK_FIELD_NAME:=VarArrayOf(['BLOCK_FIELD']);
    LRI.RAISE_FLAG:=false;

    Res:=LockRecord(@LRI);

    Result:=Boolean(1-Res.RESULT_CODE);
end;


procedure UpCloseSession(var DB:TpFibDatabase; var TR:TpFibTransaction);
begin
     TR.CloseAllQueryHandles;
     FreeAndNil(DB);
     FreeAndNil(TR);
end;


function UpInitSession(DATA_STRUCTURE:PUP_KERNEL_MODE_STRUCTURE ;var DB:TpFibDatabase; var TR:TpFibTransaction):Boolean;
begin
     DB:=TpFibDatabase.Create(nil);
     DB.SQLDialect:=3;
     TR:=TpFibTransaction.Create(nil);
     DB.DefaultTransaction:=TR;
     DB.Handle:=PUP_KERNEL_MODE_STRUCTURE(DATA_STRUCTURE)^.DBHANDLE;
     TR.Handle:=PUP_KERNEL_MODE_STRUCTURE(DATA_STRUCTURE)^.TRHANDLE;
     Result:=true;
end;

function  UpKernelDo(VAL:PUP_KERNEL_MODE_STRUCTURE):Boolean;
var  KERNEL_SESSION_PROC:TpFibStoredProc;
     KERNEL_SESSION_RESULT:Boolean;
     KERNEL_SESSION_DB:TpFibDatabase;
     KERNEL_SESSION_TR:TpFibTransaction;
     ERRORS_RELOAD_TR:TpFibTransaction;
     ERRORS_RELOAD_SP:TpFibStoredProc;
     GET_KERNEL_ERRORS:TpFibDataSet;
     I:Integer;
begin
     KERNEL_SESSION_RESULT:=false;
     if (VAL<>nil)
     then begin
               //Создание локальных экземпляров классов БД и ТРранзакции
               //через которую происходит вызов процедуры для запуска ядра
               UpInitSession(VAL,KERNEL_SESSION_DB,KERNEL_SESSION_TR);

               //Запускаем обработку данных и добавление данных в
               //в таблицы инструкций
               KERNEL_SESSION_PROC            :=TpFibStoredProc.Create(nil);
               KERNEL_SESSION_PROC.Database   :=KERNEL_SESSION_DB;
               KERNEL_SESSION_PROC.Transaction:=KERNEL_SESSION_TR;

               KERNEL_SESSION_PROC.StoredProcName:='UP_KER_CLEAR_TMP';
               KERNEL_SESSION_PROC.Prepare;
               KERNEL_SESSION_PROC.ParamByName('KEY_SESSION').AsInt64     :=VAL^.KEY_SESSION;
               KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM').AsInt64   :=VAL^.ID_ORDER_ITEM_IN;
               KERNEL_SESSION_PROC.ExecProc;

                // в модулях приказов CHECK_DATA не заполняется, поэтому проверяем данные здесь
               if VarIsNull(Val^.CHECK_DATA) then Val^.CHECK_DATA := 1;
               if ((Val^.CHECK_DATA <> 0) and (Val^.CHECK_DATA <> 2)) then Val^.CHECK_DATA := 1;

               KERNEL_SESSION_PROC.StoredProcName:='UP_KER_DO_ORDER_DATA';
               KERNEL_SESSION_PROC.Prepare;
               KERNEL_SESSION_PROC.ParamByName('KEY_SESSION').AsInt64     :=VAL^.KEY_SESSION;
               KERNEL_SESSION_PROC.ParamByName('ID_ORDER').AsInt64        :=VAL^.ID_ORDER;
               KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM_IN').AsInt64:=VAL^.ID_ORDER_ITEM_IN;
               KERNEL_SESSION_PROC.ParamByName('FILL_INST').Value         :=1; //Заполнение таблицы инструкций
               KERNEL_SESSION_PROC.ParamByName('CHECK_DATA').Value        :=Val^.CHECK_DATA; //Проверка данных
               KERNEL_SESSION_PROC.ParamByName('FILL_MAIN_DATA').Value    :=0; //Изменение информационного пространства
               KERNEL_SESSION_PROC.ParamByName('USE_BUFF_TABLES').Value   :=1; //Данные для проверки беруться из буферных таблиц
               KERNEL_SESSION_PROC.ExecProc;
               KERNEL_SESSION_RESULT:=Boolean(KERNEL_SESSION_PROC.ParamByName('RESULT_KOD').asInteger);

               //Если произошла ошибка то откатываем рабочую транзакцию предварительно
               //перебросив информацию об ошибках, чтобы она была доступна из вне
               if not KERNEL_SESSION_RESULT
               then begin
                         ERRORS_RELOAD_TR:=TpFibTransaction.Create(nil);
                         ERRORS_RELOAD_TR.DefaultDatabase:=KERNEL_SESSION_DB;
                         ERRORS_RELOAD_TR.StartTransaction;

                         ERRORS_RELOAD_SP:=TpFibStoredProc.Create(nil);
                         ERRORS_RELOAD_SP.Database:=KERNEL_SESSION_DB;
                         ERRORS_RELOAD_SP.Transaction:=ERRORS_RELOAD_TR;
                         ERRORS_RELOAD_SP.StoredProcName:='UP_KER_UTILS_RAISE_ERROR_EX';
                         ERRORS_RELOAD_SP.Prepare;

                         GET_KERNEL_ERRORS:=TpFibDataSet.Create(nil);
                         GET_KERNEL_ERRORS.Database:=KERNEL_SESSION_DB;
                         GET_KERNEL_ERRORS.Transaction:=KERNEL_SESSION_TR;
                         GET_KERNEL_ERRORS.SelectSQL.Text:='SELECT distinct * FROM UP_KER_UTILS_GET_ORDER_ERRORS('+IntToStr(VAL^.KEY_SESSION)+','+KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM').asString+')';
                         GET_KERNEL_ERRORS.Open;
                         GET_KERNEL_ERRORS.FetchAll;
                         if (GET_KERNEL_ERRORS.RecordCount>0)
                         then begin
                                   for i:=0 to GET_KERNEL_ERRORS.RecordCount-1 do
                                   begin
                                        ERRORS_RELOAD_SP.ParamByName('KEY_SESSION').AsInt64  :=VAL^.KEY_SESSION;
                                        ERRORS_RELOAD_SP.ParamByName('ID_ORDER_ITEM').AsInt64:=KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM').asInt64;
                                        ERRORS_RELOAD_SP.ParamByName('ID_ERROR').AsInt64     :=StrToInt64(GET_KERNEL_ERRORS.FieldByName('ID_ERROR').AsString);
                                        ERRORS_RELOAD_SP.ParamByName('TN').Value             :=GET_KERNEL_ERRORS.FieldByName('TN').Value;
                                        ERRORS_RELOAD_SP.ParamByName('EXT_STRING').Value     :=GET_KERNEL_ERRORS.FieldByName('EXT_STRING').Value;

                                        ERRORS_RELOAD_SP.ExecProc;
                                   end;
                         end;
                         ERRORS_RELOAD_TR.Commit;

                         KERNEL_SESSION_TR.Rollback;
               end;
               KERNEL_SESSION_PROC.Close;
               KERNEL_SESSION_PROC.Free;

               //Освобождаем ресурсы локальных экземпляров классов БД и Транзакции
               //через которую происходит вызов процедуры для запуска ядра
               UpCloseSession(KERNEL_SESSION_DB,KERNEL_SESSION_TR);
     end;
     UpKernelDo:=KERNEL_SESSION_RESULT;
end;

function  UpKernelDoEx(VAL:PUP_KERNEL_MODE_STRUCTURE):Boolean;
var  KERNEL_SESSION_PROC:TpFibStoredProc;
     KERNEL_SESSION_RESULT:Boolean;
     KERNEL_SESSION_DB:TpFibDatabase;
     KERNEL_SESSION_TR:TpFibTransaction;
     ERRORS_RELOAD_TR:TpFibTransaction;
     ERRORS_RELOAD_SP:TpFibStoredProc;
     GET_KERNEL_ERRORS:TpFibDataSet;
     I:Integer;
begin
     KERNEL_SESSION_RESULT:=false;
     if (VAL<>nil)
     then begin
               //Создание локальных экземпляров классов БД и ТРранзакции
               //через которую происходит вызов процедуры для запуска ядра
               UpInitSession(VAL,KERNEL_SESSION_DB,KERNEL_SESSION_TR);

               //Запускаем обработку данных и добавление данных в
               //в таблицы инструкций
               KERNEL_SESSION_PROC            :=TpFibStoredProc.Create(nil);
               KERNEL_SESSION_PROC.Database   :=KERNEL_SESSION_DB;
               KERNEL_SESSION_PROC.Transaction:=KERNEL_SESSION_TR;

               KERNEL_SESSION_PROC.StoredProcName:='UP_KER_CLEAR_TMP';
               KERNEL_SESSION_PROC.Prepare;
               KERNEL_SESSION_PROC.ParamByName('KEY_SESSION').AsInt64     :=VAL^.KEY_SESSION;
               KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM').AsInt64   :=VAL^.ID_ORDER_ITEM_IN;
               KERNEL_SESSION_PROC.ExecProc;

                // в модулях приказов CHECK_DATA не заполняется, поэтому проверяем данные здесь
               if VarIsNull(Val^.CHECK_DATA) then Val^.CHECK_DATA := 1;
               if ((Val^.CHECK_DATA <> 0) and (Val^.CHECK_DATA <> 2)) then Val^.CHECK_DATA := 1;

               KERNEL_SESSION_PROC.StoredProcName:='UP_KER_DO_ORDER_DATA';
               KERNEL_SESSION_PROC.Prepare;
               KERNEL_SESSION_PROC.ParamByName('KEY_SESSION').AsInt64     :=VAL^.KEY_SESSION;
               KERNEL_SESSION_PROC.ParamByName('ID_ORDER').AsInt64        :=VAL^.ID_ORDER;
               KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM_IN').AsInt64:=VAL^.ID_ORDER_ITEM_IN;
               KERNEL_SESSION_PROC.ParamByName('FILL_INST').Value         :=0; //Заполнение таблицы инструкций
               KERNEL_SESSION_PROC.ParamByName('CHECK_DATA').Value        :=Val^.CHECK_DATA; //Проверка данных
               KERNEL_SESSION_PROC.ParamByName('FILL_MAIN_DATA').Value    :=1; //Изменение информационного пространства
               KERNEL_SESSION_PROC.ParamByName('USE_BUFF_TABLES').Value   :=0; //Данные для проверки беруться из буферных таблиц
               KERNEL_SESSION_PROC.ExecProc;
               KERNEL_SESSION_RESULT:=Boolean(KERNEL_SESSION_PROC.ParamByName('RESULT_KOD').asInteger);

               //Если произошла ошибка то откатываем рабочую транзакцию предварительно
               //перебросив информацию об ошибках, чтобы она была доступна из вне
               if not KERNEL_SESSION_RESULT
               then begin
                         ERRORS_RELOAD_TR:=TpFibTransaction.Create(nil);
                         ERRORS_RELOAD_TR.DefaultDatabase:=KERNEL_SESSION_DB;
                         ERRORS_RELOAD_TR.StartTransaction;

                         ERRORS_RELOAD_SP:=TpFibStoredProc.Create(nil);
                         ERRORS_RELOAD_SP.Database:=KERNEL_SESSION_DB;
                         ERRORS_RELOAD_SP.Transaction:=ERRORS_RELOAD_TR;
                         ERRORS_RELOAD_SP.StoredProcName:='UP_KER_UTILS_RAISE_ERROR_EX';
                         ERRORS_RELOAD_SP.Prepare;

                         GET_KERNEL_ERRORS:=TpFibDataSet.Create(nil);
                         GET_KERNEL_ERRORS.Database:=KERNEL_SESSION_DB;
                         GET_KERNEL_ERRORS.Transaction:=KERNEL_SESSION_TR;
                         GET_KERNEL_ERRORS.SelectSQL.Text:='SELECT distinct * FROM UP_KER_UTILS_GET_ORDER_ERRORS('+IntToStr(VAL^.KEY_SESSION)+','+KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM').asString+')';
                         GET_KERNEL_ERRORS.Open;
                         GET_KERNEL_ERRORS.FetchAll;
                         if (GET_KERNEL_ERRORS.RecordCount>0)
                         then begin
                                   for i:=0 to GET_KERNEL_ERRORS.RecordCount-1 do
                                   begin
                                        ERRORS_RELOAD_SP.ParamByName('KEY_SESSION').AsInt64  :=VAL^.KEY_SESSION;
                                        ERRORS_RELOAD_SP.ParamByName('ID_ORDER_ITEM').AsInt64:=KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM').asInt64;
                                        ERRORS_RELOAD_SP.ParamByName('ID_ERROR').AsInt64     :=StrToInt64(GET_KERNEL_ERRORS.FieldByName('ID_ERROR').AsString);
                                        ERRORS_RELOAD_SP.ParamByName('TN').Value             :=GET_KERNEL_ERRORS.FieldByName('TN').Value;
                                        ERRORS_RELOAD_SP.ParamByName('EXT_STRING').Value     :=GET_KERNEL_ERRORS.FieldByName('EXT_STRING').Value;
                                        ERRORS_RELOAD_SP.ExecProc;
                                   end;
                         end;
                         ERRORS_RELOAD_TR.Commit;

                         KERNEL_SESSION_TR.Rollback;
               end;
               KERNEL_SESSION_PROC.Close;
               KERNEL_SESSION_PROC.Free;

               //Освобождаем ресурсы локальных экземпляров классов БД и Транзакции
               //через которую происходит вызов процедуры для запуска ядра
               UpCloseSession(KERNEL_SESSION_DB,KERNEL_SESSION_TR);
     end;
     UpKernelDoEx:=KERNEL_SESSION_RESULT;
end;



procedure GetUpSessionErrors(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;KEY_SESSION:Int64;id_order_item:Int64);
var LocalDB:TpFibDatabase;
    LocalTR:TpFibTransaction;
    ErrorForm:TfrmGetErrors;
    GetErrorTextsDS:TpFibDataSet;
begin
     LocalDB:=TpFibDatabase.Create(nil);
     LocalDB.SQLDialect:=3;

     LocalTR:=TpFibTransaction.Create(nil);
     LocalTR.DefaultDatabase:=LocalDB;
     LocalDB.DefaultTransaction:=LocalTR;
     LocalDB.Handle:=DbHandle;
     LocalTR.StartTransaction;

     ErrorForm:=TfrmGetErrors.Create(AOwner);

     GetErrorTextsDS:=TpFibDataSet.Create(nil);
     GetErrorTextsDS.Database:=LocalDB;
     GetErrorTextsDS.Transaction:=LocalTR;
     GetErrorTextsDS.SelectSQL.Text:=' SELECT * FROM UP_KER_UTILS_GET_ORDER_ERRORS('
     +IntToStr(KEY_SESSION)+','+IntToStr(ID_ORDER_ITEM)+') ';

     if ErrorForm.ErrorTextsMemoryData.Active
     then ErrorForm.ErrorTextsMemoryData.Close;

     ErrorForm.ErrorTextsMemoryData.CopyStructure(GetErrorTextsDS);
     ErrorForm.ErrorTextsMemoryData.LoadFromDataSet(GetErrorTextsDS,GetErrorTextsDS.RecordCount,lmCopy);

     ErrorForm.ShowModal;
     ErrorForm.Free;

     LocalTR.Commit;
     LocalDB.Close;
end;

function StartHistory(WriteTransaction: TpFIBTransaction; CodeSystem: Integer=10; IdSession : integer=0): Int64;
begin
     Result:=0;
end;




end.
