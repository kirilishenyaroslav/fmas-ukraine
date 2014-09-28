unit TITaxInvoices_AddOtrNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxButtons, cxControls, cxGroupBox, cxDBEdit, cxCheckBox, Ibase,
  cxCurrencyEdit,dogLoaderUnit, LoaderUnit,TICommonLoader,TiMessages,Registry,
  cxMemo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, Buttons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ExtCtrls,LoadDogManedger;

type TTITaxInvoicesAddOtrNakl=record
  id_Kod            : Integer;
  Name_Kod          : string;
  Id_TypeDocument   : Integer;
  Name_TypeDocument : string;
  Id_Customer       : Integer;
  Name_Customer     : string;
  IPNCustomer       : string;
  IsKorig           : Integer;
  IsExpansion       : Integer;
  IsSign            : Integer;
end;

type
  TTITaxInvoicesAddOtrNaklForm = class(TForm)
    MainInfoNaklGroupBox: TcxGroupBox;
    TaxLiabilitiesGroupBox: TcxGroupBox;
    ProviderGroupBox: TcxGroupBox;
    SummaGroupBox: TcxGroupBox;
    SignGroupBox: TcxGroupBox;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    DataVipNaklLabel: TcxLabel;
    NumNaklLabel: TcxLabel;
    KodButtonEdit: TcxButtonEdit;
    ProviderButtonEdit: TcxButtonEdit;
    IPNProviderTextEdit: TcxTextEdit;
    DateVipDateEdit: TcxDateEdit;
    NumNaklTextEdit: TcxTextEdit;
    IsKorigCheckBox: TcxCheckBox;
    IsExpansionCheckBox: TcxCheckBox;
    InfoReestrGroupBox: TcxGroupBox;
    NumReestrLabel: TcxLabel;
    NumReestrDBTextEdit: TcxDBTextEdit;
    NaklLabel: TcxLabel;
    summa_20_0_not_pdv_CurrencyEdit: TcxCurrencyEdit;
    summa_20_0_pdv_CurrencyEdit: TcxCurrencyEdit;
    summa_exempt_pdv_CurrencyEdit: TcxCurrencyEdit;
    TypeDocumentGroupBox: TcxGroupBox;
    TypeDocumentButtonEdit: TcxButtonEdit;
    PeriodLabel: TcxLabel;
    PeriodDBTextEdit: TcxDBTextEdit;
    NumOrderLabel: TcxLabel;
    NumOrderTextEdit: TcxTextEdit;
    DateOtrNaklLabel: TcxLabel;
    DateOtrDateEdit: TcxDateEdit;
    summa_20_0_not_pdv_Label: TLabel;
    summa_20_0_pdv_Label: TLabel;
    summa_exempt_not_pdv_Label: TLabel;
    summa_exempt_pdv_Label: TLabel;
    summa_econ_activ_not_pdv_Label: TLabel;
    summa_econ_activ_pdv_Label: TLabel;
    summa_delivery_not_pdv_Label: TLabel;
    summa_delivery_pdv_Label: TLabel;
    summa_delivery_pdv_CurrencyEdit: TcxCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    IPNProviderLabel: TLabel;
    summa_exempt_not_pdv_CurrencyEdit: TcxCurrencyEdit;
    summa_delivery_not_pdv_CurrencyEdit: TcxCurrencyEdit;
    summa_econ_activ_not_pdv_CurrencyEdit: TcxCurrencyEdit;
    summa_econ_activ_pdv_CurrencyEdit: TcxCurrencyEdit;
    FullNameCheckBox: TCheckBox;
    SaveFullNameButton: TcxButton;
    FullNameMemo: TcxMemo;
    Panel1: TPanel;
    Label5: TLabel;
    GroupBox6: TGroupBox;
    Bevel2: TBevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    ToolButton_add: TSpeedButton;
    ToolButton_del: TSpeedButton;
    SpeedButton_red: TSpeedButton;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LabelNotPDV: TLabel;
    LabelPDV: TLabel;
    Label6: TLabel;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    Oznaka1TextEdit: TcxTextEdit;
    Oznaka2TextEdit: TcxTextEdit;
    Oznaka1CheckBox: TcxCheckBox;
    Oznaka2CheckBox: TcxCheckBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure CustomerButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KodButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeDocumentButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure YesButtonClick(Sender: TObject);
    procedure summa_20_0_not_pdv_CurrencyEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure summa_20_0_not_pdv_CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure summa_20_0_pdv_CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure summa_exempt_not_pdv_CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure summa_exempt_pdv_CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure summa_econ_activ_pdv_CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure summa_exempt_not_pdv_CurrencyEditExit(Sender: TObject);
    procedure summa_econ_activ_not_pdv_CurrencyEditExit(Sender: TObject);
    procedure summa_delivery_not_pdv_CurrencyEditExit(Sender: TObject);
    procedure summa_exempt_not_pdvCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure summa_delivery_not_pdv_CurrencyEditKeyPress(Sender: TObject; var Key: Char);
    procedure summa_econ_activ_not_pdv_CurrencyEditKeyPress(Sender: TObject; var Key: Char);
    procedure NumNaklTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateOtrDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure ProviderButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure IPNProviderTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure NumOrderTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateVipDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure KodButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeDocumentButtonEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure IsKorigCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure IsExpansionCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure SaveFullNameButtonClick(Sender: TObject);
    procedure FullNameCheckBoxClick(Sender: TObject);
    procedure NumOrderTextEditExit(Sender: TObject);
    procedure FullNameMemoKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton_addClick(Sender: TObject);
    procedure SpeedButton_redClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure Oznaka1CheckBoxClick(Sender: TObject);
    procedure Oznaka2CheckBoxClick(Sender: TObject);
  private
    PRes           : Variant;
    PDb_Handle     : TISC_DB_HANDLE;
    PParameter     : TTITaxInvoicesAddOtrNakl;
  public
    provodka : Boolean;
    full_name_customer :string;
    procedure SummaEnabled(id:integer);
    procedure ReadReg;
    procedure WriteReg;
    procedure replaceAbreviatures(short_name:string);
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddOtrNakl);reintroduce;
    property Res:Variant read PRes;
    property Parameter:TTITaxInvoicesAddOtrNakl read PParameter;
  end;

var
  TITaxInvoicesAddOtrNaklForm: TTITaxInvoicesAddOtrNaklForm;

implementation

uses TITaxInvoicesDM;

{$R *.dfm}

constructor TTITaxInvoicesAddOtrNaklForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddOtrNakl);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
  PParameter := AddParametr;
  TaxInvoicesDM.RxMemoryData_smet.AfterScroll := RxMemoryData_smetAfterScroll;
end;

procedure TTITaxInvoicesAddOtrNaklForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTITaxInvoicesAddOtrNaklForm.CustomerButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
 id_Customer:Integer;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(TaxInvoicesDM.DB.Handle);
 i['FormStyle']    := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := selCustomer;
 i['id_cistomer']  := -1;
 i['show_all']     := 1;
 LoadSysData(TaxInvoicesDM.ReadTransaction);
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);

  if o['ModalResult'] = mrOk then
  begin
   id_Customer := o['ID_CUSTOMER'];
   TaxInvoicesDM.CustomerDSet.Close;
   TaxInvoicesDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
   TaxInvoicesDM.CustomerDSet.ParamByName('id').Value := id_Customer;
   TaxInvoicesDM.CustomerDSet.Open;
   PParameter.Id_Customer   := id_Customer;
   //PParameter.Name_Customer := TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER'];

   PParameter.IPNCustomer   := TaxInvoicesDM.CustomerDSet['NALOG_NOM'];

   if PParameter.IPNCustomer = '0' then PParameter.IPNCustomer := '400000000000';

   ProviderButtonEdit.Text  := TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER'];
   IPNProviderTextEdit.Text := PParameter.IPNCustomer;

   if ((TaxInvoicesDM.CustomerDSet['full_name_customer'] = '') or (TaxInvoicesDM.CustomerDSet['full_name_customer']=null))then
   begin
     replaceAbreviatures(TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER']);
     FullNameCheckBox.Checked   := True;
     FullNameMemo.Properties.ReadOnly      := False;
     SaveFullNameButton.Visible := True;
     PParameter.Name_Customer   := '';
   end
   else
   begin
     FullNameMemo.Text := TaxInvoicesDM.CustomerDSet['full_name_customer'];
     PParameter.Name_Customer := TaxInvoicesDM.CustomerDSet['full_name_customer'];
     FullNameCheckBox.Checked   := False;
     FullNameMemo.Properties.ReadOnly      := True;
     SaveFullNameButton.Visible := False;
   end;
  end;
  i.Free;
  o.Free;
end;

procedure TTITaxInvoicesAddOtrNaklForm.KodButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  PodZob:Variant;
begin
  PodZob              := LoadTaxLiabilitiesPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxLiabilities.bpl','View_TaxLiabilities',0);
  If VarArrayDimCount(PodZob)>0 then
  begin
    PParameter.id_Kod   := PodZob[0];
    PParameter.Name_Kod := PodZob[1];
    KodButtonEdit.Text  := PodZob[1];
    SummaEnabled(PParameter.id_Kod);
  end;
end;

procedure TTITaxInvoicesAddOtrNaklForm.TypeDocumentButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  TypeDoc:Variant;
begin
  TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',1);
  If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.Id_TypeDocument   := TypeDoc[0];
    PParameter.Name_TypeDocument := TypeDoc[1];
    TypeDocumentButtonEdit.Text  := TypeDoc[1];
  end;
end;

procedure TTITaxInvoicesAddOtrNaklForm.YesButtonClick(Sender: TObject);
var
  error_period: string;
  oznaka: string;
begin
  if (NumOrderTextEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть номер за порядком!',mtWarning,[mbOK]);
   NumOrderTextEdit.SetFocus;
   Exit;
  end;

  if (NumNaklTextEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть номер накладної!',mtWarning,[mbOK]);
   NumNaklTextEdit.SetFocus;
   Exit;
  end;

  if (DateVipDateEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату виписки!',mtWarning,[mbOK]);
   DateVipDateEdit.SetFocus;
   Exit;
  end;

  if (DateOtrDateEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату виписки!',mtWarning,[mbOK]);
   DateOtrDateEdit.SetFocus;
   Exit;
  end;

  if (Oznaka1CheckBox.Checked = True) then
  begin
    if (Oznaka1TextEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть ознаку 1 або зніміть галочку!',mtWarning,[mbOK]);
      Oznaka1TextEdit.SetFocus;
      Exit;
    end;
    oznaka := Trim(Oznaka1TextEdit.Text);
    if (Length(oznaka) <> 1) then
    begin
      TiShowMessage('Увага!','Невірно заповнена ознака 1, вона повинна складатися з 1 літери!',mtWarning,[mbOK]);
      Oznaka1TextEdit.SetFocus;
      Exit;
    end;
    //PParameter.oznaka_nakl := oznaka;
  end;

  if (Oznaka2CheckBox.Checked = True) then
  begin
    if (Oznaka2TextEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть ознаку 2 або зніміть галочку!',mtWarning,[mbOK]);
      Oznaka2TextEdit.SetFocus;
      Exit;
    end;
    oznaka := Trim(Oznaka2TextEdit.Text);
    if (Length(oznaka) <> 1) then
    begin
      TiShowMessage('Увага!','Невірно заповнена ознака 2, вона повинна складатися з 1 літери!',mtWarning,[mbOK]);
      Oznaka2TextEdit.SetFocus;
      Exit;
    end;
    //PParameter.oznaka_nakl := oznaka;
  end;

    //проверка на корректность даты согласно реестра
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_DATE_NAKL_IS_KORRECT';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('id_reestr').Value := TaxInvoicesDM.ReestrDSet['id_reestr'];
  TaxInvoicesDM.pFIBStoredProc.ParamByName('date_nakl').Value := DateOtrDateEdit.Date;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;

  if (TaxInvoicesDM.pFIBStoredProc.ParamByName('is_korrect').Value = 0) then
  begin
   error_period := 'Дата податкової накладної не може виходити за період реєстру! Період: з ' + TaxInvoicesDM.pFIBStoredProc.ParamByName('date_beg').AsString + 'по ' + TaxInvoicesDM.pFIBStoredProc.ParamByName('date_end').AsString;
   TiShowMessage('Увага!', error_period, mtWarning,[mbOK]);
   KodButtonEdit.SetFocus;
   Exit;
  end;

  {if (KodButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть код!',mtWarning,[mbOK]);
   KodButtonEdit.SetFocus;
   Exit;
  end;  }

  if (TypeDocumentButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть тип документу!',mtWarning,[mbOK]);
   TypeDocumentButtonEdit.SetFocus;
   Exit;
  end;

  if (ProviderButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть постачальника!',mtWarning,[mbOK]);
   ProviderButtonEdit.SetFocus;
   Exit;
  end;

  if (IsKorigCheckBox.Checked)then
    PParameter.IsKorig := 1
  else
    PParameter.IsKorig := 0;

  if (IsExpansionCheckBox.Checked)then
    PParameter.IsExpansion := 1
  else
    PParameter.IsExpansion := 0;

  if (FullNameMemo.Text='') then
  begin
    TiShowMessage('Увага!','Заповніть повну назву постачальника!',mtWarning,[mbOK]);
    FullNameMemo.SetFocus;
    Exit;
  end;

  if (FullNameCheckBox.Checked = True)then
  begin
    TiShowMessage('Увага!','Заповніть повну назву постачальника або зніміть редагування повної назви постачальника!',mtWarning,[mbOK]);
    FullNameMemo.SetFocus;
    Exit;
  end;

  if (PParameter.Name_Customer = '') then
  begin
    TiShowMessage('Увага!','Збережіть повну назву постачальника!',mtWarning,[mbOK]);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_20_0_not_pdv_CurrencyEditExit(
  Sender: TObject);
var
  summa         : Double;
  summaout      : Double;
  error_message : string;
  percent       : Double;
  summa_Round   : Double;
begin
 // summa := (Round((summa_20_0_not_pdv_CurrencyEdit.EditValue*0.2)*100))/100;
  summa := summa_20_0_not_pdv_CurrencyEdit.EditValue*0.2;
  summa := summa*100;
  summa_Round := Round(summa);
  summa := summa_Round/100;
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_PDV_CALCULATION';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SETUP_REESTR').Value := TaxInvoicesDM.ReestrDSet['KOD_SETUP'];
  TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA').Value            := summa_20_0_not_pdv_CurrencyEdit.EditValue;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  summaout := TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_OUT').Value;
  percent  := TaxInvoicesDM.pFIBStoredProc.ParamByName('PERCENT').Value;
  if (Summa = summaout) then
  begin
    summa_20_0_pdv_CurrencyEdit.EditValue := summa;
  end
  else
  begin
    error_message := 'процент ПДВ не співпадає з 20%! процент ПДВ згідно Довідника НДС = '+ FloatToStr(percent)+' Продовжити?';
    if (TiShowMessage('Увага!',error_message,mtWarning,[mbYes,mbNo])) = mrNo then
      summa_20_0_pdv_CurrencyEdit.EditValue := 0
    else
      summa_20_0_pdv_CurrencyEdit.EditValue := summa;

    {error_message := '20%, 0% сума ПДВ не збігається! Довідник НДС = '+ FloatToStr(summaout)+' 20% = '+ FloatToStr(summa);
    TiShowMessage('Увага!',error_message,mtWarning,[mbOK]);
    summa_20_0_pdv_CurrencyEdit.EditValue := 0;}
  end;
end;

procedure TTITaxInvoicesAddOtrNaklForm.ReadReg;
var
  reg : TRegistry;
begin
  try
   begin
     reg := TRegistry.Create;
     reg.RootKey := HKEY_CURRENT_USER;
     if reg.OpenKey('\Software\TaxInvoices\VidNaklIns\',False) then
     begin
       TypeDocumentButtonEdit.Text  := reg.ReadString('name_type_document');
       PParameter.Id_TypeDocument   := StrToInt(reg.ReadString('id_type_document'));
       PParameter.Name_TypeDocument := reg.ReadString('name_type_document');

       //KodButtonEdit.Text  := reg.ReadString('name_taxliabilities');
       //PParameter.id_Kod   := StrToInt(reg.ReadString('id_taxliabilities'));
       //PParameter.Name_Kod := reg.ReadString('name_taxliabilities');
      // if (PParameter.id_Kod <> 0) then SummaEnabled(PParameter.id_Kod);//согласно данным энэйблим суммы
     end
     else
     begin
       TypeDocumentButtonEdit.Text := '';
       KodButtonEdit.Text          := '';
     end;
   end
  finally
    reg.Free;
  end;
end;

procedure TTITaxInvoicesAddOtrNaklForm.WriteReg;
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if (reg.OpenKey('\Software\TaxInvoices\VidNaklIns\',True)) then
   begin
     reg.WriteString('id_type_document',IntToStr(PParameter.Id_TypeDocument));
     reg.WriteString('name_type_document',PParameter.Name_TypeDocument);
     reg.WriteString('id_taxliabilities',IntToStr(PParameter.id_Kod));
     reg.WriteString('name_taxliabilities',PParameter.Name_Kod);
   end;
  finally
   reg.Free;
  end;
end;

procedure TTITaxInvoicesAddOtrNaklForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteReg;
end;

procedure TTITaxInvoicesAddOtrNaklForm.SummaEnabled(id: integer);
begin
  TaxInvoicesDM.KodDSet.Close;
  TaxInvoicesDM.KodDSet.SelectSQL.Text := 'select * from ti_sp_taxliabilities where code = :id';
  TaxInvoicesDM.KodDSet.ParamByName('id').Value := id;
  TaxInvoicesDM.KodDSet.Open;

  if not (id = 0) then
  begin
    if (TaxInvoicesDM.KodDSet['is_summa_20_0_not_pdv'] = 1) then
    summa_20_0_not_pdv_CurrencyEdit.Enabled := True
  else
    summa_20_0_not_pdv_CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['is_summa_20_0_pdv'] = 1) then
    summa_20_0_pdv_CurrencyEdit.Enabled := True
  else
    summa_20_0_pdv_CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['is_summa_exempt_not_pdv'] = 1) then
    summa_exempt_not_pdv_CurrencyEdit.Enabled := True
  else
    summa_exempt_not_pdv_CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['is_summa_exempt_pdv'] = 1) then
    summa_exempt_pdv_CurrencyEdit.Enabled := True
  else
    summa_exempt_pdv_CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['is_summa_econ_activ_not_pdv'] = 1) then
    summa_econ_activ_not_pdv_CurrencyEdit.Enabled := True
  else
    summa_econ_activ_not_pdv_CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['is_summa_econ_activ_pdv'] = 1) then
    summa_econ_activ_pdv_CurrencyEdit.Enabled := True
  else
    summa_econ_activ_pdv_CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['is_summa_delivery_not_pdv'] = 1) then
    summa_delivery_not_pdv_CurrencyEdit.Enabled := True
  else
    summa_delivery_not_pdv_CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['is_summa_delivery_pdv'] = 1) then
    summa_delivery_pdv_CurrencyEdit.Enabled := True
  else
    summa_delivery_pdv_CurrencyEdit.Enabled := False;
  end;

end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_20_0_not_pdv_CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
     if summa_20_0_pdv_CurrencyEdit.Enabled then
      begin
       summa_20_0_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_exempt_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_exempt_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_exempt_pdv_CurrencyEdit.Enabled then
      Begin
       summa_exempt_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_econ_activ_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_econ_activ_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_20_0_pdv_CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
     if summa_exempt_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_exempt_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_exempt_pdv_CurrencyEdit.Enabled then
      Begin
       summa_exempt_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_econ_activ_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_econ_activ_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_exempt_not_pdv_CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then YesButton.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_exempt_pdv_CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
      if summa_econ_activ_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_econ_activ_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_econ_activ_pdv_CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Begin
      if summa_delivery_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_exempt_not_pdv_CurrencyEditExit(
  Sender: TObject);
var
  summa         : Double;
  summaout      : Double;
  error_message : string;
  percent       : Double;
  summa_Round   : Double;
begin
  summa := summa_exempt_not_pdv_CurrencyEdit.EditValue*0.2;
  summa := summa*100;
  summa_Round := Round(summa);
  summa := summa_Round/100;
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_PDV_CALCULATION';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SETUP_REESTR').Value := TaxInvoicesDM.ReestrDSet['KOD_SETUP'];
  TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA').Value            := summa_exempt_not_pdv_CurrencyEdit.EditValue;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  summaout := TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_OUT').Value;
  percent  := TaxInvoicesDM.pFIBStoredProc.ParamByName('PERCENT').Value;
  if (Summa = summaout) then
  begin
    summa_exempt_pdv_CurrencyEdit.EditValue := summa;
  end
  else
  begin
    {error_message := ' "Звільнені від оподакув. сума ПДВ" не збігається! Довідник НДС = '+ FloatToStr(summaout)+' 20% = '+ FloatToStr(summa);
    TiShowMessage('Увага!',error_message,mtWarning,[mbOK]);
    summa_exempt_pdv_CurrencyEdit.EditValue := 0;  }
    error_message := 'процент ПДВ не співпадає з 20%! процент ПДВ згідно Довідника НДС = '+ FloatToStr(percent)+' Продовжити?';
    if (TiShowMessage('Увага!',error_message,mtWarning,[mbYes,mbNo])) = mrNo then
      summa_exempt_pdv_CurrencyEdit.EditValue := 0
    else
      summa_exempt_pdv_CurrencyEdit.EditValue := summa;
  end;

end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_econ_activ_not_pdv_CurrencyEditExit(
  Sender: TObject);
var
  summa         : Double;
  summaout      : Double;
  error_message : string;
  percent       : Double;
  summa_Round   : Double;
begin
  summa := summa_econ_activ_not_pdv_CurrencyEdit.EditValue*0.2;
  summa := summa*100;
  summa_Round := Round(summa);
  summa := summa_Round/100;
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_PDV_CALCULATION';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SETUP_REESTR').Value := TaxInvoicesDM.ReestrDSet['KOD_SETUP'];
  TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA').Value            := summa_econ_activ_not_pdv_CurrencyEdit.EditValue;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  summaout := TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_OUT').Value;
  percent  := TaxInvoicesDM.pFIBStoredProc.ParamByName('PERCENT').Value;
  if (Summa = summaout) then
  begin
    summa_econ_activ_pdv_CurrencyEdit.EditValue := summa;
  end
  else
  begin
    {error_message := '"Які не призн. для викор. у госп. д. сума ПДВ" не збігається! Довідник НДС = '+ FloatToStr(summaout)+' 20% = '+ FloatToStr(summa);
    TiShowMessage('Увага!',error_message,mtWarning,[mbOK]);
    summa_econ_activ_pdv_CurrencyEdit.EditValue := 0;}
    error_message := 'процент ПДВ не співпадає з 20%! процент ПДВ згідно Довідника НДС = '+ FloatToStr(percent)+' Продовжити?';
    if (TiShowMessage('Увага!',error_message,mtWarning,[mbYes,mbNo])) = mrNo then
      summa_econ_activ_pdv_CurrencyEdit.EditValue := 0
    else
      summa_econ_activ_pdv_CurrencyEdit.EditValue := summa;
  end;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_delivery_not_pdv_CurrencyEditExit(
  Sender: TObject);
var
  summa         : Double;
  summaout      : Double;
  error_message : string;
  percent       : Double;
  summa_Round       : Double;
begin
  summa := summa_delivery_not_pdv_CurrencyEdit.EditValue*0.2;
  summa := summa*100;
  summa_Round := Round(summa);
  summa := summa_Round/100;
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_PDV_CALCULATION';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SETUP_REESTR').Value := TaxInvoicesDM.ReestrDSet['KOD_SETUP'];
  TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA').Value            := summa_delivery_not_pdv_CurrencyEdit.EditValue;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  summaout := TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_OUT').Value;
  percent  := TaxInvoicesDM.pFIBStoredProc.ParamByName('PERCENT').Value;
  if (Summa = summaout) then
  begin
    summa_delivery_pdv_CurrencyEdit.EditValue := summa;
  end
  else
  begin
    {error_message := '"Для поставки послуг сума ПДВ" не збігається! Довідник НДС = '+ FloatToStr(summaout)+' 20% = '+ FloatToStr(summa);
    TiShowMessage('Увага!',error_message,mtWarning,[mbOK]);
    summa_delivery_pdv_CurrencyEdit.EditValue := 0; }
    error_message := 'процент ПДВ не співпадає з 20%! процент ПДВ згідно Довідника НДС = '+ FloatToStr(percent)+' Продовжити?';
    if (TiShowMessage('Увага!',error_message,mtWarning,[mbYes,mbNo])) = mrNo then
      summa_delivery_pdv_CurrencyEdit.EditValue := 0
    else
      summa_delivery_pdv_CurrencyEdit.EditValue := summa;
  end;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_exempt_not_pdvCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin 
     if summa_exempt_pdv_CurrencyEdit.Enabled then
      Begin
       summa_exempt_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_econ_activ_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_econ_activ_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_delivery_not_pdv_CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Begin
      if summa_delivery_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddOtrNaklForm.summa_econ_activ_not_pdv_CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
      if summa_econ_activ_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddOtrNaklForm.NumNaklTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then DateVipDateEdit.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.DateOtrDateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then IPNProviderTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.ProviderButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
     if summa_20_0_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_20_0_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_20_0_pdv_CurrencyEdit.Enabled then
      begin
       summa_20_0_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_exempt_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_exempt_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_exempt_pdv_CurrencyEdit.Enabled then
      Begin
       summa_exempt_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
     if summa_econ_activ_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_econ_activ_pdv_CurrencyEdit.Enabled then
      begin
       summa_econ_activ_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_not_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_not_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      if summa_delivery_pdv_CurrencyEdit.Enabled then
      begin
       summa_delivery_pdv_CurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddOtrNaklForm.IPNProviderTextEditKeyPress(
  Sender: TObject; var Key: Char);
var
  id_customer :Integer;
begin
 if Key = #13 then
 begin
   if(IPNProviderTextEdit.Text<>'') then
   begin
     TaxInvoicesDM.CustomerDSet.Close;
     TaxInvoicesDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO_IPN(:NALOG_NOM)';
     TaxInvoicesDM.CustomerDSet.ParamByName('NALOG_NOM').Value := IPNProviderTextEdit.Text;
     TaxInvoicesDM.CustomerDSet.Open;
     if not (TaxInvoicesDM.CustomerDSet['ID_CUSTOMER'] = null) then
      begin
        id_Customer := TaxInvoicesDM.CustomerDSet['ID_CUSTOMER'];
        TaxInvoicesDM.CustomerDSet.Close;
        TaxInvoicesDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
        TaxInvoicesDM.CustomerDSet.ParamByName('id').Value := id_Customer;
        TaxInvoicesDM.CustomerDSet.Open;
        PParameter.Id_Customer   := id_Customer;
        //PParameter.Name_Customer := TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER'];
        PParameter.IPNCustomer   := TaxInvoicesDM.CustomerDSet['NALOG_NOM'];
        ProviderButtonEdit.Text  := TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER'];
        IPNProviderTextEdit.Text := TaxInvoicesDM.CustomerDSet['NALOG_NOM'];
        if ((TaxInvoicesDM.CustomerDSet['full_name_customer'] = '') or (TaxInvoicesDM.CustomerDSet['full_name_customer']=null))then
        begin
          replaceAbreviatures(TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER']);
          FullNameCheckBox.Checked   := True;
          FullNameMemo.Properties.ReadOnly      := False;
          SaveFullNameButton.Visible := True;
          PParameter.Name_Customer   := '';
        end
        else
        begin
          FullNameMemo.Text := TaxInvoicesDM.CustomerDSet['full_name_customer'];
          PParameter.Name_Customer := TaxInvoicesDM.CustomerDSet['full_name_customer'];
          FullNameCheckBox.Checked   := False;
          FullNameMemo.Properties.ReadOnly      := True;
          SaveFullNameButton.Visible := False;
        end;

        ProviderButtonEdit.SetFocus;
      end
     else
     begin
       TiShowMessage('Увага!','Немає покупця з таким ІПН!', mtError, [mbYes]);
       ProviderButtonEdit.Text := '';
     end;
   end
   else
    ProviderButtonEdit.SetFocus;
 end;

end;

procedure TTITaxInvoicesAddOtrNaklForm.FormActivate(Sender: TObject);
begin
  NumNaklTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.NumOrderTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then NumNaklTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.DateVipDateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then DateOtrDateEdit.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.KodButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then IPNProviderTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.TypeDocumentButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then IPNProviderTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.IsKorigCheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then IsExpansionCheckBox.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.IsExpansionCheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
  YesButton.SetFocus;
end;

procedure TTITaxInvoicesAddOtrNaklForm.SaveFullNameButtonClick(
  Sender: TObject);
begin

  if (FullNameMemo.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть повну назву постачальника!',mtWarning,[mbOK]);
   FullNameMemo.SetFocus;
   Exit;
  end;

  if (ProviderButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Спочатку оберіть постачальника!',mtWarning,[mbOK]);
   ProviderButtonEdit.SetFocus;
   Exit;
  end;


  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_NAME_UPD';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('id_customer').Value := PParameter.Id_Customer;
  TaxInvoicesDM.pFIBStoredProc.ParamByName('full_name_customer').Value := FullNameMemo.Text;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;

  FullNameCheckBox.Checked      := False;
  FullNameMemo.Properties.ReadOnly         := True;
  SaveFullNameButton.Visible    := False;
  PParameter.Name_Customer      := FullNameMemo.Text;

end;

procedure TTITaxInvoicesAddOtrNaklForm.replaceAbreviatures(
  short_name: string);
var
  i : Integer;
  short_name_abbreviature : string;
  long_name_abbreviature : string;
  p : Integer;
begin
  TaxInvoicesDM.AbbreviatureDSet.Close;
  TaxInvoicesDM.AbbreviatureDSet.SelectSQL.Text := 'select * from TI_SP_ABBREVIATIONS';
  TaxInvoicesDM.AbbreviatureDSet.Open;
  TaxInvoicesDM.AbbreviatureDSet.FetchAll;
  TaxInvoicesDM.AbbreviatureDSet.First;
  //ShowMessage(IntToStr(TaxInvoicesEditDM.AbbreviatureDSet.RecordCount));
  for i:=1 to TaxInvoicesDM.AbbreviatureDSet.RecordCount do
  begin
   short_name_abbreviature := TaxInvoicesDM.AbbreviatureDSet['short_name'];
   long_name_abbreviature := TaxInvoicesDM.AbbreviatureDSet['long_name'];

   if Pos(short_name_abbreviature,short_name)<>0 then
   begin
     p :=Pos(short_name_abbreviature,short_name);
     if (p=1) then      //если стоит в начале строки
     begin
       if(short_name[p+Length(short_name_abbreviature)] = ' ') then
       begin
         Delete(short_name,1,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,p);
       end;

     end;

     if (p = (Length(short_name) - Length(short_name_abbreviature)+1)) then   //в конце строки
     begin
       if(short_name[p-1] = ' ') then
       begin
         Delete(short_name,p,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,1);
       end;
     end;


     if ((p<>1) and (p <> (Length(short_name) - Length(short_name_abbreviature)+1))) then  //если в середине
     begin
      if((short_name[p-1] = ' ') and (short_name[p+Length(short_name_abbreviature)] = ' '))then
       begin
         Delete(short_name,p,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,p);
       end;
     end;
   end;
   TaxInvoicesDM.AbbreviatureDSet.Next;
  end;
  full_name_customer := short_name;
  FullNameMemo.Text := full_name_customer;
end;

procedure TTITaxInvoicesAddOtrNaklForm.FullNameCheckBoxClick(
  Sender: TObject);
begin
  FullNameMemo.Properties.ReadOnly := not(FullNameCheckBox.Checked);
  SaveFullNameButton.Visible := FullNameCheckBox.Checked;
end;

procedure TTITaxInvoicesAddOtrNaklForm.NumOrderTextEditExit(
  Sender: TObject);
begin
//  NumNaklTextEdit.Text := NumOrderTextEdit.Text;
end;

procedure TTITaxInvoicesAddOtrNaklForm.FullNameMemoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Repaint;
end;

procedure TTITaxInvoicesAddOtrNaklForm.ToolButton_addClick(
  Sender: TObject);
var
  Add            : Variant;
  cnt,i          : Integer;
  id_adding_flag : Integer;
  id_smeta       : Int64;
  id_dt_smet     : Int64;
  sum_All_Nds      : Double;
  sum_All_Not_NDS  : Double;
  num_st : string;
begin
 id_adding_flag:=1;

  Add := LoadDogManedger.AddKosht(self,TaxInvoicesDM.DB.Handle,-1,1,0,0,0,0,0,date);
  if VarArrayDimCount(Add) > 0 then
  begin
      {
      Cnt := VarArrayHighBound(Add, 1);
       Проверка, есть ли однаковые разделы, кеквы, статьи }

      i:=0;
      TaxInvoicesDM.RxMemoryData_smet.First;
      while (not TaxInvoicesDM.RxMemoryData_smet.Eof) do
       begin
        if ((TaxInvoicesDM.RxMemoryData_smet['id_smet']=Add[i][7]) And
            (TaxInvoicesDM.RxMemoryData_smet['id_razd']=Add[i][8]) And
            (TaxInvoicesDM.RxMemoryData_smet['id_stat']=Add[i][9]) And
            (TaxInvoicesDM.RxMemoryData_smet['id_kekv']=Add[i][10])) then
         begin
          //MessageBox(0,'Found','Update',MB_OK);
          TaxInvoicesDM.RxMemoryData_smet.Open;
          TaxInvoicesDM.RxMemoryData_smet.Edit;
          TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3]+TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value;

          TaxInvoicesDM.RxMemoryData_smet.Post;
          Break;
         end;
         TaxInvoicesDM.RxMemoryData_smet.next;
       end;

      //DoCheckBgt(Add[i][7],rate_acc_un);

      if id_adding_flag = 1 then
      begin
      for i := 0 to Cnt do
      begin
      //id_smeta := Add[i][7];
      //id_dt_smet := TaxInvoicesDM.RxMemoryData_smet.FieldByName('id').AsVariant;
      TaxInvoicesDM.RxMemoryData_smet.Locate('id', id_dt_smet, []);
      TaxInvoicesDM.RxMemoryData_smet.Open;
      TaxInvoicesDM.RxMemoryData_smet.Insert;
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_smet').Value := Add[i][7];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_razd').Value := Add[i][8];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_stat').Value := Add[i][9];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_razd').Value := Add[i][5];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value := Add[i][6];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_kekv').Value := Add[i][10];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_kekv').Value := Add[i][11];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('id').Value := 0;
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
      TaxInvoicesDM.RxMemoryData_smet.FieldByName('is_lgota').Value := 0;
      TaxInvoicesDM.RxMemoryData_smet.Post;
    end;
    end;

    TaxInvoicesDM.RxMemoryData_smet.First;
    sum_All_Nds     := 0;
    sum_All_Not_NDS := 0;
    for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount-1 do
    begin
      if TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
        sum_All_Nds     := sum_All_Nds + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value
      else
        sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
      TaxInvoicesDM.RxMemoryData_smet.Next;
    end;
    LabelPDV.Caption := FloatToStr(sum_All_Nds);
    LabelNotPDV.Caption := FloatToStr(sum_All_Not_NDS);
  end;
end;

procedure TTITaxInvoicesAddOtrNaklForm.SpeedButton_redClick(
  Sender: TObject);
var
  Add: Variant;
  cnt,i: Integer;
  id_adding_flag:Integer;
  id_smeta : Int64;
  id_dt_smet : Int64;
  summa_old_Not_NDS : Double;
  summa_old_NDS     : Double;
  sum_All_Nds         : Double;
  sum_All_Not_NDS     : Double;
begin
  if TaxInvoicesDM.RxMemoryData_smet.RecordCount = 0 then Exit;

   Add := LoadDogManedger.AddKosht(self,TaxInvoicesDM.DB.Handle,-1,2,
                                   TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_smet').AsInteger,
                                   TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_razd').AsInteger,
                                   TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_stat').AsInteger,
                                   TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_kekv').AsInteger,
                                   TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency,date);
      if VarArrayDimCount(Add) > 0 then
      begin
        i:=0;
        TaxInvoicesDM.RxMemoryData_smet.Open;
        TaxInvoicesDM.RxMemoryData_smet.edit;
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_smet').Value   := Add[i][7];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_razd').Value   := Add[i][8];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_stat').Value   := Add[i][9];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := Add[i][3];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_razd').Value    := Add[i][5];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value    := Add[i][6];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := Add[i][10];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := Add[i][11];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('id').Value := 0;
        TaxInvoicesDM.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
        TaxInvoicesDM.RxMemoryData_smet.Post;
      end;

    TaxInvoicesDM.RxMemoryData_smet.First;
    sum_All_Nds     := 0;
    sum_All_Not_NDS := 0;
    for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount-1 do
    begin
      if TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
        sum_All_Nds     := sum_All_Nds + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value
      else
        sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
      TaxInvoicesDM.RxMemoryData_smet.Next;
    end;
    LabelPDV.Caption := FloatToStr(sum_All_Nds);
    LabelNotPDV.Caption := FloatToStr(sum_All_Not_NDS);

end;

procedure TTITaxInvoicesAddOtrNaklForm.ToolButton_delClick(
  Sender: TObject);
var
  summa_old_Not_NDS : Double;
  summa_old_NDS     : Double;
  summa_NDS         : Double;
  summa_Not_NDS     : Double;
begin
  if TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
    begin
      summa_NDS := TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;
    end
  else
      summa_Not_NDS := TaxInvoicesDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;
  if (TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300') then
    begin
      summa_old_NDS := StrToFloat(LabelPDV.caption);
      LabelPDV.caption := FloatToStr(summa_old_NDS - summa_NDS);
    end
  else
    begin
      summa_old_Not_NDS := StrToFloat(LabelNotPDV.caption);
      LabelNotPDV.caption := FloatToStr(summa_old_Not_NDS - summa_Not_NDS);
    end;

  if TaxInvoicesDM.RxMemoryData_smet.RecordCount = 0 then Exit;
  //сделаешь проверку не упал ли пользователь на клаву
  TaxInvoicesDM.RxMemoryData_smet.Delete;
end;


procedure TTITaxInvoicesAddOtrNaklForm.RxMemoryData_smetAfterScroll(
  DataSet: TDataSet);
begin
  Label21.Caption := TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label22.Caption := TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label23.Caption := TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label26.Caption := TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label21.Hint := TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label21.ShowHint := true;
  Label22.Hint := TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label22.ShowHint := true;
  Label23.Hint := TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label23.ShowHint := true;
  Label26.Hint := TaxInvoicesDM.RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label26.ShowHint := true;
end;

procedure TTITaxInvoicesAddOtrNaklForm.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
  cxGrid1DBTableView1DBColumn1.EditValue:=not(cxGrid1DBTableView1DBColumn1.EditValue);
  if (cxGrid1DBTableView1DBColumn1.EditValue=true) then
    TaxInvoicesDM.RxMemoryData_smet.FieldByName('IS_LGOTA').Value := 1
  else
    TaxInvoicesDM.RxMemoryData_smet.FieldByName('IS_LGOTA').Value := 0;
end;

procedure TTITaxInvoicesAddOtrNaklForm.Oznaka1CheckBoxClick(
  Sender: TObject);
begin
  Oznaka1TextEdit.Enabled := Oznaka1CheckBox.Checked;
end;

procedure TTITaxInvoicesAddOtrNaklForm.Oznaka2CheckBoxClick(
  Sender: TObject);
begin
  Oznaka2TextEdit.Enabled := Oznaka2CheckBox.Checked;
end;

end.
