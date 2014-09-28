unit fltDogFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxContainer, cxEdit, cxCheckBox, cxControls, cxGroupBox,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCurrencyEdit, Menus,
  FIBDatabase, pFIBDatabase, cxMRUEdit, ActnList;

type
  TfltDogForm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    ShowClosedCheck: TcxCheckBox;
    fltDateCheck: TcxCheckBox;
    fltTipDogCheck: TcxCheckBox;
    fltDatePeriodCheck: TcxCheckBox;
    fltCustCheck: TcxCheckBox;
    fltTipDogEdit: TcxButtonEdit;
    fltDateBegEdit: TcxDateEdit;
    fltDateEndEdit: TcxDateEdit;
    cxLabel10: TcxLabel;
    fltCustEdit: TcxButtonEdit;
    OKButton: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    fltRegNumCheck: TcxCheckBox;
    fltRegNumEdit: TcxTextEdit;
    fltSumCheck: TcxCheckBox;
    Label1: TLabel;
    fltSumFromEdit: TcxCurrencyEdit;
    fltSumToEdit: TcxCurrencyEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    i1: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    pFIBDatabase1: TpFIBDatabase;
    procedure FormCreate(Sender: TObject);
    procedure fltCustEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure fltCustCheckClick(Sender: TObject);
    procedure fltTipDogCheckClick(Sender: TObject);
    procedure fltTipDogEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure fltDatePeriodCheckClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure fltRegNumCheckClick(Sender: TObject);
    procedure fltSumCheckClick(Sender: TObject);
    procedure fltRegNumEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fltDateCheckClick(Sender: TObject);
    procedure fltCustEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShowClosedCheckClick(Sender: TObject);
    procedure fltSumFromEditFocusChanged(Sender: TObject);
    procedure fltTipDogEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltDateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltDateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltSumFromEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltSumToEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure i1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  public
    id_Group : integer;
    ownerDateCheck : TcxCheckBox;
    ownerShowClosedCheck : TcxCheckBox;
    fltShowClosed : integer;
    fltDateBeg : TDate;
    fltDateEnd : TDate;
    fltId_tip_dog : integer;
    inFlt : boolean;
    flt_id_Customer : integer;
    fltCustEdited : boolean;
  end;

var
  fltDogForm: TfltDogForm;

implementation
uses DogLoaderUnit, {DogFormUnit, }GlobalSPR, LoadDogManedger, DateUtils, LangUnit;

{$R *.dfm}

procedure TfltDogForm.FormCreate(Sender: TObject);
begin
 if FileExists(SYS_APP_PATH + SYS_LANG_FILE) then LangPackApply(Self);
 fltShowClosed := 0;
 fltDateBeg    := date - SYS_DOG_PERIOD;
 fltDateEnd    := date;
 fltId_tip_dog := -1;
 fltDateBegEdit.Date := fltDateBeg;
 fltDateEndEdit.Date := fltDateEnd;
 flt_id_Customer := -1;
 if ShowClosedCheck.Checked then fltShowClosed := 1 else fltShowClosed := 0; 
 fltDateCheck.Properties.Caption := fltDateCheck.Properties.Caption + DateToStr(fltDateBeg);
end;

procedure TfltDogForm.fltCustEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
 Res : Variant;
begin
 inFlt := true;
 Res := ShowCustomers(Self, pFIBDatabase1.Handle, fsNormal, now, csmCustomers, flt_id_Customer, -1);
 if VarArrayDimCount(Res) <> 0 then begin
  flt_id_Customer := Res[0];
  fltCustEdit.Text := Res[2];
  fltCustCheck.Checked := true;
  fltCustEdited := false;
 end else fltCustCheck.Checked := false;
 inFlt := false;
end;

procedure TfltDogForm.fltCustCheckClick(Sender: TObject);
begin
 if inFlt then exit;
// if fltId_tip_dog = -1 then fltCustEditPropertiesButtonClick(Self, 0);
 fltCustEdit.Enabled := fltCustCheck.Checked;
 if not visible then exit;
 if fltCustEdit.Enabled and visible then fltCustEdit.SetFocus;
end;

procedure TfltDogForm.fltTipDogCheckClick(Sender: TObject);
begin
 if inFlt then exit;
 if fltId_tip_dog = -1 then fltTipDogEditPropertiesButtonClick(Self, 0);
 fltTipDogEdit.Enabled := fltTipDogCheck.Checked;
end;

procedure TfltDogForm.fltTipDogEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 res : Variant;
begin
 inFlt := true;
 res := LoadDogManedger.WorkTypeDogSPR(Self, pFIBDatabase1.Handle, fsNormal, 'select', Nil, id_Group, Nil);
 if VarArrayDimCount(res) > 0 then begin
  fltTipDogCheck.Checked := true;
  fltId_tip_dog := res[0][0];
  fltTipDogEdit.Text := res[0][2];
 end else fltTipDogCheck.Checked := false;
 inFlt := false;
end;

procedure TfltDogForm.fltDatePeriodCheckClick(Sender: TObject);
begin
 inFlt := true;
 if fltDatePeriodCheck.Checked then fltDateCheck.Checked := false;
 fltDateBegEdit.Enabled := fltDatePeriodCheck.Checked;
 fltDateEndEdit.Enabled := fltDatePeriodCheck.Checked;
// if fltDateCheck.Checked then fltDatePeriodCheck.Checked := false;
 inFlt := true;
 if fltDateBegEdit.Enabled and visible then fltDateBegEdit.SetFocus;
end;

procedure TfltDogForm.OKButtonClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfltDogForm.cxButton2Click(Sender: TObject);
begin
 inFlt := true;
 fltTipDogCheck.Checked     := false;
 fltCustCheck.Checked       := false;
 fltDateCheck.Checked       := true;
 fltDatePeriodCheck.Checked := false;
 fltSumCheck.Checked        := false;
 fltRegNumCheck.Checked     := false;
 ShowClosedCheck.Checked    := false;
 inFlt := false;
 ModalResult := mrOk;
end;

procedure TfltDogForm.cxButton3Click(Sender: TObject);
begin
 Close;
end;

procedure TfltDogForm.fltRegNumCheckClick(Sender: TObject);
begin
 fltRegNumEdit.Enabled := fltRegNumCheck.Checked;
 if fltRegNumEdit.Enabled and visible then fltRegNumEdit.SetFocus;
end;

procedure TfltDogForm.fltSumCheckClick(Sender: TObject);
begin
 fltSumFromEdit.Enabled := fltSumCheck.Checked;
 fltSumToEdit.Enabled := fltSumCheck.Checked;
 if fltSumFromEdit.Enabled and visible then fltSumFromEdit.SetFocus;
end;

procedure TfltDogForm.fltRegNumEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
  {if fltCustEdit.
  else if fltTipDogEdit.Enabled then fltTipDogEdit.SetFocus
  else if fltDateBegEdit.Enabled then fltDateBegEdit.SetFocus
  else if fltSumFromEdit.Enabled then fltSumFromEdit.SetFocus}

 end;
end;

procedure TfltDogForm.fltDateCheckClick(Sender: TObject);
begin
 if inFlt then exit;
 inFlt := true;
 ownerDateCheck.Checked := fltDateCheck.Checked;
 inFlt := false;
// if fltDatePeriodCheck.Checked then fltDateCheck.Checked := false;
end;

procedure TfltDogForm.fltCustEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end else fltCustEdited := true;
end;

procedure TfltDogForm.ShowClosedCheckClick(Sender: TObject);
begin
 inFlt := true;
 if ShowClosedCheck.Checked then fltShowClosed := 1 else fltShowClosed := 0;
 ownerShowClosedCheck.Checked := ShowClosedCheck.Checked;
 inFlt := false;
end;

procedure TfltDogForm.fltSumFromEditFocusChanged(Sender: TObject);
begin
 if fltSumToEdit.Text = '' then fltSumToEdit.Text := fltSumFromEdit.Text; 
end;

procedure TfltDogForm.fltTipDogEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TfltDogForm.fltDateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  fltDateEndEdit.SetFocus;
 end;
end;

procedure TfltDogForm.fltDateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TfltDogForm.fltSumFromEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  fltSumToEdit.SetFocus;
 end;
end;

procedure TfltDogForm.fltSumToEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TfltDogForm.FormShow(Sender: TObject);
begin
 fltRegNumCheck.SetFocus;
end;

procedure TfltDogForm.N1Click(Sender: TObject);
begin
 fltDateBegEdit.Date := EncodeDate(YearOf(now), 1, 1);
 fltDateEndEdit.Date := EncodeDate(YearOf(now), 12, 31);
end;

procedure TfltDogForm.N2Click(Sender: TObject);
begin
 fltDateBegEdit.Date := EncodeDate(YearOf(now) - 1, 1, 1);
 fltDateEndEdit.Date := EncodeDate(YearOf(now) - 1, 12, 31);
end;

procedure TfltDogForm.i1Click(Sender: TObject);
begin
 fltDateBegEdit.Date := date;
 fltDateEndEdit.Date := date;
end;

procedure TfltDogForm.Action1Execute(Sender: TObject);
begin
 OKButtonClick(Self);
end;

end.

