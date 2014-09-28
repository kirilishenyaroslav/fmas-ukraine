unit uSearch;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uSearch                                                                    *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Организация диалога для поиска выражения.                                  *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxRadioGroup, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxMRUEdit,
  cxButtons, uTypes, cxCheckBox, ExtCtrls;

type

  TfmSearch = class(TForm)
	btnOK            : TcxButton;
	btnCancel        : TcxButton;
	lblSearch        : TLabel;
	edtSearch        : TcxMRUEdit;
	gbxOptions       : TGroupBox;
    rgrDirection     : TRadioGroup;
	cbxWholeWords    : TcxCheckBox;
    cbxCaseSensitive : TcxCheckBox;

	procedure btnOKClick   (Sender: TObject);
	procedure FormShortCut (var Msg: TWMKey; var Handled: Boolean);
  private
	{ Private declarations }
  public
	{ Public declarations }
  end;

implementation

resourcestring
	sSearchStrIsEmpty = 'Текст для поиска не задан';

{$R *.dfm}

//Обрабатываем горячие клавиши
procedure TfmSearch.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  case Msg.CharCode of

	VK_F10    : begin
				  btnOK.Click;
				  Handled := True;
				end;

	VK_ESCAPE : begin
                  btnCancel.Click;
				  Handled := True;
				end;
  end;
end;

//Проверяем корректность введенной пользователем информации
procedure TfmSearch.btnOKClick(Sender: TObject);
begin
	if Trim( edtSearch.Text ) = ''
	then begin
		ModalResult := mrNone;
		MessageBox( Handle, PChar( sSearchStrIsEmpty ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
		edtSearch.SetFocus;
		Exit;
	end;
end;

end.
