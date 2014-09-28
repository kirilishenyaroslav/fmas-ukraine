unit UAddVidanPlace;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
    cxLookAndFeelPainters, cxButtons, ActnList;

type
    TAddForm = class(TForm)
        VidanEdit: TcxTextEdit;
        Label1: TLabel;
        OkButton: TcxButton;
        CancelButton: TcxButton;
        ActionList1: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        procedure OkActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

function AddVidan: string;

implementation

{$R *.dfm}

function AddVidan: string;
var
    ViewForm: TAddForm;
begin
    ViewForm := TAddForm.Create(Application);
    if ViewForm.ShowModal = mrOk then
        Result := ViewForm.VidanEdit.Text
    else
        Result := '';
    ViewForm.Free;
end;

procedure TAddForm.OkActionExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TAddForm.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.
