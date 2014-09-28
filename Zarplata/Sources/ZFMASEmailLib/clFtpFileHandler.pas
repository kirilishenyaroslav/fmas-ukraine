{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clFtpFileHandler;

interface

{$I clVer.inc}
{$IFDEF DELPHI6}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

uses
  Classes, clFtpServer, clFtpUtils;

type
  TclFtpFileHandler = class(TComponent)
  private
    FServer: TclFtpServer;
    procedure SetServer(const Value: TclFtpServer);
    function GetErrorText(AErrorCode: Integer): string;
    procedure DoCreateDir(Sender: TObject; AConnection: TclFtpCommandConnection;
      const AName: string; var Success: Boolean; var AErrorMessage: string);
    procedure DoDelete(Sender: TObject; AConnection: TclFtpCommandConnection;
      const AName: string; var Success: Boolean; var AErrorMessage: string);
    procedure DoGetFile(Sender: TObject; AConnection: TclFtpCommandConnection;
      const AFileName: string; var ASource: TStream; var Success: Boolean; var AErrorMessage: string);
    procedure DoGetFileInfo(Sender: TObject; AConnection: TclFtpCommandConnection;
      const AName: string; AInfo: TclFtpFileInfo; var Success: Boolean; var AErrorMessage: string);
    procedure DoGetFileList(Sender: TObject; AConnection: TclFtpCommandConnection;
      const APathName: string; AIncludeHidden: Boolean; AFileList: TclFtpFileList);
    procedure DoPutFile(Sender: TObject; AConnection: TclFtpCommandConnection; const AFileName: string;
      AOverwrite: Boolean; var ADestination: TStream; var Success: Boolean; var AErrorMessage: string);
    procedure DoRename(Sender: TObject; AConnection: TclFtpCommandConnection;
      const ACurrentName, ANewName: string; var Success: Boolean; var AErrorMessage: string);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CleanEventHandlers; virtual;
    procedure InitEventHandlers; virtual;
  published
    property Server: TclFtpServer read FServer write SetServer;
  end;

implementation

uses
  SysUtils, Windows, clUtils;

{ TclFtpFileHandler }

procedure TclFtpFileHandler.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation <> opRemove) then Exit;
  if (AComponent = FServer) then
  begin
    CleanEventHandlers();
    FServer := nil;
  end;
end;

procedure TclFtpFileHandler.SetServer(const Value: TclFtpServer);
begin
  if (FServer <> Value) then
  begin
{$IFDEF DELPHI5}
    if (FServer <> nil) then
    begin
      FServer.RemoveFreeNotification(Self);
      CleanEventHandlers();
    end;
{$ENDIF}
    FServer := Value;
    if (FServer <> nil) then
    begin
      FServer.FreeNotification(Self);
      InitEventHandlers();
    end;
  end;
end;

procedure TclFtpFileHandler.CleanEventHandlers;
begin
  Server.OnCreateDir := nil;
  Server.OnDelete := nil;
  Server.OnRename := nil;
  Server.OnGetFileInfo := nil;
  Server.OnPutFile := nil;
  Server.OnGetFile := nil;
  Server.OnGetFileList := nil;
end;

procedure TclFtpFileHandler.InitEventHandlers;
begin
  Server.OnCreateDir := DoCreateDir;
  Server.OnDelete := DoDelete;
  Server.OnRename := DoRename;
  Server.OnGetFileInfo := DoGetFileInfo;
  Server.OnPutFile := DoPutFile;
  Server.OnGetFile := DoGetFile;
  Server.OnGetFileList := DoGetFileList;
end;

procedure TclFtpFileHandler.DoCreateDir(Sender: TObject; AConnection: TclFtpCommandConnection;
  const AName: string; var Success: Boolean; var AErrorMessage: string);
begin
  Success := CreateDir(AName);
  if not Success then
  begin
    AErrorMessage := GetErrorText(GetLastError());
  end;
end;

procedure TclFtpFileHandler.DoDelete(Sender: TObject; AConnection: TclFtpCommandConnection;
  const AName: string; var Success: Boolean; var AErrorMessage: string);
var
  attr: Integer;
  sr: TSearchRec;
begin
  attr := faDirectory;
  if (FindFirst(AName, attr, sr) = 0) and ((sr.Attr and faDirectory) > 0) then
  begin
    Success := RemoveDir(AName);
  end else
  begin
    Success := DeleteFile(PChar(AName));
  end;
  SysUtils.FindClose(sr);
  if not Success then
  begin
    AErrorMessage := GetErrorText(GetLastError());
  end;
end;

procedure TclFtpFileHandler.DoRename(Sender: TObject; AConnection: TclFtpCommandConnection;
  const ACurrentName, ANewName: string; var Success: Boolean; var AErrorMessage: string);
begin
  Success := RenameFile(ACurrentName, ANewName);
  if not Success then
  begin
    AErrorMessage := GetErrorText(GetLastError());
  end;
end;

procedure TclFtpFileHandler.DoGetFileInfo(Sender: TObject; AConnection: TclFtpCommandConnection;
  const AName: string; AInfo: TclFtpFileInfo; var Success: Boolean; var AErrorMessage: string);
var
  sr: TSearchRec;
begin
  Success := (FindFirst(AName, faReadOnly or faDirectory or faArchive or faHidden, sr) = 0);
  if Success then
  begin
    AInfo.FileName := sr.Name;
    AInfo.Size := sr.Size; //TODO Int64
    AInfo.IsDirectory := (sr.Attr and FILE_ATTRIBUTE_DIRECTORY) > 0;
    AInfo.IsReadOnly := (sr.Attr and FILE_ATTRIBUTE_READONLY) > 0;
    AInfo.ModifiedDate := ConvertFileTimeToDateTime(sr.FindData.ftLastWriteTime);
  end else
  begin
    AErrorMessage := GetErrorText(GetLastError());
  end;
  SysUtils.FindClose(sr);
end;

procedure TclFtpFileHandler.DoPutFile(Sender: TObject; AConnection: TclFtpCommandConnection;
  const AFileName: string; AOverwrite: Boolean; var ADestination: TStream;
  var Success: Boolean; var AErrorMessage: string);
const
  modes: array[Boolean] of Word = (fmOpenWrite, fmCreate);
begin
  try
    ADestination := TFileStream.Create(AFileName, modes[AOverwrite]);
    Success := True;
  except
    on E: Exception do
    begin
      Success := False;
      AErrorMessage := E.Message;
    end;
  end;
end;

procedure TclFtpFileHandler.DoGetFile(Sender: TObject; AConnection: TclFtpCommandConnection;
  const AFileName: string; var ASource: TStream; var Success: Boolean; var AErrorMessage: string);
begin
  try
    ASource := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
    Success := True;
  except
    on E: Exception do
    begin
      Success := False;
      AErrorMessage := E.Message;
    end;
  end;
end;

procedure TclFtpFileHandler.DoGetFileList(Sender: TObject; AConnection: TclFtpCommandConnection;
  const APathName: string; AIncludeHidden: Boolean; AFileList: TclFtpFileList);
var
  searchRec: TSearchRec;
  path: string;
  item: TclFtpFileItem;
  attr: Integer;
begin
  path := APathName;
  if not FileExists(path) then
  begin
    path := AddTrailingBackSlash(path) + '*.*';
  end;

  attr := faReadOnly or faDirectory or faArchive;
  if AIncludeHidden then
  begin
    attr := attr or faHidden;
  end;

  if SysUtils.FindFirst(path, attr, searchRec) = 0 then
  begin
    repeat
      if (searchRec.Name <> '.') and (searchRec.Name <> '..') then
      begin
        item := AFileList.Add();
        item.Info.FileName := searchRec.Name;
        item.Info.IsDirectory := (searchRec.Attr and FILE_ATTRIBUTE_DIRECTORY) > 0;
        item.Info.IsReadOnly := (searchRec.Attr and FILE_ATTRIBUTE_READONLY) > 0;
        item.Info.Size := searchRec.Size;
        item.Info.ModifiedDate := ConvertFileTimeToDateTime(searchRec.FindData.ftLastWriteTime);
      end;
    until (SysUtils.FindNext(searchRec) <> 0);
    SysUtils.FindClose(searchRec);
  end;
end;

function TclFtpFileHandler.GetErrorText(AErrorCode: Integer): string;
var
  Buffer: array[0..255] of Char;
begin
  FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, AErrorCode, 0, Buffer, SizeOf(Buffer), nil);
  Result := Trim(Buffer);
end;

end.
