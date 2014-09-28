{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, RxGIF, ExtCtrls;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    MsgLabel: TLabel;
    TitleLabel: TLabel;
    ProgressBar: TProgressBar;
    Animate1: TAnimate;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

procedure TSplashForm.FormCreate(Sender: TObject);
begin
 Animate1.Active:=true;
end;

end.
