unit ImportBanktoReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDBEdit, cxLabel, cxProgressBar,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ibase,TiMessages,TiCommonTypes,cxTL, cxClasses,
  cxDBData, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage,  DB,  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel,   cxGridCustomView, cxGrid,
  ExtCtrls, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery,TiCommonProc,  pFIBStoredProc,
  ActnList, cxCalendar,   cxImage, cxCheckBox,ImportBankData,TiWaitForm,
  cxDropDownEdit,LoadDogManedger,dogLoaderUnit, LoaderUnit,GlobalSpr,
  cxRadioGroup;

type TTaxInvocesUser = record
 id_user:Integer;
 name_user:string;
 name_computer:string;
 ip_computer:string;
end;


type TTITaxInvoicesImportBank = record
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
  id_sch            : Integer;
  sch_title         : string;
  id_dog            : Integer; // договор, выбранный пользователем при фильтре
end;

type
  TImportBankReestrForm = class(TForm)
    BankSchetGroup: TGroupBox;
    BankSchetEdit: TcxButtonEdit;
    ImportPanel: TGroupBox;
    StartBtn: TcxButton;
    GroupBox1: TGroupBox;
    PeriodLabel: TcxLabel;
    NumReestrLabel: TcxLabel;
    GroupBox2: TGroupBox;
    NaklLabel: TcxLabel;
    CustomerGroupBox: TGroupBox;
    PeriodValLabel: TcxLabel;
    NumReestrValLabel: TcxLabel;
    BankSchetCheckBox: TCheckBox;
    CustomerButtonEdit: TcxButtonEdit;
    CustomerCheckBox: TcxCheckBox;
    DogovorCheckBox: TcxCheckBox;
    DogovorButtonEdit: TcxButtonEdit;
    PeriodGroupBox: TGroupBox;
    ZLabel: TcxLabel;
    POLabel: TcxLabel;
    DateBegDateEdit: TcxDateEdit;
    DateEndDateEdit: TcxDateEdit;
    IPNCustomerTextEdit: TEdit;
    IPNLabel: TLabel;
    Label2: TLabel;
    IsVidNaklRadioButton: TcxRadioButton;
    IsOtrNaklRadioButton: TcxRadioButton;
    GroupBox7: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox3: TGroupBox;
    EducationRadioGroup: TRadioGroup;
    OnlyEducationRadioButton: TRadioButton;
    NotEducationRadioButton: TRadioButton;
    GroupBox6: TGroupBox;
    GroupBox4: TGroupBox;
    StudCityRadioGroup: TRadioGroup;
    OnlyStudCityRadioButton: TRadioButton;
    NotStudCityRadioButton: TRadioButton;
    EducationCheckBox: TCheckBox;
    StudCityCheckBox: TCheckBox;
    PeriodCheckBox: TcxCheckBox;
    procedure CustomerCheckBoxClick(Sender: TObject);
    procedure BankSchetCheckBoxClick(Sender: TObject);
    procedure DogovorCheckBoxClick(Sender: TObject);
    procedure PeriodCheckBoxClick(Sender: TObject);
    procedure CustomerButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure IPNCustomerTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure BankSchetEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DogovorButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure StartBtnClick(Sender: TObject);
    procedure EducationRadioButtonClick(Sender: TObject);
    procedure StudCityRadioButtonClick(Sender: TObject);
    procedure EducationCheckBoxClick(Sender: TObject);
    procedure StudCityCheckBoxClick(Sender: TObject);
  private
    PDb_Handle      : TISC_DB_HANDLE;
    TaxInvoicesUser : TTaxInvocesUser;
    ReestrParamIn : TReestrParam;
    PRes          : Variant;
    PParameter    : TTITaxInvoicesImportBank;
  public
    //kol_vo_Vid_nakl : Integer;
    kol_vo_Otr_nakl : Integer;
    //key_session : Integer;
    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE; ReestrParam:TReestrParam);reintroduce;

    property Res:Variant read PRes;
    property Parameter:TTITaxInvoicesImportBank read PParameter;
  end;

var
  ImportBankReestrForm: TImportBankReestrForm;

implementation

uses ImportBank_DM;

{$R *.dfm}
constructor TImportBankReestrForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ReestrParam:TReestrParam);
//var
 // ImportXMLDM :TimportXMLDM;
begin
  inherited Create(AOwner);
  PDb_Handle := DB_HANDLE;
  ReestrParamIn := ReestrParam;
  PeriodValLabel.Caption := ReestrParamIn.Kod_setup_Reestr;
  NumReestrValLabel.Caption := IntToStr(ReestrParamIn.Num_Reestr);
   //--------------------------------------------------------------------
  ImportBankDM := TImportBankDM.create(AOwner,Db_Handle);
  ImportBankDM.UserDSet.Close;
  ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  ImportBankDM.UserDSet.Open;
  TaxInvoicesUser.id_user       := ImportBankDM.UserDSet['ID_USER'];
  TaxInvoicesUser.name_user     := ImportBankDM.UserDSet['USER_FIO'];
  TaxInvoicesUser.name_computer := ImportBankDM.UserDSet['HOST_NAME'];
  TaxInvoicesUser.ip_computer   := ImportBankDM.UserDSet['IP_ADRESS'];
  //----------------------------------------------------------------------
  BankSchetEdit.Text       := '';
  CustomerButtonEdit.Text  := '';
  DogovorButtonEdit.Text   := '';
  IPNCustomerTextEdit.Text := '';
  DateBegDateEdit.Date    := Now;
  DateEndDateEdit.Date    := Now;

  BankSchetCheckBox.Checked    := False;
  CustomerCheckBox.Checked     := False;
  DogovorCheckBox.Checked      := False;
  PeriodCheckBox.Checked       := True;
  IsVidNaklRadioButton.Checked := True;
  IsOtrNaklRadioButton.Checked := False;

  EducationCheckBox.Checked    := False;
  StudCityCheckBox.Checked     := False;
  EducationRadioGroup.Enabled  := False;
  StudCityRadioGroup.Enabled   := False;

  BankSchetEdit.Enabled       := False;
  CustomerButtonEdit.Enabled  := False;
  DogovorButtonEdit.Enabled   := False;
  //DateBegDateEdit.Enabled     := False;
  //DateEndDateEdit.Enabled     := False;
  IPNCustomerTextEdit.Enabled := False;
  IPNCustomerTextEdit.Color   := clBtnFace;
  IsVidNaklRadioButton.Enabled := False;
  IsOtrNaklRadioButton.Enabled := False;
  OnlyEducationRadioButton.Enabled := False;
  NotEducationRadioButton.Enabled  := False;
  OnlyStudCityRadioButton.Enabled  := False;
  NotStudCityRadioButton.Enabled   := False;
  //--------------------------------------------------------------------
  Caption := 'Імпорт накладних з системи "Банк"';

end;


procedure TImportBankReestrForm.CustomerCheckBoxClick(Sender: TObject);
begin
  CustomerButtonEdit.Enabled  := CustomerCheckBox.Checked;
  IPNCustomerTextEdit.Enabled := CustomerCheckBox.Checked;

  if (CustomerCheckBox.Checked = true) then
    IPNCustomerTextEdit.Color := clWhite
  else
    IPNCustomerTextEdit.Color := clBtnFace;
end;

procedure TImportBankReestrForm.BankSchetCheckBoxClick(Sender: TObject);
begin
  BankSchetEdit.Enabled         := BankSchetCheckBox.Checked;
  IsVidNaklRadioButton.Enabled  := BankSchetCheckBox.Checked;
  IsOtrNaklRadioButton.Enabled  := BankSchetCheckBox.Checked;

  if BankSchetCheckBox.Checked = true then
    DogovorCheckBox.Checked := False;

end;

procedure TImportBankReestrForm.DogovorCheckBoxClick(Sender: TObject);
begin
  DogovorButtonEdit.Enabled := DogovorCheckBox.Checked;
  if DogovorCheckBox.Checked= True then
  begin
    EducationCheckBox.Checked := False;
    StudCityCheckBox.Checked := False;
    OnlyEducationRadioButton.Enabled := False;
    OnlyStudCityRadioButton.Enabled := False;
    NotEducationRadioButton.Enabled := False;
    NotStudCityRadioButton.Enabled := False;
  end;  
end;

procedure TImportBankReestrForm.PeriodCheckBoxClick(Sender: TObject);
begin
  DateBegDateEdit.Enabled := PeriodCheckBox.Checked;
  DateEndDateEdit.Enabled := PeriodCheckBox.Checked;
end;

procedure TImportBankReestrForm.CustomerButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
 id_Customer:Integer;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(ImportBankDM.DB.Handle);
 i['FormStyle']    := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := selCustomer;
 i['id_cistomer']  := -1;
 i['show_all']     := 1;
 LoadSysData(ImportBankDM.ReadTransaction);
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);

  if o['ModalResult'] = mrOk then
  begin
   id_Customer := o['ID_CUSTOMER'];
   ImportBankDM.CustomerDSet.Close;
   ImportBankDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
   ImportBankDM.CustomerDSet.ParamByName('id').Value := id_Customer;
   ImportBankDM.CustomerDSet.Open;

   PParameter.Id_Customer   := id_Customer;
   //PParameter.Name_Customer := TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER'];
   PParameter.IPNCustomer   := ImportBankDM.CustomerDSet['NALOG_NOM'];
   CustomerButtonEdit.Text  := ImportBankDM.CustomerDSet['NAME_CUSTOMER'];
   IPNCustomerTextEdit.Text := ImportBankDM.CustomerDSet['NALOG_NOM'];

  end;
  i.Free;
  o.Free;
end;

procedure TImportBankReestrForm.IPNCustomerTextEditKeyPress(
  Sender: TObject; var Key: Char);
var
  id_customer :Integer;
begin
 if Key = #13 then
 begin
   if(IPNCustomerTextEdit.Text<>'') then
   begin
     ImportBankDM.CustomerDSet.Close;
     ImportBankDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO_IPN(:NALOG_NOM)';
     ImportBankDM.CustomerDSet.ParamByName('NALOG_NOM').Value := IPNCustomerTextEdit.Text;
     ImportBankDM.CustomerDSet.Open;
     if not (ImportBankDM.CustomerDSet['ID_CUSTOMER'] = null) then
      begin
        id_Customer := ImportBankDM.CustomerDSet['ID_CUSTOMER'];
        ImportBankDM.CustomerDSet.Close;
        ImportBankDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
        ImportBankDM.CustomerDSet.ParamByName('id').Value := id_Customer;
        ImportBankDM.CustomerDSet.Open;
        PParameter.Id_Customer   := id_Customer;
        //PParameter.Name_Customer := TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER'];
        PParameter.IPNCustomer   := ImportBankDM.CustomerDSet['NALOG_NOM'];
        CustomerButtonEdit.Text  := ImportBankDM.CustomerDSet['NAME_CUSTOMER'];
        IPNCustomerTextEdit.Text := ImportBankDM.CustomerDSet['NALOG_NOM'];

        CustomerButtonEdit.SetFocus;
      end
     else
     begin
       TiShowMessage('Увага!','Немає покупця з таким ІПН!', mtError, [mbYes]);
       CustomerButtonEdit.Text := '';
     end;
   end
   else
     CustomerButtonEdit.SetFocus
 end;
end;

procedure TImportBankReestrForm.BankSchetEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 schet :variant;
begin
  schet := GlobalSpr.GetSch(self, ImportBankDM.DB.Handle, fsStayOnTop, Now, DEFAULT_ROOT_ID, 0, 0);
  if VarArrayDimCount(schet)=1 then
  begin
    PParameter.id_sch    := schet[0][0];
    PParameter.sch_title := schet[0][1];
    BankSchetEdit.Text   := schet[0][3] +' '+ schet[0][1];
    {sch_type   := schet[0][2];
    sch_number := schet[0][3];
    sch_system := schet[0][4]; }
  end;
end;

procedure TImportBankReestrForm.DogovorButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 dogovor: TDogResult;
 input : TDogInput;
 id_rate_acc: Int64;
 DataSet_Bank : TpFIBDataSet;
 id_group_dog : Integer;
begin
 ImportBankDM.WriteTransaction.StartTransaction;
 ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_RETURN_ID_GROUP_DOG';
 ImportBankDM.pFIBStoredProc.ExecProc;
 ImportBankDM.WriteTransaction.Commit;
 id_group_dog := ImportBankDM.pFIBStoredProc.ParamByName('ID_GROUP_DOG').AsInt64;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := ImportBankDM.DB.Handle;
 input.ReadTrans    := ImportBankDM.ReadTransaction.Handle;
 input.WriteTrans   := ImportBankDM.WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.isZayav      := false;
 input.id_Group_add := 1299; // выбрана пока что касса банк
 input.id_Group     := 1299; // выбрана пока что касса банк
 dogovor            := ShowDogMain(input);
 PParameter.id_dog  :=  dogovor.id_dog;
end;

procedure TImportBankReestrForm.StartBtnClick(Sender: TObject);
var
  ViewForm : TImportBankForm;
  id_dog_studCity: Integer;
  id_dog_education : Integer;
  i                : Integer;
  KEY_SESSION      : Int64;
  wf               : TForm;
begin
  if (BankSchetCheckBox.Checked = True) then
  begin
    if (BankSchetEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть банківський рахунок або зніміть галочку!',mtWarning,[mbOK]);
      BankSchetEdit.SetFocus;
      Exit;
    end;
  end;

  if (CustomerCheckBox.Checked = True) then
  begin
    if (IPNCustomerTextEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть податковий номер контрагента або зніміть галочку!',mtWarning,[mbOK]);
      IPNCustomerTextEdit.SetFocus;
      Exit;
    end;

    if (CustomerButtonEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть контрагента або зніміть галочку!',mtWarning,[mbOK]);
      CustomerButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (DogovorCheckBox.Checked = True) then
  begin
    if (DogovorButtonEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть договір або зніміть галочку!',mtWarning,[mbOK]);
      DogovorButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (PeriodCheckBox.Checked = True) then
  begin
    if (DateBegDateEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть початок періоду або зніміть галочку!',mtWarning,[mbOK]);
      DateBegDateEdit.SetFocus;
      Exit;
    end;

    if (DateEndDateEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть кінець періоду або зніміть галочку!',mtWarning,[mbOK]);
      DateEndDateEdit.SetFocus;
      Exit;
    end;
  end;

  KEY_SESSION := ImportBankDM.DSet.Database.Gen_Id('GEN_TI_KEY_SESSION_BUF', 1);

  //--------------------------ОТБОР ДАННЫХ------------------------------
  wf := ShowWaitForm(Application.MainForm,wfPrepareData);
  ImportBankDM.BankDocDSet.Close;
  ImportBankDM.BankDocDSet.SelectSQL.Text := 'select * from TI_GET_BASE_DOCS(:CHECK_FLAG_BAL_SCH,:FILTER_VALUE_BAL_SCH,:CHECK_FLAG_BAL_SCH_IS_DB, :CHECK_FLAG_PERIOD,:FILTER_PERIOD_BEG,:FILTER_PERIOD_END,:CHECK_FLAG_CUSTOMER,:FILTER_ID_CUSTOMER,:CHECK_ID_DOG,:FILTER_ID_DOG, :KEY_SESSION)';

  if (BankSchetCheckBox.checked = True) then
  begin
    ImportBankDM.BankDocDSet.ParamByName('CHECK_FLAG_BAL_SCH').Value   := 1;
    ImportBankDM.BankDocDSet.ParamByName('FILTER_VALUE_BAL_SCH').Value := PParameter.id_sch;
    if (IsVidNaklRadioButton.Checked)then
    begin
      ImportBankDM.BankDocDSet.ParamByName('CHECK_FLAG_BAL_SCH_IS_DB').Value   := 1
    end
    else
      ImportBankDM.BankDocDSet.ParamByName('CHECK_FLAG_BAL_SCH_IS_DB').Value   := 0;
  end
  else
  begin
    ImportBankDM.BankDocDSet.ParamByName('CHECK_FLAG_BAL_SCH').Value   := 0;
    ImportBankDM.BankDocDSet.ParamByName('FILTER_VALUE_BAL_SCH').Value := 0;
  end;

  if (PeriodCheckBox.Checked = True) then
  begin
    ImportBankDM.BankDocDSet.ParamByName('CHECK_FLAG_PERIOD').Value   := 1;
    ImportBankDM.BankDocDSet.ParamByName('FILTER_PERIOD_BEG').Value   := DateBegDateEdit.Date;
    ImportBankDM.BankDocDSet.ParamByName('FILTER_PERIOD_END').Value   := DateEndDateEdit.Date;
  end
  else
    ImportBankDM.BankDocDSet.ParamByName('CHECK_FLAG_PERIOD').Value   := 0;

  if (CustomerCheckBox.Checked = True) then
  begin
    ImportBankDM.BankDocDSet.ParamByName('CHECK_FLAG_CUSTOMER').Value := 1;
    ImportBankDM.BankDocDSet.ParamByName('FILTER_ID_CUSTOMER').Value  := PParameter.Id_Customer;
  end
  else
    ImportBankDM.BankDocDSet.ParamByName('CHECK_FLAG_CUSTOMER').Value   := 0;

  if (DogovorCheckBox.Checked = True) then
  begin
    ImportBankDM.BankDocDSet.ParamByName('CHECK_ID_DOG').Value := 1;
    ImportBankDM.BankDocDSet.ParamByName('FILTER_ID_DOG').Value  := PParameter.id_dog;
  end
  else
    ImportBankDM.BankDocDSet.ParamByName('CHECK_ID_DOG').Value   := 0;

  if ((OnlyEducationRadioButton.Checked = true) and (OnlyEducationRadioButton.Enabled)) then
  begin
    ImportBankDM.DSet.Close;
    ImportBankDM.DSet.SelectSQL.Text := 'select GLOBAL_ID_DOG from CN_DT_ACCOUNTS_INI';
    ImportBankDM.DSet.Open;
    if (ImportBankDM.DSet.IsEmpty = False) then
    begin
      id_dog_education := ImportBankDM.DSet['GLOBAL_ID_DOG'];
      ImportBankDM.BankDocDSet.ParamByName('CHECK_ID_DOG').Value := 1;
      ImportBankDM.BankDocDSet.ParamByName('FILTER_ID_DOG').Value  := id_dog_education;
    end
    else
    begin
      TiShowMessage('Увага!','Інформація про договір навчання потребує налаштування!',mtWarning,[mbOK]);
    end;
  end;

  if ((OnlyStudCityRadioButton.Checked = true) and (OnlyStudCityRadioButton.Enabled = True)) then
  begin
    ImportBankDM.DSet.Close;
    ImportBankDM.DSet.SelectSQL.Text := 'select GLOBAL_ID_DOG from ST_INI';
    ImportBankDM.DSet.Open;
    if (ImportBankDM.DSet.IsEmpty = False) then
    begin
      id_dog_studCity := ImportBankDM.DSet['GLOBAL_ID_DOG'];
      ImportBankDM.BankDocDSet.ParamByName('CHECK_ID_DOG').Value  := 1;
      ImportBankDM.BankDocDSet.ParamByName('FILTER_ID_DOG').Value := id_dog_studCity;
    end
    else
    begin
      TiShowMessage('Увага!','Інформація про договір студмістечка потребує налаштування!',mtWarning,[mbOK]);
      Exit;
    end;
  end;

  if (NotEducationRadioButton.Checked = True) and (NotEducationRadioButton.Enabled = True) then
  begin
    ImportBankDM.DSet.Close;
    ImportBankDM.DSet.SelectSQL.Text := 'select GLOBAL_ID_DOG from CN_DT_ACCOUNTS_INI';
    ImportBankDM.DSet.Open;
    if (ImportBankDM.DSet.IsEmpty = False) then
    begin
      id_dog_education := ImportBankDM.DSet['GLOBAL_ID_DOG'];
      ImportBankDM.BankDocDSet.ParamByName('CHECK_ID_DOG').AsInteger := StrToInt('-1');
      ImportBankDM.BankDocDSet.ParamByName('FILTER_ID_DOG').Value  := id_dog_education;
    end
    else
    begin
      TiShowMessage('Увага!','Інформація про договір навчання потребує налаштування!',mtWarning,[mbOK]);
    end;
  end;

  if ((NotStudCityRadioButton.Checked = true) and (NotStudCityRadioButton.Enabled = True)) then
  begin
    ImportBankDM.DSet.Close;
    ImportBankDM.DSet.SelectSQL.Text := 'select GLOBAL_ID_DOG from ST_INI';
    ImportBankDM.DSet.Open;
    if (ImportBankDM.DSet.IsEmpty = False) then
    begin
      id_dog_studCity := ImportBankDM.DSet['GLOBAL_ID_DOG'];
      ImportBankDM.BankDocDSet.ParamByName('CHECK_ID_DOG').AsInteger := StrToInt('-1');
      ImportBankDM.BankDocDSet.ParamByName('FILTER_ID_DOG').Value    := id_dog_studCity;
    end
    else
    begin
      TiShowMessage('Увага!','Інформація про договір студмістечка потребує налаштування!',mtWarning,[mbOK]);
      Exit;
    end;
  end;

  ImportBankDM.BankDocDSet.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
  //ImportBankDM.BankDocDSet.ParamByName('IS_INSERT').AsInt64   := 0;

  ImportBankDM.BankDocDSet.Open;

  if (ImportBankDM.BankDocDSet.IsEmpty = False) then
  begin
    ImportBankDM.BankDocMemoryData.EmptyTable;
    ImportBankDM.BankDocMemoryData.Open;

    ImportBankDM.BankDocDSet.FetchAll;
    ImportBankDM.BankDocDSet.First;


    ImportBankDM.WriteTransaction.StartTransaction;
    for i:= 0 to ImportBankDM.BankDocDSet.RecordCount-1 do
    begin
      // запись в BankDocMemoryData
      ImportBankDM.BankDocMemoryData.Insert;
      ImportBankDM.BankDocMemoryData.FieldByName('PK_ID').AsString := ImportBankDM.BankDocDSet.fieldByName('PK_ID').AsString;
      ImportBankDM.BankDocMemoryData['DATE_REG']       := ImportBankDM.BankDocDSet['DATE_REG'];
      ImportBankDM.BankDocMemoryData['ID_CUSTOMER']    := ImportBankDM.BankDocDSet['ID_CUSTOMER'];
      ImportBankDM.BankDocMemoryData['NUM_DOC']        := ImportBankDM.BankDocDSet['NUM_DOC'];
      ImportBankDM.BankDocMemoryData['DATE_DOC']       := ImportBankDM.BankDocDSet['DATE_DOC'];
      ImportBankDM.BankDocMemoryData['NOTE']           := ImportBankDM.BankDocDSet['NOTE'];
      ImportBankDM.BankDocMemoryData['SUMMA']          := ImportBankDM.BankDocDSet['SUMMA'];
      ImportBankDM.BankDocMemoryData['NAME_CUSTOMER']  := ImportBankDM.BankDocDSet['NAME_CUSTOMER'];
      ImportBankDM.BankDocMemoryData['NALOG_NOM']      := ImportBankDM.BankDocDSet['NALOG_NOM'];
      ImportBankDM.BankDocMemoryData['PRIHOD']         := ImportBankDM.BankDocDSet['PRIHOD'];
      ImportBankDM.BankDocMemoryData['DATE_PROV']      := ImportBankDM.BankDocDSet['DATE_PROV'];
      ImportBankDM.BankDocMemoryData['ID_TYPE_DOC']    := ImportBankDM.BankDocDSet['ID_TYPE_DOC'];
      ImportBankDM.BankDocMemoryData['TYPE_DOC_TITLE'] := ImportBankDM.BankDocDSet['TYPE_DOC_TITLE'];
      ImportBankDM.BankDocMemoryData['IS_SELECT']      := False;  //flag выбора записи
      ImportBankDM.BankDocMemoryData['SUMMA_NDS_DOC']  := 0;
      ImportBankDM.BankDocMemoryData['FLAG_PAST']      := ImportBankDM.BankDocDSet['FLAG_PAST'];
      ImportBankDM.BankDocMemoryData['FLAG_NAKL']      := ImportBankDM.BankDocDSet['FLAG_NAKL'];
      ImportBankDM.BankDocMemoryData['FLAG_ERROR_NDS'] := 0 ;
      ImportBankDM.BankDocMemoryData['DATE_OTR_NAKL']  := ImportBankDM.BankDocDSet['DATE_OTR_NAKL'];

      //подготовка НДС-проводок и полный их отбор
      if ((ImportBankDM.BankDocDSet['PRIHOD']<> -1 ) and (ImportBankDM.BankDocDSet['SUMMA']<> 0))  then
      begin
        ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_PREPARE_BANK_NDS';
        ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64       := StrToInt64(ImportBankDM.BankDocDSet.FieldByName('pk_id').AsString);
        ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').value        := ImportBankDM.BankDocDSet['PRIHOD'];
        ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
        ImportBankDM.pFIBStoredProc.ExecProc;
        ImportBankDM.BankDocMemoryData['SUMMA_NDS_DOC']                := ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_NDS_DOC').value;
        ImportBankDM.BankDocMemoryData['FLAG_ERROR_NDS']               := ImportBankDM.pFIBStoredProc.ParamByName('FLAG_ERROR_NDS').value;
      end;
      ImportBankDM.BankDocMemoryData.Post;

      ImportBankDM.BankDocDSet.Next;
    end;
    ImportBankDM.WriteTransaction.Commit;
    CloseWaitForm(wf);
   { ImportBankDM.BankDocProvNDSDSet.Close;
    ImportBankDM.BankDocProvNDSDSet.SelectSQL.Text  := 'select * from TI_SELECT_ALL_PROVODKA_BANK(?PK_ID, ?PRIHOD, :KEY_SESSION, ?DATE_REG)';
    ImportBankDM.BankDocProvNDSDSet.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
    ImportBankDM.BankDocProvNDSDSet.Open;

    ImportBankDM.BankDocProvNDSDSet.FetchAll;
    ImportBankDM.BankDocProvNDSDSet.First;  }

    ViewForm := TImportBankForm.Create(Self);
    ViewForm.key_session := KEY_SESSION;
    ViewForm.Label7.Caption  := '';
    ViewForm.Label8.Caption  := '';
    ViewForm.Label9.Caption  := '';
    ViewForm.Label11.Caption := '';
    ViewForm.Label6.Caption  := '';
    ViewForm.Label12.Caption := '';
    ViewForm.ShowModal;
  end
  else
  begin
    TiShowMessage('Увага!','За такими параметрами немає інформації!',mtWarning,[mbOK]);
    CloseWaitForm(wf);
  end;

end;

procedure TImportBankReestrForm.EducationRadioButtonClick(Sender: TObject);
begin
  if (EducationCheckBox.Checked = true) then
  begin
    OnlyEducationRadioButton.Enabled := True;
    NotEducationRadioButton.Enabled  := True;
    OnlyStudCityRadioButton.Enabled  := False;
    NotStudCityRadioButton.Enabled   := False;
    StudCityCheckBox.Checked         := False;
  end
  else
  begin
    OnlyEducationRadioButton.Enabled := False;
    NotEducationRadioButton.Enabled  := False;
    OnlyStudCityRadioButton.Enabled  := True;
    NotStudCityRadioButton.Enabled   := True;
    StudCityCheckBox.Checked      := True;
  end;
end;

procedure TImportBankReestrForm.StudCityRadioButtonClick(Sender: TObject);
begin
  if (EducationCheckBox.Checked = true) then
  begin
    OnlyEducationRadioButton.Enabled := True;
    NotEducationRadioButton.Enabled  := True;
    OnlyStudCityRadioButton.Enabled  := False;
    NotStudCityRadioButton.Enabled   := False;
    StudCityCheckBox.Checked      := False;
  end
  else
  begin
    OnlyEducationRadioButton.Enabled := False;
    NotEducationRadioButton.Enabled  := False;
    OnlyStudCityRadioButton.Enabled  := True;
    NotStudCityRadioButton.Enabled   := True;
    StudCityCheckBox.Checked      := True;
  end;
end;

procedure TImportBankReestrForm.EducationCheckBoxClick(Sender: TObject);
begin
  OnlyEducationRadioButton.Enabled := EducationCheckBox.Checked;
  NotEducationRadioButton.Enabled  := EducationCheckBox.Checked;
  if EducationCheckBox.Checked and StudCityCheckBox.Checked then StudCityCheckBox.Checked := false;
  if DogovorCheckBox.Checked and EducationCheckBox.Checked then
   Begin
    DogovorCheckBox.Checked := False;
    DogovorButtonEdit.Enabled := False;
   End;


  {if (EducationCheckBox.Checked = true) then
  begin
    DogovorCheckBox.Checked := False;

    if (StudCityCheckBox.Checked = True)then
    begin
      OnlyEducationRadioButton.Enabled := True;
      NotEducationRadioButton.Enabled  := True;
      OnlyStudCityRadioButton.Enabled  := False;
      NotStudCityRadioButton.Enabled   := False;
      StudCityCheckBox.Checked         := False;
    end;

    if (StudCityCheckBox.Checked = False) then
    begin
      OnlyEducationRadioButton.Enabled := True;
      NotEducationRadioButton.Enabled  := True;
      OnlyStudCityRadioButton.Enabled  := False;
      NotStudCityRadioButton.Enabled   := False;
      StudCityCheckBox.Checked         := False;
    end;

  end
  else
  begin
      if (StudCityCheckBox.Checked = True)then
    begin
      OnlyEducationRadioButton.Enabled := False;
      NotEducationRadioButton.Enabled  := False;
      OnlyStudCityRadioButton.Enabled  := True;
      NotStudCityRadioButton.Enabled   := True;
      StudCityCheckBox.Checked         := True;
    end;

    if (StudCityCheckBox.Checked = False) then
    begin
      OnlyEducationRadioButton.Enabled := False;
      NotEducationRadioButton.Enabled  := False;
      OnlyStudCityRadioButton.Enabled  := False;
      NotStudCityRadioButton.Enabled   := False;
      StudCityCheckBox.Checked         := False;
    end;
  end; }
end;

procedure TImportBankReestrForm.StudCityCheckBoxClick(Sender: TObject);
begin
  OnlyStudCityRadioButton.Enabled := StudCityCheckBox.Checked;
  NotStudCityRadioButton.Enabled  := StudCityCheckBox.Checked;
  if EducationCheckBox.Checked and StudCityCheckBox.Checked then EducationCheckBox.Checked := False;
  if DogovorCheckBox.Checked and StudCityCheckBox.Checked then
   Begin
    DogovorCheckBox.Checked := False;
    DogovorButtonEdit.Enabled := False;
   End;

  
 { if (StudCityCheckBox.Checked = True) then
  begin
    DogovorCheckBox.Checked := False;

    if (EducationCheckBox.Checked = True)then
    begin
      OnlyEducationRadioButton.Enabled := False;
      NotEducationRadioButton.Enabled  := False;
      OnlyStudCityRadioButton.Enabled  := True;
      NotStudCityRadioButton.Enabled   := True;
      EducationCheckBox.Checked        := False;
    end;

    if (EducationCheckBox.Checked = False) then
    begin
      OnlyEducationRadioButton.Enabled := False;
      NotEducationRadioButton.Enabled  := False;
      OnlyStudCityRadioButton.Enabled  := True;
      NotStudCityRadioButton.Enabled   := True;
    end;
  end
  else
  begin
    if (EducationCheckBox.Checked = True)then
    begin
      OnlyEducationRadioButton.Enabled := True;
      NotEducationRadioButton.Enabled  := True;
      OnlyStudCityRadioButton.Enabled  := False;
      NotStudCityRadioButton.Enabled   := False;
    end;

    if (EducationCheckBox.Checked = False) then
    begin
      OnlyEducationRadioButton.Enabled := False;
      NotEducationRadioButton.Enabled  := False;
      OnlyStudCityRadioButton.Enabled  := False;
      NotStudCityRadioButton.Enabled   := False;
    end;
  end;  }
end;

end.
