{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clHttpRequest;

interface

{$I clVer.inc}

uses
  Classes, SysUtils, clHtmlParser, clStreams, clHttpHeader;

type
  TclHttpRequestItem = class;

  TclGetDataStreamEvent = procedure (Sender: TObject; AItem: TclHttpRequestItem;
    var AData: TStream) of object;

  TclDataAddedEvent = procedure (Sender: TObject; AItem: TclHttpRequestItem; AData: TStream) of object;

  TclGetFormNumberEvent = procedure(Sender: TObject; AParser: TclHtmlParser;
    var AFormNumber: Integer) of object;

  TclHttpRequest = class;
  
  TclHttpRequestItem = class(TPersistent)
  private
    FOwner: TclHttpRequest;
    FTag: Integer;
    FCanonicalized: Boolean;
    procedure SetOwner(const Value: TclHttpRequest);
    procedure SetCanonicalized(const Value: Boolean);
  protected
    procedure ReadData(Reader: TReader); virtual;
    procedure WriteData(Writer: TWriter); virtual;
    procedure ParseHeader(AHeader, AFieldList: TStrings); virtual;
    procedure AddData(const AData: PChar; ADataSize: Integer); virtual; abstract;
    procedure AfterAddData; virtual; abstract;
    function GetData: TStream; virtual; abstract;
    function GetSize: Integer;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Update;
    function GetCanonicalizedValue(const AValue: string): string;
  public
    constructor Create(AOwner: TclHttpRequest); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property Owner: TclHttpRequest read FOwner write SetOwner;
    property Tag: Integer read FTag write FTag;
    property Canonicalized: Boolean read FCanonicalized write SetCanonicalized;
  end;

  TclHttpRequestItemClass = class of TclHttpRequestItem;

  TclBinaryRequestItem = class(TclHttpRequestItem)
  protected
    procedure AddData(const AData: PChar; ADataSize: Integer); override;
    procedure AfterAddData; override;
    function GetData: TStream; override;
  end;

  TclTextRequestItem = class(TclHttpRequestItem)
  private
    FTextData: string;
    procedure SetTextData(const Value: string);
  protected
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    procedure AddData(const AData: PChar; ADataSize: Integer); override;
    procedure AfterAddData; override;
    function GetData: TStream; override;
  public
    procedure Assign(Source: TPersistent); override;
    property TextData: string read FTextData write SetTextData;
  end;

  TclFormFieldRequestItem = class(TclHttpRequestItem)
  private
    FFieldName: string;
    FFieldValue: string;
    function GetRequest: string;
    procedure SetFieldName(const Value: string);
    procedure SetFieldValue(const Value: string);
  protected
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    procedure AddData(const AData: PChar; ADataSize: Integer); override;
    procedure AfterAddData; override;
    function GetData: TStream; override;
  public
    procedure Assign(Source: TPersistent); override;
    property FieldName: string read FFieldName write SetFieldName;
    property FieldValue: string read FFieldValue write SetFieldValue;
  end;

  TclSubmitFileRequestItem = class(TclHttpRequestItem)
  private
    FFileName: string;
    FFieldName: string;
    FContentType: string;
    procedure SetContentType(const Value: string);
    procedure SetFieldName(const Value: string);
    procedure SetFileName(const Value: string);
  protected
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    procedure ParseHeader(AHeader, AFieldList: TStrings); override;
    procedure AddData(const AData: PChar; ADataSize: Integer); override;
    procedure AfterAddData; override;
    function GetData: TStream; override;
  public
    constructor Create(AOwner: TclHttpRequest); override;
    procedure Assign(Source: TPersistent); override;
    property FieldName: string read FFieldName write SetFieldName;
    property FileName: string read FFileName write SetFileName;
    property ContentType: string read FContentType write SetContentType;
  end;

  TclHttpRequest = class(TComponent)
  private
    FList: TList;
    FHeader: TclHttpRequestHeader;
    FOnChanged: TNotifyEvent;
    FOnGetDataStream: TclGetDataStreamEvent;
    FOnGetDataSourceStream: TclGetDataStreamEvent;
    FOnGetFormNumber: TclGetFormNumberEvent;
    FUpdateCount: Integer;
    FRequestSource: TStrings;
    FHeaderSource: TStrings;
    FIsParse: Boolean;
    FDataStream: TStream;
    FBatchSize: Integer;
    FOnDataAdded: TclDataAddedEvent;
    function GetTotalSize: Integer;
    function GetCount: Integer;
    function GetItem(Index: Integer): TclHttpRequestItem;
    procedure RemoveItem(AItem: TclHttpRequestItem);
    procedure AddItem(AItem: TclHttpRequestItem);
    procedure ClearItems;
    procedure ReadItems(Reader: TReader);
    procedure WriteItems(Writer: TWriter);
    procedure SetHeader(const Value: TclHttpRequestHeader);
    function GetFormField(const AFieldName: string): TclFormFieldRequestItem;
    procedure GetTotalRequestData(AStream: TclMultiStream);
    function GenerateBoundary: string;
    function GetRequestSource: TStrings;
    function GetHeaderSource: TStrings;
    procedure SetHeaderSource(const Value: TStrings);
    procedure ParseMultiPartRequest(AStream: TStream);
    procedure ParseFormField(const AFieldInfo: string);
    procedure ParseFormFieldRequest(const ASource: string);
    function GetRequestAsStream: TStream;
    procedure SetRequestAsStream(const Value: TStream);
    procedure SetRequestSource(const Value: TStrings);
    function ReadLine(AStream: TStream; AMaxBytes: Integer): string;
    procedure DoOnHeaderChanged(Sender: TObject);
    procedure InitBoundary;
    procedure ClearDataStream;
    function CreateMultiPartItem(const AHeader: string): TclHttpRequestItem;
  protected
    function IsMultiPart: Boolean;
    function IsForm: Boolean;
    function CreateHeader: TclHttpRequestHeader; virtual;
    function CreateItem(AHeader, AFieldList: TStrings): TclHttpRequestItem; virtual;
    procedure CreateSingleItem(AStream: TStream); virtual;
    function GetContentType: string; virtual;
    procedure InitHeader; virtual;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DoGetDataStream(AItem: TclHttpRequestItem; var AData: TStream); dynamic;
    procedure DoGetDataSourceStream(AItem: TclHttpRequestItem; var AData: TStream); dynamic;
    procedure DoDataAdded(AItem: TclHttpRequestItem; AData: TStream); dynamic;
    procedure DoGetFormNumber(AParser: TclHtmlParser; var AFormNumber: Integer); dynamic;
    procedure Changed; dynamic;
    property DataStream: TStream read FDataStream write FDataStream;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function Add(AItemClass: TclHttpRequestItemClass): TclHttpRequestItem;
    function AddBinaryData: TclBinaryRequestItem;
    function AddTextData(const ATextData: string): TclTextRequestItem;
    function AddSubmitFile(const AFileName: string): TclSubmitFileRequestItem; overload;
    function AddSubmitFile(const AFileName, AFieldName: string): TclSubmitFileRequestItem; overload;
    function AddFormField(const AFieldName, AFieldValue: string): TclFormFieldRequestItem;
    procedure Delete(Index: Integer);
    procedure Move(CurIndex, NewIndex: Integer);
    procedure Clear; virtual;
    procedure BeginUpdate;
    procedure EndUpdate;
    function BuildFormPostRequest(AParser: TclHtmlParser): string; overload;
    function BuildFormPostRequest(AParser: TclHtmlParser; AFormNumber: Integer): string; overload;
    function BuildFormPostRequest(AHtml: TStrings): string; overload;
    function BuildFormPostRequest(const AUrl: string): string; overload;
    property RequestSource: TStrings read GetRequestSource write SetRequestSource;
    property HeaderSource: TStrings read GetHeaderSource write SetHeaderSource;
    property RequestStream: TStream read GetRequestAsStream write SetRequestAsStream;
    property Items[Index: Integer]: TclHttpRequestItem read GetItem; default;
    property FormFields[const AFieldName: string]: TclFormFieldRequestItem read GetFormField;
    property Count: Integer read GetCount;
    property TotalSize: Integer read GetTotalSize;
  published
    property Header: TclHttpRequestHeader read FHeader write SetHeader;
    property BatchSize: Integer read FBatchSize write FBatchSize default 8192;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property OnGetDataStream: TclGetDataStreamEvent read FOnGetDataStream write FOnGetDataStream;
    property OnGetDataSourceStream: TclGetDataStreamEvent read FOnGetDataSourceStream write FOnGetDataSourceStream;
    property OnDataAdded: TclDataAddedEvent read FOnDataAdded write FOnDataAdded;
    property OnGetFormNumber: TclGetFormNumberEvent read FOnGetFormNumber write FOnGetFormNumber;
  end;

procedure RegisterHttpRequestItem(AHeaderClass: TclHttpRequestItemClass);
function GetRegisteredHttpRequestItems: TList;

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsHttpRequestDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}

implementation

uses                         
  clWinInet, clDC, clUtils, Windows{$IFDEF DEMO}, Forms{$ENDIF};

const
  cFormDataContentType = 'application/x-www-form-urlencoded';
  cMultiPartContentType = 'multipart/form-data';

var
  RegisteredHttpRequestItems: TList = nil;

procedure RegisterHttpRequestItem(AHeaderClass: TclHttpRequestItemClass);
begin
  GetRegisteredHttpRequestItems().Add(AHeaderClass);
  Classes.RegisterClass(AHeaderClass);
end;

function GetRegisteredHttpRequestItems(): TList;
begin
  if (RegisteredHttpRequestItems = nil) then
  begin
    RegisteredHttpRequestItems := TList.Create();
  end;
  Result := RegisteredHttpRequestItems;
end;

{ TclHttpRequestItem }

procedure TclHttpRequestItem.Assign(Source: TPersistent);
begin
  if (Source is TclHttpRequestItem) then
  begin
    Canonicalized := TclHttpRequestItem(Source).Canonicalized;
  end else
  begin
    inherited Assign(Source);
  end;
end;

procedure TclHttpRequestItem.BeginUpdate;
begin
  if (Owner <> nil) then
  begin
    Owner.BeginUpdate();
  end;
end;

procedure TclHttpRequestItem.Update;
begin
  BeginUpdate();
  EndUpdate();
end;

constructor TclHttpRequestItem.Create(AOwner: TclHttpRequest);
begin
  inherited Create();
  SetOwner(AOwner);
  FCanonicalized := True;
end;

destructor TclHttpRequestItem.Destroy;
begin
  SetOwner(nil);
  inherited Destroy();
end;

procedure TclHttpRequestItem.EndUpdate;
begin
  if (Owner <> nil) then
  begin
    Owner.EndUpdate();
  end;
end;

procedure TclHttpRequestItem.ReadData(Reader: TReader);
begin
  BeginUpdate();
  try
    Canonicalized := Reader.ReadBoolean();
  finally
    EndUpdate();
  end;
end;

procedure TclHttpRequestItem.SetOwner(const Value: TclHttpRequest);
begin
  if (FOwner <> Value) then
  begin
    if (FOwner <> nil) then FOwner.RemoveItem(Self);
    FOwner := Value;
    if (FOwner <> nil) then FOwner.AddItem(Self);
  end;
end;

procedure TclHttpRequestItem.WriteData(Writer: TWriter);
begin
  Writer.WriteBoolean(Canonicalized);
end;

function TclHttpRequestItem.GetCanonicalizedValue(const AValue: string): string;
  function GetPos(const Substr, S: string): Integer;
  begin
    if LeadBytes = [] then
    begin
      Result := Pos(Substr, S);
    end else
    begin
      Result := AnsiPos(Substr, S);
    end;
  end;

const
  UnsafeChars = '+&*%<>"#{}|\^~[]''?!=/:$';
var
  i: Integer;
begin
  //TODO Canonicalized should be different for both multipart and formfield
  if (not Canonicalized) or ((Owner <> nil) and Owner.IsMultiPart()) then
  begin
    Result := AValue;
    Exit;
  end;
  
  Result := '';
  for i := 1 to Length(AValue) do
  begin
    if (GetPos(AValue[i], UnsafeChars) > 0) or (AValue[i] >= #$80) then
    begin
      Result := Result + '%' + IntToHex(Ord(AValue[i]), 2);
    end else
    if (AValue[i] = ' ') then
    begin
      Result := Result + '+';
    end else
    begin
      Result := Result + AValue[i];
    end;
  end
end;

procedure TclHttpRequestItem.SetCanonicalized(const Value: Boolean);
begin
  if (FCanonicalized <> Value) then
  begin
    FCanonicalized := Value;
    Update();
  end;
end;

function TclHttpRequestItem.GetSize: Integer;
var
  Stream: TStream;
begin
  Stream := GetData();
  try
    Result := Stream.Size;
  finally
    Stream.Free();
  end;
end;

procedure TclHttpRequestItem.ParseHeader(AHeader, AFieldList: TStrings);
begin
end;

{ TclHttpRequest }

function TclHttpRequest.GetContentType: string;
const
  RequestTypes: array[Boolean] of string = ('', cFormDataContentType);
var
  i: Integer;
  IsFormData: Boolean;
begin
  IsFormData := (Count > 0);
  for i := 0 to Count - 1 do
  begin
    if (Items[i] is TclSubmitFileRequestItem) then
    begin
      Result := cMultiPartContentType;
      Exit;
    end;
    IsFormData := IsFormData and (Items[i] is TclFormFieldRequestItem);
  end;
  Result := RequestTypes[IsFormData];
end;

procedure TclHttpRequest.AddItem(AItem: TclHttpRequestItem);
begin
  BeginUpdate();
  try
    FList.Add(AItem);
    if (not (csLoading in ComponentState)) and (not FIsParse) then
    begin
      Header.ContentType := GetContentType();
    end;
  finally
    EndUpdate();
  end;
end;

function TclHttpRequest.AddBinaryData: TclBinaryRequestItem;
begin
  BeginUpdate();
  try
    Result := Add(TclBinaryRequestItem) as TclBinaryRequestItem;
  finally
    EndUpdate();
  end;
end;

function TclHttpRequest.AddSubmitFile(const AFileName: string): TclSubmitFileRequestItem;
begin
  Result := AddSubmitFile(AFileName, 'FileName');
end;

function TclHttpRequest.AddFormField(const AFieldName, AFieldValue: string): TclFormFieldRequestItem;
begin
  BeginUpdate();
  try
    Result := Add(TclFormFieldRequestItem) as TclFormFieldRequestItem;
    Result.FieldName := AFieldName;
    Result.FieldValue := AFieldValue;
  finally
    EndUpdate();
  end;
end;

function TclHttpRequest.Add(AItemClass: TclHttpRequestItemClass): TclHttpRequestItem;
begin
  BeginUpdate();
  try
    Result := AItemClass.Create(Self);
  finally
    EndUpdate();
  end;
end;

function TclHttpRequest.AddTextData(const ATextData: string): TclTextRequestItem;
begin
  BeginUpdate();
  try
    Result := Add(TclTextRequestItem) as TclTextRequestItem;
    Result.TextData := ATextData;
  finally
    EndUpdate();
  end;
end;

procedure TclHttpRequest.Assign(Source: TPersistent);
var
  i: Integer;
  Item: TclHttpRequestItem;
begin
  if (Source is TclHttpRequest) then
  begin
    BeginUpdate();
    try
      Clear();
      for i := 0 to TclHttpRequest(Source).Count - 1 do
      begin
        Item := TclHttpRequest(Source).Items[i];
        Add(TclHttpRequestItemClass(Item.ClassType)).Assign(Item);
      end;
      Header.Assign(TclHttpRequest(Source).Header);
    finally
      EndUpdate();
    end;
  end else
  begin
    inherited Assign(Source);
  end;
end;

procedure TclHttpRequest.Clear;
begin
  BeginUpdate();
  try
    ClearItems();
    Header.Clear();
  finally
    EndUpdate();
  end;
end;

constructor TclHttpRequest.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRequestSource := TStringList.Create();
  FHeaderSource := TStringList.Create();
  FList := TList.Create();
  FHeader := CreateHeader();
  FHeader.OnChanged := DoOnHeaderChanged;
  FBatchSize := 8192;
end;

function TclHttpRequest.CreateHeader: TclHttpRequestHeader;
begin
  Result := TclHttpRequestHeader.Create();
end;

procedure TclHttpRequest.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('Items', ReadItems, WriteItems, (FList.Count > 0));
end;

procedure TclHttpRequest.Delete(Index: Integer);
begin
  BeginUpdate();
  try
    FList.Delete(Index);
  finally
    EndUpdate();
  end;
end;

procedure TclHttpRequest.ClearDataStream;
begin
  FDataStream.Free();
  FDataStream := nil;
end;

destructor TclHttpRequest.Destroy;
begin
  ClearDataStream();
  ClearItems();
  FHeader.Free();
  FList.Free();
  FHeaderSource.Free();
  FRequestSource.Free();
  inherited Destroy();
end;

function TclHttpRequest.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TclHttpRequest.GetItem(Index: Integer): TclHttpRequestItem;
begin
  Result := TclHttpRequestItem(FList[Index]);
end;

procedure TclHttpRequest.ReadItems(Reader: TReader);
var
  ItemClass: TclHttpRequestItemClass;
begin
  ClearItems();
  Reader.ReadListBegin();
  while not Reader.EndOfList() do
  begin
    ItemClass := TclHttpRequestItemClass(GetClass(Reader.ReadString()));
    if (ItemClass <> nil) then
    begin
      Add(ItemClass).ReadData(Reader);
    end;
  end;
  Reader.ReadListEnd();
end;

procedure TclHttpRequest.WriteItems(Writer: TWriter);
var
  i: Integer;
begin
  Writer.WriteListBegin();
  for i := 0 to Count - 1 do
  begin
    Writer.WriteString(Items[i].ClassName);
    Items[i].WriteData(Writer);
  end;
  Writer.WriteListEnd();
end;

procedure TclHttpRequest.Move(CurIndex, NewIndex: Integer);
begin
  BeginUpdate();
  try
    FList.Move(CurIndex, NewIndex);
  finally
    EndUpdate();
  end;
end;

procedure TclHttpRequest.RemoveItem(AItem: TclHttpRequestItem);
begin
  BeginUpdate();
  try
    FList.Remove(AItem);
    if (not (csLoading in ComponentState)) and (not FIsParse) then
    begin
      Header.ContentType := GetContentType();
    end;
  finally
    EndUpdate();
  end;
end;

procedure TclHttpRequest.ClearItems;
begin
  BeginUpdate();
  try
    while (Count > 0) do
    begin
      Items[Count - 1].Free();
    end;
  finally
    EndUpdate();
  end;
end;

procedure TclHttpRequest.SetHeader(const Value: TclHttpRequestHeader);
begin
  FHeader.Assign(Value);
end;

function TclHttpRequest.GenerateBoundary(): string;
var
  y, mm, d, h, m, s, ms: Word;
begin
  DecodeTime(Now(), h, m, s, ms);
  DecodeDate(Date(), y, mm, d);
  Result := IntToHex(mm, 2) + IntToHex(d, 2) + IntToHex(h, 2)
    + IntToHex(m, 2) + IntToHex(s, 2) + IntToHex(ms, 2);
  Result := '---------------------------' + system.Copy(Result, 1, 12);
end;          

function TclHttpRequest.GetRequestAsStream: TStream;
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
    if (not IsHttpRequestDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpRequestDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  FIsParse := True;
  try
    InitBoundary();
  finally
    FIsParse := False;
  end;

  Result := TclMultiStream.Create();
  try
    GetTotalRequestData(TclMultiStream(Result));
  except
    Result.Free();
    raise;
  end;
end;

procedure TclHttpRequest.GetTotalRequestData(AStream: TclMultiStream);
var
  i: Integer;
  s: string;
begin
  for i := 0 to Count - 1 do
  begin
    s := '';
    if IsMultiPart() then
    begin
      s := '--' + Header.Boundary + #13#10;
      if (i > 0) then
      begin
        s := #13#10 + s;
      end;
    end else
    if (i > 0) and IsForm() then
    begin
      s := '&';
    end;
    if (s <> '') then
    begin
      AStream.AddStream(TStringStream.Create(s));
    end;
    AStream.AddStream(Items[i].GetData());
  end;
  if isMultipart() then
  begin
    s := #13#10 + '--' + Header.Boundary + '--'#13#10;
    AStream.AddStream(TStringStream.Create(s));
  end;
end;

function TclHttpRequest.GetTotalSize: Integer;
var
  i: Integer;
  bound: string;
begin
  bound := GenerateBoundary();
  Result := 0;
  for i := 0 to Count - 1 do
  begin
    Result := Result + Items[i].GetSize();
  end;
  if IsMultiPart() then
  begin
    Result := Result
      + Length(#13#10 + '--' + bound + #13#10) * Count
      + Length('--' + bound + '--'#13#10);
  end else
  if IsForm() then
  begin
    Result := Result + Length('&') * (Count - 1);
  end;
end;

function TclHttpRequest.GetFormField(const AFieldName: string): TclFormFieldRequestItem;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if (Items[i] is TclFormFieldRequestItem) then
    begin
      Result := (Items[i] as TclFormFieldRequestItem);
      if (CompareText(Result.FieldName, AFieldName) = 0 )then Exit;
    end;
  end;
  Result := nil;
end;

procedure TclHttpRequest.DoGetDataStream(AItem: TclHttpRequestItem; var AData: TStream);
begin
  if Assigned(OnGetDataStream) then
  begin
    OnGetDataStream(Self, AItem, AData);
  end;
end;

procedure TclHttpRequest.DoGetDataSourceStream(AItem: TclHttpRequestItem; var AData: TStream);
begin
  if Assigned(OnGetDataSourceStream) then
  begin
    OnGetDataSourceStream(Self, AItem, AData);
  end;
end;

procedure TclHttpRequest.Changed;
begin
  if not FIsParse then
  begin
    Header.Boundary := '';
  end;
  FHeaderSource.Clear();
  FRequestSource.Clear();
  if Assigned(OnChanged) then
  begin
    OnChanged(Self);
  end;
end;

procedure TclHttpRequest.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TclHttpRequest.EndUpdate;
begin
  if (FUpdateCount > 0) then
  begin
    Dec(FUpdateCount);
    if (FUpdateCount = 0) then
    begin
      Changed();
    end;
  end;
end;

function TclHttpRequest.BuildFormPostRequest(AParser: TclHtmlParser;
  AFormNumber: Integer): string;
var
  i: Integer;
  Form: TclHtmlForm;
  TagName, ControlType, ControlName, OldName: string;
  isMultiPartReq: Boolean;
begin
  Clear();
  Result := '';
  if AParser.Forms.Count = 0 then Exit;
  Form := AParser.Forms[AFormNumber];
  Result := Form.Action;
  OldName := '';
  isMultiPartReq := SameText('multipart/form-data', Form.EncType);
  for i := 0 to Form.Controls.Count - 1 do
  begin
    TagName := LowerCase(Form.Controls[i].Name);
    ControlName := Form.Controls[i].AttributeValue('name');
    if (TagName = 'input') then
    begin
      ControlType := LowerCase(Form.Controls[i].AttributeValue('type'));
      if (ControlType = 'checkbox')
        or (ControlType = 'hidden')
        or (ControlType = 'password')
        or (ControlType = 'text')
        or (ControlType = '') then
      begin
        AddFormField(ControlName, Form.Controls[i].AttributeValue('value'));
      end else
      if (ControlType = 'radio') then
      begin
        if (OldName <> ControlName) then
        begin
          OldName := ControlName;
          AddFormField(ControlName, '');
        end;
      end else
      if (ControlType = 'file') then
      begin
        if isMultiPartReq then
        begin
          AddSubmitFile(Form.Controls[i].AttributeValue('value'), ControlName);
        end else
        begin
          AddFormField(ControlName, Form.Controls[i].AttributeValue('value'));
        end;
      end;
    end else
    if (TagName = 'select')
      or (TagName = 'textarea') then
    begin
      AddFormField(ControlName, '');
    end;
  end;
  if SameText(Form.Method, 'GET') then
  begin
    Header.ContentType := '';
  end;
end;

function TclHttpRequest.BuildFormPostRequest(AParser: TclHtmlParser): string;
var
  FormNumber: Integer;
begin
  FormNumber := 0;
  DoGetFormNumber(AParser, FormNumber);
  Result := BuildFormPostRequest(AParser, FormNumber);
end;

function TclHttpRequest.BuildFormPostRequest(const AUrl: string): string;
var
  Html: TStrings;
  buf: array[0..INTERNET_MAX_URL_LENGTH - 1] of Char;
  len: DWORD;
  s: string;
begin
  Html := TStringList.Create();
  try
    DownloadUrl(AUrl, 5000, Html);
    len := SizeOf(buf);
    s := BuildFormPostRequest(Html);
    InternetCombineUrl(PChar(AUrl), PChar(s), buf, len, ICU_BROWSER_MODE);
    Result := buf;
  finally
    Html.Free();
  end;
end;

function TclHttpRequest.BuildFormPostRequest(AHtml: TStrings): string;
var
  Parser: TclHtmlParser;
begin
  Parser := TclHtmlParser.Create(nil);
  try
    Parser.Parse(AHtml);
    Result := BuildFormPostRequest(Parser);
  finally
    Parser.Free();
  end;
end;

procedure TclHttpRequest.DoGetFormNumber(AParser: TclHtmlParser; var AFormNumber: Integer);
begin
  if Assigned(OnGetFormNumber) then
  begin
    OnGetFormNumber(Self, AParser, AFormNumber);
  end;
end;

function TclHttpRequest.GetRequestSource: TStrings;
var
  Stream: TStream;
begin
  if (FRequestSource.Count = 0) then
  begin
    Stream := GetRequestAsStream();
    try
      FRequestSource.LoadFromStream(Stream);
    finally
      Stream.Free();
    end;
  end;
  Result := FRequestSource;
end;

procedure TclHttpRequest.InitBoundary;
begin
  if IsMultiPart() then
  begin
    if (Header.Boundary = '') then
    begin
      Header.Boundary := GenerateBoundary();
    end;
  end else
  begin
    Header.Boundary := '';
  end;
end;

procedure TclHttpRequest.InitHeader;
begin
  InitBoundary();

  Header.ContentLength := IntToStr(TotalSize);
  if (Header.ContentLength = '0') then
  begin
    Header.ContentLength := '';
  end;
end;

function TclHttpRequest.GetHeaderSource: TStrings;
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
    if (not IsHttpRequestDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpRequestDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}

  if (FHeaderSource.Count = 0) then
  begin
    FIsParse := True;
    try
      InitHeader();
    finally
      FIsParse := False;
    end;

    Header.AssignHeader(FHeaderSource);
  end;
  Result := FHeaderSource;
end;

procedure TclHttpRequest.SetHeaderSource(const Value: TStrings);
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
    if (not IsHttpRequestDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpRequestDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  FIsParse := True;
  try
    Header.ParseHeader(Value);
  finally
    FIsParse := False;
  end;
end;

procedure TclHttpRequest.ParseFormField(const AFieldInfo: string);
var
  ind: Integer;
  name, val: string;
begin
  ind := Pos('=', AFieldInfo);
  if (ind > 0) then
  begin
    name := Copy(AFieldInfo, 1, ind - 1);
    val := Copy(AFieldInfo, ind + 1, Length(AFieldInfo));
  end else
  begin
    name := AFieldInfo;
    val := '';
  end;
  AddFormField(Trim(Name), Trim(val)).AfterAddData();
end;

procedure TclHttpRequest.ParseFormFieldRequest(const ASource: string);
var
  i: Integer;
  s: string;
begin
  s := '';
  for i := 1 to Length(ASource) do
  begin
    if (ASource[i] = '&') then
    begin
      ParseFormField(s);
      s := '';
    end else
    begin
      s := s + ASource[i];
    end;
  end;
  if (s <> '') then
  begin
    ParseFormField(s);
  end;
end;

function TclHttpRequest.ReadLine(AStream: TStream; AMaxBytes: Integer): string;
const
  cDelimiter = #13#10;

var
  delimCount: Integer;
  Symbol: Char;
begin
  Result := '';
  delimCount := 0;
  Assert(AMaxBytes > 0);

  while (AMaxBytes > 0) and (AStream.Read(Symbol, 1) > 0) do
  begin
    if (Symbol = cDelimiter[delimCount + 1]) then
    begin
      Inc(delimCount);
    end else
    begin
      delimCount := 0;
    end;

    if (delimCount >= Length(cDelimiter)) then
    begin
      Break;
    end;

    Result := Result + Symbol;
    Dec(AMaxBytes);
  end;
end;

function TclHttpRequest.CreateItem(AHeader, AFieldList: TStrings): TclHttpRequestItem;
var
  fileName, contDisposition: string;
begin
  contDisposition := GetHeaderFieldValue(AHeader, AFieldList, 'Content-Disposition');
  if (LowerCase(GetHeaderFieldValueItem(contDisposition, '')) = 'form-data') then
  begin
    fileName := GetHeaderFieldValueItem(contDisposition, 'filename=');
    if (fileName <> '') then
    begin
      Result := AddSubmitFile(fileName);
    end else
    begin
      Result := AddFormField(GetHeaderFieldValueItem(contDisposition, 'name='), '');
    end;
  end else
  begin
    Result := AddTextData('');
  end;
end;

procedure TclHttpRequest.ParseMultiPartRequest(AStream: TStream);
var
  buf: PChar;
  i, len, dataSize, bufSize,
  boundCnt, eofHeadCnt, startPos: Integer;
  bound, eofHead, head, temp: string;
  item: TclHttpRequestItem;
begin
  bufSize := BatchSize;
  if (bufSize < Length(Header.Boundary)) then
  begin
    bufSize := Length(Header.Boundary);
  end;
  if (bufSize > AStream.Size - AStream.Position) then
  begin
    bufSize := AStream.Size - AStream.Position;
  end;

  GetMem(buf, bufSize);
  try
    bound := #13#10'--' + Header.Boundary;
    eofHead := #13#10#13#10;

    head := '';
    temp := '';
    item := nil;
    boundCnt := 2;
    eofHeadCnt := 0;
    len := bufSize;
    while (len > 0) do
    begin
      len := AStream.Read(buf^, bufSize);

      startPos := 0;
      for i := 0 to len - 1 do
      begin
        if ((buf + i)^ = bound[boundCnt + 1]) then
        begin
          Inc(boundCnt);
        end else
        begin
          boundCnt := 0;
          if ((buf + i)^ = bound[boundCnt + 1]) then
          begin
            Inc(boundCnt);
          end;

          if (temp <> '') and (item <> nil) then
          begin
            item.AddData(PChar(temp), Length(temp));
          end;
          temp := '';
        end;

        if ((buf + i)^ = eofHead[eofHeadCnt + 1]) then
        begin
          Inc(eofHeadCnt);
        end else
        begin
          eofHeadCnt := 0;
          if ((buf + i)^ = eofHead[eofHeadCnt + 1]) then
          begin
            Inc(eofHeadCnt);
          end;
        end;

        if (boundCnt >= Length(bound)) then
        begin
          dataSize := i - startPos - boundCnt + 1;
          if (item <> nil) and (startPos < len) and (dataSize > 0) then
          begin
            item.AddData((buf + startPos), dataSize);
            item.AfterAddData();
          end;
          item := nil;
          head := '';
          startPos := 0;
          boundCnt := 0;
        end else
        if (item = nil) then
        begin
          head := head + (buf + i)^;
          if (eofHeadCnt >= Length(eofHead)) then
          begin
            item := CreateMultiPartItem(Trim(head));
            head := '';
            startPos := i + 1;
          end;
        end;

        if (eofHeadCnt >= Length(eofHead)) then
        begin
          eofHeadCnt := 0;
        end;
      end;

      dataSize := len - startPos - boundCnt;
      if (item <> nil) and (startPos < len) and (dataSize > 0) then
      begin
        if (boundCnt > 0) then
        begin
          temp := temp + system.Copy((buf + len - boundCnt), 1, boundCnt);
        end;
        item.AddData((buf + startPos), dataSize);
      end;
    end;
  finally
    FreeMem(buf);
  end;
end;

procedure TclHttpRequest.SetRequestAsStream(const Value: TStream);
var
  s: string;
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
    if (not IsHttpRequestDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsHttpRequestDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  FIsParse := True;
  BeginUpdate();
  try
    ClearItems();
    if (Value = nil) then Exit;

    s := ReadLine(Value, 250);
    Value.Position := 0;
    if (Pos('--', s) = 1) then
    begin
      system.Delete(s, 1, 2);
      Header.Boundary := Trim(s);
      ParseMultiPartRequest(Value);
    end else
    begin
      Header.Boundary := '';
      CreateSingleItem(Value);
    end;
  finally
    ClearDataStream();
    EndUpdate();
    FIsParse := False;
  end;
end;

procedure TclHttpRequest.CreateSingleItem(AStream: TStream);
var
  s: string;
begin
  SetLength(s, AStream.Size);
  AStream.Read(Pointer(s)^, AStream.Size);
  if SameText(Header.ContentType, cFormDataContentType) then
  begin
    ParseFormFieldRequest(s);
  end else
  begin
    AddTextData(s).AfterAddData();
  end;
end;

procedure TclHttpRequest.DoOnHeaderChanged(Sender: TObject);
begin
  BeginUpdate();
  EndUpdate();
end;

function TclHttpRequest.IsForm: Boolean;
begin
  Result := SameText(cFormDataContentType, Header.ContentType)
end;

function TclHttpRequest.IsMultiPart: Boolean;
begin
  Result := (system.Pos('multipart/', LowerCase(Header.ContentType)) > 0);
end;

procedure TclHttpRequest.DoDataAdded(AItem: TclHttpRequestItem; AData: TStream);
begin
  if Assigned(OnDataAdded) then
  begin
    OnDataAdded(Self, AItem, AData);
  end;
end;

function TclHttpRequest.CreateMultiPartItem(const AHeader: string): TclHttpRequestItem;
var
  hdr, FieldList: TStrings;
begin
  ClearDataStream();
  hdr := nil;
  FieldList := nil;
  try
    hdr := TStringList.Create();
    FieldList := TStringList.Create();
    hdr.Text := AHeader;

    GetHeaderFieldList(0, hdr, FieldList);

    Result := CreateItem(hdr, FieldList);
    Result.ParseHeader(hdr, FieldList);
  finally
    FieldList.Free();
    hdr.Free();
  end;
end;

procedure TclHttpRequest.SetRequestSource(const Value: TStrings);
var
  stream: TStream;
begin
  stream := TMemoryStream.Create();
  try
    if (Value <> nil) then
    begin
      Value.SaveToStream(stream);
      stream.Position := 0;
    end;
    RequestStream := stream;
  finally
    stream.Free();
  end;
end;

function TclHttpRequest.AddSubmitFile(const AFileName, AFieldName: string): TclSubmitFileRequestItem;
begin
  BeginUpdate();
  try
    Result := Add(TclSubmitFileRequestItem) as TclSubmitFileRequestItem;
    Result.FileName := AFileName;
    Result.FieldName := AFieldName;
  finally
    EndUpdate();
  end;
end;

{ TclBinaryRequestItem }

function TclBinaryRequestItem.GetData: TStream;
begin
  Result := nil;
  if (Owner <> nil) then
  begin
    Owner.DoGetDataSourceStream(Self, Result);
  end;
  if (Result = nil) then
  begin
    Result := TclNullStream.Create();
  end;
  Result.Position := 0;
end;

procedure TclBinaryRequestItem.AddData(const AData: PChar; ADataSize: Integer);
var
  stream: TStream;
begin
  if (Owner = nil) then Exit;

  if (Owner.DataStream = nil) then
  begin
    stream := nil;
    Owner.DoGetDataStream(Self, stream);
    Owner.DataStream := stream;
  end;
  if (Owner.DataStream <> nil) then
  begin
    Owner.DataStream.Write(AData^, ADataSize);
  end;
end;

procedure TclBinaryRequestItem.AfterAddData;
begin
  if (Owner = nil) then Exit;

  if (Owner.DataStream <> nil) and Assigned(Owner.OnDataAdded) then
  begin
    Owner.DataStream.Position := 0;
    Owner.DoDataAdded(Self, Owner.DataStream);
  end;
end;

{ TclTextRequestItem }

procedure TclTextRequestItem.Assign(Source: TPersistent);
begin
  BeginUpdate();
  try
    if (Source is TclTextRequestItem) then
    begin
      TextData := (Source as TclTextRequestItem).TextData;
    end;
    inherited Assign(Source);
  finally
    EndUpdate();
  end;
end;

function TclTextRequestItem.GetData: TStream;
begin
  Result := TStringStream.Create(TextData);
end;

procedure TclTextRequestItem.ReadData(Reader: TReader);
begin
  BeginUpdate();
  try
    inherited ReadData(Reader);
    TextData := Reader.ReadString();
  finally
    EndUpdate();
  end;
end;

procedure TclTextRequestItem.WriteData(Writer: TWriter);
begin
  inherited WriteData(Writer);
  Writer.WriteString(TextData);
end;

procedure TclTextRequestItem.SetTextData(const Value: string);
begin
  if (FTextData <> Value) then
  begin
    FTextData := Value;
    Update();
  end;
end;

procedure TclTextRequestItem.AddData(const AData: PChar; ADataSize: Integer);
begin
  TextData := TextData + system.Copy(AData, 1, ADataSize);
end;

procedure TclTextRequestItem.AfterAddData;
var
  stream: TStream;
begin
  if (Owner = nil) then Exit;

  if Assigned(Owner.OnDataAdded) then
  begin
    stream := TStringStream.Create(TextData);
    try
      Owner.DoDataAdded(Self, stream);
    finally
      stream.Free();
    end;
  end;
end;

{ TclSubmitFileRequestItem }

procedure TclSubmitFileRequestItem.Assign(Source: TPersistent);
var
  Src: TclSubmitFileRequestItem;
begin
  BeginUpdate();
  try
    if (Source is TclSubmitFileRequestItem) then
    begin
      Src := (Source as TclSubmitFileRequestItem);
      FieldName := Src.FieldName;
      FileName := Src.FileName;
      ContentType := Src.ContentType;
    end;
    inherited Assign(Source);
  finally
    EndUpdate();
  end;
end;

constructor TclSubmitFileRequestItem.Create(AOwner: TclHttpRequest);
begin
  inherited Create(AOwner);
  FFieldName := 'FileName';
  FContentType := 'application/octet-stream';
end;

function TclSubmitFileRequestItem.GetData: TStream;
var
  stream: TStream;
begin
  if (Owner <> nil) and Owner.IsMultiPart() then
  begin
    Result := TclMultiStream.Create();
    try
      TclMultiStream(Result).AddStream(TStringStream.Create(
        Format('Content-Disposition: form-data; name="%s"; filename="%s"'#13#10
          + 'Content-Type: %s'#13#10#13#10,
        [GetCanonicalizedValue(FieldName), GetCanonicalizedValue(ExtractFileName(FileName)), ContentType])));

      stream := nil;
      Owner.DoGetDataSourceStream(Self, stream);
      if (stream = nil) then
      begin
        TclMultiStream(Result).AddStream(TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone));
      end else
      begin
        TclMultiStream(Result).AddStream(stream);
      end;
    except
      Result.Free();
      raise;
    end;
  end else
  begin
    Result := TclNullStream.Create();
  end;
end;

procedure TclSubmitFileRequestItem.ReadData(Reader: TReader);
begin
  BeginUpdate();
  try
    inherited ReadData(Reader);
    FieldName := Reader.ReadString();
    FileName := Reader.ReadString();
    ContentType := Reader.ReadString();
  finally
    EndUpdate();
  end;
end;

procedure TclSubmitFileRequestItem.WriteData(Writer: TWriter);
begin
  inherited WriteData(Writer);
  Writer.WriteString(FieldName);
  Writer.WriteString(FileName);
  Writer.WriteString(ContentType);
end;

procedure TclSubmitFileRequestItem.SetContentType(const Value: string);
begin
  if (FContentType <> Value) then
  begin
    FContentType := Value;
    Update();
  end;
end;

procedure TclSubmitFileRequestItem.SetFieldName(const Value: string);
begin
  if (FFieldName <> Value) then
  begin
    FFieldName := Value;
    Update();
  end;
end;

procedure TclSubmitFileRequestItem.SetFileName(const Value: string);
begin
  if (FFileName <> Value) then
  begin
    FFileName := Value;
    Update();
  end;
end;

procedure TclSubmitFileRequestItem.AddData(const AData: PChar; ADataSize: Integer);
var
  stream: TStream;
begin
  if (Owner = nil) then Exit;

  if (Owner.DataStream = nil) then
  begin
    stream := nil;
    Owner.DoGetDataStream(Self, stream);
    Owner.DataStream := stream;
  end;
  if (Owner.DataStream <> nil) then
  begin
    Owner.DataStream.Write(AData^, ADataSize);
  end;
end;

procedure TclSubmitFileRequestItem.AfterAddData;
begin
  if (Owner = nil) then Exit;

  if (Owner.DataStream <> nil) and Assigned(Owner.OnDataAdded) then
  begin
    Owner.DataStream.Position := 0;
    Owner.DoDataAdded(Self, Owner.DataStream);
  end;
end;

procedure TclSubmitFileRequestItem.ParseHeader(AHeader, AFieldList: TStrings);
var
  s: string;
begin
  BeginUpdate();
  try
    inherited ParseHeader(AHeader, AFieldList);

    ContentType := GetHeaderFieldValue(AHeader, AFieldList, 'Content-Type');

    s := GetHeaderFieldValue(AHeader, AFieldList, 'Content-Disposition');
    FieldName := GetHeaderFieldValueItem(s, 'name=');
  finally
    EndUpdate();
  end;
end;

{ TclFormFieldRequestItem }

function TclFormFieldRequestItem.GetData: TStream;
begin
  Result := TStringStream.Create(GetRequest());
end;

function TclFormFieldRequestItem.GetRequest(): string;
begin
  Result := '';
  if (Owner = nil) then Exit;

  if Owner.IsMultiPart() then
  begin
    Result := Format('Content-Disposition: form-data; name="%s"'#13#10#13#10'%s',
      [GetCanonicalizedValue(FieldName), GetCanonicalizedValue(FieldValue)]);
  end else
  if Owner.IsForm() then
  begin
    Result := Format('%s=%s', [GetCanonicalizedValue(FieldName), GetCanonicalizedValue(FieldValue)]);
  end;
end;

procedure TclFormFieldRequestItem.ReadData(Reader: TReader);
begin
  BeginUpdate();
  try
    inherited ReadData(Reader);
    FieldName := Reader.ReadString();
    FieldValue := Reader.ReadString();
  finally
    EndUpdate();
  end;
end;

procedure TclFormFieldRequestItem.WriteData(Writer: TWriter);
begin
  inherited WriteData(Writer);
  Writer.WriteString(FieldName);
  Writer.WriteString(FieldValue);
end;

procedure TclFormFieldRequestItem.Assign(Source: TPersistent);
var
  Src: TclFormFieldRequestItem;
begin
  BeginUpdate();
  try
    if (Source is TclFormFieldRequestItem) then
    begin
      Src := (Source as TclFormFieldRequestItem);
      FieldName :=  Src.FieldName;
      FieldValue := Src.FieldValue;
    end;
    inherited Assign(Source);
  finally
    EndUpdate();
  end;
end;

procedure TclFormFieldRequestItem.SetFieldName(const Value: string);
begin
  if (FFieldName <> Value) then
  begin
    FFieldName := Value;
    Update();
  end;
end;

procedure TclFormFieldRequestItem.SetFieldValue(const Value: string);
begin
  if (FFieldValue <> Value) then
  begin
    FFieldValue := Value;
    Update();
  end;
end;

procedure TclFormFieldRequestItem.AddData(const AData: PChar; ADataSize: Integer);
begin
  FieldValue := FieldValue + system.Copy(AData, 1, ADataSize);
end;

procedure TclFormFieldRequestItem.AfterAddData;
var
  stream: TStream;
begin
  if (Owner = nil) then Exit;

  if Assigned(Owner.OnDataAdded) then
  begin
    stream := TStringStream.Create(FieldValue);
    try
      Owner.DoDataAdded(Self, stream);
    finally
      stream.Free();
    end;
  end;
end;

initialization
  RegisterHttpRequestItem(TclBinaryRequestItem);
  RegisterHttpRequestItem(TclTextRequestItem);
  RegisterHttpRequestItem(TclSubmitFileRequestItem);
  RegisterHttpRequestItem(TclFormFieldRequestItem);

finalization
  RegisteredHttpRequestItems.Free();

end.

