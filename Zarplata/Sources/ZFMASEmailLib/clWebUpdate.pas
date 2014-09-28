{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clWebUpdate;

interface

{$I clVer.inc}
{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
{$ENDIF}

uses
  clDownloader, Classes{$IFDEF DELPHI6}, msxml {$ELSE}, msxml_tlb{$ENDIF},
  clDC, clDCUtils, clUtils, clMultiDC, clXmlUtils;

type
  TclVersionFormat = (vfStandard, vfNumber);
  TclUpdateStatus = (usDownload, usReady, usSuccess, usFailed);
  TclRunUpdateResult = (urSuccess, urError, urCancel);

  TclUpdateInfoItem = class(TCollectionItem)
  private
    FURL: string;
    FVersion: string;
    FSize: string;
    FLocalFile: string;
    FUpdateDate: string;
    FStatus: TclUpdateStatus;
    FUpdateScript: TStrings;
    FNeedTerminate: Boolean;
    FResourceState: TclResourceStateList;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure UpdateStatus(ANewStatus: TclUpdateStatus);
    property UpdateScript: TStrings read FUpdateScript;
    property URL: string read FURL write FURL;
    property LocalFile: string read FLocalFile write FLocalFile;
    property Size: string read FSize write FSize;
    property Version: string read FVersion write FVersion;
    property UpdateDate: string read FUpdateDate write FUpdateDate;
    property Status: TclUpdateStatus read FStatus write FStatus;
    property NeedTerminate: Boolean read FNeedTerminate write FNeedTerminate;
    property ResourceState: TclResourceStateList read FResourceState;
  end;

  TclUpdateInfoList = class(TCollection)
  private
    function GetItem(Index: Integer): TclUpdateInfoItem;
    procedure SetItem(Index: Integer; const Value: TclUpdateInfoItem);
    function Add: TclUpdateInfoItem;
    function GetHasDownloads: Boolean;
    function GetHasUpdates: Boolean;
    function GetLastVersion: string;
    procedure LoadResourceState(ANode: IXMLDomNode; AResourceState: TclResourceStateList);
    procedure SaveResourceState(ANode: IXMLDomNode; AResourceState: TclResourceStateList);
  public
    constructor Create;
    function GetFirst(AStatus: TclUpdateStatus): Integer;
    procedure LoadFromXml(const AFileName: string);
    procedure SaveToXml(const AFileName: string);
    property Items[Index: Integer]: TclUpdateInfoItem read GetItem write SetItem; default;
    property HasDownloads: Boolean read GetHasDownloads;
    property HasUpdates: Boolean read GetHasUpdates;
    property LastVersion: string read GetLastVersion;
  end;

  TclWebUpdate = class;

  TclHasUpdateEvent = procedure (Sender: TObject; const AUpdateItem: TclUpdateInfoItem;
    ActualInfo: TclUpdateInfoList; var CanUpdate, Handled: Boolean) of object;
  TclDownloadEvent = procedure (Sender: TObject; const DownloadURL, DownloadFile: string) of object;
  TclRunUpdateEvent = procedure (Sender: TObject; AUpdateScript: TStrings; ANeedTerminate: Boolean;
    var CanRun: Boolean; var Result: TclRunUpdateResult; var AErrors: string) of object;
  TclTerminatingEvent = procedure (Sender: TObject; var CanTerminate: Boolean) of object;
  TclDownloadProgressEvent = procedure (Sender: TObject; UpdateNo, Downloaded, Total: Integer) of object;
  TclShowInfoEvent = procedure (Sender: TclWebUpdate; var CanUpdate: Boolean) of object;
  TclGetUpdateInfoEvent = procedure (Sender: TObject; ActualInfo: TclUpdateInfoList;
    UpdateInfo: TclUpdateInfoList) of object;
  TclWebUpdateErrorEvent = procedure (Sender: TObject; UpdateNo: Integer;
    const Error: string; ErrorCode: Integer) of object;

  TclWebUpdate = class(TComponent)
  private
    FIsBusy: Boolean;
    FDownloader: TclDownloader;
    FIsDownloading: Boolean;
    FUpdateURL: string;
    FActualUpdateInfoFile: string;
    FVersionFormat: TclVersionFormat;
    FNeedShowInfo: Boolean;
    FActualInfo: TclUpdateInfoList;
    FUpdateInfo: TclUpdateInfoList;
    FUpdateNo: Integer;
    FNeedTerminate: Boolean;
    FProductName: string;
    FProductURL: string;
    FAuthor: string;
    FEmail: string;
    FUpdateDir: string;
    FErrorWords: TStrings;
    FOnDownloadProgress: TclDownloadProgressEvent;
    FOnError: TclWebUpdateErrorEvent;
    FOnHasUpdate: TclHasUpdateEvent;
    FOnTerminating: TclTerminatingEvent;
    FOnRunUpdate: TclRunUpdateEvent;
    FOnAfterDownload: TclDownloadEvent;
    FOnBeforeDownload: TclDownloadEvent;
    FOnShowInfo: TclShowInfoEvent;
    FOnNoUpdatesFound: TNotifyEvent;
    FOnGetUpdateInfo: TclGetUpdateInfoEvent;
    FOnProcessCompleted: TNotifyEvent;
    FUserName: string;
    FPassword: string;
    
    procedure DoOnProcessCompleted(Sender: TObject);
    procedure DoOnError(Sender: TObject; const Error: string; ErrorCode: Integer);
    procedure DoOnDataItemProceed(Sender: TObject; ResourceInfo: TclResourceInfo;
      AStateItem: TclResourceStateItem; CurrentData: PChar; CurrentDataSize: Integer);
    function GetIsBusy: Boolean;

    function CheckUpdateVersion(const ANewVersion, ActualVersion: string): Boolean;
    function HasUpdate(AUpdateItem: TclUpdateInfoItem): Boolean;
    procedure CheckUpdateInfo;
    function ShowInfo(): Boolean;
    procedure GetUpdateInfo;
    procedure StoreActualInfo;

    procedure StartDownloading;
    procedure StartUpdating;
    function RunUpdate(AUpdateItem: TclUpdateInfoItem): Boolean;
    procedure Terminating;
    procedure SetUpdateDir(const Value: string);
    function PerformCmdFile(const AFileName: string): Integer;
    function GetLogError(ALogStrings: TStrings): string;
    procedure SetErrorWords(const Value: TStrings);
    procedure ReplaceScriptKeywords(AScript: TStrings);
    function GetBatchSize: Integer;
    function GetPort_: Integer;
    procedure SetBatchSize(const Value: Integer);
    procedure SetPort_(const Value: Integer);
    function GetPassiveFtpMode: Boolean;
    procedure SetPassiveFtpMode(const Value: Boolean);
  protected
    procedure DoGetUpdateInfo; dynamic;
    procedure DoHasUpdate(const AUpdateItem: TclUpdateInfoItem; ActualInfo: TclUpdateInfoList;
      var CanUpdate, Handled: Boolean); dynamic;
    procedure DoBeforeDownload(const DownloadURL, DownloadFile: string); dynamic;
    procedure DoAfterDownload(const DownloadURL, DownloadFile: string); dynamic;
    procedure DoShowInfo(var CanUpdate: Boolean); dynamic;
    procedure DoRunUpdate(AUpdateScript: TStrings; ANeedTerminate: Boolean;
      var CanRun: Boolean; var Result: TclRunUpdateResult; var AErrors: string); dynamic;
    procedure DoTerminating(var CanTerminate: Boolean); dynamic;
    procedure DoDownloadProgress(UpdateNo, Downloaded, Total: Integer); dynamic;
    procedure DoError(UpdateNo: Integer; const Error: string; ErrorCode: Integer); dynamic;
    procedure DoNoUpdatesFound;
    procedure DoProcessCompleted;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    property IsBusy: Boolean read GetIsBusy;
    property NeedTerminate: Boolean read FNeedTerminate;
    property ActualInfo: TclUpdateInfoList read FActualInfo;
    property UpdateInfo: TclUpdateInfoList read FUpdateInfo;
  published
    property ProductName: string read FProductName write FProductName;
    property Author: string read FAuthor write FAuthor;
    property ProductURL: string read FProductURL write FProductURL;
    property Email: string read FEmail write FEmail;
    property UpdateURL: string read FUpdateURL write FUpdateURL;
    property UpdateDir: string read FUpdateDir write SetUpdateDir;
    property ActualUpdateInfoFile: string read FActualUpdateInfoFile write FActualUpdateInfoFile;
    property VersionFormat: TclVersionFormat read FVersionFormat write FVersionFormat default vfStandard;
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
    property Port: Integer read GetPort_ write SetPort_ default 0;
    property PassiveFtpMode: Boolean read GetPassiveFtpMode write SetPassiveFtpMode default False;
    property BatchSize: Integer read GetBatchSize write SetBatchSize default cBatchSize;
    property NeedShowInfo: Boolean read FNeedShowInfo write FNeedShowInfo default True;
    property ErrorWords: TStrings read FErrorWords write SetErrorWords;
    property OnGetUpdateInfo: TclGetUpdateInfoEvent read FOnGetUpdateInfo write FOnGetUpdateInfo;
    property OnShowInfo: TclShowInfoEvent read FOnShowInfo write FOnShowInfo;
    property OnHasUpdate: TclHasUpdateEvent read FOnHasUpdate write FOnHasUpdate;
    property OnBeforeDownload: TclDownloadEvent read FOnBeforeDownload write FOnBeforeDownload;
    property OnAfterDownload: TclDownloadEvent read FOnAfterDownload write FOnAfterDownload;
    property OnRunUpdate: TclRunUpdateEvent read FOnRunUpdate write FOnRunUpdate;
    property OnTerminating: TclTerminatingEvent read FOnTerminating write FOnTerminating;
    property OnDownloadProgress: TclDownloadProgressEvent read FOnDownloadProgress write FOnDownloadProgress;
    property OnError: TclWebUpdateErrorEvent read FOnError write FOnError;
    property OnNoUpdatesFound: TNotifyEvent read FOnNoUpdatesFound write FOnNoUpdatesFound;
    property OnProcessCompleted: TNotifyEvent read FOnProcessCompleted write FOnProcessCompleted;
  end;

const
  cAppDir = '$(app)';
  cUpdateDir = '$(update)';
  
implementation

uses
  SysUtils, Math, Forms, Windows, clUpdateInfoForm, clSingleDC, clWinInet, clUriUtils;

const
  cUpdateStatusNames: array[TclUpdateStatus] of string = ('download', 'ready', 'success', 'failed');
  cBooleanNames: array[Boolean] of string = ('no', 'yes');

{ TclWebUpdate }

constructor TclWebUpdate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FErrorWords := TStringList.Create();
  FErrorWords.Add('fatal');
  FErrorWords.Add('failed');
  FErrorWords.Add('error');
  FActualInfo := TclUpdateInfoList.Create();
  FUpdateInfo := TclUpdateInfoList.Create();
  FDownloader := TclDownloader.Create(nil);
  FDownloader.OnProcessCompleted := DoOnProcessCompleted;
  FDownloader.OnError := DoOnError;
  FDownloader.OnDataItemProceed := DoOnDataItemProceed;
  FActualUpdateInfoFile := 'lastupdate.xml';
  FVersionFormat := vfStandard;
  FNeedShowInfo := True;
  FUpdateDir := '.\';
end;

destructor TclWebUpdate.Destroy;
begin
  Stop();
  while IsBusy do
  begin
    Application.ProcessMessages();
  end;
  FDownloader.Free();
  FUpdateInfo.Free();
  FActualInfo.Free();
  FErrorWords.Free();
  inherited Destroy();
end;

procedure TclWebUpdate.StartUpdating;
var
  i: Integer;
begin
  for i := 0 to ActualInfo.Count - 1 do
  begin
    if FIsBusy and (ActualInfo[i].Status = usReady) then
    begin
      if not RunUpdate(ActualInfo[i]) then
      begin
        Break;
      end;
    end;
  end;
  FIsBusy := False;
  DoProcessCompleted();
  if NeedTerminate then
  begin
    Terminating();
  end;
end;

procedure TclWebUpdate.Terminating;
var
  CanTerminate: Boolean;
begin
  CanTerminate := True;
  DoTerminating(CanTerminate);
  if CanTerminate then
  begin
    Application.Terminate();
  end;
end;

procedure TclWebUpdate.DoOnProcessCompleted(Sender: TObject);
var
  Success: Boolean;
begin
  Success := (FDownloader.ResourceState.LastStatus = psSuccess);

  if FIsDownloading then
  begin
    if Success then
    begin
      ActualInfo[FUpdateNo].UpdateStatus(usReady);
    end else
    begin
      ActualInfo[FUpdateNo].ResourceState.Assign(FDownloader.ResourceState);
    end;
    StoreActualInfo();
    if Success then
    begin
      DoAfterDownload(FDownloader.URL, FDownloader.LocalFile);

      repeat
        Inc(FUpdateNo);
      until ((FUpdateNo >= ActualInfo.Count) or (ActualInfo[FUpdateNo].Status = usDownload));
      
      if (FUpdateNo < ActualInfo.Count) then
      begin
        StartDownloading();
      end else
      begin
        FIsDownloading := False;
        StartUpdating();
      end;
    end else
    begin
      FIsBusy := False;
      DoProcessCompleted();
    end;
  end else
  if Success then
  begin
    CheckUpdateInfo();
  end else
  begin
    FIsBusy := False;
    DoProcessCompleted();
  end;
end;

procedure TclWebUpdate.CheckUpdateInfo;
var
  i: integer;
begin
  GetUpdateInfo();

  for i := 0 to UpdateInfo.Count - 1 do
  begin
    if HasUpdate(UpdateInfo[i]) then
    begin
      ActualInfo.Add().Assign(UpdateInfo[i]);
    end;
  end;

  if not FIsBusy then Exit;
  if ActualInfo.HasDownloads then
  begin
    if ShowInfo() then
    begin
      FUpdateNo := ActualInfo.GetFirst(usDownload);
      FIsDownloading := True;
      StoreActualInfo();
      StartDownloading();
    end else
    begin
      FIsBusy := False;
      DoProcessCompleted();
    end;
  end else
  if ActualInfo.HasUpdates then
  begin
    StartUpdating();
  end else
  begin
    DoNoUpdatesFound();
    FIsBusy := False;
    DoProcessCompleted();
  end;
end;

procedure TclWebUpdate.Start;
begin
  if FIsBusy then Exit;
  FUpdateNo := -1;
  FIsBusy := True;
  FIsDownloading := False;
  FNeedTerminate := False;
  FDownloader.LocalFolder := UpdateDir;
  FDownloader.URL := UpdateURL;
  FDownloader.UserName := UserName;
  FDownloader.Password := Password;
  FDownloader.Start();
end;

function TclWebUpdate.CheckUpdateVersion(const ANewVersion, ActualVersion: string): Boolean;
  function MakeCompleteNumber(S: string): Integer;
  var
    i, Cnt, Len, OldPos: Integer;
  begin
    S := Trim(S);
    Result := 0;
    Len := Length(S);
    Cnt := 0;
    OldPos := Len + 1;
    for i := Len downto 1 do
    begin
      if (S[i] = '.') then
      begin
        Result := Result + StrToIntDef('0' + system.Copy(S, i + 1, OldPos - i - 1), 0) * Round(Power(1000, Cnt));
        Inc(Cnt);
        OldPos := i;
      end else
      if (i = 1) then
      begin
        Result := Result + StrToIntDef('0' + system.Copy(S, i, OldPos - i), 0) * Round(Power(1000, Cnt));
      end;
    end;
  end;
begin
  if (VersionFormat = vfStandard) then
  begin
    Result := (MakeCompleteNumber(ANewVersion) > MakeCompleteNumber(ActualVersion));
  end else
  begin
    Result := StrToIntDef(ANewVersion, 0) > StrToIntDef(ActualVersion, 0);
  end;
end;

function TclWebUpdate.HasUpdate(AUpdateItem: TclUpdateInfoItem): Boolean;
var
  handled: Boolean;
begin
  handled := False;
  Result := True;

  DoHasUpdate(AUpdateItem, ActualInfo, Result, handled);
  if not handled then
  begin
    if (ActualInfo.LastVersion <> '') then
    begin
      Result := CheckUpdateVersion(AUpdateItem.Version, ActualInfo.LastVersion);
    end;
  end;
end;

procedure TclWebUpdate.GetUpdateInfo;
var
  i: Integer;
begin
  UpdateInfo.LoadFromXml(FDownloader.LocalFile);

  for i := 0 to UpdateInfo.Count - 1 do
  begin
    UpdateInfo[i].URL := GetFullUrlByRoot(UpdateInfo[i].URL, UpdateURL);
  end;
  
  ActualInfo.LoadFromXml(ActualUpdateInfoFile);
  DoGetUpdateInfo();
end;

function TclWebUpdate.ShowInfo(): Boolean;
begin
  Result := True;
  DoShowInfo(Result);
  if NeedShowInfo then
  begin
    Result := TfrmUpdateInfo.ShowInfo(Self);
  end;
end;

procedure TclWebUpdate.StartDownloading;
begin
  FDownloader.URL := ActualInfo[FUpdateNo].URL;
  if (FDownloader.UserName = '') then
  begin
    FDownloader.UserName := UserName;
  end;
  if (FDownloader.Password = '') then
  begin
    FDownloader.Password := Password;
  end;
  ActualInfo[FUpdateNo].FLocalFile := FDownloader.LocalFile;
  DoBeforeDownload(FDownloader.URL, FDownloader.LocalFile);
  FDownloader.ResourceState.Assign(ActualInfo[FUpdateNo].ResourceState);
  FDownloader.Start();
end;

function TclWebUpdate.PerformCmdFile(const AFileName: string): Integer;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Res: DWORD;
begin
  ZeroMemory(@StartupInfo, SizeOf(TStartupInfo));
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.dwFlags := StartupInfo.dwFlags or STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  ZeroMemory(@ProcessInfo, SizeOf(TProcessInformation));

  if not CreateProcess(nil, PChar(AFileName), nil, nil, False,
    CREATE_NEW_CONSOLE or CREATE_NO_WINDOW, nil, nil, StartupInfo, ProcessInfo) then
  begin
    raise Exception.CreateFmt('Can not run cmd file, error %d', [GetLastError()]);
  end;

  CloseHandle(ProcessInfo.hThread);
  WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
  GetExitCodeProcess(ProcessInfo.hProcess, Res);
  Result := Res;
  CloseHandle(ProcessInfo.hProcess);
end;

function TclWebUpdate.GetLogError(ALogStrings: TStrings): string;
  function CheckWordExists(const Buffer, NeededString: String): Boolean;
  var
    ind: Integer;
  begin
    ind := system.Pos(LowerCase(NeededString), LowerCase(Buffer));
    Result := (ind > 0);
    if not Result then Exit;

    if (ind > 1) and not (Buffer[ind - 1] in [#32, #9, #10]) then
    begin
      Result := False;
    end;
    if not Result then Exit;

    ind := ind + Length(NeededString) - 1;
    if (ind < Length(Buffer)) and not (Buffer[ind + 1] in [#32, #9, #13, ',', '.']) then
    begin
      Result := False;
    end;
  end;

var
  i, j: Integer;
begin
  for i := 0 to ALogStrings.Count - 1 do
  begin
    Result := ALogStrings[i];
    for j := 0 to ErrorWords.Count - 1 do
    begin
      if CheckWordExists(LowerCase(Result), LowerCase(ErrorWords[j])) then Exit;
    end;
  end;
  Result := '';
end;

procedure TclWebUpdate.ReplaceScriptKeywords(AScript: TStrings);
var
  path: string;
begin
  path := ExtractFilePath(ParamStr(0));
  if (path <> '') and (path[Length(path)] = '\') then
  begin
    Delete(path, Length(path), 1);
  end;
  AScript.Text := StringReplace(AScript.Text, cAppDir, path, [rfReplaceAll, rfIgnoreCase]);
  AScript.Text := StringReplace(AScript.Text, cUpdateDir, UpdateDir, [rfReplaceAll, rfIgnoreCase]);
end;

function TclWebUpdate.RunUpdate(AUpdateItem: TclUpdateInfoItem): Boolean;
const
  cRunName = 'B1BD76091FF7';

var
  tempCmdName, tempLogName, error: string;
  canRun: Boolean;
  logStrings, script: TStrings;
  runResult: TclRunUpdateResult; 
begin
  if (AUpdateItem.NeedTerminate) then
  begin
    FNeedTerminate := True;
  end;
  canRun := True;
  error := '';
  script := TStringList.Create();
  try
    script.Assign(AUpdateItem.UpdateScript);
    ReplaceScriptKeywords(script);
    
    runResult := urSuccess;
    DoRunUpdate(script, AUpdateItem.NeedTerminate, canRun, runResult, error);

    if canRun and (runResult = urSuccess) and (script.Count > 0) then
    begin
      tempCmdName := GetFullFileName(cRunName + '.cmd', ExtractFilePath(ParamStr(0)));
      tempLogName := GetFullFileName(cRunName + '.log', ExtractFilePath(ParamStr(0)));
      logStrings := TStringList.Create();
      try
        script.SaveToFile(tempCmdName);
        PerformCmdFile('"' + tempCmdName + '" > "' + tempLogName + '"');
        logStrings.LoadFromFile(tempLogName);
        error := GetLogError(logStrings);

        if (error <> '') then
        begin
          runResult := urError;
        end;
      finally
        logStrings.Free();
        DeleteFile(PChar(tempLogName));
        DeleteFile(PChar(tempCmdName));
      end;
    end;
  finally
    script.Free();
  end;

  case runResult of
    urSuccess:
      begin
        AUpdateItem.UpdateStatus(usSuccess);
      end;
    urError:
      begin
        AUpdateItem.UpdateStatus(usFailed);
        DoError(AUpdateItem.Index, Format('The updating of %s file was returned with errors (%s). ',
          [ExtractFileName(AUpdateItem.LocalFile), error]), -1);
      end;
  end;
  Result := (runResult <> urError);

  StoreActualInfo();
end;

procedure TclWebUpdate.StoreActualInfo;
begin
  ActualInfo.SaveToXml(ActualUpdateInfoFile);
end;

procedure TclWebUpdate.Stop;
begin
  FIsBusy := False;
  FDownloader.Stop();
end;

procedure TclWebUpdate.DoOnDataItemProceed(Sender: TObject; ResourceInfo: TclResourceInfo;
  AStateItem: TclResourceStateItem; CurrentData: PChar; CurrentDataSize: Integer);
begin
  if FIsDownloading then
  begin
    DoDownloadProgress(FUpdateNo, AStateItem.ResourceState.BytesProceed, ResourceInfo.Size);
  end;
end;

procedure TclWebUpdate.DoOnError(Sender: TObject; const Error: string; ErrorCode: Integer);
begin
  DoError(FUpdateNo, Error, ErrorCode);
end;

procedure TclWebUpdate.DoAfterDownload(const DownloadURL, DownloadFile: string);
begin
  if Assigned(OnAfterDownload) then
  begin
    OnAfterDownload(Self, DownloadURL, DownloadFile);
  end;
end;

procedure TclWebUpdate.DoBeforeDownload(const DownloadURL, DownloadFile: string);
begin
  if Assigned(OnBeforeDownload) then
  begin
    OnBeforeDownload(Self, DownloadURL, DownloadFile);
  end;
end;

procedure TclWebUpdate.DoDownloadProgress(UpdateNo, Downloaded, Total: Integer);
begin
  if Assigned(OnDownloadProgress) then
  begin
    OnDownloadProgress(Self, UpdateNo, Downloaded, Total);
  end;
end;

procedure TclWebUpdate.DoError(UpdateNo: Integer; const Error: string; ErrorCode: Integer);
begin
  if Assigned(OnError) then
  begin
    OnError(Self, UpdateNo, Error, ErrorCode);
  end;
end;

procedure TclWebUpdate.DoHasUpdate(const AUpdateItem: TclUpdateInfoItem; ActualInfo: TclUpdateInfoList;
  var CanUpdate, Handled: Boolean);
begin
  if Assigned(OnHasUpdate) then
  begin
    OnHasUpdate(Self, AUpdateItem, ActualInfo, CanUpdate, Handled);
  end;
end;

procedure TclWebUpdate.DoRunUpdate(AUpdateScript: TStrings; ANeedTerminate: Boolean;
  var CanRun: Boolean; var Result: TclRunUpdateResult; var AErrors: string);
begin
  if Assigned(OnRunUpdate) then
  begin
    OnRunUpdate(Self, AUpdateScript, ANeedTerminate, CanRun, Result, AErrors);
  end;
end;

procedure TclWebUpdate.DoShowInfo(var CanUpdate: Boolean);
begin
  if Assigned(OnShowInfo) then
  begin
    OnShowInfo(Self, CanUpdate);
  end;
end;

procedure TclWebUpdate.DoTerminating(var CanTerminate: Boolean);
begin
  if Assigned(OnTerminating) then
  begin
    OnTerminating(Self, CanTerminate);
  end;
end;

procedure TclWebUpdate.DoNoUpdatesFound;
begin
  if Assigned(OnNoUpdatesFound) then
  begin
    OnNoUpdatesFound(Self);
  end;
end;

procedure TclWebUpdate.DoGetUpdateInfo;
begin
  if Assigned(OnGetUpdateInfo) then
  begin
    OnGetUpdateInfo(Self, ActualInfo, UpdateInfo);
  end;
end;

function TclWebUpdate.GetIsBusy: Boolean;
begin
  Result := FDownloader.IsBusy or FIsBusy;
end;

procedure TclWebUpdate.SetUpdateDir(const Value: string);
begin
  FUpdateDir := Value;
  if not (csLoading in ComponentState) then
  begin
    ActualUpdateInfoFile := GetFullFileName(ActualUpdateInfoFile, FUpdateDir);
  end;
end;

procedure TclWebUpdate.SetErrorWords(const Value: TStrings);
begin
  FErrorWords.Assign(Value);
end;

function TclWebUpdate.GetBatchSize: Integer;
begin
  Result := FDownloader.BatchSize;
end;

procedure TclWebUpdate.SetBatchSize(const Value: Integer);
begin
  FDownloader.BatchSize := Value;
end;

function TclWebUpdate.GetPort_: Integer;
begin
  Result := FDownloader.Port;
end;

procedure TclWebUpdate.SetPort_(const Value: Integer);
begin
  FDownloader.Port := Value;
end;

procedure TclWebUpdate.DoProcessCompleted;
begin
  if Assigned(OnProcessCompleted) then
  begin
    OnProcessCompleted(Self);
  end;
end;

function TclWebUpdate.GetPassiveFtpMode: Boolean;
begin
  Result := FDownloader.PassiveFTPMode;
end;

procedure TclWebUpdate.SetPassiveFtpMode(const Value: Boolean);
begin
  FDownloader.PassiveFTPMode := Value;
end;

{ TclUpdateInfoList }

function TclUpdateInfoList.Add: TclUpdateInfoItem;
begin
  Result := TclUpdateInfoItem(inherited Add());
end;

constructor TclUpdateInfoList.Create;
begin
  inherited Create(TclUpdateInfoItem);
end;

function TclUpdateInfoList.GetLastVersion: string;
begin
  if (Count > 0) then
  begin
    Result := Items[Count - 1].Version;
  end else
  begin
    Result := '';
  end;
end;

function TclUpdateInfoList.GetFirst(AStatus: TclUpdateStatus): Integer;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if (Items[i].Status = AStatus) then
    begin
      Result := i;
      Exit;
    end;
  end;
  Result := -1;
end;

function TclUpdateInfoList.GetHasDownloads: Boolean;
var
  i: Integer;
begin
  for i := Count - 1 downto 0 do
  begin
    Result := (Items[i].Status = usDownload);
    if Result then Exit;
  end;
  Result := False;
end;

function TclUpdateInfoList.GetHasUpdates: Boolean;
var
  i: Integer;
begin
  for i := Count - 1 downto 0 do
  begin
    Result := (Items[i].Status = usReady);
    if Result then Exit;
  end;
  Result := False;
end;

function TclUpdateInfoList.GetItem(Index: Integer): TclUpdateInfoItem;
begin
  Result := TclUpdateInfoItem(inherited GetItem(Index));
end;

procedure TclUpdateInfoList.LoadFromXml(const AFileName: string);
var
  i, ind: Integer;
  Item: TclUpdateInfoItem;
  Dom: IXMLDomDocument;
  NodeList: IXMLDOMNodeList;
  node: IXMLDomNode;
begin
  Dom := CoDOMDocument.Create();
  Dom.load(AFileName);

  Clear();
  NodeList := Dom.selectNodes('updateinfo/update');
  for i := 0 to NodeList.length - 1 do
  begin
    Item := Add();
    Item.FURL := GetAttributeValue(NodeList.item[i], 'url');
    Item.FLocalFile := GetAttributeValue(NodeList.item[i], 'localfile');
    Item.FSize := GetAttributeValue(NodeList.item[i], 'size');
    Item.FVersion := GetAttributeValue(NodeList.item[i], 'version');
    Item.FUpdateDate := GetAttributeValue(NodeList.item[i], 'updatedate');
    XMLToStrings(Item.UpdateScript, NodeList.item[i].selectSingleNode('script'));

    ind := IndexOfStrArray(GetAttributeValue(NodeList.item[i], 'status'), cUpdateStatusNames);
    if (ind > -1) then
    begin
      Item.FStatus := TclUpdateStatus(ind);
    end;

    ind := IndexOfStrArray(GetAttributeValue(NodeList.item[i], 'terminate'), cBooleanNames);
    if (ind > -1) then
    begin
      Item.FNeedTerminate := Boolean(ind);
    end;

    node := NodeList.item[i].selectSingleNode('resourcestate');
    if (node <> nil) then
    begin
      LoadResourceState(node, Item.ResourceState);
    end;
  end;
end;

procedure TclUpdateInfoList.LoadResourceState(ANode: IXMLDomNode;
  AResourceState: TclResourceStateList);
var
  i: Integer;
  NodeList: IXMLDOMNodeList;
  Item: TclResourceStateItem;
begin
  AResourceState.ResourceSize := StrToIntDef(GetAttributeValue(ANode, 'resourcesize'), 0);
  NodeList := ANode.selectNodes('item');
  for i := 0 to NodeList.length - 1 do
  begin
    Item := AResourceState.Add();
    Item.ResourcePos := StrToIntDef(GetAttributeValue(NodeList.item[i], 'resourcepos'), 0);
    Item.BytesToProceed := StrToIntDef(GetAttributeValue(NodeList.item[i], 'bytestoproceed'), 0);
    Item.BytesProceed := StrToIntDef(GetAttributeValue(NodeList.item[i], 'bytesproceed'), 0);
  end;
end;

procedure TclUpdateInfoList.SaveResourceState(ANode: IXMLDomNode;
  AResourceState: TclResourceStateList);
var
  i: Integer;
  node: IXMLDomNode;
begin
  (ANode as IXMLDOMElement).setAttribute('resourcesize', AResourceState.ResourceSize);
  for i := 0 to AResourceState.Count - 1 do
  begin
    node := ANode.ownerDocument.createElement('item');
    ANode.appendChild(node);

    (node as IXMLDOMElement).setAttribute('resourcepos', AResourceState[i].ResourcePos);
    (node as IXMLDOMElement).setAttribute('bytestoproceed', AResourceState[i].BytesToProceed);
    (node as IXMLDOMElement).setAttribute('bytesproceed', AResourceState[i].BytesProceed);
  end;
end;

procedure TclUpdateInfoList.SaveToXml(const AFileName: string);
var
  i: Integer;
  Dom: IXMLDomDocument;
  UpdateInfoNode, Node, tempNode: IXMLDOMElement;
begin
  Dom := CoDOMDocument.Create();

  UpdateInfoNode := Dom.createElement('updateinfo');
  Dom.appendChild(UpdateInfoNode);

  for i := 0 to Count - 1 do
  begin
    Node := Dom.createElement('update');
    UpdateInfoNode.appendChild(Node);

    SetAttributeValue(Node, 'url', Items[i].URL);
    SetAttributeValue(Node, 'localfile', Items[i].LocalFile);
    SetAttributeValue(Node, 'size', Items[i].Size);
    SetAttributeValue(Node, 'version', Items[i].Version);
    SetAttributeValue(Node, 'updatedate', Items[i].UpdateDate);

    tempNode := Dom.createElement('script');
    Node.appendChild(tempNode);
    StringsToXML(Items[i].UpdateScript, tempNode);

    Node.setAttribute('status', cUpdateStatusNames[Items[i].Status]);
    Node.setAttribute('terminate', cBooleanNames[Items[i].NeedTerminate]);

    if (Items[i].ResourceState.Count > 0) then
    begin
      tempNode := Dom.createElement('resourcestate');
      Node.appendChild(tempNode);
      SaveResourceState(tempNode, Items[i].ResourceState);
    end;
  end;

  SaveXMLToFile(AFileName, Dom);
end;

procedure TclUpdateInfoList.SetItem(Index: Integer; const Value: TclUpdateInfoItem);
begin
  inherited SetItem(Index, Value);
end;

{ TclUpdateInfoItem }

procedure TclUpdateInfoItem.Assign(Source: TPersistent);
var
  src: TclUpdateInfoItem;
begin
  if (Source is TclUpdateInfoItem) then
  begin
    src := TclUpdateInfoItem(Source);
    FURL := src.URL;
    FVersion := src.Version;
    FSize := src.Size;
    FLocalFile := src.LocalFile;
    FUpdateDate := src.UpdateDate;
    FStatus := src.Status;
    FUpdateScript.Assign(src.UpdateScript);
    FNeedTerminate := src.NeedTerminate;
    FResourceState.Assign(src.ResourceState);
  end else
  begin
    inherited Assign(Source);
  end;
end;

constructor TclUpdateInfoItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FUpdateScript := TStringList.Create();
  FResourceState := TclResourceStateList.Create(TclResourceStateItem);
end;

destructor TclUpdateInfoItem.Destroy;
begin
  FResourceState.Free();
  FUpdateScript.Free();
  inherited Destroy();
end;

procedure TclUpdateInfoItem.UpdateStatus(ANewStatus: TclUpdateStatus);
begin
  FStatus := ANewStatus;
  FUpdateDate := DateTimeToStr(Date());
end;

initialization
  AddCDataNodeName('script');
  
finalization

end.
