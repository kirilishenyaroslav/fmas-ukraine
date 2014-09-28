unit Period_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ExtCtrls, ActnList, cxRadioGroup, DB, FIBDataSet, pFIBDataSet,
  cxCurrencyEdit;

type
  TPeriod_Add_Form = class(TForm)
    Date_Beg_Edit: TcxDateEdit;
    Date_End_Edit: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    ActionList1: TActionList;
    Action3: TAction;
    Shape1: TShape;
    RadioGroup: TcxRadioGroup;
    DataSet: TpFIBDataSet;
    Label3: TLabel;
    Summa_Edit: TcxCurrencyEdit;
    procedure Summa_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_Beg_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_End_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure RadioGroupPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
   index : currency;
   UseInflation : boolean;
   function   CheckIndex : boolean;
   destructor Destroy; override; 
  end;

var
  Period_Add_Form: TPeriod_Add_Form;

implementation

uses Arnd_Contract_Add, Math;

{$R *.dfm}

function CheckExtended(s : string; Key : Char; Decimal : integer; Position : byte) : boolean;
var
 k : integer;
begin
 Result := False;

 if Key in [#8, #9, #13] then Result := True
 else if Key = #44 then Result := ((Pos(#44, s) = 0) and (Length(s) - Position <= Decimal))
 else if Key in ['0'..'9'] then begin
  k := Pos(#44, s);

  if (k = 0) or (Position < k) then Result := True
  else Result := (Length(s) - k < 2);
 end;
end;

procedure TPeriod_Add_Form.Summa_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure TPeriod_Add_Form.Date_Beg_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Date_End_Edit.SetFocus;
 end;
end;

procedure TPeriod_Add_Form.Date_End_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Summa_Edit.SetFocus;
 end;
end;

destructor TPeriod_Add_Form.Destroy;
begin
 Period_Add_Form := nil;
 inherited;
end;

procedure TPeriod_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TPeriod_Add_Form.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TPeriod_Add_Form.ApplyButtonClick(Sender: TObject);
begin
 if (Date_Beg_Edit.Text = '') or (Date_End_Edit.Text = '') then begin
  ShowMessage('Введите корректно даты начала и окончания периода!');
  Exit;
 end;

 if Date_Beg_Edit.Date > Date_End_Edit.Date then begin
  ShowMessage('Дата начала периода не может быть больше даты его окончания!');
  Exit;
 end;

 if Date_Beg_Edit.Date < Arnd_Contract_Add_Form.DogDateBeg.Date then begin
  ShowMessage('Дата начала периода не может быть меньше чем ' + DateToStr(Arnd_Contract_Add_Form.DogDateBeg.Date));
  Exit;
 end;

 if Date_End_Edit.Date > Arnd_Contract_Add_Form.DogDateEnd.Date then begin
  ShowMessage('Дата начала периода не может быть бльше чем ' + DateToStr(Arnd_Contract_Add_Form.DogDateEnd.Date));
  Exit;
 end;

 if (RadioGroup.ItemIndex = 1) and (Summa_Edit.Text = '') then begin
  ShowMessage('Введите сумму по периоду!');
  Exit;
 end;

 if RadioGroup.ItemIndex = 0 then if not CheckIndex then Exit;

 ModalResult := mrOk;
end;

procedure TPeriod_Add_Form.Action3Execute(Sender: TObject);
begin
 CancelButtonClick(Sender);
end;

procedure TPeriod_Add_Form.RadioGroupPropertiesChange(Sender: TObject);
begin
 Summa_Edit.Enabled := RadioGroup.ItemIndex = 1;
end;

procedure TPeriod_Add_Form.FormShow(Sender: TObject);
begin
 if not UseInflation then begin
  RadioGroup.Visible    := False;
  RadioGroup.ItemIndex  := 1;
  Label3.Left           := 16;
  Label3.Top            := 59;
  Label3.Visible        := True;
  Shape1.Height         := 97;
  ApplyButton.Top       := 110;
  CancelButton.Top      := 110;
  Height                := 175;
  Summa_Edit.Top        := 72;
 end;

 Summa_Edit.SetFocus;
 RadioGroupPropertiesChange(Sender);
end;

function TPeriod_Add_Form.CheckIndex: boolean;
begin
 Result := False;
  ShowMessage('111');
 DataSet.SelectSQL.Text := 'select first(1) INFLATION_INDEX from DOG_SP_INFLATION_SEL_PERIOD('
 + QuotedStr(DateToStr(Date_Beg_Edit.Date)) + ',' + QuotedStr(DateToStr(Date_End_Edit.Date)) + ')';

 DataSet.Open;
      ShowMessage('1111');
 if VarIsNull(DataSet['INFLATION_INDEX']) then begin
  DataSet.Close;
  ShowMessage('Індекс інфляції за вказаний період не знайдено!');
  Exit;
 end
 else begin
  index := DataSet['INFLATION_INDEX'];
  Result := True;
 end;

 DataSet.Close;
end;

end.

