unit UpEditText;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
    StdCtrls, Buttons, ExtCtrls, ActnList;

type
    TfrmShablonEdit = class(TForm)
        Panel1: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        cxMemoText: TcxMemo;
        Panel2: TPanel;
        LblText: TcxLabel;
        ActionList1: TActionList;
        OKAction: TAction;
        CancelAction: TAction;
        procedure OKActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmShablonEdit: TfrmShablonEdit;

implementation

{$R *.dfm}

procedure TfrmShablonEdit.OKActionExecute(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmShablonEdit.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrNo;
end;

end.
