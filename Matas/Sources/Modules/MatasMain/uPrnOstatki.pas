{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uPrnOstatki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, FIBDatabase,
  pFIBDatabase, FR_Class, DB, FIBDataSet, pFIBDataSet, FR_DSet, FR_DBSet,
  FR_Desgn, DBCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, FIBQuery, pFIBQuery,
  pFIBStoredProc, DateUtils, uMatasVars, uResources, cxSpinEdit, cxCheckBox,
  uMatasUtils, ActnList;

type
  TfmOstPrint = class(TForm)
    Label2: TLabel;
    cxReport: TcxComboBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxCheckEdit: TcxCheckBox;
    ActionList1: TActionList;
    acExit: TAction;
    acDebug: TAction;
    procedure cxButtonSbrosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acDebugExecute(Sender: TObject);
  private
  public
   PMode: integer;
  end;

var
  fmOstPrint: TfmOstPrint;

implementation

{$R *.dfm}

procedure TfmOstPrint.cxButtonSbrosClick(Sender: TObject);
begin
  Close;
end;

procedure TfmOstPrint.FormCreate(Sender: TObject);
begin
 cxReport.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 OkButton.Caption:=MAT_ACTION_PRINT_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

procedure TfmOstPrint.OkButtonClick(Sender: TObject);
begin
 PMode:=cxReport.ItemIndex;
 Close;
end;

procedure TfmOstPrint.acExitExecute(Sender: TObject);
begin
 PMode:=-1;
 Close;
end;

procedure TfmOstPrint.acDebugExecute(Sender: TObject);
begin
 cxCheckEdit.Visible:=true;
 cxCheckEdit.Checked:=True;
end;

end.
