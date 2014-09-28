unit fltPlatUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxContainer, cxEdit, cxCheckBox, cxControls, cxGroupBox,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCurrencyEdit, Menus,
  FIBDatabase, pFIBDatabase, cxMRUEdit, ActnList, DB, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc;

type
  TfltPlatForm = class(TForm)
    cxGroupBox1: TcxGroupBox;
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
    chNumPlat: TcxCheckBox;
    NumPlatEdit: TcxTextEdit;
    cbType: TcxComboBox;
    chType: TcxCheckBox;
    chAcc: TcxCheckBox;
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    cbAcc: TcxLookupComboBox;
    depCheck: TcxCheckBox;
    depEdit: TcxButtonEdit;
    pFIBDatabase1: TpFIBDatabase;
    StoredProc: TpFIBStoredProc;
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
    procedure fltCustEditKeyPress(Sender: TObject; var Key: Char);
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
    procedure chTypeClick(Sender: TObject);
    procedure chNumPlatClick(Sender: TObject);
    procedure chAccClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NumPlatEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbAccKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbAccPropertiesChange(Sender: TObject);
    procedure depCheckClick(Sender: TObject);
    procedure depEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  public
    id_Group : integer;
{    fltDateBeg : TDate;
    fltDateEnd : TDate;}
    fltId_tip_dog : integer;
    flt_id_Customer : int64;
    fltCustEdited : boolean;
    id_rate_acc_native : Int64;
    flt_id_department : int64;
    flt_id_session_type : int64;
    id_otdel : int64;
  end;

var
  fltDogForm: TfltPlatForm;

implementation
uses DogLoaderUnit, {DogFormUnit, }GlobalSPR, LoadDogManedger, DateUtils, LangUnit,
     PlatFormUnit, uCommonSp, StrUtils;

{$R *.dfm}

procedure TfltPlatForm.FormCreate(Sender: TObject);
begin
 if FileExists(SYS_APP_PATH + SYS_LANG_FILE) then LangPackApply(Self);
 cbType.ItemIndex := 0;
 id_rate_acc_native := -1;
// fltDateBeg    := date - SYS_DOG_PERIOD;
// fltDateEnd    := date;
 fltId_tip_dog := -1;
 flt_id_department := -1;
 id_otdel := -1;
 fltDateBegEdit.Date := now;
 fltDateEndEdit.Date := now;
 flt_id_Customer := -1;
 flt_id_session_type := -1;
end;

procedure TfltPlatForm.fltCustEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
 Res : Variant;
begin
 Res := ShowCustomers(Self, TPlatForm(Owner).WorkDatabase.Handle, fsNormal, now, csmCustomers, flt_id_Customer, -1);
 if VarArrayDimCount(Res) <> 0 then begin
    flt_id_Customer := Res[0];
    fltCustEdit.Text := Res[2];
    fltCustCheck.Checked := true;
    fltCustEdited := false;
 end
  else
    fltCustCheck.Checked := false;
end;

procedure TfltPlatForm.fltCustCheckClick(Sender: TObject);
begin
 fltCustEdit.Enabled := fltCustCheck.Checked;
 if flt_id_Customer = -1 then fltCustEditPropertiesButtonClick(Self, 0);
 if Visible then if fltCustEdit.Enabled then fltCustEdit.SetFocus;
end;

procedure TfltPlatForm.fltTipDogCheckClick(Sender: TObject);
begin
 if (fltId_tip_dog = -1) and (fltTipDogCheck.Checked) then fltTipDogEditPropertiesButtonClick(Self, 0);
 fltTipDogEdit.Enabled := fltTipDogCheck.Checked;
 if Visible then if fltTipDogEdit.Enabled then fltTipDogEdit.SetFocus;
end;

procedure TfltPlatForm.fltTipDogEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 res : Variant;
 cnt : integer;
 i : integer;
begin
 res := LoadDogManedger.WorkTypeDogSPR(Self, TPlatForm(Owner).WorkDatabase.Handle, fsNormal, 'select2', Nil, SYS_ID_GROUP_ZAYAV_VIEW, Nil);
{ if VarArrayDimCount(res) > 0 then begin
  fltTipDogCheck.Checked := true;
  fltId_tip_dog := res[0][0];
  fltTipDogEdit.Text := res[0][2];
 end else fltTipDogCheck.Checked := false;}
 if VarArrayDimCount(res) = 0 then
 begin
   fltTipDogCheck.Checked := false;
   exit;
 end;
 Cnt := VarArrayHighBound(res, 1);
 if cnt = 0 then
 begin
   fltTipDogCheck.Checked := true;
   fltId_tip_dog := res[0][0];
   fltTipDogEdit.Text := res[0][2];
 end
 else
 begin
   fltTipDogEdit.Text := '< ДЕКІЛЬКА >';
   StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_GET_FILTER_SES';
   StoredProc.Transaction.StartTransaction;
   StoredProc.Prepare;
   StoredProc.ExecProc;
   flt_id_session_type := StoredProc['ID_SESSION'].AsInt64;
   StoredProc.Transaction.Commit;
   StoredProc.Close;
   for i := 0 to Cnt do
   begin
     StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_FILTER_TYPE_ADD';
     StoredProc.Transaction.StartTransaction;
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_SESSION').AsInt64 := flt_id_session_type;
     StoredProc.ParamByName('ID_TYPE_DOG').AsInt64 := res[i][0];
     StoredProc.ExecProc;
     StoredProc.Transaction.Commit;
     StoredProc.Close;
//     t_id_tip_dog := Tip_dog[i][0];
//     t_tip_dog := Tip_dog[i][1];
   end;
 end;

end;

procedure TfltPlatForm.fltDatePeriodCheckClick(Sender: TObject);
begin
 fltDateBegEdit.Enabled := fltDatePeriodCheck.Checked;
 fltDateEndEdit.Enabled := fltDatePeriodCheck.Checked;
 if Visible then if fltDateBegEdit.Enabled then fltDateBegEdit.SetFocus;
end;

procedure TfltPlatForm.OKButtonClick(Sender: TObject);
begin
 if chAcc.Checked then id_rate_acc_native := TFIBBCDField(DataSet.FBN('ID_RATE_ACCOUNT')).AsInt64;
 ModalResult := mrOk;
end;

procedure TfltPlatForm.cxButton2Click(Sender: TObject);
begin
 chType.Checked             := False;
 chAcc.Checked              := False;
 chNumPlat.Checked          := False;
 depCheck.Checked           := False;
 fltTipDogCheck.Checked     := false;
 fltCustCheck.Checked       := false;
 fltDatePeriodCheck.Checked := false;
 fltSumCheck.Checked        := false;
 fltRegNumCheck.Checked     := false;
 ModalResult := mrOk;
end;

procedure TfltPlatForm.cxButton3Click(Sender: TObject);
begin
 Close;
end;

procedure TfltPlatForm.fltRegNumCheckClick(Sender: TObject);
begin
 fltRegNumEdit.Enabled := fltRegNumCheck.Checked;
 if fltRegNumEdit.Enabled and Visible then fltRegNumEdit.SetFocus;
end;

procedure TfltPlatForm.fltSumCheckClick(Sender: TObject);
begin
 fltSumFromEdit.Enabled := fltSumCheck.Checked;
 fltSumToEdit.Enabled := fltSumCheck.Checked;
 if fltSumFromEdit.Enabled and visible then fltSumFromEdit.SetFocus;
end;

procedure TfltPlatForm.fltRegNumEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
 end;
end;

procedure TfltPlatForm.fltCustEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end else fltCustEdited := true;
end;

procedure TfltPlatForm.fltSumFromEditFocusChanged(Sender: TObject);
begin
 if fltSumToEdit.Text = '' then fltSumToEdit.Text := fltSumFromEdit.Text; 
end;

procedure TfltPlatForm.fltTipDogEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TfltPlatForm.fltDateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
 begin
   Key := #0;
   fltDateEndEdit.SetFocus;
 end;
end;

procedure TfltPlatForm.fltDateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TfltPlatForm.fltSumFromEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  fltSumToEdit.SetFocus;
 end;
end;

procedure TfltPlatForm.fltSumToEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TfltPlatForm.FormShow(Sender: TObject);
begin
 DataSet.Open;
 fltRegNumCheck.SetFocus;
end;

procedure TfltPlatForm.N1Click(Sender: TObject);
begin
 fltDateBegEdit.Date := EncodeDate(YearOf(now), 1, 1);
 fltDateEndEdit.Date := EncodeDate(YearOf(now), 12, 31);
end;

procedure TfltPlatForm.N2Click(Sender: TObject);
begin
 fltDateBegEdit.Date := EncodeDate(YearOf(now) - 1, 1, 1);
 fltDateEndEdit.Date := EncodeDate(YearOf(now) - 1, 12, 31);
end;

procedure TfltPlatForm.i1Click(Sender: TObject);
begin
 fltDateBegEdit.Date := date;
 fltDateEndEdit.Date := date;
end;

procedure TfltPlatForm.Action1Execute(Sender: TObject);
begin
 OKButtonClick(Self);
end;

procedure TfltPlatForm.chTypeClick(Sender: TObject);
begin
  cbType.Enabled := chType.Checked;
end;

procedure TfltPlatForm.chNumPlatClick(Sender: TObject);
begin
  NumPlatEdit.Enabled := chNumPlat.Checked;
end;

procedure TfltPlatForm.chAccClick(Sender: TObject);
begin
 cbAcc.Enabled := chAcc.Checked;
end;

procedure TfltPlatForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DataSet.Close;
end;

procedure TfltPlatForm.NumPlatEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
 end;
end;

procedure TfltPlatForm.cbTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
 end;
end;

procedure TfltPlatForm.cbAccKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
 end;
end;

procedure TfltPlatForm.cbAccPropertiesChange(Sender: TObject);
begin
// id_rate_acc_native := StrToInt(cbAcc.Properties.Grid.DataController.Values[cbAcc.Properties.Grid.DataController.FocusedRecordIndex, 2]);
end;

procedure TfltPlatForm.depCheckClick(Sender: TObject);
begin
 if (flt_id_department = -1) and (depCheck.Checked) then depEditPropertiesButtonClick(Self, 0);
 depEdit.Enabled := depCheck.Checked;
end;

procedure TfltPlatForm.depEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(pFIBDatabase1.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            //FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then ShowMessage('BUG: Output is NIL!!!')
                       else if not sp.Output.IsEmpty then
                            begin
                              flt_id_department := sp.Output['Id_Department'];
                              DepEdit.Text := sp.Output['Name_FULL'];
                            end;  
    sp.Free;
end;

end.

