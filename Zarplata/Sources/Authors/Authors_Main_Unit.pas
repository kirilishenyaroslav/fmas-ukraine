unit Authors_Main_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, Unit_ZGlobal_Consts, ZProc;

type
  TAuthorForm = class(TForm)
    Bevel1: TBevel;
    Image1: TImage;
    LabelProgrammer: TcxLabel;
    LabelPostanov: TcxLabel;
    LabelPeriod: TcxLabel;
    LabelFirm: TcxLabel;
    OkBtn: TcxButton;
    Timer: TTimer;
    procedure OkBtnClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    PLanguageIndex:byte;
  public
    { Public declarations }
  end;

implementation

uses Math;

{$R *.dfm}

procedure TAuthorForm.OkBtnClick(Sender: TObject);
begin
Timer.Enabled := True;
end;

procedure TAuthorForm.TimerTimer(Sender: TObject);
begin
AlphaBlendValue:=AlphaBlendValue-20;
if AlphaBlendValue<20 then Close;
end;

procedure TAuthorForm.FormCreate(Sender: TObject);
begin
PLanguageIndex:=LanguageIndex;
Caption := ZAuthor_Caption[PLanguageIndex];
LabelProgrammer.Caption := ZAuthor_LabelProgrammer_Text[PLanguageIndex];
LabelPostanov.Caption := ZAuthor_LabelPostanov_Text[PLanguageIndex];
LabelPeriod.Caption := ZAuthor_LabelPeriod_Text[PLanguageIndex];
LabelFirm.Caption := ZAuthor_LabelFirm_Text[PLanguageIndex];
OkBtn.Caption := ExitBtn_Caption[PLanguageIndex];
end;

end.
