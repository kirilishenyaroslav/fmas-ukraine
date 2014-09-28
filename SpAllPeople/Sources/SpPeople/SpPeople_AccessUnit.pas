unit SpPeople_AccessUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
    cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit;

type
    TAccessForm = class(TForm)
        LabSeria: TLabel;
        LabNomer: TLabel;
        SeriaEdit: TcxMaskEdit;
        NomerEdit: TcxMaskEdit;
        LabText: TLabel;
        CancelButton: TcxButton;
        OkButton: TcxButton;
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
    private
        { Private declarations }
    public
        Seria: string;
        Number: string;
    end;

var
    AccessForm: TAccessForm;

implementation

{$R *.dfm}

procedure TAccessForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TAccessForm.OkButtonClick(Sender: TObject);
begin
    if VarIsNull(SeriaEdit.EditValue) then
        Seria := ''
    else Seria := VarToStr(SeriaEdit.EditValue);
    if VarIsNull(NomerEdit.EditValue) then
        Number := ''
    else Number := VarToStr(NomerEdit.EditValue);
    ModalResult := mrOk;
end;

end.

