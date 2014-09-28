{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Картотека МНА и МБП                                   }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMnaPrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, uMatasVars, uMatasUtils;

type
  TMnaPrintForm = class(TForm)
    Label3: TLabel;
    cxReport: TcxComboBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    cxEditTemplate: TcxCheckBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MnaPrintForm: TMnaPrintForm;

implementation

{$R *.dfm}

procedure TMnaPrintForm.FormCreate(Sender: TObject);
begin
 cxReport.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxEditTemplate.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
end;

end.
