unit ImportXMLData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,TiCommonStyles, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxSplitter,ImportXMLControlInfo, Buttons,ImportXML_DM, TiCommonTypes, Ibase;

type
  TImportXMLForm = class(TForm)
    Panel1: TPanel;
    XMLDataVidNaklGrid: TcxGrid;
    Panel3: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    XMLDataVidNaklGridTableView1: TcxGridTableView;
    XMLDataVidNaklGridLevel1: TcxGridLevel;
    XMLDataVidNaklGridTableView_NUM_ORDER: TcxGridColumn;
    XMLDataVidNaklGridTableView_DATA_VIPISKI: TcxGridColumn;
    XMLDataVidNaklGridTableView_NUM_NAKL: TcxGridColumn;
    XMLDataVidNaklGridTableView_NAME_TYPE_DOCUMENT: TcxGridColumn;
    XMLDataVidNaklGridTableView_NAME_CUSTOMER: TcxGridColumn;
    XMLDataVidNaklGridTableView_IPN_CUSTOMER: TcxGridColumn;
    XMLDataVidNaklGridTableView_SUMMA_ALL_PDV: TcxGridColumn;
    XMLDataVidNaklGridTableView_SUMMA_TAXABLE_20: TcxGridColumn;
    XMLDataVidNaklGridTableView_SUMMA_PDV_20: TcxGridColumn;
    XMLDataVidNaklGridTableView_SUMMA_TAXABLE_0: TcxGridColumn;
    XMLDataVidNaklGridTableView_SUMMA_EXEMPT: TcxGridColumn;
    XMLDataVidNaklGridTableView_SUMMA_EXPORT: TcxGridColumn;
    ReestrSplitter: TcxSplitter;
    Panel4: TPanel;
    Panel2: TPanel;
    XMLDataOtrNaklGrid: TcxGrid;
    XMLDataOtrNaklGridTableView1: TcxGridTableView;
    XMLDataOtrNaklGridTableView_DATA_OTR: TcxGridColumn;
    XMLDataOtrNaklGridTableView_DATA_VIPISKI: TcxGridColumn;
    XMLDataOtrNaklGridTableView_NUM_NAKL: TcxGridColumn;
    XMLDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT: TcxGridColumn;
    XMLDataOtrNaklGridTableView_NAME_PROVIDER: TcxGridColumn;
    XMLDataOtrNaklGridTableView_IPN_PROVIDER: TcxGridColumn;
    XMLDataOtrNaklGridTableView_SUMMA_ALL_PDV: TcxGridColumn;
    XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV: TcxGridColumn;
    XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV: TcxGridColumn;
    XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV: TcxGridColumn;
    XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV: TcxGridColumn;
    XMLDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV: TcxGridColumn;
    XMLDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV: TcxGridColumn;
    XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV: TcxGridColumn;
    XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV: TcxGridColumn;
    XMLDataOtrNaklGridLevel1: TcxGridLevel;
    BitBtn1: TBitBtn;
    XMLDataVidNaklGridTableView1_NAME_TYPE_DOC_OZN: TcxGridColumn;
    XMLDataVidNaklGridTableView_NAME_TYPE_DOC_OZN2: TcxGridColumn;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ReestrSplitterAfterOpen(Sender: TObject);
    procedure ReestrSplitterAfterClose(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    PDb_Handle    : TISC_DB_HANDLE;
    ReestrParamIn : TreestrParam;
    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE; ReestrParam:TReestrParam);reintroduce;
  end;

var
  ImportXMLForm: TImportXMLForm;

implementation

{$R *.dfm}
constructor TImportXMLForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ReestrParam:TReestrParam);
//var
 // ImportXMLDM :TimportXMLDM;
begin
  inherited Create(AOwner);
  PDb_Handle := DB_HANDLE;
  ReestrParamIn := ReestrParam;
end;

procedure TImportXMLForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TImportXMLForm.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure TImportXMLForm.ReestrSplitterAfterOpen(Sender: TObject);
begin
 Panel2.Visible := True;
end;

procedure TImportXMLForm.ReestrSplitterAfterClose(Sender: TObject);
begin
 Panel2.Visible := false;
end;

procedure TImportXMLForm.BitBtn1Click(Sender: TObject);
var
  ControlInfo : string;
  ViewForm    : TControlInfoForm;
  i           : Integer;
  IPN         : string;
begin
  ViewForm := TControlInfoForm.Create(Self,ImportXMLDM.DB.Handle,ReestrParamIn);
  ViewForm.ControlMemo.Text := 'Видані накладні: ' +#13#10;
//---------------------поиск ошибок в выданных налоговых накладных------------//

 if (XMLDataVidNaklGridTableView1.DataController.RecordCount <> 1) then
 begin

  for i :=0 to XMLDataVidNaklGridTableView1.DataController.RecordCount - 1 do
  begin
    //проверка на корректность даты выписки налоговой накладной
    if ((XMLDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]<ReestrParamIn.DATABEG_REESTR) or(XMLDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]>ReestrParamIn.DATAEND_REESTR)) then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'Дата виписки виданої под. накл. не співпадає с періодом обраного реєстру. Видана под. накл №'+
      (XMLDataVidNaklGridTableView_NUM_ORDER.DataBinding.DataController.Values[i,0])+#13#10;
    end;
    //проверка на заполнение вида документа
    if (XMLDataVidNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3]='0') then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'Немає виду документу. Видана под. накл №'+
      (XMLDataVidNaklGridTableView_NUM_ORDER.DataBinding.DataController.Values[i,0])+#13#10;
    end;
    //проверка на количество символов налоговогономера
    IPN := XMLDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.DataController.Values[i,5];
    if (Length(IPN)>11) then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'ІПН контрагента більше 11 символів. Видана под. накл №'+
      (XMLDataVidNaklGridTableView_NUM_ORDER.DataBinding.DataController.Values[i,0])+#13#10;
    end;
  end;

  ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text + 'Отримані накладні: ' +#13#10;
 end;



//---------------------поиск ошибок в полученных налоговых накладных------------//
 if (XMLDataOtrNaklGridTableView1.DataController.RecordCount <> 1) then
 begin
  for i :=0 to XMLDataOtrNaklGridTableView1.DataController.RecordCount - 1 do
  begin
    //проверка на корректность даты получения полученной налоговой накладной
    if ((XMLDataOtrNaklGridTableView_DATA_OTR.DataBinding.DataController.Values[i,0]<ReestrParamIn.DATABEG_REESTR) or(XMLDataOtrNaklGridTableView_DATA_OTR.DataBinding.DataController.Values[i,0]>ReestrParamIn.DATAEND_REESTR)) then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'Дата отримання отриманої под. накл. не співпадає с періодом обраного реєстру. Под. накл №'+
      (XMLDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2])+#13#10;
    end;
    //проверка на заполнение вида документа
    if (XMLDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3]='0') then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'Немає виду документу. Под. накл №'+
      (XMLDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2])+#13#10;
    end;
    //проверка на количество символов налоговогономера
    IPN := XMLDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.DataController.Values[i,5];
    if (Length(IPN)>12) then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'ІПН контрагента більше 12 символів. Под. накл №'+
      (XMLDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2])+#13#10;
    end;
  end;
 end;
  ViewForm.ShowModal;
end;

end.
