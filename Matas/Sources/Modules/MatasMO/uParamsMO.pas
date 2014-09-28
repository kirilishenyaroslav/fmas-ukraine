unit uParamsMO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxTextEdit, cxMemo, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit;

type
  TParamsForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    cxTipForm: TcxComboBox;
    lbl3: TLabel;
    cxNameRep: TcxMemo;
    lbl4: TLabel;
    cxNumAkt: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actlst1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    
  end;

var
  ParamsForm: TParamsForm;

implementation

{$R *.dfm}

procedure TParamsForm.actOkExecute(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TParamsForm.actCancelExecute(Sender: TObject);
begin
Close;
end;

end.
