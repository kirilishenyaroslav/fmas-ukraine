unit UProgressEX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmACardProgress = class(TForm)
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoProgress;
  end;



implementation

{$R *.dfm}

procedure TfrmACardProgress.DoProgress;
begin
     {while True do
     begin
          ProgressBar1.StepIt;
          ProgressBar1.Update;
          Self.Update;
          Sleep(1000);
          Application.ProcessMessages;

          if ProgressBar1.Position=ProgressBar1.Max
          then begin
                    ProgressBar1.Position:=0;
                    ProgressBar1.Update;
                    Self.Update;
                    Application.ProcessMessages;
          end;
     end;}

end;

procedure TfrmACardProgress.FormShow(Sender: TObject);
begin
    { while True do
     begin
          ProgressBar1.StepIt;
          ProgressBar1.Update;  }
          Self.Update;
          //Sleep(1000);
          Application.ProcessMessages;

          {if ProgressBar1.Position=ProgressBar1.Max
          then begin
                    ProgressBar1.Position:=0;
                    ProgressBar1.Update;
                    Self.Update;
                    Application.ProcessMessages;
          end;
     end; }

end;

end.
