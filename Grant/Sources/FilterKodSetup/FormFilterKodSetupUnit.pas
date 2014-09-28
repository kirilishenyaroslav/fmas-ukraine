unit FormFilterKodSetupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxLabel, Dates, ActnList, Unit_zGlobal_Consts, IBase,
  zMessages, zProc, cxCheckBox;                 //, gr_PrintAnalitControl_DM

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
    cxCheckBox1: TcxCheckBox;
    procedure ActionYesF10Execute(Sender: TObject);
  private
    PKod_Setup:integer;
    pLanguageIndex:byte;
  public
    constructor Create(AOwner: TComponent;ADb_Handle:TISC_DB_HANDLE;AKod_Setup:integer);reintroduce;
    property Kod_Setup:integer read PKod_Setup;
  end;
var AnalitControl:boolean;
implementation

{$R *.dfm}

constructor TFormFilterKodSetup.Create(AOwner: TComponent;ADb_Handle:TISC_DB_HANDLE;AKod_Setup:integer);
begin
 inherited Create(AOwner);
 pLanguageIndex := LanguageIndex;

 PeriodLabel.Caption := LabelPeriod_Caption[pLanguageIndex];
 YesBtn.Caption      := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Caption   := CancelBtn_Caption[pLanguageIndex];
 Caption             := FilterBtn_Caption[pLanguageIndex];
 MonthesList.Properties.Items.Text    := MonthesList_Text[pLanguageIndex];

 PKod_Setup:=AKod_Setup;

 if PKod_Setup<=0 then PKod_Setup := CurrentKodSetup(ADb_Handle);

 MonthesList.ItemIndex:=YearMonthFromKodSetup(PKod_Setup,False)-1;
 YearSpinEdit.Value:=YearMonthFromKodSetup(PKod_Setup);
end;

procedure TFormFilterKodSetup.ActionYesF10Execute(Sender: TObject);
begin
 PKod_Setup:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
 if cxCheckBox1.Checked then  AnalitControl:=True;        //gr_PrintAnalitControl_DM
 ModalResult:=mrYes;
end;

end.
