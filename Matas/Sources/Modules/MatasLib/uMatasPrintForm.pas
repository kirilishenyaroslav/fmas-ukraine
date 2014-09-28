{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasPrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMatasVars, uMatasUtils, uResources, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls,
  cxContainer, cxEdit, cxCheckBox;

type
  TMatasPrintForm = class(TForm)
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    CheckBoxDoc: TcxCheckBox;
    Label1: TLabel;
    cxCopies: TcxSpinEdit;
    cxButtonExit: TcxButton;
    cxButtonPrint: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _ON_PRINTER, _SEL_PRINTER, _EDIT_TEMPLATE: boolean;
    _NUM_COPIES: integer;
  end;

var
  MatasPrintForm: TMatasPrintForm;

implementation

{$R *.dfm}

procedure TMatasPrintForm.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+MAT_ACTION_PRINT_CONST;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 CheckBoxDoc.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 _ON_PRINTER:=IntToBool(_SET_PRINT_ON_PRINTER);
 _SEL_PRINTER:=false;
 _EDIT_TEMPLATE:=IntToBool(_ALLOW_EDIT_TEMPLATE);
 _NUM_COPIES:=1;
end;

procedure TMatasPrintForm.cxButtonPrintClick(Sender: TObject);
begin
 _ON_PRINTER:=cxCheckOnPrinter.Checked;
 _SEL_PRINTER:=cxSelectPrinter.Checked;
 _EDIT_TEMPLATE:=CheckBoxDoc.Checked;
 _NUM_COPIES:=cxCopies.EditValue;
end;

end.
