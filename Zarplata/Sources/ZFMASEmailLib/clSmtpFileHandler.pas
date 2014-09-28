{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clSmtpFileHandler;

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
  Classes, clSmtpServer, SyncObjs;

type
  TclSmtpFileHandler = class(TComponent)
  private
    FServer: TclSmtpServer;
    FAccessor: TCriticalSection;
    FMailBoxDir: string;
    FRelayDir: string;
    FCounter: Integer;
    procedure SetServer(const Value: TclSmtpServer);
    function GetMailBoxPath(const AUserName: string): string;
    procedure DoMessageReceived(Sender: TObject; AConnection: TclSmtpCommandConnection;
      const ARecipient: string; IsFinalDelivery: Boolean; AMessage: TStrings;
      var Action: TclSmtpMailDataAction);
    procedure SetMailBoxDir(const Value: string);
    procedure SetRelayDir(const Value: string);
    function GenMessageFileName: string;
    procedure SetCounter(const Value: Integer);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CleanEventHandlers; virtual;
    procedure InitEventHandlers; virtual;
    property Accessor: TCriticalSection read FAccessor;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Server: TclSmtpServer read FServer write SetServer;
    property MailBoxDir: string read FMailBoxDir write SetMailBoxDir;
    property RelayDir: string read FRelayDir write SetRelayDir;
    property Counter: Integer read FCounter write SetCounter default 1;
  end;

implementation

uses
  Windows, SysUtils, clUtils;
  
{ TclSmtpFileHandler }

procedure TclSmtpFileHandler.CleanEventHandlers;
begin
  Server.OnMessageReceived := nil;
end;

constructor TclSmtpFileHandler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAccessor := TCriticalSection.Create();
  FCounter := 1;
end;

destructor TclSmtpFileHandler.Destroy;
begin
  FAccessor.Free();
  inherited Destroy();
end;

procedure TclSmtpFileHandler.DoMessageReceived(Sender: TObject;
  AConnection: TclSmtpCommandConnection; const ARecipient: string;
  IsFinalDelivery: Boolean; AMessage: TStrings; var Action: TclSmtpMailDataAction);
var
  path: string;
  account: TclSmtpUserAccountItem;
begin
  try
    if IsFinalDelivery then
    begin
      account := Server.UserAccounts.AccountByEmail(ARecipient);
      Assert(account <> nil);
      path := GetMailBoxPath(account.UserName);
    end else
    begin
      path := AddTrailingBackSlash(RelayDir);
    end;
    FAccessor.Enter();
    try
      ForceFileDirectories(path);
      AMessage.SaveToFile(path + GenMessageFileName());
      Action := mdOk;
    finally
      FAccessor.Leave();
    end;
  except
    Action := mdProcessingError;
  end;
end;

function TclSmtpFileHandler.GenMessageFileName: string;
begin
  Result := GetUniqueFileName(Format('MAIL%.8d.MSG', [Counter]));
  Inc(FCounter);
end;

function TclSmtpFileHandler.GetMailBoxPath(const AUserName: string): string;
begin
  Result := AddTrailingBackSlash(MailBoxDir) + AddTrailingBackSlash(AUserName);
end;

procedure TclSmtpFileHandler.InitEventHandlers;
begin
  Server.OnMessageReceived := DoMessageReceived;
end;

procedure TclSmtpFileHandler.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation <> opRemove) then Exit;
  if (AComponent = FServer) then
  begin
    CleanEventHandlers();
    FServer := nil;
  end;
end;

procedure TclSmtpFileHandler.SetCounter(const Value: Integer);
begin
  FAccessor.Enter();
  try
    FCounter := Value;
  finally
    FAccessor.Leave();
  end;
end;

procedure TclSmtpFileHandler.SetMailBoxDir(const Value: string);
begin
  FAccessor.Enter();
  try
    FMailBoxDir := Value;
  finally
    FAccessor.Leave();
  end;
end;

procedure TclSmtpFileHandler.SetRelayDir(const Value: string);
begin
  FAccessor.Enter();
  try
    FRelayDir := Value;
  finally
    FAccessor.Leave();
  end;
end;

procedure TclSmtpFileHandler.SetServer(const Value: TclSmtpServer);
begin
  if (FServer <> Value) then
  begin
{$IFDEF DELPHI5}
    if (FServer <> nil) then
    begin
      FServer.RemoveFreeNotification(Self);
      CleanEventHandlers();
    end;
{$ENDIF}
    FServer := Value;
    if (FServer <> nil) then
    begin
      FServer.FreeNotification(Self);
      InitEventHandlers();
    end;
  end;
end;

end.
