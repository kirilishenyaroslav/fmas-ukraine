unit ReePosAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TfrmPosAdd = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    Num_edit: TcxTextEdit;
    Label12: TLabel;
    DateEdit: TcxDateEdit;
    Label3: TLabel;
    PosEdit: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPosAdd: TfrmPosAdd;

implementation

{$R *.dfm}

procedure TfrmPosAdd.cxButton1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmPosAdd.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
