{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clUpdateInfoForm;

interface

{$I clVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, clWebUpdate;

type
  TfrmUpdateInfo = class(TForm)
    Bevel1: TBevel;
    lblInfo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtAuthor: TEdit;
    edtProduct: TEdit;
    edtEmail: TEdit;
    btnUpdate: TButton;
    btnCancel: TButton;
    memUpdates: TMemo;
  public
    class function ShowInfo(AWebUpdate: TclWebUpdate): Boolean;
  end;

implementation

{$R *.dfm}

{ TfrmUpdateInfo }

class function TfrmUpdateInfo.ShowInfo(AWebUpdate: TclWebUpdate): Boolean;
var
  i: Integer;
  Dlg: TfrmUpdateInfo;
begin
  Dlg := TfrmUpdateInfo.Create(nil);
  try
    Dlg.lblInfo.Caption := Format(Dlg.lblInfo.Caption,
      [AWebUpdate.ActualInfo.LastVersion,
      AWebUpdate.UpdateInfo[AWebUpdate.UpdateInfo.Count - 1].Version,
      AWebUpdate.ProductURL]);
    Dlg.memUpdates.Lines.Clear();
    for i := 0 to AWebUpdate.UpdateInfo.Count - 1 do
    begin
      Dlg.memUpdates.Lines.Add(Format('Version: %s, Size: %s, URL: %s',
        [AWebUpdate.UpdateInfo[i].Version, AWebUpdate.UpdateInfo[i].Size, AWebUpdate.UpdateInfo[i].URL]));
    end;

    Dlg.edtAuthor.Text := AWebUpdate.Author;
    Dlg.edtProduct.Text := AWebUpdate.ProductName;
    Dlg.edtEmail.Text := AWebUpdate.Email;
    Result := (Dlg.ShowModal() = mrOk);
  finally
    Dlg.Free();
  end;
end;

end.
