{ -internal}
{-$Id: CheckEditUnit.pas,v 1.1.1.1 2005/07/07 10:35:18 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2003                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{               Компонент TCheckEdit - улучшенное поле ввода                 }

unit CheckEditUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, IBQuery, Mask;

type
  TInputSet = (isAll, isName, isDigits, isDigitsDot, isTime);

  TCheckEdit = class(TMaskEdit)
  private
	InSet: set of Char;
	FInputSet: TInputSet;
  protected
	procedure	WndProc(var Message: TMessage);override;
	procedure	KeyPress(var Key: Char);override;
	procedure	Loaded;override;
	procedure       ValidateError;override;
  public
	OldValue	:String;
	procedure	Dim(b: Boolean);

  published
	property	InputSet:TInputSet read FInputSet write FInputSet;
  end;

procedure Register;

implementation

procedure	TCheckEdit.WndProc(var Message: TMessage);
begin
	if (Message.Msg = WM_SETFOCUS) and ReadOnly then Exit;
	inherited	WndProc(Message);
end;

procedure	TCheckEdit.KeyPress(var Key: Char);
begin
	if not(Key in InSet) then Key := #0;
	inherited KeyPress(Key);
end;

procedure	TCheckEdit.Loaded;
var
	i: Integer;
begin
	inherited Loaded;
	case FInputSet of
		isAll:
			for i:=0 to $FF do InSet := InSet + [Chr(i)];
		isName:
		begin
			for i:=$C0 to $FF do InSet := InSet + [Chr(i)];
			InSet := InSet + [#$A5,#$A8,#$AA,#$AF,#$B2,#$B3,
			#$B4,#$B8,#$BA,#$BF,#$27,#$2D,#$60,#$91,#$92];
		end;
		isDigits:
			InSet := ['0','1','2','3','4','5','6','7','8','9'];
		isDigitsDot:
			InSet := ['0','1','2','3','4','5','6','7','8','9','.',','];
        isTime:
            InSet := ['0','1','2','3','4','5','6','7','8','9',':', '.', ','];
	end;
	InSet := InSet + [#8];
end;

procedure	TCheckEdit.Dim(b: Boolean);
begin
	if b = True then Font.Color := RGB(80,80,80)
	else Font.Color := clBlack;
end;

procedure       TCheckEdit.ValidateError;
begin
	MessageDlg('Невірне значення! Натисніть Esc для відміни змін',
		mtError,[mbOK],0);
end;

procedure Register;
begin
  RegisterComponents('Samples', [TCheckEdit]);
end;

end.
