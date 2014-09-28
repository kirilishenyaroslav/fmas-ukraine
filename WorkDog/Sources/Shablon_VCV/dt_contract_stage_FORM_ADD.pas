{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{                Модуль "Добаление(изменение) периода поставки"                }
{ Осуществляет ввод периода поставки для договора на ВЦВ.                      }
{                                                 ответственный: Гнибеда Антон }

unit dt_contract_stage_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons;

type
  TFdt_contract_stage_ADD = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
  end;

var
  Fdt_contract_stage_ADD: TFdt_contract_stage_ADD;

implementation
uses BaseTypes;
{$R *.DFM}

procedure TFdt_contract_stage_ADD.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFdt_contract_stage_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end; 
end;

procedure TFdt_contract_stage_ADD.OKButtonClick(Sender: TObject);
begin
 if DateBegEdit.Text = '' then begin
  agShowMessage('Необхідно ввести дату початку.');
  exit;
 end;
 if DateEndEdit.Text = '' then begin
  agShowMessage('Необхідно ввести дату закінчення.');
  exit;
 end;
 ModalResult := mrOK
end;

procedure TFdt_contract_stage_ADD.FormShow(Sender: TObject);
begin
 if DateBegEdit.Text = '' then DateBegEdit.SetFocus else DateEndEdit.SetFocus; 
end;

procedure TFdt_contract_stage_ADD.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then DateEndEdit.SetFocus;
end;

procedure TFdt_contract_stage_ADD.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton.SetFocus;
end;

end.
