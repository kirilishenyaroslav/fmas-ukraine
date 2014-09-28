unit SplashFormUW;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxProgressBar;

type
  TfmSplashFormUW = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    cxProgressBar1: TcxProgressBar;
    Label2: TLabel;
    procedure DrawText(const StatusText : String);
  private
  public
  end;


implementation
USES UWResourcesUnit;
{$R *.dfm}

{ TForm1 }

procedure TfmSplashFormUW.DrawText(const StatusText: String);
begin
    Label1.Caption := StatusText;
    Label2.Caption := UWResourcesUnit.UV_CAPTION[1];
    Repaint;
end;

end.
