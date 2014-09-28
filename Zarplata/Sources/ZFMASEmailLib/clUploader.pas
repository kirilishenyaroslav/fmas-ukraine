{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clUploader;

interface

{$I clVer.inc}

uses
  Classes, clMultiDC, clSingleDC, clDCUtils, clMultiUploader, clHttpRequest;

type
  TclSingleUploadItem = class(TclUploadItem)
  protected
    function GetForceRemoteDir: Boolean; override;
    function GetControl: TclCustomInternetControl; override;
  end;

  TclCustomUploaderControl = class(TclSingleInternetControl)
  private
    FForceRemoteDir: Boolean;
    function GetUploadItem(): TclSingleUploadItem;
    function GetHttpResponse: TStrings;
    function GetHttpResponseStream: TStream;
    function GetUseSimpleRequest: Boolean;
    procedure SetHttpResponseStream(const Value: TStream);
    procedure SetUseSimpleRequest(const Value: Boolean);
    function GetRequestMethod: string;
    procedure SetRequestMethod(const Value: string);
  protected
    function GetInternetItemClass(): TclInternetItemClass; override;
    property UseSimpleRequest: Boolean read GetUseSimpleRequest write SetUseSimpleRequest default False;
    property RequestMethod: string read GetRequestMethod write SetRequestMethod;
    property ForceRemoteDir: Boolean read FForceRemoteDir write FForceRemoteDir default False;
  public
    property HttpResponse: TStrings read GetHttpResponse;
    property HttpResponseStream: TStream read GetHttpResponseStream write SetHttpResponseStream;
  end;

  TclUploader = class(TclCustomUploaderControl)
  published
    property Connection;
    property KeepConnection;
    property URL;
    property LocalFile;
    property UserName;
    property Password;
    property Port;
    property ReconnectAfter;
    property TryCount;
    property TimeOut;
    property BatchSize;
    property Priority;
    property CertificateFlags;
    property UseInternetErrorDialog;
    property UseHttpRequest;
    property UseSimpleRequest;
    property RequestMethod;
    property MinResourceSize;
    property MaxResourceSize;
    property HttpProxySettings;
    property FtpProxySettings;
    property ProxyBypass;
    property InternetAgent;
    property PassiveFTPMode;
    property ForceRemoteDir;
    property HttpRequest;
    property DoNotGetResourceInfo;
    property OnGetResourceInfo;
    property OnStatusChanged;
    property OnDataItemProceed;
    property OnError;
    property OnUrlParsing;
    property OnChanged;
    property OnIsBusyChanged;
    property OnGetCertificate;
    property OnProcessCompleted;
  end;

implementation

{ TclSingleUploadItem }

type
  TCollectionAccess = class(TCollection);

function TclSingleUploadItem.GetControl: TclCustomInternetControl;
begin
  Result := (TCollectionAccess(Collection).GetOwner() as TclCustomInternetControl);
end;

function TclSingleUploadItem.GetForceRemoteDir: Boolean;
begin
  Result := (Control as TclCustomUploaderControl).ForceRemoteDir;
end;

{ TclCustomUploaderControl }

function TclCustomUploaderControl.GetInternetItemClass: TclInternetItemClass;
begin
  Result := TclSingleUploadItem;
end;

function TclCustomUploaderControl.GetHttpResponse: TStrings;
begin
  Result := GetUploadItem().HttpResponse;
end;

function TclCustomUploaderControl.GetHttpResponseStream: TStream;
begin
  Result := GetUploadItem().HttpResponseStream;
end;

function TclCustomUploaderControl.GetUploadItem(): TclSingleUploadItem;
begin
  Result := (GetInternetItem() as TclSingleUploadItem);
end;

function TclCustomUploaderControl.GetUseSimpleRequest: Boolean;
begin
  Result := GetUploadItem().UseSimpleRequest;
end;

procedure TclCustomUploaderControl.SetHttpResponseStream(const Value: TStream);
begin
  GetUploadItem().HttpResponseStream := Value;
end;

procedure TclCustomUploaderControl.SetUseSimpleRequest(const Value: Boolean);
begin
  GetUploadItem().UseSimpleRequest := Value;
end;

function TclCustomUploaderControl.GetRequestMethod: string;
begin
  Result := GetUploadItem().RequestMethod;
end;

procedure TclCustomUploaderControl.SetRequestMethod(const Value: string);
begin
  GetUploadItem().RequestMethod := Value;
end;

end.
