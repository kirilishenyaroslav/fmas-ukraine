unit Arnd_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxCurrencyEdit,
  cxTextEdit, cxLabel, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxButtonEdit, cxContainer, cxEdit, cxCheckBox, cxControls, cxGroupBox, GlobalSPR,
  ActnList;

type
  TfrmFilterArnd = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    fltTipDogCheck: TcxCheckBox;
    fltDatePeriodCheck: TcxCheckBox;
    fltCustCheck: TcxCheckBox;
    fltTipDogEdit: TcxButtonEdit;
    fltDateBegEdit: TcxDateEdit;
    fltDateEndEdit: TcxDateEdit;
    cxLabel10: TcxLabel;
    fltCustEdit: TcxButtonEdit;
    fltRegNumCheck: TcxCheckBox;
    fltRegNumEdit: TcxTextEdit;
    fltSumCheck: TcxCheckBox;
    fltSumFromEdit: TcxCurrencyEdit;
    fltSumToEdit: TcxCurrencyEdit;
    OKButton: TcxButton;
    cxButton3: TcxButton;
    cxButton2: TcxButton;
    fltrRegNumDogCheck: TcxCheckBox;
    fltrRegNumDogEdit: TcxTextEdit;
    ActionList1: TActionList;
    fltr: TAction;
    procedure fltRegNumCheckClick(Sender: TObject);
    procedure fltCustCheckClick(Sender: TObject);
    procedure fltTipDogCheckClick(Sender: TObject);
    procedure fltTipDogEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure fltCustEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure fltDatePeriodCheckClick(Sender: TObject);
    procedure fltSumCheckClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure fltrRegNumDogCheckClick(Sender: TObject);
    procedure fltRegNumEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fltSumFromEditFocusChanged(Sender: TObject);
    procedure fltSumFromEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltSumToEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltCustEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltDateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltDateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure fltrExecute(Sender: TObject);
    procedure fltrRegNumDogEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fltCustEditPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
  //фильтр
   fltDateBeg : TDate;
   fltDateEnd : TDate;
   fltId_tip_dog : integer;
   inFlt : boolean;
   flt_id_Customer : Int64;
   fltCustEdited : boolean;
  end;

var
  frmFilterArnd: TfrmFilterArnd;
  res : String;

implementation
uses LoadDogManedger, DogLoaderUnit, Arnd_Sch;

{$R *.dfm}

procedure TfrmFilterArnd.fltRegNumCheckClick(Sender: TObject);
begin
 fltRegNumEdit.Enabled := fltRegNumCheck.Checked;
 if fltRegNumEdit.Enabled and visible then fltRegNumEdit.SetFocus;
end;

procedure TfrmFilterArnd.fltCustCheckClick(Sender: TObject);
begin
// if inFlt then exit;
 fltCustEdit.Enabled := fltCustCheck.Checked;
 if not visible then exit;
 if fltCustEdit.Enabled and visible then fltCustEdit.SetFocus;
end;

procedure TfrmFilterArnd.fltTipDogCheckClick(Sender: TObject);
begin
// if inFlt then exit;
 //fltTipDogEditPropertiesButtonClick(Self, 0);
 fltTipDogEdit.Enabled := fltTipDogCheck.Checked;
 if not visible then exit;
 if fltTipDogEdit.Enabled and visible then fltTipDogEdit.SetFocus;
end;

procedure TfrmFilterArnd.fltTipDogEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 res : Variant;
begin
 res := LoadDogManedger.WorkTypeDogSPR(Self, TArnd_Sch_Form(Self.Owner).Database.Handle, fsNormal, 'select', Nil, id_Group, Nil);
 if VarArrayDimCount(res) > 0 then begin
  fltTipDogCheck.Checked := true;
  fltId_tip_dog := res[0][0];
  fltTipDogEdit.Text := res[0][2];
 end else fltTipDogCheck.Checked := false;
end;

procedure TfrmFilterArnd.fltCustEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res : Variant;
begin
 Res := ShowCustomers(Self, TArnd_Sch_Form(Self.Owner).Database.Handle, fsNormal, now, csmCustomers, flt_id_Customer, -1);
 if VarArrayDimCount(Res) <> 0 then begin
  flt_id_Customer := Res[0];
  fltCustEdit.Text := Res[2];
  fltCustCheck.Checked := true;
  fltCustEdited := false;
 end else fltCustCheck.Checked := false;
end;

procedure TfrmFilterArnd.fltDatePeriodCheckClick(Sender: TObject);
begin
 inFlt := true;
 fltDateBegEdit.Enabled := fltDatePeriodCheck.Checked;
 fltDateEndEdit.Enabled := fltDatePeriodCheck.Checked;
// if fltDateCheck.Checked then fltDatePeriodCheck.Checked := false;
 inFlt := true;
 if fltDateBegEdit.Enabled and visible then fltDateBegEdit.SetFocus;
end;

procedure TfrmFilterArnd.fltSumCheckClick(Sender: TObject);
begin
 fltSumFromEdit.Enabled := fltSumCheck.Checked;
 fltSumToEdit.Enabled := fltSumCheck.Checked;
 if fltSumFromEdit.Enabled and visible then fltSumFromEdit.SetFocus;
end;

procedure TfrmFilterArnd.cxButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFilterArnd.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFilterArnd.cxButton2Click(Sender: TObject);
begin
 inFlt := true;
 fltTipDogCheck.Checked     := false;
 fltCustCheck.Checked       := false;
 fltDatePeriodCheck.Checked := false;
 fltSumCheck.Checked        := false;
 fltRegNumCheck.Checked     := false;
 fltrRegNumDogCheck.Checked := false;
 inFlt := false;
 ModalResult := mrOk;
end;

procedure TfrmFilterArnd.fltrRegNumDogCheckClick(Sender: TObject);
begin
 fltrRegNumDogEdit.Enabled := fltrRegNumDogCheck.Checked;
 if fltrRegNumDogEdit.Enabled and visible then fltrRegNumDogEdit.SetFocus;
end;

procedure TfrmFilterArnd.fltRegNumEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then
 begin
   Key := 0;
   OKButton.SetFocus;
 end;
end;


procedure TfrmFilterArnd.fltSumFromEditFocusChanged(Sender: TObject);
begin
 if fltSumToEdit.Text = '' then fltSumToEdit.Text := fltSumFromEdit.Text;
end;

procedure TfrmFilterArnd.fltSumFromEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
 begin
  Key := #0;
  fltSumToEdit.SetFocus;
 end;
end;

procedure TfrmFilterArnd.fltSumToEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
 begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TfrmFilterArnd.fltCustEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
 begin
  Key := #0;
  OKButton.SetFocus;
  end;
end;

procedure TfrmFilterArnd.fltDateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  fltDateEndEdit.SetFocus;
 end;
end;

procedure TfrmFilterArnd.fltDateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TfrmFilterArnd.fltrExecute(Sender: TObject);
begin
  OKButtonClick(Self);
end;

procedure TfrmFilterArnd.fltrRegNumDogEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then
 begin
   Key := 0;
   OKButton.SetFocus;
 end;
end;

procedure TfrmFilterArnd.fltCustEditPropertiesEditValueChanged(
  Sender: TObject);
begin
 fltCustEdited := True;
end;

end.
