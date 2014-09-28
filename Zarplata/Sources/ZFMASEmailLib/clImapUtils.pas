{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clImapUtils;

interface

{$I clVer.inc}

uses
  Classes;

const
  cDefaultImapPort = 143;

type
  TclImapConnectionState = (csNonAuthenticated, csAuthenticated, csSelected);

  TclMailMessageFlag = (mfAnswered, mfFlagged, mfDeleted, mfSeen, mfDraft, mfRecent);
  TclMailMessageFlags = set of TclMailMessageFlag;

  TclSetFlagsMethod = (fmReplace, fmAdd, fmRemove);

  TclImap4MailBoxInfo = class
  private
    FName: string;
    FRecentMessages: Integer;
    FFirstUnseen: Integer;
    FExistsMessages: Integer;
    FReadOnly: Boolean;
    FFlags: TclMailMessageFlags;
    FChangeableFlags: TclMailMessageFlags;
    FUIDValidity: string;
    FUIDNext: string;
    FUnseenMessages: Integer;
  public
    constructor Create;
    procedure Clear; virtual;
    procedure Assign(ASource: TclImap4MailBoxInfo); virtual;
    property Name: string read FName write FName;
    property ExistsMessages: Integer read FExistsMessages write FExistsMessages;
    property RecentMessages: Integer read FRecentMessages write FRecentMessages;
    property UnseenMessages: Integer read FUnseenMessages write FUnseenMessages;
    property FirstUnseen: Integer read FFirstUnseen write FFirstUnseen;
    property ReadOnly: Boolean read FReadOnly write FReadOnly;
    property Flags: TclMailMessageFlags read FFlags write FFlags;
    property ChangeableFlags: TclMailMessageFlags read FChangeableFlags write FChangeableFlags;
    property UIDValidity: string read FUIDValidity write FUIDValidity;
    property UIDNext: string read FUIDNext write FUIDNext;
  end;

  TclImap4FetchRequestItem = class(TCollectionItem)
  private
    FParams: string;
    FName: string;
  public
    property Name: string read FName write FName;
    property Params: string read FParams write FParams;
  end;

  TclImap4FetchRequestList = class(TCollection)
  private
    function GetItem(Index: Integer): TclImap4FetchRequestItem;
    procedure SetItem(Index: Integer; const Value: TclImap4FetchRequestItem);
  public
    procedure Parse(const ASource: string);
    function Add: TclImap4FetchRequestItem;
    function ItemIndex(const AName: string): Integer;
    property Items[Index: Integer]: TclImap4FetchRequestItem read GetItem write SetItem; default;
  end;

  TclImap4FetchResponseItem = class(TCollectionItem)
  private
    FMessageID: Integer;
    FMessageData: string;
  public
    property MessageID: Integer read FMessageID write FMessageID;
    property MessageData: string read FMessageData write FMessageData;
  end;
  
  TclImap4FetchResponseList = class(TCollection)
  private
    function GetItem(Index: Integer): TclImap4FetchResponseItem;
    procedure SetItem(Index: Integer; const Value: TclImap4FetchResponseItem);
  public
    procedure BuildResponse(ADestination: TStrings);
    function Add: TclImap4FetchResponseItem;
    property Items[Index: Integer]: TclImap4FetchResponseItem read GetItem write SetItem; default;
  end;

function GetStrByImapMessageFlags(AFlags: TclMailMessageFlags): string;
function GetImapMessageFlagsByStr(const AText: string): TclMailMessageFlags;
function ExtractMessageSize(const ASource: string): Integer;
procedure ParseMessageSet(const AMessageSet: string; AMessageList, ATargetList: TStrings);
procedure ParseMailboxInfo(const AMailBoxInfo: string; var ASeparator: Char; var AName: string);

const
  cImapMailBoxInfoFile = 'imap.dat';

implementation

uses
  SysUtils, clUtils;
  
function GetStrByImapMessageFlags(AFlags: TclMailMessageFlags): string;
const
  flagLexems: array[TclMailMessageFlag] of string =
    ('\Answered', '\Flagged', '\Deleted', '\Seen', '\Draft', '\Recent');
var
  flag: TclMailMessageFlag;
begin
  Result := '';
  for flag := Low(TclMailMessageFlag) to High(TclMailMessageFlag) do
  begin
    if (flag in AFlags) then
    begin
      Result := Result + ' ' + flagLexems[flag];
    end;
  end;
  Result := Trim(Result);
end;

function GetImapMessageFlagsByStr(const AText: string): TclMailMessageFlags;
begin
  Result := [];
  if (System.Pos('\ANSWERED', AText) > 0) then
    Result := Result + [mfAnswered];
  if (System.Pos('\FLAGGED', AText) > 0) then
    Result := Result + [mfFlagged];
  if (System.Pos('\DELETED', AText) > 0) then
    Result := Result + [mfDeleted];
  if (System.Pos('\SEEN', AText) > 0) then
    Result := Result + [mfSeen];
  if (System.Pos('\DRAFT', AText) > 0) then
    Result := Result + [mfDraft];
  if (System.Pos('\RECENT', AText) > 0) then
    Result := Result + [mfRecent];
end;

function ExtractMessageSize(const ASource: string): Integer;
var
  indEnd, indStart: Integer;
begin
  Result := 0;

  indEnd := RTextPos('}', ASource);
  if (indEnd = 0) then Exit;

  indStart := RTextPos('{', ASource, indEnd);
  if (indStart = 0) then Exit;

  Result := StrToIntDef(system.Copy(ASource, indStart + 1, indEnd - indStart - 1), 0);
end;

procedure ParseMessageSet(const AMessageSet: string; AMessageList, ATargetList: TStrings);
  function GetSeqNum(const ASource: string; AMessageList: TStrings): Integer;
  begin
    if (ASource = '*') and (AMessageList.Count > 0) then
    begin
      Result := StrToIntDef(AMessageList[AMessageList.Count - 1], 0);
    end else
    begin
      Result := StrToIntDef(ASource, 0);
    end;
  end;

var
  i, j, ind: Integer;
  seqList: TStrings;
  first, last, temp: Integer;
begin
  ATargetList.Clear();

  seqList := TStringLIst.Create();
  try
    seqList.Text := StringReplace(AMessageSet, ',', #13#10, [rfReplaceAll]);

    for i := 0 to seqList.Count - 1 do
    begin
      ind := system.Pos(':', seqList[i]);
      if (ind > 0) then
      begin
        first := GetSeqNum(system.Copy(seqList[i], 1, ind - 1), AMessageList);
        last := GetSeqNum(system.Copy(seqList[i], ind + 1, Length(seqList[i])), AMessageList);
        if (first > last) then
        begin
          temp := first;
          first := last;
          last := temp;
        end;
        for j := first to last do
        begin
          if AMessageList.IndexOf(IntToStr(j)) > -1 then
          begin
            ATargetList.Add(IntToStr(j));
          end;
        end;
      end else
      begin
        first := GetSeqNum(seqList[i], AMessageList);
        if AMessageList.IndexOf(IntToStr(first)) > -1 then
        begin
          ATargetList.Add(IntToStr(first));
        end;
      end;
    end;
  finally
    seqList.Free();
  end;
end;

procedure ParseMailboxInfo(const AMailBoxInfo: string; var ASeparator: Char; var AName: string);
var
  ind: Integer;
begin
  ASeparator := #0;
  AName := '';

  ind := System.Pos(')', AMailBoxInfo);
  if (ind > 0) then
  begin
    AName := Trim(System.Copy(AMailBoxInfo, ind + 1, MaxInt));
    if (AName <> '') and (AName[1] = '"') then
    begin
      ASeparator := AName[2];
    end;
    AName := Trim(System.Copy(AName, 4, MaxInt));
    AName := ExtractQuotedString(AName, '"');
  end;
end;

{ TclImap4MailBoxInfo }

procedure TclImap4MailBoxInfo.Assign(ASource: TclImap4MailBoxInfo);
begin
  FName := ASource.Name;
  FRecentMessages := ASource.RecentMessages;
  FFirstUnseen := ASource.FirstUnseen;
  FExistsMessages := ASource.ExistsMessages;
  FReadOnly := ASource.ReadOnly;
  FFlags := ASource.Flags;
  FChangeableFlags := ASource.ChangeableFlags;
  FUIDValidity := ASource.UIDValidity;
  FUIDNext := ASource.UIDNext;
  FUnseenMessages := ASource.UnseenMessages;
end;

procedure TclImap4MailBoxInfo.Clear;
begin
  FName := '';
  FRecentMessages := 0;
  FUnseenMessages := 0;
  FFirstUnseen := 0;
  FExistsMessages := 0;
  FReadOnly := False;
  FFlags := [];
  FChangeableFlags := [];
  FUIDValidity := '';
  FUIDNext := '';
end;

constructor TclImap4MailBoxInfo.Create;
begin
  inherited Create();
  Clear();
end;

{ TclImap4FetchRequestList }

function TclImap4FetchRequestList.Add: TclImap4FetchRequestItem;
begin
  Result := TclImap4FetchRequestItem(inherited Add());
end;

function TclImap4FetchRequestList.GetItem(Index: Integer): TclImap4FetchRequestItem;
begin
  Result := TclImap4FetchRequestItem(inherited GetItem(Index));
end;

function TclImap4FetchRequestList.ItemIndex(const AName: string): Integer;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if (Items[i].Name = AName) then
    begin
      Result := i;
      Exit;
    end;
  end;
  Result := -1;
end;

procedure TclImap4FetchRequestList.Parse(const ASource: string);
var
  len: Integer;
  Next: PChar;
  inParams: Boolean;
  curText: string;
  item: TclImap4FetchRequestItem;
begin
  Clear();
  len := Length(ASource);
  if (len = 0) then Exit;

  item := nil;
  curText := '';
  Next := @ASource[1];
  inParams := False;
  while (len > 0) do
  begin
    case (Next^) of
      #32:
        begin
          if inParams then
          begin
            curText := curText + Next^;
          end else
          begin
            item := nil;
            if (curText <> '') then
            begin
              item := Add();
              item.Name := UpperCase(curText);
            end;
            curText := '';
          end;
        end;
      '[':
        begin
          inParams := True;
          item := nil;
          if (curText <> '') then
          begin
            item := Add();
            item.Name := UpperCase(curText);
          end;
          curText := '';
        end;
      ']':
        begin
          if inParams and (item <> nil) and (curText <> '') then
          begin
            item.Params := curText;
          end;
          curText := '';
          inParams := False;
          item := nil;
        end;
    else
      begin
        curText := curText + Next^;
      end;
    end;
    Inc(Next);
    Dec(len);
  end;

  if not inParams and (curText <> '') then
  begin
    item := Add();
    item.Name := UpperCase(curText);
  end;
end;

procedure TclImap4FetchRequestList.SetItem(Index: Integer; const Value: TclImap4FetchRequestItem);
begin
  inherited SetItem(Index, Value);
end;

{ TclImap4FetchResponseList }

function TclImap4FetchResponseList.Add: TclImap4FetchResponseItem;
begin
  Result := TclImap4FetchResponseItem(inherited Add());
end;

function TclImap4FetchResponseList.GetItem(Index: Integer): TclImap4FetchResponseItem;
begin
  Result := TclImap4FetchResponseItem(inherited GetItem(Index));
end;

procedure TclImap4FetchResponseList.BuildResponse(ADestination: TStrings);
var
  i: Integer;
  b: Boolean;
begin
  ADestination.Clear();
  for i := 0 to Count - 1 do
  begin
    ADestination.Add(Format('* %d FETCH (', [Items[i].MessageID]));
    b := AddTextStr(ADestination, Items[i].MessageData, True);
    AddTextStr(ADestination, ')', b);
  end;
end;

procedure TclImap4FetchResponseList.SetItem(Index: Integer; const Value: TclImap4FetchResponseItem);
begin
  inherited SetItem(Index, Value);
end;

end.
