unit UpEditSigners;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
    cxControls, cxContainer, cxEdit, cxTextEdit;

type
    TfrmEditSignInfo = class(TForm)
        pnl1: TPanel;
        cxButton1: TcxButton;
        cxButton2: TcxButton;
        cxTextEdit1: TcxTextEdit;
        cxTextEdit2: TcxTextEdit;
        lbl1: TLabel;
        Label1: TLabel;
        procedure cxButton1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;


implementation

{$R *.dfm}

procedure TfrmEditSignInfo.cxButton1Click(Sender: TObject);
begin
    ModalResult := mrYes;
end;

end.
