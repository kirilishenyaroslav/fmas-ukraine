unit TITaxInvoices_AddVidNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxButtons, cxControls, cxGroupBox, cxDBEdit, cxCheckBox, Ibase,
  cxCurrencyEdit,dogLoaderUnit, LoaderUnit,TICommonLoader,TiMessages,Registry,
  ActnList, cxMemo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, Buttons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ExtCtrls, LoadDogManedger,TiCommonStyles;

type TTITaxInvoicesAddVidNakl=record
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
  id_lgota          : Integer;
  Name_lgota        : string;
  id_specialNotes   : Integer;
  Name_specialNotes : string;
  Num_specialnotes  : string;
  oznaka_nakl       : string;
end;

type
  TTITaxInvoicesAddVidNaklForm = class(TForm)
    MainInfoNaklGroupBox: TcxGroupBox;
    TaxLiabilitiesGroupBox: TcxGroupBox;
    CustomerGroupBox: TcxGroupBox;
    SummaGroupBox: TcxGroupBox;
    SignGroupBox: TcxGroupBox;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    DataVidNaklLabel: TcxLabel;
    NumNaklLabel: TcxLabel;
    SummaPDV20Label: TcxLabel;
    SummaTaxable20Label: TcxLabel;
    SummaTaxable0Label: TcxLabel;
    SummaExemptLabel: TcxLabel;
    SummaExportLabel: TcxLabel;
    KodButtonEdit: TcxButtonEdit;
    CustomerButtonEdit: TcxButtonEdit;
    IPNCustomerTextEdit: TcxTextEdit;
    NaklDateEdit: TcxDateEdit;
    NumNaklTextEdit: TcxTextEdit;
    IPNCustomerLabel: TcxLabel;
    IsKorigCheckBox: TcxCheckBox;
    IsExpansionCheckBox: TcxCheckBox;
    IsSignCheckBox: TcxCheckBox;
    InfoReestrGroupBox: TcxGroupBox;
    NumReestrLabel: TcxLabel;
    NumReestrDBTextEdit: TcxDBTextEdit;
    NaklLabel: TcxLabel;
    SummaTaxable20CurrencyEdit: TcxCurrencyEdit;
    SummaPDV20CurrencyEdit: TcxCurrencyEdit;
    SummaTaxable0CurrencyEdit: TcxCurrencyEdit;
    SummaExemptCurrencyEdit: TcxCurrencyEdit;
    SummaExportCurrencyEdit: TcxCurrencyEdit;
    TypeDocumentGroupBox: TcxGroupBox;
    TypeDocumentButtonEdit: TcxButtonEdit;
    PeriodLabel: TcxLabel;
    PeriodDBTextEdit: TcxDBTextEdit;
    NumOrderLabel: TcxLabel;
    NumOrderTextEdit: TcxTextEdit;
    FullNameCheckBox: TCheckBox;
    SaveFullNameButton: TcxButton;
    FullNameMemo: TcxMemo;
    Panel1: TPanel;
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
    Label5: TLabel;
    Label6: TLabel;
    LgotaGroupBox: TGroupBox;
    LgotaCheckBox: TCheckBox;
    LgotaButtonEdit: TcxButtonEdit;
    SpecialNotesCheckBox: TCheckBox;
    OznakaCheckBox: TCheckBox;
    SpecialNotesButtonEdit: TcxButtonEdit;
    OznakaTextEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    SummaDeliveryCurrencyEdit: TcxCurrencyEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure CustomerButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KodButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeDocumentButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure YesButtonClick(Sender: TObject);
    procedure SummaTaxable20CurrencyEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SummaTaxable20CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure SummaPDV20CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure SummaTaxable0CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure SummaExemptCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure SummaExportCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure NumNaklTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure CustomerButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure NumOrderTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure NaklDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure KodButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeDocumentButtonEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure IsKorigCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure IsExpansionCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure IsSignCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure IPNCustomerTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure FullNameCheckBoxClick(Sender: TObject);
    procedure SaveFullNameButtonClick(Sender: TObject);
    procedure NumOrderTextEditExit(Sender: TObject);
    procedure ToolButton_addClick(Sender: TObject);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure SpeedButton_redClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure LgotaCheckBoxClick(Sender: TObject);
    procedure SpecialNotesCheckBoxClick(Sender: TObject);
    procedure OznakaCheckBoxClick(Sender: TObject);
    procedure SpecialNotesButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PRes           : Variant;
    PDb_Handle     : TISC_DB_HANDLE;
    PParameter     : TTITaxInvoicesAddVidNakl;
  public
    full_name_customer :string;
    provodka :Boolean;
    procedure SummaEnabled(id:integer);
    procedure replaceAbreviatures(short_name:string);
    procedure ReadReg;
    procedure WriteReg;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddVidNakl);reintroduce;
    property Res:Variant read PRes;
    property Parameter:TTITaxInvoicesAddVidNakl read PParameter;
  end;

var
  TITaxInvoicesAddVidNaklForm: TTITaxInvoicesAddVidNaklForm;

implementation

uses TITaxInvoicesDM, FIBQuery;

{$R *.dfm}                                

constructor TTITaxInvoicesAddVidNaklForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddVidNakl);
//var i : Integer;
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
  PParameter := AddParametr;
  TaxInvoicesDM.RxMemoryData_smet.AfterScroll := RxMemoryData_smetAfterScroll;

  TaxInvoicesDM.DSet.Close;
  TaxInvoicesDM.DSet.SelectSQL.Text := 'select * from TI_SETTING';
  TaxInvoicesDM.DSet.Open;
  {for i := 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount - 1 do
  TaxInvoicesDM.RxMemoryData_smet.Delete; }
end;                                 

procedure TTITaxInvoicesAddVidNaklForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTITaxInvoicesAddVidNaklForm.CustomerButtonEditPropertiesButtonClick(
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
   CustomerButtonEdit.Text  := TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER'];
   IPNCustomerTextEdit.Text := TaxInvoicesDM.CustomerDSet['NALOG_NOM'];

   if ((TaxInvoicesDM.CustomerDSet['full_name_customer'] = '') or (TaxInvoicesDM.CustomerDSet['full_name_customer']=null))then
   begin
     replaceAbreviatures(TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER']);
     FullNameCheckBox.Checked         := True;
     FullNameMemo.Properties.ReadOnly := False;
     SaveFullNameButton.Visible       := True;
     PParameter.Name_Customer         := '';
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

procedure TTITaxInvoicesAddVidNaklForm.KodButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  PodZob:Variant;
begin
  {Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesDM.DB.Handle;
  Parameter.Owner     := self; }
  PodZob              := LoadTaxLiabilitiesPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TaxLiabilities.bpl','View_TaxLiabilities',1);
  //Parameter.Destroy;
  If VarArrayDimCount(PodZob)>0 then
  begin
    PParameter.id_Kod   := PodZob[0];
    PParameter.Name_Kod := PodZob[1];
    KodButtonEdit.Text  := PodZob[1];
    SummaEnabled(PParameter.id_Kod);
  end;
end;

procedure TTITaxInvoicesAddVidNaklForm.TypeDocumentButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  TypeDoc:Variant;
begin
  TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',2);
  If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.Id_TypeDocument   := TypeDoc[0];
    PParameter.Name_TypeDocument := TypeDoc[1];
    TypeDocumentButtonEdit.Text  := TypeDoc[1];
  end;
end;

procedure TTITaxInvoicesAddVidNaklForm.YesButtonClick(Sender: TObject);
var
  i             : Integer;
  summa_NDS     : Double;
  summa_not_NDS : Double;
  error_period  : string;
  oznaka        : string;
begin
  summa_NDS     := 0;
  summa_not_NDS := 0;
  if (NumOrderTextEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть номер за порядком!',mtWarning,[mbOK]);
   NumOrderTextEdit.SetFocus;
   Exit;
  end;

  if (NaklDateEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату виписки!',mtWarning,[mbOK]);
   NaklDateEdit.SetFocus;
   Exit;
  end;

  if (LgotaCheckBox.Checked = True) then
  begin
    if (LgotaButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть пільгу або зніміть галочку!',mtWarning,[mbOK]);
      LgotaButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (SpecialNotesCheckBox.Checked = True) then
  begin
    if (SpecialNotesButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть особливі примітки або зніміть галочку!',mtWarning,[mbOK]);
      SpecialNotesButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (OznakaCheckBox.Checked = True) then
  begin
    if (OznakaTextEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть ознаку або зніміть галочку!',mtWarning,[mbOK]);
      OznakaTextEdit.SetFocus;
      Exit;
    end;
    oznaka := Trim(OznakaTextEdit.Text);
    if (Length(oznaka) <> 1) then
    begin
      TiShowMessage('Увага!','Невірно заповнена ознака, вона повинна складатися з 1 літери!',mtWarning,[mbOK]);
      OznakaTextEdit.SetFocus;
      Exit;
    end;
    PParameter.oznaka_nakl := oznaka;
  end;

  //проверка на корректность даты согласно реестра
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_DATE_NAKL_IS_KORRECT';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('id_reestr').Value := TaxInvoicesDM.ReestrDSet['id_reestr'];
  TaxInvoicesDM.pFIBStoredProc.ParamByName('date_nakl').Value := NaklDateEdit.Date;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;

  if (TaxInvoicesDM.pFIBStoredProc.ParamByName('is_korrect').Value = 0) then
  begin
   error_period := 'Дата податкової накладної не може виходити за період реєстру! Період: з ' + TaxInvoicesDM.pFIBStoredProc.ParamByName('date_beg').AsString + 'по ' + TaxInvoicesDM.pFIBStoredProc.ParamByName('date_end').AsString;
   TiShowMessage('Увага!', error_period, mtWarning,[mbOK]);
   NaklDateEdit.SetFocus;
   Exit;
  end;

  if (NumNaklTextEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть номер накладної!',mtWarning,[mbOK]);
   NumNaklTextEdit.SetFocus;
   Exit;
  end;

  if (TypeDocumentButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть тип документу!',mtWarning,[mbOK]);
   TypeDocumentButtonEdit.SetFocus;
   Exit;
  end;

  if (CustomerButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть покупця!',mtWarning,[mbOK]);
   CustomerButtonEdit.SetFocus;
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

  if (IsSignCheckBox.Checked)then
    PParameter.IsSign := 1
  else
    PParameter.IsSign := 0;


  if (FullNameMemo.Text='') then
  begin
    TiShowMessage('Увага!','Заповніть повну назву покупця!',mtWarning,[mbOK]);
    FullNameMemo.SetFocus;
    Exit;
  end;

  if (FullNameCheckBox.Checked = True)then
  begin
    TiShowMessage('Увага!','Заповніть повну назву контрагента або зніміть редагування повної назви контрагента!',mtWarning,[mbOK]);
    FullNameMemo.SetFocus;
    Exit;
  end;

  if (PParameter.Name_Customer = '') then
  begin
    TiShowMessage('Увага!','Збережіть повну назву контрагента!',mtWarning,[mbOK]);
    Exit;
  end;

  //добавить проверку на общую сумму по документу и на проверку НДС
  if (provodka = True) then
  begin
    //сумма НДС
    TaxInvoicesDM.RxMemoryData_smet.First;
    for i:= 0 to TaxInvoicesDM.RxMemoryData_smet.RecordCount-1 do
    begin
      if TaxInvoicesDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300'      then
        begin
          summa_NDS :=  summa_NDS + TaxInvoicesDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
        end
      else
        summa_not_NDS := summa_not_NDS + TaxInvoicesDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
      TaxInvoicesDM.RxMemoryData_smet.Next;
    end;

    // если сумма НДС не нулевая

    if summa_NDS <> 0 then
    begin
        if FloatToStrF(SummaPDV20CurrencyEdit.Value,ffFixed,10,2) <> FloatToStrF(summa_NDS,ffFixed,10,2) then
        begin
         TiShowMessage('Увага!', 'Сума ПДВ (бюджети) = ' +Floattostr(summa_NDS) +'. Введена сума ПДВ ='+FloatToStr(SummaPDV20CurrencyEdit.EditValue)+'. Суми повинні співпадати!' , mtWarning, [mbOK]);
         SummaTaxable20CurrencyEdit.SetFocus;
         Exit;
        end;

       // if SummaPDV20CurrencyEdit.Value <> 0 then

        if FloatToStrF(SummaTaxable20CurrencyEdit.Value,ffFixed,10,2) <> FloatToStrF(summa_not_NDS,ffFixed,10,2) then
        begin
         TiShowMessage('Увага!', '20% ,база оподаткування(бюджети) = ' + Floattostr(summa_not_NDS)+'. Введена сума 20% ,база оподаткування ='+FloatToStr(SummaTaxable20CurrencyEdit.EditValue)+'. Суми повинні співпадати!' , mtWarning, [mbOK]);
         SummaTaxable20CurrencyEdit.SetFocus;
         Exit;
        end

        //else

       { if SummaExemptCurrencyEdit.Value <> summa_not_NDS then
        begin
         TiShowMessage('Увага!', 'Звільнені від оподаткув.(бюджети) = ' + Floattostr(summa_not_NDS)+'. Введена сума Звільнені від оподаткув. ='+FloatToStr(SummaTaxable20CurrencyEdit.EditValue)+'. Суми повинні співпадати!' , mtWarning, [mbOK]);
         SummaTaxable20CurrencyEdit.SetFocus;
         Exit;
        end; }
     end;
      //если сумма НДС - ноль
      if summa_NDS = 0 then
      begin
        if SummaTaxable20CurrencyEdit.Value <> 0 then
        begin
         TiShowMessage('Увага!', 'Сума ПДВ (бюджети) = 0. Введена сума 20% ,база оподаткування(бюджети) не повинна заповнюватися!', mtWarning, [mbOK]);
         SummaTaxable20CurrencyEdit.SetFocus;
         Exit;
        end;

        if FloatToStrF(SummaExemptCurrencyEdit.Value,ffFixed,10,2) <> FloatToStrF(summa_not_NDS,ffFixed,10,2) then
        begin
         TiShowMessage('Увага!', 'Звільнені від оподаткув.(бюджети) = ' + Floattostr(summa_not_NDS)+'. Введена сума Звільнені від оподаткув. ='+FloatToStr(SummaExemptCurrencyEdit.EditValue)+'. Суми повинні співпадати!' , mtWarning, [mbOK]);
          SummaExemptCurrencyEdit.SetFocus;
         Exit;
        end;
      end;
  end;

  ModalResult := mrOk;
end;

procedure TTITaxInvoicesAddVidNaklForm.SummaTaxable20CurrencyEditExit(
  Sender: TObject);
var
  summa         : Double;
  summaout      : Double;
  error_message : string;
  percent       : Double;
  summa_Round   : Double;
begin
  summa := SummaTaxable20CurrencyEdit.EditValue*0.2;
  summa := summa*100;
  summa_Round := Round(summa);
  summa := summa_Round/100;
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_PDV_CALCULATION';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD_SETUP_REESTR').Value := TaxInvoicesDM.ReestrDSet['KOD_SETUP'];
  TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA').Value            := SummaTaxable20CurrencyEdit.EditValue;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  summaout := TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_OUT').Value;
  percent  := TaxInvoicesDM.pFIBStoredProc.ParamByName('PERCENT').Value;
  if (Summa = summaout) then
  begin
    SummaPDV20CurrencyEdit.EditValue := summa;
  end
  else
  begin
    error_message := 'процент ПДВ не співпадає з 20%! процент ПДВ згідно Довідника НДС = '+ FloatToStr(percent)+' Продовжити?';
    if (TiShowMessage('Увага!',error_message,mtWarning,[mbYes,mbNo])) = mrNo then
      SummaPDV20CurrencyEdit.EditValue := 0
    else
      SummaPDV20CurrencyEdit.EditValue := summa;
  end;

end;

procedure TTITaxInvoicesAddVidNaklForm.ReadReg;
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
       //if (PParameter.id_Kod <> 0) then SummaEnabled(PParameter.id_Kod);//согласно данным энэйблим суммы
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

procedure TTITaxInvoicesAddVidNaklForm.WriteReg;
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

procedure TTITaxInvoicesAddVidNaklForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteReg;
end;

procedure TTITaxInvoicesAddVidNaklForm.SummaEnabled(id: integer);
begin
  TaxInvoicesDM.KodDSet.Close;
  TaxInvoicesDM.KodDSet.SelectSQL.Text := 'select * from ti_sp_taxliabilities where code = :id';
  TaxInvoicesDM.KodDSet.ParamByName('id').Value := id;
  TaxInvoicesDM.KodDSet.Open;

  if (TaxInvoicesDM.KodDSet['IS_SUMMA_TAXABLE_20'] = 1) then
    SummaTaxable20CurrencyEdit.Enabled := True
  else
    SummaTaxable20CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['IS_SUMMA_PDV_20'] = 1) then
    SummaPDV20CurrencyEdit.Enabled := True
  else
    SummaPDV20CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['IS_SUMMA_TAXABLE_0'] = 1) then
    SummaTaxable0CurrencyEdit.Enabled := True
  else
    SummaTaxable0CurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['IS_SUMMA_EXEMPT'] = 1) then
    SummaExemptCurrencyEdit.Enabled := True
  else
    SummaExemptCurrencyEdit.Enabled := False;

  if (TaxInvoicesDM.KodDSet['IS_SUMMA_EXPORT'] = 1) then
    SummaExportCurrencyEdit.Enabled := True
  else
    SummaExportCurrencyEdit.Enabled := False;
end;

procedure TTITaxInvoicesAddVidNaklForm.SummaTaxable20CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
     if SummaPDV20CurrencyEdit.Enabled then
      begin
       SummaPDV20CurrencyEdit.SetFocus;
       Exit;
      end;
     if SummaTaxable0CurrencyEdit.Enabled then
      begin
       SummaTaxable0CurrencyEdit.SetFocus;
       Exit;
      end;
     if SummaExemptCurrencyEdit.Enabled then
      Begin
       SummaExemptCurrencyEdit.SetFocus;
       Exit;
      end;
     if SummaExportCurrencyEdit.Enabled then
      begin
       SummaExportCurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddVidNaklForm.SummaPDV20CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
     if SummaTaxable0CurrencyEdit.Enabled then
      begin
       SummaTaxable0CurrencyEdit.SetFocus;
       Exit;
      end;

     if SummaExemptCurrencyEdit.Enabled then
      Begin
       SummaExemptCurrencyEdit.SetFocus;
       Exit;
      end;

     if SummaExportCurrencyEdit.Enabled then
      begin
       SummaExportCurrencyEdit.SetFocus;
       Exit;
      end;

      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddVidNaklForm.SummaTaxable0CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
     if SummaExemptCurrencyEdit.Enabled then
      Begin
       SummaExemptCurrencyEdit.SetFocus;
       Exit;
      end;

     if SummaExportCurrencyEdit.Enabled then
      begin
       SummaExportCurrencyEdit.SetFocus;
       Exit;
      end;

      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddVidNaklForm.SummaExemptCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
     if SummaExportCurrencyEdit.Enabled then
      begin
       SummaExportCurrencyEdit.SetFocus;
       Exit;
      end;

      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddVidNaklForm.SummaExportCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then YesButton.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.NumNaklTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then IPNCustomerTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.CustomerButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
    Begin
     if SummaTaxable20CurrencyEdit.Enabled then
      begin
       SummaTaxable20CurrencyEdit.SetFocus;
       Exit;
      end;
     if SummaPDV20CurrencyEdit.Enabled then
      begin
       SummaPDV20CurrencyEdit.SetFocus;
       Exit;
      end;
     if SummaTaxable0CurrencyEdit.Enabled then
      begin
       SummaTaxable0CurrencyEdit.SetFocus;
       Exit;
      end;
     if SummaExemptCurrencyEdit.Enabled then
      Begin
       SummaExemptCurrencyEdit.SetFocus;
       Exit;
      end;
     if SummaExportCurrencyEdit.Enabled then
      begin
       SummaExportCurrencyEdit.SetFocus;
       Exit;
      end;
      YesButton.SetFocus;
    End;
end;

procedure TTITaxInvoicesAddVidNaklForm.FormActivate(Sender: TObject);
begin
  NumNaklTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.NumOrderTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then NaklDateEdit.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.NaklDateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then NumNaklTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.KodButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then IPNCustomerTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.TypeDocumentButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then IPNCustomerTextEdit.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.IsKorigCheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then IsExpansionCheckBox.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.IsExpansionCheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then IsSignCheckBox.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.IsSignCheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then SummaTaxable20CurrencyEdit.SetFocus;
end;

procedure TTITaxInvoicesAddVidNaklForm.IPNCustomerTextEditKeyPress(
  Sender: TObject; var Key: Char);
var
  id_customer :Integer;
begin
 if Key = #13 then
 begin
   if(IPNCustomerTextEdit.Text<>'') then
   begin
     TaxInvoicesDM.CustomerDSet.Close;
     TaxInvoicesDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO_IPN(:NALOG_NOM)';
     TaxInvoicesDM.CustomerDSet.ParamByName('NALOG_NOM').Value := IPNCustomerTextEdit.Text;
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
        CustomerButtonEdit.Text  := TaxInvoicesDM.CustomerDSet['NAME_CUSTOMER'];
        IPNCustomerTextEdit.Text := TaxInvoicesDM.CustomerDSet['NALOG_NOM'];

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

procedure TTITaxInvoicesAddVidNaklForm.FullNameCheckBoxClick(
  Sender: TObject);
begin
  FullNameMemo.Properties.ReadOnly := not(FullNameCheckBox.Checked);
  SaveFullNameButton.Visible := FullNameCheckBox.Checked;
end;

procedure TTITaxInvoicesAddVidNaklForm.replaceAbreviatures(
  short_name: string);
var
  i : Integer;
  short_name_abbreviature : string;
  long_name_abbreviature : string;
  p :Integer;
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

procedure TTITaxInvoicesAddVidNaklForm.SaveFullNameButtonClick(
  Sender: TObject);
begin
  if (FullNameMemo.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть повну назву покупця!',mtWarning,[mbOK]);
   FullNameMemo.SetFocus;
   Exit;
  end;

  if (CustomerButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Спочатку оберіть покупця!',mtWarning,[mbOK]);
   CustomerButtonEdit.SetFocus;
   Exit;
  end;


  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_NAME_UPD';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('id_customer').Value := PParameter.Id_Customer;
  TaxInvoicesDM.pFIBStoredProc.ParamByName('full_name_customer').Value := FullNameMemo.Text;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;

  FullNameCheckBox.Checked         := False;
  FullNameMemo.Properties.ReadOnly := True;
  SaveFullNameButton.Visible       := False;
  PParameter.Name_Customer         := FullNameMemo.Text;
end;

procedure TTITaxInvoicesAddVidNaklForm.NumOrderTextEditExit(
  Sender: TObject);
begin
    if (TaxInvoicesDM.DSet['IS_SAME_NUM_NAKL'] = 1)then
    begin
      NumNaklTextEdit.Text   := NumOrderTextEdit.Text;
    end
    else
    begin
      NumNaklTextEdit.Text   := '';
    end;
end;

procedure TTITaxInvoicesAddVidNaklForm.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
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

procedure TTITaxInvoicesAddVidNaklForm.ToolButton_addClick(
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

procedure TTITaxInvoicesAddVidNaklForm.SpeedButton_redClick(
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

procedure TTITaxInvoicesAddVidNaklForm.ToolButton_delClick(
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

procedure TTITaxInvoicesAddVidNaklForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  Note:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesDM.DB.Handle;
  Parameter.Owner := self;
  Note := DoFunctionFromPackage(Parameter,Notes_Const);
  Parameter.Destroy;
  If VarArrayDimCount(Note)>0 then
  begin
    LgotaButtonEdit.Text     := Note[1];
    PParameter.id_lgota      := Note[0];
    PParameter.Name_lgota    := Note[1];
  end;
end;

procedure TTITaxInvoicesAddVidNaklForm.LgotaCheckBoxClick(Sender: TObject);
begin
  LgotaButtonEdit.Enabled := LgotaCheckBox.Checked;
end;

procedure TTITaxInvoicesAddVidNaklForm.SpecialNotesCheckBoxClick(
  Sender: TObject);
begin
  SpecialNotesButtonEdit.Enabled := SpecialNotesCheckBox.Checked;
end;

procedure TTITaxInvoicesAddVidNaklForm.OznakaCheckBoxClick(
  Sender: TObject);
begin
  OznakaTextEdit.Enabled := OznakaCheckBox.Checked;
end;

procedure TTITaxInvoicesAddVidNaklForm.SpecialNotesButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  notes:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesDM.DB.Handle;
  Parameter.Owner     := self;
  notes               := DoFunctionFromPackage(Parameter,SpecialNotes_Const);
  Parameter.Destroy;
  If VarArrayDimCount(notes)>0 then
  begin
    PParameter.id_specialNotes   := notes[0];
    SpecialNotesButtonEdit.Text  := notes[2];
    PParameter.Name_SpecialNotes := notes[1];
    PParameter.Num_specialnotes  := notes[2];
  end;
end;

end.
