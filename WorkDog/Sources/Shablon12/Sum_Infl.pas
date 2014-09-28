unit Sum_Infl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, ActnList, StdCtrls, cxButtons, ExtCtrls;

type
  TFormSum = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Edizm: TLabel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    InflEdit: TcxCurrencyEdit;
    Label7: TLabel;
    FavLabel: TLabel;
    Label2: TLabel;
    OldSumEdit: TcxCurrencyEdit;
    Label6: TLabel;
    SumEdit: TcxCurrencyEdit;
    procedure InflEditPropertiesEditValueChanged(Sender: TObject);
    procedure InflEditKeyPress(Sender: TObject; var Key: Char);
    procedure SumEditKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSum: TFormSum;

implementation

{$R *.dfm}

procedure TFormSum.InflEditPropertiesEditValueChanged(Sender: TObject);
begin
 if(OldSumEdit.Value <> 0 ) then
   SumEdit.Value:=OldSumEdit.Value*InflEdit.Value;
end;

procedure TFormSum.InflEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure TFormSum.SumEditKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) then begin
  Key := #0;
  InflEdit.SetFocus;
 end;
end;

procedure TFormSum.Action1Execute(Sender: TObject);
begin
 Close;
end;

procedure TFormSum.ApplyButtonClick(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

end.
