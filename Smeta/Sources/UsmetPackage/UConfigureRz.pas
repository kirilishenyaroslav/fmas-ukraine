unit UConfigureRz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxRadioGroup;

type
  TfrmConfRazd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxRadioGroup1: TcxRadioGroup;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmConfRazd.cxButton1Click(Sender: TObject);
begin
     ModalResult:=MrYes;
end;

procedure TfrmConfRazd.cxButton2Click(Sender: TObject);
begin
     ModalResult:=MrNo;
end;

end.
