unit uHolidayNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Buttons, StdCtrls, cxLookAndFeelPainters, cxButtons;

type
  TfrmNote = class(TForm)
    Label1: TLabel;
    NoteEdit: TEdit;
    ActionList1: TActionList;
    okAct: TAction;
    CancelAct: TAction;
    btnOk: TcxButton;
    btnCnacel: TcxButton;
    procedure okActExecute(Sender: TObject);
    procedure CancelActExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNote: TfrmNote;

implementation

uses UP_AllHolidayFrame;

{$R *.dfm}

procedure TfrmNote.okActExecute(Sender: TObject);
begin
    ModalResult:=mrOk;
end;

procedure TfrmNote.CancelActExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

end.
