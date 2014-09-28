unit EZTwain;
{
  XDefs translation of \EZTwain\VC\eztwain.h
}
interface

uses
  Windows, Messages, SysUtils;

type
  HANDLE = Cardinal;
  HCONTAINER = HANDLE;

// EZTWAIN.H - Easy interface to TWAIN library
// Copyright (C) 1999-2006 by Dosadi.  All Rights Reserved.
//
// This interface and the library which implements it, are the property of
// Dosadi and are protected by US and International copyright and trademark
// laws and treaties.  Dosadi strives to make this software both reliable,
// comprehensive, efficient, and affordable.  Do not use this software without
// obtaining a license for your use.
// 
// Sales, support and licensing information at: www.dosadi.com
//




        

function TWAIN_Testing123(s:PChar; n:Integer; h:Cardinal; d:Double; u:Cardinal): Cardinal;
stdcall; external 'Eztwain3.dll'
// Displays a dialog box with the parameter values in it.  Use this to
// test that you can call EZTWAIN and pass parameters correctly.
// It returns the value of the HDIB h parameter.

//--------- Top-Level Calls

function TWAIN_Acquire(hwndApp:HWND): Cardinal;
stdcall; external 'Eztwain3.dll'
// Acquires a single image, from the currently selected Data Source, using
// EZTWAIN's preferred transfer mode.  *Currently the preferred mode is NATIVE*
//
// The parameter is a Win32 Window Handle.  In most applications you
// can use 0 or NULL, but on Citrix and WTS, this must be a top-level window
// or a child of a top level window.
//
// The return value is a handle to global memory containing a DIB - 
// a Device-Independent Bitmap.  Numerous EZTWAIN DIB_xxx functions can
// be used to examine, modify, and save these DIB images.  Remember to
// use TWAIN_FreeNative to free each DIB when you are done with it!
//
// Normally only one image is acquired per call: All Acquire functions shut
// down TWAIN before returning.  Use TWAIN_SetMultiTransfer to change this.
//
// By default, the default data source (DS) is opened, displays its dialog,
// and determines all the parameters of the acquisition and transfer.
// If you want to (try to) hide the DS dialog, see TWAIN_SetHideUI.
// To set acquisition parameters, you need to do something like this:
//     TWAIN_OpenDefaultSource() -or- TWAIN_OpenSource(sourceName)
//     TWAIN_Set*        - one or more capability-setting functions
//     hdib = TWAIN_Acquire(hwnd)
//     if (hdib) then ... process image, TWAIN_FreeNative(hdib); end

procedure TWAIN_FreeNative(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'
// Release the memory allocated to a DIB, as returned by
// TWAIN_AcquireNative. (If you are coding in C or C++, this is just a call
// to GlobalFree.)
// If you use TWAIN_AcquireNative and don't free the returned image handle,
// it stays around taking up Windows (virtual) memory until your application
// terminates.

function TWAIN_SelectImageSource(hwnd:HWND): BOOL;
stdcall; external 'Eztwain3.dll'
// This is the routine to call when the user chooses the "Select Source..."
// menu command from your application's File menu.
// In the standard implementation of "Select Source...", your application
// doesn't need to do anything except make this one call.
// Note: If only one TWAIN device is installed on a system, it is selected
// automatically, so there is no need for the user to do Select Source.
// You should not require your users to do Select Source before Acquire.
//
// This function posts the Source Manager's Select Source dialog box.
// It returns after the user either OK's or CANCEL's that dialog.
// A return of TRUE(1) indicates OK, FALSE(0) indicates one of the following:
//   a) The user cancelled the dialog
//   b) The Source Manager found no data sources installed
//   c) There was a failure before the Select Source dialog could be posted
//
// If you want to be meticulous, disable your "Acquire" and "Select Source"
// menu items or buttons if TWAIN_IsAvailable() returns false - see below.
//
// To enumerate the available data sources, see:
//     TWAIN_GetSourceList and TWAIN_NextSourceName

function TWAIN_AcquireNative(hwndApp:HWND; wPixTypes:Cardinal): Cardinal;
stdcall; external 'Eztwain3.dll'
// Acquires a single image, from the currently selected Data Source, using
// Native Transfer Mode. It waits until the source closes (if it's modal) or
// forces the source closed if not.  The return value is a handle to the
// acquired image.  Only one image can be acquired per call.
//
// The return value is a handle to global memory containing a DIB - 
// a Device-Independent Bitmap.  Numerous EZTWAIN functions can
// be used to examine, modify, and save these DIBs.  Remember to
// use TWAIN_FreeNative to free each DIB when you are done with it,
// these things eat up a lot of memory.
//
// For the 2nd parameter, you can OR or add together the following
// masks to indicate what kind(s) of image you prefer to receive.
// Caution: Some TWAIN devices will ignore your preference here.
// -- If you care, check the parameters of the DIB.

const
        TWAIN_BW = 1;
        TWAIN_GRAY = 2;
        TWAIN_RGB = 4;
        TWAIN_PALETTE = 8;
        TWAIN_CMY = 16;
        TWAIN_CMYK = 32;

        TWAIN_ANYTYPE = 0;

function TWAIN_AcquireToClipboard(hwndApp:HWND; wPixTypes:Cardinal): BOOL;
stdcall; external 'Eztwain3.dll'
// Like AcquireNative, but puts the resulting image, if any, into the
// system clipboard as a CF_DIB item. If this call fails, the clipboard is
// either empty or retains its previous content.
// Returns TRUE(1) for success, FALSE(0) for failure.
//
// Useful for environments like Visual Basic where it is hard to make direct
// use of a DIB handle.  In fact, TWAIN_AcquireToClipboard uses
// TWAIN_AcquireNative for all the hard work.

function TWAIN_AcquireMemory(hwnd:HWND): Cardinal;
stdcall; external 'Eztwain3.dll'
// Like TWAIN_Acquire, but always specifies a 'memory mode' transfer.

// Functions to do a memory transfer in individual blocks:
function TWAIN_BeginAcquireMemory(hwnd:HWND; nRows:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Begin a memory transfer.
// Returns TRUE(1) if the transfer is ready to proceed (using
// TWAIN_AcquireMemoryBlock, below.)
// Returns FALSE(0) if the transfer could not be started for some reason.
//
// Loads TWAIN if necessary, opens the default source if no source is open.
// If it opens a source, it negotiates any 'pending' settings (resolution,
// pixel type, etc.) that were specified before the device was open.
// Enables the device if not already enabled.
// Waits for a 'transfer ready' message from the device.
// Tells the driver to begin transferring in blocks of nRows rows or less.
// If nRows is <= 0, lets the driver pick the optimal block size.

function TWAIN_AcquireMemoryBlock: HANDLE;
stdcall; external 'Eztwain3.dll'
// Acquire the next block of data in a memory transfer.
// If there is an error or there is no more data, returns NULL(0).
// Only valid after a successful call to TWAIN_BeginAcquireMemory (above.)
// Asks the device to deliver another block of pixels, and returns
// those pixels as a DIB represented by its handle.  This is the same
// image format returned by TWAIN_AcquireNative, TWAIN_AcquireMemory, etc.
// See the DIB_* functions for what can be done with the returned handle.

function TWAIN_EndAcquireMemory: BOOL;
stdcall; external 'Eztwain3.dll'
// Clean up after a block-by-block memory transfer.
// Only valid after a successful call to TWAIN_BeginAcquireMemory (above.)
// Frees any temporary storage, and tells the device the transfer
// is over.  In Multi-transfer mode, the device will move to
// State 6 if more images are available, or State 5 if not.
// In single-transfer mode (the default) the device is automatically closed.


function TWAIN_AcquireToFilename(hwndApp:HWND; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Acquire an image and save it to a file.
// If pszFile is NULL or an empty string, the user is prompted for
// the file name using a standard Save File dialog.
//
// The minimal use of EZTwain is to call this function with both arguments NULL (0).
//
// If the filename passed as a parameter or entered by the user contains a
// standard extension (.bmp, .jpg/.jpeg, .tif/.tiff, .png, .pdf, .gif, .dcx)
// then the file is saved in the implied format.
// Otherwise the file is saved in the current SaveFormat - see TWAIN_SetSaveFormat.

// See also TWAIN_AcquireFile below.
//
// Return values:
//   0  success.
//  -1  the Acquire failed.
//  -2  file open error (invalid path or name, or access denied)
//  -3  invalid DIB, or image incompatible with file format, or...
//  -4  writing failed, possibly output device is full.
// -10  user cancelled File Save dialog


function TWAIN_AcquireMultipageFile(hwndApp:HWND; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Similar to TWAIN_AcquireToFilename above, but will transfer
// multiple pages.  If the filename ends with ".tif", ".tiff", or
// ".mpt" the file is written in TIFF format.  If the filename ends
// with ".pdf" the file is written in PDF format.  Otherwise, the
// default file format is TIFF (multi-page tiff), which can be
// overridden with SetMultipageFormat.
// If pszFile is NULL or points to the null string, the user will
// be prompted for the filename.
//
// The function TWAIN_MultipageCount can be called during or after
// writing a multipage file, it reports the number of scans written to the file.
//
// Return values:
//   0  success
//  -1  the Acquire failed, or the device closed or quit after 0 pages.
//  -2  file open error (invalid path or name, or access denied)
//  -3  could not load file-format module (EZTiff.dll or EZPdf.dll)
//      Either the DLL was not found, or the version is out-of-date,
//      For PDF output, EZJpeg.dll is also required.
//      Less likely: The device returned an invalid DIB handle, or
//      the transferred image has a bit depth of 9..15 bits per pixel (??)
//  -4  writing failed, possibly output device is full.
//  -7  Multipage support is not installed.
// -10  user cancelled - This can be during the filename prompt, if you
//      did not supply a filename, or it can be when the scanner dialog
//      is first displayed.  If the scanner dialog is visible, the user
//      can cancel during a scan and the dialog will just stay open (usually)
//      allowing another try.  If the user cancelled the scan dialog,
//      TWAIN_LastErrorCode will be EZTEC_USER_CANCEL.
//
// This function respects TWAIN_SetHideUI as follows:
// If SetHideUI(1), then the device UI is hidden, AcquireMultipageFile
// will transfer images until the device indicates that it has no
// more images ready.  (Technically, it goes to State 5).
// If SetHideUI(0) [the default case] then the device UI is shown,
// and AcquireMultipageFile will transfer images until the user
// closes the device dialog.
//
// This function respects SetMultiTransfer() as follows:
// If SetMultiTransfer(1), the DS is left open on return.
// Otherwise (the default case), the DS is closed and TWAIN is unloaded.
//
// If you want to set scanning parameters (resolution, pixeltype...)
// first open the source (see OpenDefaultSource or OpenSource)
// then negotiate the settings using the Capability functions, and
// then call AcquireMultipageFile.
//
// Caution: It is not recommended to use this function on webcams
// if the UI is hidden.  Some will crash, others may supply images
// endlessly (until disk full.)

function TWAIN_SetDefaultScanAnotherPagePrompt(fYes:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Controls an aspect of TWAIN_AcquireMultipageFile - When used
// with a non-feeder device, with UI suppressed, that function
// asks the user if they want to scan another page, [Yes] or [No].
// This function controls which answer is the default:
// fYes = 1         [Yes] is the default button/answer*
// fYes = 0         [No] is the default button/answer.
//
// * EZTwain initial setting.
//  
// Return value: Previous value of the setting.

function TWAIN_AcquireFile(hwndApp:HWND; nFF:Integer; sFile:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Acquire an image directly to a file, using the given format and filepath.
// * Unlike AcquireToFilename, this function uses TWAIN File Transfer Mode.
// * The image is written to disk by the Data Source, not by EZTWAIN.
// * Warning: This mode is -not- supported by all TWAIN devices.
// 
// Use TWAIN_SupportsFileXfer to see if the open DS supports File Transfer.
//
// You can use TWAIN_Get(ICAP_IMAGEFILEFORMAT) to get an enumeration of
// the available file formats, and CONTAINER_ContainsValue to check for
// a particular format you are interested in.
//
// nFF can be any file format supported by the DS, see the TWFF_* constants
// in twain.h for the list of allowed formats.  A compliant DS should
// at least support TWFF_BMP, but as usual there are no guarantees.
//
// If pszFile is NULL or an empty string, the user is prompted for
// the file name in a standard Save File dialog.
//
// Return values (N.B. A Boolean, not an error code like AcquireToFilename!)
//  TRUE(1) for success
//  FALSE(0) for failure - use GetResultCode/GetConditionCode for details.
//  If the user cancels the Save File dialog, the result code is TWRC_CANCEL

function TWAIN_DoSettingsDialog(hwnd:HWND): Integer;
stdcall; external 'Eztwain3.dll'
// Run the device's settings dialog, if this is supported, and return
// when the user closes the dialog.  See return codes below.
//
// If a device is open, work with that device.  If no device is currently
// open, work with the default device.  (See GetDefaultSourceName)
// This is an *optional* TWAIN feature - To check if a device supports this,
// open the device and call TWAIN_GetCapBool(CAP_ENABLEDSUIONLY, FALSE) -
// if that call returns TRUE(1) then this feature is supported.
// Return values:
//    1     dialog was displayed and user clicked OK
//    0     dialog was displayed and user clicked Cancel
//   -1     dialog not displayed - some error.  Call LastErrorCode,
//          ReportLastError, or similar function for more details.

function TWAIN_EnableSourceUiOnly(hwnd:HWND): BOOL;
stdcall; external 'Eztwain3.dll'
// The underlying 'asynchronous' function for TWAIN_DoSettingsDialog.
// Opens the device's settings dialog, if this is supported.
// Returns TRUE (1) if successful, FALSE (0) otherwise.
// NOTE: If successful, this call leaves the dialog open, so your
// program must run a message pump at least until the user closes it.
// If you don't understand what that means, don't call this guy.

//--------- Global Options

procedure TWAIN_SetMultiTransfer(bYes:BOOL);
stdcall; external 'Eztwain3.dll'
function TWAIN_GetMultiTransfer: BOOL;
stdcall; external 'Eztwain3.dll'
// This function controls the 'multiple transfers' flag.
// By default, this feature is set to FALSE (0).
//
// If this flag is zero, the input device is closed when
// any TWAIN_AcquireXXX function finishes.
//
// If this flag is non-zero: After an Acquire, the input device
// is not closed, but is left open to allow additional images
// to be acquired.  In this case the programmer should
// close the input device after all images have been
// transferred, by calling either
//     TWAIN_CloseSource or
//     TWAIN_UnloadSourceManager
//
// See also: TWAIN_UserClosedSource()

function TWAIN_WaitForImage(hwnd:HWND): BOOL;
stdcall; external 'Eztwain3.dll'
// ** Experimental - Use with caution **
//
// Returns TRUE(1) if TWAIN device is ready to deliver an image.
//   -- TWAIN_State() will be 6 in this case.
// Returns FALSE(1) if the application should stop acquiring and close the DS.
//
// If no device is open, the default device is opened.
// If the device is interacting with the user, waits for the user
// to either start a transfer, or close the device dialog.
// This function is primarily useful for multiple transfers, in loops like:
//     IF TWAIN_OpenDefaultSource() AND NegotiateSettings() THEN
//         WHILE TWAIN_WaitForImage(hwnd)
//             TWAIN_AcquireToFilename(hwnd, filename)
//             increment(filename)
//         END WHILE
//         TWAIN_CloseSource()
//     END IF

procedure TWAIN_SetHideUI(bHide:BOOL);
stdcall; external 'Eztwain3.dll'
function TWAIN_GetHideUI: BOOL;
stdcall; external 'Eztwain3.dll'
// These functions control the 'hide source user interface' flag.
// This flag is cleared initially, but if you set it non-zero, then when
// a device is enabled it will be asked to hide its user interface.
// Note that this is only a request - some devices will ignore it!
// This affects AcquireNative, AcquireToClipboard, and EnableSource.
// If the user interface is hidden, you will probably want to set at least
// some of the basic acquisition parameters yourself - see
// SetUnits, SetPixelType, SetBitDepth and SetResolution below.
// See also: HasControllableUI

procedure TWAIN_DisableParent(bYes:BOOL);
stdcall; external 'Eztwain3.dll'
function TWAIN_GetDisableParent: BOOL;
stdcall; external 'Eztwain3.dll'
// Set or get the "DisableParent" flag.
// When this flag is set (non-zero), EZTwain attempts to
// disable the parent window during any Acquire function.
// (The parent window is the window you pass to the Acquire function.
// Typically this is your main application window or dialog.)
// This flag is TRUE (1) by default.
//
// Note 1: If you set this to FALSE, your window can receive user input while
// an Acquire is in progress, and your code must be prepared for this.
// Note 2: Some TWAIN data sources will disable the parent window on their
// own, and EZTWAIN cannot prevent this.

procedure TWAIN_SetAutoNegate(bYes:BOOL);
stdcall; external 'Eztwain3.dll'
function TWAIN_GetAutoNegate: BOOL;
stdcall; external 'Eztwain3.dll'
// Set or get the "AutoNegate" flag: When this flag is set (non-zero)
// EZTwain automatically 'negates' any B&W scanned image that is > 80% black
// i.e. it exchanges black & white in the image.
// This flag is TRUE (1) by default.

//--------- Basic TWAIN Inquiries

function TWAIN_EasyVersion: Integer;
stdcall; external 'Eztwain3.dll'
// Returns the version number of EZTWAIN.DLL, multiplied by 100.
// So e.g. version 2.01 will return 201 from this call.
function TWAIN_EasyBuild: Integer;
stdcall; external 'Eztwain3.dll'
// Returns the build number within the version.

function TWAIN_IsAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// Call this function any time to find out if TWAIN is installed on the
// system.  It takes a little time on the first call, after that it's fast,
// just testing a flag.  It returns 1 if the TWAIN Source Manager is
// installed & can be loaded, 0 otherwise. 

function TWAIN_IsMultipageAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if EZTwain 'multipage' services are installed.
// This allows writing of multipage TIFF (if TIFF is available)
// and multipage PDF (if PDF is available).
// It also enables TWAIN_AcquireMultipageFile

function TWAIN_State: Integer;
stdcall; external 'Eztwain3.dll'
// Returns the TWAIN Protocol State per the spec.
const
        TWAIN_PRESESSION = 1;
        TWAIN_SM_LOADED = 2;
        TWAIN_SM_OPEN = 3;
        TWAIN_SOURCE_OPEN = 4;
        TWAIN_SOURCE_ENABLED = 5;
        TWAIN_TRANSFER_READY = 6;
        TWAIN_TRANSFERRING = 7;

function TWAIN_SourceName: PChar;
stdcall; external 'Eztwain3.dll'
// Returns a pointer to the name of the currently or last opened source.
// Note: Even on NT or other Unicode-enabled platform, this is still
// a pointer to an 8-bit ANSI string.

procedure TWAIN_GetSourceName(sName:PChar);
stdcall; external 'Eztwain3.dll'
// Like TWAIN_SourceName, but copies current/last source name into its parameter.
// The parameter is a string variable (char array in C/C++).
// You are responsible for allocating room for 33 8-bit characters
// in the string variable before calling this function.

//--------- DIB handling utilities ---------

procedure DIB_SetResolution(hdib:Cardinal; xdpi:Double; ydpi:Double);
stdcall; external 'Eztwain3.dll'
procedure DIB_SetResolutionInt(hdib:Cardinal; xdpi:Integer; ydpi:Integer);
stdcall; external 'Eztwain3.dll'
// Sets the horizontal and vertical resolution of the DIB.

function DIB_XResolution(hdib:Cardinal): Double;
stdcall; external 'Eztwain3.dll'
// Horizontal (x) resolution of DIB, in DPI (dots per inch)
function DIB_YResolution(hdib:Cardinal): Double;
stdcall; external 'Eztwain3.dll'
// Vertical (y) resolution of DIB, in DPI (dots per inch)

function DIB_Depth(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Depth of DIB, in bits i.e. bits per pixel

function DIB_PixelType(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// TWAIN PixelType that describes this DIB: TWPT_BW, TWPT_GRAY, TWPT_RGB,
// TWPT_PALETTE, TWPT_CMYK, TWPT_CMY, etc.

function DIB_Width(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Width of DIB, in pixels (columns)
function DIB_Height(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Height of DIB, in lines (rows)

function DIB_RowBytes(hdib:Cardinal): Cardinal;
stdcall; external 'Eztwain3.dll'
// Number of bytes needed to store one row of the DIB.

function DIB_ColorCount(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Number of colors in color table of DIB.
// Primarily useful for B&W, gray, and palette images.
// 16-bit gray, RGB, CMY & CMYK images have no color table: DIB_ColorCount returns 0

function DIB_SamplesPerPixel(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Number of 'samples' or components or color channels in each pixel.
// B&W and gray pixels have 1 sample, RGB and CMY have 3.
// CMYK has 4, and palette-color images are treated as having 3 channels.

function DIB_BitsPerSample(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Number of bits per 'channel'.  For B&W and gray images this is
// the same as the DIB_Depth, because those formats have only one channel.
// For palette images, this will be 8, because the color values in a
// palette image are stored with 8 bits each for R, G, and B.
// For RGB, CMY, and CMYK images, this function returns the number of bits
// used to represent each color channel or component - almost always 8, but
// EZTwain has a limited ability to handle 16-bit per channel images.


function DIB_Size(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Return the size in memory of the given DIB.

procedure DIB_ReadData(hdib:Cardinal; pdata:Pointer; nbMax:Integer);
stdcall; external 'Eztwain3.dll'
// Read up to nbMax bytes from the given DIB into the given buffer.
// The data is read 'verbatim' from the first byte of the DIB.
// To read pixel data, see DIB_ReadRowxxx below.

procedure DIB_ReadRow(hdib:Cardinal; n:Integer; prow:Pointer);
stdcall; external 'Eztwain3.dll'
procedure DIB_ReadRowRGB(hdib:Cardinal; n:Integer; prow:Pointer);
stdcall; external 'Eztwain3.dll'
procedure DIB_ReadRowGray(hdib:Cardinal; n:Integer; prow:Pointer);
stdcall; external 'Eztwain3.dll'
// Read row (or column) n of the given DIB into buffer at prow.
// Caller is responsible for ensuring buffer is large enough.
// Row 0 is the *top* row of the image, as it would be displayed.
// The first variant reads the data as-is from the DIB, including
// BGR pixels from 24-bit DIBs, or packed 1-bit, 4-bit or 8-bit.
// The RGB variant unpacks every DIB pixel into 3-byte RGB pixels.
// The Gray variant converts every pixel to its 8-bit gray value.

procedure DIB_WriteRow(hdib:Cardinal; r:Integer; pdata:Pointer);
stdcall; external 'Eztwain3.dll'
// Write data from buffer into row r of the given DIB.
// Caller is responsible for ensuring buffer and row exist, etc.
procedure DIB_WriteRowChannel(hdib:Cardinal; r:Integer; pdata:Pointer; nChannel:Integer);
stdcall; external 'Eztwain3.dll'
// Write data from buffer into one color channel of row r of the given DIB.
// Channels are: 0=Red, 1=Green, 2=Blue.  If the DIB depth < 24, acts like WriteRow.

// Safe versions of ReadRow and WriteRow, handy for .NET languages
procedure DIB_WriteRowSafe(hdib:HANDLE; r:Integer; pdata:Pointer; nbMax:Integer);
stdcall; external 'Eztwain3.dll'
procedure DIB_ReadRowSafe(hdib:HANDLE; nRow:Integer; prow:Pointer; nbMax:Integer);
stdcall; external 'Eztwain3.dll'

function DIB_Allocate(nDepth:Integer; nWidth:Integer; nHeight:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Create a DIB with the given dimensions.  Resolution is set to 0.  A default
// color table is provided if depth <= 8.
// The image data is uninitialized i.e. garbage.

function DIB_Create(nPixelType:Integer; nWidth:Integer; nHeight:Integer; nDepth:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Create a DIB of the given pixel type and dimensions.
// If nDepth <= 0, uses the default depth for the given pixel type.
// Resolution is set to 0.
// For TWPT_GRAY images, a standard black-to-white color table is set.
// For TWPT_PALETTE images, a Windows-standard 256-entry color table is set.

procedure DIB_Free(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'
// Release the storage of the DIB.

function DIB_Copy(hdib:Cardinal): Cardinal;
stdcall; external 'Eztwain3.dll'
// Create and return a byte-for-byte copy of a DIB.

function DIB_Equal(hdib1:Cardinal; hdib2:Cardinal): BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if the two dibs are valid, have the same parameters,
// and are the same color pixel-for-pixel.

function DIB_MaxError(hdib1:Cardinal; hdib2:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// return the largest difference between two samples in the two images.

procedure DIB_SetGrayColorTable(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'
// Fill the DIB's color table with a gray ramp - so color 0 is black, and
// the last color (largest pixel value) is white.  No effect if depth > 8.
procedure DIB_SetColorTableRGB(hdib:Cardinal; i:Integer; R:Integer; G:Integer; B:Integer);
stdcall; external 'Eztwain3.dll'
// Set the ith entry in the DIB's color table to the specified color.
// R G and B range from 0 to 255.

function DIB_IsVanilla(hdib:Cardinal): BOOL;
stdcall; external 'Eztwain3.dll'
// TRUE if in this DIB, pixel value 0 means 'white'.
function DIB_IsChocolate(hdib:Cardinal): BOOL;
stdcall; external 'Eztwain3.dll'
// TRUE if in this DIB, pixel value 0 means 'black'.

function DIB_ColorTableR(hdib:Cardinal; i:Integer): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_ColorTableG(hdib:Cardinal; i:Integer): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_ColorTableB(hdib:Cardinal; i:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Return the R,G, or B component of the ith color table entry of a DIB.
// If i < 0 or >= DIB_ColorCount(hdib), returns 0.

procedure DIB_FlipVertical(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'
// Flip (mirror) the bitmap vertically.
// Top and bottom rows are exchanged, etc.

procedure DIB_FlipHorizontal(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'
// Flip (mirror) the bitmap horizontally.
// Leftmost pixels become rightmost, etc.

procedure DIB_Rotate180(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'
// Rotate image 180 degrees

function DIB_Rotate90(hOld:Cardinal; nSteps:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Return a copy of hOld rotated clockwise nSteps * 90 degrees.
// If nSteps is 0, the result is a copy of hOld.
// Negative values of nSteps rotate counterclockwise.
// Note that *hOld is not destroyed*

procedure DIB_Fill(hdib:Cardinal; R:Integer; G:Integer; B:Integer);
stdcall; external 'Eztwain3.dll'
// Fill the DIB with the specified color

procedure DIB_Negate(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'

procedure DIB_AdjustBC(hdib:Cardinal; nB:Integer; nC:Integer);
stdcall; external 'Eztwain3.dll'
// *** BETA - new in 3.08b8 - use with caution.
// Adjust the brightness and/or contrast of the image.
// nB and nC are -1000 to 1000, with a value of 0 meaning 'no change'.
// Positive nB push all pixels toward white, negative toward black.
// Positive nC push all pixels away from mid-value, toward black and white.
// Negative nC pushes all pixels toward the mid-value.
// Works on grayscale, RGB, CMY(K) images - no effect on B&W and palette.

function DIB_AutoContrast(hdib:Cardinal): BOOL;
stdcall; external 'Eztwain3.dll'
// Automatically adjust the values in the image to make
// the dominant light color into white, and the primary dark tone into black.

procedure DIB_Convolve(hdibDst:Cardinal; hdibKernel:Cardinal; dNorm:Double; nOffset:Integer);
stdcall; external 'Eztwain3.dll'
// Apply hdibKernel as a convolution kernel to hdibDst.
// At each pixel in hdibDst, hdibKernel is convolved with the neighborhood
// and the result is stored back into hdibDst.
// The point value of the convolution is normalized by dividing by dNorm, and
// then nOffset is added, before clipping to the pixel range of hdibDst.

procedure DIB_Correlate(hdibDst:Cardinal; hdibKernel:Cardinal);
stdcall; external 'Eztwain3.dll'
// Similar to DIB_Convolve, but performs a correlation between hdibDst and hdibKernel,
// assuming that hdibKernel is image data (preferably grayscale), and putting
// the result into hdibDst.

procedure DIB_CrossCorrelate(hdibDst:Cardinal; hdibTemplate:Cardinal; dScale:Double; nMin:Integer);
stdcall; external 'Eztwain3.dll'
// Similar to DIB_Convolve, but performs a cross-correlation between hdibDst and hdibTemplate,
// assuming that hdibTemplate is grayscale image data, and putting
// the result into hdibDst.  In the output, a value of 255 signifies perfect correlation,
// 0 signifies perfect non-correlation (actually, a perfect opposite).
// All output values are divided by dScale.
// If nMin > 0, the correlation at each output pixel stops as soon as the value at that
// pixel is known to be <= nMin.  If you know that the values of interest are (say) > 200,
// setting a dMin of 128 can speed up the correlation greatly.

procedure DIB_HorizontalDifference(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'

procedure DIB_HorizontalCorrelation(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'
procedure DIB_VerticalCorrelation(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'

procedure DIB_MedianFilter(hdib:Cardinal; W:Integer; H:Integer; nStyle:Integer);
stdcall; external 'Eztwain3.dll'
// Apply a median filter to hdib using an W x H neighborhood.
// nStyle is currently ignored, but should be 0 for future compatibility.

procedure DIB_Average(hdib:Cardinal; W:Integer; H:Integer);
stdcall; external 'Eztwain3.dll'
// Replace each pixel with the average of a W x H pixel neighborhood.

procedure DIB_Smooth(hdib:Cardinal; sigma:Double; opacity:Double);
stdcall; external 'Eztwain3.dll'
// Apply a (gaussian) smoothing filter to the image.
// sigma is the controlling parameter of the Gaussian
// G(x,y) = exp(-(x^2+y^2) / 2*sigma^2) / (2 * pi * sigma^2)
// opacity is the fraction of the filter output that is blended
// back into the image i.e. out = in*(1-opacity) + f(in)*opacity

function DIB_ScaledCopy(hOld:Cardinal; w:Integer; h:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Create and return a new DIB - which is a copy of hOld
// but scaled (resampled) to have width w and height h.
// This only works on 24-bit color and 8-bit grayscale
// images, other input will cause the function to fail
// and return NULL.  Don't forget to DIB_Free the old
// DIB when you are done with it.

function DIB_RegionCopy(hOld:Cardinal; x:Integer; y:Integer; w:Integer; h:Integer; FillByte:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Create and return a portion of DIB hOld.  The copied region is a rectangle
// w pixels wide, h pixels high, starting at (x, y) in the hOld image,
// where (0,0) is the upper-left corner of hOld, visually.
// Pixels that don't fit into the new DIB are discarded.
// (So this function can be used to crop an image.)
// If the new DIB is taller or wider than the old, the new
// pixels are filled with bytes = fill.  Common values for
// fill are:
//      -1 (or 255 or 0xFF) which fills with 1's producing white
//   0 which produces black fill.

function DIB_AutoCrop(hOld:Cardinal; nOptions:Integer): HANDLE;
stdcall; external 'Eztwain3.dll'
// Return a copy of the image in hOld, with the surrounding border
// of uniform color (if there is one) removed.
// Uses RegionCopy (above).
// After this call, remember to DIB_Free(hOld) if you don't need it.
// nOptions is currently unused and must be 0 (zero).

function DIB_GetCropRect(hdib:Cardinal; nOptions:Integer; var x:Integer; var y:Integer; var w:Integer; var h:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Return a suggested crop rectangle to remove a dark border from the image.
// The rectangle is defined by an upper-left point and a width and height, in pixels.
// (As needed by DIB_RegionCopy above.)
// nOptions is currently unused and must be 0.
// DIB_AutoCrop uses this function to decide what to crop.
// A return of FALSE means no crop rectangle was found - generally this means
// that the image has content that extends to the edges, or has no definite borders
// of dark color.  For convenience, when this function returns FALSE it
// sets x, y, w and h to specify the entire image.

function DIB_AutoDeskew(hOld:Cardinal; nOptions:Integer): HANDLE;
stdcall; external 'Eztwain3.dll'
// Returns a copy of the image in hOld, possibly 'deskewed'.
// If it can be determined that the input image is consistently
// skewed (rotated by a small angle) then the returned image is rotated
// to eliminate that skew.
// The depth and pixel type of the image are not changed.
// The dimensions of the returned image may be slightly changed.
// nOptions is currently unused and must be 0 (zero).

function DIB_ConvertToPixelType(hOld:Cardinal; nPT:Integer): HANDLE;
stdcall; external 'Eztwain3.dll'
// Create and return a new DIB containing the hOld image converted
// to the specified pixel type.  Supported pixel types are:
// TWPT_BW, TWPT_GRAY, TWPT_RGB, TWPT_PALETTE, TWPT_CMY or TWPT_CMYK.
// When converting to black & white (TWPT_BW) the default conversion
// is simple thresholding - each pixel is converted to grayscale,
// then values 0..127 => Black, 128..255 => White.

function DIB_ConvertToFormat(hOld:Cardinal; nPT:Integer; nBPP:Integer): HANDLE;
stdcall; external 'Eztwain3.dll'
// Create and return a new DIB containing the hOld image converted
// to the specified pixel type and bits per pixel.
// Unsupported and impossible combinations cause a NULL return.

function DIB_SetConversionThreshold(nT:Integer): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_ConversionThreshold: Integer;
stdcall; external 'Eztwain3.dll'
// Set/Get the threshold used by DIB_ConvertToPixelType above
// when converting to B&W.  The default value is 128 which means '50%'.
// Pixels lighter than 50% => white, darker => black.
// DIB_SetConversionThreshold returns the previous value of the threshold.

procedure DIB_SetConversionColorCount(n:Integer);
stdcall; external 'Eztwain3.dll'
function DIB_ConversionColorCount: Integer;
stdcall; external 'Eztwain3.dll'
// Set/Get the number of colors that will be used in the next
// call to DIB_ConvertToPixelType or DIB_ConvertToFormat, if
// the output type is TWPT_PALETTE.

function DIB_ScaleToGray(hdibOld:Cardinal; nRatio:Integer): HANDLE;
stdcall; external 'Eztwain3.dll'
// Create and return a new DIB containing the hdibOld image
// converted to grayscale and reduced in width & height by nRatio.
// Works well on B&W images.

function DIB_Thumbnail(hdibSource:Cardinal; MaxWidth:Integer; MaxHeight:Integer): HANDLE;
stdcall; external 'Eztwain3.dll'
// Return a DIB containing a copy of hdibSource, scaled so that its width
// is no more than MaxWidth, and height is no more than MaxHeight.
// B&W images are converted to grayscale thumbnails.
// Remember to DIB_Free hdibSource and the thumbnail, when you are done with them.

procedure DIB_SwapRedBlue(hdib:Cardinal);
stdcall; external 'Eztwain3.dll'
// For 24-bit DIB only, exchange R and B components of each pixel.

function DIB_CreatePalette(hdib:Cardinal): HPALETTE;
stdcall; external 'Eztwain3.dll'
// Create and return a logical palette to be used for drawing the DIB.
// For 1, 4, and 8-bit DIBs the palette contains the DIB color table.
// For 24-bit DIBs, a default halftone palette is returned.

procedure DIB_SetColorModel(hdib:Cardinal; nCM:Integer);
stdcall; external 'Eztwain3.dll'
function DIB_ColorModel(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
const
        EZT_CM_RGB = 0;
        EZT_CM_GRAY = 3;

procedure DIB_SetColorCount(hdib:Cardinal; n:Integer);
stdcall; external 'Eztwain3.dll'

procedure DIB_Blt(hdibDst:Cardinal; dx:Integer; dy:Integer; hdibSrc:Cardinal; sx:Integer; sy:Integer; w:Integer; h:Integer; uRop:Cardinal);
stdcall; external 'Eztwain3.dll'
// Transfer pixels from hdibSrc into hdibDst, starting at
// (dx,dy) in the destination, and (sx,sy) in the source,
// and transferring w columns x h rows.
// Any pixels that fall outside the actual bounds of the source
// and destination DIBs are ignored.
// The operations available are:
const
        EZT_ROP_COPY = 0;
        EZT_ROP_OR = 1;
        EZT_ROP_AND = 2;
        EZT_ROP_XOR = 3;
        EZT_ROP_ANDNOT = $12;

procedure DIB_BltMask(hdibDst:Cardinal; dx:Integer; dy:Integer; hdibSrc:Cardinal; sx:Integer; sy:Integer; w:Integer; h:Integer; uRop:Cardinal; hdibMask:Cardinal);
stdcall; external 'Eztwain3.dll'
// Like DIB_Blt, but hdibMask contains an 8-bit alpha mask that controls
// how hdibSrc and hdibDst pixels are blended.  hdibMask must be the
// same size as hdibSrc, and be 8-bits deep.
// NOTE: The only uRop currently supported is EZT_ROP_COPY

procedure DIB_PaintMask(hdibDst:Cardinal; dx:Integer; dy:Integer; R:Integer; G:Integer; B:Integer; sx:Integer; sy:Integer; w:Integer; h:Integer; uRop:Cardinal; hdibMask:Cardinal);
stdcall; external 'Eztwain3.dll'
// Like DIB_BltMask - but paints a solid color into the destination DIB
// using hdibMask as a mask or stencil.  The mask must be an 8-bit
// grayscale image. The each mask pixel controls how much paint is mixed
// into the corresponding destination pixel: white=100%, black=0%.
// if w == -1 or h == -1 it means "as much as possible"
// NOTE: The only uRop currently supported is EZT_ROP_COPY
// See the User Guide for details.

procedure DIB_DrawLine(hdibDst:Cardinal; x1:Integer; y1:Integer; x2:Integer; y2:Integer; R:Integer; G:Integer; B:Integer);
stdcall; external 'Eztwain3.dll'

procedure DIB_DrawText(hdibDst:Cardinal; sText:PChar; x:Integer; y:Integer; w:Integer; h:Integer);
stdcall; external 'Eztwain3.dll'
// Draw the text string into the DIB inside the given rectangle (x, y, w, h)
// If w or h is 0, the rectangle is extended to the bottom or right of the DIB.
// Default height is 14 pixels.  Default typeface is "Arial".
// Default color is black (R=G=B=0)
// See the following functions to override the default text settings.

// The following functions modify the default settings for DIB_DrawText:
procedure DIB_SetTextColor(R:Integer; G:Integer; B:Integer);
stdcall; external 'Eztwain3.dll'

procedure DIB_SetTextAngle(nDegrees:Integer);
stdcall; external 'Eztwain3.dll'
// Set the rotation of text within the drawing rectangle, clockwise.
// NOTE: Currently only multiples of 90 degrees are supported.

procedure DIB_SetTextHeight(nH:Integer);
stdcall; external 'Eztwain3.dll'
// Set the text character height in pixels.
// If you want to set the text height in physical units (inches)
// multiply the physical height in inches by the DIB_YResolution.
// Note! Some files have resolution=0, which can often be treated as 72dpi

procedure DIB_SetTextFace(sTypeface:PChar);
stdcall; external 'Eztwain3.dll'
// Specify a typeface - Use a typeface that is available on the host system,
// or use a standard face such as Arial, MS San Serif, MS Serif.
// You can also specify "Courier" or "Times" as shortcuts for the classic
// fixed-width and serif fonts.

procedure DIB_SetTextFormat(nFlags:Integer);
stdcall; external 'Eztwain3.dll'
// Sets text format according to the following flags.  The default
// format is normal, top, left
const
        EZT_TEXT_NORMAL = $0;
        EZT_TEXT_BOLD = $1;
        EZT_TEXT_ITALIC = $2;
        EZT_TEXT_UNDERLINE = $4;
        EZT_TEXT_STRIKEOUT = $8;
        EZT_TEXT_BOTTOM = $100;
        EZT_TEXT_VCENTER = $200;
        EZT_TEXT_TOP = $0;
        EZT_TEXT_LEFT = $0;
        EZT_TEXT_CENTER = $1000;
        EZT_TEXT_RIGHT = $2000;
        EZT_TEXT_WRAP = $4000;


function DIB_View(hdib:Cardinal; sTitle:PChar; hwndParent:HWND): Integer;
stdcall; external 'Eztwain3.dll'
// Display the given image in a pop-up window with the given title.
// hwndParent is the window handle of the parent window - if you
// use 0 (NULL) for this parameter, EZTwain uses the active window
// of the application if there is one, or no parent window.
// By default, the window contains just an [OK] button.
// The style of the window is a resizable dialog box.
// 0    = the [Cancel] button was pressed.
// 1    = the [OK] button was pressed.

function DIB_ViewClose: Integer;
stdcall; external 'Eztwain3.dll'

procedure DIB_DrawToDC(hdib:Cardinal; hDC:HDC; dx:Integer; dy:Integer; w:Integer; h:Integer; sx:Integer; sy:Integer);
stdcall; external 'Eztwain3.dll'
// Draws DIB on a device context.
// You should call CreateDibPalette, select that palette
// into the DC, and do a RealizePalette(hDC) first.

///////////////////////////////////////////////////////////////////////
// Printing services

function DIB_SpecifyPrinter(sPrinterName:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Specify the printer to be used when printing to the 'default printer'
// with the following functions.
// This does not change the user's default printer - it just tells
// EZTwain which printer to use as 'default'.
// Setting the printer name to NULL or the empty string tells EZTwain to
// use the user's default printer as its default printer.

function DIB_EnumeratePrinters: Integer;
stdcall; external 'Eztwain3.dll'
// Return the number of available printers

function DIB_PrinterName(i:Integer): PChar;
stdcall; external 'Eztwain3.dll'
// Return the name of the ith available printer, as found
// by a previous call to DIB_EnumeratePrinters.

function DIB_GetPrinterName(i:Integer; PrinterName:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Get the name of the ith available printer, as found by a previous
// call to DIB_EnumeratePrinters.
// You must allocate 256 characters for the printer name, and in many
// languages (especially Basic dialects) you must initialize the
// PrinterName variable with 256 spaces.

procedure DIB_SetPrintToFit(bYes:BOOL);
stdcall; external 'Eztwain3.dll'
function DIB_GetPrintToFit: BOOL;
stdcall; external 'Eztwain3.dll'
// Get/Set the 'Print To Fit' flag.
// When this flag is non-zero, EZTwain reduces the size of images
// to fit within the printer page.  This only affects images that
// are too large to fit on the page.
// By default, this flag is FALSE (0)

function DIB_Print(hdib:Cardinal; sJobname:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Prompt the user with a Print Dialog, then print the DIB.
// Normally prints the DIB at 'actual size' - meaning the resolution
// values are used to convert the width and height from pixels to physical
// units (e.g. inches.)
// If the PrintToFit flag (see DIB_SetPrintToFit) is set and the image
// is larger than the printer page, the image is scaled to fit on the page.
// If the DIB has resolution values of 0, 72 DPI is assumed.
// The image is printed centered on the page.
// Return values:
//   0  success, no error
//  -2  specified printer not recognized or could not be opened
//  -3  invalid DIB handle (null, or DIB has been freed, or isn't a DIB handle)
//  -4  could not start document or start page - error during printing
//  -5  DIB_PrintPage called without prior successful DIB_PrintJobBegin.
// -10  user cancelled a dialog (probably the Print dialog)

function DIB_PrintNoPrompt(hdib:Cardinal; sJobname:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Identical to DIB_Print, but prints on the default printer with
// default settings - the user is not prompted.

// Printing - Multi-Page
//
function DIB_PrintJobBegin(sJobname:PChar; bUseDefaultPrinter:BOOL): Integer;
stdcall; external 'Eztwain3.dll'
// Begin a multi-page print job
// Jobname is the name of the print job, this appears in
// the print queue, and in some environments a job-separator
// page with this name on it is printed ahead of the job.
// If Jobname is null or empty, the application title is used.
// (See TWAIN_SetAppTitle)
// If bUseDefaultPrinter is non-zero (true) the default printer
// is used, otherwise the user is prompted to select the printer.
// If a print job is open, DIB_PrintJobEnd() is called to close it.
//
// Return values:
//  0       success
// -2       could not open/access printer
// -4       printing output error
//-10       user cancelled Print dialog

function DIB_PrintPage(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Print a page as part of the current job.
// See DIB_Print for more details.
//  0       success
// -3       the DIB is null or invalid
// -4       printing output error
// -5       no print job is open

function DIB_PrintJobEnd: Integer;
stdcall; external 'Eztwain3.dll'
// End the current print job and release it for printing.
// (Some environments will start printing as soon as a page is available.)
//  0       success
// -4       printing output error
// -5       no print job is open

///////////////////////////////////////////////////////////////////////
// Clipboard functions
//
function DIB_PutOnClipboard(hdib:Cardinal): BOOL;
stdcall; external 'Eztwain3.dll'
// Place DIB on the clipboard (format CF_DIB)
// ** IMPORTANT ** After this call, the clipboard owns the
// DIB and you do not - do not attempt any
// further operations on the hdib handle.
// Treat this call just as you would a call to DIB_Free.
// Returns TRUE(1) for success, FALSE(0) otherwise.

function DIB_CanGetFromClipboard: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE(1) if there is something on the clipboard that
// can be delivered as a DIB (by DIB_GetFromClipboard below.)
// Return FALSE(0) if not.

function DIB_GetFromClipboard: Cardinal;
stdcall; external 'Eztwain3.dll'
function DIB_FromClipboard: Cardinal;
stdcall; external 'Eztwain3.dll'
// Create and return a DIB with the contents of the clipboard.
// This is the first step of a 'paste' function for images.
// Returns NULL in case of error, or if no image on clipboard.

// Working with a DIB through a DC
//
function DIB_OpenInDC(hdib:Cardinal; hdc:HDC): Integer;
stdcall; external 'Eztwain3.dll'
procedure DIB_CloseInDC(hdib:Cardinal; hdc:HDC);
stdcall; external 'Eztwain3.dll'

// DIB File I/O
//
function DIB_WriteToFilename(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Write dib to file, using format implied by the extension of pszFile.
//
// hdib         = DIB handle, as returned by TWAIN_AcquireNative
// pszFile      = far pointer to NUL-terminated filename
//
// If pszFile is NULL or points to a null string, the user is
// prompted for the filename *and format* with a standard Windows
// file-save dialog.
//
// If the final filename has a standard extension (.bmp, .jpg, .jpeg, .tif,
// .tiff, .png, .pdf, .gif, .dcx) then the file is saved in that format.
// Otherwise, the current SaveFormat is used - see TWAIN_SetSaveFormat.
//
// Return values:
//       0      success
//      -1      user cancelled File Save dialog
//      -2      file open error (invalid path or name, or access denied)
//      -3      a) image is invalid (null or invalid DIB handle)
//      b) support for the save format is not configured
//      c) DIB format incompatible with save format e.g. B&W to JPEG.
//      -4      writing data failed, possibly output device is full
//  -5  other unspecified internal error

function DIB_WriteToBmp(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_WriteToBmpFile(hdib:Cardinal; fh:HFILE): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_WriteToJpeg(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_WriteToPng(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_WriteToTiff(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_WriteToPdf(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_WriteToGif(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_WriteToDcx(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Note: a return value of -3 indicates an invalid hdib handle, or
// 'no support for this format'.  -3 is also returned when attempting
// to write a Jpeg file from an image that is not 24-bit color or
// 8-bit grayscale.  1-bit B&W images cannot be saved as JPEG.
// 24-bit color images are 'quantized' to 8-bit color when written to GIF.
// All image types are converted to 1-bit B&W when written to DCX.
// Other internal errors will return -5, including insufficient memory.
// Check TWAIN_LastErrorCode for more details (maybe)

function DIB_LoadFromFilename(sFile:PChar): Cardinal;
stdcall; external 'Eztwain3.dll'

function DIB_FormatOfFile(sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Returns the TWFF_ code for the format of the specified file.
// A return < 0 indicates 'unrecognized format' or some error
// when opening or reading the file.

procedure DIB_SelectPageToLoad(nPage:Integer);
stdcall; external 'Eztwain3.dll'
// For use when loading multipage files.  Tells DIB_LoadFromFilename
// and DIB_LoadFromBuffer which page to load next, from a multipage file.
// Default is page 0 (first page in file).
// This value is reset to 0 after any call that tries to load a page.

function DIB_GetFilePageCount(sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
function DIB_FilePageCount(sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Return the number of pages in the specified file.
// If the file is a recognized multipage format
// (TIFF, PDF, DCX), the pages in the file are counted.
// All other recognized formats return a page count of 1.
// If the file cannot be opened, read, recognized, etc.
// this function records an error and returns -1.

function DIB_LoadPage(sFile:PChar; nPage:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Short for DIB_SelectPageToLoad, DIB_LoadFromFilename.
// Load the specified page from the specified file.
// Page 0 is the first page in a file.  Multiple
// pages are only supported in TIFF files, all other file
// formats have a single page, page #0.

function DIB_LoadFromBuffer(pBuffer:Pointer; nBytes:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Load an image from a buffer, presumably formatted like an image file.
// If DIB_SelectPageToLoad was called just before, the
// designated page is loaded from the buffer.

function DIB_LoadPageFromBuffer(pBuffer:Pointer; nBytes:Integer; nPage:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Load the specified page from a buffer - the buffer must contain an image
// file.  If the image format is one that can hold only one image, the page
// number is ignored.

function DIB_FormatOfBuffer(pBuffer:Pointer; nBytes:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Assuming the buffer contains something like an image file, return
// the format implied by the leading bytes.

function DIB_WriteToBuffer(hdib:Cardinal; nFormat:Integer; pBuffer:Pointer; nbMax:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Write the image into the buffer in the format, not more than nbMax bytes.
// The return value is the actual size of the image - this may be more or less
// than nbMax.  If the return value > nbMax, it means only part of the image
// was written, and the buffer needs to be bigger.
// If pBuffer is NULL, no data is written - the function just returns the required
// buffer size in bytes.
// A return value of 0 indicates an error, such as
//   The image is invalid (null or invalid DIB handle)
//   The format is unrecognized, not supported, not installed, etc.
//   You can't save that image in that format e.g. B&W image to JPEG format.
//   Insufficient memory for temporary data structures (or corrupted heap)
//   Other internal failure.
// You can call TWAIN_LastErrorCode and similar functions for more details.


function DIB_ToDibSection(hdib:Cardinal): HBitmap;
stdcall; external 'Eztwain3.dll'
// Converts the given DIB into a kind of bitmap called a DibSection.
// *** IMPORTANT: The input DIB is consumed and becomes invalid ***
// A DibSection is a special kind of HBITMAP.  Many languages
// and imaging classes (such as GDI+, .NET Image, Delphi TBitmap) do
// not easily accept DIBs but readily accept a DibSection/HBITMAP.

function DIB_FromBitmap(hbm:HBitmap; hdc:HDC): Cardinal;
stdcall; external 'Eztwain3.dll'
// Create a DIB with the contents of a GDI bitmap (preferably a DibSection).
// >> The input bitmap is NOT deleted - the returned DIB is a copy.
// If hdc = 0 (NULL) a default HDC is used.
// See also: DIB_ToDibSection

function DIB_IsBlank(hdib:Cardinal; dDarkness:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE(1) if the DIB has less than dDarkness fraction of 'dark' pixels.
// Return FALSE(0) otherwise.
// A typical value of dDarkness would be 0.02 which means 2% dark pixels.
// A page with less than 2% dark pixels is probably blank.

function DIB_Darkness(hdibFull:Cardinal): Double;
stdcall; external 'Eztwain3.dll'
// Returns the fraction of an image that consists of 'dark' pixels.
// These are pixels that would be black, if the image was converted
// to B&W using a smart thresholding.  See DIB_SmartThreshold.
// Used by DIB_IsBlank to decide if an image is blank.
// A return of 0.0 means none, 1.0 means all.  A typical office
// document is 0.02 (2%) to 0.32 (32%) dark pixels.

procedure DIB_GetHistogram(hdib:Cardinal; nComponent:Integer; histo:array of Integer);
stdcall; external 'Eztwain3.dll'
// Count the number of occurences of each value of the specified component
// in the given DIB (see component codes below).  Put the counts
// of each value (0..255) into the histo array.
// The histo array *must* be an array of 256 32-bit integers.
// Only works on B&W, grayscale, palette, and 24-bit RGB images.
// Example: If hdib contains 237 pixels with a grayscale value of 17, then
// this call will return histo[17] = 237.  Components are normalized
// into the range 0..255.
// Note: If hdib is a 1-bit B&W image, then histo will be all 0's, except
// for hist[0] (black) and hist[255] (white).
//
// Component codes:
const
        COMPONENT_GRAY = 0;
        COMPONENT_RED = 1;
        COMPONENT_GREEN = 2;
        COMPONENT_BLUE = 3;
        COMPONENT_LUMINANCE = 0;
// For gray and B&W images, all components are equal.
// Other components available upon request: support@dosadi.com


function DIB_ComponentCopy(hdib:Cardinal; nComponent:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// *** Beta - new in 3.08b8 - use with caution.
// Extract and return one component (channel) of the given image.
// The returned image is an 8-bit grayscale image containing the
// specified channel of the input image, with the same width,
// height, and DPI.
// *** Caution: Future version may return a 16-bit deep image
//     if given a 16 bit/channel input image.

function DIB_AvgRegion(hdib:Cardinal; nComp:Integer; x:Integer; y:Integer; w:Integer; h:Integer): Double;
stdcall; external 'Eztwain3.dll'
function DIB_AvgRow(hdib:Cardinal; nComp:Integer; y:Integer): Double;
stdcall; external 'Eztwain3.dll'
function DIB_AvgColumn(hdib:Cardinal; nComp:Integer; x:Integer): Double;
stdcall; external 'Eztwain3.dll'
// Average the values of pixels in a region, or a row or column.
// Note that row 0 (y=0) is the visually top-most row of an image.
// Averages either intensity (brightness) or individual color channels.
// See component codes above, for DIB_GetHistogram.
// Regardless of image format, white = 255.0 and black = 0, even
// for 1-bit B&W or 16-bit grayscale or color images.
// DOES NOT SUPPORT: 4-bit/pixel images, CMY(K) images.

function DIB_ProjectRows(hdib:Cardinal; nComp:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
function DIB_ProjectColumns(hdib:Cardinal; x:Integer; y:Integer; w:Integer; h:Integer; nComp:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// These functions create and return a 1 row x N column image, containing
// the average value of the rows (columns) of the input image, in the
// specified channel (component).
// If the source image is <= 8-bit/sample, the result image is 8-bit/sample.
// If the source image is 16 bit/sample, so is the result image.

function DIB_SimpleThreshold(hdib:Cardinal; nT:Integer): Cardinal;
stdcall; external 'Eztwain3.dll'
// Threshold hdib against nT and return the resulting 1-bit image.
// nT should be in the range 0 to 255.
// Pixels that are darker than nT become black in the output,
// pixels that are equal to or lighter than nT become white.
// ** Remember to free the input image if you are done with it.

function DIB_SmartThreshold(hdib:Cardinal): Cardinal;
stdcall; external 'Eztwain3.dll'
// Apply automatic, adaptive thresholding to hdib, return
// the resulting 1-bit image.  This function is optimized for
// thresholding scanned text.
// ** Remember to free the input image if you are done with it.

function DIB_Posterize(hdib:Cardinal; nLevels:Integer): Integer;
stdcall; external 'Eztwain3.dll'


//--- OBSOLETE: The following functions are for backward compatibility only:
function TWAIN_WriteNativeToFilename(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_LoadNativeFromFilename(sFile:PChar): Cardinal;
stdcall; external 'Eztwain3.dll'
//HDIB EZTAPI TWAIN_LoadNativeFromFile(HFILE fh);
// removed - contact Dosadi if this causes problems for you.
function TWAIN_NegotiateXferCount(nXfers:Integer): Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_DibDepth(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_DibWidth(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_DibHeight(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_DibNumColors(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_DibRowBytes(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
procedure TWAIN_DibReadRow(hdib:Cardinal; nRow:Integer; prow:Pointer);
stdcall; external 'Eztwain3.dll'
function TWAIN_CreateDibPalette(hdib:Cardinal): HPALETTE;
stdcall; external 'Eztwain3.dll'
procedure TWAIN_DrawDibToDC(hDC:HDC; dx:Integer; dy:Integer; w:Integer; h:Integer; hdib:Cardinal; sx:Integer; sy:Integer);
stdcall; external 'Eztwain3.dll'

//--------- File Read/Write

//---- File Formats
const
        TWFF_TIFF = 0;
        TWFF_BMP = 2;
        TWFF_JFIF = 4;
        TWFF_PNG = 7;
        TWFF_DCX = 97;
        TWFF_GIF = 98;
        TWFF_PDF = 99;
// PDF & GIF support is only provided by EZTwain.
// Note: BMP support is built into EZTwain, so is always available.

function TWAIN_IsJpegAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if JPEG/JFIF image files can be read and written.
// Returns 0 if JPEG support has not been installed.

function TWAIN_IsPngAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if PNG format support is available.

function TWAIN_IsTiffAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if TIFF format support is available.

function TWAIN_IsPdfAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if PDF format support is available.

function TWAIN_IsGifAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if GIF format support is available.

function TWAIN_IsDcxAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if DCX format support is available.
// Note that DCX files can only hold 1-bit
// B&W images - EZTwain converts the image data as needed.

function TWAIN_IsFormatAvailable(nFF:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if the specified file format support
// is available for writing and possibly reading files.
// A format is considered available if EZTwain can load
// the necessary DLLs.  See the 

function TWAIN_IsFileExtensionAvailable(sExt:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if the file format corresponding to the given
// file extension ("TIF", ".gif", "jpeg", etc.) is available.
// Case does not matter, leading '.' is optional.

function TWAIN_FormatFromExtension(sExt:PChar; nFF:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Return the file-format code (see File Formats above) for
// the given extension.  If pzExt is unrecognized, returns nFF.
// Case does not matter, leading '.' is optional.

function TWAIN_SetSaveFormat(nFF:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Select the default file format for DIB_WriteToFilename
// and TWAIN_WriteToFilename to use, when they do not
// recognize the file extension.
// Displays a warning message if the format is not available.
// Returns TRUE (1) if ok, FALSE (0) if format is invalid or not available.
// See list of file formats above.  Some formats are not supported
// by some versions of EZTWAIN, or require external DLLs be installed.

function TWAIN_GetSaveFormat: Integer;
stdcall; external 'Eztwain3.dll'
// Return the currently selected save format.

procedure TWAIN_SetJpegQuality(nQ:Integer);
stdcall; external 'Eztwain3.dll'
function TWAIN_GetJpegQuality: Integer;
stdcall; external 'Eztwain3.dll'
// Set the 'quality' of subsequently saved JPEG/JFIF image files.
// nQ = 100 is maximum quality & minimum compression.
// nQ = 75 is 'good' quality, the default.
// nQ = 1 is minimum quality & maximum compression.
 
procedure TWAIN_SetTiffStripSize(nBytes:Integer);
stdcall; external 'Eztwain3.dll'
function TWAIN_GetTiffStripSize: Integer;
stdcall; external 'Eztwain3.dll'
// Set/Get the size of the 'strips' that TIFF files are divided into.
// Some (bogus) TIFF readers cannot handle multiple strips, to make
// them happy set the strip size to -1.

function TWAIN_SetTiffImageDescription(sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetTiffDocumentName(sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Set the TIFF ImageDescription or DocumentName tags for output.
// These values apply only to the next TIFF file written, and are cleared
// once the file is closed.

function TWAIN_SetTiffCompression(nPT:Integer; nComp:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_GetTiffCompression(nPT:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Set/Get the compression mode to use when writing TIFF files.
// Set returns TRUE (1) if successful, FALSE (0) otherwise.
// nPT specifies the Pixel Type - See the TWPT_* constants.
// Different compressions apply to different pixel types - see below.
// nComp specifies the compression, here are the codes:
const
        TIFF_COMP_NONE = 1;
        TIFF_COMP_CCITTRLE = 2;
        TIFF_COMP_CCITTFAX3 = 3;
        TIFF_COMP_CCITTFAX4 = 4;
        TIFF_COMP_LZW = 5;
        TIFF_COMP_JPEG = 7;
        TIFF_COMP_PACKBITS = 32773;

// Default for BW is TIFF_COMP_CCITTFAX4
// Default for all other pixel types is TIFF_COMP_NONE.

function TWAIN_SetTiffTagLong(nTagId:Integer; nValue:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetTiffTagString(nTagId:Integer; sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetTiffTagDouble(nTagId:Integer; dValue:Double): BOOL;
stdcall; external 'Eztwain3.dll'
procedure TWAIN_ResetTiffTags;
stdcall; external 'Eztwain3.dll'
// The functions above allow specific TIFF tags to be set.
// Whatever value(s) you set will be used in *each image written to TIFF*
// until you call TWAIN_ResetTiffTags.
// Note that integer values are appropriately converted to 16- or 32-bit
// signed or unsigned as needed by the specific tag.

procedure TWAIN_SetFileAppendFlag(bAppend:BOOL);
stdcall; external 'Eztwain3.dll'
function TWAIN_GetFileAppendFlag: BOOL;
stdcall; external 'Eztwain3.dll'
// Set or get the File Append Flag - When this flag is non-zero, any existing
// TIFF file will be added to, instead of replaced, when written.  When this
// flag is 0, writing to a TIFF file replaces any existing content.
// 0 is the default state for this flag.
// Note: Only TIFF format is affected.
// This applies to all functions that write images, primarily:
//  TWAIN_AcquireToFilename, TWAIN_AcquireMultipageFile,
//  DIB_WriteToFilename, TWAIN_BeginMultipageFile, etc.

//- PDF Metadata ------------------------------------------

// These functions add information to the next output PDF file:
function TWAIN_SetPdfTitle(sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetPdfAuthor(sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetPdfSubject(sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetPdfKeywords(sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetPdfCreator(sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetPdfProducer(sText:PChar): BOOL;
stdcall; external 'Eztwain3.dll'

function TWAIN_WriteToFilename(hdib:Cardinal; sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Writes the specified image to a file.
// These are aliases for DIB_WriteToFilename - please refer to that function.

function TWAIN_LoadFromFilename(sFile:PChar): Cardinal;
stdcall; external 'Eztwain3.dll'
// Load a .BMP file, or any other available format.
// Accepts a filename (including path & extension).
// If pszFile is NULL or points to a null string, the user is
// prompted to choose a file with a standard File Open dialog.
// Returns a DIB handle if successful, otherwise NULL.

function TWAIN_FormatOfFile(sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Return the format of the specified file.
// See the TWFF_* codes elsewhere in this file.
// A return value < 0 means 'unrecognized format'.

function TWAIN_PagesInFile(sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Return the number of pages in the specified file.
// The format of the file is determined - for multipage formats
// (TIFF, PDF, DCX), the pages are counted.
// All other recognized formats return a page count of 1.
// If the file cannot be opened, read, recognized, etc.
// this function records an error and returns -1.

function TWAIN_ViewFile(sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Display the specified file in a viewer window that allows the
// user to browse to all pages (if more than one).
// If the file name is NULL or the null string, the user is prompted
// with a standard file-open dialog, offering all the filetypes that
// EZTwain thinks it can open.
// The default dialog has an OK button only.
// Return values:
//  1   [OK] button pressed
//  0   [Cancel] button pressed
// -1   user cancelled file-open prompt (if you supplied a null filename)
// -2   error displaying dialog, opening file, etc.

//--------- Multipage File Output

const
        MULTIPAGE_TIFF = 0;
        MULTIPAGE_PDF = 1;
        MULTIPAGE_DCX = 2;

function TWAIN_SetMultipageFormat(nFF:Integer): Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_GetMultipageFormat: Integer;
stdcall; external 'Eztwain3.dll'
// Select/query the default multipage file save format.
// The default when EZTwain is loaded is MULTIPAGE_TIFF,
//
// SetMultipageFormat returns:
//  0 = success,
// -1 = invalid/unrecognized format
// -3 = format is currently unavailable (missing/bad DLL)
// -7 = Multipage support is not installed.

function TWAIN_BeginMultipageFile(sFile:PChar): Integer;
stdcall; external 'Eztwain3.dll'
// Create an empty multipage file of the given name.
// IF pszFile includes an extension (.tif, .tiff, .mpt, .pdf or .dcx)
// then the corresponding format is used for the file.
// If you do not supply an extension, the default multipage format is used.
// If pszFile is NULL or points to the null string, the user
// is prompted with a standard File Save dialog.

// Return values:
//       0      success
//      -1      user cancelled File Save dialog
//      -2      file open error (invalid path or name, or access denied)
//  -3  file format not available
//  -5  other unspecified internal error
//  -7  Multipage support is not installed.

function TWAIN_DibWritePage(hdib:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
//   0  success
//  -2  internal limit exceeded or insufficient memory
//  -3  File format is not available (EZxxx DLL not found)
//  -4  Write error: Output device is full?
//  -5  invalid/unrecognized file format or 'other' - internal
//  -5  multipage file not open
//  -7  Multipage support is not installed.

function TWAIN_EndMultipageFile: Integer;
stdcall; external 'Eztwain3.dll'
//   0  success
//  -3  File format is not available
//  -4  Write error - drive offline, or ?? (very unlikely)
//  -5  invalid/unrecognized file format or other internal error
//  -7  Multipage support is not installed.

function TWAIN_MultipageCount: Integer;
stdcall; external 'Eztwain3.dll'
// Return the number of images (scans) written to the most recently
// started multipage file.  In other words, this returns a counter
// which is reset by BeginMultipageFile, and is incremented by DibWritePage.


function TWAIN_LastOutputFile: PChar;
stdcall; external 'Eztwain3.dll'
// Return the name of the last file written by EZTwain.
// Useful if you pass NULL or the empty string as a filename to
// DIB_WriteToFilename or TWAIN_AcquireToFilename, etc.


//--------- Application Registration and Licensing

procedure TWAIN_RegisterApp(nMajorNum:Integer; nMinorNum:Integer; nLanguage:Integer; nCountry:Integer; sVersion:PChar; sMfg:PChar; sFamily:PChar; sAppTitle:PChar);
stdcall; external 'Eztwain3.dll'
//
// TWAIN_RegisterApp can be called *AS THE FIRST CALL*, to register the
// application. If this function is not called, the application is given a
// 'generic' registration by EZTWAIN.
// Registration only provides this information to the Source Manager and any
// sources you may open - it is used for debugging, and (frankly) by some
// sources to give special treatment to certain applications.

procedure TWAIN_SetAppTitle(sAppTitle:PChar);
stdcall; external 'Eztwain3.dll'
// The short form of Application/Product name registration.
// Sets the product name as far as EZTwain and TWAIN are concerned.
// This title is used in several ways:
// As the title (caption) of any EZTwain dialog boxes / error boxes.
// In the progress box of some devices as they transfer images.
// In the 'software' field of saved image files in some formats,
// including TIFF.

procedure TWAIN_SetApplicationKey(nKey:Integer);
stdcall; external 'Eztwain3.dll'
// Unlock EZTwain Pro for use with the current application - call this AFTER
// calling RegisterApp or SetAppTitle above:  The nKey value must match
// the application title (product name) passed to one of those functions.

procedure TWAIN_ApplicationLicense(sAppTitle:PChar; nAppKey:Integer);
stdcall; external 'Eztwain3.dll'
// Unlock EZTwain using a Single Application License.

procedure TWAIN_SetVendorKey(sVendorName:PChar; nKey:Integer);
stdcall; external 'Eztwain3.dll'
// Unlock EZTwain using a Universal Application / Vendor License

procedure TWAIN_OrganizationLicense(sOrganization:PChar; nKey:Integer);
stdcall; external 'Eztwain3.dll'
// Unlock EZTwain using an Organization / In-House Application License.

//--------- Error Analysis and Reporting ------------------------------------

function TWAIN_GetResultCode: Cardinal;
stdcall; external 'Eztwain3.dll'
// Return the result code (TWRC_xxx) from the last triplet sent to TWAIN

function TWAIN_GetConditionCode: Cardinal;
stdcall; external 'Eztwain3.dll'
// Return the condition code from the last triplet sent to TWAIN.
// (To be precise, from the last call to TWAIN_DS below)
// If a source is NOT open, return the condition code of the source manager.

function TWAIN_UserClosedSource: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) if during the last acquire the user asked
// the DataSource to close.  0 otherwise of course.
// This flag is cleared each time you start any kind of acquire,
// and it is set if EZTWAIN receives a
// MSG_CLOSEDSREQ message through TWAIN.

procedure TWAIN_ErrorBox(sMsg:PChar);
stdcall; external 'Eztwain3.dll'
// Post an error message dialog with an OK button.
// pszMsg points to a null-terminated message string.
// The box caption is the current AppTitle - see SetAppTitle.
// If messages are suppressed (see below) this function does nothing.

function TWAIN_SuppressErrorMessages(bYes:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// Enable or disable EZTWAIN error messages to the user.
// When bYes = FALSE(0), error messages are displayed.
// When bYes = TRUE(non-0), error messages are suppressed.
// By default, error messages are displayed.
// Returns the previous state of the flag.
//
// EZTWAIN cannot suppress messages from TWAIN or TWAIN device drivers.

procedure TWAIN_ReportLastError(sMsg:PChar);
stdcall; external 'Eztwain3.dll'
// Like TWAIN_ErrorBox, but if some details are available from
// TWAIN about the last failure, they are included in the message box.

procedure TWAIN_GetLastErrorText(sMsg:PChar);
stdcall; external 'Eztwain3.dll'
// Get a string that describes the last error detected by EZTwain.
// Note: This function is called by TWAIN_ReportLastError.
// Note: The returned string may contain end-of-line characters.
// The parameter is a string variable (char array in C/C++).
// You are responsible for allocating room for 512 8-bit characters
// in the string variable before calling this function.

function TWAIN_LastErrorText: PChar;
stdcall; external 'Eztwain3.dll'
// Return a string that describes the last error detected by EZTwain -
// see Notes for TWAIN_GetLastErrorText.

function TWAIN_LastErrorCode: Integer;
stdcall; external 'Eztwain3.dll'
// Return the last internal EZTWAIN error code. (see EZTEC_ codes below)

procedure TWAIN_ClearError;
stdcall; external 'Eztwain3.dll'
// Set the EZTWAIN internal error code to EZTEC_NONE

////////////////////////////////////////////////////////
// EZTwain Error codes
const
        EZTEC_NONE = 0;
        EZTEC_START_TRIPLET_ERRS = 1;
        EZTEC_CAP_GET = 2;
        EZTEC_CAP_SET = 3;
        EZTEC_DSM_FAILURE = 4;
        EZTEC_DS_FAILURE = 5;
        EZTEC_XFER_FAILURE = 6;
        EZTEC_END_TRIPLET_ERRS = 7;
        EZTEC_OPEN_DSM = 8;
        EZTEC_OPEN_DEFAULT_DS = 9;
        EZTEC_NOT_STATE_4 = 10;
        EZTEC_NULL_HCON = 11;
        EZTEC_BAD_HCON = 12;
        EZTEC_BAD_CONTYPE = 13;
        EZTEC_BAD_ITEMTYPE = 14;
        EZTEC_CAP_GET_EMPTY = 15;
        EZTEC_CAP_SET_EMPTY = 16;
        EZTEC_INVALID_HWND = 17;
        EZTEC_PROXY_WINDOW = 18;
        EZTEC_USER_CANCEL = 19;
        EZTEC_RESOLUTION = 20;
        EZTEC_LICENSE = 21;
        EZTEC_JPEG_DLL = 22;
        EZTEC_SOURCE_EXCEPTION = 23;
        EZTEC_LOAD_DSM = 24;
        EZTEC_NO_SUCH_DS = 25;
        EZTEC_OPEN_DS = 26;
        EZTEC_ENABLE_FAILED = 27;
        EZTEC_BAD_MEMXFER = 28;
        EZTEC_JPEG_GRAY_OR_RGB = 29;
        EZTEC_JPEG_BAD_Q = 30;
        EZTEC_BAD_DIB = 31;
        EZTEC_BAD_FILENAME = 32;
        EZTEC_FILE_NOT_FOUND = 33;
        EZTEC_FILE_ACCESS = 34;
        EZTEC_MEMORY = 35;
        EZTEC_JPEG_ERR = 36;
        EZTEC_JPEG_ERR_REPORTED = 37;
        EZTEC_0_PAGES = 38;
        EZTEC_UNK_WRITE_FF = 39;
        EZTEC_NO_TIFF = 40;
        EZTEC_TIFF_WRITE_ERR = 41;
        EZTEC_PDF_WRITE_ERR = 42;
        EZTEC_NO_PDF = 43;
        EZTEC_GIFCON = 44;
        EZTEC_FILE_READ_ERR = 45;
        EZTEC_BAD_REGION = 46;
        EZTEC_FILE_WRITE = 47;
        EZTEC_NO_DS_OPEN = 48;
        EZTEC_DCXCON = 49;
        EZTEC_NO_BARCODE = 50;
        EZTEC_UNK_READ_FF = 51;
        EZTEC_DIB_FORMAT = 52;
        EZTEC_PRINT_ERR = 53;
        EZTEC_NO_DCX = 54;
        EZTEC_APP_BAD_CON = 55;
        EZTEC_LIC_KEY = 56;




//--------- TWAIN State Control ------------------------------------

function TWAIN_LoadSourceManager: BOOL;
stdcall; external 'Eztwain3.dll'
// Finds and loads the Data Source Manager, TWAIN.DLL.
// If Source Manager is already loaded, does nothing and returns TRUE(1).
// This can fail if TWAIN.DLL is not installed (in the right place), or
// if the library cannot load for some reason (insufficient memory?) or
// if TWAIN.DLL has been corrupted.

function TWAIN_OpenSourceManager(hwnd:HWND): BOOL;
stdcall; external 'Eztwain3.dll'
// Opens the Data Source Manager, if not already open.
// If the Source Manager is already open, does nothing and returns TRUE.
// This call will fail if the Source Manager is not loaded.

function TWAIN_OpenDefaultSource: BOOL;
stdcall; external 'Eztwain3.dll'
// This opens the source selected in the Select Source dialog.
// If some source is already open, does nothing and returns TRUE.
// Will load and open the Source Manager if needed.
// If this call returns TRUE, TWAIN is in STATE 4 (TWAIN_SOURCE_OPEN)

// These two functions allow you to enumerate the available data sources:
function TWAIN_GetSourceList: BOOL;
stdcall; external 'Eztwain3.dll'
// Fetches the list of sources into memory, so they can be returned
// one by one by TWAIN_GetNextSourceName, below.
// Returns TRUE (1) if successful, FALSE (0) otherwise.

function TWAIN_GetNextSourceName(sName:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Copies the next source name in the list into its parameter.
// The parameter is a string variable (char array in C/C++).
// You are responsible for allocating room for 33 8-bit characters
// in the string variable before calling this function.
// Returns TRUE (1) if successful, FALSE (0) if there are no more.

function TWAIN_NextSourceName: PChar;
stdcall; external 'Eztwain3.dll'
// Returns the next source name in the list.
// Returns the empty string when it comes to the end of the list.

function TWAIN_GetDefaultSourceName(sName:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Copies the name of the TWAIN default source into its parameter.
// The parameter is a string variable (char array in C/C++).
// You are responsible for allocating room for 33 8-bit characters
// in the string variable before calling this function.
// Normally returns TRUE (1) but will return FALSE (0) if:
//   - the TWAIN Source Manager cannot be loaded & initialized or
//   - there is no current default source (e.g. no sources are installed)

function TWAIN_DefaultSourceName: PChar;
stdcall; external 'Eztwain3.dll'
// Returns the name of the TWAIN default source device.

function TWAIN_OpenSource(sName:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Opens the source with the given name.
// If that source is already open, does nothing and returns TRUE.
// If another source is open, closes it and attempts to open the specified source.
// Will load and open the Source Manager if needed.

function TWAIN_EnableSource(hwnd:HWND): BOOL;
stdcall; external 'Eztwain3.dll'
// Enables the open Data Source. This posts the source's user interface
// and allows image acquisition to begin.  If the source is already enabled,
// this call does nothing and returns TRUE.

function TWAIN_DisableSource: BOOL;
stdcall; external 'Eztwain3.dll'
// Disables the open Data Source, if any.
// This closes the source's user interface.
// If successful or the source is already disabled, returns TRUE(1).

function TWAIN_CloseSource: BOOL;
stdcall; external 'Eztwain3.dll'
// Closes the open Data Source, if any.
// If the source is enabled, disables it first.
// If successful or source is already closed, returns TRUE(1).

function TWAIN_CloseSourceManager(hwnd:HWND): BOOL;
stdcall; external 'Eztwain3.dll'
// Closes the Data Source Manager, if it is open.
// If a source is open, disables and closes it as needed.
// If successful (or if source manager is already closed) returns TRUE(1).

function TWAIN_UnloadSourceManager: BOOL;
stdcall; external 'Eztwain3.dll'
// Unloads the Data Source Manager i.e. TWAIN.DLL - releasing
// any associated memory or resources.
// If necessary, it will abort transfers, close the open source
// if any, and close the Source Manager.
// If successful, it returns TRUE(1)


function TWAIN_IsTransferReady: BOOL;
stdcall; external 'Eztwain3.dll'

function TWAIN_EndXfer: BOOL;
stdcall; external 'Eztwain3.dll'

function TWAIN_AbortAllPendingXfers: BOOL;
stdcall; external 'Eztwain3.dll'

//--------- High-level Capability Negotiation Functions --------

// These functions should only be called in State 4 (TWAIN_SOURCE_OPEN)

function TWAIN_SetXferCount(nXfers:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Negotiate with open Source the number of images application will accept.
// nXfers = -1 means any number
// Returns: TRUE(1) for success, FALSE(0) for failure.

function TWAIN_NegotiatePixelTypes(wPixTypes:Cardinal): BOOL;
stdcall; external 'Eztwain3.dll'
// Negotiate with the source to restrict pixel types that can be acquired.
// This tries to restrict the source to a *set* of pixel types.
// Returns: TRUE(1) for success, FALSE(0) for failure.
// See TWAIN_AcquireNative for some mask constants.
// A parameter of 0 (TWAIN_ANYTYPE) causes no negotiation & no restriction.
// You should not assume that the source will honor your restrictions, even
// if this call succeeds!

//----- Unit of Measure
// TWAIN unit codes (from twain.h)
const
        TWUN_INCHES = 0;
        TWUN_CENTIMETERS = 1;
        TWUN_PICAS = 2;
        TWUN_POINTS = 3;
        TWUN_TWIPS = 4;
        TWUN_PIXELS = 5;

function TWAIN_GetCurrentUnits: Integer;
stdcall; external 'Eztwain3.dll'
// Return the current unit of measure: inches, cm, pixels, etc.
// Many TWAIN parameters such as resolution are set and returned
// in the current unit of measure.
// There is no error return - in case of error it returns 0 (TWUN_INCHES)

function TWAIN_SetUnits(nUnits:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetCurrentUnits(nUnits:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Set the current unit of measure for the source.
// Returns: TRUE(1) for success, FALSE(0) for failure.
// Common unit codes (TWUN_*) are given above.
// Notes:
// 1. Most sources do not support all units, some support *only* inches!
// 2. If you want to get or set resolution in DPI (dots per *inch*), make
// sure the current units are inches, or you might get Dots-Per-cm!
// 3. Ditto (same comment) for ImageLayout, see below.

function TWAIN_GetBitDepth: Integer;
stdcall; external 'Eztwain3.dll'
// Get the current bitdepth, which can depend on the current PixelType.
// Bit depth is per color channel e.g. 24-bit RGB has bit depth 8.
// If anything goes wrong, this function returns 0.

function TWAIN_SetBitDepth(nBits:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// (Try to) set the current bitdepth (for the current pixel type).
// Note: You should set a PixelType, then set the bitdepth for that type.
// Returns: TRUE(1) for success, FALSE(0) for failure.

//------- TWAIN Pixel Types (from twain.h)
const
        TWPT_BW = 0;
        TWPT_GRAY = 1;
        TWPT_RGB = 2;
        TWPT_PALETTE = 3;
        TWPT_CMY = 4;
        TWPT_CMYK = 5;

function TWAIN_GetPixelType: Integer;
stdcall; external 'Eztwain3.dll'
// Ask the source for the current pixel type.
// If anything goes wrong (it shouldn't), this function returns 0 (TWPT_BW).

function TWAIN_SetPixelType(nPixType:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetCurrentPixelType(nPixType:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Try to set the current pixel type for acquisition.
// The source may select this pixel type, but don't assume it will.

function TWAIN_GetCurrentResolution: Double;
stdcall; external 'Eztwain3.dll'
// Ask the source for the current (horizontal) resolution.
// Resolution is in dots per current unit! (See TWAIN_GetCurrentUnits above)
// If anything goes wrong (it shouldn't) this function returns 0.0

function TWAIN_GetXResolution: Double;
stdcall; external 'Eztwain3.dll'
function TWAIN_GetYResolution: Double;
stdcall; external 'Eztwain3.dll'
// Returns the current horizontal or vertical resolution, in dots per *current unit*.
// In the event of failure, returns 0.0.

function TWAIN_SetResolution(dRes:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetResolutionInt(nRes:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetCurrentResolution(dRes:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Try to set the current resolution (in both x & y).
// Resolution is in dots per current unit! (See TWAIN_GetCurrentUnits above)
// Note: The source may select this resolution, but don't assume it will.

// You can also set the resolution in X and Y separately, if your TWAIN
// device can handle this:
function TWAIN_SetXResolution(dxRes:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetYResolution(dyRes:Double): BOOL;
stdcall; external 'Eztwain3.dll'

function TWAIN_SetContrast(dCon:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Try to set the current contrast for acquisition.
// The TWAIN standard *says* that the range for this cap is -1000 ... +1000

function TWAIN_SetBrightness(dBri:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Try to set the current brightness for acquisition.
// The TWAIN standard *says* that the range for this cap is -1000 ... +1000

function TWAIN_SetThreshold(dThresh:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Try to set the threshold for black and white scanning.
// Should only affect 1-bit scans i.e. PixelType == TWPT_BW.
// The TWAIN default threshold value is 128.
// After staring at the TWAIN 1.6 spec for a while, I imagine that it implies
// that for 8-bit samples, values >= nThresh are thresholded to 1, others to 0.

function TWAIN_GetCurrentThreshold: Double;
stdcall; external 'Eztwain3.dll'
// Try to get and return the current value (MSG_GETCURRENT) of the
// ICAP_THRESHOLD capability.  If this fails for any reason, it
// will return -1.  *VERSIONS BEFORE 2.65 RETURNED 128.0*

procedure TWAIN_SetAutoDeskew(nMode:Integer);
stdcall; external 'Eztwain3.dll'
// Select the 'auto-deskew' mode.
// Auto-deskew attempts to straighten up scans that are slightly crooked,
// up to about 10 degrees.
// The currently defined modes are:
//  0   - no auto deskew.
//  1   - auto deskew using EZTwain software algorithms

function TWAIN_GetAutoDeskew: Integer;
stdcall; external 'Eztwain3.dll'
// Return the current AutoDeskew mode.

function TWAIN_SetXferMech(mech:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_XferMech: Integer;
stdcall; external 'Eztwain3.dll'
// Try to set or get the transfer mode - one of the following:
const
        XFERMECH_NATIVE = 0;
        XFERMECH_FILE = 1;
        XFERMECH_MEMORY = 2;
// You should not need to set this mode directly - using
// TWAIN_Acquire, TWAIN_AcquireNative and TWAIN_AcquireFile will set
// the appropriate transfer mode for you.

function TWAIN_SupportsFileXfer: BOOL;
stdcall; external 'Eztwain3.dll'
// Returns TRUE(1) if the open DS claims to support file transfer mode (XFERMECH_FILE)
// Returns FALSE(0) otherwise.
// This mode is optional.  If TRUE, you can use AcquireFile.

function TWAIN_SetPaperSize(nPaper:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// See TWSS_* in TWAIN.H
const
        PAPER_NONE = 0;
        PAPER_A4LETTER = 1;
        PAPER_B5LETTER = 2;
        PAPER_USLETTER = 3;
        PAPER_USLEGAL = 4;
        PAPER_A5 = 5;
        PAPER_B4 = 6;
        PAPER_B6 = 7;
        PAPER_USLEDGER = 9;
        PAPER_USEXECUTIVE = 10;
        PAPER_A3 = 11;
        PAPER_B3 = 12;
        PAPER_A6 = 13;
        PAPER_C4 = 14;
        PAPER_C5 = 15;
        PAPER_C6 = 16;

//-------- Document Feeder -------

function TWAIN_HasFeeder: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE(1) if the source indicates it has a document feeder.
// Note: A FALSE(0) is returned if the source does not handle this inquiry.

function TWAIN_IsFeederSelected: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE(1) if the document feeder is selected.

function TWAIN_SelectFeeder(bYes:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// (Try to) select or deselect the document feeder.
// The document feeder, if any, is selected if bYes is non-zero.
// The flatbed, if any, is selected if bYes is zero.
// Note: A few of the scanners that have both a flatbed and 
// a feeder ignore this request in some circumstances.
// Return TRUE(1) if successful, FALSE(0) otherwise.

function TWAIN_IsAutoFeedOn: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE(1) if automatic feeding is enabled, otherwise FALSE(0).
// Make sure the feeder is selected before calling this function.

function TWAIN_SetAutoFeed(bYes:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// (Try to) turn on/off automatic feeding thru the feeder.
// Return TRUE(1) if successful, FALSE(0) otherwise.
// This function selects the feeder, so to start scanning
// pages from an ADF, just do: TWAIN_SetAutoFeed(TRUE).

function TWAIN_IsFeederLoaded: BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE(1) if there are documents in the feeder.
// Make sure the feeder is selected before calling this function.

function TWAIN_SetAutoScan(bYes:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// Setting this to TRUE gives the scanner permission to 'scan ahead'
// i.e. to pull pages from the feeder and scan them before 
// they have been requested.  On high-speed scanners, you may
// have to enable AutoScan to achieve the maximum scanning rate.
// Returns TRUE(1) if successful, FALSE(0) otherwise.
// This call will fail on most flatbeds & cameras, and some 'feeder'
// scanners.

//-------- Duplex Scanning -------

function TWAIN_GetDuplexSupport: Integer;
stdcall; external 'Eztwain3.dll'
// Query the device for duplex scanning support.
//   Return values:
// 0    = no support (or error, or query not recognized)
// 1    = 1-pass duplex
// 2    = 2-pass duplex

function TWAIN_EnableDuplex(bYes:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// Enable (bYes not 0) or disable (bYes=0) duplex scanning.
// Returns TRUE(1) if successful, FALSE(0) otherwise.

function TWAIN_IsDuplexEnabled: BOOL;
stdcall; external 'Eztwain3.dll'
// Returns TRUE(1) if the device supports duplex scanning
// and duplex scanning is enabled.  FALSE(0) otherwise.

//--------- Other 'exotic' capabilities --------

function TWAIN_HasControllableUI: Integer;
stdcall; external 'Eztwain3.dll'
// Return 1 if source claims UI can be hidden (see SetHideUI above)
// Return 0 if source says UI *cannot* be hidden
// Return -1 if source (pre TWAIN 1.6) cannot answer the question.

function TWAIN_SetIndicators(bVisible:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// Tell the source to show (hide) progress indicators during acquisition.
// Returns: TRUE(1) for success, FALSE(0) for failure.

function TWAIN_Compression: Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetCompression(compression:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Set/Get compression style for transferred data
// Set returns TRUE(1) for success, FALSE(0) for failure.

function TWAIN_Tiled: BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetTiled(bTiled:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// Set/Get whether source does memory xfer via strips or tiles.
// bTiled = TRUE if it uses tiles for transfer.
// Set returns: TRUE(1) for success, FALSE(0) for failure.

function TWAIN_PlanarChunky: Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetPlanarChunky(shape:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Set/Get current pixel shape (TWPC_CHUNKY or TWPC_PLANAR), or -1.
// Set returns TRUE(1) for success, FALSE(0) for failure.

const
        CHUNKY_PIXELS = 0;
        PLANAR_PIXELS = 1;

function TWAIN_PixelFlavor: Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetPixelFlavor(flavor:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Set/Get pixel 'flavor' - whether a '0' pixel value means black or white:
// Set returns: TRUE(1) for success, FALSE(0) for failure.

const
        CHOCOLATE_PIXELS = 0;
        VANILLA_PIXELS = 1;


function TWAIN_SetLightPath(bTransmissive:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// Tries to select transparent or reflective media on the open source.
// A parameter of TRUE(1) means transparent, FALSE(0) means reflective.
// Returns: TRUE(1) for success, FALSE(0) for failure.

function TWAIN_SetAutoBright(bOn:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetGamma(dGamma:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetShadow(d:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetHighlight(d:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Set auto-brightness, gamma, shadow, and highlight values.
// Refer to the TWAIN specification for definitions of these settings.
// Returns: TRUE(1) for success, FALSE(0) for failure.

//--------- Image Layout (Region of Interest) --------

procedure TWAIN_SetRegion(L:Double; T:Double; R:Double; B:Double);
stdcall; external 'Eztwain3.dll'
// Specify the region to be acquired, in current unit of measure.
// This is the recommended most-general way to scan a region.
// Tries to use TWAIN_SetImageLayout and TWAIN_SetFrame (see below).
// If the device ignores those, the specified region is extracted
// after each scan completes, by software cropping. (DIB_RegionCopy)
// In other words, this call should *always* produce scans of
// the requested region, unless you specify a region in inches or
// centimeters and the device is a camera whose only unit is pixels.

procedure TWAIN_ResetRegion;
stdcall; external 'Eztwain3.dll'
// Clear any region set with TWAIN_SetRegion above.

function TWAIN_SetImageLayout(L:Double; T:Double; R:Double; B:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Specify the area to scan, sometimes called the ROI (Region of Interest)
// Returns: TRUE(1) for success, FALSE(0) for failure.
// This call is only valid in State 4.
// L, T, R, B = distance to left, top, right, and bottom edge of
// area to scan, measured in the current unit of measure,
// from the top-left corner of the 'original page' (TWAIN 1.6 8-22)

function TWAIN_GetImageLayout(var L:Double; var T:Double; var R:Double; var B:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_GetDefaultImageLayout(var L:Double; var T:Double; var R:Double; var B:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Get the current or default (power-on) area to scan.
// Returns: TRUE(1) for success, FALSE(0) for failure.
// This call is valid in States 4-6.
// Supposedly the returned values (see above)
// are in the current unit of measure (ICAP_UNITS), but I observe that
// many DS's ignore ICAP_UNITS when dealing with Image Layout.

function TWAIN_ResetImageLayout: BOOL;
stdcall; external 'Eztwain3.dll'
// Reset the area to scan to the default (power-on) settings.
// This call is only valid in State 4.
// Returns: TRUE(1) for success, FALSE(0) for failure.


// Closely related:
function TWAIN_SetFrame(L:Double; T:Double; R:Double; B:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// This is an alternative way to set the scan area.
// Some scanners will respond to this instead of SetImageLayout.
// Returns: TRUE(1) for success, FALSE(0) for failure.
// This call is only valid in State 4.
// L, T, R, B = distance to left, top, right, and bottom edge of
// area to scan, measured in the current unit of measure,


//--------- Tone Response Curves --------

function TWAIN_SetGrayResponse(pcurve:array of Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Define a translation of gray pixel values.
// When device digitizes a pixel with value V, that
// pixel is translated to value pcurve[V] before it
// is returned to the application.
// Device must be open (State 4),
// Current PixelType must be TWPT_GRAY or TWPT_RGB,
// current BitDepth should be 8.
// pcurve must be a table (array, vector) of 256 entries.
// Returns: TRUE(1) for success, FALSE(0) for failure.

function TWAIN_SetColorResponse(pred:array of Integer; pgreen:array of Integer; pblue:array of Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Define a translation of color values.
// Like TWAIN_SetGrayResponse (above) but separate translation can
// be applied to each color channel.
// Returns: TRUE(1) for success, FALSE(0) for failure.

function TWAIN_ResetGrayResponse: BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_ResetColorResponse: BOOL;
stdcall; external 'Eztwain3.dll'
// These two functions reset the response curve to map every
// value V to itself i.e. a 'do nothing' translation.
// Returns: TRUE(1) for success, FALSE(0) for failure.

//--------- Barcode Recognition -------
// *** Beta Feature, contact Dosadi before using ***

function BARCODE_IsAvailable: BOOL;
stdcall; external 'Eztwain3.dll'
// TRUE(1) if barcode recognition is available.
// Returns FALSE(0) otherwise.
function BARCODE_Version: Integer;
stdcall; external 'Eztwain3.dll'
// Return the barcode module version * 100.

procedure BARCODE_License(Basis:PChar; nKey:Integer);
stdcall; external 'Eztwain3.dll'
// Supply your Dosadi Barcode add-on license key.
// This is necessary to continue using the Dosadi barcode engine
// after your EZTwain trial license has expired.
// Note that the EZTwain trial license can be renewed.
// To purchase a barcode add-on license or renew a trial license,
// contact Dosadi support: support@dosadi.com

function BARCODE_IsEngineAvailable(nEngine:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function BARCODE_SelectEngine(nEngine:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function BARCODE_SelectedEngine: Integer;
stdcall; external 'Eztwain3.dll'

const
        EZBAR_ENGINE_NONE = 0;
        EZBAR_ENGINE_DOSADI = 1;
        EZBAR_ENGINE_AXTEL = 2;

// Note: Use of the Axtel engine requires the separately licensed Axtel
// Axtel 1D Barcode engine: AXBAR32.DLL - See www.axtel.com

function BARCODE_SetDirectionFlags(nDirFlags:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function BARCODE_GetDirectionFlags: Integer;
stdcall; external 'Eztwain3.dll'
function BARCODE_AvailableDirectionFlags: Integer;
stdcall; external 'Eztwain3.dll'
// Set/Get the directions the engine will scan for barcodes.
// The default is left-to-right ONLY.
// Scanning for barcodes in multiple directions can slow the
// recognition process.  BARCODE_SetDirectionFlags will return TRUE if
// completely successful, FALSE if any direction is invalid or not supported.
// Setting the direction flags to -1 is interpreted as "select all supported
// directions."

// Barcode direction flags - can be or'ed together
const
        EZBAR_LEFT_TO_RIGHT = $1;
        EZBAR_RIGHT_TO_LEFT = $2;
        EZBAR_TOP_TO_BOTTOM = $4;
        EZBAR_BOTTOM_TO_TOP = $8;
        EZBAR_DIAGONAL = $10;
// some common combinations:
        EZBAR_HORIZONTAL = $3;
        EZBAR_VERTICAL = $C;

function BARCODE_Recognize(hdib:Cardinal; nMaxCount:Integer; nType:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Find and recognize barcodes in the given image.
// Don't look for more than nMaxCount barcodes (-1 means 'any number')
// Expect barcodes of the specified type (-1 means 'any recognized type')
// You can add or 'or' together barcode types.
//
// Return values:
//   n>0    n barcodes found
//   0      no barcodes found
//  -1      barcode services not available.
//  -3      invalid or null image

// Barcode types:
const
        EZBAR_EAN_13 = $1;
        EZBAR_EAN_8 = $2;
        EZBAR_UPCA = $4;
        EZBAR_UPCE = $8;
        EZBAR_CODE_39 = $10;
        EZBAR_CODE_39FA = $20;
        EZBAR_CODE_128 = $40;
        EZBAR_CODE_I25 = $80;
        EZBAR_CODA_BAR = $100;
        EZBAR_UCCEAN_128 = $200;
        EZBAR_CODE_93 = $400;
        EZBAR_CODE_35 = $800;
        EZBAR_ANY = -1;

function BARCODE_Text(n:Integer): PChar;
stdcall; external 'Eztwain3.dll'
// Return the text of the nth barcode recognized by the last BARCODE_Recognize.
// barcodes are numbered from 0.
// If there is any problem of any kind, returns the empty string.

function BARCODE_GetText(n:Integer; Text:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Get the text of the nth barcode recognized by the last BARCODE_Recognize.
// Please allow 64 characters in your text buffer.  Use a smaller buffer
// only if you *know* that the barcode type is limited to shorter strings.

function BARCODE_Type(n:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Return the type of the nth barcode recognized.

function BARCODE_GetRect(n:Integer; var L:Double; var T:Double; var R:Double; var B:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Get the rectangle bounding the nth barcode found in the last BARCODE_Recognize.
// Returns TRUE(1) if successful, FALSE(0) otherwise.  The only likely cause
// of a FALSE return would be an invalid value of n, or a null reference.
// L    = left edge
// T    = top edge
// R    = right edge
// B    = bottom edge

//--------- Fun With Containers --------

// Capability values are passed thru the TWAIN API in complex global
// memory structures called 'containers'.  EZTWAIN abstracts these
// containers with a handle (an integer) called an HCONTAINER.
// If you are coding in VB or similar, this is a 32-bit integer.
// The following functions provide reasonably comprehensive access
// to the contents of containers.  See also TWAIN_Get, TWAIN_Set.
//
// There are four shapes of containers, which I call 'formats'.
// Depending on its format, a container holds some 'items' - these
// are simple data values, all the same type in a given container.
// Item types are enumerated by TWTY_*

// Container formats, same codes as in TWAIN.H
const
        TWON_ARRAY = 3;
        TWON_ENUMERATION = 4;
        TWON_ONEVALUE = 5;
        TWON_RANGE = 6;


procedure CONTAINER_Free(hcon:HCONTAINER);
stdcall; external 'Eztwain3.dll'
// Free the memory and resources of a capability container.

function CONTAINER_Copy(hcon:HCONTAINER): HCONTAINER;
stdcall; external 'Eztwain3.dll'
// Create an exact copy of the container.

function CONTAINER_Equal(hconA:HCONTAINER; hconB:HCONTAINER): BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE (1) iff all properties of hconA and hconB are the same.

function CONTAINER_Format(hcon:HCONTAINER): Integer;
stdcall; external 'Eztwain3.dll'
// Return the 'format' of this container: TWON_ONEVALUE, etc.

function CONTAINER_ItemCount(hcon:HCONTAINER): Integer;
stdcall; external 'Eztwain3.dll'
// Return the number of values in the container.
// For a ONEVALUE, return 1.

function CONTAINER_ItemType(hcon:HCONTAINER): Integer;
stdcall; external 'Eztwain3.dll'
// Return the item type (what exact kind of values are in the container.)
// See the TWTY_* definitions in TWAIN.H

function CONTAINER_TypeSize(nItemType:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Return the size in bytes of an item of the specified type (TWTY_*)

procedure CONTAINER_GetStringValue(hcon:HCONTAINER; n:Integer; sText:PChar);
stdcall; external 'Eztwain3.dll'
function CONTAINER_FloatValue(hcon:HCONTAINER; n:Integer): Double;
stdcall; external 'Eztwain3.dll'
function CONTAINER_IntValue(hcon:HCONTAINER; n:Integer): Integer;
stdcall; external 'Eztwain3.dll'
function CONTAINER_StringValue(hcon:HCONTAINER; n:Integer): PChar;
stdcall; external 'Eztwain3.dll'
// Get the value of the nth item in the container.
// n is forced into the range 0 to ItemCount(hcon)-1.
// For string values, if the container items are not strings, they
// are converted to an equivalent string (e.g. "TRUE", "23", "2.37", etc.)


function CONTAINER_ContainsValue(hcon:HCONTAINER; d:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE(1) if the value d is one of the items in the container.
function CONTAINER_FindValue(hcon:HCONTAINER; d:Double): Integer;
stdcall; external 'Eztwain3.dll'
// Return the 0-origin index of the value d in the container.
// Return -1 if not found.

function CONTAINER_CurrentValue(hcon:HCONTAINER): Double;
stdcall; external 'Eztwain3.dll'
function CONTAINER_DefaultValue(hcon:HCONTAINER): Double;
stdcall; external 'Eztwain3.dll'
// Return the container's current or power-up (default) value.
// Array containers do not have these and will return -1.0.
// OneValue containers always return their (one) value.

function CONTAINER_DefaultIndex(hcon:HCONTAINER): Integer;
stdcall; external 'Eztwain3.dll'
function CONTAINER_CurrentIndex(hcon:HCONTAINER): Integer;
stdcall; external 'Eztwain3.dll'
// Return the index of the Default or Current value.
// Works on Enumerations, Ranges and OneValues.
// (Always returns 0 for a OneValue)
// Returns -1 for an Array.


function CONTAINER_MinValue(hcon:HCONTAINER): Double;
stdcall; external 'Eztwain3.dll'
function CONTAINER_MaxValue(hcon:HCONTAINER): Double;
stdcall; external 'Eztwain3.dll'
function CONTAINER_StepSize(hcon:HCONTAINER): Double;
stdcall; external 'Eztwain3.dll'
// Return the three parameters that define a Range container.
// Returns -1.0 if the container is not a Range.

// The following four functions create containers from scratch:
// nItemType is one of the TWTY_* item types from TWAIN.H
// nItems is the number of items, in an array or enumeration.
// dMin, dMax, dStep are the beginning, ending, and step value of a range.
function CONTAINER_OneValue(nItemType:Integer; dVal:Double): HCONTAINER;
stdcall; external 'Eztwain3.dll'
function CONTAINER_Range(nItemType:Integer; dMin:Double; dMax:Double; dStep:Double): HCONTAINER;
stdcall; external 'Eztwain3.dll'
function CONTAINER_Array(nItemType:Integer; nItems:Integer): HCONTAINER;
stdcall; external 'Eztwain3.dll'
function CONTAINER_Enumeration(nItemType:Integer; nItems:Integer): HCONTAINER;
stdcall; external 'Eztwain3.dll'

function CONTAINER_SetItem(hcon:HCONTAINER; n:Integer; dVal:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function CONTAINER_SetItemString(hcon:HCONTAINER; n:Integer; sVal:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function CONTAINER_SetItemFrame(hcon:HCONTAINER; n:Integer; l:Double; t:Double; r:Double; b:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Set the nth item of the container to dVal or pzText, or frame(l,t,r,b).
// NOTE: A OneValue is treated as an array with 1 element. 
// Return TRUE(1) if successful. FALSE(0) for error such as:
//    The container is not an array, enumeration, or onevalue
//    n < 0 or n >= CONTAINER_ItemCount(hcon)
//    the value cannot be represented in this container's ItemType. 

function CONTAINER_SelectDefaultValue(hcon:HCONTAINER; dVal:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function CONTAINER_SelectDefaultItem(hcon:HCONTAINER; n:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
function CONTAINER_SelectCurrentValue(hcon:HCONTAINER; dVal:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function CONTAINER_SelectCurrentItem(hcon:HCONTAINER; n:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Select the current or default value within an enumeration or range,
// by specifying either the value, or its index.
// Returns TRUE(1) if successful, FALSE(0) otherwise.
// This will fail if:
//    The container is not an enumeration or range.
//    dVal is not one of the values in the container
//    n < 0 or n >= CONTAINER_ItemCount(hcon)

function CONTAINER_DeleteItem(hcon:HCONTAINER; n:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Delete the nth item from an Array or Enumeration container.
// Returns TRUE(1) for success, FALSE(0) otherwise. Failure causes:
//   invalid container handle
//   container is not an array or enumeration
//   n < 0 or n >= ItemCount(hcon)

function CONTAINER_InsertItem(hcon:HCONTAINER; n:Integer; dVal:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// Insert an item with value dVal into the container at position n.
// If n < 0, the item is inserted at the end of the container.
// Return TRUE(1) on success, FALSE(0) on failure.
// Possible causes of failure:
//   NULL or invalid container handle
//   container format is not enumeration or array
//   memory allocation failed - heap corrupted, or out of memory.

//--- Very low level CONTAINER functions you probably won't need:
function CONTAINER_Wrap(nFormat:Integer; hcon:HANDLE): HCONTAINER;
stdcall; external 'Eztwain3.dll'
// Wrap a TWAIN container handle into an HCONTAINER object.
// Note: *Do Not* free the hcon - it is now owned by the HCONTAINER.
function CONTAINER_Unwrap(hcon:HCONTAINER): HANDLE;
stdcall; external 'Eztwain3.dll'
// Unwrap a TWAIN container from an HCONTAINER object - free the
// HCONTAINER and return the original TWAIN container handle.
function CONTAINER_Handle(hcon:HCONTAINER): HANDLE;
stdcall; external 'Eztwain3.dll'
// Retrieve the handle of the TWAIN container wrapped in our HCONTAINER
function CONTAINER_IsValid(hcon:HCONTAINER): BOOL;
stdcall; external 'Eztwain3.dll'
// Return TRUE if the argument seems to be a valid HCONTAINER object.

//--------- Low-level Capability Negotiation Functions --------

// Setting a capability is valid only in State 4 (TWAIN_SOURCE_OPEN)
// Getting a capability is valid in State 4 or any higher state.
 
function TWAIN_Get(uCap:Cardinal): HCONTAINER;
stdcall; external 'Eztwain3.dll'
// Issue a DAT_CAPABILITY/MSG_GET to the open source.
// Return a capability 'container' - the 'MSG_GET' value of the capability.
// Use CONTAINER_* functions to examine and modify the container object.
// Use CONTAINER_Free to release it when you are done with it.
// A return value of 0 indicates failure:  Call GetConditionCode
// or ReportLastError above.

function TWAIN_GetDefault(uCap:Cardinal): HCONTAINER;
stdcall; external 'Eztwain3.dll'
function TWAIN_GetCurrent(uCap:Cardinal): HCONTAINER;
stdcall; external 'Eztwain3.dll'
// Issue a DAT_CAPABILITY/MSG_GETDEFAULT or MSG_GETCURRENT.  See Get above.

function TWAIN_Set(uCap:Cardinal; hcon:HCONTAINER): BOOL;
stdcall; external 'Eztwain3.dll'
// Issue a DAT_CAPABILITY/MSG_SET to the open source,
// using the specified capability and container.
// Return value as for TWAIN_DS

function TWAIN_Reset(uCap:Cardinal): BOOL;
stdcall; external 'Eztwain3.dll'
// Issue a MSG_RESET on the specified capability.
// State must be 4.  Returns TRUE(1) if successful, FALSE(0) otherwise.

function TWAIN_GetCapBool(cap:Cardinal; bDefault:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// Issue a DAT_CAPABILITY/MSG_GETCURRENT on the specified capability,
// assuming the value type is TW_BOOL.
// If successful, return the returned value.  Otherwise return bDefault.
// This is only valid in State 4 (TWAIN_SOURCE_OPEN) or higher.

function TWAIN_SetCapability(cap:Cardinal; dValue:Double): BOOL;
stdcall; external 'Eztwain3.dll'
// The most general capability-setting function, it negotiates
// with the open device to set the given capability to the specified value.
// If successful, returns TRUE(1), otherwise FALSE(0).
// There must be a device open and in state 4, or an error is recorded.
// (See TWAIN_ReportLastError.)

function TWAIN_SetCapString(cap:Cardinal; sValue:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Set the value of a capability that takes a string value.
// You don't need to specify the 'itemType', EZTwain asks the driver
// which itemType it wants.

function TWAIN_SetCapBool(cap:Cardinal; bValue:BOOL): BOOL;
stdcall; external 'Eztwain3.dll'
// Shorthand for TWAIN_SetCapOneValue(cap, TWTY_BOOL, bValue);

function TWAIN_GetCapFix32(cap:Cardinal; dDefault:Double): Double;
stdcall; external 'Eztwain3.dll'
function TWAIN_GetCapUint16(cap:Cardinal; nDefault:Integer): Integer;
stdcall; external 'Eztwain3.dll'
function TWAIN_GetCapUint32(cap:Cardinal; lDefault:Integer): Integer;
stdcall; external 'Eztwain3.dll'

function TWAIN_SetCapFix32(Cap:Cardinal; dVal:Double): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetCapOneValue(Cap:Cardinal; ItemType:Cardinal; ItemVal:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Do a DAT_CAPABILITY/MSG_SET, on capability 'Cap' (e.g. ICAP_PIXELTYPE,
// CAP_AUTOFEED, etc.) using a TW_ONEVALUE container with the given item type
// and value.  Use SetCapFix32 for capabilities that take a FIX32 value,
// use SetCapOneValue for the various ints and uints.  These functions
// do not support FRAME or STR items.
// Return Value: TRUE (1) if successful, FALSE (0) otherwise.

function TWAIN_SetCapFix32R(Cap:Cardinal; Numerator:Integer; Denominator:Integer): BOOL;
stdcall; external 'Eztwain3.dll'
// Just like TWAIN_SetCapFix32, but uses the value Numerator/Denominator
// This is useful for languages that make it hard to pass double parameters.

function TWAIN_GetCapCurrent(Cap:Cardinal; ItemType:Cardinal; pVal:Pointer): BOOL;
stdcall; external 'Eztwain3.dll'
// Do a DAT_CAPABILITY/MSG_GETCURRENT on capability 'Cap'.
// Copy the current value out of the returned container into *pVal.
// If the operation fails (the source refuses the request), or if the
// container is not a ONEVALUE or ENUMERATION, or if the item type of the
// returned container is incompatible with the expected TWTY_ type in nType,
// returns FALSE.  If this function returns FALSE, *pVal is not touched.

function TWAIN_ToFix32(d:Double): Integer;
stdcall; external 'Eztwain3.dll'
// Convert a floating-point value to a 32-bit TW_FIX32 value that can be passed
// to e.g. TWAIN_SetCapOneValue
function TWAIN_ToFix32R(Numerator:Integer; Denominator:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Convert a rational number to a 32-bit TW_FIX32 value.
// Returns a TW_FIX32 value that approximates Numerator/Denominator

function TWAIN_Fix32ToFloat(nfix:Integer): Double;
stdcall; external 'Eztwain3.dll'
// Convert a TW_FIX32 value (as returned from some capability inquiries)
// to a double (floating point) value.


// The following functions support the relatively exotic CUSTOMDSDATA feature
// introduced in TWAIN 1.7.  This feature, if supported by a device, allows
// the application to read and set, all the settings of the device
// simultaneously with one block of data.  *The format of the data is defined
// by each device* and is undocumented.  So this is just a way to capture
// a snapshot of a particular device's settings, and then to
// restore that state at a later time.
//
// To find out if a device supports this feature, open the device and see if
// TWAIN_GetCapBool(CAP_CUSTOMDSDATA, FALSE) returns TRUE.
//
// The TWAIN_State() must be 4 or these functions will display an error.
//
function TWAIN_GetCustomDataToFile(sFilename:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
function TWAIN_SetCustomDataFromFile(sFilename:PChar): BOOL;
stdcall; external 'Eztwain3.dll'
// Both functions return TRUE(1) if successful, FALSE(0) otherwise.
// These functions will display an error message if called outside State 4.
// In case of failure, call LastErrorCode, ReportLastError, etc. for details.
// No file extension is assumed, you should provide one, such as ".dat".

//--------- Lowest-level functions for TWAIN protocol --------


function TWAIN_DS(DG:Cardinal; DAT:Cardinal; MSG:Cardinal; pData:Pointer): BOOL;
stdcall; external 'Eztwain3.dll'
// Pass the triplet (DG, DAT, MSG, pData) to the open data source if any.
// Returns TRUE(1) if the result code is TWRC_SUCCESS, FALSE(0) otherwise.
// The last result code can be retrieved with TWAIN_GetResultCode(), and the
// corresponding condition code can be retrieved with TWAIN_GetConditionCode().
// If no source is open this call will fail, result code TWRC_FAILURE,
// condition code TWCC_NODS.

function TWAIN_Mgr(DG:Cardinal; DAT:Cardinal; MSG:Cardinal; pData:Pointer): BOOL;
stdcall; external 'Eztwain3.dll'
// Pass a triplet to the Data Source Manager (DSM).
// Returns TRUE(1) for success, FALSE(0) otherwise.
// See GetResultCode, GetConditionCode, and ReportLastError functions
// for diagnosing and reporting a TWAIN_Mgr failure.
// If the Source Manager is not open, this call fails setting result code
// TWRC_FAILURE, and condition code=TWCC_SEQERROR (triplet out of sequence).


//--------- Advanced / Exotic --------

function TWAIN_SetImageReadyTimeout(nSec:Integer): Integer;
stdcall; external 'Eztwain3.dll'
// Set the maximum seconds to wait for an image-ready notification,
// (when one is expected i.e. after an enable) before posting a
// dialog that says 'Waiting for <device>' - with a Cancel button.
// Returns the previous setting.
// ** Default is -1 which disables this feature.
// With certain scanners there is a long delay between when the scanner
// is enabled and when it says "ready to scan".  Also, we have found
// a few scanners that intermittently fail to send "ready to scan" - by
// setting this timeout, you give your users a way to recover from
// this failure (otherwise the application has to be forcibly terminated.)

procedure TWAIN_AutoClickButton(sButtonName:PChar);
stdcall; external 'Eztwain3.dll'
// Calling this function before scanning tells EZTwain to attempt to
// automatically press a button when the device dialog appears.
// If you pass a null button name, EZTwain tries a number
// of likely choices (in English) including:
// "Scan" "Capture" "Acquire" "Scan Now" "Start Scan"  "Start Scanning"
// Case is ignored in the comparison ("SCAN" and "scan" are equivalent.)
// This function is useful when you want to automate operation of
// a device that insists on showing its user interface. 

procedure TWAIN_BreakModalLoop;
stdcall; external 'Eztwain3.dll'
// Expert: If EZTwain is hung inside an Acquire or GetMessage loop waiting for
// something to happen, this function will break the loop, as if the pending
// transfer had failed.  TWAIN_State() will be valid, and you will need to
// call appropriate functions to transition TWAIN as desired.

procedure TWAIN_EmptyMessageQueue;
stdcall; external 'Eztwain3.dll'
// Expert: Get and process any pending Windows messages for this thread.
// For example, keystrokes or mouse clicks.  Calling this during
// long processes will allow the user to interact with the UI.
// Use only if you understand the message pump.

//--------- Dosadi Special --------

function TWAIN_BuildName: PChar;
stdcall; external 'Eztwain3.dll'
// Return a string describing the build of EZTWAIN e.g. "Release - Build 6"

procedure TWAIN_GetBuildName(sName:PChar);
stdcall; external 'Eztwain3.dll'
// Like TWAIN_BuildName, but copies the build string into its parameter.
// The parameter is a string variable (char array in C/C++).
// You are responsible for allocating room for 128 8-bit characters
// in the string variable before calling this function.

function TWAIN_GetSourceIdentity(ptwid:Pointer): Integer;
stdcall; external 'Eztwain3.dll'

function TWAIN_GetImageInfo(ptwinfo:Pointer): Integer;
stdcall; external 'Eztwain3.dll'
// Issue a DG_IMAGE / DAT_IMAGEINFO / MSG_GET placing the returned data
// at ptwinfo.  The returned structure is a TW_IMAGEINFO - see twain.h.

procedure TWAIN_LogFile(fLog:Integer);
stdcall; external 'Eztwain3.dll'
// Turn logging eztwain.log on or off.
// By default the log file is written to C:\ but this
// can be overridden, see TWAIN_SetLogFolder below.
//
// fLog = 0    close log file and turn off logging
// The following flags can be combined to enable logging:
// 1            basic logging of TWAIN and EZTwain operations.
// 2            flush log constantly (use if EZTwain crashes)
// 4            log Windows messages flowing through EZTwain
const
        EZT_LOG_ON = 1;
        EZT_LOG_FLUSH = 2;
        EZT_LOG_MSGS = 4;


procedure TWAIN_SetLogFolder(sFolder:PChar);
stdcall; external 'Eztwain3.dll'
// Specify the folder (directory) where the eztwain.log file
// should be placed.  Default is "c:\" - the root of the C: drive.
// EZTwain appends a trailing 'slash' if needed.
// Passing NULL or "" resets to the default: "c:\"
// If the file cannot be created in this folder, EZTwain tries
// to create it in the Windows temp folder - this varies somewhat
// by Windows version, search for the Windows API call GetTempPath.

procedure TWAIN_WriteToLog(sText:PChar);
stdcall; external 'Eztwain3.dll'
// Write text to the EZTwain log file (c:\eztwain.log)
// If the text does not end with a newline, one is supplied.
// If logging is turned off, this call has no effect.
// Logging is controlled by TWAIN_LogFile - see above.


function TWAIN_SelfTest(f:Cardinal): Integer;
stdcall; external 'Eztwain3.dll'
// Perform internal self-test.
//   f      ignored for now
// Return value:
//   0      success
//   other  internal test failed.

function TWAIN_Blocked: BOOL;
stdcall; external 'Eztwain3.dll'
// Returns TRUE(1) if processing is inside TWAIN (Source Manager or a DS)
// FALSE(0) otherwise.  If the former, making any TWAIN call will
// fail immediately or deadlock the application (Not recommended.)


// To save the non-C/C++ folks the hassle of translating from twain.h:
const
        CAP_XFERCOUNT = $1;
        ICAP_COMPRESSION = $100;
        ICAP_PIXELTYPE = $101;
        ICAP_UNITS = $102;
        ICAP_XFERMECH = $103;
        CAP_AUTHOR = $1000;
        CAP_CAPTION = $1001;
        CAP_FEEDERENABLED = $1002;
        CAP_FEEDERLOADED = $1003;
        CAP_TIMEDATE = $1004;
        CAP_SUPPORTEDCAPS = $1005;
        CAP_EXTENDEDCAPS = $1006;
        CAP_AUTOFEED = $1007;
        CAP_CLEARPAGE = $1008;
        CAP_FEEDPAGE = $1009;
        CAP_REWINDPAGE = $100A;
        CAP_INDICATORS = $100B;
        CAP_SUPPORTEDCAPSEXT = $100C;
        CAP_PAPERDETECTABLE = $100D;
        CAP_UICONTROLLABLE = $100E;
        CAP_DEVICEONLINE = $100F;
        CAP_AUTOSCAN = $1010;
        CAP_THUMBNAILSENABLED = $1011;
        CAP_DUPLEX = $1012;
        CAP_DUPLEXENABLED = $1013;
        CAP_ENABLEDSUIONLY = $1014;
        CAP_CUSTOMDSDATA = $1015;
        CAP_ENDORSER = $1016;
        CAP_JOBCONTROL = $1017;
        CAP_ALARMS = $1018;
        CAP_ALARMVOLUME = $1019;
        CAP_AUTOMATICCAPTURE = $101A;
        CAP_TIMEBEFOREFIRSTCAPTURE = $101B;
        CAP_TIMEBETWEENCAPTURES = $101C;
        CAP_CLEARBUFFERS = $101D;
        CAP_MAXBATCHBUFFERS = $101E;
        CAP_DEVICETIMEDATE = $101F;
        CAP_POWERSUPPLY = $1020;
        CAP_CAMERAPREVIEWUI = $1021;
        CAP_DEVICEEVENT = $1022;
        CAP_PAGEMULTIPLEACQUIRE = $1023;
        CAP_SERIALNUMBER = $1024;
        CAP_FILESYSTEM = $1025;
        CAP_PRINTER = $1026;
        CAP_PRINTERENABLED = $1027;
        CAP_PRINTERINDEX = $1028;
        CAP_PRINTERMODE = $1029;
        CAP_PRINTERSTRING = $102A;
        CAP_PRINTERSUFFIX = $102B;
        CAP_LANGUAGE = $102C;
        CAP_FEEDERALIGNMENT = $102D;
        CAP_FEEDERORDER = $102E;
        CAP_PAPERBINDING = $102F;
        CAP_REACQUIREALLOWED = $1030;
        CAP_PASSTHRU = $1031;
        CAP_BATTERYMINUTES = $1032;
        CAP_BATTERYPERCENTAGE = $1033;
        CAP_POWERDOWNTIME = $1034;
        ICAP_AUTOBRIGHT = $1100;
        ICAP_BRIGHTNESS = $1101;
        ICAP_CONTRAST = $1103;
        ICAP_CUSTHALFTONE = $1104;
        ICAP_EXPOSURETIME = $1105;
        ICAP_FILTER = $1106;
        ICAP_FLASHUSED = $1107;
        ICAP_GAMMA = $1108;
        ICAP_HALFTONES = $1109;
        ICAP_HIGHLIGHT = $110A;
        ICAP_IMAGEFILEFORMAT = $110C;
        ICAP_LAMPSTATE = $110D;
        ICAP_LIGHTSOURCE = $110E;
        ICAP_ORIENTATION = $1110;
        ICAP_PHYSICALWIDTH = $1111;
        ICAP_PHYSICALHEIGHT = $1112;
        ICAP_SHADOW = $1113;
        ICAP_FRAMES = $1114;
        ICAP_XNATIVERESOLUTION = $1116;
        ICAP_YNATIVERESOLUTION = $1117;
        ICAP_XRESOLUTION = $1118;
        ICAP_YRESOLUTION = $1119;
        ICAP_MAXFRAMES = $111A;
        ICAP_TILES = $111B;
        ICAP_BITORDER = $111C;
        ICAP_CCITTKFACTOR = $111D;
        ICAP_LIGHTPATH = $111E;
        ICAP_PIXELFLAVOR = $111F;
        ICAP_PLANARCHUNKY = $1120;
        ICAP_ROTATION = $1121;
        ICAP_SUPPORTEDSIZES = $1122;
        ICAP_THRESHOLD = $1123;
        ICAP_XSCALING = $1124;
        ICAP_YSCALING = $1125;
        ICAP_BITORDERCODES = $1126;
        ICAP_PIXELFLAVORCODES = $1127;
        ICAP_JPEGPIXELTYPE = $1128;
        ICAP_TIMEFILL = $112A;
        ICAP_BITDEPTH = $112B;
        ICAP_BITDEPTHREDUCTION = $112C;
        ICAP_UNDEFINEDIMAGESIZE = $112D;
        ICAP_IMAGEDATASET = $112E;
        ICAP_EXTIMAGEINFO = $112F;
        ICAP_MINIMUMHEIGHT = $1130;
        ICAP_MINIMUMWIDTH = $1131;
        ICAP_AUTODISCARDBLANKPAGES = $1134;
        ICAP_FLIPROTATION = $1136;
        ICAP_BARCODEDETECTIONENABLED = $1137;
        ICAP_SUPPORTEDBARCODETYPES = $1138;
        ICAP_BARCODEMAXSEARCHPRIORITIES = $1139;
        ICAP_BARCODESEARCHPRIORITIES = $113A;
        ICAP_BARCODESEARCHMODE = $113B;
        ICAP_BARCODEMAXRETRIES = $113C;
        ICAP_BARCODETIMEOUT = $113D;
        ICAP_ZOOMFACTOR = $113E;
        ICAP_PATCHCODEDETECTIONENABLED = $113F;
        ICAP_SUPPORTEDPATCHCODETYPES = $1140;
        ICAP_PATCHCODEMAXSEARCHPRIORITIES = $1141;
        ICAP_PATCHCODESEARCHPRIORITIES = $1142;
        ICAP_PATCHCODESEARCHMODE = $1143;
        ICAP_PATCHCODEMAXRETRIES = $1144;
        ICAP_PATCHCODETIMEOUT = $1145;
        ICAP_FLASHUSED2 = $1146;
        ICAP_IMAGEFILTER = $1147;
        ICAP_NOISEFILTER = $1148;
        ICAP_OVERSCAN = $1149;
        ICAP_AUTOMATICBORDERDETECTION = $1150;
        ICAP_AUTOMATICDESKEW = $1151;
        ICAP_AUTOMATICROTATE = $1152;


// Container item types:
        TWTY_INT8 = $0;
        TWTY_INT16 = $1;
        TWTY_INT32 = $2;
        TWTY_UINT8 = $3;
        TWTY_UINT16 = $4;
        TWTY_UINT32 = $5;
        TWTY_BOOL = $6;
        TWTY_FIX32 = $7;
        TWTY_FRAME = $8;
        TWTY_STR32 = $9;
        TWTY_STR64 = $A;
        TWTY_STR128 = $B;
        TWTY_STR255 = $C;
        TWTY_STR1024 = $D;
        TWTY_UNI512 = $E;



// EZTwain History: See History.txt
implementation

end.
