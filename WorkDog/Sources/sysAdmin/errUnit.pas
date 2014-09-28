unit errUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, cxLabel, ExtCtrls;

type
  TfrmError = class(TForm)
    errMemo: TcxMemo;
    OKButton: TcxButton;
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmError: TfrmError;

implementation
uses  Jpeg, SysAdmin, WinSock;
{$R *.dfm}

function GetCompName : string;
var
  s : string;
  sLen : Longword;
begin
  SetLength(s, 255);
  sLen := 255;
  GetHostName(@s[1], sLen);
  Result := Trim(StrPas(PAnsiChar(s)));
end;

function GetIPAddress : string;
var
  wVerReq: WORD;
  wsaData: TWSAData;
  i: pchar;
  h: PHostEnt;
  c: array[0..128] of char;
begin
  wVerReq := MAKEWORD(1, 1);
  WSAStartup(wVerReq, wsaData);
  GetHostName(@c, 128);
  h := GetHostByName(@c);
  i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
  Result := i;
  WSACleanup;
end;

procedure GetScreenImage(bmp: TBitmap);
begin 
  bmp.Width  := Screen.Width;
  bmp.Height := Screen.Height;
  BitBlt(bmp.Canvas.Handle, 0, 0, Screen.Width, Screen.Height,
  GetDC(GetDesktopWindow), 0, 0, SRCCopy);
end;

procedure TfrmError.OKButtonClick(Sender: TObject);
var
 bmp : TBitmap;
 jpg : TJPEGImage;
 st  : TMemoryStream;
begin
 bmp := TBitmap.Create;
 jpg := TJPEGImage.Create;
 GetScreenImage(bmp);
 jpg.Assign(bmp);
 bmp.Free;
 st := TMemoryStream.Create;
 jpg.CompressionQuality := 90;
 jpg.SaveToStream(st);
 st.Seek(0, soBeginning);
 try
   AdminObject.StoredProc.Transaction.StartTransaction;
   AdminObject.StoredProc.StoredProcName := 'PROC_SYS_ERRORS_ADD';
   AdminObject.StoredProc.Prepare;
   AdminObject.StoredProc.ParamByName('ID_SYSTEM').AsInteger := 1;
   AdminObject.StoredProc.ParamByName('ID_USER').AsInteger := ADMIN_VAR_ID_USER;
   AdminObject.StoredProc.ParamByName('COMPUTER_NAME').AsString := GetCompName;
   AdminObject.StoredProc.ParamByName('COMPUTER_IP').AsString := GetIPAddress;
   AdminObject.StoredProc.ParamByName('ERROR_TEXT').AsString := errMemo.Text;
   AdminObject.StoredProc.ParamByName('SCREENSHOT').LoadFromStream(st);
   AdminObject.StoredProc.ExecProc;
   AdminObject.StoredProc.Transaction.Commit;
 except
 end;
 st.Free;
 jpg.Free;
 Close;
end;

procedure TfrmError.FormShow(Sender: TObject);
begin
 OKButton.SetFocus;
end;

end.
