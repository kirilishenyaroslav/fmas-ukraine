unit uSP_Text_Order_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls;

type
  TfmSP_Text_OrderEdit = class(TForm)
    lbl1: TLabel;
    pnl1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxTextEdit1: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSP_Text_OrderEdit: TfmSP_Text_OrderEdit;

implementation

{$R *.dfm}

procedure TfmSP_Text_OrderEdit.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfmSP_Text_OrderEdit.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

end.
