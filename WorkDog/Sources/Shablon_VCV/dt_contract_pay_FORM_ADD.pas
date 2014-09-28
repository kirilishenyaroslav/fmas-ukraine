{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{                      Модуль "Добавление(изменение) периода оплаты"           }
{ Осуществляет ввод данных необходимых для добавления(изменения) периода       }
{ оплаты для договора на ВЦВ.                                                  }
{                                                 ответственный: Гнибеда Антон }

unit dt_contract_pay_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons;


type
  TFdt_contract_pay_ADD = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    DateBegPayEdit: TcxDateEdit;
    DateEndPayEdit: TcxDateEdit;
    SummaEdit: TcxTextEdit;
    SummaNDSEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure cxDateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DateBegPayEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndPayEditKeyPress(Sender: TObject; var Key: Char);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure SummaNDSEditKeyPress(Sender: TObject; var Key: Char);
  end;

var
  Fdt_contract_pay_ADD: TFdt_contract_pay_ADD;

implementation
uses BaseTypes;

{$R *.DFM}

procedure TFdt_contract_pay_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFdt_contract_pay_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end; 
end;

procedure TFdt_contract_pay_ADD.OKButtonClick(Sender: TObject);
begin
 if DateBegEdit.Text = '' then begin
  agShowMessage('Необхідно ввести дату початку.');
  exit;
 end;
 if DateEndEdit.Text = '' then begin
  agShowMessage('Необхідно ввести дату закінчення.');
  exit;
 end;
 if DateBegPayEdit.Text = '' then begin
  agShowMessage('Необхідно ввести дату початку оплати.');
  exit;
 end;
 if DateEndPayEdit.Text = '' then begin
  agShowMessage('Необхідно ввести дату закінчення оплати.');
  exit;
 end;
 if not isFloat(SummaEdit.Text) then begin
  agShowMessage('Необхідно ввести суму.');
  exit;
 end;
 if not isFloat(SummaNDSEdit.Text) then begin
  agShowMessage('Необхідно ввести суму ПДВ.');
  exit;
 end;
 ModalResult := mrOK;
end;

procedure TFdt_contract_pay_ADD.FormCreate(Sender: TObject);
begin
// mResult := 'cancel';
end;

procedure TFdt_contract_pay_ADD.FormShow(Sender: TObject);
begin
 DateBegEdit.SetFocus;
end;

procedure TFdt_contract_pay_ADD.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then DateEndEdit.SetFocus;
end;

procedure TFdt_contract_pay_ADD.cxDateEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then DateBegPayEdit.SetFocus;
end;

procedure TFdt_contract_pay_ADD.DateBegPayEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then DateEndPayEdit.SetFocus;
end;

procedure TFdt_contract_pay_ADD.DateEndPayEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then SummaEdit.SetFocus;
end;

procedure TFdt_contract_pay_ADD.SummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 CheckFloat(Key);
 if Key = #13 then SummaNdsEdit.SetFocus;
end;

procedure TFdt_contract_pay_ADD.SummaNDSEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 CheckFloat(Key);
 if Key = #13 then OkButton.SetFocus;
end;

end.




