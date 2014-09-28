unit FavCountAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, ExtCtrls,Math, ActnList,LoadDogManedger;

type
  TForm3 = class(TForm)
    Shape1: TShape;
    CountEdit: TcxCurrencyEdit;
    Label3: TLabel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Edizm: TLabel;
    SumEdit: TcxCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    procedure CountEditPropertiesChange(Sender: TObject);
    procedure CountEditKeyPress(Sender: TObject; var Key: Char);
    procedure ApplyButtonClick(Sender: TObject);
    procedure SumEditKeyPress(Sender: TObject; var Key: Char);
    procedure InflEditKeyPress(Sender: TObject; var Key: Char);
    procedure InflEditPropertiesChange(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    Sum_One : Double;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.CountEditPropertiesChange(Sender: TObject);
var
 Sum_All : Double;
begin
 Sum_All:=Sum_One*CountEdit.Value; // Sum_One*Fav_Cnt;
 SumEdit.Value:=Sum_All;
end;

procedure TForm3.CountEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
  Key := #0;
  CountEditPropertiesChange(Self);
  ApplyButton.SetFocus;
 end;
end;

procedure TForm3.ApplyButtonClick(Sender: TObject);
begin
 if CountEdit.Value <= 0  then
 begin
  ShowMessage('¬и не ввели к≥льк≥сть послуги!');
  CountEdit.SetFocus;
  Exit;
 end;

 ModalResult:=mrOk;
end;

procedure TForm3.SumEditKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13) then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure TForm3.InflEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
 begin
  Key := #0;
  CountEditPropertiesChange(Self);
  ApplyButton.SetFocus;
 end;
end;

procedure TForm3.InflEditPropertiesChange(Sender: TObject);
var
 Sum_all:Double;
begin
 Sum_All:=Sum_One*CountEdit.Value;
 SumEdit.Value:=Sum_All;
end;

procedure TForm3.Action1Execute(Sender: TObject);
begin
 ModalResult:=MrNone;
 Close;
end;

end.
