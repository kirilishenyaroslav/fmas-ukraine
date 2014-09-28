unit uCS_Kernel;
interface
uses Classes, IBase, uCs_Types, SysUtils, pFIBDatabase,pFibStoredProc,pFibDataSet;



procedure CSCloseSession(var DB:TpFibDatabase; var TR:TpFibTransaction);
function CSKernelDo(Param:TCSKernelMode):Boolean;
function CSInitSession(Param:TCSKernelMode; var DB:TpFibDatabase; var TR:TpFibTransaction):Boolean;
implementation                  

function CSInitSession(Param:TCSKernelMode; var DB:TpFibDatabase; var TR:TpFibTransaction):Boolean;
begin
     DB:=TpFibDatabase.Create(nil);
     DB.SQLDialect:=3;
     TR:=TpFibTransaction.Create(nil);
     DB.DefaultTransaction:=TR;
     DB.Handle:=Param.DB_Handle;
     TR.Handle:=Param.TR_HANDLE;
     Result:=true;
end;

procedure CSCloseSession(var DB:TpFibDatabase; var TR:TpFibTransaction);
begin
     TR.CloseAllQueryHandles;
     FreeAndNil(DB);
     FreeAndNil(TR);
end;

function CSKernelDo(Param:TCSKernelMode):Boolean;
var  KERNEL_SESSION_PROC:TpFibStoredProc;
     KERNEL_SESSION_RESULT:Boolean;
     KERNEL_SESSION_DB:TpFibDatabase;
     KERNEL_SESSION_TR:TpFibTransaction;
     ERRORS_RELOAD_TR:TpFibTransaction;
     ERRORS_RELOAD_SP:TpFibStoredProc;
     GET_KERNEL_ERRORS:TpFibDataSet;
     I:Integer;
begin
     //KERNEL_SESSION_RESULT:=false;
     if (Param<>nil)
     then begin
               //Создание локальных экземпляров классов БД и ТРранзакции
               //через которую происходит вызов процедуры для запуска ядра
               CSInitSession(Param,KERNEL_SESSION_DB,KERNEL_SESSION_TR);

               //Запускаем обработку данных и добавление данных в
               //в таблицы инструкций
               KERNEL_SESSION_PROC            :=TpFibStoredProc.Create(nil);
               KERNEL_SESSION_PROC.Database   :=KERNEL_SESSION_DB;
               KERNEL_SESSION_PROC.Transaction:=KERNEL_SESSION_TR;

//галя разберется
               {
               KERNEL_SESSION_PROC.StoredProcName:='UP_KER_CLEAR_TMP';
               KERNEL_SESSION_PROC.Prepare;
               KERNEL_SESSION_PROC.ParamByName('KEY_SESSION').AsInt64     :=VAL^.KEY_SESSION;
               KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM').AsInt64   :=VAL^.ID_ORDER_ITEM_IN;
               KERNEL_SESSION_PROC.ExecProc;
               }

//галя разберется почему статические данные юзаются
               KERNEL_SESSION_PROC.StoredProcName:='CS_KER_DO_ORDER_DATA';
               KERNEL_SESSION_PROC.Prepare;
               //KERNEL_SESSION_PROC.ParamByName('ID_SESSION').AsInt64      :=Param.ID_SESSION;
               KERNEL_SESSION_PROC.ParamByName('ID_ORDER').AsInt64        :=Param.ID_ORDER;
               KERNEL_SESSION_PROC.ParamByName('ID_ITEM_IN').AsInt64      :=Param.ID_ORDER_ITEM_IN;
               //KERNEL_SESSION_PROC.ParamByName('FILL_INST').Value         :=1; //Заполнение таблицы инструкций
               KERNEL_SESSION_PROC.ParamByName('CHECK_DATA').Value        :=1; //Проверка данных
               KERNEL_SESSION_PROC.ParamByName('FILL_MAIN_DATA').Value    :=1; //Изменение информационного пространства
//не используется в КС    KERNEL_SESSION_PROC.ParamByName('USE_BUFF_TABLES').Value   :=1; //Данные для проверки беруться из буферных таблиц
               KERNEL_SESSION_PROC.ExecProc;
               KERNEL_SESSION_RESULT:=Boolean(KERNEL_SESSION_PROC.ParamByName('RESULT_KOD').asInteger);

//галя разберется
               if not KERNEL_SESSION_RESULT then KERNEL_SESSION_TR.Rollback;
               {
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
                                        ERRORS_RELOAD_SP.ParamByName('KEY_SESSION').AsInt64  :=Param.KEY_SESSION;
                                        ERRORS_RELOAD_SP.ParamByName('ID_ORDER_ITEM').AsInt64:=KERNEL_SESSION_PROC.ParamByName('ID_ORDER_ITEM').asInt64;
                                        ERRORS_RELOAD_SP.ParamByName('ID_ERROR').AsInt64     :=StrToInt64(GET_KERNEL_ERRORS.FieldByName('ID_ERROR').AsString);
                                        ERRORS_RELOAD_SP.ParamByName('TN').Value             :=GET_KERNEL_ERRORS.FieldByName('TN').Value;
                                        ERRORS_RELOAD_SP.ParamByName('EXT_STRING').Value     :=GET_KERNEL_ERRORS.FieldByName('EXT_STRING').Value;

                                        ERRORS_RELOAD_SP.ExecProc;
                                   end;
                         end;
                         ERRORS_RELOAD_TR.Commit;

                         KERNEL_SESSION_TR.Rollback;
               end;     }
               KERNEL_SESSION_PROC.Close;
               KERNEL_SESSION_PROC.Free;

               //Освобождаем ресурсы локальных экземпляров классов БД и Транзакции
               //через которую происходит вызов процедуры для запуска ядра
               CSCloseSession(KERNEL_SESSION_DB,KERNEL_SESSION_TR);
     end;
     CSKernelDo:=KERNEL_SESSION_RESULT;
end;

end.
