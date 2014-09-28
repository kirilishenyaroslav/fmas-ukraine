unit ZipInterface;

{
********************************************************************************
******* XLSReadWriteII V3.00                                             *******
*******                                                                  *******
******* Copyright(C) 1999,2006 Lars Arvidsson, Axolot Data               *******
*******                                                                  *******
******* email: components@axolot.com                                     *******
******* URL:   http://www.axolot.com                                     *******
********************************************************************************
** Users of the XLSReadWriteII component must accept the following            **
** disclaimer of warranty:                                                    **
**                                                                            **
** XLSReadWriteII is supplied as is. The author disclaims all warranties,     **
** expressedor implied, including, without limitation, the warranties of      **
** merchantability and of fitness for any purpose. The author assumes no      **
** liability for damages, direct or consequential, which may result from the  **
** use of XLSReadWriteII.                                                     **
********************************************************************************
}

{$B-}
{$H+}
{$R-}
{$I XLSRWII2.inc}

interface

uses Classes, SysUtils
{$ifdef DELPHI_6_OR_LATER}
{$ifndef BCB}
,XLSReadWriteZIP
{$endif}
{$endif}
;

//* Base class for reading ZIP compressed file. An external unzip library is
//* required when importing Open Office Calc files, as these files are zip
//* compressed. XLSReadWriteII has an interface to the free Abbrevia zip
//* library. See ~[link ZipInterfaceAbbrevia.TXLSReadZipAbbrevia TXLSReadZipAbbrevia]. ~[br]
//* When using another zip library, override the virtual methods in this class.
type TXLSReadZip = class(TObject)
private
{$ifdef DELPHI_6_OR_LATER}
{$ifndef BCB}
     FZIP: TXLSZipArchive;
{$endif}
{$endif}
public
     constructor Create;
     destructor Destroy; override;
     //* Open the zip file on disk.
     //* ~param Zipfile The zip file to be read.
     procedure OpenZip(Zipfile: WideString); virtual;
     //* Closes the zip file.
     procedure CloseZip; virtual;
     //* Reads a comressed file from the zip archive to a stream.
     //* ~param Filename The file to read.
     //* ~param Stream The destination stream to unzip the compressed file to.
     //* ~result True if the file could be read to the stream.
     function ReadFileToStream(Filename: WideString; Stream: TStream): boolean; virtual;
     end;

implementation

{ TXLSReadZip }

procedure TXLSReadZip.CloseZip;
begin
{$ifdef DELPHI_6_OR_LATER}
{$ifndef BCB}
  FZIP.Close;
{$endif}
{$endif}
end;

constructor TXLSReadZip.Create;
begin
{$ifdef DELPHI_6_OR_LATER}
{$ifndef BCB}
  FZIP := TXLSZipArchive.Create;
{$endif}
{$endif}
end;

destructor TXLSReadZip.Destroy;
begin
{$ifdef DELPHI_6_OR_LATER}
{$ifndef BCB}
  FZIP.Free;
{$endif}
{$endif}
  inherited;
end;

procedure TXLSReadZip.OpenZip(Zipfile: WideString);
begin
{$ifdef DELPHI_6_OR_LATER}
{$ifndef BCB}
  FZIP.LoadFromFile(ZipFile);
{$endif}
{$endif}
end;

function TXLSReadZip.ReadFileToStream(Filename: WideString; Stream: TStream): boolean;
begin
{$ifdef DELPHI_6_OR_LATER}
{$ifndef BCB}
  FZIP.Read(Filename,Stream);
  Result := True;
{$endif}
{$else}
  Result := False;
{$endif}
end;

end.
