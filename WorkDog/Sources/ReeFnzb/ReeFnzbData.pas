unit ReeFnzbData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCalc, cxButtonEdit, cxTextEdit, cxCurrencyEdit,
  cxLookAndFeelPainters, dxStatusBar, StdCtrls, cxButtons, ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, cxTL, DB, FIBDataSet, pFIBDataSet,
  DogLoaderUnit, cxCalendar,LoadDogManedger, ActnList, cxMaskEdit, dxBar,
  dxBarExtItems, ImgList,ReeFnzbInput, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc,GlobalSPR,Accmgmt, cxCheckBox, Halcn6db, FnzbChooseRee, ReePosAdd;

type
  TfrmFnzbData = class(TForm)
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxGrid2: TcxGrid;
    cxGrid2TableView1: TcxGridTableView;
    cxGrid2TableView1Column_n_fz: TcxGridColumn;
    cxGrid2TableView1Column_kekv: TcxGridColumn;
    cxGrid2TableView1Column_d_dog: TcxGridColumn;
    cxGrid2TableView1Column_n_dog: TcxGridColumn;
    cxGrid2TableView1Column_name_cust: TcxGridColumn;
    cxGrid2TableView1Column_date_end: TcxGridColumn;
    cxGrid2TableView1Column_summa: TcxGridColumn;
    cxGrid2TableView1Column_id_kekv: TcxGridColumn;
    cxGrid2TableView1Column_id_dog: TcxGridColumn;
    cxGrid2TableView1Column_id_fnzb: TcxGridColumn;
    cxGrid2TableView1Column_id_customer: TcxGridColumn;
    cxGrid2TableView1Column_sum_predopl: TcxGridColumn;
    cxGrid2TableView1Column_summa_fact_fz: TcxGridColumn;
    cxGrid2TableView1Column_summa_fact_pay: TcxGridColumn;
    cxGrid2TableView1Column_id_rate_acc: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    cxGrid2TableView1Column_mfo: TcxGridColumn;
    cxGrid2TableView1Column_name_mfo: TcxGridColumn;
    cxGrid2TableView1Column_rsch: TcxGridColumn;
    DataSource: TDataSource;
    cxGrid2TableView1Column_d_urzb: TcxGridColumn;
    cxGrid2TableView1Column_n_urzb: TcxGridColumn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cxGrid2TableView1Column_id_fnzb_data: TcxGridColumn;
    cxButton_cancel: TcxButton;
    cxButton_ok: TcxButton;
    ActionList1: TActionList;
    ok: TAction;
    cxGrid2TableView1Column_n_int_ur: TcxGridColumn;
    Label11: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    LargeImages: TImageList;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton_print: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton_edit: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    cbDBFPath: TdxBarCombo;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    WorkDB: TpFIBDatabase;
    ReadT: TpFIBTransaction;
    WriteT: TpFIBTransaction;
    Query1: TpFIBQuery;
    StProc: TpFIBStoredProc;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    Panel3: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    dxBarContainerItem2: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarLargeButton3: TdxBarLargeButton;
    StoredProc: TpFIBStoredProc;
    cxGrid2TableView1Column_date_dog: TcxGridColumn;
    cxGrid2TableView1Column_num_dog: TcxGridColumn;
    DataSet: TpFIBDataSet;
    ButtonDel: TdxBarButton;
    ButtonDelete: TdxBarLargeButton;
    StProcDel: TpFIBStoredProc;
    TransWDel: TpFIBTransaction;
    Label17: TLabel;
    cxGrid2TableView1Column1: TcxGridColumn;
    cxGrid2TableView1Column2: TcxGridColumn;
    DbfExportFn: THalcyonDataSet;
    NewDbfTableFnCreate: TCreateHalcyonDataSet;
    DataSetExportFz: TpFIBDataSet;
    Timer1: TTimer;
    dxAddKekv: TdxBarLargeButton;
    dxConnectUrzb: TdxBarLargeButton;
    del: TAction;
    cxGrid2TableView1Column3: TcxGridColumn;
    cbKod: TdxBarCombo;
    dxBarStatic1: TdxBarStatic;
    procedure FormCreate(Sender: TObject);
    procedure cxGrid2TableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid2TableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton_okClick(Sender: TObject);
    procedure okExecute(Sender: TObject);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxGrid2TableView1Column_n_dogPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarLargeButton_printClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxGrid2TableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dxAddKekvClick(Sender: TObject);
    procedure dxConnectUrzbClick(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure cxGrid2TableView1MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    procedure GrigScroll;
    function DiscInDrive(Drive: char): Boolean;
    { Private declarations }
  public
    DiskTree:TStringList;
    id_fnzb: Int64;
    mode   : String;
    Rate_Bank : String;
    Rate_Acc  : String;
    Number_Fnzb : String;
    id_user : Integer;
    DiscForOwner:string;
    id_rate_acc_nat : Int64;
    procedure SelectAll;
    constructor Create (Aowner:TComponent; _mode: String; _id_fnzb: Integer;Rate_Bank:string; Rate_Acc:String; Number_Fnzb:String; id_us : Integer); overload;
    { Public declarations }
  end;

var
  frmFnzbData: TfrmFnzbData;
  frmFnzbInput: TTfrmInputData;

implementation
  uses WSUnit, ReeFnzbUnit;

{$R *.dfm}

constructor TfrmFnzbData.Create (Aowner:TComponent; _mode: String; _id_fnzb: Integer;Rate_Bank:string; Rate_Acc:String; Number_Fnzb:String; id_us : Integer);
begin
 inherited Create (Aowner);
 mode := _mode;
 id_fnzb := _id_fnzb;
 WorkDB.Handle := (Owner as TfrmReeFnzb).WorkDatabase.Handle;
 WorkDB.DefaultTransaction.Active:=true;
 WorkDB.DefaultUpdateTransaction.Active:=true;
 ReadT.Active:=true;
 //LabelBank.Caption:=Rate_Bank;
 //LabelReg.Caption:=Rate_Acc;
 //Label17.Caption := Number_Fnzb;
 id_user:=id_us;

 if mode = 'edit' then
 begin
   Caption := 'Редагування реєстра фінансових зобов''язань';
   cxButton_ok.Visible := true;
   FormStyle := fsMDIChild;
  // WindowState:=wsMaximized;
 end;
 if mode = 'view' then
 begin
   cxButton_ok.Visible := false;
   FormStyle := fsMDIChild;
   Caption := 'Перегляд реєстра фінансових зобов''язань';
   cxGrid2TableView1.OptionsSelection.CellSelect := false;
   dxBarLargeButton3.Enabled:=False;
   dxBarLargeButton1.Enabled:=False;
   ButtonDelete.Enabled:=False;
   dxAddKekv.Enabled:=False;
   dxConnectUrzb.Enabled:=False;
 end;
end;

procedure TfrmFnzbData.FormCreate(Sender: TObject);
begin
   cbKod.Items.Add('CP866');
   cbKod.Items.Add('WIN1251');
   Label4.Caption := '';
   Label6.Caption := '';
   Label5.Caption := '';
   Label9.Caption := '';
   Label10.Caption := '';
   Label12.Caption := '';
   cxGrid2TableView1Column3.DataBinding.ValueTypeClass := TcxIntegerValueType;
   cxGrid2TableView1Column_n_fz.DataBinding.ValueTypeClass := TcxIntegerValueType;
   cxGrid2TableView1Column_kekv.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column_d_dog.DataBinding.ValueTypeClass := TcxDateTimeValueType;
   cxGrid2TableView1Column_n_dog.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column_name_cust.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column_date_end.DataBinding.ValueTypeClass := TcxDateTimeValueType;
   cxGrid2TableView1Column_summa.DataBinding.ValueTypeClass := TcxFloatValueType;
   cxGrid2TableView1Column_id_kekv.DataBinding.ValueTypeClass := TcxIntegerValueType;
   cxGrid2TableView1Column_id_dog.DataBinding.ValueTypeClass := TcxIntegerValueType;
   cxGrid2TableView1Column_id_fnzb.DataBinding.ValueTypeClass := TcxIntegerValueType;
   cxGrid2TableView1Column_id_customer.DataBinding.ValueTypeClass := TcxIntegerValueType;
   cxGrid2TableView1Column_sum_predopl.DataBinding.ValueTypeClass := TcxCurrencyValueType;
   cxGrid2TableView1Column_summa_fact_fz.DataBinding.ValueTypeClass := TcxCurrencyValueType;
   cxGrid2TableView1Column_summa_fact_pay.DataBinding.ValueTypeClass := TcxCurrencyValueType;
   cxGrid2TableView1Column_id_rate_acc.DataBinding.ValueTypeClass := TcxIntegerValueType;
   cxGrid2TableView1Column_mfo.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column_name_mfo.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column_rsch.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column_d_urzb.DataBinding.ValueTypeClass := TcxDateTimeValueType;
   cxGrid2TableView1Column_n_urzb.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column_id_fnzb_data.DataBinding.ValueTypeClass := TcxIntegerValueType;
   cxGrid2TableView1Column_n_int_ur.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column_date_dog.DataBinding.ValueTypeClass := TcxDateTimeValueType;
   cxGrid2TableView1Column_num_dog.DataBinding.ValueTypeClass := TcxStringValueType;
   cxGrid2TableView1Column1.DataBinding.ValueTypeClass := TcxDateTimeValueType;
   cxGrid2TableView1Column2.DataBinding.ValueTypeClass := TcxDateTimeValueType;
   SelectAll;
   if cxGrid2TableView1.DataController.RecordCount > 0 then cxGrid2TableView1.DataController.FocusedRecordIndex := 0;

   if cxGrid2TableView1.DataController.RecordCount > 0 then
   begin
     Label4.Caption := cxGrid2TableView1Column_mfo.DataBinding.DataController.Values[0, 16];
     Label5.Caption := cxGrid2TableView1Column_rsch.DataBinding.DataController.Values[0, 18];
     Label6.Caption := cxGrid2TableView1Column_name_mfo.DataBinding.DataController.Values[0, 17];
     Label9.Caption := cxGrid2TableView1Column_n_urzb.DataBinding.DataController.Values[0, 20];
     Label10.Caption := cxGrid2TableView1Column_d_urzb.DataBinding.DataController.Values[0, 19];
     Label12.Caption := cxGrid2TableView1Column_n_int_ur.DataBinding.DataController.Values[0, 22];
   end;
end;

procedure TfrmFnzbData.SelectAll;
var
  i : Integer;
  DataSetTemp: TpFIBDataSet;
  kodFlag : Integer;
begin
  Query1.Transaction.StartTransaction;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Text := 'select KOD_TYPE from DOG_SYS_OPTIONS';
  Query1.ExecQuery;
  kodFlag := Query1.FldByName['KOD_TYPE'].AsInteger;
  //Query1.Close;
  cbKod.ItemIndex := kodFlag;
  Query1.Transaction.Commit;

  DataSet.Close;
  DataSet.ParamByName('id_fnzb').AsInt64 := id_fnzb;
  DataSet.Active:=true;
  //DataSet.FetchAll;

  DataSetTemp := TpFIBDataSet.Create(Self);
  DataSetTemp.Database := (Owner as TfrmReeFnzb).WorkDatabase;
  DataSetTemp.Transaction := (Owner as TfrmReeFnzb).ReadTransaction;
  DataSetTemp.SQLs.SelectSQL.Text := 'select f.id_rate_acc, ''('' || b.mfo || '') '' || r.rate_account   as rate_account ' +
    'FROM pub_sp_cust_rate_acc r, pub_sp_bank b, dog_ree_fnzb f ' +
    'WHERE  f.id_rate_acc = r.id_rate_account and    r.id_bank = b.id_bank and  f.id_rate_acc = r.id_rate_account ' +
    'and    f.id_fnzb= ' + IntToStr(id_fnzb);
  DataSetTemp.Active := true;

  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='DOG_REE_FNZB_GET_BANK_ACC';
  StProc.ParamByName('ID_FNZB').AsInteger:=id_fnzb;
  StProc.ExecProc;
  StProc.Transaction.Commit;

  Label16.Caption:= StProc.FldByName['NUMBER_FNZB'].AsString + ' від ' + StProc.FldByName['DATER_FNZB'].AsString + 'р.:';
  Label17.Caption := StProc.FldByName['RATE_ACCOUNT_BANK'].AsString + ',   ' + DataSetTemp.FBN('rate_account').AsString;

  //  id_rate_acc_nat := DataSetTemp['id_rate_acc'];
  id_rate_acc_nat := DataSetTemp['id_rate_acc'];

  DataSetTemp.Active := false;
  DataSetTemp.Free;

  DataSet.Active := true;
  DataSet.FetchAll;
  cxGrid2TableView1.DataController.RecordCount := DataSet.RecordCount;

  for i :=0 to cxGrid2TableView1.DataController.RecordCount - 1 do
  begin
    cxGrid2TableView1Column_n_fz.DataBinding.DataController.Values[i, 1] := DataSet.FBN('NUMBER_FNZB').asInteger;
    cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[i, 2] := DataSet.FBN('KEKV').asInteger;
    cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 3] := DataSet.FBN('D_DOG').AsDateTime;
    cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 4] := DataSet.FBN('N_DOG').AsString;
    cxGrid2TableView1Column_name_cust.DataBinding.DataController.Values[i, 5] := DataSet.FBN('NAME_CUSTOMER').AsString;
    cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 7] := DataSet.FBN('SUMMA').AsCurrency;
    cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 8] := DataSet['ID_KEKV'];
    cxGrid2TableView1Column_id_fnzb.DataBinding.DataController.Values[i, 10] := DataSet['ID_FNZB_DATA'];
    cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 11] := DataSet['ID_CUSTOMER'];
    cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 12] := DataSet.FBN('SUM_PREDOPL').AsCurrency;
    cxGrid2TableView1Column_summa_fact_fz.DataBinding.DataController.Values[i, 13] := DataSet.FBN('SUMMA_FACT_FZ').AsCurrency;
    cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 14] := DataSet.FBN('SUMMA_FACT_PAY').AsCurrency;
    cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 15] := DataSet['ID_RATE_ACC'];
    cxGrid2TableView1Column_mfo.DataBinding.DataController.Values[i, 16] := DataSet.FBN('MFO').AsString;
    cxGrid2TableView1Column_name_mfo.DataBinding.DataController.Values[i, 17] := DataSet.FBN('NAME_MFO').AsString;
    cxGrid2TableView1Column_rsch.DataBinding.DataController.Values[i, 18] := DataSet.FBN('RATE_ACCOUNT').AsString;
    cxGrid2TableView1Column_d_urzb.DataBinding.DataController.Values[i, 19] := DataSet.FBN('DATE_URZB').AsDateTime;
    cxGrid2TableView1Column_n_urzb.DataBinding.DataController.Values[i, 20] := DataSet.FBN('NUMBER_URZB').AsString;
    cxGrid2TableView1Column_id_fnzb_data.DataBinding.DataController.Values[i, 21] := DataSet.FBN('ID_FNZB_DATA').AsInteger;
    cxGrid2TableView1Column_n_int_ur.DataBinding.DataController.Values[i, 22] := DataSet.FBN('n_int_ur').AsInteger;
    cxGrid2TableView1Column_date_dog.DataBinding.DataController.Values[i, 23] := DataSet.FBN('DATA_DOG').AsDateTime;
    cxGrid2TableView1Column_num_dog.DataBinding.DataController.Values[i, 24] := DataSet.FBN('NUM_DOG').AsString;
    cxGrid2TableView1Column1.DataBinding.DataController.Values[i, 25] := DataSet.FBN('DATA_1').AsDateTime;
    cxGrid2TableView1Column2.DataBinding.DataController.Values[i, 26] := DataSet.FBN('DATA_2').AsDateTime;
    DataSet.Next;
  end;
end;

procedure TfrmFnzbData.cxGrid2TableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i : Variant;
begin
  //GrigScroll;
   AHandled := false;
  if ACellViewInfo.Item.Index <> 0 then exit;
  if Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] = 1 then
    Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] := 0
  else
  Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] := 1;
  AHandled := true;
end;


procedure TfrmFnzbData.cxGrid2TableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i: Variant;
begin
  Label12.Caption:='';
  Label9.Caption:='';
  Label10.Caption:='';
  if (key = vk_down) or (key = vk_up) then
  begin
    if (not Visible) or (cxGrid2TableView1.DataController.RecordCount = 0) then Exit;
    i := cxGrid2TableView1.DataController.FocusedRowIndex;
    if i < 0 then Exit;
    Label4.Caption := cxGrid2TableView1Column_mfo.DataBinding.DataController.Values[i, 16];
    Label5.Caption := cxGrid2TableView1Column_rsch.DataBinding.DataController.Values[i, 18];
    Label6.Caption := cxGrid2TableView1Column_name_mfo.DataBinding.DataController.Values[i, 17];
    Label9.Caption := cxGrid2TableView1Column_n_urzb.DataBinding.DataController.Values[i, 20];
    Label10.Caption := cxGrid2TableView1Column_d_urzb.DataBinding.DataController.Values[i, 19];
    Label12.Caption := cxGrid2TableView1Column_n_int_ur.DataBinding.DataController.Values[i, 22]
  end;
end;

procedure TfrmFnzbData.GrigScroll;
var
  i: Variant;
begin
  if (not Visible) or (cxGrid2TableView1.DataController.RecordCount = 0) then Exit;
  i := cxGrid2TableView1.DataController.FocusedRowIndex;
  if i < 0 then Exit;
  Label4.Caption := cxGrid2TableView1Column_mfo.DataBinding.DataController.Values[i, 16];
  Label5.Caption := cxGrid2TableView1Column_rsch.DataBinding.DataController.Values[i, 18];
  Label6.Caption := cxGrid2TableView1Column_name_mfo.DataBinding.DataController.Values[i, 17];
  Label9.Caption := cxGrid2TableView1Column_n_urzb.DataBinding.DataController.Values[i, 20];
  Label10.Caption := cxGrid2TableView1Column_d_urzb.DataBinding.DataController.Values[i, 19];
  Label12.Caption := cxGrid2TableView1Column_n_int_ur.DataBinding.DataController.Values[i, 22]
end;


procedure TfrmFnzbData.FormShow(Sender: TObject);
begin
  LoadPositionFromRegistry(Self);
end;

procedure TfrmFnzbData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 SavePositionToRegistry(Self);
 Action := caFree;
end;

procedure TfrmFnzbData.cxButton_okClick(Sender: TObject);
var
  i, j, p, q, cust : Integer;
  val : string;
begin
  Query1.Transaction.StartTransaction;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Text := 'select CHECK_CUST from DOG_SYS_OPTIONS';
  Query1.ExecQuery;
  q := Query1.FldByName['CHECK_CUST'].AsInteger;
  Query1.Transaction.Commit;
  if  (q = 1) then
  begin
    p:=0;
    for i := 0 to cxGrid2TableView1Column_id_fnzb_data.DataBinding.DataController.RecordCount - 1  do
    begin
      cust:=cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 11];
      val:=cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 24];
      for j := 0 to cxGrid2TableView1Column_id_fnzb_data.DataBinding.DataController.RecordCount - 1  do
      begin
        if ((val = cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[j, 24]) and (i <> j) and
          (cust = cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[j, 11])) then
        begin
          p:=p+1;
          break;
        end;
      end;
      if (p <> 0) then break;
    end;
  end;


  if ((q = 0) or ((q = 1) and (p <> 1))) then
  begin
    for i := 0 to cxGrid2TableView1Column_id_fnzb_data.DataBinding.DataController.RecordCount - 1  do
    begin
      (Owner as TfrmReeFnzb).WriteTransaction.StartTransaction;
      (Owner as TfrmReeFnzb).StoredProc.StoredProcName := 'DOG_REE_FNZB_DATA_UPD';
      (Owner as TfrmReeFnzb).StoredProc.Prepare;
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('ID_FNZB_DATA').AsInt64 := cxGrid2TableView1Column_id_fnzb_data.DataBinding.DataController.Values[i, 21];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('SUMMA').AsCurrency := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 7];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('SUM_PREDOPL').AsCurrency := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 12];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('D_DOG').AsDate := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 3];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('N_DOG').AsString := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 4];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('DATA_DOG').AsDateTime := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 23];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('NUM_DOG').AsString := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 24];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('DATA_1').AsDate := cxGrid2TableView1Column1.DataBinding.DataController.Values[i, 25];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('DATA_2').AsDate := cxGrid2TableView1Column2.DataBinding.DataController.Values[i, 26];
      (Owner as TfrmReeFnzb).StoredProc.ParamByName('P').AsInt64 := cxGrid2TableView1Column_n_fz.DataBinding.DataController.Values[i, 1];
      //(Owner as TfrmReeFnzb).StoredProc.ParamByName('ID_USER').AsInt64 := id_user;


      try
        (Owner as TfrmReeFnzb).StoredProc.ExecProc;
      except on e: Exception do
        begin
          ShowMessage(e.Message);
          (Owner as TfrmReeFnzb).WriteTransaction.Rollback;
          Exit;
        end;
      end;
      (Owner as TfrmReeFnzb).WriteTransaction.Commit;
      //SelectAll;
    end;
    Close;
    (Owner as TfrmReeFnzb).SelectAll;
  end
  else ShowMessage('У реєстрі є записи з однаковими номерами документів та однаковим ОКПО! Перевірте ще!');

end;

procedure TfrmFnzbData.okExecute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmFnzbData.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFnzbData.cxGrid2TableView1Column_n_dogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  DatesetTemp:TpFIBDataSet;
begin

  //  if cxGrid2TableView1.Controller.SelectedRecords[0].Values[8] = -1 then Exit;
  //  DateSetTemp := TpFIBDataSet.Create(Self);
  //  DateSetTemp.Database :=  (Owner as TfrmReeFnzb).WorkDatabase;
  //  DateSetTemp.Transaction :=  (Owner as TfrmReeFnzb).ReadTransaction;
  //  DateSetTemp.SQLs.SelectSQL.Add('SELECT p.id_tip_dog, s.name_shablon ' +
  //    'FROM   dog_dt_document d, pub_sp_tip_dog p, dog_ini_shablon s ' +
  //    'WHERE  d.id_tip_dog=p.id_tip_dog ' +
  //    'AND    p.id_ini_shablon=s.id_shablon ' +
  //    'AND    d.id_dog = ' + DataSet.FieldByName('ID_DOG').AsString);
  //
      //IntToStr(cxGrid2TableView1.Controller.SelectedRecords[0].Values[8]));
  //    DateSetTemp.CloseOpen(false);
  //
  //  LoadDogManedger.LoadShablon(self, (Owner as TfrmReeFnzb).WorkDatabase.Handle, fsNormal,

    //                                   cxGrid2TableView1.Controller.SelectedRecords[0].Values[8],
  //                                    TFIBBCDField(DataSet.FieldByName('ID_DOG')).AsVariant,
  //                                      'prosmotr',TFIBBCDField(DateSetTemp.FBN('id_tip_dog')).AsVariant
  //                                      , PChar(DateSetTemp.FieldByName('name_shablon').asString), nil);
  //
end;


procedure TfrmFnzbData.dxBarLargeButton8Click(Sender: TObject);
begin
 Close();
end;

procedure TfrmFnzbData.dxBarLargeButton_printClick(Sender: TObject);
begin
 (Owner as TfrmReeFnzb).printExecute(self);
end;

procedure TfrmFnzbData.dxBarLargeButton4Click(Sender: TObject);
var
  path,dirSch,count_z: String;
  i,k,m: Integer;
  id_reestr : array of integer;
  rs : TResourceStream;
  selected : integer;
  f : TForm;
begin
  if (cbKod.CurItemIndex = 0) then DbfExportFn.TranslateASCII := True
    else DbfExportFn.TranslateASCII := False;

 if (cbDBFPath.Text = 'A:\') then
 begin
   if(DiscInDrive('A') <> true) then
   begin
    ShowMessage('Невозможно произвести экспорт!');
    Exit;
   end;
 end;

  f := WaitScreenShowWithProgress(Self, 60, 'Іде експорт...');

  DataSetExportFz.Close;
  DataSetExportFz.ParamByName('id_fnzb').AsInt64 := id_fnzb;
  DataSetExportFz.ParamByName('kod_type').AsInt64 := cbKod.CurItemIndex;
  DataSetExportFz.Open;
  DataSetExportFz.FetchAll;


  for m :=1 to (5-Length(DataSetExportFz.FBN('NREE').AsString)) do
    count_z := count_z+'0';

  dirSch:=DiscForOwner+'F-'+count_z+DataSetExportFz.FBN('NREE').AsString+'-'+DataSetExportFz.FBN('RATE_ACC').AsString+'\';
  if (DiscForOwner<>'') then begin
    if DirectoryExists(DiscForOwner+dirSch)=false then
    begin
      MkDir(DiscForOwner+'F-'+count_z+DataSetExportFz['nree'].AsString+'-'+DataSetExportFz['RATE_ACC'].AsString);
    end
  end
  else
    if DirectoryExists(cbDBFPath.Text+dirSch)=false then
    begin
      MkDir(cbDBFPath.Text+'F-'+count_z+DataSetExportFz.FBN('NREE').AsString+'-'+DataSetExportFz.FBN('RATE_ACC').AsString);
    end;

  if (DiscForOwner<>'') then
  begin
    path := DiscForOwner + dirSch + DataSetExportFz.FBN('NAME_DBF').AsString;
  end
  else
  begin
    path := cbDBFPath.Text + dirSch + DataSetExportFz.FBN('NAME_DBF').AsString;
  end;

  DbfExportFn.Close;
  DbfExportFn.DatabaseName := ExtractFilePath(path);
  DbfExportFn.TableName := ExtractFileName(path);

  if FileExists(path) then
  begin
    if MessageBox(Handle,PChar('DBF Файл вже існує. Перезаписати?'),
    'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
    begin
      DeleteFile(path);
    end
    else
    begin
      Exit;
    end;
  end;

  if (NewDbfTableFnCreate.Execute) then
  begin
    DbfExportFn.Exclusive := true;
    DbfExportFn.Open;
  end
  else
  begin
    ShowMessage('Неможливо створити файл!');
    Exit;
  end;
  DataSetExportFz.First;

  for i := 0 to DataSetExportFz.RecordCount - 1 do
  begin
    DbfExportFn.Append;
    DbfExportFn['OP']       := DataSetExportFz.FBN('OP').AsInteger;
    DbfExportFn['NP']       := DataSetExportFz.FBN('NP').AsInteger;
    DbfExportFn['DATER']    := DataSetExportFz.FBN('DATER').AsDateTime;
    DbfExportFn['RRAX']     := DataSetExportFz.FBN('RRAX').AsString;
    DbfExportFn['KPK']      := DataSetExportFz.FBN('KPK').AsString;
    DbfExportFn['KFK']      := DataSetExportFz.FBN('KFK').AsString;
    DbfExportFn['KVK']      := DataSetExportFz.FBN('KVK').AsString;
    DbfExportFn['KPOL']     := DataSetExportFz.FBN('KPOL').AsInteger;
    DbfExportFn['KEKV']     := DataSetExportFz.FBN('KEKV').AsInteger;
    DbfExportFn['NDOC']     := DataSetExportFz.FBN('NDOC').AsString;
    DbfExportFn['DATEDOC']  := DataSetExportFz.FBN('DATEDOC').AsDateTime;
    DbfExportFn['NDOCF']    := DataSetExportFz.FBN('NDOCF').AsString;
    DbfExportFn['DATEDOCF'] := DataSetExportFz.FBN('DATEDOCF').AsDateTime;
    DbfExportFn['S']        := DataSetExportFz.FBN('S').AsCurrency;
    DbfExportFn['SO']       := DataSetExportFz.FBN('SO').AsCurrency;
    DbfExportFn['MFOK']     := DataSetExportFz.FBN('MFOK').AsInteger;
    DbfExportFn['NAZB']     := DataSetExportFz.FBN('NAZB').AsString;
    DbfExportFn['NLSK']     := DataSetExportFz.FBN('NLSK').AsString;
    DbfExportFn['EDRPOUK']  := DataSetExportFz.FBN('EDRPOUK').AsString;
    DbfExportFn['POLUT']    := DataSetExportFz.FBN('POLUT').AsString;
    DbfExportFn['SK']       := DataSetExportFz.FBN('SK').AsInteger;
    DbfExportFn['DATERZ']   := DataSetExportFz.FBN('DATERZ').AsDateTime;
    DbfExportFn['NPRZ']     := DataSetExportFz.FBN('NPRZ').AsInteger;
    DbfExportFn['EDRPOUR']  := DataSetExportFz.FBN('EDRPOUR').AsString;
    DbfExportFn['NAMER']    := DataSetExportFz.FBN('NAMER').AsString;
    DbfExportFn['BUDGET']   := DataSetExportFz.FBN('BUDGET').AsString;
    DbfExportFn['NREE']     :=  DataSetExportFz.FBN('NREE').AsInteger;
    DbfExportFn['NOTE']     := DataSetExportFz.FBN('LAST_DAY').AsDateTime;
    DbfExportFn.Post;
    DataSetExportFz.Next;
    WaitScreenStep(F);
  end;

  DbfExportFn.Exclusive := false;
  DbfExportFn.Close;
  WaitScreenClose(f);
  ShowMessage('Експорт завершено.');
  DiscForOwner:='';
end;

procedure TfrmFnzbData.dxBarLargeButton1Click(Sender: TObject);
var
  format: TFormatSettings;
  flag : Integer;
  buttonSelected : Integer;
begin
 flag:=1;
 format.DecimalSeparator := '.';
 Query1.Transaction.StartTransaction;
 Query1.Close;
 Query1.SQL.Clear;
 Query1.SQL.Add('SELECT * FROM dog_ini_def_group g WHERE  g.id=8');
 Query1.ExecQuery;

 frmFnzbInput:=TTfrmInputData.Create(self);
 frmFnzbInput.date_dog:=Date;
 //frmFnzbInput.id_group:=Query1.FldByName['ID_GROUP'].AsInteger;
 Query1.Transaction.Commit;

 frmFnzbInput.Db1.Handle:=WorkDB.Handle;
 frmFnzbInput.Db1.DefaultTransaction.Active:=true;
 frmFnzbInput.Db1.DefaultUpdateTransaction.Active:=true;
 frmFnzbInput.Ft1.Active:=true;
 frmFnzbInput.Ft2.Active:=true;

 if (frmFnzbInput.ShowModal <> mrOk) then exit;

 Query1.Close;
 StProc.Close;
 StProc.Transaction.StartTransaction;
 StProc.StoredProcName:='DOG_REE_FNZB_DATA_INS';
 StProc.ParamByName('NUMBER_FNZB').AsInteger:=StrToInt(frmFnzbInput.Num_edit.Text);
 StProc.ParamByName('ID_URZB_DATA').AsInteger:=0;
 StProc.ParamByName('ID_FNZB').AsInteger:=id_fnzb;
 StProc.ParamByName('ID_PLAT').AsInteger:=0;
 StProc.ParamByName('SUMMA').Value:=frmFnzbInput.SumEdit.Value;
 StProc.ParamByName('SUM_PREDOPL').AsDouble:=0.0;
 StProc.ParamByName('ID_KEKV').AsInteger:=frmFnzbInput.id_kekv;
 StProc.ParamByName('D_DOG').AsDateTime:=frmFnzbInput.date_dog;
 StProc.ParamByName('N_DOG').AsString:=frmFnzbInput.n_dog;
 StProc.ParamByName('ID_RATE_ACC').AsInteger:=frmFnzbInput.id_rate_acc;
 StProc.ParamByName('ID_DOG').AsCurrency:=frmFnzbInput.id_dog;
 StProc.ParamByName('REG_NUM').AsString:=frmFnzbInput.reg_num;
 StProc.ExecProc;

 if (StProc.ParamByName('error').AsInteger) = 1 then
 begin
   flag:=0;
   //MessageDlg('Цей договір вже існує в фінансовіх зобов`язаннях! Бажаєте додати його?',mtWarning,[mbYes,mbNo]);
   buttonSelected:=MessageDlg('Увага!','Цей документ вже існує в фінансовіх зобов`язаннях! Бажаєте додати його?',mtWarning,[mbYes, mbNo]);
   if (buttonSelected = mrNo) then StProc.Transaction.Rollback
                            else StProc.Transaction.Commit;
 end;
 if (StProc.ParamByName('error').AsInteger) = 2 then
 begin
   flag:=0;
  ShowMessage('Не існує відповідного реестра юридичних зобов`язань! Запис не буде додано!');
  StProc.Transaction.Rollback;
 end;
 if (StProc.ParamByName('error').AsInteger) = 3 then
 begin
   flag:=0;
  ShowMessage('Сума відповідного юридичного зобов`язання менша, ніж загальна сума всіх фінансових зобов`язань по цьому договору! Запис не буде додано!');
  StProc.Transaction.Rollback;
 end;
 if (flag=1) then StProc.Transaction.Commit;
 SelectAll;
end;


// -----------------------------------------------------------------------------
// Выбираем платёжные документы, по текущему счёту
// Которые есть в юридических обязательствах, но нет в финансовых
procedure TfrmFnzbData.dxBarLargeButton3Click(Sender: TObject);
var
 count_ree : String;
 d         : TDate;
 ChForm:TfrmChooseRee;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Add') <> 0 then Exit;

  ChForm:=TfrmChooseRee.Create(self);

  Query1.Close;
  Query1.SQL.Text:='select NUM_REESTR as max_num from DOG_DT_PL_REE order by id_reestr desc';
  Query1.ExecQuery;

  ChForm.NumEdit.EditValue:= Query1.FldByName['max_num'].AsInt64;
  Query1.Close;
  if (ChForm.ShowModal <> MrOk) then Exit;

  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='DOG_REE_FNZB_MAKE_ALL_DOFORM';
  StProc.ParamByName('ID_RATE_ACC_NATIVE_IN').AsInteger:=id_rate_acc_nat;
  StProc.ParamByName('NUM_REE').AsInteger:=ChForm.NumEdit.EditValue ;
  StProc.ParamByName('ID_FNZB').AsInteger:=id_fnzb;
  StProc.ParamByName('P').AsInteger:=cxGrid2TableView1.DataController.RecordCount;
  StProc.ExecProc;

  //record_p:=record_p+StProc.FldByName['ALL_CNT'].AsInteger;
  ShowMessage('Додано '+StProc.FldByName['ALL_CNT'].AsString + ' записів!');
  StProc.Transaction.Commit;
  SelectAll;

  cxGrid2TableView1.ViewData.Records[cxGrid2TableView1.DataController.RecordCount-1].Focused:=True;

  {StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'DOG_REE_FNZB_MAKE_AL_NOT_IN_REE';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_FNZB').AsInteger := id_fnzb;
  try
    StoredProc.ExecProc;
  except on e: Exception do
    begin
      ShowMessage(e.Message);
      StoredProc.Transaction.Rollback;
      Exit;
      ShowMessage('Жодного реєстру не сформовано.');
    end;
  end;
  StoredProc.Transaction.Commit;
  SelectAll;
  frmFnzbData.SelectAll; }
end;

procedure TfrmFnzbData.ButtonDeleteClick(Sender: TObject);
var
  k: Integer;
  id_reestr : array of integer;
  selected : integer;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Del') <> 0 then Exit;

  {   selected:=cxGrid2TableView1.DataController.FocusedRecordIndex;
     if GoToFirstSelected(cxGrid2TableView1, DataSet) then repeat
      SetLength(id_reestr, Length(id_reestr) + 1);
      id_reestr[Length(id_reestr) - 1]:=id_fnzb;
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRowIndex, 0]:=0;
     until not GoToNextSelected(cxGrid1TableView1, DataSet);
     if Length(id_reestr) = 0 then begin
      cxGrid2DBTableView1.DataController.RecNo:=selected;
      ShowMessage('Виберіть хоча б один запис.');
      exit;
    end
    else
    if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити запис(и)?'),
        'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
     begin
        for k := 0 to Length(id_reestr) - 1 do begin
          WriteTransaction.StartTransaction;
          StProcDel.StoredProcName := 'DOG_REE_FNZB_DATA_DEL';
          StProcDel.Prepare;
          StProcDel.ParamByName('ID_FNZB_DATA').AsInt64 := id_reestr[k];
           try
             StProcDel.ExecProc;
           except on e: Exception do
             begin
               ShowMessage(e.Message);
               WriteTransaction.Rollback;
               Exit;
             end;
           end;
           WriteTransaction.Commit;
           SelectAll;
     end;
    end;

    cxGrid2DBTableView1.DataController.FocusedRowIndex:=cxGrid2DBTableView1.DataController.RecordCount - 1;
    frmFnzbData.SelectAll;  }


  begin
  if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити запис?'),
      'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
   begin
    if not StProcDel.Transaction.Active then StProcDel.Transaction.StartTransaction;
    StProcDel.StoredProcName:='DOG_REE_FNZB_DATA_DEL';
    StProcDel.Prepare;
    StProcDel.ParamByName('ID_FNZB_DATA').AsInteger:=cxGrid2TableView1Column_mfo.DataBinding.DataController.Values[cxGrid2TableView1Column_mfo.DataBinding.DataController.FocusedRecordIndex, 21];
    try
      StProcDel.ExecProc;
      except on e: Exception do
      begin
        ShowMessage(e.Message);
        StProcDel.Transaction.Rollback;
        Exit;
      end;
    end;
    StProcDel.Transaction.Commit;
    SelectAll; 
  end;
  frmFnzbData.SelectAll;
end;
end;

function TfrmFnzbData.DiscInDrive(Drive: char): Boolean;
var
  ErrorMode: Word;
begin
  ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
  try
    if DiskSize(Ord(Drive) - $40) = -1 then
      Result := False
    else
      Result := True;
  finally
    SetErrorMode(ErrorMode);
  end;
end;


procedure TfrmFnzbData.Timer1Timer(Sender: TObject);
var
 r: LongWord;
 Drives: array[0..128] of char;
 pDrive: PChar;
 k     : Integer;
begin
 DiskTree:=TStringList.Create();
 DiskTree.Clear;
 DiskTree.Add('A:\');
 DiskTree.Add('C:\');
 DiskTree.Add('D:\');

 r := GetLogicalDriveStrings(SizeOf(Drives), Drives);
 if r = 0 then Exit;
 if r > SizeOf(Drives) then
 raise Exception.Create(SysErrorMessage(ERROR_OUTOFMEMORY));
 pDrive := Drives;

 while pDrive^ <> #0 do
 begin
  if GetDriveType(pDrive) = DRIVE_REMOVABLE then
  begin
    if pDrive <> 'A:\' then
    begin
     if cbDBFPath.Items.IndexOf(pDrive) = -1 then
     begin
       cbDBFPath.Items.Add(pDrive);
     end;
     DiskTree.Add(pDrive);
    end;

  end;
  Inc(pDrive, 4);
 end;

  for k:=0 to cbDBFPath.Items.Count - 1 do
  begin
    if DiskTree.IndexOf(cbDBFPath.Items[k]) = -1  then
    begin
     cbDBFPath.Items.Delete(k);
     cbDBFPath.Text:='A:\';
    end;
  end;
end;

procedure TfrmFnzbData.cxGrid2TableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect: TRect;
begin
  Arect := AViewInfo.Bounds;
  ACanvas.Canvas.Font.Color := clBlack;
  ACanvas.Canvas.Font.Style := [];
  ACanvas.Canvas.FillRect(Arect);
end;

procedure TfrmFnzbData.dxAddKekvClick(Sender: TObject);
var
  ChForm:TfrmChooseRee;
begin
  ChForm:=TfrmChooseRee.Create(self);

  Query1.Close;
  Query1.SQL.Text:='select NUM_REESTR as max_num from DOG_DT_PL_REE order by id_reestr desc';
  Query1.ExecQuery;

  ChForm.NumEdit.EditValue:= Query1.FldByName['max_num'].AsInt64;
  Query1.Close;
  if (ChForm.ShowModal <> MrOk) then Exit;

  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='DOG_REE_FNZB_MAKE_ALL';
  StProc.ParamByName('ID_RATE_ACC_NATIVE_IN').AsInteger:=id_rate_acc_nat;
  StProc.ParamByName('NUM_REE').AsInteger:=ChForm.NumEdit.EditValue ;
  StProc.ParamByName('ID_FNZB').AsInteger:=id_fnzb;
  StProc.ParamByName('P').AsInteger:=cxGrid2TableView1.DataController.RecordCount;
  StProc.ExecProc;

  //record_p:=record_p+StProc.FldByName['ALL_CNT'].AsInteger;
  ShowMessage('Додано '+StProc.FldByName['ALL_CNT'].AsString + ' записів!');
  StProc.Transaction.Commit;
  SelectAll;

  cxGrid2TableView1.ViewData.Records[cxGrid2TableView1.DataController.RecordCount-1].Focused:=True;

end;

procedure TfrmFnzbData.dxConnectUrzbClick(Sender: TObject);
var
  ChForm:TfrmPosAdd;
begin
  ChForm:=TfrmPosAdd.Create(self);
  if (ChForm.ShowModal <> MrOk) then Exit;
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='DOG_REE_FNZB_CONNECT_URZB';
  StProc.ParamByName('NUM_REE').AsInteger:=ChForm.Num_edit.EditValue;
  StProc.ParamByName('DATE_REE').AsDate:=ChForm.DateEdit.EditValue;
  StProc.ParamByName('NUM_POS').AsInteger:=ChForm.PosEdit.EditValue;
  StProc.ParamByName('ID_FNZB').AsInteger:=id_fnzb;
  StProc.ParamByName('P').AsInteger:=cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex,0];
  StProc.ExecProc;
  StProc.Transaction.Commit;
  
  SelectAll;
end;

procedure TfrmFnzbData.delExecute(Sender: TObject);
begin
  ButtonDeleteClick(Self);
end;

procedure TfrmFnzbData.cxGrid2TableView1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 i : Variant;
begin
  Label12.Caption:='';
  Label9.Caption:='';
  Label10.Caption:='';
  if (not Visible) or (cxGrid2TableView1.DataController.RecordCount = 0) then Exit;
  i := cxGrid2TableView1.DataController.FocusedRowIndex;
  if i < 0 then Exit;
  Label4.Caption := cxGrid2TableView1Column_mfo.DataBinding.DataController.Values[i, 16];
  Label5.Caption := cxGrid2TableView1Column_rsch.DataBinding.DataController.Values[i, 18];
  Label6.Caption := cxGrid2TableView1Column_name_mfo.DataBinding.DataController.Values[i, 17];
  Label9.Caption := cxGrid2TableView1Column_n_urzb.DataBinding.DataController.Values[i, 20];
  Label10.Caption := cxGrid2TableView1Column_d_urzb.DataBinding.DataController.Values[i, 19];
  Label12.Caption := cxGrid2TableView1Column_n_int_ur.DataBinding.DataController.Values[i, 22]
end;

end.
