{ -internal}
{-$Id: IBGroupExpert.pas,v 1.1.1.1 2005/07/07 10:35:18 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2003                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{             Эксперт групповых действий с таблицами и генераторами          }

unit IBGroupExpert;

interface

uses
	ShareMem,
{IFDEF DELPHI5}
	ExptIntf, ToolIntf, VirtIntf,
{IFEND}
	Windows, SysUtils, InsScript;

type
	TIBGroupExpert = class(TIExpert)
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

{$R IBGroupIcon.res}

procedure HandleException;
begin
	ToolServices.RaiseException(ReleaseException);
end;

function TIBGroupExpert.GetName: String;
begin
	try
		Result := 'IB Group Actions Script Expert';
	except
		HandleException;
	end;
end;

function TIBGroupExpert.GetComment: String;
begin
	try
		Result := 'group operations with tables/generators';
	except
		HandleException;
	end;
end;

function TIBGroupExpert.GetGlyph: HICON;
begin
	try
		Result := LoadIcon(HInstance,'IBGROUPICON');
	except
		HandleException;
		Result := 0;
	end;
end;

function TIBGroupExpert.GetStyle: TExpertStyle;
begin
	Result := esForm;
end;

function TIBGroupExpert.GetState: TExpertState;
begin
	Result := [esEnabled];
end;

function TIBGroupExpert.GetIDString: String;
begin
	Result := 'Qizz.IBGroupActionScriptExpert';
end;

function TIBGroupExpert.GetAuthor: String;
begin
	Result := 'Qizz';
end;

function TIBGroupExpert.GetPage: String;
begin
	Result := 'New';
end;

function TIBGroupExpert.GetMenuText: String;
begin
	Result := '';
end;

procedure TIBGroupExpert.Execute;
var
	form: TInsForm;
begin
	form := TInsForm.Create(nil);
	form.ShowModal;
	form.Free;
end;

procedure	Register;
begin
	RegisterLibraryExpert(TIBGroupExpert.Create);
end;

end.
