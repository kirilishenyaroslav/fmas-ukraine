unit SplashFormBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxProgressBar;

type
  TfmSplashFormBank = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    cxProgressBar1: TcxProgressBar;
    Label2: TLabel;
    procedure DrawText(const StatusText : String);
  private
  public
  end;


implementation
USES Un_R_file_Alex;
{$R *.dfm}

{ TForm1 }

procedure TfmSplashFormBank.DrawText(const StatusText: String);
begin
    Label1.Caption := StatusText;
    Label2.Caption := Un_R_file_Alex.BANK;
    Repaint;
end;

end.
