unit UShowProgressThread;

interface

uses
  Classes, Forms,pFibDataSet,cxTextEdit,ComCtrls;

type
  TShowProgressThread = class(TThread)
  private
    { Private declarations }
    Form:TForm;
    PBStep:Integer;
    PB:TProgressBar;
  protected
    procedure Execute; override;
  public
    procedure UpdatePB;
    procedure ClearPB;
    constructor Create(CreateSuspended: Boolean; Form:TForm);overload;
    constructor Create(CreateSuspended: Boolean; PB:TProgressBar);overload;
  end;

implementation

uses SysUtils, UMainAccounts;




procedure TShowProgressThread.ClearPB;
begin
    PB.Position:=0;
    PB.Update;
end;

constructor TShowProgressThread.Create(CreateSuspended: Boolean; Form:TForm);
begin
    inherited Create(true);
    self.Form:=Form;
    PB:=TfrmAccountMain(self.Form).CalcProgressBar;
end;

constructor TShowProgressThread.Create(CreateSuspended: Boolean; PB:TProgressBar);
begin
    inherited Create(true);
    self.Form:=nil;
    self.PB:=PB;
end;


procedure TShowProgressThread.Execute;
var i:Integer;
begin
    PB.Min:=0;
    PB.Max:=10000;
    PB.Step:=1;

    PBStep:=0;
    Synchronize(UpdatePB);

    i:=1;
    While (not Terminated) do
    begin
        PBStep:=i;
        Synchronize(UpdatePB);
        Inc(i);

        if (i=PB.Max)
        then begin
             Synchronize(ClearPB);
             i:=0;
        end;
    end;

    PBStep:=PB.Max-1;
    Synchronize(UpdatePB);

    PBStep:=PB.Max;
    Synchronize(UpdatePB);


    if (i<>PB.Max)
    then begin
        PBStep:=0;
        Synchronize(UpdatePB);
    end;
end;

procedure TShowProgressThread.UpdatePB;
begin
    PB.Position:=PBStep;
    PB.Update;
end;

end.




