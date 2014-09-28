{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clWinSock2;

interface

{$I clVer.inc}
{$IFDEF DELPHI7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
{$ENDIF}

uses
  Windows, WinSock, SysUtils;

const
  WSA_INVALID_EVENT = 0;

  WSA_WAIT_FAILED = WAIT_FAILED;
  WSA_WAIT_EVENT_0 = WAIT_OBJECT_0;
  WSA_WAIT_TIMEOUT = WAIT_TIMEOUT;
  WSA_MAXIMUM_WAIT_EVENTS = MAXIMUM_WAIT_OBJECTS;
  WSA_INFINITE = INFINITE;

  FD_READ_BIT = 0;
  FD_WRITE_BIT = 1;
  FD_ACCEPT_BIT = 3;
  FD_CONNECT_BIT = 4;
  FD_CLOSE_BIT = 5;

  FD_MAX_EVENTS = 10;

{$IFNDEF DELPHI6}
  SD_RECEIVE     = 0;
  SD_SEND        = 1;
  SD_BOTH        = 2;
{$ENDIF}

type  
  TWSANetworkEvents = record
    lNetworkEvents: Integer;
    iErrorCode: Array[0..FD_MAX_EVENTS - 1] of Integer;
  end;
  PWSANetworkEvents = ^TWSANetworkEvents;
  LPWSANetworkEvents = PWSANetworkEvents;
  
function WSACreateEvent: THandle stdcall;
function WSAResetEvent(hEvent: THandle): Boolean stdcall;
function WSACloseEvent(hEvent: THandle): Boolean stdcall;
function WSAEventSelect(s: TSocket; hEventObject: THandle;
  lNetworkEvents: DWORD): Integer stdcall;
function WSAWaitForMultipleEvents(cEvents: DWORD; lphEvents: PWOHandleArray;
  fWaitAll: BOOL; dwTimeout: DWORD; fAlertable: BOOL): DWORD; stdcall;
function WSAEnumNetworkEvents(const s: TSocket; const hEventObject: THandle;
  lpNetworkEvents: LPWSANETWORKEVENTS): Integer; stdcall;

implementation

type
  TclWSAResetEvent = function (hEvent: THandle): Boolean stdcall;
  TclWSACreateEvent = function : THandle stdcall;
  TclWSACloseEvent = function (hEvent: THandle): Boolean stdcall;
  TclWSAEventSelect = function (s: TSocket; hEventObject: THandle;
    lNetworkEvents: DWORD): Integer stdcall;
  TclWSAWaitForMultipleEvents = function (cEvents: DWORD; lphEvents: PWOHandleArray;
    fWaitAll: LongBool; dwTimeout: DWORD; fAlertable: LongBool): DWORD; stdcall;
  TclWSAEnumNetworkEvents = function (const s: TSocket; const hEventObject: THandle;
  lpNetworkEvents: LPWSANETWORKEVENTS): Integer; stdcall;

function clGetProcAddress(hModule: HMODULE; lpProcName: LPCSTR): FARPROC; stdcall;
var
  Buffer: array[0..255] of Char;
begin
  Result := GetProcAddress(hModule, lpProcName);
  if not Assigned(Result) then
  begin
    ZeroMemory(@Buffer, SizeOf(Buffer));
    FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, GetLastError(), 0, Buffer, SizeOf(Buffer), nil);
    raise Exception.Create(Buffer);
  end;
end;

var
  hWinSock2: THandle;
  clWSACreateEvent: TclWSACreateEvent;
  clWSAResetEvent: TclWSAResetEvent;
  clWSACloseEvent: TclWSACloseEvent;
  clWSAEventSelect: TclWSAEventSelect;
  clWSAWaitForMultipleEvents: TclWSAWaitForMultipleEvents;
  clWSAEnumNetworkEvents: TclWSAEnumNetworkEvents;

procedure InitWinSock2;
const
  DLLName = 'ws2_32.dll';
var
  Buffer: array[0..255] of Char;
begin
  if (hWinSock2 > 0) then Exit;
  hWinSock2 := LoadLibrary(PChar(DLLName));
  if (hWinSock2 <= HINSTANCE_ERROR) then
  begin
    ZeroMemory(@Buffer, SizeOf(Buffer));
    FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, GetLastError(), 0, Buffer, SizeOf(Buffer), nil);
    raise Exception.Create(Buffer);
  end;
  @clWSACreateEvent := clGetProcAddress(hWinSock2, 'WSACreateEvent');
  @clWSAResetEvent := clGetProcAddress(hWinSock2, 'WSAResetEvent');
  @clWSACloseEvent := clGetProcAddress(hWinSock2, 'WSACloseEvent');
  @clWSAEventSelect := clGetProcAddress(hWinSock2, 'WSAEventSelect');
  @clWSAWaitForMultipleEvents := clGetProcAddress(hWinSock2, 'WSAWaitForMultipleEvents');
  @clWSAEnumNetworkEvents := clGetProcAddress(hWinSock2, 'WSAEnumNetworkEvents');
end;

procedure FreeWinSock2;
begin
  if hWinSock2 > HINSTANCE_ERROR then
  begin
    FreeLibrary(hWinSock2);
  end;
  hWinSock2 := 0;
end;

function WSACreateEvent: THandle stdcall;
begin
  InitWinSock2();
  Result := clWSACreateEvent();
end;

function WSAResetEvent(hEvent: THandle): Boolean stdcall;
begin
  InitWinSock2();
  Result := clWSAResetEvent(hEvent);
end;

function WSACloseEvent(hEvent: THandle): Boolean stdcall;
begin
  InitWinSock2();
  Result := clWSACloseEvent(hEvent);
end;

function WSAEventSelect(s: TSocket; hEventObject: THandle;
  lNetworkEvents: DWORD): Integer stdcall;
begin
  InitWinSock2();
  Result := clWSAEventSelect(s, hEventObject, lNetworkEvents);
end;

function WSAWaitForMultipleEvents(cEvents: DWORD; lphEvents: PWOHandleArray;
  fWaitAll: LongBool; dwTimeout: DWORD; fAlertable: LongBool): DWORD; stdcall;
begin
  InitWinSock2();
  Result := clWSAWaitForMultipleEvents(cEvents, lphEvents, fWaitAll, dwTimeout, fAlertable);
end;

function WSAEnumNetworkEvents(const s: TSocket; const hEventObject: THandle;
  lpNetworkEvents: LPWSANETWORKEVENTS): Integer; stdcall;
begin
  InitWinSock2();
  Result := clWSAEnumNetworkEvents(s, hEventObject, lpNetworkEvents);
end;

initialization

finalization
  FreeWinSock2();
  
end.