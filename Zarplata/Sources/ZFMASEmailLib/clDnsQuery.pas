{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clDnsQuery;

interface

{$I clVer.inc}

uses
  Classes, clDnsMessage;

type
  TclHostInfo = class
  private
    FIPAddress: string;
    FName: string;
  public
    property Name: string read FName;
    property IPAddress: string read FIPAddress;
  end;

  TclHostList = class
  private
    FList: TList;
    function GetCount: Integer;
    function GetItem(Index: Integer): TclHostInfo;
  protected
    procedure Clear;
    procedure Add(AItem: TclHostInfo);
    procedure Insert(Index: Integer; AItem: TclHostInfo);
  public
    constructor Create;
    destructor Destroy; override;
    function ItemByName(const AName: string): TclHostInfo;
    property Items[Index: Integer]: TclHostInfo read GetItem; default;
    property Count: Integer read GetCount;
  end;

  TclMailServerInfo = class(TclHostInfo)
  private
    FPreference: Integer;
  public
    property Preference: Integer read FPreference;
  end;

  TclMailServerList = class(TclHostList)
  private
    function GetItem(Index: Integer): TclMailServerInfo;
    procedure AddSorted(AItem: TclMailServerInfo);
  public
    property Items[Index: Integer]: TclMailServerInfo read GetItem; default;
  end;

  TclDnsQuery = class(TComponent)
  private
    FQuery: TclDnsMessage;
    FResponse: TclDnsMessage;
    FMailServers: TclMailServerList;
    FNameServers: TStrings;
    FHosts: TclHostList;
    FDnsServer: string;
    FTimeOut: Integer;
    FPort: Integer;
    FIsRecursiveDesired: Boolean;
    FAliases: TStrings;
    procedure Clear;
    procedure FillAInfo(ARecordList: TclDnsRecordList);
    procedure FillMXInfo;
    procedure FillNSInfo(ARecordList: TclDnsRecordList);
    function FillHostInfo: TclHostInfo;
    procedure FillAliasInfo;
    function GetPreferredMX: TclMailServerInfo;
    function GetEmailDomain(const AEmail: string): string;
    function GetArpaIPAddress(const AIP: string): string;
    procedure CheckDnsError(AResponseCode: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Resolve; overload;
    procedure Resolve(AQuery, AResponse: TclDnsMessage); overload;
    function ResolveMX(const AEmail: string): TclMailServerInfo;
    function ResolveIP(const AHost: string): TclHostInfo;
    function ResolveHost(const AIPAddress: string): TclHostInfo;
    function ResolveNS(const AHost: string): string;

    property Query: TclDnsMessage read FQuery;
    property Response: TclDnsMessage read FResponse;
    property MailServers: TclMailServerList read FMailServers;
    property Hosts: TclHostList read FHosts;
    property NameServers: TStrings read FNameServers;
    property Aliases: TStrings read FAliases;
  published
    property DnsServer: string read FDnsServer write FDnsServer;
    property TimeOut: Integer read FTimeOut write FTimeOut default 5000;
    property Port: Integer read FPort write FPort default 53;
    property IsRecursiveDesired: Boolean read FIsRecursiveDesired write FIsRecursiveDesired default True;
  end;

resourcestring
  cDnsFormatError = 'Format error';
  cDnsServerFailure = 'Server failure';
  cDnsNameError = 'No such name';
  cDnsNotImplemented = 'Not implemented';
  cDnsRefused = 'Refused';
  cDnsUnspecifiedError = 'Unspecified error';

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsDnsDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}

  
implementation

uses
  WinSock, SysUtils, clSocket, clUtils{$IFDEF DEMO}, Forms, Windows{$ENDIF};

{ TclDnsQuery }

procedure TclDnsQuery.Clear;
begin
  Query.Clear();
  Response.Clear();
  Hosts.Clear();
  MailServers.Clear();
  NameServers.Clear();
  Aliases.Clear();
end;

constructor TclDnsQuery.Create(AOwner: TComponent);
var
  wsaData: TWSAData;
  res: Integer;
begin
  inherited Create(AOwner);

  res := WSAStartup($202, wsaData);
  if (res <> 0) then
  begin
    RaiseSocketError(WSAGetLastError());
  end;

  FQuery := TclDnsMessage.Create();
  FResponse := TclDnsMessage.Create();

  FHosts := TclHostList.Create();
  FMailServers := TclMailServerList.Create();
  FNameServers := TStringList.Create();
  FAliases := TStringList.Create();

  TimeOut := 5000;
  Port := 53;
  IsRecursiveDesired := True;
end;

destructor TclDnsQuery.Destroy;
begin
  FAliases.Free();
  FNameServers.Free();
  FMailServers.Free();
  FHosts.Free();

  FResponse.Free();
  FQuery.Free();

  WSACleanup();
  inherited Destroy();
end;

procedure TclDnsQuery.Resolve;
begin
  Resolve(Query, Response);
end;

procedure TclDnsQuery.Resolve(AQuery, AResponse: TclDnsMessage);
var
  connection: TclUdpClientConnection;
  queryStream, replyStream: TStream;
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
    if not IsDnsDemoDisplayed then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsDnsDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  connection := nil;
  queryStream := nil;
  replyStream := nil;
  try
    connection := TclUdpClientConnection.Create();
    connection.NetworkStream := TclNetworkStream.Create();
    connection.BatchSize := 512;
    connection.TimeOut := TimeOut;
    connection.Open(DnsServer, Port);

    queryStream := TMemoryStream.Create();
    AQuery.Build(queryStream);
    queryStream.Position := 0;
    connection.WriteData(queryStream);

    replyStream := TMemoryStream.Create();
    connection.ReadData(replyStream);
    replyStream.Position := 0;
    AResponse.Parse(replyStream);

    CheckDnsError(AResponse.Header.ResponseCode);
  finally
    replyStream.Free();
    queryStream.Free();
    connection.Free();
  end;
end;

procedure TclDnsQuery.CheckDnsError(AResponseCode: Integer);
var
  msg: string;
begin
  if AResponseCode = 0 then Exit;
  case AResponseCode of
    1: msg := cDnsFormatError;
    2: msg := cDnsServerFailure;
    3: msg := cDnsNameError;
    4: msg := cDnsNotImplemented;
    5: msg := cDnsRefused
  else
    msg := cDnsUnspecifiedError;
  end;
  raise EclDnsError.Create(msg, AResponseCode);
end;

function TclDnsQuery.ResolveMX(const AEmail: string): TclMailServerInfo;
var
  rec: TclDnsRecord;
begin
  Clear();

  Query.Header.IsQuery := True;
  Query.Header.IsRecursionDesired := IsRecursiveDesired;
  
  rec := TclDnsMXRecord.Create();
  Query.Queries.Add(rec);
  rec.Name := GetEmailDomain(AEmail);
  rec.RecordClass := rcInternet;

  Resolve();

  FillAInfo(Response.AdditionalRecords);
  FillNSInfo(Response.NameServers);
  FillAliasInfo();
  FillMXInfo();

  Result := GetPreferredMX();
end;

function TclDnsQuery.GetEmailDomain(const AEmail: string): string;
var
  ind: Integer;
begin
  Result := AEmail;
  ind := system.Pos('@', Result);
  if (ind > 0) then
  begin
    system.Delete(Result, 1, ind);
  end;
end;

function TclDnsQuery.GetArpaIPAddress(const AIP: string): string;
begin
  Result := AIP;
  if (system.Pos('in-addr.arpa', LowerCase(Result)) = 0) and (WordCount(Result, ['.']) = 4) then
  begin
    Result := ExtractWord(4, Result, ['.']) + '.' + ExtractWord(3, Result, ['.']) + '.' +
      ExtractWord(2, Result, ['.']) + '.' + ExtractWord(1, Result, ['.']) + '.in-addr.arpa';
  end;
end;

procedure TclDnsQuery.FillMXInfo;
var
  i: Integer;
  aInfo: TclHostInfo;
  mxInfo: TclMailServerInfo;
  mxRec: TclDnsMXRecord;
begin
  for i := 0 to Response.Answers.Count - 1 do
  begin
    if (Response.Answers[i] is TclDnsMXRecord) then
    begin
      mxInfo := TclMailServerInfo.Create();
      MailServers.AddSorted(mxInfo);

      mxRec := Response.Answers[i] as TclDnsMXRecord;
      mxInfo.FName := mxRec.MailServer;
      mxInfo.FPreference := mxRec.Preference;

      aInfo := Hosts.ItemByName(mxInfo.Name);
      if (aInfo <> nil) then
      begin
        mxInfo.FIPAddress := aInfo.IPAddress;
      end;
    end;
  end;
end;

function TclDnsQuery.GetPreferredMX: TclMailServerInfo;
begin
  if (MailServers.Count > 0) then
  begin
    Result := MailServers[0];
  end else
  begin
    Result := nil;
  end;
end;

function TclDnsQuery.ResolveIP(const AHost: string): TclHostInfo;
var
  rec: TclDnsRecord;
begin
  Clear();

  Query.Header.IsQuery := True;
  Query.Header.IsRecursionDesired := IsRecursiveDesired;
  
  rec := TclDnsARecord.Create();
  Query.Queries.Add(rec);
  rec.Name := AHost;
  rec.RecordClass := rcInternet;

  Resolve();

  FillAInfo(Response.Answers);
  FillNSInfo(Response.NameServers);
  FillAliasInfo();

  if (Hosts.Count > 0) then
  begin
    Result := Hosts[0];
  end else
  begin
    Result := nil;
  end;
end;

procedure TclDnsQuery.FillNSInfo(ARecordList: TclDnsRecordList);
var
  i: Integer;
begin
  for i := 0 to ARecordList.Count - 1 do
  begin
    if (ARecordList[i] is TclDnsNSRecord) then
    begin
      NameServers.Add((ARecordList[i] as TclDnsNSRecord).NameServer);
    end;
  end;
end;

function TclDnsQuery.ResolveHost(const AIPAddress: string): TclHostInfo;
var
  rec: TclDnsRecord;
begin
  Clear();

  Query.Header.IsQuery := True;
  Query.Header.IsRecursionDesired := IsRecursiveDesired;
  
  rec := TclDnsPTRRecord.Create();
  Query.Queries.Add(rec);
  rec.Name := GetArpaIPAddress(AIPAddress);
  rec.RecordClass := rcInternet;

  Resolve();

  Result := FillHostInfo();
  FillAInfo(Response.AdditionalRecords);
  FillNSInfo(Response.NameServers);
  FillAliasInfo();

  if (Result <> nil) then
  begin
    Result.FIPAddress := AIPAddress;
  end;
end;

function TclDnsQuery.FillHostInfo: TclHostInfo;
var
  i: Integer;
  ptrRec: TclDnsPTRRecord;
begin
  Result := nil;
  for i := 0 to Response.Answers.Count - 1 do
  begin
    if (Response.Answers[i] is TclDnsPTRRecord) then
    begin
      Result := TclHostInfo.Create();
      Hosts.Add(Result);

      ptrRec := (Response.Answers[i] as TclDnsPTRRecord);
      Result.FName := ptrRec.DomainName;
      Result.FIPAddress := ptrRec.Name;
    end;
  end;
end;

procedure TclDnsQuery.FillAInfo(ARecordList: TclDnsRecordList);
var
  i: Integer;
  inetInfo: TclHostInfo;
  aRec: TclDnsARecord;
begin
  for i := 0 to ARecordList.Count - 1 do
  begin
    if (ARecordList[i] is TclDnsARecord) then
    begin
      inetInfo := TclHostInfo.Create();
      Hosts.Add(inetInfo);

      aRec := (ARecordList[i] as TclDnsARecord);
      inetInfo.FName := aRec.Name;
      inetInfo.FIPAddress := aRec.IPAddress;
    end;
  end;
end;

function TclDnsQuery.ResolveNS(const AHost: string): string;
var
  rec: TclDnsRecord;
begin
  Clear();

  Query.Header.IsQuery := True;
  Query.Header.IsRecursionDesired := IsRecursiveDesired;
  
  rec := TclDnsNSRecord.Create();
  Query.Queries.Add(rec);
  rec.Name := AHost;
  rec.RecordClass := rcInternet;

  Resolve();

  FillNSInfo(Response.Answers);
  FillAliasInfo();

  if (NameServers.Count > 0) then
  begin
    Result := NameServers[0];
  end else
  begin
    Result := '';
  end;
end;

procedure TclDnsQuery.FillAliasInfo;
  procedure ExtractAliases(ARecordList: TclDnsRecordList);
  var
    i: Integer;
  begin
    for i := 0 to ARecordList.Count - 1 do
    begin
      if (ARecordList[i] is TclDnsCNAMERecord) then
      begin
        Aliases.Add(ARecordList[i].Name);
      end;
    end;
  end;
  
begin
  ExtractAliases(Response.Answers);
  ExtractAliases(Response.AdditionalRecords);
end;

{ TclHostList }

procedure TclHostList.Add(AItem: TclHostInfo);
begin
  FList.Add(AItem);
end;

procedure TclHostList.Clear;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].Free();
  end;
  FList.Clear();
end;

constructor TclHostList.Create;
begin
  inherited Create();
  FList := TList.Create();
end;

destructor TclHostList.Destroy;
begin
  Clear();
  FList.Free();
  inherited Destroy();
end;

function TclHostList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TclHostList.GetItem(Index: Integer): TclHostInfo;
begin
  Result := TclHostInfo(FList[Index]);
end;

procedure TclHostList.Insert(Index: Integer; AItem: TclHostInfo);
begin
  FList.Insert(Index, AItem);
end;

function TclHostList.ItemByName(const AName: string): TclHostInfo;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if SameText(Items[i].Name, AName) then
    begin
      Result := Items[i];
      Exit;
    end;
  end;
  Result := nil; 
end;

{ TclMailServerList }

procedure TclMailServerList.AddSorted(AItem: TclMailServerInfo);
var
  i, ind: Integer;
begin
  ind := 0;
  for i := 0 to Count - 1 do
  begin
    if (Items[i].Preference < AItem.Preference) then
    begin
      ind := i;
      Break;
    end;
  end;
  
  Insert(ind, AItem);
end;

function TclMailServerList.GetItem(Index: Integer): TclMailServerInfo;
begin
  Result := (inherited Items[Index] as TclMailServerInfo);
end;

end.

