unit Propiska_Builds_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxControls, cxGroupBox, StdCtrls, cxButtons, Unit_of_Utilits;

type
  TBuildsFormAdd_Propi = class(TForm)
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
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuildsFormAdd_Propi: TBuildsFormAdd_Propi;

implementation

{$R *.dfm}

procedure TBuildsFormAdd_Propi.OKButtonClick(Sender: TObject);
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

procedure TBuildsFormAdd_Propi.CancelButtonClick(Sender: TObject);
begin
close;
end;

end.
