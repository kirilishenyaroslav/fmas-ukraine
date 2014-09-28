unit UTypeFinanceEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxCheckBox;

type
  TfrmEditTypeFinance = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    NameText: TcxTextEdit;
    CodeText: TcxTextEdit;
    NameExtText: TcxTextEdit;
    MLetterText: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    InsertAsRoot: TcxCheckBox;
    lbl1: TLabel;
    cxtxtdtKaznCode: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmEditTypeFinance.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmEditTypeFinance.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
