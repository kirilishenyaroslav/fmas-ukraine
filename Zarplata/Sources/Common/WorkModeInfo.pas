unit WorkModeInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, Grids,
  cxControls, cxContainer, cxEdit, cxLabel;

type
  TfrmWorkModeInfo = class(TForm)
    WorkModeGrid: TStringGrid;
    Panel1: TPanel;
    cxButton1: TcxButton;
    Panel2: TPanel;
    WorkModeLabel: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWorkModeInfo: TfrmWorkModeInfo;

implementation

{$R *.dfm}

procedure TfrmWorkModeInfo.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

end.
