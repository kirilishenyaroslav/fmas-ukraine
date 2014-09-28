unit gr_uThreadWaitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, ExtCtrls;

type
  TFThreadWait = class(TForm)
    Gauge1: TGauge;
  private
  public
  end;

type TThreadWait = class(TThread)
 protected
  pGauge:TGauge;
  pTimer:TTimer;
  procedure onTimer(Sender:TObject);
 private
 public
  procedure Execute;override;
  property Gauge:TGauge read pGauge write pGauge;
end;

function ShowWaitForm(AOwner: TForm): TForm;
procedure CloseWaitForm(wf: TForm);

implementation

{$R *.dfm}

function ShowWaitForm(AOwner: TForm):TForm;
var
 wf : TFThreadWait;
begin
 wf := TFThreadWait.Create(AOwner);
 Result         := wf;
 Result.Show;
 Result.Update;
end;

procedure CloseWaitForm(wf: TForm);
begin
 if wf.Owner <> nil then (wf.Owner as TForm).Enabled := True;
 wf.Free;
end;

procedure TThreadWait.Execute;
begin
 pTimer := TTimer.Create(Application.MainForm);
 pTimer.Interval := 60;
 pTimer.OnTimer := onTimer;
 pGauge.Progress:=0;
 pGauge.MaxValue := 100;
 pGauge.MinValue := 0;
 while (not Terminated) do pTimer.Enabled := True;
 pTimer.Destroy;
end;

procedure TThreadWait.onTimer(Sender:Tobject);
begin
 pGauge.Progress:=pGauge.Progress+1;
 Synchronize(pGauge.Update);
end;

end.
