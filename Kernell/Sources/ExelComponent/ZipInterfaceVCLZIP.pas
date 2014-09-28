unit ZipInterfaceVCLZIP;

interface

uses Classes, SysUtils,
     ZipInterface, VCLUnZip;

type TXLSReadZipVCLZIP = class(TXLSReadZip)
private
     FZIP: TVCLUnZip;
public
     constructor Create;
     destructor Destroy; override;
     procedure OpenZip(Zipfile: WideString); override;
     procedure CloseZip; override;
     function ReadFileToStream(Filename: WideString; Stream: TStream): boolean; override;
     end;

implementation

{ TXLSReadZipVCLZIP }

procedure TXLSReadZipVCLZIP.CloseZip;
begin
  FZIP.ClearZip;
end;

constructor TXLSReadZipVCLZIP.Create;
begin
  FZIP := TVCLUnZip.Create(Nil);
end;

destructor TXLSReadZipVCLZIP.Destroy;
begin
  FZIP.Free;
  inherited;
end;

procedure TXLSReadZipVCLZIP.OpenZip(Zipfile: WideString);
begin
  FZIP.ZipName := Zipfile;
end;

function TXLSReadZipVCLZIP.ReadFileToStream(Filename: WideString; Stream: TStream): boolean;
begin
  Result := FZIP.UnZipToStream(Stream,Filename) = 1;
end;

end.
