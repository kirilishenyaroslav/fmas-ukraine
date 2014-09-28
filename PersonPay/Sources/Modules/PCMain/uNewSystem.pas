unit uNewSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxCheckBox;

type
  TNewSystemForm = class(TForm)
    lbl1: TLabel;
    cxDateEdit: TcxDateEdit;
    cxSysName: TcxTextEdit;
    lbl2: TLabel;
    cxButton1: TcxButton;
    cxVal: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewSystemForm: TNewSystemForm;

implementation

{$R *.dfm}

procedure TNewSystemForm.cxButton1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

end.
