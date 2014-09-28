program Win2Dos;

uses
  Windows,Forms,
  Win2DosImprt in 'Win2DosImprt.pas' {frmDosImport};

{$R *.res}

const INI_FILENAME ='config.ini';

begin
        Application.Initialize;
        Application.Title := 'Загрузка данных';
        Application.CreateForm(TfrmDosImport, frmDosImport);
        Application.Run;
end.
