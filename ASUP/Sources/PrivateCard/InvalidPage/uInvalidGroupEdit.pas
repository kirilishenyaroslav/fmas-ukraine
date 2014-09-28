unit uInvalidGroupEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList;

type
  TfrmGroupEdit = class(TForm)
    InvEdit: TEdit;
    Label1: TLabel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    ActionList1: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    procedure ActCancelExecute(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupEdit: TfrmGroupEdit;

implementation

uses uInvalidGroup;

{$R *.dfm}

procedure TfrmGroupEdit.ActCancelExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TfrmGroupEdit.ActOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

end.
