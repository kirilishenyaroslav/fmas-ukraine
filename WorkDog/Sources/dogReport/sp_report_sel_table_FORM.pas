{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{               Модуль "Выбор существующих таблиц БД"                          }
{ Используется для выбора существующих таблиц из базы данных.                  }
{                                                 ответственный: Гнибеда Антон }

unit sp_report_sel_table_FORM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TSelTableFrom = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxComboBox1: TcxComboBox;
    Label1: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelTableFrom: TSelTableFrom;

implementation

{$R *.dfm}

procedure TSelTableFrom.cxButton1Click(Sender: TObject);
begin
 ModalResult := mrOK;
end;

procedure TSelTableFrom.cxButton2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TSelTableFrom.FormShow(Sender: TObject);
begin
 cxComboBox1.SetFocus;
end;

end.
