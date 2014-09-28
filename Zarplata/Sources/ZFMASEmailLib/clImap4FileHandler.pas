{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clImap4FileHandler;

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
  Classes, clTcpServer, clImap4Server, clImapUtils, clMailMessage, SyncObjs;

type
  TclImap4FileCommandConnection = class(TclImap4CommandConnection)
  private
    FMessages: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    property Messages: TStringList read FMessages;
  end;

  TclImap4LoadMessageEvent = procedure (Sender: TObject; AConnection: TclImap4CommandConnection;
    const AMailBoxPath, AMessageFile: string; var ACanLoad: Boolean) of object;

  TclImap4FileHandler = class(TComponent)
  private
    FAccessor: TCriticalSection;
    FServer: TclImap4Server;
    FMailBoxDir: string;
    FMailBoxInfoFile: string;
    FOnLoadMessage: TclImap4LoadMessageEvent;
    function GetNextCounter(AConnection: TclImap4CommandConnection): Integer;
    function GetCurrentCounter(AConnection: TclImap4CommandConnection): Integer;
    procedure SetServer(const Value: TclImap4Server);
    procedure SetMailBoxDir(const Value: string);
    procedure SetMailBoxInfoFile(const Value: string);
    procedure DoCreateConnection(Sender: TObject; var AConnection: TclCommandConnection);
    procedure DoCanAppendMessage(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult);
    procedure DoCopyMessages(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMessageSet, AMailBox: string; AUseUID: Boolean; var Result: TclImap4MailBoxResult);
    procedure DoCreateMailBox(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult);
    procedure DoDeleteMailBox(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult);
    procedure DoPurgeMessages(Sender: TObject; AConnection: TclImap4CommandConnection;
      IsSilent: Boolean; AMessageIDs: TStrings; var Result: TclImap4MessageResult);
    procedure DoFetchMessages(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMessageSet, ADataItems: string; AUseUID: Boolean; AResponse: TclImap4FetchResponseList;
      var Result: TclImap4MessageResult);
    procedure DoGetMailBoxes(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AReferenceName, ACriteria: string; AMailBoxes: TclImap4MailBoxList);
    procedure DoGetMailBoxInfo(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMailBox: string; IsSelectMailBox: Boolean; AMailBoxInfo: TclImap4MailBoxInfo;
      var Result: TclImap4MailBoxResult);
    procedure DoMessageAppended(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMailBox: string; AFlags: TclMailMessageFlags; AMessage: TStrings;
      var Result: TclImap4MailBoxResult);
    procedure DoRenameMailBox(Sender: TObject; AConnection: TclImap4CommandConnection;
      const ACurrentName, ANewName: string; var Result: TclImap4MailBoxResult);
    procedure DoSearchMessages(Sender: TObject; AConnection: TclImap4CommandConnection;
      const ASearchCriteria: string; AUseUID: Boolean; AMessageIDs: TStrings;
      var Result: TclImap4MessageResult);
    procedure DoStoreMessages(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMessageSet: string; AFlagsMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags;
      IsSilent: Boolean; AUseUID: Boolean; AResponse: TclImap4FetchResponseList;
      var Result: TclImap4MessageResult);
    procedure DoSubscribeMailBox(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult);
    procedure DoUnsubscribeMailBox(Sender: TObject; AConnection: TclImap4CommandConnection;
      const AMailBox: string; var Result: TclImap4MailBoxResult);
    function GetMailBoxPath(const AUserName: string): string;
    function GetIsSubscribed(const AMailBoxPath: string): Boolean;
    procedure SetIsSubscribed(const AMailBoxPath: string; AIsSubscribed: Boolean);
    function GetMessageFlags(AConnection: TclImap4CommandConnection;
      const AMailBoxPath, AMessageFile: string): string;
    function SetMessageFlags(AConnection: TclImap4CommandConnection;
      const AMailBoxPath, AMessageFile: string; AFlagsMethod: TclSetFlagsMethod;
      ANewFlags: TclMailMessageFlags): string;
    function MailBoxToPath(const AMailBox: string): string;
    procedure InternalSubscribeMailBox(AConnection: TclImap4CommandConnection;
      const AMailBox: string; AIsSubscribed: Boolean; var Result: TclImap4MailBoxResult);
    function GetFileTimeStamp(const AFileName: string): Integer;
    procedure FillMessageList(AConnection: TclImap4CommandConnection;
      const AMailBoxPath: string; AList: TStrings);
    procedure UpdateMailBoxInfo(AConnection: TclImap4CommandConnection; const AMailBoxPath: string;
      AMessageList: TStringList; IsSelectMailBox: Boolean;
      var ARecentCount, AUnseenMessages, AFirstUnseen: Integer);
    function BuildMessageInfo(const AUid: string;
      AFlags: TclMailMessageFlags): string;
    procedure ParseMessageInfo(const ASource: string; var AUid: string;
      var AFlags: TclMailMessageFlags);
    function GetMessageList(AConnection: TclImap4CommandConnection): TStringList;
    function GetMessageUID(AConnection: TclImap4CommandConnection;
      const AMessageFile: string): string;
    function GetMsgFileByUID(AList: TStrings; AUID: Integer): string;
    procedure SearchAllMessages(AConnection: TclImap4CommandConnection;
      AUseUID: Boolean; AMessageIDs: TStrings);
    procedure SearchMessages(AConnection: TclImap4CommandConnection;
      const AKey, AParam: string; AUseUID: Boolean; AMessageIDs: TStrings);
    procedure FillTargetList(AConnection: TclImap4CommandConnection;
      const AMessageSet: string; AUseUID: Boolean; ATargetList: TStrings);
    function GenMessageFileName(AConnection: TclImap4CommandConnection): string;
    procedure FetchMessage(AConnection: TclImap4CommandConnection;
      const AMessageFile: string; ARequest: TclImap4FetchRequestList;
      AUseUID: Boolean; AResponseItem: TclImap4FetchResponseItem);
    function GetLocalFileSize(const AFileName: string): Integer;
    procedure FetchHeader(const AMessagePath, ACommand, AParams: string; AResponseItem: TclImap4FetchResponseItem);
    procedure FetchHeaderFields(const AMessagePath, ACommand, AParams: string; AResponseItem: TclImap4FetchResponseItem);
    procedure FetchBodyText(const AMessagePath, ACommand, AParams: string; AResponseItem: TclImap4FetchResponseItem);
    procedure FetchBody(const AMessagePath, ACommand, AParams: string; AResponseItem: TclImap4FetchResponseItem);
    function FetchMessageEnvelope(const AMessagePath: string): string;
    function FetchBodyStructure(const AMessagePath: string): string;
    procedure ParseHeaderFieldParams(const ASource: string;
      AFields: TStrings);
    function GetMessageInternalDate(const AMessagePath: string): TDateTime;
    function DateTimeToImapTime(ADateTime: TDateTime): string;
    function GetMimeBodyStructure(ABodies: TclMessageBodies): string;
    procedure ExtractContentTypeParts(const AContentType: string; var AType, ASubType: string);
    function GetMimeBodySize(ABody: TclMessageBody): string;
    procedure GetUueBodySize(AMessage: TStrings; var ASize,
      ALines: Integer);
    procedure RefreshMailBoxInfo(AConnection: TclImap4CommandConnection);
    function GetMailBoxInfo(AConnection: TclImap4CommandConnection;
      const AMailBox: string; IsSelectMailBox: Boolean;
      AMailBoxInfo: TclImap4MailBoxInfo; AMessageList: TStringList): TclImap4MailBoxResult;
    procedure GetBodyIDs(const AParams: string; var ABodyIDs: array of Integer);
    function GetBodyByIndex(var ABodyIDs: array of Integer;
      AIndex: Integer; ABodies: TclMessageBodies): TclMessageBody;
  protected
    function GetMessageEnvelope(AMessage: TStrings): string; virtual;
    function GetBodyStructure(AMessage: TStrings): string; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CleanEventHandlers; virtual;
    procedure InitEventHandlers; virtual;
    procedure DoLoadMessage(AConnection: TclImap4CommandConnection;
      const AMailBoxPath, AMessageFile: string; var ACanLoad: Boolean); virtual;
    property Accessor: TCriticalSection read FAccessor;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Server: TclImap4Server read FServer write SetServer;
    property MailBoxDir: string read FMailBoxDir write SetMailBoxDir;
    property MailBoxInfoFile: string read FMailBoxInfoFile write SetMailBoxInfoFile;
    property OnLoadMessage: TclImap4LoadMessageEvent read FOnLoadMessage write FOnLoadMessage;
  end;

const
  cMailBoxSection = 'MAILBOXINFO';
  cMessagesSection = 'MESSAGES';

implementation

uses
  Windows, SysUtils, clUtils, IniFiles, clEncoder, clPCRE;

type
  TclMessageBodyIDs = array[0..9] of Integer;

{ TclImap4FileHandler }

procedure TclImap4FileHandler.CleanEventHandlers;
begin
  Server.OnCreateConnection := nil;
  Server.OnGetMailBoxes := nil;
  Server.OnCreateMailBox := nil;
  Server.OnDeleteMailBox := nil;
  Server.OnRenameMailBox := nil;
  Server.OnSubscribeMailBox := nil;
  Server.OnUnsubscribeMailBox := nil;
  Server.OnGetMailBoxInfo := nil;
  Server.OnSearchMessages := nil;
  Server.OnCopyMessages := nil;
  Server.OnFetchMessages := nil;
  Server.OnStoreMessages := nil;
  Server.OnPurgeMessages := nil;
  Server.OnCanAppendMessage := nil;
  Server.OnMessageAppended := nil;
end;

constructor TclImap4FileHandler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAccessor := TCriticalSection.Create();
  FMailBoxInfoFile := cImapMailBoxInfoFile;
end;

destructor TclImap4FileHandler.Destroy;
begin
  FAccessor.Free();
  inherited Destroy();
end;

procedure TclImap4FileHandler.InitEventHandlers;
begin
  Server.OnCreateConnection := DoCreateConnection;
  Server.OnGetMailBoxes := DoGetMailBoxes;
  Server.OnCreateMailBox := DoCreateMailBox;
  Server.OnDeleteMailBox := DoDeleteMailBox;
  Server.OnRenameMailBox := DoRenameMailBox;
  Server.OnSubscribeMailBox := DoSubscribeMailBox;
  Server.OnUnsubscribeMailBox := DoUnsubscribeMailBox;
  Server.OnGetMailBoxInfo := DoGetMailBoxInfo;
  Server.OnSearchMessages := DoSearchMessages;
  Server.OnCopyMessages := DoCopyMessages;
  Server.OnFetchMessages := DoFetchMessages;
  Server.OnStoreMessages := DoStoreMessages;
  Server.OnPurgeMessages := DoPurgeMessages;
  Server.OnCanAppendMessage := DoCanAppendMessage;
  Server.OnMessageAppended := DoMessageAppended;
end;

procedure TclImap4FileHandler.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation <> opRemove) then Exit;
  if (AComponent = FServer) then
  begin
    CleanEventHandlers();
    FServer := nil;
  end;
end;

procedure TclImap4FileHandler.SetServer(const Value: TclImap4Server);
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

function TclImap4FileHandler.GetMailBoxPath(const AUserName: string): string;
begin
  Result := AddTrailingBackSlash(MailBoxDir) + AddTrailingBackSlash(AUserName);
end;

function TclImap4FileHandler.GetIsSubscribed(const AMailBoxPath: string): Boolean;
var
  ini: TIniFile;
begin
  Result := FileExists(AMailBoxPath + MailBoxInfoFile);
  if not Result then Exit;

  ini := TIniFile.Create(AMailBoxPath + MailBoxInfoFile);
  try
    Result := ini.ReadBool(cMailBoxSection, 'Subscribed', False);
  finally
    ini.Free();
  end;
end;

procedure TclImap4FileHandler.SetIsSubscribed(const AMailBoxPath: string; AIsSubscribed: Boolean);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(AMailBoxPath + MailBoxInfoFile);
  try
    ini.WriteBool(cMailBoxSection, 'Subscribed', AIsSubscribed);
  finally
    ini.Free();
  end;
end;

function TclImap4FileHandler.MailBoxToPath(const AMailBox: string): string;
begin
  if SameText('INBOX', AMailBox) then
  begin
    Result := '';
  end else
  begin
    Result := StringReplace(AMailBox, Server.MailBoxSeparator, '\', [rfReplaceAll]);
  end;
end;

procedure TclImap4FileHandler.DoGetMailBoxes(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AReferenceName, ACriteria: string;
  AMailBoxes: TclImap4MailBoxList);
  
  procedure CollectMailboxes(const ARegEx, APath, ABase: string);
  var
    sr: TSearchRec;
    found: string;
    item: TclImap4MailBoxItem;
  begin
    if SysUtils.FindFirst(APath + '*.*', faDirectory, sr) = 0 then
    begin
      repeat
        if ((sr.Attr and faDirectory) <> 0) and (sr.Name <> '.') and (sr.Name <> '..') then
        begin
          found := ABase + sr.Name;
          if not SameText(found, 'INBOX') then
          begin
            if RE_Match(found, ARegEx, PCRE_CASELESS) then
            begin
              item := AMailBoxes.Add();
              item.Name := StringReplace(found, '\', Server.MailBoxSeparator, [rfReplaceAll]);
              item.IsSubscribed := GetIsSubscribed(APath + sr.Name + '\');
            end;
            CollectMailboxes(ARegEx, APath + sr.Name + '\', found + Server.MailBoxSeparator);
          end else
          begin
            CollectMailboxes(ARegEx, APath + 'INBOX' + '\', 'INBOX' + Server.MailBoxSeparator);
          end;
        end;
      until SysUtils.FindNext(sr) <> 0;
      SysUtils.FindClose(sr);
    end;
  end;
  
var
  i: Integer;
  pattern, regEx: string;
  item: TclImap4MailBoxItem;
begin
  pattern := AReferenceName + ACriteria;
  regEx := '^';
  for i := 1 to Length(pattern) do
  begin
    case pattern[i] of
      '*' : regEx := regEx + '.*';
      '%' : regEx := regEx + '[^' + Server.MailBoxSeparator + ']*';
      '+', '-', '.', '$', '(', ')': regEx := regEx + '\' + pattern[i];
      else regEx := regEx + pattern[i];
    end;
  end;
  regEx := regEx + '$';

  if RE_Match('INBOX', regEx, PCRE_CASELESS) then
  begin
    item := AMailBoxes.Add();
    item.Name := 'INBOX';
    item.IsSubscribed := GetIsSubscribed(GetMailBoxPath(AConnection.UserName));
  end;

  CollectMailboxes(regEx, GetMailBoxPath(AConnection.UserName), '');
end;

procedure TclImap4FileHandler.DoCreateMailBox(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AMailBox: string; var Result: TclImap4MailBoxResult);
var
  path: string;
begin
  if SameText('INBOX', AMailBox) then
  begin
    Result := mrAccessDenied;
    Exit;
  end;
  
  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AMailBox));

  if DirectoryExists(path) then
  begin
    Result := mrAlreadyExists;
  end else
  if ForceFileDirectories(path) then
  begin
    Result := mrSuccess;
  end else
  begin
    Result := mrAccessDenied;
  end;
end;

procedure TclImap4FileHandler.DoDeleteMailBox(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AMailBox: string; var Result: TclImap4MailBoxResult);
var
  path: string;
begin
  if SameText('INBOX', AMailBox) then
  begin
    Result := mrAccessDenied;
    Exit;
  end;

  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AMailBox));

  if DirectoryExists(path) then
  begin
    if DeleteRecursiveDir(path) then
    begin
      Result := mrSuccess;
    end else
    begin
      Result := mrAccessDenied;
    end;
  end else
  begin
    Result := mrNotFound;
  end;
end;

procedure TclImap4FileHandler.DoRenameMailBox(Sender: TObject; AConnection: TclImap4CommandConnection;
  const ACurrentName, ANewName: string; var Result: TclImap4MailBoxResult);
var
  curName, newName: string;
begin
  if SameText('INBOX', ACurrentName) or SameText('INBOX', ANewName) then
  begin
    Result := mrAccessDenied;
    Exit;
  end;

  curName := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(ACurrentName));
  newName := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(ANewName));

  if DirectoryExists(curName) then
  begin
    if not DirectoryExists(newName) then
    begin
      if RenameFile(curName, newName) then
      begin
        Result := mrSuccess;
      end else
      begin
        Result := mrAccessDenied;
      end;
    end else
    begin
      Result := mrAlreadyExists;
    end;
  end else
  begin
    Result := mrNotFound;
  end;
end;

procedure TclImap4FileHandler.InternalSubscribeMailBox(AConnection: TclImap4CommandConnection;
  const AMailBox: string; AIsSubscribed: Boolean; var Result: TclImap4MailBoxResult);
var
  path: string;
begin
  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AMailBox));

  if DirectoryExists(path) then
  begin
    try
      SetIsSubscribed(path, AIsSubscribed);
      Result := mrSuccess;
    except
      Result := mrAccessDenied;
    end;
  end else
  begin
    Result := mrNotFound;
  end;
end;

procedure TclImap4FileHandler.DoSubscribeMailBox(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AMailBox: string; var Result: TclImap4MailBoxResult);
begin
  InternalSubscribeMailBox(AConnection, AMailBox, True, Result);
end;

procedure TclImap4FileHandler.DoUnsubscribeMailBox(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AMailBox: string; var Result: TclImap4MailBoxResult);
begin
  InternalSubscribeMailBox(AConnection, AMailBox, False, Result);
end;

function TclImap4FileHandler.GetFileTimeStamp(const AFileName: string): Integer;
var
  Handle: THandle;
  FindData: TWin32FindData;
  pTime: TFileTime;
  s: string;
begin
  s := AFileName;
  if (s <> '') and (s[Length(s)] = '\') then
  begin
    SetLength(s, Length(s) - 1);
  end;
  Handle := FindFirstFile(PChar(s), FindData);
  if Handle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(Handle);
    FileTimeToLocalFileTime(FindData.ftLastWriteTime, pTime);
    if FileTimeToDosDateTime(pTime, LongRec(Result).Hi, LongRec(Result).Lo) then
    begin
      Exit;
    end;
  end;
  Result := 0;
end;

function TclImap4FileHandler.GetMessageInternalDate(const AMessagePath: string): TDateTime;
var
  Handle: THandle;
  FindData: TWin32FindData;
  s: string;
begin
  Result := 0;
  s := AMessagePath;
  if (s <> '') and (s[Length(s)] = '\') then
  begin
    SetLength(s, Length(s) - 1);
  end;
  Handle := FindFirstFile(PChar(s), FindData);
  if Handle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(Handle);
    Result := ConvertFileTimeToDateTime(FindData.ftLastWriteTime);
  end;
end;

function TclImap4FileHandler.GetMessageEnvelope(AMessage: TStrings): string;

  function Normalize(const ASource: string): string;
  begin
    if (ASource = '') then
    begin
      Result := 'NIL';
    end else
    begin
      Result := '"' + ASource + '"';
    end;
  end;

  function GetField(ASource, AFieldList: TStrings; const AName: string): string;
  begin
    Result := GetHeaderFieldValue(ASource, AFieldList, AName);
    Result := Normalize(Result);
  end;

  function GetMBName(const AEmail: string): string;
  var
    ind: Integer;
  begin
    Result := '';
    ind := system.Pos('@', AEmail);
    if (ind > 0) then
    begin
      Result := system.Copy(AEmail, 1, ind - 1);
    end;
  end;

  function GetDName(const AEmail: string): string;
  var
    ind: Integer;
  begin
    Result := AEmail;
    ind := system.Pos('@', AEmail);
    if (ind > 0) then
    begin
      Result := system.Copy(AEmail, ind + 1, Length(AEmail));
    end;
  end;

  function GetMails(ASource, AFieldList: TStrings; const AName: string): string;
  var
    i: Integer;
    list: TStrings;
    name, email: string;
  begin
    Result := '';

    list := TStringList.Create();
    try
      list.Text := StringReplace(GetHeaderFieldValue(ASource, AFieldList, AName), ',', #13#10, [rfReplaceAll]);

      for i := 0 to list.Count - 1 do
      begin
        GetEmailAddressParts(list[i], name, email);
        Result := Result + '(' + Normalize(name) + #32'NIL'#32 + Normalize(GetMBName(email)) + #32
           + Normalize(GetDName(email)) + ')';
      end;
    finally
      list.Free();
    end;

    if (Result = '') then
    begin
      Result := 'NIL';
    end else
    begin
      Result := '(' + Result + ')';
    end;
  end;
  
var
  fieldList: TStrings;
  from, sender: string;
begin
  fieldList := nil;
  try
    fieldList := TStringList.Create();
    GetHeaderFieldList(0, AMessage, fieldList);

    Result := Result + GetField(AMessage, fieldList, 'Date') + #32;
    Result := Result + GetField(AMessage, fieldList, 'Subject') + #32;

    from := GetMails(AMessage, fieldList, 'From');
    Result := Result + from + #32;

    sender := GetMails(AMessage, fieldList, 'Sender');
    if (sender = 'NIL') then
    begin
      sender := from;
    end;
    Result := Result + sender + #32;

    Result := Result + GetMails(AMessage, fieldList, 'Reply-To') + #32;
    Result := Result + GetMails(AMessage, fieldList, 'To') + #32;
    Result := Result + GetMails(AMessage, fieldList, 'Cc') + #32;
    Result := Result + GetMails(AMessage, fieldList, 'Bcc') + #32;
    Result := Result + 'NIL'#32;
    Result := Result + GetField(AMessage, fieldList, 'Message-ID');
  finally
    fieldList.Free();
  end;
end;

procedure TclImap4FileHandler.DoLoadMessage(AConnection: TclImap4CommandConnection;
  const AMailBoxPath, AMessageFile: string; var ACanLoad: Boolean);
begin
  if Assigned(OnLoadMessage) then
  begin
    OnLoadMessage(Self, AConnection, AMailBoxPath, AMessageFile, ACanLoad);
  end;
end;

procedure TclImap4FileHandler.FillMessageList(AConnection: TclImap4CommandConnection;
  const AMailBoxPath: string; AList: TStrings);
var
  searchRec: TSearchRec;
  canLoad: Boolean;
begin
  AList.Clear();
  if SysUtils.FindFirst(AMailBoxPath + '*.*', 0, searchRec) = 0 then
  begin
    repeat
      canLoad := not SameText(MailBoxInfoFile, searchRec.Name);
      DoLoadMessage(AConnection, AMailBoxPath, searchRec.Name, canLoad);

      if canLoad then
      begin
        AList.Add(searchRec.Name);
      end;
    until (SysUtils.FindNext(searchRec) <> 0);
    SysUtils.FindClose(searchRec);
  end;
end;

procedure TclImap4FileHandler.ParseMessageInfo(const ASource: string; var AUid: string;
  var AFlags: TclMailMessageFlags);
var
  ind: Integer;
  s: string;
begin
  ind := system.Pos(':', ASource);

  if (ind > 0) then
  begin
    AUid := Trim(system.Copy(ASource, 1, ind - 1));
    s := Trim(system.Copy(ASource, ind + 1, MaxInt));
  end;
  AFlags := GetImapMessageFlagsByStr(UpperCase(s));
end;

function TclImap4FileHandler.BuildMessageInfo(const AUid: string; AFlags: TclMailMessageFlags): string;
begin
  Result := AUid + ':' + GetStrByImapMessageFlags(AFlags);
end;

function CompareMessageUIDs(List: TStringList; Index1, Index2: Integer): Integer;
var
  uid1, uid2: Integer;
begin
  uid1 := Integer(List.Objects[Index1]);
  uid2 := Integer(List.Objects[Index2]);

  if (uid1 < uid2) then
  begin
    Result := -1;
  end else
  if (uid1 > uid2) then
  begin
    Result := 1;
  end else
  begin
    Result := 0;
  end;
end;

procedure TclImap4FileHandler.UpdateMailBoxInfo(AConnection: TclImap4CommandConnection;
  const AMailBoxPath: string; AMessageList: TStringList; IsSelectMailBox: Boolean;
  var ARecentCount, AUnseenMessages, AFirstUnseen: Integer);
var
  i: Integer;
  ini: TIniFile;
  list: TStrings;
  uid: string;
  flags: TclMailMessageFlags;
begin
  FAccessor.Enter();
  try
    ARecentCount := 0;
    AUnseenMessages := 0;
    AFirstUnseen := 0;

    ini := nil;
    list := nil;
    try
      ini := TIniFile.Create(AMailBoxPath + MailBoxInfoFile);
      list := TStringList.Create();

      ini.ReadSection(cMessagesSection, list);

      for i := 0 to list.Count - 1 do
      begin
        if (AMessageList.IndexOf(list[i]) < 0) then
        begin
          ini.DeleteKey(cMessagesSection, list[i]);
        end;
      end;

      for i := 0 to AMessageList.Count - 1 do
      begin
        uid := '';
        flags := [];
        ParseMessageInfo(ini.ReadString(cMessagesSection, AMessageList[i], ''), uid, flags);
        if (uid = '') then
        begin
          uid := IntToStr(GetNextCounter(AConnection));
          flags := flags + [mfRecent];
        end else
        if IsSelectMailBox then
        begin
          flags := flags - [mfRecent];
        end;
        ini.WriteString(cMessagesSection, AMessageList[i], BuildMessageInfo(uid, flags));
        
        AMessageList.Objects[i] := TObject(Integer(StrToInt(uid)));
      end;

      AMessageList.CustomSort(CompareMessageUIDs);

      for i := 0 to AMessageList.Count - 1 do
      begin
        uid := '';
        flags := [];
        ParseMessageInfo(ini.ReadString(cMessagesSection, AMessageList[i], ''), uid, flags);

        if not (mfSeen in flags) then
        begin
          Inc(AUnseenMessages);
          if (AFirstUnseen = 0) then
          begin
            AFirstUnseen := i + 1;
          end;
        end;

        if (mfRecent in flags) then
        begin
          Inc(ARecentCount);
        end;
      end;
    finally
      list.Free();
      ini.Free();
    end;
  finally
    FAccessor.Leave();
  end;
end;

function TclImap4FileHandler.GetMessageList(AConnection: TclImap4CommandConnection): TStringList;
begin
  Result := (AConnection as TclImap4FileCommandConnection).Messages;
end;

function TclImap4FileHandler.GetMessageUID(AConnection: TclImap4CommandConnection;
  const AMessageFile: string): string;
var
  ind: Integer;
  list: TStringList;
begin
  list := GetMessageList(AConnection);
  ind := list.IndexOf(AMessageFile);
  Result := IntToStr(Integer(list.Objects[ind]));
end;

function TclImap4FileHandler.GetMsgFileByUID(AList: TStrings; AUID: Integer): string;
var
  i: Integer;
begin
  for i := 0 to AList.Count - 1 do
  begin
    if (Integer(AList.Objects[i]) = AUID) then
    begin
      Result := AList[i];
      Exit;
    end;
  end;
  Result := '';
  Assert(False);
end;

procedure TclImap4FileHandler.RefreshMailBoxInfo(AConnection: TclImap4CommandConnection);
var
  mailboxInfo: TclImap4MailBoxInfo;
  result: TclImap4MailBoxResult;
begin
  //TODO
  mailboxInfo := TclImap4MailBoxInfo.Create();
  try
    result := GetMailBoxInfo(AConnection, AConnection.CurrentMailBox.Name,
      False, mailboxInfo, GetMessageList(AConnection));
    if (result = mrSuccess) then
    begin
      AConnection.CurrentMailBox.Assign(mailboxInfo);
    end;
  finally
    mailboxInfo.Free();
  end;
end;

function TclImap4FileHandler.GetMailBoxInfo(AConnection: TclImap4CommandConnection;
  const AMailBox: string; IsSelectMailBox: Boolean;
  AMailBoxInfo: TclImap4MailBoxInfo; AMessageList: TStringList): TclImap4MailBoxResult;
var
  path: string;
  recentCount, unseenCount, firstUnseen: Integer;
begin
  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AMailBox));
  if DirectoryExists(path) then
  begin
    try
      AMailBoxInfo.Clear();
      AMailBoxInfo.Name := AMailBox;

      AMailBoxInfo.Flags := [mfAnswered, mfFlagged, mfDeleted, mfSeen, mfDraft, mfRecent];
      AMailBoxInfo.ChangeableFlags := [mfAnswered, mfFlagged, mfDeleted, mfSeen, mfDraft];

      FillMessageList(AConnection, path, AMessageList);
      recentCount := 0;
      unseenCount := 0;
      firstUnseen := 0;
      UpdateMailBoxInfo(AConnection, path, AMessageList, IsSelectMailBox, recentCount, unseenCount, firstUnseen);

      AMailBoxInfo.ExistsMessages := AMessageList.Count;
      AMailBoxInfo.RecentMessages := recentCount;
      AMailBoxInfo.UnseenMessages := unseenCount;
      AMailBoxInfo.FirstUnseen := firstUnseen;

      AMailBoxInfo.UIDValidity := IntToStr(GetFileTimeStamp(path));
      AMailBoxInfo.UIDNext := IntToStr(GetCurrentCounter(AConnection));

      Result := mrSuccess;
    except
      Result := mrAccessDenied;
    end;
  end else
  begin
    Result := mrNotFound;
  end;
end;

procedure TclImap4FileHandler.DoGetMailBoxInfo(Sender: TObject; AConnection: TclImap4CommandConnection;
  const AMailBox: string; IsSelectMailBox: Boolean; AMailBoxInfo: TclImap4MailBoxInfo;
  var Result: TclImap4MailBoxResult);
var
  list, messageList: TStringList;
begin
  list := nil;
  try
    if IsSelectMailBox then
    begin
      messageList := GetMessageList(AConnection);
    end else
    begin
      list := TStringList.Create();
      messageList := list;
    end;
    Result := GetMailBoxInfo(AConnection, AMailBox, IsSelectMailBox, AMailBoxInfo, messageList);
  finally
    list.Free();
  end;
end;

procedure TclImap4FileHandler.SearchAllMessages(AConnection: TclImap4CommandConnection;
  AUseUID: Boolean; AMessageIDs: TStrings);
var
  i: Integer;
  msgList: TStrings;
begin
  msgList := GetMessageList(AConnection);
  for i := 0 to msgList.Count - 1 do
  begin
    if AUseUID then
    begin
      AMessageIDs.Add(GetMessageUID(AConnection, msgList[i]));
    end else
    begin
      AMessageIDs.Add(IntToStr(i + 1));
    end;
  end;
end;

procedure TclImap4FileHandler.SearchMessages(AConnection: TclImap4CommandConnection;
  const AKey, AParam: string; AUseUID: Boolean; AMessageIDs: TStrings);
var
  i: Integer;
  msgList, msgSrc, fieldList: TStrings;
  path: string;
begin
  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AConnection.CurrentMailBox.Name));
  msgList := GetMessageList(AConnection);

  fieldList := TStringList.Create();
  msgSrc := TStringList.Create();
  try
    for i := 0 to msgList.Count - 1 do
    begin
      if FileExists(path + msgList[i]) then
      begin
        msgSrc.LoadFromFile(path + msgList[i]);
        GetHeaderFieldList(0, msgSrc, fieldList);
        if (system.Pos(UpperCase(AParam), UpperCase(GetHeaderFieldValue(msgSrc, fieldList, AKey))) > 0) then
        begin
          if AUseUID then
          begin
            AMessageIDs.Add(GetMessageUID(AConnection, msgList[i]));
          end else
          begin
            AMessageIDs.Add(IntToStr(i + 1));
          end;
        end;
      end;
    end;
  finally
    msgSrc.Free();
    fieldList.Free();
  end;
end;

procedure TclImap4FileHandler.DoSearchMessages(Sender: TObject; AConnection: TclImap4CommandConnection;
  const ASearchCriteria: string; AUseUID: Boolean; AMessageIDs: TStrings; var Result: TclImap4MessageResult);
var
  ind: Integer;
  key, param: string;
begin
  RefreshMailBoxInfo(AConnection);

  ind := Pos(#32, ASearchCriteria);
  if (ind > 0) then
  begin
    key := UpperCase(system.Copy(ASearchCriteria, 1, ind - 1));
    param := system.Copy(ASearchCriteria, ind + 1, Length(ASearchCriteria));
  end else
  begin
    key := UpperCase(ASearchCriteria);
    param := '';
  end;

  AMessageIDs.Clear();
  Result := msOk;
  try
    if (key = 'ALL') then
    begin
      SearchAllMessages(AConnection, AUseUID, AMessageIDs);
    end else
    if (key = 'FROM') or (key = 'TO') or (key = 'SUBJECT') then
    begin
      SearchMessages(AConnection, key, param, AUseUID, AMessageIDs);
    end else
    begin
      Result := msBad;
    end;
  except
    Result := msNo;
  end;
end;

procedure TclImap4FileHandler.FillTargetList(AConnection: TclImap4CommandConnection;
  const AMessageSet: string; AUseUID: Boolean; ATargetList: TStrings);
var
  i: Integer;
  msgList, msgFileList: TStrings;
begin
  msgList := TStringList.Create();
  try
    msgFileList := GetMessageList(AConnection);
    if AUseUID then
    begin                        
      for i := 0 to msgFileList.Count - 1 do
      begin
        msgList.Add(GetMessageUID(AConnection, msgFileList[i]));
      end;
    end else
    begin
      for i := 0 to msgFileList.Count - 1 do
      begin
        msgList.Add(IntToStr(i + 1));
      end;
    end;

    ParseMessageSet(AMessageSet, msgList, ATargetList);

    if AUseUID then
    begin
      for i := 0 to ATargetList.Count - 1 do
      begin
        ATargetList[i] := GetMsgFileByUID(msgFileList, StrToInt(ATargetList[i]));
      end;
    end else
    begin
      for i := 0 to ATargetList.Count - 1 do
      begin
        ATargetList[i] := msgFileList[StrToInt(ATargetList[i]) - 1];
      end;
    end;
  finally
    msgList.Free();
  end;
end;

function TclImap4FileHandler.GenMessageFileName(AConnection: TclImap4CommandConnection): string;
begin
  Result := GetUniqueFileName(Format('MAIL%.8d.MSG', [GetNextCounter(AConnection)]));
end;

procedure TclImap4FileHandler.DoCopyMessages(Sender: TObject; AConnection: TclImap4CommandConnection;
  const AMessageSet, AMailBox: string; AUseUID: Boolean; var Result: TclImap4MailBoxResult);
var
  i: Integer;
  s, currentPath, targetPath: string;
  targetList: TStrings;
begin
  currentPath := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AConnection.CurrentMailBox.Name));
  targetPath := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AMailBox));

  if not DirectoryExists(targetPath) then
  begin
    Result := mrNotFound;
    Exit;
  end;

  try
    targetList := TStringList.Create();
    try
      FillTargetList(AConnection, AMessageSet, AUseUID, targetList);

      for i := 0 to targetList.Count - 1 do
      begin
        s := targetPath + targetList[i];
        while not CopyFile(PChar(currentPath + targetList[i]), PChar(s), True) do
        begin
          s := targetPath + GenMessageFileName(AConnection);
        end;
      end;
    finally
      targetList.Free();
    end;
    Result := mrSuccess;
  except
    Result := mrAccessDenied;
  end;
end;

function TclImap4FileHandler.GetLocalFileSize(const AFileName: string): Integer;
var
  h: THandle;
begin
  h := CreateFile(PChar(AFileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL, 0);
  if (h <> INVALID_HANDLE_VALUE) then
  begin
    Result := GetFileSize(h, nil);
    CloseHandle(h);
  end else
  begin
    Result := -1;
  end;
end;

function TclImap4FileHandler.GetMessageFlags(AConnection: TclImap4CommandConnection;
  const AMailBoxPath, AMessageFile: string): string;
var
  ini: TIniFile;
  uid: string;
  flags: TclMailMessageFlags;
begin
  Result := '';
  if not FileExists(AMailBoxPath + MailBoxInfoFile) then Exit;

  ini := TIniFile.Create(AMailBoxPath + MailBoxInfoFile);
  try
    Result := ini.ReadString(cMessagesSection, AMessageFile, '');
    ParseMessageInfo(Result, uid, flags);
    Result := GetStrByImapMessageFlags(flags);
  finally
    ini.Free();
  end;
end;

function TclImap4FileHandler.SetMessageFlags(AConnection: TclImap4CommandConnection;
  const AMailBoxPath, AMessageFile: string; AFlagsMethod: TclSetFlagsMethod;
  ANewFlags: TclMailMessageFlags): string;
var
  ini: TIniFile;
  uid: string;
  flags: TclMailMessageFlags;
begin
  Result := '';
  ini := nil;
  try
    ini := TIniFile.Create(AMailBoxPath + MailBoxInfoFile);
    Result := ini.ReadString(cMessagesSection, AMessageFile, '');
    ParseMessageInfo(Result, uid, flags);

    case AFlagsMethod of
      fmReplace: flags := ANewFlags;
      fmAdd: flags := flags + ANewFlags;
      fmRemove: flags := flags - ANewFlags;
    end;

    ini.WriteString(cMessagesSection, AMessageFile, BuildMessageInfo(uid, flags));

    Result := GetStrByImapMessageFlags(flags);
  finally
    ini.Free();
  end;
end;

procedure TclImap4FileHandler.ParseHeaderFieldParams(const ASource: string; AFields: TStrings);
var
  i, ind: Integer;
  s: string;
begin
  s := ASource;
  ind := system.Pos('(', s);
  if (ind > 0) then
  begin
    s := system.Copy(s, ind + 1, Length(s));
  end;

  ind := system.Pos(')', s);
  if (ind > 0) then
  begin
    SetLength(s, ind - 1);
  end;

  AFields.Text := StringReplace(s, #32, #13#10, [rfReplaceAll]);

  for i := 0 to AFields.Count - 1 do
  begin
    AFields[i] := LowerCase(Trim(AFields[i]));
  end;
end;

procedure TclImap4FileHandler.GetBodyIDs(const AParams: string; var ABodyIDs: array of Integer);
var
  i, ind: Integer;
begin
  for i := 0 to High(ABodyIDs) do
  begin
    ABodyIDs[i] := 0;
  end;

  ind := 0;
  for i := 1 to Length(AParams) do
  begin
    if(AParams[i] in [#$30..#$39]) then
    begin
      ABodyIDs[ind] := StrToInt(AParams[i]);
    end else
    if(AParams[i] = '.') then
    begin
      Inc(ind);
      if (ind > High(ABodyIDs)) then
      begin
        Break;
      end;
    end else
    begin
      Break;
    end;
  end;
end;

procedure TclImap4FileHandler.FetchHeaderFields(const AMessagePath, ACommand, AParams: string;
  AResponseItem: TclImap4FetchResponseItem);

  function GetHeaderFieldsStr(AHeader: TStrings; const AParams: string): string;
  var
    i, ind: Integer;
    reqFields, fieldList: TStrings;
  begin
    Result := '';

    reqFields := nil;
    fieldList := nil;
    try
      reqFields := TStringList.Create();
      ParseHeaderFieldParams(AParams, reqFields);

      fieldList := TStringList.Create();
      GetHeaderFieldList(0, AHeader, fieldList);

      for i := 0 to reqFields.Count - 1 do
      begin
        ind := fieldList.IndexOf(reqFields[i]);
        if (ind > - 1) then
        begin
          Result := Result + system.Copy(AHeader[Integer(fieldList.Objects[ind])], 1, Length(fieldList[ind]));
          Result := Result + ': '+ GetHeaderFieldValue(AHeader, fieldList, ind) + #13#10;
        end;
      end;
      if (Result <> '') then
      begin
        Result := Result + #13#10;
      end;
    finally
      fieldList.Free();
      reqFields.Free();
    end;
  end;

var
  msg: TclMailMessage;
  src: TStrings;
  s: string;
  bodyIDs: TclMessageBodyIDs;
  body: TclMessageBody;
begin
  GetBodyIDs(AParams, bodyIDs);

  msg := nil;
  src := nil;
  try
    msg := TclMailMessage.Create(nil);
    src := TStringList.Create();

    src.LoadFromFile(AMessagePath);
    msg.MessageSource := src;

    s := '';
    if (bodyIDs[0] = 0) then
    begin
      s := GetHeaderFieldsStr(msg.RawHeader, AParams);
    end else
    begin
      body := GetBodyByIndex(bodyIDs, 0, msg.Bodies);
      if (body <> nil) then
      begin
        s := GetHeaderFieldsStr(body.RawHeader, AParams);
      end;
    end;

    AResponseItem.MessageData := AResponseItem.MessageData
      + Format('%s {%d}'#13#10, [ACommand, Length(s)]) + s;
  finally
    src.Free();
    msg.Free();
  end;
end;

procedure TclImap4FileHandler.FetchHeader(const AMessagePath, ACommand, AParams: string;
  AResponseItem: TclImap4FetchResponseItem);
var
  msg: TclMailMessage;
  src: TStrings;
  s: string;
  bodyIDs: TclMessageBodyIDs;
  body: TclMessageBody;
begin
  GetBodyIDs(AParams, bodyIDs);

  msg := nil;
  src := nil;
  try
    msg := TclMailMessage.Create(nil);
    src := TStringList.Create();

    src.LoadFromFile(AMessagePath);
    msg.MessageSource := src;

    s := '';
    if (bodyIDs[0] = 0) then
    begin
      s := msg.RawHeader.Text + #13#10;
    end else
    begin
      body := GetBodyByIndex(bodyIDs, 0, msg.Bodies);
      if (body <> nil) then
      begin
        s := body.RawHeader.Text + #13#10;
      end;
    end;

    AResponseItem.MessageData := AResponseItem.MessageData
      + Format('%s {%d}'#13#10, [ACommand, Length(s)]) + s;
  finally
    src.Free();
    msg.Free();
  end;
end;

function TclImap4FileHandler.GetBodyByIndex(var ABodyIDs: array of Integer;
  AIndex: Integer; ABodies: TclMessageBodies): TclMessageBody;
var
  ind: Integer;
begin
  Result := nil;
  if (AIndex > High(ABodyIDs)) then Exit;
  
  ind := ABodyIDs[AIndex] - 1;
  if (ind < 0) or (ind > ABodies.Count - 1) then Exit;

  if (ABodies[ind] is TclMultipartBody) then
  begin
    if (AIndex < High(ABodyIDs)) and (ABodyIDs[AIndex + 1] > 0) then
    begin
      Result := GetBodyByIndex(ABodyIDs, AIndex + 1, TclMultipartBody(ABodies[ind]).Bodies);
    end else
    begin
      Result := ABodies[ind];
    end;
  end else
  if (AIndex < High(ABodyIDs)) and (ABodyIDs[AIndex + 1] = 0) then
  begin
    Result := ABodies[ind];
  end;
end;

procedure TclImap4FileHandler.FetchBodyText(const AMessagePath, ACommand, AParams: string;
  AResponseItem: TclImap4FetchResponseItem);
var
  msg: TclMailMessage;
  src: TStrings;
  s: string;
  bodyIDs: TclMessageBodyIDs;
  body: TclMessageBody;
begin
  GetBodyIDs(AParams, bodyIDs);

  msg := nil;
  src := nil;
  try
    msg := TclMailMessage.Create(nil);
    src := TStringList.Create();

    src.LoadFromFile(AMessagePath);
    msg.MessageSource := src;

    s := '';
    if (bodyIDs[0] = 0) then
    begin
      s := GetTextStr(src, msg.RawBodyStart, src.Count);
    end else
    begin
      body := GetBodyByIndex(bodyIDs, 0, msg.Bodies);
      if (body <> nil) then
      begin
        s := GetTextStr(src, body.RawBodyStart, body.EncodedLines);
      end;
    end;

    AResponseItem.MessageData := AResponseItem.MessageData
      + Format('%s {%d}'#13#10, [ACommand, Length(s)]) + s;
  finally
    src.Free();
    msg.Free();
  end;
end;

procedure TclImap4FileHandler.FetchBody(const AMessagePath, ACommand, AParams: string;
  AResponseItem: TclImap4FetchResponseItem);
var
  stream: TStream;
  s: string;
  bodyIDs: TclMessageBodyIDs;
begin
  GetBodyIDs(AParams, bodyIDs);

  if (bodyIDs[0] = 0) then
  begin
    stream := TFileStream.Create(AMessagePath, fmOpenRead or fmShareDenyWrite);
    try
      SetString(s, nil, stream.Size);
      stream.Read(PChar(s)^, stream.Size);
      AResponseItem.MessageData := AResponseItem.MessageData
          + Format('%s {%d}'#13#10, [ACommand, Length(s)]) + s;
    finally
      stream.Free();
    end;
  end else
  begin
    FetchBodyText(AMessagePath, ACommand, AParams, AResponseItem);
  end;
end;

function TclImap4FileHandler.DateTimeToImapTime(ADateTime: TDateTime): string;
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  MonthName: String;
begin
  DecodeDate(ADateTime, Year, Month, Day);
  DecodeTime(ADateTime, Hour, Min, Sec, MSec);
  MonthName := cMonths[Month];
  Result := Format('%d-%s-%d %d:%.2d:%.2d %s',
    [Day, MonthName, Year, Hour, Min, Sec, TimeZoneBiasString]);
end;

procedure TclImap4FileHandler.FetchMessage(AConnection: TclImap4CommandConnection;
  const AMessageFile: string; ARequest: TclImap4FetchRequestList;
  AUseUID: Boolean; AResponseItem: TclImap4FetchResponseItem);
var
  i, k: Integer;
  path, s: string;
begin
  AResponseItem.MessageID := GetMessageList(AConnection).IndexOf(AMessageFile) + 1;
  Assert(AResponseItem.MessageID > 0);

  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AConnection.CurrentMailBox.Name));

  for i := 0 to ARequest.Count - 1 do
  begin
    if ('UID' = ARequest[i].Name) then
    begin
      if not AUseUID and (Length(AResponseItem.MessageData) > 0) then
      begin
        AResponseItem.MessageData := AResponseItem.MessageData + #32;
      end;
    end else
    if (Length(AResponseItem.MessageData) > 0) then
    begin
      AResponseItem.MessageData := AResponseItem.MessageData + #32;
    end;

    if ('BODY' = ARequest[i].Name) or ('BODY.PEEK' = ARequest[i].Name) then
    begin
      s := UpperCase(ARequest[i].Params);
      if (system.Pos('HEADER.FIELDS', s) > 0) then
      begin
        FetchHeaderFields(path + AMessageFile, 'BODY[' + s + ']', s, AResponseItem);
      end else
      if (system.Pos('HEADER', s) > 0) then
      begin
        FetchHeader(path + AMessageFile, 'BODY[' + s + ']', s, AResponseItem);
      end else
      if (system.Pos('MIME', s) > 0) then
      begin
        FetchHeader(path + AMessageFile, 'BODY[' + s + ']', s, AResponseItem);
      end else
      if (system.Pos('TEXT', s) > 0) then
      begin
        FetchBodyText(path + AMessageFile, 'BODY[' + s + ']', s, AResponseItem);
      end else
      begin
        FetchBody(path + AMessageFile, 'BODY[' + s + ']', s, AResponseItem);
      end;

      if ('BODY' = ARequest[i].Name) then
      begin
        SetMessageFlags(AConnection, path, AMessageFile, fmRemove, [mfSeen]);
      end;
    end else
    if ('RFC822' = ARequest[i].Name) then
    begin
      FetchBody(path + AMessageFile, 'RFC822', '', AResponseItem);
    end else
    if ('RFC822.HEADER' = ARequest[i].Name) then
    begin
      FetchHeader(path + AMessageFile, 'RFC822.HEADER', '', AResponseItem);
    end else
    if ('RFC822.SIZE' = ARequest[i].Name) then
    begin
      k := GetLocalFileSize(path + AMessageFile);
      if (k > -1) then
      begin
        AResponseItem.MessageData := AResponseItem.MessageData + Format('RFC822.SIZE %d', [k]);
      end;
    end else
    if ('UID' = ARequest[i].Name) and (not AUseUID) then
    begin
      AResponseItem.MessageData := AResponseItem.MessageData + 'UID ' + GetMessageUID(AConnection, AMessageFile);
    end else
    if ('FLAGS' = ARequest[i].Name) then
    begin
      s := GetMessageFlags(AConnection, path, AMessageFile);
      AResponseItem.MessageData := AResponseItem.MessageData + 'FLAGS (' + s + ')';
    end else
    if ('ENVELOPE' = ARequest[i].Name) then
    begin
      AResponseItem.MessageData := AResponseItem.MessageData + 'ENVELOPE ('
        + FetchMessageEnvelope(path + AMessageFile) + ')';
    end else
    if ('BODYSTRUCTURE' = ARequest[i].Name) then
    begin
      AResponseItem.MessageData := AResponseItem.MessageData + 'BODYSTRUCTURE ('
        + FetchBodyStructure(path + AMessageFile) + ')';
    end else
    if ('INTERNALDATE' = ARequest[i].Name) then
    begin
      s := DateTimeToImapTime(GetMessageInternalDate(path + AMessageFile));
      AResponseItem.MessageData := AResponseItem.MessageData + 'INTERNALDATE "' + s + '"';
    end;
  end;
  if AUseUID and (Length(AResponseItem.MessageData) > 0) then
  begin
    AResponseItem.MessageData := 'UID ' + GetMessageUID(AConnection, AMessageFile) + #32 + AResponseItem.MessageData;
  end;
end;

procedure TclImap4FileHandler.DoFetchMessages(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AMessageSet, ADataItems: string;
  AUseUID: Boolean; AResponse: TclImap4FetchResponseList; var Result: TclImap4MessageResult);
var
  i: Integer;
  path: string;
  targetList: TStrings;
  request: TclImap4FetchRequestList;
begin
  RefreshMailBoxInfo(AConnection);

  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AConnection.CurrentMailBox.Name));
  try
    targetList := TStringList.Create();
    request := TclImap4FetchRequestList.Create(TclImap4FetchRequestItem);
    try
      FillTargetList(AConnection, AMessageSet, AUseUID, targetList);
      request.Parse(ADataItems);
      AResponse.Clear();

      for i := 0 to targetList.Count - 1 do
      begin
        FetchMessage(AConnection, targetList[i], request, AUseUID, AResponse.Add());
      end;
    finally
      request.Free();
      targetList.Free();
    end;
    Result := msOk;
  except
    Result := msNo;
  end;
end;

procedure TclImap4FileHandler.DoStoreMessages(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AMessageSet: string;
  AFlagsMethod: TclSetFlagsMethod; AFlags: TclMailMessageFlags; IsSilent: Boolean;
  AUseUID: Boolean; AResponse: TclImap4FetchResponseList; var Result: TclImap4MessageResult);
var
  i: Integer;
  path, s: string;
  targetList: TStrings;
  item: TclImap4FetchResponseItem;
begin
  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AConnection.CurrentMailBox.Name));

  try
    targetList := TStringList.Create();
    try
      FillTargetList(AConnection, AMessageSet, AUseUID, targetList);

      AResponse.Clear();
      for i := 0 to targetList.Count - 1 do
      begin
        s := SetMessageFlags(AConnection, path, targetList[i], AFlagsMethod, AFlags);
        if not IsSilent then
        begin
          item := AResponse.Add();
          item.MessageID := GetMessageList(AConnection).IndexOf(targetList[i]) + 1;
          Assert(item.MessageID > 0);
          item.MessageData := 'FLAGS (' + s + ')';
        end;
      end;
    finally
      targetList.Free();
    end;
    Result := msOk;
  except
    Result := msNo;
  end;
end;

procedure TclImap4FileHandler.DoPurgeMessages(Sender: TObject;
  AConnection: TclImap4CommandConnection; IsSilent: Boolean; AMessageIDs: TStrings;
  var Result: TclImap4MessageResult);
var
  i, ind: Integer;
  path, uid: string;
  ini: TIniFile;
  list, msgList: TStrings;
  flags: TclMailMessageFlags;
begin
  AMessageIDs.Clear();
  
  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(MailBoxToPath(AConnection.CurrentMailBox.Name));
  if not FileExists(path + MailBoxInfoFile) then
  begin
    Result := msNo;
    Exit;
  end;

  try
    ini := nil;
    list := nil;
    try
      ini := TIniFile.Create(path + MailBoxInfoFile);
      list := TStringList.Create();

      msgList := GetMessageList(AConnection);
      ini.ReadSection(cMessagesSection, list);
      for i := list.Count - 1 downto 0 do
      begin
        ParseMessageInfo(ini.ReadString(cMessagesSection, list[i], ''), uid, flags);
        if (mfDeleted in flags) then
        begin
          if DeleteFile(path + list[i]) and (not IsSilent) then
          begin
            ind := msgList.IndexOf(list[i]);
            if (ind > -1) then
            begin
              AMessageIDs.Add(IntToStr(ind + 1));
            end;
          end;
          ini.DeleteKey(cMessagesSection, list[i]);
        end;
      end;
    finally
      list.Free();
      ini.Free();
    end;
    Result := msOk;
  except
    Result := msNo;
  end;
end;

procedure TclImap4FileHandler.DoCanAppendMessage(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AMailBox: string;
  var Result: TclImap4MailBoxResult);
var
  path: string;
begin
  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(AMailBox);

  if DirectoryExists(path) then
  begin
    Result := mrSuccess;
  end else
  begin
    Result := mrNotFound;
  end;
end;

procedure TclImap4FileHandler.DoMessageAppended(Sender: TObject;
  AConnection: TclImap4CommandConnection; const AMailBox: string;
  AFlags: TclMailMessageFlags; AMessage: TStrings; var Result: TclImap4MailBoxResult);
var
  path, fileName: string;
begin
  path := GetMailBoxPath(AConnection.UserName) + AddTrailingBackSlash(AMailBox);

  try
    fileName := GenMessageFileName(AConnection);
    AMessage.SaveToFile(path + fileName);

    if (AFlags <> []) then
    begin                 
      SetMessageFlags(AConnection, path, fileName, fmReplace, AFlags);
    end;
    Result := mrSuccess;
  except
    Result := mrAccessDenied;
  end;
end;

procedure TclImap4FileHandler.SetMailBoxDir(const Value: string);
begin
  FAccessor.Enter();
  try
    FMailBoxDir := Value;
  finally
    FAccessor.Leave();
  end;
end;

procedure TclImap4FileHandler.SetMailBoxInfoFile(const Value: string);
begin
  FAccessor.Enter();
  try
    FMailBoxInfoFile := Value;
  finally
    FAccessor.Leave();
  end;
end;

procedure TclImap4FileHandler.DoCreateConnection(Sender: TObject; var AConnection: TclCommandConnection);
begin
  AConnection := TclImap4FileCommandConnection.Create();
end;

function TclImap4FileHandler.GetCurrentCounter(AConnection: TclImap4CommandConnection): Integer;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetMailBoxPath(AConnection.UserName) + MailBoxInfoFile);
  try
    Result := ini.ReadInteger(cMailBoxSection, 'Counter', 1);
  finally
    ini.Free();
  end;
end;

function TclImap4FileHandler.GetNextCounter(AConnection: TclImap4CommandConnection): Integer;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetMailBoxPath(AConnection.UserName) + MailBoxInfoFile);
  try
    Result := ini.ReadInteger(cMailBoxSection, 'Counter', 1);
    ini.WriteInteger(cMailBoxSection, 'Counter', Result + 1);
  finally
    ini.Free();
  end;
end;

function TclImap4FileHandler.FetchMessageEnvelope(const AMessagePath: string): string;
var
  stream: TStream;
  msg: TStrings;
begin
  Result := '';
  if not FileExists(AMessagePath) then Exit;

  stream := nil;
  msg := nil;
  try
    stream := TFileStream.Create(AMessagePath, fmOpenRead or fmShareDenyWrite);
    msg := TStringList.Create();

    GetTopLines(stream, 0, msg);
    Result := GetMessageEnvelope(msg);
  finally
    msg.Free();
    stream.Free();
  end;
end;

const
  EncodingMap: array[TclEncodeMethod] of string = ('"7bit"', '"quoted-printable"', '"base64"', 'NIL', '"8bit"');

procedure TclImap4FileHandler.ExtractContentTypeParts(const AContentType: string; var AType, ASubType: string);
var
  ind: Integer;
begin
  AType := 'NIL';
  ASubType := 'NIL';

  if (AContentType = '') then Exit;

  ind := system.Pos('/', AContentType);
  if (ind > 0) then
  begin
    AType := '"' + system.Copy(AContentType, 1, ind - 1) + '"';
    ASubType := '"' + system.Copy(AContentType, ind + 1, 1000) + '"';
  end else
  begin
    AType := '"' + AContentType + '"';
  end;
end;

function TclImap4FileHandler.GetMimeBodySize(ABody: TclMessageBody): string;
var
  cntType, subType: string;
begin
  ExtractContentTypeParts(ABody.ContentType, cntType, subType);
  if SameText(cntType, '"text"') then
  begin
    Result := Format('%d %d ', [ABody.EncodedSize, ABody.EncodedLines]);
  end else
  begin
    Result := Format('%d ', [ABody.EncodedSize]);
  end;
end;

function TclImap4FileHandler.GetMimeBodyStructure(ABodies: TclMessageBodies): string;
var
  i: Integer;
  body: TclMessageBody;
  s, cntType, subType: string;
begin
  Result := '';

  for i := 0 to ABodies.Count - 1 do
  begin
    body := ABodies[i];

    if (ABodies.Count > 1) then
    begin
      Result := Result + '(';
    end;

    if (body is TclTextBody) then
    begin
      ExtractContentTypeParts(body.ContentType, cntType, subType);
      Result := Result + Format('%s %s ', [cntType, subType]);

      if (TclTextBody(body).CharSet <> '') then
      begin
        Result := Result + Format('("charset" "%s") ', [TclTextBody(body).CharSet]);
      end;
      
      Result := Result + 'NIL NIL ' + EncodingMap[body.Encoding] + ' ';
      Result := Result + GetMimeBodySize(body);
      Result := Result + 'NIL NIL NIL';
    end else
    if (body is TclAttachmentBody) then
    begin
      ExtractContentTypeParts(body.ContentType, cntType, subType);
      Result := Result + Format('%s %s ', [cntType, subType]);

      Result := Result + Format('("name" "%s") ', [TclAttachmentBody(body).FileName]);
      s := TclAttachmentBody(body).ContentID;
      if (s <> '') then
      begin
        if (s[1] <> '<') then
        begin
          s := '<' + s + '>';
        end;
        Result := Result + '"' + s + '" NIL ';
        Result := Result + EncodingMap[body.Encoding] + ' ';
        Result := Result + GetMimeBodySize(body);
        Result := Result + 'NIL NIL NIL'; 
      end else
      begin
        Result := Result + 'NIL NIL '+ EncodingMap[body.Encoding] + ' ';
        Result := Result + GetMimeBodySize(body);
        Result := Result + Format('NIL ("attachment" ("filename" "%s")) NIL', [TclAttachmentBody(body).FileName]);
      end;
    end else
    if (body is TclMultipartBody) then
    begin
      Result := Result + GetMimeBodyStructure(TclMultipartBody(body).Bodies);

      ExtractContentTypeParts(body.ContentType, cntType, subType);

      cntType := '';
      if (TclMultipartBody(body).ContentSubType <> '') then
      begin
        cntType := Format('"type" "%s" ', [TclMultipartBody(body).ContentSubType]);
      end;

      Result := Trim(Result) + Format(' %s (%s"boundary" "%s") NIL NIL',
        [subType, cntType, TclMultipartBody(body).Boundary]);
    end;
    
    if (ABodies.Count > 1) then
    begin
      Result := Result + ')';
    end;
  end;
end;

procedure TclImap4FileHandler.GetUueBodySize(AMessage: TStrings; var ASize, ALines: Integer);
var
  i: Integer;
  isBody: Boolean;
begin
  ASize := 0;
  ALines := 0;
  isBody := False;
  for i := 0 to AMessage.Count - 1 do
  begin
    if isBody then
    begin
      ASize := ASize + Length(AMessage[i]) + Length(#13#10);
    end else
    if (AMessage[i] = '') then
    begin
      isBody := True;
      ALines := i;
    end;
  end;
  if (ALines > 0) then
  begin
    ALines := AMessage.Count - ALines - 1;
  end;
end;

function TclImap4FileHandler.GetBodyStructure(AMessage: TStrings): string;
var
  msg: TclMailMessage;
  cntType, subType: string;
  size, lines: Integer;
begin
  msg := TclMailMessage.Create(nil);
  try
    msg.MessageSource := AMessage;

    if (msg.MessageFormat = mfUUencode) then
    begin
      GetUueBodySize(AMessage, size, lines);
      Result := Format('"TEXT" "PLAIN" NIL NIL NIL "7BIT" %d %d NIL NIL NIL', [size, lines]);
    end else
    begin
      Result := GetMimeBodyStructure(msg.Bodies);

      if (msg.Bodies.Count > 1) and (msg.Boundary <> '') then
      begin
        ExtractContentTypeParts(msg.ContentType, cntType, subType);

        cntType := '';
        if (msg.ContentSubType <> '') then
        begin
          cntType := Format('"type" "%s" ', [msg.ContentSubType]);
        end;

        Result := Trim(Result) + Format(' %s ("boundary" "%s") NIL NIL', [subType, msg.Boundary]);
      end;
    end;
  finally
    msg.Free();
  end;
end;

function TclImap4FileHandler.FetchBodyStructure(const AMessagePath: string): string;
var
  msg: TStrings;
begin
  Result := '';
  if not FileExists(AMessagePath) then Exit;

  msg := TStringList.Create();
  try
    msg.LoadFromFile(AMessagePath);
    Result := GetBodyStructure(msg);
  finally
    msg.Free();
  end;
end;

{ TclImap4FileCommandConnection }

constructor TclImap4FileCommandConnection.Create;
begin
  inherited Create();
  FMessages := TStringList.Create();
end;

destructor TclImap4FileCommandConnection.Destroy;
begin
  FMessages.Free();
  inherited Destroy();
end;

end.
