{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clFtpServer;

interface

{$I clVer.inc}
{$IFDEF DELPHI6}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

uses
  Classes, Windows, SysUtils, WinSock, clUtils, clTcpServer, clSocket, clFtpUtils, clUserMgr,
  SyncObjs;

type
  TclFtpUserAccountItem = class(TclUserAccountItem)
  private
    FRootDir: string;
    FReadOnlyAccess: Boolean;
    procedure SetRootDir(const Value: string);
  public
    procedure Assign(Source: TPersistent); override;
  published
    property ReadOnlyAccess: Boolean read FReadOnlyAccess write FReadOnlyAccess;
    property RootDir: string read FRootDir write SetRootDir;
  end;

  TclFtpFileItem = class(TCollectionItem)
  private
    FInfo: TclFtpFileInfo;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property Info: TclFtpFileInfo read FInfo;
  end;

  TclFtpFileList = class(TCollection)
  private
    function GetItem(Index: Integer): TclFtpFileItem;
    procedure SetItem(Index: Integer; const Value: TclFtpFileItem);
  public
    function Add: TclFtpFileItem;
    property Items[Index: Integer]: TclFtpFileItem read GetItem write SetItem; default;
  end;

  TclFtpCommandConnection = class(TclCommandConnection)
  private
    FIsAuthorized: Boolean;
    FCurrentDir: string;
    FDataPosition: Int64;
    FCurrentName: string;
    FDataConnection: TclSyncConnection;
    FDataConnectionAccess: TCriticalSection;
    FTransferMode: TclFtpTransferMode;
    FTransferStructure: TclFtpTransferStructure;
    FTransferType: TclFtpTransferType;
    FUserName: string;
    FTempUserName: string;
    FReadOnlyAccess: Boolean;
    FRootDir: string;
    FDataPort: Integer;
    FDataIP: string;
    FPassiveMode: Boolean;
    FDataProtection: Boolean;
    procedure AssignDataConnection(AConnection: TclSyncConnection);
  protected
    procedure DoDestroy; override;
  public
    constructor Create;
    procedure InitParams;
    property IsAuthorized: Boolean read FIsAuthorized;
    property CurrentDir: string read FCurrentDir;
    property RootDir: string read FRootDir;
    property DataPosition: Int64 read FDataPosition;
    property CurrentName: string read FCurrentName;
    property DataConnection: TclSyncConnection read FDataConnection;
    property TransferMode: TclFtpTransferMode read FTransferMode;
    property TransferStructure: TclFtpTransferStructure read FTransferStructure;
    property TransferType: TclFtpTransferType read FTransferType;
    property UserName: string read FUserName;
    property ReadOnlyAccess: Boolean read FReadOnlyAccess;
    property DataIP: string read FDataIP;
    property DataPort: Integer read FDataPort;
    property PassiveMode: Boolean read FPassiveMode;
    property DataProtection: Boolean read FDataProtection;
  end;

  TclFtpCommandHandler = procedure (AConnection: TclFtpCommandConnection;
    const ACommand, AParams: string) of object;

  TclFtpCommandInfo = class(TclTcpCommandInfo)
  private
    FHandler: TclFtpCommandHandler;
    FIsOOB: Boolean;
  protected
    procedure Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams); override;
  end;

  TclFtpHelpCommandEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection;
    const AParams: string; AHelpText: TStrings) of object;

  TclFtpAuthenticateEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection;
    Account: TclFtpUserAccountItem; const APassword: string; var IsAuthorized, Handled: Boolean) of object;

  TclFtpNameEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection;
    const AName: string; var Success: Boolean; var AErrorMessage: string) of object;

  TclFtpRenameEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection;
    const ACurrentName, ANewName: string; var Success: Boolean; var AErrorMessage: string) of object;

  TclFtpFileInfoEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection;
    const AName: string; AInfo: TclFtpFileInfo; var Success: Boolean; var AErrorMessage: string) of object;

  TclFtpPutFileEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection;
    const AFileName: string; AOverwrite: Boolean; var ADestination: TStream;
    var Success: Boolean; var AErrorMessage: string) of object;

  TclFtpGetFileEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection;
    const AFileName: string; var ASource: TStream; var Success: Boolean;
    var AErrorMessage: string) of object;

  TclFtpFileListEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection;
    const APathName: string; AIncludeHidden: Boolean; AFileList: TclFtpFileList) of object;

  TclFtpConnectionEvent = procedure (Sender: TObject; AConnection: TclFtpCommandConnection) of object;

  TclFtpServer = class(TclTcpCommandServer)
  private
    FRootDir: string;
    FUserAccounts: TclUserAccountList;
    FAllowAnonymousAccess: Boolean;
    FDirListingStyle: TclDirListingStyle;
    FOnHelpCommand: TclFtpHelpCommandEvent;
    FOnAuthenticate: TclFtpAuthenticateEvent;
    FOnCreateDir: TclFtpNameEvent;
    FOnDelete: TclFtpNameEvent;
    FOnRename: TclFtpRenameEvent;
    FOnGetFileInfo: TclFtpFileInfoEvent;
    FOnPutFile: TclFtpPutFileEvent;
    FOnGetFile: TclFtpGetFileEvent;
    FOnGetFileList: TclFtpFileListEvent;
    FTclFtpConnectionEvent: TclFtpConnectionEvent;
    procedure HandleQUIT(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleUSER(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandlePASS(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleMODE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleSTRU(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleTYPE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleREST(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandlePORT(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandlePASV(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleLIST(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleNLST(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleMKD(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandlePWD(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleCWD(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleCDUP(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleRMD(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleSTOR(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleAPPE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleSTOU(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleSIZE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleRNFR(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleRNTO(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleDELE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleRETR(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleSITE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleNOOP(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleHELP(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleREIN(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleSTAT(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleSYST(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleABOR(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandlePBSZ(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandlePROT(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleAUTH(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
    procedure HandleNullCommand(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);

    procedure SetRootDir(const Value: string);
    procedure CollectDirList(AConnection: TclFtpCommandConnection;
      AList: TStrings; const APathName: string; ADetails: Boolean);
    function GetFullPath(AConnection: TclFtpCommandConnection;
      const APathName: string): string;
    procedure RaiseFileAccessError(const ACommand, AFileName, AMessage: string);
    procedure RaiseArgumentError(const ACommand: string);
    procedure RaiseDataConnectionError(const ACommand: string);
    procedure SetUserAccounts(const Value: TclUserAccountList);
    function GetCaseInsensitive: Boolean;
    procedure SetCaseInsensitive(const Value: Boolean);
    procedure InternalHandleList(AConnection: TclFtpCommandConnection;
      const ACommand, AParams: string; ADetails: Boolean);
    procedure InternalHandleStor(AConnection: TclFtpCommandConnection;
      const ACommand, AParams: string; Append, ACreateUnique: Boolean);
    procedure InternalHandleDelete(AConnection: TclFtpCommandConnection;
      const ACommand, AParams: string);
    procedure InternalHandleCwd(AConnection: TclFtpCommandConnection; const ACommand, ACurDir: string);
    function Authenticate(AConnection: TclFtpCommandConnection; Account: TclUserAccountItem;
      const APassword: string): Boolean;
    function IsAnonymousUser(const AUserName: string): Boolean;
    function IsFileExists(AConnection: TclFtpCommandConnection; const ACommand, AFileName: string): Boolean;
    procedure CheckAuthorized(AConnection: TclFtpCommandConnection; const ACommand: string);
    procedure CheckAccessRights(AConnection: TclFtpCommandConnection; const ACommand, AName: string);
    procedure CheckTlsMode(AConnection: TclFtpCommandConnection; const ACommand: string);
    function GetFileInfo(AConnection: TclFtpCommandConnection; const ACommand, AName: string): TclFtpFileInfo;
    procedure InitDataConnection(AConnection: TclFtpCommandConnection; ADataConnection: TclSyncConnection);
  protected
    procedure OpenDataConnection(AConnection: TclFtpCommandConnection; const ACommand: string); virtual;
    procedure AddFtpCommand(const ACommand: string; AHandler: TclFtpCommandHandler; IsOOB: Boolean = False);
    procedure RegisterCommands; override;
    function GetNullCommand(const ACommand: string): TclTcpCommandInfo; override;
    procedure ProcessUnhandledError(AConnection: TclCommandConnection;
      AParams: TclTcpCommandParams; E: Exception); override;
    procedure DoProcessCommand(AConnection: TclCommandConnection;
      AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams); override;
    procedure DoAcceptConnection(AConnection: TclCommandConnection); override;
    function CreateDefaultConnection: TclCommandConnection; override;
    procedure DoDestroy; override;
    procedure DoHelpCommand(AConnection: TclFtpCommandConnection;
      const AParams: string; AHelpText: TStrings); virtual;
    procedure DoAuthenticate(AConnection: TclFtpCommandConnection; Account: TclFtpUserAccountItem;
      const APassword: string; var IsAuthorized, Handled: Boolean); virtual;
    procedure DoCreateDir(AConnection: TclFtpCommandConnection;
      const AName: string; var Success: Boolean; var AErrorMessage: string); virtual;
    procedure DoDelete(AConnection: TclFtpCommandConnection;
      const AName: string; var Success: Boolean; var AErrorMessage: string); virtual;
    procedure DoRename(AConnection: TclFtpCommandConnection;
      const ACurrentName, ANewName: string; var Success: Boolean; var AErrorMessage: string); virtual;
    procedure DoGetFileInfo(AConnection: TclFtpCommandConnection; const AName: string;
      AInfo: TclFtpFileInfo; var Success: Boolean; var AErrorMessage: string); virtual;
    procedure DoPutFile(AConnection: TclFtpCommandConnection;
      const AFileName: string; AOverwrite: Boolean; var ADestination: TStream;
      var Success: Boolean; var AErrorMessage: string); virtual;
    procedure DoGetFile(AConnection: TclFtpCommandConnection; const AFileName: string;
      var ASource: TStream; var Success: Boolean; var AErrorMessage: string); virtual;
    procedure DoGetFileList(AConnection: TclFtpCommandConnection;
      const APathName: string; AIncludeHidden: Boolean; AFileList: TclFtpFileList); virtual;
    procedure DoInitDataConnection(AConnection: TclFtpCommandConnection); virtual;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property RootDir: string read FRootDir write SetRootDir;
    property Port default cDefaultFtpPort;
    property UserAccounts: TclUserAccountList read FUserAccounts write SetUserAccounts;
    property CaseInsensitive: Boolean read GetCaseInsensitive write SetCaseInsensitive default False;
    property AllowAnonymousAccess: Boolean read FAllowAnonymousAccess write FAllowAnonymousAccess default False;
    property DirListingStyle: TclDirListingStyle read FDirListingStyle write FDirListingStyle default lsMsDos;
    property OnHelpCommand: TclFtpHelpCommandEvent read FOnHelpCommand write FOnHelpCommand;
    property OnAuthenticate: TclFtpAuthenticateEvent read FOnAuthenticate write FOnAuthenticate;
    property OnCreateDir: TclFtpNameEvent read FOnCreateDir write FOnCreateDir;
    property OnDelete: TclFtpNameEvent read FOnDelete write FOnDelete;
    property OnRename: TclFtpRenameEvent read FOnRename write FOnRename;
    property OnGetFileInfo: TclFtpFileInfoEvent read FOnGetFileInfo write FOnGetFileInfo;
    property OnPutFile: TclFtpPutFileEvent read FOnPutFile write FOnPutFile;
    property OnGetFile: TclFtpGetFileEvent read FOnGetFile write FOnGetFile;
    property OnGetFileList: TclFtpFileListEvent read FOnGetFileList write FOnGetFileList;
    property OnInitDataConnection: TclFtpConnectionEvent read FTclFtpConnectionEvent
      write FTclFtpConnectionEvent;
  end;

procedure RaiseFtpError(const ACommand, AMessage: string; ACode: Integer);

implementation

uses
  clTlsSocket;

const
  cTransferResult: array[Boolean] of string = ('Transfer complete', 'Transfer aborted');

procedure RaiseFtpError(const ACommand, AMessage: string; ACode: Integer);
begin
  raise EclTcpCommandError.Create(ACommand, Format('%d %s', [ACode, AMessage]), ACode);
end;

{ TclFtpServer }

procedure TclFtpServer.DoAcceptConnection(AConnection: TclCommandConnection);
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  if FindWindow('TAppBuilder', nil) = 0 then
  begin
    MessageBox(0, 'This demo version can be run under Delphi/C++Builder IDE only. ' + 
      'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    ExitProcess(1);
  end;
{$ENDIF}
{$ENDIF}

  inherited DoAcceptConnection(AConnection);
  SendResponse(AConnection, '', '220 ' + ServerName);
end;

procedure TclFtpServer.AddFtpCommand(const ACommand: string;
  AHandler: TclFtpCommandHandler; IsOOB: Boolean);
var
  info: TclFtpCommandInfo;
begin
  info := TclFtpCommandInfo.Create();
  AddCommand(info);
  info.Name := ACommand;
  info.FHandler := AHandler;
  info.FIsOOB := IsOOB;
end;

procedure TclFtpServer.RegisterCommands;
begin
  AddFtpCommand('USER', HandleUSER);
  AddFtpCommand('PASS', HandlePASS);
  AddFtpCommand('QUIT', HandleQUIT);
  AddFtpCommand('MODE', HandleMODE);
  AddFtpCommand('STRU', HandleSTRU);
  AddFtpCommand('TYPE', HandleTYPE);
  AddFtpCommand('REST', HandleREST);
  AddFtpCommand('PORT', HandlePORT);
  AddFtpCommand('PASV', HandlePASV);
  AddFtpCommand('P@SW', HandlePASV);
  AddFtpCommand('LIST', HandleLIST);
  AddFtpCommand('NLST', HandleNLST);
  AddFtpCommand('MKD', HandleMKD);
  AddFtpCommand('PWD', HandlePWD);
  AddFtpCommand('CWD', HandleCWD);
  AddFtpCommand('CDUP', HandleCDUP);
  AddFtpCommand('RMD', HandleRMD);
  AddFtpCommand('STOR', HandleSTOR);
  AddFtpCommand('APPE', HandleAPPE);
  AddFtpCommand('STOU', HandleSTOU);
  AddFtpCommand('SIZE', HandleSIZE);
  AddFtpCommand('RNFR', HandleRNFR);
  AddFtpCommand('RNTO', HandleRNTO);
  AddFtpCommand('DELE', HandleDELE);
  AddFtpCommand('RETR', HandleRETR);
  AddFtpCommand('XMKD', HandleMKD);
  AddFtpCommand('XPWD', HandlePWD);
  AddFtpCommand('XCWD', HandleCWD);
  AddFtpCommand('XCUP', HandleCDUP);
  AddFtpCommand('XRMD', HandleRMD);
  AddFtpCommand('SITE', HandleSITE);
  AddFtpCommand('NOOP', HandleNOOP);
  AddFtpCommand('ALLO', HandleNOOP);
  AddFtpCommand('HELP', HandleHELP);
  AddFtpCommand('REIN', HandleREIN);
  AddFtpCommand('STAT', HandleSTAT);
  AddFtpCommand('SYST', HandleSYST);
  AddFtpCommand('ABOR', HandleABOR, True);
  AddFtpCommand(#$FF#$F4#$FF#$FF'ABOR', HandleABOR, True);
  AddFtpCommand(#$FF#$F4#$F2'ABOR', HandleABOR, True);
  AddFtpCommand('PBSZ', HandlePBSZ);
  AddFtpCommand('PROT', HandlePROT);
  AddFtpCommand('AUTH', HandleAUTH);
end;

constructor TclFtpServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUserAccounts := TclUserAccountList.Create(Self, TclFtpUserAccountItem);
  Port := cDefaultFtpPort;
  CaseInsensitive := False;
  FAllowAnonymousAccess := False;
  FDirListingStyle := lsMsDos;
  ServerName := 'Clever Internet Suite FTP service';
end;

function TclFtpServer.CreateDefaultConnection: TclCommandConnection;
begin
  Result := TclFtpCommandConnection.Create();
end;

procedure TclFtpServer.SetRootDir(const Value: string);
begin
  if (FRootDir <> Value) then
  begin
    FRootDir := Value;
    if (FRootDir <> '') and (FRootDir[Length(FRootDir)] = '\') then
    begin
      Delete(FRootDir, Length(FRootDir), 1);
    end;
  end;
end;

procedure TclFtpServer.CollectDirList(AConnection: TclFtpCommandConnection;
  AList: TStrings; const APathName: string; ADetails: Boolean);
var
  i: Integer;
  path: string;
  includeHidden: Boolean;
  fileList: TclFtpFileList;
begin
  includeHidden := False;
  path := APathName;
  if (LowerCase(path) = '-al') then
  begin
    path := '';
    includeHidden := True;
  end;

  fileList := TclFtpFileList.Create(TclFtpFileItem);
  try
    DoGetFileList(AConnection, GetFullPath(AConnection, path), includeHidden, fileList);

    AList.Clear();
    for i := 0 to fileList.Count - 1 do
    begin
      if ADetails then
      begin
        AList.Add(fileList[i].Info.Build(DirListingStyle));
      end else
      begin
        AList.Add(fileList[i].Info.FileName);
      end;
    end;
  finally
    fileList.Free();
  end;
end;

procedure TclFtpServer.DoGetFileList(AConnection: TclFtpCommandConnection;
  const APathName: string; AIncludeHidden: Boolean; AFileList: TclFtpFileList);
begin
  if Assigned(OnGetFileList) then
  begin
    OnGetFileList(Self, AConnection, APathName, AIncludeHidden, AFileList);
  end;
end;

function TclFtpServer.GetFullPath(AConnection: TclFtpCommandConnection;
  const APathName: string): string;
  function NormalizePath(const APath: string): string;
  begin
    Result := StringReplace(APath, '/', '\', [rfReplaceAll]);
    if (Result <> '') and (Result[1] <> '\') then
    begin
      Result := '\' + Result;
    end;
    if (Result <> '') and (Result[Length(Result)] = '\') then
    begin
      Delete(Result, Length(Result), 1);
    end;
  end;
  
begin
  Result := NormalizePath(APathName);
  if not (TextPos('\', Result, 2) > 1) then
  begin
    Result := NormalizePath(AConnection.CurrentDir) + Result;
  end;
  if (AConnection.RootDir <> '') then
  begin
    Result := AConnection.RootDir + Result;
  end else
  begin
    Result := RootDir + Result;
  end;
  Assert(system.Pos('..', Result) = 0);
  Assert(system.Pos('\\', Result) = 0);
end;

procedure TclFtpServer.HandleQUIT(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  try
    SendResponse(AConnection, ACommand, '221 Bye Bye.');
    AConnection.Close(False);
  except
    on EclSocketError do ;
  end;
end;

procedure TclFtpServer.HandleUSER(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  AConnection.InitParams();
  AConnection.FTempUserName := Trim(AParams);
  if AllowAnonymousAccess and IsAnonymousUser(AConnection.FTempUserName) then
  begin
    SendResponse(AConnection, ACommand, '331 Anonymous access allowed, send identity (e-mail name) as password.');
  end else
  begin
    SendResponse(AConnection, ACommand, '331 Password required for %s.', [AConnection.FTempUserName]);
  end;
end;

procedure TclFtpServer.DoAuthenticate(AConnection: TclFtpCommandConnection;
  Account: TclFtpUserAccountItem; const APassword: string;
  var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnAuthenticate) then
  begin
    OnAuthenticate(Self, AConnection, Account, APassword, IsAuthorized, handled);
  end;
end;

function TclFtpServer.Authenticate(AConnection: TclFtpCommandConnection;
  Account: TclUserAccountItem; const APassword: string): Boolean;
var
  handled: Boolean;
begin
  handled := False;
  Result := False;
  DoAuthenticate(AConnection, TclFtpUserAccountItem(Account), APassword, Result, handled);
  if (not handled) and (Account <> nil) then
  begin
    Result := Account.Authenticate(APassword);
  end;
end;

procedure TclFtpServer.HandlePASS(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  account: TclUserAccountItem;
begin
  CheckTlsMode(AConnection, ACommand);
  if (AConnection.FTempUserName = '') then
  begin
    RaiseFtpError(ACommand, 'Login with USER first.', 503);
  end;

  AConnection.FUserName := AConnection.FTempUserName;
  AConnection.FTempUserName := '';
  AConnection.FIsAuthorized := False;

  if AllowAnonymousAccess and IsAnonymousUser(AConnection.UserName) then
  begin
    if (Trim(AParams) = '') then
    begin
      RaiseFtpError(ACommand, Format('User %s cannot log in.', [AConnection.UserName]), 530);
    end;

    AConnection.FReadOnlyAccess := True;
    AConnection.FRootDir := RootDir;
    AConnection.FIsAuthorized := True;

    SendResponse(AConnection, ACommand, '230 Anonymous user logged in.');
  end else
  begin
    account := UserAccounts.AccountByUserName(AConnection.UserName);
    if not Authenticate(AConnection, account, Trim(AParams)) then
    begin
      RaiseFtpError(ACommand, Format('User %s cannot log in.', [AConnection.UserName]), 530);
    end;

    if (account <> nil) then
    begin
      AConnection.FReadOnlyAccess := (account as TclFtpUserAccountItem).ReadOnlyAccess;
      AConnection.FRootDir := (account as TclFtpUserAccountItem).RootDir;
    end;
    AConnection.FIsAuthorized := True;

    SendResponse(AConnection, ACommand, '230 User %s logged in.', [AConnection.UserName]);
  end;
end;

function TclFtpServer.IsAnonymousUser(const AUserName: string): Boolean;
begin
  if CaseInsensitive then
  begin
    Result := SameText('anonymous', AUserName);
  end else
  begin
    Result := ('Anonymous' = AUserName);
  end;
end;

procedure TclFtpServer.HandleMODE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  s := UpperCase(Trim(AParams));
  if (Length(s) <> 1) then
  begin
    RaiseArgumentError(ACommand);
  end;
  case s[1] of
    'B': AConnection.FTransferMode := tmBlock;
    'C': AConnection.FTransferMode := tmCompressed;
    'S': AConnection.FTransferMode := tmStream;
    'Z': AConnection.FTransferMode := tmDeflate
  else
    RaiseArgumentError(ACommand);
  end;
  SendResponse(AConnection, ACommand, '200 Mode %s ok.', [s]);
end;

procedure TclFtpServer.HandleSTRU(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  s := UpperCase(Trim(AParams));
  if (Length(s) <> 1) then
  begin
    RaiseArgumentError(ACommand);
  end;
  case s[1] of
    'F': AConnection.FTransferStructure := tsFile;
    'R': AConnection.FTransferStructure := tsRecord;
    'P': AConnection.FTransferStructure := tsPage
  else
    RaiseArgumentError(ACommand);
  end;
  SendResponse(AConnection, ACommand, '200 STRU %s ok.', [s]);
end;

procedure TclFtpServer.HandleTYPE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  s := UpperCase(Trim(AParams));
  if (Length(s) <> 1) then
  begin
    RaiseArgumentError(ACommand);
  end;
  case s[1] of
    'A': AConnection.FTransferType := ttAscii;
    'I': AConnection.FTransferType := ttBinary
  else
    RaiseArgumentError(ACommand);
  end;
  SendResponse(AConnection, ACommand, '200 Type %s ok.', [s]);
end;

procedure TclFtpServer.HandleREST(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  AConnection.FDataPosition := StrToIntDef(Trim(AParams), 0);
  SendResponse(AConnection, ACommand, '350 Restarting at %d.', [AConnection.FDataPosition]);
end;

procedure TclFtpServer.InitDataConnection(AConnection: TclFtpCommandConnection;
  ADataConnection: TclSyncConnection);
begin
  AConnection.AssignDataConnection(ADataConnection);
  if (UseTLS <> stNone) and AConnection.DataProtection then
  begin
    ADataConnection.NetworkStream := TclTlsNetworkStream.Create();
    TclTlsNetworkStream(ADataConnection.NetworkStream).OnGetCertificate := GetCertificate;
    TclTlsNetworkStream(ADataConnection.NetworkStream).TLSFlags := TLSFlags;
    TclTlsNetworkStream(ADataConnection.NetworkStream).RequireClientCertificate := False;
  end else
  begin
    ADataConnection.NetworkStream := TclNetworkStream.Create();
  end;
  AConnection.FDataConnection.TimeOut := TimeOut;
  AConnection.FDataConnection.BatchSize := BatchSize;
  AConnection.FDataConnection.IsReadUntilClose := True;
  AConnection.FDataConnection.BitsPerSec := BitsPerSec;

  DoInitDataConnection(AConnection);
end;

procedure TclFtpServer.DoInitDataConnection(AConnection: TclFtpCommandConnection);
begin
  if Assigned(OnInitDataConnection) then
  begin
    OnInitDataConnection(Self, AConnection);
  end;
end;

procedure TclFtpServer.HandlePORT(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  parameter: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);

  AConnection.FPassiveMode := False;

  parameter := Trim(AParams);
  if (parameter = '') or (WordCount(parameter, [',']) < 6) then
  begin
    RaiseArgumentError(ACommand);
  end;
  ParseFtpHostStr(parameter, AConnection.FDataIP, AConnection.FDataPort);

  InitDataConnection(AConnection, TclTcpClientConnection.Create());
  SendResponse(AConnection, ACommand, '200 PORT command successful.');
end;

procedure TclFtpServer.HandlePASV(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  dataConnection: TclTcpServerConnection;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);

  AConnection.FPassiveMode := True;

  dataConnection := TclTcpServerConnection.Create();
  InitDataConnection(AConnection, dataConnection);

  AConnection.FDataIP := '';
  AConnection.FDataPort := dataConnection.Open(0);

  SendResponse(AConnection, ACommand, '227 Entering Passive Mode (%s).',
    [GetFtpHostStr(GetFtpLocalHostStr(AConnection.PeerName), AConnection.DataPort)]);
end;

procedure TclFtpServer.InternalHandleList(AConnection: TclFtpCommandConnection;
  const ACommand, AParams: string; ADetails: Boolean);
var
  list: TStrings;
  isAborted: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  list := TStringList.Create();
  try
    CollectDirList(AConnection, list, Trim(AParams), ADetails);

    OpenDataConnection(AConnection, ACommand);
    SendResponse(AConnection, ACommand, '150 Opening data connection.');

    try
      AConnection.FDataConnection.WriteString(list.Text);
    except
      on EclSocketError do
      begin
        AConnection.FDataConnection.Abort();
      end;
    end;
    
    isAborted := AConnection.FDataConnection.IsAborted;
    AConnection.AssignDataConnection(nil);

    if isAborted then
    begin
      SendResponse(AConnection, ACommand, '426 Connection closed, transfer aborted.');
    end;
    SendResponse(AConnection, ACommand, '226 %s.', [cTransferResult[isAborted]]);
  finally
    list.Free();
  end;
end;

procedure TclFtpServer.HandleLIST(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  InternalHandleList(AConnection, ACommand, AParams, True);
end;

procedure TclFtpServer.HandleMKD(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
  success: Boolean;
  error: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  s := Trim(AParams);
  if (s = '') then
  begin
    RaiseArgumentError(ACommand);
  end;
  CheckAccessRights(AConnection, ACommand, s);

  success := True;
  error := '';
  DoCreateDir(AConnection, GetFullPath(AConnection, s), success, error);
  if not success then
  begin
    RaiseFileAccessError(ACommand, s, error);
  end;
  SendResponse(AConnection, ACommand, '257 %s directory created.', [s]);
end;

procedure TclFtpServer.DoCreateDir(AConnection: TclFtpCommandConnection;
  const AName: string; var Success: Boolean; var AErrorMessage: string);
begin
  if Assigned(OnCreateDir) then
  begin
    OnCreateDir(Self, AConnection, AName, Success, AErrorMessage);
  end;
end;

procedure TclFtpServer.InternalHandleCwd(AConnection: TclFtpCommandConnection; const ACommand, ACurDir: string);
var
  ind: Integer;
  curDir, newDir: string;
  info: TclFtpFileInfo;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  curDir := Trim(ACurDir);
  if (Length(curDir) > 1) and (curDir[Length(curDir)] = '/') then
  begin
    Delete(curDir, Length(curDir), 1);
  end;
  if (curDir = '..') then
  begin
    ind := RTextPos('/', AConnection.FCurrentDir);
    if (ind > 1) then
    begin
      AConnection.FCurrentDir := Copy(AConnection.FCurrentDir, 1, ind - 1);
    end else
    if (ind = 1) then
    begin
      AConnection.FCurrentDir := '/';
    end;
  end else
  if (curDir = '/') then
  begin
    AConnection.FCurrentDir := '/';
  end else
  begin
    if (curDir = '') then
    begin
      curDir := '/';
    end;
    if (AConnection.FCurrentDir <> '')
      and (AConnection.FCurrentDir[Length(AConnection.FCurrentDir)] = '/') then
    begin
      system.Delete(AConnection.FCurrentDir, Length(AConnection.FCurrentDir), 1);
    end;

    if (curDir <> '') and (curDir[1] = '/') then
    begin
      newDir := curDir;
    end else
    begin
      if (curDir <> '') and (curDir[1] <> '/') then
      begin
        curDir := '/' + curDir;
      end;
      newDir := AConnection.FCurrentDir + curDir;
    end;

    info := GetFileInfo(AConnection, ACommand, newDir);
    try
      if not info.IsDirectory then
      begin
        RaiseFileAccessError(ACommand, newDir, 'No such file or directory.');
      end;

      AConnection.FCurrentDir := newDir;
    finally
      info.Free();
    end;
  end;
  SendResponse(AConnection, ACommand, '250 CWD command successful.');
end;

procedure TclFtpServer.HandleCDUP(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  InternalHandleCwd(AConnection, ACommand, '..');
end;

procedure TclFtpServer.HandleCWD(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  InternalHandleCwd(AConnection, ACommand, AParams);
end;

procedure TclFtpServer.HandlePWD(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  s := AConnection.FCurrentDir;
  if (s = '') then
  begin
    s := '/';
  end;
  SendResponse(AConnection, ACommand, '257 "%s" is current directory.', [s]);
end;

procedure TclFtpServer.HandleRMD(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  InternalHandleDelete(AConnection, ACommand, AParams);
end;

procedure TclFtpServer.InternalHandleDelete(AConnection: TclFtpCommandConnection;
  const ACommand, AParams: string);
var
  s: string;
  success: Boolean;
  error: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  s := Trim(AParams);
  if (s = '') then
  begin
    RaiseArgumentError(ACommand);
  end;
  CheckAccessRights(AConnection, ACommand, s);

  success := True;
  error := '';
  DoDelete(AConnection, GetFullPath(AConnection, s), success, error);
  if not success then
  begin
    RaiseFileAccessError(ACommand, s, error);
  end;
  SendResponse(AConnection, ACommand, '250 %s command successful.', [ACommand]);
end;

procedure TclFtpServer.DoDelete(AConnection: TclFtpCommandConnection;
  const AName: string; var Success: Boolean; var AErrorMessage: string);
begin
  if Assigned(OnDelete) then
  begin
    OnDelete(Self, AConnection, AName, Success, AErrorMessage);
  end;
end;

procedure TclFtpServer.HandleSTOR(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  InternalHandleStor(AConnection, ACommand, AParams, False, False);
end;

procedure TclFtpServer.HandleSIZE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
  info: TclFtpFileInfo;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);

  s := Trim(AParams);
  if (s = '') then
  begin
    RaiseArgumentError(ACommand);
  end;

  info := GetFileInfo(AConnection, ACommand, s);
  try
    SendResponse(AConnection, ACommand, '213 %d', [info.Size]);
  finally
    info.Free();
  end
end;

procedure TclFtpServer.HandleRNFR(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
  info: TclFtpFileInfo;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  s := Trim(AParams);
  if (s = '') then
  begin
    RaiseArgumentError(ACommand);
  end;
  CheckAccessRights(AConnection, ACommand, s);
  AConnection.FCurrentName := s;

  info := GetFileInfo(AConnection, ACommand, AConnection.FCurrentName);
  try
    SendResponse(AConnection, ACommand, '350 File exists, ready for destination name');
  finally
    info.Free();
  end
end;

procedure TclFtpServer.HandleRNTO(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  curName, newName: string;
  success: Boolean;
  error: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  if (AConnection.FCurrentName = '') then
  begin
    RaiseFtpError(ACommand, 'Bad sequence of commands.', 503);
  end;

  curName := AConnection.FCurrentName;
  newName := Trim(AParams);
  if (newName = '') then
  begin
    RaiseArgumentError(ACommand);
  end;
  CheckAccessRights(AConnection, ACommand, newName);

  success := True;
  error := '';
  DoRename(AConnection, GetFullPath(AConnection, curName), GetFullPath(AConnection, newName), success, error);
  if not success then
  begin
    RaiseFileAccessError(ACommand, newName, error);
  end;
  SendResponse(AConnection, ACommand, '250 RNTO command successful.');
end;

procedure TclFtpServer.DoRename(AConnection: TclFtpCommandConnection;
  const ACurrentName, ANewName: string; var Success: Boolean; var AErrorMessage: string);
begin
  if Assigned(OnRename) then
  begin
    OnRename(Self, AConnection, ACurrentName, ANewName, Success, AErrorMessage);
  end;
end;

procedure TclFtpServer.HandleNLST(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  InternalHandleList(AConnection, ACommand, AParams, False);
end;

procedure TclFtpServer.HandleDELE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  InternalHandleDelete(AConnection, ACommand, AParams);
end;

procedure TclFtpServer.HandleRETR(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  stream: TStream;
  fileName, error: string;
  isAborted, success: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  fileName := GetFullPath(AConnection, Trim(AParams));

  if (fileName = '') then
  begin
    RaiseArgumentError(ACommand);
  end;

  stream := nil;
  try
    success := True;
    error := '';
    DoGetFile(AConnection, fileName, stream, success, error);
    if (not success) or (stream = nil) then
    begin
      RaiseFileAccessError(ACommand, ExtractFileName(fileName), error);
    end;

    if (AConnection.FDataPosition > 0) and (AConnection.FDataPosition < stream.Size) then
    begin
      stream.Position := AConnection.FDataPosition;
    end;

    OpenDataConnection(AConnection, ACommand);
    SendResponse(AConnection, ACommand, '150 Opening data connection for %s(%d bytes).',
      [ExtractFileName(fileName), stream.Size]);

    try
      AConnection.FDataConnection.WriteData(stream);
    except
      on EclSocketError do
      begin
        AConnection.FDataConnection.Abort();
      end;
    end;
  finally
    stream.Free();
  end;
  isAborted := AConnection.FDataConnection.IsAborted;
  AConnection.AssignDataConnection(nil);

  if isAborted then
  begin
    SendResponse(AConnection, ACommand, '426 Connection closed, transfer aborted.');
  end;
  SendResponse(AConnection, ACommand, '226 %s.', [cTransferResult[isAborted]]);
end;

procedure TclFtpServer.DoGetFile(AConnection: TclFtpCommandConnection; const AFileName: string;
  var ASource: TStream; var Success: Boolean; var AErrorMessage: string);
begin
  if Assigned(OnGetFile) then
  begin
    OnGetFile(Self, AConnection, AFileName, ASource, Success, AErrorMessage);
  end;
end;

procedure TclFtpServer.RaiseFileAccessError(const ACommand, AFileName, AMessage: string);
var
  msg: string;
begin
  msg := AMessage;
  if (msg = '') then
  begin
    msg := 'failed';
  end;
  RaiseFtpError(ACommand, AFileName + ': ' + msg, 550);
end;

procedure TclFtpServer.RaiseArgumentError(const ACommand: string);
begin
  RaiseFtpError(ACommand, 'invalid argument', 501);
end;

procedure TclFtpServer.RaiseDataConnectionError(const ACommand: string);
begin
  RaiseFtpError(ACommand, 'Can not open data connection', 425);
end;

procedure TclFtpServer.SetUserAccounts(const Value: TclUserAccountList);
begin
  FUserAccounts.Assign(Value);
end;

function TclFtpServer.GetCaseInsensitive: Boolean;
begin
  Result := FUserAccounts.CaseInsensitive;
end;

procedure TclFtpServer.SetCaseInsensitive(const Value: Boolean);
begin
  FUserAccounts.CaseInsensitive := Value;
end;

procedure TclFtpServer.HandleSITE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  list: TStrings;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);

  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  list.Add('214-The following SITE  commands are recognized.');
  SendMultipleLines(AConnection, '214  HELP command successful.', True);
end;

procedure TclFtpServer.HandleNOOP(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  SendResponse(AConnection, ACommand, '200 NOOP command successful.');
end;

procedure TclFtpServer.DoHelpCommand(AConnection: TclFtpCommandConnection;
  const AParams: string; AHelpText: TStrings);
begin
  if Assigned(OnHelpCommand) then
  begin
    OnHelpCommand(Self, AConnection, AParams, AHelpText);
  end;
end;

procedure TclFtpServer.HandleHELP(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  list: TStrings;
begin
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);

  DoHelpCommand(AConnection, AParams, list);
  if (list.Count = 0) then
  begin
    list.Add('The following commands are recognized');
  end;
  list[0] := '214-' + list[0];
  SendMultipleLines(AConnection, '214 HELP command successful.', True);
end;

procedure TclFtpServer.HandleREIN(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  AConnection.InitParams();
  SendResponse(AConnection, ACommand, '220 Service ready for new user.');
end;

procedure TclFtpServer.HandleSTAT(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
const
  TransferTypes: array[TclFtpTransferType] of string = ('ASCII', 'BINARY');
  TransferForms: array[TclFtpTransferType] of string = ('Print', 'Nonprint');
  TransferStructs: array[TclFtpTransferStructure] of string = ('File', 'Record', 'Page');
  TransferModes: array[TclFtpTransferMode] of string = ('BLOCK', 'COMPRESSED', 'STREAM', 'DEFLATE');

var
  list: TStrings;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);

  list.Add('211-FTP Service status:');
  list.Add('     Connected to ' + AConnection.PeerName);
  list.Add('     Logged in as ' + AConnection.UserName);
  list.Add(Format('     TYPE: %s, FORM: %s; STRUcture: %s; transfer MODE: %s',
    [
      TransferTypes[AConnection.TransferType],
      TransferForms[AConnection.TransferType],
      TransferStructs[AConnection.TransferStructure],
      TransferModes[AConnection.TransferMode]
    ]));
  if (AConnection.DataConnection = nil) then
  begin
    list.Add('     No data connection');
  end;

  SendMultipleLines(AConnection, '211 End of status.', True);
end;

procedure TclFtpServer.HandleSYST(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  SendResponse(AConnection, ACommand, '215 Windows 9x/NT.');
end;

procedure TclFtpServer.HandleAPPE(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  InternalHandleStor(AConnection, ACommand, AParams, True, False);
end;

function TclFtpServer.IsFileExists(AConnection: TclFtpCommandConnection;
  const ACommand, AFileName: string): Boolean;
begin
  if not Assigned(OnGetFileInfo) then
  begin
    RaiseFileAccessError(ACommand, ExtractFileName(AFileName), '');
  end;

  try
    GetFileInfo(AConnection, ACommand, AFileName).Free();
    Result := True;
  except
    on EclSocketError do
    begin
      Result := False;
    end;
  end;
end;

procedure TclFtpServer.OpenDataConnection(AConnection: TclFtpCommandConnection; const ACommand: string);
begin
  if (AConnection.FDataConnection = nil) then
  begin
    RaiseDataConnectionError(ACommand);
  end;

  if AConnection.PassiveMode then
  begin
    TclTcpServerConnection(AConnection.FDataConnection).AcceptConnection();
  end else
  begin
    TclTcpClientConnection(AConnection.FDataConnection).Open(AConnection.DataIP, AConnection.DataPort);
  end;
end;

procedure TclFtpServer.InternalHandleStor(AConnection: TclFtpCommandConnection;
  const ACommand, AParams: string; Append, ACreateUnique: Boolean);
var
  i: Integer;
  stream: TStream;
  fileName, error: string;
  success, isAppend,
  isAborted: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);

  if ACreateUnique then
  begin
    i := 1;
    repeat
      fileName := GetFullPath(AConnection, Format('FTP%d.TMP', [i]));
      Inc(i);
    until not IsFileExists(AConnection, ACommand, fileName);
  end else
  begin
    fileName := GetFullPath(AConnection, Trim(AParams));
    if (fileName = '') then
    begin
      RaiseArgumentError(ACommand);
    end;
  end;

  CheckAccessRights(AConnection, ACommand, ExtractFileName(fileName));

  OpenDataConnection(AConnection, ACommand);
  SendResponse(AConnection, ACommand, '150 Opening data connection for %s.', [ExtractFileName(fileName)]);

  stream := nil;
  try
    isAppend := (AConnection.FDataPosition > 0) or Append;

    success := True;
    error := '';
    DoPutFile(AConnection, fileName, not isAppend, stream, success, error);
    if (not success) or (stream = nil) then
    begin
      RaiseFileAccessError(ACommand, ExtractFileName(fileName), error);
    end;

    if isAppend then
    begin
      if (AConnection.FDataPosition > 0) and (AConnection.FDataPosition < stream.Size) then
      begin
        stream.Position := AConnection.FDataPosition;
      end else
      begin
        stream.Position := stream.Size;
      end;
    end;

    try
      AConnection.FDataConnection.ReadData(stream);
    except
      on EclSocketError do
      begin
        AConnection.FDataConnection.Abort();
      end;
    end;
  finally
    stream.Free();
  end;
  
  isAborted := AConnection.FDataConnection.IsAborted;
  AConnection.AssignDataConnection(nil);

  if isAborted then
  begin
    SendResponse(AConnection, ACommand, '426 Connection closed, transfer aborted.');
  end;
  SendResponse(AConnection, ACommand, '226 %s.', [cTransferResult[isAborted]]);
end;

procedure TclFtpServer.DoPutFile(AConnection: TclFtpCommandConnection; const AFileName: string;
  AOverwrite: Boolean; var ADestination: TStream; var Success: Boolean; var AErrorMessage: string);
begin
  if Assigned(OnPutFile) then
  begin
    OnPutFile(Self, AConnection, AFileName, AOverwrite, ADestination, Success, AErrorMessage);
  end;
end;

procedure TclFtpServer.HandleSTOU(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  AConnection.FDataPosition := 0;
  InternalHandleStor(AConnection, ACommand, AParams, False, True);
end;

procedure TclFtpServer.HandleABOR(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAuthorized(AConnection, ACommand);
  AConnection.FDataConnectionAccess.Enter();
  try
    if (AConnection.FDataConnection = nil) then
    begin
//      SendResponse(AConnection, ACommand, '225 ABOR command successful.');
    end else
    begin
      AConnection.FDataConnection.Abort();
    end;
  finally
    AConnection.FDataConnectionAccess.Leave();
  end;
end;

procedure TclFtpServer.DoDestroy;
begin
  FUserAccounts.Free();
  inherited DoDestroy();
end;

function TclFtpServer.GetNullCommand(const ACommand: string): TclTcpCommandInfo;
var
  info: TclFtpCommandInfo;
begin
  info := TclFtpCommandInfo.Create();
  info.Name := ACommand;
  info.FHandler := HandleNullCommand;
  Result := info;
end;

procedure TclFtpServer.HandleNullCommand(AConnection: TclFtpCommandConnection;
  const ACommand, AParams: string);
begin
  RaiseFtpError(ACommand, 'Command not implemented.', 502);
end;

procedure TclFtpServer.ProcessUnhandledError(AConnection: TclCommandConnection;
  AParams: TclTcpCommandParams; E: Exception);
begin
  SendResponse(AConnection, AParams.Command, '451 Requested action aborted: ' + Trim(E.Message));
end;

procedure TclFtpServer.CheckAuthorized(AConnection: TclFtpCommandConnection; const ACommand: string);
begin
  if not AConnection.IsAuthorized then
  begin
    RaiseFtpError(ACommand, 'Not logged in.', 530);
  end;
end;

procedure TclFtpServer.CheckAccessRights(AConnection: TclFtpCommandConnection; const ACommand, AName: string);
begin
  if AConnection.ReadOnlyAccess then
  begin
    RaiseFtpError(ACommand, Format('%s: Access is denied.', [AName]), 550);
  end;
end;

function TclFtpServer.GetFileInfo(AConnection: TclFtpCommandConnection; const ACommand, AName: string): TclFtpFileInfo;
var
  success: Boolean;
  error: string;
begin
  Result := TclFtpFileInfo.Create();
  try
    success := True;
    error := '';
    DoGetFileInfo(AConnection, GetFullPath(AConnection, AName), Result, success, error);
    if not success then
    begin
      RaiseFileAccessError(ACommand, AName, error);
    end;
  except
    Result.Free();
    raise;
  end;
end;

procedure TclFtpServer.DoGetFileInfo(AConnection: TclFtpCommandConnection; const AName: string;
  AInfo: TclFtpFileInfo; var Success: Boolean; var AErrorMessage: string);
begin
  if Assigned(OnGetFileInfo) then
  begin
    OnGetFileInfo(Self, AConnection, AName, AInfo, Success, AErrorMessage);
  end;
end;

procedure TclFtpServer.DoProcessCommand(AConnection: TclCommandConnection;
  AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams);
begin
  if TclFtpCommandInfo(AInfo).FIsOOB then
  begin
    inherited DoProcessCommand(AConnection, AInfo, AParams);
  end else
  begin
    AConnection.BeginWork();
    try
      inherited DoProcessCommand(AConnection, AInfo, AParams);
    finally
      AConnection.EndWork();
    end;
  end;
end;

procedure TclFtpServer.HandlePBSZ(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
begin
  SendResponse(AConnection, ACommand, '200 Protection buffer size set to 0');
end;

procedure TclFtpServer.HandlePROT(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
begin
  s := UpperCase(Trim(AParams));
  case s[1] of
    'C':
      begin
        AConnection.FDataProtection := False;
        SendResponse(AConnection, ACommand, '200 Data channel will be clear text');
      end;
    'P':
      begin
        AConnection.FDataProtection := True;
        SendResponse(AConnection, ACommand, '200 Data channel will be encrypted');
      end;
  else
    RaiseFtpError(ACommand, 'Unsupported option', 536);
  end;
end;

procedure TclFtpServer.HandleAUTH(AConnection: TclFtpCommandConnection; const ACommand, AParams: string);
var
  s: string;
begin
  if (UseTLS = stNone) then
  begin
    RaiseFtpError(ACommand, 'SSL encryption disabled', 500);
  end;
  if (UseTLS = stImplicit) then
  begin
    RaiseFtpError(ACommand, 'Secure mode is already started.', 500);
  end;
  s := UpperCase(Trim(AParams));
  if (s <> 'TLS') then
  begin
    RaiseFtpError(ACommand, 'Unknown auth method ' + s, 504);
  end;

  SendResponse(AConnection, ACommand, '234 Enabling SSL');
  StartTls(AConnection);
end;

procedure TclFtpServer.CheckTlsMode(AConnection: TclFtpCommandConnection; const ACommand: string);
begin
  if (UseTLS = stExplicitRequire) and (not AConnection.IsTls) then
  begin
    RaiseFtpError(ACommand, 'Sorry SSL encryption is required', 500);
  end;
end;

{ TclFtpCommandConnection }

procedure TclFtpCommandConnection.AssignDataConnection(AConnection: TclSyncConnection);
begin
  FDataConnectionAccess.Enter();
  try
    if (FDataConnection <> nil) then
    begin
      FDataConnection.Close(False);
      FDataConnection.Free();
    end;
    FDataConnection := AConnection;
    FDataPosition := 0;
  finally
    FDataConnectionAccess.Leave();
  end;
end;

constructor TclFtpCommandConnection.Create;
begin
  inherited Create();
  FDataConnectionAccess := TCriticalSection.Create();
  InitParams();
end;

procedure TclFtpCommandConnection.InitParams;
begin
  FTransferMode := tmStream;
  FTransferStructure := tsFile;
  FTransferType := ttAscii;
  FCurrentDir := '/';
  FIsAuthorized := False;
  FReadOnlyAccess := False;
  FDataPosition := 0;
  FCurrentName := '';
  FUserName := '';
  FRootDir := '';
  FDataPort := 0;
  FDataIP := '';
  FPassiveMode := False;
  FDataProtection := False;
end;

procedure TclFtpCommandConnection.DoDestroy;
begin
  BeginWork();
  try
    AssignDataConnection(nil);
  finally
    EndWork();
  end;
  FDataConnectionAccess.Free();
  inherited DoDestroy();
end;

{ TclFtpUserAccountItem }

procedure TclFtpUserAccountItem.Assign(Source: TPersistent);
var
  account: TclFtpUserAccountItem;
begin
  inherited Assign(Source);
  if (Source is TclFtpUserAccountItem) then
  begin
    account := (Source as TclFtpUserAccountItem);
    FReadOnlyAccess := account.ReadOnlyAccess;
    FRootDir := account.RootDir;
  end;
end;

procedure TclFtpUserAccountItem.SetRootDir(const Value: string);
begin
  if (FRootDir <> Value) then
  begin
    FRootDir := Value;
    if (FRootDir <> '') and (FRootDir[Length(FRootDir)] = '\') then
    begin
      Delete(FRootDir, Length(FRootDir), 1);
    end;
  end;
end;

{ TclFtpCommandInfo }

procedure TclFtpCommandInfo.Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams);
begin
  FHandler(AConnection as TclFtpCommandConnection, Name, AParams.Params);
end;

{ TclFtpFileItem }

constructor TclFtpFileItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FInfo := TclFtpFileInfo.Create();
end;

destructor TclFtpFileItem.Destroy;
begin
  FInfo.Free();
  inherited Destroy();
end;

{ TclFtpFileList }

function TclFtpFileList.Add: TclFtpFileItem;
begin
  Result := TclFtpFileItem(inherited Add());
end;

function TclFtpFileList.GetItem(Index: Integer): TclFtpFileItem;
begin
  Result := TclFtpFileItem(inherited GetItem(Index));
end;

procedure TclFtpFileList.SetItem(Index: Integer; const Value: TclFtpFileItem);
begin
  inherited SetItem(Index, Value);
end;

end.
