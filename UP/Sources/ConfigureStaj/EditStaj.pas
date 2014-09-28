unit EditStaj;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ActnList, cxControls, cxContainer, cxEdit, cxTextEdit,
    cxCheckBox, cxLabel, cxLookAndFeelPainters, StdCtrls, cxButtons,
    cxMaskEdit, cxDropDownEdit, cxCalc;

type
    TfrmEditStaj = class(TForm)
        ActionList1: TActionList;
        OkAct: TAction;
        CancelAct: TAction;
        NameStajEdit: TcxTextEdit;
        PrintNameStajEdit: TcxTextEdit;
        IsUseStaj: TcxCheckBox;
        NameStajLabel: TcxLabel;
        PrintNameStajLabel: TcxLabel;
        BtnAdd: TcxButton;
        BtnCancel: TcxButton;
        cMinOklad: TcxCalcEdit;
        RCLab: TcxLabel;
        IsShtat: TcxCheckBox;
        cxLabel1: TcxLabel;
        cxMinRateSovm: TcxCalcEdit;
        procedure OkActExecute(Sender: TObject);
        procedure CancelActExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmEditStaj: TfrmEditStaj;

implementation

{$R *.dfm}

procedure TfrmEditStaj.OkActExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmEditStaj.CancelActExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.

