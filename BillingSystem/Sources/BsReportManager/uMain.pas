unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, dxBar, dxBarExtItems, ImgList, IniFiles, uCommon_Funcs,
  FIBQuery, pFIBQuery, pFIBStoredProc, uCommon_Messages, RxMemDS,
  cxCheckBox, ShellAPI, ShellConsts, ActiveX, ShlObj, cxContainer,
  cxTextEdit, cxMemo, DBTables, SHFolder;

type
  TfrmMain = class(TForm)
    ReportGridDBView: TcxGridDBTableView;
    ReportGridLevel: TcxGridLevel;
    ReportGrid: TcxGrid;
    DisObjStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    DisObjectGridStyle: TcxGridTableViewStyleSheet;
    ManagerDB: TpFIBDatabase;
    ManRTrans: TpFIBTransaction;
    ManWTrans: TpFIBTransaction;
    ReportDSet: TpFIBDataSet;
    ReportDS: TDataSource;
    ColumnNameGroup: TcxGridDBColumn;
    ColumnCheck: TcxGridDBColumn;
    ColumnNameReport: TcxGridDBColumn;
    barManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnExec: TdxBarLargeButton;
    AddMenu: TdxBarPopupMenu;
    btnProp: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    btnAddGroup: TdxBarLargeButton;
    btnAddReport: TdxBarLargeButton;
    DelMenu: TdxBarPopupMenu;
    ImageList: TImageList;
    MenuEdit: TdxBarPopupMenu;
    btnEditGroup: TdxBarLargeButton;
    btnEditReport: TdxBarLargeButton;
    btnDelGroup: TdxBarLargeButton;
    btnDelReport: TdxBarLargeButton;
    StoredProc: TpFIBStoredProc;
    ColumnNameProc: TcxGridDBColumn;
    btnRefreshConnect: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    RefreshMenu: TdxBarPopupMenu;
    btnLocalRefresh: TdxBarLargeButton;
    btnRemoteRefresh: TdxBarLargeButton;
    rxReportDSet: TRxMemoryData;
    rxReportDSetCHECK_REPORT: TIntegerField;
    rxReportDSetID_REPORT: TVariantField;
    rxReportDSetNUM_REPORT: TStringField;
    rxReportDSetID_REPORT_GROUP: TVariantField;
    rxReportDSetIS_USER_REPORT: TVariantField;
    ColumnNumReport: TcxGridDBColumn;
    ColumnNameFr: TcxGridDBColumn;
    GetBody: TpFIBDataSet;
    rxReportDSetNAME_FR3: TStringField;
    rxReportDSetNAME_REPORT: TStringField;
    rxReportDSetNAME_GROUP: TStringField;
    rxReportDSetNAME_PROCEDURE: TStringField;
    rxReportDSetADD_INFO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPropClick(Sender: TObject);
    procedure btnAddGroupClick(Sender: TObject);
    procedure btnRefreshConnectClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddReportClick(Sender: TObject);
    procedure btnEditReportClick(Sender: TObject);
    procedure btnEditGroupClick(Sender: TObject);
    procedure btnDelGroupClick(Sender: TObject);
    procedure btnDelReportClick(Sender: TObject);
    procedure btnExecClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnLocalRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure ReportDSetCloseOpen;
    procedure ConnetToDB;
    procedure CloseConnect;
    function GetSpecialFolderPath(folder : integer) : string;
    procedure BtnEnable(Switch:Boolean);
    function WindowsCopyFile(FromFile, ToDir : string) : boolean;
    function ExecAndWait(const FileName, Params: string; WindowState: Word): Boolean;

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uOptions, uGroupEdit, uSys, pFIBProps, uReportDesigner;

{$R *.dfm}

procedure TfrmMain.ReportDSetCloseOpen;
begin
   rxReportDSet.Active:=False;
   rxReportDSet.Active:=True;
   if ReportDSet.Active then ReportDSet.Close;
   ReportDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DT_REPORTS_MANAGER_SEL';
   ReportDSet.Open;
   if not ReportDSet.IsEmpty then
   begin
      ReportDSet.FetchAll;
      ReportDSet.First;
      while not ReportDSet.Eof do
      begin
         rxReportDSet.Insert;
         rxReportDSet.FieldByName('CHECK_REPORT').AsInteger:=0;
         rxReportDSet.FieldByName('ID_REPORT').AsVariant:=ReportDSet['ID_REPORT'];
         rxReportDSet.FieldByName('NUM_REPORT').AsString:=ReportDSet['NUM_REPORT'];
         rxReportDSet.FieldByName('NAME_REPORT').AsString:=ReportDSet['NAME_REPORT'];
         rxReportDSet.FieldByName('ID_REPORT_GROUP').AsVariant:=ReportDSet['ID_REPORT_GROUP'];
         rxReportDSet.FieldByName('NAME_GROUP').AsString:=ReportDSet['NAME_GROUP'];
         rxReportDSet.FieldByName('NAME_PROCEDURE').AsString:=ReportDSet['NAME_PROCEDURE'];
         rxReportDSet.FieldByName('ADD_INFO').AsString:=ReportDSet['ADD_INFO'];
         rxReportDSet.FieldByName('IS_USER_REPORT').AsVariant:=ReportDSet['IS_USER_REPORT'];
         rxReportDSet.FieldByName('NAME_FR3').AsString:=ReportDSet['NAME_FR3'];
         rxReportDSet.Post;
         ReportDSet.Next;
      end;
   end;
end;

function TfrmMain.ExecAndWait(const FileName, Params: string; WindowState: Word): Boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin

  CmdLine := '"' + FileName + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, False,
    CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil,
    PChar(ExtractFilePath(FileName)),
    SUInfo, ProcInfo);
 
  if Result then
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
end;

function TfrmMain.WindowsCopyFile(FromFile, ToDir : string) : boolean;
var
  F: TShFileOpStruct;
begin
  F.Wnd := 0;
  F.wFunc := FO_COPY;
  FromFile:=FromFile+#0;
  F.pFrom:=pchar(FromFile);
  ToDir:=ToDir+#0;
  F.pTo:=pchar(ToDir);
  F.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  result:=ShFileOperation(F) = 0;
end;


function TfrmMain.GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array [0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @path[0])) then
    Result := path
  else
    Result := '';
end;

procedure TfrmMain.BtnEnable(Switch:Boolean);
begin
   btnAdd.Enabled:=Switch;
   btnEdit.Enabled:=Switch;
   btnDel.Enabled:=Switch;
   btnExec.Enabled:=Switch;
   btnProp.Enabled:=Switch;
   btnRefresh.Enabled:=Switch;
   btnRefreshConnect.Enabled:=Switch;
   btnClose.Enabled:=Switch;
end;

procedure TfrmMain.ConnetToDB;
var ConParams:TBDConParams;
begin
   if ManagerDB.Connected then ManagerDB.Close;
   ConParams:=DBGetParamsFromIni('LOCAL_CONNECTION');
   ManagerDB.DBName:=DBGetConnectionStr('LOCAL_CONNECTION', True);
   with ManagerDB, ConParams do
   begin
      ConnectParams.UserName:=tdbUser;
      ConnectParams.Password:=tdbPassword;
      ConnectParams.CharSet:=tdbCharSet;
      SQLDialect:=tdbSQLDialect;
      try
         ManagerDB.Open;
      except on E:Exception do
             begin
                bsShowMessage('Внимание!', E.Message, mtInformation, [mbOK]);
                CloseConnect;
             end;
      end;
   end;
end;

procedure TfrmMain.CloseConnect;
var i:Integer;
begin
   if ManagerDB.Connected then
   begin
      for i:=0 to ManagerDB.TransactionCount-1 do
      begin
         if ManagerDB.Transactions[i].Active then ManagerDB.Transactions[i].Rollback;
      end;
      ManagerDB.Close;
   end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   ConnetToDB;
   ReportDSetCloseOpen;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmMain.btnPropClick(Sender: TObject);
var frm:TfrmOptions;
begin
   frm:=TfrmOptions.Create(Self);
   if frm.ShowModal=mrOk then
   begin
      //
   end;
   frm.Free;
end;

procedure TfrmMain.btnAddGroupClick(Sender: TObject);
var frm:TfrmGroupEdit;
    RetId:Integer;
begin
   frm:=TfrmGroupEdit.Create(Self);
   frm.Caption:='Добавление группы';
   if frm.ShowModal=mrOk then
   begin
      StoredProc.StoredProcName:='BS_DT_REPORT_GROUP_IU';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_REPORT_GROUP').Value:=null;
      StoredProc.ParamByName('NAME_GROUP').AsString:=frm.GroupEdit.Text;
      try
        StoredProc.ExecProc;
        RetId:=StoredProc.FieldByName('RET_VALUE').AsInteger;
        StoredProc.Transaction.Commit;
        ReportDSetCloseOpen;
        ReportDSet.Locate('ID_REPORT_GROUP', RetId, []);
      except on E:Exception
             do begin
                  bsShowMessage('Внимание!', E.Message, mtInformation, [mbOK]);
                  StoredProc.Transaction.Rollback;
             end;
      end;
   end;
end;

procedure TfrmMain.btnRefreshConnectClick(Sender: TObject);
begin
   if bsShowMessage(Application.Title, 'Обновить соединение?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
   ConnetToDB;
   ReportDSetCloseOpen;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if bsShowMessage('Внимание!', 'Вы действительно хотите закрыть приложение?', mtInformation, [mbYes, mbNo])=mrYes then CanClose:=True
   else CanClose:=False;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CloseConnect;
end;

procedure TfrmMain.btnAddReportClick(Sender: TObject);
var frm:TfrmReportDesigner;
begin
   if ReportDSet.IsEmpty then Exit;
   frm:=TfrmReportDesigner.Create(Self, null, ReportDSet['ID_REPORT_GROUP']);
   if frm.ShowModal=mrOk then
   begin
      ReportDSetCloseOpen;
   end;
   frm.Free;
end;

procedure TfrmMain.btnEditReportClick(Sender: TObject);
var frm:TfrmReportDesigner;
begin
   if ReportDSet.IsEmpty then Exit;
   frm:=TfrmReportDesigner.Create(Self, ReportDSet['ID_REPORT'], ReportDSet['ID_REPORT_GROUP']);
   if frm.ShowModal=mrOk then
   begin
      ReportDSetCloseOpen;
   end;
   frm.Free;
end;

procedure TfrmMain.btnEditGroupClick(Sender: TObject);
var frm:TfrmGroupEdit;
    RetId:Integer;
begin
   frm:=TfrmGroupEdit.Create(Self);
   frm.Caption:='Редактирование группы';
   RetId:=ReportDSet['ID_REPORT_GROUP'];
   frm.GroupEdit.Text:=ReportDSet['NAME_GROUP'];
   if frm.ShowModal=mrOk then
   begin
      StoredProc.StoredProcName:='BS_DT_REPORT_GROUP_IU';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_REPORT_GROUP').Value:=RetId;
      StoredProc.ParamByName('NAME_GROUP').AsString:=frm.GroupEdit.Text;
      try
        StoredProc.ExecProc;
        RetId:=StoredProc.FieldByName('RET_VALUE').AsInteger;
        StoredProc.Transaction.Commit;
        ReportDSetCloseOpen;
        ReportDSet.Locate('ID_REPORT_GROUP', RetId, []);
      except on E:Exception
             do begin
                  bsShowMessage('Внимание!', E.Message, mtInformation, [mbOK]);
                  StoredProc.Transaction.Rollback;
             end;
      end;
   end;
end;

procedure TfrmMain.btnDelGroupClick(Sender: TObject);
var isError:string;
begin
   if ReportDSet.IsEmpty then Exit;
   if bsShowMessage(Application.Title, 'Удалить группу отчетов?', mtInformation, [mbYes, mbNo])=mrNo then Exit;
   StoredProc.StoredProcName:='BS_DT_REPORT_GROUP_DEL';
   StoredProc.Transaction.StartTransaction;
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_REPORT_GROUP').AsInteger:=ReportDSet['ID_REPORT_GROUP'];
   try
     StoredProc.ExecProc;
     isError:=ReportDSet.FieldByName('IS_ERROR').AsString;
     if isError='T' then
     begin
        bsShowMessage(Application.Title, 'Нельзя удалить группу, в ней находятся отчеты созданные разработчиками!', mtInformation, [mbOK]);
        StoredProc.Transaction.Rollback;
     end
     else
     begin
       StoredProc.Transaction.Commit;
       ReportDSetCloseOpen;
     end;
   except on E:Exception do
          begin
             bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK]);
             StoredProc.Transaction.Rollback;
          end;
   end;
end;

procedure TfrmMain.btnDelReportClick(Sender: TObject);
begin
   if ReportDSet.IsEmpty then Exit;
   if ReportDSet['Is_User_Report']=0 then
   begin
      bsShowMessage(Application.Title, 'Нельзя удалить выбранный отчет!', mtInformation, [mbOK]);
      Exit;
   end;
   if bsShowMessage(Application.Title, 'Удалить выбранный отчет?', mtInformation, [mbYes, mbNo])=mrNo then Exit;
   StoredProc.StoredProcName:='BS_DT_REPORTS_DEL';
   StoredProc.Transaction.StartTransaction;
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_REPORT').AsInteger:=ReportDSet['ID_REPORT'];
   try
      StoredProc.ExecProc;
      StoredProc.Transaction.Commit;
      ReportDSetCloseOpen;
   except on E:Exception do
          begin
             bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK]);
             StoredProc.Transaction.Rollback;
          end;
   end;
end;

procedure TfrmMain.btnExecClick(Sender: TObject);
var FileStream:TFileStream;
    ProcStream:TMemoryStream;
    FileName:String;
    DirPath, DirFr:string;
    curYear, CurMonth, CurDay:Word;
begin
   BtnEnable(False);
   while not rxReportDSet.Eof do
   begin
      if rxReportDSet['CHECK_REPORT']=1 then
      begin
         if ((rxReportDSet['NAME_PROCEDURE']='') or (rxReportDSet['NAME_FR3']='')) then
         begin
            rxReportDSet.Edit;
            rxReportDSet['CHECK_REPORT']:=0;
            rxReportDSet.Post;
         end;
      end;
   end;
   if not rxReportDSet.Locate('CHECK_REPORT', 1, []) then
   begin
      //bsShowMessage(Application.Title, '', mtInformation, [mbOK]);
      Exit;
   end;
   DirPath:=GetSpecialFolderPath(CSIDL_PERSONAL);
   DecodeDate(Date, curYear, CurMonth, CurDay);
   DirPath:=DirPath+'\'+IntToStr(curYear)+'-'+IntToStr(CurMonth)+'-'+IntToStr(CurDay);
   ForceDirectories(DirPath);
   DirFr:=DirPath+'\'+'BsReportsUser';
   ForceDirectories(DirFr);
   rxReportDSet.First;
   while not rxReportDSet.Eof do
   begin
      if rxReportDSet['CHECK_REPORT']=1 then
      begin
         if GetBody.Active then GetBody.Close;
         GetBody.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_REPORT_GEN_PROC_SCRIPT(:NAME_PROC)';
         GetBody.ParamByName('NAME_PROC').AsString:=rxReportDSet['NAME_PROCEDURE'];
         GetBody.Open;
         if not GetBody.IsEmpty then
         begin
           try
             ProcStream:=TMemoryStream.Create;
             (GetBody.FieldByName('REPORT_SCRIPT') as TBlobField).SaveToStream(ProcStream);
             FileName:=DirPath+'\'+'MetaData.sql';
             if not FileExists(FileName) then
                FileStream:=TFileStream.Create(FileName, fmCreate)
             else FileStream:=TFileStream.Create(FileName, fmOpenWrite);
             ProcStream.Position:=0;
             FileStream.Seek(0, soFromEnd);
             FileStream.CopyFrom(ProcStream, ProcStream.Size);
             FileStream.Free;
           except on E:Exception do
                  begin
                     bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK]);
                     BtnEnable(True);
                  end;
           end;
         end;
         ProcStream.Free;
         if GetBody.Active then GetBody.Close;
         GetBody.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_REPORT_GEN_DATA_SCRIPT(:ID_REPORT)';
         GetBody.ParamByName('ID_REPORT').AsString:=rxReportDSet['ID_REPORT'];
         GetBody.Open;
         if not GetBody.IsEmpty then
         begin
           try
             ProcStream:=TMemoryStream.Create;
             (GetBody.FieldByName('SCRIPT_BODY') as TBlobField).SaveToStream(ProcStream);
             FileName:=DirPath+'\'+'Data.sql';
             if not FileExists(FileName) then
                FileStream:=TFileStream.Create(FileName, fmCreate)
             else FileStream:=TFileStream.Create(FileName, fmOpenWrite);
             ProcStream.Position:=0;
             FileStream.Seek(0, soFromEnd);
             FileStream.CopyFrom(ProcStream, ProcStream.Size);
             FileStream.Free;
             
           except on E:Exception do
                  begin
                     bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK]);
                     BtnEnable(True);
                  end;
           end;
         end;
         FileName:=DBGetConnectionStr('FR_SOURCE', False)+'\'+rxReportDSet['NAME_FR3'];
         WindowsCopyFile(FileName, DirFr);
         rxReportDSet.Next;
      end
      else rxReportDSet.Next;
   end;
   bsShowMessage(Application.Title, 'Файлы сформированы и находятся в '+DirPath, mtInformation, [mbOK]);
   BtnEnable(True);
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  //ShowMessage(GetSpecialFolderPath(CSIDL_PERSONAL));
  ExecAndWait('C:\Program Files\WinRAR\Rar.exe','a -m5 A.rar C:\1.dbf',SW_SHOW);
end;

procedure TfrmMain.btnLocalRefreshClick(Sender: TObject);
begin
   ReportDSetCloseOpen;
end;

end.
