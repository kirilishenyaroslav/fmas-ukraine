{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clInetSuiteReg;

interface

{$I clVer.inc}

uses
  Classes, {$IFDEF DELPHI6}DesignEditors, DesignIntf, {$ELSE} DsgnIntf, {$ENDIF}
  TypInfo, clDEditors, clDownLoader, clMultiDownLoader, clNewsChecker, clUploader,
  clMultiUploader, clProgressBar, clPop3, clSmtp, clConnection, clMailMessage,
  clHttpRequest, clHtmlParser, clEncoder, clImap4, clSMimeMessage, clFtp, clSoap,
  clFtpServer, clFtpFileHandler, clWebUpdate, clGZip, clCert, clNntp, clHttp,
  clPop3Server, clSmtpServer, clSmtpRelay, clImap4Server, clNntpServer, clDnsQuery,
  clSmtpFileHandler, clPop3FileHandler, clImap4FileHandler, clHttpMail, clWebDav;

type
  TclMessageBodyProperty = class(TPropertyEditor)
  public
    function GetValue: string; override;
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TclMessageBodyEditor = class(TclBaseEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TclHttpRequestEditor = class(TclBaseEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation

uses
  SysUtils, clRequestEdit, clBodyEdit, clDCUtils;

const
  cHttpRequestEditor = 'Edit HTTP Request...';
  cMessageBodyEditor = 'Edit Mail Message...';

procedure Register;
begin
  RegisterComponents('Clever Internet Suite', [
    TclCertificateStore, TclDnsQuery, TclDownLoader,
    TclEncoder, TclFtp, TclFtpFileHandler, TclFtpServer, TclGZip, TclHtmlParser,
    TclHttp, TclHttpMail, TclHttpRequest, TclImap4, TclImap4FileHandler,
    TclImap4Server, TclInternetConnection, TclMailMessage,TclMultiDownLoader,
    TclMultiUploader, TclNewsChecker, TclNntp, TclNntpServer,
    TclPop3, TclPop3FileHandler, TclPop3Server, TclProgressBar, TclSMimeMessage,
    TclSmtp, TclSmtpFileHandler, TclSmtpRelay, TclSmtpServer, TclSoapMessage,
    TclUploader, TclWebUpdate, TclWebDav
  ]);

  RegisterComponentEditor(TclCertificateStore, TclBaseEditor);
  RegisterComponentEditor(TclDnsQuery, TclBaseEditor);
  RegisterComponentEditor(TclDownLoader, TclBaseEditor);
  RegisterComponentEditor(TclEncoder, TclBaseEditor);
  RegisterComponentEditor(TclFtp, TclBaseEditor);
  RegisterComponentEditor(TclFtpFileHandler, TclBaseEditor);
  RegisterComponentEditor(TclFtpServer, TclBaseEditor);
  RegisterComponentEditor(TclGZip, TclBaseEditor);
  RegisterComponentEditor(TclHtmlParser, TclBaseEditor);
  RegisterComponentEditor(TclHttp, TclBaseEditor);
  RegisterComponentEditor(TclHttpMail, TclBaseEditor);
  RegisterComponentEditor(TclHttpRequest, TclHttpRequestEditor);
  RegisterComponentEditor(TclImap4, TclBaseEditor);
  RegisterComponentEditor(TclImap4FileHandler, TclBaseEditor);
  RegisterComponentEditor(TclImap4Server, TclBaseEditor);
  RegisterComponentEditor(TclInternetConnection, TclBaseEditor);
  RegisterComponentEditor(TclMailMessage, TclMessageBodyEditor);
  RegisterComponentEditor(TclMultiDownLoader, TclBaseEditor);
  RegisterComponentEditor(TclMultiUploader, TclBaseEditor);
  RegisterComponentEditor(TclNewsChecker, TclBaseEditor);
  RegisterComponentEditor(TclNntp, TclBaseEditor);
  RegisterComponentEditor(TclNntpServer, TclBaseEditor);
  RegisterComponentEditor(TclPop3, TclBaseEditor);
  RegisterComponentEditor(TclPop3FileHandler, TclBaseEditor);
  RegisterComponentEditor(TclPop3Server, TclBaseEditor);
  RegisterComponentEditor(TclProgressBar, TclBaseEditor);
  RegisterComponentEditor(TclSMimeMessage, TclMessageBodyEditor);
  RegisterComponentEditor(TclSmtp, TclBaseEditor);
  RegisterComponentEditor(TclSmtpFileHandler, TclBaseEditor);
  RegisterComponentEditor(TclSmtpRelay, TclBaseEditor);
  RegisterComponentEditor(TclSmtpServer, TclBaseEditor);
  RegisterComponentEditor(TclSoapMessage, TclHttpRequestEditor);
  RegisterComponentEditor(TclUploader, TclBaseEditor);
  RegisterComponentEditor(TclWebUpdate, TclBaseEditor);
  RegisterComponentEditor(TclWebDav, TclBaseEditor);

  RegisterPropertyEditor(TypeInfo(string), TclDownLoader, 'LocalFile', TclSaveFileProperty);
  RegisterPropertyEditor(TypeInfo(string), TclDownLoadItem, 'LocalFile', TclSaveFileProperty);
  RegisterPropertyEditor(TypeInfo(string), TclUploader, 'LocalFile', TclOpenFileProperty);
  RegisterPropertyEditor(TypeInfo(string), TclUploadItem, 'LocalFile', TclOpenFileProperty);
  RegisterPropertyEditor(TypeInfo(TclMessageBodies), TclMailMessage, 'Bodies', TclMessageBodyProperty);
end;

{ TclMessageBodyEditor }

procedure TclMessageBodyEditor.ExecuteVerb(Index: Integer);
begin
  inherited ExecuteVerb(Index);
  if ModifyMessageBodies(TclMailMessage(Component).Bodies) then
  begin
    Designer.Modified;
  end;
end;

function TclMessageBodyEditor.GetVerb(Index: Integer): string;
begin
  Result := inherited GetVerb(Index);
  if Index = GetVerbCount() - 1 then
  begin
    Result := cMessageBodyEditor;
  end;
end;

function TclMessageBodyEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount() + 1;
end;

{ TclMessageBodyProperty }

procedure TclMessageBodyProperty.Edit;
begin
  if ModifyMessageBodies(TclMailMessage(GetComponent(0)).Bodies) then Modified;
end;

function TclMessageBodyProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TclMessageBodyProperty.GetValue: string;
begin
  Result := Format('(%s)', [TclMessageBodies.ClassName]);
end;

{ TclHttpRequestEditor }

procedure TclHttpRequestEditor.ExecuteVerb(Index: Integer);
begin
  inherited ExecuteVerb(Index);
  if ModifyHttpRequest(TclHttpRequest(Component)) then
  begin
    Designer.Modified;
  end;
end;

function TclHttpRequestEditor.GetVerb(Index: Integer): string;
begin
  Result := inherited GetVerb(Index);
  if Index = GetVerbCount() - 1 then
  begin
    Result := cHttpRequestEditor;
  end;
end;

function TclHttpRequestEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount() + 1;
end;

end.
