unit uAddShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TNewShablonForm = class(TForm)
    lbl1: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actlst1: TActionList;
    actEnter: TAction;
    actCancel: TAction;
    procedure actEnterExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewShablonForm: TNewShablonForm;

implementation

{$R *.dfm}

procedure TNewShablonForm.actEnterExecute(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

procedure TNewShablonForm.actCancelExecute(Sender: TObject);
begin
Close;
end;

end.
