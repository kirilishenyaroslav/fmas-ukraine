unit cn_Common_Tray_Baloon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs,  ShellAPI, StdCtrls;

type
 NotifyIconData_50 = record // определённая в shellapi.h 
   cbSize: DWORD; 
   Wnd: HWND; 
   uID: UINT; 
   uFlags: UINT; 
   uCallbackMessage: UINT; 
   hIcon: HICON;
   szTip: array[0..MAXCHAR] of AnsiChar;
   dwState: DWORD;
   dwStateMask: DWORD; 
   szInfo: array[0..MAXBYTE] of AnsiChar; 
   uTimeout: UINT; // union with uVersion: UINT; 
   szInfoTitle: array[0..63] of AnsiChar; 
   dwInfoFlags: DWORD; 
 end{record}; 
const 
 NIF_INFO      =        $00000010; 
 NIIF_NONE     =        $00000000;
 NIIF_INFO     =        $00000001;
 NIIF_WARNING  =        $00000002; 
 NIIF_ERROR    =        $00000003; 

//А это набор вспомогательных типов:

type 
 TBalloonTimeout = 3..30{seconds}; 
 TBalloonIconType = (bitNone,    // нет иконки 
                     bitInfo,    // информационная иконка (синяя) 
                     bitWarning, // иконка восклицания (жёлтая) 
                     bitError);  // иконка ошибки (краснаа)
function DZBalloonTrayIcon(const Window: HWND; const IconID: Byte; const Timeout: TBalloonTimeout; const BalloonText, BalloonTitle: String; const BalloonIconType: TBalloonIconType): Boolean;
function DZAddTrayIcon(const Window: HWND; const IconID: Byte; const Icon: HICON; const Hint: String = ''): Boolean;
function DZRemoveTrayIcon(const Window: HWND; const IconID: Byte): Boolean;

implementation


function DZBalloonTrayIcon(const Window: HWND; const IconID: Byte; const Timeout: TBalloonTimeout; const BalloonText, BalloonTitle: String; const BalloonIconType: TBalloonIconType): Boolean;
const
 aBalloonIconTypes : array[TBalloonIconType] of Byte = (NIIF_NONE, NIIF_INFO, NIIF_WARNING, NIIF_ERROR);
var
 NID_50 : NotifyIconData_50;
begin
 FillChar(NID_50, SizeOf(NotifyIconData_50), 0);
 with NID_50 do begin
   cbSize := SizeOf(NotifyIconData_50);
   Wnd := Window;
   uID := IconID;
   uFlags := NIF_INFO;
   StrPCopy(szInfo, BalloonText);
   uTimeout := Timeout* 1000;
   StrPCopy(szInfoTitle, BalloonTitle);
   dwInfoFlags := aBalloonIconTypes[BalloonIconType];
 end{with};
 Result := Shell_NotifyIcon(NIM_MODIFY, @NID_50);
end;

{добавление иконки}
function DZAddTrayIcon(const Window: HWND; const IconID: Byte; const Icon: HICON; const Hint: String = ''): Boolean;
var  
 NID : NotifyIconData; 
begin 
 FillChar(NID, SizeOf(NotifyIconData), 0); 
 with NID do begin 
   cbSize := SizeOf(NotifyIconData); 
   Wnd := Window; 
   uID := IconID; 
   if Hint = '' then begin 
     uFlags := NIF_ICON; 
   end{if} else begin 
     uFlags := NIF_ICON or NIF_TIP; 
     StrPCopy(szTip, Hint); 
   end{else}; 
   hIcon := Icon; 
 end{with}; 
 Result := Shell_NotifyIcon(NIM_ADD, @NID); 
end; 

{удаляет иконку}
function DZRemoveTrayIcon(const Window: HWND; const IconID: Byte): Boolean;
var 
 NID : NotifyIconData;
begin 
 FillChar(NID, SizeOf(NotifyIconData), 0); 
 with NID do begin 
   cbSize := SizeOf(NotifyIconData); 
   Wnd := Window;
   uID := IconID; 
 end{with}; 
 Result := Shell_NotifyIcon(NIM_DELETE, @NID); 
end;
end.
