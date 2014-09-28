//***********************************************************************
//* Проект "Студгородок"                                                *
//* Сплеш - окно                                                        *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit Splash_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TSplashForm = class(TForm)
    Image2: TImage;
    Studsity_Label: TLabel;
    Load_Label: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label1: TLabel;
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
