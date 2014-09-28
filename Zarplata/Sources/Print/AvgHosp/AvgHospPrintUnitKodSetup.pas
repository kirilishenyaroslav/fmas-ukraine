unit AvgHospPrintUnitKodSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxLabel, Dates, ActnList, Unit_ZGlobal_Consts, IBase,  zMessages, ZProc;

type
  TFormFilterKodSetup = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    PeriodLabel: TcxLabel;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    Actions: TActionList;
    ActionYesF10: TAction;
    ActionYesCtrlEnd: TAction;
    procedure ActionYesF10Execute(Sender: TObject);
  private
    PKod_Setup:integer;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner: TComponent;ADb_Handle:TISC_DB_HANDLE);reintroduce;
    property Kod_Setup:integer read PKod_Setup;
  end;

implementation

{$R *.dfm}

constructor TFormFilterKodSetup.Create(AOwner: TComponent;ADb_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;

 PeriodLabel.Caption := LabelPeriod_Caption[PLanguageIndex];
 YesBtn.Caption      := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption   := CancelBtn_Caption[PLanguageIndex];
 Caption             := LabelPeriod_Caption[PLanguageIndex];
 MonthesList.Properties.Items.Text    := MonthesList_Text[PLanguageIndex];

 PKod_Setup:=CurrentKodSetup(ADb_Handle);

 MonthesList.ItemIndex:=YearMonthFromKodSetup(PKod_Setup,False)-1;
 YearSpinEdit.Value:=YearMonthFromKodSetup(PKod_Setup);
end;

procedure TFormFilterKodSetup.ActionYesF10Execute(Sender: TObject);
begin
 PKod_Setup:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
 ModalResult:=mrYes;
end;

end.
