unit Add_Edit_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxEdit,
  cxTextEdit, cxControls, cxGroupBox;

type
  Tfrm_Add_Edit = class(TForm)
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Name_Edit: TcxTextEdit;
    Familia_Edit: TcxTextEdit;
    Otch_Edit: TcxTextEdit;
    Label4: TLabel;
    Posada_Edit: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Familia_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Otch_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Posada_EditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Add_Edit: Tfrm_Add_Edit;

implementation

{$R *.dfm}

procedure Tfrm_Add_Edit.OkButtonClick(Sender: TObject);
begin
if Familia_Edit.Text ='' then
begin
ShowMessage('Необхідно ввести прізвище!');
Familia_Edit.SetFocus;
exit;
end;
if Name_Edit.Text ='' then
begin
ShowMessage('Необхідно ввести им'+''''+'я!');
Name_Edit.SetFocus;
exit;
end;
if Otch_Edit.Text ='' then
begin
ShowMessage('Необхідно ввести по батькові!');
Otch_Edit.SetFocus;
exit;
end;

if Posada_Edit.Text ='' then
begin
ShowMessage('Необходимо ввести посаду!');
Posada_Edit.SetFocus;
exit;
end;

modalresult:=mrOk;
end;

procedure Tfrm_Add_Edit.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Add_Edit.Familia_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then Name_Edit.SetFocus;
end;

procedure Tfrm_Add_Edit.Name_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Otch_Edit.SetFocus;
end;

procedure Tfrm_Add_Edit.Otch_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Posada_Edit.SetFocus;
end;

procedure Tfrm_Add_Edit.Posada_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then OkButton.SetFocus;
end;

end.
