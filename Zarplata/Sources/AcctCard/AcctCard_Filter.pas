unit AcctCard_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, ExtCtrls,
  PackageLoad, IBase, ZTypes, DB, Halcn6db, Unit_ZGlobal_Consts, ZProc, ZMessages,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  cxCheckBox, AcctCard_FieldNames, AcctCard_DM, RxMemDS, cxRadioGroup,
  z_uWaitForm;

type
  TFZAcctCard_Filter = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    pnl2: TPanel;
    CheckBoxTPaymZarplata: TcxCheckBox;
    CheckBoxTPaymGrant: TcxCheckBox;
    OpenFile: TOpenDialog;
    CheckBoxCheckAll: TcxCheckBox;
    pnl3: TPanel;
    LabelBank: TcxLabel;
    BankBtnEdit: TcxButtonEdit;
    LabelFile: TcxLabel;
    FileBtnEdit: TcxButtonEdit;
    CheckBoxNewFieldsDBFtable: TcxCheckBox;
    CheckBoxZarplata: TcxCheckBox;
    CheckBoxGrant: TcxCheckBox;
    StProc: TpFIBStoredProc;
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    WTransaction: TpFIBTransaction;
    procedure BankBtnEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FileBtnEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure YesBtnClick(Sender: TObject);
    procedure CheckBoxNewFieldsDBFtableClick(Sender: TObject);
    procedure CheckBoxZarplataPropertiesChange(Sender: TObject);
  private
    PId_Type_Payment:integer;
    PFileName:String;
    PFieldTinName:string;
    PFieldAcctCardName:string;
    PFieldFIOName:string;
    PLanguageIndex:byte;
    PDb_Handle:TISC_DB_HANDLE;
    PIsZarplata:string;
    PIsGrant:string;
    PBankName:string;
  public
    constructor Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
    property Id_Type_Payment:integer read PId_Type_Payment;
    property IsZarplata:string read PIsZarplata;
    property IsGrant:string read PIsGrant;
    property BankName:string read PBankName;
  end;


implementation

{$R *.dfm}

constructor TFZAcctCard_Filter.Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption := RefreshSKR_Caption[PLanguageIndex];
 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[PLanguageIndex];
 LabelBank.Caption := LabelBank_Caption[PLanguageIndex];
 LabelFile.Caption := LabelFile_Caption[PLanguageIndex];
 CheckBoxNewFieldsDBFtable.Properties.Caption:=FRefreshSKR_CheckBoxNewFieldsDBFtable_Caption[PLanguageIndex];
// CheckBoxDeleteAll.Properties.Caption:='Предварительно очистив';
//******************************************************************************
 PDb_Handle:=DB_Handle;
 if(ValueFieldZSetup(PDB_Handle,'IS_UNIVER')='F')then
 begin
   CheckBoxZarplata.Properties.Caption:='Добавить карточные счета';
   CheckBoxGrant.Visible:=False;
   CheckBoxTPaymGrant.Visible:=False;
 end;
end;

procedure TFZAcctCard_Filter.BankBtnEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var viplata:Variant;
begin
  Viplata := LoadViplata(Self,PDb_Handle,zfsModal);
  if VarArrayDimCount(viplata)>0 then
  begin
    PId_Type_Payment:=viplata[0];
    BankBtnEdit.Text := VarToStr(viplata[1]);
  end;
end;

procedure TFZAcctCard_Filter.FileBtnEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenFile.Execute then
  begin
    PFileName:=OpenFile.FileName;
    FileBtnEdit.Text := PFileName;
  end;
end;

procedure TFZAcctCard_Filter.YesBtnClick(Sender: TObject);
var wf:TForm;
    DSet:THalcyonDataSet;
begin
{  if(CheckBoxCheckAll.Checked=True)then
  begin
    try
      wf:=ShowWaitForm(Self);
      DM.DSetPrint.SQLs.SelectSQL.Text:='SELECT * FROM Z_TNACCES_MAN_CHECK_ALL ORDER BY FIO';
      DM.DSetPrint.Open;
      CloseWaitForm(wf);
    except
      on E:Exception do
      begin
        ZShowMessage(Error_Caption[PLanguageIndex],
                     E.Message+#13+LabelTin_Caption[PLanguageIndex]+': '+
                     VarToStr(DSet[PFieldTinName]),mtError,[mbOK]);
        CloseWaitForm(wf);
      end;
    end;
      DM.Print2(1);
      DM.DSetPrint.Close;
  end;

  if(CheckBoxTPaymZarplata.Checked=True or CheckBoxTPaymGrant.Checked)then
  begin
    try
      wf:=ShowWaitForm(Self);
      DM.DSetPrint.SQLs.SelectSQL.Text:='SELECT * FROM Z_TNACCESS_CHECK_TYPE_PAYMEN('+IfThen(CheckBoxTPaymZarplata.Checked,'''T'',','''F'',')+IfThen(CheckBoxTPaymGrant.Checked,'''T''','''F''')+') ORDER BY RTYPE';
      DM.DSetPrint.Open;
      CloseWaitForm(wf);
    except
      on E:Exception do
      begin
        ZShowMessage(Error_Caption[PLanguageIndex],
                     E.Message+#13+LabelTin_Caption[PLanguageIndex]+': '+
                     VarToStr(DSet[PFieldTinName]),mtError,[mbOK]);
        CloseWaitForm(wf);
      end;
    end;
      DM.Print2(3);
      DM.DSetPrint.Close;
  end;}
  if((CheckBoxZarplata.Checked=True) or (CheckBoxGrant.Checked=True))then
  begin
    PFieldTinName := TinFieldName;
    PFieldAcctCardName := CardFieldName;
    PFieldFIOName:=FIOFieldName;

    if not FileExists(PFileName) then
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],
                   ZeFileNotExist_Text[PLanguageIndex]+#13+PFileName,mtWarning,[mbOK]);
      Exit;
    end;
    try
      DSet:=THalcyonDataSet.Create(Self);
      DSet.TableName := PFileName;
      DSet.Open;
    except
      on E:Exception do
      begin
        ZShowMessage(   Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
        DSet.Destroy;
        Exit;
      end;
    end;
    if DSet.FindField(PFieldTinName)=nil then
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],
                   ZeFieldNotExist_Text[PLanguageIndex]+#13+PFieldTinName,mtWarning,[mbOK]);
      DSet.Destroy;
      Exit;
    end;
    if DSet.FindField(PFieldAcctCardName)=nil then
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],
                   ZeFieldNotExist_Text[PLanguageIndex]+#13+PFieldAcctCardName,mtWarning,[mbOK]);
      DSet.Destroy;
      Exit;
    end;

    try
      wf:=ShowWaitForm(self, zwfDoFunction);
      DB.Handle:=PDb_Handle;
      WTransaction.StartTransaction;
      with StProc do
      begin
        StoredProcName:='Z_UTIL_IMPORT_ACCTCARD_TMP_CLE';
        Prepare;
        ExecProc;
      end;
      WTransaction.Commit;
      WTransaction.StartTransaction;
      DSet.First;
      with StProc do
      begin
        StoredProcName:='Z_UTIL_IMPORT_ACCTCARD_TMP_I';
        Prepare;
        while not DSet.Eof
        do
        begin
          if(DSet.FindField(PFieldFIOName)<>nil)then
            ParamByName('FIO').AsString:=VarToStr(DSet[PFieldFIOName]);
          ParamByName('TIN').AsString:=VarToStr(DSet[PFieldTinName]);
          ParamByName('ACCT_CARD').AsString:=VarToStr(DSet[PFieldAcctCardName]);
          ExecProc;
          DSet.Next;
        end;
      end;
      WTransaction.Commit;
      CloseWaitForm(wf);
    except
      on E:Exception do
      begin
        ZShowMessage(Error_Caption[PLanguageIndex],
                     E.Message+#13+LabelTin_Caption[PLanguageIndex]+': '+
                     VarToStr(DSet[PFieldTinName]),mtError,[mbOK]);
        if WTransaction.InTransaction then WTransaction.Rollback;
        CloseWaitForm(wf);
      end;
    end;
  end;
  if(CheckBoxZarplata.Checked=true)then
    PIsZarplata:='T'
  else
    PIsZarplata:='F';
  if(CheckBoxGrant.Checked=true)then
    PIsGrant:='T'
  else
    PIsGrant:='F';
  PBankName:=BankBtnEdit.Text;  
  ModalResult:=mrYes;
end;

procedure TFZAcctCard_Filter.CheckBoxNewFieldsDBFtableClick(Sender: TObject);
var Form:TFZAcctCard_FieldNames;
begin
  if CheckBoxNewFieldsDBFtable.Checked then
  begin
    Form := TFZAcctCard_FieldNames.Create(self);
    CheckBoxNewFieldsDBFtable.Checked := Form.ShowModal=mrYes;
    Form.Free;
   end;
end;

procedure TFZAcctCard_Filter.CheckBoxZarplataPropertiesChange(
  Sender: TObject);
begin
  if((CheckBoxZarplata.Checked=true) or (CheckBoxGrant.Checked=true))then
  begin
    BankBtnEdit.Enabled:=true;
    FileBtnEdit.Enabled:=true;
    CheckBoxNewFieldsDBFtable.Enabled:=true;
  end else
  begin
    BankBtnEdit.Enabled:=false;
    FileBtnEdit.Enabled:=false;
    CheckBoxNewFieldsDBFtable.Enabled:=false;
  end;
end;

end.
