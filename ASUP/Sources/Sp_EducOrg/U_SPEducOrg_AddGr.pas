{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник регалий"                              }
{            Модуль изменения/добавления группы регалий                        }
{                                               ответственный: Тимофеев Антон  }
unit U_SPEducOrg_AddGr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, StdCtrls, Buttons, FieldControl, Mask,
  CheckEditUnit, ExtCtrls, U_SPEducOrgDM;

type
  TForm_SPEducOrg_AddGr = class(TForm)
    Panel1: TPanel;
    CheckEdit_NewName: TCheckEdit;
    FC_NewName: TFieldControl;
    Label_Post: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
  private
    { Private declarations }
  public
    DMod:  TDM_SPEducOrg;
    Id: string;
    Add: Boolean;
    { Public declarations }
  end;

var
  Form_SPEducOrg_AddGr: TForm_SPEducOrg_AddGr;

implementation

{$R *.dfm}

end.
