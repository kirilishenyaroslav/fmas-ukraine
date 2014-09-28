unit uCloseProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TCloseProvForm = class(TForm)
    lbl1: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbl2: TLabel;
    cxDateEdit: TcxDateEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxDateEditPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CloseProvForm: TCloseProvForm;

implementation

{$R *.dfm}

procedure TCloseProvForm.cxButton1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TCloseProvForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

procedure TCloseProvForm.cxDateEditPropertiesChange(Sender: TObject);
begin
if cxDateEdit.EditValue<cxDateEdit.Properties.MinDate then cxDateEdit.EditValue:=cxDateEdit.Properties.MinDate;
if cxDateEdit.EditValue>cxDateEdit.Properties.MaxDate then cxDateEdit.EditValue:=cxDateEdit.Properties.MaxDate;
end;

end.
