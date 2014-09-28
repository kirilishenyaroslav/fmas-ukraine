{ -internal}
{-$Id: EditExpert.pas,v 1.1.1.1 2005/07/07 10:35:18 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2003                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{   Эксперт создания скриптов и формы редактирования по описанию таблицы     }

unit EditExpert;

interface

uses
	ShareMem, ExptIntf,ToolIntf, VirtIntf,
	Windows, SysUtils, EditExpertFormUnit;

type
	TEditFormExpert = class(TIExpert)
		function GetName: String; override;
		function GetComment: String; override;
		function GetGlyph: HICON; override;
		function GetStyle: TExpertStyle; override;
		function GetState: TExpertState; override;
		function GetIDString: String; override;
		function GetAuthor: String; override;
		function GetPage: String; override;
		function GetMenuText: String;override;
		procedure Execute; override;
	end;

procedure	Register;

implementation

{$R EditExpIcon.res}

procedure HandleException;
begin
	ToolServices.RaiseException(ReleaseException);
end;

function TEditFormExpert.GetName: String;
begin
	try
		Result := 'IB Edit Form Wizard';
	except
		HandleException;
	end;
end;

function TEditFormExpert.GetComment: String;
begin
	try
		Result := 'IB Edit Form Wizard - add/modify/info form using EditControl';
	except
		HandleException;
	end;
end;

function TEditFormExpert.GetGlyph: HICON;
begin
	try
		Result := LoadIcon(HInstance,'EDITEXPICON');
	except
		HandleException;
		Result := 0;
	end;
end;

function TEditFormExpert.GetStyle: TExpertStyle;
begin
	Result := esForm;
end;

function TEditFormExpert.GetState: TExpertState;
begin
	Result := [esEnabled];
end;

function TEditFormExpert.GetIDString: String;
begin
	Result := 'Qizz.EditFormExpert';
end;

function TEditFormExpert.GetAuthor: String;
begin
	Result := 'Qizz';
end;

function TEditFormExpert.GetPage: String;
begin
	Result := 'Forms';
end;

function TEditFormExpert.GetMenuText: String;
begin
	Result := '';
end;

procedure TEditFormExpert.Execute;
var
	form: TEditExpertForm;
begin
	form := TEditExpertForm.Create(nil);
	form.ShowModal;
	form.Free;
end;

procedure	Register;
begin
	RegisterLibraryExpert(TEditFormExpert.Create);
end;

end.
