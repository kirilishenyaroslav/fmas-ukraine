unit sp_cust_rate_acc_FORM_ADD;

interface

uses
  Windows,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, BaseTypes, SYS_OPTIONS, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters,
  cxButtons, Variants, ExtCtrls, dogLoaderUnit, cxLabel, cxDropDownEdit,
  cxCalendar, cxGroupBox, cxMemo;

type
  TFsp_cust_rate_acc_ADD = class(TForm)
    Label2: TLabel;
    LabelBANK: TLabel;
    Label4: TLabel;
    BankEdit: TcxButtonEdit;
    TypeAccountEdit: TcxButtonEdit;
    AccountEdit: TcxTextEdit;
    OKButton1: TcxButton;
    OKButton2: TcxButton;
    CancelButton: TcxButton;
    Bevel1: TBevel;
    MFOEdit: TcxTextEdit;
    Label1: TLabel;
    CityEdit: TcxTextEdit;
    Label3: TLabel;
    cxGroupBox1: TcxGroupBox;
    DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DateEndEdit: TcxDateEdit;
    NoteMemo: TcxMemo;
    cxLabel3: TcxLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure OKButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TypeAccountEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure BankEditButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure CustomerEditKeyPress(Sender: TObject; var Key: Char);
    procedure MFOEditExit(Sender: TObject);
    procedure MFOEditKeyPress(Sender: TObject; var Key: Char);
    procedure MFOEditPropertiesChange(Sender: TObject);
    procedure BankEditPropertiesChange(Sender: TObject);
    procedure CityEditPropertiesChange(Sender: TObject);
  public
    Action          : TSpravAction;
    MResult         : string;
    id_bank         : integer;
    id_type_account : integer;
    bank_mfo        : string;
    bankFinded      : boolean;
    is_bank_account : boolean;
    is_val_account  : Boolean;
    is_no_acc       : Boolean;
    BankChanged     : boolean;
    SkipChecks      : boolean;
    procedure CheckBank;
    function CheckNulls : boolean;
    procedure FindBank;
  end;


implementation

uses Resources_unitb, GlobalSPR, sp_customer_FORM, FIBQuery,
 LangUnit;
{$R *.DFM}


function TFsp_cust_rate_acc_ADD.CheckNulls : boolean;
var
 r   : integer;
 frm : TFsp_customer;
begin
 Result := false;
 if SkipChecks then exit;
 if MFOEdit.Text = '' then begin
  ShowMessage('Уведіть МФО.');
  Result := true;
  exit;
 end;
 if BankEdit.Text = '' then begin
  ShowMessage('Укажіть найменування банку.');
  Result := true;
  exit;
 end;
 if CityEdit.Text = '' then begin
  ShowMessage('Укажіть місто банку.');
  Result := true;
  exit;
 end;
 if AccountEdit.Text = '' then begin
  MessageBox(handle,PChar(CUSTOMER_MUST_ACCOUNT),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  Result := true;
  exit;
 end;
 if TypeAccountEdit.Text = '' then begin
  MessageBox(handle,PChar(CUSTOMER_MUST_TYPE_ACC),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  Result := true;
  exit;
 end;
 try
  if is_bank_account then if not CheckAccount(AccountEdit.Text, bank_mfo) then begin
   ShowMessage('Уведено невірний рахунок.');
   Result := true;
   exit;
  end;
 except
  Result := true;
  exit;
 end;
 if DateBegEdit.Text = '' then
 begin
  ShowMessage('Укажіть дату початку.');
  Result := true;
  exit;
 end;
 if DateEndEdit.Text = '' then
 begin
  ShowMessage('Укажіть дату закінчення.');
  Result := true;
  exit;
 end;

 if TFsp_customer(Owner).FormStyle = fsNormal then begin
  if (not is_bank_account) and (not is_val_account) then begin
   r := MessageDlg('Увага', 'Довідник запущений у режимі відображення тільки банківських рахунків. Уведений рахунок не буде відображений. Продовжити?', mtConfirmation, [mbYes, mbNo]);
   if r = mrNo then begin
    Result := true;
    exit;
   end;
  end;
 end;


 frm := TFsp_customer(Owner);
 frm.Query.Close;
 if Action = saAdd then frm.Query.SQL.Text := 'select * from PROC_PUB_SP_CUST_ACC_DUB(''' + AccountEdit.Text + ''', ' + IntToStr(id_type_account) + ', ' + IntToStr(id_bank) + ', -1, ' + QuotedStr(DateBegEdit.Text) + ', ' + QuotedStr(DateEndEdit.Text) + ' )'

                   else frm.Query.SQL.Text := 'select * from PROC_PUB_SP_CUST_ACC_DUB(''' + AccountEdit.Text + ''', ' + IntToStr(id_type_account) + ', ' + IntToStr(id_bank) + ', ' + FloatToStr(frm.AccountDataSet.FBN('ID_RATE_ACCOUNT').asCurrency) + ', ' + QuotedStr(DateBegEdit.Text) + ', ' + QuotedStr(DateEndEdit.Text) +')';
// ShowMessage(frm.Query.SQL.Text);
 frm.Query.ExecQuery;
 if frm.Query.RecordCount <> 0 then begin
  if MessageDlg('Увага', 'Дані реквізити вже існують. Записати?', mtConfirmation, [mbYes, mbNo]) = mrYes then begin
  // TFsp_customer(Owner).LocateCustomer(frm.Query['ID_CUSTOMER'].AsInteger);
  // TFsp_customer(Owner).LocateAccount(frm.Query['ID_RATE_ACCOUNT'].AsInteger);
 //  frm.Query.Close;
  // Result := true;
  //

  end else begin
   frm.Query.Close;
   Result := true;
    exit;
  end;
 end;
 frm.Query.Close;
end;

procedure TFsp_cust_rate_acc_ADD.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TFsp_cust_rate_acc_ADD.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton1.SetFocus;
end;

procedure TFsp_cust_rate_acc_ADD.OKButton1Click(Sender: TObject);
begin
 CheckBank;
 if is_no_acc then
 begin
  MResult := 'ok1';
  Close;
  Exit;
 end;
 if SkipChecks then begin
  ModalResult := mrOk;
  exit;
 end;
 if CheckNulls then exit;
 mResult := 'ok1';
 Close;
end;

procedure TFsp_cust_rate_acc_ADD.FormCreate(Sender: TObject);
var
 yy, mm, dd : word;
begin
 LangPackApply(Self);
 if Action = saAdd then begin
  id_type_account := SYS_DEF_ID_TYPE_ACCOUNT;
  TypeAccountEdit.Text := SYS_DEF_NAME_TYPE_ACCOUNT;
  is_bank_account := true;
  decodedate(now, yy, mm, dd);
  dd := 1;
  if mm <> 1 then mm := mm - 1 else
  begin
    mm := 12;
    yy := yy - 1;
  end;  
  DateBegEdit.Date := EncodeDate(yy, mm, dd);
  DateEndEdit.Date := SYS_MAX_TIMESTAMP;
 end;
 bankFinded := false;
{ LabelBANK.Caption:=CUSTOMER_BANK_CONST;
 Label4.Caption:=CUSTOMER_ACC_TYPE_CONST;
 Label2.Caption:=CUSTOMER_ACC_CONST;
 CancelButton.Caption:=CUSTOMER_CANCEL_BUT_CONST;}
 mResult := 'cancel';
end;

procedure TFsp_cust_rate_acc_ADD.OKButton2Click(Sender: TObject);
begin
 CheckBank;
 if is_no_acc then
 begin
  MResult := 'ok2';
  Close;
  Exit;
 end;
 if CheckNulls then exit;
 mResult := 'ok2';
 Close;
end;

procedure TFsp_cust_rate_acc_ADD.FormShow(Sender: TObject);
begin
 if Action = saAdd then begin
  id_bank         := -1;
  id_type_account := SYS_ID_TYPE_ACCOUNT;
  TypeAccountEdit.Text := SYS_NAME_TYPE_ACCOUNT;
  is_bank_account := true;
  CityEdit.Text := SYS_CITY;
 end;
 if AccountEdit.Visible then AccountEdit.SetFocus;
end;

procedure TFsp_cust_rate_acc_ADD.TypeAccountEditButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var id:Variant;
begin
  id:=GlobalSPR.GetIniAcc(self.Owner,TFsp_customer(self.Owner).WorkDatabase.Handle,fsnormal,TFsp_customer(self.Owner).ActualDate);
  if VarArrayDimCount(id)>0
  then begin
     if id[0]<>NULL
     then begin
      id_type_account :=id[0];
      TypeAccountEdit.Text:=id[1];
      is_bank_account := id[2] = 1;
      is_val_account := id[3] = 1;
      is_no_acc := id[4] = 1;
      OKButton1.Enabled := is_bank_account or is_val_account or is_no_acc;
     end;
  end;
end;

procedure TFsp_cust_rate_acc_ADD.BankEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var id:Variant;
begin
  id:=GlobalSPR.GetBanks(self,TFsp_customer(self.Owner).Workdatabase.Handle,fsNormal,TFsp_customer(self.Owner).ActualDate);
  if VarArrayDimCount(id)>0
  then begin
     if id[0]<>NULL
     then begin
      id_bank :=id[0];
      BankEdit.Text:=id[1];
      bank_mfo := id[2];
      CityEdit.Text := id[3];
      MFOEdit.Text := bank_mfo;
      bankFinded := true;
     end;
  end;
end;

procedure TFsp_cust_rate_acc_ADD.CustomerEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  AccountEdit.SetFocus;
 end;
end;

procedure TFsp_cust_rate_acc_ADD.FindBank;
var
 frm : TFsp_customer;
begin
 if Action = saView then exit;
 bankFinded := false;
 id_bank := -1;
 bankChanged := false;
// BankEdit.Text := '';
// CityEdit.Text := 'Донецьк';
 if MFOEdit.Text = '' then exit;
 frm := TFsp_customer(Owner);
 frm.Query.Close;
 frm.Query.SQL.Text := 'select * from PROC_PUB_SP_BANK_GET_BY_MFO(''' + MFOEdit.Text + ''', ' + IntToStr(SYS_CURRENT_DEPARTMENT) + ')';
 frm.Query.ExecQuery;
 if frm.Query.RecordCount = 0 then begin
  frm.Query.Close;
  exit;
 end;
 id_bank       := frm.Query.FieldbyName('ID_BANK').AsInteger;
 BankEdit.Text := frm.Query.FieldbyName('NAME_BANK').AsString;
 CityEdit.Text := frm.Query.FieldbyName('CITY').AsString;
 bankFinded    := true;
 frm.Query.Close;
end;

procedure TFsp_cust_rate_acc_ADD.MFOEditExit(Sender: TObject);
begin
 FindBank;
end;

procedure TFsp_cust_rate_acc_ADD.MFOEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  FindBank;
  BankEdit.SetFocus;
 end;
end;

procedure TFsp_cust_rate_acc_ADD.MFOEditPropertiesChange(Sender: TObject);
begin
 bank_mfo := MFOEdit.Text;
end;

procedure TFsp_cust_rate_acc_ADD.BankEditPropertiesChange(Sender: TObject);
begin
 if bankFinded then bankChanged := true else bankChanged := false;
end;

procedure TFsp_cust_rate_acc_ADD.CityEditPropertiesChange(Sender: TObject);
begin
 if Sender = CityEdit then if bankFinded then BankChanged := true;
end;

procedure TFsp_cust_rate_acc_ADD.CheckBank;
var
 frm : TFsp_customer;
begin
 if not bankFinded then begin
  if MessageDlg('Увага', 'Уведений банк із МФО = "' + MFOEdit.Text + '" не знайдений у довіднику банків. Додати?', mtConfirmation, [mbYes, mbNo]) = mrYes then begin
   frm := TFsp_customer(Owner);
   frm.StoredProc2.Transaction.StartTransaction;
   frm.StoredProc2.ExecProcedure('PUB_SP_BANK_ADD', [MFOEdit.Text, BankEdit.Text, CityEdit.Text, SYS_ID_USER, GetCompName, GetIPAddress]);
   id_bank := frm.StoredProc2.ParamByName('P_ID_BANK').AsInteger;
   frm.StoredProc2.Transaction.Commit;
//   frm.SelectAll_S;
   bankFinded := true;
  end else exit;
 end else if BankChanged and (id_bank > 0)then begin
  if MessageDlg('Увага', 'Вы изменили существующий банк. Применить изменения?', mtConfirmation, [mbYes, mbNo]) = mrYes then begin
   frm := TFsp_customer(Owner);
   frm.StoredProc2.Transaction.StartTransaction;
   frm.StoredProc2.ExecProcedure('PUB_SP_SP_BANK_MOD', [id_bank, MFOEdit.Text, BankEdit.Text, CityEdit.Text, SYS_ID_USER, GetCompName, GetIPAddress]);
//   id_bank := frm.StoredProc.ParamByName('ID_BANK').AsInteger;
   frm.StoredProc2.Transaction.Commit;
//   frm.SelectAll_S;
   bankFinded := true;
   bankchanged := false;
  end else exit;
 end;
end;

end.
