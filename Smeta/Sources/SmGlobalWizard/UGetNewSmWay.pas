unit UGetNewSmWay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxRadioGroup, ExtCtrls;

type
  TfrmNewSmWay = class(TForm)
    Panel1: TPanel;
    cxRadioGroup1: TcxRadioGroup;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmNewSmWay.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmNewSmWay.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
