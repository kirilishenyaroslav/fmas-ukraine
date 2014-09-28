unit uSchSaldoPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxSpinEdit, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, uMatasVars, uMatasUtils, uResources;

type
  TSchSaldoPrintForm = class(TForm)
    Label2: TLabel;
    cxPrintForm: TcxComboBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    cxCheckBox1: TcxCheckBox;
    ActionList1: TActionList;
    acExit: TAction;
    procedure acExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SchSaldoPrintForm: TSchSaldoPrintForm;

implementation

{$R *.dfm}

procedure TSchSaldoPrintForm.acExitExecute(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TSchSaldoPrintForm.FormCreate(Sender: TObject);
begin
 cxPrintForm.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 OkButton.Caption:=MAT_ACTION_PRINT_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

end.
