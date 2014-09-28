unit uMonuLoader;

interface
uses Windows, SysUtils, Forms, Dialogs, IBase, pFIBDatabase, FIBDatabase, FIBQuery,
  pFIBQuery,AArray;

const
 SYS_NAME : string = 'Інформаційно-аналітична система управління ресурсами МОН';
 MON_REG_KEY : string = '\Software\FMAS\MONU\';
 MON_MAX_COLUM  : Integer = 23;
 MON_WIDTH_LINE : Double = 540;
 

var
 MON_USER_NAME       : string;
 MON_USER_PASSWORD   : string;
 MON_USER            : string;
 MON_DP_PATH         : string;
 MON_ID_USER         : int64;
 MON_DB_HANDLE       : TISC_DB_HANDLE;
 MON_USE_ALPHA_LOGIN : boolean = true;
 MON_USE_LOGOFF_SCR  : boolean = true;
 MON_BLUE_SKY        : Cardinal = $F0CAA6; // :)
 MON_STRINGS         : TAArray;

procedure LoadMonuData(Transaction : TpFibTransaction);

function ShowLoginForm(NameSystem : string) : TISC_DB_HANDLE;
procedure ShowMessage(const msg : string);
function ShowMessageYN(const msg : string) : integer;

implementation
uses uMonuLoaderDM, uMonuMessages;

procedure LoadMonuData(Transaction : TpFibTransaction);
var
  Query : TpFIBQuery;
begin
  Query := TpFIBQuery.Create(Nil);
  Query.Transaction := Transaction;
  Query.Database := Transaction.DefaultDatabase;

  Query.SQL.Text := 'select FULL_NAME from users where id_user = ' + IntToStr(MON_ID_USER);
  Query.ExecQuery;
  if Query.RecordCount = 0 then
  begin
    ShowMessage('Не знайден користувач.');
  end else MON_USER := Query.FieldByName('FULL_NAME').AsString;
  Query.Close;

  Query.Free;
end;

procedure ShowMessage(const msg : string);
var
 frm : TfrmMsg;
begin
 frm := TfrmMsg.Create(Nil);
 frm.Position := poDesktopCenter;
 frm.lbMsg.Caption := msg;
 frm.ShowModal;
 frm.Free;
end;

function ShowMessageYN(const msg : string) : integer;
var
 frm : TfrmMsg;
begin
 frm := TfrmMsg.Create(Nil);
 frm.Position := poDesktopCenter;
 frm.lbMsg.Caption := msg;
 frm.bYes.Visible := true;
 frm.bNo.Visible := true;
 frm.bOk.Visible := false;
 Result := frm.ShowModal;
 frm.Free;
end;

function ShowLoginForm(NameSystem : string) : TISC_DB_HANDLE;
const
  ModuleName : string = 'monu\LoginPack.bpl';
type
  TProc =  function (NameSystem : string) : TISC_DB_HANDLE;
var
  HandlePack : HModule;
  proc       : TProc;
begin
  Result := Nil;
  HandlePack := GetModuleHandle(pchar(ModuleName));
  if HandlePack < 32 then HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + ModuleName);
  if HandlePack > 0 then
  begin
    @Proc := GetProcAddress(HandlePack, PChar('ShowLoginForm'));
    try
      if @Proc <> nil then Result := Proc(NameSystem);
    except
      on E: Exception do ShowMessage('Произошла ошибка при вызове: ' + ModuleName + #13 + E.Message);
    end
  end else ShowMessage('Ошибка загрузки: ' + ModuleName);
end;


initialization
begin
  dm := Tdm.Create(Nil);
  MON_STRINGS := TAArray.Create;
  MON_STRINGS.LoadFromFile(ExtractFilePath(Application.ExeName)+'Monu\MonuStrings.dat','Main');
end;

finalization
begin
  dm.Free;
  MON_STRINGS.Free;
end;

end.
