unit SplashFormKassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxProgressBar;

type
  TfmSplashForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    cxProgressBar1: TcxProgressBar;
    Label2: TLabel;
    procedure DrawText(const StatusText : String);
  private
  public
  end;

var
  fmSplashForm: TfmSplashForm;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfmSplashForm.DrawText(const StatusText: String);
begin
    Label1.Caption := StatusText;
    Repaint;
end;

end.
