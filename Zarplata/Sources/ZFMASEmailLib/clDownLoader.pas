{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clDownLoader;

interface

{$I clVer.inc}

uses
  Classes, clDCUtils, clUtils, clSingleDC, clMultiDC, clMultiDownLoader;

type
  TclOnSingleDataTextProceed = procedure (Sender: TObject; Text: TStrings) of object;

  TclCustomDownLoaderControl = class;

  TclSingleDownLoadItem = class(TclDownLoadItem)
  private
    function GetDownLoader: TclCustomDownLoaderControl;
  protected
    procedure DoDataTextProceed(Text: TStrings); override;
    function GetCorrectResourceTime: Boolean; override;
    function GetPreviewCharCount: Integer; override;
    function GetLocalFolder: string; override;
    function GetControl: TclCustomInternetControl; override;
  end;

  TclCustomDownLoaderControl = class(TclSingleInternetControl)
  private
    FLocalFolder: string;
    FOnDataTextProceed: TclOnSingleDataTextProceed;
    FCorrectResourceTime: Boolean;
    FPreviewCharCount: Integer;
    procedure SetLocalFolder(const Value: string);
    function GetPreview: TStrings;
    procedure SetPreviewCharCount(const Value: Integer);
    function GetDownloadItem(): TclSingleDownLoadItem;
    function GetAllowCompression: Boolean;
    procedure SetAllowCompression(const Value: Boolean);
  protected
    function GetInternetItemClass(): TclInternetItemClass; override;
    procedure DoDataTextProceed(Text: TStrings); dynamic;
    property LocalFolder: string read FLocalFolder write SetLocalFolder;
    property PreviewCharCount: Integer read FPreviewCharCount write SetPreviewCharCount default cPreviewCharCount;
    property CorrectResourceTime: Boolean read FCorrectResourceTime write FCorrectResourceTime default True;
    property AllowCompression: Boolean read GetAllowCompression write SetAllowCompression default True;
    property OnDataTextProceed: TclOnSingleDataTextProceed read FOnDataTextProceed write FOnDataTextProceed;
  public
    constructor Create(AOwner: TComponent); override;
    property Preview: TStrings read GetPreview;
  end;

  TclDownLoader = class(TclCustomDownLoaderControl)
  published
    property Connection;
    property ThreadCount default cDefaultThreadCount;
    property KeepConnection;
    property URL;
    property LocalFile;
    property UserName;
    property Password;
    property Port;
    property Priority;
    property CertificateFlags;
    property UseInternetErrorDialog;
    property LocalFolder;
    property TryCount;
    property TimeOut;
    property ReconnectAfter;
    property BatchSize;
    property PreviewCharCount;
    property DefaultChar;
    property CorrectResourceTime;
    property MinResourceSize;
    property MaxResourceSize;
    property HttpProxySettings;
    property FtpProxySettings;
    property ProxyBypass;
    property InternetAgent;
    property PassiveFTPMode;
    property AllowCompression;
    property UseHttpRequest;
    property HttpRequest;
    property DoNotGetResourceInfo;
    property OnGetResourceInfo;
    property OnStatusChanged;
    property OnDataItemProceed;
    property OnDataTextProceed;
    property OnError;
    property OnUrlParsing;
    property OnChanged;
    property OnIsBusyChanged;
    property OnGetCertificate;
    property OnProcessCompleted;
  end;

implementation

{ TclCustomDownLoaderControl }

constructor TclCustomDownLoaderControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPreviewCharCount := cPreviewCharCount;
  FCorrectResourceTime := True;
end;

procedure TclCustomDownLoaderControl.DoDataTextProceed(Text: TStrings);
begin
  if Assigned(FOnDataTextProceed) then
  begin
    FOnDataTextProceed(Self, Text);
  end;
end;

function TclCustomDownLoaderControl.GetAllowCompression: Boolean;
begin
  Result := GetDownloadItem().AllowCompression;
end;

function TclCustomDownLoaderControl.GetDownloadItem(): TclSingleDownLoadItem;
begin
  Result := (GetInternetItem() as TclSingleDownLoadItem);
end;

function TclCustomDownLoaderControl.GetInternetItemClass(): TclInternetItemClass;
begin
  Result := TclSingleDownLoadItem;
end;

function TclCustomDownLoaderControl.GetPreview(): TStrings;
begin
  Result := GetDownloadItem().Preview;
end;

procedure TclCustomDownLoaderControl.SetAllowCompression(const Value: Boolean);
begin
  GetDownloadItem().AllowCompression := Value;
end;

procedure TclCustomDownLoaderControl.SetLocalFolder(const Value: string);
begin
  if (FLocalFolder = Value) then Exit;
  FLocalFolder := Value;
  if (csLoading in ComponentState) then Exit;
  LocalFile := GetFullFileName(LocalFile, FLocalFolder);
  Changed(GetInternetItem());
end;

procedure TclCustomDownLoaderControl.SetPreviewCharCount(const Value: Integer);
begin
  if (FPreviewCharCount <> Value) and (Value > - 1) then
  begin
    FPreviewCharCount := Value;
  end;
end;

{ TclSingleDownLoadItem }

procedure TclSingleDownLoadItem.DoDataTextProceed(Text: TStrings);
begin
  GetDownLoader().DoDataTextProceed(Text);
end;

type
  TCollectionAccess = class(TCollection);

function TclSingleDownLoadItem.GetControl: TclCustomInternetControl;
begin                                                 
  Result := (TCollectionAccess(Collection).GetOwner() as TclCustomInternetControl);
end;

function TclSingleDownLoadItem.GetCorrectResourceTime: Boolean;
begin
  Result := GetDownLoader().CorrectResourceTime;
end;

function TclSingleDownLoadItem.GetDownLoader: TclCustomDownLoaderControl;
begin
  Result := (Control as TclCustomDownLoaderControl);
end;

function TclSingleDownLoadItem.GetLocalFolder: string;
begin
  Result := GetDownloader().LocalFolder;
end;

function TclSingleDownLoadItem.GetPreviewCharCount: Integer;
begin
  Result := GetDownloader().PreviewCharCount;
end;

end.
