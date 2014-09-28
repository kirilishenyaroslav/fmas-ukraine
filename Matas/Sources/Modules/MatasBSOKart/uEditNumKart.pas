unit uEditNumKart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TEditNumForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cxSer: TcxTextEdit;
    lbl4: TLabel;
    cxNum: TcxTextEdit;
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
    { Public declarations }
  end;

var
  EditNumForm: TEditNumForm;

implementation

{$R *.dfm}

procedure TEditNumForm.actOkExecute(Sender: TObject);
begin
 cxSer.SetFocus;
ModalResult:=mrOk;
end;

procedure TEditNumForm.actCancelExecute(Sender: TObject);
begin
Close;
end;

end.
