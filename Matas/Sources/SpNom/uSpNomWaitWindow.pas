{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Номенклатор                                     }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpNomWaitWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uSpNomLang, ExtCtrls;

type
  TWaitForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WaitForm: TWaitForm;

implementation

{$R *.dfm}

procedure TWaitForm.FormCreate(Sender: TObject);
begin
 Label1.Caption:=NOM_STR_WAIT_MESSAGE;
 Label2.Caption:=NOM_STR_WAIT_WORKED;
 Panel1.Color:=clMoneyGreen;
 Panel2.Color:=clMoneyGreen;
end;

end.
