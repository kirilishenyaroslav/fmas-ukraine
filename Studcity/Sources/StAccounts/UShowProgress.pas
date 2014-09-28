unit UShowProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  ComCtrls;

type
  TfrmShowProcess = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    Label1: TLabel;
    CalcProgressBar: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowProcess: TfrmShowProcess;

implementation

{$R *.dfm}

end.
