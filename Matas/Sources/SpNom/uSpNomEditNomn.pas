{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Номенклатор                                     }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpNomEditNomn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxCheckBox, cxButtons, uSpNomLang;

type
  TfmEditNomn = class(TForm)
    cxNomn: TcxTextEdit;
    Label1: TLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxCheckRecurse: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditNomn: TfmEditNomn;

implementation

{$R *.dfm}

procedure TfmEditNomn.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=NOM_STR_BUTTON_OK_CONST;
 CancelButton.Caption:=NOM_STR_BUTTON_CANCEL_CONST;
 cxCheckRecurse.Properties.Caption:=NOM_STR_INCLUDE_CHILD;
 Label1.Caption:=NOM_STR_GRID_CAP_NOMN;
end;

end.
