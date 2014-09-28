unit uPrintIstfin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, ActnList, ibase, uMatasVars, uMatasUtils;

type
  TPrintFormIstfin = class(TForm)
    cxPrintForm: TcxComboBox;
    lbl1: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    ChoosePrinter: TcxCheckBox;
    lbl2: TLabel;
    cxCopies: TcxSpinEdit;
    cxCheckEdit: TcxCheckBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    actlst1: TActionList;
    actDebug: TAction;
    actCancel: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    DBHANDLE : TISC_DB_HANDLE;
  end;

var
  PrintFormIstfin: TPrintFormIstfin;

implementation

{$R *.dfm}

procedure TPrintFormIstfin.FormCreate(Sender: TObject);
begin
 cxPrintForm.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
// OkButton.Caption:=MAT_ACTION_PRINT_CONST;
// CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

procedure TPrintFormIstfin.actDebugExecute(Sender: TObject);
begin
 cxCheckEdit.Visible:=true;
 cxCheckEdit.Checked:=True;
end;

procedure TPrintFormIstfin.actCancelExecute(Sender: TObject);
begin
Close;
end;

end.
