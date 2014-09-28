{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clDEditors;

interface

{$I clVer.inc}

uses
  Classes, {$IFDEF DELPHI6}DesignEditors, DesignIntf, {$ELSE} DsgnIntf, {$ENDIF}
  TypInfo, ShellApi, Windows, dialogs, Forms, Sysutils;
  
type
  TclBaseEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TclSaveFileProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TclOpenFileProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

implementation

const
  hcSaveToFileDialog = 0;
  hcOpenFileDialog = 0;
  cSite = 'http://www.clevercomponents.com';
  cVersion = 'Version 6.2';

{ TclBaseEditor }

procedure TclBaseEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShellExecute(0, 'open', cSite, nil, nil, SW_SHOW);
  end;
end;

function TclBaseEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := cSite;
    1: Result := cVersion;
  end;
end;

function TclBaseEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

{ TclSaveFileProperty }

procedure TclSaveFileProperty.Edit;
var
  dlg: TSaveDialog;
begin
  dlg := TSaveDialog.Create(Application);
  try
    dlg.Filename := GetValue();
    dlg.InitialDir := ExtractFilePath(dlg.Filename);
    dlg.Filter := '*.*';
    dlg.HelpContext := hcSaveToFileDialog;
    dlg.Options := dlg.Options + [ofShowHelp, ofEnableSizing];
    if dlg.Execute then SetValue(dlg.Filename);
  finally
    dlg.Free();
  end;
end;

function TclSaveFileProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;

{ TclOpenFileProperty }

procedure TclOpenFileProperty.Edit;
var
  dlg: TOpenDialog;
begin
  dlg := TOpenDialog.Create(Application);
  try
    dlg.Filename := GetValue();
    dlg.InitialDir := ExtractFilePath(dlg.Filename);
    dlg.Filter := '*.*';
    dlg.HelpContext := hcOpenFileDialog;
    dlg.Options := dlg.Options + [ofShowHelp, ofEnableSizing];
    if dlg.Execute then SetValue(dlg.Filename);
  finally
    dlg.Free();
  end;
end;

function TclOpenFileProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;

end.
