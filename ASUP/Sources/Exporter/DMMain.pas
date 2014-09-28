{******************************************************************************}
{                                                                              }
{                           (c) Klug , 2002-2004                               }
{                                                                              }
{******************************************************************************}

{                      Пакет "Конвертирование данных"                          }
{            Модуль данных                                                     }
{                                               ответственный: Тимофеев Антон  }
unit DMMain;

interface

uses
  SysUtils, Classes, IniFiles, DB, Halcn6db,  pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBQuery, Windows,
  Gauges, cxMemo, IBase, CheckLst, Forms, Variants,Dialogs;

type
  TMainDM = class(TDataModule)
    HTable: THalcyonDataSet;
    fibDB: TpFIBDatabase;
    FIBTrans: TpFIBTransaction;
    FIBSProc: TpFIBStoredProc;
  private
    Chapter: string;
    TFields : array of string;
  public
    { Public declarations }
  end;

  TExpThread = class(TThread)
  public
    ErrorMsg: String;
    INI_FILE:string;
    bar:TGauge;
    pos:Integer;
    Memolog:TcxMemo;
    textLog:String;
    DM:TMainDM;
    RG:TCheckListBox;
    TFields : array of string;
    DBFFieldList:TStrings;
    Chapter: string;
    procedure UpdateBar;
    procedure UpdateLog;
    Constructor Create(ini:string;prog:TGauge;log:TcxMemo;CB:TCheckListBox;Handle:TISC_DB_HANDLE;AOwner:TComponent);
    procedure Execute;override;
    destructor Destroy;override;
  end;

var
  MainDM: TMainDM;
  Connect: TExpThread;

implementation

{$R *.dfm}

Constructor TExpThread.Create(ini:string;prog:TGauge;log:TcxMemo;CB:TCheckListBox;Handle:TISC_DB_HANDLE;AOwner:TComponent);
begin
  DM:=TMainDM.Create(AOwner);
  DM.fibDB.Handle:=Handle;
  RG:=TCheckListBox.Create(AOwner);
  ini_file:=ini;
  bar:=prog;
  RG:=CB;
  Memolog:=log;
  inherited Create(False);
end;

procedure TExpThread.Execute;
var
  My_file:TINIFile;
  PathDBF,SPName,cval, SPPrepName, SPPostName:string;
  i, pcount, j, rcount, l, scol, field_i, error_count:integer;
  ErrorOnly:Boolean;
  DBFFieldsCount:Integer;
  UseSameParamNames:Boolean;
  P:TFIBXSQLVAR;

begin
  DBFFieldList:=TStrings.Create;

  with DM do
  begin
  Memolog.Clear;
  textLog:=DateTimeToStr(Now);
  Synchronize(UpdateLog);
  textLog:=ini_file;
  Synchronize(UpdateLog);
  if FileExists(INI_FILE)then
  begin
    try
      My_file:=TIniFile.Create(INI_FILE);
      PathDBF:= My_file.ReadString('system','DBF_Path','ERROR');
      ErrorOnly:=('T'=My_file.ReadString('system','ErrorsOnly','F'));

    except
      textLog:='Не верный ini-файл.';
      Synchronize(UpdateLog);
      Exit;
    end;
  end else
  begin
    textLog:='Невозможно установить соединение.'+#13+'Не найден файл инициализации.';
    Synchronize(UpdateLog);
    messageBox(0,PChar('Невозможно установить соединение.'+#13+'Не найден файл инициализации.'),'Ошибка доступа к данным',MB_OK);
    Exit;
  end;
  error_count:=0;
  scol:=RG.Items.Count;
  for l:=0 to scol-1 do
  begin
    error_count:=0;
    if not RG.Checked[l] then Continue;
    Chapter:=RG.Items.Strings[l];
    HTable.Close;
    HTable.TableName:=PathDBF+My_file.ReadString(Chapter,'FileName','ERROR');
    UseSameParamNames:=('T'=My_file.ReadString(Chapter,'UseSameParamsNames','F'));
    SPName:=My_file.ReadString(Chapter,'ProcNAME','ERROR');
    SPPrepName:=My_file.ReadString(Chapter,'ProcPrepNAME','ERROR');
    SPPostName:=My_file.ReadString(Chapter,'ProcPostNAME','ERROR');
    Dm.FIBTrans.StartTransaction;
    HTable.TranslateASCII:=('T'=My_file.ReadString(Chapter,'ASCII','T'));
    textlog:=Chapter;
    Synchronize(UpdateLog);

    if (SPPrepName<>'none')and(SPPrepName<>'ERROR') then
     begin
       try
         Dm.FIBTrans.StartTransaction;
         Dm.FIBSProc.StoredProcName:=SPPrepName;
         textlog:='Выполняем процедуру подготовки: '+SPPrepName;
         Synchronize(UpdateLog);
         FIBTrans.StartTransaction;
         FIBSProc.Prepare;
         FIBSProc.ExecProc;
       except on e: Exception do
         begin
           FIBTrans.Rollback;
           TextLOG:='Не удалось выполнить процедуру подготовки'+#13+'Error: '+e.Message;
           Synchronize(UpdateLog);
           Continue;
         end;
       end;
       FIBTrans.Commit;
       TextLOG:='Процедура подготовки выполнена';
       Synchronize(UpdateLog);
     end;

    Dm.FIBSProc.StoredProcName:=SPName;
  try
    HTable.Close;
    HTable.Open;
    HTable.Edit;
  except on e: Exception do
    begin
        textLog:='Не удается открыть dbf таблицу: '+HTable.TableName + #1310 +
            '(' + e.Message + ')';
        Synchronize(UpdateLog);
        HTable.Close;
        Continue;
    end;
  end;

  pcount:=DM.FIBSProc.ParamCount;
  rcount:=HTable.RecordCount;

  if rcount=0 then
    begin
      textLog:='Не правильная структура dbf таблицы (нет записей?)';
      Synchronize(UpdateLog);
      Continue;
    end;
  SetLength(TFields,pcount);

  if (not UseSameParamNames) then
  begin
    for i:=0 to pcount-1 do
        TFields[i]:=My_file.ReadString(Chapter,'Param'+IntToStr(i),'ERROR');
  end
  else
  begin
     try
        DBFFieldsCount:=HTable.Fields.Count;
        SetLength(TFields,DBFFieldsCount);
        for i:=1 to DBFFieldsCount do
        begin
            TFields[i-1]:=HTable.Fields.FieldByNumber(i).FieldName;
        end;

     except on e:Exception do
     begin
        textLog:='Ошибка!' + #13#10 + '(' +
            e.Message + ')';
        Synchronize(UpdateLog);
        Continue;
     end;
     end;

  end;

 if (not UseSameParamNames) then
 begin
  try
    for i:=0 to pcount-1 do
      if TFields[i][1]<>':' then
       HTable.FieldValues[TFields[i]];
  except on e:Exception do
    begin
      textLog:='Не правильная структура dbf таблицы ' + #13#10 + '(' +
        e.Message + ')';
      Synchronize(UpdateLog);
      Continue;
    end;
  end;
 end;

  //начали экспорт данных
  ErrorMsg := 'Экспорт успешно завершен.';
  textLog:='Начало экспорта';
  Synchronize(UpdateLog);
  HTable.First;
  Bar.MaxValue:=RCount;

  for j:=1 to RCount do
  if HTable.IsDeleted then
  begin
    HTable.Next;
    Continue;
  end
  else
  begin
    if not Terminated then
     begin
       {обработка записей буфера}
       try
         FIBTrans.StartTransaction;
         FIBSProc.StoredProcName:=SPName;
         FIBSProc.Prepare;

        if (UseSameParamNames) then
        begin
            for i:=0 to DBFFieldsCount-1 do
            begin

                P:=FIBSProc.FindParam(TFields[i]);
                if (not (P =nil))   then
                begin
                    if (VarIsType(HTable.Fields[i].Value,varBoolean))
                then
                begin
                    if HTable.Fields[i].Value
                    then
                        FIBSProc.ParamByName(TFields[i]).Value:='T'
                    else
                        FIBSProc.ParamByName(TFields[i]).Value:='F';
                end
                else
                    FIBSProc.ParamByName(TFields[i]).Value:=HTable.Fields[i].Value;
                end
                else
                begin
                    if (j=1) then
                    begin
                        TextLog:='Не найден параметр : '+TFields[i];
                        Synchronize(UpdateLog);
                    end;
                end;

            end;
        end
        else
        begin

         for i:=0 to pcount-1 do
           if TFields[i][1]<>':' then
           FIBSProc.Params[i].Value:=HTable.FieldValues[TFields[i]] else
            begin
              cval:=TFields[i];
              Delete(cval,1,2);
              case (TFields[i][2]) of
               't' : FIBSProc.Params[i].Value:=cval;
               'i' : FIBSProc.Params[i].Value:=StrToInt(cval);
               'n' : FIBSProc.Params[i].Value:=StrToFloat(cval);
               'N' : FIBSProc.Params[i].Value:= Null;
              end;
            end;
         end;
         FIBSProc.ExecProc;
       except on e: Exception do
         begin
           TextLOG:='Error: '+e.Message + #13#10 + 'Значения полей:'#13#10;
           for field_i:=1 to HTable.Fields.Count do
            TextLog := TextLog + HTable.Fields[field_i-1].FieldName+' : '+
                HTable.Fields[field_i-1].DisplayText+#13#10;
           error_count:=error_count+1;
           ErrorMsg := 'Экспорт завершен с ошибками!';
           Synchronize(UpdateLog);
           FIBTrans.Rollback;
           HTable.Next;
           Continue;
         end;
       end;
       FIBTrans.Commit;

       if not ErrorOnly then
        begin
          TextLOG:='Record #'+IntToStr(j)+' exported';
          Synchronize(UpdateLog);
        end;
       pos:=j;
       Synchronize(UpdateBar);
       HTable.Next;
    end  else
    begin
      TextLOG:='Экспорт прекращен пользователем.';
      Synchronize(UpdateLog);
      TextLOG:=IntToStr(j) + ' записей обработано';
      Synchronize(UpdateLog);
      try
        DateTimeToString(textlog,'dd-mm-yyy_hh-nn-ss',now);
        textlog := 'exporter ' + textlog;
        Memolog.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+textlog+'.log');
      except
      end;
      Exit;
      HTable.Close;
    end;
  end;

  if (SPPostName<>'none')and(SPPostName<>'ERROR') then
   begin
     try
       Dm.FIBTrans.StartTransaction;
       Dm.FIBSProc.StoredProcName:=SPPostName;
       textlog:='Выполняем завершающую процедуру: '+SPPostName;
       Synchronize(UpdateLog);
       FIBTrans.StartTransaction;
       FIBSProc.Prepare;
       FIBSProc.ExecProc;
     except on e: Exception do
      begin
        FIBTrans.Rollback;
        TextLOG:='Не удалось выполнить завершающую процедуру'+#13+'Error: '+e.Message;
        Synchronize(UpdateLog);
        Continue;
      end;
     end;
     FIBTrans.Commit;
     TextLOG:='Завершающую процедура выполнена';
     Synchronize(UpdateLog);
   end;

  TextLOG:= ErrorMsg;
  Synchronize(UpdateLog);
  TextLOG:=IntToStr(j) + ' записей обработано;'+#13#10+IntToStr(error_count)+' ошибок';
  Synchronize(UpdateLog);
  TextLOG:=DateTimeToStr(Now);
  Synchronize(UpdateLog);
  HTable.Close;
  end;
  end;
  try
    DateTimeToString(textlog,'dd-mm-yyy_hh-nn-ss',now);
    textlog := 'exporter ' + textlog;
    Memolog.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+textlog+'.log');
  except
  end;
end;

procedure TExpThread.UpdateLog;
begin
  Memolog.Lines.Add(textLog);
end;

procedure TExpThread.UpdateBar;
begin
  bar.Progress:=pos;
end;

destructor TExpThread.Destroy;
begin
  Inherited destroy;
end;
end.
