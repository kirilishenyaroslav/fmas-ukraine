unit sp_Inflation_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxCurrencyEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  Tsp_Inflation_Add_Form = class(TForm)
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    IndexEdit: TcxCurrencyEdit;
    Shape1: TShape;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplyButtonClick(Sender: TObject);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure IndexEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sp_Inflation_Add_Form: Tsp_Inflation_Add_Form;

implementation

{$R *.dfm}

procedure Tsp_Inflation_Add_Form.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tsp_Inflation_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tsp_Inflation_Add_Form.ApplyButtonClick(Sender: TObject);
begin
 if DateBegEdit.Text = '' then begin
  ShowMessage('Ви не увели дату початку періоду!');
  Exit;
 end;

 if DateEndEdit.Text = '' then begin
  ShowMessage('Ви не увели дату закінчення періоду!');
  Exit;
 end;

 if DateBegEdit.Date > DateEndEdit.Date then begin
  ShowMessage('Дату поатку періоду не може бути більшою ніж дата його закінчення!');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure Tsp_Inflation_Add_Form.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  DateEndEdit.SetFocus;
 end;
end;

procedure Tsp_Inflation_Add_Form.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  IndexEdit.SetFocus;
 end;
end;

procedure Tsp_Inflation_Add_Form.IndexEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

end.
