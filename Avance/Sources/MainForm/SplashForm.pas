unit SplashForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxProgressBar;

type
  TfmSplashForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    cxProgressBar1: TcxProgressBar;
    procedure DrawText(const StatusText : String);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  fmSplashForm: TfmSplashForm;

implementation
USES Un_R_file_Alex;

{$R *.dfm}

{ TForm1 }

procedure TfmSplashForm.DrawText(const StatusText: String);
begin
    Label1.Caption := StatusText;
    Repaint;
end;

procedure TfmSplashForm.FormCreate(Sender: TObject);
begin
  Label2.Caption := Un_R_file_Alex.URSPL;
end;

end.
