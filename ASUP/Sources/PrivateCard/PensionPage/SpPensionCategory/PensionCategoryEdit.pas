unit PensionCategoryEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, cxButtons, cxTextEdit, ActnList, ImgList;

type
  TfrmPensCatEdit = class(TForm)
    PensionCatEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    ActionListFChng: TActionList;
    ActionOK: TAction;
    ActionCancel: TAction;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPensCatEdit: TfrmPensCatEdit;

implementation

{$R *.dfm}

procedure TfrmPensCatEdit.ActionOKExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmPensCatEdit.ActionCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
