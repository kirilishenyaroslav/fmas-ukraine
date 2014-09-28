unit TypeEducEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, cxLookAndFeelPainters, cxButtons;

type
  TfrmTypeEducEdit = class(TForm)
    NameEducEdit: TEdit;
    Label1: TLabel;
    OnEnterAction: TActionList;
    ActEnter: TAction;
    OkBtn: TcxButton;
    cxButton1: TcxButton;
    ActEsc: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure ActEnterExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTypeEducEdit: TfrmTypeEducEdit;

implementation
{$R *.dfm}


procedure TfrmTypeEducEdit.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTypeEducEdit.OkBtnClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmTypeEducEdit.ActEnterExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmTypeEducEdit.ActEscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
