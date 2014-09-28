unit UWProgressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, ComCtrls;

type
  TfmUWProgressForm = class(TForm)
    Timer1: TTimer;
    cxLabel1: TcxLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure WmNcHitTest(var m: TMessage); message WM_NCHITTEST;
    procedure Timer2Timer(Sender: TObject);
  private
    timer_cap : integer;
    st : smallint;
  public
    constructor Create(AOwner: TComponent; Text_on_form : String); reintroduce; overload;
  end;


implementation

{$R *.dfm}

{ TfmUWProgressForm }

constructor TfmUWProgressForm.Create(AOwner: TComponent;
  Text_on_form: String);
//var
//    r: HRGN;
begin
    inherited Create(AOwner);

//    r := CreateEllipticRgn(0, 140, 350, 205);
//    r := CreateEllipticRgn(50, 0, 600, 100);
//    r := CreatePolygonRgn( 0, 300);
//    CombineRgn(r, r, CreateEllipticRgn(50, 195, 450, 300), RGN_OR);
//    SetWindowRgn(Handle, r, true);

    timer_cap := 0;
    ProgressBar2.Position := 0;
    ProgressBar1.Position := 100;
    st                    := 2;
end;

procedure TfmUWProgressForm.Timer1Timer(Sender: TObject);
begin
    ProgressBar2.Position := ProgressBar2.Position + st;
    ProgressBar1.Position := ProgressBar1.Position - st;
    if (ProgressBar2.Position >= 100) or (ProgressBar2.Position <= 0) then st := -1*st;

//    if ProgressBar1.Position = 0 then ProgressBar1.Position := 100;
    Application.ProcessMessages;
end;

procedure TfmUWProgressForm.WmNcHitTest(var m: TMessage);
begin
    m.Result:=HTCAPTION;
end;

procedure TfmUWProgressForm.Timer2Timer(Sender: TObject);
begin
    timer_cap        := timer_cap + 1;
    cxLabel1.Caption := IntToStr(timer_cap) + ' c.';
end;

end.
