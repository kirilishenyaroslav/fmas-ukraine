unit UDoOtchThread;

interface

uses
  Classes, Forms,pFibDataSet,cxTextEdit,ComCtrls;

type
  TCalcThread = class(TThread)
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
    constructor Create(CreateSuspended: Boolean; Form:TForm; FormIndex:Integer);overload;
  end;

implementation

uses UDoOtch, UDoRests,  UDoSmRecalc,   SysUtils;


procedure TCalcThread.ClearPB;
begin
    PB.Position:=0;
    PB.Update;
end;

constructor TCalcThread.Create(CreateSuspended: Boolean; Form:TForm;FormIndex:Integer);
begin
    inherited Create(true);
    self.Form:=Form;
    if (FormIndex=0) then PB:=TfrmDoOtch(self.Form).CalcProgressBar;
    if (FormIndex=2) then PB:=TfrmBURecalc(self.Form).CalcProgressBar;
end;

procedure TCalcThread.Execute;
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

    if (i<>PB.Max)
    then begin
        PBStep:=PB.Max;
        Synchronize(UpdatePB);
    end;
end;




procedure TCalcThread.UpdatePB;
begin
    PB.Position:=PBStep;
    PB.Update;
end;

end.
