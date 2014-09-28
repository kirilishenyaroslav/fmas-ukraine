unit UpPremiaOrderReasonForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  GlobalSPR, qFTools, uCommonSP, uCharControl, uFloatControl, cxMemo,
  cxDBEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxCheckBox,
  AppEvnts, ActnList;

type
  TfrmReasonForm = class(TForm)
    Label5: TLabel;
    Label6: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Reason: TcxTextEdit;
    Note: TcxMemo;
    EditForAll: TcxCheckBox;
    ActionList1: TActionList;
    OKBut: TAction;
    procedure OKButExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmReasonForm.OKButExecute(Sender: TObject);
begin
     if not qFCheckAll(Self) then exit;
     ModalResult := mrOk;
end;

end.
