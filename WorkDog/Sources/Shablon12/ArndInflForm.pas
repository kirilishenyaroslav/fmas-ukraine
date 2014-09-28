unit ArndInflForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, ExtCtrls,Math,LoadDogManedger;

type
  TArndInfl = class(TForm)
    Shape1: TShape;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edizm: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CountEdit: TcxCurrencyEdit;
    OldSumEdit: TcxCurrencyEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Label6: TLabel;
    SumEdit: TcxCurrencyEdit;
    Label7: TLabel;
    InflEdit: TcxCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    OldFullSumEdit: TcxCurrencyEdit;
    NewFullSumEdit: TcxCurrencyEdit;
    Action2: TAction;
    Action3: TAction;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    procedure Action1Execute(Sender: TObject);
    procedure CountEditKeyPress(Sender: TObject; var Key: Char);
    procedure InflEditKeyPress(Sender: TObject; var Key: Char);
    procedure ApplyButtonClick(Sender: TObject);
    procedure SumEditKeyPress(Sender: TObject; var Key: Char);
    procedure NewFullSumEditKeyPress(Sender: TObject; var Key: Char);
    procedure NewFullSumEditPropertiesEditValueChanged(Sender: TObject);
    procedure InflEditPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   firstInflEd : bool;
   ChangedInfl:bool;
   ChangedSumm:bool;
   SumEtalon:Double;
   PR_VNZ:Double;

    { Public declarations }
  end;

var
  ArndInfl: TArndInfl;

implementation

{$R *.dfm}

procedure TArndInfl.Action1Execute(Sender: TObject);
begin
 ModalResult:=mrNone;
 Close();
end;

procedure TArndInfl.CountEditKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13) then
 begin
  Key := #0;
  NewFullSumEdit.SetFocus;
 end;
end;

procedure TArndInfl.InflEditKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13) then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure TArndInfl.ApplyButtonClick(Sender: TObject);
begin
 if (CountEdit.Value < 0) then
 begin
  ShowMessage('Кількість не можуть бути меньше за нуль!');
  CountEdit.SetFocus;
  Exit;
 end;

 if (InflEdit.Value < 0)then
 begin
  ShowMessage('Показник інфляціі не може доріанювати нулю!');
  InflEdit.SetFocus;
  Exit;
 end;
 ModalResult:=mrOk;
end;

procedure TArndInfl.SumEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
  Key := #0;
  InflEdit.SetFocus;
 end;
end;

procedure TArndInfl.NewFullSumEditKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13) then begin
  Key := #0;
  InflEdit.SetFocus;
 end;
 if (Key <> #13) then begin
  ChangedSumm:=false;
 end;
end;

procedure TArndInfl.NewFullSumEditPropertiesEditValueChanged(
  Sender: TObject);
var
  x:Double;
  y:Double;
  z:Double;
begin
  x:=MyRoundTo(NewFullSumEdit.Value*PR_VNZ);
  y:=NewFullSumEdit.Value*PR_VNZ;
  z:=x - y;
  if (z <> 0) then SumEdit.Value:=y - 0.005
  else SumEdit.Value:=MyRoundTo(NewFullSumEdit.Value*PR_VNZ);
  //SumEdit.Value:=MyRoundTo(NewFullSumEdit.Value*PR_VNZ);
end;

procedure TArndInfl.InflEditPropertiesEditValueChanged(Sender: TObject);
begin
 if(OldFullSumEdit.Value <> 0 ) then
  NewFullSumEdit.Value:=OldFullSumEdit.Value*InflEdit.Value;
   //NewFullSumEdit.Value:=MyRoundTo(OldFullSumEdit.Value*InflEdit.Value);
end;

procedure TArndInfl.FormCreate(Sender: TObject);
begin
 firstInflEd:=false;
 ChangedSumm:=false;
end;

procedure TArndInfl.Action2Execute(Sender: TObject);
begin
 self.SelectNext(self.ActiveControl, false, true);
end;

procedure TArndInfl.Action3Execute(Sender: TObject);
begin
 self.SelectNext(self.ActiveControl, true, true);
end;

procedure TArndInfl.FormShow(Sender: TObject);
var
  x:Double;
  y:Double;
  z:Double;
begin
 x:=MyRoundTo(NewFullSumEdit.Value*PR_VNZ);
 y:=NewFullSumEdit.Value*PR_VNZ;
 z:=x - y;
 if (z <> 0) then SumEdit.Value:=y - 0.005
  else SumEdit.Value:=MyRoundTo(NewFullSumEdit.Value*PR_VNZ);
end;

end.
