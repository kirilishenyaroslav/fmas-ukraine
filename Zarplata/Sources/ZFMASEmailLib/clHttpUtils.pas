{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clHttpUtils;

interface

{$I clVer.inc}

uses
  Classes;

const
  cDefaultHttpPort = 80;
  cDefaultHttpProxyPort = 8080;

type  
  TclAuthenticationType = (atBasic, atAutoDetect);

  TclHttpVersion = (hvHttp1_0, hvHttp1_1);

  TclHttpProxySettings = class(TPersistent)
  protected
    FAuthenticationType: TclAuthenticationType;
    FUserName: string;
    FPassword: string;
    FServer: string;
    FPort: Integer;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    procedure Clear;
  published
    property  AuthenticationType: TclAuthenticationType read FAuthenticationType
      write FAuthenticationType default atAutoDetect;
    property  UserName: string read FUserName write FUserName;
    property  Password: string read FPassword write FPassword;
    property  Server: string read FServer write FServer;
    property  Port: Integer read FPort write FPort default cDefaultHttpProxyPort;
  end;

resourcestring
  cInternetAgent = 'Mozilla/4.0 (compatible; Clever Internet Suite 6.2)';

implementation

{ TclHttpProxySettings }

procedure TclHttpProxySettings.Assign(Source: TPersistent);
var
  Src: TclHttpProxySettings;
begin
  if (Source is TclHttpProxySettings) then
  begin
    Src := (Source as TclHttpProxySettings);
    AuthenticationType  := Src.AuthenticationType;
    UserName := Src.UserName;
    Password := Src.Password;
    Server := Src.Server;
    Port := Src.Port;
  end else
  begin
    inherited Assign(Source);
  end;
end;

procedure TclHttpProxySettings.Clear;
begin
  FAuthenticationType := atAutoDetect;
  FPort := cDefaultHttpProxyPort;
  FUserName := '';
  FPassword := '';
  FServer := '';
end;

constructor TclHttpProxySettings.Create;
begin
  inherited Create;
  Clear();
end;

end.
