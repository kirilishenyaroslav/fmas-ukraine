unit uLogIn;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uLogIn                                                                     *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Диалог идентификации пользователя при входе в систему.                     *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxMRUEdit,
  jpeg, ExtCtrls, Registry;

type

  TfmLogIn = class(TForm)
	imgLogIn    : TImage;

	lblUser     : TLabel;
	lblPassword : TLabel;

	edtUser     : TcxTextEdit;
	edtPassword : TcxTextEdit;

	btnOK       : TcxButton;
	btnCancel   : TcxButton;

	procedure FormCreate   (Sender: TObject);
	procedure FormShortCut (var Msg: TWMKey; var Handled: Boolean);
  private
	{ Private declarations }
  public
	{ Public declarations }
  end;

implementation

resourcestring

	sREG_KEY_CURR     = '\Software\DonNU\JO5\Vershion 1.0.0\UserInfo';
	sREG_PRM_Login    = 'Login';
	sREG_PRM_Password = 'Password';

const

	cREG_KEY_ROOT = HKEY_CURRENT_USER;

{$R *.dfm}

//Обрабатываем горячие клавиши
procedure TfmLogIn.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  case Msg.CharCode of

	VK_F10    : begin
				  ModalResult := mrOk;
				  Handled := True;
				end;

	VK_ESCAPE : begin
				  ModalResult := mrCancel;
				  Handled := True;
				end;
  end;
end;

//
procedure TfmLogIn.FormCreate(Sender: TObject);
var
	Reg : TRegistry;
begin
 try
	 Reg         := TRegistry.Create;
	 Reg.RootKey := cREG_KEY_ROOT;

	 if Reg.OpenKey( sREG_KEY_CURR + sREG_PRM_Login, False )
	 then begin
		 edtUser.Text := Reg.ReadString( sREG_PRM_Login );

		 if Reg.OpenKey( sREG_KEY_CURR + sREG_PRM_Password, False )
		 then begin
			 edtPassword.Text := Reg.ReadString( sREG_PRM_Password );
			 if edtPassword.Text <> ''
			 then begin
				 //Call AccessFMAS functions
			 end;
		 end;

	 end;

 finally
	 if Reg <> nil then Reg.Free;
 end;

end;

end.
