unit SpFoto_JpegInfo;

interface

Uses
  Windows, SysUtils, Classes, SpFoto_Types, SpFoto_FileStream;

Type
  TIFD = (Primary_IFD, Exif_IFD, GPS_IFD, Interop_IFD);

  //
  // This is a special ExifStream wrapper to catch if/when
  // a runaway parsing of the file run outside the exif
  // Section.
  //
  TmdExifStream = class(TmdFileStream)
  Private
    FExifOffset : DWord;
  Public
    Procedure Seek(Pos : LongInt); Override;
    Property ExifOffset : DWord Read FExifOffset Write FExifOffset;
  end;

//
// Return the Name associated with a TAG value
//
Function TagToStr(IFD : TIFD; Tag : Word; Str:String = '') : String;

//
// Return the Name assosiated with a Type value
//
Function TypeToStr(AType : Word) : String;

//
// Get the Exif information from the file.
// Return false if no information was found
//
Function GetJpegInfoRec(FileName : String; SL : TStrings; ResInfo:TJpegGeneralInfo) : Boolean;

Function GetJpegInfo(FileName : String; SL : TStrings) : Boolean;

//
// This is the actual Exif tag decoding function
//
Function GetIFDData(Img : TmdExifStream; Offset : DWord;
                    IFD : TIFD; SL : TStrings) : Boolean;

implementation

var pInfo:TJpegGeneralInfo;


Procedure TmdExifStream.Seek(Pos : LongInt);
Begin
  If (FExifOffset > 0) AND (Pos > FExifOffset+65535) Then
    Raise Exception.Create('Exif section out of bounds');

  Inherited Seek(Pos);
end;


Function TagToStr(IFD : TIFD; Tag : Word; Str:String = '') : String;
var i:Integer;
Begin
  Result := '';
  If (IFD = Primary_IFD) OR (IFD = Exif_IFD) Then
  Begin
    Case Tag of
      $100: Result := 'ImageWidth';
      $101: Result := 'ImageLength';
      $102: Result := 'BitsPerSample';
      $103: Result := 'Compression';
      $106: Result := 'PhotometricInterpretation';
      $112: Result := 'Orientation';
      $115: Result := 'SamplesPerPixel';
      $11C: Result := 'PlanarConfiguration';
      $212: Result := 'YCbCrSubSampling';
      $213: Result := 'YCbCrPositioning';
      $11A: begin
              Result := 'XResolution';
              i:=pos('/',Str);
              Delete(Str,i,length(Str)-i+1);
              pInfo.XPP:=StrToInt(Str);
            end;
      $11B: begin
              Result := 'YResolution';
              i:=pos('/',Str);
              Delete(Str,i,length(Str)-i+1);
              pInfo.YPP:=StrToInt(Str);
            end;
      $128: begin
              Result := 'ResolutionUnit';
              pInfo.ResolutionUnit:=StrToInt(Str);
            end;
      $111: Result := 'StripOffsets';
      $116: Result := 'RowsPerStrip';
      $117: Result := 'StripByteCounts';
      $201: Result := 'JPEGInterchangeFormat';
      $202: Result := 'JPEGInterchangeFormatLength';
      $12D: Result := 'TransferFunction';
      $13E: Result := 'WhitePoint';
      $13F: Result := 'PrimaryChromaticities';
      $211: Result := 'YCbCrCoefficients';
      $214: Result := 'ReferenceBlackWhite';
      $132: Result := 'DateTime';
      $10E: Result := 'ImageDescription';
      $10F: Result := 'Make';
      $110: Result := 'Model';
      $131: Result := 'Software';
      $13B: Result := 'Artist';
      $8298: Result := 'Copyright';
      $8769: Result := 'Exif IFD';

      // Version
      $9000: Result := 'ExifVersion';
      $A000: Result := 'FlashPixVersion';
      // Color
      $A001: Result := 'ColorSpace';
      // Image Configuration
      $9101: Result := 'ComponentsConfiguration';
      $9102: Result := 'CompressedBitsPerPixel';
      $A002: begin
               Result := 'PixelXDimension';
               pInfo.Width:=StrToInt(Str);
             end;
      $A003: begin
               Result := 'PixelYDimension';
               pInfo.Height:=StrToInt(Str);
             end;
      // User Information
      $927C: Result := 'MakerNote';
      $9286: Result := 'UserComment';
      // Date and Time
      $9003: Result := 'DateTimeOriginal';
      $9004: Result := 'DateTimeDigitized';
      $9290: Result := 'SubSecTime';
      $9291: Result := 'SubSecTimeOriginal';
      $9292: Result := 'SubSecTimeDigitized';
      // Picture taking condition
      $829A: Result := 'ExposureTime';
      $829D: Result := 'FNumber';
      $8822: Result := 'ExposureProgram';
      $8824: Result := 'SpectralSensitivity';
      $8827: Result := 'ISOSpeedRatings';
      $8828: Result := 'OECF';
      $9201: Result := 'ShutterSpeedValue';
      $9202: Result := 'ApertureValue';
      $9203: Result := 'BrightnessValue';
      $9204: Result := 'ExposureBiasValue';
      $9205: Result := 'MaxApertureValue';
      $9206: Result := 'SubjectDistance';
      $9207: Result := 'MeteringMode';
      $9208: Result := 'LightSource';
      $9209: Result := 'Flash';
      $920A: Result := 'FocalLength';
      $A20B: Result := 'FlashEnergy';
      $A20C: Result := 'SpatialFrequencyResponse';
      $A20E: Result := 'FocalPlaneXResolution';
      $A20F: Result := 'FocalPlaneYResolution';
      $A210: Result := 'FocalPlaneResolutionUnit';
      $A214: Result := 'SubjectLocation';
      $A215: Result := 'ExposureIndex';
      $A217: Result := 'SensingMethod';
      $A300: Result := 'FileSource';
      $A301: Result := 'SceneType';
      $A302: Result := 'CFAPattern';

      // Misc
      $A005: Result := 'Interoperability IFD Pointer';

      // GPS
      $8825: Result := 'GPS Info Pointer';
    end;
  end
  else If IFD = Interop_IFD Then
  Begin
    Case Tag of
      $0001: Result := 'InteroperabilityIndex';
      $0002: Result := 'InteroperabilityVersion';
      $1000: Result := 'RelatedImageFileFormat';
      $1001: Result := 'RelatedImageWidth';
      $1002: Result := 'RelatedImageLength';
    end;
  end
  else If IFD = GPS_IFD Then
  Begin
    Case Tag of
      $0000: Result := 'GPSVersionID';
      $0001: Result := 'GPSLatitudeRef';
      $0002: Result := 'GPSLatitude';
      $0003: Result := 'GPSLongitudeRef';
      $0004: Result := 'GPSLongitude';
      $0005: Result := 'GPSAltitudeRef';
      $0006: Result := 'GPSAltitude';
      $0007: Result := 'GPSTimeStamp';
      $0008: Result := 'GPSSatellites';
      $0009: Result := 'GPSStatus';
      $000A: Result := 'GPSMeasureMode';
      $000B: Result := 'GPSDOP';
      $000C: Result := 'GPSSpeedRef';
      $000D: Result := 'GPSSpeed';
      $000E: Result := 'GPSTrackRef';
      $000F: Result := 'GPSTrack';
      $0010: Result := 'GPSImgDirectionRef';
      $0011: Result := 'GPSImgDirection';
      $0012: Result := 'GPSMapDatum';
      $0013: Result := 'GPSDestLatitudeRef';
      $0014: Result := 'GPSDestLatitude';
      $0015: Result := 'GPSDestLongitudeRef';
      $0016: Result := 'GPSDestLongitude';
      $0017: Result := 'GPSDestBearingRef';
      $0018: Result := 'GPSDestBearing';
      $0019: Result := 'GPSDestDistanceRef';
      $001A: Result := 'GPSDestDistance';
    end;
  end;

  If Result = '' Then
    Result := 'Tag '+IntToHex(Tag,4);
end;



Function TypeToStr(AType : Word) : String;
Begin
  Result := '';
  case AType of
    1: Result := 'BYTE';
    2: Result := 'ASCII';
    3: Result := 'SHORT';
    4: Result := 'LONG';
    5: Result := 'RATIONAL';
    7: Result := 'UNDEFINED';
    9: Result := 'SLONG';
    10: Result := 'SRATIONAL';
  else
    Result := 'Type '+IntToStr(AType);
  end;
end;

Function CleanStr(Str : String) : String;
Var
  Cnt : Integer;
Begin
  Result := '';
  For Cnt := 1 to Length(Str) do
   If Str[Cnt] >= #$20 Then
     Result := Result + Str[Cnt];
end;

Function GetJpegInfoRec(FileName : String; SL : TStrings; ResInfo:TJpegGeneralInfo) : Boolean;
begin
  pInfo.Width:=-1;
  pInfo.Height:=-1;
  pInfo.XPP:=-1;
  pInfo.YPP:=-1;
  pInfo.ResolutionUnit:=-1;
  GetJpegInfo(FileName,SL);
  ResInfo:=pInfo;
end;

Function GetJpegInfo(FileName : String; SL : TStrings) : Boolean;
Var
  Img : TmdExifStream;
  Str : String;
  TempB : Byte;
  TempW : Word;
  TempI : DWord;
Begin
  Result := False;
  Img := TmdExifStream.Create(FileName,
                        fmOpenRead OR fmShareDenyWrite);
  Try
    If Img.EOF Then
      Exit;

    // Check the Jpeg format.

    // Read Start Of Image (SOI) Marker
    If NOT (Img.GetWord = $FFD8) Then
      Exit;


    // Search for the Exif section
    Repeat
      If Img.GetByte = $FF Then
      Begin
        TempB := Img.GetByte;
        case TempB of
        $E1 : // Exif Marker found ...
          Begin
            // Continue load below...
            Break;
          end;
        $D9 :  // End Of Image (EOI)
          Begin
            Exit;
          end;
        else
          Begin
            // Unknown section...
            // The two bytes following the application marker is
            // the length of the section (including the two length bytes).
            // We need to skip the section
            TempW := Img.GetWord - 2;
            Img.Seek(Img.Position+TempW);
          end;
        end;
      end
      else
      Begin
        // Something is very wrong...
        Exit;
      end;
    Until Img.EOF;

    // Reading the Exif Section length
    Img.GetWord;

    // Here we find the Exif "magic" prefix inside the
    // the Jpeg Application Section.

    // The Exif section start with the four letters "Exif" followed
    // by two null bytes.
    SetLength(Str,4);
    Img.Read(Str, 4);
    If Str <> 'Exif' Then
      Exit;

    If NOT (Img.GetWord = $0000) Then
      Exit;

    // This is our reference marker!
    Img.ExifOffset := Img.Position;

    // From here we are talking TIFF format....

    // Get char format
    TempW := Img.GetWord;
    Case TempW of
    $4949 :
      Begin
        Img.Endian := Little;
      end;
    $4D4D :
      Begin
        Img.Endian := Big;
      end;
    else
      Begin
        // Illigal header value
        Exit;
      end;
    end;

    // Get "fixed value"
    // (or as the TIFF standard says "An arbitrary but
    //  carefully chosen number")
    TempW := Img.GetWord;
    If TempW <> $002A Then
      Exit;

    // Read the offset value, and find the "start
    // position"
    TempI := Img.GetInt;
    If NOT GetIFDData(Img, TempI, Primary_IFD, SL) Then
      Exit;
  Finally
    Img.Free;
  end;
  Result := True;
end;

//
// Decode the IFD Data (or tags)
//
Function GetIFDData(Img : TmdExifStream; Offset : DWord;
                    IFD : TIFD; SL : TStrings) : Boolean;
Var
  Cnt : Integer;
  Cnt2 : Integer;
  Str : String;
  IFDRecords : Word;

  MyPos : DWord;
  MyTag, MyType : Word;
  MyCount, MyValue : DWord;

  TmpW : Word;

  NextIFD : DWord;
Begin
  // Try to catch exceptions. The file will return an exception if
  // we access outside the file (runaway tags)
  Try
    Result := True;
    Img.Seek(Img.ExifOffset+Offset);
    If Img.EOF Then  // Sanity check
      Exit;
    // Get the information count
    IFDRecords := Img.GetWord;

    For Cnt := 1 to IFDRecords do
    Begin
      MyPos := Img.Position;
      MyTag := Img.GetWord;
      MyType := Img.GetWord;
      MyCount := Img.GetInt;
      MyValue := Img.GetInt;

      Str := '';
      case MyType of
        1: // BYTE
        Begin
          If MyCount <= 4 Then
            Img.Seek(MyPos+8)
          else
            Img.Seek(MyValue+Img.ExifOffset);
          For Cnt2 := 1 To MyCount do
          Begin
            If Str <> '' Then
              Str := Str + ',';
            TmpW := Img.GetByte;
            Str := Str + IntToStr(TmpW);
          end;
        end;

        2: // ASCII
        Begin
          If MyCount <= 4 Then
            Img.Seek(MyPos+8)
          else
            Img.Seek(MyValue+Img.ExifOffset);
          SetLength(Str, MyCount);
          Img.Read(Str, MyCount);
          Str := CleanStr(Str);
        end;
        3: // Short
        begin
          // We can store two words in a 4 byte area.
          // So if there is less (or equal) than two items
          // in this section they are stored in the
          // Value/Offset area
          If MyCount <= 2 Then
            Img.Seek(MyPos+8)
          else
            Img.Seek(MyValue+Img.ExifOffset);
          For Cnt2 := 1 To MyCount do
          Begin
            If Str <> '' Then
              Str := Str + ',';
            Str := Str + IntToStr(Img.GetWord);
          end;
        end;
        4: // Long
        Begin
          // We can store one long in a 4 byte area.
          // So if there is less (or equal) than one item
          // in this section they are stored in the
          // Value/Offset area
          If MyCount <= 1 Then
            Str := IntToStr(MyValue)
          else
          Begin
            Img.Seek(MyValue+Img.ExifOffset);
            For Cnt2 := 1 To MyCount do
            Begin
              If Str <> '' Then
                Str := Str + ',';
              Str := Str + IntToStr(Img.GetInt);
            end;
          end;
        end;

        5: // Rational (LONG / LONG)
        Begin
          Img.Seek(MyValue+Img.ExifOffset);
          For Cnt2 := 1 To MyCount do
          Begin
            If Str <> '' Then
              Str := Str + ',';
            Str := Str + IntToStr(Img.GetInt) + '/'+
                   IntToStr(Img.GetInt);
          end;
        end;

        7: // Undefined
        Begin
          If MyCount <= 4 Then
           Img.Seek(MyPos+8)  // The 8 is the "tag record size"
                              // Minus the value
          else
            Img.Seek(MyValue+Img.ExifOffset);

          Str := '';
          For Cnt2 := 1 To MyCount do
          Begin
            If Str <> '' Then
              Str := Str + ' ';
            Str := Str + IntToHex(Img.GetByte,2);
          end;
        end;

        9: // Signed Long
        Begin
          // We can store one long in a 4 byte area.
          // So if there is less (or equal) than one item
          // in this section they are stored in the
          // Value/Offset area
          If MyCount <= 1 Then
          Begin
            Str := IntToStr(Integer(MyValue));
          end
          else
          Begin
            Img.Seek(MyValue+Img.ExifOffset);
            For Cnt2 := 1 To MyCount do
            Begin
              If Str <> '' Then
                Str := Str + ',';
              Str := Str + IntToStr(Integer(Img.GetInt));
            end;
          end;
        end;

        10: // Signed Rational (SLONG / SLONG)
        Begin
          Img.Seek(MyValue+Img.ExifOffset);
          For Cnt2 := 1 To MyCount do
          Begin
            If Str <> '' Then
              Str := Str + ',';
            Str := Str + IntToStr(Integer(Img.GetInt)) + '/'+
                   IntToStr(Integer(Img.GetInt));
          end;
        end;
      else
        // An undentified code is returned. We bail out of this
        // section with an error. Result will depend on location
        Result := False;
        Exit;
      end;


      Case MyTag of
        $8769:
          If NOT GetIFDData(Img, MyValue, Exif_IFD, SL) Then
            SL.Add(TagToStr(IFD, MyTag)+'=[ ERROR ]');
        $A005:
          If NOT GetIFDData(Img, MyValue, Interop_IFD, SL) Then
            SL.Add(TagToStr(IFD, MyTag)+'=[ ERROR ]');
        $8825:
          If NOT GetIFDData(Img, MyValue, GPS_IFD, SL) Then
            SL.Add(TagToStr(IFD, MyTag)+'=[ ERROR ]');
      else
        SL.Add(TagToStr(IFD, MyTag, Str)+'='+Str);
      end;

      If NOT Result Then
        Exit; // We had an error

      Img.Seek(MyPos+12); // The 12 is the "tag record size"
    end;
    NextIFD := Img.GetInt;

    If NextIFD > 65535 Then
    Begin
      Result := False;
      Exit; // Error!!
    end;

    If NextIFD <> 0 Then
      Result := GetIFDData(Img, NextIFD, IFD, SL)
    else
      Result := True;

  // If we catch an exception, we'll just return "error"
  Except
    On Exception do
      Result := False;
  end;
end;


end.
