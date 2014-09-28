unit UpSpecEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
    cxControls, cxContainer, cxEdit, cxTextEdit, ActnList, cxLabel;

type
    TfrmSpecEdit = class(TForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    SpecEdit: TcxTextEdit;
    EditActionList: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
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

procedure TfrmSpecEdit.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmSpecEdit.ActOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfrmSpecEdit.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
