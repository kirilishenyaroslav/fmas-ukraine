unit TaxInvoicesFilterSubdivision;

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

type TTaxInvoicesFilterSubdivision = record
  Id_Subdivision   : Integer;
end;


type
  TTaxInvoicesFilterSubdivisionForm = class(TForm)
    ImportPanel: TGroupBox;
    StartBtn: TcxButton;
    GroupBox2: TGroupBox;
    NaklLabel: TcxLabel;
    PeriodGroupBox: TGroupBox;
    ZLabel: TcxLabel;
    POLabel: TcxLabel;
    DateBegDateEdit: TcxDateEdit;
    DateEndDateEdit: TcxDateEdit;
    GroupBox1: TGroupBox;
    VidNaklRadioButton: TRadioButton;
    OtrNaklRadioButton: TRadioButton;
    procedure StartBtnClick(Sender: TObject);
  private
    PDb_Handle      : TISC_DB_HANDLE;
    TaxInvoicesUser : TTaxInvocesUser;
    path          : string;
    ReestrParamIn : TReestrParam;
    PRes          : Variant;
    PParameter    : TTaxInvoicesFilterSubdivision;
  public
    //kol_vo_Vid_nakl : Integer;
    kol_vo_Otr_nakl : Integer;
    id_subdivision : Integer;
    name_subdivision : string;

    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
    property Parameter:TTaxInvoicesFilterSubdivision read PParameter;
  end;

var
  TaxInvoicesFilterSubdivisionForm: TTaxInvoicesFilterSubdivisionForm;

implementation

uses TaxInvoicesFilter_DM;

{$R *.dfm}
constructor TTaxInvoicesFilterSubdivisionForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
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
  VidNaklRadioButton.Checked    := True;
  OtrNaklRadioButton.Checked    := False;
  DateBegDateEdit.Date := Now;
  DateEndDateEdit.Date := Now;
  
  Caption := 'Фільтр отриманих та виданих податкових накладних (підрозділ)';
end;
procedure TTaxInvoicesFilterSubdivisionForm.StartBtnClick(Sender: TObject);
var
  i,j              : Integer;
  const NameReportVidNakl = '\Reports\TaxInvoices\FilterSubdivisionVidNakl.fr3';
  const NameReportOtrNakl = '\Reports\TaxInvoices\FilterSubdivisionOtrNakl.fr3';
begin
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

  if (VidNaklRadioButton.Checked = True) then
  begin
    //отбор выданных налоговых накладных по подразделениям
    TaxInvoicesFilterDM.SubdivisionFilterDSet.Close;
    TaxInvoicesFilterDM.SubdivisionFilterDSet.SelectSQL.Text := 'select * from TI_SELECT_VID_NAKL_SUBDIVISION(:DATEBEG,:DATEEND)';
    TaxInvoicesFilterDM.SubdivisionFilterDSet.ParamByName('DATEBEG').AsDate := DateBegDateEdit.Date;
    TaxInvoicesFilterDM.SubdivisionFilterDSet.ParamByName('DATEEND').AsDate := DateEndDateEdit.Date;
  end;

  if (OtrNaklRadioButton.Checked = True) then
  begin
    //отбор полученных налоговых накладных по подразделениям
    TaxInvoicesFilterDM.SubdivisionFilterDSet.Close;
    TaxInvoicesFilterDM.SubdivisionFilterDSet.SelectSQL.Text := 'select * from TI_SELECT_OTR_NAKL_SUBDIVISION(:DATEBEG,:DATEEND)';
    TaxInvoicesFilterDM.SubdivisionFilterDSet.ParamByName('DATEBEG').AsDate := DateBegDateEdit.Date;
    TaxInvoicesFilterDM.SubdivisionFilterDSet.ParamByName('DATEEND').AsDate := DateEndDateEdit.Date;
  end;

  TaxInvoicesFilterDM.SubdivisionFilterDSet.Open;

  if (TaxInvoicesFilterDM.SubdivisionFilterDSet.IsEmpty = true) then
  begin
    TiShowMessage('Увага!','За такими параметрами немає інформації!',mtWarning,[mbOK]);
  end
  else
  begin
    //создаем репорт
    if (VidNaklRadioButton.Checked = True)then
    begin
      TaxInvoicesFilterDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportVidNakl,True);
      TaxInvoicesFilterDM.Report.Variables.Clear;
      TaxInvoicesFilterDM.Report.Variables['datebeg']         := ''''+DateToStr(DateBegDateEdit.Date)+'''';
      TaxInvoicesFilterDM.Report.Variables['dateend']         := ''''+DateToStr(DateEndDateEdit.Date)+'''';
      //TaxInvoicesFilterDM.Report.DesignReport;
      TaxInvoicesFilterDM.Report.ShowReport;
    end;

    if (OtrNaklRadioButton.Checked = True)then
    begin
      TaxInvoicesFilterDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportOtrNakl,True);
      TaxInvoicesFilterDM.Report.Variables.Clear;
      TaxInvoicesFilterDM.Report.Variables['datebeg']         := ''''+DateToStr(DateBegDateEdit.Date)+'''';
      TaxInvoicesFilterDM.Report.Variables['dateend']         := ''''+DateToStr(DateEndDateEdit.Date)+'''';
      //TaxInvoicesFilterDM.Report.DesignReport;
      TaxInvoicesFilterDM.Report.ShowReport;
    end;
    Close;
  end;

end;

end.
