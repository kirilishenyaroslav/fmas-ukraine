unit PeriodEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
    cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, StdCtrls,
    cxButtons, BaseTypes, ActnList;

type
    TfrmPeriodEdit = class(TForm)
        DatePeriodBeg: TcxDateEdit;
        DatePeriodEnd: TcxDateEdit;
        lblPeriodBeg: TcxLabel;
        lblPeriodEnd: TcxLabel;
        btnOk: TcxButton;
        btnCancel: TcxButton;
        NumOrderE: TcxTextEdit;
        DateOrderE: TcxDateEdit;
        lbNumOrder: TcxLabel;
        lbDateOrder: TcxLabel;
        ActionList1: TActionList;
        OkAct: TAction;
        CancelAct: TAction;
        procedure CancelActExecute(Sender: TObject);
        procedure OkActExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmPeriodEdit: TfrmPeriodEdit;

implementation

{$R *.dfm}

procedure TfrmPeriodEdit.CancelActExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfrmPeriodEdit.OkActExecute(Sender: TObject);
begin
    if ((DateToStr(DatePeriodBeg.Date) = '00.00.0000') or (DateToStr(DatePeriodEnd.Date) = '00.00.0000'))
        then begin
        agMessageDlg('Увага!', 'Початок періода або кінець не можуть бути пустими!', mtInformation, [mbOK]);
        Exit;
    end;
    if (DatePeriodBeg.Date > DatePeriodEnd.Date) then
    begin
        agMessageDlg('Увага!', 'Початок періода не можє бути більше ніж кінець періода!', mtInformation, [mbOK]);
        Exit;
    end;
    ModalResult := mrOk;
end;

end.
