unit splash_formhtml;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TsplashHtml = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    lbProcess: TLabel;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  splashHtml: TsplashHtml;

implementation

{$R *.dfm}

procedure TsplashHtml.FormCreate(Sender: TObject);
begin
     SetWindowLong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and WS_POPUP AND WS_BORDER);
end;

end.
