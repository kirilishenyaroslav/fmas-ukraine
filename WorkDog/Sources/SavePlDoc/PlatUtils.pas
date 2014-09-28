unit PlatUtils;
{*******************************************************************************
* PlatUtils                                                                    *
*                                                                              *
* Сохранение платежки                                                          *
* Copyright ©  2004, Бурмистрова Е.                                            *
*******************************************************************************}


interface
uses Windows,IB_Externals, FIBDataSet, pFIBDataSet,cxContainer, cxLabel, cxCheckBox,
     FIBQuery, pFIBQuery, pFIBStoredProc, cxCalendar, Variants,pFIBDatabase,FIBDatabase,
     uBuffer, uCommonDB,  SysUtils, Dialogs, Controls, SumPropis,
     DogLoaderUnit, Classes, StrUtils,uFIBCommonDB,Halcn6db;

//public
function SavePlDoc(pFIBDataSet_work_dog : TpFIBDataSet; Database : PVOID; TransHandle : PVOID; id_dog: Variant; Data_pl:TDate;num_pl : integer) : integer;stdcall;
exports SavePlDoc;

procedure PlNoteSh1();
procedure PlNoteSh5();
procedure Kekv();
procedure SaveToTxt();
procedure SaveUkrsots();
procedure SaveToTxtUSB(StrList:TStringList; path:String;name_dbf:String);
function MakeNote(const s : string) : string;

function SavePl(pFIBDataSet_work_dog : TpFIBDataSet; Database : PVOID; TransHandle : PVOID; id_dog: Variant; Data_pl:TDate;num_pl : integer) : integer;

var
  note_pl                  : String;
  str_dog_note             : String;//основание договора
  str_ostatok              : String;//all-основание договора
  kol_vo_dog_note          : Integer; //кол-во символов основания договора, к-е можно записать в платежку
  sum_today                : Currency; //Сумма к оплате
  summa                    : Currency; //Сумма договора
  sum_sm_pl                : Currency; //Сумма сметы под договором
  sum_sm_dog               : Currency; //Сумма сметы под платежкой
  id_key                   : Variant;
  id_key_shapka            : Variant; //id_key шапки платежки
  cht                      : Variant;
  DataSet                  : TpFIBDataSet;
  DataSet_work_dog         : TpFIBDataSet;
  s, s1, s_pl_buff         : String;
  sum_smet                 : Currency; //Общая сумма смет под платежкой после разбивки(проверка на округление) id_key
  sum_pl                   : Currency; //Сумма платежки по id_key
  sum_mistake              : Currency; //Сумма ошибки округления
  max_sum_smet_pl          : Currency; //Мах сумма платежки по id_key (куда добавлять) sum_mistake;
  Nlength                  : Integer;
  sum_nds, s_nds, s_nds_pay: Currency; //НДС из договора
  sum_nds_pl               : Currency; //НДС платежки
  str_nds                  : String;
  pFIBTransactionWrite     : TpFIBTransaction;
  pFIBStoredProc_work_dog  : TpFIBStoredProc;
  lDatabase                : TpfibDataBase;
  name_dbf                 : String;
  nomer_pl                 : Integer;
   //DataSet для дублирующей таблицы
  DataSet_pl_buff          : TpFIBDataSet;
  Date_platejki            : TDate;
  p_id_dog                 : Variant;
  add_kekv                 : String;
  pay_all                  : String;//в основание платежа добавлять ОПЛАЧ. ПОЛН.
  payed_all                : string;
  kpk                      : string;
  DataSetChermet           : TpFIBDataSet; // для отбора через relation
  name_dbf_buff: String;
  F:TextFile;
  FTemp:TextFile;
  TempStr:String;
  date_conv : String;
implementation

uses Math, DB,GlobalSpr;

function ConvertI(const s : string) : string;
var
 i : integer;
begin
 Result := s;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  if s[i] = #178 then Result[i] := #73;
  if s[i] = #179 then Result[i] := #105;
 end;
end;

function Win2Dos(const s : string) : string;
var
 tmp : string;
begin
 SetLength(Result, 255);
 AnsiToOem(PAnsiChar(s), @Result[1]);
 tmp := StrPas(@Result[1]);
 Result := tmp;
end;

function SavePlDoc(pFIBDataSet_work_dog : TpFIBDataSet; Database : PVOID; TransHandle : PVOID; id_dog: Variant; Data_pl:TDate; num_pl : integer) : integer;
begin

  Result := SavePl(pFIBDataSet_work_dog, Database, TransHandle, id_dog, data_pl, num_pl);
end;


//TODO 1 -oBoss: Resolve must fix bug
function SavePl(pFIBDataSet_work_dog : TpFIBDataSet; Database : PVOID; TransHandle : PVOID; id_dog: Variant; Data_pl:TDate; num_pl : integer) : integer;
var
  i, r: Integer;
  StrList : TStringList;
  Str:String;
  RateAcc:Int64;
  n_plat: Integer; //номер платежки
  id_shab: Variant; //для формирования основания платежа (1-счет-фактура, 5-другие)
  sum_plat: Variant; //сумма платежки
  // центр связи с базой данных :)
  DB: TDBCenter;
  // директория, где лежат dbf
  DBF_PATH: String;
  // компонент по записи в dbf
  BufTran: TBufferTransaction;
  Id_PBKey: Integer;
  transaction_pl: TpFIBTransaction;
  progSave: String;
  DataSet_rate: TpFIBDataSet;
  s_rate: String;
  ip_adress, comp_name: String;
  //переменные для буфера ПУМБа;
  bname: String;
  //переменные для буфера Эксимбанка;
  s_bank, s_bankU, s_name, s_nameU, r_name, r_nameU, r_bank, r_bankU: String;
  DatasetForGenId_PbKey:TpFIBDataSet;
  DataSetBuffRel :TpFIBDataSet;
  TempDataset    :TpFIBDataSet;
  hFileLink      : TextFile;

  name_format    : string;
  tmp_id_format  : string;
  id_key_lgh     : Integer;

  indexof_point  : Integer;
  tmp_summ       : string;

  alias_buff     : string;
  PAYED_ALL      : string;

  tmp_date_pl : string;
  new_date_pl : string;
  count_a_b : int64;
  myYear, myMonth, myDay : Word;
  HalcyonDataSet1: THalcyonDataSet;


begin
 Result := 0;
 HalcyonDataSet1:=THalcyonDataSet.Create(Nil);


   //создание объектов
  lDatabase := TpfibDataBase.Create(nil);

  DataSet          := TpFIBDataSet.Create(Nil);
  DataSet_work_dog := TpFIBDataSet.Create(Nil);
  DataSet_pl_buff  := TpFIBDataSet.Create(Nil);

        // создать нужный объект доступа к БД
        //M!!
  DB :=  FIBCreateDBCenter(Database);
//           DB:=
  p_id_dog := id_dog;
  Date_platejki := Data_pl;
  pFIBTransactionWrite := DB.WriteTransaction.NativeTransaction as TpFIBTransaction;
  pFIBTransactionWrite.Handle := TransHandle;
  pFIBStoredProc_work_dog := TpFIBStoredProc.Create(nil);
  lDatabase.SQLDialect := 3;
  lDatabase.Handle := Database;

  DataSet.Database := pFIBTransactionWrite.DefaultDatabase;
  DataSet.Transaction := pFIBTransactionWrite;
  DataSet_work_dog.Database := pFIBTransactionWrite.DefaultDatabase;
  DataSet_work_dog.Transaction := pFIBTransactionWrite;
  DataSet_pl_buff.Database := pFIBTransactionWrite.DefaultDatabase;
  DataSet_pl_buff.Transaction := pFIBTransactionWrite;

  nomer_pl := num_pl;
  {Данные для записи в дублирующий буфер}
   DataSet_pl_buff.Active := false;
   s_pl_buff := 'select * from dog_dt_plat_select(:id_dog)';
   DataSet_pl_buff.SQLs.SelectSQL.Clear;
   DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
   DataSet_pl_buff.ParamByName('ID_DOG').AsInt64 := id_dog;
   DataSet_pl_buff.Active := true;

   progSave := DataSet_pl_buff.FieldByName('PROG_SAVE').asString;
   pay_all  := DataSet_pl_buff.FieldByName('PAY_ALL').asString;
   PAYED_ALL := DataSet_pl_buff.FieldByName('PAYED_ALL').asString;
   kpk := DataSet_pl_buff.FieldByName('KPK').asString;
   alias_buff := DataSet_pl_buff.FieldByName('ALIAS_BUFF').asString;

   if kpk <> '' then kpk := '' + kpk;

   if not VarIsNull(DataSet_pl_buff.FieldByName('path_buff').Value)
   then
     begin
       name_dbf := DataSet_pl_buff.FieldByName('path_buff').asString;
     end
     else
     begin
       name_dbf := 'none';
     end;

//    if DirectoryExists(name_dbf)<>true then
//     begin
//       ShowMessage('Не знайдено буфер!');
//       exit;
//     end;

     BufTran := TBufferTransaction.Create(DB, name_dbf);

     if  VarIsNull(DataSet_pl_buff.FieldByName('path_buff').Value) then
     begin
      BufTran.DontWriteToDbf := true;
     end;

// откатить все неудачные транзакции, не откаченные в прошлый раз
     if (( alias_buff <> 'Txt')and ( alias_buff <> 'jbkl_snd.dbf'))  then
     begin
       if not BufTran.DontWriteToDbf then BufTran.RollbackAll;
     end;

  {Работа с DataSetWork_dog, отбор данных, необходимых для работы}
  DataSet_work_dog.Active := false;
   s1 := 'SELECT dog_dt_document.*,  pub_sys_data.infinity_date,'+' '+
         'pub_sp_tip_dog.short_name, DOG_INI_SHABLON.ID_SHABLON'+' '+
         'FROM dog_dt_document, pub_sys_data, pub_sp_tip_dog,DOG_INI_SHABLON'+' '+
         'WHERE dog_dt_document.use_end=pub_sys_data.infinity_date'+' '+
         'AND dog_dt_document.id_tip_dog=pub_sp_tip_dog.id_tip_dog'+' '+
         'AND pub_sp_tip_dog.ID_INI_SHABLON=DOG_INI_SHABLON.ID_INI_SHABLON'+' '+
         'AND dog_dt_document.id_dog=:param_id_dog;';

  DataSet_work_dog.SQLs.SelectSQL.Clear;
  DataSet_work_dog.SQLs.SelectSQL.Add(s1);
  DataSet_work_dog.ParamByName('param_id_dog').AsInt64 := id_dog;
  DataSet_work_dog.Active := true;

  id_shab := DataSet_work_dog.FieldByName('id_shablon').AsVariant;

  s := 'select *  from   dog_dt_smet_dog where  dog_dt_smet_dog.id_dog=:param_id_dog';
  DataSet.SQLs.SelectSQL.Clear;
  DataSet.SQLs.SelectSQL.Add(s);
  DataSet.Active := false;
  DataSet.ParamByName('param_id_dog').AsInt64 := id_dog;
  DataSet.Active := true;

/////////////////////////////////////////////////////////////////////////////////////////
  summa := DataSet_work_dog.FieldByName('summa').AsVariant - DataSet_work_dog.FieldByName('sum_pay').AsVariant;
  sum_today := DataSet_work_dog.FieldByName('sum_today').AsVariant;

  if sum_today < 0 then
  begin
    Exit;
  end;

  cht := sum_today / summa;

  {Найдем НДС платежки}
  if DataSet_work_dog.FieldByName('nds_sum').AsVariant <= 0 then
  s_nds := 0 else
  s_nds := DataSet_work_dog.FieldByName('nds_sum').AsVariant;

  if DataSet_work_dog.FieldByName('nds_pay').AsVariant <= 0 then
  s_nds_pay := 0 else
  s_nds_pay := DataSet_work_dog.FieldByName('nds_pay').AsVariant;

  if s_nds = 0 then sum_nds_pl := 0 else
  begin
    sum_nds := s_nds - s_nds_pay;
    sum_nds_pl := RoundTo(cht*sum_nds,-2);
  end;

/////////////Формирование строки основания платежки/////////////////////////////
   //Формирование ндс
   if sum_nds_pl = 0 then
   begin
     str_nds := 'без ПДВ';
   end
   else
   begin
     str_nds := 'в т.ч. ПДВ'+' '+ FormatFloat('0.00', sum_nds_pl) + 'грн.';
   end;

   if id_shab = 1 then
   begin
     PlNoteSh1(); //для шаблона 1
   end;

   if id_shab = 6 then
   begin
     PlNoteSh5(); //для шаблона 3
   end;

   if id_shab = 5 then
   begin
     PlNoteSh5(); //для шаблона 5
   end;

   if id_shab = 12 then
   begin
     PlNoteSh5(); //для шаблона 10
   end;

   if id_shab = 7 then
   begin
     PlNoteSh5(); //для предоплаты
   end;

////// начало процесса добавления///////////////////////////////////////////////
  {сохранение шапки платежки}
 if not BufTran.DontWriteToDbf then BufTran.Start;

 try
  pFIBStoredProc_work_dog.Database := pFIBTransactionWrite.DefaultDatabase;

  pFIBStoredProc_work_dog.Transaction := pFIBTransactionWrite;

  ip_adress:=Trim(GetIPAddress);

  comp_name:=GlobalSpr.GetComputerNetName;



  if Length(Trim(note_pl)) > 160 then
  begin
    ShowMessage('Підстава буде урізана тому що вона перевищує 160 символів.');
    note_pl := Copy(Trim(note_pl), 1, 160);
  end;

  pFIBStoredProc_work_dog.StoredProcName := 'DOG_DT_PL_DOC_INSERT';
  pFIBStoredProc_work_dog.Prepare;
  pFIBStoredProc_work_dog.ParamByName('ID_DOG').AsInt64 := id_dog;
  pFIBStoredProc_work_dog.ParamByName('NOTE').Value := Trim(note_pl);
  pFIBStoredProc_work_dog.ParamByName('NDS').Value := sum_nds_pl;
  pFIBStoredProc_work_dog.ParamByName('DATE_PL').Value := Data_pl;
  pFIBStoredProc_work_dog.ParamByName('NOMER_PL').Value := nomer_pl;
  pFIBStoredProc_work_dog.ParamByName('ID_USER').Value := SYS_ID_USER;
  pFIBStoredProc_work_dog.ParamByName('IP_COMP').Value := ip_adress;
  pFIBStoredProc_work_dog.ParamByName('COMP_NAME').Value :=comp_name;
  pFIBStoredProc_work_dog.ExecProc;

  id_key_shapka := pFIBStoredProc_work_dog.FieldByName('V_ID_KEY_SHAPKA').AsVariant;
  sum_plat := pFIBStoredProc_work_dog.FieldByName('P_SUM_TODAY').AsVariant;

  {сохранение смет под платежкой}
  DataSet.FetchAll;
  DataSet.First;

  for i := 0 to DataSet.RecordCount-1 do
  begin
    sum_sm_dog := DataSet.FieldByName('summa').AsVariant;
    sum_sm_pl := cht*sum_sm_dog;
    //добавление в таблицу dog_dt_pl_smet
    pFIBStoredProc_work_dog.StoredProcName := 'DOG_DT_PL_SMET_INSERT';
    pFIBStoredProc_work_dog.Prepare;

    pFIBStoredProc_work_dog.ParamByName('D_ID_KEY').Value := id_key_shapka;
    pFIBStoredProc_work_dog.ParamByName('D_SUMMA').Value := sum_sm_pl;
    pFIBStoredProc_work_dog.ParamByName('D_ID_SMETA').Value := DataSet.FieldByName('id_smeta').AsVariant;
    pFIBStoredProc_work_dog.ParamByName('D_ID_RAZD').Value := DataSet.FieldByName('id_razd').AsVariant;
    pFIBStoredProc_work_dog.ParamByName('D_ID_STAT').Value := DataSet.FieldByName('id_stat').AsVariant;
    pFIBStoredProc_work_dog.ParamByName('D_ID_KEKV').Value := DataSet.FieldByName('id_kekv').AsVariant;
    if VarIsNull(DataSet.FieldByName('ID_DOG_BANKCARD').Value) then
        pFIBStoredProc_work_dog.ParamByName('D_ID_DOG_BANKCARD').Value := Null
          else
        pFIBStoredProc_work_dog.ParamByName('D_ID_DOG_BANKCARD').AsInt64 := TFIBBCDField(DataSet.FieldByName('ID_DOG_BANKCARD')).AsInt64;
    if DataSet.FieldByName('id_people').AsVariant = Null then
    pFIBStoredProc_work_dog.ParamByName('D_ID_PEOPLE').Value := -1 else
    pFIBStoredProc_work_dog.ParamByName('D_ID_PEOPLE').Value := DataSet.FieldByName('id_people').AsVariant;

    pFIBStoredProc_work_dog.ExecProc;

    //конец добавления
    DataSet.Next;
  end;

  pFIBStoredProc_work_dog.StoredProcName := 'DOG_DT_PL_SUM_MISTAKE';
  pFIBStoredProc_work_dog.Prepare;
  pFIBStoredProc_work_dog.ParamByName('D_ID_KEY_SHAPKA').Value := id_key_shapka;
  pFIBStoredProc_work_dog.ExecProc;
   // вычитаем из смет dog_dt_smet_dog сумму смет платежек
  pFIBStoredProc_work_dog.StoredProcName := 'DOG_PL_UPDATE_SMET_DOG';
  pFIBStoredProc_work_dog.Prepare;
  pFIBStoredProc_work_dog.ParamByName('ID_KEY').Value := id_key_shapka;
  pFIBStoredProc_work_dog.ExecProc;

  //Обновляется номер платежного поручения
  pFIBStoredProc_work_dog.StoredProcName := 'DOG_PL_INI_UPDATE';
  pFIBStoredProc_work_dog.Prepare;
  pFIBStoredProc_work_dog.ParamByName('NOMER_PL').Value := nomer_pl;
  pFIBStoredProc_work_dog.ExecProc;

  //Обновляется суммы у родителя(если он есть)
  pFIBStoredProc_work_dog.StoredProcName := 'DOG_DT_UPD_PARENT';
  pFIBStoredProc_work_dog.Prepare;
  pFIBStoredProc_work_dog.ParamByName('ID_DOG').AsInt64 := id_dog;
  pFIBStoredProc_work_dog.ParamByName('NDS_PL').Value := sum_nds_pl;
  pFIBStoredProc_work_dog.ParamByName('SUM_PL').Value := sum_plat;
  pFIBStoredProc_work_dog.ExecProc;
/////////////////////конец добавленея///////////////////////////////////////////


///////////////////// ---> начинаем запись в dbf////////////////////////////////

    // добавляем запись для возможного отката, получаем ID_PBKey
    // <= имя dbf, имя дублирующего буфера в Firebird => ID_PBKey



    if name_dbf <> 'none' then begin

///////////////////// сейчас запишем в дублирующий буфер в интербейзе...////////
        // главное - присвоить нужную транзакцию
         {
          1. Номер строки в файле (Начиная с 1)
          2. Статус документа (всегда 0)
          3. Дебет МФО
          4. Дебет счет
          5. Дебет ОКПО
          6. Кредит МФО
          7. Кредит счет
          8. Кредит ОКПО
          9. Дата документа (ДД.ММ.ГГГГ)
          10. Номер документа
          11. Название плательщика
          12. Название получателя
          13. Сумма документа
          14. Дата акцепта (не заполняется)
          15. Назначение платежа
         }

        if (progSave='SaveToUSBTxt')then
        begin
         //   Сохраняем Текстовый файл Для USB
         //ShowMessage('# name_dbf='+name_dbf+'C_Epd.txt'+#13#10+'name_dbf_buff='+name_dbf_buff);

         DatasetForGenId_PbKey:=TpFIBDataSet.Create(nil);
         DatasetForGenId_PbKey.Database := pFIBTransactionWrite.DefaultDatabase;
         DatasetForGenId_PbKey.Transaction := pFIBTransactionWrite;
         DatasetForGenId_PbKey.Active:=false;
         DatasetForGenId_PbKey.SelectSQL.Text:='select max(Id_PbKey) from BUFF_DOG_USB';
         DatasetForGenId_PbKey.Active:=true;

         Id_PBKey :=DatasetForGenId_PbKey.FieldByName('MAX').AsInteger;
        {**********************************************************************}

          pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
          pFIBStoredProc_work_dog.Transaction.Active:=true;
          pFIBStoredProc_work_dog.Database.Handle := Database;

          DataSet_pl_buff.Active := false;

          s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
          DataSet_pl_buff.Prepare;
          DataSet_pl_buff.SQLs.SelectSQL.Clear;
          DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
          DataSet_pl_buff.Active := true;
          pFIBStoredProc_work_dog.StoredProcName := 'BUFF_DOG_USB_INSERT';
          pFIBStoredProc_work_dog.Prepare;
          {
           ID_PBKEY NUMERIC(16,0),
           MFO VARCHAR(15),
           KL_OKP VARCHAR(15),
           KL_CHK VARCHAR(35),
           MFO_K VARCHAR(15),
           KL_NM_K VARCHAR(50),
           KL_OKP_K VARCHAR(15),
           KL_CHK_K VARCHAR(35),
           ND VARCHAR(15),
           DK NUMERIC(1,0),
           S VARCHAR(22),
           DATA DATE,
           DATA_S DATE,
           N_P VARCHAR(160)
          }
         pFIBStoredProc_work_dog.ParamByName('Id_PBKey').Value := Id_PBKey;
         Str:=IntTostr(DataSet_pl_buff.FieldByName('MFO_B').Asinteger);
         pFIBStoredProc_work_dog.ParamByName('MFO').AsString :=Str;
         //#
         pFIBStoredProc_work_dog.ParamByName('KL_CHK').AsString :=DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
         pFIBStoredProc_work_dog.ParamByName('KL_OKP').AsString :=DataSet_pl_buff.FieldByName('OKPO2_B').AsString;
         pFIBStoredProc_work_dog.ParamByName('MFO_K').AsString :=DataSet_pl_buff.FieldByName('MFO_A').AsString;
         pFIBStoredProc_work_dog.ParamByName('KL_CHK_K').AsString := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;
         pFIBStoredProc_work_dog.ParamByName('KL_OKP_K').AsString :=DataSet_pl_buff.FieldByName('OKPO1_A').AsString;
         pFIBStoredProc_work_dog.ParamByName('KL_NM_K').AsString :=Copy(DataSet_pl_buff.FieldByName('NAME_A').AsString,1,35);
          //  Для платежей всегда 1
         pFIBStoredProc_work_dog.ParamByName('DK').AsInt64  :=1;
         pFIBStoredProc_work_dog.ParamByName('ND').AsString :=IntToStr(nomer_pl);
         pFIBStoredProc_work_dog.ParamByName('DATA').AsDate  :=data_pl;
         pFIBStoredProc_work_dog.ParamByName('S').Value := FloatToStr(sum_today);
          // какой должна быть дата операции ? ?
         pFIBStoredProc_work_dog.ParamByName('DATA_S').AsDate :=Now;
         pFIBStoredProc_work_dog.ParamByName('N_P').AsString :=note_pl;
          pFIBStoredProc_work_dog.ExecProc;

//     showmessage('point 2');
          pFIBStoredProc_work_dog.Transaction.Commit;
//     showmessage('point 3');

          DataSet_pl_buff.Active := false;
          s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
          DataSet_pl_buff.Prepare;
          DataSet_pl_buff.SQLs.SelectSQL.Clear;
          DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
          DataSet_pl_buff.Active := true;

          s_pl_buff:='|0|';
          s_pl_buff:=s_pl_buff+DataSet_pl_buff.FieldByName('MFO_B').AsString+'|';
          s_pl_buff:=s_pl_buff+DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString+'|';
          s_pl_buff:=s_pl_buff+DataSet_pl_buff.FieldByName('OKPO2_B').AsString+'|';
          s_pl_buff:=s_pl_buff+DataSet_pl_buff.FieldByName('MFO_A').AsString+'|';
          s_pl_buff:=s_pl_buff+DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString+'|';
          s_pl_buff:=s_pl_buff+DataSet_pl_buff.FieldByName('OKPO1_A').AsString+'|';
          s_pl_buff:=s_pl_buff+DateToStr(data_pl)+'|';
          s_pl_buff:=s_pl_buff+IntToStr(nomer_pl)+'|';
          s_pl_buff:=s_pl_buff+DataSet_pl_buff.FieldByName('NAME_B').AsString+'|';
          s_pl_buff:=s_pl_buff+DataSet_pl_buff.FieldByName('NAME_A').AsString+'|';
          s_pl_buff:=s_pl_buff+FloatToStr(sum_today)+'|';
          s_pl_buff:=s_pl_buff+ '|';
          s_pl_buff:=s_pl_buff+note_pl;

          Str:='';
          AssignFile(F,name_dbf+'\c_epd.txt');
          Reset(F);
          while not Eof(F) do
          begin
           Readln(F,Str);
          end;
          CloseFile(F);
          TempStr:='';
          for i:=1 to Length(Str) do
          begin
              if (Str[i]='|')then
              begin
                  Break;
              end
              else
              begin
                 TempStr:=TempStr+Str[i];
              end;
          end;

          if TempStr<>'' then
          begin
           i:=StrToInt(TempStr);
           Inc(i);
          end
          else
          begin
           i:=1;
          end;
         AssignFile(FTemp,name_dbf+'\C_Epd.txt');
         Append(FTemp);
         s_pl_buff:=IntToStr(i)+s_pl_buff;
         WriteLn(FTemp,s_pl_buff);
         CloseFile(FTemp);
          //// записали, теперь пишем уже из дубл. буфера в dbf////////////////////////
          // записываем из буфера в Firebird в DBF по Id_PBKey
          // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey

        {**********************************************************************}
        end;

        if (progSave='SaveToUSB') then
        begin
        // Tatarinov 10.02.2007
        {   ID_PBKEY NUMERIC(16,0),
            Date_doc Date,
            NUM_DOG varchar(10),
            Amount numeric(12,2),
            CLN_NAME varchar(40),
            CLN_OKPO varchar(10),
            CLN_ACCOUNT varchar(14),
            CLN_BANK_MFO varchar(6),
            RCPT_NAME varchar(40),
            RCPT_OKPO varchar(10),
            RCPT_ACCOUNT varchar(14),
            RCPT_BANK_MFO varchar(6),
            PAYMENT_DETAILS varchar(160),
            VALUE_DATE Date
                  }
                // Id_PBKey := BufTran.AddRecord('U_S_B', 'BUFF_DOG_USB');
          {********************************************************************}
                pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
                pFIBStoredProc_work_dog.Transaction.Active:=true;
                pFIBStoredProc_work_dog.Database.Handle := Database;

                DataSet_pl_buff.Active := false;

                s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
                DataSet_pl_buff.Prepare;
                DataSet_pl_buff.SQLs.SelectSQL.Clear;
                DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
                DataSet_pl_buff.Active := true;
                pFIBStoredProc_work_dog.StoredProcName := 'BUFF_DOG_USB_INSERT';
                pFIBStoredProc_work_dog.Prepare;

                DatasetForGenId_PbKey:=TpFIBDataSet.Create(nil);
                DatasetForGenId_PbKey.Database := pFIBTransactionWrite.DefaultDatabase;
                DatasetForGenId_PbKey.Transaction := pFIBTransactionWrite;
                DatasetForGenId_PbKey.Active:=false;
                DatasetForGenId_PbKey.SelectSQL.Text:='select max(Id_PbKey) from BUFF_DOG_USB';
                DatasetForGenId_PbKey.Active:=true;

                Id_PBKey :=DatasetForGenId_PbKey.FieldByName('MAX').AsInteger;

                pFIBStoredProc_work_dog.ParamByName('Id_PBKey').Value := Id_PBKey;

(*                StrList:=TStringList.Create;
                StrList.Add('DATE_DOC='+DateToStr(data_pl));
                StrList.Add('NUM_DOC='+ IntToStr(nomer_pl));
                StrList.Add('AMOUNT='+FloatToStr(sum_today));
                StrList.Add('CLN_NAME='+DataSet_pl_buff.FieldByName('NAME_A').AsString);
                StrList.Add('CLN_OKPO='+DataSet_pl_buff.FieldByName('OKPO1_A').AsString);
                StrList.Add('CLN_ACCOUNT='+DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString);
                StrList.Add('CLN_BANK_MFO='+DataSet_pl_buff.FieldByName('MFO_A').AsString);

                StrList.Add('RCPT_NAME='+DataSet_pl_buff.FieldByName('NAME_B').AsString);
                StrList.Add('RCPT_OKPO='+DataSet_pl_buff.FieldByName('OKPO2_B').AsString);
                StrList.Add('RCPT_ACCOUNT='+DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString);
                StrList.Add('RCPT_BANK_MFO='+DataSet_pl_buff.FieldByName('MFO_B').AsString);
                StrList.Add('PAYMENT_DETAILS='+note_pl);
                StrList.Add('VALUE_DATE='+DateToStr(Now));

                //ShowMessage('# '+Str);
                DatasetForGenId_PbKey:=TpFIBDataSet.Create(nil);
                DatasetForGenId_PbKey.Database := pFIBTransactionWrite.DefaultDatabase;
                DatasetForGenId_PbKey.Transaction := pFIBTransactionWrite;
                DatasetForGenId_PbKey.Active:=false;
                DatasetForGenId_PbKey.SelectSQL.Text:='select max(Id_PbKey) from BUFF_DOG_USB';
                DatasetForGenId_PbKey.Active:=true;

                Id_PBKey :=DatasetForGenId_PbKey.FieldByName('MAX').AsInteger;

                pFIBStoredProc_work_dog.ParamByName('Id_PBKey').Value :=Id_PBKey;
                pFIBStoredProc_work_dog.ParamByName('Date_DOC').Value :=data_pl;
                pFIBStoredProc_work_dog.ParamByName('NUM_DOG').Value :=nomer_pl;
                pFIBStoredProc_work_dog.ParamByName('Amount').Value :=sum_today;
                pFIBStoredProc_work_dog.ParamByName('CLN_NAME').Value :=DataSet_pl_buff.FieldByName('NAME_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('CLN_OKPO').Value :=DataSet_pl_buff.FieldByName('OKPO1_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('CLN_ACCOUNT').Value :=DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('CLN_BANK_MFO').Value :=DataSet_pl_buff.FieldByName('MFO_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('RCPT_NAME').Value :=DataSet_pl_buff.FieldByName('NAME_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('RCPT_OKPO').Value :=DataSet_pl_buff.FieldByName('OKPO2_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('RCPT_ACCOUNT').Value :=DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('RCPT_BANK_MFO').Value :=DataSet_pl_buff.FieldByName('MFO_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('PAYMENT_DETAILS').Value :=note_pl;
                pFIBStoredProc_work_dog.ParamByName('VALUE_DATE').Value :=Now;
=======*)
                StrList:=TStringList.Create;
                StrList.Add('Date_DOC='+DateToStr(data_pl));
                StrList.Add('NUM_DOG='+ IntToStr(nomer_pl));
                StrList.Add('Amount='+FloatToStr(sum_today));
                StrList.Add('CLN_NAME='+DataSet_pl_buff.FieldByName('NAME_A').AsString);
                StrList.Add('CLN_OKPO='+DataSet_pl_buff.FieldByName('OKPO1_A').AsString);
                StrList.Add('CLN_ACCOUNT='+DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString);
                StrList.Add('CLN_BANK_MFO='+DataSet_pl_buff.FieldByName('MFO_A').AsString);

                StrList.Add('RCPT_NAME='+DataSet_pl_buff.FieldByName('NAME_B').AsString);
                StrList.Add('RCPT_OKPO='+DataSet_pl_buff.FieldByName('OKPO2_B').AsString);
                StrList.Add('RCPT_ACCOUNT='+DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString);
                StrList.Add('RCPT_BANK_MFO='+DataSet_pl_buff.FieldByName('MFO_B').AsString);
                StrList.Add('PAYMENT_DETAILS='+note_pl);
                StrList.Add('VALUE_DATE='+DateToStr(Now));

                //ShowMessage('# '+Str);
                DatasetForGenId_PbKey:=TpFIBDataSet.Create(nil);
                DatasetForGenId_PbKey.Database := pFIBTransactionWrite.DefaultDatabase;
                DatasetForGenId_PbKey.Transaction := pFIBTransactionWrite;
                DatasetForGenId_PbKey.Active:=false;
                DatasetForGenId_PbKey.SelectSQL.Text:='select max(Id_PbKey) from BUFF_DOG_USB';
                DatasetForGenId_PbKey.Active:=true;

                Id_PBKey :=DatasetForGenId_PbKey.FieldByName('MAX').AsInteger;

                pFIBStoredProc_work_dog.ParamByName('Id_PBKey').Value :=Id_PBKey;
                pFIBStoredProc_work_dog.ParamByName('Date_DOC').Value :=data_pl;
                pFIBStoredProc_work_dog.ParamByName('NUM_DOG').Value :=nomer_pl;
                pFIBStoredProc_work_dog.ParamByName('Amount').Value :=sum_today;
                pFIBStoredProc_work_dog.ParamByName('CLN_NAME').Value :=DataSet_pl_buff.FieldByName('NAME_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('CLN_OKPO').Value :=DataSet_pl_buff.FieldByName('OKPO1_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('CLN_ACCOUNT').Value :=DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('CLN_BANK_MFO').Value :=DataSet_pl_buff.FieldByName('MFO_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('RCPT_NAME').Value :=DataSet_pl_buff.FieldByName('NAME_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('RCPT_OKPO').Value :=DataSet_pl_buff.FieldByName('OKPO2_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('RCPT_ACCOUNT').Value :=DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('RCPT_BANK_MFO').Value :=DataSet_pl_buff.FieldByName('MFO_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('PAYMENT_DETAILS').Value :=note_pl;
                pFIBStoredProc_work_dog.ParamByName('VALUE_DATE').Value :=Now;
//-------------
                pFIBStoredProc_work_dog.ExecProc;
                SaveToTxtUSB(StrList,DataSet_pl_buff.FieldByName('path_buff').asstring,DataSet_pl_buff.FieldByName('ALIAS_BUFF').asstring);

//    showmessage('point 4');
                pFIBStoredProc_work_dog.Transaction.Commit;
//    showmessage('point 5');

                //// записали, теперь пишем уже из дубл. буфера в dbf////////////////////////

                // записываем из буфера в Firebird в DBF по Id_PBKey
                // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey

                //BufTran.Write('U_S_B', 'BUFF_DOG_USB', Id_PBKey);
        end;


        {
         Экспорт в укрсиббанк
        }
                                                   
        { Герасименко Роман, экспорт в укрсиббанк. }
        if (progSave='SaveToUkrSibTxt')then
        begin
         //   Сохраняем Текстовый файл Для USB
         //ShowMessage('# name_dbf='+name_dbf+'C_Epd.txt'+#13#10+'name_dbf_buff='+name_dbf_buff);

         DatasetForGenId_PbKey:=TpFIBDataSet.Create(nil);
         DatasetForGenId_PbKey.Database := pFIBTransactionWrite.DefaultDatabase;
         DatasetForGenId_PbKey.Transaction := pFIBTransactionWrite;
         DatasetForGenId_PbKey.Active:=false;
         DatasetForGenId_PbKey.SelectSQL.Text:='select max(Id_PbKey) from BUFF_DOG_USB';
         DatasetForGenId_PbKey.Active:=true;

         Id_PBKey :=DatasetForGenId_PbKey.FieldByName('MAX').AsInteger;
        {**********************************************************************}

         pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
          pFIBStoredProc_work_dog.Transaction.Active:=true;
          pFIBStoredProc_work_dog.Database.Handle := Database;

          DataSet_pl_buff.Active := false;
          s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
          DataSet_pl_buff.Prepare;
          DataSet_pl_buff.SQLs.SelectSQL.Clear;
          DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
          DataSet_pl_buff.Active := true;

          tmp_id_format:=IntToStr(id_key_shapka);
          id_key_lgh:=Length(tmp_id_format)-2;
          delete(tmp_id_format,id_key_lgh,2);

          name_format:=Format('%.5d', [nomer_pl])+tmp_id_format;
          AssignFile(hFileLink,name_dbf+'\'+name_format+'.txt');

          ReWrite(hFileLink);

          WriteLn(hFileLink,'Content-Type=','doc/ua_payment'); //Тип документа
          WriteLn(hFileLink,''); //Тип документа
          WriteLn(hFileLink,'DATE_DOC=',DateToStr(data_pl));           //Дата документа
//          WriteLn(hFileLink,'NUM_DOC=',DataSet_pl_buff.FieldByName('NUM_DOC').AsString);     //Номер документа

          WriteLn(hFileLink,'NUM_DOC=',nomer_pl);
          tmp_summ:=StringReplace(FloatToStrF(sum_today, ffFixed, 8, 2),',','.',[rfReplaceAll]);

          WriteLn(hFileLink,'AMOUNT=',tmp_summ);
          WriteLn(hFileLink,'CLN_NAME=',DataSet_pl_buff.FieldByName('NAME_A').AsString); //Наименование плательщика
          WriteLn(hFileLink,'CLN_OKPO=',DataSet_pl_buff.FieldByName('OKPO1_A').AsString);
          WriteLn(hFileLink,'CLN_ACCOUNT=',DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString);
          WriteLn(hFileLink,'CLN_BANK_NAME=',DataSet_pl_buff.FieldByName('NAME_MFO_A').AsString);
          WriteLn(hFileLink,'CLN_BANK_MFO=',DataSet_pl_buff.FieldByName('MFO_A').AsString);

          WriteLn(hFileLink,'RCPT_NAME=',DataSet_pl_buff.FieldByName('NAME_B').AsString);
          WriteLn(hFileLink,'RCPT_OKPO=',DataSet_pl_buff.FieldByName('OKPO2_B').AsString);
          WriteLn(hFileLink,'RCPT_ACCOUNT=',DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString);
          WriteLn(hFileLink,'RCPT_BANK_NAME=',DataSet_pl_buff.FieldByName('NAME_MFO_B').AsString);
          WriteLn(hFileLink,'RCPT_BANK_MFO=',DataSet_pl_buff.FieldByName('MFO_B').AsString);
          WriteLn(hFileLink,'PAYMENT_DETAILS=',note_pl);
          WriteLn(hFileLink,'VALUE_DATE=',DateToStr(Date()));

          CloseFile(hFileLink);
        end;


        if (progSave='SaveToPIB') then
        begin
                Id_PBKey := BufTran.AddRecord('P_I_B', 'BUFF_DOG_PIB');
          {********************************************************************}
                pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
                pFIBStoredProc_work_dog.Transaction.Active:=true;
                pFIBStoredProc_work_dog.Database.Handle := Database;

                DataSet_pl_buff.Active := false;

                s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
                DataSet_pl_buff.Prepare;
                DataSet_pl_buff.SQLs.SelectSQL.Clear;
                DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
                DataSet_pl_buff.Active := true;

                pFIBStoredProc_work_dog.StoredProcName := 'BUFF_DOG_PIB_INSERT';
                pFIBStoredProc_work_dog.Prepare;
                pFIBStoredProc_work_dog.ParamByName('Id_PBKey').Value := Id_PBKey;
                pFIBStoredProc_work_dog.ParamByName('MFO').Value :=DataSet_pl_buff.FieldByName('MFO_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('KL_CHK').Value :=DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('KL_OKP').Value :=DataSet_pl_buff.FieldByName('OKPO2_B').AsString;
                pFIBStoredProc_work_dog.ParamByName('MFO_K').Value :=DataSet_pl_buff.FieldByName('MFO_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('KL_CHK_K').Value := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('KL_OKP_K').Value :=DataSet_pl_buff.FieldByName('OKPO1_A').AsString;
                pFIBStoredProc_work_dog.ParamByName('KL_NM_K').Value :=DataSet_pl_buff.FieldByName('NAME_A').AsString;
                //  Для платежей всегда 1
                pFIBStoredProc_work_dog.ParamByName('DK').AsInt64 :=1;
                pFIBStoredProc_work_dog.ParamByName('DATA').AsDate :=data_pl;
                pFIBStoredProc_work_dog.ParamByName('S').AsCurrency := (sum_today);
                // какой должна быть дата операции ? ?
                pFIBStoredProc_work_dog.ParamByName('ADATEOPL').AsString :=DateToStr(Now);
                pFIBStoredProc_work_dog.ParamByName('TEXT1').Value :=note_pl;

                pFIBStoredProc_work_dog.ExecProc;

// showmessage('point 6');
                pFIBStoredProc_work_dog.Transaction.Commit;
// showmessage('point 7');

                //// записали, теперь пишем уже из дубл. буфера в dbf////////////////////////

                // записываем из буфера в Firebird в DBF по Id_PBKey
                // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey

                BufTran.Write('P_I_B', 'BUFF_DOG_PIB', Id_PBKey);
            {********************************************************************}
        end;

        // Это FIK (наверно Первый Инвестиционный Кредитный)

        if (progSave='SaveToFIK') then
        begin
                // Исправлено: Татаринов Е.А. 27.01.2007.
               Id_PBKey := BufTran.AddRecord('IMP_FIK', 'BUFF_DOG_FIK');
            {********************************************************************}
                //pFIBStoredProc_work_dog.Transaction := BufTran.NativeBufferTransaction as TpFIBTransaction;
                pFIBStoredProc_work_dog.Transaction.Handle:=TransHandle;
                pFIBStoredProc_work_dog.Database := pFIBStoredProc_work_dog.Transaction.DefaultDatabase;

                pFIBStoredProc_work_dog.Database.Handle:= Database;
                pFIBStoredProc_work_dog.Transaction.Active:=true;
                pFIBStoredProc_work_dog.StoredProcName := 'BUFF_DOG_FIK_INSERT';

                DataSet_pl_buff.Active := false;
                 s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
                DataSet_pl_buff.Prepare;
                DataSet_pl_buff.SQLs.SelectSQL.Clear;
                DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
                DataSet_pl_buff.Active := true;

                pFIBStoredProc_work_dog.Prepare;
                pFIBStoredProc_work_dog.ParamByName('Id_PBKey').AsInt64 := Id_PBKey;
                pFIBStoredProc_work_dog.ParamByName('VIDOP').AsInt64:=11;
                pFIBStoredProc_work_dog.ParamByName('DOC_NO').AsInt64   :=num_pl;
                pFIBStoredProc_work_dog.ParamByName('DOC_Date').AsDate  :=Now;
                pFIBStoredProc_work_dog.ParamByName('SUM_').AsCurrency  :=sum_today;

//                ShowMessage('# P_ACC_NO='+DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString);

                if not VarIsNull(DataSet_pl_buff.FieldByName('ACCOUNT_A').AsVariant) then
                begin
                    if Trim(DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString)<>'' then
                      pFIBStoredProc_work_dog.ParamByName('P_ACC_NO').AsInt64 :=StrToInt64(DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString)
                    else pFIBStoredProc_work_dog.ParamByName('P_ACC_NO').AsInt64 :=0;
                end
                else pFIBStoredProc_work_dog.ParamByName('P_ACC_NO').AsInt64 :=0;


                if not VarIsNull(DataSet_pl_buff.FieldByName('ACCOUNT_B').AsVariant) then
                begin
                    if Trim(DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString)<>'' then
                      pFIBStoredProc_work_dog.ParamByName('R_ACC_NO').AsInt64 :=StrToInt64(DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString)
                    else pFIBStoredProc_work_dog.ParamByName('R_ACC_NO').AsInt64 :=0;
                end
                else pFIBStoredProc_work_dog.ParamByName('R_ACC_NO').AsInt64 :=0;
                pFIBStoredProc_work_dog.ParamByName('R_NAME').AsString  := copy(DataSet_pl_buff.FieldByName('NAME_B').AsString,1,38);
                if not VarIsNull(DataSet_pl_buff.FieldByName('MFO_B').AsVariant) then
                begin
                    if Trim(DataSet_pl_buff.FieldByName('MFO_B').AsString)<>'' then
                      pFIBStoredProc_work_dog.ParamByName('R_MFO').AsInteger    :=StrToInt(DataSet_pl_buff.FieldByName('MFO_B').AsString)
                    else pFIBStoredProc_work_dog.ParamByName('R_MFO').AsInt64    :=0;
                end
                else pFIBStoredProc_work_dog.ParamByName('R_MFO').AsInt64    :=0 ;

                if not VarIsNull(DataSet_pl_buff.FieldByName('OKPO2_B').AsVariant) then
                begin
                    if Trim(DataSet_pl_buff.FieldByName('OKPO2_B').AsString)<>'' then
                       pFIBStoredProc_work_dog.ParamByName('R_ZIP').AsInt64    :=StrToInt64(DataSet_pl_buff.FieldByName('OKPO2_B').AsString)
                    else pFIBStoredProc_work_dog.ParamByName('R_ZIP').AsInt64    :=0
                end
                else pFIBStoredProc_work_dog.ParamByName('R_ZIP').AsInt64    :=0;

                pFIBStoredProc_work_dog.ParamByName('COMMENT').AsString :=copy(note_pl,1,160);
                 {
                 "VIDOP"	"N"	3	( = 11 - всегда.. судя по всему - вид оплаты постоянно плат. поручение..)
                  "DOC_NO"	"C"	10 	(номер документа)
                  "DOC_DATE"	"D"	8	(дата документа - текущая.)
                  "SUM"		"N"	20,2	(сумма …)
                  "P_ACC_NO"	"N"	14	(ваш расчетный счет )
                  "R_NAME"	"C"	38 	(название контрагента)
                  "R_ACC_NO"	"N"	14	(номер счета контрагента)
                  "R_MFO"	"N"	9	(МФО контрагента)
                  "R_ZIP"		"N"	10	(ЕДРПОУ контрагента)
                  }
//                ShowMessage('# Exec Procedure');
                pFIBStoredProc_work_dog.ExecProc;


                pFIBStoredProc_work_dog.Transaction.Commit;
                //// записали, теперь пишем уже из дубл. буфера в dbf////////////////////////
                // записываем из буфера в Firebird в DBF по Id_PBKey
                // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey
                BufTran.Write('IMP_FIK', 'BUFF_DOG_FIK', Id_PBKey);

            {********************************************************************}
        end;
{xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}
        // Это Приват Банк (Второй).
        if (progSave='SaveToPrivat_II') then
        begin
         Id_PBKey := BufTran.AddRecord('P_DOC', 'BUFF_DOG_P_DOC');
        {----------------------------------------------------------------------}
         pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
         pFIBStoredProc_work_dog.Transaction.Active:=true;
         pFIBStoredProc_work_dog.Database.Handle := Database;

         DataSet_pl_buff.Active := false;

         s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';

         DataSet_pl_buff.Prepare;
         DataSet_pl_buff.SQLs.SelectSQL.Clear;
         DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
         DataSet_pl_buff.Active := true;

         pFIBStoredProc_work_dog.StoredProcName := 'BUFF_DOG_P_DOC_INSERT';
         pFIBStoredProc_work_dog.Prepare;
         pFIBStoredProc_work_dog.ParamByName('Id_PBKey').Value := Id_PBKey;
         pFIBStoredProc_work_dog.ParamByName('NUM_DOC').Value :=nomer_pl ;
         pFIBStoredProc_work_dog.ParamByName('DAT_K').Value :=Data_pl;
         pFIBStoredProc_work_dog.ParamByName('DAT_B').Value :=Now;
         pFIBStoredProc_work_dog.ParamByName('SUMMA').Value :=FloatToStr(sum_today);
         pFIBStoredProc_work_dog.ParamByName('PL_SC').Value := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;;

         pFIBStoredProc_work_dog.ParamByName('PL_NAM_SC').Value :=DataSet_pl_buff.FieldByName('NAME_A').AsString;
         pFIBStoredProc_work_dog.ParamByName('PL_OKPO').Value :=DataSet_pl_buff.FieldByName('OKPO1_A').AsString ;
         pFIBStoredProc_work_dog.ParamByName('BPL_KOD').Value :=DataSet_pl_buff.FieldByName('MFO_A').AsInteger ;
         pFIBStoredProc_work_dog.ParamByName('BF_SC').Value :=DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
         pFIBStoredProc_work_dog.ParamByName('BF_NAM_SC').Value := DataSet_pl_buff.FieldByName('NAME_B').AsString;
         pFIBStoredProc_work_dog.ParamByName('BF_OKPO').Value :=DataSet_pl_buff.FieldByName('OKPO2_B').AsString ;
         pFIBStoredProc_work_dog.ParamByName('BBF_KOD').Value :=DataSet_pl_buff.FieldByName('MFO_B').AsInteger;
         pFIBStoredProc_work_dog.ParamByName('OSN').Value :=note_pl;

         pFIBStoredProc_work_dog.ExecProc;
         pFIBStoredProc_work_dog.Transaction.Commit;

         // записали, теперь пишем уже из дубл. буфера в dbf

         // записываем из буфера в Firebird в DBF по Id_PBKey
         // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey
         BufTran.Write('P_DOC', 'BUFF_DOG_P_DOC', Id_PBKey);
        {----------------------------------------------------------------------}
        end;
{xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}
// Если это Приват Банк24
{
     	TIP           Character            4            Тип документа  one of 'Abcd',

    	где	A = 'D' - дебетовый или 'C' - кредитовый,
    	b = 'r' - реальный  или 'i' - информационный,
     	с = 'r' - проведен  или 't' - сторнирован,
     	d = 'p' - поручение или 't' - требование
     	или m - мемориальный ордер или x - приходный  ордер
  		r - расходный  ордер.

    	N_D		        Character            10           Номер документа
      DATE		      Character            8            Дата документа (ГГГГММДД)
    	SUMMA     	  Numeric              15 2         Сумма документа
    	NAME_A      	Character            40           Наименование плательщика
    	COUNT_A     	Character            16           Счет плательщика
    	MFO_A       	Character            9            МФО плательщика
    	BANK_A      	Character            45           Наименование банка плательщика
    	NAME_B      	Character            40           Наименование получателя
    	COUNT_B     	Character            16           Счет получателя
    	MFO_B       	Character            9            МФО банка получателя
    	BANK_B      	Character            45           Наименование банка получателя
    	N_P         	Character            160          Назначение платежа
    	VAL         		Character          4            Валюта документа
    	OKPO_A      	Character            10           ОКПО плательщика
    	OKPO_B      	Character            10           ОКПО получателя
    	TIME        		Character          17           Дата и время проводки (ГГГГММДДТЧЧ:ММ:СС)
    	COUNT       	Character            16           Счет выписки (%)
    	REF         		Character          15           Уникальная банковская ссылка
}


        if (progSave='SaveToPrivat_III') then
        begin

         //Id_PBKey := BufTran.AddRecord('jbkl_snd', 'BUFF_DOG_PRIVAT_NEW');

         pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
         pFIBStoredProc_work_dog.Transaction.Active:=true;
         pFIBStoredProc_work_dog.Database.Handle := Database;

         DataSet_pl_buff.Active := false;

         s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';

         DataSet_pl_buff.Prepare;
         DataSet_pl_buff.SQLs.SelectSQL.Clear;
         DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
         DataSet_pl_buff.Active := true;


         HalcyonDataSet1.DatabaseName:=name_dbf;
         HalcyonDataSet1.TableName:='jbkl_snd.dbf';
         HalcyonDataSet1.Active:=true;

         HalcyonDataSet1.Insert;


         HalcyonDataSet1.FieldValues['tip']:=1;
         HalcyonDataSet1.FieldValues['n_d']:=nomer_pl;
         HalcyonDataSet1.FieldValues['date']:=Data_pl;
         HalcyonDataSet1.FieldValues['summa']:=sum_today;

         HalcyonDataSet1.FieldValues['name_a']:=DataSet_pl_buff.FieldByName('NAME_A').AsString;
         HalcyonDataSet1.FieldPut('count_a',DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString);

         //         HalcyonDataSet1.FieldValues['mfo_a']:=DataSet_pl_buff.FieldByName('MFO_A').AsString;
//         HalcyonDataSet1.FieldValues['bank_a']:=DataSet_pl_buff.FieldByName('NAME_MFO_A').AsString ;;

         HalcyonDataSet1.FieldValues['name_b']:=DataSet_pl_buff.FieldByName('NAME_B').AsString;
           HalcyonDataSet1.FieldPut('count_b',DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString);
         HalcyonDataSet1.FieldValues['mfo_b']:=DataSet_pl_buff.FieldByName('MFO_B').AsString;

         HalcyonDataSet1.FieldValues['n_p']:=note_pl;
         HalcyonDataSet1.FieldValues['val']:='UAH';
         HalcyonDataSet1.FieldValues['okpo_a']:=DataSet_pl_buff.FieldByName('OKPO1_A').AsString ;
         HalcyonDataSet1.FieldValues['okpo_b']:=DataSet_pl_buff.FieldByName('OKPO2_B').AsString ;

         HalcyonDataSet1.Post;
         HalcyonDataSet1.Close;

//         pFIBStoredProc_work_dog.StoredProcName := 'BUFF_PRIVAT_DNEPR_INS';
//         pFIBStoredProc_work_dog.Prepare;
//         pFIBStoredProc_work_dog.ParamByName('Id_PBKey').Value := Id_PBKey;
//         pFIBStoredProc_work_dog.ParamByName('TIP').Value :='0';
//         pFIBStoredProc_work_dog.ParamByName('n_d').Value :=nomer_pl;
//


//         pFIBStoredProc_work_dog.ParamByName('date_pl').Value := Data_pl;
//
//         pFIBStoredProc_work_dog.ParamByName('SUMMA').Value :=FloatToStr(sum_today);
//         pFIBStoredProc_work_dog.ParamByName('name_a').Value :=DataSet_pl_buff.FieldByName('NAME_A').AsString;
//         pFIBStoredProc_work_dog.ParamByName('count_a').Value := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsInteger;
//         pFIBStoredProc_work_dog.ParamByName('mfo_a').Value :=DataSet_pl_buff.FieldByName('MFO_A').AsString;
//         pFIBStoredProc_work_dog.ParamByName('bank_a').Value :=DataSet_pl_buff.FieldByName('NAME_MFO_A').AsString ;;

//         pFIBStoredProc_work_dog.ParamByName('name_b').Value :=DataSet_pl_buff.FieldByName('NAME_B').AsString;
//         pFIBStoredProc_work_dog.ParamByName('count_b').Value := DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
//         pFIBStoredProc_work_dog.ParamByName('mfo_b').Value :=DataSet_pl_buff.FieldByName('MFO_B').AsString;
//         pFIBStoredProc_work_dog.ParamByName('bank_b').Value :=DataSet_pl_buff.FieldByName('NAME_MFO_B').AsString ;;
//         pFIBStoredProc_work_dog.ParamByName('n_p').Value :=note_pl;
//         pFIBStoredProc_work_dog.ParamByName('val').Value :='UAH';
//         pFIBStoredProc_work_dog.ParamByName('okpo_a').Value :=DataSet_pl_buff.FieldByName('OKPO1_A').AsString ;
//         pFIBStoredProc_work_dog.ParamByName('okpo_b').Value :=DataSet_pl_buff.FieldByName('OKPO2_B').AsString ;

//         DecodeDate(now, myYear, myMonth, myDay);
//         new_date_pl := IntToStr(myYear);
//         if (myMonth <= 9) then
//           new_date_pl := new_date_pl + '0' + IntToStr(myMonth) else
//           new_date_pl := new_date_pl + IntToStr(myMonth);
//
//         if (myDay <= 9) then
//           new_date_pl := new_date_pl + '0' + IntToStr(myDay) else
//           new_date_pl := new_date_pl + IntToStr(myDay);
//         new_date_pl := new_date_pl + 'T' + TimeToStr(now);
//
//         pFIBStoredProc_work_dog.ParamByName('TIME_IN').Value :=new_date_pl;

//         pFIBStoredProc_work_dog.ExecProc;
//         pFIBStoredProc_work_dog.Transaction.Commit;

         // записали, теперь пишем уже из дубл. буфера в dbf
         // записываем из буфера в Firebird в DBF по Id_PBKey
         // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey
//         BufTran.Write('jbkl_snd', 'BUFF_PRIVAT_DNEPR', Id_PBKey);
        end;
{xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}
        // Если это Приват Банк (Первый)
        if (progSave='SaveToPrivat_I') then
        begin
          Id_PBKey := BufTran.AddRecord('import', 'BUFF_DOG_PRIVAT');
          {********************************************************************}
          {
             TIP_DOC     		C   1    	Тип документа                        		[+]
             N_DOC       		C  10    	Номер документа                      		[+]
             DATE        		D   8    	Дата документа                       		[но]
             SUMMA       		N  17 2  Сумма                                		[+]
             ACCOUNT_A   	C  16    	Счёт плательщика                     		[+]
             NAME_A      		C  40    	Наименование плательщика             	[но] если tip_doc <> [t]
             OKPO1_A     		C  10    	ОКПО плательщика                     		[но] если tip_doc <> [t]
             MFO_A       		N   9    	МФО  плательщика                     		[но] если tip_doc <> [t]
             ACCOUNT_B   	C  16    	Счёт получателя                      		[+]
             NAME_B      		C  40    	Наименование получателя              	[но] если tip_doc = [t]
             OKPO2_B     		C  10    	ОКПО получателя                      		[но] если tip_doc = [t]
             MFO_B       		N   9    	МФО  получателя                      		[но] если tip_doc = [t]
             N_P         		C 160    Назначение платежа                   		[+]
             PACKET      		C   1    	Флаг готовности документа к импорту  	[!]

          }
              pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
              pFIBStoredProc_work_dog.Transaction.Active:=true;
              pFIBStoredProc_work_dog.Database.Handle := Database;

              DataSet_pl_buff.Active := false;

              s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
              DataSet_pl_buff.Prepare;
              DataSet_pl_buff.SQLs.SelectSQL.Clear;
              DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
              DataSet_pl_buff.Active := true;

              pFIBStoredProc_work_dog.StoredProcName := 'BUFF_DOG_PRIVAT_INSERT';
              pFIBStoredProc_work_dog.Prepare;
              pFIBStoredProc_work_dog.ParamByName('ID_PBKEY').Value := Id_PBKey;
              pFIBStoredProc_work_dog.ParamByName('TIP_DOC').Value :='p';
              pFIBStoredProc_work_dog.ParamByName('N_DOC').Value :=nomer_pl;
              pFIBStoredProc_work_dog.ParamByName('SUMMA').Value :=FloatToStr(sum_today);
              pFIBStoredProc_work_dog.ParamByName('ACCOUNT_A').Value := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;
              pFIBStoredProc_work_dog.ParamByName('NAME_A').Value :=Copy(DataSet_pl_buff.FieldByName('NAME_A').AsString,1,40);
              pFIBStoredProc_work_dog.ParamByName('OKPO1_A').Value :=DataSet_pl_buff.FieldByName('OKPO1_A').AsString ;
              pFIBStoredProc_work_dog.ParamByName('MFO_A').AsInt64 :=DataSet_pl_buff.FieldByName('MFO_A').AsInteger ;
              pFIBStoredProc_work_dog.ParamByName('ACCOUNT_B').Value :=DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
              pFIBStoredProc_work_dog.ParamByName('NAME_B').Value := Copy(DataSet_pl_buff.FieldByName('NAME_B').AsString,1,40);
              pFIBStoredProc_work_dog.ParamByName('OKPO2_B').Value :=DataSet_pl_buff.FieldByName('OKPO2_B').AsString ;
              pFIBStoredProc_work_dog.ParamByName('MFO_B').AsInt64 :=DataSet_pl_buff.FieldByName('MFO_B').AsInteger;
              pFIBStoredProc_work_dog.ParamByName('N_P').Value :=note_pl;
              // Ставить по умолчанию 1
              {
              pFIBStoredProc_work_dog.ParamByName('DOC_DT_KT').Value := 1; // Платежи
              pFIBStoredProc_work_dog.ParamByName('N_DOC').Value :=nomer_pl ;
              pFIBStoredProc_work_dog.ParamByName('DATE_DOC').Value :=Data_pl;
              pFIBStoredProc_work_dog.ParamByName('SUM_DOC').Value :=FloatToStr(sum_today);
              pFIBStoredProc_work_dog.ParamByName('ACCOUNT_A').Value := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;;

              pFIBStoredProc_work_dog.ParamByName('NAME_A').Value :=Copy(DataSet_pl_buff.FieldByName('NAME_A').AsString,1,40);
              pFIBStoredProc_work_dog.ParamByName('OKPO1_A').Value :=DataSet_pl_buff.FieldByName('OKPO1_A').AsString ;
              pFIBStoredProc_work_dog.ParamByName('MFO_A').AsInt64 :=DataSet_pl_buff.FieldByName('MFO_A').AsInteger ;
              pFIBStoredProc_work_dog.ParamByName('ACCOUNT_B').Value :=DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
              pFIBStoredProc_work_dog.ParamByName('NAME_B').Value := Copy(DataSet_pl_buff.FieldByName('NAME_B').AsString,1,40);
              pFIBStoredProc_work_dog.ParamByName('OKPO2_B').Value :=DataSet_pl_buff.FieldByName('OKPO2_B').AsString ;
              pFIBStoredProc_work_dog.ParamByName('MFO_B').AsInt64 :=DataSet_pl_buff.FieldByName('MFO_B').AsInteger;
              pFIBStoredProc_work_dog.ParamByName('N_P').Value :=note_pl;
              pFIBStoredProc_work_dog.ParamByName('DAT_OD').AsDate :=Now;
              }
              pFIBStoredProc_work_dog.ExecProc;

/// showmessage('point 12');
              pFIBStoredProc_work_dog.Transaction.Commit;
// showmessage('point 13');

              //// записали, теперь пишем уже из дубл. буфера в dbf////////////////////////

              // записываем из буфера в Firebird в DBF по Id_PBKey
              // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey

              BufTran.Write('import', 'BUFF_DOG_PRIVAT', Id_PBKey);
          {********************************************************************}
        end;

        //если это эксимбанк
        if (progSave='SaveEximbank') then
        begin
          Id_PBKey := BufTran.AddRecord('EKSIBANK', 'BUFF_DOG_EXIMBANK');


         pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
 //        pFIBStoredProc_work_dog.Transaction.Active:=true;
         pFIBStoredProc_work_dog.Database.Handle := Database;
//****************************************************          pFIBStoredProc_work_dog.Transaction.StartTransaction;
          DataSet_pl_buff.Active := false;
          s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
          DataSet_pl_buff.Transaction:=pFIBStoredProc_work_dog.Transaction as TFIBTransaction;
          DataSet_pl_buff.Prepare;
          DataSet_pl_buff.SQLs.SelectSQL.Clear;
          DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
          DataSet_pl_buff.Active := true;

          pFIBStoredProc_work_dog.StoredProcName := 'DOG_PL_BUFF_EXIMBANK';
          pFIBStoredProc_work_dog.Prepare;
          pFIBStoredProc_work_dog.ParamByName('ID_PBKEY').Value := Id_PBKey;
          pFIBStoredProc_work_dog.ParamByName('D_NUMBER').Value := nomer_pl;
          pFIBStoredProc_work_dog.ParamByName('D_DATE').Value := Date;
          pFIBStoredProc_work_dog.ParamByName('PAY_DATE').Value := Data_pl;
          pFIBStoredProc_work_dog.ParamByName('SUMMA').Value := sum_today;

          s_name := Copy(ConvertI(DataSet_pl_buff.FieldByName('NAME_A').AsString), 1, 38);
          s_nameU := Copy(DataSet_pl_buff.FieldByName('NAME_A').AsString, 1, 38);
          s_name := Copy(s_name, 1, 38);
          s_nameU := Copy(s_nameU, 1, 38);
//          Delete(s_name,39,Length(s_name)-38);
          // ************************ Ukraine!
          if SYS_IS_DONNU then
            pFIBStoredProc_work_dog.ParamByName('S_NAME').Value := s_nameU
                          else
            pFIBStoredProc_work_dog.ParamByName('S_NAME').Value := s_name;

          pFIBStoredProc_work_dog.ParamByName('S_OKPO').Value := DataSet_pl_buff.FieldByName('OKPO1_A').AsString;

          s_bankU := DataSet_pl_buff.FieldByName('NAME_MFO_A').AsString;
          s_bank := ConvertI(DataSet_pl_buff.FieldByName('NAME_MFO_A').AsString);
          s_bank := Copy(s_bank, 1, 38);
          s_bankU := Copy(s_bank, 1, 38);
//          Delete(s_bank,39,Length(s_bank)-38);
          if SYS_IS_DONNU then
             pFIBStoredProc_work_dog.ParamByName('S_BANK').Value := s_bankU
             else
             pFIBStoredProc_work_dog.ParamByName('S_BANK').Value := s_bank;

          pFIBStoredProc_work_dog.ParamByName('S_MFO').Value := DataSet_pl_buff.FieldByName('MFO_A').AsString;
          pFIBStoredProc_work_dog.ParamByName('S_ACCOUNT').Value := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;

          r_nameU := DataSet_pl_buff.FieldByName('NAME_B').AsString;
          r_name := ConvertI(DataSet_pl_buff.FieldByName('NAME_B').AsString);
          r_name := Copy(r_name, 1, 38);
          r_nameU := Copy(r_nameU, 1, 38);
  //        Delete(r_name,39,Length(r_name)-38);
          if SYS_IS_DONNU then
             pFIBStoredProc_work_dog.ParamByName('R_NAME').Value := r_nameU
               else
             pFIBStoredProc_work_dog.ParamByName('R_NAME').Value := r_name;

          pFIBStoredProc_work_dog.ParamByName('R_OKPO').Value := DataSet_pl_buff.FieldByName('OKPO2_B').AsString;

          r_bankU := DataSet_pl_buff.FieldByName('NAME_MFO_B').AsString;
          r_bank := ConvertI(DataSet_pl_buff.FieldByName('NAME_MFO_B').AsString);
          r_bank := Copy(r_bank, 1, 38);
          r_bankU := Copy(r_bankU, 1, 38);
//          Delete(r_bank,39,Length(r_bank)-38);
          if SYS_IS_DONNU then
                      pFIBStoredProc_work_dog.ParamByName('R_BANK').Value := r_bankU
                    else
                      pFIBStoredProc_work_dog.ParamByName('R_BANK').Value := r_bank;

          pFIBStoredProc_work_dog.ParamByName('R_MFO').Value := DataSet_pl_buff.FieldByName('MFO_B').AsString;
          pFIBStoredProc_work_dog.ParamByName('R_ACCOUNT').Value := DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;
          pFIBStoredProc_work_dog.ParamByName('ID_KEY').Value := id_key_shapka;
          pFIBStoredProc_work_dog.ParamByName('DIRECT').Value := note_pl;
          pFIBStoredProc_work_dog.ParamByName('CURRENCY').Value := '980';

          pFIBStoredProc_work_dog.ExecProc;

// showmessage('point 14');
          pFIBStoredProc_work_dog.Transaction.Commit;
// showmessage('point 15');

////////////// записали, теперь пишем уже из дубл. буфера в dbf/////////////////

          // записываем из буфера в Firebird в DBF по Id_PBKey
          // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey
          BufTran.Write('EKSIBANK', 'BUFF_DOG_EXIMBANK', Id_PBKey);
        end;

        //если это ПУМБ
        if (progSave='SaveFUIB') then
        begin
          Id_PBKey := BufTran.AddRecord('I_GRV1', 'BUFF_DOG_FUIB');

          pFIBStoredProc_work_dog.Transaction.Handle :=TransHandle;
//          pFIBStoredProc_work_dog.Transaction.Active:=true;
          pFIBStoredProc_work_dog.Database.Handle := Database;
//*******************************************          pFIBStoredProc_work_dog.Transaction.StartTransaction;
          DataSet_pl_buff.Active := false;
          s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
          DataSet_pl_buff.Transaction:=pFIBStoredProc_work_dog.Transaction as TFIBTransaction;
          DataSet_pl_buff.Prepare;
          DataSet_pl_buff.SQLs.SelectSQL.Clear;
          DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
          DataSet_pl_buff.Active := true;

          pFIBStoredProc_work_dog.StoredProcName := 'DOG_PL_BUFF_FUIB';
          pFIBStoredProc_work_dog.Prepare;
          pFIBStoredProc_work_dog.ParamByName('ID_PBKEY').Value := Id_PBKey;
          pFIBStoredProc_work_dog.ParamByName('NDOC').Value := nomer_pl;
          pFIBStoredProc_work_dog.ParamByName('DDATE').Value := Data_pl;
          pFIBStoredProc_work_dog.ParamByName('AMOUNT').Value := sum_today;
          pFIBStoredProc_work_dog.ParamByName('ADEBIT').Value := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;
          pFIBStoredProc_work_dog.ParamByName('ANAME').Value := ConvertI(DataSet_pl_buff.FieldByName('NAME_A').AsString);
          pFIBStoredProc_work_dog.ParamByName('AOKPO').Value := DataSet_pl_buff.FieldByName('OKPO1_A').AsString;
          pFIBStoredProc_work_dog.ParamByName('ABNKMFO').Value := DataSet_pl_buff.FieldByName('MFO_A').AsInteger;
          pFIBStoredProc_work_dog.ParamByName('ABANK').Value := ConvertI(DataSet_pl_buff.FieldByName('NAME_MFO_A').AsString);
          pFIBStoredProc_work_dog.ParamByName('ABNKCITY').Value := ConvertI(DataSet_pl_buff.FieldByName('CITY_A').AsString);
          pFIBStoredProc_work_dog.ParamByName('BCREDIT').Value := DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;

          bname := ConvertI(DataSet_pl_buff.FieldByName('NAME_B').AsString);
          bname := copy(bname, 1, 38);
//          Delete(bname,39,Length(bname)-38);
          pFIBStoredProc_work_dog.ParamByName('BNAME').Value := bname;

          pFIBStoredProc_work_dog.ParamByName('BOKPO').Value := DataSet_pl_buff.FieldByName('OKPO2_B').AsString;
          pFIBStoredProc_work_dog.ParamByName('BBNKMFO').Value := DataSet_pl_buff.FieldByName('MFO_B').AsInteger;
          pFIBStoredProc_work_dog.ParamByName('BBANK').Value := ConvertI(DataSet_pl_buff.FieldByName('NAME_MFO_B').AsString);
          pFIBStoredProc_work_dog.ParamByName('BBNKCITY').Value := ConvertI(DataSet_pl_buff.FieldByName('CITY_B').AsString);
          pFIBStoredProc_work_dog.ParamByName('DETAILS').Value := note_pl;
          pFIBStoredProc_work_dog.ParamByName('ID_KEY').Value := id_key_shapka;
          pFIBStoredProc_work_dog.ParamByName('LAMOUNT').Value := ConvertNumber(sum_today);

          pFIBStoredProc_work_dog.ExecProc;

// showmessage('point 16');
          pFIBStoredProc_work_dog.Transaction.Commit;
// showmessage('point 17');

          //// записали, теперь пишем уже из дубл. буфера в dbf////////////////////////

          // записываем из буфера в Firebird в DBF по Id_PBKey
          // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey

          BufTran.Write('I_GRV1', 'BUFF_DOG_FUIB', Id_PBKey);
        end;

        //для Днепродзержинска
        if (progSave='SaveImport') then
        begin
          Id_PBKey := BufTran.AddRecord('import', 'BUFF_DOG_DT_PL_DOC');

          pFIBStoredProc_work_dog.Transaction := BufTran.NativeBufferTransaction as TpFIBTransaction;
          pFIBStoredProc_work_dog.Database := pFIBStoredProc_work_dog.Transaction.DefaultDatabase;

//***************************************          pFIBStoredProc_work_dog.Transaction.StartTransaction;
          DataSet_pl_buff.Active := false;
          s_pl_buff := 'select * from dog_dt_plat_select('+VarToStr(id_dog)+')';
          DataSet_pl_buff.Transaction:=pFIBStoredProc_work_dog.Transaction as TFIBTransaction;
          DataSet_pl_buff.Prepare;
          DataSet_pl_buff.SQLs.SelectSQL.Clear;
          DataSet_pl_buff.SQLs.SelectSQL.Add(s_pl_buff);
          DataSet_pl_buff.Active := true;

          pFIBStoredProc_work_dog.StoredProcName := 'DOG_PL_BUFF_INSERT';
          pFIBStoredProc_work_dog.Prepare;
          pFIBStoredProc_work_dog.ParamByName('ID_PBKEY').Value := Id_PBKey;
          pFIBStoredProc_work_dog.ParamByName('TIP_DOC').Value := 'p';
          pFIBStoredProc_work_dog.ParamByName('N_DOC').Value := nomer_pl;
          pFIBStoredProc_work_dog.ParamByName('DATE').Value := Data_pl;
          pFIBStoredProc_work_dog.ParamByName('SUMMA').Value := sum_today;
          pFIBStoredProc_work_dog.ParamByName('ACCOUNT_A').Value := DataSet_pl_buff.FieldByName('ACCOUNT_A').AsString;

          s_name := Copy(ConvertI(DataSet_pl_buff.FieldByName('NAME_A').AsString), 1, 38);
//          Delete(s_name,41,Length(s_name)-40);
          pFIBStoredProc_work_dog.ParamByName('NAME_A').Value := s_name;

          pFIBStoredProc_work_dog.ParamByName('OKPO1_A').Value := DataSet_pl_buff.FieldByName('OKPO1_A').AsString;
          pFIBStoredProc_work_dog.ParamByName('MFO_A').Value := DataSet_pl_buff.FieldByName('MFO_A').AsInteger;
          pFIBStoredProc_work_dog.ParamByName('ACCOUNT_B').Value := DataSet_pl_buff.FieldByName('ACCOUNT_B').AsString;

          r_name := ConvertI(DataSet_pl_buff.FieldByName('NAME_B').AsString);
          r_name := Copy(r_name, 1, 38);
//          Delete(r_name,41,Length(r_name)-40);
          pFIBStoredProc_work_dog.ParamByName('NAME_B').Value := r_name;

          pFIBStoredProc_work_dog.ParamByName('OKPO2_B').Value := DataSet_pl_buff.FieldByName('OKPO2_B').AsString;
          pFIBStoredProc_work_dog.ParamByName('MFO_B').Value := DataSet_pl_buff.FieldByName('MFO_B').AsInteger;
          pFIBStoredProc_work_dog.ParamByName('N_P').Value := note_pl;
          pFIBStoredProc_work_dog.ParamByName('ID_KEY').Value := id_key_shapka;
          pFIBStoredProc_work_dog.ParamByName('DATE_DOC').Value := Data_pl;
          pFIBStoredProc_work_dog.ParamByName('SUM_DOC').Value := sum_today;

          pFIBStoredProc_work_dog.ExecProc;

// showmessage('point 18');
          pFIBStoredProc_work_dog.Transaction.Commit;
// showmessage('point 19');

          ///// записали, теперь пишем уже из дубл. буфера в dbf////////////////////////

          // записываем из буфера в Firebird в DBF по Id_PBKey
          // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey

          BufTran.Write('Import', 'BUFF_DOG_DT_PL_DOC', Id_PBKey);
        end;

        //Чермет
        if (progSave='SaveChermet') then
        begin

          name_dbf_buff := DataSet_pl_buff.FieldByName('alias_buff').asstring;
          delete(name_dbf_buff, Length(name_dbf_buff)-3,4);

          Id_PBKey := BufTran.AddRecord(name_dbf_buff, 'BUFF_DOG_CHERMET');

          pFIBStoredProc_work_dog.Transaction := BufTran.NativeBufferTransaction as TpFIBTransaction;
          pFIBStoredProc_work_dog.Database := pFIBStoredProc_work_dog.Transaction.DefaultDatabase;

//*************************************************          pFIBStoredProc_work_dog.Transaction.StartTransaction;

          pFIBStoredProc_work_dog.StoredProcName := 'BUFF_DOG_CHERMET_INSERT';
          pFIBStoredProc_work_dog.Prepare;

         //данные берем из таблицы соответствий DOG_BANKBUFF_RELATIONS

          DataSetBuffRel := TpFIBDataSet.create(Nil);
          DataSetBuffRel.Database := pFIBTransactionWrite.DefaultDatabase;
          DataSetBuffRel.Transaction := pFIBTransactionWrite;
          DataSetBuffRel.SQLs.SelectSQL.Text := 'Select * from DOG_BANKBUFF_RELATIONS where id_bank_buff=' +
                                                 DataSet_pl_buff.FieldByName('id_bank_buff').asstring;
          DataSetBuffRel.Active := true;
          DataSetBuffRel.FetchAll;
          DataSetBuffRel.First;
          for i:=0 to DataSetBuffRel.RecordCount-1 do
          begin
            pFIBStoredProc_work_dog.ParamByName(DataSetBuffRel.FieldByName('name_field_dbf').AsVariant).AsVariant :=  DataSetChermet.FieldByName(DataSetBuffRel.FieldByName('name_field').AsString).AsVariant;
            if Copy(UpperCase(DataSetBuffRel.FieldByName('NAME_FIELD_DBF').AsString), 1, 7) = 'VARCHAR' then pFIBStoredProc_work_dog.ParamByName(DataSetBuffRel.FieldByName('name_field_dbf').AsVariant).AsVariant :=  ConvertI(DataSetChermet.FieldByName(DataSetBuffRel.FieldByName('name_field').AsString).AsVariant);
            DataSetBuffRel.Next;
          end;
          DataSetBuffRel.Free;
          DataSetChermet.Free;
          pFIBStoredProc_work_dog.ParamByName('ID_PBKEY').Value := Id_PBKey;
          pFIBStoredProc_work_dog.ParamByName('ID_KEY').Value := id_key_shapka;
          pFIBStoredProc_work_dog.ParamByName('CUR_ID').Value := SYS_KOD_VAL;
          pFIBStoredProc_work_dog.ParamByName('CUR_ID_K').Value := SYS_KOD_VAL;

          pFIBStoredProc_work_dog.ExecProc;

// showmessage('point 20');
          pFIBStoredProc_work_dog.Transaction.Commit;
// showmessage('point 21');

          //// записали, теперь пишем уже из дубл. буфера в dbf////////////////////////

          // записываем из буфера в Firebird в DBF по Id_PBKey
          // <= имя dbf, имя дублирующего буфера в Firebird, ID_PBKey

          BufTran.Write(name_dbf_buff, 'BUFF_DOG_CHERMET', Id_PBKey);
        end;

        //для Проминвестбанк в текстовый файл
        if (progSave='SaveToTxt') then
        begin
           //для Чермета
//            ShowMessage('# SaveToTxt');
            DataSetChermet := TpFIBDataSet.create(Nil);
            DataSetChermet.Database := pFIBTransactionWrite.DefaultDatabase;
            DataSetChermet.Transaction := pFIBTransactionWrite;
            DataSetChermet.SQLs.SelectSQL.Text := 'select * from dog_dt_buff_select(:in_nomer_pl,:in_date_pl,:in_summa,:id_dog,:in_sum_prop,:in_note_pl)';
            DataSetChermet.ParamByName('idl_dog').AsInt64 := id_dog;
            DataSetChermet.ParamByName('in_summa').Value := sum_today;
            DataSetChermet.ParamByName('in_nomer_pl').Value := nomer_pl;
            DataSetChermet.ParamByName('in_date_pl').Value := Data_pl;
            DataSetChermet.ParamByName('in_sum_prop').Value := ConvertNumber(sum_today);
            DataSetChermet.ParamByName('in_note_pl').Value := ConvertI(note_pl);
            DataSetChermet.Active := true;
//            ShowMessage('# 1');
            SaveToTxt();
//            ShowMessage('# 2');
            DataSetChermet.Active := false;
            DataSetChermet.Free;
        end;

        //для Укрсоцбанка в текстовый файл
        if (progSave='SaveUkrsots') then
        begin
           //для Чермета 
            DataSetChermet := TpFIBDataSet.create(Nil);
            DataSetChermet.Database := pFIBTransactionWrite.DefaultDatabase;
            DataSetChermet.Transaction := pFIBTransactionWrite;
            DataSetChermet.SQLs.SelectSQL.Text := 'select * from dog_dt_buff_select(:in_nomer_pl,:in_date_pl,:in_summa,:id_dog,:in_sum_prop,:in_note_pl)';
            DataSetChermet.ParamByName('id_dog').Value := id_dog;
            DataSetChermet.ParamByName('in_summa').Value := sum_today;
            DataSetChermet.ParamByName('in_nomer_pl').Value := nomer_pl;
            DataSetChermet.ParamByName('in_date_pl').Value := Data_pl;
            DataSetChermet.ParamByName('in_sum_prop').Value := ConvertNumber(sum_today);
            DataSetChermet.ParamByName('in_note_pl').Value := ConvertI(note_pl);
            DataSetChermet.Active := true;
            SaveUkrsots();                
            DataSetChermet.Active := false;
            DataSetChermet.Free;

        end;

    end;
/////////////////////////////////////////////////////////////////////////////////////

      // если ошибка при добавлении
      except on e: Exception do
        begin
//           if name_dbf <> 'none' then
//           begin
            MessageDlg('Увага', 'Проблемы: ' + e.Message, mtError, [mbOk]);
            BufTran.Rollback;
            Exit;
//           end;
        end;

   end;      // конец добавления

    //BufTran.Start;

//showmessage('point 22');
    if not BufTran.DontWriteToDbf then BufTran.Commit;
// showmessage('point 23');
    Result := 1;
/////////////////////////////////////////////////////////////////////////////
    // освободить ресурсы
   { try

        BufTran.Free;
        DB.Free;
    except
    end;
    }
end;

procedure PlNoteSh1();
var
  add_okpo, s :String;
begin
   if (DataSet_pl_buff.FieldByNAme('add_okpo').AsString = 'True') then
   begin
     add_okpo := ' ОКПО: №' + DataSet_pl_buff.FieldByNAme('okpo_a').AsString;
   end
   else
   begin
     add_okpo := '';
   end;

   if (DataSet_pl_buff.FieldByNAme('add_kekv').AsInteger = 1) then
   begin
     Kekv();
   end
   else
   begin
     add_kekv := '';
   end;

   if (DataSet_pl_buff.FieldByNAme('add_kpk_first').AsInteger = 1) then
   begin
    if (DataSet_pl_buff.FieldByNAme('add_kekv_first').AsInteger = 1) then
    begin
      note_pl := '#' + KPK +'#,#' + add_kekv + '#,#'+'За'+' '+DataSet_work_dog.FieldByName('dog_note').AsString+
                 '#,#згідно'+' '+DataSet_work_dog.FieldByName('short_name').AsString+' '+
                 'N'+' '+DataSet_work_dog.FieldByName('n_dog').AsString+' '+
                 'від'+' '+DataSet_work_dog.FieldByName('d_dog').AsString+'#,#'+
                 str_nds + '#' + add_okpo + ' ' + pay_all;
    end
    else begin
      note_pl := KPK +','+' За'+' '+DataSet_work_dog.FieldByName('dog_note').AsString+' '+
                 'згідно'+' '+DataSet_work_dog.FieldByName('short_name').AsString+' '+
                 'N'+' '+DataSet_work_dog.FieldByName('n_dog').AsString+' '+
                 'від'+' '+DataSet_work_dog.FieldByName('d_dog').AsString+' '+
                 str_nds + add_okpo + add_kekv + ' ' + pay_all;
    end;
   end else
   begin
    if (DataSet_pl_buff.FieldByNAme('add_kekv_first').AsInteger = 1) then
    begin
      note_pl := add_kekv + ','+' За'+' '+DataSet_work_dog.FieldByName('dog_note').AsString+' '+
                 'згідно'+' '+DataSet_work_dog.FieldByName('short_name').AsString+' '+
                 'N'+' '+DataSet_work_dog.FieldByName('n_dog').AsString+' '+
                 'від'+' '+DataSet_work_dog.FieldByName('d_dog').AsString+' '+
                 str_nds + add_okpo + ' ' + pay_all;
    end
    else begin
      note_pl := ' За'+' '+DataSet_work_dog.FieldByName('dog_note').AsString+' '+
                 'згідно'+' '+DataSet_work_dog.FieldByName('short_name').AsString+' '+
                 'N'+' '+DataSet_work_dog.FieldByName('n_dog').AsString+' '+
                 'від'+' '+DataSet_work_dog.FieldByName('d_dog').AsString+' '+
                  str_nds + KPK +add_okpo + add_kekv + ' ' + pay_all;
    end;
   end;

   Nlength := Length(note_pl);

   str_ostatok := 'За'+' '+' '+
             'згідно'+' '+DataSet_work_dog.FieldByName('short_name').AsString+' '+
             'N'+' '+DataSet_work_dog.FieldByName('n_dog').AsString+' '+
             'від'+' '+DataSet_work_dog.FieldByName('d_dog').AsString+' '+
             str_nds + kpk + add_okpo + add_kekv + ' ' + pay_all;

   kol_vo_dog_note := 161 - Length(str_ostatok);

   str_dog_note := DataSet_work_dog.FieldByName('dog_note').AsString;
   If Nlength > 160 then
     begin
       Delete(str_dog_note,kol_vo_dog_note,NLength-160);
       note_pl := 'За'+' '+str_dog_note+' '+
             'згідно'+' '+DataSet_work_dog.FieldByName('short_name').AsString+' '+
             'N'+' '+DataSet_work_dog.FieldByName('n_dog').AsString+' '+
             'від'+' '+DataSet_work_dog.FieldByName('d_dog').AsString+' '+
             str_nds + kpk + add_okpo + add_kekv + ' ' + pay_all;
     end;

end;

procedure PlNoteSh5();
var
  add_okpo, note, start_str, note1, note2 :String;
  kol_vo_dog_note, c, k, i, n, m: Integer;
begin

   if (DataSet_pl_buff.FieldByNAme('add_okpo').AsInteger = 1) then
   begin
     add_okpo := ';' + DataSet_pl_buff.FieldByNAme('okpo_a').AsString+';';
   end
   else
   begin
     add_okpo := '';
   end;

   if (DataSet_pl_buff.FieldByNAme('add_kekv').AsInteger = 1) then
   begin
     Kekv();
   end
   else
   begin
     add_kekv := '';
   end;


  note := DataSet_work_dog.FieldByName('dog_note').AsString;

  c := 0;
  if (note[1] = '*') and (note[2]= ';')
  then
    begin
      for i:=1 to Length(note) do
       begin
         k := k+1;
         if (note[i] = ';') then c := c+1;
         if (c = 3) then begin
          start_str := start_str + note[i];
          //k:=k+1;
          break;
         end; 
         //if (note[i] <> '*') and (note[i] <> ';') and (note[i] <> '0') and (note[i] <> '1') and (note[i] <> '2') and (note[i] <> '3') and (note[i] <> '4') and (note[i] <> '5') and (note[i] <> '6') and (note[i] <> '7') and (note[i] <> '8') and (note[i] <> '9') then break;
         //if (c = 3) then break;
         start_str := start_str + note[i];
         //if (note[i] = ';') then c := c+1;
      end;


      for m:=k+1 to Length(note) do
      begin
        note1 := note1 + note[m];
      end;


      if (DataSet_pl_buff.FieldByNAme('add_kpk_first').AsInteger = 1) then
      begin
        if (DataSet_pl_buff.FieldByNAme('add_kekv_first').AsInteger = 1) then
      begin
        note_pl := start_str + kpk + ' ' + add_kekv + ' ' + note1 +  '' + pay_all;
      end
      else begin
        note_pl := '' + kpk + note + add_okpo + add_kekv+ ' ' + ' ' + pay_all;
      end;
      end else
      begin
        note_pl := note + '' + kpk + add_okpo + add_kekv +' '  + ' ' + pay_all;
      end;

    if Length(note_pl)>160 then
      begin
        kol_vo_dog_note := 161 - Length(start_str + '#' + kpk + '#,#' + add_kekv + '' + pay_all);
        note2 :=copy(note1,1,kol_vo_dog_note);

        if (DataSet_pl_buff.FieldByNAme('add_kpk_first').AsInteger = 1) then
        begin
          if (DataSet_pl_buff.FieldByNAme('add_kekv_first').AsInteger = 1) then
          begin
            note_pl := start_str + '#' + kpk + '#,#' + add_kekv + '' + note2 +  '' + pay_all;
          end
          else
          begin
            note_pl := '' + kpk + note + add_okpo + add_kekv+ ' ' + ' ' + pay_all;
          end;
        end else
          begin
            note_pl := note + '' + kpk + add_okpo + add_kekv +' '  + ' ' + pay_all;
          end;
      end;

  end


//   Завязка на настройку вставки КПК и КЭКВ первыми в основании
  else
  begin
    if (DataSet_pl_buff.FieldByNAme('add_kpk_first').AsInteger = 1) then
    begin
    if (DataSet_pl_buff.FieldByNAme('add_kekv_first').AsInteger = 1) then
    begin
      note_pl := '#' + kpk + '#,#' + add_kekv + '' + note +  '' + pay_all;
    end
    else begin
      note_pl := '' + kpk + note + add_okpo + add_kekv+ ' ' + ' ' + pay_all;
    end;
    end else
    begin
      note_pl := note + '' + kpk + add_okpo + add_kekv +' '  + ' ' + pay_all;
    end;

    if Length(note_pl)>160 then
    begin
      kol_vo_dog_note := 161 - Length(add_okpo + add_kekv+ ' ' + pay_all);
      note :=copy(DataSet_work_dog.FieldByName('dog_note').AsString,1,kol_vo_dog_note);

    if (DataSet_pl_buff.FieldByNAme('add_kpk_first').AsInteger = 1) then
    begin
    if (DataSet_pl_buff.FieldByNAme('add_kekv_first').AsInteger = 1) then
    begin
      note_pl := '#' + kpk + '#,#' + add_kekv + '' + note +  '' + pay_all;
    end
    else begin
      note_pl := '' + kpk + note + add_okpo + add_kekv+ ' ' + ' ' + pay_all;
    end;
    end else
    begin
      note_pl := note + '' + kpk + add_okpo + add_kekv +' '  + ' ' + pay_all;
    end;
    end;
  end
end;

procedure Kekv();
var
  s1, kekv, kekv_num: String;
  DataSet_kekv, DataSet_name_kekv: TpFIBDataSet;
  QuerySettings : TpFIBQuery;
  i: Integer;
  summa: String;
  sum_temp, sum_kekv: Variant;
  summ_ins:Integer;
begin
     QuerySettings:= TpFIBQuery.Create(Nil);
     QuerySettings.Database := pFIBTransactionWrite.DefaultDatabase;
     QuerySettings.Transaction := pFIBTransactionWrite;
     QuerySettings.SQL.Clear;
//     QuerySettings.Transaction.StartTransaction;
     QuerySettings.SQL.Add('SELECT KEKV_SUMM_INS FROM DOG_SYS_OPTIONS;');
     QuerySettings.ExecQuery;
     summ_ins:=QuerySettings.FldByName['KEKV_SUMM_INS'].AsInteger;

 //     ShowMessage(IntToStr(summ_ins));

     DataSet_kekv := TpFIBDataSet.Create(Nil);
     DataSet_kekv.Database := pFIBTransactionWrite.DefaultDatabase;
     DataSet_kekv.Transaction := pFIBTransactionWrite;
     s := 'SELECT SUM(dog_dt_smet_dog.summa), id_kekv  FROM dog_dt_smet_dog '+
          'WHERE dog_dt_smet_dog.id_dog =:id_dog GROUP BY dog_dt_smet_dog.id_kekv';
     DataSet_kekv.SQLs.SelectSQL.Add(s);
     DataSet_kekv.ParamByName('id_dog').Value  := p_id_dog;
     DataSet_kekv.Active := true;
     DataSet_kekv.FetchAll;
     DataSet_kekv.First;
     if (DataSet_kekv.RecordCount=1)
     then begin
            DataSet_name_kekv := TpFIBDataSet.Create(Nil);
            DataSet_name_kekv.Database := pFIBTransactionWrite.DefaultDatabase;
            DataSet_name_kekv.Transaction := pFIBTransactionWrite;
            s1 := 'select * from pub_spr_kekv_info(:id_kekv, :actual_date)';
            DataSet_name_kekv.SQLs.SelectSQL.Add(s1);
            DataSet_name_kekv.ParamByName('id_kekv').Value := DataSet_kekv.FieldByName('id_kekv').AsVariant;
            DataSet_name_kekv.ParamByName('actual_date').Value := Date_platejki;
            DataSet_name_kekv.Active := true;

            sum_temp := DataSet_kekv.FieldByName('sum').AsVariant;
            sum_kekv := cht*sum_temp;

            DecimalSeparator := ',';   //потом взять из sys_razd_summa
            summa := FormatFloat('0.00', sum_kekv);

            kekv_num := DataSet_name_kekv.FieldByName('KEKV_KODE_PRINT').AsString;

            if(CompareStr(kekv_num, '0') = 0) then
              kekv_num := '0000';

            if (DataSet_pl_buff.FieldByName('ADD_SUM').AsVariant=1) and (CompareStr(kekv_num, '0000') <> 0)
            then
              begin
                kekv := kekv + 'КЕКВ '+ kekv_num +'-'+ summa + ' ';
              end
            else
              begin
                kekv := kekv + ''+ kekv_num + '#,#' + '';
              end;
         DataSet_name_kekv.Free;
         DataSet_kekv.Next;
          end
     else begin
     for i := 0 to DataSet_kekv.RecordCount-1 do
       begin
         DataSet_name_kekv := TpFIBDataSet.Create(Nil);
         DataSet_name_kekv.Database := pFIBTransactionWrite.DefaultDatabase;
         DataSet_name_kekv.Transaction := pFIBTransactionWrite;
         s1 := 'select * from pub_spr_kekv_info(:id_kekv, :actual_date)';
         DataSet_name_kekv.SQLs.SelectSQL.Add(s1);
         DataSet_name_kekv.ParamByName('id_kekv').Value := DataSet_kekv.FieldByName('id_kekv').AsVariant;
         DataSet_name_kekv.ParamByName('actual_date').Value := Date_platejki;
         DataSet_name_kekv.Active := true;

         sum_temp := DataSet_kekv.FieldByName('sum').AsVariant;
         sum_kekv := cht*sum_temp;

         DecimalSeparator := ',';   //потом взять из sys_razd_summa
         summa := FormatFloat('0.00', sum_kekv);
         kekv_num := DataSet_name_kekv.FieldByName('KEKV_KODE_PRINT').AsString;

         if(CompareStr(kekv_num, '0') = 0) then
            kekv_num := '0000';

///      if (DataSet_kekv.RecordCount-1 >= 1) then begin
         if (summ_ins = 1) and  (CompareStr(kekv_num, '0000') <> 0)
            then
              begin
                kekv := kekv + 'КЕКВ '+ kekv_num +'-'+ summa + ' ';
              end
              //kekv := kekv + ''+ DataSet_name_kekv.FieldByName('KEKV_KODE_PRINT').AsString +'-'+ summa + ';'; end
            else
              begin
                kekv := kekv + ''+ kekv_num + ';' + '';
              end;//'-'+ summa + ';'; end;


            //         else begin
//            kekv := kekv + ' '+ DataSet_name_kekv.FieldByName('kekv_kode').AsString + ';'; end;

         DataSet_name_kekv.Free;
         DataSet_kekv.Next;
       end;
      end;
     delete(kekv, Length(kekv), 1);
     add_kekv := '' + kekv;
     //add_kekv := ' КЕКВ:' + kekv;
     DataSet_kekv.Free;
end;

procedure AddFieldToText(var s : string; const FieldValue : string; const WantedLength : integer);
const
  NULL_CHAR = ' ';
var
 str : string;
 i   : integer;
begin
 str := FieldValue;
 if Length(str) > WantedLength then
 begin
   str := Copy(str, 1, WantedLength);
   s := s + str;
   exit;
 end;
 for i := 0 to WantedLength - Length(str) - 1 do str := str + NULL_CHAR;
 s := s + str;
end;

//Проминвестбанк
procedure SaveToTxt();
var
 s, str    : string;
 sl        : TStringList;
 i         : integer;
 path      : String;
 date_str  : String;
 sum       : String;
 d, m, y   : Word;
 dm        : String;
begin
 s := '';
// ShowMessage('# 1.1');
 AddFieldToText(s, DataSetChermet['ACCOUNT_NATIVE'], 35); //счет клиента
 AddFieldToText(s, '980', 3); //числовой идентификатор валюты счета клиента
 AddFieldToText(s, DataSetChermet['MFO_CUST'], 15); //МФо банка корреспондента
 AddFieldToText(s, Win2Dos(AnsiUpperCase(DataSetChermet['NAME_MFO_CUST'])), 149); //Наименование банка корреспондента
 AddFieldToText(s, DataSetChermet['ACCOUNT_CUST'], 35); //счет корреспондента
 AddFieldToText(s, '980', 3); //числовой идентификатор валюты счета корреспондента
 AddFieldToText(s, DataSetChermet['OKPO_CUST'], 15);//ОКПО корреспондента
 AddFieldToText(s, Win2Dos(AnsiUpperCase(DataSetChermet['NAME_CUST'])), 149);//наименование корреспондента
 AddFieldToText(s, '804', 3);//числовой идентификатор страны корреспондента
 AddFieldToText(s, '1', 1);//Д/К(1-списание со счета клиента,0-зачисление на счет клиента)
 AddFieldToText(s, '1', 3);//Вид обработки (1-ПЛАТЕЖНОЕ ПОРУЧЕНИЕ,2-ТРЕБОВАНИЕ ПОРУЧЕНИЕ)

 sum := CurrToStr((DataSetChermet.FBN('SUMMA').AsCurrency)*100);
// Delete(sum, pos('.', sum), 1);
// sum := IntToStr(Trunc(DataSetChermet.FBN('SUMMA').AsCurrency)) + IntToStr(Frac(DataSetChermet.FBN('SUMMA').AsCurrency));
 AddFieldToText(s, sum, 14);//Сумма документа(больше 0)
 AddFieldToText(s, DataSetChermet['NOMER_PL'], 10);//Номер документа(не пустой)

{ if sum_nds_pl > 0 then
 begin
   AddFieldToText(s, '2000', 4); // процент НДС в сотых 2000=20.00
   AddFieldToText(s, '2', 1); //проставлять НДС в документе(0-нет,1-Без ПДВ,2-в т.ч ПДВ)
 end
 else
 begin
   AddFieldToText(s, '0000', 4); // процент НДС в сотых 2000=20.00
   AddFieldToText(s, '1', 1); //проставлять НДС в документе(0-нет,1-Без ПДВ,2-в т.ч ПДВ)
 end;}

 AddFieldToText(s, '0000', 4); // процент НДС в сотых 2000=20.00
 AddFieldToText(s, '0', 1); //проставлять НДС в документе(0-нет,1-Без ПДВ,2-в т.ч ПДВ)

 AddFieldToText(s, '0', 1); //Признак документа(0-обычный,1-в счет неотл.нужд,2-в карт2)
 AddFieldToText(s, '2', 1); //Вид платежа(0-обычный,2-экспорт-импорт)
 AddFieldToText(s, '', 4); //Код раздела платежа
 AddFieldToText(s, '', 4); //Код параграфа платежа

 date_str := DataSetChermet['DATE_PL'];

 dm := copy(date_str, 1, 6);
 DecodeDate(StrToDate(date_str), y, m, d);

 date_str := dm + IntToStr(y);

 str := '';

 for i := 1 to Length(date_str) do if date_str[i] <> '.' then str := str + date_str[i];
 AddFieldToText(s,  str, 8); //Дата документа(в формате ДДММГГГГ)
 AddFieldToText(s, str, 8); //Дата валютирования документа(в формате ДДММГГГГ)

 AddFieldToText(s, Win2Dos(AnsiUpperCase(DataSetChermet['NOTE_PL'])), 159); //Назначение платежа(длина больше 3 символов)

 AddFieldToText(s, '', 15); //МФО(BIC) банка посредника
 AddFieldToText(s, '', 149); //Наименование банка посредника(если есть МФО можно пробелы)
 AddFieldToText(s, '', 1); //За счет кого комисии(0-Ваши,1-Корр,2-Обеих,3-Без комисий)
 AddFieldToText(s, '', 18); //Код платежа(можно заполнить пробелами)
 AddFieldToText(s, '', 35); //Банк посредника в клиринговой системе(можно пробелы)значение
 AddFieldToText(s, '0', 1); //Счет или банк получателя в клиринговой системе(0/1) признак
 AddFieldToText(s, '0', 35); //Счет или банк получателя в клиринговой системе(0/1) признак
 AddFieldToText(s, '0', 1); //Счет или банк получателя в клиринговой системе(0/1) признак
 AddFieldToText(s, '', 191); //Сообщение бенефициару(можно пробелы)
 AddFieldToText(s, '', 35); //Счет клиента для списания комисий
 AddFieldToText(s, '980', 3); //Числовой идентификатор валюты счета клиента для списания комисий
 AddFieldToText(s, '', 16); //Резерв(можно заполнить пробелами)
 AddFieldToText(s, '', 103); //Резерв(можно заполнить пробелами)
 AddFieldToText(s, '', 50); //Сообщение об ошибке приема(заполняется программой приема)

// AddFieldToText(s, #10 + #13, 2); //\r\n перевод строки

 sl := TStringList.Create;
 name_dbf_buff := DataSet_pl_buff.FieldByName('alias_buff').asstring;
 path := DataSet_pl_buff.FieldByName('path_buff').asstring + '\' + name_dbf_buff;
 if FileExists(path) then sl.LoadFromFile(path);
// ShowMessage('# 1.2 path='+path);
 sl.Add(s);
 for i := 1 to Length(s) do if (s[i] = #13) or (s[i] = #10) then ShowMessage('Enter at ' + IntToStr(i) + '.');
 sl.SaveToFile(path);
end;

//Укрсоцбанк
procedure SaveUkrsots();
var
 sl            : TStringList;
 name_dbf_buff : String;
 path          : String;
 s             : String;
 i, j          : Integer;
 temp          : String;
 n_str         : Variant;
begin

 sl := TStringList.Create;
 name_dbf_buff := DataSet_pl_buff.FieldByName('alias_buff').asstring;
 path := DataSet_pl_buff.FieldByName('path_buff').asstring + '\' + name_dbf_buff;

 if FileExists(path) then sl.LoadFromFile(path);
  temp := sl.Text;

 j := 0;
 for i := 0 to Length(temp) - 1  do if (temp[i] = #124)  then j := j + 1;

 if  (j > 0) then  n_str := j / 19 else n_str := 1;

 s := IntToStr(n_str) + '|' +
      '0' + '|' +
      DataSetChermet['MFO_NATIVE'] + '|' +
      DataSetChermet['ACCOUNT_NATIVE'] + '|' +
      DataSetChermet['OKPO_NATIVE'] + '|' +
      DataSetChermet['MFO_CUST'] + '|' +
      DataSetChermet['ACCOUNT_CUST'] + '|' +
      DataSetChermet['OKPO_CUST'] + '|' +
      DateToStr(DataSetChermet['DATE_PL']) + '|' +
      IntToStr(DataSetChermet['NOMER_PL']) + '|' +
      DataSetChermet['NAME_NATIVE'] + '|' +
      DataSetChermet['NAME_CUST'] + '|' +
      CurrToStr(DataSetChermet['SUMMA']) + '|' +
      DateToStr(DataSetChermet['DATE_PL']) + '|' +
      '|' +
      DataSetChermet['NOTE_PL'] + '|' +
      '980' + '|' +
      'F' +  '|' +
      '0' + '|';
 sl.Add(s);
// for i := 1 to Length(s) do if (s[i] = #13) or (s[i] = #10) then ShowMessage('Enter at ' + IntToStr(i) + '.');
 sl.SaveToFile(path);
end;

function MakeNote(const s : string) : string;
var
  str      : String;
  i, cnt   : Integer;
  str_nds  : String;
  DataSetMakeNote : TpFIBDataSet;
  _fnote_dog             : String;
  _fdate_dog             : String;
  _fnum_dog              : String;
  _fregnum_doc           : String;
  _fsname_tipdog_dog     : String;
  _fnotecur              : String;
  _fdate_cur             : String;
  _fnumcur               : String;
  _fregnum_cur           : String;
  _fsname_tipdog_cur     : String;
  _fsumnds_cur           : String;
  _fnote_uplevel         : String;
  _fdate_uplevel         : String;
  _fnum_uplevel          : String;
  _fregnum_uplevel       : String;
  _fsname_tipdog_uplevel : String;
begin
  //  str := s;
  str := DataSet_work_dog.FBN('DOG_NOTE').AsString;

  DataSetMakeNote := TpFIBDataSet.Create(Nil);
  DataSetMakeNote.Database := pFIBTransactionWrite.DefaultDatabase;
  DataSetMakeNote.Transaction := pFIBTransactionWrite;
  DataSetMakeNote.SQLs.SelectSQL.Text := 'select * from DOG_SELECT_DATA_FOR_NOTE_PLAT(:id_dog)';
  DataSetMakeNote.ParamByName('id_dog').Value := p_id_dog;
  DataSetMakeNote.Active := true;

  //Основание самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNOTE_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FNOTE_DOG%%', str);
      Delete(str, cnt, 13);
      Insert(DataSetMakeNote.FBN('FNOTE_DOG').AsString, str, cnt);
    end;
  end;

  //Дата заключения самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FDATE_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FDATE_DOG%%', str);
      Delete(str, cnt, 13);
      if not VarIsNull(DataSetMakeNote.FBN('FDATE_DOG').AsVariant) then
      Insert(DataSetMakeNote.FBN('FDATE_DOG').AsString, str, cnt);
    end;
  end;

  //Номер самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNUM_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FNUM_DOG%%', str);
      Delete(str, cnt, 12);
      Insert(DataSetMakeNote.FBN('FNUM_DOG').AsString, str, cnt);
    end;
  end;

  //Регистрационный номер самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FREGNUM_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FREGNUM_DOG%%', str);
      Delete(str, cnt, 15);
      Insert(DataSetMakeNote.FBN('FREGNUM_DOG').AsString, str, cnt);
    end;
  end;

  //Краткое наименование типа договора самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FSNAME_TIPDOG_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FSNAME_TIPDOG_DOG%%', str);
      Delete(str, cnt, 21);
      Insert(DataSetMakeNote.FBN('FSNAME_TIPDOG_DOG').AsString, str, cnt);
    end;
  end;

  //Основание текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNOTE_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FNOTE_CUR%%', str);
      Delete(str, cnt, 13);
      Insert(DataSetMakeNote.FBN('FNOTE_CUR').AsString, str, cnt);
    end;
  end;

  //Дата заключения текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FDATE_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FDATE_CUR%%', str);
      Delete(str, cnt, 13);
      if not VarIsNull(DataSetMakeNote.FBN('FDATE_CUR').AsVariant) then
      Insert(DataSetMakeNote.FBN('FDATE_CUR').AsString, str, cnt);
    end;
  end;

  //Номер текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNUM_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FNUM_CUR%%', str);
      Delete(str, cnt, 12);
      Insert(DataSetMakeNote.FBN('FNUM_CUR').AsString, str, cnt);
    end;
  end;

  //Регистрационный номер текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FREGNUM_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FREGNUM_CUR%%', str);
      Delete(str, cnt, 15);
      Insert(DataSetMakeNote.FBN('FREGNUM_CUR').AsString, str, cnt);
    end;
  end;

  //Краткое наименование типа договора текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FSNAME_TIPDOG_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FSNAME_TIPDOG_CUR%%', str);
      Delete(str, cnt, 21);
      Insert(DataSetMakeNote.FBN('FSNAME_TIPDOG_CUR').AsString, str, cnt);
    end;
  end;

  //Сумма НДС текущего договора.
  for i := 0 to Length(str) do
  begin
    while Pos('%%FSUMNDS_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FSUMNDS_CUR%%', str);
      Delete(str, cnt, 15);
      if (DataSetMakeNote.FBN('FSUMNDS_CUR').AsCurrency = 0) then
      str_nds := 'Без ПДВ' else str_nds := 'в т.ч. ПДВ ' + DataSetMakeNote.FBN('FSUMNDS_CUR').AsString + ' грн.';
      Insert(str_nds, str, cnt);
    end;
  end;

  //Основание вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNOTE_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FNOTE_UPLEVEL%%', str);
      Delete(str, cnt, 17);
      Insert(DataSetMakeNote.FBN('FNOTE_UPLEVEL').AsString, str, cnt);
    end;
  end;

  //Дата заключения вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FDATE_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FDATE_UPLEVEL%%', str);
      Delete(str, cnt, 17);
      if not VarIsNull(DataSetMakeNote.FBN('FDATE_UPLEVEL').AsVariant) then
      Insert(DataSetMakeNote.FBN('FDATE_UPLEVEL').AsString, str, cnt);
    end;
  end;

  //Номер вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNUM_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FNUM_UPLEVEL%%', str);
      Delete(str, cnt, 16);
      Insert(DataSetMakeNote.FBN('FNUM_UPLEVEL').AsString, str, cnt);
    end;
  end;

  //Регистрационный номер вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FREGNUM_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FREGNUM_UPLEVEL%%', str);
      Delete(str, cnt, 19);
      Insert(DataSetMakeNote.FBN('FREGNUM_UPLEVEL').AsString, str, cnt);
    end;
  end;

  //Краткое наименование типа договора вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FSNAME_TIPDOG_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FSNAME_TIPDOG_UPLEVEL%%', str);
      Delete(str, cnt, 25);
      Insert(DataSetMakeNote.FBN('FSNAME_TIPDOG_UPLEVEL').AsString, str, cnt);
    end;
  end;

  DataSetMakeNote.Active := false;
  DataSetMakeNote.Free;
  //Showmessage(str);
end;

 procedure SaveToTxtUSB(StrList:TStringList;path:String;name_dbf:String);
   var
     AllData:TStringList;
     F:TextFile;
     Temp:String;
     i:integer;
 begin
    AllData:=TStringList.Create;
    if FileExists(path+'\'+name_dbf) then AllData.LoadFromFile(path+'\'+name_dbf);
    Temp:='';
    AssignFile(F,path+'\'+name_dbf);
    Reset(F);
    Readln(F,Temp);
    CloseFile(F);

    if Temp='' then
    begin
       AllData.Add('Content-Type=doc/ua_payment');
       AllData.Add('');
    end;

    for i:=0 to StrList.Count - 1 do
    begin
      AllData.Add(StrList[i]);
    end;
      AllData.Add('');
    AllData.SaveToFile(path+'\'+name_dbf);
 end;

end.

