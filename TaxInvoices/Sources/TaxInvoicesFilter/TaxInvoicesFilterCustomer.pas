unit TaxInvoicesFilterCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDBEdit, cxLabel, cxProgressBar,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ibase,TiMessages,TiCommonTypes,cxTL 
, cxClasses,cxDBData, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
cxDataStorage,  DB,  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
 cxGridLevel,   cxGridCustomView, cxGrid,
ExtCtrls, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery,
pFIBQuery,TiCommonProc,  pFIBStoredProc,
ActnList, cxCalendar,   cxImage, cxCheckBox,TiWaitForm, TICommonLoader,
  cxGroupBox, cxDropDownEdit,LoadDogManedger,dogLoaderUnit, DateUtil;

type TTaxInvocesUser = record
 id_user:Integer;
 name_user:string;
 name_computer:string;
 ip_computer:string;
end;

type TTaxInvoicesFilterCustomer = record
  Id_TypeDocumentVidNakl   : Integer;
  Name_TypeDocumentVidNakl : string;
  Id_TypeDocumentOtrNakl   : Integer;
  Name_TypeDocumentOtrNakl : string;
  Id_Customer              : Integer;
  Name_Customer            : string;
  IPNCustomer              : string;
end;


type
  TTaxInvoicesFilterCustomerForm = class(TForm)
    ImportPanel: TGroupBox;
    StartBtn: TcxButton;
    GroupBox2: TGroupBox;
    NaklLabel: TcxLabel;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    PeriodGroupBox: TGroupBox;
    ZLabel: TcxLabel;
    POLabel: TcxLabel;
    CustomerGroupBox: TGroupBox;
    IPNLabel: TLabel;
    NameCustomerLabel: TLabel;
    CustomerButtonEdit: TcxButtonEdit;
    IPNCustomerTextEdit: TEdit;
    TypeDocumentGroupBox: TcxGroupBox;
    TypeDocVidNaklButtonEdit: TcxButtonEdit;
    TypeDocVidNaklCheckBox: TCheckBox;
    TypeDocOtrNaklCheckBox: TCheckBox;
    TypeDocOtrNaklButtonEdit: TcxButtonEdit;
    DateBegDateEdit: TcxDateEdit;
    DateEndDateEdit: TcxDateEdit;
    GroupBox1: TGroupBox;
    VidNaklRadioButton: TRadioButton;
    OtrNaklRadioButton: TRadioButton;
    procedure StartBtnClick(Sender: TObject);
    procedure SubdivisionButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure IPNCustomerTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure CustomerButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeDocVidNaklButtonEditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure TypeDocOtrNaklButtonEditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure TypeDocVidNaklCheckBoxClick(Sender: TObject);
    procedure TypeDocOtrNaklCheckBoxClick(Sender: TObject);
  private
    PDb_Handle      : TISC_DB_HANDLE;
    TaxInvoicesUser : TTaxInvocesUser;
    path          : string;
    ReestrParamIn : TReestrParam;
    PRes          : Variant;
    PParameter    : TTaxInvoicesFilterCustomer;
  public
    //kol_vo_Vid_nakl : Integer;
    kol_vo_Otr_nakl : Integer;
    id_subdivision : Integer;
    name_subdivision : string;

    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
    property Parameter:TTaxInvoicesFilterCustomer read PParameter;
  end;

var
  TaxInvoicesFilterCustomerForm: TTaxInvoicesFilterCustomerForm;

implementation

uses TaxInvoicesFilter_DM;

{$R *.dfm}
constructor TTaxInvoicesFilterCustomerForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
//var
 // ImportXMLDM :TimportXMLDM;
begin
  inherited Create(AOwner);
  PDb_Handle := DB_HANDLE;
   //--------------------------------------------------------------------
  TaxInvoicesFilterDM := TTaxInvoicesFilterDM.create(AOwner,Db_Handle);
  TaxInvoicesFilterDM.UserDSet.Close;
  TaxInvoicesFilterDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  TaxInvoicesFilterDM.UserDSet.Open;
  TaxInvoicesUser.id_user       := TaxInvoicesFilterDM.UserDSet['ID_USER'];
  TaxInvoicesUser.name_user     := TaxInvoicesFilterDM.UserDSet['USER_FIO'];
  TaxInvoicesUser.name_computer := TaxInvoicesFilterDM.UserDSet['HOST_NAME'];
  TaxInvoicesUser.ip_computer   := TaxInvoicesFilterDM.UserDSet['IP_ADRESS'];
  //----------------------------------------------------------------------
  VidNaklRadioButton.Checked := True;
  TypeDocVidNaklCheckBox.Checked := False;
  TypeDocOtrNaklCheckBox.Checked := False;
  TypeDocVidNaklButtonEdit.Text := '';
  TypeDocOtrNaklButtonEdit.Text := '';
  TypeDocVidNaklButtonEdit.Enabled := False;
  TypeDocOtrNaklButtonEdit.Enabled := False;
  IPNCustomerTextEdit.Text := '';
  CustomerButtonEdit.Text := '';
  DateBegDateEdit.Date := Now;
  DateEndDateEdit.Date := Now;
  
  Caption := 'Фільтр отриманих та виданих податкових накладних за контрагентом';
end;
procedure TTaxInvoicesFilterCustomerForm.StartBtnClick(Sender: TObject);
var
  i,j              : Integer;
  const NameReportVidNakl = '\Reports\TaxInvoices\FilterCustomerVidNakl.fr3';
  const NameReportOtrNakl = '\Reports\TaxInvoices\FilterCustomerOtrNakl.fr3';
begin
  if (TypeDocVidNaklCheckBox.Checked = True) then
  begin
    if (TypeDocVidNaklButtonEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть тип документу(вид. накл.) або зніміть галочку!',mtWarning,[mbOK]);
      TypeDocVidNaklButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (TypeDocOtrNaklCheckBox.Checked = True) then
  begin
    if (TypeDocOtrNaklButtonEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть тип документу(отр. накл.) або зніміть галочку!',mtWarning,[mbOK]);
      TypeDocOtrNaklButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (CustomerButtonEdit.Text = '') then
  begin
    TiShowMessage('Увага!','Заповніть контрагента!',mtWarning,[mbOK]);
    CustomerButtonEdit.SetFocus;
    Exit;
  end;

  if (DateBegDateEdit.Text = '') then
  begin
    TiShowMessage('Увага!','Заповніть початок періоду!',mtWarning,[mbOK]);
    DateBegDateEdit.SetFocus;
    Exit;
  end;

  if (DateEndDateEdit.Text = '') then
  begin
    TiShowMessage('Увага!','Заповніть кінець періоду!',mtWarning,[mbOK]);
    DateEndDateEdit.SetFocus;
    Exit;
  end;

  TaxInvoicesFilterDM.CustomerVidNaklDSet.Close;
  TaxInvoicesFilterDM.CustomerOtrNaklDSet.Close;

  if (VidNaklRadioButton.Checked = True) then
  begin
    //отбор выданных налоговых накладных по контрагенту
    TaxInvoicesFilterDM.CustomerVidNaklDSet.Close;
    TaxInvoicesFilterDM.CustomerVidNaklDSet.SelectSQL.Text := 'select * from TI_SELECT_VID_NAKL_CONTRAGENT(:ID_CUSTOMER,:DATEBEG,:DATEEND,:CHECK_TIP_DOC_VID_NAKL,:ID_TIP_DOC_VID_NAKL)';
    TaxInvoicesFilterDM.CustomerVidNaklDSet.ParamByName('id_customer').Value := PParameter.Id_Customer;
    TaxInvoicesFilterDM.CustomerVidNaklDSet.ParamByName('DATEBEG').AsDate := DateBegDateEdit.Date;
    TaxInvoicesFilterDM.CustomerVidNaklDSet.ParamByName('DATEEND').AsDate := DateEndDateEdit.Date;

    if (TypeDocVidNaklCheckBox.Checked = True) then
    begin
      TaxInvoicesFilterDM.CustomerVidNaklDSet.ParamByName('CHECK_TIP_DOC_VID_NAKL').Value := 1;
      TaxInvoicesFilterDM.CustomerVidNaklDSet.ParamByName('ID_TIP_DOC_VID_NAKL').Value    := PParameter.Id_TypeDocumentVidNakl;
    end
    else
    begin
      TaxInvoicesFilterDM.CustomerVidNaklDSet.ParamByName('CHECK_TIP_DOC_VID_NAKL').Value := 0;
      TaxInvoicesFilterDM.CustomerVidNaklDSet.ParamByName('ID_TIP_DOC_VID_NAKL').Value    := 0;
    end;

    TaxInvoicesFilterDM.CustomerVidNaklDSet.Open;
  end;

  if (OtrNaklRadioButton.Checked = True) then
  begin
    //отбор полученных налоговых накладных по контрагенту
    TaxInvoicesFilterDM.CustomerOtrNaklDSet.Close;

    TaxInvoicesFilterDM.CustomerOtrNaklDSet.SelectSQL.Text := 'select * from TI_SELECT_OTR_NAKL_CONTRAGENT(:ID_CUSTOMER,:DATEBEG,:DATEEND,:CHECK_TIP_DOC_OTR_NAKL,:ID_TIP_DOC_OTR_NAKL)';
    TaxInvoicesFilterDM.CustomerOtrNaklDSet.ParamByName('id_customer').Value := PParameter.Id_Customer;
    TaxInvoicesFilterDM.CustomerOtrNaklDSet.ParamByName('DATEBEG').AsDate := DateBegDateEdit.Date;
    TaxInvoicesFilterDM.CustomerOtrNaklDSet.ParamByName('DATEEND').AsDate := DateEndDateEdit.Date;

    if (TypeDocOtrNaklCheckBox.Checked = True) then
    begin
      TaxInvoicesFilterDM.CustomerOtrNaklDSet.ParamByName('CHECK_TIP_DOC_OTR_NAKL').Value := 1;
      TaxInvoicesFilterDM.CustomerOtrNaklDSet.ParamByName('ID_TIP_DOC_OTR_NAKL').Value    := PParameter.Id_TypeDocumentOtrNakl;
    end
    else
    begin
      TaxInvoicesFilterDM.CustomerOtrNaklDSet.ParamByName('CHECK_TIP_DOC_OTR_NAKL').Value := 0;
      TaxInvoicesFilterDM.CustomerOtrNaklDSet.ParamByName('ID_TIP_DOC_OTR_NAKL').Value    := 0;
    end;
    TaxInvoicesFilterDM.CustomerOtrNaklDSet.Open;
  end;  


  if ( ((VidNaklRadioButton.Checked = True) and (TaxInvoicesFilterDM.CustomerVidNaklDSet.IsEmpty = true))
    or ((OtrNaklRadioButton.Checked = True) and (TaxInvoicesFilterDM.CustomerOtrNaklDSet.IsEmpty = True))   )
  then
  begin
    TiShowMessage('Увага!','За такими параметрами немає інформації!',mtWarning,[mbOK]);
  end
  else
  begin
    //создаем репорт
    if ((VidNaklRadioButton.Checked = True))then
    begin
      TaxInvoicesFilterDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportVidNakl,True);
    end
    else
    begin
      TaxInvoicesFilterDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportOtrNakl,True);
    end;  

    TaxInvoicesFilterDM.Report.Variables.Clear;
    TaxInvoicesFilterDM.Report.Variables['datebeg']         := ''''+DateToStr(DateBegDateEdit.Date)+'''';
    TaxInvoicesFilterDM.Report.Variables['dateend']         := ''''+DateToStr(DateEndDateEdit.Date)+'''';
    TaxInvoicesFilterDM.Report.Variables['Name_contragent'] := ''''+PParameter.Name_Customer+'''';
    TaxInvoicesFilterDM.Report.Variables['IPN_contragent']  := ''''+PParameter.IPNCustomer+'''';

    //TaxInvoicesFilterDM.Report.DesignReport;
    TaxInvoicesFilterDM.Report.ShowReport;
    Close;
  end;

end;

procedure TTaxInvoicesFilterCustomerForm.SubdivisionButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  SubDivision:Variant;
begin
 { Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := ImportXMLDM.DB.Handle;
  Parameter.Owner     := self;
  SubDivision         := DoFunctionFromPackage(Parameter,Subdivision_Const);
  Parameter.Destroy;

  If VarArrayDimCount(SubDivision)>0 then
  begin
    SubdivisionButtonEdit.Text   := SubDivision[1];
    name_subdivision             := SubDivision[1];
    id_subdivision               := SubDivision[0];
    SubdivisionButtonEdit.SetFocus;
  end;  }
end;

procedure TTaxInvoicesFilterCustomerForm.IPNCustomerTextEditKeyPress(
  Sender: TObject; var Key: Char);
var
  id_customer :Integer;
begin
 if Key = #13 then
 begin
   if(IPNCustomerTextEdit.Text<>'') then
   begin
     TaxInvoicesFilterDM.CustomerDSet.Close;
     TaxInvoicesFilterDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO_IPN(:NALOG_NOM)';
     TaxInvoicesFilterDM.CustomerDSet.ParamByName('NALOG_NOM').Value := IPNCustomerTextEdit.Text;
     TaxInvoicesFilterDM.CustomerDSet.Open;
     if not (TaxInvoicesFilterDM.CustomerDSet['ID_CUSTOMER'] = null) then
      begin
        id_Customer := TaxInvoicesFilterDM.CustomerDSet['ID_CUSTOMER'];
        TaxInvoicesFilterDM.CustomerDSet.Close;
        TaxInvoicesFilterDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
        TaxInvoicesFilterDM.CustomerDSet.ParamByName('id').Value := id_Customer;
        TaxInvoicesFilterDM.CustomerDSet.Open;
        PParameter.Id_Customer   := id_Customer;
        PParameter.Name_Customer := TaxInvoicesFilterDM.CustomerDSet['NAME_CUSTOMER'];
        PParameter.IPNCustomer   := TaxInvoicesFilterDM.CustomerDSet['NALOG_NOM'];
        CustomerButtonEdit.Text  := TaxInvoicesFilterDM.CustomerDSet['NAME_CUSTOMER'];
        IPNCustomerTextEdit.Text := TaxInvoicesFilterDM.CustomerDSet['NALOG_NOM'];

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

procedure TTaxInvoicesFilterCustomerForm.CustomerButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
 id_Customer:Integer;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(TaxInvoicesFilterDM.DB.Handle);
 i['FormStyle']    := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := selCustomer;
 i['id_cistomer']  := -1;
 i['show_all']     := 1;
 LoadSysData(TaxInvoicesFilterDM.ReadTransaction);
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);

  if o['ModalResult'] = mrOk then
  begin
   id_Customer := o['ID_CUSTOMER'];
   TaxInvoicesFilterDM.CustomerDSet.Close;
   TaxInvoicesFilterDM.CustomerDSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
   TaxInvoicesFilterDM.CustomerDSet.ParamByName('id').Value := id_Customer;
   TaxInvoicesFilterDM.CustomerDSet.Open;

   PParameter.Id_Customer   := id_Customer;
   PParameter.Name_Customer := TaxInvoicesFilterDM.CustomerDSet['NAME_CUSTOMER'];
   PParameter.IPNCustomer   := TaxInvoicesFilterDM.CustomerDSet['NALOG_NOM'];
   CustomerButtonEdit.Text  := TaxInvoicesFilterDM.CustomerDSet['NAME_CUSTOMER'];
   IPNCustomerTextEdit.Text := TaxInvoicesFilterDM.CustomerDSet['NALOG_NOM'];

  end;
  i.Free;
  o.Free;
end;

procedure TTaxInvoicesFilterCustomerForm.TypeDocVidNaklButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  TypeDoc:Variant;
begin
  TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesFilterDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',2);
  If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.Id_TypeDocumentVidNakl   := TypeDoc[0];
    PParameter.Name_TypeDocumentVidNakl := TypeDoc[1];
    TypeDocVidNaklButtonEdit.Text       := TypeDoc[1];
  end;
end;

procedure TTaxInvoicesFilterCustomerForm.TypeDocOtrNaklButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  TypeDoc:Variant;
begin
  TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesFilterDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',1);
  If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.Id_TypeDocumentOtrNakl   := TypeDoc[0];
    PParameter.Name_TypeDocumentOtrNakl := TypeDoc[1];
    TypeDocOtrNaklButtonEdit.Text       := TypeDoc[1];
  end;
end;

procedure TTaxInvoicesFilterCustomerForm.TypeDocVidNaklCheckBoxClick(
  Sender: TObject);
begin
  TypeDocVidNaklButtonEdit.Enabled := TypeDocVidNaklCheckBox.Checked;
end;

procedure TTaxInvoicesFilterCustomerForm.TypeDocOtrNaklCheckBoxClick(
  Sender: TObject);
begin
  TypeDocOtrNaklButtonEdit.Enabled := TypeDocOtrNaklCheckBox.Checked;
end;

end.
