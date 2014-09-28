program UpdateAsup;

uses
  Forms,
  UpdateAsupUnit in 'UpdateAsupUnit.pas' {UpdateForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Обновление управления персоналом';
  Application.CreateForm(TUpdateForm, UpdateForm);
  Application.Run;
end.
