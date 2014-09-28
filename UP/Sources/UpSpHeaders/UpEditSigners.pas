unit UpEditSigners;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
    cxControls, cxContainer, cxEdit, cxTextEdit, ActnList;

type
    TfrmEditSignInfo = class(TForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    FioText: TcxTextEdit;
    PostText: TcxTextEdit;
        lbl1: TLabel;
        Label1: TLabel;
    EditActionList: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
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

procedure TfrmEditSignInfo.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmEditSignInfo.ActOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfrmEditSignInfo.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
