unit DateReeChangeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMemo, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  ExtCtrls;

type
  TForm6 = class(TForm)
    grp1: TGroupBox;
    grp2: TGroupBox;
    pnl1: TPanel;
    cxDateEdit1: TcxDateEdit;
    cxMemo1: TcxMemo;
    cxOk: TcxButton;
    cxCancel: TcxButton;
    procedure cxOkClick(Sender: TObject);
    procedure cxCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.cxOkClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TForm6.cxCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
