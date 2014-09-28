unit ProcessUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, ExtCtrls;

type
  TExecuteProcedure = procedure of object;

  TProcessForm = class(TForm)
    Label1: TLabel;
    LeftLabel: TLabel;
    Progress: TcxProgressBar;
    CancelButton: TcxButton;
    Shape1: TShape;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    StartTime: Longint;
  public
  	Stop        : Boolean;
   procedure Step;
  end;

var
  ProcessForm: TProcessForm;


implementation

{$R *.dfm}

procedure TProcessForm.CancelButtonClick(Sender: TObject);
begin
 Stop        := True;
 ModalResult := mrCancel;
end;


procedure TProcessForm.FormActivate(Sender: TObject);
begin
 Screen.Cursor := crHourGlass;
 StartTime     := GetTickCount;
 Stop          := False;
end;

procedure TProcessForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Screen.Cursor := crDefault;
 Free;
 Stop := False;
end;

procedure TProcessForm.Step;
var
 t, h, m, s : Int64;
 str        : String;

 do_Repaint : boolean;
begin
 if Visible then begin
  if Progress.Position <> 0 then begin
   t := round((Progress.Properties.Max - Progress.Position) * (GetTickCount - StartTime) / Progress.Position);
   h := t div 3600000;
   m := (t - h*3600000) div 60000;
   s := (t - h*360000 - m*60000) div 1000;
   str := '';
   if h > 0 then str := IntToStr(h) + 'ч ';
   if m > 0 then str := str + IntToStr(m) + 'мин ';
   if s > 0 then str := str + IntToStr(s) + 'сек';

   do_Repaint := LeftLabel.Caption <> str;
   LeftLabel.Caption := str;

   if do_Repaint then LeftLabel.Repaint;
  end;

  Progress.Repaint;
 end;

 Application.ProcessMessages;
end;

end.
