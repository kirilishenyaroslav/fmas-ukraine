unit uAddNN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, uMainPerem, DateUtils,
  cxCheckBox, cxButtonEdit, ibase, cn_Common_Types;

type
  TAddNNForm = class(TForm)
    lbl1: TLabel;
    cxDateEdit1: TcxDateEdit;
    cxButtonDelete: TcxButton;
    cxButtonAdd: TcxButton;
    lbl2: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxIsCloseSch: TcxCheckBox;
    lbl5: TLabel;
    lbl3: TLabel;
    cxDogEdit: TcxTextEdit;
    procedure cxButtonAddClick(Sender: TObject);
    procedure cxButtonDeleteClick(Sender: TObject);
    procedure cxDateEdit1Exit(Sender: TObject);
    procedure cxDogEditFocusChanged(Sender: TObject);
    

  private
    { Private declarations }
  public
    DBHandle:TISC_DB_HANDLE;
    ID_DOG: Integer;
  end;

var
  AddNNForm: TAddNNForm;

implementation

{$R *.dfm}

procedure TAddNNForm.cxButtonAddClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TAddNNForm.cxButtonDeleteClick(Sender: TObject);
begin
Close;
end;

procedure TAddNNForm.cxDateEdit1Exit(Sender: TObject);
begin
//if ((cxDateEdit1.EditValue<PERS_PAY_PERIOD)or(cxDateEdit1.EditValue>EndOfTheMonth(PERS_PAY_PERIOD)))
//then cxDateEdit1.EditValue:= PERS_PAY_PERIOD;
end;



procedure TAddNNForm.cxDogEditFocusChanged(Sender: TObject);
begin
if cxDogEdit.Text<>'' then cxTextEdit1.text:='Формування за одним договором:'+cxDogEdit.Text; 
end;

end.
