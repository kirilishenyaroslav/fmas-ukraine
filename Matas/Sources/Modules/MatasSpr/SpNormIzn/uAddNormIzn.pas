unit uAddNormIzn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxCurrencyEdit, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TAddGrpIznosForm = class(TForm)
    lbl1: TLabel;
    cxName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxPercent: TcxCurrencyEdit;
    cxButton1: TcxButton;
    actlst1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    cxButton2: TcxButton;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddGrpIznosForm: TAddGrpIznosForm;

implementation

{$R *.dfm}

procedure TAddGrpIznosForm.actOkExecute(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

procedure TAddGrpIznosForm.actCancelExecute(Sender: TObject);
begin
 Close;
end;

end.
