unit St_sp_Category_Class_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxLabel, cxControls,
  cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons;

type
  TClassCategoryFormAdd = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    PeopleLabel: TcxLabel;
    PeopleEdit: TcxTextEdit;
    PlaceLabel: TcxLabel;
    PlaceEdit: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure PeopleEditKeyPress(Sender: TObject; var Key: Char);
    procedure PlaceEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClassCategoryFormAdd: TClassCategoryFormAdd;

implementation
uses Unit_of_Utilits;
{$R *.dfm}

procedure TClassCategoryFormAdd.FormShow(Sender: TObject);
begin
NameEdit.SetFocus;
end;

procedure TClassCategoryFormAdd.CancelButtonClick(Sender: TObject);
begin
Close;
end;

procedure TClassCategoryFormAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TClassCategoryFormAdd.OKButtonClick(Sender: TObject);
begin
 if NameEdit.Text = '' then begin
  ShowMessage('Необходимо ввести наименование.');
  NameEdit.SetFocus;
  exit;
 end;
 if not IntegerCheck(PeopleEdit.Text) then begin
  ShowMessage('Количество людей введено неверно.');
  PeopleEdit.SetFocus;
  exit;
 end;
 if not FloatCheck(PlaceEdit.Text) then begin
  ShowMessage('Количество мест введено неверно.');
  PlaceEdit.Setfocus;
  exit;
 end;
 ModalResult := mrOK;

end;

procedure TClassCategoryFormAdd.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  PeopleEdit.SetFocus;
end;

procedure TClassCategoryFormAdd.PeopleEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  PlaceEdit.SetFocus;
end;

procedure TClassCategoryFormAdd.PlaceEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then  OkButton.SetFocus;
end;

end.
