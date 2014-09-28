{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clTlsSocket;

interface

{$I clVer.inc}
{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

uses
  Windows, Classes, clSocket, clSspi, clCert;

type
  TclOnVerifyPeerEvent = procedure (Sender: TObject; ACertificate: TclCertificate;
    const AStatusText: string; AStatusCode: Integer; var AVerified: Boolean) of object;

  TclTlsNetworkStream = class(TclNetworkStream)
  private
    FReadData: TStream;
    FWriteData: TStream;
    FSSPIBuffer: TStream;
    FSSPI: TclTlsSspi;
    FSSPIResult: TclSspiReturnCode;
    FPacketSize: Integer;
    FNeedAuthenticate: Boolean;
    FWriteSize: Int64;
    FOnGetCertificate: TclOnGetCertificateEvent;
    FOnVerifyPeer: TclOnVerifyPeerEvent;
    FCertificateFlags: TclCertificateFlags;
    FTargetName: string;
    FTLSFlags: TclTlsFlags;
    FPeerVerified: Boolean;
    FRequireClientCertificate: Boolean;
    procedure Authenticate(ADestination: TStream);
    procedure AfterRead(ABuffer, ADestination: TStream);
    function WriteBuffer(ABuffer: TStream; ABufferSize: Int64): Boolean;
    procedure TlsUpdateProgress(ABytesProceed: Int64);
    procedure TlsStreamReady;
    function GetSSPI: TclTlsSspi;
    procedure FreeSSPI;
    procedure VerifyPeer;
    procedure SetCertificateFlags(const Value: TclCertificateFlags);
    procedure SetTLSFlags(const Value: TclTlsFlags);
  protected
    procedure UpdateProgress(ABytesProceed: Int64); override;
    procedure StreamReady; override;
    property SSPI: TclTlsSspi read GetSSPI;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(ASource: TclNetworkStream); override;
    function Connect(const AIP: string; APort: Integer): Boolean; override;
    procedure Accept; override;
    procedure Close(ANotifyPeer: Boolean); override;
    function Read(AData: TStream): Boolean; override;
    function Write(AData: TStream): Boolean; override;
    function GetBatchSize: Integer; override;
    procedure OpenClientSession; override;
    procedure OpenServerSession; override;
    property TargetName: string read FTargetName write FTargetName;
    property CertificateFlags: TclCertificateFlags read FCertificateFlags write SetCertificateFlags;
    property TLSFlags: TclTlsFlags read FTLSFlags write SetTLSFlags;
    property RequireClientCertificate: Boolean read FRequireClientCertificate write FRequireClientCertificate;
    property OnGetCertificate: TclOnGetCertificateEvent read FOnGetCertificate write FOnGetCertificate;
    property OnVerifyPeer: TclOnVerifyPeerEvent read FOnVerifyPeer write FOnVerifyPeer;
  end;

resourcestring
  cReAuthNeeded = 'The connection must be re-negotiated';
  
implementation

uses
  SysUtils, clSspiUtils{$IFDEF LOGGER}, clLogger{$ENDIF};

{ TclTlsNetworkStream }

procedure TclTlsNetworkStream.Accept;
begin
  ClearNextAction();
  inherited Accept();
  OpenServerSession();
end;

procedure TclTlsNetworkStream.Close(ANotifyPeer: Boolean);
begin
  ClearNextAction();

  FSSPIResult := rcOK;
  FSSPIBuffer.Size := 0;
  try
    FSSPIResult := SSPI.EndSession(FSSPIBuffer);
  except
    on EclSSPIError do ;
  end;

  try
    if ANotifyPeer and (FSSPIResult = rcCompleteNeeded) then
    begin
      if not WriteBuffer(nil, 0) then
      begin
        SetNextAction(saWrite);
      end;
    end;
  except
    on E: EclSocketError do
    begin
      if (E.ErrorCode <> 10053) then raise;
    end;
  end;
  FNeedAuthenticate := False;
  FSSPIResult := rcReAuthNeeded;
end;

constructor TclTlsNetworkStream.Create;
begin
  inherited Create();
  FReadData := TMemoryStream.Create();
  FWriteData := TMemoryStream.Create();
  FSSPIBuffer := TMemoryStream.Create();
  TLSFlags :=  [tfUseTLS];
end;

destructor TclTlsNetworkStream.Destroy;
begin
  FWriteData.Free();
  FReadData.Free();
  FSSPIBuffer.Free();
  FreeSSPI();
  inherited Destroy();
end;

procedure TclTlsNetworkStream.FreeSSPI;
begin
  FSSPI.Free();
  FSSPI := nil;
  FPeerVerified := False;
end;

function TclTlsNetworkStream.GetBatchSize: Integer;
begin
  if (FPacketSize = 0) and (FSSPIResult = rcOK) then
  begin
    try
      FPacketSize := Integer(SSPI.StreamSizes.cbHeader + SSPI.StreamSizes.cbTrailer);
    except
      on EclSSPIError do ;
    end;
  end;
  Result := inherited GetBatchSize() + FPacketSize;
end;

function TclTlsNetworkStream.Connect(const AIP: string; APort: Integer): Boolean;
begin
  ClearNextAction();
  Result := inherited Connect(AIP, APort);
  OpenClientSession();
end;

function TclTlsNetworkStream.Read(AData: TStream): Boolean;
var
  oldPos: Int64;
  stream: TMemoryStream;
begin
  {$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Read');{$ENDIF}
  oldPos := -1;
  if (AData <> nil) then
  begin
    oldPos := AData.Position;
  end;

  try
    ClearNextAction();
    Result := True;

    if (FReadData.Size > 0) and (AData <> nil) then
    begin
      {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Read: if (FSSPIResult = rcOK)');{$ENDIF}
      AData.CopyFrom(FReadData, 0);
      FReadData.Size := 0;
    end else
    begin
      {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Read: else of if (FSSPIResult = rcOK)');{$ENDIF}
      if (AData = nil) then
      begin
        {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Read: else of if (FSSPIResult = rcOK), (AData = nil)');{$ENDIF}
        AData := FReadData;
      end;

      stream := TMemoryStream.Create();
      try
        {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Read: before inherited Read, %d', nil, [stream.Size]);{$ENDIF}
        Result := inherited Read(stream);
        {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'Read: after inherited Read', stream, 0);{$ENDIF}
        if (stream.Size > 0) then
        begin
          stream.Position := 0;
          AfterRead(stream, AData);
        end;
      finally
        stream.Free();
      end;
    end;

    HasReadData := (FReadData.Size > 0);

    if (FSSPIResult = rcReAuthNeeded) then
    begin
      SetNextAction(saWrite);
    end else
    if not (FSSPIResult in [rcOK, rcError, rcClosingNeeded]) then
    begin
      SetNextAction(saRead);
    end;
  finally
    if (oldPos > -1) then
    begin
      TlsUpdateProgress(AData.Size - oldPos);
    end;
  end;

  {$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Read'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Read', E); raise; end; end;{$ENDIF}
end;

function TclTlsNetworkStream.Write(AData: TStream): Boolean;
begin
  {$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Write');{$ENDIF}
  ClearNextAction();
  Result := True;

  if FNeedAuthenticate then
  begin
    FNeedAuthenticate := False;
    Authenticate(nil);
  end else
  if (AData <> nil) then
  begin
    while Result and (AData.Position < AData.Size) do
    begin
      if (FWriteData.Size = 0) then
      begin
        FWriteSize := AData.Size - AData.Position;
        if (FWriteSize > Connection.BatchSize) then
        begin
          FWriteSize := Connection.BatchSize;
        end;

        Result := WriteBuffer(AData, FWriteSize);
        if Result then
        begin
          TlsUpdateProgress(FWriteSize);
          AData.Position := AData.Position + FWriteSize;
        end;
      end else
      begin
        Result := WriteBuffer(nil, 0);
        if Result then
        begin
          TlsUpdateProgress(FWriteSize);
          AData.Position := AData.Position + FWriteSize;
        end;
      end;
    end;
  end else
  begin
    Result := WriteBuffer(nil, 0);
    if not Result then
    begin
      SetNextAction(saWrite);
    end;
  end;

  if (FSSPIResult <> rcOK) then
  begin
    SetNextAction(saRead);
  end;
  {$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Write'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Write', E); raise; end; end;{$ENDIF}
end;

procedure TclTlsNetworkStream.Authenticate(ADestination: TStream);
var
  cert: TclCertificate;
  certHandled: Boolean;
begin
  {$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'Authenticate');{$ENDIF}
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'Authenticate, FSSPIBuffer.Position = %d, FSSPIBuffer.Size = %d', nil, [FSSPIBuffer.Position, FSSPIBuffer.Size]);
{$ENDIF}

  try
    FPacketSize := 0;
    FSSPIResult := SSPI.GenContext(FSSPIBuffer, nil, False);
    if (FSSPIResult = rcCredentialNeeded) then
    begin
      cert := nil;
      certHandled := False;
      if Assigned(OnGetCertificate) then
      begin
        OnGetCertificate(Self, cert, certHandled);
      end;

      FSSPIResult := SSPI.GenContext(FSSPIBuffer, cert, certHandled);
    end;

    if (FSSPIResult = rcCredentialNeeded) then
    begin
      raise EclSSPIError.Create(SSPIErrorQueryLocalCertificate, -1);
    end;

    if (FSSPIResult in [rcOK, rcEncodeNeeded]) then
    begin
      VerifyPeer();
    end;

{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'Authenticate, before case FSSPIResult of, FSSPIBuffer.Position = %d, FSSPIBuffer.Size = %d', nil, [FSSPIBuffer.Position, FSSPIBuffer.Size]);
  clPutLogMessage(Self, edInside, 'Authenticate, before case FSSPIResult of, FSSPIResult = %s', nil, [clSspiReturnCodes[FSSPIResult]]);
{$ENDIF}
    
    case FSSPIResult of
      rcAuthContinueNeeded:
        begin
          if not WriteBuffer(nil, 0) then
          begin
            SetNextAction(saWrite);
          end;
          FSSPIResult := rcAuthDataNeeded;
        end;
      rcEncodeNeeded:
        begin
          AfterRead(FSSPIBuffer, ADestination);
          FSSPIResult := rcOk;
        end;
      rcOK:
        begin
          if (SSPI is TclTlsServerSspi) then
          begin
            FSSPIResult := rcAuthContinueNeeded;
            if not WriteBuffer(nil, 0) then
            begin
              SetNextAction(saWrite);
            end;
            FSSPIResult := rcOk;
          end;
        end;
    end;
  finally
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'Authenticate, inside finally, FSSPIBuffer.Position = %d, FSSPIBuffer.Size = %d', nil, [FSSPIBuffer.Position, FSSPIBuffer.Size]);
{$ENDIF}
    if not (FSSPIResult in [rcOK, rcAuthContinueNeeded, rcAuthMoreDataNeeded]) then
    begin
      FSSPIBuffer.Size := 0;
    end;
  end;
  if (FSSPIResult = rcOK) then
  begin
    TlsStreamReady();
  end;
{$IFDEF LOGGER}
  clPutLogMessage(Self, edInside, 'Authenticate, before end, FSSPIBuffer.Position = %d, FSSPIBuffer.Size = %d', nil, [FSSPIBuffer.Position, FSSPIBuffer.Size]);
{$ENDIF}
  {$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'Authenticate'); except on E: Exception do begin clPutLogMessage(Self, edLeave, 'Authenticate', E); raise; end; end;{$ENDIF}
end;

procedure TclTlsNetworkStream.AfterRead(ABuffer, ADestination: TStream);
var
  oldPos: Int64;
begin
  {$IFDEF LOGGER}try clPutLogMessage(Self, edEnter, 'AfterRead, ABuffer.Position = %d, ABuffer.Size = %d, FSSPIResult = %s', nil, [ABuffer.Position, ABuffer.Size, clSspiReturnCodes[FSSPIResult]]);{$ENDIF}

  case FSSPIResult of
    rcOk,
    rcAuthDataNeeded:
      begin
        FSSPIBuffer.Size := 0;
        FSSPIBuffer.CopyFrom(ABuffer, ABuffer.Size);
        FSSPIBuffer.Position := 0;
        if (FSSPIResult = rcAuthDataNeeded) then
        begin
          Authenticate(ADestination);
          {$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'AfterRead, %d, Authenticate exit', nil, [FSSPIBuffer.Size]);{$ENDIF}
          Exit;
        end;
      end;
    rcAuthMoreDataNeeded,
    rcMoreDataNeeded:
      begin
        oldPos := FSSPIBuffer.Position;
        FSSPIBuffer.Position := FSSPIBuffer.Size;
        FSSPIBuffer.CopyFrom(ABuffer, ABuffer.Size);
        FSSPIBuffer.Position := oldPos;

{$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'AfterRead, oldPos = %d', nil, [oldPos]);{$ENDIF}
        
        if (FSSPIResult = rcAuthMoreDataNeeded) then
        begin
          Authenticate(ADestination);
          {$IFDEF LOGGER}clPutLogMessage(Self, edLeave, 'AfterRead, %d, Authenticate exit', nil, [FSSPIBuffer.Size]);{$ENDIF}
          Exit;
        end;
      end;
  end;

  Assert(ADestination <> nil);
  FSSPIResult := SSPI.Decrypt(FSSPIBuffer, ADestination, FSSPIBuffer);

  {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'AfterRead, FSSPI.Decrypt %s', nil, [clSspiReturnCodes[FSSPIResult]]);{$ENDIF}

  case FSSPIResult of
    rcOk: FSSPIBuffer.Size := 0;
    rcReAuthNeeded:
      begin
        FSSPIBuffer.Size := 0;
        FNeedAuthenticate := True;
      end;
    rcContinueAndMoreDataNeeded: FSSPIResult := rcMoreDataNeeded;
  end;

  {$IFDEF LOGGER}clPutLogMessage(Self, edInside, 'AfterRead, %d', nil, [ADestination.Size]);{$ENDIF}
  {$IFDEF LOGGER}
    clPutLogMessage(Self, edLeave, 'AfterRead, %d', nil, [FSSPIBuffer.Size]);
      except on E: Exception do begin clPutLogMessage(Self, edLeave, 'AfterRead, %d', E, [FSSPIBuffer.Size]); raise; end; end;
  {$ENDIF}
end;

function TclTlsNetworkStream.WriteBuffer(ABuffer: TStream; ABufferSize: Int64): Boolean;
begin
  if (FWriteData.Size = 0) then
  begin
    if not (FSSPIResult in [rcCompleteNeeded, rcAuthContinueNeeded]) then
    begin
      Assert(ABuffer <> nil);

      FSSPIBuffer.Size := 0;
      SSPI.Encrypt(ABuffer, FSSPIBuffer, ABufferSize); //TODO use FWriteData instead

      FWriteData.CopyFrom(FSSPIBuffer, FSSPIBuffer.Size);
      FSSPIBuffer.Position := 0;
    end else
    begin
      Assert(ABuffer = nil);
      FWriteData.CopyFrom(FSSPIBuffer, FSSPIBuffer.Size);
      FSSPIBuffer.Size := 0;
    end;
    FWriteData.Position := 0;
  end;

  Result := inherited Write(FWriteData);

  if Result then
  begin
    FWriteData.Size := 0;
  end;
end;

procedure TclTlsNetworkStream.UpdateProgress(ABytesProceed: Int64);
begin
end;

procedure TclTlsNetworkStream.TlsUpdateProgress(ABytesProceed: Int64);
begin
  inherited UpdateProgress(ABytesProceed);
end;

function TclTlsNetworkStream.GetSSPI: TclTlsSspi;
begin
  Result := FSSPI;
  Assert(Result <> nil);
end;

procedure TclTlsNetworkStream.StreamReady;
begin
end;

procedure TclTlsNetworkStream.TlsStreamReady;
begin
  inherited StreamReady();
end;

procedure TclTlsNetworkStream.VerifyPeer;
var
  statusText: string;
begin
  if FPeerVerified then Exit;
  
  FPeerVerified := SSPI.Certified;
  statusText := GetSSPIErrorMessage(SSPI.StatusCode);
  if Assigned(OnVerifyPeer) then
  begin
    OnVerifyPeer(Self, SSPI.PeerCertificate, statusText, SSPI.StatusCode, FPeerVerified);
  end;

  if not FPeerVerified then
  begin
    raise EclSSPIError.Create(statusText, SSPI.StatusCode);
  end;
end;

procedure TclTlsNetworkStream.OpenClientSession;
begin
  FreeSSPI();
  FSSPI := TclTlsClientSspi.Create(TargetName);
  FSSPI.CertificateFlags := CertificateFlags;
  FSSPI.TLSFlags := TLSFlags;

  FSSPIBuffer.Size := 0;
  FNeedAuthenticate := True;
  SetNextAction(saWrite);
end;

procedure TclTlsNetworkStream.OpenServerSession;
begin
  FreeSSPI();
  FSSPI := TclTlsServerSspi.Create(RequireClientCertificate);
  FSSPI.CertificateFlags := CertificateFlags;
  FSSPI.TLSFlags := TLSFlags;

  FSSPIBuffer.Size := 0;
  FSSPIResult := rcAuthDataNeeded;
  FNeedAuthenticate := False;
  SetNextAction(saRead);
end;

procedure TclTlsNetworkStream.SetCertificateFlags(const Value: TclCertificateFlags);
begin
  FCertificateFlags := Value;
  if (FSSPI <> nil) then
  begin
    FSSPI.CertificateFlags := FCertificateFlags;
  end;
end;

procedure TclTlsNetworkStream.SetTLSFlags(const Value: TclTlsFlags);
begin
  FTLSFlags := Value;
  if (FSSPI <> nil) then
  begin
    FSSPI.TLSFlags := FTLSFlags;
  end;
end;

procedure TclTlsNetworkStream.Assign(ASource: TclNetworkStream);
var
  src: TclTlsNetworkStream;
begin
  inherited Assign(ASource);
  if (ASource is TclTlsNetworkStream) then
  begin
    src := ASource as TclTlsNetworkStream;
    FTargetName := src.TargetName;
    FCertificateFlags := src.CertificateFlags;
    FTLSFlags := src.TLSFlags;
    FRequireClientCertificate := src.RequireClientCertificate;
  end;
end;

end.
