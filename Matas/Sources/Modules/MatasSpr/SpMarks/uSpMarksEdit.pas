{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpMarksEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxButtons;

type
  TSpMarksEdit = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxName: TcxTextEdit;
    cxShort: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpMarksEdit: TSpMarksEdit;

implementation

{$R *.dfm}

procedure TSpMarksEdit.FormKeyDown(Sender: TObject; var Key: Word;
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
