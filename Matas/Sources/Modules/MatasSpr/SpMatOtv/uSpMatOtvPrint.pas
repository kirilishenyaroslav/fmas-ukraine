{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpMatOtvPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit,
  cxCheckBox, uResources, uMatasVars, uMatasUtils;

type
  TfmSpMatOtvPrint = class(TForm)
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    CheckBoxDoc: TcxCheckBox;
    cxButtonPrint: TcxButton;
    cxButtonExit: TcxButton;
    Label1: TLabel;
    cxCopies: TcxSpinEdit;
    LabelShablon: TLabel;
    cxComboBoxShablon: TcxComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSpMatOtvPrint: TfmSpMatOtvPrint;

implementation

{$R *.dfm}

procedure TfmSpMatOtvPrint.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_SP_MO+'::'+MAT_ACTION_PRINT_CONST;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 CheckBoxDoc.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 cxComboBoxShablon.ItemIndex:=0;
end;

end.

