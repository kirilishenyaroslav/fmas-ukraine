{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clMailMessage;

interface

{$I clVer.inc}

uses
  Classes, SysUtils, clEncoder;

type
  TclMessagePriority = (mpLow, mpNormal, mpHigh);
  TclMessageFormat = (mfNone, mfMIME, mfUUencode);

  TclMailMessage = class;
  TclMessageBodies = class;
  TclMessageBody = class;

  TclGetBodyStreamEvent = procedure (Sender: TObject; ABody: TclMessageBody;
    const AFileName: string; var AData: TStream; var Handled: Boolean) of object;

  TclBodyDataAddedEvent = procedure (Sender: TObject; ABody: TclMessageBody; AData: TStream) of object;

  TclBodyEncodingProgress = procedure (Sender: TObject; ABodyNo, ABytesProceed, ATotalBytes: Integer) of object;

  EclMailMessageError = class(Exception);

  TclMessageBody = class(TPersistent)
  private
    FOwner: TclMessageBodies;
    FContentType: string;
    FEncoding: TclEncodeMethod;
    FEncoder: TclEncoder;
    FContentDisposition: string;
    FExtraFields: TStrings;
    FKnownFields: TStrings;
    FRawHeader: TStrings;
    FEncodedSize: Integer;
    FEncodedLines: Integer;
    FRawBodyStart: Integer;
    procedure SetContentType(const Value: string);
    procedure SetContentDisposition(const Value: string);
    procedure SetEncoding(const Value: TclEncodeMethod);
    procedure DoOnListChanged(Sender: TObject);
    procedure DoOnEncoderProgress(Sender: TObject; ABytesProceed, ATotalBytes: Integer);
    function GetIndex: Integer;
    procedure SetExtraFields(const Value: TStrings);
  protected
    procedure SetListChangedEvent(AList: TStringList);
    function GetMailMessage: TclMailMessage;
    procedure ReadData(Reader: TReader); virtual;
    procedure WriteData(Writer: TWriter); virtual;
    function HasEncodedData: Boolean; virtual;
    procedure AddData(AData: TStream; AEncodedLines: Integer);
    function GetData: TStream;
    function GetEncoding: TclEncodeMethod; virtual;
    procedure AssignBodyHeader(ASource: TStrings); virtual;
    procedure ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings); virtual;
    function GetSourceStream: TStream; virtual; abstract;
    function GetDestinationStream: TStream; virtual; abstract;
    procedure BeforeDataAdded(AData: TStream); virtual;
    procedure DataAdded(AData: TStream); virtual;
    procedure DecodeData(ASource, ADestination: TStream); virtual;
    procedure EncodeData(ASource, ADestination: TStream); virtual;
    procedure DoCreate; virtual;
    procedure RegisterField(const AField: string);
    procedure RegisterFields; virtual;
    property KnownFields: TStrings read FKnownFields;
  public
    constructor Create(AOwner: TclMessageBodies); virtual;
    destructor Destroy(); override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear(); virtual;
    property ContentType: string read FContentType write SetContentType;
    property ContentDisposition: string read FContentDisposition write SetContentDisposition;
    property Encoding: TclEncodeMethod read GetEncoding write SetEncoding;
    property Index: Integer read GetIndex;
    property ExtraFields: TStrings read FExtraFields write SetExtraFields;
    property EncodedSize: Integer read FEncodedSize;
    property EncodedLines: Integer read FEncodedLines;
    property RawHeader: TStrings read FRawHeader;
    property RawBodyStart: Integer read FRawBodyStart;
  end;

  TclMessageBodyClass = class of TclMessageBody;

  TclTextBody = class(TclMessageBody)
  private
    FCharSet: string;
    FStrings: TStrings;
    procedure SetStrings(const Value: TStrings);
    procedure SetCharSet(const Value: string);
  protected
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    procedure AssignBodyHeader(ASource: TStrings); override;
    procedure ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings); override;
    function GetSourceStream: TStream; override;
    function GetDestinationStream: TStream; override;
    procedure DataAdded(AData: TStream); override;
    procedure DoCreate; override;
  public
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear; override;
    property Strings: TStrings read FStrings write SetStrings;
    property CharSet: string read FCharSet write SetCharSet;
  end;

  TclMultipartBody = class(TclMessageBody)
  private
    FBodies: TclMessageBodies;
    FMailMessage: TclMailMessage;
    FContentSubType: string;
    procedure SetBodies(const Value: TclMessageBodies);
    procedure SetBoundary(const Value: string);
    procedure SetContentSubType(const Value: string);
    function GetBoundary: string;
    procedure DoOnGetDataStream(Sender: TObject; ABody: TclMessageBody;
      const AFileName: string; var AStream: TStream; var Handled: Boolean);
    procedure DoOnGetDataSourceStream(Sender: TObject; ABody: TclMessageBody;
      const AFileName: string; var AStream: TStream; var Handled: Boolean);
    procedure DoOnDataAdded(Sender: TObject; ABody: TclMessageBody; AData: TStream);
  protected
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    function HasEncodedData: Boolean; override;
    procedure AssignBodyHeader(ASource: TStrings); override;
    procedure ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings); override;
    function GetSourceStream: TStream; override;
    function GetDestinationStream: TStream; override;
    procedure DataAdded(AData: TStream); override;
    procedure DoCreate; override;
  public
    destructor Destroy(); override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear(); override;
    property Boundary: string read GetBoundary;
    property Bodies: TclMessageBodies read FBodies write SetBodies;
    property ContentSubType: string read FContentSubType write SetContentSubType;
  end;

  TclAttachmentBody = class(TclMessageBody)
  private
    FContentID: string;
    FFileName: string;
    procedure AssignEncodingIfNeed;
    procedure SetContentID(const Value: string);
    function GetContentID(ASource, AFieldList: TStrings): string;
    function GetMessageRfc822FileName(ABodyPos: Integer; ASource: TStrings): string;
  protected
    procedure SetFileName(const Value: string); virtual;
    procedure ReadData(Reader: TReader); override;
    procedure WriteData(Writer: TWriter); override;
    function GetEncoding: TclEncodeMethod; override;
    procedure AssignBodyHeader(ASource: TStrings); override;
    procedure ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings); override;
    function GetSourceStream: TStream; override;
    function GetDestinationStream: TStream; override;
    procedure RegisterFields; override;
  public
    procedure Assign(Source: TPersistent); override;
    procedure Clear(); override;
    property FileName: string read FFileName write SetFileName;
    property ContentID: string read FContentID write SetContentID;
  end;

  TclImageBody = class(TclAttachmentBody)
  private
    function GetUniqueContentID(const AFileName: string): string;
    function GetFileType(const AFileName: string): string;
  protected
    procedure SetFileName(const Value: string); override;
    procedure AssignBodyHeader(ASource: TStrings); override;
    procedure ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings); override;
  public
    procedure Clear(); override;
  end;

  TclMessageBodies = class(TPersistent)
  private
    FOwner: TclMailMessage;
    FList: TList;
    function GetItem(Index: Integer): TclMessageBody;
    function GetCount: Integer;
    procedure Add(AItem: TclMessageBody);
  protected
    function GetMailMessage: TclMailMessage;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadData(Reader: TReader); virtual;
    procedure WriteData(Writer: TWriter); virtual;
    function AddItem(AItemClass: TclMessageBodyClass): TclMessageBody;
  public
    constructor Create(AOwner: TclMailMessage);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function AddText(const AText: string): TclTextBody;
    function AddHtml(const AText: string): TclTextBody;
    function AddMultipart: TclMultipartBody;
    function AddAttachment(const AFileName: string): TclAttachmentBody;
    function AddImage(const AFileName: string): TclImageBody;
    procedure Delete(Index: Integer);
    procedure Move(CurIndex, NewIndex: Integer);
    procedure Clear;
    property Items[Index: Integer]: TclMessageBody read GetItem; default;
    property Count: Integer read GetCount;
  end;

  TclMailMessage = class(TComponent)
  private
    FCharSet: string;
    FSubject: string;
    FPriority: TclMessagePriority;
    FDate: TDateTime;
    FBodies: TclMessageBodies;
    FBCCList: TStrings;
    FCCList: TStrings;
    FToList: TStrings;
    FFrom: string;
    FMessageFormat: TclMessageFormat;
    FBoundary: string;
    FEncoding: TclEncodeMethod;
    FUpdateCount: Integer;
    FDataStream: TMemoryStream;
    FIsParse: Boolean;
    FOnChanged: TNotifyEvent;
    FOnGetDataStream: TclGetBodyStreamEvent;
    FOnDataAdded: TclBodyDataAddedEvent;
    FOnEncodingProgress: TclBodyEncodingProgress;
    FContentType: string;
    FContentSubType: string;
    FHeaderSource: TStrings;
    FBodiesSource: TStrings;
    FMessageSource: TStrings;
    FIncludeRFC822Header: Boolean;
    FReplyTo: string;
    FMessageID: string;
    FExtraFields: TStrings;
    FNewsGroups: TStrings;
    FReferences: TStrings;
    FLinesFieldPos: Integer;
    FReadReceiptTo: string;
    FOnGetDataSourceStream: TclGetBodyStreamEvent;
    FContentDisposition: string;
    FKnownFields: TStrings;
    FMimeOLE: string;
    FRawHeader: TStrings;
    FCharsPerLine: Integer;
    FRawBodyStart: Integer;
    procedure InternalParseHeader(ASource: TStrings);
    function ParseBodyHeader(AStartFrom: Integer; ASource: TStrings): TclMessageBody;
    procedure AssignBodyHeader(ASource: TStrings; ABody: TclMessageBody);
    procedure AfterAddData(ABody: TclMessageBody; AEncodedLines: Integer);
    procedure GetBodyFromSource(const ASource: string);
    procedure AddBodyToSource(ASource: TStrings; ABody: TclMessageBody);
    procedure SetBCCList(const Value: TStrings);
    procedure SetBodies(const Value: TclMessageBodies);
    procedure SetCCList(const Value: TStrings);
    procedure SetToList(const Value: TStrings);
    procedure SetCharSet(const Value: string);
    procedure SetDate(const Value: TDateTime);
    procedure SetEncoding(const Value: TclEncodeMethod);
    procedure SetFrom(const Value: string);
    procedure SetMessageFormat(const Value: TclMessageFormat);
    procedure SetPriority(const Value: TclMessagePriority);
    procedure SetSubject(const Value: string);
    procedure SetContentType(const Value: string);
    procedure SetContentSubType(const Value: string);
    procedure DoOnListChanged(Sender: TObject);
    procedure BuildImages(ABodies: TclMessageBodies; const AText, AHtml: string; AImages: TStrings);
    function BuildAlternative(ABodies: TclMessageBodies; const AText,
      AHtml: string): string;
    procedure BuildAttachments(ABodies: TclMessageBodies;
      Attachments: TStrings);
    function GetHeaderSource: TStrings;
    function GetBodiesSource: TStrings;
    function GetMessageSource: TStrings;
    procedure SetHeaderSource(const Value: TStrings);
    procedure SetMessageSource(const Value: TStrings);
    procedure SetIncludeRFC822Header(const Value: Boolean);
    procedure SetCharsPerLine(const Value: Integer);
    function ParseDate(ASource, AFieldList: TStrings): TDateTime;
    procedure SetExtraFields(const Value: TStrings);
    procedure SetNewsGroups(const Value: TStrings);
    procedure SetReferences(const Value: TStrings);
    procedure SetReplyTo(const Value: string);
    function BuildDelimitedField(AValues: TStrings;
      const ADelimiter: string): string;
    procedure InternalGetBodyText(ABodies: TclMessageBodies; AStrings: TStrings);
    procedure SetReadReceiptTo(const Value: string);
    procedure SetMessageID(const Value: string);
    procedure SetContentDisposition(const Value: string);
    function IsUUEBodyStart(const ALine: string; var AFileName: string): Boolean;
    function IsUUEBodyEnd(const ALine: string): Boolean;
    procedure SetMimeOLE(const Value: string);
  protected
    procedure SafeClear;
    procedure SetBoundary(const Value: string);
    procedure ParseBodies(ASource: TStrings);
    function ParseAllHeaders(AStartFrom: Integer; ASource, AHeaders: TStrings): Integer;
    procedure ParseExtraFields(AHeader, AKnownFields, AExtraFields: TStrings);
    procedure InternalAssignBodies(ASource: TStrings);
    procedure InternalAssignHeader(ASource: TStrings);
    procedure GenerateBoundary;
    function CreateBody(ABodies: TclMessageBodies;
      const AContentType, ADisposition: string): TclMessageBody; virtual;
    function CreateSingleBody(ASource: TStrings; ABodies: TclMessageBodies): TclMessageBody; virtual;
    function CreateUUEAttachmentBody(ABodies: TclMessageBodies;
      const AFileName: string): TclAttachmentBody; virtual;
    procedure Changed; virtual;
    procedure DoGetDataStream(ABody: TclMessageBody;
      const AFileName: string; var AData: TStream; var Handled: Boolean); virtual;
    procedure DoGetDataSourceStream(ABody: TclMessageBody;
      const AFileName: string; var AData: TStream; var Handled: Boolean); virtual;
    procedure DoDataAdded(ABody: TclMessageBody; AData: TStream); virtual;
    procedure DoEncodingProgress(ABodyNo, ABytesProceed, ATotalBytes: Integer); virtual;
    procedure Loaded; override;
    procedure ParseContentType(ASource, AFieldList: TStrings); virtual;
    procedure AssignContentType(ASource: TStrings); virtual;
    function GetIsMultiPartContent: Boolean; virtual;
    procedure RegisterField(const AField: string);
    procedure RegisterFields; virtual;
    property KnownFields: TStrings read FKnownFields;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; virtual;
    procedure Update;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure BuildMessage(const AText, AHtml: string; AImages, Attachments: TStrings); overload;
    procedure BuildMessage(const AText, AHtml: string; const AImages, Attachments: array of string); overload;
    procedure BuildMessage(const AText: string; Attachments: TStrings); overload;
    procedure BuildMessage(const AText: string; const Attachments: array of string); overload;
    procedure BuildMessage(const AText, AHtml: string); overload;
    procedure GetBodyText(AStrings: TStrings);
    property IsMultiPartContent: Boolean read GetIsMultiPartContent;
    property IsParse: Boolean read FIsParse;
    property Boundary: string read FBoundary;
    property HeaderSource: TStrings read GetHeaderSource write SetHeaderSource;
    property BodiesSource: TStrings read GetBodiesSource;
    property MessageSource: TStrings read GetMessageSource write SetMessageSource;
    property RawHeader: TStrings read FRawHeader;
    property RawBodyStart: Integer read FRawBodyStart;
  published
    property Bodies: TclMessageBodies read FBodies write SetBodies;
    property Subject: string read FSubject write SetSubject;
    property From: string read FFrom write SetFrom;
    property ToList: TStrings read FToList write SetToList;
    property CCList: TStrings read FCCList write SetCCList;
    property BCCList: TStrings read FBCCList write SetBCCList;
    property Priority: TclMessagePriority read FPriority write SetPriority default mpNormal;
    property Date: TDateTime read FDate write SetDate;
    property CharSet: string read FCharSet write SetCharSet;
    property ContentType: string read FContentType write SetContentType;
    property ContentSubType: string read FContentSubType write SetContentSubType;
    property ContentDisposition: string read FContentDisposition write SetContentDisposition;
    property MessageFormat: TclMessageFormat read FMessageFormat write SetMessageFormat default mfNone;
    property Encoding: TclEncodeMethod read FEncoding write SetEncoding default cmNone;
    property MimeOLE: string read FMimeOLE write SetMimeOLE;
    property IncludeRFC822Header: Boolean read FIncludeRFC822Header write SetIncludeRFC822Header default True;
    property ReplyTo: string read FReplyTo write SetReplyTo;
    property References: TStrings read FReferences write SetReferences;
    property NewsGroups: TStrings read FNewsGroups write SetNewsGroups;
    property ExtraFields: TStrings read FExtraFields write SetExtraFields;
    property ReadReceiptTo: string read FReadReceiptTo write SetReadReceiptTo;
    property MessageID: string read FMessageID write SetMessageID;
    property CharsPerLine: Integer read FCharsPerLine write SetCharsPerLine default DefaultCharsPerLine;

    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property OnGetDataStream: TclGetBodyStreamEvent read FOnGetDataStream write FOnGetDataStream;
    property OnGetDataSourceStream: TclGetBodyStreamEvent read FOnGetDataSourceStream write FOnGetDataSourceStream;
    property OnDataAdded: TclBodyDataAddedEvent read FOnDataAdded write FOnDataAdded;
    property OnEncodingProgress: TclBodyEncodingProgress read FOnEncodingProgress write FOnEncodingProgress;
  end;

function EmailListToString(AEmailList: TStrings): string;
procedure StringToEmailList(const AEmails: string; AEmailList: TStrings);
function EncodeField(const AFieldValue, ACharSet: string; ADefaultEncoding: TclEncodeMethod;
  ACharsPerLine: Integer = DefaultCharsPerLine): string;
function DecodeField(const AFieldValue, ADefaultCharSet: string): string;
function EncodeEmail(const ACompleteEmail, ACharSet: string; ADefaultEncoding: TclEncodeMethod;
  ACharsPerLine: Integer = DefaultCharsPerLine): string;
function DecodeEmail(const ACompleteEmail, ADefaultCharSet: string): string;
procedure RegisterBody(AMessageBodyClass: TclMessageBodyClass);
function GetRegisteredBodyItems: TList;
function DateTimeToMailTime(ADateTime: TDateTime): string;
function MailTimeToDateTime(const ADateTimeStr: string): TDateTime;
function GetCompleteEmailAddress(const AName, AEmail: string): string;
function GetEmailAddressParts(const ACompleteEmail: string; var AName, AEmail: string): Boolean;

resourcestring
  cWrondEncodingMethod = 'Wrong encoding method in field';
  cMailAgent = 'Clever Internet Suite v 6.2';
  cMimeOLE = 'Produced By Clever Internet Suite MimeOLE v 6.2';

{$IFDEF DEMO}
{$IFNDEF IDEDEMO}
var
  IsMailMessageDemoDisplayed: Boolean = False;
{$ENDIF}
{$ENDIF}
  
implementation

uses
  Windows, clUtils, clTranslator
  {$IFDEF DEMO}, Forms{$ENDIF};

const
  cDefaultContentType = 'text/plain';
  cDefaultCharSet = 'iso-8859-1';
  ImportanceMap: array[TclMessagePriority] of string = ('Low', '', 'High');
  PiorityMap: array[TclMessagePriority] of string = ('5', '3', '1');
  MSPiorityMap: array[TclMessagePriority] of string = ('Low', 'Normal', 'High');
  EncodingMap: array[TclEncodeMethod] of string = ('7bit', 'quoted-printable', 'base64', '', '8bit');
  ContentTypeMap: array[Boolean] of TclMessageFormat = (mfUUencode, mfMIME);

var
  RegisteredBodyItems: TList = nil;
  
procedure RegisterBody(AMessageBodyClass: TclMessageBodyClass);
begin
  GetRegisteredBodyItems().Add(AMessageBodyClass);
  Classes.RegisterClass(AMessageBodyClass);
end;

function GetRegisteredBodyItems: TList;
begin
  if (RegisteredBodyItems = nil) then
  begin
    RegisteredBodyItems := TList.Create();
  end;
  Result := RegisteredBodyItems;
end;

function EmailListToString(AEmailList: TStrings): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to AEmailList.Count - 1 do
  begin
    Result := Result + ', ' + AEmailList[i];
  end;
  System.Delete(Result, 1, 2);
end;

procedure StringToEmailList(const AEmails: string; AEmailList: TStrings);
var
  StartPos, EndPos,
  Quote, i, Len: integer;
  s: string;
begin
  AEmailList.Clear();
  Quote := 0;
  i := 1;
  Len := Length(AEmails);
  while (i <= Len) do
  begin
    StartPos := i;
    EndPos := StartPos;
    while (i <= Len) do
    begin
      if (AEmails[i] in ['"', '''']) then
      begin
        Inc(Quote);
      end;
      if (AEmails[i] in [',', ';']) then
      begin
        if (Quote <> 1) then
        begin
          Break;
        end;
      end;
      Inc(EndPos);
      Inc(i);
    end;
    s := Trim(Copy(AEmails, StartPos, EndPos - StartPos));
    if Length(s) > 0 then
    begin
      AEmailList.Add(TrimLeft(s));
    end;
    i := EndPos + 1;
    Quote := 0;
  end;
end;

function EncodeField(const AFieldValue, ACharSet: string; ADefaultEncoding: TclEncodeMethod;
  ACharsPerLine: Integer): string;
const
  EncodingToName: array[TclEncodeMethod] of string = ('', 'Q', 'B', '', '');
var
  i: Integer;
  Strings: TStrings;
  Encoding: TclEncodeMethod;
  Encoder: TclEncoder;
  s: string;
begin
  Result := AFieldValue;
  if (Result = '') then Exit;

  if (ADefaultEncoding = cmUUEncode) then
  begin
    Result := TclCharSetTranslator.TranslateTo(ACharSet, AFieldValue);
  end else
  begin
    Encoder := TclEncoder.Create(nil);
    try
      Encoder.CharsPerLine := ACharsPerLine;
      Encoder.SuppressCrlf := False;

      Encoding := Encoder.GetNeedEncoding(AFieldValue);
      if (Encoding <> cmNone) and (ACharSet <> '') then
      begin
        Strings := TStringList.Create;
        try
          s := TclCharSetTranslator.TranslateTo(ACharSet, AFieldValue);
          Encoder.EncodeString(s, Result, Encoding);
          if (Encoding = cmMIMEQuotedPrintable) then
          begin
            Result := StringReplace(Result, #32, '_', [rfReplaceAll]);
          end;
          Strings.Text := Result;
          for i := 0 to Strings.Count - 1 do
          begin
            Strings[i] := Format('=?%s?%s?%s?=', [ACharSet, EncodingToName[Encoding], Strings[i]]);
          end;
          Result := Strings.Text;
          Result := Copy(Result, 1, Length(Result) - 2);
        finally
          Strings.Free();
        end;
      end;
    finally
      Encoder.Free();
    end;
  end;
end;

function DecodeField(const AFieldValue, ADefaultCharSet: string): string;
  function EncodingNameToType(const AEncodingName: string): TclEncodeMethod;
  begin
    Result := cmNone;
    if (AEncodingName = '') then Exit;
    case UpperCase(AEncodingName)[1] of
      'Q': Result := cmMIMEQuotedPrintable;
      'B': Result := cmMIMEBase64;
    end;
  end;

var
  Formatted, isUtf8: Boolean;
  EncodedBegin, FirstDelim,
  SecondDelim, EncodedEnd, TextBegin: Integer;
  Encoding: TclEncodeMethod;
  CurLine, ResString, s,
  EncodingName, CharsetName: String;
  Encoder: TclEncoder;
begin
  isUtf8 := False;
  Result := '';
  Encoder := TclEncoder.Create(nil);
  try
    Encoder.SuppressCrlf := False;
    Formatted := False;
    TextBegin := 1;
    CurLine := AFieldValue;
    EncodedBegin := Pos('=?', CurLine);
    while (EncodedBegin <> 0) do
    begin
      Result := Result + Copy(CurLine, TextBegin, EncodedBegin - TextBegin);
      TextBegin := EncodedBegin;
      FirstDelim := TextPos('?', CurLine, EncodedBegin + 2);
      if (FirstDelim <> 0) then
      begin
        SecondDelim := TextPos('?', CurLine, FirstDelim + 1);
        if ((SecondDelim - FirstDelim) = 2) then
        begin
          EncodedEnd := TextPos('?=', CurLine, SecondDelim + 1);
          if (EncodedEnd <> 0) then
          begin
            CharsetName := Copy(CurLine, EncodedBegin + 2, FirstDelim - 2 - EncodedBegin);
            EncodingName := CurLine[FirstDelim + 1];
            s := Copy(CurLine, SecondDelim + 1, EncodedEnd - SecondDelim - 1);
            try
              Encoding := EncodingNameToType(EncodingName);
              if Encoding = cmNone then
                raise EclMailMessageError.Create(cWrondEncodingMethod);
              Encoder.DecodeString(s, ResString, Encoding);

              if (Encoding = cmMIMEQuotedPrintable) then
              begin
                ResString := StringReplace(ResString, '_', #32, [rfReplaceAll]);
              end;

              isUtf8 := isUtf8 or SameText(CharsetName, 'utf-8');
              if not isUtf8 then
              begin
                s := TclCharSetTranslator.TranslateFrom(CharsetName, ResString);
              end else
              begin
                s := ResString;
              end;
              Result := Result + s;
              TextBegin := EncodedEnd + 2;
              Formatted := True;
            except
              TextBegin := EncodedBegin + 2;
              Result := Result + '=?';
            end;
            CurLine := Copy(CurLine, TextBegin, Length(CurLine));
            EncodedBegin := Pos('=?', CurLine);
            TextBegin := 1;
            Continue;
          end;
        end;
      end;
      EncodedBegin := 0;
      Result := Result + Copy(CurLine, TextBegin, Length(CurLine));
    end;
    if (not isUtf8) and (not Formatted) then
    begin
      Result := TclCharSetTranslator.TranslateFrom(ADefaultCharSet, AFieldValue);
    end;
  finally
    Encoder.Free();
  end;
end;

function EncodeEmail(const ACompleteEmail, ACharSet: string; ADefaultEncoding: TclEncodeMethod;
  ACharsPerLine: Integer): string;
var
  Name, EncodedName, Email: string;
begin
  if GetEmailAddressParts(ACompleteEmail, Name, Email) then
  begin
    EncodedName := EncodeField(Name, ACharSet, ADefaultEncoding, ACharsPerLine);
    Result := GetCompleteEmailAddress(EncodedName, Email);
  end else
  begin
    Result := ACompleteEmail;
  end;
end;

function DecodeEmail(const ACompleteEmail, ADefaultCharSet: string): string;
var
  AName, AEmail: string;
begin
  if GetEmailAddressParts(ACompleteEmail, AName, AEmail) then
  begin
    AName := DecodeField(AName, ADefaultCharSet);
    Result := GetCompleteEmailAddress(AName, AEmail);
  end else
  begin
    Result := ACompleteEmail;
  end;
end;

function GetCompleteEmailAddress(const AName, AEmail: string): string;
begin
  if (AName = '') or (AName = AEmail) then
  begin
    Result := AEmail;
  end else
  begin
    Result := Format('%s <%s>', [GetNormName(AName), AEmail]);
  end;
end;

function GetEmailAddressParts(const ACompleteEmail: string; var AName, AEmail: string): Boolean;
  function GetEmailAddressPartsByDelimiter(indStart: Integer; ADelimiterEnd: string): Boolean;
  var
    indEnd: Integer;
  begin
    AName := Trim(system.Copy(ACompleteEmail, 1, indStart - 1));
    indEnd := TextPos(ADelimiterEnd, ACompleteEmail, indStart + 1);
    Result := (indEnd > 0);
    if Result then
    begin
      AEmail := Trim(system.Copy(ACompleteEmail, indStart + 1, indEnd - indStart -1));
    end;
  end;

var
  indStart: Integer;
begin
  AName := ACompleteEmail;
  AEmail := ACompleteEmail;
  indStart := system.Pos('<', ACompleteEmail);
  Result := (indStart > 0);
  if Result then
  begin
    Result := GetEmailAddressPartsByDelimiter(indStart, '>');
  end else
  begin
    indStart := system.Pos('(', ACompleteEmail);
    Result := (indStart > 0);
    if Result then
    begin
      Result := GetEmailAddressPartsByDelimiter(indStart, ')');
    end;
  end;
  if Result then
  begin
    AName := Trim(GetDenormName(AName));
    if (Length(AName) > 1) and (AName[1] = '''') and (AName[Length(AName)] = '''') then
    begin
      AName := Copy(AName, 2, Length(AName) - 2);
    end;
  end;
end;

function DateTimeToMailTime(ADateTime: TDateTime): string;
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  DayName, MonthName: String;
begin
  DecodeDate(ADateTime, Year, Month, Day);
  DecodeTime(ADateTime, Hour, Min, Sec, MSec);
  DayName := cDays[DayOfWeek(ADateTime)];
  MonthName := cMonths[Month];
  Result := Format('%s, %d %s %d %d:%.2d:%.2d %s',
    [DayName, Day, MonthName, Year, Hour, Min, Sec, TimeZoneBiasString]);
end;

function MailTimeToDateTime(const ADateTimeStr: string): TDateTime;
  function ParseTime(const ASrc: string): TDateTime;
  var
    pm, am: Integer;
    src: string;
    h, m, s: Word;
  begin
    src := UpperCase(ASrc);
    pm := system.Pos('PM', src);
    am := system.Pos('AM', src);

    if (pm > 0) then
    begin
      src := system.Copy(src, 1, pm - 1);
    end;
    if (am > 0) then
    begin
      src := system.Copy(src, 1, am - 1);
    end;
    src := Trim(src);

    h := StrToIntDef(ExtractWord(1, src, [':']), 0);
    m := StrToIntDef(ExtractWord(2, src, [':']), 0);
    s := StrToIntDef(ExtractWord(3, src, [':']), 0);

    if (pm > 0) then
    begin
      if h < 12 then
      begin
        h := h + 12;
      end;
    end;
    if (am > 0) then
    begin
      if h = 12 then
      begin
        h := 0;
      end;
    end;
    Result := EncodeTime(h, m, s, 0);
  end;

  function GetCurrentMonth: Word;
  var
    yy, dd: Word;
  begin
    DecodeDate(Date(), yy, Result, dd);
  end;

var
  Year, Month, Day: Word;
  DayName, MonthName, YearName, TimeName, ZoneName: String;
  Time: TDateTime;
  DateTimeStr: String;
  P: Integer;
  s: string;
begin
  Result := 0.0;
  Time := 0.0;
  Year := 0;
  Month := 0;
  Day := 0;
  DateTimeStr := Trim(ADateTimeStr);
  P := Pos(',', DateTimeStr);
  if (P > 0) then
  begin
    system.Delete(DateTimeStr, 1, Succ(P));
  end;
  s := Trim(DateTimeStr);
  DateTimeStr := s;
  P := Pos(' ', DateTimeStr);
  if (P > 0) then
  begin
    DayName := Copy(DateTimeStr, 1, Pred(P));
    Day := StrToInt(DayName);
    system.Delete(DateTimeStr, 1, P);
  end;
  s := Trim(DateTimeStr);
  DateTimeStr := s;
  P := Pos(' ', DateTimeStr);
  if (P > 0) then
  begin
    MonthName := Copy(DateTimeStr, 1, Pred(P));
    Month := Succ(IndexOfStrArray(MonthName, cMonths));
    if (Month = 0) then
    begin
      Month := GetCurrentMonth();
    end else
    begin
      system.Delete(DateTimeStr, 1, P);
    end;
  end;
  s := Trim(DateTimeStr);
  DateTimeStr := s;
  P := Pos(' ', DateTimeStr);
  if (P > 0) then
  begin
    YearName := Copy(DateTimeStr, 1, Pred(P));
    Year := StrToInt(YearName);
    if (Year < 100) then
    begin
      if (Year > 10) then
        Year := Year + 1900
      else if (Year <= 10) then
        Year := Year + 2000;
    end;
    system.Delete(DateTimeStr, 1, P);
  end;
  s := Trim(DateTimeStr);
  DateTimeStr := s;
  P := Pos(' ', DateTimeStr);
  if (P > 0) then
  begin
    TimeName := Copy(DateTimeStr, 1, Pred(P));
    Time := ParseTime(TimeName);
    system.Delete(DateTimeStr, 1, P);
  end;
  if (Year > 0) and (Month > 0) and (Day > 0) then
  begin
    ZoneName := DateTimeStr;
    Result := EncodeDate(Year, Month, Day);
    Result := Result + Time;
    Result := Result - TimeZoneBiasToDateTime(ZoneName);
    Result := GlobalTimeToLocalTime(Result);
  end;
end;

{ TclMessageBodies }

procedure TclMessageBodies.Add(AItem: TclMessageBody);
begin
  FList.Add(AItem);
  GetMailMessage().Update();
end;

function TclMessageBodies.AddAttachment(const AFileName: string): TclAttachmentBody;
begin
  Result := TclAttachmentBody.Create(Self);
  Result.FileName := AFileName;
end;

function TclMessageBodies.AddHtml(const AText: string): TclTextBody;
begin
  Result := AddText(AText);
  Result.ContentType := 'text/html';
end;

function TclMessageBodies.AddImage(const AFileName: string): TclImageBody;
begin
  Result := TclImageBody.Create(Self);
  Result.FileName := AFileName;
end;

function TclMessageBodies.AddItem(AItemClass: TclMessageBodyClass): TclMessageBody;
begin
  Result := AItemClass.Create(Self);
end;

function TclMessageBodies.AddMultipart: TclMultipartBody;
begin
  Result := TclMultipartBody.Create(Self);
end;

function TclMessageBodies.AddText(const AText: string): TclTextBody;
var
  encoder: TclEncoder;
begin
  Result := TclTextBody.Create(Self);
  Result.Strings.Text := AText;
  if (Result.Encoding = cmNone) then
  begin
    encoder := TclEncoder.Create(nil);
    try
      Result.Encoding := encoder.GetNeedEncoding(AText);
    finally
      encoder.Free();
    end;
  end;
end;

procedure TclMessageBodies.Assign(Source: TPersistent);
var
  i: Integer;
  Item: TclMessageBody;
begin
  if (Source is TclMessageBodies) then
  begin
    Clear();
    for i := 0 to TclMessageBodies(Source).Count - 1 do
    begin
      Item := TclMessageBodies(Source).Items[i];
      AddItem(TclMessageBodyClass(Item.ClassType)).Assign(Item);
    end;
  end else
  begin
    inherited Assign(Source);
  end;
end;

procedure TclMessageBodies.Clear;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].Free();
  end;
  FList.Clear();
  GetMailMessage().Update();
end;

constructor TclMessageBodies.Create(AOwner: TclMailMessage);
begin
  inherited Create();
  Assert(AOwner <> nil);
  FOwner := AOwner;
  FList := TList.Create();
end;

procedure TclMessageBodies.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('Items', ReadData, WriteData, (FList.Count > 0));
end;

procedure TclMessageBodies.Delete(Index: Integer);
begin
  Items[Index].Free();
  FList.Delete(Index);
  GetMailMessage().Update();
end;

destructor TclMessageBodies.Destroy;
begin
  Clear();
  FList.Free();
  inherited Destroy();
end;

function TclMessageBodies.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TclMessageBodies.GetItem(Index: Integer): TclMessageBody;
begin
  Result := TclMessageBody(FList[Index]);
end;

function TclMessageBodies.GetMailMessage: TclMailMessage;
begin
  Result := FOwner;
end;

procedure TclMessageBodies.Move(CurIndex, NewIndex: Integer);
begin
  FList.Move(CurIndex, NewIndex);
  GetMailMessage().Update();
end;

procedure TclMessageBodies.ReadData(Reader: TReader);
var
  ItemClass: TclMessageBodyClass;
begin
  Clear();
  Reader.ReadListBegin();
  while not Reader.EndOfList() do
  begin
    ItemClass := TclMessageBodyClass(GetClass(Reader.ReadString()));
    if (ItemClass <> nil) then
    begin
      AddItem(ItemClass).ReadData(Reader);
    end;
  end;
  Reader.ReadListEnd();
end;

procedure TclMessageBodies.WriteData(Writer: TWriter);
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

{ TclMailMessage }

procedure TclMailMessage.GenerateBoundary;
begin
  SetBoundary('Mark=_' + FloatToStr(Now()) + IntToStr(Random(1000)));
end;

procedure TclMailMessage.AssignContentType(ASource: TStrings);
var
  s: string;
begin
  if (MessageFormat = mfUUencode) then Exit;

  if IsMultiPartContent then
  begin
    s := Trim(ContentType);
    if (s = '') then
    begin
      s := 'multipart/mixed';
    end;
    if (ContentSubType <> '') then
    begin
      AddHeaderArrayField(ASource, [s, 'type="' + ContentSubType + '"',
        'boundary="' + Boundary + '"'], 'Content-Type', ';');
    end else
    begin
      AddHeaderArrayField(ASource, [s, 'boundary="' + Boundary + '"'], 'Content-Type', ';');
    end;
  end else
  begin
    s := Trim(ContentType);
    if (s = '') then
    begin
      s := 'text/plain';
    end;
    if (CharSet <> '') then
    begin
      AddHeaderArrayField(ASource, [s, 'charset="' + CharSet + '"'], 'Content-Type', ';');
    end else
    begin
      AddHeaderField(ASource, 'Content-Type', s);
    end;
  end;
end;

function TclMailMessage.BuildDelimitedField(AValues: TStrings; const ADelimiter: string): string;
var
  i: Integer;
  Comma: array[Boolean] of string;
begin
  Result := '';
  if (AValues.Count > 0) then
  begin
    Comma[False] := '';
    Comma[True] := ADelimiter;
    Result := Result + AValues[0] + Comma[AValues.Count > 1];
    for i := 1 to AValues.Count - 1 do
    begin
      Result := Result + AValues[i] + Comma[i < (AValues.Count - 1)];
    end;
  end;
end;

procedure TclMailMessage.InternalAssignHeader(ASource: TStrings);
  procedure AddEmailMultiField(ASource, AEmails: TStrings; const AName: string);
  var
    i: Integer;
    s: string;
  begin
    if (AEmails.Count > 0) then
    begin
      s := EncodeEmail(AEmails[0], CharSet, Encoding, CharsPerLine);
      for i := 1 to AEmails.Count - 1 do
      begin
        s := s + ','#13#10 + EncodeEmail(AEmails[i], CharSet, Encoding, CharsPerLine);
      end;
      AddHeaderField(ASource, AName, s);
    end;
  end;

begin
  GenerateBoundary();
  if IncludeRFC822Header then
  begin
    AddHeaderField(ASource, 'Message-ID', MessageID);
    AddHeaderField(ASource, 'From', EncodeEmail(From, CharSet, Encoding, CharsPerLine));
    AddHeaderField(ASource, 'Reply-To', EncodeEmail(ReplyTo, CharSet, Encoding, CharsPerLine));
    AddHeaderField(ASource, 'Newsgroups', BuildDelimitedField(NewsGroups, ','));
    AddHeaderField(ASource, 'References', BuildDelimitedField(References, #32));
    AddEmailMultiField(ASource, ToList, 'To');
    AddEmailMultiField(ASource, CCList, 'Cc');
    AddEmailMultiField(ASource, BCCList, 'Bcc');
    AddHeaderField(ASource, 'Subject', EncodeField(Subject, CharSet, Encoding, CharsPerLine));
    AddHeaderField(ASource, 'Date', EncodeField(DateTimeToMailTime(Self.Date), CharSet, Encoding, CharsPerLine));
    FLinesFieldPos := ASource.Count;
    if (MessageFormat <> mfUUencode) then
    begin
      AddHeaderField(ASource, 'MIME-Version', '1.0');
    end;
  end;

  AssignContentType(ASource);

  AddHeaderField(ASource, 'Content-Disposition', ContentDisposition);

  if not IsMultiPartContent then
  begin
    AddHeaderField(ASource, 'Content-Transfer-Encoding', EncodingMap[Encoding]);
  end;
  if IncludeRFC822Header then
  begin
    AddHeaderField(ASource, 'Importance', ImportanceMap[Priority]);
    AddHeaderField(ASource, 'X-Priority', PiorityMap[Priority]);
    if (MimeOLE <> '') then
    begin
      AddHeaderField(ASource, 'X-MSMail-Priority', MSPiorityMap[Priority]);
    end;
    AddHeaderField(ASource, 'X-MimeOLE', MimeOLE);

    AddHeaderField(ASource, 'Disposition-Notification-To', EncodeEmail(ReadReceiptTo, CharSet, Encoding, CharsPerLine));

    ASource.AddStrings(ExtraFields);
  end;
  ASource.Add('');
end;

function TclMailMessage.ParseAllHeaders(AStartFrom: Integer; ASource, AHeaders: TStrings): Integer;
var
  i: Integer;
begin
  Result := 0;
  AHeaders.Clear();
  for i := AStartFrom to ASource.Count - 1 do
  begin
    Result := i;
    if (ASource[i] = '') then Break;
    AHeaders.Add(ASource[i]);
  end;
end;

procedure TclMailMessage.ParseContentType(ASource, AFieldList: TStrings);
var
  s: string;
begin
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
  MessageFormat := ContentTypeMap[(s <> '') or (GetHeaderFieldValue(ASource, AFieldList, 'MIME-Version') <> '')];
  ContentType := GetHeaderFieldValueItem(s, '');
  ContentSubType := GetHeaderFieldValueItem(s, 'type=');
  SetBoundary(GetHeaderFieldValueItem(s, 'boundary='));
  CharSet := GetHeaderFieldValueItem(s, 'charset=');
end;

procedure TclMailMessage.InternalParseHeader(ASource: TStrings);
  procedure AssignPriority(const ASource, ALowLexem, AHighLexem: string);
  begin
    if (Priority <> mpNormal) or (ASource = '') then Exit;
    if (LowerCase(ASource) = LowerCase(ALowLexem)) then
    begin
      Priority := mpLow;
    end else
    if (LowerCase(ASource) = LowerCase(AHighLexem)) then
    begin
      Priority := mpHigh;
    end;
  end;

  procedure DecodeEmailList(AEmails: TStrings);
  var
    i: Integer;
  begin
    for i := 0 to AEmails.Count - 1 do
    begin
      AEmails[i] := DecodeEmail(AEmails[i], CharSet);
    end;
  end;

var
  s: string;
  FieldList: TStrings;
begin
  FIsParse := True;
  FieldList := nil;
  try
    FieldList := TStringList.Create();

    GetHeaderFieldList(0, ASource, FieldList);
    ParseContentType(ASource, FieldList);

    s := GetHeaderFieldValue(ASource, FieldList, 'Content-Disposition');
    ContentDisposition := GetHeaderFieldValueItem(s, '');

    s := LowerCase(GetHeaderFieldValue(ASource, FieldList, 'Content-Transfer-Encoding'));
    if (s = 'quoted-printable') then
    begin
      Encoding := cmMIMEQuotedPrintable;
    end else
    if (s = 'base64') then
    begin
      Encoding := cmMIMEBase64;
    end;
    From := DecodeEmail(GetHeaderFieldValue(ASource, FieldList, 'From'), CharSet);
    ToList.Text := StringReplace(GetHeaderFieldValue(ASource, FieldList, 'To'), ',', #13#10, [rfReplaceAll]);
    CCList.Text := StringReplace(GetHeaderFieldValue(ASource, FieldList, 'Cc'), ',', #13#10, [rfReplaceAll]);
    BCCList.Text := StringReplace(GetHeaderFieldValue(ASource, FieldList, 'Bcc'), ',', #13#10, [rfReplaceAll]);
    DecodeEmailList(ToList);
    DecodeEmailList(CCList);
    DecodeEmailList(BCCList);
    Subject := DecodeField(GetHeaderFieldValue(ASource, FieldList, 'Subject'), CharSet);
    try
      Self.Date := ParseDate(ASource, FieldList);
    except
    end;
    AssignPriority(GetHeaderFieldValue(ASource, FieldList, 'Importance'), 'Low', 'High');
    AssignPriority(GetHeaderFieldValue(ASource, FieldList, 'X-Priority'), '5', '1');
    AssignPriority(GetHeaderFieldValue(ASource, FieldList, 'X-MSMail-Priority'), 'Low', 'High');
    ReplyTo := DecodeEmail(GetHeaderFieldValue(ASource, FieldList, 'Reply-To'), CharSet);

    ReadReceiptTo := DecodeEmail(GetHeaderFieldValue(ASource, FieldList, 'Disposition-Notification-To'), CharSet);

    MessageID := GetHeaderFieldValue(ASource, FieldList, 'Message-ID');
    NewsGroups.Text := StringReplace(GetHeaderFieldValue(ASource, FieldList, 'Newsgroups'),
      ',', #13#10, [rfReplaceAll]);
    References.Text := StringReplace(GetHeaderFieldValue(ASource, FieldList, 'References'),
      #32, #13#10, [rfReplaceAll]);
    MimeOLE := GetHeaderFieldValue(ASource, FieldList, 'X-MimeOLE');

    FRawBodyStart := ParseAllHeaders(0, ASource, RawHeader) + 1;
    ParseExtraFields(RawHeader, FKnownFields, ExtraFields);
  finally
    FieldList.Free();
    FIsParse := False;
  end;
end;

procedure TclMailMessage.RegisterField(const AField: string);
begin
  if (FindInStrings(FKnownFields, AField) < 0) then
  begin
    FKnownFields.Add(AField);
  end;
end;

procedure TclMailMessage.RegisterFields;
begin
  RegisterField('Content-Type');
  RegisterField('Content-Disposition');
  RegisterField('Content-Transfer-Encoding');
  RegisterField('From');
  RegisterField('To');
  RegisterField('Cc');
  RegisterField('Bcc');
  RegisterField('Subject');
  RegisterField('Date');
  RegisterField('Importance');
  RegisterField('X-Priority');
  RegisterField('X-MSMail-Priority');
  RegisterField('X-MimeOLE');
  RegisterField('Reply-To');
  RegisterField('Disposition-Notification-To');
  RegisterField('Message-ID');
  RegisterField('MIME-Version');
  RegisterField('Newsgroups');
  RegisterField('References');
end;

procedure TclMailMessage.ParseExtraFields(AHeader, AKnownFields, AExtraFields: TStrings);
var
  i: Integer;
  s: string;
  FieldList: TStrings;
begin
  FieldList := TStringList.Create();
  try
    AExtraFields.Clear();

    GetHeaderFieldList(0, AHeader, FieldList);

    for i := 0 to FieldList.Count - 1 do
    begin
      if (FindInStrings(AKnownFields, FieldList[i]) < 0) then
      begin
        s := system.Copy(AHeader[Integer(FieldList.Objects[i])], 1, Length(FieldList[i]));
        AExtraFields.Add(s + ': ' + GetHeaderFieldValue(AHeader, FieldList, i));
      end;
    end;
  finally
    FieldList.Free();
  end;
end;
    
function TclMailMessage.ParseDate(ASource, AFieldList: TStrings): TDateTime;
var
  ind: Integer;
  s: string;
begin
  Result := Now();
  s := GetHeaderFieldValue(ASource, AFieldList, 'Date');
  if (s <> '') then
  begin
    Result := MailTimeToDateTime(DecodeField(s, CharSet));
  end else
  begin
    s := GetHeaderFieldValue(ASource, AFieldList, 'Received');
    ind := RTextPos(';', s);
    if (ind > 0) then
    begin
      Result := MailTimeToDateTime(DecodeField(Trim(System.Copy(s, ind + 1, 1000)), CharSet));
    end;
  end;
end;

procedure TclMailMessage.InternalAssignBodies(ASource: TStrings);
var
  i: Integer;
begin
  if (FBoundary = '') then
  begin
    GenerateBoundary();
  end;
  for i := 0 to FBodies.Count - 1 do
  begin
    if (MessageFormat <> mfUUencode) and IsMultiPartContent then
    begin
      ASource.Add('--' + Boundary);
      AssignBodyHeader(ASource, Bodies[i]);
      ASource.Add('');
    end;

    AddBodyToSource(ASource, Bodies[i]);

    if IsMultiPartContent then
    begin
      ASource.Add('');
    end;
  end;
  if (MessageFormat <> mfUUencode) and IsMultiPartContent then
  begin
    ASource.Add('--' + Boundary + '--');
  end;
end;

procedure TclMailMessage.AssignBodyHeader(ASource: TStrings; ABody: TclMessageBody);
begin
  ABody.AssignBodyHeader(ASource);
end;

function TclMailMessage.CreateBody(ABodies: TclMessageBodies;
  const AContentType, ADisposition: string): TclMessageBody;
begin
  if (system.Pos('multipart/', LowerCase(AContentType)) = 1) then
  begin
    Result := TclMultipartBody.Create(ABodies);
  end else
  if (system.Pos('image/', LowerCase(AContentType)) = 1) then
  begin
    Result := TclImageBody.Create(ABodies);
  end else
  if (LowerCase(ADisposition) = 'attachment')
    or (system.Pos('application/', LowerCase(AContentType)) = 1)
    or (system.Pos('message/', LowerCase(AContentType)) = 1)
    or (system.Pos('audio/', LowerCase(AContentType)) = 1)
    or (system.Pos('video/', LowerCase(AContentType)) = 1) then
  begin
    Result := TclAttachmentBody.Create(ABodies);
  end else
  begin
    Result := TclTextBody.Create(ABodies);
  end;
end;

function TclMailMessage.ParseBodyHeader(AStartFrom: Integer; ASource: TStrings): TclMessageBody;
var
  ContType, Disposition: string;
  FieldList: TStrings;
  bodyPos: Integer;
begin
  FieldList := TStringList.Create();
  try
    bodyPos := GetHeaderFieldList(AStartFrom, ASource, FieldList);
    ContType := GetHeaderFieldValue(ASource, FieldList, 'Content-Type');
    Disposition := GetHeaderFieldValue(ASource, FieldList, 'Content-Disposition');
    Result := CreateBody(Bodies, GetHeaderFieldValueItem(ContType, ''), GetHeaderFieldValueItem(Disposition, ''));
    Result.ParseBodyHeader(bodyPos + 1, ASource, FieldList);
  finally
    FieldList.Free();
  end;
end;

procedure TclMailMessage.AddBodyToSource(ASource: TStrings; ABody: TclMessageBody);
var
  Src: TStream;
  s: string;
begin
  if (MessageFormat = mfUUencode) and (ABody is TclAttachmentBody) then
  begin
    ASource.Add('begin 600 ' + ExtractFileName(TclAttachmentBody(ABody).FileName));
  end;
  Src := ABody.GetData();
  try
    SetString(s, nil, Src.Size);
    Src.Read(Pointer(s)^, Src.Size);
    AddTextStr(ASource, s);
  finally
    Src.Free();
  end;
  if (MessageFormat = mfUUencode) and (ABody is TclAttachmentBody) then
  begin
    ASource.Add('end');
  end;
end;

procedure TclMailMessage.AfterAddData(ABody: TclMessageBody; AEncodedLines: Integer);
begin
  if (ABody <> nil) and (FDataStream.Size > 0) then
  begin
    try
      FDataStream.Position := 0;
      ABody.AddData(FDataStream, AEncodedLines);
    finally
      FDataStream.Clear();
    end;
  end;
end;

procedure TclMailMessage.GetBodyFromSource(const ASource: string);
begin
  FDataStream.Write(PChar(ASource)^, Length(ASource));
end;

function TclMailMessage.IsUUEBodyStart(const ALine: string; var AFileName: string): Boolean;
var
  ind: Integer;
  s: string;
begin
  AFileName := '';
  Result := (system.Pos('begin', LowerCase(ALine)) = 1);
  if Result then
  begin
    Result := False;
    ind := system.Pos(#32, ALine);
    if (ind > 0) then
    begin
      s := TrimLeft(system.Copy(ALine, ind + 1, 1000));
      ind := system.Pos(#32, s);
      Result := (ind > 0) and (StrToIntDef(Trim(system.Copy(s, 1, ind)), -1) > -1);
      if Result then
      begin
        AFileName := Trim(system.Copy(s, ind + 1, 1000));
      end;
    end;
  end;
end;

function TclMailMessage.IsUUEBodyEnd(const ALine: string): Boolean;
begin
  Result := (Trim(LowerCase(ALine)) = 'end');
end;

function TclMailMessage.CreateUUEAttachmentBody(ABodies: TclMessageBodies;
  const AFileName: string): TclAttachmentBody;
begin
  Result := TclAttachmentBody.Create(ABodies);
  Result.FileName := AFileName;
  Result.Encoding := cmUUEncode;
end;

procedure TclMailMessage.ParseBodies(ASource: TStrings);
  procedure ParseMultiPartBodies(ASource: TStrings);
  var
    i, StartBody: Integer;
    s: string;
    BodyItem: TclMessageBody;
  begin
    BodyItem := nil;
    StartBody := 0;
    s := '';
    for i := 0 to ASource.Count - 1 do
    begin
      if (system.Pos('--' + Boundary, ASource[i]) > 0) then
      begin
        if (BodyItem <> nil) and (i > StartBody) then
        begin
          GetBodyFromSource(s + #13#10);
        end;
        AfterAddData(BodyItem, i - StartBody);
        BodyItem := nil;
        if (system.Pos('--' + Boundary + '--', ASource[i]) = 0) then
        begin
          BodyItem := ParseBodyHeader(i, ASource);
          StartBody := ParseAllHeaders(i + 1, ASource, BodyItem.RawHeader);
          BodyItem.FRawBodyStart := StartBody + 1;
          ParseExtraFields(BodyItem.RawHeader, BodyItem.FKnownFields, BodyItem.ExtraFields);
          if (StartBody < ASource.Count - 1) then
          begin
            Inc(StartBody);
          end;
          s := ASource[StartBody];
        end;
      end else
      begin
        if (BodyItem <> nil) and (i > StartBody) then
        begin
          GetBodyFromSource(s + #13#10);
          s := ASource[i];
        end;
      end;
    end;
    if (BodyItem <> nil) then
    begin
      GetBodyFromSource(s + #13#10);
    end;
    AfterAddData(BodyItem, ASource.Count - 1 - StartBody);
  end;

  procedure ParseSingleBody(ASource: TStrings);
  var
    i, bodyStart: Integer;
    singleBodyItem, BodyItem: TclMessageBody;
    fileName: string;
  begin
    bodyStart := 0;
    BodyItem := nil;
    singleBodyItem := nil;
    for i := 0 to ASource.Count - 1 do
    begin
      if (ASource[i] = '') and (singleBodyItem = nil) then
      begin
        singleBodyItem := CreateSingleBody(ASource, Bodies);
        bodyStart := i;
        singleBodyItem.FRawBodyStart := bodyStart + 1;
      end else
      if (singleBodyItem <> nil) then
      begin
        if IsUUEBodyStart(ASource[i], fileName) then
        begin
          MessageFormat := mfUUencode;

          if (BodyItem <> nil) then
          begin
            AfterAddData(BodyItem, 0);
          end else
          begin
            AfterAddData(singleBodyItem, 0);
          end;
          BodyItem := CreateUUEAttachmentBody(Bodies, fileName);
        end else
        if (MessageFormat = mfUUencode) and IsUUEBodyEnd(ASource[i]) then
        begin
          AfterAddData(BodyItem, 0);
          BodyItem := nil;
        end else
        begin
          GetBodyFromSource(ASource[i] + #13#10);
        end;
      end;
    end;
    if (MessageFormat = mfUUencode) then
    begin
      AfterAddData(singleBodyItem, 0);
    end else
    begin
      AfterAddData(singleBodyItem, ASource.Count - 1 - bodyStart);
    end;
  end;

  procedure RemoveEmptySingleBody;
  var
    i: Integer;
  begin
    for i := Bodies.Count - 1 downto 0 do
    begin
      if (Bodies[i] is TclTextBody) and (Trim(TclTextBody(Bodies[i]).Strings.Text) = '') then
      begin
        Bodies.Delete(i);
      end;
    end;
  end;

begin
  FIsParse := True;
  try
    if IsMultiPartContent then
    begin
      ParseMultiPartBodies(ASource);
      if (Bodies.Count = 0) then
      begin
        ParseSingleBody(ASource);
        RemoveEmptySingleBody();
      end;
    end else
    begin
      ParseSingleBody(ASource);
      RemoveEmptySingleBody();
    end;
  finally
    FIsParse := False;
  end;
end;

procedure TclMailMessage.DoOnListChanged(Sender: TObject);
begin
  Update();
end;

constructor TclMailMessage.Create(AOwner: TComponent);
  procedure SetListChangedEvent(AList: TStringList);
  begin
    AList.OnChange := DoOnListChanged;
  end;
  
begin
  inherited Create(AOwner);
  FHeaderSource := TStringList.Create();

  FBodiesSource := TStringList.Create();

  FMessageSource := TStringList.Create();

  FDataStream := TMemoryStream.Create();
  FUpdateCount := 0;

  FBodies := TclMessageBodies.Create(Self);

  FBCCList := TStringList.Create();
  SetListChangedEvent(FBCCList as TStringList);

  FCCList := TStringList.Create();
  SetListChangedEvent(FCCList as TStringList);

  FToList := TStringList.Create();
  SetListChangedEvent(FToList as TStringList);

  FIncludeRFC822Header := True;

  FReferences := TStringList.Create();
  SetListChangedEvent(FReferences as TStringList);

  FNewsGroups := TStringList.Create();
  SetListChangedEvent(FNewsGroups as TStringList);

  FExtraFields := TStringList.Create();
  SetListChangedEvent(FExtraFields as TStringList);

  FKnownFields := TStringList.Create();
  RegisterFields();

  FRawHeader := TStringList.Create();

  FCharsPerLine := DefaultCharsPerLine;

  Clear();
end;

destructor TclMailMessage.Destroy;
begin
  FRawHeader.Free();
  FKnownFields.Free();
  FExtraFields.Free();
  FNewsGroups.Free();
  FReferences.Free();
  FToList.Free();
  FCCList.Free();
  FBCCList.Free();
  FBodies.Free();
  FDataStream.Free();
  FMessageSource.Free();
  FBodiesSource.Free();
  FHeaderSource.Free();
  inherited Destroy();
end;

procedure TclMailMessage.SetBCCList(const Value: TStrings);
begin
  FBCCList.Assign(Value);
end;

procedure TclMailMessage.SetBodies(const Value: TclMessageBodies);
begin
  FBodies.Assign(Value);
end;

procedure TclMailMessage.SetCCList(const Value: TStrings);
begin
  FCCList.Assign(Value);
end;

procedure TclMailMessage.SetToList(const Value: TStrings);
begin
  FToList.Assign(Value);
end;

function TclMailMessage.GetIsMultiPartContent: Boolean;
begin
  Result := (Bodies.Count > 1) or (FIsParse and (FBoundary <> ''));
end;

procedure TclMailMessage.Clear;
begin
  BeginUpdate();
  try
    SetBoundary('');
    Subject := '';
    From := '';
    ToList.Clear();
    CCList.Clear();
    BCCList.Clear();
    Priority := mpNormal;
    Date := Now();
    Bodies.Clear();
    MessageFormat := mfNone;
    ContentType := cDefaultContentType;
    ContentSubType := '';
    MimeOLE := cMimeOLE;
    FMessageID := '';
    ReplyTo := '';
    References.Clear();
    NewsGroups.Clear();
    ExtraFields.Clear();
    ReadReceiptTo := '';
    ContentDisposition := '';
    RawHeader.Clear();
    FRawBodyStart := 0;

    CharSet := cDefaultCharSet;
    Encoding := cmNone;
  finally
    EndUpdate();
  end;
end;

procedure TclMailMessage.Changed;
begin
  FHeaderSource.Clear();
  FBodiesSource.Clear();
  FMessageSource.Clear();
  if Assigned(OnChanged) then
  begin
    OnChanged(Self);
  end;
end;

procedure TclMailMessage.SetCharSet(const Value: string);
begin
  if (FCharSet <> Value) then
  begin
    FCharSet := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetDate(const Value: TDateTime);
begin
  if (FDate <> Value) then
  begin
    FDate := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetEncoding(const Value: TclEncodeMethod);
begin
  if (FEncoding <> Value) then
  begin
    FEncoding := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetFrom(const Value: string);
begin
  if (FFrom <> Value) then
  begin
    FFrom := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetMessageFormat(const Value: TclMessageFormat);
begin
  if (FMessageFormat <> Value) then
  begin
    FMessageFormat := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetPriority(const Value: TclMessagePriority);
begin
  if (FPriority <> Value) then
  begin
    FPriority := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetSubject(const Value: string);
begin
  if (FSubject <> Value) then
  begin
    FSubject := Value;
    Update();
  end;
end;

procedure TclMailMessage.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TclMailMessage.EndUpdate;
begin
  if (FUpdateCount > 0) then
  begin
    Dec(FUpdateCount);
  end;
  Update();
end;

procedure TclMailMessage.Update;
begin
  if (not (csDestroying in ComponentState))
    and (not (csLoading in ComponentState))
    and (not (csDesigning in ComponentState))
    and (FUpdateCount = 0) then
  begin
    Changed();
  end;
end;

procedure TclMailMessage.DoGetDataStream(ABody: TclMessageBody;
  const AFileName: string; var AData: TStream; var Handled: Boolean);
begin
  if Assigned(OnGetDataStream) then
  begin
    OnGetDataStream(Self, ABody, AFileName, AData, Handled);
  end;
end;

procedure TclMailMessage.DoDataAdded(ABody: TclMessageBody; AData: TStream);
begin
  if Assigned(OnDataAdded) then
  begin
    OnDataAdded(Self, ABody, AData);
  end;
end;

procedure TclMailMessage.DoEncodingProgress(ABodyNo, ABytesProceed, ATotalBytes: Integer);
begin
  if Assigned(OnEncodingProgress) then
  begin
    OnEncodingProgress(Self, ABodyNo, ABytesProceed, ATotalBytes);
  end;
end;

procedure TclMailMessage.Loaded;
begin
  inherited Loaded();
  Update();
end;

procedure TclMailMessage.SetContentType(const Value: string);
begin
  if (FContentType <> Value) then
  begin
    FContentType := Value;
    Update();
  end;
end;

function TclMailMessage.GetHeaderSource: TStrings;
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  if (FHeaderSource.Count = 0) then
  begin
    InternalAssignHeader(FHeaderSource);
  end;
  Result := FHeaderSource;
end;

procedure TclMailMessage.SetBoundary(const Value: string);
begin
  if (FBoundary <> Value) then
  begin
    FBoundary := Value;
    Update();
  end;
end;

procedure TclMailMessage.BuildImages(ABodies: TclMessageBodies; const AText, AHtml: string;
  AImages: TStrings);
var
  i: Integer;
  Multipart: TclMultipartBody;
  HtmlWithImages: string;
  ImageBody: TclImageBody;
begin
  Multipart := ABodies.AddMultipart();
  HtmlWithImages := AHtml;
  for i := 0 to AImages.Count - 1 do
  begin
    ImageBody := ABodies.AddImage(AImages[i]);
    HtmlWithImages := StringReplace(HtmlWithImages, ImageBody.FileName,
      'cid:' + ImageBody.ContentID, [rfReplaceAll, rfIgnoreCase]);
  end;
  Multipart.ContentType := BuildAlternative(Multipart.Bodies, AText, HtmlWithImages);
end;

procedure TclMailMessage.BuildAttachments(ABodies: TclMessageBodies; Attachments: TStrings);
var
  i: Integer;
begin
  for i := 0 to Attachments.Count - 1 do
  begin
    ABodies.AddAttachment(Attachments[i]);
  end;
end;

function TclMailMessage.BuildAlternative(ABodies: TclMessageBodies; const AText, AHtml: string): string;
begin
  Result := '';
  if (AText <> '') then
  begin
    ABodies.AddText(AText);
    Result := 'text/plain';
  end;
  if (AHtml <> '') then
  begin
    ABodies.AddHtml(AHtml);
    Result := 'text/html';
  end;
  if (ABodies.Count > 1) then
  begin
    Result := 'multipart/alternative';
  end;
end;

procedure TclMailMessage.BuildMessage(const AText, AHtml: string;
  AImages, Attachments: TStrings);
var
  Multipart: TclMultipartBody;
  TextSrc: string;
  dummyImg, dummyAttach: TStrings;
begin
  dummyImg := nil;
  dummyAttach := nil;
  try
    if (AImages = nil) then
    begin
      dummyImg := TStringList.Create();
      AImages := dummyImg;
    end;
    if (Attachments = nil) then
    begin
      dummyAttach := TStringList.Create();
      Attachments := dummyAttach;
    end;
    Assert((AText <> '') or (AHtml <> ''));
    if ((AImages.Count > 0) and (AText = '') and (AHtml <> '')) then
    begin
      TextSrc := #32;
    end else
    begin
      TextSrc := AText;
    end;
    Assert((AImages.Count = 0) or ((TextSrc <> '') and (AHtml <> '')));
    BeginUpdate();
    try
      SafeClear();
      if (AImages.Count = 0) and (Attachments.Count = 0) then
      begin
        ContentType := BuildAlternative(Bodies, TextSrc, AHtml);
      end else
      if (AImages.Count = 0) and (Attachments.Count > 0) then
      begin
        if (TextSrc <> '') and (AHtml <> '') then
        begin
          Multipart := Bodies.AddMultipart();
          Multipart.ContentType := BuildAlternative(Multipart.Bodies, TextSrc, AHtml);
        end else
        begin
          BuildAlternative(Bodies, TextSrc, AHtml);
        end;
        BuildAttachments(Bodies, Attachments);
        ContentType := 'multipart/mixed';
      end else
      if (AImages.Count > 0) and (Attachments.Count = 0) then
      begin
        BuildImages(Bodies, TextSrc, AHtml, AImages);
        ContentType := 'multipart/related';
        ContentSubType := 'multipart/alternative';
      end else
      if (AImages.Count > 0) and (Attachments.Count > 0) then
      begin
        Multipart := Bodies.AddMultipart();
        BuildImages(Multipart.Bodies, TextSrc, AHtml, AImages);
        Multipart.ContentType := 'multipart/related';
        Multipart.ContentSubType := 'multipart/alternative';
        BuildAttachments(Bodies, Attachments);
        ContentType := 'multipart/mixed';
      end else
      begin
        Assert(False);
      end;
    finally
      EndUpdate();
    end;
  finally
    dummyAttach.Free();
    dummyImg.Free();
  end;
end;

procedure TclMailMessage.SetContentSubType(const Value: string);
begin
  if (FContentSubType <> Value) then
  begin
    FContentSubType := Value;
    Update();
  end;
end;

procedure TclMailMessage.BuildMessage(const AText, AHtml: string);
begin
  BuildMessage(AText, AHtml, nil, nil);
end;

procedure TclMailMessage.BuildMessage(const AText: string;
  Attachments: TStrings);
begin
  BuildMessage(AText, '', nil, Attachments);
end;

function TclMailMessage.GetBodiesSource: TStrings;
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  if (FBodiesSource.Count = 0) then
  begin
    InternalAssignBodies(FBodiesSource);
  end;
  Result := FBodiesSource;
end;

function TclMailMessage.GetMessageSource: TStrings;
var
  lines: Integer;
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  if (FMessageSource.Count = 0) then
  begin
    FLinesFieldPos := 0;
    InternalAssignHeader(FMessageSource);
    if IsMultiPartContent and (MessageFormat <> mfUUencode) then
    begin
      FMessageSource.Add('This is a multi-part message in MIME format.');
      FMessageSource.Add('');
    end;
    lines := FMessageSource.Count;
    InternalAssignBodies(FMessageSource);
    lines := FMessageSource.Count - lines;
    if (NewsGroups.Count > 0) and (FLinesFieldPos > 0) then
    begin
      FMessageSource.Insert(FLinesFieldPos, 'Lines: ' + IntToStr(lines));
    end;
  end;
  Result := FMessageSource;
end;

procedure TclMailMessage.SetHeaderSource(const Value: TStrings);
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  BeginUpdate();
  try
    Clear();
    InternalParseHeader(Value);
  finally
    EndUpdate();
  end;
end;

procedure TclMailMessage.SetMessageSource(const Value: TStrings);
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
    if (not IsMailMessageDemoDisplayed) and (not IsEncoderDemoDisplayed) then
    begin
      MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
        'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
    end;
    IsMailMessageDemoDisplayed := True;
    IsEncoderDemoDisplayed := True;
{$ENDIF}
  end;
{$ENDIF}
  BeginUpdate();
  try
    Clear();
    InternalParseHeader(Value);
    ParseBodies(Value);
  finally
    EndUpdate();
  end;
end;

function TclMailMessage.CreateSingleBody(ASource: TStrings; ABodies: TclMessageBodies): TclMessageBody;
var
  FieldList: TStrings;
  bodyPos: Integer;
begin
  FieldList := TStringList.Create();
  try
    bodyPos := GetHeaderFieldList(0, ASource, FieldList);

    if (LowerCase(ContentDisposition) = 'attachment')
      or (system.Pos('application/', LowerCase(ContentType)) = 1)
      or (system.Pos('message/', LowerCase(ContentType)) = 1)
      or (system.Pos('audio/', LowerCase(ContentType)) = 1)
      or (system.Pos('video/', LowerCase(ContentType)) = 1) then
    begin
      Result := TclAttachmentBody.Create(ABodies);
    end else
    begin
      Result := TclTextBody.Create(ABodies);
    end;
    Result.ParseBodyHeader(bodyPos, ASource, FieldList);
    ParseAllHeaders(0, ASource, Result.RawHeader);
    ParseExtraFields(Result.RawHeader, Result.KnownFields, Result.ExtraFields);
  finally
    FieldList.Free();
  end;
end;

procedure TclMailMessage.SetIncludeRFC822Header(const Value: Boolean);
begin
  if (FIncludeRFC822Header <> Value) then
  begin
    FIncludeRFC822Header := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetExtraFields(const Value: TStrings);
begin
  FExtraFields.Assign(Value);
end;

procedure TclMailMessage.SetNewsGroups(const Value: TStrings);
begin
  FNewsGroups.Assign(Value);
end;

procedure TclMailMessage.SetReferences(const Value: TStrings);
begin
  FReferences.Assign(Value);
end;

procedure TclMailMessage.SetReplyTo(const Value: string);
begin
  if (FReplyTo <> Value) then
  begin
    FReplyTo := Value;
    Update();
  end;
end;

procedure TclMailMessage.InternalGetBodyText(ABodies: TclMessageBodies; AStrings: TStrings);
var
  i: Integer;
begin
  for i := 0 to ABodies.Count - 1 do
  begin
    if (ABodies[i] is TclMultipartBody) then
    begin
      InternalGetBodyText((ABodies[i] as TclMultipartBody).Bodies, AStrings);
    end else
    if (ABodies[i] is TclTextBody) then
    begin
      AStrings.Assign((ABodies[i] as TclTextBody).Strings);
      Exit;
    end;
  end;
end;

procedure TclMailMessage.GetBodyText(AStrings: TStrings);
begin
  InternalGetBodyText(Bodies, AStrings);
end;

procedure TclMailMessage.SetReadReceiptTo(const Value: string);
begin
  if (FReadReceiptTo <> Value) then
  begin
    FReadReceiptTo := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetMessageID(const Value: string);
begin
  if (FMessageID <> Value) then
  begin
    FMessageID := Value;
    Update();
  end;
end;

procedure TclMailMessage.DoGetDataSourceStream(ABody: TclMessageBody;
  const AFileName: string; var AData: TStream; var Handled: Boolean);
begin
  if Assigned(OnGetDataSourceStream) then
  begin
    OnGetDataSourceStream(Self, ABody, AFileName, AData, Handled);
  end;
end;

procedure TclMailMessage.BuildMessage(const AText: string;
  const Attachments: array of string);
var
  i: Integer;
  list: TStrings;
begin
  list := TStringList.Create();
  try
    for i := Low(Attachments) to High(Attachments) do
    begin
      list.Add(Attachments[i]);
    end;
    BuildMessage(AText, list);
  finally
    list.Free();
  end;
end;

procedure TclMailMessage.BuildMessage(const AText, AHtml: string;
  const AImages, Attachments: array of string);
var
  i: Integer;
  imgs, attachs: TStrings;
begin
  imgs := TStringList.Create();
  attachs := TStringList.Create();
  try
    for i := Low(AImages) to High(AImages) do
    begin
      imgs.Add(AImages[i]);
    end;
    for i := Low(Attachments) to High(Attachments) do
    begin
      attachs.Add(Attachments[i]);
    end;
    BuildMessage(AText, AHtml, imgs, attachs);
  finally
    attachs.Free();
    imgs.Free();
  end;
end;

procedure TclMailMessage.SetContentDisposition(const Value: string);
begin
  if (FContentDisposition <> Value) then
  begin
    FContentDisposition := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetMimeOLE(const Value: string);
begin
  if (FMimeOLE <> Value) then
  begin
    FMimeOLE := Value;
    Update();
  end;
end;

procedure TclMailMessage.SetCharsPerLine(const Value: Integer);
begin
  if (FCharsPerLine <> Value) then
  begin
    FCharsPerLine := Value;
    Update();
  end;
end;

procedure TclMailMessage.SafeClear;
var
  oldCharSet: string;
  oldEncoding: TclEncodeMethod;
begin
  BeginUpdate();
  try
    oldCharSet := CharSet;
    oldEncoding := Encoding;

    Clear();

    CharSet := oldCharSet;
    Encoding := oldEncoding;
  finally
    EndUpdate();
  end;
end;

{ TclMessageBody }

procedure TclMessageBody.Assign(Source: TPersistent);
var
  Src: TclMessageBody;
begin
  if (Source is TclMessageBody) then
  begin
    Src := (Source as TclMessageBody);
    ExtraFields.Assign(Src.ExtraFields);
    ContentType := Src.ContentType;
    Encoding := Src.Encoding;
    ContentDisposition := Src.ContentDisposition;
    RawHeader.Assign(Src.RawHeader);
    FEncodedSize := Src.EncodedSize;
    FEncodedLines := Src.EncodedLines;
    FRawBodyStart := Src.RawBodyStart;
  end else
  begin
    inherited Assign(Source);
  end;
end;

procedure TclMessageBody.Clear;
begin
  FExtraFields.Clear();
  ContentType := '';
  Encoding := GetMailMessage().Encoding;
  ContentDisposition := '';
  RawHeader.Clear();
  FEncodedSize := 0;
  FEncodedLines := 0;
  FRawBodyStart := 0;
end;

procedure TclMessageBody.SetListChangedEvent(AList: TStringList);
begin
  AList.OnChange := DoOnListChanged;
end;

constructor TclMessageBody.Create(AOwner: TclMessageBodies);
begin
  inherited Create();
  Assert(AOwner <> nil);
  FOwner := AOwner;
  FOwner.Add(Self);
  DoCreate();
  Clear();
end;

destructor TclMessageBody.Destroy();
begin
  FRawHeader.Free();
  FKnownFields.Free();
  FExtraFields.Free();
  FEncoder.Free();
  inherited Destroy();
end;

procedure TclMessageBody.DoOnListChanged(Sender: TObject);
begin
  GetMailMessage().Update();
end;

function TclMessageBody.GetMailMessage: TclMailMessage;
begin
  Result := FOwner.GetMailMessage();
end;

procedure TclMessageBody.ReadData(Reader: TReader);
begin
  ExtraFields.Text := Reader.ReadString();
  ContentType := Reader.ReadString();
  Encoding := TclEncodeMethod(Reader.ReadInteger());
  ContentDisposition := Reader.ReadString();
end;

procedure TclMessageBody.WriteData(Writer: TWriter);
begin
  Writer.WriteString(ExtraFields.Text);
  Writer.WriteString(ContentType);
  Writer.WriteInteger(Integer(Encoding));
  Writer.WriteString(ContentDisposition);
end;

procedure TclMessageBody.SetContentType(const Value: string);
begin
  if (FContentType <> Value) then
  begin
    FContentType := Value;
    GetMailMessage().Update();
  end;
end;

procedure TclMessageBody.SetEncoding(const Value: TclEncodeMethod);
begin
  if (FEncoding <> Value) then
  begin
    FEncoding := Value;
    GetMailMessage().Update();
  end;
end;

procedure TclMessageBody.AssignBodyHeader(ASource: TStrings);
begin
end;

procedure TclMessageBody.ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings);
var
  s: string;
begin
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
  ContentType := GetHeaderFieldValueItem(s, '');
  s := LowerCase(GetHeaderFieldValue(ASource, AFieldList, 'Content-Transfer-Encoding'));
  if (s = 'quoted-printable') then
  begin
    Encoding := cmMIMEQuotedPrintable;
  end else
  if (s = 'base64') then
  begin
    Encoding := cmMIMEBase64;
  end;
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Disposition');
  ContentDisposition := GetHeaderFieldValueItem(s, '');
end;

procedure TclMessageBody.EncodeData(ASource, ADestination: TStream);
begin
  FEncoder.CharsPerLine := GetMailMessage().CharsPerLine;
  FEncoder.EncodeStream(ASource, ADestination, Encoding);
end;

procedure TclMessageBody.DecodeData(ASource, ADestination: TStream);
begin
  try
    FEncoder.DecodeStream(ASource, ADestination, Encoding);
  except
    ADestination.Size := 0;
    ASource.Position := 0;
    FEncoder.DecodeStream(ASource, ADestination, cmNone);
  end;
end;

function TclMessageBody.HasEncodedData: Boolean;
begin
  Result := True;
end;

procedure TclMessageBody.AddData(AData: TStream; AEncodedLines: Integer);
var
  Dst: TStream;
begin
  Dst := GetDestinationStream();
  try
    if HasEncodedData() and (AData.Size > 0) and (AEncodedLines > 0) then
    begin
      FEncodedSize := AData.Size;
      FEncodedLines := AEncodedLines;
    end;

    BeforeDataAdded(AData);
    AData.Position := 0;
    if (Dst <> nil) then
    begin
      DecodeData(AData, Dst);
      DataAdded(Dst);
    end;
  finally
    Dst.Free();
  end;
end;

function TclMessageBody.GetData: TStream;
var
  Src: TStream;
begin
  Src := GetSourceStream();
  try
    Result := TMemoryStream.Create();
    if (Src <> nil) then
    begin
      EncodeData(Src, Result);
    end;
    Result.Position := 0;
  finally
    Src.Free();
  end;
end;

procedure TclMessageBody.BeforeDataAdded(AData: TStream);
var
  buf: array[0..1] of Char;
begin
  if (AData.Size > 1) then
  begin
    AData.Position := AData.Size - 2;
    AData.Read(buf, 2);
    if (buf = #13#10) then
    begin
      AData.Size := AData.Size - 2;
    end;
  end;
end;

procedure TclMessageBody.DataAdded(AData: TStream);
begin
  AData.Position := 0;
  GetMailMessage().DoDataAdded(Self, AData);
end;

function TclMessageBody.GetEncoding: TclEncodeMethod;
begin
  if not GetMailMessage().IsMultiPartContent then
  begin
    Result := GetMailMessage().Encoding;
  end else
  begin
    Result := FEncoding;
  end;
end;

procedure TclMessageBody.DoOnEncoderProgress(Sender: TObject; ABytesProceed, ATotalBytes: Integer);
begin
  GetMailMessage().DoEncodingProgress(Index, ABytesProceed, ATotalBytes);
end;

function TclMessageBody.GetIndex: Integer;
begin
  Result := FOwner.FList.IndexOf(Self);
end;

procedure TclMessageBody.DoCreate;
begin
  FEncoder := TclEncoder.Create(nil);
  FEncoder.SuppressCrlf := False;
  FEncoder.OnProgress := DoOnEncoderProgress;
  FExtraFields := TStringList.Create();
  SetListChangedEvent(FExtraFields as TStringList);
  FKnownFields := TStringList.Create();
  RegisterFields();
  FRawHeader := TStringList.Create();
end;

procedure TclMessageBody.SetContentDisposition(const Value: string);
begin
  if (FContentDisposition <> Value) then
  begin
    FContentDisposition := Value;
    GetMailMessage().Update();
  end;
end;

procedure TclMessageBody.SetExtraFields(const Value: TStrings);
begin
  FExtraFields.Assign(Value);
end;

procedure TclMessageBody.RegisterField(const AField: string);
begin
  if (FindInStrings(FKnownFields, AField) < 0) then
  begin
    FKnownFields.Add(AField);
  end;
end;

procedure TclMessageBody.RegisterFields;
begin
  RegisterField('Content-Type');
  RegisterField('Content-Transfer-Encoding');
  RegisterField('Content-Disposition');
end;

{ TclTextBody }

procedure TclTextBody.ReadData(Reader: TReader);
begin
  Strings.Text := Reader.ReadString();
  CharSet := Reader.ReadString();
  inherited ReadData(Reader);
end;

procedure TclTextBody.WriteData(Writer: TWriter);
begin
  Writer.WriteString(Strings.Text);
  Writer.WriteString(CharSet);
  inherited WriteData(Writer);
end;

procedure TclTextBody.SetStrings(const Value: TStrings);
begin
  FStrings.Assign(Value);
end;

destructor TclTextBody.Destroy;
begin
  FStrings.Free();
  inherited Destroy();
end;

procedure TclTextBody.Assign(Source: TPersistent);
begin
  if (Source is TclTextBody) then
  begin
    Strings.Assign((Source as TclTextBody).Strings);
    CharSet := (Source as TclTextBody).CharSet;
  end;
  inherited Assign(Source);
end;

procedure TclTextBody.Clear;
begin
  inherited Clear();
  Strings.Clear();
  ContentType := cDefaultContentType;
  CharSet := GetMailMessage().CharSet;
end;

procedure TclTextBody.SetCharSet(const Value: string);
begin
  if (FCharSet <> Value) then
  begin
    FCharSet := Value;
    GetMailMessage().Update();
  end;
end;

procedure TclTextBody.AssignBodyHeader(ASource: TStrings);
begin
  if (ContentType <> '') and (CharSet <> '') then
  begin
    AddHeaderArrayField(ASource, [ContentType, 'charset="' + CharSet + '"'], 'Content-Type', ';');
  end;
  AddHeaderField(ASource, 'Content-Transfer-Encoding', EncodingMap[Encoding]);
  ASource.AddStrings(ExtraFields);
end;

procedure TclTextBody.ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings);
var
  s: string;
begin
  inherited ParseBodyHeader(ABodyPos, ASource, AFieldList);
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
  CharSet := GetHeaderFieldValueItem(s, 'charset=');
end;

function TclTextBody.GetSourceStream: TStream;
var
  size: Integer;
  s, res, chrSet: string;
begin
  Result := TMemoryStream.Create();
  s := FStrings.Text;
  size := Length(s);
  if (size - Length(#13#10) > 0) then
  begin
    size := size - Length(#13#10);
  end;
  chrSet := CharSet;
  if (chrSet = '') then
  begin
    chrSet := GetMailMessage().CharSet;
  end;
  res := TclCharSetTranslator.TranslateTo(chrSet, system.Copy(s, 1, size));
  Result.WriteBuffer(Pointer(res)^, Length(res));
  Result.Position := 0;
end;

function TclTextBody.GetDestinationStream: TStream;
begin
  Result := TMemoryStream.Create();
end;

procedure TclTextBody.DataAdded(AData: TStream);
var
  s, res, chrSet: string;
begin
  SetString(s, nil, AData.Size);
  AData.Position := 0;
  AData.Read(PChar(s)^, AData.Size);
  chrSet := CharSet;
  if not GetMailMessage().IsMultiPartContent then
  begin
    chrSet := GetMailMessage().CharSet;
  end;
  res := TclCharSetTranslator.TranslateFrom(chrSet, s);
  AddTextStr(FStrings, res);
  inherited DataAdded(AData);
end;

procedure TclTextBody.DoCreate;
begin
  inherited DoCreate();
  FStrings := TStringList.Create();
  SetListChangedEvent(FStrings as TStringList);
end;

{ TclAttachmentBody }

procedure TclAttachmentBody.Assign(Source: TPersistent);
begin
  if (Source is TclAttachmentBody) then
  begin
    FileName := (Source as TclAttachmentBody).FileName;
    ContentID := (Source as TclAttachmentBody).ContentID;
  end;
  inherited Assign(Source);
end;

procedure TclAttachmentBody.AssignBodyHeader(ASource: TStrings);
var
  disposition: string;
begin
  if (ContentType <> '') then
  begin
    if (FileName <> '') then
    begin
      AddHeaderArrayField(ASource, [ContentType,
        'name="' + EncodeField(ExtractFileName(FileName),
        GetMailMessage().CharSet, GetMailMessage().Encoding, GetMailMessage().CharsPerLine) + '"'],
        'Content-Type', ';');
    end else
    begin
      AddHeaderField(ASource, 'Content-Type', ContentType);
    end;
  end;
  AddHeaderField(ASource, 'Content-Transfer-Encoding', EncodingMap[Encoding]);

  disposition := ContentDisposition;
  if (disposition = '') then
  begin
    disposition := 'attachment';
  end;

  if (FileName <> '') then
  begin
    AddHeaderArrayField(ASource,
      [disposition, 'filename="' + EncodeField(ExtractFileName(FileName),
      GetMailMessage().CharSet, GetMailMessage().Encoding, GetMailMessage().CharsPerLine) + '"'],
      'Content-Disposition', ';');
  end else
  begin
    AddHeaderField(ASource, 'Content-Disposition', disposition);
  end;

  if (ContentID <> '') then
  begin
    AddHeaderField(ASource, 'Content-ID', '<' + EncodeField(ContentID,
      GetMailMessage().CharSet, GetMailMessage().Encoding, GetMailMessage().CharsPerLine) + '>');
  end;
  ASource.AddStrings(ExtraFields);
end;

procedure TclAttachmentBody.Clear;
begin
  inherited Clear();
  FileName := '';
  ContentType := 'application/octet-stream';
  ContentID := '';
end;

function TclAttachmentBody.GetMessageRfc822FileName(ABodyPos: Integer; ASource: TStrings): string;
var
  filedList: TStrings;
begin
  filedList := TStringList.Create();
  try
    GetHeaderFieldList(ABodyPos, ASource, filedList);
    Result := GetHeaderFieldValue(ASource, filedList, 'Subject') + '.eml';
  finally
    filedList.Free();
  end;
end;

procedure TclAttachmentBody.ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings);
var
  s: string;
begin
  inherited ParseBodyHeader(ABodyPos, ASource, AFieldList);
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Disposition');
  FileName := DecodeField(GetHeaderFieldValueItem(s, 'filename='),
    GetMailMessage().CharSet);
  if (FileName = '') then
  begin
    s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
    FileName := DecodeField(GetHeaderFieldValueItem(s, 'filename='), GetMailMessage().CharSet);
  end;
  if (FileName = '') then
  begin
    FileName := DecodeField(GetHeaderFieldValue(ASource, AFieldList, 'Content-Description'),
      GetMailMessage().CharSet);
    if (Length(FileName) > 3) and (FileName[Length(FileName) - 3] <> '.') then
    begin
      FileName := FileName + '.dat';
    end;
  end;
  if (FileName = '') then
  begin
    s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
    FileName := DecodeField(GetHeaderFieldValueItem(s, 'name='), GetMailMessage().CharSet);
  end;

  if (FileName = '') and SameText('message/rfc822', ContentType) then
  begin
    FileName := GetMessageRfc822FileName(ABodyPos, ASource);
  end;

  ContentID := GetContentID(ASource, AFieldList);
end;

function TclAttachmentBody.GetContentID(ASource, AFieldList: TStrings): string;
begin
  Result := GetHeaderFieldValue(ASource, AFieldList, 'Content-ID');
  if (Result <> '') and (Result[1] = '<') then
  begin
    System.Delete(Result, 1, 1);
  end;
  if (Result <> '') and (Result[Length(Result)] = '>') then
  begin
    System.Delete(Result, Length(Result), 1);
  end;
end;

procedure TclAttachmentBody.ReadData(Reader: TReader);
begin
  FileName := Reader.ReadString();
  inherited ReadData(Reader);
end;

procedure TclAttachmentBody.SetFileName(const Value: string);
begin
  if (FFileName <> Value) then
  begin
    FFileName := Value;
    AssignEncodingIfNeed();
    GetMailMessage().Update();
  end;
end;

procedure TclAttachmentBody.AssignEncodingIfNeed;
var
  Stream: TStream;
  Encoder: TclEncoder;
begin
  if not GetMailMessage().IsParse and FileExists(FileName) then
  begin
    Encoder := nil;
    Stream := nil;
    try
      Encoder := TclEncoder.Create(nil);
      Stream := GetSourceStream();
      if (Stream <> nil) then
      begin
        Encoding := Encoder.GetNeedEncoding(Stream);
      end;
    finally
      Stream.Free();
      Encoder.Free();
    end;
  end;
end;

procedure TclAttachmentBody.WriteData(Writer: TWriter);
begin
  Writer.WriteString(FileName);
  inherited WriteData(Writer);
end;

function TclAttachmentBody.GetDestinationStream: TStream;
var
  Handled: Boolean;
begin
  Result := nil;
  Handled := False;
  GetMailMessage().DoGetDataStream(Self, FileName, Result, Handled);
end;

function TclAttachmentBody.GetSourceStream: TStream;
var
  Handled: Boolean;
begin
  Result := nil;
  Handled := False;
  GetMailMessage().DoGetDataSourceStream(Self, FileName, Result, Handled);
  if not Handled then
  begin
    Result.Free();
    Result := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  end;
end;

function TclAttachmentBody.GetEncoding: TclEncodeMethod;
begin
  if (GetMailMessage().MessageFormat = mfUUencode) then
  begin
    Result := cmUUEncode;
  end else
  begin
    Result := inherited GetEncoding();
  end;
end;

procedure TclAttachmentBody.SetContentID(const Value: string);
begin
  if (FContentID <> Value) then
  begin
    FContentID := Value;
    GetMailMessage().Update();
  end;
end;

procedure TclAttachmentBody.RegisterFields;
begin
  inherited RegisterFields();
  RegisterField('Content-Description');
  RegisterField('Content-ID');
end;

{ TclImageBody }

function TclImageBody.GetUniqueContentID(const AFileName: string): string;
begin
  Result := AFileName + '@' + FloatToStr(Now()) + '.' + IntToStr(Random(1000));
end;

procedure TclImageBody.AssignBodyHeader(ASource: TStrings);
begin
  if (ContentType <> '') and (FileName <> '') then
  begin
    AddHeaderArrayField(ASource, [ContentType,
      'name="' + EncodeField(ExtractFileName(FileName),
      GetMailMessage().CharSet, GetMailMessage().Encoding, GetMailMessage().CharsPerLine) + '"'],
      'Content-Type', ';');
  end;
  AddHeaderField(ASource, 'Content-Transfer-Encoding', EncodingMap[Encoding]);
  if (ContentID <> '') then
  begin
    AddHeaderField(ASource, 'Content-ID', '<' + EncodeField(ContentID,
      GetMailMessage().CharSet, GetMailMessage().Encoding, GetMailMessage().CharsPerLine) + '>');
  end;
  ASource.AddStrings(ExtraFields);
end;

procedure TclImageBody.Clear;
begin
  inherited Clear();
  ContentType := '';
  Encoding := cmMIMEBase64;
end;

procedure TclImageBody.ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings);
var
  s: string;
begin
  inherited ParseBodyHeader(ABodyPos, ASource, AFieldList);
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
  FileName := DecodeField(GetHeaderFieldValueItem(s, 'name='),
    GetMailMessage().CharSet);
  ContentType := GetHeaderFieldValueItem(s, '');
  ContentID := GetContentID(ASource, AFieldList);
end;

{$IFNDEF DELPHI6}
const
  PathDelim  = '\';
  DriveDelim = ':';
{$ENDIF}

function TclImageBody.GetFileType(const AFileName: string): string;
var
  i: Integer;
begin
  i := LastDelimiter('.' + PathDelim + DriveDelim, FileName);
  if (i > 0) and (FileName[i] = '.') then
    Result := Copy(FileName, i + 1, 1000)
  else
    Result := '';
end;

procedure TclImageBody.SetFileName(const Value: string);
begin
  inherited SetFileName(Value);
  if (FileName <> '') and (ContentID = '') then
  begin
    ContentID := GetUniqueContentID(ExtractFileName(FileName));
  end;
  if (FileName <> '') and (ContentType = '') then
  begin
    ContentType := 'image/' + GetFileType(FileName);
  end;
end;

{ TclMultipartBody }

procedure TclMultipartBody.Assign(Source: TPersistent);
var
  Multipart: TclMultipartBody;
begin
  if (Source is TclMultipartBody) then
  begin
    Multipart := (Source as TclMultipartBody);
    Bodies := Multipart.Bodies;
    SetBoundary(Multipart.Boundary);
    ContentSubType := Multipart.ContentSubType;
  end;
  inherited Assign(Source);
end;

procedure TclMultipartBody.AssignBodyHeader(ASource: TStrings);
begin
  FMailMessage.Clear();
  FMailMessage.Bodies.Assign(Bodies);
  FMailMessage.GenerateBoundary();
  if (ContentSubType <> '') then
  begin
    AddHeaderArrayField(ASource,
      [ContentType, 'type="' + ContentSubType + '"', 'boundary="' + Boundary + '"'], 'Content-Type', ';');
  end else
  begin
    AddHeaderArrayField(ASource,
      [ContentType, 'boundary="' + Boundary + '"'], 'Content-Type', ';');
  end;
  ASource.AddStrings(ExtraFields);
  ASource.Add('');
end;

procedure TclMultipartBody.Clear;
begin
  inherited Clear();
  Bodies.Clear();
  ContentType := 'multipart/mixed';
  ContentSubType := '';
  Encoding := cmNone;
  SetBoundary('');
end;

procedure TclMultipartBody.DataAdded(AData: TStream);
  procedure FixRawBodyStart(ABodies: TclMessageBodies);
  var
    i: Integer;
    body: TclMessageBody;
  begin
    for i := 0 to ABodies.Count - 1 do
    begin
      body := ABodies[i];
      body.FRawBodyStart := body.RawBodyStart + RawBodyStart;
      if(body is TclMultipartBody) then
      begin
        FixRawBodyStart(TclMultipartBody(body).Bodies);
      end;
    end;
  end;

var
  list: TStrings;
  s: string;
begin
  list := TStringList.Create();
  try
    SetString(s, nil, AData.Size);
    AData.Position := 0;
    AData.Read(PChar(s)^, AData.Size);
    AddTextStr(list, s);
    FMailMessage.ParseBodies(list);
    Bodies.Assign(FMailMessage.Bodies);
    FixRawBodyStart(Bodies);
    FEncodedLines := list.Count;
  finally
    list.Free();
  end;
end;

destructor TclMultipartBody.Destroy;
begin
  FBodies.Free();
  FMailMessage.Free();
  inherited Destroy();
end;

procedure TclMultipartBody.DoCreate;
begin
  inherited DoCreate();
  FMailMessage := TclMailMessage.Create(nil);
  FMailMessage.OnGetDataStream := DoOnGetDataStream;
  FMailMessage.OnGetDataSourceStream := DoOnGetDataSourceStream;
  FMailMessage.OnDataAdded := DoOnDataAdded;
  FBodies := TclMessageBodies.Create(GetMailMessage());
end;

procedure TclMultipartBody.DoOnDataAdded(Sender: TObject;
  ABody: TclMessageBody; AData: TStream);
begin
  AData.Position := 0;
  GetMailMessage().DoDataAdded(ABody, AData);
end;

procedure TclMultipartBody.DoOnGetDataSourceStream(Sender: TObject;
  ABody: TclMessageBody; const AFileName: string; var AStream: TStream;
  var Handled: Boolean);
begin
  GetMailMessage().DoGetDataSourceStream(ABody, AFileName, AStream, Handled);
end;

procedure TclMultipartBody.DoOnGetDataStream(Sender: TObject;
  ABody: TclMessageBody; const AFileName: string; var AStream: TStream;
  var Handled: Boolean);
begin
  GetMailMessage().DoGetDataStream(ABody, AFileName, AStream, Handled);
end;

function TclMultipartBody.GetBoundary: string;
begin
  Result := FMailMessage.Boundary;
end;

function TclMultipartBody.GetDestinationStream: TStream;
begin
  Result := TMemoryStream.Create();
end;

function TclMultipartBody.GetSourceStream: TStream;
var
  list: TStrings;
  s: string;
begin
  Result := TMemoryStream.Create();
  list := TStringList.Create();
  try
    FMailMessage.InternalAssignBodies(list);
    s := list.Text;
    Result.WriteBuffer(Pointer(s)^, Length(s));
    Result.Position := 0;
  finally
    list.Free();
  end;
end;

function TclMultipartBody.HasEncodedData: Boolean;
begin
  Result := False;
end;

procedure TclMultipartBody.ParseBodyHeader(ABodyPos: Integer; ASource, AFieldList: TStrings);
var
  s: string;
begin
  inherited ParseBodyHeader(ABodyPos, ASource, AFieldList);
  s := GetHeaderFieldValue(ASource, AFieldList, 'Content-Type');
  SetBoundary(GetHeaderFieldValueItem(s, 'boundary='));
  ContentSubType := GetHeaderFieldValueItem(s, 'type=');
  Encoding := cmNone;
end;

procedure TclMultipartBody.ReadData(Reader: TReader);
begin
  ContentSubType := Reader.ReadString();
  Bodies.ReadData(Reader);
  inherited ReadData(Reader);
end;

procedure TclMultipartBody.SetBodies(const Value: TclMessageBodies);
begin
  FBodies.Assign(Value);
end;

procedure TclMultipartBody.SetBoundary(const Value: string);
begin
  if (Boundary <> Value) then
  begin
    FMailMessage.SetBoundary(Value);
    GetMailMessage().Update();
  end;
end;

procedure TclMultipartBody.SetContentSubType(const Value: string);
begin
  if (FContentSubType <> Value) then
  begin
    FContentSubType := Value;
    GetMailMessage().Update();
  end;
end;

procedure TclMultipartBody.WriteData(Writer: TWriter);
begin
  Writer.WriteString(ContentSubType);
  Bodies.WriteData(Writer);
  inherited WriteData(Writer);
end;

initialization
  RegisterBody(TclTextBody);
  RegisterBody(TclAttachmentBody);
  RegisterBody(TclMultipartBody);
  RegisterBody(TclImageBody);

finalization
  RegisteredBodyItems.Free();

end.
