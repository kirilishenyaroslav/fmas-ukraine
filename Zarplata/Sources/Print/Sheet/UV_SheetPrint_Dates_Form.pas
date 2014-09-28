unit UV_SheetPrint_Dates_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox,
  StdCtrls, cxButtons, Unit_ZGlobal_Consts, cxCheckBox, ZProc, ActnList,
  cxRadioGroup;

type
  TFTermsSheetPrint = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    cxGroupBox: TcxGroupBox;
    cxLabelFrom: TcxLabel;
    DateFrom: TcxDateEdit;
    DateTo: TcxDateEdit;
    cxLabelTo: TcxLabel;
    CheckBoxNonTerm: TcxCheckBox;
    CheckBoxPrintDate: TcxCheckBox;
    RadioGroupOrder: TcxRadioGroup;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UV_SheetPrint_DM;

{$R *.dfm}

procedure TFTermsSheetPrint.FormCreate(Sender: TObject);
var PLanguageIndex:Byte;
begin
PLanguageIndex:=LanguageIndex;
DateFrom.Date:=Date;
DateTo.Date := Date+3;


Caption:=Options_Text[PLanguageIndex];
cxGroupBox.Caption  :='';
cxLabelFrom.Caption := LabelDateBeg_Caption[PLanguageIndex];
cxLabelTo.Caption   := LabelDateEnd_Caption[PLanguageIndex];
YesBtn.Caption      := PrintBtn_Caption[PLanguageIndex];
CancelBtn.Caption   := ExitBtn_Caption[PLanguageIndex];
YesBtn.Hint         := YesBtn.Caption;
CancelBtn.Hint      := CancelBtn.Caption;
CheckBoxNonTerm.Properties.Caption := NonTerm_Caption[PLanguageIndex];
CheckBoxPrintDate.Properties.Caption := NonDate_Caption[PLanguageIndex];
RadioGroupOrder.Caption := Order_Text[PLanguageIndex];
RadioGroupOrder.Properties.Items[0].Caption:= Tn_Text[PLanguageIndex];
RadioGroupOrder.Properties.Items[1].Caption:= FIO_Text[PLanguageIndex];
end;

procedure TFTermsSheetPrint.ActionYesExecute(Sender: TObject);
begin
if DateFrom.Date>DateTo.Date then
   DateFrom.SetFocus
else
   ModalResult:=mrYes;
end;

procedure TFTermsSheetPrint.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFTermsSheetPrint.cxCheckBox2PropertiesChange(Sender: TObject);
begin
  if cxCheckBox2.Checked=true then cxCheckBox1.Checked:=false;
end;

procedure TFTermsSheetPrint.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  if cxCheckBox1.Checked=true then cxCheckBox2.Checked:=false;
end;

end.
