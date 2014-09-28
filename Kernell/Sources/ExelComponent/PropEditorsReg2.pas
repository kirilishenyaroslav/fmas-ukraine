unit PropEditorsReg2;

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

uses SysUtils, Classes, Dialogs, CellFormats2, XLSFonts2, Graphics,
{$ifdef OLD_COMPILER}
 DsgnIntf;
{$else}
 DesignEditors,
 DesignIntf;
{$endif}

type TPictureNameProperty = class(TStringProperty)
private
protected
    procedure GetValueList(List: TStrings);
public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    end;

type TFilenameProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

implementation

{ TPictureNameProperty }

function TPictureNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TPictureNameProperty.GetValueList(List: TStrings);
// var
//  i: integer;
//  XLSPictures: TXLSPictures;
begin
{
  XLSPictures := TSheetPictures(TSheetPicture(GetComponent(0)).Collection).XLSPictures;
  for i := 0 to XLSPictures.Count - 1 do
    List.Add(XLSPictures[i].Filename);
}    
end;

procedure TPictureNameProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

{ TFilenameProperty }

procedure TFilenameProperty.Edit;
var
  S: string;
  Dlg: TOpenDialog;
begin
  S := GetStrValue;
  Dlg := TOpenDialog.Create(Nil);
  try
    Dlg.Filter := 'All (*.jpg, *.jpeg, *.png, *.bmp)|*.jpg; *.jpeg; *.png; *.bmp|JPEG Images (*.jpeg)|*.jpeg|JPG Images (*.jpg)|*.jpg|PNG Images (*.png)|*.png|Bitmap images (*.bmp)|*.bmp|All files (*.*)|*.*';
    Dlg.Filename := S;
    if Dlg.Execute then
      S := Dlg.Filename;
  finally
    SetStrValue(S);
    Dlg.Free;
  end;
end;

function TFilenameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

end.
