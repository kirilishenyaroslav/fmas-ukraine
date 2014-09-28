unit Counters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, StdCtrls, cxLookAndFeelPainters, cxButtons, ActnList;

type
  TCountersAdd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CountEdit: TcxCurrencyEdit;
    Shape1: TShape;
    SumEdit: TcxCurrencyEdit;
    Label6: TLabel;
    Bevel1: TBevel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    PeriodStr: TLabel;
    Label5: TLabel;
    FavLabel: TLabel;
    OldEdit: TcxTextEdit;
    CurEdit: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    procedure OldEditKeyPress(Sender: TObject; var Key: Char);
    procedure CurEditKeyPress(Sender: TObject; var Key: Char);
    procedure SumEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Sum_One:Double;
    ZeroF : Integer;
    { Public declarations }
    function GetZeroValls(Counter:string):Integer;

  end;

var
  CountersAdd: TCountersAdd;

implementation

{$R *.dfm}
// Определение количества нулей в начальных показателях, для приведения к нужному типу
function TCountersAdd.GetZeroValls(Counter:string):Integer;
var
  i : Integer;
  k : char;
begin
 for i:=1 to SizeOf(Counter) do
 begin
   if Counter[i] <> '0' then
   begin
    Break;
   end;
 end;
 ZeroF:=i;
 Result:=i;
end;

procedure TCountersAdd.OldEditKeyPress(Sender: TObject; var Key: Char);
var
  x:integer;
begin
 if OldEdit.Text <> '' then
 begin
   if Key = #13 then begin
    Key := #0;
    GetZeroValls(OldEdit.Text);
    CurEdit.SetFocus;
    end;
 end;
end;

procedure TCountersAdd.CurEditKeyPress(Sender: TObject; var Key: Char);
var
 x:integer;
// y,z:integer;
begin
 if CurEdit.Text <> '' then
 begin
   if Key = #13 then begin
    Key := #0;
    x:=StrToInt(CurEdit.Text);
    GetZeroValls(OldEdit.Text);
    CurEdit.Text:=Format('%.'+IntToStr(ZeroF+1)+'d',[x]);

    CountEdit.Text:=IntToStr(StrToInt(CurEdit.Text) - StrToInt(OldEdit.Text));
    ApplyButton.SetFocus;
    end;
 end;

 SumEdit.Value:=Sum_One*CountEdit.Value;
end;

procedure TCountersAdd.SumEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  CurEdit.SetFocus;
 end;
end;

procedure TCountersAdd.FormShow(Sender: TObject);
begin
 if OldEdit.Text <> '' then
 begin
  GetZeroValls(OldEdit.Text);
  CurEdit.SetFocus;
 end;
end;

procedure TCountersAdd.ApplyButtonClick(Sender: TObject);
begin

 if (StrToInt(OldEdit.Text) < 0) or (StrToInt(CurEdit.Text) < 0) then
 begin
  ShowMessage('Показники не можуть бути меньше за нуль!');
  OldEdit.SetFocus;
  Exit;
 end;

 if StrToInt(CurEdit.Text) = 0 then
 begin
  ShowMessage('Ви не ввели поточні показники лічильників!');
  CurEdit.SetFocus;
  Exit;
 end;

 if StrToInt(OldEdit.Text) = 0 then
 begin
  ShowMessage('Ви не ввели минулі показники лічильників!');
  OldEdit.SetFocus;
  Exit;
 end;

 if StrToInt(CurEdit.Text) < StrToInt(OldEdit.Text) then
 begin
  ShowMessage('Поточні показники не можуть бути меньшими за старі!');
  CurEdit.SetFocus;
  Exit;
 end;
 if StrToInt(CurEdit.Text) < StrToInt(OldEdit.Text) then
 begin
  ShowMessage('Поточні показники не можуть бути меньшими за старі!');
  CurEdit.SetFocus;
  Exit;
 end;
 ModalResult:=mrOk;
end;

procedure TCountersAdd.Action1Execute(Sender: TObject);
begin
 ModalResult:=mrNone;
 Close;
end;

procedure TCountersAdd.FormCreate(Sender: TObject);
begin
// 
end;

end.
