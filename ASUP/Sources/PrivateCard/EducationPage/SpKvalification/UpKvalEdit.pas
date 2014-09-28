unit UpKvalEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
    cxControls, cxContainer, cxEdit, cxTextEdit, ActnList, cxLabel;

type
    TfrmKvalEdit = class(TForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    KvalEdit: TcxTextEdit;
    EditActionList: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    lblShifr: TcxLabel;
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

procedure TfrmKvalEdit.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmKvalEdit.ActOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfrmKvalEdit.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
