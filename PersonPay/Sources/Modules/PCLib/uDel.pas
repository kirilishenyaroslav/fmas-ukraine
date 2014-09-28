unit uDel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList;

type
  TDelForm = class(TForm)
    OkBut: TcxButton;
    CancelBut: TcxButton;
    lbl1: TLabel;
    actlst1: TActionList;
    actOk: TAction;
    actNo: TAction;
    procedure actOkExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DelForm: TDelForm;

implementation

{$R *.dfm}

procedure TDelForm.actOkExecute(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

procedure TDelForm.actNoExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
