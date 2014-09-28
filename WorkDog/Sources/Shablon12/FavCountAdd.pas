unit FavCountAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, ExtCtrls,Math;

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
    procedure CountEditPropertiesChange(Sender: TObject);
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

end.
