{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clDnsMessage;

interface

{$I clVer.inc}

uses
  Classes, SysUtils, Windows, clUtils, clSocket;

type
  TclDnsOpCode = (ocQuery, ocIQuery, ocStatus);
  TclDnsRecordClass = (rcInternet, rcChaos, rcHesiod);

  EclDnsError = class(EclSocketError);

  TclDnsMessageHeader = class
  private
    FIsRecursionAvailable: Boolean;
    FIsAuthoritativeAnswer: Boolean;
    FIsQuery: Boolean;
    FIsRecursionDesired: Boolean;
    FIsTruncated: Boolean;
    FResponseCode: Integer;
    FOpCode: TclDnsOpCode;
    FID: Integer;
    FAnswerCount: Integer;
    FQueryCount: Integer;
    FNameServerCount: Integer;
    FAdditionalCount: Integer;
  public
    constructor Create;
    procedure Clear;
    procedure Build(var ADestination: TclByteArray; var AIndex: Integer);
    procedure Parse(const ASource: TclByteArray; var AIndex: Integer);
    property ID: Integer read FID write FID;
    property IsQuery: Boolean read FIsQuery write FIsQuery;
    property OpCode: TclDnsOpCode read FOpCode write FOpCode;
    property IsAuthoritativeAnswer: Boolean read FIsAuthoritativeAnswer write FIsAuthoritativeAnswer;
    property IsTruncated: Boolean read FIsTruncated write FIsTruncated;
    property IsRecursionDesired: Boolean read FIsRecursionDesired write FIsRecursionDesired;
    property IsRecursionAvailable: Boolean read FIsRecursionAvailable write FIsRecursionAvailable;
    property ResponseCode: Integer read FResponseCode write FResponseCode;
    property QueryCount: Integer read FQueryCount write FQueryCount;
    property AnswerCount: Integer read FAnswerCount write FAnswerCount;
    property NameServerCount: Integer read FNameServerCount write FNameServerCount;
    property AdditionalCount: Integer read FAdditionalCount write FAdditionalCount;
  end;

  TclDnsRecord = class
  private
    FRecordClass: TclDnsRecordClass;
    FRecordType: Integer;
    FName: string;
    FTTL: Integer;
    FDataLength: Integer;
  protected
    procedure WriteDomainName(const AName: string; var ADestination: TclByteArray; var AIndex: Integer);
    function ReadDomainName(const ASource: TclByteArray; var AIndex: Integer): string;
    procedure InternalBuild(var ADestination: TclByteArray; var AIndex: Integer); virtual;
    procedure InternalParse(const ASource: TclByteArray; var AIndex: Integer); virtual;
  public
    procedure Build(var ADestination: TclByteArray; var AIndex: Integer);
    procedure BuildQuery(var ADestination: TclByteArray; var AIndex: Integer);
    procedure Parse(const ASource: TclByteArray; var AIndex: Integer);
    procedure ParseQuery(const ASource: TclByteArray; var AIndex: Integer);
    property Name: string read FName write FName;
    property RecordType: Integer read FRecordType write FRecordType;
    property RecordClass: TclDnsRecordClass read FRecordClass write FRecordClass;
    property TTL: Integer read FTTL write FTTL;
    property DataLength: Integer read FDataLength write FDataLength;
  end;

  TclDnsMXRecord = class(TclDnsRecord)
  private
    FPreference: Integer;
    FMailServer: string;
  protected
    procedure InternalParse(const ASource: TclByteArray; var AIndex: Integer); override;
  public
    constructor Create;
    property Preference: Integer read FPreference write FPreference;
    property MailServer: string read FMailServer write FMailServer;
  end;

  TclDnsNSRecord = class(TclDnsRecord)
  private
    FNameServer: string;
  protected
    procedure InternalParse(const ASource: TclByteArray; var AIndex: Integer); override;
  public
    constructor Create;
    property NameServer: string read FNameServer write FNameServer;
  end;

  TclDnsARecord = class(TclDnsRecord)
  private
    FIPAddress: string;
  protected
    procedure InternalParse(const ASource: TclByteArray; var AIndex: Integer); override;
  public
    constructor Create;
    property IPAddress: string read FIPAddress write FIPAddress;
  end;

  TclDnsPTRRecord = class(TclDnsRecord)
  private
    FDomainName: string;
  protected
    procedure InternalParse(const ASource: TclByteArray; var AIndex: Integer); override;
  public
    constructor Create;
    property DomainName: string read FDomainName write FDomainName;
  end;

  TclDnsSOARecord = class(TclDnsRecord)
  private
    FExpirationLimit: Integer;
    FMinimumTTL: Integer;
    FRetryInterval: Integer;
    FSerialNumber: Integer;
    FRefreshInterval: Integer;
    FResponsibleMailbox: string;
    FPrimaryNameServer: string;
  protected
    procedure InternalParse(const ASource: TclByteArray; var AIndex: Integer); override;
  public
    constructor Create;
    property PrimaryNameServer: string read FPrimaryNameServer write FPrimaryNameServer;
    property ResponsibleMailbox: string read FResponsibleMailbox write FResponsibleMailbox;
    property SerialNumber: Integer read FSerialNumber write FSerialNumber;
    property RefreshInterval: Integer read FRefreshInterval write FRefreshInterval;
    property RetryInterval: Integer read FRetryInterval write FRetryInterval;
    property ExpirationLimit: Integer read FExpirationLimit write FExpirationLimit;
    property MinimumTTL: Integer read FMinimumTTL write FMinimumTTL;
  end;

  TclDnsCNAMERecord = class(TclDnsRecord)
  private
    FPrimaryName: string;
  protected
    procedure InternalParse(const ASource: TclByteArray; var AIndex: Integer); override;
  public
    constructor Create;
    property PrimaryName: string read FPrimaryName write FPrimaryName;
  end;

  TclDnsRecordList = class
  private
    FList: TList;
    function GetCount: Integer;
    function GetItems(Index: Integer): TclDnsRecord;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(AItem: TclDnsRecord): Integer;
    function ItemByName(const AName: string): TclDnsRecord;
    procedure Clear;
    procedure Delete(Index: Integer);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TclDnsRecord read GetItems; default;
  end;

  TclDnsMessage = class
  private
    FHeader: TclDnsMessageHeader;
    FNameServers: TclDnsRecordList;
    FAnswers: TclDnsRecordList;
    FQueries: TclDnsRecordList;
    FAdditionalRecords: TclDnsRecordList;
  protected
    function CreateRecord(const ASource: TclByteArray; const AIndex: Integer): TclDnsRecord;
    function CreateRecordByType(ARecordType: Integer): TclDnsRecord; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Build(ADestination: TStream);
    procedure Parse(ASource: TStream);
    property Header: TclDnsMessageHeader read FHeader;
    property Queries: TclDnsRecordList read FQueries;
    property Answers: TclDnsRecordList read FAnswers;
    property NameServers: TclDnsRecordList read FNameServers;
    property AdditionalRecords: TclDnsRecordList read FAdditionalRecords;
  end;

resourcestring
  cDnsDatagramInvalid = 'The size of the datagram is invalid';

implementation

const
  cDatagramSize = 512;

{ TclDnsMessageHeader }

procedure TclDnsMessageHeader.Build(var ADestination: TclByteArray; var AIndex: Integer);
var
  w: Word;
begin
  w := Loword(ID);
  ByteArrayWriteWord(w, ADestination, AIndex);

  w := 0;
  if not IsQuery then
  begin
    w := w or $8000;
  end;
  case OpCode of
    ocIQuery: w := w or $0800;
    ocStatus: w := w or $1000;
  end;
  if IsAuthoritativeAnswer then
  begin
    w := w or $0400;
  end;
  if IsTruncated then
  begin
    w := w or $0200;
  end;
  if IsRecursionDesired then
  begin
    w := w or $0100;
  end;
  if IsRecursionAvailable then
  begin
    w := w or $0080;
  end;
  w := w or (ResponseCode and $000F);
  ByteArrayWriteWord(w, ADestination, AIndex);

  ByteArrayWriteWord(Loword(QueryCount), ADestination, AIndex);
  ByteArrayWriteWord(Loword(AnswerCount), ADestination, AIndex);
  ByteArrayWriteWord(Loword(NameServerCount), ADestination, AIndex);
  ByteArrayWriteWord(Loword(AdditionalCount), ADestination, AIndex);
end;

procedure TclDnsMessageHeader.Clear;
begin
  ID := Loword(GetTickCount());
  IsQuery := False;
  OpCode := ocQuery;
  IsAuthoritativeAnswer := False;
  IsTruncated := False;
  IsRecursionDesired := False;
  IsRecursionAvailable := False;
  ResponseCode := 0;
  QueryCount := 0;
  AnswerCount := 0;
  NameServerCount := 0;
  AdditionalCount := 0;
end;

procedure TclDnsMessageHeader.Parse(const ASource: TclByteArray; var AIndex: Integer);
var
  w: Word;
begin
  Clear();
  ID := ByteArrayReadWord(ASource, AIndex);

  w := ByteArrayReadWord(ASource, AIndex);
  IsQuery := (w and $8000) = 0;
  case (w and $1800) of
    $0800: OpCode := ocIQuery;
    $1000: OpCode := ocStatus;
  else
    OpCode := ocQuery;
  end;
  IsAuthoritativeAnswer := (w and $0400) > 0;
  IsTruncated := (w and $0200) > 0;
  IsRecursionDesired := (w and $0100) > 0;
  IsRecursionAvailable := (w and $0080) > 0;
  ResponseCode := (w and $000F);

  QueryCount := ByteArrayReadWord(ASource, AIndex);
  AnswerCount := ByteArrayReadWord(ASource, AIndex);
  NameServerCount := ByteArrayReadWord(ASource, AIndex);
  AdditionalCount := ByteArrayReadWord(ASource, AIndex);
end;

constructor TclDnsMessageHeader.Create;
begin
  inherited Create();
  Clear();
end;

{ TclDnsMessage }

procedure TclDnsMessage.Build(ADestination: TStream);
var
  i, ind: Integer;
  buf: TclByteArray;
begin
  Header.QueryCount := Queries.Count;
  Header.AnswerCount := Answers.Count;
  Header.NameServerCount := NameServers.Count;
  Header.AdditionalCount := AdditionalRecords.Count;

  SetLength(buf, cDatagramSize);
  ind := 0;
  Header.Build(buf, ind);

  for i := 0 to Queries.Count - 1 do
  begin
    Queries[i].BuildQuery(buf, ind);
  end;
  
  for i := 0 to Answers.Count - 1 do
  begin
    Answers[i].Build(buf, ind);
  end;

  for i := 0 to NameServers.Count - 1 do
  begin
    NameServers[i].Build(buf, ind);
  end;

  for i := 0 to AdditionalRecords.Count - 1 do
  begin
    AdditionalRecords[i].Build(buf, ind);
  end;

  ADestination.Write(buf[0], ind);
end;

procedure TclDnsMessage.Clear;
begin
  FHeader.Clear();
  FNameServers.Clear();
  FAnswers.Clear();
  FQueries.Clear();
  FAdditionalRecords.Clear();
end;

constructor TclDnsMessage.Create;
begin
  inherited Create();
  FHeader := TclDnsMessageHeader.Create();
  FNameServers := TclDnsRecordList.Create();
  FAnswers := TclDnsRecordList.Create();
  FQueries := TclDnsRecordList.Create();
  FAdditionalRecords := TclDnsRecordList.Create();
end;

function TclDnsMessage.CreateRecord(const ASource: TclByteArray; const AIndex: Integer): TclDnsRecord;
var
  rec: TclDnsRecord;
  ind: Integer;
begin
  rec := TclDnsRecord.Create();
  try
    ind := AIndex;
    rec.ParseQuery(ASource, ind);
    Result := CreateRecordByType(rec.RecordType);
  finally
    rec.Free();
  end;
end;

function TclDnsMessage.CreateRecordByType(ARecordType: Integer): TclDnsRecord;
begin
  case ARecordType of
    1: Result := TclDnsARecord.Create();
    2: Result := TclDnsNSRecord.Create();
    5: Result := TclDnsCNAMERecord.Create();
    6: Result := TclDnsSOARecord.Create();
    12: Result := TclDnsPTRRecord.Create();
    15: Result := TclDnsMXRecord.Create()
  else
    Result := TclDnsRecord.Create();
  end;
end;

destructor TclDnsMessage.Destroy;
begin
  FAdditionalRecords.Free();
  FQueries.Free();
  FAnswers.Free();
  FNameServers.Free();
  FHeader.Free();
  inherited Destroy();
end;

procedure TclDnsMessage.Parse(ASource: TStream);
var
  i, ind: Integer;
  buf: TclByteArray;
  rec: TclDnsRecord;
begin
  if (ASource.Size - ASource.Position) > cDatagramSize then
  begin
    raise EclDnsError.Create(cDnsDatagramInvalid, -1);
  end;

  Clear();

  SetLength(buf, cDatagramSize);
  ASource.Read(buf[0], cDatagramSize);
  ind := 0;
  Header.Parse(buf, ind);

  for i := 0 to Header.QueryCount - 1 do
  begin
    rec := CreateRecord(buf, ind);
    Queries.Add(rec);
    rec.ParseQuery(buf, ind);
  end;

  for i := 0 to Header.AnswerCount - 1 do
  begin
    rec := CreateRecord(buf, ind);
    Answers.Add(rec);
    rec.Parse(buf, ind);
  end;

  for i := 0 to Header.NameServerCount - 1 do
  begin
    rec := CreateRecord(buf, ind);
    NameServers.Add(rec);
    rec.Parse(buf, ind);
  end;
  
  for i := 0 to Header.AdditionalCount - 1 do
  begin
    rec := CreateRecord(buf, ind);
    AdditionalRecords.Add(rec);
    rec.Parse(buf, ind);
  end;
end;

{ TclDnsRecordList }

function TclDnsRecordList.Add(AItem: TclDnsRecord): Integer;
begin
  Result := FList.Add(AItem);
end;

procedure TclDnsRecordList.Clear;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].Free();
  end;
  FList.Clear();
end;

constructor TclDnsRecordList.Create;
begin
  inherited Create();
  FList := TList.Create();
end;

procedure TclDnsRecordList.Delete(Index: Integer);
begin
  Items[Index].Free();
  FList.Delete(Index);
end;

destructor TclDnsRecordList.Destroy;
begin
  Clear();
  FList.Free();
  inherited Destroy();
end;

function TclDnsRecordList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TclDnsRecordList.GetItems(Index: Integer): TclDnsRecord;
begin
  Result := TclDnsRecord(FList[Index]);
end;

function TclDnsRecordList.ItemByName(const AName: string): TclDnsRecord;
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

{ TclDnsMXRecord }

constructor TclDnsMXRecord.Create;
begin
  inherited Create();
  RecordType := 15;
end;

procedure TclDnsMXRecord.InternalParse(const ASource: TclByteArray; var AIndex: Integer);
begin
  inherited InternalParse(ASource, AIndex);
  Preference := ByteArrayReadWord(ASource, AIndex);
  MailServer := ReadDomainName(ASource, AIndex);
end;

{ TclDnsRecord }

procedure TclDnsRecord.Build(var ADestination: TclByteArray; var AIndex: Integer);
begin
  BuildQuery(ADestination, AIndex);
  InternalBuild(ADestination, AIndex);
end;

procedure TclDnsRecord.BuildQuery(var ADestination: TclByteArray; var AIndex: Integer);
const
  RecClass: array[TclDnsRecordClass] of Word = (1, 3, 4);
begin
  WriteDomainName(Name, ADestination, AIndex);
  ByteArrayWriteWord(Word(RecordType), ADestination, AIndex);
  ByteArrayWriteWord(RecClass[RecordClass], ADestination, AIndex);
end;

procedure TclDnsRecord.InternalBuild(var ADestination: TclByteArray; var AIndex: Integer);
begin
  Assert(False, 'Not implemented');
end;

procedure TclDnsRecord.InternalParse(const ASource: TclByteArray; var AIndex: Integer);
begin
end;

procedure TclDnsRecord.Parse(const ASource: TclByteArray; var AIndex: Integer);
var
  ind: Integer;
begin
  ParseQuery(ASource, AIndex);

  TTL := ByteArrayReadDWord(ASource, AIndex);
  DataLength := ByteArrayReadWord(ASource, AIndex);

  ind := AIndex;
  AIndex := AIndex + DataLength;
  InternalParse(ASource, ind);

  Assert(ind <= AIndex);
  Assert(AIndex <= Length(ASource));
end;

procedure TclDnsRecord.ParseQuery(const ASource: TclByteArray;
  var AIndex: Integer);
begin
  Name := ReadDomainName(ASource, AIndex);
  RecordType := ByteArrayReadWord(ASource, AIndex);
  case ByteArrayReadWord(ASource, AIndex) of
    3: RecordClass := rcChaos;
    4: RecordClass := rcHesiod
  else
    RecordClass := rcInternet;
  end;
end;

function TclDnsRecord.ReadDomainName(const ASource: TclByteArray;
  var AIndex: Integer): string;
var
  s: string;
  i, ind, len: Integer;
begin
  Result := '';
  ind := -1;
  repeat
    len := ASource[AIndex];
    while (len and $C0) = $C0 do
    begin
      if ind < 0 then
      begin
        ind := Succ(AIndex);
      end;
      AIndex := MakeWord(len and $3F, ASource[AIndex + 1]);
      Assert(AIndex < Length(ASource));
      len := ASource[AIndex];
    end;
    SetLength(s, len);
    if len > 0 then
    begin
      for i := 1 to len do
      begin
        s[i] := Char(ASource[AIndex + i]);
      end;
      Inc(AIndex, Length(s) + 1);
    end;
    Result := Result + s + '.';
  until (ASource[AIndex] = 0) or (AIndex >= Length(ASource));
  if Result[Length(Result)] = '.' then
  begin
    SetLength(Result, Length(Result) - 1);
  end;
  if ind >= 0 then
  begin
    AIndex := ind;
  end;
  Inc(AIndex);
end;

procedure TclDnsRecord.WriteDomainName(const AName: string;
  var ADestination: TclByteArray; var AIndex: Integer);
var
  name, s: string;
  ind: Integer;
  size: Byte;
begin
  name := AName;
  while Length(name) > 0 do
  begin
    ind := system.Pos('.', name);
    if ind = 0 then
    begin
      ind := Length(name) + 1;
    end;
    s := system.Copy(name, 1, ind - 1);
    system.Delete(name, 1, ind);

    size := Byte(Length(s) and $00FF);
    ADestination[AIndex] := size;
    Inc(AIndex);
    system.Move(PChar(s)^, ADestination[AIndex], size);
    Inc(AIndex, size);
  end;

  ADestination[AIndex] := 0;
  Inc(AIndex);
end;

{ TclDnsNSRecord }

constructor TclDnsNSRecord.Create;
begin
  inherited Create();
  RecordType := 2;
end;

procedure TclDnsNSRecord.InternalParse(const ASource: TclByteArray; var AIndex: Integer);
begin
  inherited InternalParse(ASource, AIndex);
  NameServer := ReadDomainName(ASource, AIndex);
end;

{ TclDnsARecord }

constructor TclDnsARecord.Create;
begin
  inherited Create();
  RecordType := 1;
end;

procedure TclDnsARecord.InternalParse(const ASource: TclByteArray; var AIndex: Integer);
begin
  inherited InternalParse(ASource, AIndex);
  IPAddress := Format('%d.%d.%d.%d',[ASource[AIndex], ASource[AIndex + 1], ASource[AIndex + 2], ASource[AIndex + 3]]);
  Inc(AIndex, 4);
end;

{ TclDnsPTRRecord }

constructor TclDnsPTRRecord.Create;
begin
  inherited Create();
  RecordType := 12;
end;

procedure TclDnsPTRRecord.InternalParse(const ASource: TclByteArray; var AIndex: Integer);
begin
  inherited InternalParse(ASource, AIndex);
  DomainName := ReadDomainName(ASource, AIndex);
end;

{ TclDnsSOARecord }

constructor TclDnsSOARecord.Create;
begin
  inherited Create();
  RecordType := 6;
end;

procedure TclDnsSOARecord.InternalParse(const ASource: TclByteArray; var AIndex: Integer);
begin
  inherited InternalParse(ASource, AIndex);
  PrimaryNameServer := ReadDomainName(ASource, AIndex);
  ResponsibleMailbox := ReadDomainName(ASource, AIndex);
  SerialNumber := ByteArrayReadDWord(ASource, AIndex);
  RefreshInterval := ByteArrayReadDWord(ASource, AIndex);
  RetryInterval := ByteArrayReadDWord(ASource, AIndex);
  ExpirationLimit := ByteArrayReadDWord(ASource, AIndex);
  MinimumTTL := ByteArrayReadDWord(ASource, AIndex);
end;

{ TclDnsCNAMERecord }

constructor TclDnsCNAMERecord.Create;
begin
  inherited Create();
  RecordType := 5;
end;

procedure TclDnsCNAMERecord.InternalParse(const ASource: TclByteArray; var AIndex: Integer);
begin
  inherited InternalParse(ASource, AIndex);
  PrimaryName := ReadDomainName(ASource, AIndex);
end;

end.

