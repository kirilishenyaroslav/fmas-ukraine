unit UPrBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxProgressBar, ComCtrls;

type
  TfrmPrBar = class(TForm)
    cxProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmPrBar.FormCreate(Sender: TObject);
begin
     SetWindowLong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and WS_POPUP AND WS_BORDER);
end;

end.
