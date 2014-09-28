unit SheetToBankAllSort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox,
  StdCtrls, cxButtons, Unit_ZGlobal_Consts, cxCheckBox, ZProc, ActnList,
  cxRadioGroup, cxButtonEdit, IBase, PackageLoad, ZTypes, ExtCtrls,
  cxSpinEdit, Dates;

type
  TFAllSort = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    RadioGroupOrder: TcxRadioGroup;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    GroupBank: TcxGroupBox;
    BankEdit: TcxButtonEdit;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    Bevel1: TBevel;
    LabelPeriod: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure BankEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PId_Type_Payment:integer;
    PKodSetup:Integer;
  public
    constructor Create(AOwner:TComponent;ADb_handle:TISC_DB_HANDLE);reintroduce;
    property Bank:Integer read PId_Type_Payment;
  end;

implementation

{$R *.dfm}

constructor TFAllSort.Create(AOwner:TComponent;ADb_handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PDb_Handle:=ADb_handle;
 PKodSetup:=CurrentKodSetup(ADb_handle);
end;

procedure TFAllSort.FormCreate(Sender: TObject);
var PLanguageIndex:Byte;
begin
PLanguageIndex:=LanguageIndex;
Caption:=Options_Text[PLanguageIndex];
YesBtn.Caption      := PrintBtn_Caption[PLanguageIndex];
CancelBtn.Caption   := ExitBtn_Caption[PLanguageIndex];
YesBtn.Hint         := YesBtn.Caption;
CancelBtn.Hint      := CancelBtn.Caption;
GroupBank.Caption   := LabelBank_Caption[PLanguageIndex];
LabelPeriod.Caption := LabelPeriod_Caption[PLanguageIndex];
MonthesList.Properties.Items.Text := MonthesList_Text[PlanguageIndex];
MonthesList.ItemIndex := YearMonthFromKodSetup(PKodSetup,False)-1;
YearSpinEdit.Value    := YearMonthFromKodSetup(PKodSetup);
RadioGroupOrder.Caption := Order_Text[PLanguageIndex];
RadioGroupOrder.Properties.Items[0].Caption:= Tn_Text[PLanguageIndex];
RadioGroupOrder.Properties.Items[1].Caption:= FIO_Text[PLanguageIndex];
end;

procedure TFAllSort.ActionYesExecute(Sender: TObject);
begin
if BankEdit.Text<>'' then ModalResult:=mrYes
else BankEdit.SetFocus;
end;

procedure TFAllSort.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFAllSort.BankEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var viplata:Variant;
begin
Viplata := LoadViplata(Self,PDb_Handle,zfsModal);
if VarArrayDimCount(viplata)>0 then
 begin
   PId_Type_Payment:=viplata[0];
   BankEdit.Text := VarToStr(viplata[1]);
 end;
end;

end.
