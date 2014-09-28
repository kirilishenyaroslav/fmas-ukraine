{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clHttpMail;

interface

{$I clVer.inc}

uses
  SysUtils, Classes, clMailMessage, clHttp, clWebDav, clHttpRequest, clCookies, clTcpClient, clSocket;

type
  EclHttpMailError = class(EclWebDavError);

  TclHttpMailMessageItem = class(TCollectionItem)
  private
    FHref: string;
    FResponse: string;
    FIsRead: Boolean;
    FContentLength: Integer;
    FSubject: string;
    FDate: string;
    FFrom: string;
  public
    property Href: string read FHref;
    property Response: string read FResponse;
    property IsRead: Boolean read FIsRead;
    property From: string read FFrom;
    property Subject: string read FSubject;
    property Date: string read FDate;
    property ContentLength: Integer read FContentLength;
  end;

  TclHttpMailMessageList = class(TCollection)
  private
    function GetItem(Index: Integer): TclHttpMailMessageItem;
    procedure SetItem(Index: Integer; const Value: TclHttpMailMessageItem);
  public
    function Add: TclHttpMailMessageItem;
    property Items[Index: Integer]: TclHttpMailMessageItem read GetItem write SetItem; default;
  end;

  TclHttpMail = class(TComponent)
  private
    FServer: string;
    FInbox: string;
    FMessages: TclHttpMailMessageList;
    FWebDav: TclWebDav;
    FRequest: TclHttpRequest;
    FResponse: TStrings;
    FSentItems: string;
    FDeletedItems: string;
    FDrafts: string;
    FSendMsgUrl: string;
    FActive: Boolean;
    FHeaderFields: TStrings;
    FOnProgress: TclSocketProgressEvent;
    FOnClose: TNotifyEvent;
    FOnChanged: TNotifyEvent;
    FOnOpen: TNotifyEvent;
    procedure SendRequest(const AMethod, AUrl: string;
      ASendProgress: TclSocketProgressEvent; AReceiveProgress: TclSocketProgressEvent);
    procedure FillFolderInfo(const AXml: string);
    procedure FillMessageInfo(const AXml: string);
    procedure FillDefaultHeaderFields;
    procedure AddMailHeader(AMessage: TclMailMessage; ASource: TStrings);
    procedure RemoveBcc(AMailData: TStrings);
    procedure SetReadStatus(const AMessageUrl: string; IsRead: Boolean);
    function GetMessageID(const AMessageUrl: string): string;
    function GetMailAgent: string;
    function GetPassword: string;
    function GetUserName: string;
    procedure SetMailAgent(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetServer(const Value: string);
    procedure DoMessageProgress(Sender: TObject; ABytesProceed, ATotalBytes: Integer);
    procedure OpenConnection;
    procedure CloseConnection;
  protected
    procedure Changed; dynamic;
    procedure DoOpen; dynamic;
    procedure DoClose; dynamic;
    procedure DoProgress(ABytesProceed, ATotalBytes: Integer); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Close;
    procedure GetFolders;
    procedure SelectFolder(const AFolder: string);
    procedure Send(AMessage: TclMailMessage);
    procedure Retrieve(const AMessageUrl: string; AMessage: TclMailMessage);
    procedure Delete(const AMessageUrl: string);
    procedure Move(const AMessageUrl, ADestination: string);
    procedure MarkAsRead(const AMessageUrl: string);
    procedure MarkAsUnread(const AMessageUrl: string);
    property Active: Boolean read FActive;
    property Inbox: string read FInbox;
    property SentItems: string read FSentItems;
    property DeletedItems: string read FDeletedItems;
    property Drafts: string read FDrafts;
    property Messages: TclHttpMailMessageList read FMessages;
    property Response: TStrings read FResponse;
  published
    property Server: string read FServer write SetServer;
    property UserName: string read GetUserName write SetUserName;
    property Password: string read GetPassword write SetPassword;
    property MailAgent: string read GetMailAgent write SetMailAgent;

    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property OnOpen: TNotifyEvent read FOnOpen write FOnOpen;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnProgress: TclSocketProgressEvent read FOnProgress write FOnProgress;
  end;

resourcestring
   cConnectionOpened = 'The connection is already opened';
   cInvalidArgument = 'Invalid argument';
   cBadResponse = 'Bad server response';

implementation

uses
  clUtils{$IFDEF DEMO}, Windows, Forms, clEncoder, clCert, clHtmlParser{$ENDIF}
  {$IFDEF DELPHI6}, msxml {$ELSE}, msxml_tlb{$ENDIF};

{ TclHttpMail }

constructor TclHttpMail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMessages := TclHttpMailMessageList.Create(TclHttpMailMessageItem);
  FWebDav := TclWebDav.Create(nil);
  FRequest := TclHttpRequest.Create(nil);
  FResponse := TStringList.Create();
  FHeaderFields := TStringList.Create();
  FillDefaultHeaderFields();
  Server := 'http://services.msn.com/svcs/hotmail/httpmail.asp';
end;

procedure TclHttpMail.FillDefaultHeaderFields;
begin
  FHeaderFields.Add('hasattachment');
  FHeaderFields.Add('to');
  FHeaderFields.Add('from');
  FHeaderFields.Add('subject');
  FHeaderFields.Add('date');
end;

procedure TclHttpMail.Delete(const AMessageUrl: string);
begin
  Move(AMessageUrl, DeletedItems);
end;

function TclHttpMail.GetMessageID(const AMessageUrl: string): string;
var
  ind: Integer;
begin
  ind := LastDelimiter('/', AMessageUrl);
  if (ind = 0) then
  begin
    raise EclHttpMailError.Create(cInvalidArgument, -1, '');
  end;

  Result := system.Copy(AMessageUrl, ind + 1, MaxInt);
end;

procedure TclHttpMail.Move(const AMessageUrl, ADestination: string);
var
  dest: string;
begin
  OpenConnection();
  try
    if (ADestination = '') then
    begin
      raise EclHttpMailError.Create(cInvalidArgument, -1, '');
    end;

    FRequest.Clear();
    dest := ADestination;
    if (dest[Length(dest)] <> '/') then
    begin
      dest := dest + '/';
    end;
    FRequest.Header.ExtraFields.Add('Destination: ' + dest + GetMessageID(AMessageUrl));

    SendRequest('MOVE', AMessageUrl, nil, nil);
  finally
    CloseConnection();
  end;
end;

destructor TclHttpMail.Destroy;
begin
  FHeaderFields.Free();
  FResponse.Free();
  FRequest.Free();
  FWebDav.Free();
  FMessages.Free();
  inherited Destroy();
end;

function TclHttpMail.GetMailAgent: string;
begin
  Result := FWebDav.UserAgent;
end;

procedure TclHttpMail.FillFolderInfo(const AXml: string);
  function GetNodeValue(const ADom: IXMLDomDocument; const AName: string): string;
  var
    node: IXMLDomNode;
  begin
    node := ADom.selectSingleNode('//' + AName);
    if node = nil then
    begin
      raise EclHttpMailError.Create(cBadResponse, -1, '');
    end;
    Result := string(node.text);
  end;

var
  Dom: IXMLDomDocument;
begin
  Dom := CoDOMDocument.Create();
  Dom.loadXML(AXml);

  FInbox := GetNodeValue(Dom, 'hm:inbox');
  FSentItems := GetNodeValue(Dom, 'hm:sentitems');
  FDeletedItems := GetNodeValue(Dom, 'hm:deleteditems');
  FDrafts := GetNodeValue(Dom, 'hm:drafts');
  FSendMsgUrl := GetNodeValue(Dom, 'hm:sendmsg');
end;

procedure TclHttpMail.Retrieve(const AMessageUrl: string; AMessage: TclMailMessage);
begin
  OpenConnection();
  try
    FRequest.Clear();
    FRequest.Header.Accept := 'message/rfc822, */*';

    SendRequest('GET', AMessageUrl, nil, DoMessageProgress);

    if (AMessage <> nil) then
    begin
      AMessage.MessageSource := FResponse;
    end;
  finally
    CloseConnection();
  end;
end;

procedure TclHttpMail.SelectFolder(const AFolder: string);
var
  i: Integer;
  xml: string;
begin
  OpenConnection();
  try
    FRequest.Clear();

    xml :=
      '<?xml version="1.0"?>'#13#10 +
      '<D:propfind xmlns:D="DAV:" xmlns:hm="urn:schemas:httpmail:" xmlns:m="urn:schemas:mailheader:">'#13#10 +
      '  <D:prop>'#13#10 +
      '    <D:isfolder/>'#13#10 +
      '    <hm:read/>'#13#10;

    for i := 0 to FHeaderFields.Count - 1 do
    begin
      xml := xml + '<m:' + FHeaderFields[i] + '/>'#13#10;
    end;

    xml := xml +
      '    <D:getcontentlength/>'#13#10 +
      '  </D:prop>'#13#10 +
      '</D:propfind>';
  
    FRequest.AddTextData(xml);
    FRequest.Header.ContentType := 'text/xml';

    SendRequest('PROPFIND', AFolder, nil, DoMessageProgress);

    FillMessageInfo(FResponse.Text);
  finally
    CloseConnection();
  end;
end;

procedure TclHttpMail.AddMailHeader(AMessage: TclMailMessage; ASource: TStrings);
var
  i: Integer;
  name, mail: string;
  rcpt: TStrings;
begin
  GetEmailAddressParts(AMessage.From, name, mail);
  ASource.Add('MAIL FROM:<' + mail + '>');

  rcpt := TStringList.Create();
  try
    rcpt.Assign(AMessage.ToList);
    rcpt.AddStrings(AMessage.CCList);
    rcpt.AddStrings(AMessage.BCCList);
    for i := 0 to rcpt.Count - 1 do
    begin
      GetEmailAddressParts(rcpt[i], name, mail);
      ASource.Add('RCPT TO:<' + mail + '>');
    end;
  finally
    rcpt.Free();
  end;
end;

procedure TclHttpMail.RemoveBcc(AMailData: TStrings);
var
  FieldList: TStrings;
begin
  FieldList := TStringList.Create();
  try
    GetHeaderFieldList(0, AMailData, FieldList);
    RemoveHeaderField(AMailData, FieldList, 'bcc');
  finally
    FieldList.Free();
  end;
end;

procedure TclHttpMail.Send(AMessage: TclMailMessage);
var
  msg: TStrings;
begin
  if (FSendMsgUrl = '') then
  begin
    GetFolders();
  end;

  OpenConnection();
  msg := nil;
  try
    msg := TStringList.Create();

    AddMailHeader(AMessage, msg);
    msg.Add('');
    msg.AddStrings(AMessage.MessageSource);
    RemoveBcc(msg);

    FRequest.Clear();
    FRequest.AddTextData(msg.Text);
    FRequest.Header.ContentType := 'message/rfc821';

    SendRequest('POST', FSendMsgUrl, DoMessageProgress, nil);
  finally
    msg.Free();
    CloseConnection();
  end;
end;

procedure TclHttpMail.SendRequest(const AMethod, AUrl: string;
  ASendProgress: TclSocketProgressEvent; AReceiveProgress: TclSocketProgressEvent);
var
  respHdr: TStrings;
  respBody: TStream;
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
    if (not IsHttpDemoDisplayed) and (not IsHttpRequestDemoDisplayed)
      and (not IsEncoderDemoDisplayed) and (not IsCertDemoDisplayed)
      and (not IsHtmlDemoDisplayed) and (not IsMailMessageDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpDemoDisplayed := True;
    IsHttpRequestDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
    IsCertDemoDisplayed := True;
    IsHtmlDemoDisplayed := True;
    IsMailMessageDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  respHdr := nil;
  respBody := nil;
  try
    respHdr := TStringList.Create();
    respBody := TMemoryStream.Create();

    FWebDav.OnSendProgress := ASendProgress;
    FWebDav.OnReceiveProgress := AReceiveProgress;
    FWebDav.SendRequest(AMethod, AUrl, FRequest, respHdr, respBody);
    FWebDav.Close();

    respBody.Position := 0;
    FResponse.LoadFromStream(respBody);
  finally
    FWebDav.OnSendProgress := nil;
    FWebDav.OnReceiveProgress := nil;
    respBody.Free();
    respHdr.Free();
  end;
end;

procedure TclHttpMail.SetMailAgent(const Value: string);
begin
  if (FWebDav.UserAgent <> Value) then
  begin
    FWebDav.UserAgent := Value;
    Changed();
  end;
end;

procedure TclHttpMail.FillMessageInfo(const AXml: string);
  function GetNodeValue(const ARoot: IXMLDomNode; const AName: string): string;
  var
    node: IXMLDomNode;
  begin
    node := ARoot.selectSingleNode(AName);
    if node = nil then
    begin
      raise EclHttpMailError.Create(cBadResponse, -1, '');
    end;
    Result := string(node.text);
  end;
  
var
  Dom: IXMLDomDocument;
  list: IXMLDomNodeList;
  node: IXMLDomNode;
  item: TclHttpMailMessageItem;
begin
  Dom := CoDOMDocument.Create();
  Dom.loadXML(AXml);

  FMessages.Clear();

  list := Dom.selectNodes('//D:response');
  if (list <> nil) then
  begin
    node := list.nextNode();
    while (node <> nil) do
    begin
      item := FMessages.Add();
      item.FHref := GetNodeValue(node, 'D:href');
      item.FResponse := string(node.xml);
      item.FIsRead := (Trim(GetNodeValue(node, 'D:propstat/D:prop/hm:read')) <> '0');
      item.FFrom := GetNodeValue(node, 'D:propstat/D:prop/m:from');
      item.FSubject := GetNodeValue(node, 'D:propstat/D:prop/m:subject');
      item.FDate := GetNodeValue(node, 'D:propstat/D:prop/m:date');
      item.FContentLength := StrToIntDef(GetNodeValue(node, 'D:propstat/D:prop/D:getcontentlength'), 0);
      node := list.nextNode();
    end;
  end;
end;

procedure TclHttpMail.MarkAsRead(const AMessageUrl: string);
begin
  SetReadStatus(AMessageUrl, True);
end;

procedure TclHttpMail.MarkAsUnread(const AMessageUrl: string);
begin
  SetReadStatus(AMessageUrl, False);
end;

procedure TclHttpMail.SetReadStatus(const AMessageUrl: string; IsRead: Boolean);
const
  status: array[Boolean] of Integer = (0, 1);
  xml =
'<?xml version="1.0"?>'#13#10 +
'<D:propertyupdate xmlns:D="DAV:" xmlns:hm="urn:schemas:httpmail:">'#13#10 +
'  <D:set>'#13#10 +
'    <D:prop>'#13#10 +
'      <hm:read>%d</hm:read>'#13#10 +
'    </D:prop>'#13#10 +
'  </D:set>'#13#10 +
'</D:propertyupdate>';

begin
  OpenConnection();
  try
    FRequest.Clear();
    FRequest.AddTextData(Format(xml, [status[IsRead]]));
    FRequest.Header.ContentType := 'text/xml';

    SendRequest('PROPPATCH', AMessageUrl, nil, nil);
  finally
    CloseConnection();
  end;
end;

function TclHttpMail.GetPassword: string;
begin
  Result := FWebDav.Password;
end;

function TclHttpMail.GetUserName: string;
begin
  Result := FWebDav.UserName;
end;

procedure TclHttpMail.SetPassword(const Value: string);
begin
  if (FWebDav.Password <> Value) then
  begin
    FWebDav.Password := Value;
    Changed();
  end;
end;

procedure TclHttpMail.SetUserName(const Value: string);
begin
  if (FWebDav.UserName <> Value) then
  begin
    FWebDav.UserName := Value;
    Changed();
  end;
end;

procedure TclHttpMail.Changed;
begin
  if Assigned(OnChanged) then
  begin
    OnChanged(Self);
  end;
end;

procedure TclHttpMail.DoClose;
begin
  if Assigned(OnClose) then
  begin
    OnClose(Self);
  end;
end;

procedure TclHttpMail.DoOpen;
begin
  if Assigned(OnOpen) then
  begin
    OnOpen(Self);
  end;
end;

procedure TclHttpMail.DoProgress(ABytesProceed, ATotalBytes: Integer);
begin
  if Assigned(OnProgress) then
  begin
    OnProgress(Self, ABytesProceed, ATotalBytes);
  end;
end;

procedure TclHttpMail.SetServer(const Value: string);
begin
  if (FServer <> Value) then
  begin
    FServer := Value;
    Changed();
  end;
end;

procedure TclHttpMail.DoMessageProgress(Sender: TObject; ABytesProceed, ATotalBytes: Integer);
begin
  DoProgress(ABytesProceed, ATotalBytes);
end;

procedure TclHttpMail.GetFolders;
const
  xml =
'<?xml version="1.0"?>'#13#10 +
'<D:propfind xmlns:D="DAV:" xmlns:h="http://schemas.microsoft.com/hotmail/" xmlns:hm="urn:schemas:httpmail:">'#13#10 +
'  <D:prop>'#13#10 +
'    <h:adbar/>'#13#10 +
'    <hm:contacts/>'#13#10 +
'    <hm:inbox/>'#13#10 +
'    <hm:outbox/>'#13#10 +
'    <hm:sendmsg/>'#13#10 +
'    <hm:sentitems/>'#13#10 +
'    <hm:deleteditems/>'#13#10 +
'    <hm:drafts/>'#13#10 +
'    <hm:msgfolderroot/>'#13#10 +
'    <h:maxpoll/>'#13#10 +
'    <h:sig/>'#13#10 +
'  </D:prop>'#13#10 +
'</D:propfind>';

begin
  OpenConnection();
  try
    FRequest.Clear();
    FRequest.AddTextData(xml);
    FRequest.Header.ContentType := 'text/xml';

    SendRequest('PROPFIND', Server, nil, nil);

    FillFolderInfo(FResponse.Text);
  finally
    CloseConnection();
  end;
end;

procedure TclHttpMail.CloseConnection;
begin
  FWebDav.Close();
  FActive := False;
  DoClose();
end;

procedure TclHttpMail.OpenConnection;
begin
  if Active then
  begin
    raise EclHttpMailError.Create(cConnectionOpened, -1, '');
  end;

  FActive := True;
  DoOpen();
end;

procedure TclHttpMail.Close;
begin
  FWebDav.Close();
end;

{ TclHttpMailMessageList }

function TclHttpMailMessageList.Add: TclHttpMailMessageItem;
begin
  Result := TclHttpMailMessageItem(inherited Add());
end;

function TclHttpMailMessageList.GetItem(Index: Integer): TclHttpMailMessageItem;
begin
  Result := TclHttpMailMessageItem(inherited GetItem(Index));
end;

procedure TclHttpMailMessageList.SetItem(Index: Integer; const Value: TclHttpMailMessageItem);
begin
  inherited SetItem(Index, Value);
end;

end.

