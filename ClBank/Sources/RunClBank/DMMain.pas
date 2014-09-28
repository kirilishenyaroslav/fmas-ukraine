unit DMMain;

interface

uses
  SysUtils, Classes, IniFiles, DB, Halcn6db,  pFIBQuery, QForms,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBQuery, Windows,
  Gauges,cxMemo,StdCtrls,pFIBDataSet,FIBDataSet,IBase,Buttons,ComCtrls,
  DogLoaderUnit,ExtCtrls,Graphics,cxGraphics;

type
  TMainDM = class(TDataModule)
    DBIbx: TpFIBDatabase;
    FIBTrans: TpFIBTransaction;
    FIBSProc: TpFIBStoredProc;
    HTable: THalcyonDataSet;
  private
    Chapter: string;
    TFields : array of string;
  public
  end;

  TConnect = class(TThread)
  public
    img      : Timage;
    PanelProg: TPanel;
    bar:TGauge;
    pos:Integer;
    Memolog:TcxMemo;
    textLog:String;
    HTable: THalcyonDataSet;
    DBIbx: TpFIBDatabase;
    FIBTrans,FIBWTrans: TpFIBTransaction;
    FIBSProc: TpFIBStoredProc;
    TFields : array of string;
    TFieldsSP : array of string;
    Chapter: Int64;
    Config:Integer;
    use_prover_acc_mfo_okpo :Integer;
    ButtonST:TBitBtn;
    ButtonRun:TBitBtn;
    Page:TTabSheet;
    ButtonError:TButton;
    Check_D:TDateTime;
    Check_D_Flag:Integer;
    Name_file:String;
    IsNext:Integer;
    select_doc,select_err:TpFIBDataSet;
    procedure UpdateBar;
    procedure UpdateLog;
    procedure Automat;
    Constructor create(panel:TPanel;image: Timage;prog:TGauge;log:TcxMemo;DataSet:THalcyonDataSet;DB:TpFIBDataBase;
                       TR,WTR:TpFIBTransaction;SP:TpFIBStoredProc;id_Ch:Int64;DBH:TISC_DB_HANDLE;
                       ButtonStop,ButtonStart:TBitBtn;Pages:TTabSheet;ButtonErr:TButton;
                       Check_Date:TDateTime;Check_Date_Flag:Integer;Name_file_EX:String);
    procedure Execute;override;
    destructor Destroy;override;
  end;

var
  MainDM: TMainDM;
  Connect: TConnect;

implementation

uses Variants;

{$R *.dfm}

function ConvertDate(ADate : String; AConv_date : integer) : TDateTime;
var
    d, m, y, s : string;
    mon, yy    : Boolean;
    i          : integer;
begin
    mon := false;
    yy  := false;
    d   := '';
    m   := '';
    y   := '';
    s   := '';
    // date format YYYYMMDD
    if (AConv_date=1) then
    begin
        y := copy(ADate, 1, 4);
        m := copy(ADate, 5, 2);
        d := copy(ADate, 7, 2);

        s := d + '.' + m + '.' + y;

        ConvertDate  := StrToDate(s);
    end;
    {for i:=1 to Length(ADate) do
    begin
        s := copy(ADate, i, 1);
        if (s = '/') or (s = ',') or (s = '.') or (s = '-') then
        begin
            if not mon then mon := true else
                if not yy then yy := true;
        end else
        begin
            if not mon then
                d := d + s;

            if (mon) and (not yy) then
                m := m + s;

            if (mon) and (yy) then
                y := y + s;
        end
    end;

    if Length(m) = 1 then m := '0' + m;
    if Length(d) = 1 then d := '0' + d;
    if Length(y) = 2 then y := '20' + y;

    s := m + '.' + d + '.' + y;

    ConvertDate  := StrToDate(s);}
end;


Constructor TConnect.create(panel:TPanel;image: Timage;prog:TGauge;log:TcxMemo;DataSet:THalcyonDataSet;DB:TpFIBDataBase;
                            TR,WTR:TpFIBTransaction;SP:TpFIBStoredProc;id_Ch:Int64;DBH:TISC_DB_HANDLE;
                            ButtonStop,ButtonStart:TBitBtn;Pages:TTabSheet;ButtonErr:TButton;
                            Check_Date:TDateTime;Check_Date_Flag:Integer;Name_file_EX:String);
begin
  inherited Create(False);
  img      := image;
  PanelProg:= panel;
  bar:=prog;
  Memolog:=log;
  HTable:=DataSet;
  DBIbx:=DB;
  DBIbx.Handle:=DBH;
  FIBTrans:=TR;
  FIBWTrans:=WTR;
  FIBSProc:=SP;
  Chapter:=id_Ch;
  ButtonST:=ButtonStop;
  ButtonRun:=ButtonStart;
  Page:=Pages;
  ButtonError:=ButtonErr;
  Check_D:=Check_Date;
  Check_D_Flag:=Check_Date_Flag;
  Name_file:=Name_file_EX;
end;

procedure TConnect.Execute();
var
  PathDBF:string;
  PathFileToFind:String;
  SPName:string;
  i,n, pcount,pcount_temp, j, rcount:integer;
  select:TpFIBDataSet;
  select_conf:TpFIBDataSet;
  select_del_rec:TpFIBDataSet;
  DD,MM,YYYY:Word;
  MMS,DDS:String;
  use_auto:Integer;
  conv_date     : integer;
  count_records : integer;
  //use_prover_acc_mfo_okpo : integer;
  id_ses : string;
  str : string[255];
begin
  PanelProg.Visible :=false;
  Memolog.Lines.Clear;
  textLog:=DateTimeToStr(Now);
  Synchronize(UpdateLog);

  select_conf:=TpFIBDataSet.Create(nil);
  select_conf.Transaction:=FIBTrans;
  select_conf.Database:=DBIbx;
  select_conf.SQLs.SelectSQL.Clear;
  select_conf.SQLs.SelectSQL.Add('select * from clbank_ini_param,clbank_ini where clbank_ini.id_bank='''+VarToStr(Chapter)+''' and clbank_ini_param.id_bank=clbank_ini.id_bank');
  select_conf.Active:=true;
  select_conf.FetchAll;

  use_prover_acc_mfo_okpo := select_conf.FieldByName('USE_PROVERKA_ACC_MFO_OKPO').AsInteger;
  conv_date               := select_conf.FieldByName('DATE_CONVERT').AsInteger;

  if select_conf.FieldByName('CONVERT_STRING').AsInteger=1 then
    begin
      HTable.TranslateASCII:=false;
    end
    else
    begin
      HTable.TranslateASCII:=true;
    end;


  PathDBF:=select_conf.FieldByName('PATH_FILE').AsString;

  if select_conf.FieldByName('CONST_FILE_NAME').AsInteger=0 then
    begin
      //поиск файла
      DecodeDate(Now,yyyy,mm,dd);
      PathFileToFind:=ExtractFilePath(PathDBF);
      if MM<10 then
        begin
          MMS:='0'+IntToStr(mm);
        end
        else
        begin
          MMS:=IntToStr(mm);
        end;
      if DD<10 then
        begin
          DDS:='0'+IntToStr(DD);
        end
        else
        begin
          DDS:=IntToStr(DD);
        end;
      PathDBF:=PathFileToFind+IntToStr(yyyy)+MMS+DDS+'.dbf';
    end;

  if select_conf.FieldByName('USE_NAME_KAZN').AsInteger=1 then
    begin
      //поиск файла
      DecodeDate(Now,yyyy,mm,dd);
      PathFileToFind:=ExtractFilePath(PathDBF);
      if MM<10 then
        begin
          MMS:='0'+IntToStr(mm);
        end
        else
        begin
          MMS:=IntToStr(mm);
        end;
      if DD<10 then
        begin
          DDS:='0'+IntToStr(DD);
        end
        else
        begin
          DDS:=IntToStr(DD);
        end;
      PathDBF:=PathFileToFind+'dg'+DDS+MMS+Copy(IntToStr(yyyy),3,2)+'.dbf';
    end;

  if (Chapter=-1) or (select_conf.FieldByName('CHOOSE_FILE').AsInteger=1) then
    begin
      PathDBF:=Name_file;
    end;


  textLog:='Файл данних '+PathDBF;
  Synchronize(UpdateLog);
  HTable.TableName:=PathDBF;
  SPName:=select_conf.FieldByName('NAME_SP').AsString;
  textLog:='Процедура обработки '+SPName;
  Synchronize(UpdateLog);
  try
    DBIbx.Connected:=true;
    FIBTrans.StartTransaction;
    FIBSProc.StoredProcName:=SPName;
    FIBSProc.Prepare;
    except
      begin
        textLog:='Данной процедури не існує в БД';
        Synchronize(UpdateLog);
        messageBox(0,PChar('Данной процедури не існує в БД'),'Помилка.',MB_OK);
        Application.Terminate;
      end;
  end;
  try
    HTable.Active:=true;
    HTable.Edit;
  Except
    begin
      textLog:='Файл заблокован іншим користувачем, або не існує.';
      Synchronize(UpdateLog);
      HTable.Active:=false;
      Exit;
    end;
  end;
  if HTable.RecordCount=0 then
    begin
      textLog:='dbf Файл пустий';
      Synchronize(UpdateLog);
      Exit;
    end
    else
    begin
      textLog:='Кількість записів:';
      Synchronize(UpdateLog);
      textLog:=IntToStr(HTable.RecordCount);
      Synchronize(UpdateLog);
    end;

//   pcount:=FIBSProc.ParamCount; add 11.03.2009 by Olga
   pcount:=select_conf.RecordCount;
   rcount:=HTable.RecordCount;
   SetLength(TFields,pcount);
   SetLength(TFieldsSP,pcount);
   select_conf.First;
   pcount_temp:=0;
   for i:=0 to pcount-1 do
     begin
       if (select_conf.FieldByName('NAME_FILE_PARAMETRS').AsString<>'Ігнорувати поле') then
          begin
            TFields[pcount_temp]:=select_conf.FieldByName('NAME_FILE_PARAMETRS').AsString;
            TFieldsSP[pcount_temp]:=select_conf.FieldByName('NAME_SP_PARAMETRS').AsString;
            inc(pcount_temp);
          end;
       select_conf.Next;
     end;
   pcount:=pcount_temp;
  try
     for i:=1 to pcount do
     begin
       HTable.FieldValues[TFields[i-1]];
     end;
   except
    begin
      textLog:='не вірна структура файлу';
      Synchronize(UpdateLog);
      Exit;
    end;
  end;
  //начали экспорт данных
  textLog:='Початок экспорта данних '+DateToStr(Now);
  Synchronize(UpdateLog);
  HTable.First;
  Bar.MaxValue:=RCount;
  FIBSProc.Database:=DBIbx;
  FIBSProc.Transaction:=FIBTrans;
  FIBTrans.StartTransaction;
  FIBSProc.StoredProcName:=SPName;
  FIBSProc.Prepare;

  for j:=1 to rcount do
    begin
     if not Terminated then
       begin
        {обработка записей буфера}
        for i:=1 to pcount do
          begin
            if (TFieldsSP[i-1]='IN_ACC_A') or (TFieldsSP[i-1]='IN_ACC_B') or
               (TFieldsSP[i-1]='IN_OKPO_A') or (TFieldsSP[i-1]='IN_OKPO_B') or
               (TFieldsSP[i-1]='IN_NATIVE_ACC')
            then
              begin
                FIBSProc.ParamByName(TFieldsSP[i-1]).AsInt64:=HTable.FieldValues[TFields[i-1]];
              end
              else
              begin
                if (TFieldsSP[i-1]='IN_SUM_KAZN')then
                  begin
                      FIBSProc.ParamByName(TFieldsSP[i-1]).Value:=VarToStr(HTable.FieldValues[TFields[i-1]]);
                  end
                  else
                  begin
                    if ((TFieldsSP[i-1]='IN_DATE_PROV') or (TFieldsSP[i-1]='IN_DATE_DOC'))then
                      begin
                          if (conv_date=0) or (conv_date=null) then
                          begin
                              FIBSProc.ParamByName(TFieldsSP[i-1]).AsDate := VarToDateTime(HTable.FieldValues[TFields[i-1]]);
                          end
                          else
                          begin
                              FIBSProc.ParamByName(TFieldsSP[i-1]).AsDate:=ConvertDate(VarToStr(HTable.FieldValues[TFields[i-1]]), conv_date);
                          end;
                      end
                      else
                      if (TFieldsSP[i-1]='IN_SUM_DOC')then
                      begin
                          FIBSProc.ParamByName(TFieldsSP[i-1]).AsCurrency:=HTable.FieldValues[TFields[i-1]];
                      end else
                      if (TFieldsSP[i-1]='IN_TYPE_DOC')then
                      begin
                          if Vartype(HTable.FieldValues[TFields[i-1]])=VarString then
                          begin
                              str :=HTable.FieldValues[TFields[i-1]];
                              if ((Ord(str[1]) >= 48) and (Ord(str[1]) <= 57)) then
                                  FIBSProc.ParamByName(TFieldsSP[i-1]).Value:=HTable.FieldValues[TFields[i-1]]
                              else FIBSProc.ParamByName(TFieldsSP[i-1]).Value:=Ord(str[1])
                          end
                        else
                            FIBSProc.ParamByName(TFieldsSP[i-1]).Value:=HTable.FieldValues[TFields[i-1]];
                      end else
                      begin
                        if Vartype(HTable.FieldValues[TFields[i-1]])=VarString then
                        FIBSProc.ParamByName(TFieldsSP[i-1]).Value:=HTable.FieldValues[TFields[i-1]]
                       else
                          FIBSProc.ParamByName(TFieldsSP[i-1]).Value:=vartostr(HTable.FieldValues[TFields[i-1]]);
                      end;
                  end;
              end;
          end;
        FIBSProc.ParamByName('IN_ID_BANK').AsInt64:=Chapter;
        if Check_D_Flag=1 then
          FIBSProc.ParamByName('IN_DATE_CHECK').AsDateTime:=Check_D;

          try
            FIBSProc.ExecProc;
            Except
              begin
                TextLOG:='Помилка при виконанні процедури: ' + FIBSProc.StoredProcName + ' i = ' + IntToStr(j) + ' N документу =' + FIBSProc.ParamByName('IN_NUMBER_DOC').AsString;
                Synchronize(UpdateLog);
//                FIBTrans.Rollback;
               end;
             end;
         pos:=j;
         Synchronize(UpdateBar);
         HTable.Next;
    end
    else
      begin
        TextLOG:='Экспорт зупинен користувачем.';
        Synchronize(UpdateLog);
        FIBTrans.Commit;
        ButtonST.Enabled:=False;
        ButtonRun.Enabled:=true;
        Page.TabVisible:=true;
        Exit;
      end;
    end;
  TextLOG:='Экспорт виконан успішно '+DateTimeToStr(Now);;
  Synchronize(UpdateLog);
  HTable.Active:=false;
  //Удаление файла
  if select_conf.FieldByName('FILE_NOT_DELETE').AsInteger=0 then
    begin
      DeleteFile(PChar(PathDBF));
    end;

  FIBTrans.Commit;
  TextLOG:='Почали обробку даних';
  Synchronize(UpdateLog);

  select:=TpFIBDataSet.Create(nil);
  select.Transaction:=FIBTrans;
  select.Database:=DBIbx;
  select.SQLs.SelectSQL.Add('select id_key_local from clbank_tmp_buffer where id_bank='+VarToStr(Chapter));
  select.Active:=true;
  select.FetchAll;

  count_records := select.RecordCount;

  if select.RecordCount=0 then
    begin
      TextLOG:='Немає даних для обробки';
      Synchronize(UpdateLog);
    end
    else
    begin

      TextLOG:='Даних для обробки у буфері';
      Synchronize(UpdateLog);
      TextLOG:=IntToStr(select.RecordCount);
      Synchronize(UpdateLog);
      Bar.MaxValue:=select.RecordCount;
      pos:=0;
      Synchronize(UpdateBar);

      FIBSProc.StoredProcName:='CLBANK_CLEARLOG';
      FIBTrans.StartTransaction;
      FIBSProc.Prepare;
      FIBSProc.ParamByName('IN_ID_BANK').AsInteger:=Chapter;
      try
        FIBSProc.ExecProc;
        FIBTrans.Commit;
      except
        begin
             FIBTrans.Rollback;
             Exit;
        end;
      end;
     //exit;
    if use_prover_acc_mfo_okpo=1 then
    begin
      PanelProg.Visible:=true;
      Img.Visible:=True;
      select.Active:=true;
      select.FetchAll;

      FIBSProc.StoredProcName:='CLBANK_PROVERKA_MFO_OKPO_ACC';
      FIBSProc.Prepare;
      FIBTrans.StartTransaction;
      Synchronize(UpdateBar);
      TextLOG:='Идет проверка р/с';
      Synchronize(UpdateLog);
          try
            FIBSProc.ExecProc;
            FIBTrans.Commit;
            id_ses := inttostr(FIBSProc.ParamByName('ID_SES').AsInt64);
            except
              begin
                  FIBTrans.Rollback;
                  Exit;
              end;
            end;

      PanelProg.Visible:=false;
      Img.Visible:=false;

      select_del_rec:=TpFIBDataSet.Create(nil);
      select_del_rec.Transaction:=FIBTrans;
      select_del_rec.Database:=DBIbx;
      select_del_rec.SQLs.SelectSQL.Add('select cl.NUMBER_DOC, cl.SUM_DOC, cl.DETAIS_DOC from CLBANK_DELETED_RECORDS cl where  cl.id_session='+id_ses);
      select_del_rec.Active:=true;
      select_del_rec.FetchAll;
      TextLOG:= 'Видалення документів, приймаючих участь у русі між двома транзитними рахунками';
      Synchronize(UpdateLog);

      if select_del_rec.RecordCount>0 then
      begin
          n :=0;
          select_del_rec.First;
          for n:=0 to select_del_rec.RecordCount-1 do
          begin
              TextLOG:= 'Видалення документу  № '+select_del_rec.FieldByName('NUMBER_DOC').AsString+' на суму '+select_del_rec.FieldByName('SUM_DOC').AsString+' '+select_del_rec.FieldByName('DETAIS_DOC').AsString;
              Synchronize(UpdateLog);
              select_del_rec.Next;
          end;
      end;

    end;

      select.Active:=true;
      select.FetchAll;
      //exit;
      Bar.MaxValue:=select.RecordCount;
      FIBSProc.StoredProcName:='CLBANK_TMP_BUFFER_START';
      FIBTrans.StartTransaction;
      FIBSProc.Prepare;
      select.First;

      for i:=0 to select.RecordCount-1 do
        begin
          FIBSProc.ParamByName('ID_KEY_LOCAL').AsInt64:=TFibBCDField(select.Fieldbyname('ID_KEY_LOCAL')).asint64;
          select.Next;
          pos:=i;
          Synchronize(UpdateBar);
          try
            FIBSProc.ExecProc;
            except
              begin
                TextLOG:='Помилка при виконaннi процедури  '+select.FieldByName('ID_KEY_LOCAL').AsString;
                Synchronize(UpdateLog);
              end;
            end;
        end;
      pos:=i+1;
      Synchronize(UpdateBar);
      TextLOG:='Обрoбка закінчена '+DateTimeToStr(Now);
      Synchronize(UpdateLog);
      TextLOG:='Видалення файла '+PathDBF;

      FIBTrans.Commit;
      Synchronize(UpdateLog);

      FIBTrans.StartTransaction;
      select_conf:=TpFIBDataSet.Create(nil);
      select_conf.Transaction:=FIBTrans;
      select_conf.Database:=DBIbx;
      select_conf.SQLs.SelectSQL.Clear;
      select_conf.SQLs.SelectSQL.Add('select * from clbank_ini_param,clbank_ini where clbank_ini.id_bank='''+VarToStr(Chapter)+''' and clbank_ini_param.id_bank=clbank_ini.id_bank');
      select_conf.Active:=true;
      select_conf.FetchAll;


      //автоматическая обработка
      if select_conf.FieldByName('USE_AUTOMAT').AsInteger=1 then
        begin
          TextLOG:='Автоматичка обробка даних';
          Synchronize(UpdateLog);

          select_doc:=TpFIBDataSet.Create(nil);
          select_doc.Transaction:=FIBTrans;
          select_doc.Database:=DBIbx;
          select_doc.SQLs.SelectSQL.Clear;
          select_doc.SQLs.SelectSQL.Add('select * from CLBANK_ERROR(:IN_ID_BANK) order by id_key_local');
          select_doc.ParamByName('IN_ID_BANK').AsInt64:=Chapter;
          select_doc.Active:=true;
          select_doc.FetchAll;

          select_err:=TpFIBDataSet.Create(nil);
          select_err.Transaction:=FIBTrans;
          select_err.Database:=DBIbx;
          select_err.SQLs.SelectSQL.Clear;
          select_err.SQLs.SelectSQL.Add('select * from CLBANK_ERROR_DETAILS(:ID_KEY_LOCAL) where id_error in (1,2,7,3,4) ');



          Bar.MaxValue:=select_doc.recordcount;
          pos:=0;
          Synchronize(UpdateBar);
          IsNext:=0;
          Automat();

        end;


      ButtonST.Enabled:=False;
      ButtonRun.Enabled:=true;
      Page.TabVisible:=true;
      pos:=0;
      Synchronize(UpdateBar);
    end;
ButtonError.Enabled:=true;
end;


procedure TConnect.Automat;
var
  Rec:TImportCustRateAcc;
  Bank:TImportBank;
  Cust:TImportCustomer;
  t:Boolean;
  i:Integer;
  name_cust:String;
  l : integer;
  str : string;
//  WorkDublicate:TfrmWorkWithDublicate;
begin
    t := false;
    if IsNext=0 then
    begin
        select_doc.Active:=false;
        select_doc.Active:=true;
        select_doc.FetchAll;
        select_doc.First;
    end
    else
    begin
        select_doc.Next;
    end;
    if select_doc.RecordCount=0 then exit;

    select_err.Active:=false;
    select_err.ParamByName('ID_KEY_LOCAL').AsInt64:=select_doc.FIeldByName('ID_KEY_LOCAL').asVariant;
    select_err.Active:=true;
    select_err.FetchAll;
    select_err.Last;

    if select_err.FieldbyName('id_error_data').AsVariant>=1 then
    begin
        //отбираем ошибку
        FillChar(cust, SizeOf(TImportCustomer), 0);
        FillChar(Bank, SizeOf(TImportBank), 0);
        FillChar(Rec, SizeOf(TImportCustRateAcc), 0);

        FIBSProc.StoredProcName:='CLBANK_WORK_WITH_ERROR';
        FIBSProc.Transaction:=FIBWTrans;
        FIBSProc.Transaction.StartTransaction;
        FIBSProc.Prepare;
        FIBSProc.ParamByName('ID_ERROR_DATA').AsInt64:=select_err.FieldbyName('id_error_data').AsVariant;
        try
          FIBSProc.ExecProc;
          except
            begin
                TextLOG:='Помилка при виконанні процедури автоматичної обробки даних.';
                Synchronize(UpdateLog);
            end;
        end;
        if FIBSProc.ParamByName('ID_ERROR').AsInteger=1 then
        begin
            rec.id_customer:=FIBSProc.ParamByName('ID_CUSTOMER').AsInt64;
            rec.id_cust_rate_acc:=-1;
            rec.rate_account:=FIBSProc.ParamByName('ACC').AsString;
            Rec.id_bank:=FIBSProc.ParamByName('ID_BANK').AsInteger;
            Rec.id_type_account:=31399;
            Rec.date_beg:=FIBSProc.ParamByName('DATE_BEG_ACC').AsDate;
            Rec.date_end:=FIBSProc.ParamByName('DATE_END_ACC').AsDate;
            Rec.bShowInfo:=False;
            FIBWTrans.Commit;

            t:=ImportCustRateAcc(Rec,nil,DBIbx.Handle,FIBWTrans.Handle);

            if(t=true) then
                 TextLOG:='Додали Р/Р: '+ rec.rate_account
            else
            begin
                 TextLOG:='Помилка при додаванні р/р: '+ rec.rate_account;
                 //TextLOG:= showmessage(Self);
            end;

            Synchronize(UpdateLog);
        end;

        if (FIBSProc.ParamByName('ID_ERROR').AsInteger=2) or (FIBSProc.ParamByName('ID_ERROR').AsInteger=7) then
        begin
            Bank.mfo:=FIBSProc.ParamByName('MFO').AsString;
            Bank.name:=FIBSProc.ParamByName('BANK').AsString;
            Bank.city:='';
            Bank.bShowInfo:=False;
            FIBWTrans.Commit;
            t:=ImportBank(Bank,nil,DBIbx.Handle,FIBWTrans.Handle);
            if(t=true) then
                TextLOG:='Додали банк: МФО '+ Bank.mfo+' '+Bank.name
            else
                TextLOG:='Помилка при додаванні банку: МФО '+ Bank.mfo+' '+Bank.name;
            Synchronize(UpdateLog);
        end;
        if (FIBSProc.ParamByName('ID_ERROR').AsInteger=3) or (FIBSProc.ParamByName('ID_ERROR').AsInteger=4) then
          begin
            Cust.id_customer:=-1;
            Cust.id_higher_instance:=-1;
            Cust.name_customer:=StringReplace(FIBSProc.ParamByName('NAME_CUSTOMER').AsString,'''','"',[]);
            Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
            Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
            Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
            Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
            Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
            l := Length(Cust.name_customer);
            i := 1;
            while (i<=l) do
            begin
                str := Copy(Cust.name_customer,i,1);
                if (str='?') then Cust.name_customer[i] := ' ';
                i := i+1;
            end;
            Cust.short_name:='';
            Cust.kod_edrpou:=FIBSProc.ParamByName('OKPO').AsString;
            Cust.date_nns:=Now;
            Cust.nns:='';
            Cust.nalog_nom:=-1;
            Cust.fiz_lico:=-1;
            Cust.plat_nds:=-1;
            Cust.pay_nds:=-1;
            Cust.id_type_property:=-1;
            Cust.id_branch:=-1;
            Cust.bShowInfo:=False;

            FIBWTrans.Commit;
            t:=ImportCustomer(Cust,nil,DBIbx.Handle,FIBWTrans.Handle);
            if(t=true) then
                TextLOG:='Додали конрагента: ОКПО '+ Cust.kod_edrpou+' '+Cust.name_customer
            else
                TextLOG:='Помилка при додаванні конрагента: ОКПО '+ Cust.kod_edrpou+' '+Cust.name_customer;
             Synchronize(UpdateLog);
          end;


      if (t=true)then
        begin
          IsNext:=0;
          pos:=Bar.MaxValue-select_doc.RecordCount;
          Synchronize(UpdateBar);
        end
        else
        begin
          IsNext:=1;
        end;
    end
    else
    begin
      IsNext:=1;
    end;

    if (select_doc.Eof<>True) and (IsNext=0) then
    begin
        FIBSProc.StoredProcName:='CLBANK_CLEARLOG';
        FIBWTrans.StartTransaction;
        FIBSProc.Prepare;
        FIBSProc.ParamByName('IN_ID_BANK').AsInt64:=Chapter;
        try
            FIBSProc.ExecProc;
            FIBWTrans.Commit;
        except
            begin
                FIBWTrans.Rollback;
            end;
        end;

        if use_prover_acc_mfo_okpo=1 then
        begin
            FIBSProc.StoredProcName:='CLBANK_PROVERKA_MFO_OKPO_ACC';
            FIBTrans.StartTransaction;
            FIBSProc.Prepare;
            try
              FIBSProc.ExecProc;
              FIBTrans.Commit;
              except
                begin
                    FIBTrans.Rollback;
                end;
              end;
        end;

        FIBSProc.StoredProcName:='CLBANK_TMP_BUFFER_START';
        FIBWTrans.StartTransaction;
        FIBSProc.Prepare;
        select_doc.First;
        for i:=0 to select_doc.RecordCount-1 do
          begin
            FIBSProc.ParamByName('ID_KEY_LOCAL').Value:=select_doc.FieldByName('ID_KEY_LOCAL').AsString;
            select_doc.Next;
            try
              FIBSProc.ExecProc;
              except
                begin
                end;
              end;
          end;
        FIBWTrans.Commit;

        Automat();
     end else
     if (select_doc.Eof<>True) and (IsNext=1) then
     begin
          select_doc.Next;
          Automat();
     end;
end;



procedure TConnect.UpdateLog;
begin
  Memolog.Lines.Add(textLog);
end;

procedure TConnect.UpdateBar;
begin
  bar.Progress:=pos;
end;

destructor TConnect.Destroy;
begin
  Inherited destroy;
end;

end.
