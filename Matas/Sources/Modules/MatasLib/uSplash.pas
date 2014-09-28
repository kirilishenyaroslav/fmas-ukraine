{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxProgressBar,
  ExtCtrls, ComCtrls, uResources;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    Title: TLabel;
    MsgLabel: TLabel;
    Animate1: TAnimate;
    Progress: TProgressBar;
    procedure StepBy(p: integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

procedure TSplashForm.StepBy(p: integer);
begin
 Progress.Position:=Progress.Position+p;
end;
{$R *.dfm}

procedure TSplashForm.FormCreate(Sender: TObject);
begin
 Title.Caption:=MAT_SPLASH_TITLE;
 Animate1.Active:=true;
end;

end.
