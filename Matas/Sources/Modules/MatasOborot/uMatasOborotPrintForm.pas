{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с оборотами                             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasOborotPrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit, cxCheckBox,
  cxDropDownEdit, frxClass, ibase, cxLabel;

type
  TMatasOborotPrintForm = class(TForm)
    Label1: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    CheckBoxDoc: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    cxButtonExitSHAB: TcxButton;
    cxButtonChect: TcxButton;
    cxComboBoxShabloni: TcxComboBox;
    cxLabelZvit: TcxLabel;
    procedure cxButtonChectClick(Sender: TObject);
  private
     aMassReports :Variant;
     Report       :TfrxReport;
     DBHANDLE     :TISC_DB_HANDLE;
  public
    _ON_PRINTER, _SEL_PRINTER, _EDIT_TEMPLATE: boolean;
    _NUM_COPIES: integer;
    constructor Create(aOwner:TComponent;aDBHANDLE : TISC_DB_HANDLE ;aObjectPrint: String;aReport: TfrxReport);
  end;

var
  MatasOborotPrintForm: TMatasOborotPrintForm;

implementation
uses
    uMatasVars, uMatasUtils, uResources, uMatasViewSchOborot;

{$R *.dfm}

constructor TMatasOborotPrintForm.Create(aOwner:TComponent;aDBHANDLE : TISC_DB_HANDLE;aObjectPrint: String; aReport: TfrxReport);
begin
    inherited Create(aOwner);

 Caption:=MAT_SYS_PREFIX+MAT_ACTION_PRINT_CONST;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 CheckBoxDoc.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 _ON_PRINTER:=IntToBool(_SET_PRINT_ON_PRINTER);
 _SEL_PRINTER:=false;
 _EDIT_TEMPLATE:=IntToBool(_ALLOW_EDIT_TEMPLATE);
 _NUM_COPIES:=1;

    DBHANDLE:=aDBHANDLE;
    Report  :=aReport;
    uMatasUtils.LoadReportsTocxComboBox(self,aDBHANDLE,aObjectPrint,cxComboBoxShabloni,aMassReports);

    cxComboBoxShabloni.ItemIndex:=0;
end;


procedure TMatasOborotPrintForm.cxButtonChectClick(Sender: TObject);
var
   Name_Report: string;
   i          : integer;
begin
 _ON_PRINTER:=cxCheckOnPrinter.Checked;
 _SEL_PRINTER:=cxSelectPrinter.Checked;
 _EDIT_TEMPLATE:=CheckBoxDoc.Checked;
 _NUM_COPIES:=cxCopies.EditValue;

   i:=cxComboBoxShabloni.ItemIndex;

   Report.PrepareReport(True);
   Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+_PATH_REPORTS+'\'+VarToStr(aMassReports[i][3]));

   if  _EDIT_TEMPLATE=true then Report.DesignReport
    else begin
     if  _SEL_PRINTER=true
      then begin
       Report.PrintOptions.ShowDialog:=true;
       Report.print;
      end
      else begin
         if _ON_PRINTER=true
          then begin
           Report.PrintOptions.ShowDialog:=false;
           Report.PrintOptions.Copies:=_NUM_COPIES;
           Report.Print;
           Report.PrintOptions.ShowDialog:=true;
          end
          else Report.ShowReport(true);
      end;
    end;

end;

end.
