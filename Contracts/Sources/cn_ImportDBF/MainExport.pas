unit MainExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, cxLookAndFeelPainters, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, DB, RxMemDS,
  IniFiles, Halcn6db, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase,pFIBDataSet, Gauges, IBase, cn_Common_Types, cn_Common_Funcs;

type
  TfrmMainForm = class(TForm)
    StatusBar1: TStatusBar;
    Timer: TTimer;
    cxButton1: TcxButton;
    cxLabelIniFile: TcxLabel;
    OpenDialogIni: TOpenDialog;
    RxMemoryDataSection: TRxMemoryData;
    Section: TComboBox;
    GroupBox1: TGroupBox;
    MemoLog: TMemo;
    cxButton2: TcxButton;
    DBIbx: TpFIBDatabase;
    FIBTrans: TpFIBTransaction;
    FIBSProc: TpFIBStoredProc;
    HTable: THalcyonDataSet;
    bar: TGauge;
    GaugeAll: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    procedure RunSP(SecName:String);
    procedure RunDBF(SecName:String);
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
    { Private declarations }
  public
    { Public declarations }
  end;

  function ShowImport(AParameter:TcnSimpleParams):Variant;stdcall;
  exports  ShowImport;
var
  frmMainForm: TfrmMainForm;
  TimeS:TTime;
  res:Variant;

implementation

{$R *.dfm}

function ShowImport(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmMainForm;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmMainForm) then exit;
 ViewForm := TfrmMainForm.Create(AParameter.Owner, AParameter.Db_Handle);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
Result:=res;
end;


constructor TfrmMainForm.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DBIbx.Handle:=DB_Handle;
Screen.Cursor:=crDefault;
end;

procedure TfrmMainForm.cxButton1Click(Sender: TObject);
begin
{  OpenDialogIni.Execute;
  if OpenDialogIni.FileName<>'' then
    begin
      cxLabelIniFile.Caption:=OpenDialogIni.FileName;
   end;}
end;

procedure TfrmMainForm.cxButton2Click(Sender: TObject);
var
  i:Integer;
  Ini:TiniFile;
  prevSection:String;
begin
  MemoLog.Clear;
  //начинаем подготовку к забору данных
  MemoLog.Lines.Add(TimeToStr(Now));
  MemoLog.Lines.Add('Начинаем подготовку к забору данных.Формирование списка таблиц и процедур.');
  Section.Items.Clear;
  ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Contracts\DBF.ini');
  OpenDialogIni.FileName:= ExtractFilePath(Application.ExeName)+'\Contracts\DBF.ini';
  ini.ReadSections(Section.Items);
  RxMemoryDataSection.EmptyTable;
  GaugeAll.MaxValue:=Section.Items.Count;
  for i:=0 to Section.Items.Count-1 do
  begin
    RxMemoryDataSection.Open;
    RxMemoryDataSection.Insert;
    RxMemoryDataSection.FieldByName('RxSection').Value:=Section.Items[i];
    RxMemoryDataSection.Post;
  end;
  MemoLog.Lines.Add('Подготовка завершена.');
  //Начинаем анализировать секции и запускаем затем соответствующие функции
  RxMemoryDataSection.Last;
  Timer.Enabled:=true;
  TimeS:=Now;
  prevSection:='';
  for i:=0 to RxMemoryDataSection.RecordCount-1 do
    begin
      if RxMemoryDataSection.FieldByName('RxSection').AsString=prevSection+'SP' then
        begin
          RunSP(RxMemoryDataSection.FieldByName('RxSection').AsString);
        end
        else
        begin
          RunDBF(RxMemoryDataSection.FieldByName('RxSection').AsString);
        end;
      prevSection:=RxMemoryDataSection.FieldByName('RxSection').AsString;
      GaugeAll.Progress:=i+1;
      RxMemoryDataSection.Prior;
    end;
end;


procedure TfrmMainForm.RunSP(SecName:String);
var
  My_file:TINIFile;
  Server_name:string;
  PathServ:string;
  SPName:string;
  SPCount,i:Integer;
begin
  bar.Progress:=0;
  if FileExists(OpenDialogIni.FileName)
  then begin
        try
          My_file:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Contracts\DBF.ini');
          MemoLog.Lines.Add('Обработка секции '+SecName);
//          Server_name:= My_file.ReadString(SecName,'Server_Name','ERROR');
        except
          MemoLog.Lines.Add('Непривильная структура файла конфигурации');
          ShowMessage('Непривильная структура файла конфигурации');
          Refresh;
          Application.Terminate;
        end;
        try
//          MemoLog.Lines.Add(server_name);
//          DBIbx.DatabaseName:=server_name;
//          DBIbx.Connected:=true;
          FIBTrans.StartTransaction;
          FIBSProc.StoredProcName:=SPName;

        except
          MemoLog.Lines.Add('Невозможно установить соединение.'+#13+'Проверьте правильность настроек  доступа к данным');
          Refresh;
          messageBox(0,PChar('Невозможно установить соединение.'+#13+'Проверьте правильность настроек  доступа к данным'),'Ошибка доступа к данным',MB_OK);
          Exit;
        end;
      end
  else begin
        MemoLog.Lines.Add('Невозможно установить соединение.'+#13+'Не найден файл инициализации.');
        Refresh;
        messageBox(0,PChar('Невозможно установить соединение.'+#13+'Не найден файл инициализации.'),'Ошибка доступа к данным',MB_OK);
        Exit;
      end;

 SPCount:= StrToInt(My_file.ReadString(SecName,'SPCount','ERROR'));
 for i:=1 to SPCount do
   begin
      SPName:=My_file.ReadString(SecName,'ProcNAME'+IntToStr(i),'ERROR');
      MemoLog.Lines.Add('Выполнение процедуры '+SPName);
      FIBSProc.Database:=DBIbx;
      FIBSProc.Transaction:=FIBTrans;
      FIBTrans.StartTransaction;
      FIBSProc.StoredProcName:=SPName;
      FIBSProc.Prepare;
      try
        FIBSProc.ExecProc;
      Except
        begin
          FIBTrans.Rollback;
          ShowMessage('dbf Файл пустой');
          Exit;
        end;
      end;
      FIBTrans.Commit;
   end;
end;

procedure TfrmMainForm.RunDBF(SecName:String);
var
  My_file:TINIFile;
  Server_name:string;
  PathDBF:string;
  PathServ:string;
  SPName,sp_delete:string;
  i, pcount, j, rcount:integer;
  max_kod_seup:Integer;
  select:TpFIBDataSet;
  TFields : array of string;
  TFieldsSP : array of string;
begin
  if FileExists(OpenDialogIni.FileName)
  then begin
        try
          My_file:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Contracts\DBF.ini');
          PathDBF:= My_file.ReadString(SecName,'PathDBF','ERROR');
          MemoLog.Lines.Add('Обработка секции '+SecName);
          HTable.Active:=false;
          MemoLog.Lines.Add(PathDBF);
          HTable.TableName:=PathDBF;
          HTable.IndexFiles.Clear;
//          Server_name:= My_file.ReadString(SecName,'Server_Name','ERROR');
          SPName:=My_file.ReadString(SecName,'ProcNAME','ERROR');
          sp_delete:=My_file.ReadString(SecName,'SPDelete','ERROR');
        except
          MemoLog.Lines.Add('Непривильная структура файла конфигурации');
          ShowMessage('Непривильная структура файла конфигурации');
          exit;
        end;
        try
//          MemoLog.Lines.Add(server_name);
//          DBIbx.DatabaseName:=server_name;
//          DBIbx.Connected:=true;
          FIBTrans.StartTransaction;
          FIBSProc.StoredProcName:=SPName;

        except
          MemoLog.Lines.Add('Невозможно установить соединение.'+#13+'Проверьте правильность настроек  доступа к данным');
          messageBox(0,PChar('Невозможно установить соединение.'+#13+'Проверьте правильность настроек  доступа к данным'),'Ошибка доступа к данным',MB_OK);
          Exit;
        end;
      end
  else begin
        MemoLog.Lines.Add('Невозможно установить соединение.'+#13+'Не найден файл инициализации.');
        messageBox(0,PChar('Невозможно установить соединение.'+#13+'Не найден файл инициализации.'),'Ошибка доступа к данным',MB_OK);
        Exit;
      end;
  try
    HTable.Active:=true;
    HTable.Append;
    HTable.IndexFileInclude(My_file.ReadString(SecName,'CDX','ERROR'));
  Except
    begin
      MemoLog.Lines.Add('dbf файл заблокированым другим пользователем');
      HTable.Active:=false;
      ShowMessage('dbf файл заблокированым другим пользователем');
      Exit;
    end;
  end;
  if HTable.RecordCount=0 then
    begin
      MemoLog.Lines.Add('dbf Файл пустой');
      ShowMessage('dbf Файл пустой');
      Exit;
    end;
   pcount:=FIBSProc.ParamCount;
   rcount:=HTable.RecordCount;
   SetLength(TFields,pcount);
   SetLength(TFieldsSP,pcount);
   for i:=0 to pcount-1 do
   begin
     TFields[i]:=My_file.ReadString(SecName,FIBSProc.Params[i].Name,'ERROR');
     TFieldsSP[i]:=FIBSProc.Params[i].Name;
   end;
  try
     for i:=1 to pcount do
     begin
       HTable.FieldValues[TFields[i-1]];
     end;
   except
    begin
      MemoLog.Lines.Add('Неверная структура dbf файла');
      Exit;
    end;
  end;

  FIBSProc.Database:=DBIbx;
  FIBSProc.Transaction:=FIBTrans;
  FIBTrans.StartTransaction;
  FIBSProc.StoredProcName:=sp_delete;
  FIBSProc.Prepare;
  FIBSProc.ExecProc;
  FIBTrans.Commit;

  MemoLog.Lines.Add('Начало экспорта данный');
  HTable.First;
  Bar.MaxValue:=RCount;
  FIBSProc.Database:=DBIbx;
  FIBSProc.Transaction:=FIBTrans;
  FIBTrans.StartTransaction;
  FIBSProc.StoredProcName:=SPName;
  FIBSProc.Prepare;
  for j:=1 to rcount do
    begin
              for i:=1 to pcount do
                begin
                  if TFieldsSP[i-1]='ID_KOD' then
                    begin
                      FIBSProc.ParamByName(TFieldsSP[i-1]).AsInt64:=HTable.FieldValues[TFields[i-1]];
                    end
                    else
                    begin
                      if TFieldsSP[i-1]='TN' then
                        begin
                          FIBSProc.ParamByName(TFieldsSP[i-1]).AsInteger:=HTable.FieldValues[TFields[i-1]];
                        end
                        else
                        begin
                          if (TFieldsSP[i-1]='ID_N_NALOG') or (TFieldsSP[i-1]='ID_STAGE') or (TFieldsSP[i-1]='ID_LIST') or
                          (TFieldsSP[i-1]='NOM_LIST') or (TFieldsSP[i-1]='ID_KEY') or (TFieldsSP[i-1]='NUM_LIST') or (TFieldsSP[i-1]='NOM_PROP')
                          or (TFieldsSP[i-1]='IN_ID_DOG') or (TFieldsSP[i-1]='ID_ID_SMET') then
                            begin
                              FIBSProc.ParamByName(TFieldsSP[i-1]).AsInt64:=HTable.FieldValues[TFields[i-1]];
                            end
                            else
                            begin
                              FIBSProc.ParamByName(TFieldsSP[i-1]).Value:=HTable.FieldValues[TFields[i-1]];
                            end;
                        end;
                    end;
                end;
                try
                  FIBSProc.ExecProc;
                  Except
                    begin
                      MemoLog.Lines.Add('Ошибка при выполнении процедуры');
                      Refresh;
                     end;
                   end;
         bar.Progress:=j;
         HTable.Next;
    end;
  MemoLog.Lines.Add('Экспорт завершился успешно для таблицы'+SecName);
  Refresh;
  FIBTrans.Commit;
  MemoLog.Lines.Add(DateTimeToStr(Now));
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  //MemoLog.Lines.SaveToFile(Application.ExeName+DateTimeToStr(Now)+'.log');
end;

procedure TfrmMainForm.TimerTimer(Sender: TObject);
begin
if TimeS-Now>=15000 then
  begin
    TimeS:=Now;
    Refresh;
  end;
end;

end.
