unit mfo_rsch_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxCheckBox, DB, FIBDataSet,
  pFIBDataSet, MainFormMfoRsch, FIBQuery, pFIBQuery, pFIBStoredProc, Mask,
  ToolEdit, CurrEdit, cxMemo, DBCtrls, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dogLangPackUnit2,
  cxButtonEdit, GlobalSpr;

type
  TfrmMfoRsch_edit = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxCheckBox5: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxCheckBox7: TcxCheckBox;
    pFIBDataSet_edit: TpFIBDataSet;
    Label1_rsch: TLabel;
    Label1_mfo: TLabel;
    Label1_name_bank: TLabel;
    pFIBStoredProc_edit: TpFIBStoredProc;
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    CurrencyEdit_sum_pay: TCurrencyEdit;
    CurrencyEdit_sum_case: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    DataSource: TDataSource;
    cxTextEdit_comment: TcxTextEdit;
    pFIBDataSet_buff: TpFIBDataSet;
    DBLookupComboBox: TDBLookupComboBox;
    Label15: TLabel;
    cxTextEdit_name_rsch: TcxTextEdit;
    Label16: TLabel;
    cbKPK: TcxCheckBox;
    cbSPPOV: TcxCheckBox;
    Label17: TLabel;
    KPKVFirst: TcxCheckBox;
    Label18: TLabel;
    KEKV_First: TcxCheckBox;
    Label19: TLabel;
    ArndNDS: TcxCheckBox;
    Label20: TLabel;
    cxCheckBoxSum: TcxCheckBox;
    Label21: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    Label22: TLabel;
    Label23: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure DBLookupComboBoxClick(Sender: TObject);
    procedure DBLookupComboBoxContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    id_type_finance : Integer;
    id_sm_pkv : Integer;
  constructor Create (Aowner: TComponent; id_rate_account: Variant; Flag: Boolean);overload;
    { Public declarations }
  end;

var
  frmMfoRsch_edit: TfrmMfoRsch_edit;
  Flag_edit: Boolean;
  rate_acc,expand: Variant;


implementation

{$R *.dfm}

constructor TfrmMfoRsch_edit.Create (Aowner: TComponent; id_rate_account: Variant; Flag: Boolean);
begin
  if Flag=true then
  begin
    inherited Create (Aowner);
    pFIBDataSet_buff.Database := TfrmMainFormMfoRsch(Self.Owner).pFIBDatabase;
    pFIBDataSet_buff.Transaction := TfrmMainFormMfoRsch(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_buff.Active := false;
    pFIBDataSet_buff.Active := true;

    pFIBDataSet_edit.Database := TfrmMainFormMfoRsch(Self.Owner).pFIBDatabase;
    pFIBDataSet_edit.Transaction := TfrmMainFormMfoRsch(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_edit.Active := false;
    pFIBDataSet_edit.ParamByName('d_id_rate_acc').Value := id_rate_account;
    pFIBDataSet_edit.Active := true;
    rate_acc := id_rate_account;
    expand := pFIBDataSet_edit.FieldByName('p_id_expand').AsVariant;
    cxTextEdit_name_rsch.Text := pFIBDataSet_edit.FieldByName('name_rsch').AsString;
    Label1_mfo.Caption := pFIBDataSet_edit.FieldByName('mfo').AsString;
    Label1_rsch.Caption := pFIBDataSet_edit.FieldByName('rate_account').AsString;
    Label1_name_bank.Caption := pFIBDataSet_edit.FieldByName('name_mfo').AsString;
    cxCheckBox1.Checked := pFIBDataSet_edit.FieldByName('CREATE_VIP').AsString = '1';
    cxCheckBox2.Checked := pFIBDataSet_edit.FieldByName('CREATE_REE').AsString = '1';
    cxCheckBox3.Checked := pFIBDataSet_edit.FieldByName('KAZNACHEY').AsString = '1';
    cxCheckBox4.Checked := pFIBDataSet_edit.FieldByName('ADD_OKPO').AsString = '1';
    cxCheckBox5.Checked := pFIBDataSet_edit.FieldByName('ADD_REGSCH').AsString = '1';
    cxCheckBox6.Checked := pFIBDataSet_edit.FieldByName('ADD_KEKV').AsString = '1';
    cxCheckBox7.Checked := pFIBDataSet_edit.FieldByName('REE_OUTCH').AsString = '1';
    KPKVFirst.Checked := pFIBDataSet_edit.FieldByName('ADD_KPK_FIRST').AsString = '1';
    KEKV_First.Checked := pFIBDataSet_edit.FieldByName('ADD_KEKV_FIRST').AsString = '1';
    ArndNDS.Checked := pFIBDataSet_edit.FieldByName('ARND_NDS_RAH').AsString = '1';
    cxCheckBoxSum.Checked := pFIBDataSet_edit.FieldByName('ADD_SUM').AsVariant = '1';
    cbKPK.Checked := pFIBDataSet_edit.FieldByName('ADD_KPK').AsVariant = '1';
    cbSPPOV.Checked := pFIBDataSet_edit.FieldByName('ADD_SP').AsVariant = '1';
    CurrencyEdit_sum_pay.Text := pFIBDataSet_edit.FieldByName('SUM_PAY').AsString;
    CurrencyEdit_sum_case.Text := pFIBDataSet_edit.FieldByName('SUM_CASE').AsString;
    DBLookupComboBox.KeyValue := pFIBDataSet_edit.FieldByName('ID_BANK_BUFF').AsVariant;
    id_sm_pkv := pFIBDataSet_edit.FieldByName('ID_PKV').AsInteger;
    cxButtonEdit1.Text:=pFIBDataSet_edit.FieldByName('PKV_KOD').AsString + ' (' + pFIBDataSet_edit.FieldByName('PKV_TITLE').AsString + ')';
    id_type_finance := pFIBDataSet_edit.FieldByName('ID_TYPE_FINANCE').AsInteger;
    cxButtonEdit2.Text:= pFIBDataSet_edit.FieldByName('TYPE_FINANCE_CODE').AsString + ' (' + pFIBDataSet_edit.FieldByName('TYPE_KAZN_KOD').AsString + ')';
    DBLookupComboBox.DropDownRows := 10;
    cxTextEdit_comment.Text := 'Шлях до таблиці:  '+pFIBDataSet_edit.FieldByName('V_Path_Buff').asString +'\'+ pFIBDataSet_edit.FieldByName('V_alias_buff').asString;
    Caption := 'Редагування';
    Flag_edit := Flag;
    pFIBDataSet_edit.FetchAll;
  end
  else
  begin
    inherited Create (Aowner);
    Flag_edit := Flag;
  end;
end;

procedure TfrmMfoRsch_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMfoRsch_edit.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMfoRsch_edit.FormCreate(Sender: TObject);
begin
  pFIBDataSet_edit.Database := TfrmMainFormMfoRsch(Self.Owner).pFIBDatabase;
  pFIBDataSet_edit.Transaction := TfrmMainFormMfoRsch(Self.Owner).pFIBTransactionRead;
  pFIBDataSet_edit.Active := false;
  pFIBDataSet_edit.Active := true;

//интерфейс
  Label1.Caption         := rsn_Pr1;
  Label2.Caption         := rsn_Pr2;
  Label3.Caption         := rsn_Pr3;
  Label4.Caption         := rsn_Pr4;
  Label5.Caption         := rsn_Pr5;
  Label6.Caption         := rsn_Pr6;
  Label7.Caption         := rsn_Pr7;
  Label1.Hint            := rsn_Pr1;
  Label1.ShowHint        := true;
  Label2.Hint            := rsn_Pr2;
  Label2.ShowHint        := true;
  Label3.Hint            := rsn_Pr3;
  Label3.ShowHint        := true;
  Label4.Hint            := rsn_Pr4;
  Label4.ShowHint        := true;
  Label5.Hint            := rsn_Pr5;
  Label5.ShowHint        := true;
  Label6.Hint            := rsn_Pr6;
  Label6.ShowHint        := true;
  Label7.Hint            := rsn_Pr7;
  Label7.ShowHint        := true;
  GroupBox3.Caption      := rsn_Dan_buf;
  Label12.Caption        := rsn_Pr8;
  Label11.Caption        := rsn_Pr9;
  Label13.Caption        := rstd_Comment;
  Label8.Caption         := rsh_MFO;
  Label9.Caption         := rsh_RateAcc1;
  Label10.Caption        := rsh_Bank;
  Label14.Caption        := rsn_name_buff;
end;

procedure TfrmMfoRsch_edit.cxButton1Click(Sender: TObject);
begin
  if Flag_edit = true then
  begin
    pFIBStoredProc_edit.Database := TfrmMainFormMfoRsch(Self.Owner).pFIBDatabase;
    pFIBStoredProc_edit.Transaction := TfrmMainFormMfoRsch(Self.Owner).pFIBTransactionWrite;
    TfrmMainFormMfoRsch(Self.Owner).pFIBTransactionWrite.DefaultDatabase := TfrmMainFormMfoRsch(Self.Owner).pFIBDatabase;
    pFIBStoredProc_edit.Transaction.StartTransaction;

    pFIBStoredProc_edit.StoredProcName := 'PUB_EXPAND_INSERT';
    pFIBStoredProc_edit.Prepare;
    pFIBStoredProc_edit.ParamByName('D_ID_EXPAND').Value := expand;
    pFIBStoredProc_edit.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc;
    pFIBStoredProc_edit.ParamByName('D_ID_BANK_BUFF').Value := DBLookupComboBox.KeyValue;
    pFIBStoredProc_edit.ParamByName('NAME_RSCH').Value := cxTextEdit_name_rsch.Text;

    if cxCheckBox1.Checked then
      pFIBStoredProc_edit.ParamByName('D_CREATE_VIP').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('D_CREATE_VIP').Value := 0;

    if cxCheckBox2.Checked then
      pFIBStoredProc_edit.ParamByName('D_CREATE_REE').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('D_CREATE_REE').Value := 0;

    if cxCheckBox3.Checked then
      pFIBStoredProc_edit.ParamByName('D_KAZNACHEY').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('D_KAZNACHEY').Value := 0;

    if cxCheckBox4.Checked then
      pFIBStoredProc_edit.ParamByName('D_ADD_OKPO').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('D_ADD_OKPO').Value := 0;

    if cxCheckBox5.Checked then
      pFIBStoredProc_edit.ParamByName('D_ADD_REGSCH').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('D_ADD_REGSCH').Value := 0;

    if cxCheckBox6.Checked then
      pFIBStoredProc_edit.ParamByName('D_ADD_KEKV').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('D_ADD_KEKV').Value := 0;

    if cxCheckBox7.Checked then
      pFIBStoredProc_edit.ParamByName('D_REE_OUTCH').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('D_REE_OUTCH').Value := 0;

    if ArndNDS.Checked then
      pFIBStoredProc_edit.ParamByName('ARND_NDS_RAH').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('ARND_NDS_RAH').Value := 0;

    if cbKPK.Checked then
      pFIBStoredProc_edit.ParamByName('ADD_KPK').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('ADD_KPK').Value := 0;

    if cbSPPOV.Checked then
      pFIBStoredProc_edit.ParamByName('ADD_SP').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('ADD_SP').Value := 0;

    if KPKVFirst.Checked then
      pFIBStoredProc_edit.ParamByName('ADD_KPK_FIRST').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('ADD_KPK_FIRST').Value := 0;

    if KEKV_First.Checked then
      pFIBStoredProc_edit.ParamByName('ADD_KEKV_FIRST').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('ADD_KEKV_FIRST').Value := 0;

    if CurrencyEdit_sum_pay.Text = '' then
      pFIBStoredProc_edit.ParamByName('D_SUM_PAY').Value := 0
    else
      pFIBStoredProc_edit.ParamByName('D_SUM_PAY').Value := CurrencyEdit_sum_pay.Text;

    if CurrencyEdit_sum_case.Text='' then
      pFIBStoredProc_edit.ParamByName('D_SUM_CASE').Value := 0
    else
    pFIBStoredProc_edit.ParamByName('D_SUM_CASE').Value := CurrencyEdit_sum_case.Text;

    if cxCheckBoxSum.Checked then
      pFIBStoredProc_edit.ParamByName('ADD_SUM').Value := 1
    else
      pFIBStoredProc_edit.ParamByName('ADD_SUM').Value := 0;

    pFIBStoredProc_edit.ParamByName('ID_PKV').Value := id_sm_pkv;

    pFIBStoredProc_edit.ParamByName('ID_TYPE_FINANCE').Value := id_type_finance;

    try
      pFIBStoredProc_edit.ExecProc;
    except  on e:Exception do
      begin
        ShowMessage(e.Message);
        TfrmMainFormMfoRsch(Self.Owner).pFIBTransactionWrite.Rollback;
        exit;
      end;
    end;
      TfrmMainFormMfoRsch(Self.Owner).pFIBTransactionWrite.Commit;
      Close;
    end;
 ModalResult := mrOk;
end;

procedure TfrmMfoRsch_edit.DBLookupComboBoxClick(Sender: TObject);
var
  DataSet: TpFIBDataSet;
  s: String;
  param_id: Integer;
begin
  DataSet := TpFIBDataSet.Create(Self);
  DataSet.Database := TfrmMainFormMfoRsch(self.Owner).pFIBDatabase;
  param_id := DBLookupComboBox.KeyValue;
  s := 'select  * from    dog_dt_bankbuff'+' '+
       'where   dog_dt_bankbuff.id_bank_buff='+IntToStr(param_id);
  DataSet.SelectSQL.Add(s);
  DataSet.Active := true;
  cxTextEdit_comment.Text := 'Путь к таблице: '+ DataSet.FieldByName('path_buff').AsString +'\'+ DataSet.FieldByName('alias_buff').AsString;
  DataSet.Free;
end;

procedure TfrmMfoRsch_edit.DBLookupComboBoxContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
 DBLookupComboBox.DropDownRows:=2;
 Handled:=true;
end;


procedure TfrmMfoRsch_edit.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  PKVInfo : TpFibDataSet;
begin
    Res:= GlobalSpr.GetSmPKV(Self, TfrmMainFormMfoRsch(self.Owner).pFIBDatabase.Handle, fsNormal, 0);
    if Res<>Variant(0)
    then begin
               id_sm_pkv:=VarAsType(Res, varInt64);
               PKVInfo:=TpFibDataSet.Create(self);
               PKVInfo.Database:=TfrmMainFormMfoRsch(self.Owner).pFIBDatabase;
               PKVInfo.Transaction:=TfrmMainFormMfoRsch(self.Owner).pFIBTransactionRead;
               PKVInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_SM_PKV WHERE ID_PKV='+IntToStr(id_sm_pkv);
               PKVInfo.Open;
               PKVInfo.FetchAll;
               if (PKVInfo.RecordCount>0)
               then
               begin
                  cxButtonEdit1.Text:=PKVInfo.FieldByName('PKV_KOD').AsString + ' (' + PKVInfo.FieldByName('PKV_TITLE').AsString + ')';
               end;
               PKVInfo.Close;
               PKVInfo.Free;
    end;
end;


procedure TfrmMfoRsch_edit.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  PKVInfo : TpFibDataSet;
begin
    Res:=GlobalSpr.GetTypeFinance(self, TfrmMainFormMfoRsch(self.Owner).pFIBDatabase.Handle, fsNormal, 0);
    if Res<>Variant(0)
    then begin
               id_type_finance:=VarAsType(Res,varInteger);
               PKVInfo:=TpFibDataSet.Create(self);
               PKVInfo.Database:=TfrmMainFormMfoRsch(self.Owner).pFIBDatabase;
               PKVInfo.Transaction:=TfrmMainFormMfoRsch(self.Owner).pFIBTransactionRead;
               PKVInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_TYPE_FINANCE WHERE ID_TYPE_FINANCE='+IntToStr(id_type_finance);
               PKVInfo.Open;
               PKVInfo.FetchAll;
               if (PKVInfo.RecordCount>0)
               then begin
                  cxButtonEdit2.Text:=PKVInfo.FieldByName('TYPE_FINANCE_CODE').AsString + ' (' + PKVInfo.FieldByName('TYPE_KAZN_KOD').AsString + ') ' + PKVInfo.FieldByName('TYPE_FINANCE_NAME').AsString;
               end;
               PKVInfo.Close;
               PKVInfo.Free;
    end;
end;

end.



