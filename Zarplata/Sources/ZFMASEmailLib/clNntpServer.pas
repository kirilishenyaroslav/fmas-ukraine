{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clNntpServer;

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
  Classes, SysUtils, WinSock, clTcpServer, clSocket, clUserMgr, clNntpUtils;

type
  TclNntpReceivingData = (rdNntpCommand, rdNntpPostData, rdNntpIHaveData, rdNntpTakeThisData);
  TclNntpArticleResult = (arSuccess, arNotFound, arAccessDenied);
  TclNntpArticlePart = (apMessage, apHeader, apBody);

  TclNewsGroupItem = class(TCollectionItem)
  private
    FAllowPost: Boolean;
    FGroupName: string;
    FCreatedOn: TDateTime;
    FOwner: string;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property GroupName: string read FGroupName write FGroupName;
    property AllowPost: Boolean read FAllowPost write FAllowPost default True;
    property CreatedOn: TDateTime read FCreatedOn write FCreatedOn;
    property Owner: string read FOwner write FOwner;
  end;

  TclNewsGroupList = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TclNewsGroupItem;
    procedure SetItem(Index: Integer; const Value: TclNewsGroupItem);
  public
    function Add: TclNewsGroupItem;
    function GroupByName(const AName: string): TclNewsGroupItem;
    property Items[Index: Integer]: TclNewsGroupItem read GetItem write SetItem; default;
  end;

  TclNntpArticleItem = class(TCollectionItem)
  private
    FArticleNo: Integer;
    FHeader: TStrings;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property ArticleNo: Integer read FArticleNo write FArticleNo;
    property Header: TStrings read FHeader;
  end;

  TclNntpArticleList = class(TCollection)
  private
    function GetItem(Index: Integer): TclNntpArticleItem;
    procedure SetItem(Index: Integer; const Value: TclNntpArticleItem);
  public
    function Add: TclNntpArticleItem;
    property Items[Index: Integer]: TclNntpArticleItem read GetItem write SetItem; default;
  end;

  TclNntpCommandConnection = class(TclCommandConnection)
  private
    FCurrentGroup: string;
    FCurrentArticle: Integer;
    FReceivingData: TclNntpReceivingData;
    FRawData: string;
    FMessageID: string;
    FModeType: TclNntpModeType;
    FIsSlave: Boolean;
    FUserName: string;
    FTempUserName: string;
    FIsAuthorized: Boolean;
  public
    constructor Create;
    procedure InitParams;
    property ReceivingData: TclNntpReceivingData read FReceivingData;
    property CurrentGroup: string read FCurrentGroup;
    property CurrentArticle: Integer read FCurrentArticle;
    property RawData: string read FRawData write FRawData;
    property MessageID: string read FMessageID;
    property ModeType: TclNntpModeType read FModeType;
    property IsSlave: Boolean read FIsSlave;
    property UserName: string read FUserName;
    property IsAuthorized: Boolean read FIsAuthorized;
  end;

  TclNntpCommandHandler = procedure (AConnection: TclNntpCommandConnection;
    const ACommand, AParams: string) of object;

  TclNntpCommandInfo = class(TclTcpCommandInfo)
  private
    FHandler: TclNntpCommandHandler;
  protected
    procedure Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams); override; 
  end;

  TclNntpCanListGroupEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    ANewsGroup: TclNewsGroupItem; const AWildMat: string; ACreatedOn: TDateTime; AGMT: Boolean;
    const ADistributions: string; var CanList: Boolean) of object;

  TclNntpGroupInfoEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    ANewsGroup: TclNewsGroupItem; var ArticleCount, ALastArticle, AFirstArticle: Integer) of object;

  TclNntpArticlesEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    ANewsGroup: TclNewsGroupItem; ArticleNumbers: TStrings; var Result: TclNntpArticleResult) of object;

  TclNntpNewArticlesEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    ANewsGroup: TclNewsGroupItem; ADate: TDateTime; AGMT: Boolean;
    const ADistributions: string; ArticleIDs: TStrings) of object;

  TclNntpSelectArticleEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    ANewsGroup: TclNewsGroupItem; var ArticleNo: Integer; var AMessageID: string;
    var Result: TclNntpArticleResult) of object;

  TclNntpArticleEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    ANewsGroup: TclNewsGroupItem; var ArticleNo: Integer; var AMessageID: string;
    ArticlePart: TclNntpArticlePart; Article: TStrings; var Result: TclNntpArticleResult) of object;

  TclNntpArticleHeaderEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    ANewsGroup: TclNewsGroupItem; const ARange, AMessageID: string; Articles: TclNntpArticleList;
    var Result: TclNntpArticleResult) of object;

  TclNntpCanReceiveArticleEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    const AMessageID: string; var Accept: Boolean) of object;

  TclNntpArticleReceivedEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    const AMessageID: string; Article: TStrings; var Success: Boolean) of object;

  TclNntpAuthenticateEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    Account: TclUserAccountItem; const APassword: string; var IsAuthorized, Handled: Boolean) of object;

  TclNntpAccessRightsEvent = procedure (Sender: TObject; AConnection: TclNntpCommandConnection;
    const ANewsGroup: string; APermission: TclNntpAccessPermission;
    var IsAllowed, Handled: Boolean) of object;

  TclNntpServer = class(TclTcpCommandServer)
  private
    FAllowPost: Boolean;
    FTooOldDays: Integer;
    FOnGetGroupInfo: TclNntpGroupInfoEvent;
    FOnGetNewArticles: TclNntpNewArticlesEvent;
    FOnGetArticles: TclNntpArticlesEvent;
    FOnSelectArticle: TclNntpSelectArticleEvent;
    FOnGetArticle: TclNntpArticleEvent;
    FOnGetArticleHeader: TclNntpArticleHeaderEvent;
    FOnArticleReceived: TclNntpArticleReceivedEvent;
    FOnCanReceiveArticle: TclNntpCanReceiveArticleEvent;
    FHelpText: TStrings;
    FOverviewFormat: TStrings;
    FSubscriptions: TStrings;
    FGroups: TclNewsGroupList;
    FOnCanListGroup: TclNntpCanListGroupEvent;
    FUserAccounts: TclUserAccountList;
    FOnAuthenticate: TclNntpAuthenticateEvent;
    FOnHasAccessRights: TclNntpAccessRightsEvent;
    FCapabilities: TStrings;
    procedure HandleNullCommand(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleMODE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleQUIT(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleLIST(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleNEWGROUPS(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleGROUP(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleNEWNEWS(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleLISTGROUP(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleSTAT(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleLAST(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleNEXT(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleARTICLE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleBODY(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleHEAD(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandlePOST(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleIHAVE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleCHECK(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleSLAVE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleHELP(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleDATE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleXHDR(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleXOVER(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleAUTHINFO(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleCAPABILITIES(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleSTARTTLS(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);

    procedure HandleEndCommand(AConnection: TclNntpCommandConnection;
      const ACommand: string; AHandler: TclNntpCommandHandler);
    procedure HandleGroupList(AConnection: TclNntpCommandConnection; const AParams: string);
    procedure HandleOverviewFormat(AConnection: TclNntpCommandConnection);
    procedure HandleSubscriptions(AConnection: TclNntpCommandConnection);
    procedure HandlePostData(AConnection: TclNntpCommandConnection; const AData: string);
    procedure HandlePostEnd(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleIHaveData(AConnection: TclNntpCommandConnection; const AData: string);
    procedure HandleIHaveEnd(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure HandleTakeThisData(AConnection: TclNntpCommandConnection; const AData: string);
    procedure HandleTakeThisEnd(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
    procedure CheckGroupSelected(AConnection: TclNntpCommandConnection; const ACommand: string);
    procedure CheckAccessRights(AConnection: TclNntpCommandConnection;
      const ACommand, ANewsGroup: string; APermission: TclNntpAccessPermission);
    procedure CheckGroupsAccessRights(AConnection: TclNntpCommandConnection;
      const ACommand: string; ANewsGroups: TStrings; APermission: TclNntpAccessPermission);
    procedure CheckTlsMode(AConnection: TclNntpCommandConnection; const ACommand: string);
    function HasAccessRights(AConnection: TclNntpCommandConnection; const ANewsGroup: string;
      APermission: TclNntpAccessPermission): Boolean;
    function Authenticate(AConnection: TclNntpCommandConnection;
      Account: TclUserAccountItem; const APassword: string): Boolean;
    procedure InternalGetArticle(AConnection: TclNntpCommandConnection;
      const ACommand, AParams: string; ArticlePart: TclNntpArticlePart);
    procedure ValidatePostArticle(AConnection: TclNntpCommandConnection;
      const ACommand: string; Article: TStrings);
    procedure ValidateIHaveArticle(AConnection: TclNntpCommandConnection;
      const ACommand, AMessageID: string; Article: TStrings);
    procedure ValidateTakeThisArticle(AConnection: TclNntpCommandConnection;
      const ACommand, AMessageID: string; Article: TStrings);
    function ArticleHasBody(Article: TStrings): Boolean;
    procedure AddMessageID(Article: TStrings; const AMessageID: string);
    function IsStreamingCommand(const ACommand, AData: string): Boolean;
    function ExtractMessageID(const ACommandLine: string): string;
    procedure FillDefaultHelpText;
    procedure FillDefaultOverviewFormat;
    procedure FillDefaultCapabilities;
    procedure SetHelpText(const Value: TStrings);
    procedure SetOverviewFormat(const Value: TStrings);
    procedure SetSubscriptions(const Value: TStrings);
    procedure SendHeaderValuesResponse(AConnection: TclNntpCommandConnection;
      AFieldNames: TStrings; const AFieldDelimiter: string;
      Articles: TclNntpArticleList; const AResponse: string);
    procedure SetGroups(const Value: TclNewsGroupList);
    function GetTimes(ADateTime: TDateTime): Integer;
    function CanListGroup(AConnection: TclNntpCommandConnection; ANewsGroup: TclNewsGroupItem;
      const AWildMat: string; ACreatedOn: TDateTime; AGMT: Boolean; const ADistributions: string): Boolean;
    function GetCaseInsensitive: Boolean;
    procedure SetCaseInsensitive(const Value: Boolean);
    procedure SetUserAccounts(const Value: TclUserAccountList);
    procedure SetCapabilities(const Value: TStrings);
  protected
    procedure AddNntpCommand(const ACommand: string; AHandler: TclNntpCommandHandler);
    procedure DoDestroy; override;
    procedure RegisterCommands; override;
    function GetNullCommand(const ACommand: string): TclTcpCommandInfo; override;
    procedure ProcessData(AConnection: TclCommandConnection; const AData: string); override;
    procedure ProcessUnhandledError(AConnection: TclCommandConnection;
      AParams: TclTcpCommandParams; E: Exception); override;
    procedure DoProcessCommand(AConnection: TclCommandConnection;
      AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams); override;
    procedure DoAcceptConnection(AConnection: TclCommandConnection); override;
    function CreateDefaultConnection: TclCommandConnection; override;
    function GenMessageID: string; virtual;
    procedure DoCanListGroup(AConnection: TclNntpCommandConnection; ANewsGroup: TclNewsGroupItem;
      const AWildMat: string; ACreatedOn: TDateTime; AGMT: Boolean;
      const ADistributions: string; var CanList: Boolean);
    procedure DoGetGroupInfo(AConnection: TclNntpCommandConnection; ANewsGroup: TclNewsGroupItem;
      var ArticleCount, ALastArticle, AFirstArticle: Integer); virtual;
    procedure DoGetNewArticles(AConnection: TclNntpCommandConnection;
      ANewsGroup: TclNewsGroupItem; ADate: TDateTime; AGMT: Boolean;
      const ADistributions: string; ArticleIDs: TStrings); virtual;
    procedure DoGetArticles(AConnection: TclNntpCommandConnection;
      ANewsGroup: TclNewsGroupItem; ArticleNumbers: TStrings;
      var Result: TclNntpArticleResult); virtual;
    procedure DoSelectArticle(AConnection: TclNntpCommandConnection; ANewsGroup: TclNewsGroupItem;
      var ArticleNo: Integer; var AMessageID: string; var Result: TclNntpArticleResult); virtual;
    procedure DoGetArticle(AConnection: TclNntpCommandConnection; ANewsGroup: TclNewsGroupItem;
      var ArticleNo: Integer; var AMessageID: string; ArticlePart: TclNntpArticlePart; Article: TStrings;
      var Result: TclNntpArticleResult); virtual;
    procedure DoGetArticleHeader(AConnection: TclNntpCommandConnection; ANewsGroup: TclNewsGroupItem;
      const ARange, AMessageID: string; Articles: TclNntpArticleList; var Result: TclNntpArticleResult);
    procedure DoArticleReceived(AConnection: TclNntpCommandConnection;
      const AMessageID: string; Article: TStrings; var Success: Boolean); virtual;
    procedure DoCanReceiveArticle(AConnection: TclNntpCommandConnection;
      const AMessageID: string; var Accept: Boolean); virtual;
    procedure DoAuthenticate(AConnection: TclNntpCommandConnection;
      Account: TclUserAccountItem; const APassword: string; var IsAuthorized, Handled: Boolean); virtual;
    procedure DoHasAccessRights(AConnection: TclNntpCommandConnection;
      const ANewsGroup: string; APermission: TclNntpAccessPermission;
      var IsAllowed, Handled: Boolean); virtual;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Port default cDefaultNntpPort;
    property Groups: TclNewsGroupList read FGroups write SetGroups;
    property AllowPost: Boolean read FAllowPost write FAllowPost default True;
    property TooOldDays: Integer read FTooOldDays write FTooOldDays default 35;
    property HelpText: TStrings read FHelpText write SetHelpText;
    property OverviewFormat: TStrings read FOverviewFormat write SetOverviewFormat;
    property Subscriptions: TStrings read FSubscriptions write SetSubscriptions;
    property Capabilities: TStrings read FCapabilities write SetCapabilities;
    property UserAccounts: TclUserAccountList read FUserAccounts write SetUserAccounts;
    property CaseInsensitive: Boolean read GetCaseInsensitive write SetCaseInsensitive default True;
    property OnCanListGroup: TclNntpCanListGroupEvent read FOnCanListGroup write FOnCanListGroup;
    property OnGetGroupInfo: TclNntpGroupInfoEvent read FOnGetGroupInfo write FOnGetGroupInfo;
    property OnGetArticles: TclNntpArticlesEvent read FOnGetArticles write FOnGetArticles;
    property OnGetNewArticles: TclNntpNewArticlesEvent read FOnGetNewArticles write FOnGetNewArticles;
    property OnSelectArticle: TclNntpSelectArticleEvent read FOnSelectArticle write FOnSelectArticle;
    property OnGetArticle: TclNntpArticleEvent read FOnGetArticle write FOnGetArticle;
    property OnGetArticleHeader: TclNntpArticleHeaderEvent read FOnGetArticleHeader write FOnGetArticleHeader;
    property OnArticleReceived: TclNntpArticleReceivedEvent read FOnArticleReceived write FOnArticleReceived;
    property OnCanReceiveArticle: TclNntpCanReceiveArticleEvent read FOnCanReceiveArticle write FOnCanReceiveArticle;
    property OnAuthenticate: TclNntpAuthenticateEvent read FOnAuthenticate write FOnAuthenticate;
    property OnHasAccessRights: TclNntpAccessRightsEvent read FOnHasAccessRights write FOnHasAccessRights;
  end;

procedure RaiseNntpError(const ACommand, AMessage: string; ACode: Integer);

implementation

uses
  Windows, clMailMessage, clEncoder, clUtils, clTlsSocket, clMCUtils;

const
  postingStatus: array[Boolean] of Integer = (201, 200);
  postingStatusMsg: array[Boolean] of string = ('Posting not allowed', 'Posting allowed');
  postingStatusBool: array[Boolean] of string = ('n', 'y');
  
procedure RaiseNntpError(const ACommand, AMessage: string; ACode: Integer);
begin
  raise EclTcpCommandError.Create(ACommand, Format('%d %s', [ACode, AMessage]), ACode);
end;
  
{ TclNntpServer }

procedure TclNntpServer.AddNntpCommand(const ACommand: string;
  AHandler: TclNntpCommandHandler);
var
  info: TclNntpCommandInfo;
begin
  info := TclNntpCommandInfo.Create();
  AddCommand(info);
  info.Name := ACommand;
  info.FHandler := AHandler;
end;

procedure TclNntpServer.FillDefaultHelpText;
begin
  HelpText.Add('  authinfo user Name|pass Password');
  HelpText.Add('  article [MessageID|Number]');
  HelpText.Add('  body [MessageID|Number]');
  HelpText.Add('  check MessageID');
  HelpText.Add('  date');
  HelpText.Add('  group newsgroup');
  HelpText.Add('  head [MessageID|Number]');
  HelpText.Add('  help');
  HelpText.Add('  ihave');
  HelpText.Add('  last');
  HelpText.Add('  list [active|active.times|newsgroups|subscriptions]');
  HelpText.Add('  listgroup newsgroup');
  HelpText.Add('  mode stream');
  HelpText.Add('  mode reader');
  HelpText.Add('  newgroups yymmdd hhmmss [GMT] [<distributions>]');
  HelpText.Add('  newnews newsgroups yymmdd hhmmss [GMT] [<distributions>]');
  HelpText.Add('  next');
  HelpText.Add('  post');
  HelpText.Add('  slave');
  HelpText.Add('  stat [MessageID|Number]');
  HelpText.Add('  takethis MessageID');
  HelpText.Add('  xhdr header [range|MessageID]');
  HelpText.Add('  xover [range]');
end;

procedure TclNntpServer.FillDefaultOverviewFormat;
begin
  OverviewFormat.Add('Subject:');
  OverviewFormat.Add('From:');
  OverviewFormat.Add('Date:');
  OverviewFormat.Add('Message-ID:');
  OverviewFormat.Add('References:');
  OverviewFormat.Add('Bytes:');
  OverviewFormat.Add('Lines:');
  OverviewFormat.Add('Xref:full');
end;

procedure TclNntpServer.FillDefaultCapabilities;
begin
  Capabilities.Clear();
  Capabilities.Add('VERSION 2');
  Capabilities.Add('READER');
end;

constructor TclNntpServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUserAccounts := TclUserAccountList.Create(Self, TclUserAccountItem);
  FGroups := TclNewsGroupList.Create(Self, TclNewsGroupItem);
  FHelpText := TStringList.Create();
  FOverviewFormat := TStringList.Create();
  FSubscriptions := TStringList.Create();
  FCapabilities := TStringList.Create();
  FillDefaultHelpText();
  FillDefaultOverviewFormat();
  FillDefaultCapabilities();
  Port := cDefaultNntpPort;
  ServerName := 'Clever Internet Suite NNTP service';
  FAllowPost := True;
  FTooOldDays := 35;
  CaseInsensitive := True;
end;

function TclNntpServer.CreateDefaultConnection: TclCommandConnection;
begin
  Result := TclNntpCommandConnection.Create();
end;

procedure TclNntpServer.DoAcceptConnection(AConnection: TclCommandConnection);
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
  SendResponse(AConnection, '', '%d %s %s, %s',
    [postingStatus[AllowPost], GetLocalHost(), ServerName, postingStatusMsg[AllowPost]]);
end;

procedure TclNntpServer.HandleLIST(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  params: string;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, '*', apRead);

  params := UpperCase(AParams);
  if (Trim(params) = '') or (system.Pos('ACTIVE', params) > 0) then
  begin
    HandleGroupList(AConnection, AParams);
  end else
  if (system.Pos('OVERVIEW.FMT', params) > 0) then
  begin
    HandleOverviewFormat(AConnection);
  end else
  if (system.Pos('SUBSCRIPTIONS', params) > 0) then
  begin
    HandleSubscriptions(AConnection);
  end else
  begin
    RaiseNntpError(ACommand, 'command syntax error', 501);
  end;
end;

procedure TclNntpServer.HandleGroupList(AConnection: TclNntpCommandConnection; const AParams: string);
var
  i, ind: Integer;
  params, wildMat: string;
  list: TStrings;
  item: TclNewsGroupItem;
  articleCount, lastArticle,
  firstArticle: Integer;
begin
  params := UpperCase(AParams);
  ind := system.Pos('ACTIVE ', params);
  if (ind > 0) then
  begin
    wildMat := Trim(system.Copy(AParams, ind + Length('ACTIVE '), Length(AParams)));
  end else
  begin
    wildMat := '';
  end;

  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  for i := 0 to Groups.Count - 1 do
  begin
    item := Groups[i];

    articleCount := 0;
    lastArticle := 0;
    firstArticle := 0;

    if HasAccessRights(AConnection, item.GroupName, apRead)
      and CanListGroup(AConnection, item, wildMat, 0, False, '') then
    begin
      DoGetGroupInfo(AConnection, item, articleCount, lastArticle, firstArticle);

      if (system.Pos('ACTIVE.TIMES', params) > 0) then
      begin
        list.Add(Format('%s %d %s', [item.GroupName, GetTimes(item.CreatedOn), item.Owner]));
      end else
      begin
        list.Add(Format('%s %d %d %s',
          [item.GroupName, lastArticle, firstArticle, postingStatusBool[AllowPost and item.AllowPost]]));
      end;
    end;
  end;

  list.Insert(0, '215 list of newsgroups follows');
  SendMultipleLines(AConnection, '.', True);
end;

function TclNntpServer.CanListGroup(AConnection: TclNntpCommandConnection; ANewsGroup: TclNewsGroupItem;
  const AWildMat: string; ACreatedOn: TDateTime; AGMT: Boolean; const ADistributions: string): Boolean;
var
  i: Integer;
  distrs: TStrings;
begin
  Result := True;

  if Result and (AWildMat <> '') then
  begin
    Result := SameText(ANewsGroup.GroupName, AWildMat);
  end;

  if Result and (Int(ACreatedOn) > 0) then
  begin
    if AGMT then
    begin
      Result := ANewsGroup.CreatedOn >= GlobalTimeToLocalTime(ACreatedOn);
    end else
    begin
      Result := ANewsGroup.CreatedOn >= ACreatedOn;
    end;
  end;

  if Result and (ADistributions <> '') then
  begin
    distrs := TStringList.Create();
    try
      distrs.CommaText := UpperCase(ExtractQuotedString(ADistributions, '<', '>'));
      for i := 0 to distrs.Count - 1 do
      begin
        Result := (system.Pos(distrs[i], UpperCase(ANewsGroup.GroupName)) > 0);
        if Result then Exit;
      end;
    finally
      distrs.Free();
    end;
  end;

  DoCanListGroup(AConnection, ANewsGroup, AWildMat, ACreatedOn, AGMT, ADistributions, Result);
end;

procedure TclNntpServer.DoCanListGroup(AConnection: TclNntpCommandConnection;
  ANewsGroup: TclNewsGroupItem; const AWildMat: string; ACreatedOn: TDateTime; AGMT: Boolean;
  const ADistributions: string; var CanList: Boolean);
begin
  if Assigned(OnCanListGroup) then
  begin
    OnCanListGroup(Self, AConnection, ANewsGroup, AWildMat, ACreatedOn, AGMT, ADistributions, CanList);
  end;
end;

function TclNntpServer.GetTimes(ADateTime: TDateTime): Integer;
begin
  Result := Round(ADateTime - EncodeDate(1970, 1, 1));
end;

procedure TclNntpServer.HandleOverviewFormat(AConnection: TclNntpCommandConnection);
var
  list: TStrings;
begin
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  list.Assign(OverviewFormat);
  list.Insert(0, '215 information follows');
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclNntpServer.HandleSubscriptions(AConnection: TclNntpCommandConnection);
var
  list: TStrings;
begin
  if (Subscriptions.Count = 0) then
  begin
    RaiseNntpError('LIST', 'list not available', 503);
  end;
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  list.Assign(Subscriptions);
  list.Insert(0, '215 list of default group subscriptions follow');
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclNntpServer.DoGetGroupInfo(AConnection: TclNntpCommandConnection;
  ANewsGroup: TclNewsGroupItem; var ArticleCount, ALastArticle, AFirstArticle: Integer);
begin
  if Assigned(OnGetGroupInfo) then
  begin
    OnGetGroupInfo(Self, AConnection, ANewsGroup, ArticleCount, ALastArticle, AFirstArticle);
  end;
end;

procedure TclNntpServer.HandleMODE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  mode: string;
begin
  mode := UpperCase(Trim(AParams));
  if (mode = 'READER') then
  begin
    AConnection.FModeType := mtReader;
    SendResponse(AConnection, ACommand, '%d %s: %s',
      [postingStatus[AllowPost], ServerName, postingStatusMsg[AllowPost]]);
  end else
  if (mode = 'STREAM') then
  begin
    AConnection.FModeType := mtStream;
    SendResponse(AConnection, ACommand, '203 StreamOK');
  end else
  begin
    RaiseNntpError(ACommand, 'syntax error or bad command', 500);
  end;
end;

procedure TclNntpServer.HandleQUIT(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  try
    SendResponse(AConnection, ACommand, '205 closing connection');
    AConnection.Close(False);
  except
    on EclSocketError do ;
  end;
end;

function TclNntpServer.IsStreamingCommand(const ACommand, AData: string): Boolean;
var
  ind: Integer;
begin
  ind := Pos(#32, AData);
  if (ind > 0) then
  begin
    Result := SameText(ACommand, system.Copy(AData, 1, ind - 1));
  end else
  begin
    Result := False;
  end;
end;

procedure TclNntpServer.ProcessData(AConnection: TclCommandConnection; const AData: string);
var
  connection: TclNntpCommandConnection;
begin
  connection := (AConnection as TclNntpCommandConnection);

  case connection.ReceivingData of
    rdNntpPostData: HandlePostData(connection, AData);
    rdNntpIHaveData: HandleIHaveData(connection, AData);
    rdNntpTakeThisData: HandleTakeThisData(connection, AData);
  else
    begin
      if IsStreamingCommand('TAKETHIS', AData) then
      begin
        connection.FReceivingData := rdNntpTakeThisData;
        connection.RawData := '';
        ProcessData(connection, AData);
      end else
      begin
        inherited ProcessData(connection, AData);
      end;
    end;
  end;
end;

procedure TclNntpServer.RegisterCommands;
begin
  AddNntpCommand('MODE', HandleMODE);
  AddNntpCommand('QUIT', HandleQUIT);
  AddNntpCommand('LIST', HandleLIST);
  AddNntpCommand('NEWGROUPS', HandleNEWGROUPS);
  AddNntpCommand('GROUP', HandleGROUP);
  AddNntpCommand('NEWNEWS', HandleNEWNEWS);
  AddNntpCommand('LISTGROUP', HandleLISTGROUP);
  AddNntpCommand('STAT', HandleSTAT);
  AddNntpCommand('LAST', HandleLAST);
  AddNntpCommand('NEXT', HandleNEXT);
  AddNntpCommand('ARTICLE', HandleARTICLE);
  AddNntpCommand('BODY', HandleBODY);
  AddNntpCommand('HEAD', HandleHEAD);
  AddNntpCommand('POST', HandlePOST);
  AddNntpCommand('IHAVE', HandleIHAVE);
  AddNntpCommand('CHECK', HandleCHECK);
  AddNntpCommand('SLAVE', HandleSLAVE);
  AddNntpCommand('HELP', HandleHELP);
  AddNntpCommand('DATE', HandleDATE);
  AddNntpCommand('XHDR', HandleXHDR);
  AddNntpCommand('XOVER', HandleXOVER);
  AddNntpCommand('AUTHINFO', HandleAUTHINFO);
  AddNntpCommand('CAPABILITIES', HandleCAPABILITIES);
  AddNntpCommand('STARTTLS', HandleSTARTTLS);
end;

procedure TclNntpServer.HandleNEWGROUPS(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  i: Integer;
  item: TclNewsGroupItem;
  dateTime: TDateTime;
  gmt: Boolean;
  distributions: string;
  list: TStrings;
  articleCount, lastArticle,
  firstArticle: Integer;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, '*', apRead);

  ParseNntpQuery(Trim(AParams), dateTime, gmt, distributions);

  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  for i := 0 to Groups.Count - 1 do
  begin
    articleCount := 0;
    lastArticle := 0;
    firstArticle := 0;

    item := Groups[i];
      
    if HasAccessRights(AConnection, item.GroupName, apRead)
      and CanListGroup(AConnection, item, '', dateTime, gmt, distributions) then
    begin
      DoGetGroupInfo(AConnection, item, articleCount, lastArticle, firstArticle);

      list.Add(Format('%s %d %d %s',
        [item.GroupName, lastArticle, firstArticle, postingStatusBool[AllowPost and item.AllowPost]]));
    end;
  end;

  list.Insert(0, '231 list of new newsgroups follows');
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclNntpServer.HandleGROUP(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  groupName: string;
  item: TclNewsGroupItem;
  articleCount, lastArticle,
  firstArticle: Integer;
begin
  CheckTlsMode(AConnection, ACommand);
  groupName := Trim(AParams);

  CheckAccessRights(AConnection, ACommand, groupName, apRead);

  item := Groups.GroupByName(groupName);
  if (item = nil) then
  begin
    RaiseNntpError(ACommand, 'no such news group', 411);
  end;

  articleCount := 0;
  lastArticle := 0;
  firstArticle := 0;

  DoGetGroupInfo(AConnection, item, articleCount, lastArticle, firstArticle);

  AConnection.FCurrentGroup := item.GroupName;
  SendResponse(AConnection, ACommand, '211 %d %d %d %s selected',
    [articleCount, firstArticle, lastArticle, item.GroupName]);
end;

procedure TclNntpServer.HandleNEWNEWS(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  i, ind: Integer;
  newsGroups: string;
  groupList: TStrings;
  dateTime: TDateTime;
  gmt: Boolean;
  distributions: string;
  list: TStrings;
  item: TclNewsGroupItem;
begin
  CheckTlsMode(AConnection, ACommand);
  newsGroups := Trim(AParams);

  dateTime := Now();
  gmt := False;
  distributions := '';

  ind := system.Pos(#32, newsGroups);
  if (ind > 0) then
  begin
    ParseNntpQuery(system.Copy(newsGroups, ind + 1, Length(newsGroups)), dateTime, gmt, distributions);
    SetLength(newsGroups, ind - 1);
  end;

  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  groupList := TStringList.Create();
  try
    groupList.CommaText := newsGroups;

    for i := 0 to groupList.Count - 1 do
    begin
      item := Groups.GroupByName(groupList[i]);
      if (item <> nil) and HasAccessRights(AConnection, item.GroupName, apRead) then
      begin
        DoGetNewArticles(AConnection, item, dateTime, gmt, distributions, list);
      end;
    end;
  finally
    groupList.Free();
  end;

  list.Insert(0, '230 list of new articles by message-id follows');
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclNntpServer.DoGetNewArticles(AConnection: TclNntpCommandConnection;
  ANewsGroup: TclNewsGroupItem; ADate: TDateTime; AGMT: Boolean; const ADistributions: string;
  ArticleIDs: TStrings);
begin
  if Assigned(OnGetNewArticles) then
  begin
    OnGetNewArticles(Self, AConnection, ANewsGroup, ADate, AGMT, ADistributions, ArticleIDs);
  end;
end;

procedure TclNntpServer.HandleLISTGROUP(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  list: TStrings;
  newsGroup: string;
  item: TclNewsGroupItem;
  result: TclNntpArticleResult;
begin
  CheckTlsMode(AConnection, ACommand);
  newsGroup := Trim(AParams);
  if (newsGroup = '') then
  begin
    newsGroup := AConnection.CurrentGroup;
  end;

  CheckAccessRights(AConnection, ACommand, newsGroup, apRead);

  item := Groups.GroupByName(newsGroup);
  if (item = nil) then
  begin
    RaiseNntpError(ACommand, 'no such newsgroup', 412);
  end;

  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  result := arSuccess;
  DoGetArticles(AConnection, item, list, result);
  case result of
    arSuccess:
      begin
        AConnection.FCurrentGroup := newsGroup;
        list.Insert(0, '211 article list follows');
        SendMultipleLines(AConnection, '.', True);
      end;
    arAccessDenied: RaiseNntpError(ACommand, 'no permission', 502);
  else
    RaiseNntpError(ACommand, 'no such newsgroup', 412);
  end;
end;

procedure TclNntpServer.DoGetArticles(AConnection: TclNntpCommandConnection;
  ANewsGroup: TclNewsGroupItem; ArticleNumbers: TStrings; var Result: TclNntpArticleResult);
begin
  if Assigned(OnGetArticles) then
  begin
    OnGetArticles(Self, AConnection, ANewsGroup, ArticleNumbers, Result);
  end;
end;

procedure TclNntpServer.CheckGroupSelected(AConnection: TclNntpCommandConnection; const ACommand: string);
begin
  if (AConnection.CurrentGroup = '') then
  begin
    RaiseNntpError(ACommand, 'no newsgroup has been selected', 412);
  end;
end;

procedure TclNntpServer.CheckAccessRights(AConnection: TclNntpCommandConnection;
  const ACommand, ANewsGroup: string; APermission: TclNntpAccessPermission);
begin
  if not HasAccessRights(AConnection, ANewsGroup, APermission) then
  begin
    RaiseNntpError(ACommand, Format('permission denied (%s)', [AConnection.PeerName]), 480);
  end;
end;

procedure TclNntpServer.CheckGroupsAccessRights(AConnection: TclNntpCommandConnection;
  const ACommand: string; ANewsGroups: TStrings; APermission: TclNntpAccessPermission);
var
  i: Integer;
begin
  for i := 0 to ANewsGroups.Count - 1 do
  begin
    CheckAccessRights(AConnection, ACommand, ANewsGroups[i], APermission);
  end;
end;

function TclNntpServer.HasAccessRights(AConnection: TclNntpCommandConnection;
  const ANewsGroup: string; APermission: TclNntpAccessPermission): Boolean;
var
  handled: Boolean;
begin
  Result := True;
  handled := False;
  DoHasAccessRights(AConnection, ANewsGroup, APermission, Result, handled);
end;

procedure TclNntpServer.DoHasAccessRights(AConnection: TclNntpCommandConnection;
  const ANewsGroup: string; APermission: TclNntpAccessPermission;
  var IsAllowed, Handled: Boolean);
begin
  if Assigned(OnHasAccessRights) then
  begin
    OnHasAccessRights(Self, AConnection, ANewsGroup, APermission, IsAllowed, Handled);
  end;
end;

procedure TclNntpServer.HandleSTAT(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  articleNo: Integer;
  messageID: string;
  result: TclNntpArticleResult;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckGroupSelected(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, AConnection.CurrentGroup, apRead);

  messageID := Trim(AParams);
  articleNo := StrToIntDef(messageID, 0);
  if (articleNo > 0) then
  begin
    messageID := '';
  end;

  result := arSuccess;
  DoSelectArticle(AConnection, Groups.GroupByName(AConnection.CurrentGroup), articleNo, messageID, result);

  if (result <> arSuccess) then
  begin
    RaiseNntpError(ACommand, 'no such article number in this group', 423);
  end;

  AConnection.FCurrentArticle := articleNo;

  SendResponse(AConnection, ACommand, '223 %d %s article retrieved - request text separately',
    [articleNo, GetNormMessageID(messageID)]);
end;

procedure TclNntpServer.DoSelectArticle(AConnection: TclNntpCommandConnection;
  ANewsGroup: TclNewsGroupItem; var ArticleNo: Integer; var AMessageID: string;
  var Result: TclNntpArticleResult);
begin
  if Assigned(OnSelectArticle) then
  begin
    OnSelectArticle(Self, AConnection, ANewsGroup, ArticleNo, AMessageID, Result);
  end;
end;

procedure TclNntpServer.HandleLAST(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  articleNo: Integer;
  messageID: string;
  result: TclNntpArticleResult;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckGroupSelected(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, AConnection.CurrentGroup, apRead);

  messageID := '';
  articleNo := AConnection.CurrentArticle - 1;

  result := arSuccess;
  DoSelectArticle(AConnection, Groups.GroupByName(AConnection.CurrentGroup), articleNo, messageID, result);

  if (result <> arSuccess) then
  begin
    RaiseNntpError(ACommand, 'no previous article in this group', 422);
  end;

  AConnection.FCurrentArticle := articleNo;

  SendResponse(AConnection, ACommand, '223 %d %s article retrieved - request text separately',
    [articleNo, GetNormMessageID(messageID)]);
end;

procedure TclNntpServer.HandleNEXT(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  articleNo: Integer;
  messageID: string;
  result: TclNntpArticleResult;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckGroupSelected(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, AConnection.CurrentGroup, apRead);

  messageID := '';
  articleNo := AConnection.CurrentArticle + 1;

  result := arSuccess;
  DoSelectArticle(AConnection, Groups.GroupByName(AConnection.CurrentGroup), articleNo, messageID, result);

  if (result <> arSuccess) then
  begin
    RaiseNntpError(ACommand, 'no next article in this group', 421);
  end;

  AConnection.FCurrentArticle := articleNo;

  SendResponse(AConnection, ACommand, '223 %d %s article retrieved - request text separately',
    [articleNo, GetNormMessageID(messageID)]);
end;

procedure TclNntpServer.HandleARTICLE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  InternalGetArticle(AConnection, ACommand, AParams, apMessage);
end;

procedure TclNntpServer.InternalGetArticle(AConnection: TclNntpCommandConnection;
  const ACommand, AParams: string; ArticlePart: TclNntpArticlePart);
const
  ResponseCode: array[TclNntpArticlePart] of Integer = (220, 221, 222);
  ResponseStr: array[TclNntpArticlePart] of string =
    ('head and body follows', 'head follows', 'body follows');
var
  articleNo: Integer;
  messageID: string;
  result: TclNntpArticleResult;
  msg: TStrings;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckGroupSelected(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, AConnection.CurrentGroup, apRead);

  messageID := Trim(AParams);
  articleNo := StrToIntDef(messageID, 0);
  if (articleNo > 0) then
  begin
    messageID := '';
  end;

  if (articleNo = 0) and (messageID = '') then
  begin
    articleNo := AConnection.FCurrentArticle;
  end;

  if (articleNo = 0) and (messageID = '') then
  begin
    RaiseNntpError(ACommand, 'no current article has been selected', 420);
  end;

  msg := TStringList.Create();
  AddMultipleLines(AConnection, msg);
  result := arSuccess;
  DoGetArticle(AConnection, Groups.GroupByName(AConnection.CurrentGroup),
    articleNo, messageID, ArticlePart, msg, result);

  if (result <> arSuccess) then
  begin
    if (system.Pos('<', AParams) = 0) then
    begin
      RaiseNntpError(ACommand, 'no such article number in this group', 423);
    end else
    begin
      RaiseNntpError(ACommand, 'no such article found', 430);
    end;
  end;

  if (system.Pos('<', AParams) = 0) then
  begin
    AConnection.FCurrentArticle := articleNo;
  end;

  msg.Insert(0, Format('%d %d %s article retrieved - %s',
    [ResponseCode[ArticlePart], articleNo, GetNormMessageID(messageID), ResponseStr[ArticlePart]]));
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclNntpServer.DoGetArticle(AConnection: TclNntpCommandConnection;
  ANewsGroup: TclNewsGroupItem; var ArticleNo: Integer; var AMessageID: string;
  ArticlePart: TclNntpArticlePart; Article: TStrings; var Result: TclNntpArticleResult);
begin
  if Assigned(OnGetArticle) then
  begin
    OnGetArticle(Self, AConnection, ANewsGroup, ArticleNo, AMessageID, ArticlePart, Article, Result);
  end;
end;

procedure TclNntpServer.HandleBODY(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  InternalGetArticle(AConnection, ACommand, AParams, apBody);
end;

procedure TclNntpServer.HandleHEAD(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  InternalGetArticle(AConnection, ACommand, AParams, apHeader);
end;

procedure TclNntpServer.HandlePOST(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  CheckTlsMode(AConnection, ACommand);
  if (not AllowPost) then
  begin
    RaiseNntpError(ACommand, 'posting not allowed', 440);
  end;

  CheckAccessRights(AConnection, ACommand, '*', apRead);

  AConnection.FReceivingData := rdNntpPostData;
  AConnection.FMessageID := GenMessageID();
  AConnection.RawData := '';
  SendResponse(AConnection, ACommand, '340 Ok, recommended ID %s', [AConnection.MessageID]);
end;

function TclNntpServer.GenMessageID: string;
begin
  Result := GenerateMessageID();
end;

procedure TclNntpServer.HandlePostData(AConnection: TclNntpCommandConnection; const AData: string);
begin
  AConnection.RawData := AConnection.RawData + AData;

  if CheckForEndOfData(AConnection.RawData) then
  begin
    SetLength(AConnection.FRawData, Length(AConnection.FRawData) - 3);
    AConnection.FReceivingData := rdNntpCommand;
    HandleEndCommand(AConnection, 'POST', HandlePostEnd);
  end;
end;

procedure TclNntpServer.HandleEndCommand(AConnection: TclNntpCommandConnection;
  const ACommand: string; AHandler: TclNntpCommandHandler);
var
  info: TclNntpCommandInfo;
  params: TclTcpCommandParams;
begin
  info := nil;
  params := nil;
  try
    info := TclNntpCommandInfo.Create();
    params := TclTcpCommandParams.Create();
    info.Name := ACommand;
    info.FHandler := AHandler;
    ProcessCommand(AConnection, info, params);
  finally
    params.Free();
    info.Free();
  end;
end;

function TclNntpServer.ArticleHasBody(Article: TStrings): Boolean;
var
  i: Integer;
begin
  i := 0;
  while i < Article.Count do
  begin
    if Article[i] = '' then Break;
    Inc(i);
  end;

  Result := False;
  while i < Article.Count do
  begin
    if Article[i] <> '' then
    begin
      Result := True;
      Break;
    end;
    Inc(i);
  end;
end;

procedure TclNntpServer.ValidatePostArticle(AConnection: TclNntpCommandConnection;
  const ACommand: string; Article: TStrings);
var
  msg: TclMailMessage;
begin
  if (Article.Count = 0) then
  begin
    RaiseNntpError(ACommand, 'Article is empty?', 441);
  end;
  msg := TclMailMessage.Create(nil);
  try
    msg.HeaderSource := Article;

    if (msg.From = '') then
    begin
      RaiseNntpError(ACommand, 'Required header missing {From:}', 441);
    end;
    if (msg.NewsGroups.Count = 0) then
    begin
      RaiseNntpError(ACommand, 'Required header missing {Newsgroups:}', 441);
    end;
    if (msg.Subject = '') then
    begin
      RaiseNntpError(ACommand, 'Required header missing {Subject:}', 441);
    end;
    if not ArticleHasBody(Article) then
    begin
      RaiseNntpError(ACommand, 'no body found', 441);
    end;

    CheckGroupsAccessRights(AConnection, ACommand, msg.NewsGroups, apPost);
  finally
    msg.Free();
  end;
end;

procedure TclNntpServer.DoArticleReceived(AConnection: TclNntpCommandConnection;
  const AMessageID: string; Article: TStrings; var Success: Boolean);
begin
  if Assigned(OnArticleReceived) then
  begin
    OnArticleReceived(Self, AConnection, AMessageID, Article, Success);
  end;
end;

procedure TclNntpServer.HandleCHECK(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  messageID: string;
  accept: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, '*', apIHave);

  messageID := Trim(AParams);
  if (system.Pos('<', messageID) = 0) or (system.Pos('>', messageID) = 0) then
  begin
    RaiseNntpError(ACommand, Format('%s article not wanted - Missing angle brackets', [messageID]), 438);
  end;

  accept := True;
  DoCanReceiveArticle(AConnection, messageID, accept);

  if not accept then
  begin
    RaiseNntpError(ACommand, Format('%s already have it', [messageID]), 438);
  end;

  SendResponse(AConnection, ACommand, '238 %s not here, please send it to me', [messageID]);
end;

procedure TclNntpServer.HandleIHAVE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  messageID: string;
  accept: Boolean;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, '*', apIHave);

  AConnection.FModeType := mtIHave;

  messageID := Trim(AParams);
  if (system.Pos('<', messageID) = 0) or (system.Pos('>', messageID) = 0) then
  begin
    RaiseNntpError(ACommand, 'article not wanted - Missing angle brackets', 435);
  end;

  accept := True;
  DoCanReceiveArticle(AConnection, messageID, accept);

  if not accept then
  begin
    RaiseNntpError(ACommand, 'article not wanted - do not send it', 435);
  end;

  AConnection.FMessageID := messageID;
  AConnection.FReceivingData := rdNntpIHaveData;
  AConnection.RawData := '';
  SendResponse(AConnection, ACommand, '335 send article to be transferred.  End with <CR-LF>.<CR-LF>');
end;

procedure TclNntpServer.DoCanReceiveArticle(AConnection: TclNntpCommandConnection;
  const AMessageID: string; var Accept: Boolean);
begin
  if Assigned(OnCanReceiveArticle) then
  begin
    OnCanReceiveArticle(Self, AConnection, AMessageID, Accept);
  end;
end;

procedure TclNntpServer.HandleIHaveData(AConnection: TclNntpCommandConnection; const AData: string);
begin
  AConnection.RawData := AConnection.RawData + AData;

  if CheckForEndOfData(AConnection.RawData) then
  begin
    SetLength(AConnection.FRawData, Length(AConnection.FRawData) - 3);
    AConnection.FReceivingData := rdNntpCommand;
    HandleEndCommand(AConnection, 'IHAVE', HandleIHaveEnd);
  end;
end;

procedure TclNntpServer.ValidateIHaveArticle(AConnection: TclNntpCommandConnection;
  const ACommand, AMessageID: string; Article: TStrings);
var
  msg: TclMailMessage;
begin
  if (Article.Count = 0) then
  begin
    RaiseNntpError(ACommand, 'article rejected - do not try again (NULL Item)', 437);
  end;
  msg := TclMailMessage.Create(nil);
  try
    msg.HeaderSource := Article;

    if (msg.MessageID = '') or (AMessageID <> msg.MessageID) then
    begin
      RaiseNntpError(ACommand,
        Format('%s transfer failed - do not try again later (No msgid in headers)', [AMessageID]), 437);
    end;
    if not ArticleHasBody(Article) then
    begin
      RaiseNntpError(ACommand,
        Format('%s transfer failed - do not try again later (Item body is empty)', [AMessageID]), 437);
    end;

    if (Round(Now()) - Round(msg.Date) >= TooOldDays) then
    begin
      RaiseNntpError(ACommand,
        Format('%s transfer failed - do not try again later (Message is too old)', [AMessageID]), 437);
    end;

    if (msg.NewsGroups.Count = 0) then
    begin
      RaiseNntpError(ACommand,
        Format('%s article rejected - do not try again (No newsgroups match)', [AMessageID]), 437);
    end;

    CheckGroupsAccessRights(AConnection, ACommand, msg.NewsGroups, apIHave);
  finally
    msg.Free();
  end;
end;

function TclNntpServer.GetNullCommand(const ACommand: string): TclTcpCommandInfo;
var
  info: TclNntpCommandInfo;
begin
  info := TclNntpCommandInfo.Create();
  info.Name := ACommand;
  info.FHandler := HandleNullCommand;
  Result := info;
end;

procedure TclNntpServer.HandleNullCommand(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  RaiseNntpError(ACommand, 'command not recognized', 500);
end;

procedure TclNntpServer.AddMessageID(Article: TStrings; const AMessageID: string);
var
  i: Integer;
begin
  for i := 0 to Article.Count - 1 do
  begin
    if (system.Pos('MESSAGE-ID:', UpperCase(Article[i])) = 1) then
    begin
      Break;
    end;
    if (Article[i] = '') then
    begin
      Article.Insert(i, 'Message-ID: ' + AMessageID);
      Break;
    end;
  end;
end;

procedure TclNntpServer.HandlePostEnd(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  success: Boolean;
  msg: TStrings;
begin
  msg := TStringList.Create();
  try
    msg.Text := AConnection.RawData;
    ValidatePostArticle(AConnection, ACommand, msg);

    AddMessageID(msg, AConnection.MessageID);

{TODO Path: hostname.
Xref: hostname UserName:154}

    success := True;
    DoArticleReceived(AConnection, AConnection.MessageID, msg, success);

    if not success then
    begin
      RaiseNntpError(ACommand, 'posting failed', 441);
    end;

    SendResponse(AConnection, ACommand, '240 article posted ok');
  finally
    msg.Free();
  end;
end;

procedure TclNntpServer.HandleIHaveEnd(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  success: Boolean;
  msg: TStrings;
begin
  msg := TStringList.Create();
  try
    msg.Text := AConnection.RawData;

    ValidateIHaveArticle(AConnection, ACommand, AConnection.MessageID, msg);

    success := True;
    DoArticleReceived(AConnection, AConnection.MessageID, msg, success);

    if not success then
    begin
      RaiseNntpError(ACommand, 'article rejected - do not try again', 437);
    end;

    SendResponse(AConnection, ACommand, '235 article transferred ok');
  finally
    msg.Free();
  end;
end;

procedure TclNntpServer.ProcessUnhandledError(AConnection: TclCommandConnection;
  AParams: TclTcpCommandParams; E: Exception);
begin
  SendResponse(AConnection, AParams.Command, '503 program fault - command not performed');
end;

procedure TclNntpServer.HandleTakeThisData(AConnection: TclNntpCommandConnection; const AData: string);
begin
  AConnection.RawData := AConnection.RawData + AData;

  if CheckForEndOfData(AConnection.RawData) then
  begin
    SetLength(AConnection.FRawData, Length(AConnection.FRawData) - 3);
    AConnection.FReceivingData := rdNntpCommand;
    HandleEndCommand(AConnection, 'TAKETHIS', HandleTakeThisEnd);
  end;
end;

function TclNntpServer.ExtractMessageID(const ACommandLine: string): string;
var
  ind: Integer;
begin
  ind := system.Pos('<', ACommandLine);
  if (ind > 0) then
  begin
    Result := system.Copy(ACommandLine, ind, Length(ACommandLine));
  end else
  begin
    Result := '';
  end;
end;

procedure TclNntpServer.HandleTakeThisEnd(AConnection: TclNntpCommandConnection;
  const ACommand, AParams: string);
var
  success: Boolean;
  msg: TStrings;
begin
  msg := TStringList.Create();
  try
    msg.Text := AConnection.RawData;

    AConnection.FMessageID := '';
    if (msg.Count > 0) then
    begin
      AConnection.FMessageID := ExtractMessageID(msg[0]);
      msg.Delete(0);
    end;

    ValidateTakeThisArticle(AConnection, ACommand, AConnection.MessageID, msg);

    success := True;
    DoArticleReceived(AConnection, AConnection.MessageID, msg, success);

    if not success then
    begin
      RaiseNntpError(ACommand, Format('%s transfer failed - do not try again later', [AConnection.MessageID]), 439);
    end;

    SendResponse(AConnection, ACommand, '239 %s article transferred ok', [AConnection.MessageID]);
  finally
    msg.Free();
  end;
end;

procedure TclNntpServer.ValidateTakeThisArticle(AConnection: TclNntpCommandConnection;
  const ACommand, AMessageID: string; Article: TStrings);
var
  msg: TclMailMessage;
begin
  if (Article.Count = 0) then
  begin
    RaiseNntpError(ACommand, Format('%s transfer failed - do not try again later (NULL Item)', [AMessageID]), 439);
  end;
  msg := TclMailMessage.Create(nil);
  try
    msg.HeaderSource := Article;

    if (msg.MessageID = '') or (AMessageID <> msg.MessageID) then
    begin
      RaiseNntpError(ACommand,
        Format('%s transfer failed - do not try again later (No msgid in headers)', [AMessageID]), 439);
    end;
    if not ArticleHasBody(Article) then
    begin
      RaiseNntpError(ACommand,
        Format('%s transfer failed - do not try again later (Item body is empty)', [AMessageID]), 439);
    end;

    if (Round(Now()) - Round(msg.Date) >= TooOldDays) then
    begin
      RaiseNntpError(ACommand,
        Format('%s transfer failed - do not try again later (Message is too old)', [AMessageID]), 439);
    end;

    if (msg.NewsGroups.Count = 0) then
    begin
      RaiseNntpError(ACommand,
        Format('%s article rejected - do not try again (No newsgroups match)', [AMessageID]), 439);
    end;

    CheckGroupsAccessRights(AConnection, ACommand, msg.NewsGroups, apIHave);
  finally
    msg.Free();
  end;
end;

procedure TclNntpServer.HandleSLAVE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  AConnection.FIsSlave := True;
  SendResponse(AConnection, ACommand, '202 slave status noted');
end;

procedure TclNntpServer.HandleHELP(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  list: TStrings;
begin
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);
  list.Assign(HelpText);
  list.Insert(0, '100 Legal commands');
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclNntpServer.DoDestroy;
begin
  FCapabilities.Free();
  FSubscriptions.Free();
  FOverviewFormat.Free();
  FHelpText.Free();
  FGroups.Free();
  FUserAccounts.Free();
  inherited DoDestroy();
end;

procedure TclNntpServer.HandleDATE(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  SendResponse(AConnection, ACommand,
    '111 ' + FormatDateTime('yyyymmddhhnnss', Now() + TimeZoneBiasToDateTime(TimeZoneBiasString())));
end;

procedure TclNntpServer.SetHelpText(const Value: TStrings);
begin
  FHelpText.Assign(Value);
end;

procedure TclNntpServer.SetOverviewFormat(const Value: TStrings);
begin
  FOverviewFormat.Assign(Value);
end;

procedure TclNntpServer.SetSubscriptions(const Value: TStrings);
begin
  FSubscriptions.Assign(Value);
end;

procedure TclNntpServer.HandleXHDR(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  ind: Integer;
  articles: TclNntpArticleList;
  fieldName, params, range, messageID: string;
  fieldNames: TStrings;
  result: TclNntpArticleResult;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckGroupSelected(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, AConnection.CurrentGroup, apRead);

  messageID := '';
  range := '';

  fieldName := Trim(AParams);

  ind := system.Pos(#32, fieldName);
  if (ind > 0) then
  begin
    params := Trim(system.Copy(fieldName, ind + 1, Length(fieldName)));
    fieldName := system.Copy(fieldName, 1, ind - 1);
  end;
  
  if (params = '') then
  begin
    range := IntToStr(AConnection.CurrentArticle);
  end else
  if (params[1] = '<') and (params[Length(params)] = '>') then
  begin
    messageID := params;
  end else
  begin
    range := params;
  end;

  articles := nil;
  fieldNames := nil;
  try
    articles := TclNntpArticleList.Create(TclNntpArticleItem);
    fieldNames := TStringList.Create();

    result := arSuccess;
    DoGetArticleHeader(AConnection, Groups.GroupByName(AConnection.CurrentGroup),
      range, messageID, articles, result);

    fieldNames.Text := fieldName;
    case result of
      arSuccess: SendHeaderValuesResponse(AConnection, fieldNames, #32, articles,
        Format('221 %s fields follow', [fieldName]));
      arNotFound: RaiseNntpError(ACommand, 'item not found', 430);
    else
      RaiseNntpError(ACommand, 'no permission', 502);
    end;
  finally
    fieldNames.Free();
    articles.Free();
  end;
end;

procedure TclNntpServer.SendHeaderValuesResponse(AConnection: TclNntpCommandConnection;
  AFieldNames: TStrings; const AFieldDelimiter: string;
  Articles: TclNntpArticleList; const AResponse: string);
var
  i, j, ind: Integer;
  name, line: string;
  list, fieldList: TStrings;
begin
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);

  fieldList := TStringList.Create();
  try
    for i := 0 to Articles.Count - 1 do
    begin
      GetHeaderFieldList(0, Articles[i].Header, fieldList);

      line := '';
      for j := 0 to AFieldNames.Count - 1 do
      begin
        name := AFieldNames[j];
        ind := system.Pos(':', name);
        if (ind > 0) then
        begin
          SetLength(name, ind - 1);
        end;

        line := line + AFieldDelimiter
          + StringReplace(GetHeaderFieldValue(Articles[i].Header, fieldList, name),
            AFieldDelimiter, #32, [rfReplaceAll]);
      end;

      if (line = '') then
      begin
        line := AFieldDelimiter + '(none)';
      end;

      line := IntToStr(Articles[i].ArticleNo) + line;
      list.Add(line);
    end;
  finally
    fieldList.Free();
  end;

  list.Insert(0, AResponse);
  SendMultipleLines(AConnection, '.', True);
end;

procedure TclNntpServer.DoGetArticleHeader(AConnection: TclNntpCommandConnection;
  ANewsGroup: TclNewsGroupItem; const ARange, AMessageID: string; Articles: TclNntpArticleList;
  var Result: TclNntpArticleResult);
begin
  if Assigned(OnGetArticleHeader) then
  begin
    OnGetArticleHeader(Self, AConnection, ANewsGroup, ARange, AMessageID, Articles, Result);
  end;
end;

procedure TclNntpServer.HandleXOVER(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  range: string;
  articles: TclNntpArticleList;
  result: TclNntpArticleResult;
begin
  CheckTlsMode(AConnection, ACommand);
  CheckGroupSelected(AConnection, ACommand);
  CheckAccessRights(AConnection, ACommand, AConnection.CurrentGroup, apRead);

  range := Trim(AParams);
  if (range = '') then
  begin
    range := IntToStr(AConnection.CurrentArticle);
  end;

  articles := TclNntpArticleList.Create(TclNntpArticleItem);
  try
    result := arSuccess;
    DoGetArticleHeader(AConnection, Groups.GroupByName(AConnection.CurrentGroup), range, '', articles, result);

    case result of
      arSuccess: SendHeaderValuesResponse(AConnection, OverviewFormat, #9, articles, '224 data follows');
    else
      RaiseNntpError(ACommand, 'no permission', 502);
    end;
  finally
    articles.Free();
  end;
end;

procedure TclNntpServer.SetGroups(const Value: TclNewsGroupList);
begin
  FGroups.Assign(Value);
end;

function TclNntpServer.GetCaseInsensitive: Boolean;
begin
  Result := FUserAccounts.CaseInsensitive;
end;

procedure TclNntpServer.SetCaseInsensitive(const Value: Boolean);
begin
  FUserAccounts.CaseInsensitive := Value;
end;

procedure TclNntpServer.SetUserAccounts(const Value: TclUserAccountList);
begin
  FUserAccounts.Assign(Value);
end;

procedure TclNntpServer.HandleAUTHINFO(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  ind: Integer;
  params: string;
begin
  CheckTlsMode(AConnection, ACommand);

  params := UpperCase(Trim(AParams));
  if (system.Pos('USER', params) > 0) then
  begin
    ind := system.Pos(#32, params);
    AConnection.FTempUserName := '';
    if (ind > 0) then
    begin
      AConnection.FTempUserName := system.Copy(params, ind + 1, Length(params));
    end;
    SendResponse(AConnection, ACommand, '381 PASS required');
  end else
  if (system.Pos('PASS', params) > 0) then
  begin
    if (AConnection.FTempUserName = '') then
    begin
      RaiseNntpError(ACommand, 'USER required', 482);
    end;

    ind := system.Pos(#32, params);
    if (ind > 0) then
    begin
      params := system.Copy(params, ind + 1, Length(params));
    end else
    begin
      params := '';
    end;

    AConnection.FUserName := AConnection.FTempUserName;
    AConnection.FTempUserName := '';
    AConnection.FIsAuthorized := False;
    
    if not Authenticate(AConnection, UserAccounts.AccountByUserName(AConnection.UserName), params) then
    begin
      AConnection.FUserName := '';
      RaiseNntpError(ACommand, 'Authentication error', 502);
    end;

    AConnection.FIsAuthorized := True;
    SendResponse(AConnection, ACommand, '281 Ok');
  end else
  begin
    RaiseNntpError(ACommand, 'bad authinfo param', 481);
  end;
end;

function TclNntpServer.Authenticate(AConnection: TclNntpCommandConnection;
  Account: TclUserAccountItem; const APassword: string): Boolean;
var
  handled: Boolean;
begin
  handled := False;
  Result := False;
  DoAuthenticate(AConnection, Account, APassword, Result, handled);
  if (not handled) and (Account <> nil) then
  begin
    Result := Account.Authenticate(APassword);
  end;
end;

procedure TclNntpServer.DoAuthenticate(AConnection: TclNntpCommandConnection;
  Account: TclUserAccountItem; const APassword: string; var IsAuthorized, Handled: Boolean);
begin
  if Assigned(OnAuthenticate) then
  begin
    OnAuthenticate(Self, AConnection, Account, APassword, IsAuthorized, Handled);
  end;
end;

procedure TclNntpServer.DoProcessCommand(AConnection: TclCommandConnection;
  AInfo: TclTcpCommandInfo; AParams: TclTcpCommandParams);
begin
  AConnection.BeginWork();
  try
    inherited DoProcessCommand(AConnection, AInfo, AParams);
  finally
    AConnection.EndWork();
  end;
end;

procedure TclNntpServer.HandleCAPABILITIES(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
var
  i: Integer;
  list: TStrings;
begin
  list := TStringList.Create();
  AddMultipleLines(AConnection, list);

  list.Add('101 Capability list:');
  for i := 0 to Capabilities.Count - 1 do
  begin
    if not SameText('STARTTLS', Capabilities[i]) then
    begin
      list.Add(Capabilities[i]);
    end;
  end;

  if (UseTLS <> stNone) and not AConnection.IsTls then
  begin
    list.Add('STARTTLS');
  end;

  SendMultipleLines(AConnection, '.', True);
end;

procedure TclNntpServer.HandleSTARTTLS(AConnection: TclNntpCommandConnection; const ACommand, AParams: string);
begin
  if (UseTLS = stNone) then
  begin
    RaiseNntpError(ACommand, 'Can not initiate TLS negotiation', 580);
  end;
  if (UseTLS = stImplicit) or AConnection.IsTls then
  begin
    RaiseNntpError(ACommand, 'STARTTLS not allowed with active TLS layer', 502);
  end;

  SendResponse(AConnection, ACommand, '382 Continue with TLS negotiation');
  AConnection.InitParams();
  StartTls(AConnection);
end;

procedure TclNntpServer.CheckTlsMode(AConnection: TclNntpCommandConnection; const ACommand: string);
begin
  if (UseTLS = stExplicitRequire) and (not AConnection.IsTls) then
  begin
    RaiseNntpError(ACommand, 'Encryption or stronger authentication required', 483);
  end;
end;

procedure TclNntpServer.SetCapabilities(const Value: TStrings);
begin
  FCapabilities.Assign(Value);
end;

{ TclNewsGroupList }

function TclNewsGroupList.Add: TclNewsGroupItem;
begin
  Result := TclNewsGroupItem(inherited Add());
end;

function TclNewsGroupList.GetItem(Index: Integer): TclNewsGroupItem;
begin
  Result := TclNewsGroupItem(inherited GetItem(Index));
end;

function TclNewsGroupList.GroupByName(const AName: string): TclNewsGroupItem;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Result := Items[i];
    if SameText(Result.GroupName, AName) then Exit;
  end;
  Result := nil;
end;

procedure TclNewsGroupList.SetItem(Index: Integer; const Value: TclNewsGroupItem);
begin
  inherited SetItem(Index, Value);
end;

{ TclNntpCommandInfo }

procedure TclNntpCommandInfo.Execute(AConnection: TclCommandConnection; AParams: TclTcpCommandParams);
begin
  FHandler(AConnection as TclNntpCommandConnection, Name, AParams.Params);
end;

{ TclNntpArticleItem }

constructor TclNntpArticleItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FHeader := TStringList.Create();
end;

destructor TclNntpArticleItem.Destroy;
begin
  FHeader.Free();
  inherited Destroy();
end;

{ TclNntpArticleList }

function TclNntpArticleList.Add: TclNntpArticleItem;
begin
  Result := TclNntpArticleItem(inherited Add());
end;

function TclNntpArticleList.GetItem(Index: Integer): TclNntpArticleItem;
begin
  Result := TclNntpArticleItem(inherited GetItem(Index));
end;

procedure TclNntpArticleList.SetItem(Index: Integer; const Value: TclNntpArticleItem);
begin
  inherited SetItem(Index, Value);
end;

{ TclNewsGroupItem }

procedure TclNewsGroupItem.Assign(Source: TPersistent);
var
  src: TclNewsGroupItem;
begin
  if (Source is TclNewsGroupItem) then
  begin
    src := (Source as TclNewsGroupItem);
    AllowPost := src.AllowPost;
    GroupName := src.GroupName;
    CreatedOn := src.CreatedOn;
    Owner := src.Owner;
  end else
  begin
    inherited Assign(Source);
  end;
end;

constructor TclNewsGroupItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  AllowPost := True;
  CreatedOn := Now();
end;

{ TclNntpCommandConnection }

constructor TclNntpCommandConnection.Create;
begin
  inherited Create();
  InitParams();
end;

procedure TclNntpCommandConnection.InitParams;
begin
  FCurrentGroup := '';
  FCurrentArticle := 0;
  FReceivingData := rdNntpCommand;
  FRawData := '';
  FMessageID := '';
  FModeType := mtReader;
  FIsSlave := False;
  FUserName := '';
  FTempUserName := '';
  FIsAuthorized := False;
end;

end.
