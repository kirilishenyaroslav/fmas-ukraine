unit Sum_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, StdCtrls, cxButtons, ExtCtrls, ActnList;

type
  TSummAdd = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Edizm: TLabel;
    FavLabel: TLabel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    SumEdit: TcxCurrencyEdit;
    ActionList1: TActionList;
    Action1: TAction;
    procedure SumEditKeyPress(Sender: TObject; var Key: Char);
    procedure ApplyButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SummAdd: TSummAdd;

implementation

{$R *.dfm}

procedure TSummAdd.SumEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure TSummAdd.ApplyButtonClick(Sender: TObject);
begin
 if SumEdit.Value <= 0  then
 begin
  ShowMessage('Ви не ввели сумму!');
  SumEdit.SetFocus;
  Exit;
 end;
 ModalResult:=mrOk;

end;

procedure TSummAdd.Action1Execute(Sender: TObject);
begin
 ModalResult:=mrNone;
 Close;
end;

end.
