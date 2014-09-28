program HistoryGen;

uses
  Forms,
  uHistoryGen in 'uHistoryGen.pas' {fmHistoryGen};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmHistoryGen, fmHistoryGen);
  Application.Run;
end.
