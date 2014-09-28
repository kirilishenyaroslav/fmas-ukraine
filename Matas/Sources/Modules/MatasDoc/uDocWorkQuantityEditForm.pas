{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkQuantityEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit;

type
  TDocWorkQuantityForm = class(TForm)
    Label2: TLabel;
    cxKolMat: TcxCurrencyEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKolMatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   MAX_KOL: Double;
  end;

var
  DocWorkQuantityForm: TDocWorkQuantityForm;

implementation

{$R *.dfm}

procedure TDocWorkQuantityForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_ESCAPE	then
  CancelButton.Click;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.Click;
end;

procedure TDocWorkQuantityForm.cxKolMatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  OkButton.SetFocus;
end;

procedure TDocWorkQuantityForm.OkButtonClick(Sender: TObject);
begin
 if MAX_KOL>0 then
  if cxKolMat.EditValue<=MAX_KOL then
   ModalResult:=mrOk;
end;

end.
