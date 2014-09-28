program IBScriptExecuter;

uses
  Forms,
  Windows,
  uMain in '..\Main\uMain.pas' {fmMain},
  uUtils in '..\Utils\uUtils.pas',
  uTypes in '..\Types\uTypes.pas';

{$R *.res}

const
	cCMD_MODE = 'cmd';
	cWIN_MODE = 'win';

var
	i, n : Integer;

begin

  Application.Initialize;
  Application.Title := 'IBScript Executer';
  Application.CreateForm(TfmMain, fmMain);
  n:= ParamCount;

  for i := 1 to n
  do begin

	  if ParamStr( i ) = cCMD_MODE
	  then begin
		  fmMain.AppMode := amCmd;
	  end
	  else
		  if ParamStr( i ) = cWIN_MODE
		  then
			  fmMain.AppMode := amWin;

  end;

  Application.Run;

end.
