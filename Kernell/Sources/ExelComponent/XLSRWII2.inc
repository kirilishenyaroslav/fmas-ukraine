{$ifdef ver190}
{$define DELPHI_2006_OR_LATER}
{$define DELPHI_6_OR_LATER}
{$define DELPHI_5_OR_LATER}
{$endif}
{$ifdef ver180}
{$define DELPHI_6_OR_LATER}
{$define DELPHI_5_OR_LATER}
{$endif}
{$ifdef ver170}
{$define DELPHI_6_OR_LATER}
{$define DELPHI_5_OR_LATER}
{$endif}
{$ifdef ver160}  // Delphi8
{$define DELPHI_6_OR_LATER}
{$define DELPHI_5_OR_LATER}
{$endif}                                                                        
{$ifdef ver150}  // Delphi7
{$define DELPHI_6_OR_LATER}
{$define DELPHI_5_OR_LATER}
{$endif}
{$ifdef ver140}  // Delphi6                                             
{$define DELPHI_6_OR_LATER}
{$define DELPHI_5_OR_LATER}
{$endif}
{$ifdef ver130}  // Delphi5
{$define DELPHI_5_OR_LATER}
{$endif}

{$ifdef ver130}
{$define OLD_COMPILER}
{$endif}
{$ifdef ver120}
{$define OLD_COMPILER}
{$endif}

{.$define LINUX}

// Use ZLib to decompress metafile pictures.
// BCB don't seems to have (delphi) zlib installed.
{$ifndef BCB}
  {.$define USE_ZLIB}
{$endif}

// Use TPNGImage in order to store (non-destructive) pictures. Excel only
// accepts bitmaps (BMP) smaller than 32k.
// TPNGImage can be found at: http://pngdelphi.sourceforge.net

// If you install TPNGImage, and receives an error with TByteArray, replace
// the section at line 216 in pngimage.pas with this:
// {$ifndef UseDelphi}
//   TByteArray = Array[Word] of Byte;
//   pByteArray = ^TByteArray;
// {$endif}
{.$define USE_PNGIMAGE}

{.$define USE_JPGIMAGE}

{$define USE_MSSTORAGE}

{.$define NETTEST}

{$ifdef LINUX}
  {$undef USE_MSSTORAGE}
{$endif}

{$ifdef XLSWORKBOOK}
  {$define USE_ZLIB}
  {$define USE_PNGIMAGE}
  {$define USE_JPGIMAGE}
{$endif}
