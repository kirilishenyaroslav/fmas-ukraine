{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clNntp;

interface

{$I clVer.inc}

uses
  SysUtils, clUtils, Classes, clMailMessage, clTcpClient, clNntpUtils;

type
  TclNewsGroupInfo = class
  private
    FLastArticle: Integer;
    FFirstArticle: Integer;
    FArticleCount: Integer;
    FGroupName: string;
    FAllowPost: Boolean;
    procedure Clear;
  public
    constructor Create;
    property GroupName: string read FGroupName write FGroupName;
    property ArticleCount: Integer read FArticleCount write FArticleCount;
    property LastArticle: Integer read FLastArticle write FLastArticle;
    property FirstArticle: Integer read FFirstArticle write FFirstArticle;
    property AllowPost: Boolean read FAllowPost write FAllowPost;
  end;

  TclGroupInfoEvent = procedure(Sender: TObject; AGroupInfo: TclNewsGroupInfo) of object;

  TclGroupOverviewEvent = procedure(Sender: TObject; ArticleNo: Integer;
    const ASubject, AFrom, ADate, AMessageId: string; AReferences: TStrings; ASize, ALines: Integer;
    const AllHeaders: string) of object;
  
  TclCustomNntp = class(TclTcpCommandClient)
  private
    FModeType: TclNntpModeType;
    FCanPost: Boolean;
    FCanStream: Boolean;
    FOnGetGroupInfo: TclGroupInfoEvent;
    FCurrentGroup: TclNewsGroupInfo;
    FResponseLinesNeeded: Integer;
    FOnGroupOverview: TclGroupOverviewEvent;
    FNewsAgent: string;
    procedure SetModeType(const Value: TclNntpModeType);
    procedure SetNewsAgent(const Value: string);
    procedure ParseGroups(AList: TStrings; ADetails: Boolean = False);
    procedure ParseOverview;
    procedure InternalGet(Article: TStrings);
    procedure InternalGroupOverview(const ARange: string);
  protected
    procedure DoGetGroupInfo(AGroupInfo: TclNewsGroupInfo); dynamic;
    procedure DoGroupOverview(ArticleNo: Integer; const ASubject, AFrom, ADate, AMessageId: string;
      AReferences: TStrings; ASize, ALines: Integer; const AllHeaders: string); dynamic;
    function GetDefaultPort: Integer; override;
    function GetResponseCode(const AResponse: string): Integer; override;
    procedure OpenSession; override;
    procedure CloseSession; override;
    property ModeType: TclNntpModeType read FModeType write SetModeType default mtReader;
    property NewsAgent: string read FNewsAgent write SetNewsAgent;

    property OnGetGroupInfo: TclGroupInfoEvent read FOnGetGroupInfo write FOnGetGroupInfo;
    property OnGroupOverview: TclGroupOverviewEvent read FOnGroupOverview write FOnGroupOverview;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure StartTls; override;

    procedure Authenticate;
    procedure SendNntpCommand(const ACommand: string;
      const AOkResponses: array of Integer); overload;
    procedure SendNntpCommand(const ACommand: string;
      const AOkResponses: array of Integer; const Args: array of const); overload;

    procedure GetGroups(AList: TStrings; ADetails: Boolean = False);
    procedure GetNewGroups(AList: TStrings; ADate: TDateTime; AGMT: Boolean;
      const ADistributions: string = ''; ADetails: Boolean = False);
    procedure GetNewArticles(AList: TStrings; const ANewsGroups: string;
      ADate: TDateTime; AGMT: Boolean; const ADistributions: string = '');
    procedure SelectGroup(const AName: string);
    function SelectArticle(ArticleNo: Integer): string;
    function Next: string;
    function Prev: string;

    procedure PostArticle(Article: TclMailMessage; const AReference, ANewsGroup: string); overload;
    procedure PostArticle(Article: TclMailMessage); overload;
    procedure PostArticle(Article: TStrings); overload;

    procedure GetArticle(Article: TStrings); overload;
    procedure GetArticle(ArticleNo: Integer; Article: TStrings); overload;
    procedure GetArticle(const AMessageID: string; Article: TStrings); overload;
    procedure GetArticle(Article: TclMailMessage); overload;
    procedure GetArticle(ArticleNo: Integer; Article: TclMailMessage); overload;
    procedure GetArticle(const AMessageID: string; Article: TclMailMessage); overload;

    procedure GetHeader(AHeader: TStrings); overload;
    procedure GetHeader(ArticleNo: Integer; AHeader: TStrings); overload;
    procedure GetHeader(const AMessageID: string; AHeader: TStrings); overload;
    procedure GetHeader(AHeader: TclMailMessage); overload;
    procedure GetHeader(ArticleNo: Integer; AHeader: TclMailMessage); overload;
    procedure GetHeader(const AMessageID: string; AHeader: TclMailMessage); overload;

    procedure GetBody(ABody: TStrings); overload;
    procedure GetBody(ArticleNo: Integer; ABody: TStrings); overload;
    procedure GetBody(const AMessageID: string; ABody: TStrings); overload;

    procedure IHave(const AMessageID: string; Article: TStrings);
    procedure Check(AMessageIDs, AResponses: TStrings);
    procedure TakeThis(const AMessageID: string; Article: TStrings);
    procedure GetHeaderValue(const AHeaderName, AParameters: string; AValues: TStrings);

    procedure GetOverviewFormat(AFormat: TStrings);
    procedure GroupOverview(const ARange: string); overload;
    procedure GroupOverview(ArticleNo: Integer); overload;
    procedure GroupOverview(AFirstArticle, ALastArticle: Integer); overload;
    procedure GroupOverview; overload;

    property CanPost: Boolean read FCanPost;
    property CanStream: Boolean read FCanStream;
    property CurrentGroup: TclNewsGroupInfo read FCurrentGroup;
  end;

  TclNntp = class(TclCustomNntp)
  published
    property ModeType;
    property NewsAgent;
    property BatchSize;
    property UserName;
    property Password;
    property Server;
    property Port default cDefaultNntpPort;
    property TimeOut;
    property UseTLS;
    property CertificateFlags;
    property TLSFlags;
    property BitsPerSec;
    property OnChanged;
    property OnOpen;
    property OnClose;
    property OnGetCertificate;
    property OnVerifyServer;
    property OnSendCommand;
    property OnReceiveResponse;
    property OnProgress;
    property OnGetGroupInfo;
    property OnGroupOverview;
  end;

const
  NNTP_RESPONSELINESNEEDED = 10;
  
implementation

uses
  clSocket{$IFDEF DEMO}, Forms, Windows, clEncoder, clCert{$ENDIF};

{ TclCustomNntp }

function TclCustomNntp.GetResponseCode(const AResponse: string): Integer;
begin
  Result := SOCKET_WAIT_RESPONSE;
  if (FResponseLinesNeeded > 0) then
  begin
    if (FResponseLinesNeeded = Response.Count) then
    begin
      Result := NNTP_RESPONSELINESNEEDED;
    end;
  end else
  if (Length(AResponse) > 2) then
  begin
    Result := StrToIntDef(System.Copy(AResponse, 1, 3), SOCKET_WAIT_RESPONSE);
  end else
  if (AResponse = '.') then
  begin
    Result := SOCKET_DOT_RESPONSE;
  end;
end;

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}

procedure TclCustomNntp.OpenSession;
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
    if (not IsDemoDisplayed) and (not IsEncoderDemoDisplayed)
      and (not IsCertDemoDisplayed) and (not IsMailMessageDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
    IsMailMessageDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  WaitingResponse([200, 201]);

  FCanPost := (LastResponseCode = 200);
  FCanStream := False;

  ExplicitStartTls();

  case ModeType of
    mtReader:
      begin
        SendNntpCommand('MODE READER', [200, 201]);
        FCanPost := (LastResponseCode = 200);
      end;
    mtStream:
      begin
        try
          SendNntpCommand('MODE STREAM', [203]);
          FCanStream := True;
        except
          on EclSocketError do ;
        end;
      end;
  end;
end;

procedure TclCustomNntp.CloseSession;
begin
  try
    SendCommandSync('QUIT', [205]);
  except
    on EclSocketError do ;
  end;
end;

constructor TclCustomNntp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCurrentGroup := TclNewsGroupInfo.Create();
  Port := cDefaultNntpPort;
  FNewsAgent := cMailAgent;
end;

procedure TclCustomNntp.SetModeType(const Value: TclNntpModeType);
begin
  if (FModeType <> Value) then
  begin
    FModeType := Value;
    Changed();
  end;
end;

procedure TclCustomNntp.GetGroups(AList: TStrings; ADetails: Boolean);
begin
  SendNntpCommand('LIST', [215]);
  WaitMultipleLines(0);
  ParseGroups(AList, ADetails);
end;

procedure TclCustomNntp.SendNntpCommand(const ACommand: string;
  const AOkResponses: array of Integer);
begin
  try
    SendCommandSync(ACommand, AOkResponses);
  except
    on E: EclSocketError do
    begin
      if ((LastResponseCode = 480) or (LastResponseCode = 450))
        and ((UserName <> '') or (Password <> '')) then
      begin
        Authenticate();
        SendCommandSync(ACommand, AOkResponses);
      end else
      begin
        raise;
      end;
    end;
  end;
end;

procedure TclCustomNntp.Authenticate;
begin
  SendCommandSync('AUTHINFO USER %s', [281, 381], [UserName]);
  if (LastResponseCode = 381) then
  begin
    SendCommandSync('AUTHINFO PASS %s', [281], [Password]);
  end;
end;

procedure TclCustomNntp.SendNntpCommand(const ACommand: string;
  const AOkResponses: array of Integer; const Args: array of const);
begin
  SendNntpCommand(Format(ACommand, Args), AOkResponses);
end;

procedure TclCustomNntp.DoGetGroupInfo(AGroupInfo: TclNewsGroupInfo);
begin
  if Assigned(OnGetGroupInfo) then
  begin
    OnGetGroupInfo(Self, AGroupInfo);
  end;
end;

procedure TclCustomNntp.GetNewGroups(AList: TStrings; ADate: TDateTime; AGMT: Boolean;
  const ADistributions: string; ADetails: Boolean);
begin
  SendNntpCommand('NEWGROUPS %s', [231], [BuildNntpQuery(ADate, AGMT, ADistributions)]);
  WaitMultipleLines(0);
  ParseGroups(AList, ADetails);
end;

procedure TclCustomNntp.ParseGroups(AList: TStrings; ADetails: Boolean);
var
  i: Integer;
  info: TclNewsGroupInfo;
begin
  AList.Assign(Response);
  info := TclNewsGroupInfo.Create();
  try
    for i := 0 to AList.Count - 1 do
    begin
      info.GroupName := ExtractWord(1, AList[i], [#32, #9]);
      info.LastArticle := StrToIntDef(ExtractWord(2, AList[i], [#32, #9]), 0);
      info.FirstArticle := StrToIntDef(ExtractWord(3, AList[i], [#32, #9]), 0);
      info.AllowPost := UpperCase(Trim(ExtractWord(4, AList[i], [#32, #9]))) = 'Y';

      DoGetGroupInfo(info);
      if not ADetails then
      begin
        AList[i] := info.GroupName;
      end;
    end;
  finally
    info.Free();
  end;
end;

destructor TclCustomNntp.Destroy;
begin
  FCurrentGroup.Free();
  inherited Destroy();;
end;

procedure TclCustomNntp.SelectGroup(const AName: string);
var
  s: string;
begin
  SendNntpCommand('GROUP %s', [211], [AName]);
  s := Response.Text;
  CurrentGroup.ArticleCount := StrToIntDef(ExtractWord(2, s, [#32, #9]), 0);
  CurrentGroup.FirstArticle := StrToIntDef(ExtractWord(3, s, [#32, #9]), 0);
  CurrentGroup.LastArticle := StrToIntDef(ExtractWord(4, s, [#32, #9]), 0);
  CurrentGroup.GroupName := ExtractWord(5, s, [#32, #9]);
  CurrentGroup.AllowPost := CanPost;
end;

procedure TclCustomNntp.PostArticle(Article: TclMailMessage);
begin
  PostArticle(Article.MessageSource);
end;

procedure TclCustomNntp.PostArticle(Article: TStrings);
begin
  InsertHeaderFieldIfNeed(Article, 'X-Newsreader', NewsAgent);
  SendNntpCommand('POST', [340]);
  SendMultipleLines(Article);
  SendCommandSync('.', [240]);
end;

procedure TclCustomNntp.PostArticle(Article: TclMailMessage; const AReference, ANewsGroup: string);
begin
  if (AReference <> '') and (Article.References.IndexOf(AReference) < 0) then
  begin
    Article.References.Add(AReference);
  end;
  if (ANewsGroup <> '') and (Article.NewsGroups.IndexOf(ANewsGroup) < 0) then
  begin
    Article.NewsGroups.Add(ANewsGroup);
  end;
  PostArticle(Article);
end;

procedure TclCustomNntp.GetNewArticles(AList: TStrings;
  const ANewsGroups: string; ADate: TDateTime; AGMT: Boolean;
  const ADistributions: string);
begin
  SendNntpCommand('NEWNEWS %s %s', [230], [ANewsGroups, BuildNntpQuery(ADate, AGMT, ADistributions)]);
  WaitMultipleLines(0);
  AList.Assign(Response);
end;

function TclCustomNntp.SelectArticle(ArticleNo: Integer): string;
begin
  SendNntpCommand('STAT %d', [223], [ArticleNo]);
  Result := ExtractWord(3, Response.Text, [#32, #9]);
end;

function TclCustomNntp.Next: string;
begin
  SendNntpCommand('NEXT', [223]);
  Result := ExtractWord(3, Response.Text, [#32, #9]);
end;

function TclCustomNntp.Prev: string;
begin
  SendNntpCommand('LAST', [223]);
  Result := ExtractWord(3, Response.Text, [#32, #9]);
end;

procedure TclCustomNntp.GetArticle(Article: TStrings);
begin
  SendNntpCommand('ARTICLE', [220]);
  InternalGet(Article);
end;

procedure TclCustomNntp.GetArticle(ArticleNo: Integer; Article: TStrings);
begin
  SendNntpCommand('ARTICLE %d', [220], [ArticleNo]);
  InternalGet(Article);
end;

procedure TclCustomNntp.GetArticle(const AMessageID: string;
  Article: TStrings);
begin
  SendNntpCommand('ARTICLE %s', [220], [GetNormMessageID(AMessageID)]);
  InternalGet(Article);
end;

procedure TclCustomNntp.GetArticle(Article: TclMailMessage);
var
  src: TStrings; 
begin
  src := TStringList.Create();
  try
    GetArticle(src);
    Article.MessageSource := src;
  finally
    src.Free();
  end;
end;

procedure TclCustomNntp.GetArticle(ArticleNo: Integer;
  Article: TclMailMessage);
var
  src: TStrings; 
begin
  src := TStringList.Create();
  try
    GetArticle(ArticleNo, src);
    Article.MessageSource := src;
  finally
    src.Free();
  end;
end;

procedure TclCustomNntp.GetArticle(const AMessageID: string;
  Article: TclMailMessage);
var
  src: TStrings;
begin
  src := TStringList.Create();
  try
    GetArticle(AMessageID, src);
    Article.MessageSource := src;
  finally
    src.Free();
  end;
end;

procedure TclCustomNntp.GetHeader(const AMessageID: string;
  AHeader: TStrings);
begin
  SendNntpCommand('HEAD %s', [221], [GetNormMessageID(AMessageID)]);
  InternalGet(AHeader);
end;

procedure TclCustomNntp.GetHeader(ArticleNo: Integer; AHeader: TStrings);
begin
  SendNntpCommand('HEAD %d', [221], [ArticleNo]);
  InternalGet(AHeader);
end;

procedure TclCustomNntp.GetHeader(AHeader: TStrings);
begin
  SendNntpCommand('HEAD', [221]);
  InternalGet(AHeader);
end;

procedure TclCustomNntp.GetHeader(const AMessageID: string; AHeader: TclMailMessage);
var
  src: TStrings;
begin
  src := TStringList.Create();
  try
    GetHeader(AMessageID, src);
    AHeader.MessageSource := src;
  finally
    src.Free();
  end;
end;

procedure TclCustomNntp.GetHeader(ArticleNo: Integer;
  AHeader: TclMailMessage);
var
  src: TStrings;
begin
  src := TStringList.Create();
  try
    GetHeader(ArticleNo, src);
    AHeader.MessageSource := src;
  finally
    src.Free();
  end;
end;

procedure TclCustomNntp.GetHeader(AHeader: TclMailMessage);
var
  src: TStrings;
begin
  src := TStringList.Create();
  try
    GetHeader(src);
    AHeader.MessageSource := src;
  finally
    src.Free();
  end;
end;

procedure TclCustomNntp.InternalGet(Article: TStrings);
begin
  WaitMultipleLines(0);
  Article.Assign(Response);
end;

procedure TclCustomNntp.GetBody(ABody: TStrings);
begin
  SendNntpCommand('BODY', [222]);
  InternalGet(ABody);
end;

procedure TclCustomNntp.GetBody(ArticleNo: Integer; ABody: TStrings);
begin
  SendNntpCommand('BODY %d', [222], [ArticleNo]);
  InternalGet(ABody);
end;

procedure TclCustomNntp.GetBody(const AMessageID: string; ABody: TStrings);
begin
  SendNntpCommand('BODY %s', [222], [GetNormMessageID(AMessageID)]);
  InternalGet(ABody);
end;

procedure TclCustomNntp.IHave(const AMessageID: string; Article: TStrings);
begin
  InsertHeaderFieldIfNeed(Article, 'X-Newsreader', NewsAgent);
  SendNntpCommand('IHAVE %s', [335], [GetNormMessageID(AMessageID)]);
  SendMultipleLines(Article);
  SendNntpCommand('.', [235]);
end;

procedure TclCustomNntp.Check(AMessageIDs, AResponses: TStrings);
var
  i: Integer;
begin
  if (AMessageIDs.Count = 0) then Exit;
  
  Response.Clear();
  for i := 0 to AMessageIDs.Count - 1 do
  begin
    SendCommand('CHECK ' + GetNormMessageID(AMessageIDs[i]));
  end;

  FResponseLinesNeeded := AMessageIDs.Count;
  try
    WaitingResponse([NNTP_RESPONSELINESNEEDED]);
    AResponses.Assign(Response); 
  finally
    FResponseLinesNeeded := 0;
  end;
end;

procedure TclCustomNntp.TakeThis(const AMessageID: string; Article: TStrings);
begin
  InsertHeaderFieldIfNeed(Article, 'X-Newsreader', NewsAgent);
  SendCommand('TAKETHIS ' + GetNormMessageID(AMessageID));
  SendMultipleLines(Article);
  SendNntpCommand('.', [239]);
end;

procedure TclCustomNntp.GetHeaderValue(const AHeaderName, AParameters: string; AValues: TStrings);
begin
  SendNntpCommand('XHDR %s %s', [221], [AHeaderName, AParameters]);
  WaitMultipleLines(0);
  AValues.Assign(Response);
end;

procedure TclCustomNntp.GetOverviewFormat(AFormat: TStrings);
begin
  SendNntpCommand('LIST OVERVIEW.FMT', [215]);
  WaitMultipleLines(0);
  AFormat.Assign(Response);
end;

procedure TclCustomNntp.InternalGroupOverview(const ARange: string);
var
  cmd: string;
begin
  cmd := 'XOVER';
  if (ARange <> '') then
  begin
    cmd := cmd + ' ' + ARange;
  end;

  SendNntpCommand(cmd, [224]);
  WaitMultipleLines(0);
  ParseOverview();
end;

procedure TclCustomNntp.GroupOverview(const ARange: string);
begin
  InternalGroupOverview(ARange);
end;

procedure TclCustomNntp.GroupOverview(ArticleNo: Integer);
begin
  InternalGroupOverview(IntToStr(ArticleNo));
end;

procedure TclCustomNntp.GroupOverview(AFirstArticle, ALastArticle: Integer);
var
  range: string;
begin
  range := '-';
  if (AFirstArticle > 0) then
  begin
    range := IntToStr(AFirstArticle) + range;
  end;
  if (ALastArticle > 0) then
  begin
    range := range + IntToStr(ALastArticle);
  end;
  
  InternalGroupOverview(range);
end;

procedure TclCustomNntp.GroupOverview;
begin
  GroupOverview(0, 0);
end;

procedure TclCustomNntp.ParseOverview;
var
  i: Integer;
  refs: TStrings;
  s: string;
  articleNo, size, lines: Integer;
  subject, from, articleDate,
  messageId: string;
begin
  refs := TStringList.Create();
  try
    for i := 0 to Response.Count - 1 do
    begin
      s := StringReplace(Response[i], #9#9, #9#32#9, [rfReplaceAll]);
      if (WordCount(s, [#9]) >= 8) then
      begin
        articleNo := StrToIntDef(Trim(ExtractWord(1, s, [#9])), 0);
        subject := DecodeField(Trim(ExtractWord(2, s, [#9])), 'iso-8859-1');
        from := DecodeEmail(Trim(ExtractWord(3, s, [#9])), 'iso-8859-1');
        articleDate := Trim(ExtractWord(4, s, [#9]));
        messageId := Trim(ExtractWord(5, s, [#9]));
        refs.Text := StringReplace(Trim(ExtractWord(6, s, [#9])), #32, #13#10, [rfReplaceAll]);
        size := StrToIntDef(Trim(ExtractWord(7, s, [#9])), 0);
        lines := StrToIntDef(Trim(ExtractWord(8, s, [#9])), 0);
      end else
      begin
        articleNo := 0;
        subject := '';
        from := '';
        articleDate := '';
        messageId := '';
        refs.Clear();
        size := 0;
        lines := 0;
      end;
      DoGroupOverview(articleNo, subject, from, articleDate,
        messageId, refs, size, lines, s);
    end;
  finally
    refs.Free();
  end;
end;

procedure TclCustomNntp.DoGroupOverview(ArticleNo: Integer;
  const ASubject, AFrom, ADate, AMessageId: string; AReferences: TStrings;
  ASize, ALines: Integer; const AllHeaders: string);
begin
  if Assigned(OnGroupOverview) then
  begin
    OnGroupOverview(Self, ArticleNo, ASubject, AFrom, ADate, AMessageId, AReferences,
      ASize, ALines, AllHeaders);
  end;
end;

procedure TclCustomNntp.StartTls;
begin
  SendCommandSync('STARTTLS', [382]);
  inherited StartTls();
end;

function TclCustomNntp.GetDefaultPort: Integer;
begin
  Result := cDefaultNntpPort;
end;

procedure TclCustomNntp.SetNewsAgent(const Value: string);
begin
  if (FNewsAgent <> Value) then
  begin
    FNewsAgent := Value;
    Changed();
  end;
end;

{ TclNewsGroupInfo }

procedure TclNewsGroupInfo.Clear;
begin
  FLastArticle := 0;
  FFirstArticle := 0;
  FArticleCount := 0;
  FGroupName := '';
  FAllowPost := True;
end;

constructor TclNewsGroupInfo.Create;
begin
  inherited Create();
  Clear();
end;

end.

