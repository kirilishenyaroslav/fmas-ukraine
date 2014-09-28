{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkProvSelTip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TDocWorkProvSelTipForm = class(TForm)
    cxButtonDog: TcxButton;
    cxButtonSmeta: TcxButton;
    cxButtonProv: TcxButton;
    cxButtonExit: TcxButton;
    procedure cxButtonDogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonSmetaClick(Sender: TObject);
    procedure cxButtonProvClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    TIP_ISTFIN: integer;
  end;

var
  DocWorkProvSelTipForm: TDocWorkProvSelTipForm;

implementation

{$R *.dfm}

procedure TDocWorkProvSelTipForm.cxButtonDogClick(Sender: TObject);
begin
 TIP_ISTFIN:=1;
end;

procedure TDocWorkProvSelTipForm.FormCreate(Sender: TObject);
begin
 TIP_ISTFIN:=-1;
end;

procedure TDocWorkProvSelTipForm.cxButtonSmetaClick(Sender: TObject);
begin
 TIP_ISTFIN:=2;
end;

procedure TDocWorkProvSelTipForm.cxButtonProvClick(Sender: TObject);
begin
 TIP_ISTFIN:=0;
end;

procedure TDocWorkProvSelTipForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_ESCAPE	then
  cxButtonExit.Click;
end;

end.
