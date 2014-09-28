{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepOborotFormPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckBox,
  cxSpinEdit, uMatasVars, uMatasUtils, uResources, ActnList;

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
    ActionList1: TActionList;
    acExit: TAction;
    acOk: TAction;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acOkExecute(Sender: TObject);
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
 cxReportList.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 OkButton.Caption:=MAT_ACTION_PRINT_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 NAME_REPORT:='';
end;

procedure TOborotPrintForm.OkButtonClick(Sender: TObject);
begin
 case cxReportList.ItemIndex of
  0: NAME_REPORT:='oborot_full.fr3';
  1: NAME_REPORT:='oborot_full2.fr3';
  2: NAME_REPORT:='material_full.fr3';
  3: NAME_REPORT:='oborot_full3.fr3';
  4: NAME_REPORT:='oborot_hist_pos.fr3';
  5: NAME_REPORT:='';
 end;
 TIP_REPORT:=cxReportList.ItemIndex;
 case cxReportList.ItemIndex of
  0: TIP_REPORT:=0;
  1: TIP_REPORT:=1;
  2: TIP_REPORT:=3;
  3: TIP_REPORT:=4;
  4: TIP_REPORT:=5;
  5: TIP_REPORT:=6;
 end;
end;

procedure TOborotPrintForm.acExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TOborotPrintForm.acOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

end.
