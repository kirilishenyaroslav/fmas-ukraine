unit ZipInterfaceAbbrevia;

{-
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

uses Classes, SysUtils,
     ZipInterface, AbUtils, AbBase, AbBrowse, AbZBrows, AbUnzper;

//* Unzip interface that uses the free Abbrevia zip library.
//* For more info and download of Abbrevia, see ~[linkExtern URI[http://sourceforge.net/projects/tpabbrevia/]]      
type TXLSReadZipAbbrevia = class(TXLSReadZip)
private
     FZIP: TAbUnZipper;
public
     //* ~exclude
     constructor Create;
     //* ~exclude
     destructor Destroy; override;
     //* Open the zip file on disk.
     //* ~param Zipfile The zip file to be read.
     procedure OpenZip(Zipfile: WideString); override;
     //* Closes the zip file.
     procedure CloseZip; override;
     //* Reads a comressed file from the zip archive to a stream.
     //* ~param Filename The file to read.
     //* ~param Stream The destination stream to unzip the compressed file to.
     //* ~result True if the file could be read to the stream.
     function ReadFileToStream(Filename: WideString; Stream: TStream): boolean; override;
     end;

implementation

{ TXLSReadZipAbbrevia }

procedure TXLSReadZipAbbrevia.CloseZip;
begin
  FZIP.CloseArchive;
end;

constructor TXLSReadZipAbbrevia.Create;
begin
  FZIP := TAbUnZipper.Create(Nil);
end;

destructor TXLSReadZipAbbrevia.Destroy;
begin
  FZIP.Free;
  inherited;
end;

procedure TXLSReadZipAbbrevia.OpenZip(Zipfile: WideString);
begin
  // ForceType and ArchiveType must be set, as Abbrevia otherwise not will
  // recognize the file as a zip archive, as the extension is .ODS
  FZIP.ForceType := True;
  FZIP.ArchiveType := atZip;

  FZIP.FileName := Zipfile;
end;

function TXLSReadZipAbbrevia.ReadFileToStream(Filename: WideString; Stream: TStream): boolean;
begin
  try
    FZIP.ExtractToStream(Filename,Stream);
    Result := True;
  except
    Result := False;
  end;
end;

end.
