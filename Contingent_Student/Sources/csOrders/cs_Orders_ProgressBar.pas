unit cs_Orders_ProgressBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, cxControls, cxContainer, cxEdit,
  cxProgressBar, cxDBProgressBar;

type
  TForm_cs_Orders_ProgressBar = class(TForm)
    ProgressBarExport: TProgressBar;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetProgressBar(MaxStep: Integer);
  end;

var
  Form_cs_Orders_ProgressBar: TForm_cs_Orders_ProgressBar;

implementation

{$R *.dfm}

procedure TForm_cs_Orders_ProgressBar.SetProgressBar(MaxStep : integer);
begin
    ProgressBarExport.Smooth := False;
    ProgressBarExport.Max    := MaxStep;
    ProgressBarExport.Step   := ProgressBarExport.Max div MaxStep;
end;

end.
