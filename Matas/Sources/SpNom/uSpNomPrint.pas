{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Номенклатор                                     }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpNomPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxCheckBox;

type
  TSpNomPrintForm = class(TForm)
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label1: TLabel;
    cxCopies: TcxSpinEdit;
    cxButtonExit: TcxButton;
    cxButtonPrint: TcxButton;
    LabelShablon: TLabel;
    cxReports: TcxComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpNomPrintForm: TSpNomPrintForm;

implementation

{$R *.dfm}

procedure TSpNomPrintForm.FormCreate(Sender: TObject);
begin
 cxReports.ItemIndex:=0;
end;

end.
