unit NonSpisokCtrl_ByHours;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, ExtCtrls, StdCtrls, cxButtons, IBase,
  Unit_ZGlobal_Consts, ZProc, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet;

type TNonSpisokByHours = record
  Clock:string;
  Sum_Clock:double;
  Percent:double;
  Summa:double;
  ModalResult:TModalResult;
end;

type
  TFNonSpisokCtrl_ByHours = class(TForm)
    LabelHours: TcxLabel;
    LabelSumma: TcxLabel;
    LabelPercent: TcxLabel;
    EditHours: TcxMaskEdit;
    EditSumma: TcxMaskEdit;
    EditPercent: TcxMaskEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Bevel1: TBevel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditHoursKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex:Byte;
    CurrDecimalSeparator:string[1];
  public
    constructor Create(AOwner:TComponent);reintroduce;
  end;

function Show_TFNonSpisokCtrl_ByHours(AOWner:TComponent;Param:TNonSpisokByHours):TNonSpisokByHours;
  
implementation

{$R *.dfm}
function Show_TFNonSpisokCtrl_ByHours(AOWner:TComponent;Param:TNonSpisokByHours):TNonSpisokByHours;
var Fm: TFNonSpisokCtrl_ByHours;
begin
  Fm := TFNonSpisokCtrl_ByHours.Create(AOWner);
  Fm.EditHours.Text := Param.Clock;
  Fm.EditSumma.Text := FloatToStr(Param.Sum_Clock);
  if Param.Percent=0 then Param.Percent:=100;
     Fm.EditPercent.Text := FloatToStr(Param.Percent);
  Result.ModalResult := Fm.ShowModal;
  if Result.ModalResult=mrYes then
  begin
     Result.Clock := Fm.EditHours.Text;
     Result.Sum_Clock := StrToFloat(Fm.EditSumma.Text);
     Result.Percent := StrToFloat(Fm.EditPercent.Text);
     if Trim(Result.Clock)='' then
      Result.Summa:=zRoundTo(Result.Sum_Clock/100*Result.Percent,-2)
     else
      Result.Summa:=zRoundTo(StrToFloat(Result.Clock)*Result.Sum_Clock/100*Result.Percent,-2);
  end
  else
  begin
    Result.Clock := Param.Clock;
    Result.Sum_Clock := Param.Sum_Clock;
    Result.Percent := Param.Percent;
    Result.Summa := Result.Summa;
  end;
  Fm.Free;
end;

constructor TFNonSpisokCtrl_ByHours.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
//------------------------------------------------------------------------------
 PLanguageIndex:=LanguageIndex;
 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption :=  CancelBtn_Caption[PLanguageIndex];
 YesBtn.Hint := YesBtn.Caption;
 CancelBtn.Hint :=CancelBtn.Caption;
 LabelHours.Caption := LabelHours_Caption[PLanguageIndex];
 LabelSumma.Caption := LabelSumma_Caption[PLanguageIndex];
 LabelPercent.Caption := LabelPercent_Caption[PLanguageIndex];
//------------------------------------------------------------------------------
 CurrDecimalSeparator:=ZSystemDecimalSeparator;
 EditHours.Properties.EditMask:='\d\d?\d? (['+CurrDecimalSeparator+']\d\d?\d?)?';
 //EditSumma.Properties.EditMask:='\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+CurrDecimalSeparator+']\d\d?)?';
 EditPercent.Properties.EditMask:='100(['+CurrDecimalSeparator+']0(0?))? | \d\d? (['+CurrDecimalSeparator+',]\d\d?)?';

end;

procedure TFNonSpisokCtrl_ByHours.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFNonSpisokCtrl_ByHours.ActionYesExecute(Sender: TObject);
begin
if EditSumma.Text='' then
 begin
  EditSumma.SetFocus;
  Exit;
 end;
if EditPercent.Text='' then
 begin
  EditPercent.SetFocus;
  Exit;
 end;
ModalResult:=mrYes;
end;

procedure TFNonSpisokCtrl_ByHours.EditHoursKeyPress(Sender: TObject;
  var Key: Char);
begin
if (Key='.') or (Key=',') then Key:=CurrDecimalSeparator[1];
end;

end.
