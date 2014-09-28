unit EditShifr;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
    cxControls, cxContainer, cxEdit, cxTextEdit, ActnList, cxLabel;

type
    TfrmEditShifr = class(TForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ShifrEdit: TcxTextEdit;
    SpecEdit: TcxTextEdit;
    EditActionList: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    lblShifr: TcxLabel;
    lblSpec: TcxLabel;
        procedure btnOkClick(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;


implementation

{$R *.dfm}

procedure TfrmEditShifr.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmEditShifr.ActOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfrmEditShifr.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
