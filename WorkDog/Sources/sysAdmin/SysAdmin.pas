unit SysAdmin;

interface
uses
  Windows, Classes, Forms, FIBQuery, pFIBQuery, pFIBStoredProc, ExtCtrls, DB,
  FIBDataSet, pFIBDataSet, pFibDatabase, SIBFIBEA, IB_EXTERNALS, Graphics,
  Jpeg, SysUtils;

type
  TSendMode = (smAllSystems, smSystem, smUser);

  TAdminObject = class
    DataBase         : TpfibDataBase;
    ReadTransaction  : TpFIBTransaction;
    WriteTransaction : TpFIBTransaction;
    StoredProc       : TpFIBStoredProc;
    Query            : TpFIBQuery;
    QueryW           : TpFIBQuery;
    Events           : TSIBfibEventAlerter;
    isActivateBlock  : Boolean;
    isSuperAdmin     : Boolean;
  private
    procedure ProcEventAlert(Sender: TObject; EventName: String; EventCount: Integer);
    procedure ReadMessages(do_del : Integer = 0);
    procedure onError(Sender: TObject; E: Exception);
    procedure CheckBlocked;
  end;


var
 ADMIN_VAR_ID_SYSTEM : Integer;
 ADMIN_VAR_ID_USER   : Integer;
 ADMIN_MAIN_FORM     : TForm;
 AdminObject         : TAdminObject;
 th                  : Tthread;

procedure InitializaAdminSystem(frmMain : TForm; DBHandle : PVoid; const id_system, id_user : Integer; isSuperAdmin : Boolean = false);
procedure FinalizeAdminSystem;
procedure AdminShowUsers(AOwner : Tcomponent);
procedure AdminShowErrors(AOwner : Tcomponent);

implementation
uses WinSock, msgUnit, errUnit, sysUsers, sysErrors, frmDisabledUnit;

function GetCompName : string;
var
  s : string;
  sLen : Longword;
begin
  SetLength(s, 255);
  sLen := 255;
  GetHostName(@s[1], sLen);
  Result := Trim(StrPas(PAnsiChar(s)));
end;

function GetIPAddress : string;
var
  wVerReq: WORD;
  wsaData: TWSAData;
  i: pchar;
  h: PHostEnt;
  c: array[0..128] of char;
begin
  wVerReq := MAKEWORD(1, 1);
  WSAStartup(wVerReq, wsaData);
  GetHostName(@c, 128);
  h := GetHostByName(@c);
  i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
  Result := i;
  WSACleanup;
end;

procedure GetScreenImage(bmp: TBitmap);
begin
  bmp.Width := Screen.Width;
  bmp.Height := Screen.Height;
  BitBlt(bmp.Canvas.Handle, 0, 0, Screen.Width, Screen.Height,
  GetDC(GetDesktopWindow), 0, 0, SRCCopy);
end;

procedure InitializaAdminSystem(frmMain : TForm; DBHandle : PVoid; const id_system, id_user : Integer; isSuperAdmin : Boolean = false);
begin
  ADMIN_MAIN_FORM     := frmMain;
  ADMIN_VAR_ID_SYSTEM := id_system;
  ADMIN_VAR_ID_USER   := id_user;
  AdminObject := TAdminObject.Create;
  AdminObject.isSuperAdmin := isSuperAdmin;
  AdminObject.DataBase := TpFIBDatabase.Create(ADMIN_MAIN_FORM);
  AdminObject.DataBase.SQLDialect := 3;
  AdminObject.DataBase.Handle := DBHandle;
  AdminObject.ReadTransaction := TpFIBTransaction.Create(ADMIN_MAIN_FORM);
  AdminObject.ReadTransaction.DefaultDatabase := AdminObject.DataBase;
  AdminObject.ReadTransaction.StartTransaction;
//  AdminObject.ReadTransaction.Handle := ReadTransaction;
  AdminObject.WriteTransaction := TpFIBTransaction.Create(ADMIN_MAIN_FORM);
  AdminObject.WriteTransaction.DefaultDatabase := AdminObject.DataBase;
//  AdminObject.WriteTransaction.Handle := WriteTransaction;
  AdminObject.StoredProc := TpFIBStoredProc.Create(ADMIN_MAIN_FORM);
  AdminObject.StoredProc.Transaction := AdminObject.WriteTransaction;
  AdminObject.Query := TpFIBQuery.Create(ADMIN_MAIN_FORM);
  AdminObject.Query.Transaction := AdminObject.ReadTransaction;
  AdminObject.QueryW := TpFIBQuery.Create(ADMIN_MAIN_FORM);
  AdminObject.QueryW.Transaction := AdminObject.WriteTransaction;
  AdminObject.Events := TSIBfibEventAlerter.Create(ADMIN_MAIN_FORM);
  AdminObject.Events.AutoRegister := False;
  AdminObject.Events.Database := AdminObject.DataBase;
  AdminObject.Events.Events.Add('SYS_MESSAGE');
  AdminObject.Events.Events.Add('SYS_USERS_LOCATE');
  AdminObject.Events.Events.Add('SYS_GET_SCREENSHOT');
  AdminObject.Events.Events.Add('SYS_BLOCKED');
  AdminObject.Events.Events.Add('SYS_CLOSE');
  AdminObject.Events.RegisterEvents;
  AdminObject.Events.OnEventAlert := AdminObject.ProcEventAlert;
//  Application.OnException := AdminObject.onError;
  if not isSuperAdmin then AdminObject.CheckBlocked;
  AdminObject.ReadMessages(1);
end;

procedure FinalizeAdminSystem;
begin
  if AdminObject.Events.Registered then AdminObject.Events.UnRegisterEvents;
  AdminObject.Events.Free;
  AdminObject.QueryW.Free;
  AdminObject.Query.Free;
  AdminObject.StoredProc.Free;
  AdminObject.WriteTransaction.Free;
  AdminObject.ReadTransaction.Commit;
  AdminObject.ReadTransaction.Free;
  AdminObject.DataBase.Free;
  AdminObject.Free;
end;

procedure TAdminObject.ProcEventAlert(Sender: TObject; EventName: String; EventCount: Integer);
var
 bmp : TBitmap;
 jpg : TJPEGImage;
 st  : TMemoryStream;
 i   : Integer;
begin
  if EventName = 'SYS_USERS_LOCATE' then
  begin
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PROC_SYS_USERS_ADD', [ADMIN_VAR_ID_SYSTEM, ADMIN_VAR_ID_USER, GetCompName, GetIPAddress]);
    StoredProc.Transaction.Commit;
    StoredProc.Close;
  end;
  if EventName = 'SYS_MESSAGE' then
  begin
    ReadMessages;
  end;
  if EventName = 'SYS_GET_SCREENSHOT' then
  begin
    Query.Close;
    Query.SQL.Text := 'select id_user from sys_events_data';
    Query.ExecQuery;
    if Query['ID_USER'].AsInt64 = ADMIN_VAR_ID_USER then
    begin
      bmp := TBitmap.Create;
      GetScreenImage(bmp);
      jpg := TJPEGImage.Create;
      jpg.Assign(bmp);
      st := TMemoryStream.Create;
      jpg.CompressionQuality := 90;
      jpg.SaveToStream(st);
      st.Seek(0, soBeginning);
      st.SaveToFile('c:\dump.jpg');
      StoredProc.StoredProcName := 'PROC_SYS_EVENTS_DATA_ADD_SCR';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('SCREENSHOT').LoadFromStream(st);
      StoredProc.ExecProc;
      StoredProc.Transaction.Commit;
      st.Free;
      jpg.Free;
      bmp.Free;
    end;
    Query.Close;
  end;
  if (EventName = 'SYS_BLOCKED') and (not isActivateBlock) and (not isSuperAdmin) then
  begin
    Query.Close;
    Query.SQL.Text := 'select is_blocked from sys_systems where id_system = ' + IntToStr(ADMIN_VAR_ID_SYSTEM);
    Query.ExecQuery;
    if Query.RecordCount <> 0 then
    begin
      if Query['IS_BLOCKED'].AsInteger = 1 then
      begin
        Query.Close;
        if not Assigned(frmDisabled) then
        begin
          frmDisabled := TfrmDisabled.Create(ADMIN_MAIN_FORM);
          frmDisabled.Show;
          for i := 0 to Screen.FormCount - 1 do Screen.Forms[i].Enabled := False;
          frmDisabled.Enabled := True;
          ADMIN_MAIN_FORM.Enabled := False;
        end;
      end
      else
      begin
        ADMIN_MAIN_FORM.Enabled := true;
        for i := 0 to Screen.FormCount - 1 do Screen.Forms[i].Enabled := true;
        if Assigned(frmDisabled) then
        begin
          frmDisabled.cc := True;
          frmDisabled.Close;
          frmDisabled.Free;
          frmDisabled := nil;
        end;
      end;
    end;
    Query.Close;
  end;

  if (EventName = 'SYS_CLOSE') and (not isActivateBlock) then
  begin
    Query.Close;
    Query.SQL.Text := 'select count(*) from sys_close where (id_system = ' + IntToStr(ADMIN_VAR_ID_SYSTEM) + ' and id_user = -1) or (id_system = ' + IntToStr(ADMIN_VAR_ID_SYSTEM) + ' and id_user = ' + IntToStr(ADMIN_VAR_ID_USER) + ')';
    Query.ExecQuery;
    if Query.FieldByName('COUNT').AsInteger <> 0 then
    begin
      Query.Close;
      ADMIN_MAIN_FORM.OnCloseQuery := nil;
      ADMIN_MAIN_FORM.Close;
    end;
  end;
  isActivateBlock := False;
end;

procedure TAdminObject.ReadMessages(do_del : Integer = 0);
begin
  QueryW.Transaction.StartTransaction;
  QueryW.SQL.Text := 'select * from PROC_SYS_MESSAGES_READ(' + IntToStr(ADMIN_VAR_ID_SYSTEM) + ', ' + IntToStr(ADMIN_VAR_ID_USER) + ', ' + IntToStr(do_del) + ')';
  QueryW.ExecQuery;
  if QueryW.RecordCount <> 0 then
  begin
    while not QueryW.Eof do
    begin
      msgForm := TmsgForm.Create(ADMIN_MAIN_FORM);
      msgForm.msgEdit.Text := QueryW['MESSAGE_TEXT'].AsString;
      msgForm.ShowModal;
      msgForm.Free;
      QueryW.Next;
    end;
  end;
  QueryW.Transaction.Commit;
  QueryW.Close;
end;

procedure TAdminObject.onError(Sender: TObject; E: Exception);
var
  frmError : TfrmError;
begin
  frmError := TfrmError.Create(ADMIN_MAIN_FORM);
  frmError.errMemo.Text := e.Message;
  frmError.ShowModal;
  frmError.Free;
end;

procedure AdminShowUsers(AOwner : Tcomponent);
var
 frm : TfrmSysUsers;
begin
 frm := TfrmSysUsers.Create(AOwner);
 frm.WorkDatabase.Handle     := AdminObject.DataBase.Handle;
 frm.ReadTransaction.Handle  := AdminObject.ReadTransaction.Handle;
 frm.WriteTransaction.Handle := AdminObject.WriteTransaction.Handle;
 frm.FormStyle               := fsMDIChild;
 frm.SystemsDataSet.Open;
 frm.SystemsDataSet.FetchAll;
// frm.cbSystems.Properties.Grid.FocusedRowIndex := 0;
 frm.SystemsDataSet.Locate('ID_SYSTEM', ADMIN_VAR_ID_SYSTEM, []);
 frm.cbSystems.Text := frm.SystemsDataSet['NAME_SYSTEM'];
 frm.Show;
end;

procedure AdminShowErrors(AOwner : Tcomponent);
var
 frm : TfrmSysErrors;
begin
 frm := TfrmSysErrors.Create(AOwner);
 frm.WorkDatabase.Handle     := AdminObject.DataBase.Handle;
 frm.ReadTransaction.Handle  := AdminObject.ReadTransaction.Handle;
 frm.WriteTransaction.Handle := AdminObject.WriteTransaction.Handle;
 frm.FormStyle               := fsMDIChild;
 frm.SystemsDataSet.Open;
 frm.SystemsDataSet.FetchAll;
// frm.cbSystems.Properties.DataController.LocateByKey(ADMIN_VAR_ID_USER);
 frm.SystemsDataSet.Locate('ID_SYSTEM', ADMIN_VAR_ID_SYSTEM, []);
 frm.cbSystems.Text := frm.SystemsDataSet['NAME_SYSTEM'];
 frm.SelectAll;
 frm.Show;
end;

procedure TAdminObject.CheckBlocked;
var
 i : Integer;
begin
  Query.Close;
  Query.SQL.Text := 'select is_blocked from sys_systems where id_system = ' + IntToStr(ADMIN_VAR_ID_SYSTEM);
  Query.ExecQuery;
  if Query.RecordCount <> 0 then
  begin
    if Query['IS_BLOCKED'].AsInteger = 1 then
    begin
      frmDisabled := TfrmDisabled.Create(ADMIN_MAIN_FORM);
      frmDisabled.Show;
      for i := 0 to Screen.FormCount - 1 do Screen.Forms[i].Enabled := False;
      frmDisabled.Enabled := True;
      ADMIN_MAIN_FORM.Enabled := False;
    end;
  end;
  Query.Close;
end;

end.


