unit SpPrivilegesZarplataControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxContainer, cxEdit, cxTextEdit, cxControls,
  cxGroupBox, zProc,
  Unit_ZGlobal_Consts, cxLabel, cxSpinEdit, ExtCtrls, ComCtrls,
  ActnList, zMessages;

type
  TFormSp_PrivilegesControl = class(TForm)
    IdentificationBox: TcxGroupBox;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    PeriodBox: TcxGroupBox;
    DateEnd: TcxDateEdit;
    OptionsBox: TcxGroupBox;
    MinSpinEdit: TcxSpinEdit;
    MaxSpinEdit: TcxSpinEdit;
    MinLabel: TcxLabel;
    MaxLabel: TcxLabel;
    DateBeg: TcxDateEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    KodLabel: TcxLabel;
    NameLabel: TcxLabel;
    DateBegLabel: TcxLabel;
    DateEndLabel: TcxLabel;
    KoefficientLabel: TcxLabel;
    KodEdit: TcxMaskEdit;
    KoefficientEdit: TcxMaskEdit;
    NameEdit: TcxMaskEdit;
    ActionList1: TActionList;
    Action1: TAction;
    LabelKodPriv1DF: TcxLabel;
    MaskEditKodPriv1DF: TcxMaskEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KodEditKeyPress(Sender: TObject; var Key: Char);
    procedure MinSpinEditExit(Sender: TObject);
    procedure MaxSpinEditEnter(Sender: TObject);
    procedure DateBegExit(Sender: TObject);
    procedure DateEndExit(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
  private
    PLanguageIndex:integer;
  public
  end;

implementation

{$R *.dfm}

procedure TFormSp_PrivilegesControl.CancelBtnClick(Sender: TObject);
begin
self.DateEnd.Date         := Date;
self.DateBeg.Date         := Date;
self.KoefficientEdit.Text := '';
self.ModalResult          := mrCancel;
end;

procedure TFormSp_PrivilegesControl.FormCreate(Sender: TObject);
begin
PLanguageIndex := LanguageIndex;
self.IdentificationBox.Caption  := '';
self.OptionsBox.Caption         := '';
self.PeriodBox.Caption          := '';
self.MinLabel.Caption           := LabelMinAmount_Caption[PLanguageIndex];
self.MaxLabel.Caption           := LabelMaxAmount_Caption[PLanguageIndex];
self.YesBtn.Caption             := YesBtn_Caption[PLanguageIndex];
self.CancelBtn.Caption          := CancelBtn_Caption[PLanguageIndex];
self.KodLabel.Caption           := LabelKod_Caption[PLanguageIndex];
self.NameLabel.Caption          := LabelName_Caption[PLanguageIndex];
self.KoefficientLabel.Caption   := LabelKoefficient_Caption[PLanguageIndex];
self.DateBegLabel.Caption       := LabelDateBeg_Caption[PLanguageIndex];
self.DateEndLabel.Caption       := LabelDateEnd_Caption[PLanguageIndex];
self.LabelKodPriv1DF.Caption    := LabelKod1DF_Caption[PLanguageIndex];
self.DateEnd.Date               := Date;
self.DateBeg.Date               := Date;
self.KoefficientEdit.Properties.EditMask := '\d (['+ZSystemDecimalSeparator+']\d\d?)?';
end;

procedure TFormSp_PrivilegesControl.KodEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if (length(KodEdit.Text)=4) and (key in ['0'..'9']) then key:=#0;
end;

procedure TFormSp_PrivilegesControl.MinSpinEditExit(Sender: TObject);
begin
MaxSpinEdit.Value:=MinSpinEdit.Value;
if MaxSpinEdit.Properties.MaxValue=MinSpinEdit.Value then
   MaxSpinEdit.Properties.Increment:=0
else
 begin
  MaxSpinEdit.Properties.MinValue:=MinSpinEdit.Value;
  MaxSpinEdit.Properties.Increment:=1;
 end;
end;

procedure TFormSp_PrivilegesControl.MaxSpinEditEnter(Sender: TObject);
begin
MinSpinEditExit(Sender);
end;

procedure TFormSp_PrivilegesControl.DateBegExit(Sender: TObject);
begin
DateEnd.Date:=DateBeg.Date;
if DateEnd.Properties.MinDate=DateBeg.Date then
   DateEnd.Properties.ReadOnly:=true
else
 begin
  DateEnd.Properties.MinDate:=DateBeg.Date;
  DateEnd.Properties.ReadOnly:=false;
 end;
end;

procedure TFormSp_PrivilegesControl.DateEndExit(Sender: TObject);
begin
if DateEnd.Date<DateBeg.Date then DateEnd.Date:=DateBeg.Date;
end;

procedure TFormSp_PrivilegesControl.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if (Length(NameEdit.Text)=255) and (Key<>#7) and (key<>#8) then Key:=#0;
end;

procedure TFormSp_PrivilegesControl.Action1Execute(Sender: TObject);
begin
if KodEdit.Text<>'' then
 if NameEdit.Text<>'' then
  if KoefficientEdit.Text<>'' then
   if DateBeg.Text<>'' then
    if DateEnd.Text<>'' then
     if MaskEditKodPriv1DF.Text<>'' then
      if DateEnd.Date<DateBeg.Date then
       begin
        ZShowMessage(Error_Caption[PLanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOK]);
        if DateEnd.Enabled = True then DateEnd.SetFocus;
        if DateBeg.Enabled = True then DateBeg.SetFocus;
       end
      else ModalResult:=mrYes
     else MaskEditKodPriv1DF.SetFocus
    else DateEnd.SetFocus
   else DateBeg.SetFocus
  else KoefficientEdit.SetFocus
 else NameEdit.SetFocus
else KodEdit.SetFocus;
end;

end.
