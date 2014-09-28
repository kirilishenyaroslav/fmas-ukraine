unit TIImportDBFData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,TiCommonStyles, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxSplitter,TIImportDBFControlInfo, Buttons,TITaxInvoicesDM, TiCommonTypes, Ibase;

type
  TImportDBFForm = class(TForm)
    Panel1: TPanel;
    DBFDataVidNaklGrid: TcxGrid;
    Panel3: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DBFDataVidNaklGridTableView1: TcxGridTableView;
    DBFDataVidNaklGridLevel1: TcxGridLevel;
    DBFDataVidNaklGridTableView_NUM_ORDER: TcxGridColumn;
    DBFDataVidNaklGridTableView_DATA_VIPISKI: TcxGridColumn;
    DBFDataVidNaklGridTableView_NUM_NAKL: TcxGridColumn;
    DBFDataVidNaklGridTableView_NAME_TYPE_DOCUMENT: TcxGridColumn;
    DBFDataVidNaklGridTableView_NAME_CUSTOMER: TcxGridColumn;
    DBFDataVidNaklGridTableView_IPN_CUSTOMER: TcxGridColumn;
    DBFDataVidNaklGridTableView_SUMMA_ALL_PDV: TcxGridColumn;
    DBFDataVidNaklGridTableView_SUMMA_TAXABLE_20: TcxGridColumn;
    DBFDataVidNaklGridTableView_SUMMA_PDV_20: TcxGridColumn;
    DBFDataVidNaklGridTableView_SUMMA_TAXABLE_0: TcxGridColumn;
    DBFDataVidNaklGridTableView_SUMMA_EXEMPT: TcxGridColumn;
    DBFDataVidNaklGridTableView_SUMMA_EXPORT: TcxGridColumn;
    ReestrSplitter: TcxSplitter;
    Panel4: TPanel;
    Panel2: TPanel;
    DBFDataOtrNaklGrid: TcxGrid;
    DBFDataOtrNaklGridTableView1: TcxGridTableView;
    DBFDataOtrNaklGridTableView_DATA_OTR: TcxGridColumn;
    DBFDataOtrNaklGridTableView_DATA_VIPISKI: TcxGridColumn;
    DBFDataOtrNaklGridTableView_NUM_NAKL: TcxGridColumn;
    DBFDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT: TcxGridColumn;
    DBFDataOtrNaklGridTableView_NAME_PROVIDER: TcxGridColumn;
    DBFDataOtrNaklGridTableView_IPN_PROVIDER: TcxGridColumn;
    DBFDataOtrNaklGridTableView_SUMMA_ALL_PDV: TcxGridColumn;
    DBFDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV: TcxGridColumn;
    DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV: TcxGridColumn;
    DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV: TcxGridColumn;
    DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV: TcxGridColumn;
    DBFDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV: TcxGridColumn;
    DBFDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV: TcxGridColumn;
    DBFDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV: TcxGridColumn;
    DBFDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV: TcxGridColumn;
    DBFDataOtrNaklGridLevel1: TcxGridLevel;
    BitBtn1: TBitBtn;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ReestrSplitterAfterOpen(Sender: TObject);
    procedure ReestrSplitterAfterClose(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    PDb_Handle    : TISC_DB_HANDLE;
    ReestrParamIn   : TReestrParam;
    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE; ReestrParam:TReestrParam);reintroduce;
  end;

var
  ImportDBFForm: TImportDBFForm;

implementation

{$R *.dfm}
constructor TImportDBFForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ReestrParam:TReestrParam);
//var
 // ImportXMLDM :TimportXMLDM;
begin
  inherited Create(AOwner);
  PDb_Handle := DB_HANDLE;
  ReestrParamIn := ReestrParam;
end;

procedure TImportDBFForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TImportDBFForm.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure TImportDBFForm.ReestrSplitterAfterOpen(Sender: TObject);
begin
 Panel2.Visible := True;
end;

procedure TImportDBFForm.ReestrSplitterAfterClose(Sender: TObject);
begin
 Panel2.Visible := false;
end;

procedure TImportDBFForm.BitBtn1Click(Sender: TObject);
var
  ControlInfo : string;
  ViewForm    : TControlInfoForm;
  i           : Integer;
  IPN         : string;
begin
  ViewForm := TControlInfoForm.Create(Self,TaxInvoicesDM.DB.Handle,ReestrParamIn);
  ViewForm.ControlMemo.Text := 'Видані накладні: ' +#13#10;
//---------------------поиск ошибок в выданных налоговых накладных------------//

 if (DBFDataVidNaklGridTableView1.DataController.RecordCount <> 1) then
 begin

  for i :=0 to DBFDataVidNaklGridTableView1.DataController.RecordCount - 1 do
  begin
    //проверка на корректность даты выписки налоговой накладной
    if ((DBFDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]<ReestrParamIn.DATABEG_REESTR) or(DBFDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]>ReestrParamIn.DATAEND_REESTR)) then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'Дата виписки виданої под. накл. не співпадає с періодом обраного реєстру. Видана под. накл №'+
      (DBFDataVidNaklGridTableView_NUM_ORDER.DataBinding.DataController.Values[i,0])+#13#10;
    end;
    //проверка на заполнение вида документа
    if (DBFDataVidNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3]='0') then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'Немає виду документу. Видана под. накл №'+
      (DBFDataVidNaklGridTableView_NUM_ORDER.DataBinding.DataController.Values[i,0])+#13#10;
    end;
    //проверка на количество символов налоговогономера
    IPN := DBFDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.DataController.Values[i,5];
    if (Length(IPN)>11) then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'ІПН контрагента більше 11 символів. Видана под. накл №'+
      (DBFDataVidNaklGridTableView_NUM_ORDER.DataBinding.DataController.Values[i,0])+#13#10;
    end;
  end;

  ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text + 'Отримані накладні: ' +#13#10;
 end;



//---------------------поиск ошибок в полученных налоговых накладных------------//
 if (DBFDataOtrNaklGridTableView1.DataController.RecordCount <> 1) then
 begin
  for i :=0 to DBFDataOtrNaklGridTableView1.DataController.RecordCount - 1 do
  begin
    //проверка на корректность даты получения полученной налоговой накладной
    if ((DBFDataOtrNaklGridTableView_DATA_OTR.DataBinding.DataController.Values[i,0]<ReestrParamIn.DATABEG_REESTR) or(DBFDataOtrNaklGridTableView_DATA_OTR.DataBinding.DataController.Values[i,0]>ReestrParamIn.DATAEND_REESTR)) then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'Дата отримання отриманої под. накл. не співпадає с періодом обраного реєстру. Под. накл №'+
      (DBFDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2])+#13#10;
    end;
    //проверка на заполнение вида документа
    if (DBFDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3]='0') then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'Немає виду документу. Под. накл №'+
      (DBFDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2])+#13#10;
    end;
    //проверка на количество символов налоговогономера
    IPN := DBFDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.DataController.Values[i,5];
    if (Length(IPN)>12) then
    begin
      ViewForm.ControlMemo.Text := ViewForm.ControlMemo.Text+'ІПН контрагента більше 12 символів. Под. накл №'+
      (DBFDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2])+#13#10;
    end;
  end;
 end;
  ViewForm.ShowModal;
end;

end.
