{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clMultiDC;

interface

{$I clVer.inc}

uses
  Classes, Windows, clWinInet, clDC, clDCUtils, clUtils, clConnection, clHttpRequest,
  clCryptApi, clCert, clFtpUtils, clHttpUtils, clUriUtils;

type
  TclInternetItem = class;
  TclResourceStateItem = class;

  TclOnMultiStatusChanged = procedure (Sender: TObject; Item: TclInternetItem;
    Status: TclProcessStatus) of object;
  TclOnMultiDataItemProceed = procedure (Sender: TObject; Item: TclInternetItem;
    ResourceInfo: TclResourceInfo; AStateItem: TclResourceStateItem; CurrentData: PChar;
    CurrentDataSize: Integer) of object;
  TclOnMultiError = procedure (Sender: TObject; Item: TclInternetItem; const Error: string;
    ErrorCode: Integer) of object;
  TclOnMultiGetResourceInfo = procedure (Sender: TObject; Item: TclInternetItem;
    ResourceInfo: TclResourceInfo) of object;
  TclOnMultiURLParsing = procedure (Sender: TObject; Item: TclInternetItem;
    var URLComponents: TURLComponents) of object;
  TclOnMultiNotifyEvent = procedure (Sender: TObject; Item: TclInternetItem) of object;
  TclOnMultiGetCertificate = procedure (Sender: TObject; Item: TclInternetItem;
    var ACertificate: TclCertificate; var Handled: Boolean) of object;

  TclCustomInternetControl = class;

  TclResourceStateList = class;

  TclResourceStateItem = class(TCollectionItem)
  private
    FResourcePos: Integer;
    FBytesToProceed: Integer;
    FStatus: TclProcessStatus;
    FBytesProceed: Integer;
    procedure SetResourcePos(const Value: Integer);
    function GetResourceState: TclResourceStateList;
    procedure SetBytesProceed(const Value: Integer);
    procedure SetBytesToProceed(const Value: Integer);
  public
    procedure Assign(Source: TPersistent); override;
    property ResourceState: TclResourceStateList read GetResourceState;
    property ResourcePos: Integer read FResourcePos write SetResourcePos;
    property BytesToProceed: Integer read FBytesToProceed write SetBytesToProceed;
    property BytesProceed: Integer read FBytesProceed write SetBytesProceed;
    property Status: TclProcessStatus read FStatus write FStatus;
  end;

  TclResourceStateList = class(TCollection)
  private
    FResourceSize: Integer;
    FLastStatus: TclProcessStatus;
    FSpeedCount: TLargeInteger;
    FStartCount: TLargeInteger;
    FSpeed: Double;
    FElapsedTime: Double;
    FBytesProceedSinceStart: Integer;
    FOnChanged: TNotifyEvent;
    function GetItem(Index: Integer): TclResourceStateItem;
    procedure SetItem(Index: Integer; const Value: TclResourceStateItem);
    function GetBytesProceed: Integer;
    function GetLastStatus: TclProcessStatus;
    procedure UpdateStatistic();
    function GetRemainingTime: Double;
    class function GetFrequency: TLargeInteger;
  protected
    procedure DoChanged(); virtual;
    procedure Update(Item: TCollectionItem); override;
  public
    procedure InitStatistic;
    procedure Assign(Source: TPersistent); override;
    procedure UpdateProceed(AItem: TclResourceStateItem; ABytesProceed: Integer);
    procedure UpdateStatus(AItem: TclResourceStateItem; AStatus: TclProcessStatus);
    procedure Init(AThreadCount, AResourceSize: Integer);
    function Add: TclResourceStateItem;
    property Items[Index: Integer]: TclResourceStateItem read GetItem write SetItem; default;
    property BytesProceed: Integer read GetBytesProceed;
    property ResourceSize: Integer read FResourceSize write FResourceSize;
    property LastStatus: TclProcessStatus read GetLastStatus;
    property Speed: Double read FSpeed;
    property ElapsedTime: Double read FElapsedTime;
    property RemainingTime: Double read GetRemainingTime;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  end;

  TclErrorList = class
  private
    FList: TStrings;
    function GetCount: Integer;
    function GetErrorCodes(Index: Integer): Integer;
    function GetErrors(Index: Integer): string;
    function GetText: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddError(const AError: string; AErrorCode: Integer);
    procedure Clear;
    property Errors[Index: Integer]: string read GetErrors; default;
    property ErrorCodes[Index: Integer]: Integer read GetErrorCodes;
    property Count: Integer read GetCount;
    property Text: string read GetText;
  end;

  TclInternetItem = class(TCollectionItem)
  private
    FDataStream: TStream;
    FSelfDataStream: TStream;
    FThreaderList: TList;
    FPassword: string;
    FUserName: string;
    FURL: string;
    FLastStatus: TclProcessStatus;
    FPriority: TclProcessPriority;
    FResourceInfo: TclResourceInfo;
    FErrors: TclErrorList;
    FCertificateFlags: TclCertificateFlags;
    FThreadCount: Integer;
    FResourceState: TclResourceStateList;
    FKeepConnection: Boolean;
    FSelfConnection: TclInternetConnection;
    FData: Pointer;
    FHttpRequest: TclHttpRequest;
    FUseHttpRequest: Boolean;
    FHttpResponseHeader: TStrings;
    FPort: Integer;
    FIsCommit: Boolean;
    procedure DoOnResourceStateChanged(Sender: TObject);
    procedure DoOnURLParsing(Sender: TObject; var URLComponents: TURLComponents);
    procedure DoOnGetResourceInfo(Sender: TObject; AResourceInfo: TclResourceInfo);
    procedure DoOnDataItemProceed(Sender: TObject; AResourceInfo: TclResourceInfo;
      BytesProceed: Integer; CurrentData: PChar; CurrentDataSize: Integer);
    procedure DoOnError(Sender: TObject; const Error: string; ErrorCode: Integer);
    procedure DoOnStatusChanged(Sender: TObject; Status: TclProcessStatus);
    procedure DoOnTerminate(Sender: TObject);
    procedure DoOnGetCertificate(Sender: TObject; var ACertificate: TclCertificate;
      var Handled: Boolean);
    procedure ClearInfo;
    procedure ClearDataStream;
    procedure ClearThreaderList;
    procedure SetDataStream(const Value: TStream);
    function GetInternalDataStream: TStream;
    function GetIsBusy: Boolean;
    procedure Wait;
    procedure RemoveThreader(Index: Integer);
    procedure SetMaxConnectionsOption;
    procedure SetThreadCount(const Value: Integer);
    function GetConnection: TclInternetConnection;
    function FindFirstFailedItem(APrevThreader: TclCustomThreader): TclResourceStateItem;
    procedure ReTryFailedItem(AStateItem: TclResourceStateItem; AURLParser: TclUrlParser);
    procedure SetHttpRequest(const Value: TclHttpRequest);
    function GetResourceConnections(Index: Integer): TclInternetConnection;
    function GetResourceConnectionCount: Integer;
    procedure AssignThreader(AThreader: TclCustomThreader);
  protected
    FLocalFile: string;
    procedure InternalSetHttpRequest(const Value: TclHttpRequest);
    function IsSharedConnection: Boolean;
    function FindStateItem(AThreader: TclCustomThreader): TclResourceStateItem;
    procedure DoError(const Error: string; ErrorCode: Integer);
    function GetBatchSize: Integer;
    function GetDefaultChar: Char;
    procedure ClearResourceState;
    function AddThreader(AStateItem: TclResourceStateItem; AIsGetResourceInfo: Boolean): TclCustomThreader;
    function CanProcess: Boolean; virtual;
    function CheckSizeValid(ASize: Integer): Boolean;
    procedure AssignThreaderEvents(AThreader: TclCustomThreader); virtual;
    procedure AssignThreaderParams(AThreader: TclCustomThreader); virtual;
    function GetControl: TclCustomInternetControl; virtual; abstract;
    function GetDataStream: TStream; virtual; abstract;
    function CreateThreader(ADataStream: TStream; AIsGetResourceInfo: Boolean): TclCustomThreader; virtual; abstract;
    procedure InternalStart(AIsGetResourceInfo: Boolean); virtual;
    procedure SetLocalFile(const Value: string); virtual;
    procedure SetPassword(const Value: string); virtual;
    procedure SetURL(const Value: string); virtual;
    procedure SetUserName(const Value: string); virtual;
    procedure SetPort(const Value: Integer); virtual;
    procedure ThreaderTerminated(AThreader: TclCustomThreader); virtual;
    procedure ProcessCompleted(AThreader: TclCustomThreader); virtual;
    procedure LastStatusChanged(Status: TclProcessStatus); virtual;
    procedure DoGetResourceInfo(AResourceInfo: TclResourceInfo); virtual;
    procedure ControlChanged; virtual;
    procedure SetInternalDataStream(const ADataStream: TStream);
    procedure CommitWork; virtual;
    procedure DoDestroy; virtual;
    procedure SetUseHttpRequest(const Value: Boolean); virtual;
    property IsCommit: Boolean read FIsCommit;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Start(IsAsynch: Boolean);
    function GetResourceInfo(IsAsynch: Boolean): TclResourceInfo;
    procedure Stop;
    procedure CloseConnection;
    procedure DeleteRemoteFile;
    function GetThreader(Index: Integer): TclCustomThreader;
    property DataStream: TStream read GetInternalDataStream write SetDataStream;
    property IsBusy: Boolean read GetIsBusy;
    property Control: TclCustomInternetControl read GetControl;
    property Errors: TclErrorList read FErrors;
    property ResourceInfo: TclResourceInfo read FResourceInfo;
    property ResourceState: TclResourceStateList read FResourceState;
    property ResourceConnections[Index: Integer]: TclInternetConnection read GetResourceConnections;
    property ResourceConnectionCount: Integer read GetResourceConnectionCount;
    property ThreadCount: Integer read FThreadCount write SetThreadCount;
    property KeepConnection: Boolean read FKeepConnection write FKeepConnection default False;
    property URL: string read FURL write SetURL;
    property LocalFile: string read FLocalFile write SetLocalFile;
    property UserName: string read FUserName write SetUserName;
    property Password: string read FPassword write SetPassword;
    property Port: Integer read FPort write SetPort default 0;
    property Priority: TclProcessPriority read FPriority write FPriority default ppNormal;
    property CertificateFlags: TclCertificateFlags read FCertificateFlags write FCertificateFlags default [];
    property Data: Pointer read FData write FData;
    property HttpRequest: TclHttpRequest read FHttpRequest write SetHttpRequest;
    property HttpResponseHeader: TStrings read FHttpResponseHeader;
    property UseHttpRequest: Boolean read FUseHttpRequest write SetUseHttpRequest default False;
  end;

  TclInternetItemClass = class of TclInternetItem;

  TclControlNotifier = class
  private
    FControl: TclCustomInternetControl;
  protected
    procedure DoResourceStateChanged(Item: TclInternetItem); virtual;
    procedure DoStatusChanged(Item: TclInternetItem; Status: TclProcessStatus); virtual;
    procedure DoDataItemProceed(Item: TclInternetItem; ResourceInfo: TclResourceInfo;
      AStateItem: TclResourceStateItem; CurrentData: PChar; CurrentDataSize: Integer); virtual;
    procedure DoItemDeleted(Item: TclInternetItem); virtual;
  public
    constructor Create(AControl: TclCustomInternetControl);
    destructor Destroy; override;
  end;

  TclCustomInternetControl = class(TComponent)
  private
    FIsBusyCount: Integer;
    FTryCount: Integer;
    FBatchSize: Integer;
    FTimeOut: Integer;
    FOnIsBusyChanged: TNotifyEvent;
    FMinResourceSize: Integer;
    FMaxResourceSize: Integer;
    FProxyBypass: TStrings;
    FInternetAgent: string;
    FDefaultChar: Char;
    FPassiveFTPMode: Boolean;
    FNotifierList: TList;
    FReconnectAfter: Integer;
    FConnection: TclInternetConnection;
    FDoNotGetResourceInfo: Boolean;
    FFtpProxySettings: TclFtpProxySettings;
    FHttpProxySettings: TclHttpProxySettings;
    FUseInternetErrorDialog: Boolean;
    procedure SetBatchSize(const Value: Integer);
    procedure SetTryCount(const Value: Integer);
    procedure SetTimeOut(const Value: Integer);
    procedure SetReconnectAfter(const Value: Integer);
    function GetIsBusy: Boolean;
    procedure SetMaxResourceSize(const Value: Integer);
    procedure SetMinResourceSize(const Value: Integer);
    procedure SetDefaultChar(const Value: Char);
    function GetControlNotifier(Index: Integer): TclControlNotifier;
    procedure RegisterControlNotifier(ANotifier: TclControlNotifier);
    procedure UnregisterControlNotifier(ANotifier: TclControlNotifier);
    procedure SetConnection(const Value: TclInternetConnection);
    procedure SetFtpProxySettings(const Value: TclFtpProxySettings);
    procedure SetHttpProxySettings(const Value: TclHttpProxySettings);
    procedure SetProxyBypass(const Value: TStrings);
  protected
    procedure BeginIsBusy;
    procedure EndIsBusy;
    procedure DoStopItem(Item: TclInternetItem); virtual;
    procedure DoItemDeleted(Item: TclInternetItem); virtual;
    function CanProcess(Item: TclInternetItem): Boolean; virtual;
    procedure StartNextItem(APrevItem: TclInternetItem); virtual;
    function CanStartItem(Item: TclInternetItem; AIsGetResourceInfo, IsAsynch: Boolean): Boolean; virtual;
    procedure NotifyInternetItems(AComponent: TComponent); virtual; abstract;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    procedure IsBusyChanged; dynamic;
    procedure Changed(Item: TclInternetItem); dynamic; abstract;
    procedure DoResourceStateChanged(Item: TclInternetItem); dynamic;
    procedure DoGetCertificate(Item: TclInternetItem; var ACertificate: TclCertificate;
      var Handled: Boolean); dynamic; abstract;
    procedure DoURLParsing(Item: TclInternetItem; var URLComponents: TURLComponents); dynamic; abstract;
    procedure DoGetResourceInfo(Item: TclInternetItem; AResourceInfo: TclResourceInfo); dynamic; abstract;
    procedure DoStatusChanged(Item: TclInternetItem; Status: TclProcessStatus); dynamic;
    procedure DoDataItemProceed(Item: TclInternetItem; ResourceInfo: TclResourceInfo;
      AStateItem: TclResourceStateItem; CurrentData: PChar; CurrentDataSize: Integer); dynamic;
    procedure DoError(Item: TclInternetItem; const Error: string; ErrorCode: Integer); dynamic; abstract;
    procedure DoProcessCompleted(Item: TclInternetItem); dynamic; abstract;
    property TryCount: Integer read FTryCount write SetTryCount default cTryCount;
    property BatchSize: Integer read FBatchSize write SetBatchSize default cBatchSize;
    property TimeOut: Integer read FTimeOut write SetTimeOut default cTimeOut;
    property ReconnectAfter: Integer read FReconnectAfter write SetReconnectAfter default cTimeOut; 
    property MinResourceSize: Integer read FMinResourceSize write SetMinResourceSize default 0;
    property MaxResourceSize: Integer read FMaxResourceSize write SetMaxResourceSize default 0;
    property HttpProxySettings: TclHttpProxySettings read FHttpProxySettings write SetHttpProxySettings;
    property FtpProxySettings: TclFtpProxySettings read FFtpProxySettings write SetFtpProxySettings;
    property ProxyBypass: TStrings read FProxyBypass write SetProxyBypass;
    property InternetAgent: string read FInternetAgent write FInternetAgent;
    property DefaultChar: Char read FDefaultChar write SetDefaultChar default cDefaultChar;
    property PassiveFTPMode: Boolean read FPassiveFTPMode write FPassiveFTPMode default False;
    property Connection: TclInternetConnection read FConnection write SetConnection;
    property DoNotGetResourceInfo: Boolean read FDoNotGetResourceInfo write FDoNotGetResourceInfo default False;
    property UseInternetErrorDialog: Boolean read FUseInternetErrorDialog write FUseInternetErrorDialog default False;
    property OnIsBusyChanged: TNotifyEvent read FOnIsBusyChanged write FOnIsBusyChanged;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property IsBusy: Boolean read GetIsBusy;
    procedure ReadRegistry(const APath: string); virtual;
    procedure WriteRegistry(const APath: string); virtual;
    procedure SetCookie(const AURL, AName, AValue: string);
    function GetCookie(const AURL, AName: string): string;
    procedure GetAllCookies(const AURL: string; AList: TStrings);
    procedure GetFtpDirList(const ADir, AUser, APassword: string; AList: TStrings; ADetails: Boolean);
  end;

  TclMultiInternetControl = class(TclCustomInternetControl)
  private
    FDelayedItems: TList;
    FMaxStartedItems: Integer;
    FStartedItemCount: Integer;
    FOnDataItemProceed: TclOnMultiDataItemProceed;
    FOnError: TclOnMultiError;
    FOnGetResourceInfo: TclOnMultiGetResourceInfo;
    FOnChanged: TclOnMultiNotifyEvent;
    FOnStatusChanged: TclOnMultiStatusChanged;
    FOnUrlParsing: TclOnMultiURLParsing;
    FOnGetCertificate: TclOnMultiGetCertificate;
    FOnProcessCompleted: TclOnMultiNotifyEvent;
    procedure SetMaxStartedItems(const Value: Integer);
    procedure DeleteDelayedInfo(Item: TclInternetItem);
  protected
    procedure InternalStop(Item: TclInternetItem); virtual;
    procedure NotifyInternetItems(AComponent: TComponent); override;
    procedure Changed(Item: TclInternetItem); override;
    procedure DoGetCertificate(Item: TclInternetItem; var ACertificate: TclCertificate;
      var Handled: Boolean); override;
    procedure DoURLParsing(Item: TclInternetItem; var URLComponents: TURLComponents); override;
    procedure DoGetResourceInfo(Item: TclInternetItem; AResourceInfo: TclResourceInfo); override;
    procedure DoStatusChanged(Item: TclInternetItem; Status: TclProcessStatus); override;
    procedure DoDataItemProceed(Item: TclInternetItem; ResourceInfo: TclResourceInfo;
      AStateItem: TclResourceStateItem; CurrentData: PChar; CurrentDataSize: Integer); override;
    procedure DoError(Item: TclInternetItem; const Error: string; ErrorCode: Integer); override;
    procedure DoProcessCompleted(Item: TclInternetItem); override;
    procedure DoStopItem(Item: TclInternetItem); override;
    procedure DoItemDeleted(Item: TclInternetItem); override;
    procedure StartNextItem(APrevItem: TclInternetItem); override;
    function CanStartItem(Item: TclInternetItem; AIsGetResourceInfo, IsAsynch: Boolean): Boolean; override;
    function GetInternetItems(Index: Integer): TclInternetItem; virtual; abstract;
    function GetInternetItemsCount: Integer; virtual; abstract;
    property MaxStartedItems: Integer read FMaxStartedItems write SetMaxStartedItems default 5;
    property OnStatusChanged: TclOnMultiStatusChanged read FOnStatusChanged write FOnStatusChanged;
    property OnGetResourceInfo: TclOnMultiGetResourceInfo read FOnGetResourceInfo write FOnGetResourceInfo;
    property OnDataItemProceed: TclOnMultiDataItemProceed read FOnDataItemProceed write FOnDataItemProceed;
    property OnError: TclOnMultiError read FOnError write FOnError;
    property OnUrlParsing: TclOnMultiURLParsing read FOnUrlParsing write FOnUrlParsing;
    property OnChanged: TclOnMultiNotifyEvent read FOnChanged write FOnChanged;
    property OnGetCertificate: TclOnMultiGetCertificate read FOnGetCertificate write FOnGetCertificate;
    property OnProcessCompleted: TclOnMultiNotifyEvent read FOnProcessCompleted write FOnProcessCompleted;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetResourceInfo(Item: TclInternetItem = nil; IsAsynch: Boolean = True): TclResourceInfo;
    procedure Start(Item: TclInternetItem = nil; IsAsynch: Boolean = True);
    procedure Stop(Item: TclInternetItem = nil);
  end;

const
  cProcessPriorities: array[TclProcessPriority] of TThreadPriority = (tpLower, tpNormal, tpHigher);

implementation

uses
  registry{$IFDEF DEMO}, Forms{$ENDIF}, SysUtils{$IFDEF LOGGER}, clLogger{$ENDIF};

type
  TclThreaderHolder = class
    FThreader: TclCustomThreader;
    FStateItem: TclResourceStateItem;
  end;

  TclInternetItemInfo = class
    FItem: TclInternetItem;
    FIsGetResourceInfo: Boolean;
  end;

{ TclInternetItem }

procedure TclInternetItem.Assign(Source: TPersistent);
var
  Item: TclInternetItem;
begin
  if (Source is TclInternetItem) then
  begin
    Item := (Source as TclInternetItem);
    DataStream := Item.DataStream;
    FThreadCount := Item.ThreadCount;
    FKeepConnection := Item.KeepConnection;
    FURL := Item.URL;
    FUserName := Item.UserName;
    FLocalFile := Item.LocalFile;
    FPassword := Item.Password;
    FPriority := Item.Priority;
    FCertificateFlags := Item.CertificateFlags;
    FUseHttpRequest := Item.UseHttpRequest;
    FData := Item.Data;
    HttpRequest := Item.HttpRequest;
    ControlChanged();
  end else
  begin
    inherited Assign(Source);
  end;
end;

procedure TclInternetItem.AssignThreaderEvents(AThreader: TclCustomThreader);
begin
  AThreader.OnGetResourceInfo := DoOnGetResourceInfo;
  AThreader.OnStatusChanged := DoOnStatusChanged;
  AThreader.OnError := DoOnError;
  AThreader.OnTerminate := DoOnTerminate;
  AThreader.OnUrlParsing := DoOnURLParsing;
  AThreader.OnDataItemProceed := DoOnDataItemProceed;
  AThreader.OnGetCertificate := DoOnGetCertificate;
end;

procedure TclInternetItem.AssignThreaderParams(AThreader: TclCustomThreader);
begin
  if (HttpRequest <> nil) then
  begin
    AThreader.RequestHeader := HttpRequest.HeaderSource;
  end;
  AThreader.Priority := cProcessPriorities[FPriority];
  AThreader.BatchSize := Control.BatchSize;
  AThreader.TryCount := Control.TryCount;
  AThreader.TimeOut := Control.TimeOut;
  AThreader.ReconnectAfter := Control.ReconnectAfter;
  AThreader.FreeOnTerminate := True;
  AThreader.CertificateFlags := FCertificateFlags;
  AThreader.UseInternetErrorDialog := Control.UseInternetErrorDialog;

  AThreader.HttpProxySettings := Control.HttpProxySettings;
  AThreader.FtpProxySettings := Control.FtpProxySettings;
  AThreader.ProxyBypass := StringReplace(Trim(Control.ProxyBypass.Text), #13#10, #32, [rfReplaceAll]);

  AThreader.InternetAgent := Control.InternetAgent;
  AThreader.PassiveFTPMode := Control.PassiveFTPMode;
  AThreader.KeepConnection := KeepConnection;
  AThreader.DoNotGetResourceInfo := Control.DoNotGetResourceInfo;
  if IsSharedConnection() then
  begin
    AThreader.Connection := GetConnection();
  end;
end;

procedure TclInternetItem.AssignThreader(AThreader: TclCustomThreader);
begin
  AssignThreaderEvents(AThreader);
  AssignThreaderParams(AThreader);
end;

function TclInternetItem.IsSharedConnection: Boolean;
begin
  Result := ((Control <> nil) and (Control.Connection <> nil)) or KeepConnection;
end;

function TclInternetItem.GetConnection(): TclInternetConnection;
begin
  if (Control <> nil) and (Control.Connection <> nil) then
  begin
    Result := Control.Connection;
    FSelfConnection.Free();
    FSelfConnection := nil;
  end else
  begin
    if (FSelfConnection = nil) then
    begin
      FSelfConnection := TclInternetConnection.Create(nil);
    end;
    Result := FSelfConnection;
  end;
end;

procedure TclInternetItem.ClearInfo();
begin
  FResourceInfo.Free();
  FResourceInfo := nil;
end;

constructor TclInternetItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FHttpResponseHeader := TStringList.Create();
  FErrors := TclErrorList.Create();
  FThreaderList := TList.Create();
  FResourceState := TclResourceStateList.Create(TclResourceStateItem);
  FResourceState.OnChanged := DoOnResourceStateChanged;
  FResourceInfo := nil;
  FPriority := ppNormal;
  FLastStatus := psUnknown;
  FThreadCount := 1;
end;

destructor TclInternetItem.Destroy;
begin
  if IsBusy then
  begin
    Stop();
    Wait();
  end;
  DoDestroy();
  inherited Destroy();
end;

procedure TclInternetItem.ClearThreaderList();
begin
  while (FThreaderList.Count > 0) do
  begin
    RemoveThreader(0);
  end;
end;

procedure TclInternetItem.Wait();
begin
  while (FThreaderList.Count > 0) do
  begin
    GetThreader(0).Wait();
  end;
end;

procedure TclInternetItem.DoOnDataItemProceed(Sender: TObject;
  AResourceInfo: TclResourceInfo; BytesProceed: Integer;
  CurrentData: PChar; CurrentDataSize: Integer);
var
  StateItem: TclResourceStateItem;
begin
  StateItem := FindStateItem(Sender as TclCustomThreader);
  ResourceState.UpdateProceed(StateItem, BytesProceed - StateItem.ResourcePos);
  Control.DoDataItemProceed(Self, AResourceInfo, StateItem, CurrentData, CurrentDataSize);
end;

procedure TclInternetItem.DoError(const Error: string; ErrorCode: Integer);
begin
  FErrors.AddError(Error, ErrorCode);
  Control.DoError(Self, Error, ErrorCode);
end;

procedure TclInternetItem.DoOnError(Sender: TObject; const Error: string; ErrorCode: Integer);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoOnError');{$ENDIF}
  DoError(Error, ErrorCode);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoOnError'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoOnError', E); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.DoOnGetResourceInfo(Sender: TObject; AResourceInfo: TclResourceInfo);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoOnGetResourceInfo');{$ENDIF}
  DoGetResourceInfo(AResourceInfo);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoOnGetResourceInfo'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoOnGetResourceInfo', E); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.DoOnStatusChanged(Sender: TObject; Status: TclProcessStatus);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoOnStatusChanged');{$ENDIF}
  ResourceState.UpdateStatus(FindStateItem(Sender as TclCustomThreader), Status);
  LastStatusChanged(ResourceState.LastStatus);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoOnStatusChanged: %d', nil, [Integer(Status)]); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoOnStatusChanged: %d', E, [Integer(Status)]); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.DoGetResourceInfo(AResourceInfo: TclResourceInfo);
begin
  ClearInfo();
  if (AResourceInfo <> nil) then
  begin
    FResourceInfo := TclResourceInfo.Create();
    FResourceInfo.Assign(AResourceInfo);
  end;
  Control.DoGetResourceInfo(Self, FResourceInfo);
end;

function TclInternetItem.GetThreader(Index: Integer): TclCustomThreader;
begin
  Result := TclThreaderHolder(FThreaderList[Index]).FThreader;
end;

procedure TclInternetItem.RemoveThreader(Index: Integer);
begin
  TclThreaderHolder(FThreaderList[Index]).Free();
  FThreaderList.Delete(Index);
end;

procedure TclInternetItem.ThreaderTerminated(AThreader: TclCustomThreader);
var
  i: Integer;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'ThreaderTerminated');{$ENDIF}
  if (AThreader.Status <> psFailed) and (ResourceState.LastStatus <> psTerminated) then
  begin
    ReTryFailedItem(FindFirstFailedItem(AThreader), AThreader.URLParser);
  end;
  for i := 0 to FThreaderList.Count - 1 do
  begin
    if (GetThreader(i) = AThreader) then
    begin
      RemoveThreader(i);
      Break;
    end;
  end;
  if (FThreaderList.Count = 0) then
  begin
    ProcessCompleted(AThreader);
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'ThreaderTerminated'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'ThreaderTerminated', E); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.ReTryFailedItem(AStateItem: TclResourceStateItem; AURLParser: TclUrlParser);
var
  Threader: TclCustomThreader;                                                                       
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'ReTryFailedItem');{$ENDIF}
  if (AStateItem = nil) then Exit;
  Threader := AddThreader(AStateItem, False);
  Threader.ResourceInfo := ResourceInfo;
  Threader.URLParser := AURLParser;
  Threader.Perform();
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'ReTryFailedItem'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'ReTryFailedItem', E); raise; end; end;{$ENDIF}
end;

function TclInternetItem.FindFirstFailedItem(APrevThreader: TclCustomThreader): TclResourceStateItem;
var
  i: Integer;
  PrevStateItem: TclResourceStateItem;
begin
  PrevStateItem := FindStateItem(APrevThreader);
  if (PrevStateItem <> nil) then
  begin
    for i := 0 to ResourceState.Count - 1 do
    begin
      Result := ResourceState[i];
      if ((PrevStateItem <> Result) and (Result.Status = psFailed)) then
      begin
        Exit;
      end;
    end;
  end;
  Result := nil;
end;

procedure TclInternetItem.DoOnTerminate(Sender: TObject);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoOnTerminate');{$ENDIF}
  ThreaderTerminated(Sender as TclCustomThreader);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoOnTerminate'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoOnTerminate', E); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.DoOnURLParsing(Sender: TObject; var URLComponents: TURLComponents);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoOnURLParsing');{$ENDIF}
  if (UserName <> '') then
  begin
    ZeroMemory(URLComponents.lpszUserName + 0, INTERNET_MAX_USER_NAME_LENGTH);
    CopyMemory(URLComponents.lpszUserName + 0, PChar(FUserName), Length(FUserName));
    URLComponents.dwUserNameLength := Length(FUserName);
  end;
  if (Password <> '') then
  begin
    ZeroMemory(URLComponents.lpszPassword + 0, INTERNET_MAX_USER_NAME_LENGTH);
    CopyMemory(URLComponents.lpszPassword + 0, PChar(FPassword), Length(FPassword));
    URLComponents.dwPasswordLength := Length(FPassword);
  end;
  if (Port <> 0) then
  begin
    URLComponents.nPort := Word(Port);
  end;
  Control.DoURLParsing(Self, URLComponents);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoOnURLParsing'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoOnURLParsing', E); raise; end; end;{$ENDIF}
end;

function TclInternetItem.GetIsBusy: Boolean;
begin
  Result := (FThreaderList.Count > 0);
end;

function TclInternetItem.GetResourceInfo(IsAsynch: Boolean): TclResourceInfo;
begin
  Result := nil;
  if (FResourceInfo = nil) and (not IsBusy) then
  begin
    if Control.CanStartItem(Self, True, IsAsynch) then
    begin
      InternalStart(True);
    end;
    if not IsAsynch then
    begin
      Wait();
      Result := FResourceInfo;
    end;
  end else
  begin
    Result := FResourceInfo;
    if not IsBusy then
    begin
      Control.DoGetResourceInfo(Self, FResourceInfo);
    end;
  end;
end;

procedure TclInternetItem.SetLocalFile(const Value: string);
begin
  if (FLocalFile = Value) then Exit;
  FLocalFile := Value;
  ControlChanged();
end;

procedure TclInternetItem.SetPassword(const Value: string);
begin
  if (FPassword = Value) then Exit;
  FPassword := Value;
  ControlChanged();
end;

procedure TclInternetItem.SetURL(const Value: string);
var
  Parser: TclUrlParser;
begin
  if (FURL = Value) then Exit;
  FURL := Value;
  if (csLoading in Control.ComponentState) then Exit;
  Parser := TclUrlParser.Create();
  try
    if (Parser.Parse(FURL) <> '') then
    begin
      UserName := Parser.User;
      Password := Parser.Password;
    end;
  finally
    Parser.Free();
  end;
  ControlChanged();
end;

procedure TclInternetItem.SetUserName(const Value: string);
begin
  if (FUserName = Value) then Exit;
  FUserName := Value;
  ControlChanged();
end;

procedure TclInternetItem.SetMaxConnectionsOption();
  procedure SetIntOption(AOption, AValue: DWORD);
  var
    val, valsize: DWORD;
  begin
    val := 0;
    valsize := SizeOf(val);
    InternetQueryOption(nil, AOption, @val, valsize);
    if (val < AValue) then
    begin
      val := AValue;
      valsize := SizeOf(val);
      InternetSetOption(nil, AOption, @val, valsize);
    end;
  end;

begin
  SetIntOption(INTERNET_OPTION_MAX_CONNS_PER_SERVER, cMaxThreadCount);
  SetIntOption(INTERNET_OPTION_MAX_CONNS_PER_1_0_SERVER, cMaxThreadCount);
end;

procedure TclInternetItem.InternalStart(AIsGetResourceInfo: Boolean);
var
  StateItem: TclResourceStateItem;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'InternalStart: %s', nil, [URL]);{$ENDIF}
  SetMaxConnectionsOption();
  FLastStatus := psUnknown;
  ClearInfo();
  FHttpResponseHeader.Clear();
  FErrors.Clear();
  ResourceState.InitStatistic();
  if AIsGetResourceInfo or CanProcess() then
  begin
    Control.BeginIsBusy();
    if (ResourceState.Count > 0) then
    begin
      StateItem := ResourceState[0];
    end else
    begin
      StateItem := nil;
    end;
    AddThreader(StateItem, AIsGetResourceInfo).Perform();
  end;
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'InternalStart'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'InternalStart', E); raise; end; end;{$ENDIF}
end;

function TclInternetItem.AddThreader(AStateItem: TclResourceStateItem;
  AIsGetResourceInfo: Boolean): TclCustomThreader;
var
  Holder: TclThreaderHolder;
  Stream: TStream;
begin
  if not AIsGetResourceInfo then
  begin
    Stream := GetDataStream();
  end else
  begin
    Stream := nil;
  end;
  Result := CreateThreader(Stream, AIsGetResourceInfo);
  Holder := TclThreaderHolder.Create();
  FThreaderList.Add(Holder);
  Holder.FThreader := Result;
  Holder.FStateItem := AStateItem;
  AssignThreader(Result);
  if (AStateItem <> nil) then
  begin
    Result.ResourcePos := AStateItem.ResourcePos + AStateItem.BytesProceed;
    if (AStateItem.BytesToProceed > 0) then
    begin
      Result.BytesToProceed := AStateItem.BytesToProceed - AStateItem.BytesProceed;
    end;
  end;
end;

procedure TclInternetItem.Start(IsAsynch: Boolean);
begin
  if IsBusy then
  begin
    raise EclInternetError.Create(cOperationIsInProgress, -1);
  end;
  if Control.CanStartItem(Self, False, IsAsynch) then
  begin
    InternalStart(False);
  end;
  if not IsAsynch then
  begin
    Wait();
  end;
end;

procedure TclInternetItem.Stop;
var
  i: Integer;
begin
  Control.DoStopItem(Self);
  if IsBusy then
  begin
    for i := 0 to FThreaderList.Count - 1 do
    begin
      GetThreader(i).Stop();
    end;
  end;
end;

procedure TclInternetItem.ProcessCompleted(AThreader: TclCustomThreader);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'ProcessCompleted');{$ENDIF}
  HttpResponseHeader.Assign(AThreader.ResponseHeader);
  FIsCommit := True;
  try
    CommitWork();
  finally
    FIsCommit := False;
  end;
  Control.StartNextItem(Self);
  Control.EndIsBusy();
  Control.DoProcessCompleted(Self);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'ProcessCompleted'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'ProcessCompleted', E); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.CommitWork;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'CommitWork');{$ENDIF}
  ClearDataStream();
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'CommitWork'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'CommitWork', E); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.LastStatusChanged(Status: TclProcessStatus);
begin
  if (FLastStatus <> Status) then
  begin
    FLastStatus := Status;
    Control.DoStatusChanged(Self, FLastStatus);
  end;
end;

procedure TclInternetItem.DoOnGetCertificate(Sender: TObject;
  var ACertificate: TclCertificate; var Handled: Boolean);
begin
  Control.DoGetCertificate(Self, ACertificate, Handled);
end;

procedure TclInternetItem.ClearDataStream();
begin
  FSelfDataStream.Free();
  FSelfDataStream := nil;
end;

function TclInternetItem.CheckSizeValid(ASize: Integer): Boolean;
begin
  Result := True;
  Result := Result and ((Control.MinResourceSize = 0) or (ASize >= Control.MinResourceSize));
  Result := Result and ((Control.MaxResourceSize = 0) or (ASize <= Control.MaxResourceSize));
end;

function TclInternetItem.CanProcess: Boolean;
begin
  Result := Control.CanProcess(Self);
end;

procedure TclInternetItem.ClearResourceState();
var
  i: Integer;
begin
  ResourceState.Clear();
  for i := 0 to FThreaderList.Count - 1 do
  begin
    TclThreaderHolder(FThreaderList[i]).FStateItem := nil;
  end;
end;

procedure TclInternetItem.SetInternalDataStream(const ADataStream: TStream);
begin
  if (DataStream = nil) then
  begin
    ClearDataStream();
    FSelfDataStream := ADataStream;
  end;
end;

procedure TclInternetItem.SetDataStream(const Value: TStream);
begin
  if (DataStream <> Value) then
  begin
    ClearDataStream();
    FDataStream := Value;
  end;
end;

function TclInternetItem.GetInternalDataStream: TStream;
begin
  if (FDataStream <> nil) then
  begin
    Result := FDataStream;
  end else
  begin
    Result := FSelfDataStream;
  end;
end;

function TclInternetItem.FindStateItem(AThreader: TclCustomThreader): TclResourceStateItem;
var
  i: Integer;
begin
  for i := 0 to FThreaderList.Count - 1 do
  begin
    if (GetThreader(i) = AThreader) then
    begin
      Result := TclThreaderHolder(FThreaderList[i]).FStateItem;
      Exit;
    end;
  end;
  Result := nil;
end;

procedure TclInternetItem.ControlChanged();
begin
  if not (csLoading in Control.ComponentState) then
  begin
    if not IsBusy then
    begin
      ClearInfo();
      ClearResourceState();
      CloseConnection();
    end;
    Control.Changed(Self);
  end;
end;

procedure TclInternetItem.CloseConnection;
begin
  GetConnection().Close();
end;

function TclInternetItem.GetDefaultChar: Char;
begin
  Result := Control.DefaultChar;
end;

function TclInternetItem.GetBatchSize: Integer;
begin
  Result := Control.BatchSize;
end;

procedure TclInternetItem.DoOnResourceStateChanged(Sender: TObject);
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoOnResourceStateChanged');{$ENDIF}
  Control.DoResourceStateChanged(Self);
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoOnResourceStateChanged'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoOnResourceStateChanged', E); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.SetThreadCount(const Value: Integer);
begin
  if (Value > 0) and (Value <= cMaxThreadCount) then
  begin
    FThreadCount := Value;
  end;
end;

procedure TclInternetItem.DoDestroy;
begin
{$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'DoDestroy');{$ENDIF}
  Control.DoItemDeleted(Self);
  ClearDataStream();
  ClearInfo();
  FResourceState.Free();
  ClearThreaderList();
  FSelfConnection.Free();
  FThreaderList.Free();
  FErrors.Free();
  FHttpResponseHeader.Free();
{$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'DoDestroy'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'DoDestroy', E); raise; end; end;{$ENDIF}
end;

procedure TclInternetItem.SetHttpRequest(const Value: TclHttpRequest);
begin
  if (FHttpRequest = Value) then Exit;
{$IFDEF DELPHI5}
  if (FHttpRequest <> nil) then
  begin
    FHttpRequest.RemoveFreeNotification(Control);
  end;
{$ENDIF}
  FHttpRequest := Value;
  if (FHttpRequest <> nil) then
  begin
    FHttpRequest.FreeNotification(Control);
  end;
  ControlChanged();
end;

procedure TclInternetItem.InternalSetHttpRequest(const Value: TclHttpRequest);
begin
  FHttpRequest := Value;
end;

function TclInternetItem.GetResourceConnections(Index: Integer): TclInternetConnection;
begin
  Result := GetThreader(Index).Connection;
end;

function TclInternetItem.GetResourceConnectionCount: Integer;
begin
  Result := FThreaderList.Count;
end;

procedure TclInternetItem.SetPort(const Value: Integer);
begin
  if (FPort = Value) then Exit;
  FPort := Value;
  ControlChanged();
end;

procedure TclInternetItem.DeleteRemoteFile;
var
  threader: TclDeleteThreader;
begin
  threader := TclDeleteThreader.Create(URL);
  try
    AssignThreaderParams(threader);
    threader.FreeOnTerminate := False;

    threader.OnUrlParsing := DoOnURLParsing;
    threader.OnGetCertificate := DoOnGetCertificate;

    threader.Perform();
    threader.Wait();

    if (threader.Status <> psSuccess) then
    begin
      raise EclInternetError.Create(threader.LastError, threader.LastErrorCode);
    end;
  finally
    threader.Free();
  end;
end;

procedure TclInternetItem.SetUseHttpRequest(const Value: Boolean);
begin
  FUseHttpRequest := Value;
end;

{ TclCustomInternetControl }

procedure TclCustomInternetControl.BeginIsBusy;
begin
  Inc(FIsBusyCount);
  if (FIsBusyCount = 1) then
  begin
    IsBusyChanged();
  end;
end;

constructor TclCustomInternetControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProxyBypass := TStringList.Create();
  FFtpProxySettings := TclFtpProxySettings.Create();
  FHttpProxySettings := TclHttpProxySettings.Create();
  FNotifierList := TList.Create();
  FTryCount := cTryCount;
  FBatchSize := cBatchSize;
  FTimeOut := cTimeOut;
  FReconnectAfter := cTimeOut;
  FMinResourceSize := 0;
  FMaxResourceSize := 0;
  FInternetAgent := cInternetAgent;
  FDefaultChar := cDefaultChar;
  FDoNotGetResourceInfo := False;
  FUseInternetErrorDialog := False;
end;

procedure TclCustomInternetControl.EndIsBusy;
var
  Allow: Boolean;
begin
  Allow := (FIsBusyCount = 1);
  Dec(FIsBusyCount);
  if (FIsBusyCount < 0) then
  begin
    FIsBusyCount := 0;
  end;
  if Allow then
  begin
    IsBusyChanged();
  end;
end;

function TclCustomInternetControl.GetIsBusy: Boolean;
begin
  Result := (FIsBusyCount > 0);
end;

procedure TclCustomInternetControl.IsBusyChanged;
begin
  if Assigned(FOnIsBusyChanged) then
  begin
    FOnIsBusyChanged(Self);
  end;
end;

procedure TclCustomInternetControl.ReadRegistry(const APath: string);
var
  size: Integer;
  reg: TRegistry;
  stream: TMemoryStream;
begin
  reg := TRegistry.Create();
  try
    if (reg.OpenKey(APath, False)) and reg.ValueExists(cDataValueName) then
    begin
      size := reg.GetDataSize(cDataValueName);
      if (size > 0) then
      begin
        stream := TMemoryStream.Create();
        try
          stream.Size := size;
          reg.ReadBinaryData(cDataValueName, stream.Memory^, size);
          try
            stream.ReadComponent(Self);
          except
          end;
        finally
          stream.Free();
        end;
      end;
      reg.CloseKey();
    end;
  finally
    reg.Free();
  end;
end;

procedure TclCustomInternetControl.WriteRegistry(const APath: string);
var
  reg: TRegistry;
  stream: TMemoryStream;
begin
  reg := TRegistry.Create();
  try
    if (reg.OpenKey(APath, True)) then
    begin
      stream := TMemoryStream.Create();
      try
        stream.WriteComponent(Self);
        reg.WriteBinaryData(cDataValueName, stream.Memory^, stream.Size);
      finally
        stream.Free();
      end;
      reg.CloseKey();
    end;
  finally
    reg.Free();
  end;
end;

procedure TclCustomInternetControl.SetBatchSize(const Value: Integer);
begin
  if (FBatchSize <> Value) and (Value > 0) then
  begin
    FBatchSize := Value;
  end;
end;

procedure TclCustomInternetControl.SetTimeOut(const Value: Integer);
begin
  if (FTimeOut <> Value) and (Value > 0) then
  begin
    FTimeOut := Value;
  end;
end;

procedure TclCustomInternetControl.SetTryCount(const Value: Integer);
begin
  if (FTryCount <> Value) and (Value > 0) then
  begin
    FTryCount := Value;
  end;
end;

procedure TclCustomInternetControl.SetMaxResourceSize(const Value: Integer);
begin
  if (Value > -1) then
  begin
    FMaxResourceSize := Value;
  end;
end;

procedure TclCustomInternetControl.SetMinResourceSize(const Value: Integer);
begin
  if (Value > -1) then
  begin
    FMinResourceSize := Value;
  end;
end;

procedure TclCustomInternetControl.SetDefaultChar(const Value: Char);
begin
  if (FDefaultChar <> Value) and (Value > #31) then
  begin
    FDefaultChar := Value;
  end;
end;

procedure TclCustomInternetControl.Loaded;
begin
  inherited Loaded();
  Changed(nil);
end;

destructor TclCustomInternetControl.Destroy;
begin
  FNotifierList.Free();
  FHttpProxySettings.Free();
  FFtpProxySettings.Free();
  FProxyBypass.Free();
  inherited Destroy();
end;

procedure TclCustomInternetControl.DoDataItemProceed(Item: TclInternetItem;
  ResourceInfo: TclResourceInfo; AStateItem: TclResourceStateItem;
  CurrentData: PChar; CurrentDataSize: Integer);
var
  i: Integer;
begin
  for i := 0 to FNotifierList.Count - 1 do
  begin
    GetControlNotifier(i).DoDataItemProceed(Item,
      ResourceInfo, AStateItem, CurrentData, CurrentDataSize);
  end;
end;

procedure TclCustomInternetControl.DoStatusChanged(Item: TclInternetItem; Status: TclProcessStatus);
var
  i: Integer;
begin
  for i := 0 to FNotifierList.Count - 1 do
  begin
    GetControlNotifier(i).DoStatusChanged(Item, Status);
  end;
end;

function TclCustomInternetControl.GetControlNotifier(Index: Integer): TclControlNotifier;
begin
  Result := TclControlNotifier(FNotifierList[Index]);
end;

procedure TclCustomInternetControl.RegisterControlNotifier(ANotifier: TclControlNotifier);
begin
  FNotifierList.Add(ANotifier);
end;

procedure TclCustomInternetControl.UnregisterControlNotifier(ANotifier: TclControlNotifier);
begin
  FNotifierList.Remove(ANotifier);
end;

procedure TclCustomInternetControl.DoItemDeleted(Item: TclInternetItem);
var
  i: Integer;
begin
  for i := 0 to FNotifierList.Count - 1 do
  begin
    GetControlNotifier(i).DoItemDeleted(Item);
  end;
end;

procedure TclCustomInternetControl.DoResourceStateChanged(Item: TclInternetItem);
var
  i: Integer;
begin
  for i := 0 to FNotifierList.Count - 1 do
  begin
    GetControlNotifier(i).DoResourceStateChanged(Item);
  end;
end;

procedure TclCustomInternetControl.SetReconnectAfter(const Value: Integer);
begin
  if (FReconnectAfter <> Value) and (Value > 0) then
  begin
    FReconnectAfter := Value;
  end;
end;

procedure TclCustomInternetControl.SetConnection(const Value: TclInternetConnection);
begin
  if (FConnection <> Value) then
  begin
{$IFDEF DELPHI5}
    if (FConnection <> nil) then
    begin
      FConnection.RemoveFreeNotification(Self);
    end;
{$ENDIF}
    FConnection := Value;
    if (FConnection <> nil) then
    begin
      FConnection.FreeNotification(Self);
    end;
  end;
end;

procedure TclCustomInternetControl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation <> opRemove) then Exit;
  if (AComponent = FConnection) then
  begin
    FConnection := nil;
  end;
  if not (csDestroying in ComponentState) then
  begin
    NotifyInternetItems(AComponent);
  end;
end;

function TclCustomInternetControl.GetCookie(const AURL, AName: string): string;
var
  List: TStrings;
begin
  List := TStringList.Create();
  try
    GetAllCookies(AURL, List);
    Result := List.Values[AName];
  finally
    List.Free();
  end;
end;

procedure TclCustomInternetControl.SetCookie(const AURL, AName, AValue: string);
begin
  if not InternetSetCookie(PChar(AURL), PChar(AName), PChar(AValue)) then
  begin
    raise EclInternetError.CreateByLastError();
  end;
end;

procedure TclCustomInternetControl.GetAllCookies(const AURL: string; AList: TStrings);
  procedure AddTextStr(AList: TStrings; const Value: string);
  var
    P, Start: PChar;
    S: string;
  begin
    AList.BeginUpdate();
    try
      P := Pointer(Value);
      if P <> nil then
        while P^ <> #0 do
        begin
          Start := P;
          while not (P^ in [#0, #32, #59]) do Inc(P);
          SetString(S, Start, P - Start);
          AList.Add(S);
          if P^ = #59 then Inc(P);
          if P^ = #32 then Inc(P);
        end;
    finally
      AList.EndUpdate();
    end;
  end;

var
  buf: PChar;
  size: DWORD;
begin
  size := 0;
  if not InternetGetCookie(PChar(AURL), nil, nil, size) then
  begin
    raise EclInternetError.CreateByLastError();
  end;
  GetMem(buf, size);
  try
    if not InternetGetCookie(PChar(AURL), nil, buf, size) then
    begin
      raise EclInternetError.CreateByLastError();
    end;
    AddTextStr(AList, buf)
  finally
    FreeMem(buf);
  end;
end;

function TclCustomInternetControl.CanStartItem(Item: TclInternetItem;
  AIsGetResourceInfo, IsAsynch: Boolean): Boolean;
begin
  Result := True;
end;

procedure TclCustomInternetControl.StartNextItem(APrevItem: TclInternetItem);
begin
end;

procedure TclCustomInternetControl.DoStopItem(Item: TclInternetItem);
begin
end;

function TclCustomInternetControl.CanProcess(Item: TclInternetItem): Boolean;
begin
  Result := True;
end;

procedure TclCustomInternetControl.GetFtpDirList(const ADir, AUser,
  APassword: string; AList: TStrings; ADetails: Boolean);

  function GetMsDosFileInfo(AFindFileData: TWin32FindData): string;
  var
    info: TclFtpFileInfo;
  begin
    info := TclFtpFileInfo.Create();
    try
      info.FileName := AFindFileData.cFileName;
      info.Size := AFindFileData.nFileSizeLow;
      info.IsDirectory := ((AFindFileData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) > 0);
      info.ModifiedDate := ConvertFileTimeToDateTime(AFindFileData.ftLastWriteTime);
      Result := info.Build(lsMsDos);
    finally
      info.Free();
    end;
  end;
  
var
  URLParser: TclUrlParser;
  OpenAction: TclInternetOpenAction;
  ConnectAction: TclConnectAction;
  FindFirstFileAction: TclFtpFindFirstFileAction;
  WaitEngine: TclInternetConnection;
  FindFileData: TWin32FindData;
  usr, psw: string;
begin
{$IFDEF DEMO}
{$IFNDEF STANDALONEDEMO}
  if Application.MainForm = nil then ExitProcess(1);
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
    MessageBox(0, 'Please visit www.clevercomponents.com to purchase your ' +
      'copy of the library.', 'Information', MB_ICONEXCLAMATION  or MB_TASKMODAL or MB_TOPMOST);
{$ENDIF}
  end;
{$ENDIF}
  AList.Clear();

  URLParser := nil;
  WaitEngine := nil;
  OpenAction := nil;
  ConnectAction := nil;
  FindFirstFileAction := nil;
  try
    URLParser := TclUrlParser.Create();
    if (URLParser.Parse(ADir) = '') then Exit;
    WaitEngine := TclInternetConnection.Create(nil);
    OpenAction := TclInternetOpenAction.Create(WaitEngine, InternetAgent,
      INTERNET_OPEN_TYPE_PRECONFIG, '', '', INTERNET_FLAG_DONT_CACHE);
    OpenAction.FireAction(-1);

    usr := AUser;
    if (usr = '') then
    begin
      usr := URLParser.User;
    end;
    psw := APassword;
    if (psw = '') then
    begin
      psw := URLParser.Password;
    end;

    ConnectAction := TclConnectAction.Create(WaitEngine, OpenAction.hResource,
      URLParser.Host, INTERNET_DEFAULT_FTP_PORT, usr, psw, INTERNET_SERVICE_FTP, 0);
    ConnectAction.FireAction(TimeOut);

    FindFirstFileAction := TclFtpFindFirstFileAction.Create(WaitEngine,
      ConnectAction.Internet, ConnectAction.hResource, URLParser.Urlpath, INTERNET_FLAG_RELOAD);

    FindFirstFileAction.FireAction(TimeOut);
    FindFileData := FindFirstFileAction.lpFindFileData;
    repeat
      if ADetails then
      begin
        AList.Add(GetMsDosFileInfo(FindFileData));
      end else
      begin
        AList.Add(FindFileData.cFileName);
      end;
    until (not InternetFindNextFile(FindFirstFileAction.hResource, @FindFileData));
  finally
    FindFirstFileAction.Free();
    ConnectAction.Free();
    OpenAction.Free();
    WaitEngine.Free();
    URLParser.Free();
  end;
end;

procedure TclCustomInternetControl.SetFtpProxySettings(const Value: TclFtpProxySettings);
begin
  FFtpProxySettings.Assign(Value);
end;

procedure TclCustomInternetControl.SetHttpProxySettings(const Value: TclHttpProxySettings);
begin
  FHttpProxySettings.Assign(Value);
end;

procedure TclCustomInternetControl.SetProxyBypass(const Value: TStrings);
begin
  FProxyBypass.Assign(Value);
end;

{ TclMultiInternetControl }

procedure TclMultiInternetControl.Changed(Item: TclInternetItem);
begin
  if Assigned(FOnChanged) then
  begin
    FOnChanged(Self, Item);
  end;
end;

procedure TclMultiInternetControl.DoDataItemProceed(Item: TclInternetItem;
  ResourceInfo: TclResourceInfo; AStateItem: TclResourceStateItem; CurrentData: PChar;
  CurrentDataSize: Integer);
begin
  if Assigned(FOnDataItemProceed) then
  begin
    FOnDataItemProceed(Self, Item, ResourceInfo, AStateItem, CurrentData, CurrentDataSize);
  end;
  inherited DoDataItemProceed(Item, ResourceInfo, AStateItem, CurrentData, CurrentDataSize);
end;

procedure TclMultiInternetControl.DoError(Item: TclInternetItem; const Error: string;
  ErrorCode: Integer);
begin
  if Assigned(FOnError) then
  begin
    FOnError(Self, Item, Error, ErrorCode);
  end;
end;

procedure TclMultiInternetControl.DoGetCertificate(Item: TclInternetItem;
  var ACertificate: TclCertificate; var Handled: Boolean);
begin
  if Assigned(FOnGetCertificate) then
  begin
    FOnGetCertificate(Self, Item, ACertificate, Handled);
  end;
end;

procedure TclMultiInternetControl.DoGetResourceInfo(Item: TclInternetItem; AResourceInfo: TclResourceInfo);
begin
  if Assigned(FOnGetResourceInfo) then
  begin
    FOnGetResourceInfo(Self, Item, AResourceInfo);
  end;
end;

procedure TclMultiInternetControl.DoStatusChanged(Item: TclInternetItem; Status: TclProcessStatus);
begin
  if Assigned(FOnStatusChanged) then
  begin
    FOnStatusChanged(Self, Item, Status);
  end;
  inherited DoStatusChanged(Item, Status);
end;

procedure TclMultiInternetControl.DoURLParsing(Item: TclInternetItem; var URLComponents: TURLComponents);
begin
  if Assigned(FOnUrlParsing) then
  begin
    FOnUrlParsing(Self, Item, URLComponents);
  end;
end;

function TclMultiInternetControl.GetResourceInfo(Item: TclInternetItem; IsAsynch: Boolean): TclResourceInfo;
var
  i: Integer;
begin
  if (Item <> nil) then
  begin
    Result := Item.GetResourceInfo(IsAsynch);
  end else
  begin
    Result := nil;
    for i := 0 to GetInternetItemsCount() - 1 do
    begin
      GetInternetItems(i).GetResourceInfo(IsAsynch);
    end;
  end;
end;

procedure TclMultiInternetControl.Start(Item: TclInternetItem; IsAsynch: Boolean);
var
  i: Integer;
begin
  if (Item <> nil) then
  begin
    Item.Start(IsAsynch);
  end else
  begin
    for i := 0 to GetInternetItemsCount() - 1 do
    begin
      GetInternetItems(i).Start(IsAsynch);
    end;
  end;
end;

procedure TclMultiInternetControl.Stop(Item: TclInternetItem);
begin
  InternalStop(Item);
end;

procedure TclMultiInternetControl.DoProcessCompleted(Item: TclInternetItem);
begin
  if Assigned(FOnProcessCompleted) then
  begin
    FOnProcessCompleted(Self, Item);
  end;
end;

procedure TclMultiInternetControl.NotifyInternetItems(AComponent: TComponent);
var
  i: Integer;
begin
  for i := 0 to GetInternetItemsCount() - 1 do
  begin
    if (GetInternetItems(i).HttpRequest = AComponent) then
    begin
      GetInternetItems(i).InternalSetHttpRequest(nil);
    end;
  end;
end;

procedure TclMultiInternetControl.SetMaxStartedItems(const Value: Integer);
begin
  if (Value > -1) then
  begin
    FMaxStartedItems := Value;
  end;
end;

constructor TclMultiInternetControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDelayedItems := TList.Create();
  FMaxStartedItems := 5;
end;

function TclMultiInternetControl.CanStartItem(Item: TclInternetItem;
  AIsGetResourceInfo, IsAsynch: Boolean): Boolean;
var
  info: TclInternetItemInfo;
begin
  Result := (not IsAsynch) or (FMaxStartedItems = 0) or (FStartedItemCount < FMaxStartedItems);
  if Result then
  begin
    Inc(FStartedItemCount);
  end else
  begin
    info := TclInternetItemInfo.Create();
    FDelayedItems.Add(info);
    info.FItem := Item;
    info.FIsGetResourceInfo := AIsGetResourceInfo;
  end;
end;

procedure TclMultiInternetControl.StartNextItem(APrevItem: TclInternetItem);
var
  info: TclInternetItemInfo;
begin
  if (FStartedItemCount > 0) then
  begin
    Dec(FStartedItemCount);
  end;
  if (FDelayedItems.Count > 0) then
  begin
    info := TclInternetItemInfo(FDelayedItems[0]);
    try
      FDelayedItems.Delete(0);
      info.FItem.InternalStart(info.FIsGetResourceInfo);
      Inc(FStartedItemCount);
    finally
      info.Free();
    end;
  end;
end;

destructor TclMultiInternetControl.Destroy;
var
  i: Integer;
begin
  for i := 0 to FDelayedItems.Count - 1 do
  begin
    TObject(FDelayedItems[i]).Free();
  end;
  FDelayedItems.Free();
  inherited Destroy();
end;

procedure TclMultiInternetControl.DeleteDelayedInfo(Item: TclInternetItem);
var
  i: Integer;
  info: TclInternetItemInfo;
begin
  for i := 0 to FDelayedItems.Count - 1 do
  begin
    info := TclInternetItemInfo(FDelayedItems[i]);
    if (info.FItem = Item) then
    begin
      info.Free();
      FDelayedItems.Delete(i);
      Break;
    end;
  end;
end;

procedure TclMultiInternetControl.DoItemDeleted(Item: TclInternetItem);
begin
  inherited DoItemDeleted(Item);
  DeleteDelayedInfo(Item);
end;

procedure TclMultiInternetControl.DoStopItem(Item: TclInternetItem);
begin
  DeleteDelayedInfo(Item);
end;

procedure TclMultiInternetControl.InternalStop(Item: TclInternetItem);
var
  i: Integer;
begin
  if (Item <> nil) then
  begin
    Item.Stop();
  end else
  begin
    for i := 0 to GetInternetItemsCount() - 1 do
    begin
      GetInternetItems(i).Stop();
    end;
  end;
end;

{ TclResourceStateList }

function TclResourceStateList.Add(): TclResourceStateItem;
begin
  Result := TclResourceStateItem(inherited Add());
end;

procedure TclResourceStateList.Assign(Source: TPersistent);
begin
  InitStatistic();
  FResourceSize := 0;
  if (Source is TclResourceStateList) then
  begin
    FResourceSize := (Source as TclResourceStateList).ResourceSize;
  end;
  inherited Assign(Source);
end;

procedure TclResourceStateList.InitStatistic();
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].FStatus := psUnknown;
  end;
  FLastStatus := psUnknown;
  FSpeedCount := 0;
  FStartCount := 0;
  FSpeed := 0;
  FElapsedTime := 0;
  FBytesProceedSinceStart := GetBytesProceed();
  QueryPerformanceCounter(FStartCount);
end;

function TclResourceStateList.GetBytesProceed: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
  begin
    Result := Result + Items[i].BytesProceed;
  end;
end;

function TclResourceStateList.GetItem(Index: Integer): TclResourceStateItem;
begin
  Result := TclResourceStateItem(inherited GetItem(Index));
end;

function TclResourceStateList.GetLastStatus: TclProcessStatus;
  function CheckStatus(ACheckStatus: TclProcessStatus; var AResStatus: TclProcessStatus): Boolean;
  var
    i: Integer;
  begin
    for i := 0 to Count - 1 do
    begin
      AResStatus := Items[i].Status;
      Result := (AResStatus = ACheckStatus);
      if Result then Exit;
    end;
    AResStatus := psUnknown;
    Result := False;
  end;

  function CreckItemsStatus(): TclProcessStatus;
  begin
    if CheckStatus(psProcess, Result) then Exit;
    if CheckStatus(psTerminated, Result) then Exit;
    if CheckStatus(psFailed, Result) then Exit;
    if CheckStatus(psErrors, Result) then Exit;
    if CheckStatus(psSuccess, Result) then Exit;
  end;

begin
  Result := CreckItemsStatus();
  if (Result in [psUnknown, psSuccess]) and (FLastStatus <> psUnknown) then
  begin
    Result := FLastStatus;
  end;
end;

procedure TclResourceStateList.Init(AThreadCount, AResourceSize: Integer);
var
  i, ResPos, Proceed: Integer;
  StateItem: TclResourceStateItem;
begin
  InitStatistic();
  if (Count > 0) then Exit;
  FResourceSize := AResourceSize;
  ResPos := 0;
  Proceed := 0;
  for i := 0 to AThreadCount - 1 do
  begin
    StateItem := Add();
    if (FResourceSize > 0) then
    begin
      ResPos := i * (FResourceSize div AThreadCount);
      if (i < (AThreadCount - 1)) then
      begin
        Proceed := (FResourceSize div AThreadCount);
      end else
      begin
        Proceed := FResourceSize - ResPos;
      end;
    end;
    StateItem.ResourcePos := ResPos;
    StateItem.BytesToProceed := Proceed;
  end;
end;

procedure TclResourceStateList.SetItem(Index: Integer; const Value: TclResourceStateItem);
begin
  inherited SetItem(Index, Value);
end;

procedure TclResourceStateList.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if (Count = 0) then
  begin
    InitStatistic();
  end;
  DoChanged();
end;

procedure TclResourceStateList.UpdateProceed(AItem: TclResourceStateItem; ABytesProceed: Integer);
begin
  if (AItem <> nil) then
  begin
    AItem.FBytesProceed := ABytesProceed;
  end;
  UpdateStatistic();
  DoChanged();
end;

procedure TclResourceStateList.UpdateStatus(AItem: TclResourceStateItem; AStatus: TclProcessStatus);
begin
  if (AItem <> nil) then
  begin
    AItem.FStatus := AStatus;
  end else
  begin
    FLastStatus := AStatus;
  end;
  DoChanged();
end;

var
  FrequencyValue: TLargeInteger = 0;

class function TclResourceStateList.GetFrequency(): TLargeInteger;
begin
  if (FrequencyValue = 0) then
  begin
    QueryPerformanceFrequency(FrequencyValue);
  end;
  Result := FrequencyValue;
end;

procedure TclResourceStateList.UpdateStatistic();
var
  NewCount: TLargeInteger;
begin
  FSpeed := 0;
  FElapsedTime := 0;
  if QueryPerformanceCounter(NewCount) and (GetFrequency() > 0) then
  begin
    FSpeed := (BytesProceed - FBytesProceedSinceStart) / ((NewCount - FStartCount) / GetFrequency());
    FSpeedCount := NewCount;
    FElapsedTime := (FSpeedCount - FStartCount) / GetFrequency();
  end;
end;

function TclResourceStateList.GetRemainingTime: Double;
begin
  if (ResourceSize > 0) and (Speed > 0) then
  begin
    Result := (ResourceSize - BytesProceed) / Speed;
  end else
  begin
    Result := 0;
  end;
end;

procedure TclResourceStateList.DoChanged;
begin
  if Assigned(FOnChanged) then
  begin
    FOnChanged(Self);
  end;
end;

{ TclResourceStateItem }

procedure TclResourceStateItem.Assign(Source: TPersistent);
var
  Src: TclResourceStateItem;
begin
  if (Source is TclResourceStateItem) then
  begin
    Src := (Source as TclResourceStateItem);
    FResourcePos := Src.ResourcePos;
    FBytesToProceed := Src.BytesToProceed;
    FStatus := Src.Status;
    FBytesProceed := Src.BytesProceed;
  end else
  begin
    inherited Assign(Source);
  end;
end;

function TclResourceStateItem.GetResourceState: TclResourceStateList;
begin
  Result := (Collection as TclResourceStateList);
end;

procedure TclResourceStateItem.SetBytesProceed(const Value: Integer);
begin
  if (Value > -1) then
  begin
    FBytesProceed := Value;
  end;
end;

procedure TclResourceStateItem.SetBytesToProceed(const Value: Integer);
begin
  if (Value > -1) then
  begin
    FBytesToProceed := Value;
  end;
end;

procedure TclResourceStateItem.SetResourcePos(const Value: Integer);
begin
  if (Value > -1) then
  begin
    FResourcePos := Value;
  end;
end;

{ TclErrorList }

procedure TclErrorList.AddError(const AError: string; AErrorCode: Integer);
begin
  FList.AddObject(AError, TObject(AErrorCode));
end;

procedure TclErrorList.Clear;
begin
  FList.Clear();
end;

constructor TclErrorList.Create;
begin
  inherited Create();
  FList := TStringList.Create();
end;

destructor TclErrorList.Destroy;
begin
  FList.Free();
  inherited Destroy();
end;

function TclErrorList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TclErrorList.GetErrorCodes(Index: Integer): Integer;
begin
  Result := Integer(FList.Objects[Index]);
end;

function TclErrorList.GetErrors(Index: Integer): string;
begin
  Result := FList[Index];
end;

function TclErrorList.GetText: string;
begin
  Result := FList.Text;
end;

{ TclControlNotifier }

constructor TclControlNotifier.Create(AControl: TclCustomInternetControl);
begin
  inherited Create();
  FControl := AControl;
  Assert(FControl <> nil);
  FControl.RegisterControlNotifier(Self);
end;

destructor TclControlNotifier.Destroy();
begin
  FControl.UnregisterControlNotifier(Self);
  inherited Destroy();
end;

procedure TclControlNotifier.DoDataItemProceed(Item: TclInternetItem;
  ResourceInfo: TclResourceInfo; AStateItem: TclResourceStateItem;
  CurrentData: PChar; CurrentDataSize: Integer);
begin
end;

procedure TclControlNotifier.DoItemDeleted(Item: TclInternetItem);
begin
end;

procedure TclControlNotifier.DoResourceStateChanged(Item: TclInternetItem);
begin
end;

procedure TclControlNotifier.DoStatusChanged(Item: TclInternetItem; Status: TclProcessStatus);
begin
end;

end.
