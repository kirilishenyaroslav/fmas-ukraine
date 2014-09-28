unit splash_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  Tsplash = class(TForm)
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
  splash: Tsplash;

implementation

{$R *.dfm}

procedure Tsplash.FormCreate(Sender: TObject);
begin
     SetWindowlong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and WS_POPUP AND WS_BORDER);
end;

end.
