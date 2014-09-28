unit St_sp_Hostel_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons;

type
  TBuildsFormAdd = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    ShortEdit: TcxTextEdit;
    ShortNameLabel: TcxLabel;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    NumEdit: TcxTextEdit;
    NumLabel: TcxLabel;
    cxLabel1: TcxLabel;
    ChiefEdit: TcxTextEdit;
    SizeLabel: TcxLabel;
    SizeEdit: TcxTextEdit;
    FloorLabel: TcxLabel;
    FloorEdit: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    OblastLabel: TcxLabel;
    OblastEdit: TcxTextEdit;
    TownLabel: TcxLabel;
    TownEdit: TcxTextEdit;
    RaionLabel: TcxLabel;
    RaionEdit: TcxTextEdit;
    StreetLabel: TcxLabel;
    StreetEdit: TcxTextEdit;
    HouseLabel: TcxLabel;
    HouseEdit: TcxTextEdit;
    IndexLabel: TcxLabel;
    IndexEdit: TcxTextEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure NumEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortEditKeyPress(Sender: TObject; var Key: Char);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure SizeEditKeyPress(Sender: TObject; var Key: Char);
    procedure ChiefEditKeyPress(Sender: TObject; var Key: Char);
    procedure FloorEditKeyPress(Sender: TObject; var Key: Char);
    procedure TownEditKeyPress(Sender: TObject; var Key: Char);
    procedure OblastEditKeyPress(Sender: TObject; var Key: Char);
    procedure RaionEditKeyPress(Sender: TObject; var Key: Char);
    procedure StreetEditKeyPress(Sender: TObject; var Key: Char);
    procedure HouseEditKeyPress(Sender: TObject; var Key: Char);
    procedure IndexEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

function IntegerCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  if not (k in ['0'..'9',#8, #13]) then k := #0;
  if k = #0 then exit;
 end;
 Result := true;
end;

function FloatCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
 if not (k in ['0'..'9',#8, #13, DecimalSeparator]) then k := #0;
  if k = #0 then exit;
 end;
 i := pos(DecimalSeparator, s);
 if i <> 0 then if Copy(s, i + 1, Length(s) - i) = '' then exit;
 if pos(DecimalSeparator, Copy(s, i + 1, Length(s) - i)) <> 0 then exit;
 Result := true;
end;

procedure TBuildsFormAdd.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TBuildsFormAdd.FormShow(Sender: TObject);
begin
If cxGroupBox1.Enabled = true then  NumEdit.SetFocus
else CancelButton.SetFocus;
end;

procedure TBuildsFormAdd.OKButtonClick(Sender: TObject);
begin
 if not IntegerCheck(NumEdit.Text) then begin
  ShowMessage('Номер общежития введен неверно.');
  NumEdit.SetFocus;
  exit;
 end;
 if ShortEdit.Text = '' then begin
  ShowMessage('Необходимо ввести сокращенное название.');
  ShortEdit.SetFocus;
  exit;
 end;
 if NameEdit.Text = '' then begin
  ShowMessage('Необходимо ввести название.');
  NameEdit.SetFocus;
  exit;
 end;
 if ChiefEdit.Text = '' then begin
  ShowMessage('Необходимо ввести ФИО коменданта общежития.');
  ChiefEdit.SetFocus;
  exit;
 end;
 if not FloatCheck(SizeEdit.Text) then begin
  ShowMessage('Площадь введена неверно.');
  SizeEdit.SetFocus;
  exit;
 end;
 if not IntegerCheck(FloorEdit.Text) then begin
  ShowMessage('Количество этажей введено неверно.');
  FloorEdit.SetFocus;
  exit;
 end;
 if not IntegerCheck(IndexEdit.Text) then begin
  ShowMessage('Индекс введен неверно.');
  IndexEdit.SetFocus;
  exit;
 end;
 ModalResult := mrOK;
end;

procedure TBuildsFormAdd.NumEditKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then ShortEdit.SetFocus;
end;

procedure TBuildsFormAdd.ShortEditKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then NameEdit.SetFocus;
end;

procedure TBuildsFormAdd.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
 If Key=#13 then ChiefEdit.SetFocus;
end;

procedure TBuildsFormAdd.SizeEditKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then FloorEdit.SetFocus;
end;

procedure TBuildsFormAdd.ChiefEditKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then SizeEdit.SetFocus;
end;

procedure TBuildsFormAdd.FloorEditKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then OblastEdit.SetFocus;
end;

procedure TBuildsFormAdd.TownEditKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then RaionEdit.SetFocus;
end;

procedure TBuildsFormAdd.OblastEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 then TownEdit.SetFocus;
end;

procedure TBuildsFormAdd.RaionEditKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then StreetEdit.SetFocus;
end;

procedure TBuildsFormAdd.StreetEditKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 then HouseEdit.SetFocus;
end;

procedure TBuildsFormAdd.HouseEditKeyPress(Sender: TObject; var Key: Char);
begin
 If Key=#13 then IndexEdit.SetFocus;
end;

procedure TBuildsFormAdd.IndexEditKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then OkButton.SetFocus;
end;

end.
