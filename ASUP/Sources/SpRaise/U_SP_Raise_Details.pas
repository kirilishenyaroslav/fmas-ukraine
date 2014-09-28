{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник надбавок"                             }
{                 Модуль детальной информации о надбавке                       }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Raise_Details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TFDetails = class(TForm)
    Label_Name: TLabel;
    R_Name: TLabel;
    Label_Min: TLabel;
    R_Min: TLabel;
    Label_Max: TLabel;
    R_max: TLabel;
    Label_Def: TLabel;
    R_Def: TLabel;
    Label_One: TLabel;
    Label_full: TLabel;
    R_Full: TLabel;
    R_One: TLabel;
    R_Spec: TLabel;
    SB_Ok: TSpeedButton;
    Label1: TLabel;
    Label_Beg: TLabel;
    Label3: TLabel;
    Label_End: TLabel;
    Label6: TLabel;
    procedure SB_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetails: TFDetails;

implementation

{$R *.dfm}

procedure TFDetails.SB_OkClick(Sender: TObject);
begin
  Close;
end;

end.
