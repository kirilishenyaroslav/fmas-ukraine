unit UEditBody;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, cxControls, cxContainer, cxEdit,
    cxTextEdit, cxMemo;

type
    TfrmEditBody = class(TForm)
        Panel1: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        cxMemo1: TcxMemo;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;


implementation

{$R *.dfm}

procedure TfrmEditBody.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmEditBody.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

end.
