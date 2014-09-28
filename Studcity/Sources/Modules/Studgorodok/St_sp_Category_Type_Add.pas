unit St_sp_Category_Type_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, cxLabel, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons;

type
  TTypeCategoryFormAdd = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    ShortEdit: TcxTextEdit;
    ShortNameLabel: TcxLabel;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    MonthOplCheck: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortEditKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeCategoryFormAdd: TTypeCategoryFormAdd;

implementation

{$R *.dfm}

procedure TTypeCategoryFormAdd.FormShow(Sender: TObject);
begin
NameEdit.SetFocus;
end;

procedure TTypeCategoryFormAdd.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then ShortEdit.SetFocus;
end;

procedure TTypeCategoryFormAdd.ShortEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then OkButton.SetFocus;
end;

procedure TTypeCategoryFormAdd.CancelButtonClick(Sender: TObject);
begin
Close;
end;

procedure TTypeCategoryFormAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TTypeCategoryFormAdd.OKButtonClick(Sender: TObject);
begin
 if ShortEdit.Text = '' then begin
  ShowMessage('Необходимо ввести сокращенное наименование.');
  ShortEdit.SetFocus;
  exit;
 end;
 if NameEdit.Text = '' then begin
  ShowMessage('Необходимо ввести наименование.');
  NameEdit.SetFocus;
  exit;
 end;
 ModalResult := mrOK;

end;

end.
