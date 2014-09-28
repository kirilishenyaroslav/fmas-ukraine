{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasGetSumma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit;

type
  TMatasGetSummaForm = class(TForm)
    Label1: TLabel;
    cxSumma: TcxCurrencyEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure cxSummaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MatasGetSummaForm: TMatasGetSummaForm;

implementation

{$R *.dfm}

procedure TMatasGetSummaForm.cxSummaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  OkButton.SetFocus;
end;

procedure TMatasGetSummaForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

end.
