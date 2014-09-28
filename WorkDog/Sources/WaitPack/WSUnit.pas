unit WSUnit;

interface
uses Classes, Forms, Controls, ExtCtrls, StdCtrls, Graphics, ComCtrls;

function WaitScreenShow(AOwner : TForm; const Text : string = 'Чекайте. Йде вибір даних...') : TForm;
function WaitScreenShowWithProgress(AOwner : TForm; const max : integer = 100; const Text : string = 'Чекайте. Йде вибір даних...') : TForm;
procedure WaitScreenStep(frm : TForm; const step : integer = 1);
procedure WaitScreenClose(frm : TForm);

implementation
{$R pic.res}

function WaitScreenShow(AOwner : TForm; const Text : string = 'Чекайте. Йде вибір даних...') : TForm;
var
 f : TForm;
 p : TPanel;
 b : TBevel;
 l : TLabel;
 i : TImage;
begin
 f := TForm.Create(AOwner);
 f.Width := 257;
 f.Height := 57;
 f.Left := AOwner.Left + AOwner.Width div 2 - f.Width div 2;
 f.Top := AOwner.Top + AOwner.Height div 2 - f.Height div 2;
 f.BorderStyle := bsNone;

 p := TPanel.Create(f);
 p.Parent := f;
 p.Align := alClient;

 l := TLabel.Create(f);
 l.Parent := p;
 l.AutoSize := false;
 l.Alignment := taCenter;
 l.Layout := tlCenter;
 l.Left := 40;
 l.Top := 8;
 l.Width := 209;
 l.Height := 41;
 l.Caption := text;
 l.Font.Style := [fsBold];
 l.Font.Color := clBlue;
 l.Font.Size := 10;

 b := TBevel.Create(f);
 b.Parent := p;
 b.Left := 8;
 b.Top := 8;
 b.Width := 241;
 b.Height := 41;

 i := TImage.Create(f);
 i.Parent := p;
 i.Left := 16;
 i.Top := 16;
 i.Transparent := true;
 i.Picture.Bitmap.LoadFromResourceName(HInstance, 'wait');
{ i.Picture.Bitmap.Transparent := true;
 i.Picture.Bitmap.TransparentColor := i.Picture.Bitmap.Canvas.Pixels[0, 0];
 i.Picture.Bitmap.TransparentMode := tmFixed;}

 Result := f;
 AOwner.Enabled := false;
 if TForm(AOwner).Visible then f.Show;
 f.Repaint;
// Application.ProcessMessages;
end;

function WaitScreenShowWithProgress(AOwner : TForm; const max : integer = 100; const Text : string = 'Чекайте. Йде вибір даних...') : TForm;
var
 f : TForm;
 p : TPanel;
 b : TBevel;
 l : TLabel;
 i : TImage;
 pbar : TProgressBar;
begin
 f := TForm.Create(AOwner);
 f.Width := 257;
 f.Height := 57;
 f.Left :=  AOwner.Left + AOwner.Width div 2 - f.Width div 2;
 f.Top := AOwner.Top +  AOwner.Height div 2 - f.Height div 2;
 f.BorderStyle := bsNone;

 p := TPanel.Create(f);
 p.Parent := f;
 p.Align := alClient;

 l := TLabel.Create(f);
 l.Parent := p;
 l.AutoSize := false;
 l.Alignment := taCenter;
 l.Layout := tlCenter;
 l.Left := 40;
 l.Top := 10;
 l.Width := 209;
 l.Height := 18;
 l.Caption := text;
 l.Font.Style := [fsBold];
 l.Font.Color := clBlue;
 l.Font.Size := 10;

 b := TBevel.Create(f);
 b.Parent := p;
 b.Left := 8;
 b.Top := 8;
 b.Width := 241;
 b.Height := 41;

 i := TImage.Create(f);
 i.Parent := p;
 i.Left := 16;
 i.Top := 16;
 i.Transparent := true;
 i.Picture.Bitmap.LoadFromResourceName(HInstance, 'wait');

 pbar := TProgressBar.Create(f);
 pbar.Parent := p;
 pbar.Left := 42;
 pbar.Top := 28;
 pbar.Max := max;
 pbar.Width := 200;

{ i.Picture.Bitmap.Transparent := true;
 i.Picture.Bitmap.TransparentColor := i.Picture.Bitmap.Canvas.Pixels[0, 0];
 i.Picture.Bitmap.TransparentMode := tmFixed;}

 Result := f;
 if TForm(AOwner).Visible then AOwner.Enabled := false;
 f.Show;
 f.Repaint;
 //Application.ProcessMessages;
end;

procedure WaitScreenStep(frm : TForm; const step : integer = 1);
begin
 TProgressBar(frm.Components[4]).StepBy(step);
 Application.ProcessMessages;
end;

procedure WaitScreenClose(frm : TForm);
begin
 TForm(frm.Owner).Enabled := true;
 frm.Free;
 frm := nil;
end;


end.
