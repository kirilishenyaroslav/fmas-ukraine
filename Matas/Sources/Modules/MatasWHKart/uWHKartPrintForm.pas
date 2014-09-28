{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы со складской картотекой                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uWHKartPrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckBox,
  cxSpinEdit, uMatasVars, uMatasUtils, uResources;

type
  TOborotPrintForm = class(TForm)
    Label2: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    cxCheckEdit: TcxCheckBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxReportList: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   NAME_REPORT: string;
   TIP_REPORT: integer;
  end;

var
  OborotPrintForm: TOborotPrintForm;

implementation

{$R *.dfm}

procedure TOborotPrintForm.FormCreate(Sender: TObject);
begin
  //;
end;

procedure TOborotPrintForm.OkButtonClick(Sender: TObject);
begin
 TIP_REPORT:=cxReportList.ItemIndex;
end;

procedure TOborotPrintForm.FormShow(Sender: TObject);
begin
 cxReportList.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 OkButton.Caption:=MAT_ACTION_PRINT_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 NAME_REPORT:='';
end;

end.
