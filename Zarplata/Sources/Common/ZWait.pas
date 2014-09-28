unit ZWait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RxGIF, jpeg;

type
  TWait_Form = class(TForm)
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function  ShowWaitForm(AOwner : TForm) : TForm;
  procedure CloseWaitForm(wf : TForm);

var
  Wait_Form: TWait_Form;

implementation

{$R *.dfm}

{ TWait_Form }

function ShowWaitForm(AOwner: TForm): TForm;
var
 wf : TWait_Form;
begin
 wf := TWait_Form.Create(AOwner);

 if AOwner <> nil then begin
  wf.Left := AOwner.Left + (AOwner.Width  - wf.Width)  div 2;
  wf.Top  := AOwner.Top  + (AOwner.Height - wf.Height) div 2 + 60;
 end
 else begin
  wf.Left := (Screen.Width  - wf.Width)  div 2;
  wf.Top  := (Screen.Height - wf.Height) div 2;
 end;

 Result         := wf;

 if AOwner <> nil then AOwner.Enabled := False;

 Result.Show;
 Result.Update;
end;

procedure CloseWaitForm(wf: TForm);
begin
 if wf.Owner <> nil then (wf.Owner as TForm).Enabled := True;
 
 wf.Free;
end;

end.
