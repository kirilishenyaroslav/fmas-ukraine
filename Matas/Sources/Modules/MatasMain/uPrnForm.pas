{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uPrnForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxRadioGroup,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ibase, uMatasVars, uMatasUtils,
  cxSpinEdit, cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, uResources,
  ActnList;

type
  TPrintForm = class(TForm)
    cxPrintForm: TcxComboBox;
    Label2: TLabel;
    Label4: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxCheckEdit: TcxCheckBox;
    cxPrintSelected: TcxCheckBox;
    ActionList1: TActionList;
    acExit: TAction;
    acDebug: TAction;
    cxPrintKol: TcxCheckBox;
    procedure cxCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acDebugExecute(Sender: TObject);
  private
    { Private declarations }
  public
   DBHANDLE : TISC_DB_HANDLE;
  end;

var
  PrintForm: TPrintForm;

implementation

{$R *.dfm}

procedure TPrintForm.cxCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TPrintForm.FormCreate(Sender: TObject);
begin
 cxPrintForm.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 OkButton.Caption:=MAT_ACTION_PRINT_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

procedure TPrintForm.acExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TPrintForm.acDebugExecute(Sender: TObject);
begin
 cxCheckEdit.Visible:=true;
 cxCheckEdit.Checked:=True;
end;

end.
