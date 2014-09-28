unit sp_customer_FORM;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDatabase, StdCtrls, Db, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  ExtCtrls, BaseTypes, Menus, Variants,Ibase,
  cxInplaceContainer, cxTL, GlobalSPR, Registry,
  cxControls, cxGraphics, cxCustomData, cxStyles, cxTextEdit,
  cxCalendar, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxDBTL, cxTLData,
  cxContainer, cxMemo, cxRadioGroup, cxLabel, cxSplitter, cxButtonEdit,
  cxCheckBox, FIBDatabase, ImgList, Resources_unitb, cxDBEdit, LoadDogManedger, dogLoaderUnit,
  pub_sp_customer_filterx, dxStatusBar, IB_EXTERNALS, ActnList, ActnMan,
  ActnCtrls, XPStyleActnCtrls, StdStyleActnCtrls, frxExportPDF,
  frxExportTXT, frxExportHTML, frxExportXLS, frxClass, frxExportRTF,
  Accmgmt;

const
 TABLE          = 'SP_CUSTOMER';
 ADD_PROC       = 'PUB_SP_CUSTOMER_ADD';
 MOD_PROC       = 'PUB_SP_CUSTOMER_MOD';
 PK_FIELD       = 'ID_CUSTOMER';
 NULL_VALUE     = -1;

 TABLE_S          = 'SP_CUST_RATE_ACC';
 ADD_PROC_S       = 'PUB_SP_CUST_RATE_ACC_ADD';
 DEL_PROC_S       = 'PUB_SP_CUST_RATE_ACC_DEL';
 MOD_PROC_S       = 'PUB_SP_CUST_RATE_ACC_MOD';
 PK_FIELD_S       = 'ID_RATE_ACCOUNT';
 NULL_VALUE_S     = -1;

type
  TAccInfo=record
       ID_RATE_ACCOUNT    :integer;
       RATE_ACCOUNT       :string;
       ID_BANK            :integer;
       ID_TYPE_ACCOUNT    :integer;
       MFO                :string;
       NAME_BANK          :string;
       NAME_TYPE_ACCOUNT  :string;
  end;

  PAccInfo=^TAccInfo;

  TFsp_customer = class(TForm)
    StoredProc: TpFIBStoredProc;
    Query: TpFIBQuery;
    PanelRight: TPanel;
    PanelAccount: TPanel;
    PanelPeople: TPanel;
    Query1: TpFIBQuery;
    PeopleDataSet: TpFIBDataSet;
    PeopleDataSource: TDataSource;
    PanelLeft: TPanel;
    CustDataSource: TDataSource;
    Panel1: TPanel;
    CustDataSet: TpFIBDataSet;
    AccountDataSet: TpFIBDataSet;
    AccountDataSource: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID_CUST_MEN: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TYPE_MEN: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_MEN: TcxGridDBColumn;
    cxGrid1DBTableView1FAMILIA: TcxGridDBColumn;
    cxGrid1DBTableView1IMYA: TcxGridDBColumn;
    cxGrid1DBTableView1OTCHESTVO: TcxGridDBColumn;
    cxGrid1DBTableView1FIO: TcxGridDBColumn;
    cxGrid1DBTableView1NOTES: TcxGridDBColumn;
    Memo1: TcxMemo;
    LabelPrim: TLabel;
    cxSplitter2: TcxSplitter;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ImageList1: TImageList;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1ID_CUSTOMER: TcxDBTreeListColumn;
    cxDBTreeList1ID_RATE_ACCOUNT: TcxDBTreeListColumn;
    cxDBTreeList1LINKTO: TcxDBTreeListColumn;
    cxDBTreeList1RATE_ACCOUNT: TcxDBTreeListColumn;
    cxDBTreeList1ID_BANK: TcxDBTreeListColumn;
    cxDBTreeList1ID_TYPE_ACCOUNT: TcxDBTreeListColumn;
    cxDBTreeList1MFO: TcxDBTreeListColumn;
    cxDBTreeList1NAME_BANK: TcxDBTreeListColumn;
    cxDBTreeList1NAME_TYPE_ACCOUNT: TcxDBTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    PopupMenu2: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    PopupMenu3: TPopupMenu;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    cxSplitter3: TcxSplitter;
    cxDBTreeList1CLOSED: TcxDBTreeListColumn;
    LargeImages: TImageList;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    Panel2: TPanel;
    Bevel1: TBevel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    SelPanel: TPanel;
    SelPanelLeft: TPanel;
    Panel3: TPanel;
    cxGrid3: TcxGrid;
    cxGrid3TableView1: TcxGridTableView;
    cxGrid3TableView1ID_CUSTOMER: TcxGridColumn;
    cxGrid3TableView1NAME_CUSTOMER: TcxGridColumn;
    cxGrid3TableView1EDRPOU: TcxGridColumn;
    cxGrid3Level1: TcxGridLevel;
    RemoveFromSelectionButton: TSpeedButton;
    AddToSelectionButton: TSpeedButton;
    dxStatusBar1: TdxStatusBar;
    Panel4: TPanel;
    cxLabel1: TcxLabel;
    CustLocateEdit: TcxTextEdit;
    cxLabel2: TcxLabel;
    EdrpouLocateEdit: TcxTextEdit;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    EditButton: TToolButton;
    ViewButton: TToolButton;
    Delbutton: TToolButton;
    ContactButton: TToolButton;
    ShowDogButton: TToolButton;
    RefreshButton: TToolButton;
    FilterButton: TToolButton;
    DonnuRecv: TToolButton;
    ChooseButton: TToolButton;
    ExitButton: TToolButton;
    ToolBar2: TToolBar;
    AddButton2: TToolButton;
    EditButton2: TToolButton;
    DelButton2: TToolButton;
    RefreshButton2: TToolButton;
    dxBarLargeButton1: TToolButton;
    ToolBar3: TToolBar;
    AddButton3: TToolButton;
    EditButton3: TToolButton;
    DelButton3: TToolButton;
    RefreshButton3: TToolButton;
    ToolButton1: TToolButton;
    MoveAccButton: TToolButton;
    CustDataSetID_CUSTOMER: TFIBBCDField;
    CustDataSetID_HIGHER_INSTANCE: TFIBBCDField;
    CustDataSetNAME_CUSTOMER: TFIBStringField;
    CustDataSetKOD_EDRPOU: TFIBStringField;
    CustDataSetDATE_NNS: TFIBDateField;
    CustDataSetNNS: TFIBStringField;
    CustDataSetNALOG_NOM: TFIBStringField;
    CustDataSetFIZ_LICO: TFIBIntegerField;
    CustDataSetSHORT_NAME: TFIBStringField;
    CustDataSetPLAT_NDS: TFIBIntegerField;
    CustDataSetID_BRANCH: TFIBIntegerField;
    CustDataSetNAME_IST: TFIBStringField;
    CustDataSetNAME_BRANCH: TFIBStringField;
    CustDataSetNAME_DEPARTMENT: TFIBStringField;
    CustDataSetID_ADRESS: TFIBBCDField;
    CustDataSetID_DEPARTMENT: TFIBIntegerField;
    CustDataSetNAME_UKR: TFIBStringField;
    CustDataSetNAME_CUST_FOR_LOCATE: TFIBStringField;
    CustDataSetDNDZ_ID: TFIBBCDField;
    CustDataSetIS_ID_DEP: TFIBBCDField;
    CustHistButton: TToolButton;
    StoredProc2: TpFIBStoredProc;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    CustDataSetFULL_NAME_CUSTOMER: TFIBStringField;
    CustDataSetFULL_ADRESS_CUSTOMER: TFIBStringField;
    procedure ExitButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure AddButton2Click(Sender: TObject);
    procedure DelButton2Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure SelButton1Click(Sender: TObject);
    procedure SelButton2Click(Sender: TObject);
    procedure PanelAccountResize(Sender: TObject);
    procedure AddButton3Click(Sender: TObject);
    procedure DelButton3Click(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure ContactButtonClick(Sender: TObject);
    procedure RefreshButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxDBTreeList1FocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure RefreshButton2Click(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure N7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure cxGrid2Resize(Sender: TObject);
    procedure cxGrid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ChooseButtonClick(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure ViewButton2Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddToSelectionButtonClick(Sender: TObject);
    procedure RemoveFromSelectionButtonClick(Sender: TObject);
    procedure cxGrid3TableView1DblClick(Sender: TObject);
    procedure cxGrid2DBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxGrid3TableView1DragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure cxGrid3TableView1DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure cxGrid3TableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxGrid2DBTableView1DragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure cxGrid2DBTableView1DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure DonnuRecvClick(Sender: TObject);
    procedure ShowDogButtonClick(Sender: TObject);
    procedure CustDataSetAfterScroll(DataSet: TDataSet);
    procedure cxGrid2DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBTreeList1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CustLocateEditPropertiesChange(Sender: TObject);
    procedure CustLocateEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdrpouLocateEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure MoveAccButtonClick(Sender: TObject);
    procedure CustHistButtonClick(Sender: TObject);
  private
//    FilterForm:TForm;
//    filter_mfo, filter_acc : String;
  public
   input, output : TSpravParams;
   fltForm : tfrmCustomerFilter;
   show_department : boolean;
   id_session : integer;
   CurFS:TFormStyle;
   ActualDate:TDateTime;
   ResultValue:Variant;
   LocateCustomerID : int64;
   LocateAccountID  : int64;
   ViewRecord   : boolean;
   FirstShow    : boolean;
   isFilter     : boolean;
   curSelectMode:TCustomerSelectMode;
   isOnlyDate : boolean;
   constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime;SeleMode:TCustomerSelectMode; const _id_session : integer = -1; const show_dep: boolean = false);
   procedure SelectAll;
   procedure DeleteRecord;
   procedure AddRecord;
   procedure ModRecord;
   procedure SelectAll_S;
   procedure DeleteRecord_S;
   procedure AddRecord_S;
   procedure ModRecord_S;
   procedure SelectAll_Peoples;
   procedure LocateCustomer(const id_customer : int64);
   procedure LocateAccount(const id_rate_account : int64);
   procedure LocateMan(const id_man : integer);
   procedure SavePositionToRegistry;
   procedure LoadPositionFromRegistry;
  end;


function GetCustomers(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode):Variant;stdcall;
function GetCustomersWithPos(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : int64 = -1):Variant;stdcall;
function GetCustomersWithDep(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false; const id_session : int64 = -1; const show_dep: Integer = 1):Variant;stdcall;

procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;

function cust_ImportCustomer(cust : TImportCustomer; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;stdcall;
function cust_ImportCustRateAcc(cust_rate_acc : TImportCustRateAcc; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;stdcall;

exports  GetCustomers, GetCustomersWithPos, cust_ImportCustomer, cust_ImportCustRateAcc, GetCustomersWithDep, load;

implementation

uses sp_customer_FORM_ADD, SYS_OPTIONS,sp_cust_rate_acc_FORM_ADD,
     sp_customer_FORM_PEOPLE_ADD,
     sp_cust_contact_FORM, Math, WSUnit, LangUnit,
     sp_cust_rate_acc_FORM_HIS, sp_customer_FORM_HIST;
{$R *.DFM}


function cust_ImportCustomer(cust : TImportCustomer; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
var
 f : TFsp_customer_ADD;
 query : TpFIBQuery;
 db : TpFIBDatabase;
 tr : TpFIBTransaction;

 function ShowInfo : integer;
 begin
  f := TFsp_customer_ADD.Create(AOwner);
  f.Caption := 'Импортировать контрагента?';
  f.SkipChecks := true;
  f.edrpouEdit.Text := cust.kod_edrpou;
  f.NameEdit.Text := cust.name_customer;
  f.ShortNameEdit.Text := cust.short_name;
  f.nnsEdit.Text := cust.nns;
  f.DatennsEdit.Date := cust.date_nns;
  f.nalogEdit.Text := IntToStr(cust.nalog_nom);
//  f.OKButton1.Visible := false;
  f.Action := saView;
  Result := f.ShowModal;
  f.Free;
 end;

begin
 Result := false;
  if cust.bShowInfo then if ShowInfo = mrCancel then begin
   Result := false;
   exit;
  end;
  try
   db := TpFIBDatabase.Create(AOwner);
   db.SQLDialect := 3;
   db.Handle := DBHandle;
   tr := TpFIBTransaction.Create(AOwner);
   tr.Handle := WTrans;
   db.DefaultTransaction := tr;

   Query := TpFIBQuery.Create(AOwner);
   Query.Database := db;
   Query.Transaction := tr;
   Query.Transaction.StartTransaction;

   Query.SQL.Text := 'select count(*) from pub_sp_customer where kod_edrpou = ''' + cust.kod_edrpou + '''';
   Query.ExecQuery;
   if Query.Fields[0].AsInteger <> 0 then begin
    if MessageDlg('Увага', 'Контрагент із даннім кодом ЕДРПОУ вже існує. Продолжть?', mtConfirmation, [mbYes, mbNo]) = mrNo then begin
     Result := false;
     query.Close;
     Query.Transaction.Commit;
     Query.Free;
     tr.Free;
     db.Free;
     exit;
    end;
   end;
   Query.Close;

   Query.SQL.Text := 'EXECUTE PROCEDURE PUB_SP_CUSTOMER_ADD('+
    IntToStr(cust.id_higher_instance) + ', ' +
    '''' + cust.name_customer + ''', ' +
    '''' + cust.kod_edrpou + ''', ' +
    '''' + DateToStr(cust.date_nns) + ''', ' +
    '''' + cust.nns + ''', ' +
    IntToStr(cust.nalog_nom) + ', ' +
    IntToStr(cust.fiz_lico) + ', ' +
    '''' + cust.short_name + ''', ' +
    IntToStr(cust.plat_nds) + ', ' +
    IntToStr(cust.id_branch) + ', ' +
    IntToStr(-1) + ', ' +
    '''' + AnsiUpperCase(cust.name_customer) + ''', null, '''', 0, -1)';
//   Query.Transaction.StartTransaction;
//   ShowMessage(Query.SQL.Text);
   Query.ExecQuery;
   Query.Transaction.Commit;
   Query.Free;
   tr.Free;
   db.Free;
//   ShowInfo;
   Result := true;
  except
   exit;
  end;
end;

function cust_ImportCustRateAcc(cust_rate_acc : TImportCustRateAcc; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
var
 f : TFsp_cust_rate_acc_ADD;
 query : TpFIBQuery;
 db : TpFIBDatabase;
 tr : TpFIBTransaction;
 mfo, name_bank, city : string;

 function ShowInfo : integer;
 begin
  f := TFsp_cust_rate_acc_ADD.Create(AOwner);
  f.Caption := 'Импортировать счет?';
  f.AccountEdit.Text := cust_rate_acc.rate_account;
  f.bankFinded := true;
  f.BankChanged := false;
  f.SkipChecks := true;
  f.MFOEdit.Text := mfo;
  f.BankEdit.Text := name_bank;
  f.CityEdit.Text := city;
  f.TypeAccountEdit.Text := 'Банківський';
  f.DateBegEdit.Date := cust_rate_acc.date_beg;
  f.DateEndEdit.Date := cust_rate_acc.date_end;
  f.OKButton2.Visible := false;
  f.OKButton1.Caption := 'Додати';
  f.Action := saView;
  Result := f.ShowModal;
  f.Free;
 end;

begin
  try
   db := TpFIBDatabase.Create(AOwner);
   db.SQLDialect := 3;
   db.Handle := DBHandle;
   tr := TpFIBTransaction.Create(AOwner);
   tr.Handle := WTrans;
   db.DefaultTransaction := tr;

   Query := TpFIBQuery.Create(AOwner);
   Query.Database := db;
   Query.Transaction := tr;
   Query.Transaction.StartTransaction;

   // Поиск контрагента
   Query.SQL.Text := 'select count(*) from pub_sp_customer where id_customer = ' + IntToStr(cust_rate_acc.id_customer);
   Query.ExecQuery;
   if Query.Fields[0].AsInteger = 0 then begin
    ShowMessage('Передано невірний ідентифікатор контрагента.');
    Result := false;
    Query.Close;
    Query.Transaction.Commit;
    Query.Free;
    tr.Free;
    db.Free;
    exit;
   end;
   Query.Close;

   // Поиск банка
   Query.SQL.Text := 'select mfo, name_mfo from pub_sp_bank where id_bank = ' + IntToStr(cust_rate_acc.id_bank);
   Query.ExecQuery;
   if VarIsNull(Query['MFO'].Value) then begin
    ShowMessage('Банк не існує.');
    Result := false;
    Query.Close;
    Query.Transaction.Commit;
    Query.Free;
    tr.Free;
    db.Free;
    exit;
   end;
   mfo := Query['MFO'].AsString;
   name_bank := Query['NAME_MFO'].AsString;
   Query.Close;

   // Проверка счета
   if not CheckAccount(cust_rate_acc.rate_account, mfo) then begin
    ShowMessage('Переданий неверній рахунок.');
    Result := false;
    Query.Free;
    tr.Free;
    db.Free;
    exit;
   end;

   // Поиск дубликатов
//   Query.SQL.Text := 'select c.id_customer from pub_sp_customer c, pub_sp_cust_rate_acc r where c.id_customer <> ' + IntToStr(cust_rate_acc.id_customer) + ' and r.id_customer = c.id_customer and r.rate_account = ''' + cust_rate_acc.rate_account + ''' and r.id_bank = ' + IntToStr(cust_rate_acc.id_bank);
   Query.SQL.Text := 'SELECT CNT FROM PROC_PUB_SP_CUST_RATE_ACC_DUB(' + IntToStr(cust_rate_acc.id_customer) + ', ''' + cust_rate_acc.rate_account + ''', ''' + MFO + ''', ''' + DateToStr(cust_rate_acc.date_beg) + ''', ''' + DateToStr(cust_rate_acc.date_end) + ''')';
   Query.ExecQuery;
   if Query['CNT'].value <> 0 then begin
    ShowMessage('Дані реквізити вже існують.');
    Result := false;
    Query.Close;
    Query.Transaction.Commit;
    Query.Free;
    tr.Free;
    db.Free;
    exit;
   end;
   Query.Close;

   if cust_rate_acc.bShowInfo then if ShowInfo = mrCancel then begin
    Query.Transaction.Commit;
    Query.Free;
    tr.Free;
    db.Free;
    Result := false;
    exit;
   end;


   Query.SQL.Text := 'EXECUTE PROCEDURE PUB_SP_CUST_RATE_ACC_ADD(' +
     IntToStr(cust_rate_acc.id_customer) + ', ' +
     IntToStr(-1) + ', ' +
     '''' + cust_rate_acc.rate_account + ''', ' +
     IntToStr(cust_rate_acc.id_bank) + ', ' +
     IntToStr(cust_rate_acc.id_type_account) + ', ''' + DateToStr(cust_rate_acc.date_beg) + ''', ''' + DateToStr(cust_rate_acc.date_end) + ''', -1, ''Импорт'', '''', '''')';
     try
      Query.ExecQuery;
     except
      on E: Exception do ShowMessage(E.Message);
     end;
   Query.Transaction.Commit;
   Query.Free;
   tr.Free;
   db.Free;
//   ShowInfo;
   Result := true;
  except
   exit;
  end;
end;

procedure TFsp_customer.SelectAll_Peoples;
begin
     PeopleDataSet.Active := false;
     PeopleDataSet.SQLS.SelectSQL.Text := 'select * from PUB_SP_CUST_MEN_SEL(?MAS_ID_CUSTOMER)';
     PeopleDataSet.Active := true;
end;


function GetCustomers(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode):Variant;
    var T:TFsp_customer;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFsp_customer.Create(AOwner, DBHANDLE,FS,ActualDate,SeleMode);
             T.ChooseButton.Visible := true;
//             t.fltForm.depEdit.Visible := not t.ChooseButton.Visible;
//             t.fltForm.depCheck.Visible := not t.ChooseButton.Visible;
//             T.SelectAll;
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_customer.Create(AOwner, DBHANDLE,FS,ActualDate,SeleMode);
//             T.SelectAll;
              //T.ChooseButton.Visible := True;
             T.ChooseButton.Visible := False;
//             t.fltForm.depEdit.Visible := not t.ChooseButton.Visible;
//             t.fltForm.depCheck.Visible := not t.ChooseButton.Visible;
             Res:=NULL;
    end;

    GetCustomers:=Res;
end;

function GetCustomersWithPos(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false;const id_session : int64 = -1):Variant;
var
 T   : TFsp_customer;
 Res : Variant;
 r   : integer;
begin
    If FS=fsNormal
    then begin
             T:=TFsp_customer.Create(AOwner, DBHANDLE,FS,ActualDate,SeleMode, id_session);
             t.SelPanel.Visible := multi_select;
//             t.PanelAccount.Visible := not multi_select;
             t.PanelPeople.Visible := not multi_select;
             t.cxSplitter2.Control := t.SelPanel;
             t.SelPanel.Height := t.height div 2;
             if multi_select then t.cxGrid2DBTableView1.DragMode := dmAutomatic;
             if multi_select then t.cxGrid3TableView1.DragMode := dmAutomatic;
             t.LocateCustomerID := id_customer;
             t.LocateAccountID := id_rate_acc;
             T.ChooseButton.Visible := True;
//             t.fltForm.depEdit.Visible := not t.ChooseButton.Visible;
//             t.fltForm.depCheck.Visible := not t.ChooseButton.Visible;
             T.SelectAll;
             if t.LocateCustomerID <> -1 then t.LocateCustomer(t.LocateCustomerID);
             if t.LocateAccountID <> -1 then t.LocateAccount(t.LocateAccountID);
             r := T.ShowModal;
             if r <> MrCancel
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_customer.Create(AOwner, DBHANDLE,FS,ActualDate,SeleMode,id_session);
             t.SelPanel.Visible := multi_select;
             t.PanelPeople.Visible := not multi_select;
             t.cxSplitter2.Control := t.SelPanel;
             if multi_select then t.cxGrid2DBTableView1.DragMode := dmAutomatic;
             if multi_select then t.cxGrid3TableView1.DragMode := dmAutomatic;
             T.ChooseButton.Visible := False;        
//             t.fltForm.depEdit.Visible := not t.ChooseButton.Visible;
//             t.fltForm.depCheck.Visible := not t.ChooseButton.Visible;
             t.LocateCustomerID := id_customer;
             t.LocateAccountID := id_rate_acc;
             T.SelectAll;
             if t.LocateCustomerID <> -1 then t.LocateCustomer(t.LocateCustomerID);
             if t.LocateAccountID <> -1 then t.LocateAccount(t.LocateAccountID);
             Res:=NULL;
    end;

    GetCustomersWithPos := Res;
end;

function GetCustomersWithDep(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode; id_customer, id_rate_acc : int64; const multi_select : boolean = false;const id_session : int64 = -1; const show_dep: Integer = 1):Variant;
var T:TFsp_customer;
        Res:Variant;
        r : integer;
begin
    If FS=fsNormal then begin
             T:=TFsp_customer.Create(AOwner, DBHANDLE,FS,ActualDate,SeleMode, id_session);
             r := T.fltForm.ShowModal;
             if r = mrCancel then begin
              t.Free;
              exit;
             end;
             if r = mrOK then T.isFilter := true else T.isFilter := false;
             t.SelPanel.Visible := multi_select;
             t.PanelPeople.Visible := not multi_select;
             t.cxSplitter2.Control := t.SelPanel;
             t.SelPanel.Height := t.height div 2;
             if multi_select then t.cxGrid2DBTableView1.DragMode := dmAutomatic;
             if multi_select then t.cxGrid3TableView1.DragMode := dmAutomatic;
             t.LocateCustomerID := id_customer;
             t.LocateAccountID := id_rate_acc;
             T.ChooseButton.Visible := True;
//             t.fltForm.depEdit.Visible := not t.ChooseButton.Visible;
//             t.fltForm.depCheck.Visible := not t.ChooseButton.Visible;
             T.SelectAll;
             if t.LocateCustomerID <> -1 then t.LocateCustomer(t.LocateCustomerID);
             if t.LocateAccountID <> -1 then t.LocateAccount(t.LocateAccountID);
             r := T.ShowModal;
             if r <> MrCancel
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_customer.Create(AOwner, DBHANDLE,FS,ActualDate,SeleMode,id_session);
             t.SelPanel.Visible := multi_select;
             t.PanelPeople.Visible := not multi_select;
             t.cxSplitter2.Control := t.SelPanel;
             if multi_select then t.cxGrid2DBTableView1.DragMode := dmAutomatic;
             if multi_select then t.cxGrid3TableView1.DragMode := dmAutomatic;
             T.ChooseButton.Visible := False;
//             t.fltForm.depEdit.Visible := not t.ChooseButton.Visible;
//             t.fltForm.depCheck.Visible := not t.ChooseButton.Visible;
             t.LocateCustomerID := id_customer;
             t.LocateAccountID := id_rate_acc;
             T.SelectAll;
             if t.LocateCustomerID <> -1 then t.LocateCustomer(t.LocateCustomerID);
             if t.LocateAccountID <> -1 then t.LocateAccount(t.LocateAccountID);
//             t.cxGrid1.SetFocus;
             Res:=NULL;
    end;

    GetCustomersWithDep := Res;
end;

procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams);
var
  cust : TFsp_customer;
  r    : Integer;
begin
  if input^['FormStyle'] = fsNormal then
  begin
    cust := TFsp_customer.Create(Owner, PVOID(Integer(input^['Database'])), fsNormal, now, input^['SelectMode'], input^['id_session']);
    cust.input := input^;
    cust.output := output^;
    cust.ActualDate := IfNull(cust.input['ACTUAL_DATE'], now);
    r := cust.fltForm.ShowModal;
    if r = mrCancel then
    begin
      cust.Free;
      exit;
    end;
    if r = mrOK then cust.isFilter := true else cust.isFilter := false;
    cust.SelPanel.Visible     := IfNull(cust.input['bMultiSelect'], False);
    cust.PanelPeople.Visible  := not IfNull(cust.input['bMultiSelect'], False);
    cust.cxSplitter2.Control  := cust.SelPanel;
    cust.SelPanel.Height      := cust.height div 2;
    if IfNull(cust.input['bMultiSelect'], False) then cust.cxGrid2DBTableView1.DragMode := dmAutomatic;
    if IfNull(cust.input['bMultiSelect'], False) then cust.cxGrid3TableView1.DragMode := dmAutomatic;
    cust.LocateCustomerID     := IfNull(cust.input['id_customer'], -1);
    cust.LocateAccountID      := IfNull(cust.input['id_rate_account'], -1);
    cust.ChooseButton.Visible := True;//
//    cust.fltForm.depEdit.Visible := not cust.ChooseButton.Visible;
//    cust.fltForm.depCheck.Visible := not cust.ChooseButton.Visible;
    cust.SelectAll;
    if cust.LocateCustomerID <> -1 then cust.LocateCustomer(cust.LocateCustomerID);
    if cust.LocateAccountID <> -1 then cust.LocateAccount(cust.LocateAccountID);
    cust.ShowModal;
    cust.Free;
  end
  else
  begin // fsMDIChild
    cust := TFsp_customer.Create(Owner, PVOID(Integer(input^['Database'])), fsMDIChild, now, input^['SelectMode'], input^['id_session']);
    cust.ActualDate := IfNull(cust.input['ACTUAL_DATE'], now);
    cust.SelPanel.Visible := IfNull(cust.input['bMultiSelect'], False);
    cust.PanelPeople.Visible := not IfNull(cust.input['bMultiSelect'], False);
    cust.cxSplitter2.Control := cust.SelPanel;
    if IfNull(cust.input['bMultiSelect'], False) then cust.cxGrid2DBTableView1.DragMode := dmAutomatic;
    if IfNull(cust.input['bMultiSelect'], False) then cust.cxGrid3TableView1.DragMode := dmAutomatic;
    cust.ChooseButton.Visible := False;
//    cust.fltForm.depEdit.Visible := not cust.ChooseButton.Visible;
//    cust.fltForm.depCheck.Visible := not cust.ChooseButton.Visible;
    cust.LocateCustomerID     := IfNull(cust.input['id_customer'], -1);
    cust.LocateAccountID      := IfNull(cust.input['id_rate_account'], -1);
    cust.SelectAll;
    if cust.LocateCustomerID <> -1 then cust.LocateCustomer(cust.LocateCustomerID);
    if cust.LocateAccountID <> -1 then cust.LocateAccount(cust.LocateAccountID);
  end;
end;

constructor TFsp_customer.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime;SeleMode:TCustomerSelectMode; const _id_session : integer = -1; const show_dep: boolean = false);
var
 r : Integer;
begin
      inherited Create(AOwner);
      show_department := show_dep;
      id_session := _id_session;
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      curSelectMode:=SeleMode;

      if curSelectMode in [csmCustomers,csmContactMen,csmRateAcc] then ChooseButton.Enabled:=true;
      self.FormStyle:=FS;
end;

procedure TFsp_customer.LoadPositionFromRegistry;
var
 r : TRegistry;
 s : string;
begin
 r := TRegistry.Create;
 try
  r.RootKey := HKEY_CURRENT_USER;
  r.OpenKey(REG_KEY + 'custForm', true);
  s := r.ReadString('Left');
  if s <> '' then Left := StrToInt(s);
  s := r.ReadString('Top');
  if s <> '' then Top := StrToInt(s);
  s := r.ReadString('Width');
  if s <> '' then Width := StrToInt(s);
  s := r.ReadString('Height');
  if s <> '' then Height := StrToInt(s);
 except
 end;
 r.Free;
end;

procedure TFsp_customer.SavePositionToRegistry;
var
 r : TRegistry;
begin
 if WindowState = wsMaximized then exit;
 r := TRegistry.Create;
 try
  r.RootKey := HKEY_CURRENT_USER;
  r.OpenKey(REG_KEY + 'custForm', true);
  r.WriteString('Left', IntToStr(Left));
  r.WriteString('Top', IntToStr(Top));
  r.WriteString('Width', IntToStr(Width));
  r.WriteString('Height', IntToStr(Height));
 except
 end;
 r.Free;
end;

procedure TFsp_customer.LocateAccount(const id_rate_account : int64);
begin
 AccountDataSet.Locate('ID_RATE_ACCOUNT', id_rate_account, [loCaseInsensitive])
end;

procedure TFsp_customer.LocateMan(const id_man : integer);
begin
 PeopleDataSet.Locate('ID_CUST_MEN', id_man, [loCaseInsensitive])
end;

procedure TFsp_customer.SelectAll_S;
var
 ob : integer;
 s  : string;
begin
 if not ChooseButton.Visible then ob := 0 else ob := 1;
 if input <> Nil then ob := 1 - ifNull(input['SHOW_ALL'], 0);
// if input <> Nil then if  = 1 then ob := 0;
 s := '';
 if fltForm.accCheck.Checked then begin
  s := s + '(acc.rate_account = ' + QuotedStr(fltForm.accEdit.Text) + ') and';
 end;
 if fltForm.mfoCheck.Checked then begin
  s := s + '(b.mfo = ''' + fltForm.mfoEdit.Text + ''') and';
 end;
 if ChooseButton.Visible then
 begin
  s := s + '(''' + DateToStr(ActualDate) + ''' >= acc.date_beg) and (''' + DateToStr(ActualDate) + ''' <= acc.date_end) and'
 end;

 if s <> '' then begin
  s := ' and ' + s;
  s := Copy(s, 1, Length(s) - 4);
 end;
 AccountDataSet.Close;
 AccountDataSet.ParamByName('ONLY_BANK_ACC').AsInteger := ob;
 AccountDataSet.ParamByName('WHERE_COND').AsString := s;
 AccountDataSet.Open;

{ if ChooseButton.Visible = ivNever then AccountDataSet.SelectSQL.Text := 'select * from PUB_SP_CUST_RATE_ACC_SEL(?MAS_ID_CUSTOMER, 0, ''' + filter_acc + ''', ''' + filter_mfo + ''', ''' + DateTimeToStr(SYS_MAX_TIMESTAMP) + ''')'
                                   else AccountDataSet.SelectSQL.Text := 'select * from PUB_SP_CUST_RATE_ACC_SEL(?MAS_ID_CUSTOMER, 1, ''' + filter_acc + ''', ''' + filter_mfo + ''', ''' + DateTimeToStr(SYS_MAX_TIMESTAMP) + ''')';}
// AccountDataSet.Open;
end;

procedure TFsp_customer.DeleteRecord_S;
var
 id_rate_account : int64;
begin
 if AccountDataSet.RecordCount = 0 then exit;
 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна видалити рахунок контрагента іншого підрозділу.');
   exit;
 end;

 if cxDBTreeList1.FocusedNode = NIL then exit;
 if cxDBTreeList1.FocusedNode.Count <> 0 then begin
  MessageBox(handle,PChar(CUSTOMER_CHILD_DETECTION_ERROR),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  exit;
 end;
 id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'];
 if MessageBox(handle,PChar(CUSTOMER_DELETE_QUESTION),PChar(CUSTOMER_ACCOUNTS), MB_YESNO or MB_ICONQUESTION)=mrNo
 then exit;
 try
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_CUST_RATE_ACC_DEL';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_RATE_ACCOUNT').AsInt64 := id_rate_account;
  StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
  StoredProc.ParamByName('NAME_COPM').AsString := GetCompName;
  StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
  StoredProc.ExecProc;
//  StoredProc.ExecProcedure(DEL_PROC_S, [id_rate_account, SYS_ID_USER, GetCompName, GetIPAddress]);
  StoredProc.Transaction.Commit;
 except
  exit;
 end; 

 AccountDataSet.CacheDelete;
 if AccountDataSet.RecordCount <> 0 then id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'] else id_rate_account := -1;
 SelectAll_S;
 LocateAccount(id_rate_account);
end;

procedure TFsp_customer.AddRecord_S;
var
 id_customer     : int64;
 id_rate_account : int64;
 linkto          : int64;
 rate_account    : string;
 id_bank         : integer;
 id_type_account : integer;
 use_beg         : TDateTime;
 use_end         : TDateTime;
 vals            : array of Variant;
 Fsp_cust_rate_acc_ADD   :TFsp_cust_rate_acc_ADD;
begin
 if CustDataSet.RecordCount = 0 then exit;

 Fsp_cust_rate_acc_ADD   := TFsp_cust_rate_acc_ADD.Create(Self);
 Fsp_cust_rate_acc_ADD.Caption := 'Додати рахунок';
 Fsp_cust_rate_acc_ADD.OKButton1.Visible := true;
 if cxDBTreeList1.FocusedNode = NIL then Fsp_cust_rate_acc_ADD.OKButton2.Enabled := false;

 Fsp_cust_rate_acc_ADD.Action := saAdd;

 Fsp_cust_rate_acc_ADD.ShowModal;
 if Fsp_cust_rate_acc_ADD.MResult = 'cancel' then exit;

 linkto := -1;
 if AccountDataSet.RecordCount <> 0 then begin
  if Fsp_cust_rate_acc_ADD.MResult = 'ok1' then linkto := AccountDataSet['LINKTO'];
  if Fsp_cust_rate_acc_ADD.MResult = 'ok2' then linkto := AccountDataSet['ID_RATE_ACCOUNT'];
 end;


 id_customer     := TFIBBCDField(CustDataSet.FBN('ID_CUSTOMER')).AsInt64;//CustDataSet['ID_CUSTOMER'];
 id_rate_account := 0;
 rate_account    := Fsp_cust_rate_acc_ADD.AccountEdit.Text;
 id_bank         := Fsp_cust_rate_acc_ADD.id_bank;
 id_type_account := Fsp_cust_rate_acc_ADD.id_type_account;
 use_beg         := now;
 use_end         := SYS_MAX_TIMESTAMP;

{ SetLength(Vals, 10);
 Vals[0]  := id_customer;
 Vals[1]  := linkto;
 Vals[2]  := rate_account;
 Vals[3]  := id_bank;
 Vals[4]  := id_type_account;
 Vals[5]  := Fsp_cust_rate_acc_ADD.DateBegEdit.Date;
 Vals[6]  := Fsp_cust_rate_acc_ADD.DateEndEdit.Date;
 Vals[7]  := SYS_ID_USER;
 Vals[8]  := GetCompName;
 Vals[9]  := GetIPAddress;}

 StoredProc.Close;
 StoredProc.Transaction := WriteTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName := 'PUB_SP_CUST_RATE_ACC_ADD';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
 StoredProc.ParamByName('LINKTO').AsInt64 := linkto;
 StoredProc.ParamByName('RATE_ACCOUNT').AsString := rate_account;
 StoredProc.ParamByName('ID_BANK').AsInteger := id_bank;
 StoredProc.ParamByName('ID_TYPE_ACCOUNT').AsInteger := id_type_account;
 StoredProc.ParamByName('DATE_BEG').AsDate := Fsp_cust_rate_acc_ADD.DateBegEdit.Date;
 StoredProc.ParamByName('DATE_END').AsDate := Fsp_cust_rate_acc_ADD.DateEndEdit.Date;
 StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
 StoredProc.ParamByName('NAME_COMP').AsString := GetCompName;
 StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
 StoredProc.ParamByName('COMMENT').AsString := Fsp_cust_rate_acc_ADD.NoteMemo.Text;
 StoredProc.ExecProc;
// StoredProc.ExecProcedure(ADD_PROC_S, vals);
 id_rate_account := StoredProc['ID_RATE_ACCOUNT'].AsInt64;
 StoredProc.Transaction.Commit;

 SelectAll_S;
 LocateAccount(id_rate_account);

 Fsp_cust_rate_acc_ADD.Free;
 cxDBTreeList1.SetFocus;
end;

procedure TFsp_customer.ModRecord_S;
var
 id_customer     : int64;
 id_rate_account : int64;
 linkto          : int64;
 rate_account    : string;
 id_bank         : integer;
 id_type_account : integer;
 use_beg         : TDateTime;
 use_end         : TDateTime;
 vals            : array of Variant;
 Fsp_cust_rate_acc_ADD : TFsp_cust_rate_acc_ADD;
begin
 if AccountDataSet.RecordCount = 0 then exit;
 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна редагувати рахунок контрагента іншого підрозділу.');
   exit;
 end;


 id_customer     := AccountDataSet['ID_CUSTOMER'];
 id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'];
 linkto          := AccountDataSet['LINKTO'];
 rate_account    := AccountDataSet['RATE_ACCOUNT'];
 id_bank         := AccountDataSet['ID_BANK'];
 if not VarIsNull(AccountDataSet['ID_TYPE_ACCOUNT']) then id_type_account := AccountDataSet['ID_TYPE_ACCOUNT'] else id_type_account := -1;

 Fsp_cust_rate_acc_ADD := TFsp_cust_rate_acc_ADD.Create(Self);

 if isOnlyDate then
 begin
  Fsp_cust_rate_acc_ADD.SkipChecks := true;
  Fsp_cust_rate_acc_ADD.Height := 120;
  Fsp_cust_rate_acc_ADD.Bevel1.Visible := false;
  Fsp_cust_rate_acc_ADD.MFOEdit.Visible := false;
  Fsp_cust_rate_acc_ADD.Label1.Visible := false;
  Fsp_cust_rate_acc_ADD.BankEdit.Visible := false;
  Fsp_cust_rate_acc_ADD.LabelBANK.Visible := false;
  Fsp_cust_rate_acc_ADD.Label3.Visible := false;
  Fsp_cust_rate_acc_ADD.CityEdit.Visible := false;
  Fsp_cust_rate_acc_ADD.Label4.Visible := false;
  Fsp_cust_rate_acc_ADD.TypeAccountEdit.Visible := false;
  Fsp_cust_rate_acc_ADD.Label2.Visible := false;
  Fsp_cust_rate_acc_ADD.AccountEdit.Visible := false;
  Fsp_cust_rate_acc_ADD.cxGroupBox1.Top := 4;
 end;

 Fsp_cust_rate_acc_ADD.Caption := 'Змінити рахунок';
 Fsp_cust_rate_acc_ADD.OKButton1.Visible := false;
 Fsp_cust_rate_acc_ADD.OKButton2.Caption := 'Змінити';

 Fsp_cust_rate_acc_ADD.id_bank              := id_bank;
 Fsp_cust_rate_acc_ADD.id_type_account      := id_type_account;
 Fsp_cust_rate_acc_ADD.AccountEdit.Text     := rate_account;
 Fsp_cust_rate_acc_ADD.bank_mfo := IfNull(AccountDataSet['MFO'], '');
 Fsp_cust_rate_acc_ADD.Action := saMod;
 Fsp_cust_rate_acc_ADD.BankEdit.Text := IfNull(AccountDataSet['NAME_BANK'], '');
 Fsp_cust_rate_acc_ADD.TypeAccountEdit.Text := IfNull(AccountDataSet['NAME_TYPE_ACCOUNT'], '');
 Fsp_cust_rate_acc_ADD.bankFinded := true;
 Fsp_cust_rate_acc_ADD.MFOEdit.Text := IfNull(AccountDataSet['MFO'], '');
 Fsp_cust_rate_acc_ADD.DateBegEdit.Date := AccountDataSet['DATE_BEG'];
 Fsp_cust_rate_acc_ADD.DateEndEdit.Date := AccountDataSet['DATE_END'];
 Fsp_cust_rate_acc_ADD.NoteMemo.Text := ifnull(AccountDataSet['COMMENT'], '');
 if not VarIsNull(AccountDataSet['IS_BANK_ACCOUNT']) then Fsp_cust_rate_acc_ADD.is_bank_account := AccountDataSet['IS_BANK_ACCOUNT'] else Fsp_cust_rate_acc_ADD.is_bank_account := false;
 if not VarIsNull(AccountDataSet['IS_VAL_ACCOUNT']) then Fsp_cust_rate_acc_ADD.is_val_account := AccountDataSet['IS_VAL_ACCOUNT'] else Fsp_cust_rate_acc_ADD.is_val_account := false;
 if not VarIsNull(AccountDataSet['IS_NO_ACCOUNT']) then Fsp_cust_rate_acc_ADD.is_no_acc := AccountDataSet['IS_NO_ACCOUNT'] else Fsp_cust_rate_acc_ADD.is_no_acc := false;
 if AccountDataSet['CITY'] <> Null then Fsp_cust_rate_acc_ADD.CityEdit.Text := AccountDataSet['CITY'];
 Fsp_cust_rate_acc_ADD.bankFinded := true;
 Fsp_cust_rate_acc_ADD.bankFinded := true;
 Fsp_cust_rate_acc_ADD.BankChanged := false;

 Fsp_cust_rate_acc_ADD.ShowModal; //SHOW//

 if Fsp_cust_rate_acc_ADD.MResult = 'cancel' then exit;

 rate_account    := Fsp_cust_rate_acc_ADD.AccountEdit.Text;
 id_bank         := Fsp_cust_rate_acc_ADD.id_bank;
 id_type_account := Fsp_cust_rate_acc_ADD.id_type_account;
 use_beg         := now;
 use_end         := SYS_MAX_TIMESTAMP;

{ SetLength(Vals, 11);
 Vals[0]  := id_customer;
 Vals[1]  := id_rate_account;
 Vals[2]  := linkto;
 Vals[3]  := rate_account;
 Vals[4]  := id_bank;
 Vals[5]  := id_type_account;
 Vals[6]  := Fsp_cust_rate_acc_ADD.DateBegEdit.Date;
 Vals[7]  := Fsp_cust_rate_acc_ADD.DateEndEdit.Date;
 Vals[8]  := SYS_ID_USER;
 Vals[9]  := GetCompName;
 Vals[10]  := GetIPAddress;   }

 StoredProc.Transaction := WriteTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName := 'PUB_SP_CUST_RATE_ACC_MOD';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
 StoredProc.ParamByName('ID_RATE_ACCOUNT').AsInt64 := id_rate_account;
 StoredProc.ParamByName('LINKTO').AsInt64 := linkto;
 StoredProc.ParamByName('RATE_ACCOUNT').AsString := rate_account;
 StoredProc.ParamByName('ID_BANK').AsInteger := id_bank;
 StoredProc.ParamByName('ID_TYPE_ACCOUNT').AsInteger := id_type_account;
 StoredProc.ParamByName('DATE_BEG').AsDate := Fsp_cust_rate_acc_ADD.DateBegEdit.Date;
 StoredProc.ParamByName('DATE_END').AsDate := Fsp_cust_rate_acc_ADD.DateEndEdit.Date;
 StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
 StoredProc.ParamByName('NAME_COMP').AsString := GetCompName;
 StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
 StoredProc.ParamByName('COMMENT').AsString := Fsp_cust_rate_acc_ADD.NoteMemo.Text;

 StoredProc.ExecProc;
// StoredProc.ExecProcedure(MOD_PROC_S, vals);
 StoredProc.Transaction.Commit;

 Fsp_cust_rate_acc_ADD.Free;

 SelectAll_S;
 LocateAccount(id_rate_account);
end;


procedure TFsp_customer.SelectAll;
var
 frm : TForm;
 s : string;
 t : string;
begin
 frm := WaitScreenShow(Self);
 Application.ProcessMessages;
 CustDataSet.Close;
 CustDataSet.ParamByName('ID_SESSION').AsInteger := id_session;
 s := '';
 t := '';
 if CustLocateEdit.Text <> '' then
 begin
   s := s + '(cust.NAME_CUSTOMER_UPPER LIKE ''%' + AnsiUpperCase(CustLocateEdit.Text) + '%'') and';
//   s := s + '(cust.name_cust_for_locate like ''%' + AnsiUpperCase(CustLocateEdit.Text) + '%'') and';
 end;
 if EdrpouLocateEdit.Text <> '' then
 begin
   s := s + '(cust.kod_edrpou starting with ''' + AnsiUpperCase(EdrpouLocateEdit.Text) + ''') and';
 end;
 if fltForm.CustCheck.Checked then begin
  s := s + '(cust.NAME_CUSTOMER_UPPER LIKE ''%' + AnsiUpperCase(fltForm.CustEdit.Text) + '%'') and';
 end;

 if (fltForm.depCheck.Checked) and (fltForm.flt_id_department <> -1) then  s := s + '(cust.id_department = ' + IntToStr(fltForm.flt_id_department) + ') and';
{ if SYS_USE_DEP_IN_CUST = 1 then
 begin
   if not ChooseButton.Visible then
   begin
     if (fltForm.depCheck.Checked) and (fltForm.flt_id_department <> -1) then begin
       s := s + '(cust.id_department = ' + IntToStr(fltForm.flt_id_department) + ') and';
     end;
   end
   else
   begin
     s := s + '(cust.id_department = ' + IntToStr(DogLoaderUnit.DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) + ') and';
   end;
 end;}

 if fltForm.edrpouCheck.Checked then begin
  s := s + '(cust.KOD_EDRPOU LIKE ''%' + fltForm.edrpouEdit.Text + '%'') and';
 end;
 if fltForm.cbDnDzId.Checked then begin
  s := s + '(cust.DNDZ_ID = ' + fltForm.edDnDzID.Text + ') and';
 end;
 if fltForm.accCheck.Checked then begin
  s := s + '(acc.rate_account = ' + QuotedStr(fltForm.accEdit.Text) + ' and acc.id_customer = cust.id_customer) and';
  t := t + ', PUB_SP_CUST_RATE_ACC acc ';
 end;
 if fltForm.mfoCheck.Checked then begin
  s := s + '(b.mfo = ''' + fltForm.mfoEdit.Text + ''' and acc.id_customer = cust.id_customer and acc.id_bank = b.id_bank) and';
  if t = '' then t := t + ', PUB_SP_CUST_RATE_ACC acc, PUB_SP_BANK b '
            else t := t + ', PUB_SP_BANK b ';
 end;
 if s <> '' then begin
  s := ' where ' + s;
  s := Copy(s, 1, Length(s) - 4);
 end;
 CustDataSet.ParamByName('FROM_TABLES').AsString := t;
 CustDataSet.ParamByName('WHERE_COND').AsString  := s;
 CustDataSet.Open;
 SelectAll_S;
 SelectAll_Peoples;
 WaitScreenClose(frm);
 if FirstShow then
end;

procedure TFsp_customer.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close
 else
 begin
   ModalResult := mrCancel;
   if Assigned(output) then output['ModalResult'] := mrCancel;
 end;  
end;

procedure TFsp_customer.DelButtonClick(Sender: TObject);
begin
 DeleteRecord;
 if CustDataSet.RecordCount = 0 then begin
  AddButton2.Enabled := false;
  DelButton2.Enabled := false;
  EditButton2.Enabled := false;
  RefreshButton2.Enabled := false;
 end else begin
  AddButton2.Enabled := true;
  DelButton2.Enabled := true;
  EditButton2.Enabled := true;
  RefreshButton2.Enabled := true;
 end;
end;

procedure TFsp_customer.DeleteRecord;
var
 id_customer : int64;
begin
 if CustDataSet.RecordCount = 0 then exit;
 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна видалити контрагента іншого підрозділу.');
   exit;
 end;

 id_customer := CustDataSet['ID_CUSTOMER'];
 if MessageBox(handle,PChar(CUSTOMER_DELETE_QUESTION),PChar(CUSTOMER_AGENTS), MB_YESNO or MB_ICONQUESTION)=mrYes then begin
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_CUSTOMER_DEL';
  StoredProc.Prepare;

  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
  StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
  StoredProc.ParamByName('NAME_COMP').AsString := GetCompName;
  StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
  try
   StoredProc.ExecProc;
  except
   ShowMessage('Контрагента неможливо выдалити. З ним зв''язані договора.');
   StoredProc.Transaction.Rollback;
   exit;
  end; 
  //StoredProc.ExecProcedure('PUB_SP_CUSTOMER_DEL', [id_customer]);
  StoredProc.Transaction.Commit;

  CustDataSet.CacheDelete;

{ id_customer := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := id_customer;
 CustDataSet.CacheDelete;
 if CustDataSet.RecordCount <> 0 then id_customer := CustDataSet['ID_CUSTOMER'] else id_customer := -1;
 SelectAll;
 LocateCustomer(id_customer);}
 end;
end;

procedure TFsp_customer.AddButtonClick(Sender: TObject);
begin
 AddRecord;
end;

procedure TFsp_customer.AddRecord;
var
 id_customer        : int64;
 id_higher_instance : integer;
 id_branch          : integer;
 name_customer      : string;
 kod_edrpou         : string;
 date_nns           : Variant;
 nns                : string;
 nalog_nom          : string;
 id_address         : integer;
 fiz_lico           : integer;
 use_beg            : TDateTime;
 use_end            : TDateTime;
 short_name         : string;
 id_department      : variant;
 plat_nds           : integer;
 vals               : array of Variant;
 Fsp_customer_ADD   : TFsp_customer_ADD;
 name_ukr           : string;
  name_full           : string;
   name_fullAdrs           : string;

begin
 Fsp_customer_ADD   := TFsp_customer_ADD.Create(Self);
 Fsp_customer_ADD.Caption := 'Додати контрагента';
 Fsp_customer_ADD.OKButton1.Visible := true;
 Fsp_customer_ADD.Action := saAdd;
 Fsp_customer_ADD.id_branch := -1;
 Fsp_customer_ADD.DB_Handle:=WorkDatabase.Handle;
{ if not show_department then begin
  Fsp_customer_ADD.DepEdit.Visible := false;
  Fsp_customer_ADD.DepCheck.Visible := false;
 end;}

 if Fsp_customer_ADD.ShowModal <> mrCancel then begin
  short_name         := Fsp_customer_ADD.ShortNameEdit.Text;
  name_customer      := Fsp_customer_ADD.NameEdit.Text;
  name_full          := Fsp_customer_ADD.NameFullEdit.Text;
  name_fullAdrs      := Fsp_customer_ADD.AdrFullEdit.Text;
  kod_edrpou         := Fsp_customer_ADD.edrpouEdit.Text;
  nns                := Fsp_customer_ADD.nnsEdit.Text;
  if Fsp_customer_ADD.DatennsEdit.Text = '' then date_nns := null else date_nns           := TDateTime(Fsp_customer_ADD.DatennsEdit.Date);
  nalog_nom          := Fsp_customer_ADD.NalogEdit.Text;
  id_higher_instance := Fsp_customer_ADD.id_higher_instance;
  id_branch          := Fsp_customer_ADD.id_branch;
  id_address         := Fsp_customer_ADD.id_adress;
  id_department      := Fsp_customer_ADD.id_department;
  name_ukr           := Fsp_customer_ADD.NameUkrEdit.Text;
  if Fsp_customer_ADD.FizLicoCheck.Checked then fiz_lico := 1 else fiz_lico := 0;
  if Fsp_customer_ADD.PlatNdsCheck.Checked then plat_nds := 1 else plat_nds := 0;

  use_beg     := now;
  use_end     := SYS_MAX_TIMESTAMP;

  SetLength(Vals, 16);
  Vals[0] := id_higher_instance;
  Vals[1] := RemoveApostrof(name_customer);
  if Length(Vals[1]) > 180 then Vals[1] := Copy(Vals[1], 1, 179);
  Vals[2] := kod_edrpou;
  Vals[3] := date_nns;
  Vals[4] := nns;
  Vals[5] := nalog_nom;
  Vals[6] := fiz_lico;
  Vals[7] := RemoveApostrof(short_name);
  if Length(Vals[7]) > 40 then Vals[7] := Copy(Vals[7], 1, 39);
  Vals[8] := plat_nds;
  Vals[9] := id_branch;
  Vals[10]:= id_address;
  Vals[11]:= AnsiUpperCase(name_customer);
  if Length(Vals[11]) > 180 then Vals[11] := Copy(Vals[11], 1, 179);
  Vals[12]:= id_department;
  Vals[13]:= RemoveApostrof(name_ukr);
  if Length(Vals[13]) > 180 then Vals[13] := Copy(Vals[13], 1, 179);
  Vals[14]:= Fsp_customer_ADD.DnDzIDEdit.Text;
  if Vals[14] = '' then Vals[14] := 0;
  Vals[15] := id_department;

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure(ADD_PROC, vals);
  id_customer:=StoredProc.ParamByName('ID_CUSTOMER').AsInt64;
  StoredProc.Transaction.Commit;

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_NAME_UPD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
  StoredProc.ParamByName('FULL_NAME_CUSTOMER').AsString := name_Full;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_ADR_UPD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
  StoredProc.ParamByName('FULL_ADR_CUSTOMER').AsString := name_FullAdrs;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;

  if isFilter then begin
   if MessageDlg('Увага', 'Включен фильтр. Добавленный контрагент может не отображаться в списке.' + #13 + 'Отключить фильтр?', mtConfirmation, [mbYes, mbNo]) = mrYes then begin
    fltForm.ClearButtonClick(Self);
    isFilter := false;
   end;
  end;
  SelectAll;
  LocateCustomer(id_customer);
  if fiz_lico = 0 then AddButton2Click(Self);
 end;
 Fsp_customer_ADD.Free;
end;

procedure TFsp_customer.ModRecord;
var
 id_customer        : int64;
 id_higher_instance : integer;
 id_branch          : integer;
 name_customer      : string;
 kod_edrpou         : string;
 date_nns           : variant;
 nns                : string;
 nalog_nom          : string;
 id_address         : integer;
 fiz_lico           : integer;
 use_beg            : TDateTime;
 use_end            : TDateTime;
 short_name         : string;
 id_department      : variant;
 vals               : array of Variant;
 plat_nds           : integer;
 branch_dataset     : TpFibdataSet;
 Fsp_customer_ADD   : TFsp_customer_ADD;
 name_department    : string;
 name_ukr           : string;
 name_Full          : string;
 name_FullAdrs      : string;
begin
 if CustDataSet.RecordCount = 0 then exit;
// ShowMessage(IntToStr(CustDataSet['ID_DEPARTMENT']));
// ShowMessage(IntToStr(DogLoaderUnit.SYS_DEF_ID_DEPARTMENT));
// ShowMessage(IntToStr(DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2));
 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна редагувати контрагента іншого підрозділу.');
   exit;
 end;
 id_customer        := CustDataSet['ID_CUSTOMER'];
 id_higher_instance := IfNull(CustDataSet['ID_HIGHER_INSTANCE'], -1);
 if not VarIsNull(CustDataSet['ID_BRANCH']) then id_branch := CustDataSet['ID_BRANCH'];
 name_customer      := IfNull(CustDataSet['NAME_CUSTOMER'], '');
 kod_edrpou         := IfNull(CustDataSet['KOD_EDRPOU'], '');
 if not VarIsNull(CustDataSet['DATE_NNS']) then date_nns := CustDataSet.FBN('DATE_NNS').AsDateTime else date_nns := null;
// date_nns           := IfNull(CustDataSet['DATE_NNS'], '');
 nns                := IfNull(CustDataSet['NNS'], '');
 id_address         := IfNull(CustDataSet['ID_ADRESS'], -1);
 nalog_nom          := IfNull(CustDataSet['NALOG_NOM'], '');
 fiz_lico           := IfNull(CustDataSet['FIZ_LICO'], 0);
 plat_nds           := IfNull(CustDataSet['PLAT_NDS'], 0);
 short_name         := IfNull(CustDataSet['SHORT_NAME'], '');
 name_ukr           := IfNull(CustDataSet['NAME_UKR'], '');
  name_Full           := IfNull(CustDataSet['FULL_NAME_CUSTOMER'], '');
   name_FullAdrs           := IfNull(CustDataSet['FULL_ADRESS_CUSTOMER'], '');
 if not VarIsNull(CustDataset['NAME_UKR']) then  name_ukr:= CustDataSet['NAME_UKR'];
 if not VarIsNull(CustDataset['IS_ID_DEP']) then id_department := CustDataset['is_id_dep'];

 Fsp_customer_ADD := TFsp_customer_ADD.Create(Self);
 Fsp_customer_ADD.Caption := 'Змінити контрагента';
 Fsp_customer_ADD.DnDzIDEdit.Text := IfNull(CustDataset['DNDZ_ID'], 0);

 {+Процедура хранимая изменена быть должна }
 {__________________________________________________________________________________}

 Query1.Close;
 Query1.SQL.Text := 'select * from GET_ADR_STRING_2(' + IntToStr(id_address) + ')';
 Query1.ExecQuery;
 Fsp_customer_ADD.AdrEdit.Text := IfNull(Query1['ADR'].AsVariant, '');
 Query1.Close;
 {__________________________________________________________________________________}
 if ViewRecord then begin
  Fsp_customer_ADD.DisableControls;
  Fsp_customer_ADD.OKButton1.Visible := false;
 end;

{ if not show_department then begin
  Fsp_customer_ADD.DepEdit.Visible := false;
  Fsp_customer_ADD.DepCheck.Visible := false;
 end;}

 Fsp_customer_ADD.DepCheck.Checked   := id_department <> 0;
 Fsp_customer_ADD.PlatNdsCheck.Checked   := plat_nds = 1;
 Fsp_customer_ADD.id_higher_instance := id_higher_instance;
 Fsp_customer_ADD.id_branch          := id_branch;
 Fsp_customer_ADD.id_adress          := id_address;
 Fsp_customer_ADD.id_department      := id_department;
 Fsp_customer_ADD.NameEdit.Text      := name_customer;
 Fsp_customer_ADD.ShortNameEdit.Text := short_name;
 Fsp_customer_ADD.edrpouEdit.Text    := kod_edrpou;
 if not VarIsNull(date_nns) then Fsp_customer_ADD.DatennsEdit.Date := VarToDateTime(date_nns);
 if not VarIsNull(nns) then Fsp_customer_ADD.nnsEdit.Text       := nns;
 Fsp_customer_ADD.NalogEdit.Text     := nalog_nom;
 Fsp_customer_ADD.NameUkrEdit.Text   := name_ukr;
 Fsp_customer_ADD.FizLicoCheck.Checked := fiz_lico = 1;
 Fsp_customer_ADD.Action := saMod;
 Fsp_customer_ADD.NameFullEdit.Text :=name_Full;
 Fsp_customer_ADD.AdrFullEdit.Text :=name_FullAdrs;
  Fsp_customer_ADD.DB_Handle:=WorkDatabase.Handle;
 branch_dataset     := TpFibdataSet.Create(nil);
 branch_dataset.Database:=WorkDatabase;
 branch_dataset.Transaction:=ReadTransaction;
 branch_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM VIEW_SP_BRANCH WHERE ID_BRANCH='+IntToStr(id_branch);
 branch_dataset.Open;
    if branch_dataset.RecordCount>0
    then Fsp_customer_ADD.BranchEdit.Text:=branch_dataset.FieldByName('NAME_BRANCH').AsString;
 branch_dataset.Close;
 branch_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM VIEW_SP_IST WHERE ID_IST='+IntToStr(id_higher_instance);
 branch_dataset.Open;
    if branch_dataset.RecordCount>0
    then Fsp_customer_ADD.InstanceEdit.Text:=branch_dataset.FieldByName('NAME_IST').AsString;
 branch_dataset.Close;
 branch_dataset.SQLs.SelectSQL.Text := 'select name_full from  sp_department where  sp_department.id_department='+IntToStr(id_department) +
                                 ' and use_end = ''01.01.3333''';
 branch_dataset.Open;
    if branch_dataset.RecordCount>0
    then Fsp_customer_ADD.DepEdit.Text := branch_dataset['NAME_FULL'];
 branch_dataset.Close;
 branch_dataset.Free;

 if Fsp_customer_ADD.ShowModal <> mrCancel then begin

  name_customer      := Fsp_customer_ADD.NameEdit.Text;
  short_name         := Fsp_customer_ADD.ShortNameEdit.Text;
  kod_edrpou         := Fsp_customer_ADD.edrpouEdit.Text;
  nns                := Fsp_customer_ADD.nnsEdit.Text;
  if Fsp_customer_ADD.DatennsEdit.Text = '' then date_nns := Null else
     date_nns           := tdatetime(Fsp_customer_ADD.DatennsEdit.Date);
  nalog_nom          := Fsp_customer_ADD.NalogEdit.Text;
  id_higher_instance := Fsp_customer_ADD.id_higher_instance;
  id_branch          := Fsp_customer_ADD.id_branch;
  id_address         := Fsp_customer_ADD.id_adress;
  id_department      := Fsp_customer_ADD.id_department;
  name_ukr           := Fsp_customer_ADD.NameUkrEdit.Text;
  name_Full          := Fsp_customer_ADD.NameFullEdit.Text;
  name_FullAdrs      := Fsp_customer_ADD.AdrFullEdit.Text;
  if Fsp_customer_ADD.FizLicoCheck.Checked then fiz_lico := 1 else fiz_lico := 0;
  if Fsp_customer_ADD.PlatNdsCheck.Checked then plat_nds := 1 else plat_nds := 0;

  use_beg  := now;
  use_end  := SYS_MAX_TIMESTAMP;

{  SetLength(Vals, 16);
  Vals[0]  := id_customer;
  Vals[1]  := id_higher_instance;
  Vals[2]  := name_customer;
  Vals[3]  := kod_edrpou;
  Vals[4]  := date_nns;
  Vals[5]  := nns;
  Vals[6]  := nalog_nom;
  Vals[7] := fiz_lico;
  Vals[8] := short_name;
  Vals[9] := plat_nds;
  Vals[10]:= id_branch;
  Vals[11]:= id_address;
  Vals[12]:= AnsiUpperCase(name_customer);
  Vals[13]:= id_department;
  Vals[14]:= name_ukr;
  Vals[15]:= Fsp_customer_ADD.DnDzIDEdit.Text;}

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_CUSTOMER_MOD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
  StoredProc.ParamByName('ID_HIGHER_INSTANCE').AsInteger := id_higher_instance;
  StoredProc.ParamByName('NAME_CUSTOMER').AsString := name_customer;
  StoredProc.ParamByName('KOD_EDRPOU').AsString := kod_edrpou;
  StoredProc.ParamByName('DATE_NNS').AsVariant := date_nns;
  StoredProc.ParamByName('NNS').AsString := nns;
  StoredProc.ParamByName('NALOG_NOM').AsString := nalog_nom;
  StoredProc.ParamByName('FIZ_LICO').AsInteger := fiz_lico;
  StoredProc.ParamByName('SHORT_NAME').AsString := short_name;
  StoredProc.ParamByName('PLAT_NDS').AsInteger := plat_nds;
  StoredProc.ParamByName('ID_BRANCH').AsInteger := id_branch;
  StoredProc.ParamByName('ID_ADRESS').AsInteger := id_address;
  StoredProc.ParamByName('NAME_CUSTOMER_UPPER').AsString := AnsiUpperCase(name_customer);
  StoredProc.ParamByName('IS_ID_DEP').AsVariant := id_department;
  StoredProc.ParamByName('NAME_UKR').AsString := name_ukr;
  StoredProc.ParamByName('DNDZ_ID').AsString := Fsp_customer_ADD.DnDzIDEdit.Text;
  StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
  StoredProc.ParamByName('NAME_COMP').AsString := GetCompName;
  StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
  StoredProc.ExecProc;
//  StoredProc.ExecProcedure(MOD_PROC, vals);
  StoredProc.Transaction.Commit;



  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_NAME_UPD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
  StoredProc.ParamByName('FULL_NAME_CUSTOMER').AsString := name_Full;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_ADR_UPD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
  StoredProc.ParamByName('FULL_ADR_CUSTOMER').AsString := name_FullAdrs;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;




  SelectAll;
  LocateCustomer(id_customer);
 end;
 Fsp_customer_ADD.Free;
end;

procedure TFsp_customer.EditButtonClick(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_customer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 SavePositionToRegistry;
// if Assigned(FilterForm) then FreeandNil(FilterForm);
 PeopleDataSet.Active := false;
 Action := caFree;
end;

procedure TFsp_customer.N4Click(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_customer.RefreshButtonClick(Sender: TObject);
var
 id_customer : int64;
begin
 if CustDataSet.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 id_customer := CustDataSet['ID_CUSTOMER'];
 SelectAll;
 LocateCustomer(id_customer);
end;

procedure TFsp_customer.N1Click(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure TFsp_customer.N2Click(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure TFsp_customer.N6Click(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_customer.ViewButtonClick(Sender: TObject);
begin
 ViewRecord := true;
 ModRecord;
 ViewRecord := false;
end;

procedure TFsp_customer.AddButton2Click(Sender: TObject);
begin
 AddRecord_S;
end;

procedure TFsp_customer.DelButton2Click(Sender: TObject);
begin
 DeleteRecord_S;
end;

procedure TFsp_customer.EditButton2Click(Sender: TObject);
begin
 isOnlyDate := false;
 ModRecord_S;
end;

procedure TFsp_customer.MenuItem1Click(Sender: TObject);
begin
 AddButton2Click(Self);
end;

procedure TFsp_customer.MenuItem2Click(Sender: TObject);
begin
 EditButton2Click(Self);
end;

procedure TFsp_customer.MenuItem3Click(Sender: TObject);
begin
 DelButton2Click(Self);
end;

procedure TFsp_customer.MenuItem6Click(Sender: TObject);
begin
 SelectAll_S;
end;

procedure TFsp_customer.SelButton1Click(Sender: TObject);
begin
 ModalResult := mrOK;
end;

procedure TFsp_customer.SelButton2Click(Sender: TObject);
begin
 ModalResult := mrYes;
end;

procedure TFsp_customer.PanelAccountResize(Sender: TObject);
begin
 if FormStyle = fsMDIChild then cxDBTreeList1.Bands[0].Width := cxDBTreeList1.Width - 20;
end;

procedure TFsp_customer.LocateCustomer(const id_customer : int64);
//var
// v  : variant;
begin
// v := IntToStr(id_customer);
// cxGrid2DBTableView1.DataController.LocateByKey(id_customer);
 CustDataSet.Locate('ID_CUSTOMER', id_customer, [loCaseInsensitive]);
end;


procedure TFsp_customer.AddButton3Click(Sender: TObject);
var
 customer : int64;
 id_cust_men : int64;
 fsp_customer_form_people_add:Tfsp_customer_form_people_add;
begin
 if CustDataSet.RecordCount = 0 then exit;
 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна додати особу контрагента іншого підрозділу.');
   exit;
 end;

 customer := CustDataSet['ID_CUSTOMER'];

 fsp_customer_form_people_add := Tfsp_customer_form_people_add.Create(Self);
 fsp_customer_form_people_add.Position := poOwnerFormCenter;
 fsp_customer_form_people_add.Caption := 'Нова контактна особа';
 if fsp_customer_form_people_add.ShowModal = mrOK then begin
  StoredProc.Transaction := ReadTransaction;

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_CUST_MEN_ADD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := customer;
  StoredProc.ParamByName('ID_TYPE_MEN').AsInteger := fsp_customer_form_people_add.id_type_men;
  StoredProc.ParamByName('FAMILIA').AsString := fsp_customer_form_people_add.FamiliaEdit.Text;
  StoredProc.ParamByName('IMYA').AsString := fsp_customer_form_people_add.ImyaEdit.Text;
  StoredProc.ParamByName('OTCHESTVO').AsString := fsp_customer_form_people_add.OtchestvoEdit.Text;
  StoredProc.ParamByName('NOTES').AsString := fsp_customer_form_people_add.NotesMemo.Text;
  //StoredProc.ExecProcedure('PUB_SP_CUST_MEN_ADD', [customer, fsp_customer_form_people_add.id_type_men, fsp_customer_form_people_add.FamiliaEdit.Text, fsp_customer_form_people_add.ImyaEdit.Text, fsp_customer_form_people_add.OtchestvoEdit.Text, fsp_customer_form_people_add.NotesMemo.Text]);
  StoredProc.ExecProc;
  id_cust_men:=StoredProc.ParamByName('ID_CUST_MEN').AsInt64;
  StoredProc.Transaction.Commit;

  SelectAll_Peoples;
  LocateMan(id_cust_men);
 end;
end;

procedure TFsp_customer.DelButton3Click(Sender: TObject);
var
 customer    : int64;
 id_cust_men : int64;
begin
 if CustDataSet.RecordCount = 0 then exit;
 if PeopleDataSet.RecordCount = 0 then exit;

 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна видалити особу контрагента іншого підрозділу.');
   exit;
 end;


 customer := CustDataSet['ID_CUSTOMER'];
 id_cust_men := PeopleDataSet['ID_CUST_MEN'];
 if MessageBox(handle,PChar(CUSTOMER_DELETE_QUESTION),PChar(CUSTOMER_CONTACTS), MB_YESNO or MB_ICONQUESTION)=mrYes
 then begin
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_CUST_MEN_DEL';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUST_MEN').AsInt64 := id_cust_men;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := customer;
  StoredProc.ExecProc;
//  StoredProc.ExecProcedure('PUB_SP_CUST_MEN_DEL', [id_cust_men, int64(customer)]);
  StoredProc.Transaction.Commit;

  id_cust_men := cxGrid1DBTableView1.Controller.FocusedRowIndex;
  SelectAll_Peoples;
  cxGrid1DBTableView1.Controller.FocusedRowIndex := id_cust_men;
 end;
end;


procedure TFsp_customer.EditButton3Click(Sender: TObject);
var
 customer : int64;
 id_cust_men : int64;
 fsp_customer_form_people_add : Tfsp_customer_form_people_add;
begin
 if CustDataSet.RecordCount = 0 then exit;

 if PeopleDataSet.RecordCount = 0 then exit;

 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна редагувати особу контрагента іншого підрозділу.');
   exit;
 end;

 customer := CustDataSet['ID_CUSTOMER'];
 id_cust_men := PeopleDataSet['ID_CUST_MEN'];
 fsp_customer_form_people_add := Tfsp_customer_form_people_add.Create(Self);
 fsp_customer_form_people_add.Position := poOwnerFormCenter;
 fsp_customer_form_people_add.Caption := 'Змінити';
 fsp_customer_form_people_add.TypeMenEdit.Text := PeopleDataSet['NAME_TYPE_MEN'];
 fsp_customer_form_people_add.id_type_men := PeopleDataSet['ID_TYPE_MEN'];
 fsp_customer_form_people_add.ImyaEdit.Text := PeopleDataSet['IMYA'];
 fsp_customer_form_people_add.FamiliaEdit.Text := PeopleDataSet['FAMILIA'];
 fsp_customer_form_people_add.OtchestvoEdit.Text := PeopleDataSet['OTCHESTVO'];
 fsp_customer_form_people_add.NotesMemo.Text := PeopleDataSet['NOTES'];

 if fsp_customer_form_people_add.ShowModal = mrOK then begin
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_CUST_MEN_MOD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUST_MEN').AsInt64 := id_cust_men;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := customer;
  StoredProc.ParamByName('ID_TYPE_MEN').AsInteger := fsp_customer_form_people_add.id_type_men;
  StoredProc.ParamByName('FAMILIA').AsString := fsp_customer_form_people_add.FamiliaEdit.Text;
  StoredProc.ParamByName('IMYA').AsString := fsp_customer_form_people_add.ImyaEdit.Text;
  StoredProc.ParamByName('OTCHESTVO').AsString := fsp_customer_form_people_add.OtchestvoEdit.Text;
  StoredProc.ParamByName('NOTES').AsString := fsp_customer_form_people_add.NotesMemo.Text;
  StoredProc.ExecProc;
//  StoredProc.ExecProcedure('PUB_SP_CUST_MEN_MOD', [id_cust_men, customer, fsp_customer_form_people_add.id_type_men, fsp_customer_form_people_add.FamiliaEdit.Text, fsp_customer_form_people_add.ImyaEdit.Text, fsp_customer_form_people_add.OtchestvoEdit.Text, fsp_customer_form_people_add.NotesMemo.Text]);
  StoredProc.Transaction.Commit;
  SelectAll_Peoples;
  LocateMan(id_cust_men);
 end;
end;

procedure TFsp_customer.ContactButtonClick(Sender: TObject);
var
 T : Tfsp_cust_contact;
 id : int64;
begin
 if CustDataSet.RecordCount = 0 then exit;
 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна редагувати контакти контрагента іншого підрозділу.');
   exit;
 end;

 T :=Tfsp_cust_contact.Create(self);
 id := CustDataSet['ID_CUSTOMER'];
 T.id_customer := id;
 T.StoredProc.Database    := WorkDatabase;
 T.StoredProc.Transaction := WriteTransaction;
 T.DataSet.Database       := WorkDatabase;
 T.DataSet.Transaction    := ReadTransaction;
 T.ShowModal;
 T.Free;
end;


procedure TFsp_customer.RefreshButton3Click(Sender: TObject);
var
 id_men : integer;
begin
 if PeopleDataSet.RecordCount = 0 then begin
  SelectAll_Peoples;
  exit;
 end;
 id_men := PeopleDataSet['ID_CUST_MEN'];
 SelectAll_Peoples;
 LocateMan(id_men);
end;

procedure TFsp_customer.FormCreate(Sender: TObject);
begin
 show_department := True;
 LangPackApply(Self);
 fltForm := TfrmCustomerFilter.Create(Self);
 fltForm.flt_id_department := DogLoaderUnit.SYS_DEF_ID_DEPARTMENT;
 fltForm.depEdit.Text := DogLoaderUnit.SYS_DEF_NAME_DEPARTMENT;
 fltForm.depCheck.Tag := 1;
 fltForm.depCheck.Checked := true;
 fltForm.depEdit.Enabled := true;
 fltForm.depCheck.Tag := 0;
// fltForm.depEdit.Visible := not ChooseButton.Visible;
// fltForm.depCheck.Visible := not ChooseButton.Visible;
 fltForm.DBHandle := WorkDatabase.Handle;
 DonnuRecv.Caption := 'Реквізити ' + SYS_NAME_CUSTOMER_NATIVE;

 if fibCheckPermission('/ROOT/DOG/SPRAV/CUSTOMERS','Add') <> 0 then AddButton.Visible := false;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUSTOMERS','Del') <> 0 then DelButton.Visible := false;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUSTOMERS','Edit') <> 0 then EditButton.Visible := false;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUSTOMERS','View') <> 0 then ViewButton.Visible := false;
 N1.Enabled := AddButton.Visible;
 N2.Enabled := Delbutton.Visible;
 N3.Enabled := EditButton.Visible;

 if fibCheckPermission('/ROOT/DOG/SPRAV/CUST_RATE_ACC','Add') <> 0 then AddButton2.Visible := false;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUST_RATE_ACC','Del') <> 0 then DelButton2.Visible := false;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUST_RATE_ACC','Edit') <> 0 then
 begin
  MoveAccButton.Visible := false;
  EditButton2.Visible := false;
 end;
 N17.Enabled := AddButton2.Visible;
 N18.Enabled := DelButton2.Visible;
 N19.Enabled := EditButton2.Visible;
 
// if fibCheckPermission('/ROOT/DOG/SPRAV/CUST_RATE_ACC','View') <> 0 then ViewButton2.Visible := false;

 if fibCheckPermission('/ROOT/DOG/SPRAV/CUST_MAN','Add') <> 0 then AddButton3.Visible := false;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUST_MAN','Del') <> 0 then DelButton3.Visible := false;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUST_MAN','Edit') <> 0 then EditButton3.Visible := false;
 N13.Enabled := AddButton3.Visible;
 N14.Enabled := DelButton3.Visible;
 N15.Enabled := EditButton3.Visible;

 cxGrid3TableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
 cxGrid3TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid3TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;

 LocateCustomerID := -1;
 LocateAccountID  := -1;
 FirstShow        := true;
// cxSplitter3.CloseSplitter;
end;


procedure TFsp_customer.cxDBTreeList1FocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
 if AccountDataSet.RecordCount = 0 then exit;
end;

procedure TFsp_customer.RefreshButton2Click(Sender: TObject);
var
 id_rate_account : int64;
begin
 if AccountDataSet.RecordCount = 0 then begin
  SelectAll_S;
  exit;
 end;
 id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'];
 SelectAll_s;
 LocateAccount(id_rate_account);
end;

procedure TFsp_customer.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if PeopleDataSet['NOTES'] <> NULL then Memo1.Text := PeopleDataSet['NOTES'] else Memo1.Text := '';
end;

procedure TFsp_customer.N7Click(Sender: TObject);
begin
 ContactButtonClick(Self);
end;

procedure TFsp_customer.FormActivate(Sender: TObject);
begin
 if FirstShow then begin
//  SelectAll;
  if LocateCustomerID <> -1 then CustDataSet.Locate('ID_CUSTOMER', LocateCustomerID, [loCaseInsensitive]);
  if LocateAccountID <> -1 then LocateAccount(LocateAccountID);
  LocateCustomerID := -1;
  LocateAccountID := -1;
  FirstShow := false;
 end;
end;

procedure TFsp_customer.N14Click(Sender: TObject);
begin
 cxSplitter2.CloseSplitter;
end;

procedure TFsp_customer.CloseButtonClick(Sender: TObject);
begin
  close;
end;

procedure TFsp_customer.cxGrid2Resize(Sender: TObject);
begin
     cxGrid2DBTableView1.Columns[0].Width:=round((8/10)*(cxGrid2.Width-10));
     cxGrid2DBTableView1.Columns[1].Width:=round((2/10)*(cxGrid2.Width-10));
end;

procedure TFsp_customer.cxGrid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
{if CustDataSet.RecordCount = 0 then begin
  AddButton2.Enabled := false;
  DelButton2.Enabled := false;
  EditButton2.Enabled := false;
  RefreshButton2.Enabled := false;
  AddButton3.Enabled := false;
  DelButton3.Enabled := false;
  EditButton3.Enabled := false;
  RefreshButton3.Enabled := false;
 end else begin
  AddButton2.Enabled := true;
  DelButton2.Enabled := true;
  EditButton2.Enabled := true;
  RefreshButton2.Enabled := true;
  AddButton3.Enabled := true;
  DelButton3.Enabled := true;
  EditButton3.Enabled := true;
  RefreshButton3.Enabled := true;
 end;

 SelectAll_S;
 SelectAll_Peoples;}

end;


procedure TFsp_customer.ChooseButtonClick(Sender: TObject);
var
 i : integer;
begin
// showmessage(CustDataSet['ID_DEPARTMENT']);
// showmessage(DogLoaderUnit.SYS_DEF_ID_DEPARTMENT);
// showmessage(DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2);

// if input['noDepSel'] <> 1 then
 if (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT) and (CustDataSet['ID_DEPARTMENT'] <> DogLoaderUnit.SYS_DEF_ID_DEPARTMENT2) then
 begin
   ShowMessage('Не можна вибрати контрагента іншого підрозділу.');
   exit;
 end;

 if SelPanel.Visible then begin
  if (TComponent(Sender).tag = 3053544) then begin
   if cxGrid3TableView1.DataController.RecordCount <> 0 then begin
    ResultValue := VarArrayCreate([0, cxGrid3TableView1.DataController.RecordCount - 1], varInteger);
    for i := 0 to cxGrid3TableView1.DataController.RecordCount - 1 do begin
     ResultValue[i] := cxGrid3TableView1.DataController.Values[i, 0];
    end;
   end;
   ModalResult := mrOk;
  end;
  AddToSelectionButtonClick(Self);
  exit;
 end;

 if Assigned(output) then
 begin
   output['ID_CUSTOMER']        := CustDataSet.FieldByName('ID_CUSTOMER').Value;
   output['ID_HIGHER_INSTANCE'] := CustDataSet.FieldByName('ID_HIGHER_INSTANCE').Value;
   output['NAME_CUSTOMER']      := CustDataSet.FieldByName('NAME_CUSTOMER').Value;
   output['KOD_EDRPOU']         := CustDataSet.FieldByName('KOD_EDRPOU').Value;
   output['DATE_NNS']           := CustDataSet.FieldByName('DATE_NNS').Value;
   output['NNS']                := CustDataSet.FieldByName('NNS').Value;
   output['NALOG_NOM']          := CustDataSet.FieldByName('NALOG_NOM').Value;
   output['FIZ_LICO']           := CustDataSet.FieldByName('FIZ_LICO').Value;
   output['SHORT_NAME']         := CustDataSet.FieldByName('SHORT_NAME').Value;
   output['ID_DEPARTMENT']      := CustDataSet.FieldByName('ID_DEPARTMENT').Value;
   output['PLAT_NDS']           := CustDataSet.FieldByName('PLAT_NDS').Value;
   output['ID_BRANCH']          := CustDataSet.FieldByName('ID_BRANCH').Value;
   output['NAME_IST']           := CustDataSet.FieldByName('NAME_IST').Value;
   output['NAME_BRANCH']        := CustDataSet.FieldByName('NAME_BRANCH').Value;
   output['NAME_DEPARTMENT']    := CustDataSet.FieldByName('NAME_DEPARTMENT').Value;
   //
   if AccountDataSet.RecordCount <> 0 then
   begin
     output['ID_RATE_ACCOUNT']   := AccountDataSet.FieldByName('ID_RATE_ACCOUNT').Value;
     output['RATE_ACCOUNT']      := AccountDataSet.FieldByName('RATE_ACCOUNT').Value;
     output['ID_BANK']           := AccountDataSet.FieldByName('ID_BANK').Value;
     output['ID_TYPE_ACCOUNT']   := AccountDataSet.FieldByName('ID_TYPE_ACCOUNT').Value;
     output['MFO']               := AccountDataSet.FieldByName('MFO').Value;
     output['NAME_BANK']         := AccountDataSet.FieldByName('NAME_BANK').Value;
     output['NAME_TYPE_ACCOUNT'] := AccountDataSet.FieldByName('NAME_TYPE_ACCOUNT').Value;
   end;  
   //

   if IfNull(input['SelectMode'], selNone) = selCustomer then
   begin
     output['ModalResult']      := mrOk;
     ModalResult := mrOk;
     Exit;
   end;
   if IfNull(input['SelectMode'], selNone) = selRateAccount then
   begin
     if AccountDataSet.RecordCount = 0 then Exit;
     if VarIsNull(AccountDataSet.FieldByName('MFO').AsVariant) then
     begin
       ShowMessage('Вкажіть банк для рахунка.');
       exit;
     end;
     if VarIsNull(AccountDataSet.FieldByName('MFO').AsString) then
     begin
       ShowMessage('Вкажіть банк для рахунка.');
       exit;
     end;
     output['ID_RATE_ACCOUNT']   := AccountDataSet.FieldByName('ID_RATE_ACCOUNT').Value;
     output['RATE_ACCOUNT']      := AccountDataSet.FieldByName('RATE_ACCOUNT').Value;
     output['ID_BANK']           := AccountDataSet.FieldByName('ID_BANK').Value;
     output['ID_TYPE_ACCOUNT']   := AccountDataSet.FieldByName('ID_TYPE_ACCOUNT').Value;
     output['MFO']               := AccountDataSet.FieldByName('MFO').Value;
     output['NAME_BANK']         := AccountDataSet.FieldByName('NAME_BANK').Value;
     output['NAME_TYPE_ACCOUNT'] := AccountDataSet.FieldByName('NAME_TYPE_ACCOUNT').Value;
     output['ModalResult']       := mrOk;
     ModalResult := mrOk;
     Exit;
   end;
 end;
 
 case curSelectMode of
  csmCustomers :
   begin
    if CustDataSet.Active and (CustDataSet.RecordCount>0)
    then begin
      ResultValue:=VarArrayCreate([0,16],varVariant);
      ResultValue[0]   :=CustDataSet.FieldByName('ID_CUSTOMER').Value;
      ResultValue[1]   :=CustDataSet.FieldByName('ID_HIGHER_INSTANCE').Value;
      ResultValue[2]   :=CustDataSet.FieldByName('NAME_CUSTOMER').Value;
      ResultValue[3]   :=CustDataSet.FieldByName('KOD_EDRPOU').Value;
      ResultValue[4]   :=CustDataSet.FieldByName('DATE_NNS').Value;
      ResultValue[5]   :=CustDataSet.FieldByName('NNS').Value;
      ResultValue[6]   :=CustDataSet.FieldByName('NALOG_NOM').Value;
      ResultValue[8]   :=CustDataSet.FieldByName('FIZ_LICO').Value;
      ResultValue[9]   :=CustDataSet.FieldByName('SHORT_NAME').Value;
      ResultValue[10]  :=CustDataSet.FieldByName('ID_DEPARTMENT').Value;
      ResultValue[11]  :=CustDataSet.FieldByName('SHORT_NAME').Value;
      ResultValue[12]  :=CustDataSet.FieldByName('PLAT_NDS').Value;
      ResultValue[13]  :=CustDataSet.FieldByName('ID_BRANCH').Value;
      ResultValue[14]  :=CustDataSet.FieldByName('NAME_IST').Value;
      ResultValue[15]  :=CustDataSet.FieldByName('NAME_BRANCH').Value;
      ResultValue[16]  :=CustDataSet.FieldByName('NAME_DEPARTMENT').Value;
      ModalResult:=mrYes;
    end
   end;
  csmContactMen :
   begin
    if PeopleDataSet.Active and (PeopleDataSet.RecordCount>0) and
       CustDataSet.Active and (CustDataSet.RecordCount>0)
    then begin
     ResultValue:=VarArrayCreate([0,8],varVariant);
     ResultValue[0]   :=CustDataSet.FieldByName('ID_CUSTOMER').Value;
     ResultValue[1]   :=PeopleDataSet.FieldByName('ID_CUST_MEN').Value;
     ResultValue[2]   :=PeopleDataSet.FieldByName('ID_TYPE_MEN').Value;
     ResultValue[3]   :=PeopleDataSet.FieldByName('NAME_TYPE_MEN').Value;
     ResultValue[4]   :=PeopleDataSet.FieldByName('FAMILIA').Value;
     ResultValue[5]   :=PeopleDataSet.FieldByName('IMYA').Value;
     ResultValue[6]   :=PeopleDataSet.FieldByName('OTCHESTVO').Value;
     ResultValue[7]   :=PeopleDataSet.FieldByName('FIO').Value;
     ResultValue[8]   :=PeopleDataSet.FieldByName('NOTES').Value;
     ModalResult:=mrYes;
    end;
   end;
  csmRateAcc :
   begin
    if AccountDataSet.Active and (AccountDataSet.RecordCount>0) and
       CustDataSet.Active and (CustDataSet.RecordCount>0)
    then begin
     if VarIsNull(AccountDataSet.FieldByName('MFO').AsVariant) then
     begin
       ShowMessage('Вкажіть банк для рахунка.');
       exit;
     end;
     if VarIsNull(AccountDataSet.FieldByName('MFO').AsString) then
     begin
       ShowMessage('Вкажіть банк для рахунка.');
       exit;
     end;
     ResultValue:=VarArrayCreate([0,9],varVariant);
     ResultValue[0]   :=AccountDataSet.FieldByName('ID_CUSTOMER').Value;
     ResultValue[1]   :=AccountDataSet.FieldByName('ID_RATE_ACCOUNT').Value;
     ResultValue[2]   :=AccountDataSet.FieldByName('RATE_ACCOUNT').Value;
     ResultValue[3]   :=AccountDataSet.FieldByName('ID_BANK').Value;
     ResultValue[4]   :=AccountDataSet.FieldByName('ID_TYPE_ACCOUNT').Value;
     ResultValue[5]   :=AccountDataSet.FieldByName('MFO').Value;
     ResultValue[6]   :=AccountDataSet.FieldByName('NAME_BANK').Value;
     ResultValue[7]   :=AccountDataSet.FieldByName('NAME_TYPE_ACCOUNT').Value;
     ResultValue[8]   :=CustDataSet.FieldByName('NAME_CUSTOMER').Value;
     ResultValue[9]   :=CustDataSet.FieldByName('KOD_EDRPOU').Value;
     ModalResult:=mrYes;
    end;
  end;
 end;
end;



procedure TFsp_customer.FilterButtonClick(Sender: TObject);
begin
 if fltForm.ShowModal=mrOK then begin
  isFilter := true;
  SelectAll;
 end else isFilter := false;
end;

procedure TFsp_customer.dxBarLargeButton1Click(Sender: TObject);
//var
// id_rate_account : int64;

begin
 isOnlyDate := true;
 ModRecord_S;
{ id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'];
 StoredProc.Transaction := WriteTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_SP_CUST_RATE_ACC_CLOSE_OPE', [id_rate_account, null]);
 StoredProc.Transaction.Commit;
 SelectAll_S;
 LocateAccount(id_rate_account);}
end;

procedure TFsp_customer.ViewButton2Click(Sender: TObject);
var
 id_customer     : int64;
 id_rate_account : int64;
 linkto          : int64;
 rate_account    : string;
 id_bank         : integer;
 id_type_account : integer;
 use_beg         : TDateTime;
 use_end         : TDateTime;
 vals            : array of Variant;
 Fsp_cust_rate_acc_ADD : TFsp_cust_rate_acc_ADD;
begin
 if AccountDataSet.RecordCount = 0 then exit;

 id_customer     := AccountDataSet['ID_CUSTOMER'];
 id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'];
 linkto          := AccountDataSet['LINKTO'];
 rate_account    := AccountDataSet['RATE_ACCOUNT'];
 id_bank         := AccountDataSet['ID_BANK'];
 id_type_account := AccountDataSet['ID_TYPE_ACCOUNT'];

 Fsp_cust_rate_acc_ADD := TFsp_cust_rate_acc_ADD.Create(Self);
 Fsp_cust_rate_acc_ADD.Action := saView;
 Fsp_cust_rate_acc_ADD.Caption := 'Перегляд';
 Fsp_cust_rate_acc_ADD.OKButton1.Visible := false;
 Fsp_cust_rate_acc_ADD.OKButton2.Visible := false;

 Fsp_cust_rate_acc_ADD.id_bank              := id_bank;
 Fsp_cust_rate_acc_ADD.id_type_account      := id_type_account;
 Fsp_cust_rate_acc_ADD.AccountEdit.Text     := rate_account;
 Fsp_cust_rate_acc_ADD.AccountEdit.Properties.ReadOnly := true;
 Fsp_cust_rate_acc_ADD.AccountEdit.Style.Color := clSilver;
 Fsp_cust_rate_acc_ADD.bank_mfo := AccountDataSet['MFO'];
 Fsp_cust_rate_acc_ADD.Action := saMod;
 Fsp_cust_rate_acc_ADD.BankEdit.Text := AccountDataSet['NAME_BANK'];
 Fsp_cust_rate_acc_ADD.BankEdit.Properties.ReadOnly := true;
 Fsp_cust_rate_acc_ADD.BankEdit.Style.Color := clSilver;
 Fsp_cust_rate_acc_ADD.BankEdit.Properties.OnButtonClick := Nil;
 Fsp_cust_rate_acc_ADD.TypeAccountEdit.Text := AccountDataSet['NAME_TYPE_ACCOUNT'];
 Fsp_cust_rate_acc_ADD.TypeAccountEdit.Properties.ReadOnly := true;
 Fsp_cust_rate_acc_ADD.TypeAccountEdit.Style.Color := clSilver;
 Fsp_cust_rate_acc_ADD.TypeAccountEdit.Properties.OnButtonClick := Nil;
 Fsp_cust_rate_acc_ADD.bankFinded := true;
 Fsp_cust_rate_acc_ADD.MFOEdit.Text := AccountDataSet['MFO'];
 Fsp_cust_rate_acc_ADD.MFOEdit.Properties.ReadOnly := true;
 Fsp_cust_rate_acc_ADD.MFOEdit.Style.Color := clSilver;
 Fsp_cust_rate_acc_ADD.DateBegEdit.Date := AccountDataSet['DATE_BEG'];  // Grebennyk 27.08.2013
 Fsp_cust_rate_acc_ADD.DateEndEdit.Date := AccountDataSet['DATE_END'];  // Grebennyk 27.08.2013
 Fsp_cust_rate_acc_ADD.NoteMemo.Text := ifnull(AccountDataSet['COMMENT'], '');  // Grebennyk 27.08.2013
 Fsp_cust_rate_acc_ADD.is_bank_account := AccountDataSet['IS_BANK_ACCOUNT'];
 Fsp_cust_rate_acc_ADD.is_val_account := AccountDataSet['IS_VAL_ACCOUNT'];
 if AccountDataSet['CITY'] <> Null then Fsp_cust_rate_acc_ADD.CityEdit.Text := AccountDataSet['CITY'];
 Fsp_cust_rate_acc_ADD.CityEdit.Properties.ReadOnly := true;
 Fsp_cust_rate_acc_ADD.CityEdit.Style.Color := clSilver;
 Fsp_cust_rate_acc_ADD.bankFinded := true;

 Fsp_cust_rate_acc_ADD.ShowModal;
 Fsp_cust_rate_acc_ADD.Free;
end;

procedure TFsp_customer.dxBarLargeButton2Click(Sender: TObject);
var
 id_customer        : int64;
 id_higher_instance : integer;
 id_branch          : integer;
 name_customer      : string;
 kod_edrpou         : string;
 date_nns           : string;
 nns                : string;
 nalog_nom          : string;
 id_address         : integer;
 fiz_lico           : integer;
 use_beg            : TDateTime;
 use_end            : TDateTime;
 short_name         : string;
 id_department      : variant;
 vals               : array of Variant;
 plat_nds           : integer;
 branch_dataset     : TpFibdataSet;
 Fsp_customer_ADD : TFsp_customer_ADD;
 name_full        :string;
 adrs_full        :string;
 name_ukr : string;
begin
 if CustDataSet.RecordCount = 0 then exit;

 id_customer        := CustDataSet['ID_CUSTOMER'];
 id_higher_instance := IfNull(CustDataSet['ID_HIGHER_INSTANCE'], -1);
 if not VarIsNull(CustDataSet['ID_BRANCH']) then id_branch := CustDataSet['ID_BRANCH'];
 name_customer      := IfNull(CustDataSet['NAME_CUSTOMER'], '');
 kod_edrpou         := IfNull(CustDataSet['KOD_EDRPOU'], '');
 date_nns           := IfNull(CustDataSet['DATE_NNS'], '');
 nns                := IfNull(CustDataSet['NNS'], '');
 id_address         := IfNull(CustDataSet['ID_ADRESS'], -1);
 nalog_nom          := IfNull(CustDataSet['NALOG_NOM'], '');
 fiz_lico           := IfNull(CustDataSet['FIZ_LICO'], 0);
 plat_nds           := IfNull(CustDataSet['PLAT_NDS'], 0);
 short_name         := IfNull(CustDataSet['SHORT_NAME'], '');
 name_ukr         := IfNull(CustDataSet['NAME_UKR'], '');
 name_full         := IfNull(CustDataSet['FULL_NAME_CUSTOMER'], '');
 adrs_full         := IfNull(CustDataSet['FULL_ADRESS_CUSTOMER'], '');
 Fsp_customer_ADD := TFsp_customer_ADD.Create(Self);
 Fsp_customer_ADD.Caption := 'Перегляд';
 Fsp_customer_ADD.DnDzIDEdit.Text := IfNull(CustDataset['DNDZ_ID'], 0);

 Query1.Close;
 Query1.SQL.Text := 'select * from GET_ADR_STRING_2(' + IntToStr(id_address) + ')';
 Query1.ExecQuery;
 Fsp_customer_ADD.AdrEdit.Text := IfNull(Query1['ADR'].AsVariant, '');
 Query1.Close;

 if ViewRecord then begin
  Fsp_customer_ADD.DisableControls;
  Fsp_customer_ADD.OKButton1.Visible := false;
 end;


 branch_dataset     := TpFibdataSet.Create(nil);
 branch_dataset.Database:=WorkDatabase;
 branch_dataset.Transaction:=ReadTransaction;
 branch_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM VIEW_SP_BRANCH WHERE ID_BRANCH='+IntToStr(id_branch);
 branch_dataset.Open;
    if branch_dataset.RecordCount>0
    then Fsp_customer_ADD.BranchEdit.Text:=branch_dataset.FieldByName('NAME_BRANCH').AsString;
 branch_dataset.Close;
 branch_dataset.SQLs.SelectSQL.Text:=' SELECT * FROM VIEW_SP_IST WHERE ID_IST='+IntToStr(id_higher_instance);
 branch_dataset.Open;
    if branch_dataset.RecordCount>0
    then Fsp_customer_ADD.InstanceEdit.Text:=branch_dataset.FieldByName('NAME_IST').AsString;
 branch_dataset.Close;
 branch_dataset.Free;
 Fsp_customer_ADD.AdrEdit.Style.Color := clSilver;
 Fsp_customer_ADD.AdrEdit.Properties.ReadOnly := True;
 Fsp_customer_ADD.DnDzIDEdit.Style.Color := clSilver;
 Fsp_customer_ADD.DnDzIDEdit.Properties.ReadOnly := True;
 Fsp_customer_ADD.NameUkrEdit.Style.Color := clSilver;
 Fsp_customer_ADD.NameUkrEdit.Properties.ReadOnly := true;
 Fsp_customer_ADD.InstanceEdit.Style.Color := clSilver;
 Fsp_customer_ADD.InstanceEdit.Properties.ReadOnly := true;
 Fsp_customer_ADD.InstanceEdit.Properties.OnButtonClick := Nil;
 Fsp_customer_ADD.BranchEdit.Style.Color := clSilver;
 Fsp_customer_ADD.BranchEdit.Properties.ReadOnly := true;
 Fsp_customer_ADD.BranchEdit.Properties.OnButtonClick := Nil;
 Fsp_customer_ADD.DepEdit.Style.Color := clSilver;
 Fsp_customer_ADD.DepEdit.Properties.ReadOnly := true;
 Fsp_customer_ADD.DepEdit.Properties.OnButtonClick := Nil;
 Fsp_customer_ADD.DepCheck.OnClick := Nil;
 Fsp_customer_ADD.DepCheck.Properties.ReadOnly := true;

 Fsp_customer_ADD.BranchEdit.Style.Color := clSilver;
 Fsp_customer_ADD.BranchEdit.Properties.ReadOnly := true;
 Fsp_customer_ADD.InstanceEdit.Style.Color := clSilver;
 Fsp_customer_ADD.InstanceEdit.Properties.ReadOnly := true;
 Fsp_customer_ADD.cxButton1.Visible := false;
 Fsp_customer_ADD.OKButton1.Visible := false;

 Fsp_customer_ADD.PlatNdsCheck.Checked   := plat_nds = 1;
 Fsp_customer_ADD.PlatNdsCheck.Properties.ReadOnly := true;

 Fsp_customer_ADD.id_higher_instance := id_higher_instance;
 Fsp_customer_ADD.id_branch          := id_branch;
 Fsp_customer_ADD.id_adress          := id_address;
 Fsp_customer_ADD.id_department := id_department;
 Fsp_customer_ADD.NameEdit.Text      := name_customer;
 Fsp_customer_ADD.NameEdit.Style.Color := clSilver;
 Fsp_customer_ADD.NameEdit.Properties.ReadOnly := true;

 Fsp_customer_ADD.ShortNameEdit.Text := short_name;
 Fsp_customer_ADD.ShortNameEdit.Style.Color := clSilver;
 Fsp_customer_ADD.ShortNameEdit.Properties.ReadOnly := true;

 Fsp_customer_ADD.edrpouEdit.Text    := kod_edrpou;
 Fsp_customer_ADD.edrpouEdit.Style.Color := clSilver;
 Fsp_customer_ADD.edrpouEdit.Properties.ReadOnly := true;

 if not VarIsNull(date_nns) then Fsp_customer_ADD.DatennsEdit.Date  := StrToDate(date_nns); 
 Fsp_customer_ADD.DatennsEdit.Style.Color := clSilver;
 Fsp_customer_ADD.DatennsEdit.Properties.ReadOnly := true;

 Fsp_customer_ADD.nnsEdit.Text       := nns;
 Fsp_customer_ADD.nnsEdit.Style.Color := clSilver;
 Fsp_customer_ADD.nnsEdit.Properties.ReadOnly := true;

 Fsp_customer_ADD.NalogEdit.Text     := nalog_nom;
 Fsp_customer_ADD.NalogEdit.Style.Color := clSilver;
 Fsp_customer_ADD.NalogEdit.Properties.ReadOnly := true;

  Fsp_customer_ADD.AdrFullEdit.Text     := adrs_full;
 Fsp_customer_ADD.AdrFullEdit.Style.Color := clSilver;
 Fsp_customer_ADD.AdrFullEdit.Properties.ReadOnly := true;

  Fsp_customer_ADD.NameFullEdit.Text     := name_full;
 Fsp_customer_ADD.NameFullEdit.Style.Color := clSilver;
 Fsp_customer_ADD.NameFullEdit.Properties.ReadOnly := true;


 Fsp_customer_ADD.NameUkrEdit.Text := name_ukr;
 Fsp_customer_ADD.DB_Handle:=nil;
 Fsp_customer_ADD.FizLicoCheck.Checked := fiz_lico = 1;
 Fsp_customer_ADD.FizLicoCheck.Properties.ReadOnly := true;
 Fsp_customer_ADD.Action := saView;
 Fsp_customer_ADD.ShowModal;
 Fsp_customer_ADD.Free;
end;

procedure TFsp_customer.cxDBTreeList1DblClick(Sender: TObject);
begin
// if input <> nil then if input['SelectMode'] = selRateAccount then curSelectMode := csmRateAcc;
// if (curSelectMode <> csmRateAcc) then exit;
 if not ChooseButton.Visible then ViewButton2Click(Self) else ChooseButtonClick(Self);
(* if CustDataSet.Active and (CustDataSet.RecordCount>0) then begin
     ResultValue:=VarArrayCreate([0,16],varVariant);
     ResultValue[0]   :=CustDataSet.FieldByName('ID_CUSTOMER').Value;
     ResultValue[1]   :=CustDataSet.FieldByName('ID_HIGHER_INSTANCE').Value;
     ResultValue[2]   :=CustDataSet.FieldByName('NAME_CUSTOMER').Value;
     ResultValue[3]   :=CustDataSet.FieldByName('KOD_EDRPOU').Value;
     ResultValue[4]   :=CustDataSet.FieldByName('DATE_NNS').Value;
     ResultValue[5]   :=CustDataSet.FieldByName('NNS').Value;
     ResultValue[6]   :=CustDataSet.FieldByName('NALOG_NOM').Value;
//     ResultValue[7]   :=CustDataSet.FieldByName('ID_ADDRESS').Value;
     ResultValue[8]   :=CustDataSet.FieldByName('FIZ_LICO').Value;
     ResultValue[9]   :=CustDataSet.FieldByName('SHORT_NAME').Value;
//     ResultValue[10]  :=CustDataSet.FieldByName('ID_DEPARTMENT').Value;
     ResultValue[11]  :=CustDataSet.FieldByName('SHORT_NAME').Value;
     ResultValue[12]  :=CustDataSet.FieldByName('PLAT_NDS').Value;
     ResultValue[13]  :=CustDataSet.FieldByName('ID_BRANCH').Value;
     ResultValue[14]  :=CustDataSet.FieldByName('NAME_IST').Value;
     ResultValue[15]  :=CustDataSet.FieldByName('NAME_BRANCH').Value;
     ResultValue[16]  :=CustDataSet.FieldByName('NAME_DEPARTMENT').Value;
  end;
  if AccountDataSet.Active and (AccountDataSet.RecordCount>0) and CustDataSet.Active and (CustDataSet.RecordCount>0) then begin
     ResultValue:=VarArrayCreate([0,9],varVariant);
     ResultValue[0]   :=AccountDataSet.FieldByName('ID_CUSTOMER').Value;
     ResultValue[1]   :=AccountDataSet.FieldByName('ID_RATE_ACCOUNT').Value;
     ResultValue[2]   :=AccountDataSet.FieldByName('RATE_ACCOUNT').Value;
     ResultValue[3]   :=AccountDataSet.FieldByName('ID_BANK').Value;
     ResultValue[4]   :=AccountDataSet.FieldByName('ID_TYPE_ACCOUNT').Value;
     ResultValue[5]   :=AccountDataSet.FieldByName('MFO').Value;
     ResultValue[6]   :=AccountDataSet.FieldByName('NAME_BANK').Value;
     ResultValue[7]   :=AccountDataSet.FieldByName('NAME_TYPE_ACCOUNT').Value;
     ResultValue[8]   :=CustDataSet.FieldByName('NAME_CUSTOMER').Value;
     ResultValue[9]   :=CustDataSet.FieldByName('KOD_EDRPOU').Value;
  end;
  ModalResult:=mrYes;*)
end;

procedure TFsp_customer.FormShow(Sender: TObject);
begin
 LoadPositionFromRegistry;
 CustLocateEdit.SetFocus;
{ RefreshButton2Click(Self);
 cxDBTreeList1.Update;}
end;

procedure TFsp_customer.AddToSelectionButtonClick(Sender: TObject);
var
 idx : integer;
 i   : integer;
 ids : array of integer;
begin
 ids := Nil;
 SetLength(ids, cxGrid2DBTableView1.Controller.SelectedRecordCount);
 for i := 0 to cxGrid2DBTableView1.Controller.SelectedRecordCount - 1 do ids[i] := cxGrid2DBTableView1.Controller.SelectedRecords[i].RecordIndex;
// cxGrid2DBTableView1.DataController.FocusedRecordIndex := ids[0];
 for i := 0 to Length(ids) - 1 do begin
  cxGrid2DBTableView1.DataController.FocusedRecordIndex := ids[i];
  idx := cxGrid3TableView1.DataController.FindRecordIndexByText(0, 0, CustDataSet['ID_CUSTOMER'], false, false, true);
  if idx = -1 then begin
   cxGrid3TableView1.DataController.RecordCount := cxGrid3TableView1.DataController.RecordCount + 1;
   cxGrid3TableView1.DataController.Values[cxGrid3TableView1.DataController.RecordCount - 1, 0] := CustDataSet['ID_CUSTOMER'];
   cxGrid3TableView1.DataController.Values[cxGrid3TableView1.DataController.RecordCount - 1, 1] := CustDataSet['NAME_CUSTOMER'];
   cxGrid3TableView1.DataController.Values[cxGrid3TableView1.DataController.RecordCount - 1, 2] := CustDataSet['KOD_EDRPOU'];
   cxGrid3TableView1.DataController.FocusedRecordIndex := cxGrid3TableView1.DataController.RecordCount - 1;
  end else cxGrid3TableView1.DataController.FocusedRecordIndex := idx;
//  CustDataSet.CacheDelete;
 end;
{ idx := cxGrid3TableView1.DataController.FindRecordIndexByText(0, 0, CustDataSet['ID_CUSTOMER'], false, false, true);
 if idx = -1 then begin
  cxGrid3TableView1.DataController.RecordCount := cxGrid3TableView1.DataController.RecordCount + 1;
  cxGrid3TableView1.DataController.Values[cxGrid3TableView1.DataController.RecordCount - 1, 0] := CustDataSet['ID_CUSTOMER'];
  cxGrid3TableView1.DataController.Values[cxGrid3TableView1.DataController.RecordCount - 1, 1] := CustDataSet['NAME_CUSTOMER'];
  cxGrid3TableView1.DataController.Values[cxGrid3TableView1.DataController.RecordCount - 1, 2] := CustDataSet['KOD_EDRPOU'];
  cxGrid3TableView1.DataController.FocusedRecordIndex := cxGrid3TableView1.DataController.RecordCount - 1;
 end else cxGrid3TableView1.DataController.FocusedRecordIndex := idx;}
end;

procedure TFsp_customer.RemoveFromSelectionButtonClick(Sender: TObject);
var
 idx : integer;
begin
 if cxGrid3TableView1.DataController.RecordCount = 0 then exit;
 if cxGrid3TableView1.DataController.FocusedRecordIndex = -1 then exit;
 idx := cxGrid3TableView1.DataController.FocusedRecordIndex;
// LocateCustomer(cxGrid3TableView1.DataController.Values[idx, 0]);
 cxGrid3TableView1.DataController.DeleteRecord(cxGrid3TableView1.DataController.FocusedRecordIndex);
 cxGrid3TableView1.DataController.FocusedRecordIndex := idx - 1;
end;

procedure TFsp_customer.cxGrid3TableView1DblClick(Sender: TObject);
begin
 RemoveFromSelectionButtonClick(Self);
end;

procedure TFsp_customer.cxGrid2DBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if not SelPanel.Visible then exit;
 with TcxGridSite(Sender) do begin
  if ViewInfo.GetHitTest(X, Y).HitTestCode = htRecord then BeginDrag(False);
 end;
end;

procedure TFsp_customer.cxGrid3TableView1DragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
 if Source is TcxDragControlObject then with TcxDragControlObject(Source) do if (Control is TcxGridSite) or (Control is TcxGrid) then Accept := True;
end;

procedure TFsp_customer.cxGrid3TableView1DragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  AControl: TControl;
begin
  AControl := TDragControlObject(Source).Control;
  if AControl is TcxGridSite then begin
   AddToSelectionButtonClick(Self);
  end
end;

procedure TFsp_customer.cxGrid3TableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if not SelPanel.Visible then exit;
 with TcxGridSite(Sender) do begin
  if ViewInfo.GetHitTest(X, Y).HitTestCode = htRecord then BeginDrag(False);
 end;
end;

procedure TFsp_customer.cxGrid2DBTableView1DragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
 if Source is TcxDragControlObject then with TcxDragControlObject(Source) do if (Control is TcxGridSite) or (Control is TcxGrid) then Accept := True;
end;

procedure TFsp_customer.cxGrid2DBTableView1DragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  AControl: TControl;
begin
  AControl := TDragControlObject(Source).Control;
  if AControl is TcxGridSite then begin
     RemoveFromSelectionButtonClick(Self);
  end
end;

procedure TFsp_customer.DonnuRecvClick(Sender: TObject);
begin
  LoadDogManedger.WorkSpMfoRsch(Self, WorkDatabase.Handle, fsNormal,'spr', -1);
end;

procedure TFsp_customer.ShowDogButtonClick(Sender: TObject);
var
 input2 : TDogInput;
 res   : TDogResult;
begin
 if CustDataSet.RecordCount = 0 then exit;
 input2.Owner      := Self;
 input2.DBHandle   := WorkDatabase.Handle;
 input2.ReadTrans  := ReadTransaction.Handle;
 input2.WriteTrans := WriteTransaction.Handle;
 input2.FormStyle  := fsMDIChild;
 input2.id_Group_add := SYS_ID_GROUP_DOG;
 input2.id_Group   := SYS_ID_GROUP_DOG_VIEW;
 input2.filter.bUseFilter := true;
 input2.filter.bShowFilterForm := false;
 input2.filter.RegNum := '';
 input2.filter.SummaFrom := 0;
 input2.filter.SummaTo := 0;
 input2.filter.DateBeg := date - SYS_DOG_PERIOD;
 input2.filter.DateEnd := now;
 input2.filter.ShowClosed := 0;
 input2.filter.bID_Cust := true;
 input2.filter.NameCust := CustDataSet['NAME_CUSTOMER'];
 input2.filter.id_cust  := CustDataSet['ID_CUSTOMER'];
 input2.filter.NameTipDog := '';
 input2.filter.bRegNum := false;
 input2.filter.bSumma := false;
 input2.filter.bDate := false;
 input2.filter.bNameCust := false;
 input2.filter.bTipdog := false;
 input2.isZayav := false;
 res := ShowDogMain(input2);
end;

procedure TFsp_customer.CustDataSetAfterScroll(DataSet: TDataSet);
begin
{if CustDataSet.RecordCount = 0 then begin
  AddButton2.Enabled := false;
  DelButton2.Enabled := false;
  EditButton2.Enabled := false;
  RefreshButton2.Enabled := false;
  AddButton3.Enabled := false;
  DelButton3.Enabled := false;
  EditButton3.Enabled := false;
  RefreshButton3.Enabled := false;
 end else begin
  AddButton2.Enabled := true;
  DelButton2.Enabled := true;
  EditButton2.Enabled := true;
  RefreshButton2.Enabled := true;
  AddButton3.Enabled := true;
  DelButton3.Enabled := true;
  EditButton3.Enabled := true;
  RefreshButton3.Enabled := true;
 end;

 SelectAll_S;
 SelectAll_Peoples;}

end;

procedure TFsp_customer.cxGrid2DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_INSERT) and AddButton.Visible then AddButtonClick(Self);
 if (Key = VK_F2) and EditButton.Visible then EditButtonClick(Self);
 if (Key = VK_DELETE) and Delbutton.Visible then DelButtonClick(Self);
 if Key = VK_F5 then RefreshButtonClick(Self);
 if Key = VK_F3 then ViewButtonClick(Self);
 if Key = VK_F8 then FilterButtonClick(Self);
end;

procedure TFsp_customer.cxDBTreeList1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  cxDBTreeList1DblClick(Self);
 if (Key = VK_INSERT) and AddButton2.Visible then AddButton2Click(Self);
 if (Key = VK_F2) and EditButton2.Visible then EditButton2Click(Self);
 if (Key = VK_DELETE) and DelButton2.Visible then DelButton2Click(Self);
 if Key = VK_F5 then RefreshButton2Click(Self);
 if Key = VK_F3 then ViewButton2Click(Self);
end;

procedure TFsp_customer.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_INSERT) and AddButton3.Visible then AddButton3Click(Self);
 if (Key = VK_F2) and EditButton3.Visible then EditButton3Click(Self);
 if (Key = VK_DELETE) and DelButton3.Visible then DelButton3Click(Self);
 if Key = VK_F5 then RefreshButton3Click(Self);
// if Key = VK_F3 then ViewButton3Click(Self);
end;

procedure TFsp_customer.CustLocateEditPropertiesChange(Sender: TObject);
begin
// CustDataSet.Filter := 'NAME_CUST_FOR_LOCATE like ''' + CustLocateEdit.Text + '%''';
// CustDataSet.Filtered := True;
// CustDataSet.Locate('NAME_CUSTOMER_UPPER', AnsiUpperCase(CustLocateEdit.Text), [loCaseInsensitive, loPartialKey]);
end;

procedure TFsp_customer.CustLocateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SelectAll;
    cxGrid1.SetFocus;
  end;
end;

procedure TFsp_customer.EdrpouLocateEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SelectAll;
    cxGrid1.SetFocus;
  end;
end;

procedure TFsp_customer.ToolButton1Click(Sender: TObject);
var
 f : TfrmHistAcc;
begin
 if AccountDataSet.RecordCount = 0 then exit;
 f := TfrmHistAcc.Create(Self);
 f.id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'];
 f.ShowModal;
 f.Free;
end;

procedure TFsp_customer.MoveAccButtonClick(Sender: TObject);
var
  i, o : TSpravParams;
  id_rate_account, id_customer_new : int64;
begin
  if messageDlg('Увага', 'Ви дійсно бажаєте перемістити рахунок?', mtConfirmation, [mbYes, mbNo]) = mrNo then exit;
  id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'];

  i := TSpravParams.Create;
  o := TSpravParams.Create;
  i['DataBase']     := Integer(WorkDatabase.Handle);
  i['FormStyle']    := fsNormal;
  i['bMultiSelect'] := false;
  i['id_session']   := -1;
  i['SelectMode']   := selCustomer;
  LoadSprav('Customer\CustPackage.bpl', Self, i, o);
  if o['ModalResult'] = mrOk then
  begin
    id_customer_new := o['ID_CUSTOMER'];
    StoredProc.Close;
    StoredProc.StoredProcName := 'PROC_PUB_SP_CUST_RATE_ACC_MOVE';
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_RATE_ACCOUNT').AsInt64 := id_rate_account;
    StoredProc.ParamByName('ID_CUSTOMER_NEW').AsInt64 := id_customer_new;
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    SelectAll_S;
  end;
  i.Free;
  o.Free;
end;

procedure TFsp_customer.CustHistButtonClick(Sender: TObject);
var
 f : TfrmCustHist;
begin
 if CustDataSet.RecordCount = 0 then exit;
 f := TfrmCustHist.Create(Self);
 f.id_customer := CustDataSet['ID_CUSTOMER'];
 f.ShowModal;
 f.Free;
end;

end.





