{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clActionInfo;

interface

{$I clVer.inc}

uses
  Forms, Classes, Controls, StdCtrls, clHtmlParser, Windows, Messages;

type
  THttpActionInfo = class(TForm)
    btnOK: TButton;
    lblCaption: TLabel;
    edtAction: TEdit;
  public
    class procedure ShowAction(const AUrl: string);
  end;

implementation

{$R *.DFM}

{ THttpActionInfo }

class procedure THttpActionInfo.ShowAction(const AUrl: string);
var
  Dlg: THttpActionInfo;
begin
  Dlg := THttpActionInfo.Create(nil);
  try
    Dlg.edtAction.Text := AUrl;
    Dlg.ShowModal();
  finally
    Dlg.Free();
  end;
end;

end.
