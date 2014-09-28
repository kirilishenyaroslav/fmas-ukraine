unit uPremiaRecalcForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, StdCtrls, Buttons, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, uFControl, uLabeledFControl, uCharControl,
  uFloatControl, cxCurrencyEdit;

type
  TfmRecalcForm= class(TForm)
    RndLabel: TcxLabel;
    OkButton: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    RecalcEdit: TcxCurrencyEdit;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRecalcForm: TfmRecalcForm;

implementation

{$R *.dfm}

procedure TfmRecalcForm.OkActionExecute(Sender: TObject);
begin
    ModalResult:=mrOk;
end;

procedure TfmRecalcForm.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmRecalcForm.OkButtonClick(Sender: TObject);
begin
// if VarIsNull()
end;

initialization
    RegisterClass(TfmRecalcForm);
end.
