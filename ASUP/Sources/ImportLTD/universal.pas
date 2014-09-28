unit universal;

interface
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ADODB, Db, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, StdCtrls,
  FIBQuery, pFIBQuery, pFIBStoredProc, Buttons, Halcn6db,variants,crc32,compare;
implementation
  bufferset:THalcyonDataset;

procedure zabor_univer(buffername:string;);
var
field:Tfield;
IniFile : TIniFile;
i,new_id,kol:INTEGER;
fi:file;


LABEL HOME,home1;
begin
MEMO.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ '+ Buffername+' ...');
begin

 APP_PATH:=GetCurrentDir+'\';

if not FileExists(APP_PATH + INI_FNN) then
 BEGIN
    memo.lines.add('Ошибка, файл not_null.ini не существует');
    exit;
 END;
 IniFile     := TIniFile.Create(APP_PATH + INI_FNN);
NO_PARENT:=IniFile.ReadString('sp_podrb', 'NO_PARENT', NO_PARENT);
 L_ID_PODRB := IniFile.ReadString('sp_podrb', 'ID_PODRB', L_ID_PODRB);
 L_ID_Parent := IniFile.ReadString('sp_podrb', 'ID_parent', L_ID_parent);
 L_ID_action := IniFile.ReadString('sp_podrb', 'ID_action', L_ID_action);
 L_PODR_name := IniFile.ReadString('sp_podrb', 'PODR_name', L_PODR_name);
 L_SYSTEM_F:= IniFile.ReadString('main', 'system_f', L_SYSTEM_F);
 L_crc32:= IniFile.ReadString('main', 'crc32', L_crc32);
 IniFile.Free;
end;

halcyonset.Active:=false;
READINIHALC(buffername);
halcyonset.TableName:=DB_PATH;
try
halcyonset.Active:=true;
except
showmessage('не удалось подключить dbf таблицу '+db_path);
exit;
end;
halcyonset.first;
    while not halcyonset.Eof do
        begin
        error:=false;
        try
        halcyonset.RLock;
        except
        memo.Lines.Add(datetimetostr(NOW)+' ошибка, не удалось заблокировать запись в таблице '+DB_PATH);
        error:=true;
        end;
        if (error=true) then
        goto home;
        for i:=0 to  halcyonset.FieldCount-1 do
        begin
	     	fieldName := UpperCase(halcyonset.Fields[i].FieldName);
    		field := halcyonset.Fields.FindField(fieldName);
    		if field <> nil then
            begin
                 val := Bufferset[fieldName];


        //halcyondataset.TranslateASCII:=FALSE;
        {ID_PBKey:=halcyondataset.FieldByName('ID_PBKey').AsString;
        ID_ACTION:=halcyondataset.FieldByName('ID_ACTION').AsString;
        ID_PARENT:=halcyondataset.FieldByName('ID_PARENT').AsString;
        ID_PODRB:=halcyondataset.FieldByName('ID_PODRB').AsString;
        PODR_NAME:=halcyondataset.FieldByName('PODR_NAME').AsString;
        DATE_PROCK:=halcyondataset.FieldByName('DATE_PROCK').AsString;
        TIME_PROCK:=halcyondataset.FieldByName('TIME_PROCK').AsString;
        DATE_PROCB:=halcyondataset.FieldByName('DATE_PROCB').AsString;
        TIME_PROCB:=halcyondataset.FieldByName('TIME_PROCB').AsString;
        SYSTEM_F:=halcyondataset.FieldByName('SYSTEM_F').AsString;
        }
        halcyondataset.TranslateASCII:=false;
        CRC32:=halcyondataset.FieldByName('CRC32').AsString;
        halcyondataset.TranslateASCII:=TRUE;

     //ПРОВЕРКА НА КОРРЕКТНОЕ СЧИТЫВАНИЕ
   s:=' ID_PODRB="'+ID_PODRB+'"';
    s1:=' ID_PARENT="'+ID_PARENT+'"';
    s2:=' PODR_NAME="'+PODR_NAME+'"';
    s3:=' ID_ACTION="'+ID_ACTION+'"';
   { s4:=' DATE_PROCK="'+DATE_PROCK+'"';
    s5:=' TIME_PROCK="'+TIME_PROCK+'"';
    s6:=' DATE_PROCB="'+DATE_PROCB+'"';
    s7:=' TIME_PROCB="'+TIME_PROCB+'"';}
    ///////////////CRC32
  crc_res:=compare.compare_crc32(db_path,strtoint(id_pbkey),crc32,'id_pbkey');
 if (crc_res=false) and(l_crc32='1')
     then
      begin
      memo.Lines.Add(datetimetostr(NOW)+' ошибка CRC32 в таблице SP_PODRB:'+s+s1+s2+s3);
      GOTO HOME;
      end;
    ///////////////


    if (system_f<>l_system_f)
    then
    begin
      memo.Lines.Add(datetimetostr(NOW)+' ошибка SYSTEM_F в таблице SP_PODRB:'+s+s1+s2+s3);
      GOTO HOME;
    end;
    //////////////ПРОВЕРКА НА ПУСТЫЕ ПОЛЯ
    if (L_ID_ACTION='1')and(ID_ACTION='') then
       begin
       memo.Lines.Add(datetimetostr(NOW)+' ошибка, поле ID_ACTION пустое в таблице SP_PODRB:'+s+s1+s2+s3);
       goto home;
       end;

    if (L_ID_PODRB='1')and(ID_PODRB='') then
       begin
       memo.Lines.Add(datetimetostr(NOW)+' ошибка, поле ID_PODRB пустое в таблице SP_PODRB:'+s+s1+s2+s3);
       goto home;
       end;

    if (L_ID_PARENT='1')and(ID_PARENT='') then
       begin
       memo.Lines.Add(datetimetostr(NOW)+' ошибка, поле ID_PARENT пустое в таблице SP_PODRB:'+s+s1+s2+s3);
       goto home;
       end;

    if (strtoint(L_PODR_NAME)=1)and(PODR_NAME='') then
       begin
       memo.Lines.Add(datetimetostr(NOW)+' ошибка, поле PODR_NAME пустое в таблице SP_PODRB:'+s+s1+s2+s3);
       goto home;
       end;

/////////ПРОВЕРКА ID_ACTION
        IF (ID_ACTION<>'1')AND(ID_ACTION<>'2')AND(ID_ACTION<>'3')
           THEN
            begin
              memo.Lines.Add(datetimetostr(NOW)+' ошибка в поле ID_ACTION в таблице SP_PODRB:'+s+s1+s2+s3);
              goto home;
            end;
        //////////
///START ALL UPVCHM TRANSACTIONS
TRY
u_StoredProc.Transaction :=Write_u;
u_StoredProc.Transaction.StartTransaction;


  IF(DATE_PROCB<>'') AND(DATE_PROCK='')and(time_procb<>'')and(time_prock='')
    THEN
     begin
        ////////ПРОВЕРКА НА ПУСТЫЕ ДАТЫ
        begin
          DATE_PROCK:=datetimetostr(DATE);
          TIME_PROCK:=datetimetostr(TIME);
          TIME_PROCK:=copy(TIME_PROCK,11,9);
          if(TIME_PROCK[1]=' ') then
             TIME_PROCK:=copy(TIME_PROCK,2,8)
             else TIME_PROCK:=copy(TIME_PROCK,1,8);
        end;
///////////////////////
//////////////// ADD CUSTOMER TO SHADOW
              u_StoredProc.ExecProcedure('SH_SP_PODRB_INSERT', [ID_PODRB,ID_PARENT,strtoINT(ID_ACTION),PODR_NAME,
                 strtodate(DATE_PROCK),TIME_PROCK,strtodate(DATE_PROCB),TIME_PROCB,SYSTEM_F,CRC32,STRTOINT(ID_SERVER)]);
memo_d.Lines.Add(datetimetostr(NOW)+'  запись успешно добавлена в таблицу  SH_SP_PODRB:'+s+s1+s2+s3);
/////////////write to upvchm/////////////////////////
////////запись в УПВЧМ  при добавлении записи
            if (ID_ACTION='1')THEN
                BEGIN
                u_StoredProc.ExecProcedure('SP_PODRB_INSERT', [STRTOINT(ID_PODRB),PODR_NAME,STRTOINT(ID_PARENT),strtoint(id_server)]);
memo_d.Lines.Add(datetimetostr(NOW)+'  запись успешно добавлена в таблицу  SP_PODRB: id_PODRB='+id_PODRB+'; PODRB_NAME='+PODR_NAME);
                END;   ////END ID_ACTION=1


           if (ID_ACTION='2') THEN
              BEGIN
              u_StoredProc.ExecProcedure('SP_PODRB_UPDATE', [STRTOINT(ID_PODRB),PODR_NAME,STRTOINT(ID_PARENT)]);
memo_d.Lines.Add(datetimetostr(NOW)+'  запись успешно изменена в таблице  SP_PODRB: id_PODRB='+id_PODRB+'; PODR_NAME='+PODR_NAME);
               END;
                //END ID_ACTION=2
if (ID_ACTION='3') THEN
    BEGIN
     u_StoredProc.ExecProcedure('SP_PODRB_DEL', [STRTOINT(ID_PODRB),PODR_NAME,STRTOINT(ID_PARENT)]);
memo_d.Lines.Add(datetimetostr(NOW)+'  запись успешно удалена из таблицы  SP_PODRB: id_PODRB='+id_PODRB+'; PODR__NAME= '+PODR_NAME);
      END;   ////END ID_ACTION=3
///FINISH ALL TRANS
 u_StoredProc.Transaction.Commit;
          halcyondataset.Unlock;
          halcyondataset.Edit;
          halcyondataset.FieldByName('DATE_PROCK').AsString:=DATE_PROCK;
          halcyondataset.FieldByName('TIME_PROCK').AsString:=TIME_PROCK;

///////////
        end
ELSE BEGIN
memo.Lines.Add(datetimetostr(NOW)+' ошибка в таблице SP_PODRB, запись не удовлетворяет начальным условиям обработки :'+s+s1+s2+s3+s4+s5+s6+s7);
END;
EXCEPT
memo.Lines.Add(datetimetostr(NOW)+'  запись не удалось обработать:'+s+s1+s2+s3);
END;
HOME:
if not(halcyondataset.Eof) then
    halcyondataset.Next;
  end;
MEMO.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ SP_PODRB ЗАВЕРШЕНА.');
MEMO.Lines.Add(' ');
end;

initialization
  bufferset:=THalcyondataset.Create(nil);


finalization
   bufferset.free;
end.
