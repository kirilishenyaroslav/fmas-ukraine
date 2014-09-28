unit ImportBankData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,TiCommonStyles, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons,ImportBank_DM, dxBar, dxBarExtItems, cxCheckBox, cxTextEdit,
  cxCurrencyEdit, Buttons,ImportBankAddBudgetForm, cxGridBandedTableView,
  cxGridDBBandedTableView, cxSplitter,TiWaitForm,TiMessages, Kernel,
  cxContainer, cxLabel,ImportBankDataOtrNakl;

type TTaxInvocesUser = record
 id_user       : Integer;
 name_user     : string;
 name_computer : string;
 ip_computer   : string;
 id_seller     : Integer;
 name_seller   : string;
 ipn_seller    : string;
 num_sv_seller : string;
 adress_seller : string;
 phone_seller  : string;
 id_customer     : Integer;
 name_customer   : string;
 ipn_customer    : string;
 num_sv_customer : string;
 adress_customer : string;
 phone_customer  : string;
 edrpou_customer  : string;
end;

type
  TImportBankForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Panel8: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ImportBankNds_Grid: TcxGrid;
    ImportBankNds_GridDBBandedTableView1: TcxGridDBBandedTableView;
    Grid_NUM_SMETA: TcxGridDBBandedColumn;
    Grid_NUM_RAZDEL: TcxGridDBBandedColumn;
    Grid_NUM_STAT: TcxGridDBBandedColumn;
    Grid_NUM_KEKV: TcxGridDBBandedColumn;
    Grid_SUMMA: TcxGridDBBandedColumn;
    Grid_is_nds: TcxGridDBBandedColumn;
    ImportBankNds_GridLevel1: TcxGridLevel;
    Grid_db_id_sch_num: TcxGridDBBandedColumn;
    Grid_kr_id_sch_num: TcxGridDBBandedColumn;
    Panel4: TPanel;
    Panel9: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    ImportBankGrid: TcxGrid;
    ImportBankGridDBTableView1: TcxGridDBTableView;
    ImportBankGridDBTableView1DB_DATE_PROV: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_name_customer: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_nalog_num: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_NUM_DOC: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_DATE_DOC: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_DATE_REG: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_SUMMA: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_NOTE: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_isDebet: TcxGridDBColumn;
    ImportBankGridLevel1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    ImportBankGridDBTableView1DB_IS_SELECT: TcxGridDBColumn;
    ReestrSplitter: TcxSplitter;
    dxBarLargeButton3: TdxBarLargeButton;
    ImportBankGridDBTableView1DB_TYPE_DOC_TITLE: TcxGridDBColumn;
    Grid_KEKV: TcxGridDBBandedColumn;
    InvertButton: TdxBarLargeButton;
    ImportBankGridDBTableView1DB_pk_id: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_SUMMA_NDS_DOC: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_FLAG_ERROR_NDS: TcxGridDBColumn;
    ImportBankGridDBTableView1DB_flag_past: TcxGridDBColumn;
    Panel3: TPanel;
    IsSignLabel: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    ImportBankGridDBTableView1DB_FLAG_NAKL: TcxGridDBColumn;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    dxBarLargeButton4: TdxBarLargeButton;
    ImportBankGridDBTableView1DB_DATE_OTR_NAKL: TcxGridDBColumn;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Grid_is_ndsGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure ImportBankGridDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ReestrSplitterAfterClose(Sender: TObject);
    procedure ReestrSplitterAfterOpen(Sender: TObject);
    procedure ImportBankGridDBTableView1DblClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure InvertButtonClick(Sender: TObject);
    procedure ImportBankGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    TaxInvoicesUser    : TTaxInvocesUser;
    key_session : Integer;
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
  end;

var
  ImportBankForm: TImportBankForm;

implementation

uses FIBQuery, Math;

{$R *.dfm}

procedure TImportBankForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TImportBankForm.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure TImportBankForm.FormCreate(Sender: TObject);
begin
  ImportBankGridDBTableView1.DataController.DataSource := ImportBankDM.BankDocDSource;
end;

procedure TImportBankForm.FormShow(Sender: TObject);
begin
  ImportBankGridDBTableView1.DataController.DataSource := ImportBankDM.BankDocDSource;
  ImportBankNds_GridDBBandedTableView1.DataController.DataSource := ImportBankDM.BankDocProvNDSDSource;
  ImportBankGridDBTableView1.DataController.Summary.FooterSummaryItems[4].Format := 'Всього:';
  ImportBankGridDBTableView1.DataController.Summary.FooterSummaryItems[2].Format := 'Кількість документів:';
  ImportBankDM.BankDocProvNDSDSet.AfterScroll := RxMemoryData_smetAfterScroll;
  ImportBankNds_GridDBBandedTableView1.ViewData.Expand(true);
  //-----пользователь-----------------------------------------------------------------------
  ImportBankDM.UserDSet.Close;
  ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  ImportBankDM.UserDSet.Open;
  TaxInvoicesUser.id_user       := ImportBankDM.UserDSet['ID_USER'];
  TaxInvoicesUser.name_user     := ImportBankDM.UserDSet['USER_FIO'];
  TaxInvoicesUser.name_computer := ImportBankDM.UserDSet['HOST_NAME'];
  TaxInvoicesUser.ip_computer   := ImportBankDM.UserDSet['IP_ADRESS'];
  //-----------------------------------------------------------------------------------------
  ImportBankDM.UserDSet.Close;
  ImportBankDM.UserDSet.SelectSQL.Text          := 'select * from TI_CUSTOMER_INFO(:id)';
  ImportBankDM.UserDSet.ParamByName('id').Value := null;
  ImportBankDM.UserDSet.Open;
  TaxInvoicesUser.id_seller     := ImportBankDM.UserDSet['ORGANIZATION'];
  TaxInvoicesUser.name_seller   := ImportBankDM.UserDSet['full_name_customer'];
  TaxInvoicesUser.ipn_seller    := ImportBankDM.UserDSet['nalog_nom'];
  TaxInvoicesUser.num_sv_seller := ImportBankDM.UserDSet['nns'];
  TaxInvoicesUser.adress_seller := ImportBankDM.UserDSet['full_adress_customer'];
  TaxInvoicesUser.phone_seller  := ImportBankDM.UserDSet['phone_customer'];
end;

procedure TImportBankForm.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
begin
  if (ImportBankDM.BankDocProvNDSDSet.IsEmpty = False)then
  begin
    Label7.Caption   := ImportBankDM.BankDocProvNDSDSet['NAME_SMETA'];
    Label8.Caption   := ImportBankDM.BankDocProvNDSDSet['NAME_RAZDEL'];
    Label9.Caption   := ImportBankDM.BankDocProvNDSDSet['NAME_STAT'];
    Label11.Caption  := ImportBankDM.BankDocProvNDSDSet['NAME_KEKV'];
    Label6.Caption   := ImportBankDM.BankDocProvNDSDSet['db_id_sch_name'];
    Label12.Caption  := ImportBankDM.BankDocProvNDSDSet['kr_id_sch_name'];
    Label7.Hint      := ImportBankDM.BankDocProvNDSDSet['NAME_SMETA'];
    Label7.ShowHint  := true;
    Label8.Hint      := ImportBankDM.BankDocProvNDSDSet['NAME_RAZDEL'];
    Label8.ShowHint  := true;
    Label9.Hint      := ImportBankDM.BankDocProvNDSDSet['NAME_STAT'];
    Label9.ShowHint  := true;
    Label11.Hint     := ImportBankDM.BankDocProvNDSDSet['NAME_KEKV'];
    Label11.ShowHint := true;
    Label6.Hint      := ImportBankDM.BankDocProvNDSDSet['db_id_sch_name'];
    Label6.ShowHint  := true;
    Label12.Hint      := ImportBankDM.BankDocProvNDSDSet['kr_id_sch_name'];
    Label12.ShowHint  := true;
  end; 
end;

procedure TImportBankForm.SpeedButton1Click(Sender: TObject);
var
  Add                : Variant;
  i                  : Integer;
  ID_BUDGET_BANK_BUF : Integer;
begin
  if ImportBankDM.BankDocProvNDSDSet['IS_NDS'] = 0 then Exit;
  Add := ImportBankAddBudgetForm.AddKosht(self,ImportBankDM.DB.Handle,-1,1,0,0,0,0,0,date,'');
  if VarArrayDimCount(Add) > 0 then
  begin
    i := 0;
    ImportBankDM.WriteTransaction.StartTransaction;
    ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_BUDGET_BANK_BUF_INS';
    ImportBankDM.pFIBStoredProc.ParamByName('pk_id').AsInt64 := StrToInt64(ImportBankDM.BankDocMemoryData.FieldByName('pk_id').AsString);
    ImportBankDM.pFIBStoredProc.ParamByName('ID_SMETA_NDS').Value    := Add[i][7];
    ImportBankDM.pFIBStoredProc.ParamByName('ID_RAZDEL_NDS').Value   := Add[i][8];
    ImportBankDM.pFIBStoredProc.ParamByName('ID_STAT_NDS').Value     := Add[i][9];
    ImportBankDM.pFIBStoredProc.ParamByName('NAME_SMETA_NDS').Value  := Add[i][0];
    ImportBankDM.pFIBStoredProc.ParamByName('NAME_RAZDEL_NDS').Value := Add[i][1];
    ImportBankDM.pFIBStoredProc.ParamByName('NAME_STAT_NDS').Value   := Add[i][2];
    ImportBankDM.pFIBStoredProc.ParamByName('NUM_SMETA_NDS').Value   := Add[i][4];
    ImportBankDM.pFIBStoredProc.ParamByName('NUM_RAZDEL_NDS').Value  := Add[i][5];
    ImportBankDM.pFIBStoredProc.ParamByName('NUM_STAT_NDS').Value    := Add[i][6];
    ImportBankDM.pFIBStoredProc.ParamByName('ID_KEKV_NDS').Value     := Add[i][10];
    ImportBankDM.pFIBStoredProc.ParamByName('NUM_KEKV_NDS').Value    := Add[i][11];
    ImportBankDM.pFIBStoredProc.ParamByName('NAME_KEKV_NDS').Value   := Add[i][12];
    ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_NDS').Value       := Add[i][3];
    
    ImportBankDM.pFIBStoredProc.ExecProc;
    ImportBankDM.WriteTransaction.Commit;
    ID_BUDGET_BANK_BUF := ImportBankDM.pFIBStoredProc.ParamByName('ID_BUDGET_BANK_BUF_').AsInteger;
    ImportBankDM.BankDocProvNDSDSet.Close;
    ImportBankDM.BankDocProvNDSDSet.Open;
    ImportBankDM.BankDocProvNDSDSet.Locate('ID_BUDGET_BANK_BUF',IntToStr(ID_BUDGET_BANK_BUF),[]);
    ImportBankNds_GridDBBandedTableView1.ViewData.Expand(true);
  end;
end;

procedure TImportBankForm.SpeedButton2Click(Sender: TObject);
begin
  if ImportBankDM.BankDocProvNDSDSet.IsEmpty = True then Exit;
  if ImportBankDM.BankDocProvNDSDSet['IS_NDS'] = 0 then Exit;

  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   try
    ImportBankDM.WriteTransaction.StartTransaction;
    ImportBankDM.pFIBStoredProc.StoredProcName:='TI_BUDGET_BANK_BUF_DEL';
    ImportBankDM.pFIBStoredProc.ParamByName('id_budget_bank_buf').Value:=ImportBankDM.BankDocProvNDSDSet['id_budget_bank_buf'];
    ImportBankDM.pFIBStoredProc.ExecProc;
    ImportBankDM.WriteTransaction.Commit;
    ImportBankDM.BankDocProvNDSDSet.Close;
    ImportBankDM.BankDocProvNDSDSet.Open;
    ImportBankNds_GridDBBandedTableView1.ViewData.Expand(true);
   except on E:Exception do
    begin
     MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
     ImportBankDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TImportBankForm.SpeedButton3Click(Sender: TObject);
var
  Add: Variant;
    i: Integer;
  ID_BUDGET_BANK_BUF : Integer;
begin
  if ImportBankDM.BankDocProvNDSDSet.IsEmpty = True then Exit;
  if ImportBankDM.BankDocProvNDSDSet['IS_NDS'] = 0 then Exit;
  ID_BUDGET_BANK_BUF := ImportBankDM.BankDocProvNDSDSet['ID_BUDGET_BANK_BUF'];

  if ImportBankDM.BankDocProvNDSDSet.RecordCount = 0 then Exit;

  Add := ImportBankAddBudgetForm.AddKosht(self,ImportBankDM.DB.Handle,-1,2,
                                   ImportBankDM.BankDocProvNDSDSet.FieldByName('ID_SMETA').AsInteger,
                                   ImportBankDM.BankDocProvNDSDSet.FieldByName('ID_RAZDEL').AsInteger,
                                   ImportBankDM.BankDocProvNDSDSet.FieldByName('ID_STAT').AsInteger,
                                   ImportBankDM.BankDocProvNDSDSet.FieldByName('ID_KEKV').AsInteger,
                                   ImportBankDM.BankDocProvNDSDSet.FieldByName('SUMMA').AsFloat,date,'');
  if VarArrayDimCount(Add) > 0 then
  begin
    i := 0;
    ImportBankDM.WriteTransaction.StartTransaction;
    ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_BUDGET_BANK_BUF_UPD';
    ImportBankDM.pFIBStoredProc.ParamByName('pk_id').AsInt64 := StrToInt64(ImportBankDM.BankDocMemoryData.FieldByName('pk_id').AsString);
    ImportBankDM.pFIBStoredProc.ParamByName('ID_BUDGET_BANK_BUF').Value := ID_BUDGET_BANK_BUF;
    ImportBankDM.pFIBStoredProc.ParamByName('ID_SMETA_NDS').Value    := Add[i][7];
    ImportBankDM.pFIBStoredProc.ParamByName('ID_RAZDEL_NDS').Value   := Add[i][8];
    ImportBankDM.pFIBStoredProc.ParamByName('ID_STAT_NDS').Value     := Add[i][9];
    ImportBankDM.pFIBStoredProc.ParamByName('NAME_SMETA_NDS').Value  := Add[i][0];
    ImportBankDM.pFIBStoredProc.ParamByName('NAME_RAZDEL_NDS').Value := Add[i][1];
    ImportBankDM.pFIBStoredProc.ParamByName('NAME_STAT_NDS').Value   := Add[i][2];
    ImportBankDM.pFIBStoredProc.ParamByName('NUM_SMETA_NDS').Value   := Add[i][4];
    ImportBankDM.pFIBStoredProc.ParamByName('NUM_RAZDEL_NDS').Value  := Add[i][5];
    ImportBankDM.pFIBStoredProc.ParamByName('NUM_STAT_NDS').Value    := Add[i][6];
    ImportBankDM.pFIBStoredProc.ParamByName('ID_KEKV_NDS').Value     := Add[i][10];
    ImportBankDM.pFIBStoredProc.ParamByName('NUM_KEKV_NDS').Value    := Add[i][11];
    ImportBankDM.pFIBStoredProc.ParamByName('NAME_KEKV_NDS').Value   := Add[i][12];
    ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_NDS').Value       := Add[i][3];
    ImportBankDM.pFIBStoredProc.ParamByName('key_session').Value     := key_session;

    ImportBankDM.pFIBStoredProc.ExecProc;
    ImportBankDM.WriteTransaction.Commit;
    ImportBankDM.BankDocProvNDSDSet.Close;
    ImportBankDM.BankDocProvNDSDSet.Open;
    ImportBankDM.BankDocProvNDSDSet.Locate('ID_BUDGET_BANK_BUF',IntToStr(ID_BUDGET_BANK_BUF),[]);
    ImportBankNds_GridDBBandedTableView1.ViewData.Expand(true);
  end;

end;


procedure TImportBankForm.Grid_is_ndsGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  If AText = '1' then
    AText := 'Сума ПДВ (відобр. у бухгалт.) ';
  If AText = '0' then
    AText := 'Бухгалтерські проводки документу';
end;

procedure TImportBankForm.ImportBankGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 ImportBankNds_GridDBBandedTableView1.ViewData.Expand(true);
 ImportBankDM.BankDocProvNDSDSet.Close;
 ImportBankDM.BankDocProvNDSDSet.SelectSQL.Text  := 'select * from TI_SELECT_ALL_PROVODKA_BANK(:PK_ID, :PRIHOD, :KEY_SESSION, :DATE_REG)';
 ImportBankDM.BankDocProvNDSDSet.ParamByName('PK_ID').AsInt64       := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
 ImportBankDM.BankDocProvNDSDSet.ParamByName('PRIHOD').AsInt64      := ImportBankDM.BankDocMemoryData['PRIHOD'];
 ImportBankDM.BankDocProvNDSDSet.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
 ImportBankDM.BankDocProvNDSDSet.ParamByName('DATE_REG').AsDate     := ImportBankDM.BankDocMemoryData['DATE_REG'];
 ImportBankDM.BankDocProvNDSDSet.Open;
 ImportBankDM.BankDocProvNDSDSet.FetchAll;
 ImportBankDM.BankDocProvNDSDSet.First;
end;

procedure TImportBankForm.ReestrSplitterAfterClose(Sender: TObject);
begin
 Panel2.Visible := false;
end;

procedure TImportBankForm.ReestrSplitterAfterOpen(Sender: TObject);
begin
 Panel2.Visible := true;
end;

procedure TImportBankForm.ImportBankGridDBTableView1DblClick(
  Sender: TObject);
begin
  ImportBankGridDBTableView1DB_IS_SELECT.EditValue:=not(ImportBankGridDBTableView1DB_IS_SELECT.EditValue);
 // if (ImportBankGridDBTableView1DB_isDebet.EditValue = 0) then ImportBankGridDBTableView1DB_isDebet.EditValue := 1;
  //if (ImportBankGridDBTableView1DB_isDebet.EditValue = 1) then ImportBankGridDBTableView1DB_isDebet.EditValue := 0;

end;

procedure TImportBankForm.dxBarLargeButton3Click(Sender: TObject);
var
  i                       : integer;
  wf                      : TForm;
  flag_create_nakl_NDS    : Integer;
  flag_create_nakl_extemp : Integer;
  id_nakl_nds             : Integer;
  id_nakl_nds_doc         : Integer;
  id_nakl_nds_doc_deliv   : Integer;
  id_nakl_extemp          : Integer;
  id_nakl_extemp_doc      : Integer;
  id_nakl_extemp_doc_deliv: Integer;
  id_reestr               : Integer;
  num_reestr              : Integer;
  last_nomer_reestr       : Integer;
  j                       : Integer;
  workdate                : TDate;
  STRU                    : KERNEL_MODE_STRUCTURE;
  DoResult                : Boolean;
  ErrorList               : TStringList;
  s                       : string;
  KEY_SESSION_PROVODKA    : Int64;
begin
  flag_create_nakl_NDS     := 0;
  flag_create_nakl_extemp  := 0;
  id_nakl_nds              := 0;
  id_nakl_extemp           := 0;
  id_nakl_nds_doc          := 0;
  id_nakl_extemp_doc       := 0;
  id_nakl_nds_doc_deliv    := 0;
  id_nakl_extemp_doc_deliv := 0;

  wf := ShowWaitForm(Application.MainForm,wfPrepareData);

  i := ImportBankGridDBTableView1.DataController.FocusedRecordIndex;
  ImportBankDM.BankDocMemoryData.First;
  ImportBankDM.WriteTransaction.StartTransaction;

  while not(ImportBankDM.BankDocMemoryData.Eof)do
  begin
    if((ImportBankDM.BankDocMemoryData['is_select'] = true)and (ImportBankDM.BankDocMemoryData['summa'] <> 0))then
    begin
      ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_BANK_NAKL_IS_NDS';
      ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64       := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
      ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64      := ImportBankDM.BankDocMemoryData['PRIHOD'];
      ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
      ImportBankDM.pFIBStoredProc.ParamByName('ACTUAL_DATE').AsDate  := ImportBankDM.BankDocMemoryData['DATE_REG'];
      ImportBankDM.pFIBStoredProc.ExecProc;
      if (ImportBankDM.pFIBStoredProc.ParamByName('NAKL_IS_NDS').AsInteger = 1) then // это часть облагаемой налоговой накладной
      begin
        if flag_create_nakl_NDS = 0 then
        begin
          //необходимо создать налоговую накладную
          // для начала нужно определиться в какой реестр писать
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
          num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
          last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            // отбор данных о контрагенте студгородок
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SELECT_SHABLON_CONTRAGENT(:IS_CONTRAGENT_EDUCATION,:IS_CONTRAGENT_STUDSITY)';
            ImportBankDM.UserDSet.ParamByName('IS_CONTRAGENT_EDUCATION').Value := 0;
            ImportBankDM.UserDSet.ParamByName('IS_CONTRAGENT_STUDSITY').Value  := 1;
            ImportBankDM.UserDSet.Open;

            TaxInvoicesUser.id_customer     := ImportBankDM.UserDSet['id_customer'];
            TaxInvoicesUser.name_customer   := ImportBankDM.UserDSet['full_name_customer'];
            TaxInvoicesUser.ipn_customer    := ImportBankDM.UserDSet['nalog_nom'];
            TaxInvoicesUser.num_sv_customer := ImportBankDM.UserDSet['nns'];
            TaxInvoicesUser.adress_customer := ImportBankDM.UserDSet['full_adress_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.edrpou_customer := ImportBankDM.UserDSet['EDRPOU_CUSTOMER'];

            // отбор реквизитов по налоговой накладной шаблон 1 - студгородок
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SHABLON_REQUISITE_NAKL_SEL where id_shablon = 1';
            ImportBankDM.UserDSet.Open;

            //вставка шапки налоговой накладной
            ImportBankDM.pFIBStoredProc.StoredProcName                                 := 'TI_SP_VID_NAKL_DOC_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate             := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value                  := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SELLER').Value                 := TaxInvoicesUser.id_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value               := TaxInvoicesUser.name_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ipn_seller').Value                := TaxInvoicesUser.ipn_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value              := TaxInvoicesUser.adress_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value              := TaxInvoicesUser.phone_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value          := TaxInvoicesUser.num_sv_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value               := TaxInvoicesUser.Id_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value             := TaxInvoicesUser.Name_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value              := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value            := TaxInvoicesUser.adress_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value            := TaxInvoicesUser.phone_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value        := TaxInvoicesUser.num_sv_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value           := TaxInvoicesUser.edrpou_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('full_name_customer').Value        := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := ImportBankDM.UserDSet['is_issued_buyer_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := ImportBankDM.UserDSet['is_erpn_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := ImportBankDM.UserDSet['is_remains_seller_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := ImportBankDM.UserDSet['is_copy_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := ImportBankDM.UserDSet['id_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := ImportBankDM.UserDSet['name_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value           := ImportBankDM.UserDSet['is_issued_buyer'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn').Value                   := ImportBankDM.UserDSet['is_erpn'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy').Value                   := ImportBankDM.UserDSet['is_copy'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value         := ImportBankDM.UserDSet['IS_REMAINS_SELLER'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value                := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value          := ImportBankDM.UserDSet['ID_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value        := ImportBankDM.UserDSet['NAME_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value        := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value       := ImportBankDM.UserDSet['ID_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value     := ImportBankDM.UserDSet['NAME_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NOTE').Value                   := ImportBankDM.UserDSet['ID_NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('NOTE').Value                      := ImportBankDM.UserDSet['NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value      := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value              := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value            := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ImportBankDM.UserDSet['ID_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ImportBankDM.UserDSet['NAME_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_korig').Value                  := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value                  := '';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value                 := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value         := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_nds_doc := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
            //вставка документа в список выданных налоговых накладных
            ImportBankDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ImportBankDM.UserDSet['id_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ImportBankDM.UserDSet['name_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := TaxInvoicesUser.id_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_nakl_nds_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := 'Банк';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;// главный (ДонНУ)
            ImportBankDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_nds := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
            //-------------------вставка строки в таблицу налоговой (номенклатура поставки)
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_SP_VID_NAKL_DELIVERY_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('date_shipment').Value                := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value         := ImportBankDM.UserDSet['id_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value       := ImportBankDM.UserDSet['name_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_measures').Value                  := ImportBankDM.UserDSet['id_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_measures').Value                := ImportBankDM.UserDSet['name_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value        := ImportBankDM.UserDSet['kol_vo_delivery_goods'];
            ImportBankDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value         := ImportBankDM.BankDocMemoryData['summa'];
            //ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := ImportBankDM.BankDocMemoryData['summa'] - ImportBankDM.BankDocMemoryData['summa']/6;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_export').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value       := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value              := id_nakl_nds_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('section').Value                      := '1';
            ImportBankDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value                 := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value                := '';
            ImportBankDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value               := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_nds_doc_deliv                                                         := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_VID_NAKL_DOC_SUMMA_CALC';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value              := id_nakl_nds_doc;
            ImportBankDM.pFIBStoredProc.ExecProc;
            flag_create_nakl_NDS := 1; // НДС-ная накладная создана
          end
          else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
        end
        else
        begin
          // необходимо обновить суммы и налоговую накладную
          // сначала проверим подписан ли реестр
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            ImportBankDM.pFIBStoredProc.StoredProcName                             := 'TI_UPDATE_BANK_VID_NAKL';
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value               := id_nakl_nds;
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc').Value       := id_nakl_nds_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc_deliv').Value := id_nakl_nds_doc_deliv;
            ImportBankDM.pFIBStoredProc.ParamByName('summa').Value                 := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_nds').Value := 1;
            ImportBankDM.pFIBStoredProc.ExecProc;
          end;
        end;
        // нужно сохранить id_nakl_nds накладной и pk_id с ними связанные
        ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl_nds;
        ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
        ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
        ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
        ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 1;// облагаемая налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 1;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ExecProc;
      end
      else
      // формируем налоговую, освобожденную от НДС
      begin
        if flag_create_nakl_extemp = 0 then
        begin
          //необходимо создать налоговую накладную
          // для начала нужно определиться в какой реестр писать
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
          num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
          last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            // отбор данных о контрагенте студгородок
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SELECT_SHABLON_CONTRAGENT(:IS_CONTRAGENT_EDUCATION,:IS_CONTRAGENT_STUDSITY)';
            ImportBankDM.UserDSet.ParamByName('IS_CONTRAGENT_EDUCATION').Value := 0;
            ImportBankDM.UserDSet.ParamByName('IS_CONTRAGENT_STUDSITY').Value  := 1;
            ImportBankDM.UserDSet.Open;

            TaxInvoicesUser.id_customer     := ImportBankDM.UserDSet['id_customer'];
            TaxInvoicesUser.name_customer   := ImportBankDM.UserDSet['full_name_customer'];
            TaxInvoicesUser.ipn_customer    := ImportBankDM.UserDSet['nalog_nom'];
            TaxInvoicesUser.num_sv_customer := ImportBankDM.UserDSet['nns'];
            TaxInvoicesUser.adress_customer := ImportBankDM.UserDSet['full_adress_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.edrpou_customer := ImportBankDM.UserDSet['EDRPOU_CUSTOMER'];

            // отбор реквизитов по налоговой накладной шаблон 1 - студгородок
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SHABLON_REQUISITE_NAKL_SEL where id_shablon = 1';
            ImportBankDM.UserDSet.Open;

            //вставка шапки налоговой накладной
            ImportBankDM.pFIBStoredProc.StoredProcName                                 := 'TI_SP_VID_NAKL_DOC_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate             := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value                  := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SELLER').Value                 := TaxInvoicesUser.id_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value               := TaxInvoicesUser.name_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ipn_seller').Value                := TaxInvoicesUser.ipn_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value              := TaxInvoicesUser.adress_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value              := TaxInvoicesUser.phone_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value          := TaxInvoicesUser.num_sv_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value               := TaxInvoicesUser.Id_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value             := TaxInvoicesUser.Name_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value              := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value            := TaxInvoicesUser.adress_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value            := TaxInvoicesUser.phone_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value        := TaxInvoicesUser.num_sv_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value           := TaxInvoicesUser.edrpou_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('full_name_customer').Value        := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := ImportBankDM.UserDSet['is_issued_buyer_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := ImportBankDM.UserDSet['is_erpn_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := ImportBankDM.UserDSet['is_remains_seller_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := ImportBankDM.UserDSet['is_copy_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := ImportBankDM.UserDSet['id_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := ImportBankDM.UserDSet['name_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value           := ImportBankDM.UserDSet['is_issued_buyer'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn').Value                   := ImportBankDM.UserDSet['is_erpn'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy').Value                   := ImportBankDM.UserDSet['is_copy'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value         := ImportBankDM.UserDSet['IS_REMAINS_SELLER'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value                := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value          := ImportBankDM.UserDSet['ID_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value        := ImportBankDM.UserDSet['NAME_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value        := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value       := ImportBankDM.UserDSet['ID_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value     := ImportBankDM.UserDSet['NAME_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NOTE').Value                   := ImportBankDM.UserDSet['ID_NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('NOTE').Value                      := ImportBankDM.UserDSet['NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value      := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value              := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value            := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ImportBankDM.UserDSet['ID_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ImportBankDM.UserDSet['NAME_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_korig').Value                  := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value                  := '';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value                 := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value         := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_extemp_doc := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
            //вставка документа в список выданных налоговых накладных
            ImportBankDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ImportBankDM.UserDSet['id_type_doc'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ImportBankDM.UserDSet['name_type_doc'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := TaxInvoicesUser.id_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_nakl_extemp_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := 'Банк';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;// главный (ДонНУ)
            ImportBankDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_extemp := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
            //-------------------вставка строки в таблицу налоговой (номенклатура поставки)
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_SP_VID_NAKL_DELIVERY_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('date_shipment').Value                := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value         := ImportBankDM.UserDSet['id_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value       := ImportBankDM.UserDSet['name_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_measures').Value                  := ImportBankDM.UserDSet['id_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_measures').Value                := ImportBankDM.UserDSet['name_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value        := ImportBankDM.UserDSet['kol_vo_delivery_goods'];
            ImportBankDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value         := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_export').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value       := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value              := id_nakl_extemp_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('section').Value                      := '1';
            ImportBankDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value                 := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value                := '';
            ImportBankDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value               := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_extemp_doc_deliv                                                      := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_VID_NAKL_DOC_SUMMA_CALC';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value              := id_nakl_extemp_doc;
            ImportBankDM.pFIBStoredProc.ExecProc;
            flag_create_nakl_extemp := 1; // осв. от НДС-а накладная создана
          end
          else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
        end
        else
        begin
          // необходимо обновить суммы и налоговую накладную
          // сначала проверим подписан ли реестр
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            ImportBankDM.pFIBStoredProc.StoredProcName                             := 'TI_UPDATE_BANK_VID_NAKL';
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value               := id_nakl_extemp;
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc').Value       := id_nakl_extemp_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc_deliv').Value := id_nakl_extemp_doc_deliv;
            ImportBankDM.pFIBStoredProc.ParamByName('summa').Value                 := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_nds').Value := 0;
            ImportBankDM.pFIBStoredProc.ExecProc;
          end;
        end;
        // нужно сохранить id_nakl_extemp накладной и pk_id с ними связанные
        ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl_extemp;
        ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
        ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
        ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
        ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 0;// необлагаемая налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 1;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ExecProc;
      end;

      //summa_nakl_NDS := summa_nakl_NDS + ImportBankDM.BankDocMemoryData['summa'];
      {if (ImportBankDM.pFIBStoredProc.ParamByName('NAKL_IS_NDS').AsInteger = 0) then // это часть НЕоблагаемой налоговой накладной
      summa_nakl_extemp := summa_nakl_extemp + ImportBankDM.BankDocMemoryData['summa']; }
    end;
    ImportBankDM.BankDocMemoryData.Next;
  end;

  if (id_nakl_extemp <> 0) then
  begin
    // добавление бюджетов для НЕоблагаемой налоговой
    ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_nakl_extemp;
    ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 1;
    ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
    ImportBankDM.pFIBStoredProc.ExecProc;
  end;


  if (id_nakl_nds <> 0)then
  begin
    //формирование правильной суммы НДС налоговой
    ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_UPDATE_BANK_NDS_VID_NAKL';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value                 := id_nakl_nds;
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_NDS_DOC').AsInt64       := id_nakl_nds_doc;
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_NDS_DOC_DELIV').AsInt64 := id_nakl_nds_doc_deliv;
    ImportBankDM.pFIBStoredProc.ExecProc;

    // добавление бюджетов для облагаемой налоговой
    ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_nakl_nds;
    ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 1;
    ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
    ImportBankDM.pFIBStoredProc.ExecProc;

    // если проводка нужна - осуществляем её
    if(ImportBankDM.pFIBStoredProc.ParamByName('is_provodka').AsInt64 = 1) then
    begin
        //добавление проводок в буфера
        ImportBankDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
        ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_nakl_nds;
        ImportBankDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
        ImportBankDM.pFIBStoredProc.ExecProc;

        // добавление проводки
        KEY_SESSION_PROVODKA := ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
        workdate    := ImportBankDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
        //ShowMessage(IntToStr(KEY_SESSION));

        STRU.KEY_SESSION   := KEY_SESSION_PROVODKA;
        STRU.WORKDATE      := WORKDATE;
        STRU.DBHANDLE      := ImportBankDM.DB.Handle;
        STRU.TRHANDLE      := ImportBankDM.WriteTransaction.Handle;
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
         ImportBankDM.WriteTransaction.Rollback;
         Exit;
       end;
    end;
  end;


  ImportBankDM.WriteTransaction.Commit;
  ImportBankGridDBTableView1.DataController.FocusedRecordIndex:=i;
  CloseWaitForm(wf);
  TiShowMessage('Увага!','Імпорт виконано вдало',mtInformation,[mbOK]);

  //ModalResult:=mrCancel;
end;

procedure TImportBankForm.dxBarLargeButton2Click(Sender: TObject);
var
  i                       : integer;
  wf                      : TForm;
  flag_create_nakl_NDS    : Integer;
  flag_create_nakl_extemp : Integer;
  id_nakl_nds             : Integer;
  id_nakl_nds_doc         : Integer;
  id_nakl_nds_doc_deliv   : Integer;
  id_nakl_extemp          : Integer;
  id_nakl_extemp_doc      : Integer;
  id_nakl_extemp_doc_deliv: Integer;
  id_reestr               : Integer;
  num_reestr              : Integer;
  last_nomer_reestr       : Integer;
  j                       : Integer;
  workdate                : TDate;
  STRU                    : KERNEL_MODE_STRUCTURE;
  DoResult                : Boolean;
  ErrorList               : TStringList;
  s                       : string;
  KEY_SESSION_PROVODKA    : Int64;
begin
  flag_create_nakl_NDS     := 0;
  flag_create_nakl_extemp  := 0;
  id_nakl_nds              := 0;
  id_nakl_extemp           := 0;
  id_nakl_nds_doc          := 0;
  id_nakl_extemp_doc       := 0;
  id_nakl_nds_doc_deliv    := 0;
  id_nakl_extemp_doc_deliv := 0;

  wf := ShowWaitForm(Application.MainForm,wfPrepareData);

  i := ImportBankGridDBTableView1.DataController.FocusedRecordIndex;
  ImportBankDM.BankDocMemoryData.First;
  ImportBankDM.WriteTransaction.StartTransaction;

  while not(ImportBankDM.BankDocMemoryData.Eof)do
  begin
    if((ImportBankDM.BankDocMemoryData['is_select'] = true) and (ImportBankDM.BankDocMemoryData['summa'] <> 0 ))then
    begin
      ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_BANK_NAKL_IS_NDS';
      ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64       := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
      ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64      := ImportBankDM.BankDocMemoryData['PRIHOD'];
      ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
      ImportBankDM.pFIBStoredProc.ParamByName('ACTUAL_DATE').AsDate  := ImportBankDM.BankDocMemoryData['DATE_REG'];
      ImportBankDM.pFIBStoredProc.ExecProc;
      if (ImportBankDM.pFIBStoredProc.ParamByName('NAKL_IS_NDS').AsInteger = 1) then // это часть облагаемой налоговой накладной
      begin
        if flag_create_nakl_NDS = 0 then
        begin
          //необходимо создать налоговую накладную
          // для начала нужно определиться в какой реестр писать
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
          num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
          last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            // отбор данных о контрагенте обучение
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SELECT_SHABLON_CONTRAGENT(:IS_CONTRAGENT_EDUCATION,:IS_CONTRAGENT_STUDSITY)';
            ImportBankDM.UserDSet.ParamByName('IS_CONTRAGENT_EDUCATION').Value := 1;
            ImportBankDM.UserDSet.ParamByName('IS_CONTRAGENT_STUDSITY').Value  := 0;
            ImportBankDM.UserDSet.Open;

            TaxInvoicesUser.id_customer     := ImportBankDM.UserDSet['id_customer'];
            TaxInvoicesUser.name_customer   := ImportBankDM.UserDSet['full_name_customer'];
            TaxInvoicesUser.ipn_customer    := ImportBankDM.UserDSet['nalog_nom'];
            TaxInvoicesUser.num_sv_customer := ImportBankDM.UserDSet['nns'];
            TaxInvoicesUser.adress_customer := ImportBankDM.UserDSet['full_adress_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.edrpou_customer := ImportBankDM.UserDSet['EDRPOU_CUSTOMER'];

            // отбор реквизитов по налоговой накладной шаблон 2 - обучение
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SHABLON_REQUISITE_NAKL_SEL where id_shablon = 2';
            ImportBankDM.UserDSet.Open;

            //вставка шапки налоговой накладной
            ImportBankDM.pFIBStoredProc.StoredProcName                                 := 'TI_SP_VID_NAKL_DOC_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate             := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value                  := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SELLER').Value                 := TaxInvoicesUser.id_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value               := TaxInvoicesUser.name_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ipn_seller').Value                := TaxInvoicesUser.ipn_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value              := TaxInvoicesUser.adress_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value              := TaxInvoicesUser.phone_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value          := TaxInvoicesUser.num_sv_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value               := TaxInvoicesUser.Id_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value             := TaxInvoicesUser.Name_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value              := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value            := TaxInvoicesUser.adress_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value            := TaxInvoicesUser.phone_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value        := TaxInvoicesUser.num_sv_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value           := TaxInvoicesUser.edrpou_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('full_name_customer').Value        := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := ImportBankDM.UserDSet['is_issued_buyer_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := ImportBankDM.UserDSet['is_erpn_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := ImportBankDM.UserDSet['is_remains_seller_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := ImportBankDM.UserDSet['is_copy_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := ImportBankDM.UserDSet['id_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := ImportBankDM.UserDSet['name_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value           := ImportBankDM.UserDSet['is_issued_buyer'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn').Value                   := ImportBankDM.UserDSet['is_erpn'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy').Value                   := ImportBankDM.UserDSet['is_copy'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value         := ImportBankDM.UserDSet['IS_REMAINS_SELLER'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value                := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value          := ImportBankDM.UserDSet['ID_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value        := ImportBankDM.UserDSet['NAME_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value        := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value       := ImportBankDM.UserDSet['ID_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value     := ImportBankDM.UserDSet['NAME_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NOTE').Value                   := ImportBankDM.UserDSet['ID_NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('NOTE').Value                      := ImportBankDM.UserDSet['NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value      := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value              := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value            := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ImportBankDM.UserDSet['ID_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ImportBankDM.UserDSet['NAME_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_korig').Value                  := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value                  := '';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value                 := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value         := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_nds_doc := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
            //вставка документа в список выданных налоговых накладных
            ImportBankDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ImportBankDM.UserDSet['id_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ImportBankDM.UserDSet['name_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := TaxInvoicesUser.id_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_nakl_nds_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := 'Банк';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;// главный (ДонНУ)
            ImportBankDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value    := '';
            ImportBankDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value      := 0;
            ImportBankDM.pFIBStoredProc.ExecProc;

            id_nakl_nds := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
            //-------------------вставка строки в таблицу налоговой (номенклатура поставки)
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_SP_VID_NAKL_DELIVERY_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('date_shipment').Value                := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value         := ImportBankDM.UserDSet['id_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value       := ImportBankDM.UserDSet['name_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_measures').Value                  := ImportBankDM.UserDSet['id_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_measures').Value                := ImportBankDM.UserDSet['name_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value        := ImportBankDM.UserDSet['kol_vo_delivery_goods'];
            ImportBankDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value         := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_export').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value       := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value              := id_nakl_nds_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('section').Value                      := '1';
            ImportBankDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value                 := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value                := '';
            ImportBankDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value               := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_nds_doc_deliv                                                         := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_VID_NAKL_DOC_SUMMA_CALC';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value              := id_nakl_nds_doc;
            ImportBankDM.pFIBStoredProc.ExecProc;
            flag_create_nakl_NDS := 1; // НДС-ная накладная создана
          end
          else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
        end
        else
        begin
          // необходимо обновить суммы и налоговую накладную
          // сначала проверим подписан ли реестр
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            ImportBankDM.pFIBStoredProc.StoredProcName                             := 'TI_UPDATE_BANK_VID_NAKL';
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value               := id_nakl_nds;
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc').Value       := id_nakl_nds_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc_deliv').Value := id_nakl_nds_doc_deliv;
            ImportBankDM.pFIBStoredProc.ParamByName('summa').Value                 := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_nds').Value := 1;
            ImportBankDM.pFIBStoredProc.ExecProc;
          end
          else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
        end;
        // нужно сохранить id_nakl_nds накладной и pk_id с ними связанные
        ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl_nds;
        ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
        ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
        ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
        ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 1;// облагаемая налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 1;//
        ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;//
        ImportBankDM.pFIBStoredProc.ExecProc;
      end
      else
      // формируем налоговую, освобожденную от НДС
      begin
        if flag_create_nakl_extemp = 0 then
        begin
          //необходимо создать налоговую накладную
          // для начала нужно определиться в какой реестр писать
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
          num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
          last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            // отбор данных о контрагенте обучение
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SELECT_SHABLON_CONTRAGENT(:IS_CONTRAGENT_EDUCATION,:IS_CONTRAGENT_STUDSITY)';
            ImportBankDM.UserDSet.ParamByName('IS_CONTRAGENT_EDUCATION').Value := 1;
            ImportBankDM.UserDSet.ParamByName('IS_CONTRAGENT_STUDSITY').Value  := 0;
            ImportBankDM.UserDSet.Open;

            TaxInvoicesUser.id_customer     := ImportBankDM.UserDSet['id_customer'];
            TaxInvoicesUser.name_customer   := ImportBankDM.UserDSet['full_name_customer'];
            TaxInvoicesUser.ipn_customer    := ImportBankDM.UserDSet['nalog_nom'];
            TaxInvoicesUser.num_sv_customer := ImportBankDM.UserDSet['nns'];
            TaxInvoicesUser.adress_customer := ImportBankDM.UserDSet['full_adress_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.edrpou_customer := ImportBankDM.UserDSet['EDRPOU_CUSTOMER'];

            // отбор реквизитов по налоговой накладной шаблон 2 - обучение
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SHABLON_REQUISITE_NAKL_SEL where id_shablon = 2';
            ImportBankDM.UserDSet.Open;

            //вставка шапки налоговой накладной
            ImportBankDM.pFIBStoredProc.StoredProcName                                 := 'TI_SP_VID_NAKL_DOC_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate             := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value                  := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SELLER').Value                 := TaxInvoicesUser.id_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value               := TaxInvoicesUser.name_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ipn_seller').Value                := TaxInvoicesUser.ipn_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value              := TaxInvoicesUser.adress_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value              := TaxInvoicesUser.phone_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value          := TaxInvoicesUser.num_sv_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value               := TaxInvoicesUser.Id_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value             := TaxInvoicesUser.Name_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value              := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value            := TaxInvoicesUser.adress_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value            := TaxInvoicesUser.phone_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value        := TaxInvoicesUser.num_sv_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value           := TaxInvoicesUser.edrpou_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('full_name_customer').Value        := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := ImportBankDM.UserDSet['is_issued_buyer_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := ImportBankDM.UserDSet['is_erpn_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := ImportBankDM.UserDSet['is_remains_seller_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := ImportBankDM.UserDSet['is_copy_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := ImportBankDM.UserDSet['id_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := ImportBankDM.UserDSet['name_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value           := ImportBankDM.UserDSet['is_issued_buyer'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn').Value                   := ImportBankDM.UserDSet['is_erpn'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy').Value                   := ImportBankDM.UserDSet['is_copy'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value         := ImportBankDM.UserDSet['IS_REMAINS_SELLER'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value                := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value          := ImportBankDM.UserDSet['ID_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value        := ImportBankDM.UserDSet['NAME_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value        := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value       := ImportBankDM.UserDSet['ID_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value     := ImportBankDM.UserDSet['NAME_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NOTE').Value                   := ImportBankDM.UserDSet['ID_NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('NOTE').Value                      := ImportBankDM.UserDSet['NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value      := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value              := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value            := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ImportBankDM.UserDSet['ID_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ImportBankDM.UserDSet['NAME_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_korig').Value                  := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value                  := '';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value                 := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value         := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_extemp_doc := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
            //вставка документа в список выданных налоговых накладных
            ImportBankDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ImportBankDM.UserDSet['id_type_doc'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ImportBankDM.UserDSet['name_type_doc'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := TaxInvoicesUser.id_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_nakl_extemp_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := 'Банк';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;// главный (ДонНУ)
            ImportBankDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value     := ImportBankDM.UserDSet['id_specialnotes_not_nds'];;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value    := ImportBankDM.UserDSet['name_specialnotes_not_nds'];;
            ImportBankDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value      := 0;
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_extemp := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
            //-------------------вставка строки в таблицу налоговой (номенклатура поставки)
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_SP_VID_NAKL_DELIVERY_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('date_shipment').Value                := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value         := ImportBankDM.UserDSet['id_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value       := ImportBankDM.UserDSet['name_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_measures').Value                  := ImportBankDM.UserDSet['id_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_measures').Value                := ImportBankDM.UserDSet['name_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value        := ImportBankDM.UserDSet['kol_vo_delivery_goods'];
            ImportBankDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value         := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_export').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value       := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value              := id_nakl_extemp_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('section').Value                      := '1';
            ImportBankDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value                 := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value                := '';
            ImportBankDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value               := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_extemp_doc_deliv                                                      := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_VID_NAKL_DOC_SUMMA_CALC';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value              := id_nakl_extemp_doc;
            ImportBankDM.pFIBStoredProc.ExecProc;
            flag_create_nakl_extemp := 1; // осв. от НДС-а накладная создана
          end
          else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
        end
        else
        begin
          // необходимо обновить суммы и налоговую накладную
          // сначала проверим подписан ли реестр
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            ImportBankDM.pFIBStoredProc.StoredProcName                             := 'TI_UPDATE_BANK_VID_NAKL';
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value               := id_nakl_extemp;
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc').Value       := id_nakl_extemp_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc_deliv').Value := id_nakl_extemp_doc_deliv;
            ImportBankDM.pFIBStoredProc.ParamByName('summa').Value                 := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_nds').Value := 0;
            ImportBankDM.pFIBStoredProc.ExecProc;
          end
          else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
        end;
        // нужно сохранить id_nakl_extemp накладной и pk_id с ними связанные
        ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl_extemp;
        ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
        ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
        ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
        ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 0;// необлагаемая налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 1;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;// выданная налоговая
        ImportBankDM.pFIBStoredProc.ExecProc;
      end;
      // нужно сохранить
      //summa_nakl_NDS := summa_nakl_NDS + ImportBankDM.BankDocMemoryData['summa'];
      {if (ImportBankDM.pFIBStoredProc.ParamByName('NAKL_IS_NDS').AsInteger = 0) then // это часть НЕоблагаемой налоговой накладной
      summa_nakl_extemp := summa_nakl_extemp + ImportBankDM.BankDocMemoryData['summa']; }
    end;
    ImportBankDM.BankDocMemoryData.Next;
  end;

  if (id_nakl_extemp <> 0) then
  begin
    // добавление бюджетов для НЕоблагаемой налоговой
    ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_nakl_extemp;
    ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 1;
    ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
    ImportBankDM.pFIBStoredProc.ExecProc;
  end;


  if (id_nakl_nds <> 0)then
  begin
    //формирование правильной суммы НДС налоговой
    ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_UPDATE_BANK_NDS_VID_NAKL';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value                 := id_nakl_nds;
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_NDS_DOC').AsInt64       := id_nakl_nds_doc;
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_NDS_DOC_DELIV').AsInt64 := id_nakl_nds_doc_deliv;
    ImportBankDM.pFIBStoredProc.ExecProc;

    // добавление бюджетов для облагаемой налоговой
    ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_nakl_nds;
    ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 1;
    ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
    ImportBankDM.pFIBStoredProc.ExecProc;

    // если проводка нужна - осуществляем её
    if(ImportBankDM.pFIBStoredProc.ParamByName('is_provodka').AsInt64 = 1) then
    begin
        //добавление проводок в буфера
        ImportBankDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
        ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_nakl_nds;
        ImportBankDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
        ImportBankDM.pFIBStoredProc.ExecProc;

        // добавление проводки
        KEY_SESSION_PROVODKA := ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
        workdate    := ImportBankDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
        //ShowMessage(IntToStr(KEY_SESSION));

        STRU.KEY_SESSION   := KEY_SESSION_PROVODKA;
        STRU.WORKDATE      := WORKDATE;
        STRU.DBHANDLE      := ImportBankDM.DB.Handle;
        STRU.TRHANDLE      := ImportBankDM.WriteTransaction.Handle;
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
         ImportBankDM.WriteTransaction.Rollback;
         Exit;
       end;
    end;
  end;


  ImportBankDM.WriteTransaction.Commit;
  ImportBankGridDBTableView1.DataController.FocusedRecordIndex:=i;
  CloseWaitForm(wf);
  TiShowMessage('Увага!','Імпорт виконано вдало',mtInformation,[mbOK]);

  //ModalResult:=mrCancel;
end;

procedure TImportBankForm.InvertButtonClick(Sender: TObject);
var i:integer;
begin
  i := ImportBankGridDBTableView1.DataController.FocusedRecordIndex;
  ImportBankDM.BankDocMemoryData.First;

  while not(ImportBankDM.BankDocMemoryData.Eof)do
  begin
    if(ImportBankDM.BankDocMemoryData['is_select'] = true)then
    begin
      ImportBankDM.BankDocMemoryData.Edit;
      ImportBankDM.BankDocMemoryData['is_select'] := false;
      ImportBankDM.BankDocMemoryData.Post;
    end
    else
    begin
      ImportBankDM.BankDocMemoryData.Edit;
      ImportBankDM.BankDocMemoryData['is_select'] := true;
      ImportBankDM.BankDocMemoryData.Post;
    end;
    ImportBankDM.BankDocMemoryData.Next;
  end;

  ImportBankGridDBTableView1.DataController.FocusedRecordIndex:=i;
end;

procedure TImportBankForm.ImportBankGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
begin
  if ImportBankGridDBTableView1.DataController.RecordCount = 0 then exit;
  // проверка на "импортированность" ранее
  if ((AViewInfo.GridRecord.Values[0]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00CECECE;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[0]= 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00B7B7B7;
      ACanvas.Canvas.FillRect(Arect);
   end;
   //проверка на ошибки при расчете НДС (красный цвет)
   if ((AViewInfo.GridRecord.Values[0]= 0) and (AViewInfo.GridRecord.Focused ) and (AViewInfo.GridRecord.Values[14]= 1)) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=clRed;
      ACanvas.Canvas.FillRect(Arect);
   end;

   if ((AViewInfo.GridRecord.Values[0]= 0) and (not AViewInfo.GridRecord.Focused and (AViewInfo.GridRecord.Values[14]= 1))) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$007575FF;
      ACanvas.Canvas.FillRect(Arect);
   end;

   if ((AViewInfo.GridRecord.Values[15]= 1) and  (not AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00FF80BF;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[15]= 1) and (AViewInfo.GridRecord.Focused )) then
   begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00FF3399;
      ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TImportBankForm.dxBarLargeButton1Click(Sender: TObject);
var
  i                       : integer;
  wf                      : TForm;
  id_nakl                 : Integer;
  id_nakl_doc             : Integer;
  id_nakl_doc_deliv       : Integer;
  id_reestr               : Integer;
  is_signature            : Integer;
  num_reestr              : Integer;
  last_nomer_reestr       : Integer;
  j                       : Integer;
  workdate                : TDate;
  STRU                    : KERNEL_MODE_STRUCTURE;
  DoResult                : Boolean;
  ErrorList               : TStringList;
  s                       : string;
  KEY_SESSION_PROVODKA    : Int64;
  id_otr_nakl             : Integer;
  is_nds                  : Integer;
begin
  wf := ShowWaitForm(Application.MainForm,wfPrepareData);

  i := ImportBankGridDBTableView1.DataController.FocusedRecordIndex;
  ImportBankDM.BankDocMemoryData.First;
  ImportBankDM.WriteTransaction.StartTransaction;

  while not(ImportBankDM.BankDocMemoryData.Eof)do
  begin
    //формирование выданной налоговой накладной
    if((ImportBankDM.BankDocMemoryData['is_select'] = true) and (ImportBankDM.BankDocMemoryData['summa'] <> 0) and (ImportBankDM.BankDocMemoryData['PRIHOD'] = 1))then
    begin
      ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_BANK_NAKL_IS_NDS';
      ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64       := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
      ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64      := ImportBankDM.BankDocMemoryData['PRIHOD'];
      ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
      ImportBankDM.pFIBStoredProc.ParamByName('ACTUAL_DATE').AsDate  := ImportBankDM.BankDocMemoryData['DATE_REG'];
      ImportBankDM.pFIBStoredProc.ExecProc;
      if (ImportBankDM.pFIBStoredProc.ParamByName('NAKL_IS_NDS').AsInteger = 1) then // это облагаемАЯ налоговАЯ накладнАЯ
      begin
        // для начала нужно определиться в какой реестр писать
        ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
        ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
        ImportBankDM.pFIBStoredProc.ExecProc;
        id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
        num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
        last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
        if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            // отбор данных о контрагенте
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_CUSTOMER_INFO(:ID_CUSTOMER)';
            ImportBankDM.UserDSet.ParamByName('ID_CUSTOMER').Value := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
            ImportBankDM.UserDSet.Open;

            TaxInvoicesUser.id_customer     := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
            TaxInvoicesUser.name_customer   := ImportBankDM.UserDSet['full_name_customer'];
            TaxInvoicesUser.ipn_customer    := ImportBankDM.UserDSet['nalog_nom'];
            TaxInvoicesUser.num_sv_customer := ImportBankDM.UserDSet['nns'];
            TaxInvoicesUser.adress_customer := ImportBankDM.UserDSet['full_adress_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.edrpou_customer := ImportBankDM.UserDSet['KOD_EDRPOU'];

            // отбор реквизитов по налоговой накладной шаблон 3 - общий шаблон
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SHABLON_REQUISITE_NAKL_SEL where id_shablon = 3';
            ImportBankDM.UserDSet.Open;

            //вставка шапки налоговой накладной
            ImportBankDM.pFIBStoredProc.StoredProcName                                 := 'TI_SP_VID_NAKL_DOC_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate             := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value                  := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SELLER').Value                 := TaxInvoicesUser.id_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value               := TaxInvoicesUser.name_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ipn_seller').Value                := TaxInvoicesUser.ipn_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value              := TaxInvoicesUser.adress_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value              := TaxInvoicesUser.phone_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value          := TaxInvoicesUser.num_sv_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value               := TaxInvoicesUser.Id_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value             := TaxInvoicesUser.Name_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value              := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value            := TaxInvoicesUser.adress_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value            := TaxInvoicesUser.phone_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value        := TaxInvoicesUser.num_sv_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value           := TaxInvoicesUser.edrpou_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('full_name_customer').Value        := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := ImportBankDM.UserDSet['is_issued_buyer_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := ImportBankDM.UserDSet['is_erpn_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := ImportBankDM.UserDSet['is_remains_seller_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := ImportBankDM.UserDSet['is_copy_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := ImportBankDM.UserDSet['id_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := ImportBankDM.UserDSet['name_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value           := ImportBankDM.UserDSet['is_issued_buyer'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn').Value                   := ImportBankDM.UserDSet['is_erpn'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy').Value                   := ImportBankDM.UserDSet['is_copy'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value         := ImportBankDM.UserDSet['IS_REMAINS_SELLER'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value                := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value          := ImportBankDM.UserDSet['ID_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value        := ImportBankDM.UserDSet['NAME_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value        := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value       := ImportBankDM.UserDSet['ID_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value     := ImportBankDM.UserDSet['NAME_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NOTE').Value                   := ImportBankDM.UserDSet['ID_NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('NOTE').Value                      := ImportBankDM.UserDSet['NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value      := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value              := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value            := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ImportBankDM.UserDSet['ID_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ImportBankDM.UserDSet['NAME_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_korig').Value                  := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value                  := '';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value                 := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value         := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ExecProc;

            id_nakl_doc := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
            //вставка документа в список выданных налоговых накладных
            ImportBankDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ImportBankDM.UserDSet['id_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ImportBankDM.UserDSet['name_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := TaxInvoicesUser.id_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_nakl_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := 'Банк';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;// главный (ДонНУ)
            ImportBankDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value    := '';
            ImportBankDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value      := 0;
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
            //-------------------вставка строки в таблицу налоговой (номенклатура поставки)
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_SP_VID_NAKL_DELIVERY_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('date_shipment').Value                := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value         := ImportBankDM.UserDSet['id_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value       := ImportBankDM.UserDSet['name_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_measures').Value                  := ImportBankDM.UserDSet['id_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_measures').Value                := ImportBankDM.UserDSet['name_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value        := ImportBankDM.UserDSet['kol_vo_delivery_goods'];
            ImportBankDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value         := ImportBankDM.BankDocMemoryData['summa'];
            //ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := ImportBankDM.BankDocMemoryData['summa'] - ImportBankDM.BankDocMemoryData['summa']/6;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := ImportBankDM.BankDocMemoryData['summa'];
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_export').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value       := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value              := id_nakl_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('section').Value                      := '1';
            ImportBankDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value                 := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value                := '';
            ImportBankDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value               := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_doc_deliv                                                             := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_VID_NAKL_DOC_SUMMA_CALC';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value              := id_nakl_doc;
            ImportBankDM.pFIBStoredProc.ExecProc;

            // нужно сохранить id_nakl накладной и pk_id с ними связанные
            ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl;
            ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
            ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
            ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
            ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 1;// облагаемая налоговая
            ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
            ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;//
            ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;//
            ImportBankDM.pFIBStoredProc.ExecProc;

            if (id_nakl <> 0) then
            begin
              //формирование правильной суммы НДС налоговой
              ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_UPDATE_BANK_NDS_VID_NAKL';
              ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value                 := id_nakl;
              ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_NDS_DOC').AsInt64       := id_nakl_doc;
              ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_NDS_DOC_DELIV').AsInt64 := id_nakl_doc_deliv;
              ImportBankDM.pFIBStoredProc.ExecProc;

              // добавление бюджетов для облагаемой налоговой
              ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
              ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_nakl;
              ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 1;
              ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
              ImportBankDM.pFIBStoredProc.ExecProc;

               // если проводка нужна - осуществляем её
              if(ImportBankDM.pFIBStoredProc.ParamByName('is_provodka').AsInt64 = 1) then
              begin
                //добавление проводок в буфера
                ImportBankDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
                ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_nakl;
                ImportBankDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
                ImportBankDM.pFIBStoredProc.ExecProc;

                // добавление проводки
                KEY_SESSION_PROVODKA := ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
                workdate    := ImportBankDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
                //ShowMessage(IntToStr(KEY_SESSION));

                STRU.KEY_SESSION   := KEY_SESSION_PROVODKA;
                STRU.WORKDATE      := WORKDATE;
                STRU.DBHANDLE      := ImportBankDM.DB.Handle;
                STRU.TRHANDLE      := ImportBankDM.WriteTransaction.Handle;
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
                 ImportBankDM.WriteTransaction.Rollback;
                 Exit;
                end;
              end;
            end;
          end
        else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
      end
      else
      // создаем необлагаемую налоговую накладную
      begin
        // для начала нужно определиться в какой реестр писать
        ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
        ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
        ImportBankDM.pFIBStoredProc.ExecProc;
        id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
        num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
        last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
        if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
        begin
          // отбор данных о контрагенте
          ImportBankDM.UserDSet.Close;
          ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_CUSTOMER_INFO(:ID_CUSTOMER)';
          ImportBankDM.UserDSet.ParamByName('ID_CUSTOMER').Value := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
          ImportBankDM.UserDSet.Open;

          TaxInvoicesUser.id_customer     := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
          TaxInvoicesUser.name_customer   := ImportBankDM.UserDSet['full_name_customer'];
          TaxInvoicesUser.ipn_customer    := ImportBankDM.UserDSet['nalog_nom'];
          TaxInvoicesUser.num_sv_customer := ImportBankDM.UserDSet['nns'];
          TaxInvoicesUser.adress_customer := ImportBankDM.UserDSet['full_adress_customer'];
          TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
          TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
          TaxInvoicesUser.edrpou_customer := ImportBankDM.UserDSet['KOD_EDRPOU'];

          // отбор реквизитов по налоговой накладной шаблон 1 - студгородок
          ImportBankDM.UserDSet.Close;
          ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SHABLON_REQUISITE_NAKL_SEL where id_shablon = 3';
          ImportBankDM.UserDSet.Open;

          //вставка шапки налоговой накладной
          ImportBankDM.pFIBStoredProc.StoredProcName                                 := 'TI_SP_VID_NAKL_DOC_INS';
          ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate             := ImportBankDM.BankDocMemoryData['DATE_PROV'];
          ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value                  := last_nomer_reestr;
          ImportBankDM.pFIBStoredProc.ParamByName('ID_SELLER').Value                 := TaxInvoicesUser.id_seller;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value               := TaxInvoicesUser.name_seller;
          ImportBankDM.pFIBStoredProc.ParamByName('ipn_seller').Value                := TaxInvoicesUser.ipn_seller;
          ImportBankDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value              := TaxInvoicesUser.adress_seller;
          ImportBankDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value              := TaxInvoicesUser.phone_seller;
          ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value          := TaxInvoicesUser.num_sv_seller;
          ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value               := TaxInvoicesUser.Id_Customer;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value             := TaxInvoicesUser.Name_Customer;
          ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value              := TaxInvoicesUser.ipn_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value            := TaxInvoicesUser.adress_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value            := TaxInvoicesUser.phone_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value        := TaxInvoicesUser.num_sv_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value           := TaxInvoicesUser.edrpou_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('full_name_customer').Value        := TaxInvoicesUser.name_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := ImportBankDM.UserDSet['is_issued_buyer_two_ekz'];
          ImportBankDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := ImportBankDM.UserDSet['is_erpn_two_ekz'];
          ImportBankDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := ImportBankDM.UserDSet['is_remains_seller_two_ekz'];
          ImportBankDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := ImportBankDM.UserDSet['is_copy_two_ekz'];
          ImportBankDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := ImportBankDM.UserDSet['id_specialnotes_two_ekz'];
          ImportBankDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := ImportBankDM.UserDSet['name_specialnotes_two_ekz'];
          ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value           := ImportBankDM.UserDSet['is_issued_buyer'];
          ImportBankDM.pFIBStoredProc.ParamByName('is_erpn').Value                   := ImportBankDM.UserDSet['is_erpn'];
          ImportBankDM.pFIBStoredProc.ParamByName('is_copy').Value                   := ImportBankDM.UserDSet['is_copy'];
          ImportBankDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value         := ImportBankDM.UserDSet['IS_REMAINS_SELLER'];
          ImportBankDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value                := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value          := ImportBankDM.UserDSet['ID_TERMSDELIVERY'];
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value        := ImportBankDM.UserDSet['NAME_TERMSDELIVERY'];
          ImportBankDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value        := StrtoDate('01.01.1900');
          ImportBankDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value         := '';
          ImportBankDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value       := ImportBankDM.UserDSet['ID_FORMCALCULATIONS'];
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value     := ImportBankDM.UserDSet['NAME_FORMCALCULATIONS'];
          ImportBankDM.pFIBStoredProc.ParamByName('ID_NOTE').Value                   := ImportBankDM.UserDSet['ID_NOTE'];
          ImportBankDM.pFIBStoredProc.ParamByName('NOTE').Value                      := ImportBankDM.UserDSet['NOTE'];
          ImportBankDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value        := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value      := '';
          ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value              := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value            := '';
          ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ImportBankDM.UserDSet['ID_SPECIALNOTES'];
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ImportBankDM.UserDSet['NAME_SPECIALNOTES'];
          ImportBankDM.pFIBStoredProc.ParamByName('is_korig').Value                  := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value                  := '';
          ImportBankDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value                 := StrtoDate('01.01.1900');
          ImportBankDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value         := StrtoDate('01.01.1900');
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_nakl_doc := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
          //вставка документа в список выданных налоговых накладных
          ImportBankDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
          ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := ImportBankDM.BankDocMemoryData['DATE_PROV'];
          ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := last_nomer_reestr;
          ImportBankDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := last_nomer_reestr;
          ImportBankDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ImportBankDM.UserDSet['id_type_doc'];
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ImportBankDM.UserDSet['name_type_doc'];
          ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
          ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := TaxInvoicesUser.id_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := TaxInvoicesUser.name_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := TaxInvoicesUser.ipn_customer;
          ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_reestr;
          ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_nakl_doc;
          ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
          ImportBankDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
          ImportBankDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := 'Банк';
          ImportBankDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;// главный (ДонНУ)
          ImportBankDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';
          ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value     := ImportBankDM.UserDSet['id_specialnotes_not_nds'];
          ImportBankDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value    := ImportBankDM.UserDSet['name_specialnotes_not_nds'];;
          ImportBankDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value         := '';
          ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value      := 0;
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_nakl := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
          //-------------------вставка строки в таблицу налоговой (номенклатура поставки)
          ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_SP_VID_NAKL_DELIVERY_INS';
          ImportBankDM.pFIBStoredProc.ParamByName('date_shipment').Value                := ImportBankDM.BankDocMemoryData['DATE_PROV'];
          ImportBankDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value         := ImportBankDM.UserDSet['id_range_of_delivery'];
          ImportBankDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value       := ImportBankDM.UserDSet['name_range_of_delivery'];
          ImportBankDM.pFIBStoredProc.ParamByName('id_measures').Value                  := ImportBankDM.UserDSet['id_measures'];
          ImportBankDM.pFIBStoredProc.ParamByName('name_measures').Value                := ImportBankDM.UserDSet['name_measures'];
          ImportBankDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value        := ImportBankDM.UserDSet['kol_vo_delivery_goods'];
          ImportBankDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value         := ImportBankDM.BankDocMemoryData['summa'];
          ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_export').Value        := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value       := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ImportBankDM.BankDocMemoryData['summa'];
          ImportBankDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value              := id_nakl_doc;
          ImportBankDM.pFIBStoredProc.ParamByName('section').Value                      := '1';
          ImportBankDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value                 := 0;
          ImportBankDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value                := '';
          ImportBankDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value               := '';
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_nakl_doc_deliv                                                             := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
          ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_VID_NAKL_DOC_SUMMA_CALC';
          ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value              := id_nakl_doc;
          ImportBankDM.pFIBStoredProc.ExecProc;
          // нужно сохранить id_nakl накладной и pk_id с ними связанные
          ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
          ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl;
          ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
          ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
          ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
          ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 0;// необлагаемая налоговая
          ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
          ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;// выданная налоговая
          ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;// выданная налоговая
          ImportBankDM.pFIBStoredProc.ExecProc;
          if (id_nakl <> 0) then
          begin
            // добавление бюджетов для НЕоблагаемой налоговой
            ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_nakl;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 1;
            ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
            ImportBankDM.pFIBStoredProc.ExecProc;
          end;
        end
        else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
      end;
    end;
    // формирование полученной налоговой накладной
    if((ImportBankDM.BankDocMemoryData['is_select'] = true) and (ImportBankDM.BankDocMemoryData['summa'] <> 0) and (ImportBankDM.BankDocMemoryData['PRIHOD'] = 0))then
    begin
        // для начала нужно определиться в какой реестр писать
        ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM_OTR';
        ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['DATE_OTR_NAKL'];
        ImportBankDM.pFIBStoredProc.ExecProc;
        id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
        num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
        last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_OTR_NAKL').AsInt64;
        if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            ImportBankDM.pFIBStoredProc.StoredProcName                        := 'TI_IMPORT_OTR_NAKL_BANK';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PROV').AsDate       := ImportBankDM.BankDocMemoryData['DATE_OTR_NAKL'];
            ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64          := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value      := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value   := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_TIME_CREATE').Value := Now;
            ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').Value      := KEY_SESSION;
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_otr_nakl := ImportBankDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL_').Value;
            is_nds      := ImportBankDM.pFIBStoredProc.ParamByName('IS_NDS').Value;
            // нужно сохранить id_nakl накладной и pk_id с ними связанные
            ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_otr_nakl;
            ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
            ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
            ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
            ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := is_nds;
            ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 0;// полученная налоговая
            ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;
            ImportBankDM.pFIBStoredProc.ExecProc;
            // добавление бюджетов для полученной налоговой
            ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_otr_nakl;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
            ImportBankDM.pFIBStoredProc.ExecProc;
            // если проводка нужна - осуществляем её
            if(ImportBankDM.pFIBStoredProc.ParamByName('is_provodka').AsInt64 = 1) then
            begin
              //добавление проводок в буфера
              ImportBankDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_OTR_NAKL';
              ImportBankDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL').Value        := id_otr_nakl;
              ImportBankDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
              ImportBankDM.pFIBStoredProc.ExecProc;

              // добавление проводки
              KEY_SESSION_PROVODKA := ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
              workdate             := ImportBankDM.pFIBStoredProc.ParamByName('DATE_PROV').value;

              STRU.KEY_SESSION   := KEY_SESSION_PROVODKA;
              STRU.WORKDATE      := WORKDATE;
              STRU.DBHANDLE      := ImportBankDM.DB.Handle;
              STRU.TRHANDLE      := ImportBankDM.WriteTransaction.Handle;
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
               ImportBankDM.WriteTransaction.Rollback;
               Exit;
              end;
            end;
          end
        else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
    end;
    ImportBankDM.BankDocMemoryData.Next;
  end;
  ImportBankDM.WriteTransaction.Commit;
  ImportBankGridDBTableView1.DataController.FocusedRecordIndex:=i;
  CloseWaitForm(wf);
  TiShowMessage('Увага!','Імпорт виконано вдало',mtInformation,[mbOK]);
end;

procedure TImportBankForm.dxBarLargeButton4Click(Sender: TObject);
var
  i                    : Integer;
  wf                   : TForm;
  id_reestr            : Integer;
  num_reestr           : Integer;
  last_nomer_reestr    : Integer;
  flag_create_otr_nakl : Integer;
  id_otr_nakl          : Integer;
  j                    : Integer;
  workdate             : TDate;
  STRU                 : KERNEL_MODE_STRUCTURE;
  DoResult             : Boolean;
  ErrorList            : TStringList;
  s                    : string;
  KEY_SESSION_PROVODKA : Int64;
begin
  flag_create_otr_nakl := 0;
  wf := ShowWaitForm(Application.MainForm,wfPrepareData);

  i := ImportBankGridDBTableView1.DataController.FocusedRecordIndex;
  ImportBankDM.BankDocMemoryData.First;
  ImportBankDM.WriteTransaction.StartTransaction;

  while not(ImportBankDM.BankDocMemoryData.Eof)do
  begin
    if((ImportBankDM.BankDocMemoryData['is_select'] = true) and (ImportBankDM.BankDocMemoryData['summa'] <> 0) and (ImportBankDM.BankDocMemoryData['PRIHOD'] = 0))then
    begin
      // поиск реестра куда писать
      ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
      ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['DATE_OTR_NAKL'];
      ImportBankDM.pFIBStoredProc.ExecProc;
      id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
      num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
      last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
      if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
        begin
          if (flag_create_otr_nakl = 0) then
          begin
            //добавление пустой полученной налоговой накладной
            ImportBankDM.pFIBStoredProc.StoredProcName                        := 'TI_INSERT_OTR_NAKL_BANK_EMPTY';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PROV').AsDate       := ImportBankDM.BankDocMemoryData['DATE_OTR_NAKL'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value      := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value   := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_TIME_CREATE').Value := Now;
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_otr_nakl := ImportBankDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL_').Value;
            flag_create_otr_nakl := 1;
          end;

          // нужно сохранить id_nakl_nds накладной и pk_id с ними связанные
          ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
          ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_otr_nakl;
          ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
          ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
          ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
          ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := -1;// непонятно облагаемая налоговая или нет, далее станет понятно
          ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 0;// полученная налоговая
          ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;//
          ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;//
          ImportBankDM.pFIBStoredProc.ExecProc;

        end
      else // если реестр подписан
        begin
          CloseWaitForm(wf);
          TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
          ImportBankDM.WriteTransaction.Rollback;
          Exit;
        end;
    end;
    ImportBankDM.BankDocMemoryData.Next;
  end;

  //формирование полученной налоговой накладной
  ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_OTR_NAKL_BANK_SEVERAL';
  ImportBankDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL').Value    := id_otr_nakl;
  ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
  ImportBankDM.pFIBStoredProc.ExecProc;

  // добавление бюджетов для полученной налоговой
  ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
  ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_otr_nakl;
  ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 0;
  ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
  ImportBankDM.pFIBStoredProc.ExecProc;
  // если проводка нужна - осуществляем её
  if(ImportBankDM.pFIBStoredProc.ParamByName('is_provodka').AsInt64 = 1) then
  begin
    //добавление проводок в буфера
    ImportBankDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_OTR_NAKL';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL').Value        := id_otr_nakl;
    ImportBankDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
    ImportBankDM.pFIBStoredProc.ExecProc;

    // добавление проводки
    KEY_SESSION_PROVODKA := ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
    workdate             := ImportBankDM.pFIBStoredProc.ParamByName('DATE_PROV').value;

    STRU.KEY_SESSION   := KEY_SESSION_PROVODKA;
    STRU.WORKDATE      := WORKDATE;
    STRU.DBHANDLE      := ImportBankDM.DB.Handle;
    STRU.TRHANDLE      := ImportBankDM.WriteTransaction.Handle;
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
      ImportBankDM.WriteTransaction.Rollback;
      Exit;
    end;
  end;

  ImportBankDM.WriteTransaction.Commit;
  ImportBankGridDBTableView1.DataController.FocusedRecordIndex:=i;
  CloseWaitForm(wf);
  TiShowMessage('Увага!','Імпорт виконано вдало',mtInformation,[mbOK]);
end;


procedure TImportBankForm.dxBarLargeButton5Click(Sender: TObject);
var
  ViewForm : TImportBankDataOtrNaklForm;
begin
  if (ImportBankDM.BankDocDSet['prihod'] = 0) then
  begin
    ViewForm := TImportBankDataOtrNaklForm.Create(Self);
    ViewForm.DateOtrNaklDateEdit.Date := ImportBankDM.BankDocDSet['DATE_OTR_NAKL'];
    ViewForm.ShowModal;
    if (ViewForm.ModalResult = mrok)then
    begin
      ImportBankDM.BankDocMemoryData.Open;
      ImportBankDM.BankDocMemoryData.edit;
      ImportBankDM.BankDocMemoryData.FieldByName('DATE_OTR_NAKL').Value := Datetostr(ViewForm.DateOtrNaklDateEdit.Date);
      ImportBankDM.BankDocMemoryData.Post;
    end;  
  end;
end;

procedure TImportBankForm.dxBarLargeButton6Click(Sender: TObject);
var
  i                       : integer;
  wf                      : TForm;
  id_nakl                 : Integer;
  id_nakl_doc             : Integer;
  id_nakl_doc_deliv       : Integer;
  id_reestr               : Integer;
  is_signature            : Integer;
  num_reestr              : Integer;
  last_nomer_reestr       : Integer;
  j                       : Integer;
  workdate                : TDate;
  STRU                    : KERNEL_MODE_STRUCTURE;
  DoResult                : Boolean;
  ErrorList               : TStringList;
  s                       : string;
  KEY_SESSION_PROVODKA    : Int64;
  id_otr_nakl             : Integer;
  is_nds                  : Integer;
  flag_create_nakl_NDS    : Integer;
  flag_create_nakl_extemp : Integer;
  id_nakl_ext             : Integer;
  id_nakl_ext_doc         : Integer;
  id_nakl_ext_doc_deliv   : Integer;
begin
  id_nakl  := 0;
  wf := ShowWaitForm(Application.MainForm,wfPrepareData);

  i := ImportBankGridDBTableView1.DataController.FocusedRecordIndex;
  ImportBankDM.BankDocMemoryData.First;
  ImportBankDM.WriteTransaction.StartTransaction;
  flag_create_nakl_NDS := 0;

  while not(ImportBankDM.BankDocMemoryData.Eof)do
  begin
    if((ImportBankDM.BankDocMemoryData['is_select'] = true) and (ImportBankDM.BankDocMemoryData['summa'] <> 0 ))then
    begin
      ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_BANK_NAKL_IS_NDS';
      ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64       := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
      ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64      := ImportBankDM.BankDocMemoryData['PRIHOD'];
      ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
      ImportBankDM.pFIBStoredProc.ParamByName('ACTUAL_DATE').AsDate  := ImportBankDM.BankDocMemoryData['DATE_REG'];
      ImportBankDM.pFIBStoredProc.ExecProc;
      if (ImportBankDM.pFIBStoredProc.ParamByName('NAKL_IS_NDS').AsInteger = 1) then // это облагаемАЯ налоговАЯ накладнАЯ
      begin
        if flag_create_nakl_NDS = 0 then
        begin
          //необходимо создать налоговую накладную
          // для начала нужно определиться в какой реестр писать
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
          num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
          last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            // отбор данных о контрагенте
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_CUSTOMER_INFO(:ID_CUSTOMER)';
            ImportBankDM.UserDSet.ParamByName('ID_CUSTOMER').Value := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
            ImportBankDM.UserDSet.Open;

            TaxInvoicesUser.id_customer     := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
            TaxInvoicesUser.name_customer   := ImportBankDM.UserDSet['full_name_customer'];
            TaxInvoicesUser.ipn_customer    := ImportBankDM.UserDSet['nalog_nom'];
            TaxInvoicesUser.num_sv_customer := ImportBankDM.UserDSet['nns'];
            TaxInvoicesUser.adress_customer := ImportBankDM.UserDSet['full_adress_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.edrpou_customer := ImportBankDM.UserDSet['KOD_EDRPOU'];

            // отбор реквизитов по налоговой накладной шаблон 3 - общий шаблон
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SHABLON_REQUISITE_NAKL_SEL where id_shablon = 3';
            ImportBankDM.UserDSet.Open;

            //вставка шапки налоговой накладной
            ImportBankDM.pFIBStoredProc.StoredProcName                                 := 'TI_SP_VID_NAKL_DOC_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate             := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value                  := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SELLER').Value                 := TaxInvoicesUser.id_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value               := TaxInvoicesUser.name_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ipn_seller').Value                := TaxInvoicesUser.ipn_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value              := TaxInvoicesUser.adress_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value              := TaxInvoicesUser.phone_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value          := TaxInvoicesUser.num_sv_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value               := TaxInvoicesUser.Id_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value             := TaxInvoicesUser.Name_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value              := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value            := TaxInvoicesUser.adress_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value            := TaxInvoicesUser.phone_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value        := TaxInvoicesUser.num_sv_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value           := TaxInvoicesUser.edrpou_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('full_name_customer').Value        := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := ImportBankDM.UserDSet['is_issued_buyer_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := ImportBankDM.UserDSet['is_erpn_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := ImportBankDM.UserDSet['is_remains_seller_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := ImportBankDM.UserDSet['is_copy_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := ImportBankDM.UserDSet['id_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := ImportBankDM.UserDSet['name_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value           := ImportBankDM.UserDSet['is_issued_buyer'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn').Value                   := ImportBankDM.UserDSet['is_erpn'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy').Value                   := ImportBankDM.UserDSet['is_copy'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value         := ImportBankDM.UserDSet['IS_REMAINS_SELLER'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value                := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value          := ImportBankDM.UserDSet['ID_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value        := ImportBankDM.UserDSet['NAME_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value        := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value       := ImportBankDM.UserDSet['ID_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value     := ImportBankDM.UserDSet['NAME_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NOTE').Value                   := ImportBankDM.UserDSet['ID_NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('NOTE').Value                      := ImportBankDM.UserDSet['NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value      := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value              := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value            := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ImportBankDM.UserDSet['ID_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ImportBankDM.UserDSet['NAME_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_korig').Value                  := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value                  := '';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value                 := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value         := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ExecProc;

            id_nakl_doc := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
            //вставка документа в список выданных налоговых накладных
            ImportBankDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ImportBankDM.UserDSet['id_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ImportBankDM.UserDSet['name_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := TaxInvoicesUser.id_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_nakl_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := 'Банк';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;// главный (ДонНУ)
            ImportBankDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value    := '';
            ImportBankDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value      := 0;
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
            //-------------------вставка строки в таблицу налоговой (номенклатура поставки)
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_SP_VID_NAKL_DELIVERY_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('date_shipment').Value                := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value         := ImportBankDM.UserDSet['id_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value       := ImportBankDM.UserDSet['name_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_measures').Value                  := ImportBankDM.UserDSet['id_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_measures').Value                := ImportBankDM.UserDSet['name_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value        := ImportBankDM.UserDSet['kol_vo_delivery_goods'];
            ImportBankDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value         := ImportBankDM.BankDocMemoryData['summa'];
            //ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := ImportBankDM.BankDocMemoryData['summa'] - ImportBankDM.BankDocMemoryData['summa']/6;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_export').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value       := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value              := id_nakl_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('section').Value                      := '1';
            ImportBankDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value                 := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value                := '';
            ImportBankDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value               := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_doc_deliv                                                             := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_VID_NAKL_DOC_SUMMA_CALC';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value              := id_nakl_doc;
            ImportBankDM.pFIBStoredProc.ExecProc;

            //****************************************************************
            // нужно сохранить id_nakl накладной и pk_id с ними связанные
            ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl;
            ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
            ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
            ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
            ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 1;// облагаемая налоговая
            ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
            ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;//
            ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;//
            ImportBankDM.pFIBStoredProc.ExecProc;
          end
          else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
          flag_create_nakl_NDS := 1;
        end
        else
        begin
          // необходимо обновить суммы и налоговую накладную
          // сначала проверим подписан ли реестр
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
            begin
              // нужно сохранить id_nakl накладной и pk_id с ними связанные
              ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
              ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl;
              ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
              ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
              ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
              ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 1;// облагаемая налоговая
              ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
              ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;//
              ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;//
              ImportBankDM.pFIBStoredProc.ExecProc;

              // добавление бюджетов для облагаемой налоговой
              ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
              ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_nakl;
              ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 1;
              ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
              ImportBankDM.pFIBStoredProc.ExecProc;
            end
          else // если реестр подписан
            begin
              CloseWaitForm(wf);
              TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
              ImportBankDM.WriteTransaction.Rollback;
              Exit;
            end;

        end;

        ImportBankDM.pFIBStoredProc.StoredProcName                             := 'TI_UPDATE_BANK_VID_NAKL';
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value               := id_nakl;
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc').Value       := id_nakl_doc;
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc_deliv').Value := id_nakl_doc_deliv;
        ImportBankDM.pFIBStoredProc.ParamByName('summa').Value                 := ImportBankDM.BankDocMemoryData['summa'] - ImportBankDM.BankDocMemoryData['SUMMA_NDS_DOC'];
        ImportBankDM.pFIBStoredProc.ParamByName('is_nds').Value := 1;
        ImportBankDM.pFIBStoredProc.ExecProc;
      end
      else //это НЕоблагаемая налоговая
      begin
        if flag_create_nakl_extemp = 0 then
        begin
          //необходимо создать налоговую накладную
          // для начала нужно определиться в какой реестр писать
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          id_reestr         := ImportBankDM.pFIBStoredProc.ParamByName('id_reestr').AsInt64;
          num_reestr        := ImportBankDM.pFIBStoredProc.ParamByName('num_reestr').AsInt64;
          last_nomer_reestr := ImportBankDM.pFIBStoredProc.ParamByName('LAST_NOMER_VID_NAKL').AsInt64;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
          begin
            // отбор данных о контрагенте
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_CUSTOMER_INFO(:ID_CUSTOMER)';
            ImportBankDM.UserDSet.ParamByName('ID_CUSTOMER').Value := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
            ImportBankDM.UserDSet.Open;

            TaxInvoicesUser.id_customer     := ImportBankDM.BankDocMemoryData['ID_CUSTOMER'];
            TaxInvoicesUser.name_customer   := ImportBankDM.UserDSet['full_name_customer'];
            TaxInvoicesUser.ipn_customer    := ImportBankDM.UserDSet['nalog_nom'];
            TaxInvoicesUser.num_sv_customer := ImportBankDM.UserDSet['nns'];
            TaxInvoicesUser.adress_customer := ImportBankDM.UserDSet['full_adress_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.phone_customer  := ImportBankDM.UserDSet['phone_customer'];
            TaxInvoicesUser.edrpou_customer := ImportBankDM.UserDSet['KOD_EDRPOU'];

            // отбор реквизитов по налоговой накладной шаблон 3 - общий шаблон
            ImportBankDM.UserDSet.Close;
            ImportBankDM.UserDSet.SelectSQL.Text := 'select * from TI_SHABLON_REQUISITE_NAKL_SEL where id_shablon = 3';
            ImportBankDM.UserDSet.Open;

            //вставка шапки налоговой накладной
            ImportBankDM.pFIBStoredProc.StoredProcName                                 := 'TI_SP_VID_NAKL_DOC_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate             := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value                  := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SELLER').Value                 := TaxInvoicesUser.id_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value               := TaxInvoicesUser.name_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ipn_seller').Value                := TaxInvoicesUser.ipn_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value              := TaxInvoicesUser.adress_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value              := TaxInvoicesUser.phone_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value          := TaxInvoicesUser.num_sv_seller;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value               := TaxInvoicesUser.Id_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value             := TaxInvoicesUser.Name_Customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value              := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value            := TaxInvoicesUser.adress_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value            := TaxInvoicesUser.phone_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value        := TaxInvoicesUser.num_sv_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value           := TaxInvoicesUser.edrpou_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('full_name_customer').Value        := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := ImportBankDM.UserDSet['is_issued_buyer_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := ImportBankDM.UserDSet['is_erpn_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := ImportBankDM.UserDSet['is_remains_seller_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := ImportBankDM.UserDSet['is_copy_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := ImportBankDM.UserDSet['id_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := ImportBankDM.UserDSet['name_specialnotes_two_ekz'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value           := ImportBankDM.UserDSet['is_issued_buyer'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_erpn').Value                   := ImportBankDM.UserDSet['is_erpn'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_copy').Value                   := ImportBankDM.UserDSet['is_copy'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value         := ImportBankDM.UserDSet['IS_REMAINS_SELLER'];
            ImportBankDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value                := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value          := ImportBankDM.UserDSet['ID_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value        := ImportBankDM.UserDSet['NAME_TERMSDELIVERY'];
            ImportBankDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value        := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value       := ImportBankDM.UserDSet['ID_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value     := ImportBankDM.UserDSet['NAME_FORMCALCULATIONS'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NOTE').Value                   := ImportBankDM.UserDSet['ID_NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('NOTE').Value                      := ImportBankDM.UserDSet['NOTE'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value      := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value              := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value            := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value           := ImportBankDM.UserDSet['ID_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value         := ImportBankDM.UserDSet['NAME_SPECIALNOTES'];
            ImportBankDM.pFIBStoredProc.ParamByName('is_korig').Value                  := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value                  := '';
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value                 := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value         := StrtoDate('01.01.1900');
            ImportBankDM.pFIBStoredProc.ExecProc;

            id_nakl_ext_doc := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
            //вставка документа в список выданных налоговых накладных
            ImportBankDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := last_nomer_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := ImportBankDM.UserDSet['id_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := ImportBankDM.UserDSet['name_type_doc_nds'];
            ImportBankDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := TaxInvoicesUser.id_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := TaxInvoicesUser.name_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := TaxInvoicesUser.ipn_customer;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_reestr;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_nakl_ext_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
            ImportBankDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
            ImportBankDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
            ImportBankDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := 'Банк';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;// главный (ДонНУ)
            ImportBankDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value     := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value    := '';
            ImportBankDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value         := '';
            ImportBankDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value      := 0;
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_ext := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
            //-------------------вставка строки в таблицу налоговой (номенклатура поставки)
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_SP_VID_NAKL_DELIVERY_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('date_shipment').Value                := ImportBankDM.BankDocMemoryData['DATE_PROV'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value         := ImportBankDM.UserDSet['id_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value       := ImportBankDM.UserDSet['name_range_of_delivery'];
            ImportBankDM.pFIBStoredProc.ParamByName('id_measures').Value                  := ImportBankDM.UserDSet['id_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('name_measures').Value                := ImportBankDM.UserDSet['name_measures'];
            ImportBankDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value        := ImportBankDM.UserDSet['kol_vo_delivery_goods'];
            ImportBankDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value         := ImportBankDM.BankDocMemoryData['summa'];
            //ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := ImportBankDM.BankDocMemoryData['summa'] - ImportBankDM.BankDocMemoryData['summa']/6;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_20').Value            := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_export').Value        := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value       := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value              := id_nakl_ext_doc;
            ImportBankDM.pFIBStoredProc.ParamByName('section').Value                      := '1';
            ImportBankDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value                 := 0;
            ImportBankDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value                := '';
            ImportBankDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value               := '';
            ImportBankDM.pFIBStoredProc.ExecProc;
            id_nakl_ext_doc_deliv                                                             := ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
            ImportBankDM.pFIBStoredProc.StoredProcName                                    := 'TI_VID_NAKL_DOC_SUMMA_CALC';
            ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value              := id_nakl_ext_doc;
            ImportBankDM.pFIBStoredProc.ExecProc;

            //****************************************************************
            // нужно сохранить id_nakl накладной и pk_id с ними связанные
            ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
            ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl_ext;
            ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
            ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
            ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
            ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 0;// облагаемая налоговая
            ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
            ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;//
            ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;//
            ImportBankDM.pFIBStoredProc.ExecProc;
          end
          else // если реестр подписан
          begin
            CloseWaitForm(wf);
            TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
            ImportBankDM.WriteTransaction.Rollback;
            Exit;
          end;
          flag_create_nakl_extemp := 1;
        end
        else
        begin
          // необходимо обновить суммы и налоговую накладную
          // сначала проверим подписан ли реестр
          ImportBankDM.pFIBStoredProc.StoredProcName                   := 'TI_IMPORT_PARAM';
          ImportBankDM.pFIBStoredProc.ParamByName('DATA_SCHET').AsDate := ImportBankDM.BankDocMemoryData['date_prov'];
          ImportBankDM.pFIBStoredProc.ExecProc;
          if (ImportBankDM.pFIBStoredProc.ParamByName('IS_SIGNATURE').AsInt64 = 0) then   // если реестр НЕ подписан
            begin
              // нужно сохранить id_nakl накладной и pk_id с ними связанные
              ImportBankDM.pFIBStoredProc.StoredProcName                      := 'TI_IMPORT_BANK_NAKL_INS';
              ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value        := id_nakl_ext;
              ImportBankDM.pFIBStoredProc.ParamByName('PK_ID').AsInt64        := StrToInt64(ImportBankDM.BankDocMemoryData.fieldbyname('pk_id').AsString);
              ImportBankDM.pFIBStoredProc.ParamByName('PRIHOD').AsInt64       := ImportBankDM.BankDocMemoryData['PRIHOD'];
              ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
              ImportBankDM.pFIBStoredProc.ParamByName('is_nds').AsInt64       := 0;// облагаемая налоговая
              ImportBankDM.pFIBStoredProc.ParamByName('is_vid').AsInt64       := 1;// выданная налоговая
              ImportBankDM.pFIBStoredProc.ParamByName('is_education').AsInt64 := 0;//
              ImportBankDM.pFIBStoredProc.ParamByName('is_studsity').AsInt64  := 0;//
              ImportBankDM.pFIBStoredProc.ExecProc;

              // добавление бюджетов для облагаемой налоговой
              ImportBankDM.pFIBStoredProc.StoredProcName := 'TI_INSERT_BUDGET_NAKL_BANK';
              ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_nakl_ext;
              ImportBankDM.pFIBStoredProc.ParamByName('IS_VID').AsInt64       := 1;
              ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := KEY_SESSION;
              ImportBankDM.pFIBStoredProc.ExecProc;
            end
          else // если реестр подписан
            begin
              CloseWaitForm(wf);
              TiShowMessage('Увага!','Реєстр № ' + IntToStr(num_reestr)+', куди треба імпортувати накладну - підписаний. Імпорт не виконано.',mtInformation,[mbOK]);
              ImportBankDM.WriteTransaction.Rollback;
              Exit;
            end;

        end;

        ImportBankDM.pFIBStoredProc.StoredProcName                             := 'TI_UPDATE_BANK_VID_NAKL';
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value               := id_nakl_ext;
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc').Value       := id_nakl_ext_doc;
        ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc_deliv').Value := id_nakl_ext_doc_deliv;
        ImportBankDM.pFIBStoredProc.ParamByName('summa').Value                 := ImportBankDM.BankDocMemoryData['summa'] - ImportBankDM.BankDocMemoryData['SUMMA_NDS_DOC'];
        ImportBankDM.pFIBStoredProc.ParamByName('is_nds').Value := 0;
        ImportBankDM.pFIBStoredProc.ExecProc;
      end;  
      {ImportBankDM.pFIBStoredProc.StoredProcName                             := 'TI_UPDATE_BANK_VID_NAKL';
      ImportBankDM.pFIBStoredProc.ParamByName('id_nakl').Value               := id_nakl;
      ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc').Value       := id_nakl_doc;
      ImportBankDM.pFIBStoredProc.ParamByName('id_nakl_nds_doc_deliv').Value := id_nakl_doc_deliv;
      ImportBankDM.pFIBStoredProc.ParamByName('summa').Value                 := ImportBankDM.BankDocMemoryData['summa'] - ImportBankDM.BankDocMemoryData['SUMMA_NDS_DOC'];
      ImportBankDM.pFIBStoredProc.ParamByName('is_nds').Value := 1;
      ImportBankDM.pFIBStoredProc.ExecProc; }
    end;
      ImportBankDM.BankDocMemoryData.Next;
  end;

  if (id_nakl <> 0) then
  begin
    ImportBankDM.pFIBStoredProc.StoredProcName               := 'TI_PROVERKA_NAKL_YES_OR_NOT_NDS';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := id_nakl;
    ImportBankDM.pFIBStoredProc.ExecProc;

   if(ImportBankDM.pFIBStoredProc.ParamByName('IS_NDS').AsInt64 = 1) then
   begin
    //добавление проводок в буфера
    ImportBankDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
    ImportBankDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_nakl;
    ImportBankDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
    ImportBankDM.pFIBStoredProc.ExecProc;

    // добавление проводки
    KEY_SESSION_PROVODKA := ImportBankDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
    workdate    := ImportBankDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
    //ShowMessage(IntToStr(KEY_SESSION));

    STRU.KEY_SESSION   := KEY_SESSION_PROVODKA;
    STRU.WORKDATE      := WORKDATE;
    STRU.DBHANDLE      := ImportBankDM.DB.Handle;
    STRU.TRHANDLE      := ImportBankDM.WriteTransaction.Handle;
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
      ImportBankDM.WriteTransaction.Rollback;
      Exit;
    end;
   end;
  end;

  ImportBankDM.WriteTransaction.Commit;
  ImportBankGridDBTableView1.DataController.FocusedRecordIndex:=i;
  CloseWaitForm(wf);
  TiShowMessage('Увага!','Імпорт виконано вдало',mtInformation,[mbOK]);
end;

end.
