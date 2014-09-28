unit ProcessUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TProcessForm = class(TForm)
    Progress: TProgressBar;
    CancelButton: TBitBtn;
    Label1: TLabel;
    LeftLabel: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    StartTime: Longint;
  public
  	Stop: Boolean;
    procedure Step;
    
  end;

var
  ProcessForm: TProcessForm;


implementation

{$R *.dfm}

procedure TProcessForm.CancelButtonClick(Sender: TObject);
begin
    Stop := True;
end;

procedure TProcessForm.FormActivate(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    StartTime := GetTickCount;
    Stop := False;
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
    t, h, m, s: Longint;
    str: String;
begin
    Progress.StepBy(1);
    if Visible then
    begin
        if Progress.Position <> 0 then
        begin
            t := round((Progress.Max - Progress.Position) * (GetTickCount - StartTime) / Progress.Position);
            h := t div 3600000;
            m := (t - h*3600000) div 60000;
            s := (t - h*360000 - m*60000) div 1000;
            str := '';
            if h > 0 then str := IntToStr(h) + 'г ';
            if m > 0 then str := str + IntToStr(m) + 'хв ';
            if s > 0 then str := str + IntToStr(s) + ' сек';
            LeftLabel.Caption := str;
            LeftLabel.Repaint;
        end;
        Progress.Repaint;
    end;
    Application.ProcessMessages;
end;

end.
