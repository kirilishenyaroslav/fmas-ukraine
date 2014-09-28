{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clFtp;

interface

{$I clVer.inc}
{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
{$ENDIF}

uses
  SysUtils, Classes, clTcpClient, clUtils, clFtpUtils, SyncObjs, clSocket, clCert;

type
  TclDirectoryListingEvent = procedure(Sender: TObject; AFileInfo: TclFtpFileInfo;
    const Source: string) of object;

  TclCustomFtp = class(TclTcpCommandClient)
  private
    FPassiveMode: Boolean;
    FTransferMode: TclFtpTransferMode;
    FTransferStructure: TclFtpTransferStructure;
    FTransferType: TclFtpTransferType;
    FDataConnection: TclSyncConnection;
    FOnCustomFtpProxy : TNotifyEvent;
    FProxySettings: TclFtpProxySettings;
    FOnDirectoryListing: TclDirectoryListingEvent;
    FDataAccessor: TCriticalSection;
    FResourcePos: Int64;
    FDataProtection: Boolean;
    FResponsePos: Integer;
    procedure BeginAccess;
    procedure EndAccess;
    function GetCurrentDir: string;
    procedure SetPassiveMode(const Value: Boolean);
    procedure SetDataProtection(const Value: Boolean);
    procedure SetTransferMode(const Value: TclFtpTransferMode);
    procedure SetTransferStructure(const Value: TclFtpTransferStructure);
    procedure InternalGetData(const ACommand: string; ADestination: TStream;
      AMaxReadSize, ADataSize: Int64);
    procedure InternalPutData(const ACommand: string; ASource: TStream; AMaxWriteSize: Int64);
    procedure SetTransferParams;
    function ParseFileSize: Int64;
    procedure ParsePassiveModeResponse(var AHost: string; var ADataPort: Integer);
    procedure SetTransferType(const Value: TclFtpTransferType);
    procedure SetPositionIfNeed;
    procedure SetProxySettings(const Value: TclFtpProxySettings);
    function GetFtpHost: string;
    function GetLoginPassword: string;
    procedure ParseDirectoryListing(AList: TStrings);
    procedure DoDataProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
    procedure SetDataPortMode(const AServer: string; ADataPort: Integer);
    procedure SetDataPassiveMode(var AHost: string; var ADataPort: Integer);
    procedure InternalFxpOperation(const APutMethod, ASourceFile, ADestinationFile: string;
      ASourceSite, ADestinationSite: TclCustomFtp);
    function GetFileSizeIfNeed(const AFileName: string): Int64;
    procedure ClearResponse;
    procedure WaitingMultipleResponses(const AOkResponses: array of Integer);
  protected
    function GetDefaultPort: Integer; override;
    function GetResponseCode(const AResponse: string): Integer; override;
    procedure OpenConnection(const AServer: string; APort: Integer); override;
    procedure OpenSession; override;
    procedure CloseSession; override;
    procedure SetUseTLS(const Value: TclClientTlsMode); override;
    procedure InternalSendCommandSync(const ACommand: string;
      const AOkResponses: array of Integer); override;
    procedure InitDataConnection(AConnection: TclSyncConnection; ABytesToProceed, ADataSize: Int64); virtual;
    procedure DoCustomFtpProxy; dynamic;
    procedure DoDirectoryListing(AFileInfo: TclFtpFileInfo; const Source: string); dynamic;
    property TransferMode: TclFtpTransferMode read FTransferMode write SetTransferMode default tmStream;
    property TransferStructure: TclFtpTransferStructure read FTransferStructure
      write SetTransferStructure default tsFile;
    property PassiveMode: Boolean read FPassiveMode write SetPassiveMode default False;
    property TransferType: TclFtpTransferType read FTransferType write SetTransferType default ttBinary;
    property DataProtection: Boolean read FDataProtection write SetDataProtection default False;
    property ProxySettings: TclFtpProxySettings read FProxySettings write SetProxySettings;
    property OnCustomFtpProxy: TNotifyEvent read FOnCustomFtpProxy write FOnCustomFtpProxy;
    property OnDirectoryListing: TclDirectoryListingEvent read FOnDirectoryListing write FOnDirectoryListing;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure StartTls; override;
    procedure GetList(AList: TStrings; const AParam: string = ''; ADetails: Boolean = True);
    procedure DirectoryListing(const AParam: string = '');
    procedure GetHelp(AHelp: TStrings; const ACommand: string = '');
    function GetFileSize(const AFileName: string): Int64;
    function FileExists(const AFileName: string): Boolean;

    procedure GetFile(const AFileName: string; ADestination: TStream); overload;
    procedure GetFile(const AFileName: string; ADestination: TStream; APosition, ASize: Int64); overload;
    procedure PutFile(const AFileName: string; ASource: TStream); overload;
    procedure PutFile(const AFileName: string; ASource: TStream; APosition, ASize: Int64); overload;
    procedure AppendFile(const AFileName: string; ASource: TStream);
    procedure PutUniqueFile(ASource: TStream);

    procedure FxpGetFile(const ASourceFile, ADestinationFile: string; ADestinationSite: TclCustomFtp);
    procedure FxpPutFile(const ASourceFile, ADestinationFile: string; ASourceSite: TclCustomFtp);
    procedure FxpAppendFile(const ASourceFile, ADestinationFile: string; ASourceSite: TclCustomFtp);
    procedure FxpPutUniqueFile(const ASourceFile: string; ASourceSite: TclCustomFtp);

    procedure Rename(const ACurrentName, ANewName: string);
    procedure Delete(const AFileName: string);
    procedure SetFilePermissions(const AFileName: string; AOwner, AGroup, AOther: TclFtpFilePermissions);
    procedure ChangeCurrentDir(const ANewDir: string);
    procedure ChangeToParentDir;
    procedure MakeDir(const ANewDir: string);
    procedure RemoveDir(const ADir: string);
    procedure Abort;
    procedure Noop;
    property DataAccessor: TCriticalSection read FDataAccessor write FDataAccessor;
    property CurrentDir: string read GetCurrentDir;
  end;

  TclFtp = class(TclCustomFtp)
  published
    property TransferMode;
    property TransferStructure;
    property PassiveMode;
    property TransferType;
    property DataProtection;
    property BatchSize;
    property UserName;
    property Password;
    property Server;
    property Port default cDefaultFtpPort;
    property TimeOut;
    property UseTLS;
    property CertificateFlags;
    property TLSFlags;
    property BitsPerSec;
    property ProxySettings;
    property OnChanged;
    property OnOpen;
    property OnClose;
    property OnGetCertificate;
    property OnVerifyServer;
    property OnSendCommand;
    property OnReceiveResponse;
    property OnProgress;
    property OnProgress64;
    property OnCustomFtpProxy;
    property OnDirectoryListing;
  end;

resourcestring
  cOnCustomFtpProxyRequired = 'OnCustomFtpProxy required but not assigned';
  
implementation

uses
  clTlsSocket{$IFDEF DEMO}, Forms, Windows{$ENDIF}{$IFDEF LOGGER}, clLogger{$ENDIF};

const
  Modes: array[TclFtpTransferMode] of string = ('B', 'C', 'S', 'Z');
  Structures: array[TclFtpTransferStructure] of string = ('F', 'R', 'P');
  TransferTypes: array[TclFtpTransferType] of string = ('A', 'I');

{ TclCustomFtp }

constructor TclCustomFtp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProxySettings := TclFtpProxySettings.Create();
  Port := cDefaultFtpPort;
  FTransferMode := tmStream;
  FTransferStructure := tsFile;
  FPassiveMode := False;
  FTransferType := ttBinary;
  FDataProtection := False;
end;

destructor TclCustomFtp.Destroy();
begin
  FProxySettings.Free();
  inherited Destroy();
end;

function TclCustomFtp.GetResponseCode(const AResponse: string): Integer;
begin
  if (Length(AResponse) > 3) and (AResponse[4] = '-') then
  begin
    Result := SOCKET_WAIT_RESPONSE;
  end else
  if (Length(AResponse) > 2) then
  begin
    Result := StrToIntDef(System.Copy(AResponse, 1, 3), SOCKET_WAIT_RESPONSE);
  end else
  begin
    Result := SOCKET_WAIT_RESPONSE;
  end;
end;

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}

procedure TclCustomFtp.OpenConnection(const AServer: string; APort: Integer);
begin
  if ((ProxySettings.ProxyType <> ptNone) and (ProxySettings.Server <> '')) then
  begin
    inherited OpenConnection(ProxySettings.Server, ProxySettings.Port);
  end else
  begin
    inherited OpenConnection(AServer, APort);
  end;
end;

procedure TclCustomFtp.StartTls;
begin
  SendCommandSync('AUTH TLS', [234]);
  inherited StartTls();
end;

procedure TclCustomFtp.OpenSession;
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  if FindWindow('TAppBuilder', nil) = 0 then
  begin
    MessageBox(0, 'This demo version can be run under Delphi/C++Builder IDE only. ' +
      'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    ExitProcess(1);
  end else
{$ENDIF}
  begin
{$IFNDEF IDEDEMO}
    if (not IsDemoDisplayed) and (not IsCertDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsDemoDisplayed := True;
    IsCertDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  WaitingResponse([220]);

  ExplicitStartTls();

  case ProxySettings.ProxyType of
    ptNone:
      begin
        SendCommandSync('USER %s', [230, 232, 331], [UserName]);
        if (LastResponseCode = 331) then
        begin
          SendCommandSync('PASS %s', [230], [Password]);
        end;
      end;
    ptUserSite:
      begin
        if (ProxySettings.UserName <> '') then
        begin
          SendCommandSync('USER %s', [230, 331], [ProxySettings.UserName]);
          if (LastResponseCode = 331) then
          begin
            SendCommandSync('PASS %s', [230], [ProxySettings.Password]);
          end;
        end;
        SendCommandSync('USER %s@%s', [230, 232, 331], [UserName, GetFtpHost()]);
        if (LastResponseCode = 331) then
        begin
          SendCommandSync('PASS %s', [230], [GetLoginPassword()]);
        end;
      end;
    ptSite:
      begin
        if (ProxySettings.UserName <> '') then
        begin
          SendCommandSync('USER %s', [230, 331], [ProxySettings.UserName]);
          if (LastResponseCode = 331) then
          begin
            SendCommandSync('PASS %s', [230], [ProxySettings.Password]);
          end;
        end;
        SendCommandSync('SITE %s', [220], [GetFtpHost()]);
        SendCommandSync('USER %s', [230, 232, 331], [UserName]);
        if (LastResponseCode = 331) then
        begin
          SendCommandSync('PASS %s', [230], [GetLoginPassword()]);
        end;
      end;
    ptOpen:
      begin
        if (ProxySettings.UserName <> '') then
        begin
          SendCommandSync('USER %s', [230, 331], [ProxySettings.UserName]);
          if (LastResponseCode = 331) then
          begin
            SendCommandSync('PASS %s', [230], [GetLoginPassword()]);
          end;
        end;
        SendCommandSync('OPEN %s', [220], [GetFtpHost()]);
        SendCommandSync('USER %s', [230, 232, 331], [UserName]);
        if (LastResponseCode = 331) then
        begin
          SendCommandSync('PASS %s', [230], [GetLoginPassword()]);
        end;
      end;
    ptUserPass:
      begin
        SendCommandSync('USER %s@%s@%s', [230, 232, 331], [UserName, ProxySettings.UserName, GetFtpHost()]);
        if (LastResponseCode = 331) then
        begin
          if (ProxySettings.Password <> '') then
          begin
            SendCommandSync('PASS %s@%s', [230], [GetLoginPassword(), ProxySettings.Password]);
          end else
          begin
             SendCommandSync('PASS %s', [230], [GetLoginPassword()]);
          end;
        end;
      end;
    ptTransparent:
      begin
        if (ProxySettings.UserName <> '') then
        begin
          SendCommandSync('USER %s', [230, 331], [ProxySettings.UserName]);
          if (LastResponseCode = 331) then
          begin
            SendCommandSync('PASS %s', [230], [ProxySettings.Password]);
          end;
        end;
        SendCommandSync('USER %s', [230, 232, 331], [UserName]);
        if (LastResponseCode = 331) then
        begin
          SendCommandSync('PASS %s', [230], [GetLoginPassword()]);
        end;
      end;
    ptCustomProxy:
      begin
        DoCustomFtpProxy();
      end;
  end;
end;

procedure TclCustomFtp.CloseSession;
begin
  SendSilentCommand('QUIT', [220, 221]);
end;

procedure TclCustomFtp.GetHelp(AHelp: TStrings; const ACommand: string);
begin
  SendCommandSync('HELP %s', [211, 214], [ACommand]);
  AHelp.Assign(Response);
  if (AHelp.Count > 0) and (System.Pos('HELP', AHelp[AHelp.Count - 1]) > 0) then
  begin
    AHelp.Delete(AHelp.Count - 1);
  end;
end;

procedure TclCustomFtp.ChangeCurrentDir(const ANewDir: string);
begin
  SendCommandSync('CWD %s', [200, 250], [ANewDir]);
end;

procedure TclCustomFtp.ChangeToParentDir;
begin
  SendCommandSync('CDUP', [200, 250]);
end;

procedure TclCustomFtp.MakeDir(const ANewDir: string);
begin
  SendCommandSync('MKD %s', [257], [ANewDir]);
end;

procedure TclCustomFtp.RemoveDir(const ADir: string);
begin
  SendCommandSync('RMD %s', [250], [ADir]);
end;

procedure TclCustomFtp.ParseDirectoryListing(AList: TStrings);
var
  i: Integer;
  info: TclFtpFileInfo;
begin
  info := TclFtpFileInfo.Create();
  try
    for i := 0 to AList.Count - 1 do
    begin
      info.Parse(AList[i]);
      DoDirectoryListing(info, AList[i]);
    end;
  finally
    info.Free();
  end;
end;

procedure TclCustomFtp.GetList(AList: TStrings; const AParam: string;
  ADetails: Boolean);
var
  stream: TStringStream;
begin
  stream := TStringStream.Create('');
  try
    FResourcePos := 0;

    if (ADetails) then
    begin
      InternalGetData(Trim(Format('LIST %s', [AParam])), stream, -1, 0);
    end else
    begin
      InternalGetData(Trim(Format('NLST %s', [AParam])), stream, -1, 0);
    end;
    AList.Text := stream.DataString;
  finally
    stream.Free();
  end;
end;

function TclCustomFtp.GetCurrentDir: string;
var
  ind: Integer;
  s: string;
begin
  Result := '';
  SendCommandSync('PWD', [257]);
  ind := System.Pos('"', Response.Text);
  if (ind > 0) then
  begin
    s := System.Copy(Response.Text, ind + 1, 1000);
    ind := System.Pos('"', s);
    if (ind > 0) then
    begin
      Result := System.Copy(s, 1, ind - 1);
    end;
  end;
end;

procedure TclCustomFtp.SetPassiveMode(const Value: Boolean);
begin
  if (UseTLS = ctNone) and (FPassiveMode <> Value) then
  begin
    FPassiveMode := Value;
    Changed();
  end;
end;

procedure TclCustomFtp.SetTransferMode(const Value: TclFtpTransferMode);
begin
  if (FTransferMode <> Value) then
  begin
    FTransferMode := Value;
    Changed();
  end;
end;

procedure TclCustomFtp.SetTransferStructure(
  const Value: TclFtpTransferStructure);
begin
  if (FTransferStructure <> Value) then
  begin
    FTransferStructure := Value;
    Changed();
  end;
end;

procedure TclCustomFtp.SetDataPortMode(const AServer: string; ADataPort: Integer);
begin
  SendCommandSync('PORT ' + GetFtpHostStr(AServer, ADataPort), [200]);
end;

procedure TclCustomFtp.SetTransferParams;
begin
  SendSilentCommand('MODE %s', [200, 500], [Modes[TransferMode]]);
  SendSilentCommand('STRU %s', [200, 500], [Structures[TransferStructure]]);
  SendSilentCommand('TYPE %s', [200], [TransferTypes[TransferType]]);
end;

procedure TclCustomFtp.InitDataConnection(AConnection: TclSyncConnection; ABytesToProceed, ADataSize: Int64);
const                                                                      
  protectionLevels: array[Boolean] of string = ('C', 'P');
begin
  if (UseTLS <> ctNone) then
  begin
    SendSilentCommand('PBSZ 0', [200]);
    SendSilentCommand('PROT %s', [200], [protectionLevels[DataProtection]]);
  end;

  if (UseTLS <> ctNone) and DataProtection then
  begin
    AssignTlsStream(AConnection);
  end else
  begin
    AConnection.NetworkStream := TclNetworkStream.Create();
  end;
  AConnection.TimeOut := TimeOut;
  AConnection.BatchSize := BatchSize;
  AConnection.BitsPerSec := BitsPerSec;              
  AConnection.IsReadUntilClose := True;
  AConnection.BytesToProceed := ABytesToProceed;
  AConnection.OnProgress := DoDataProgress;
  AConnection.InitProgress(FResourcePos, ADataSize);
end;

procedure TclCustomFtp.DoDataProgress(Sender: TObject; ABytesProceed, ATotalBytes: Int64);
begin
  DoProgress(ABytesProceed, ATotalBytes);
end;

procedure TclCustomFtp.SetPositionIfNeed;
begin
  if (FResourcePos > 0) then
  begin
    SendCommandSync('REST %d', [350], [FResourcePos]);
  end;
end;

procedure TclCustomFtp.InternalGetData(const ACommand: string; ADestination: TStream;
  AMaxReadSize, ADataSize: Int64);
var
  dataIP: string;
  dataPort: Integer;
begin
  SetTransferParams();
  try
    if PassiveMode then
    begin
      FDataConnection := TclTcpClientConnection.Create();
      InitDataConnection(FDataConnection, AMaxReadSize, ADataSize);
      SetDataPassiveMode(dataIP, dataPort);

      SetPositionIfNeed();

      ClearResponse();
      SendCommand(ACommand);
      TclTcpClientConnection(FDataConnection).Open(dataIP, dataPort);
      WaitingMultipleResponses([125, 150, 154]);
    end else
    begin
      FDataConnection := TclTcpServerConnection.Create();
      InitDataConnection(FDataConnection, AMaxReadSize, ADataSize);
      dataPort := TclTcpServerConnection(FDataConnection).Open(0);

      SetDataPortMode(GetFtpLocalHostStr(Server), dataPort);
      SetPositionIfNeed();

      ClearResponse();
      SendCommand(ACommand);
      WaitingMultipleResponses([125, 150, 154]);
      TclTcpServerConnection(FDataConnection).AcceptConnection();
    end;

{$IFDEF LOGGER}
  if not FDataConnection.Active then
    clPutLogMessage(Self, edInside, 'InternalGetData: FDataConnection.Active = False');
{$ENDIF}
    if FDataConnection.Active or FDataConnection.NetworkStream.HasReadData then
    begin
      BeginAccess();
      try
        ADestination.Position := FResourcePos;
        FDataConnection.ReadData(ADestination);
        FResourcePos := ADestination.Position;
      finally
        EndAccess();
      end;
    end;

    if not FDataConnection.IsAborted and (AMaxReadSize > -1) then
    begin
      SendCommand('ABOR');
    end;

    if FDataConnection.Active then
    begin
      FDataConnection.Close(True);
    end;

    WaitingMultipleResponses([225, 226, 250, 426, 450]);
    if (LastResponseCode = 426) or (LastResponseCode = 450) then
    begin
      WaitingMultipleResponses([225, 226]);
    end;
  finally
    FDataConnection.Free();
    FDataConnection := nil;
  end;
end;

procedure TclCustomFtp.GetFile(const AFileName: string;
  ADestination: TStream);
begin
  BeginAccess();
  try
    FResourcePos := ADestination.Position;
  finally
    EndAccess();
  end;
  InternalGetData(Format('RETR %s', [AFileName]), ADestination, -1, GetFileSizeIfNeed(AFileName));
end;

procedure TclCustomFtp.PutFile(const AFileName: string; ASource: TStream);
begin
  FResourcePos := 0;
  InternalPutData('STOR ' + AFileName, ASource, -1);
end;

procedure TclCustomFtp.AppendFile(const AFileName: string; ASource: TStream);
begin
  FResourcePos := 0;
  InternalPutData('APPE ' + AFileName, ASource, -1);
end;

procedure TclCustomFtp.PutUniqueFile(ASource: TStream);
begin
  FResourcePos := 0;
  InternalPutData('STOU', ASource, -1);
end;

procedure TclCustomFtp.Rename(const ACurrentName, ANewName: string);
begin
  SendCommandSync('RNFR %s', [350], [ACurrentName]);
  SendCommandSync('RNTO %s', [250], [ANewName]);
end;

procedure TclCustomFtp.Delete(const AFileName: string);
begin
  SendCommandSync('DELE %s', [250], [AFileName]);
end;

function TclCustomFtp.GetFileSize(const AFileName: string): Int64;
begin
  SendCommandSync('TYPE %s', [200], [TransferTypes[TransferType]]);
  SendCommandSync('SIZE %s', [213], [AFileName]);
  Result := ParseFileSize();
end;

function TclCustomFtp.ParseFileSize: Int64;
var
  s: string;
begin
  s := Trim(Copy(Response.Text, 4, 1000));
  Result := StrToInt64Def(s, -1);
end;

procedure TclCustomFtp.InternalPutData(const ACommand: string; ASource: TStream; AMaxWriteSize: Int64);
var
  dataIP: string;
  dataPort: Integer;
begin
  SetTransferParams();
  try
    if PassiveMode then
    begin
      FDataConnection := TclTcpClientConnection.Create();
      InitDataConnection(FDataConnection, AMaxWriteSize, ASource.Size);
      SetDataPassiveMode(dataIP, dataPort);

      SetPositionIfNeed();

      ClearResponse();
      SendCommand(ACommand);
      TclTcpClientConnection(FDataConnection).Open(dataIP, dataPort);
      WaitingMultipleResponses([110, 125, 150]);
    end else
    begin
      FDataConnection := TclTcpServerConnection.Create();
      InitDataConnection(FDataConnection, AMaxWriteSize, ASource.Size);
      dataPort := TclTcpServerConnection(FDataConnection).Open(0);

      SetDataPortMode(GetFtpLocalHostStr(Server), dataPort);
      SetPositionIfNeed();

      ClearResponse();
      SendCommand(ACommand);
      WaitingMultipleResponses([110, 125, 150]);
      TclTcpServerConnection(FDataConnection).AcceptConnection();
    end;

{$IFDEF LOGGER}
  if not FDataConnection.Active then
    clPutLogMessage(Self, edInside, 'InternalGetData: FDataConnection.Active = False');
{$ENDIF}
    
    if FDataConnection.Active then
    begin
      BeginAccess();
      try
        ASource.Position := FResourcePos;
        FDataConnection.WriteData(ASource);
        FResourcePos := ASource.Position;
      finally
        EndAccess();
      end;

      FDataConnection.Close(True);
    end;

    WaitingMultipleResponses([225, 226, 250, 426, 450]);
    if (LastResponseCode = 426) or (LastResponseCode = 450) then
    begin
      WaitingMultipleResponses([226, 225]);
    end;
  finally
    FDataConnection.Free();
    FDataConnection := nil;
  end;
end;

procedure TclCustomFtp.SetDataPassiveMode(var AHost: string; var ADataPort: Integer);
begin
  SendCommandSync('PASV', [227]);
  ParsePassiveModeResponse(AHost, ADataPort);
end;

procedure TclCustomFtp.ParsePassiveModeResponse(var AHost: string; var ADataPort: Integer);
var
  ind: Integer;
  s: string;
begin
  s := Trim(Response.Text);
  ind := TextPos('(', s);
  if (ind < 1) then
  begin
    ind := RTextPos(#32, s);
  end;
  s := system.Copy(s, ind + 1, 1000);
  ind := TextPos(')', s);
  if (ind > 0) then
  begin
    system.Delete(s, ind, 1000);
  end;

  ParseFtpHostStr(s, AHost, ADataPort);
end;

procedure TclCustomFtp.SetTransferType(const Value: TclFtpTransferType);
begin
  if (FTransferType <> Value) then
  begin
    FTransferType := Value;
    Changed();
  end;
end;

procedure TclCustomFtp.GetFile(const AFileName: string;
  ADestination: TStream; APosition, ASize: Int64);
begin
  BeginAccess();
  try
    if (ADestination.Size < (APosition + ASize)) then
    begin
      ADestination.Size := (APosition + ASize);
    end;
    FResourcePos := APosition;
  finally
    EndAccess();
  end;
  InternalGetData(Format('RETR %s', [AFileName]), ADestination, ASize, GetFileSizeIfNeed(AFileName));
end;

procedure TclCustomFtp.Abort;
begin
  //check for FXP mode
  if Active and (FDataConnection <> nil) then
  begin
    SendCommand('ABOR');
    FDataConnection.Abort();
  end;
end;

procedure TclCustomFtp.PutFile(const AFileName: string; ASource: TStream;
  APosition, ASize: Int64);
const
  cmd: array[Boolean] of string = ('STOR ', 'APPE ');
begin
  FResourcePos := APosition;
  InternalPutData(cmd[(APosition > 0)] + AFileName, ASource, ASize);
end;

function TclCustomFtp.FileExists(const AFileName: string): Boolean;
  function GetFtpFileName(const AFullName: string): string;
  var
    ind: Integer;
  begin
    ind := LastDelimiter('/', AFullName);
    Result := system.Copy(AFullName, ind + 1, MaxInt);
  end;
  
var
  list: TStrings;
begin
  try
    list := TStringList.Create();
    try
      GetList(list, AFileName, False);
      Result := SameText(Trim(list.Text), Trim(GetFtpFileName(AFileName)));
    finally
      list.Free();
    end;
  except
    on EclSocketError do
    begin
      Result := False;
    end;
  end;
end;

procedure TclCustomFtp.SetProxySettings(const Value: TclFtpProxySettings);
begin
  FProxySettings.Assign(Value);
end;

function TclCustomFtp.GetFtpHost: string;
begin
  if (Port = cDefaultFtpPort) then
  begin
    Result := Server;
  end else
  begin
    Result := Server + ':' + IntToStr(Port);
  end;
end;

function TclCustomFtp.GetLoginPassword: string;
begin
  // ? OTP ?
  Result := Password;
end;

procedure TclCustomFtp.DoCustomFtpProxy;
begin
  if Assigned(OnCustomFtpProxy) then
  begin
    OnCustomFtpProxy(Self);
  end else
  begin
    raise EclSocketError.Create(cOnCustomFtpProxyRequired, -1);
  end;
end;

procedure TclCustomFtp.Noop;
begin
  SendCommandSync('NOOP', [200]);
end;

procedure TclCustomFtp.DoDirectoryListing(AFileInfo: TclFtpFileInfo; const Source: string);
begin
  if Assigned(OnDirectoryListing) then
  begin
    OnDirectoryListing(Self, AFileInfo, Source);
  end;
end;

procedure TclCustomFtp.DirectoryListing(const AParam: string);
var
  list: TStrings;
begin
  list := TStringList.Create();
  try
    GetList(list, AParam, True);
    ParseDirectoryListing(list);
  finally
    list.Free();
  end;
end;

procedure TclCustomFtp.BeginAccess;
begin
  if (DataAccessor <> nil) then
  begin
    DataAccessor.Enter();
  end;
end;

procedure TclCustomFtp.EndAccess;
begin
  if (DataAccessor <> nil) then
  begin
    DataAccessor.Leave();
  end;
end;

procedure TclCustomFtp.FxpAppendFile(const ASourceFile, ADestinationFile: string;
  ASourceSite: TclCustomFtp);
begin
  InternalFxpOperation('APPE', ASourceFile, ADestinationFile, ASourceSite, Self);
end;

procedure TclCustomFtp.InternalFxpOperation(const APutMethod, ASourceFile, ADestinationFile: string;
  ASourceSite, ADestinationSite: TclCustomFtp);
var
  cmd, dataIP: string;
  dataPort: Integer;
begin
  Assert(ASourceSite <> ADestinationSite);
  
  ASourceSite.SetTransferParams();
  ADestinationSite.SetTransferParams();

  if PassiveMode then
  begin
    ASourceSite.SetDataPassiveMode(dataIP, dataPort);
    ADestinationSite.SetDataPortMode(dataIP, dataPort);
  end else
  begin
    ADestinationSite.SetDataPassiveMode(dataIP, dataPort);
    ASourceSite.SetDataPortMode(dataIP, dataPort);
  end;

  ASourceSite.ClearResponse();
  ASourceSite.SendCommand('RETR ' + ASourceFile);
  ASourceSite.WaitingMultipleResponses([125, 150, 154]);

  cmd := ADestinationFile;
  if (cmd <> '') then
  begin
    cmd := #32 + cmd;
  end;
  cmd := APutMethod + cmd;
  ADestinationSite.ClearResponse();
  ADestinationSite.SendCommand(cmd);
  ADestinationSite.WaitingMultipleResponses([110, 125, 150]);

  ASourceSite.WaitingMultipleResponses([225, 226, 250, 426, 450]);

  if (ASourceSite.LastResponseCode = 426) or (ASourceSite.LastResponseCode = 450) then
  begin
    ASourceSite.WaitingMultipleResponses([225, 226]);
  end;

  ADestinationSite.WaitingMultipleResponses([225, 226, 250, 426, 450]);

  if (ADestinationSite.LastResponseCode = 426) or (ADestinationSite.LastResponseCode = 450) then
  begin
    ADestinationSite.WaitingMultipleResponses([225, 226]);
  end;
end;

procedure TclCustomFtp.FxpGetFile(const ASourceFile, ADestinationFile: string;
  ADestinationSite: TclCustomFtp);
begin
  InternalFxpOperation('STOR', ASourceFile, ADestinationFile, Self, ADestinationSite);
end;

procedure TclCustomFtp.FxpPutFile(const ASourceFile, ADestinationFile: string;
  ASourceSite: TclCustomFtp);
begin
  InternalFxpOperation('STOR', ASourceFile, ADestinationFile, ASourceSite, Self);
end;

procedure TclCustomFtp.FxpPutUniqueFile(const ASourceFile: string; ASourceSite: TclCustomFtp);
begin
  InternalFxpOperation('STOU', ASourceFile, '', ASourceSite, Self);
end;

function TclCustomFtp.GetFileSizeIfNeed(const AFileName: string): Int64;
begin
  Result := 0;
  if Assigned(OnProgress) or Assigned(OnProgress64) then
  begin
    try
      Result := GetFileSize(AFileName);
    except
      on EclSocketError do ;
    end;
  end;
end;

procedure TclCustomFtp.SetUseTLS(const Value: TclClientTlsMode);
var
  oldUseTls: TclClientTlsMode;
begin
  if (UseTLS <> Value) then
  begin
    if not (csLoading in ComponentState) then
    begin
      if (Value <> ctNone) then
      begin
        PassiveMode := True;
      end;
      if (Value = ctNone) then
      begin
        DataProtection := False;
      end;
    end;

    oldUseTls := UseTLS;
    inherited SetUseTLS(Value);

    if not (csLoading in ComponentState) then
    begin
      if (oldUseTls = ctNone) and (Value <> ctNone) then
      begin
        DataProtection := True;
      end;
    end;
  end;
end;

function TclCustomFtp.GetDefaultPort: Integer;
begin
  Result := cDefaultFtpPort;
end;

procedure TclCustomFtp.SetDataProtection(const Value: Boolean);
begin
  if (UseTLS <> ctNone) and (FDataProtection <> Value) then
  begin
    FDataProtection := Value;
    Changed();
  end;
end;

procedure TclCustomFtp.SetFilePermissions(const AFileName: string; AOwner,
  AGroup, AOther: TclFtpFilePermissions);
var
  perm: string;
begin
  perm := Format('%d%d%d',
    [GetFtpFilePermissionsInt(AOwner), GetFtpFilePermissionsInt(AGroup), GetFtpFilePermissionsInt(AOther)]);
  SendCommandSync('SITE CHMOD %s %s', [200], [perm, AFileName]);
end;

procedure TclCustomFtp.InternalSendCommandSync(const ACommand: string;
  const AOkResponses: array of Integer);
var
  i: Integer;
  okResps: array of Integer;
begin
  SetLength(okResps, SizeOf(AOkResponses) + 1);
  okResps[0] := 225;

  for i := Low(AOkResponses) to High(AOkResponses) do
  begin
    okResps[i + 1] := AOkResponses[i];
  end;

  ClearResponse();
  SendCommand(ACommand);

  WaitingMultipleResponses(okResps);
  if (LastResponseCode = 225) then
  begin
    WaitingMultipleResponses(AOkResponses);
  end;
end;

procedure TclCustomFtp.ClearResponse;
begin
  Response.Clear();
  FResponsePos := 0;
end;

procedure TclCustomFtp.WaitingMultipleResponses(
  const AOkResponses: array of Integer);
var
  ind: Integer;
begin
  if (Response.Count > FResponsePos) then
  begin
    ind := ParseResponse(FResponsePos, AOkResponses);

    if (ind > -1) then
    begin
      FResponsePos := ind + 1;
    end else
    begin
      if not ((Length(AOkResponses) = 1) and (AOkResponses[Low(AOkResponses)] = SOCKET_DOT_RESPONSE))
        and (LastResponseCode <> SOCKET_WAIT_RESPONSE) then
      begin
        RaiseSocketError(Trim(Response.Text), LastResponseCode);
      end;
      
      FResponsePos := InternalWaitingResponse(FResponsePos, AOkResponses) + 1;
      DoReceiveResponse(Response);
    end;
  end else
  begin
    FResponsePos := InternalWaitingResponse(FResponsePos, AOkResponses) + 1;
    DoReceiveResponse(Response);
  end;
end;

end.

