unit Gr_Stud_IndexEdit_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, ActnList,
  StdCtrls, cxButtons, ExtCtrls,gr_uCommonConsts,gr_uCommonProc, cxCheckBox;

type
  TFormStudIndex_Edit = class(TForm)
    Panel1: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    Actions: TActionList;
    ActionCancel: TAction;
    LabelDate: TcxLabel;
    EditMonth: TcxComboBox;
    EditYear: TcxSpinEdit;
    EditMonthBase: TcxComboBox;
    EditYearBase: TcxSpinEdit;
    LabelBaseDate: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxMaskEdit1: TcxMaskEdit;
    cxCheckBox1: TcxCheckBox;
    EditSumma: TcxMaskEdit;
    Action1: TAction;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure LabelBaseDatePropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ButtonYesClick(Sender: TObject);
  private
    { Private declarations }
  public
  PLanguageIndex:byte;
    constructor create(Owner:TComponent);reintroduce;
  end;



implementation


constructor TFormStudIndex_Edit.create(Owner:TComponent);
begin
inherited create(Owner);
PLanguageIndex                := IndexLanguage;
//******************************************************************************
EditMonth.Properties.Items.Text                 := MonthesList_Text[PLanguageIndex];
EditMonthBase.Properties.Items.Text             := MonthesList_Text[PLanguageIndex];
LabelDate.Caption                               := GridClDateAcc_Caption[PLanguageIndex];
LabelBaseDate.Properties.Caption                           := BasePeriod_Caption[PLanguageIndex];
ButtonYes.Caption                               := YesBtn_Caption[PLanguageIndex];
ButtonCancel.Caption                            := CancelBtn_Caption[PLanguageIndex];
//******************************************************************************
end;
{$R *.dfm}

procedure TFormStudIndex_Edit.ActionYesExecute(Sender: TObject);
begin
if  cxCheckBox2.checked and  (cxMaskEdit1.text='')  then
  begin
    ShowMessage('"Сума фіксована" не заповнено');
    cxMaskEdit1.SetFocus;
    exit;
  end;
if  cxCheckBox1.checked and  (EditSumma.text='')  then
  begin
    ShowMessage('"Сума фактична" не заповнено');
    EditSumma.SetFocus;
    exit;
  end;
ModalResult:=mrYes;
end;

procedure TFormStudIndex_Edit.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormStudIndex_Edit.LabelBaseDatePropertiesChange(
  Sender: TObject);
begin
  EditMonthBase.Enabled:=not EditMonthBase.Enabled;
  EditYearBase.Enabled:=not EditYearBase.Enabled;
end;

procedure TFormStudIndex_Edit.cxCheckBox2PropertiesChange(Sender: TObject);
begin
  cxMaskEdit1.Enabled:=not cxMaskEdit1.Enabled;
end;

procedure TFormStudIndex_Edit.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  EditSumma.Enabled:=not EditSumma.Enabled;
end;

procedure TFormStudIndex_Edit.Action1Execute(Sender: TObject);
begin

     if  ButtonYes.Focused Then ActionYesExecute(Sender);
     if  ButtonCancel.Focused Then ActionCancelExecute(Sender);
     //selectnext(ActiveControl, TRUE, FALSE);
     SendKeyDown(Self.ActiveControl,VK_TAB,[ssShift]);
end;

procedure TFormStudIndex_Edit.ButtonYesClick(Sender: TObject);
begin
  ActionYesExecute(Sender);
end;

end.
