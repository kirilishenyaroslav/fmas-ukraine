unit St_Services_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit;

type
  TfrmServiceEdit = class(TForm)
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
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

procedure TfrmServiceEdit.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmServiceEdit.cxButton2Click(Sender: TObject);
begin
  ModalResult := mrNo;
end;

end.
