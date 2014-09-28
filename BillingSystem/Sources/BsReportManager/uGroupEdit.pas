unit uGroupEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit;

type
  TfrmGroupEdit = class(TForm)
    GroupEdit: TcxTextEdit;
    lblGroupName: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupEdit: TfrmGroupEdit;

implementation

{$R *.dfm}

procedure TfrmGroupEdit.btnOkClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfrmGroupEdit.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
