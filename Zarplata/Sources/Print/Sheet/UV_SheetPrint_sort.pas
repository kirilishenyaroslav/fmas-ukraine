unit UV_SheetPrint_Sort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox,
  StdCtrls, cxButtons, Unit_ZGlobal_Consts, cxCheckBox, ZProc, ActnList,
  cxRadioGroup;

type
  TFSort = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    CheckBoxPrintDate: TcxCheckBox;
    RadioGroupOrder: TcxRadioGroup;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFSort.FormCreate(Sender: TObject);
var PLanguageIndex:Byte;
begin
PLanguageIndex:=LanguageIndex;
Caption:=Options_Text[PLanguageIndex];
YesBtn.Caption      := PrintBtn_Caption[PLanguageIndex];
CancelBtn.Caption   := ExitBtn_Caption[PLanguageIndex];
YesBtn.Hint         := YesBtn.Caption;
CancelBtn.Hint      := CancelBtn.Caption;
CheckBoxPrintDate.Properties.Caption := NonDate_Caption[PLanguageIndex];
RadioGroupOrder.Caption := Order_Text[PLanguageIndex];
RadioGroupOrder.Properties.Items[0].Caption:= Tn_Text[PLanguageIndex];
RadioGroupOrder.Properties.Items[1].Caption:= FIO_Text[PLanguageIndex];
end;

procedure TFSort.ActionYesExecute(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TFSort.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
