unit uPereocPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxCheckBox, uMatasUtils, uMatasVars;

type
  TVedPereocPrintForm = class(TForm)
    Label1: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    CheckBoxDoc: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    cxButtonExit: TcxButton;
    cxButtonPrint: TcxButton;
    Label2: TLabel;
    cxComboReport: TcxComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _ON_PRINTER, _SEL_PRINTER, _EDIT_TEMPLATE: boolean;
    _NUM_COPIES: integer;
  end;

var
  VedPereocPrintForm: TVedPereocPrintForm;

implementation

{$R *.dfm}

procedure TVedPereocPrintForm.FormCreate(Sender: TObject);
begin
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 CheckBoxDoc.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 _ON_PRINTER:=IntToBool(_SET_PRINT_ON_PRINTER);
 _SEL_PRINTER:=false;
 _EDIT_TEMPLATE:=IntToBool(_ALLOW_EDIT_TEMPLATE);
 _NUM_COPIES:=1;
  cxComboReport.ItemIndex:=0;
end;

end.
