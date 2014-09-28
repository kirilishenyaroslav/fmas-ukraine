unit Input_Sum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, ActnList, cxCheckBox,
  cxGroupBox, cxCurrencyEdit;

type
  TInput_Sum_Form = class(TForm)
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    ActionList: TActionList;
    Action1: TAction;
    GroupBox: TcxGroupBox;
    CustGroupBox: TcxGroupBox;
    CustEdit: TcxTextEdit;
    CustCheckBox: TcxCheckBox;
    Label1: TLabel;
    fSumCheckBox: TcxCheckBox;
    RegNumGroupBox: TcxGroupBox;
    RegNumEdit: TcxTextEdit;
    RegNumCheckBox: TcxCheckBox;
    SumEdit: TcxCurrencyEdit;
    procedure SumEditFocusChanged(Sender: TObject);
    procedure SumEditKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CustCheckBoxPropertiesChange(Sender: TObject);
    procedure CustEditKeyPress(Sender: TObject; var Key: Char);
    procedure CustCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure fSumCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure RegNumCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure RegNumEditKeyPress(Sender: TObject; var Key: Char);
    procedure RegNumCheckBoxPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    ShowExtras : boolean;
    Use_fSum : boolean;
  end;

var
  Input_Sum_Form: TInput_Sum_Form;

implementation

{$R *.dfm}

function CheckExtended(s : string; Key : Char; Decimal : integer; Position : byte) : boolean;
var
 k : integer;
begin
 Result := False;

 if Key in [#8, #9, #13] then Result := True
 else if (Key = #45) then Result := (Position = 0) and (s[1] <> #45) // знак минус
// else if Key = DecimalSeparator then Result := ((Pos(DecimalSeparator, s) = 0) and (Length(s) - Position <= Decimal))
// else if Key = #46 then Result := ((Pos(#46, s) = 0) and (Length(s) - Position <= Decimal))
 else if Key = #44 then Result := ((Pos(#44, s) = 0) and (Length(s) - Position <= Decimal))
 else if Key in ['0'..'9'] then begin
  k := Pos(#46, s);

  if (k = 0) or (Position < k) then Result := True
  else Result := (Length(s) - k < 2);
 end;
end;

procedure TInput_Sum_Form.SumEditFocusChanged(Sender: TObject);
begin
 if not SumEdit.Focused and (SumEdit.Text = '') then SumEdit.Text := '0' + DecimalSeparator + '00';
end;

procedure TInput_Sum_Form.SumEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;

  ApplyButton.SetFocus;
 end;
end;

procedure TInput_Sum_Form.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TInput_Sum_Form.ApplyButtonClick(Sender: TObject);
begin
 if CustCheckBox.Checked and (CustEdit.Text = '') then begin
  ShowMessage('Уведіть назву контрагенту або вимкніть фільтр на нього!');
  CustEdit.SetFocus;
  Exit;
 end;

 if RegNumCheckBox.Checked and (RegNumEdit.Text = '') then begin
  ShowMessage('Уведіть реєстраційний номер договору або вимкніть фільтр на нього!');
  RegNumEdit.SetFocus;
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure TInput_Sum_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TInput_Sum_Form.Action1Execute(Sender: TObject);
begin
CancelButtonClick(Sender);
end;

procedure TInput_Sum_Form.FormShow(Sender: TObject);
begin
 if ShowExtras then begin
  Height := 302;

  CustGroupBox.Visible := True;

  ApplyButton.Top  := 237;
  CancelButton.Top := 237;
 end
 else begin
  Height := 138;

  CustGroupBox.Visible := False;

  ApplyButton.Top  := 72;
  CancelButton.Top := 72;
 end;

 fSumCheckBox.Checked := Use_fSum;
 fSumCheckBox.Visible := Use_fSum;

 CustCheckBoxPropertiesChange(Sender);
 RegNumCheckBoxPropertiesChange(Sender);

{ if SumEdit.Text = '' then SumEdit.Text := '0' + DecimalSeparator + '00';

 s := SumEdit.Text;
 k := Pos(DecimalSeparator, s);
 if k = 0 then s := s  + DecimalSeparator + '00'
 else if (k  > 0) and (Length(SumEdit.Text) - k < 2) then s := s  + '0';

 SumEdit.Text := s;}

 SumEdit.SetFocus;
end;

procedure TInput_Sum_Form.CustCheckBoxPropertiesChange(Sender: TObject);
begin
 CustEdit.Enabled := CustCheckBox.Checked;

 if CustCheckBox.Checked then CustEdit.SetFocus;
end;

procedure TInput_Sum_Form.CustEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  RegNumCheckBox.SetFocus;
 end;
end;

procedure TInput_Sum_Form.CustCheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;

  if CustEdit.Enabled then CustEdit.SetFocus
  else RegNumCheckBox.SetFocus;
 end;
end;

procedure TInput_Sum_Form.fSumCheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;

  if ShowExtras then CustCheckBox.SetFocus
  else ApplyButton.SetFocus;
 end;
end;

procedure TInput_Sum_Form.RegNumCheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;

  if RegNumEdit.Enabled then RegNumEdit.SetFocus
  else ApplyButton.SetFocus;
 end;
end;

procedure TInput_Sum_Form.RegNumEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure TInput_Sum_Form.RegNumCheckBoxPropertiesChange(Sender: TObject);
begin
 RegNumEdit.Enabled := RegNumCheckBox.Checked;

 if RegNumCheckBox.Checked then RegNumEdit.SetFocus;
end;

end.
