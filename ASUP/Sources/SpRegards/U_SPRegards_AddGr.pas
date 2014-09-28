{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник регалий"                              }
{            Модуль изменения/добавления группы регалий                        }
{                                               ответственный: Тимофеев Антон  }
unit U_SPRegards_AddGr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, StdCtrls, Buttons, FieldControl, Mask,
  CheckEditUnit, ExtCtrls, U_SPRegardsDM;

type
  TForm_SPRegards_AddGr = class(TForm)
    Panel1: TPanel;
    CheckEdit_NewName: TCheckEdit;
    FC_NewName: TFieldControl;
    Label_Post: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DMod:  TDMSPRegards;
    Id: string;
    Add: Boolean;
    { Public declarations }
  end;

var
  Form_SPRegards_AddGr: TForm_SPRegards_AddGr;

implementation

{$R *.dfm}

function TextOk(Txt:string):Boolean;
var p:integer;
begin
  p:=Pos(' ',Txt);
  while (p<>0)and(Length(Txt)<>0)do
  begin
    Delete(Txt,p,1);
    p:=Pos(' ',Txt);
  end;
  if (Length(Txt)=0)
   then Result:=False
   else Result:=True;
end;

procedure TForm_SPRegards_AddGr.OkButtonClick(Sender: TObject);
begin
  FC_NewName.Get;
  if not(FC_NewName.Check)
   then begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     Exit;
   end;
  if not TextOk(CheckEdit_NewName.Text)
   then begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     Exit;
   end;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    if Add then
     FIBQuery.SQL.Text:='execute procedure sp_reg_groups_i('+QuotedStr(CheckEdit_NewName.Text)+');'
     else FIBQuery.SQL.Text:='execute procedure sp_reg_groups_u('+Id+', '+QuotedStr(CheckEdit_NewName.Text)+');';
    FIBQuery.ExecProc;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося змінити запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
  end;
  end;
end;

procedure TForm_SPRegards_AddGr.CancelButtonClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	{if FormStyle = fsMDIChild then }Close;
end;

end.
