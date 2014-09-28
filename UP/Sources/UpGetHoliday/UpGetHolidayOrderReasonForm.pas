Unit UpGetHolidayOrderReasonForm;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
    GlobalSPR, qFTools, uCommonSP, uCharControl, uFloatControl, cxMemo,
    cxDBEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxCheckBox;

Type
    TfrmReasonForm = Class(TForm)
        Label5: TLabel;
        Label6: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Reason: TcxTextEdit;
        Note: TcxMemo;
        EditForAll: TcxCheckBox;
        Procedure OkButtonClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    End;


Implementation

{$R *.dfm}

Procedure TfrmReasonForm.OkButtonClick(Sender: TObject);
Begin
    If Not qFCheckAll(Self) Then
        exit;
    ModalResult := mrOk;
End;

End.
