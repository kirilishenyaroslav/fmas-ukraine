{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы со складской картотекой                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uWHKartWorkSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TSplashForm = class(TForm)
    ProgressBar: TProgressBar;
    MsgLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

end.
