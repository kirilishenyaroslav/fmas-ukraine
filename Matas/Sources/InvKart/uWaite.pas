{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uWaite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uResources, cxControls,
  cxGroupBox, cxContainer, cxEdit, cxProgressBar;

type
  TfmWaite = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Animate1: TAnimate;
    cxProgressBar1: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmWaite: TfmWaite;

implementation


{$R *.dfm}

procedure TfmWaite.FormCreate(Sender: TObject);
begin
    Caption := '';
    SetWindowLong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and WS_POPUP AND WS_BORDER);
end;

end.
