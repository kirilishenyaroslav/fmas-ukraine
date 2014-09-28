unit Contracts_Payer_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxControls, cxGroupBox, ibase,
  cnConsts, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxLabel, cxCurrencyEdit, cxDropDownEdit,
  cn_Common_Types, cn_Common_Loader,
  DogLoaderUnit, Buttons, cxDBEdit, DM, DBCtrls, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, AllPeopleUnit;

type
  Tfrm_Contracts_Payer_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Frame_GroupBox: TcxGroupBox;
    Type_Payer_GroupBox: TcxGroupBox;
    FizPayer_RadioButton: TcxRadioButton;
    YurPayer_RadioButton: TcxRadioButton;
    Payer_Label: TLabel;
    Payer_Edit: TcxButtonEdit;
    PercentEdit: TcxCurrencyEdit;
    pLabel: TcxLabel;
    Percent_Label: TLabel;
    Periodichnost_Label: TLabel;
    MFO_Edit: TcxTextEdit;
    RasSchet_Edit: TcxTextEdit;
    MFO_Label: TLabel;
    RasSchet_Label: TLabel;
    Periodichnost_Edit: TcxButtonEdit;
    EditFizLizo_Btn: TSpeedButton;
    LookupComboBox: TcxLookupComboBox;
    Osoba_Label: TLabel;
    SpeedButton1: TSpeedButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FizPayer_RadioButtonKeyPress(Sender: TObject; var Key: Char);
    procedure YurPayer_RadioButtonKeyPress(Sender: TObject; var Key: Char);
    procedure Payer_EditKeyPress(Sender: TObject; var Key: Char);
    procedure PercentEditKeyPress(Sender: TObject; var Key: Char);
    procedure Periodichnost_ComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure Percent_RadioButtonClick(Sender: TObject);
    procedure Summa_RadioButtonClick(Sender: TObject);
    procedure YurPayer_RadioButtonClick(Sender: TObject);
    procedure FizPayer_RadioButtonClick(Sender: TObject);
    procedure Payer_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Periodichnost_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Periodichnost_EditKeyPress(Sender: TObject; var Key: Char);
    procedure EditFizLizo_BtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    PLanguageIndex:byte;
    DM:TDM_Contracts;
    DB_sp_Handle:TISC_DB_HANDLE;
    procedure FormIniLanguage;
  public
     ID_PAYER         :int64;
     ID_TYPE_STAGE    :int64;
     ID_RATE_ACCOUNT  :int64;
     ID_CUST_MEN      :int64;
     IS_ADMIN         :Boolean; 
     constructor Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

constructor Tfrm_Contracts_Payer_AE.Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  DB_sp_Handle:= DB_Handle;
  FormIniLanguage();
  Dm := TDM_Contracts.Create(self);
  Dm.DB.Handle := DB_sp_Handle;
  dm.ReadTransaction.StartTransaction;
  Screen.Cursor:=crDefault;
end;

procedure Tfrm_Contracts_Payer_AE.FormIniLanguage;
begin
 Type_Payer_GroupBox.Caption:=     cnConsts.cn_PayerType[PLanguageIndex];
 FizPayer_RadioButton.Caption:=    cnConsts.cn_FizOsoba[PLanguageIndex];
 YurPayer_RadioButton.Caption:=    cnConsts.cn_YurOsoba[PLanguageIndex];
 Percent_Label.Caption:=           cnConsts.cn_Persent_Column[PLanguageIndex];
 Periodichnost_Label.Caption:=     cnConsts.cn_Period_Column[PLanguageIndex];
 Payer_Label.Caption:=             cnConsts.cn_Payer_Column[PLanguageIndex];
 OkButton.Caption:=                cnConsts.cn_Accept[PLanguageIndex];
 CancelButton.Caption:=            cnConsts.cn_Cancel[PLanguageIndex];
 MFO_Label.Caption:=               cnConsts.cn_MFO_Caption[PLanguageIndex];
 RasSchet_Label.Caption:=          cnConsts.cn_RasSchet_Caption[PLanguageIndex];
 Osoba_Label.Caption:=             cnConsts.cn_OsosbaCustomer[PLanguageIndex];
 EditFizLizo_Btn.Hint :=           cnConsts.cn_FizLizoEdit[PLanguageIndex];
end;

procedure Tfrm_Contracts_Payer_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Contracts_Payer_AE.OkButtonClick(Sender: TObject);
begin
  if Payer_Edit.text = '' then
   begin
    showmessage(cnConsts.cn_Payer_Need[PLanguageIndex]);
    Payer_Edit.SetFocus;
    exit;
   end;

  if PercentEdit.Value = 0 then
   begin
    showmessage(cnConsts.cn_Percent_Need[PLanguageIndex]);
    PercentEdit.SetFocus;
    exit;
   end;

  if Periodichnost_Edit.text = '' then
   begin
    showmessage(cnConsts.cn_Period_Need[PLanguageIndex]);
    Periodichnost_Edit.SetFocus;
    exit;
   end;

  if YurPayer_RadioButton.Checked then
   if LookupComboBox.Text <> '' then
    ID_CUST_MEN := Dm.DataSet['ID_CUST_MEN'];

  ModalResult:=mrOk;
end;

procedure Tfrm_Contracts_Payer_AE.FormShow(Sender: TObject);
begin
Payer_Edit.setFocus;
if FizPayer_RadioButton.Checked then
 begin
  MFO_Edit.Enabled:=false;
  RasSchet_Edit.Enabled:=false;
  LookupComboBox.Enabled:=false;
 end
  else
  if Caption = cnConsts.cn_EditBtn_Caption[PLanguageIndex] then
   if ID_CUST_MEN <> -1 then
   begin
    Dm.DataSet.Close;
    Dm.Dataset.SelectSQL.Clear;
    Dm.Dataset.SelectSQL.Text := 'select * from CN_FIO_BY_ID_CUSTOMER_SLT(' + inttostr(ID_PAYER) + ')';
    Dm.Dataset.Open;
    Dm.Dataset.FetchAll;
    Dm.Dataset.Locate('ID_CUST_MEN', ID_CUST_MEN, []);
     LookupComboBox.Properties.ListSource :=Dm.DataSource;
     LookupComboBox.Text := Dm.Dataset['FIO'];
   end;
end;

procedure Tfrm_Contracts_Payer_AE.FizPayer_RadioButtonKeyPress(
  Sender: TObject; var Key: Char);
begin
if key =#13 then YurPayer_RadioButton.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.YurPayer_RadioButtonKeyPress(
  Sender: TObject; var Key: Char);
begin
 if key =#13 then Payer_Edit.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.Payer_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then PercentEdit.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.PercentEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then Periodichnost_Edit.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.Periodichnost_ComboBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key =#13 then OkButton.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.Percent_RadioButtonClick(
  Sender: TObject);
begin
 Percent_Label.Caption:= cnConsts.cn_Persent_Column[PLanguageIndex];
 pLabel.Caption:='%';
 if PercentEdit.CanFocusEx then
 PercentEdit.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.Summa_RadioButtonClick(Sender: TObject);
begin
 Percent_Label.Caption:= cnConsts.cn_Summa_Column[PLanguageIndex];
 pLabel.Caption:='грн.';
 if PercentEdit.CanFocusEx then
 PercentEdit.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.YurPayer_RadioButtonClick(
  Sender: TObject);
begin
  MFO_Edit.Enabled:=true;
  RasSchet_Edit.Enabled:=true;
  LookupComboBox.Enabled := True;

  if Payer_Edit.CanFocusEx then Payer_Edit.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.FizPayer_RadioButtonClick(
  Sender: TObject);
begin
 MFO_Edit.Enabled:=false;
 RasSchet_Edit.Enabled:=false;
 LookupComboBox.Enabled := false;

 if Payer_Edit.CanFocusEx then
 Payer_Edit.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.Payer_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  Massiv : variant;
      i, o : TSpravParams;

begin
if FizPayer_RadioButton.Checked then
begin
Massiv:=AllPeopleUnit.GetManForASUP(Self, DB_sp_Handle ,False,True, -1);
if VarArrayDimCount(Massiv)>0 then
 begin
  ID_PAYER        := -1; // обнуление
  ID_PAYER        := Massiv[0];
  Payer_Edit.text := Massiv[1];
  MFO_Edit.Text:='';
  RasSchet_Edit.Text:='';
 end;
end
else
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(DB_sp_Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := SelCustomer;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
     ID_PAYER        := -1; // обнуление
     ID_RATE_ACCOUNT := -1; // обнуление
     ID_PAYER        := o['ID_CUSTOMER'];
     if o['ID_RATE_ACCOUNT']=null then
      ID_RATE_ACCOUNT:=-1
     else
      ID_RATE_ACCOUNT := o['ID_RATE_ACCOUNT'];

     Payer_Edit.text := o['NAME_CUSTOMER'];

     if o['MFO']=null then
      MFO_Edit.text := ''
     else
      MFO_Edit.text := o['MFO'];

     if o['RATE_ACCOUNT']=null then
      RasSchet_Edit.text := ''
     else
      RasSchet_Edit.text := o['RATE_ACCOUNT'];
    end;
    i.Free;
    o.Free;

   // забираю ФИО по кастомеру
   Dm.DataSet.Close;
   Dm.Dataset.SelectSQL.Clear;
   Dm.Dataset.SelectSQL.Text := 'select * from CN_FIO_BY_ID_CUSTOMER_SLT(' + inttostr(ID_PAYER) + ')';
   Dm.Dataset.Open;
   if Dm.Dataset.RecordCount > 0 then
   begin
     Dm.Dataset.FetchAll;
     Dm.Dataset.First;
       LookupComboBox.Properties.ListSource :=Dm.DataSource;
       LookupComboBox.Text := Dm.Dataset['FIO'];
   end;

  end;
end;

procedure Tfrm_Contracts_Payer_AE.Periodichnost_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.is_admin:=IS_ADMIN;
  if ID_TYPE_STAGE <> -1 then
  AParameter.ID_Locate :=  ID_TYPE_STAGE;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_ini_TypeStage.bpl','ShowIniTypeStage');
  AParameter.Free;
 if VarArrayDimCount(res)>0 then
 begin
  ID_TYPE_STAGE := res[0];
  Periodichnost_Edit.Text:= vartostr(res[1]);
 end;
end;

procedure Tfrm_Contracts_Payer_AE.Periodichnost_EditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure Tfrm_Contracts_Payer_AE.EditFizLizo_BtnClick(Sender: TObject);
begin
if ((ID_PAYER <> -1) and (FizPayer_RadioButton.Checked))
then ShowManEditForm(Self,  DB_sp_Handle , ID_PAYER,  True);
end;

procedure Tfrm_Contracts_Payer_AE.FormDestroy(Sender: TObject);
begin
 Dm.DataSet.Close;
 Dm.Free;
end;

procedure Tfrm_Contracts_Payer_AE.SpeedButton1Click(Sender: TObject);
begin
LookupComboBox.Text := '';
ID_CUST_MEN := -1;
end;

end.
