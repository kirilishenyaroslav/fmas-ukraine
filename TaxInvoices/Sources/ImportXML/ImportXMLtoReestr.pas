unit ImportXMLtoReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDBEdit, cxLabel, cxProgressBar,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ibase,TiMessages,TiCommonTypes,cxTL 
, SimpleXML,cxClasses,cxDBData, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
cxDataStorage,  DB,  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
 cxGridLevel,   cxGridCustomView, cxGrid,
ExtCtrls, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery,
pFIBQuery,TiCommonProc,  pFIBStoredProc,
ActnList, cxCalendar,   cxImage, cxCheckBox,ImportXMLData,TiWaitForm, TICommonLoader, kernel;

type TTaxInvocesUser = record
 id_user:Integer;
 name_user:string;
 name_computer:string;
 ip_computer:string;
end;

type TRee = class(TObject)
  private
    data       : array of array of string;
    dataOtr    : array of array of string;
    xmlCol     : array of String;
    xmlColOtr  : array of String;
    procedure addItem(indexCol, indexRow: integer; dataItem:String);
    procedure addItemOtr(indexCol, indexRow: integer; dataItem:String);
  public
     kol_vo_Vid_nakl : Integer;
     kol_vo_Otr_nakl : Integer;
     T1RXXXXG1  : String;
     T1RXXXXG2D : String;
     T1RXXXXG3S : String;
     T1RXXXXG4S : String;
     T1RXXXXG41S : string;
     T1RXXXXG42S : string;
     T1RXXXXG43S : string;
     T1RXXXXG5S : String;
     T1RXXXXG6  : String;
     T1RXXXXG7  : String;
     T1RXXXXG8  : string;
     T1RXXXXG9  : string;
     T1RXXXXG10 : string;
     T1RXXXXG11 : string;
     T1RXXXXG12 : string;
     T2RXXXXG1  : string;
     T2RXXXXG2D : string;
     T2RXXXXG3D : string;
     T2RXXXXG4S : string;
     T2RXXXXG5S : string;
     T2RXXXXG51S : string;
     T2RXXXXG6S : string;
     T2RXXXXG7  : string;
     T2RXXXXG8  : string;
     T2RXXXXG9  : string;
     T2RXXXXG10 : string;
     T2RXXXXG11 : string;
     T2RXXXXG12 : string;
     T2RXXXXG13 : string;
     T2RXXXXG14 : string;
     T2RXXXXG15 : string;
     T2RXXXXG16 : string;
    procedure init(path:string);
    procedure createObj;
  end;


type
  TImportXMLReestrForm = class(TForm)
    FileOpenGroup: TGroupBox;
    eFileNameEdit: TcxButtonEdit;
    ImportPanel: TGroupBox;
    StartBtn: TcxButton;
    GroupBox1: TGroupBox;
    PeriodLabel: TcxLabel;
    NumReestrLabel: TcxLabel;
    GroupBox2: TGroupBox;
    NaklLabel: TcxLabel;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    GroupBox3: TGroupBox;
    PeriodValLabel: TcxLabel;
    NumReestrValLabel: TcxLabel;
    SubdivisionButtonEdit: TcxButtonEdit;
    procedure StartBtnClick(Sender: TObject);
    procedure eFileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SubdivisionButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PDb_Handle      : TISC_DB_HANDLE;
    TaxInvoicesUser : TTaxInvocesUser;
    path          : string;
    ReestrParamIn : TReestrParam;
    PRes          : Variant;
  public
    //kol_vo_Vid_nakl : Integer;
    kol_vo_Otr_nakl : Integer;
    r               : TRee;
    id_subdivision : Integer;
    name_subdivision : string;

    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE; ReestrParam:TReestrParam);reintroduce;

    property Res:Variant read PRes;
  end;

var
  ImportXMLReestrForm: TImportXMLReestrForm;

implementation

uses ImportXML_DM;

{$R *.dfm}
constructor TImportXMLReestrForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ReestrParam:TReestrParam);
//var
 // ImportXMLDM :TimportXMLDM;
begin
  inherited Create(AOwner);
  PDb_Handle := DB_HANDLE;
  ReestrParamIn := ReestrParam;
  PeriodValLabel.Caption := ReestrParamIn.Kod_setup_Reestr;
  NumReestrValLabel.Caption := IntToStr(ReestrParamIn.Num_Reestr);
   //--------------------------------------------------------------------
  ImportXMLDM := TimportXMLDM.create(AOwner,Db_Handle);
  ImportXMLDM.UserDSet.Close;
  ImportXMLDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  ImportXMLDM.UserDSet.Open;
  TaxInvoicesUser.id_user       := ImportXMLDM.UserDSet['ID_USER'];
  TaxInvoicesUser.name_user     := ImportXMLDM.UserDSet['USER_FIO'];
  TaxInvoicesUser.name_computer := ImportXMLDM.UserDSet['HOST_NAME'];
  TaxInvoicesUser.ip_computer   := ImportXMLDM.UserDSet['IP_ADRESS'];
  //----------------------------------------------------------------------
  eFileNameEdit.Text  := '';
  SubdivisionButtonEdit.Text := '';
  Caption := 'Імпорт виданих та отриманих подю накладних з XML-файлу';
end;
procedure TImportXMLReestrForm.StartBtnClick(Sender: TObject);
var
  i,j              : Integer;
  ViewForm         : TImportXMLForm;
  LastNumVidNakl   : Integer;
  LastNumOtrNakl   : Integer;
  Id_Type_Doc      : Integer;
  Name_Type_Doc    : string;
  CharCod          : string;
  stringdata       : string;
  stringdataVip    : string;
  stringdataOtr    : string;
  dataVidNakl      : string;
  dataVipOtrNakl   : string;
  dataOtrOtrNakl   : string;
  SUMMA_TAXABLE_20 : string;
  SUMMA_PDV_20     : string;
  SUMMA_TAXABLE_0  : string;
  SUMMA_EXEMPT     : string;
  SUMMA_EXPORT     : string;
  SUMMA_ALL_PDV    : string;
  format           : TFormatSettings;
  wf               : TForm;
  summa_nds_vid_nakl : Double;
  summa_nds_otr_nakl : Double;
  summa_not_nds_vid_nakl : Double;
  summa_not_nds_otr_nakl : Double;
  summa_extempt_vid_nakl : Double;
  summa_extempt_nds_otr_nakl : Double;
  summa_extempt_not_nds_otr_nakl : Double;
  KEY_SESSION    : Int64;
  workdate       : TDate;
  STRU           : KERNEL_MODE_STRUCTURE;
  DoResult       : Boolean;
  ErrorList      : TStringList;
  s              : string;
  id_vid_nakl    : Integer;
  id_otr_nakl    : Integer;
begin
  if (eFileNameEdit.Text='')   then
  begin
   TiShowMessage('Увага!','Оберіть файл для імпорту',mtWarning,[mbOK]);
   Exit;
  end;

  if (SubdivisionButtonEdit.Text='')   then
  begin
   TiShowMessage('Увага!','Заповніть назву організації, дані якої будут імпортуватися',mtWarning,[mbOK]);
   SubdivisionButtonEdit.SetFocus;
   Exit;
  end;

  wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
  r:=TRee.Create;
  r.createObj;
  r.init(path);
  ViewForm := TImportXMLForm.Create(Self, ImportXMLDM.DB.Handle, ReestrParamIn);

  ViewForm.XMLDataVidNaklGridTableView1.DataController.RecordCount := r.kol_vo_Vid_nakl+1;
  ViewForm.XMLDataVidNaklGridTableView_NUM_ORDER.DataBinding.ValueTypeClass        := TcxIntegerValueType;
  ViewForm.XMLDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.ValueTypeClass     := TcxDateTimeValueType;
  ViewForm.XMLDataVidNaklGridTableView_NUM_NAKL.DataBinding.ValueTypeClass         := TcxStringValueType;
  ViewForm.XMLDataVidNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.ValueTypeClass := TcxStringValueType;
  ViewForm.XMLDataVidNaklGridTableView1_NAME_TYPE_DOC_OZN.DataBinding.ValueTypeClass := TcxStringValueType;
  ViewForm.XMLDataVidNaklGridTableView_NAME_TYPE_DOC_OZN2.DataBinding.ValueTypeClass := TcxStringValueType;
  ViewForm.XMLDataVidNaklGridTableView_NAME_CUSTOMER.DataBinding.ValueTypeClass    := TcxStringValueType;
  ViewForm.XMLDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.ValueTypeClass     := TcxStringValueType;
  ViewForm.XMLDataVidNaklGridTableView_SUMMA_ALL_PDV.DataBinding.ValueTypeClass    := TcxFloatValueType;
  ViewForm.XMLDataVidNaklGridTableView_SUMMA_TAXABLE_20.DataBinding.ValueTypeClass := TcxFloatValueType;
  ViewForm.XMLDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.ValueTypeClass     := TcxFloatValueType;
  ViewForm.XMLDataVidNaklGridTableView_SUMMA_TAXABLE_0.DataBinding.ValueTypeClass  := TcxFloatValueType;
  ViewForm.XMLDataVidNaklGridTableView_SUMMA_EXEMPT.DataBinding.ValueTypeClass     := TcxFloatValueType;
  ViewForm.XMLDataVidNaklGridTableView_SUMMA_EXPORT.DataBinding.ValueTypeClass     := TcxFloatValueType;

  ViewForm.XMLDataOtrNaklGridTableView1.DataController.RecordCount                         := r.kol_vo_Otr_nakl+1;
  ViewForm.XMLDataOtrNaklGridTableView_DATA_OTR.DataBinding.ValueTypeClass                 := TcxDateTimeValueType;
  ViewForm.XMLDataOtrNaklGridTableView_DATA_VIPISKI.DataBinding.ValueTypeClass             := TcxDateTimeValueType;
  ViewForm.XMLDataOtrNaklGridTableView_NUM_NAKL.DataBinding.ValueTypeClass                 := TcxStringValueType;
  ViewForm.XMLDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.ValueTypeClass       := TcxStringValueType;
  ViewForm.XMLDataOtrNaklGridTableView_NAME_PROVIDER.DataBinding.ValueTypeClass            := TcxStringValueType;
  ViewForm.XMLDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.ValueTypeClass             := TcxStringValueType;
  ViewForm.XMLDataOtrNaklGridTableView_SUMMA_ALL_PDV.DataBinding.ValueTypeClass            := TcxFloatValueType;
  ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.ValueTypeClass       := TcxFloatValueType;
  ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.ValueTypeClass           := TcxFloatValueType;
  ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.ValueTypeClass     := TcxFloatValueType;
  ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.ValueTypeClass         := TcxFloatValueType;
  ViewForm.XMLDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV.DataBinding.ValueTypeClass := TcxFloatValueType;
  ViewForm.XMLDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV.DataBinding.ValueTypeClass    := TcxFloatValueType;
  ViewForm.XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV.DataBinding.ValueTypeClass   := TcxFloatValueType;
  ViewForm.XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV.DataBinding.ValueTypeClass       := TcxFloatValueType;

  // начало импорта выданных налоговых накладных
  if (Length(r.data) <> 0) then
  begin
   for i :=0 to ViewForm.XMLDataVidNaklGridTableView1.DataController.RecordCount - 1 do
   begin
    stringdata       := r.data[i,1];
    SUMMA_ALL_PDV    := r.data[i,8];
    SUMMA_TAXABLE_20 := r.data[i,9];
    SUMMA_PDV_20     := r.data[i,10];
    SUMMA_TAXABLE_0  := '0';
    SUMMA_EXEMPT     := r.data[i,11];
    SUMMA_EXPORT     := '0';

    if SUMMA_ALL_PDV    = '' then SUMMA_ALL_PDV    := '0';
    if SUMMA_TAXABLE_20 = '' then SUMMA_TAXABLE_20 := '0';
    if SUMMA_PDV_20     = '' then SUMMA_PDV_20     := '0';
    if SUMMA_EXEMPT     = '' then SUMMA_EXEMPT     := '0';

    format.DecimalSeparator := '.';

    dataVidNakl := stringdata[1]+stringdata[2]+'.'+stringdata[3]+stringdata[4]+'.'+stringdata[5]+stringdata[6]+stringdata[7]+stringdata[8];
    ViewForm.XMLDataVidNaklGridTableView_NUM_ORDER.DataBinding.DataController.Values[i,0]          := r.data[i,0] ;
    ViewForm.XMLDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]       := StrToDate(dataVidNakl) ;
    ViewForm.XMLDataVidNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2]           := r.data[i,2] ;
    ViewForm.XMLDataVidNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3] := r.data[i,3] ;
    ViewForm.XMLDataVidNaklGridTableView1_NAME_TYPE_DOC_OZN.DataBinding.DataController.Values[i,4] := r.data[i,4] ;
    ViewForm.XMLDataVidNaklGridTableView_NAME_TYPE_DOC_OZN2.DataBinding.DataController.Values[i,5] := r.data[i,5] ;
    ViewForm.XMLDataVidNaklGridTableView_NAME_CUSTOMER.DataBinding.DataController.Values[i,6]      := r.data[i,6] ;
    ViewForm.XMLDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.DataController.Values[i,7]       := r.data[i,7] ;
    ViewForm.XMLDataVidNaklGridTableView_SUMMA_ALL_PDV.DataBinding.DataController.Values[i,8]      := StrToFloat(SUMMA_ALL_PDV,format) ;
    ViewForm.XMLDataVidNaklGridTableView_SUMMA_TAXABLE_20.DataBinding.DataController.Values[i,9]   := StrToFloat(SUMMA_TAXABLE_20,format);
    ViewForm.XMLDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,10]      := StrToFloat(SUMMA_PDV_20,format) ;
    ViewForm.XMLDataVidNaklGridTableView_SUMMA_TAXABLE_0.DataBinding.DataController.Values[i,11]   := StrToFloat(SUMMA_TAXABLE_0,format);
    ViewForm.XMLDataVidNaklGridTableView_SUMMA_EXEMPT.DataBinding.DataController.Values[i,12]      := StrToFloat(SUMMA_EXEMPT,format) ;
    ViewForm.XMLDataVidNaklGridTableView_SUMMA_EXPORT.DataBinding.DataController.Values[i,13]      := StrToFloat(SUMMA_EXPORT,format) ;
   end;
  end;

  if (Length(r.dataOtr) <> 0) then
  begin
   for i :=0 to ViewForm.XMLDataOtrNaklGridTableView1.DataController.RecordCount - 1 do
   begin
    stringdataVip       := r.dataOtr[i,2];
    stringdataOtr       := r.dataOtr[i,1];

    format.DecimalSeparator := '.';

    if r.dataOtr[i,7]  = '' then r.dataOtr[i,7]  := '0';
    if r.dataOtr[i,8]  = '' then r.dataOtr[i,8]  := '0';
    if r.dataOtr[i,9]  = '' then r.dataOtr[i,9]  := '0';
    if r.dataOtr[i,10] = '' then r.dataOtr[i,10] := '0';
    if r.dataOtr[i,11] = '' then r.dataOtr[i,11] := '0';

    dataVipOtrNakl := stringdataVip[1]+stringdataVip[2]+'.'+stringdataVip[3]+stringdataVip[4]+'.'+stringdataVip[5]+stringdataVip[6]+stringdataVip[7]+stringdataVip[8];
    dataOtrOtrNakl := stringdataOtr[1]+stringdataOtr[2]+'.'+stringdataOtr[3]+stringdataOtr[4]+'.'+stringdataOtr[5]+stringdataOtr[6]+stringdataOtr[7]+stringdataOtr[8];
    ViewForm.XMLDataOtrNaklGridTableView_DATA_OTR.DataBinding.DataController.Values[i,0]           := StrToDate(dataOtrOtrNakl) ;
    ViewForm.XMLDataOtrNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]       := StrToDate(dataVipOtrNakl) ;
    ViewForm.XMLDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2]           := r.dataOtr[i,3] ;
    ViewForm.XMLDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3] := r.dataOtr[i,4] ;
    ViewForm.XMLDataOtrNaklGridTableView_NAME_PROVIDER.DataBinding.DataController.Values[i,4]      := r.dataOtr[i,5] ;
    ViewForm.XMLDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.DataController.Values[i,5]       := r.dataOtr[i,6] ;
    ViewForm.XMLDataOtrNaklGridTableView_SUMMA_ALL_PDV.DataBinding.DataController.Values[i,6]      := StrToFloat(r.dataOtr[i,7],format) ;
    ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.DataController.Values[i,7]        := StrToFloat(r.dataOtr[i,8],format);
    ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8]            := StrToFloat(r.dataOtr[i,9],format) ;
    ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.DataController.Values[i,9]      := StrToFloat(r.dataOtr[i,10],format);
    ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.DataController.Values[i,10]         := StrToFloat(r.dataOtr[i,11],format) ;
    ViewForm.XMLDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV.DataBinding.DataController.Values[i,11] := '0' ;
    ViewForm.XMLDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV.DataBinding.DataController.Values[i,12]    := '0' ;
    ViewForm.XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV.DataBinding.DataController.Values[i,13]   := '0' ;
    ViewForm.XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV.DataBinding.DataController.Values[i,14]       := '0' ;
   end;
  end;

  CloseWaitForm(wf);

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOk then
  begin
    summa_nds_vid_nakl := ViewForm.XMLDataVidNaklGridTableView1.DataController.Summary.FooterSummaryValues[2];
    summa_nds_otr_nakl := ViewForm.XMLDataOtrNaklGridTableView1.DataController.Summary.FooterSummaryValues[2];
    summa_not_nds_vid_nakl := ViewForm.XMLDataVidNaklGridTableView1.DataController.Summary.FooterSummaryValues[1];
    summa_not_nds_otr_nakl := ViewForm.XMLDataOtrNaklGridTableView1.DataController.Summary.FooterSummaryValues[1];
    summa_extempt_vid_nakl := ViewForm.XMLDataVidNaklGridTableView1.DataController.Summary.FooterSummaryValues[4];
    summa_extempt_nds_otr_nakl := ViewForm.XMLDataOtrNaklGridTableView1.DataController.Summary.FooterSummaryValues[4];
    summa_extempt_not_nds_otr_nakl := ViewForm.XMLDataOtrNaklGridTableView1.DataController.Summary.FooterSummaryValues[3];
    {ShowMessage('summa_nds_vid_nakl '+ FloatToStr(summa_nds_vid_nakl));
    ShowMessage('summa_not_nds_vid_nakl '+ FloatToStr(summa_not_nds_vid_nakl));
    ShowMessage('summa_not_nds_otr_nakl '+ FloatToStr(summa_not_nds_otr_nakl));
    ShowMessage('summa_extempt_vid_nakl '+ FloatToStr(summa_extempt_vid_nakl));
    ShowMessage('summa_extempt_nds_otr_nakl '+ FloatToStr(summa_extempt_nds_otr_nakl));
    ShowMessage('summa_extempt_not_nds_otr_nakl '+ FloatToStr(summa_extempt_not_nds_otr_nakl));  }
   //try
     ImportXMLDM.WriteTransaction.StartTransaction;
     wf:=ShowWaitForm(Application.MainForm,wfImportData);
     //---------------------импорт выданных накладных
   if (Length(r.data))<>0 then
   begin
    for i :=0 to ViewForm.XMLDataVidNaklGridTableView1.DataController.RecordCount - 1 do
    begin
      //поиск номера

      //ImportXMLDM.WriteTransaction.StartTransaction;
      ImportXMLDM.pFIBStoredProc.StoredProcName                 := 'TI_LAST_NOMER_NAKL_SEARCH';
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := ReestrParamIn.Id_reestr;
      ImportXMLDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 1; //выданные накладные
      ImportXMLDM.pFIBStoredProc.ExecProc;
      //ImportXMLDM.WriteTransaction.Commit;
      LastNumVidNakl := ImportXMLDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').Value;

      //поиск кода

      Id_Type_Doc   := 0;
      Name_Type_Doc := '';
      CharCod       := ViewForm.XMLDataVidNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3];

      //ImportXMLDM.WriteTransaction.StartTransaction;
      ImportXMLDM.pFIBStoredProc.StoredProcName := 'TI_TYPE_DOC_SEARCH';
      ImportXMLDM.pFIBStoredProc.ParamByName('KOD').Value   := CharCod;
      ImportXMLDM.pFIBStoredProc.ParamByName('IDSPR').Value := 2;
      ImportXMLDM.pFIBStoredProc.ExecProc;
      //ImportXMLDM.WriteTransaction.Commit;
      Id_Type_Doc   := ImportXMLDM.pFIBStoredProc.ParamByName('id_type_doc').Value;
      name_type_doc := ImportXMLDM.pFIBStoredProc.ParamByName('name_type_doc').Value;
      // добавление записи в таблицу выданных накладных
      // ImportXMLDM.WriteTransaction.StartTransaction;
      ImportXMLDM.pFIBStoredProc.StoredProcName                          := 'TI_SP_VID_NAKL_INS';
      ImportXMLDM.pFIBStoredProc.ParamByName('data_vipiski').Value       := StrToDate(ViewForm.XMLDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]);
      //showmessage(ViewForm.XMLDataVidNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2]);
      ImportXMLDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value           := ViewForm.XMLDataVidNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2];
      ImportXMLDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value          := LastNumVidNakl;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value   := Id_Type_Doc;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value := name_type_doc;
      ImportXMLDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value   := trim(ViewForm.XMLDataVidNaklGridTableView1_NAME_TYPE_DOC_OZN.DataBinding.DataController.Values[i,4]);
      ImportXMLDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value        := ViewForm.XMLDataVidNaklGridTableView_NAME_TYPE_DOC_OZN2.DataBinding.DataController.Values[i,5];;
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value     := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value        := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value      := ViewForm.XMLDataVidNaklGridTableView_NAME_CUSTOMER.DataBinding.DataController.Values[i,6];
      ImportXMLDM.pFIBStoredProc.ParamByName('ipn_customer').Value       := ViewForm.XMLDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.DataController.Values[i,7];
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
      ImportXMLDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
      ImportXMLDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := name_subdivision;
      ImportXMLDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := id_subdivision;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := ViewForm.XMLDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,10];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := ViewForm.XMLDataVidNaklGridTableView_SUMMA_TAXABLE_20.DataBinding.DataController.Values[i,9];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := ViewForm.XMLDataVidNaklGridTableView_SUMMA_TAXABLE_0.DataBinding.DataController.Values[i,11];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := ViewForm.XMLDataVidNaklGridTableView_SUMMA_EXEMPT.DataBinding.DataController.Values[i,12];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := ViewForm.XMLDataVidNaklGridTableView_SUMMA_EXPORT.DataBinding.DataController.Values[i,13];
      ImportXMLDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;// ?
      ImportXMLDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := ReestrParamIn.Id_reestr;;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := StrToInt('-1');
      ImportXMLDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('is_import').Value           := 1;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';
      ImportXMLDM.pFIBStoredProc.ExecProc;
      id_vid_nakl := ImportXMLDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
      // проверка настройки подразделений
      ImportXMLDM.pFIBStoredProc.StoredProcName                      := 'TI_BUDGET_NDS_IMPORT_PROVERKA';
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := ID_SUBDIVISION;
      if (ViewForm.XMLDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,8] <> 0) then
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NDS').Value := 1;
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 1;
        end
      else
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NDS').Value := 0;
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 0;
        end;

      if (ViewForm.XMLDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,10] <> 0) then
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 1;
        end
      else
        ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 0;

      ImportXMLDM.pFIBStoredProc.ExecProc;

      if (ImportXMLDM.pFIBStoredProc.ParamByName('OUT').Value = 1)then
      begin
        TiShowMessage('Виникла помилка!',ImportXMLDM.pFIBStoredProc.ParamByName('error_message').Value,mtError,[mbOK]);
        ImportXMLDM.WriteTransaction.Rollback;
        CloseWaitForm(wf);
        Exit;
      end;

      // добавление бюджетов в таблицу TI_BUDGET_NDS

      ImportXMLDM.pFIBStoredProc.StoredProcName                      := 'TI_BUDGET_NDS_IMPORT';
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := ID_SUBDIVISION;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_vid_nakl;
      ImportXMLDM.pFIBStoredProc.ParamByName('IS_VID').Value         := 1;

      if (ViewForm.XMLDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,10] <> 0) then
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NDS').Value        := 1;
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value    := 1;
          ImportXMLDM.pFIBStoredProc.ParamByName('summa_not_nds').Value := ViewForm.XMLDataVidNaklGridTableView_SUMMA_TAXABLE_20.DataBinding.DataController.Values[i,9];
          ImportXMLDM.pFIBStoredProc.ParamByName('summa_nds').Value     := ViewForm.XMLDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,10];
        end
      else
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NDS').Value        := 0;
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value    := 1;
          ImportXMLDM.pFIBStoredProc.ParamByName('summa_not_nds').Value := ViewForm.XMLDataVidNaklGridTableView_SUMMA_EXEMPT.DataBinding.DataController.Values[i,12];
          ImportXMLDM.pFIBStoredProc.ParamByName('summa_nds').Value     := 0;
        end;

      ImportXMLDM.pFIBStoredProc.ExecProc;


      //добавление проводки по этой налоговой накладной
      //проверка - необходимо ли отражать её в бухгалтерию
      if (ViewForm.XMLDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,10] <> 0)then
      begin
        //добавление проводок в буфера
        ImportXMLDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
        ImportXMLDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_vid_nakl;
        ImportXMLDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
        ImportXMLDM.pFIBStoredProc.ExecProc;

        //ImportXMLDM.WriteTransaction.Commit;
        //ImportXMLDM.WriteTransaction.StartTransaction;
        // добавление проводки
        KEY_SESSION := ImportXMLDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
        workdate    := ImportXMLDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
        //ShowMessage(IntToStr(KEY_SESSION));

        STRU.KEY_SESSION   := KEY_SESSION;
        STRU.WORKDATE      := WORKDATE;
        STRU.DBHANDLE      := ImportXMLDM.DB.Handle;
        STRU.TRHANDLE      := ImportXMLDM.WriteTransaction.Handle;
        STRU.KERNEL_ACTION := 1;
        STRU.ID_USER       := TaxInvoicesUser.id_user;

        try
          DoResult:=Kernel.KernelDo(@STRU);
        except
         on E:Exception do
         begin
           ShowMessage('Помилка ядра ' + E.Message);
           Exit;
         end;
        end;

       if not DoResult then
       begin
         ErrorList := Kernel.GetDocErrorsListEx(@STRU);

        s := '';
        for j:=0 to ErrorList.Count - 1 do
         begin
           if s <> '' then s := s + #13;
           s := s + ErrorList.Strings[j];
         end;
         //ShowMessage(ViewForm.XMLDataVidNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2]);
         ShowMessage(s);
         ImportXMLDM.WriteTransaction.Rollback;
         Exit;
       end;
      end;

    end;
   end;
    //--------------------------------------импорт полученных накладных

    if (Length(r.dataOtr)<>0) then
    begin
    for i :=0 to ViewForm.XMLDataOtrNaklGridTableView1.DataController.RecordCount - 1 do
    begin
      //поиск номера

      //ImportXMLDM.WriteTransaction.StartTransaction;
      ImportXMLDM.pFIBStoredProc.StoredProcName                 := 'TI_LAST_NOMER_NAKL_SEARCH';
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := ReestrParamIn.Id_reestr;
      ImportXMLDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 0; //полученные накладные
      ImportXMLDM.pFIBStoredProc.ExecProc;
      //ImportXMLDM.WriteTransaction.Commit;
      LastNumOtrNakl := ImportXMLDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').Value;

      //поиск кода

      Id_Type_Doc   := 0;
      Name_Type_Doc := '';
      CharCod       := ViewForm.XMLDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3];

      //ImportXMLDM.WriteTransaction.StartTransaction;
      ImportXMLDM.pFIBStoredProc.StoredProcName := 'TI_TYPE_DOC_SEARCH';
      ImportXMLDM.pFIBStoredProc.ParamByName('KOD').Value   := CharCod;
      ImportXMLDM.pFIBStoredProc.ParamByName('IDSPR').Value := 1; // полученные- 1 выданные- 2
      ImportXMLDM.pFIBStoredProc.ExecProc;
      //ImportXMLDM.WriteTransaction.Commit;
      if (ImportXMLDM.pFIBStoredProc.ParamByName('id_type_doc').Value = null) then
      begin
        Id_Type_Doc   := 0;
        Name_Type_Doc := '';
      end
      else
      begin
        Id_Type_Doc   := ImportXMLDM.pFIBStoredProc.ParamByName('id_type_doc').Value;
        name_type_doc := ImportXMLDM.pFIBStoredProc.ParamByName('name_type_doc').Value;
      end;
      //Id_Type_Doc   := ImportXMLDM.pFIBStoredProc.ParamByName('id_type_doc').Value;
     // name_type_doc := ImportXMLDM.pFIBStoredProc.ParamByName('name_type_doc').Value;

      // добавление записи в таблицу полученных накладных
      //ImportXMLDM.WriteTransaction.StartTransaction;
      ImportXMLDM.pFIBStoredProc.StoredProcName                          := 'TI_SP_OTR_NAKL_INS';
      ImportXMLDM.pFIBStoredProc.ParamByName('DATA_OTR').Value           := StrToDate(ViewForm.XMLDataOtrNaklGridTableView_DATA_OTR.DataBinding.DataController.Values[i,0]);
      ImportXMLDM.pFIBStoredProc.ParamByName('DATA_VIPISKI').Value       := StrToDate(ViewForm.XMLDataOtrNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]);
      ImportXMLDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value           := ViewForm.XMLDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2];
      ImportXMLDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value          := LastNumOtrNakl;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value   := Id_Type_Doc;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value := name_type_doc;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_PROVIDER').Value        := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_PROVIDER').Value      := ViewForm.XMLDataOtrNaklGridTableView_NAME_PROVIDER.DataBinding.DataController.Values[i,4];
      ImportXMLDM.pFIBStoredProc.ParamByName('IPN_PROVIDER').Value       := ViewForm.XMLDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.DataController.Values[i,5];
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value     := TaxInvoicesUser.id_user;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value   := TaxInvoicesUser.name_user;
      ImportXMLDM.pFIBStoredProc.ParamByName('date_time_create').Value   := Now;
      ImportXMLDM.pFIBStoredProc.ParamByName('pk_id').Value              := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('is_import').Value          := 1;
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_20_0_NOT_PDV').Value := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.DataController.Values[i,7];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_20_0_PDV').Value     := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT_NOT_PDV').Value     := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.DataController.Values[i,9];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT_PDV').Value         := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.DataController.Values[i,10];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_ECON_ACTIV_NOT_PDV').Value := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV.DataBinding.DataController.Values[i,11];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_ECON_ACTIV_PDV').Value     := ViewForm.XMLDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV.DataBinding.DataController.Values[i,12];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY_NOT_PDV').Value   := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV.DataBinding.DataController.Values[i,13];
      ImportXMLDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY_PDV').Value       := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV.DataBinding.DataController.Values[i,14];
      ImportXMLDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;// ?
      ImportXMLDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value      := id_subdivision;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := ReestrParamIn.Id_reestr;;
      ImportXMLDM.pFIBStoredProc.ExecProc;
      //ImportXMLDM.WriteTransaction.Commit;
        id_otr_nakl := ImportXMLDM.pFIBStoredProc.ParamByName('id_otr_nakl_').Value;
      // проверка настройки подразделений
      ImportXMLDM.pFIBStoredProc.StoredProcName                      := 'TI_BUDGET_NDS_IMPORT_PROVERKA';
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := ID_SUBDIVISION;
      if (ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8] <> 0) then
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NDS').Value := 1;
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 1;
        end
      else
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NDS').Value := 0;
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 0;
        end;

      if (ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8] <> 0) then
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 1;
        end
      else
        ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 0;

      ImportXMLDM.pFIBStoredProc.ExecProc;

      if (ImportXMLDM.pFIBStoredProc.ParamByName('OUT').Value = 1)then
      begin
        TiShowMessage('Виникла помилка!',ImportXMLDM.pFIBStoredProc.ParamByName('error_message').Value,mtError,[mbOK]);
        ImportXMLDM.WriteTransaction.Rollback;
        CloseWaitForm(wf);
        Exit;
      end;

      // добавление бюджетов в таблицу TI_BUDGET_NDS

      ImportXMLDM.pFIBStoredProc.StoredProcName                      := 'TI_BUDGET_NDS_IMPORT';
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := ID_SUBDIVISION;
      ImportXMLDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_otr_nakl;
      ImportXMLDM.pFIBStoredProc.ParamByName('IS_VID').Value         := 0;
      ImportXMLDM.pFIBStoredProc.ParamByName('summa_not_nds').Value  := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.DataController.Values[i,7]+ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.DataController.Values[i,9]+ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.DataController.Values[i,10];
      ImportXMLDM.pFIBStoredProc.ParamByName('summa_nds').Value      := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8];
      if (ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8] <> 0) then
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NDS').Value        := 1;
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value    := 1;
          ImportXMLDM.pFIBStoredProc.ParamByName('summa_not_nds').Value := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.DataController.Values[i,7]+ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.DataController.Values[i,9]+ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.DataController.Values[i,10];
          ImportXMLDM.pFIBStoredProc.ParamByName('summa_nds').Value     := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8];
        end
      else
        begin
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NDS').Value        := 0;
          ImportXMLDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value    := 1;
          ImportXMLDM.pFIBStoredProc.ParamByName('summa_not_nds').Value := ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.DataController.Values[i,7]+ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.DataController.Values[i,9]+ViewForm.XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.DataController.Values[i,10];
          ImportXMLDM.pFIBStoredProc.ParamByName('summa_nds').Value     := 0;
        end;

      ImportXMLDM.pFIBStoredProc.ExecProc;


      //добавление проводки по этой налоговой накладной
      //проверка - необходимо ли отражать её в бухгалтерию
      if (ViewForm.XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8] <> 0)then
      begin
        //добавление проводок в буфера
        ImportXMLDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_OTR_NAKL';
        ImportXMLDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL').Value        := id_otr_nakl;
        ImportXMLDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
        ImportXMLDM.pFIBStoredProc.ExecProc;

        //ImportXMLDM.WriteTransaction.Commit;
        //ImportXMLDM.WriteTransaction.StartTransaction;
        // добавление проводки
        KEY_SESSION := ImportXMLDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
        workdate    := ImportXMLDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
        //ShowMessage(IntToStr(KEY_SESSION));

        STRU.KEY_SESSION   := KEY_SESSION;
        STRU.WORKDATE      := WORKDATE;
        STRU.DBHANDLE      := ImportXMLDM.DB.Handle;
        STRU.TRHANDLE      := ImportXMLDM.WriteTransaction.Handle;
        STRU.KERNEL_ACTION := 1;
        STRU.ID_USER       := TaxInvoicesUser.id_user;

        try
          DoResult:=Kernel.KernelDo(@STRU);
        except
         on E:Exception do
         begin
           ShowMessage('Помилка ядра ' + E.Message);
           Exit;
         end;
        end;

       if not DoResult then
       begin
         ErrorList := Kernel.GetDocErrorsListEx(@STRU);

        s := '';
        for j:=0 to ErrorList.Count - 1 do
         begin
           if s <> '' then s := s + #13;
           s := s + ErrorList.Strings[j];
         end;

         ShowMessage(s);
         ImportXMLDM.WriteTransaction.Rollback;
         Exit;
       end;
      end;

    end;
    end;

   {except
    begin
      TiShowMessage('Виникла помилка!','Імпорт з xml-файлу не зроблено.',mtError,[mbOK]);
      ImportXMLDM.WriteTransaction.Rollback;
      CloseWaitForm(wf);
      Exit;
    end;
   end; }

   ImportXMLDM.WriteTransaction.Commit;
   CloseWaitForm(wf);
   TiShowMessage('Увага!','Дані Імпортовано.',mtWarning,[mbOK]);
   Close;
  end;
end;

procedure TImportXMLReestrForm.eFileNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
 if OpenDialog.Execute then
   begin
      eFileNameEdit.Text := OpenDialog.FileName;
      path := OpenDialog.FileName;
   end;
end;

procedure TRee.addItem(indexCol, indexRow: integer; dataItem: String);
begin
    if (Length(data)=indexRow) or (Length(data)=0)then
    begin
      SetLength(data , Length(data)+1);
      SetLength(data[indexRow],12);
    end;
     data[indexRow, indexCol] := dataItem;
     kol_vo_Vid_nakl := indexRow;
end;

procedure TRee.addItemOtr(indexCol, indexRow: integer; dataItem: String);
begin
    if (Length(dataOtr)=indexRow) or (Length(dataOtr)=0)then
    begin
      SetLength(dataOtr , Length(dataOtr)+1);
      SetLength(dataOtr[indexRow],12);
    end;
     dataOtr[indexRow, indexCol] := dataItem;
     kol_vo_Otr_nakl := indexRow;
end;

procedure TRee.createObj;
begin
  //выданные налоговые накладные
     T1RXXXXG1  := 'T1RXXXXG1';
     T1RXXXXG2D := 'T1RXXXXG2D';
     T1RXXXXG3S := 'T1RXXXXG3S';
     T1RXXXXG4S := 'T1RXXXXG4S';
     T1RXXXXG41S := 'T1RXXXXG41S';
     T1RXXXXG42S := 'T1RXXXXG42S';
     T1RXXXXG43S := 'T1RXXXXG43S';
     T1RXXXXG5S := 'T1RXXXXG5S';
     T1RXXXXG6  := 'T1RXXXXG6';
     T1RXXXXG7  := 'T1RXXXXG7';
     T1RXXXXG8  := 'T1RXXXXG8';
     T1RXXXXG9  := 'T1RXXXXG9';
     T1RXXXXG11 := 'T1RXXXXG113';
    { T1RXXXXG10 := 'T1RXXXXG10';
     T1RXXXXG11 := 'T1RXXXXG11';
     T1RXXXXG12 := 'T1RXXXXG12'; }
  //полученные налоговые накладные
     T2RXXXXG1  := 'T2RXXXXG1';
     T2RXXXXG2D := 'T2RXXXXG2D';
     T2RXXXXG3D := 'T2RXXXXG3D';
     T2RXXXXG4S := 'T2RXXXXG4S';
     //T2RXXXXG5S := 'T2RXXXXG5S';
     T2RXXXXG51S := 'T2RXXXXG51S';
     T2RXXXXG6S := 'T2RXXXXG6S';
     T2RXXXXG7  := 'T2RXXXXG7';
     T2RXXXXG8  := 'T2RXXXXG8';
     T2RXXXXG9  := 'T2RXXXXG110';
     T2RXXXXG10 := 'T2RXXXXG111';
     T2RXXXXG11 := 'T2RXXXXG11';
     T2RXXXXG12 := 'T2RXXXXG12';

     {T2RXXXXG13 := 'T2RXXXXG13';
     T2RXXXXG14 := 'T2RXXXXG14';
     T2RXXXXG15 := 'T2RXXXXG15';
     T2RXXXXG16 := 'T2RXXXXG16'; }
   //загрузка констант в массив (выданные накл.)
     SetLength(xmlCol, 12);
     xmlCol[0]  := T1RXXXXG1;
     xmlCol[1]  := T1RXXXXG2D;
     xmlCol[2]  := T1RXXXXG3S;
     xmlCol[3]  := T1RXXXXG41S;
     xmlCol[4]  := T1RXXXXG42S;
     xmlCol[5]  := T1RXXXXG43S;
     xmlCol[6]  := T1RXXXXG5S;
     xmlCol[7]  := T1RXXXXG6;
     xmlCol[8]  := T1RXXXXG7;
     xmlCol[9]  := T1RXXXXG8;
     xmlCol[10] := T1RXXXXG9;
     xmlCol[11] := T1RXXXXG11;

     {xmlCol[10] := T1RXXXXG11;
     xmlCol[11] := T1RXXXXG12;}

    //загрузка констант в массив (полученные накл.)
     SetLength(xmlColOtr, 12);
     xmlColOtr[0]  := T2RXXXXG1;
     xmlColOtr[1]  := T2RXXXXG2D;
     xmlColOtr[2]  := T2RXXXXG3D;
     xmlColOtr[3]  := T2RXXXXG4S;
     xmlColOtr[4]  := T2RXXXXG51S;
     xmlColOtr[5]  := T2RXXXXG6S;
     xmlColOtr[6]  := T2RXXXXG7;
     xmlColOtr[7]  := T2RXXXXG8;
     xmlColOtr[8]  := T2RXXXXG9;
     xmlColOtr[9]  := T2RXXXXG10;
     xmlColOtr[10] := T2RXXXXG11;
     xmlColOtr[11] := T2RXXXXG12;
     {xmlColOtr[12] := T2RXXXXG13;
     xmlColOtr[13] := T2RXXXXG14;
     xmlColOtr[14] := T2RXXXXG15;
     xmlColOtr[15] := T2RXXXXG16; }
end;

procedure TRee.init(path: string);
var
	aDoc: IXmlDocument;
	a2: IXmlNode;
  anElem:IXmlElement;
  i,j:Integer;
  flag:Boolean;
  kolvo_vid : Integer;
  kolvo_otr : Integer;
begin
	aDoc := CreateXmlDocument;
  aDoc.Load(path);
  a2:=aDoc.DocumentElement.SelectSingleNode('DECLARBODY');
  //подсчет выданных накл.
  i := 0;
  while (true)do
  begin
    anElem:=a2.FindElement(xmlCol[0], 'ROWNUM', IntToStr(i+1));
    if anElem = nil then
    begin
      kolvo_vid := i;
      Break;
    end;
    i:=i+1;
  end;

  //подсчет получ. накл.
  i := 0;
  while (true)do
  begin
    anElem:=a2.FindElement(xmlColOtr[0], 'ROWNUM', IntToStr(i+1));
    if anElem = nil then
    begin
      kolvo_otr := i;
      Break;
    end;
    i:=i+1;
  end;

  i    := 0;        //вставка данных выданные накладные
  flag := False;
  while (true)do
  begin
    for j:=0 to 11 do
      begin
        anElem:=a2.FindElement(xmlCol[j], 'ROWNUM', IntToStr(i+1));
        if anElem <>nil then
        begin
          addItem( j,i, anElem.Text);
        end
        else
        begin
          if (i <> kolvo_vid) then
          begin
            if xmlCol[j] = 'T1RXXXXG42S' then
              addItem( j,i,'')
            else
             if xmlCol[j] = 'T1RXXXXG43S' then
              addItem( j,i,'')
             else
              addItem( j,i,'0');
          end
          else
          begin
            flag:=true;
            Break;
          end;
        end;
      end;
      if flag then Break;
      i:=i+1;
  end;

  i    := 0;         // вставка данных полученные налоговые
  flag := False;
  while (true)do
  begin
    for j:=0 to 11 do
      begin
        anElem:=a2.FindElement(xmlColOtr[j], 'ROWNUM', IntToStr(i+1));

        if anElem <>nil then
        begin
          addItemOtr( j,i, anElem.Text);
        end
        else
        begin
          if (i <> kolvo_otr) then
          begin
            addItemOtr( j,i,'0');
          end
          else
          begin
            flag:=true;
            Break;
          end;
        end;
      end;
      if flag then Break;
      i:=i+1;
  end;
end;

procedure TImportXMLReestrForm.SubdivisionButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  SubDivision:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
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
  end;
end;

end.
