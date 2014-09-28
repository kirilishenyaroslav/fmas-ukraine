unit TaxInvoicesFilterTypeNakl;

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
  TTaxInvoicesTypeNaklForm = class(TForm)
    ImportPanel: TGroupBox;
    StartBtn: TcxButton;
    GroupBox2: TGroupBox;
    NaklLabel: TcxLabel;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    PeriodGroupBox: TGroupBox;
    ZLabel: TcxLabel;
    POLabel: TcxLabel;
    TypeDocumentGroupBox: TcxGroupBox;
    TypeDocNaklButtonEdit: TcxButtonEdit;
    DateBegDateEdit: TcxDateEdit;
    DateEndDateEdit: TcxDateEdit;
    GroupBox1: TGroupBox;
    VidNaklRadioButton: TRadioButton;
    OtrNaklRadioButton: TRadioButton;
    procedure StartBtnClick(Sender: TObject);
    procedure SubdivisionButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeDocVidNaklButtonEditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure TypeDocOtrNaklButtonEditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
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
  TaxInvoicesTypeNaklForm: TTaxInvoicesTypeNaklForm;

implementation

uses TaxInvoicesFilter_DM;

{$R *.dfm}
constructor TTaxInvoicesTypeNaklForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
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
  TypeDocNaklButtonEdit.Text := '';
  DateBegDateEdit.Date := Now;
  DateEndDateEdit.Date := Now;
  
  Caption := 'Фільтр отриманих та виданих податкових накладних за контрагентом';
end;
procedure TTaxInvoicesTypeNaklForm.StartBtnClick(Sender: TObject);
var
  i,j              : Integer;
  const NameReportVidNakl = '\Reports\TaxInvoices\FilterTypeVidNakl.fr3';
  const NameReportOtrNakl = '\Reports\TaxInvoices\FilterTypeOtrNakl.fr3';
begin
    if (TypeDocNaklButtonEdit.Text = '') then
    begin
      TiShowMessage('Увага!','Заповніть тип документу!',mtWarning,[mbOK]);
      TypeDocNaklButtonEdit.SetFocus;
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

  TaxInvoicesFilterDM.TypeNaklDSet.Close;

  if (VidNaklRadioButton.Checked = True) then
  begin
    //отбор выданных налоговых накладных по типу налоговой накладной
    TaxInvoicesFilterDM.TypeNaklDSet.Close;
    TaxInvoicesFilterDM.TypeNaklDSet.SelectSQL.Text := 'select * from TI_SELECT_TYPE_VID_NAKL(:DATEBEG,:DATEEND,:ID_TIP_DOC_VID_NAKL)';
    TaxInvoicesFilterDM.TypeNaklDSet.ParamByName('DATEBEG').AsDate            := DateBegDateEdit.Date;
    TaxInvoicesFilterDM.TypeNaklDSet.ParamByName('DATEEND').AsDate            := DateEndDateEdit.Date;
    TaxInvoicesFilterDM.TypeNaklDSet.ParamByName('ID_TIP_DOC_VID_NAKL').Value := PParameter.Id_TypeDocumentVidNakl;
    TaxInvoicesFilterDM.TypeNaklDSet.Open;
  end;

  if (OtrNaklRadioButton.Checked = True) then
  begin
    //отбор полученных налоговых накладных по типу накладных
    TaxInvoicesFilterDM.TypeNaklDSet.Close;
    TaxInvoicesFilterDM.TypeNaklDSet.SelectSQL.Text := 'select * from TI_SELECT_TYPE_OTR_NAKL(:DATEBEG,:DATEEND,:ID_TIP_DOC_OTR_NAKL)';
    TaxInvoicesFilterDM.TypeNaklDSet.ParamByName('DATEBEG').AsDate := DateBegDateEdit.Date;
    TaxInvoicesFilterDM.TypeNaklDSet.ParamByName('DATEEND').AsDate := DateEndDateEdit.Date;
    TaxInvoicesFilterDM.TypeNaklDSet.ParamByName('ID_TIP_DOC_OTR_NAKL').Value := PParameter.Id_TypeDocumentOtrNakl;
    TaxInvoicesFilterDM.TypeNaklDSet.Open;
  end;

  if (TaxInvoicesFilterDM.TypeNaklDSet.IsEmpty = true)
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
      TaxInvoicesFilterDM.Report.Variables.Clear;
      TaxInvoicesFilterDM.Report.Variables['type_nakl'] := ''''+PParameter.Name_TypeDocumentVidNakl+'''';
    end
    else
    begin
      TaxInvoicesFilterDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportOtrNakl,True);
      TaxInvoicesFilterDM.Report.Variables.Clear;
      TaxInvoicesFilterDM.Report.Variables['type_nakl'] := ''''+PParameter.Name_TypeDocumentOtrNakl+'''';
    end;


    TaxInvoicesFilterDM.Report.Variables['datebeg']   := ''''+DateToStr(DateBegDateEdit.Date)+'''';
    TaxInvoicesFilterDM.Report.Variables['dateend']   := ''''+DateToStr(DateEndDateEdit.Date)+'''';

    //TaxInvoicesFilterDM.Report.DesignReport;
    TaxInvoicesFilterDM.Report.ShowReport;
    Close;
  end;

end;

procedure TTaxInvoicesTypeNaklForm.SubdivisionButtonEditPropertiesButtonClick(
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

procedure TTaxInvoicesTypeNaklForm.TypeDocVidNaklButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  TypeDoc:Variant;
begin
  if (VidNaklRadioButton.Checked = True) then
  begin
    TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesFilterDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',2);
    If VarArrayDimCount(TypeDoc)>0 then
    begin
      PParameter.Id_TypeDocumentVidNakl   := TypeDoc[0];
      PParameter.Name_TypeDocumentVidNakl := TypeDoc[1];
      TypeDocNaklButtonEdit.Text          := TypeDoc[1];
    end;
  end;

  if (OtrNaklRadioButton.Checked = True) then
  begin
    TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesFilterDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',1);
    If VarArrayDimCount(TypeDoc)>0 then
    begin
      PParameter.Id_TypeDocumentOtrNakl   := TypeDoc[0];
      PParameter.Name_TypeDocumentOtrNakl := TypeDoc[1];
      TypeDocNaklButtonEdit.Text          := TypeDoc[1];
    end;
  end;
end;

procedure TTaxInvoicesTypeNaklForm.TypeDocOtrNaklButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  TypeDoc:Variant;
begin
  TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesFilterDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',1);
  If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.Id_TypeDocumentOtrNakl   := TypeDoc[0];
    PParameter.Name_TypeDocumentOtrNakl := TypeDoc[1];
    TypeDocNaklButtonEdit.Text          := TypeDoc[1];
  end;
end;

end.
