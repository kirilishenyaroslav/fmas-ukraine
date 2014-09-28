unit uPrK_Results_of_Filtr_ProgressBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Math;

type
  TFormPrK_Results_of_Filtr_ProgressBar = class(TForm)
    ProgressBarExport: TProgressBar;
    Label1: TLabel;
  private
    { Private declarations }
  public
    constructor Create (iMax: Integer); overload;
  end;

var
  FormPrK_Results_of_Filtr_ProgressBar: TFormPrK_Results_of_Filtr_ProgressBar;

implementation

{$R *.dfm}

constructor TFormPrK_Results_of_Filtr_ProgressBar.Create(iMax: Integer);
begin
    inherited Create(nil);
    ProgressBarExport.Smooth := False;
   // ProgressBarExport.Max    := iMax;
    ProgressBarExport.Step   := ProgressBarExport.Max div iMax;
end;
end.
