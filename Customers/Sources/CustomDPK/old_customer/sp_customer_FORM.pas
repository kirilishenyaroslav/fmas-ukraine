unit sp_customer_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDatabase, StdCtrls, Db, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  ExtCtrls, BaseTypes, Menus, Variants,Ibase,
  cxInplaceContainer, cxTL, GlobalSPR,
  cxControls, cxGraphics, cxCustomData, cxStyles, cxTextEdit,
  cxCalendar, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxDBTL, cxTLData,
  cxContainer, cxMemo, cxRadioGroup, cxLabel, cxSplitter, cxButtonEdit,
  cxCheckBox, FIBDatabase, ImgList,Resources_unitb, RXDBCtrl,
  dxBarExtItems, dxBar;



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
    ToolBar2: TToolBar;
    AddButton2: TToolButton;
    DelButton2: TToolButton;
    EditButton2: TToolButton;
    RefreshButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolBar3: TToolBar;
    AddButton3: TToolButton;
    DelButton3: TToolButton;
    EditButton3: TToolButton;
    RefreshButton3: TToolButton;
    cxSplitter1: TSplitter;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxStyle2: TcxStyle;
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
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    BarManager: TdxBarManager;
    dxBarButton1: TdxBarButton;
    AddButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    ChooseButton: TdxBarLargeButton;
    ContactButton: TdxBarLargeButton;
    dxBarButton3: TdxBarButton;
    RefreshButton: TdxBarLargeButton;
    FilterButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    Panel2: TPanel;
    cxCheckBox1: TcxCheckBox;
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
    procedure N9Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure cxGrid2Resize(Sender: TObject);
    procedure cxGrid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ChooseButtonClick(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
  private
    FilterForm:TForm;
  public
   CurFS:TFormStyle;
   ActualDate:TDateTime;
   ResultValue:Variant;
   LocateCustomerID : integer;
   LocateAccountID  : integer;
   ViewRecord   : boolean;
   FirstShow    : boolean;
   curSelectMode:TCustomerSelectMode;
   constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime;SeleMode:TCustomerSelectMode);overload;
   procedure SelectAll;
   procedure DeleteRecord;
   procedure AddRecord;
   procedure ModRecord;
   procedure SelectAll_S;
   procedure DeleteRecord_S;
   procedure AddRecord_S;
   procedure ModRecord_S;
   procedure SelectAll_Peoples;
   procedure LocateCustomer(const id_customer : integer);
   procedure LocateAccount(const id_rate_account : integer);
   procedure LocateMan(const id_man : integer);
   function  GetMainCustSqlText: String;
  end;


function GetCustomers(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;SeleMode:TCustomerSelectMode):Variant;stdcall;
exports  GetCustomers;


implementation

uses sp_customer_FORM_ADD, SYS_OPTIONS,sp_cust_rate_acc_FORM_ADD,
     sp_customer_FORM_PEOPLE_ADD,
     sp_cust_contact_FORM, pub_sp_customer_filterx;
{$R *.DFM}

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
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_customer.Create(AOwner, DBHANDLE,FS,ActualDate,SeleMode);
             Res:=NULL;
    end;

    GetCustomers:=Res;
end;

constructor TFsp_customer.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime;SeleMode:TCustomerSelectMode);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      FilterForm:=TfrmCustomerFilter.Create(self);
      CurFS:=FS;
      curSelectMode:=SeleMode;

      if FilterForm.ShowModal=mrYes
      then Selectall;
      if curSelectMode in [csmCustomers,csmContactMen,csmRateAcc]
      then ChooseButton.Enabled:=true;
      self.FormStyle:=FS;
end;



procedure TFsp_customer.LocateAccount(const id_rate_account : integer);
begin
 AccountDataSet.Locate('ID_RATE_ACCOUNT', id_rate_account, [loCaseInsensitive])
end;

procedure TFsp_customer.LocateMan(const id_man : integer);
begin
 PeopleDataSet.Locate('ID_CUST_MEN', id_man, [loCaseInsensitive])
end;

procedure TFsp_customer.SelectAll_S;
begin
 AccountDataSet.Close;
 AccountDataSet.SelectSQL.Text := 'select * from PUB_SP_CUST_RATE_ACC_SEL(?MAS_ID_CUSTOMER, ''' + DateTimeToStr(SYS_MAX_TIMESTAMP) + ''')';
 AccountDataSet.Open;
end;

procedure TFsp_customer.DeleteRecord_S;
var
 id_rate_account : integer;
begin
 if AccountDataSet.RecordCount = 0 then exit;
 if cxDBTreeList1.FocusedNode = NIL then exit;
 if cxDBTreeList1.FocusedNode.Count <> 0 then begin
  MessageBox(handle,PChar(CUSTOMER_CHILD_DETECTION_ERROR),PChar(CUSTOMER_MESSAGE_WARNING), MB_OK or MB_ICONWARNING);
  exit;
 end;
 id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'];
 if MessageBox(handle,PChar(CUSTOMER_DELETE_QUESTION),PChar(CUSTOMER_ACCOUNTS), MB_YESNO or MB_ICONQUESTION)=mrNo
 then exit;
 StoredProc.Transaction := WriteTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(DEL_PROC_S, [id_rate_account]);
 StoredProc.Transaction.Commit;


 AccountDataSet.CacheDelete;
 if AccountDataSet.RecordCount <> 0 then id_rate_account := AccountDataSet['ID_RATE_ACCOUNT'] else id_rate_account := -1;
 SelectAll_S;
 LocateAccount(id_rate_account);
end;

procedure TFsp_customer.AddRecord_S;
var
 id_customer     : longint;
 id_rate_account : integer;
 linkto          : integer;
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
 Fsp_cust_rate_acc_ADD.Caption := CUSTOMER_NEW_ACCOUNT_CONST;
 Fsp_cust_rate_acc_ADD.OKButton1.Visible := true;
 if cxDBTreeList1.FocusedNode = NIL then Fsp_cust_rate_acc_ADD.OKButton2.Enabled := false;

 Fsp_cust_rate_acc_ADD.OKButton1.Caption := CUSTOMER_ADD_CONST;
 Fsp_cust_rate_acc_ADD.OKButton2.Caption := CUSTOMER_ADD_CHILD_CONST;
 Fsp_cust_rate_acc_ADD.Action := saAdd;

 Fsp_cust_rate_acc_ADD.ShowModal;
 if Fsp_cust_rate_acc_ADD.MResult = 'cancel' then exit;

 linkto := -1;
 if AccountDataSet.RecordCount <> 0 then begin
  if Fsp_cust_rate_acc_ADD.MResult = 'ok1' then linkto := AccountDataSet['LINKTO'];
  if Fsp_cust_rate_acc_ADD.MResult = 'ok2' then linkto := AccountDataSet['ID_RATE_ACCOUNT'];
 end;

 id_customer     := CustDataSet['ID_CUSTOMER'];
 id_rate_account := 0;
 rate_account    := Fsp_cust_rate_acc_ADD.AccountEdit.Text;
 id_bank         := Fsp_cust_rate_acc_ADD.id_bank;
 id_type_account := Fsp_cust_rate_acc_ADD.id_type_account;
 use_beg         := now;
 use_end         := SYS_MAX_TIMESTAMP;

 SetLength(Vals, 5);
 Vals[0]  := id_customer;
 Vals[1]  := linkto;
 Vals[2]  := rate_account;
 Vals[3]  := id_bank;
 Vals[4]  := id_type_account;

 StoredProc.Transaction := WriteTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(ADD_PROC_S, vals);
 StoredProc.Transaction.Commit;

 SelectAll_S;
 LocateAccount(id_rate_account);

 Fsp_cust_rate_acc_ADD.Free;
end;

procedure TFsp_customer.ModRecord_S;
var
 id_customer     : longint;
 id_rate_account : integer;
 linkto          : integer;
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
 Fsp_cust_rate_acc_ADD.Caption := CUSTOMER_MOD_CONST;
 Fsp_cust_rate_acc_ADD.OKButton1.Visible := false;
 Fsp_cust_rate_acc_ADD.OKButton2.Caption := CUSTOMER_MOD_CONST;

 Fsp_cust_rate_acc_ADD.id_bank              := id_bank;
 Fsp_cust_rate_acc_ADD.id_type_account      := id_type_account;
 Fsp_cust_rate_acc_ADD.AccountEdit.Text     := rate_account;
 Fsp_cust_rate_acc_ADD.Action := saMod;

 Fsp_cust_rate_acc_ADD.ShowModal;
 if Fsp_cust_rate_acc_ADD.MResult = 'cancel' then exit;

 rate_account    := Fsp_cust_rate_acc_ADD.AccountEdit.Text;
 id_bank         := Fsp_cust_rate_acc_ADD.id_bank;
 id_type_account := Fsp_cust_rate_acc_ADD.id_type_account;
 use_beg         := now;
 use_end         := SYS_MAX_TIMESTAMP;

 SetLength(Vals, 6);
 Vals[0]  := id_customer;
 Vals[1]  := id_rate_account;
 Vals[2]  := linkto;
 Vals[3]  := rate_account;
 Vals[4]  := id_bank;
 Vals[5]  := id_type_account;

 StoredProc.Transaction := WriteTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(MOD_PROC_S, vals);
 StoredProc.Transaction.Commit;

 Fsp_cust_rate_acc_ADD.Free;

 SelectAll_S;
 LocateAccount(id_rate_account);
end;


procedure TFsp_customer.SelectAll;
begin



 Application.ProcessMessages;


 CustDataSet.Active := false;
 CustDataSet.SQLS.SelectSQL.Text := GetMainCustSqlText;
 CustDataSet.Active := true;


 SelectAll_S;
 SelectAll_Peoples;

end;

procedure TFsp_customer.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
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
 id_customer : longint;
begin
 if CustDataSet.RecordCount = 0 then exit;
 id_customer := CustDataSet['ID_CUSTOMER'];
 if MessageBox(handle,PChar(CUSTOMER_DELETE_QUESTION),PChar(CUSTOMER_AGENTS), MB_YESNO or MB_ICONQUESTION)=mrYes
 then begin
 StoredProc.Transaction := WriteTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_SP_CUSTOMER_DEL', [id_customer]);
 StoredProc.Transaction.Commit;


 id_customer := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := id_customer;
 CustDataSet.CacheDelete;
 if CustDataSet.RecordCount <> 0 then id_customer := CustDataSet['ID_CUSTOMER'] else id_customer := -1;
 SelectAll;
 LocateCustomer(id_customer);
 end;
end;

procedure TFsp_customer.AddButtonClick(Sender: TObject);
begin
 AddRecord;
end;

procedure TFsp_customer.AddRecord;
var
 id_customer        : longint;
 id_higher_instance : integer;
 id_branch          : integer;
 name_customer      : string;
 kod_edrpou         : string;
 date_nns           : TDateTime;
 nns                : string;
 nalog_nom          : string;
 id_address         : integer;
 fiz_lico           : integer;
 use_beg            : TDateTime;
 use_end            : TDateTime;
 short_name         : string;
 id_department      : integer;
 plat_nds           : integer;
 vals               : array of Variant;
 Fsp_customer_ADD   : TFsp_customer_ADD;
begin

 Fsp_customer_ADD   := TFsp_customer_ADD.Create(Self);
 Fsp_customer_ADD.Caption := CUSTOMER_ADD_CAPTION_CONST;
 Fsp_customer_ADD.OKButton1.Visible := true;
 Fsp_customer_ADD.Action := saAdd;
 Fsp_customer_ADD.id_branch := -1;

  if Fsp_customer_ADD.ShowModal <> mrCancel then begin
  short_name         := Fsp_customer_ADD.ShortNameEdit.Text;
  name_customer      := Fsp_customer_ADD.NameEdit.Text;
  kod_edrpou         := Fsp_customer_ADD.edrpouEdit.Text;
  nns                := Fsp_customer_ADD.nnsEdit.Text;
  date_nns           := TDateTime(Fsp_customer_ADD.DatennsEdit.Date);
  nalog_nom          := Fsp_customer_ADD.NalogEdit.Text;
  id_higher_instance := Fsp_customer_ADD.id_higher_instance;
  id_branch          := Fsp_customer_ADD.id_branch;
  id_address         := Fsp_customer_ADD.id_address;
  id_department      := Fsp_customer_ADD.id_department;
  if Fsp_customer_ADD.FizLicoCheck.Checked then fiz_lico := 1 else fiz_lico := 0;
  if Fsp_customer_ADD.PlatNdsCheck.Checked then plat_nds := 1 else plat_nds := 0;

  use_beg     := now;
  use_end     := SYS_MAX_TIMESTAMP;

  SetLength(Vals, 11);
  Vals[0] := id_higher_instance;
  Vals[1] := name_customer;
  Vals[2] := kod_edrpou;
  Vals[3] := date_nns;
  Vals[4] := nns;
  Vals[5] := nalog_nom;
  Vals[6] := fiz_lico;
  Vals[7] := short_name;
  Vals[8] := plat_nds;
  Vals[9] := id_branch;
  Vals[10]:= id_address;
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure(ADD_PROC, vals);
  id_customer:=StoredProc.ParamByName('ID_CUSTOMER').AsInteger;
  StoredProc.Transaction.Commit;

  SelectAll;
  LocateCustomer(id_customer);
 end;

  Fsp_customer_ADD.Free;
end;

procedure TFsp_customer.ModRecord;
var
 id_customer        : longint;
 id_higher_instance : integer;
 id_branch          : integer;
 name_customer      : string;
 kod_edrpou         : string;
 date_nns           : TDateTime;
 nns                : string;
 nalog_nom          : string;
 id_address         : integer;
 fiz_lico           : integer;
 use_beg            : TDateTime;
 use_end            : TDateTime;
 short_name         : string;
 id_department      : integer;
 vals               : array of Variant;
 plat_nds           : integer;
 branch_dataset     : TpFibdataSet;
 Fsp_customer_ADD : TFsp_customer_ADD;
begin
 if CustDataSet.RecordCount = 0 then exit;

 id_customer        := CustDataSet['ID_CUSTOMER'];
 id_higher_instance := CustDataSet['ID_HIGHER_INSTANCE'];
 id_branch          := CustDataSet['ID_BRANCH'];
 name_customer      := CustDataSet['NAME_CUSTOMER'];
 kod_edrpou         := CustDataSet['KOD_EDRPOU'];
 date_nns           := StrToDateTime(CustDataSet['DATE_NNS']);
 nns                := CustDataSet['NNS'];
 id_address         := CustDataSet['ID_ADRESS'];
 nalog_nom          := CustDataSet['NALOG_NOM'];
 fiz_lico           := CustDataSet['FIZ_LICO'];
 plat_nds           := CustDataSet['PLAT_NDS'];
 short_name         := CustDataSet['SHORT_NAME'];

 Fsp_customer_ADD := TFsp_customer_ADD.Create(Self);
 Fsp_customer_ADD.Caption := CUSTOMER_UPD_CAPTION_CONST;

 if ViewRecord then begin
  Fsp_customer_ADD.DisableControls;
  Fsp_customer_ADD.OKButton1.Visible := false;
 end;

 Fsp_customer_ADD.PlatNdsCheck.Checked   := plat_nds = 1;
 Fsp_customer_ADD.id_higher_instance := id_higher_instance;
 Fsp_customer_ADD.id_branch          := id_branch;
 Fsp_customer_ADD.id_address         := id_address;
 Fsp_customer_ADD.id_department := id_department;
 Fsp_customer_ADD.NameEdit.Text      := name_customer;
 Fsp_customer_ADD.ShortNameEdit.Text := short_name;
 Fsp_customer_ADD.edrpouEdit.Text    := kod_edrpou;
 Fsp_customer_ADD.DatennsEdit.Date  := TDateTime(date_nns);
 Fsp_customer_ADD.nnsEdit.Text       := nns;
 Fsp_customer_ADD.NalogEdit.Text     := nalog_nom;
 Fsp_customer_ADD.FizLicoCheck.Checked := fiz_lico = 1;
 Fsp_customer_ADD.Action := saMod;

 Fsp_customer_ADD.Action := saMod;



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


 if Fsp_customer_ADD.ShowModal <> mrCancel then begin

  name_customer      := Fsp_customer_ADD.NameEdit.Text;
  short_name         := Fsp_customer_ADD.ShortNameEdit.Text;
  kod_edrpou         := Fsp_customer_ADD.edrpouEdit.Text;
  nns                := Fsp_customer_ADD.nnsEdit.Text;
  date_nns           := TDateTime(Fsp_customer_ADD.DatennsEdit.Date);
  nalog_nom          := Fsp_customer_ADD.NalogEdit.Text;
  id_higher_instance := Fsp_customer_ADD.id_higher_instance;
  id_branch          := Fsp_customer_ADD.id_branch;
  id_address         := Fsp_customer_ADD.id_address;
  if Fsp_customer_ADD.FizLicoCheck.Checked then fiz_lico := 1 else fiz_lico := 0;
  if Fsp_customer_ADD.PlatNdsCheck.Checked then plat_nds := 1 else plat_nds := 0;

  use_beg  := now;
  use_end  := SYS_MAX_TIMESTAMP;

  SetLength(Vals, 12);
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

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure(MOD_PROC, vals);
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
 if Assigned(FilterForm) then FreeandNil(FilterForm);
 PeopleDataSet.Active := false;
 Action := caFree;
end;

procedure TFsp_customer.N4Click(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_customer.RefreshButtonClick(Sender: TObject);
var
 id_customer : integer;
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

procedure TFsp_customer.LocateCustomer(const id_customer : integer);
begin
 CustDataSet.Locate('ID_CUSTOMER', id_customer, [loCaseInsensitive]);
end;

procedure TFsp_customer.AddButton3Click(Sender: TObject);
var
 customer : integer;
 id_cust_men : integer;
 fsp_customer_form_people_add:Tfsp_customer_form_people_add;
begin
 if CustDataSet.RecordCount = 0 then exit;
 customer := CustDataSet['ID_CUSTOMER'];

 fsp_customer_form_people_add := Tfsp_customer_form_people_add.Create(Self);
 fsp_customer_form_people_add.Position := poOwnerFormCenter;
 fsp_customer_form_people_add.Caption := CUSTOMER_NEW_PEOPLE_CONST;
 if fsp_customer_form_people_add.ShowModal = mrOK then begin
  StoredProc.Transaction := ReadTransaction;

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_CUST_MEN_ADD', [customer, fsp_customer_form_people_add.id_type_men, fsp_customer_form_people_add.FamiliaEdit.Text, fsp_customer_form_people_add.ImyaEdit.Text, fsp_customer_form_people_add.OtchestvoEdit.Text, fsp_customer_form_people_add.NotesMemo.Text]);
  id_cust_men:=StoredProc.ParamByName('ID_CUST_MEN').AsInteger;
  StoredProc.Transaction.Commit;

  SelectAll_Peoples;
  LocateMan(id_cust_men);
 end;
end;

procedure TFsp_customer.DelButton3Click(Sender: TObject);
var
 customer    : integer;
 id_cust_men : integer;
begin
 if CustDataSet.RecordCount = 0 then exit;
 if PeopleDataSet.RecordCount = 0 then exit;
 customer := CustDataSet['ID_CUSTOMER'];
 id_cust_men := PeopleDataSet['ID_CUST_MEN'];
 if MessageBox(handle,PChar(CUSTOMER_DELETE_QUESTION),PChar(CUSTOMER_CONTACTS), MB_YESNO or MB_ICONQUESTION)=mrYes
 then begin
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_CUST_MEN_DEL', [id_cust_men, customer]);
  StoredProc.Transaction.Commit;

  id_cust_men := cxGrid1DBTableView1.Controller.FocusedRowIndex;
  SelectAll_Peoples;
  cxGrid1DBTableView1.Controller.FocusedRowIndex := id_cust_men;
 end;
end;


procedure TFsp_customer.EditButton3Click(Sender: TObject);
var
 customer : integer;
 id_cust_men : integer;
 fsp_customer_form_people_add : Tfsp_customer_form_people_add;
begin
 if CustDataSet.RecordCount = 0 then exit;
 if PeopleDataSet.RecordCount = 0 then exit;
 customer := CustDataSet['ID_CUSTOMER'];
 id_cust_men := PeopleDataSet['ID_CUST_MEN'];
 fsp_customer_form_people_add := Tfsp_customer_form_people_add.Create(Self);
 fsp_customer_form_people_add.Position := poOwnerFormCenter;
 fsp_customer_form_people_add.Caption := CUSTOMER_UPDATE_PEOPLE_CONST;
 fsp_customer_form_people_add.TypeMenEdit.Text := PeopleDataSet['NAME_TYPE_MEN'];
 fsp_customer_form_people_add.id_type_men := PeopleDataSet['ID_TYPE_MEN'];
 fsp_customer_form_people_add.ImyaEdit.Text := PeopleDataSet['IMYA'];
 fsp_customer_form_people_add.FamiliaEdit.Text := PeopleDataSet['FAMILIA'];
 fsp_customer_form_people_add.OtchestvoEdit.Text := PeopleDataSet['OTCHESTVO'];
 fsp_customer_form_people_add.NotesMemo.Text := PeopleDataSet['NOTES'];

 if fsp_customer_form_people_add.ShowModal = mrOK then begin
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_CUST_MEN_MOD', [id_cust_men, customer, fsp_customer_form_people_add.id_type_men, fsp_customer_form_people_add.FamiliaEdit.Text, fsp_customer_form_people_add.ImyaEdit.Text, fsp_customer_form_people_add.OtchestvoEdit.Text, fsp_customer_form_people_add.NotesMemo.Text]);
  StoredProc.Transaction.Commit;
  SelectAll_Peoples;
  LocateMan(id_cust_men);
 end;
end;

procedure TFsp_customer.ContactButtonClick(Sender: TObject);
var
 T : Tfsp_cust_contact;
begin
 if CustDataSet.RecordCount = 0 then exit;
 T :=Tfsp_cust_contact.Create(self);
 T.id_customer := CustDataSet['ID_CUSTOMER'];
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
 id_men := PeopleDataSet['ID_MEN'];
 SelectAll_Peoples;
 LocateMan(id_men);
end;

procedure TFsp_customer.FormCreate(Sender: TObject);
begin
 LocateCustomerID := -1;
 LocateAccountID  := -1;
 FirstShow        := true;
 LabelPrim.Caption:=CUSTOMER_LabelPRIM_CONST;
end;


procedure TFsp_customer.cxDBTreeList1FocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
 if AccountDataSet.RecordCount = 0 then exit;
end;

procedure TFsp_customer.RefreshButton2Click(Sender: TObject);
var
 id_rate_account : integer;
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
  SelectAll;
  if LocateCustomerID <> -1 then CustDataSet.Locate('ID_CUSTOMER', LocateCustomerID, [loCaseInsensitive]);
  if LocateAccountID <> -1 then LocateAccount(LocateAccountID);
  LocateCustomerID := -1;
  LocateAccountID := -1;
  FirstShow := false;
 end;
end;

procedure TFsp_customer.N9Click(Sender: TObject);
begin
 PanelLeft.Width := Width - cxSplitter1.Width - 4;
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
if CustDataSet.RecordCount = 0 then begin
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
 SelectAll_Peoples;

end;


procedure TFsp_customer.ChooseButtonClick(Sender: TObject);
begin
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
     ResultValue[7]   :=CustDataSet.FieldByName('ID_ADDRESS').Value;
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
     ResultValue:=VarArrayCreate([0,8],varVariant);
     ResultValue[0]   :=AccountDataSet.FieldByName('ID_CUSTOMER').Value;
     ResultValue[1]   :=AccountDataSet.FieldByName('ID_RATE_ACCOUNT').Value;
     ResultValue[2]   :=AccountDataSet.FieldByName('RATE_ACCOUNT').Value;
     ResultValue[3]   :=AccountDataSet.FieldByName('ID_BANK').Value;
     ResultValue[4]   :=AccountDataSet.FieldByName('ID_TYPE_ACCOUNT').Value;
     ResultValue[5]   :=AccountDataSet.FieldByName('MFO').Value;
     ResultValue[6]   :=AccountDataSet.FieldByName('NAME_BANK').Value;
     ResultValue[7]   :=AccountDataSet.FieldByName('NAME_TYPE_ACCOUNT').Value;
     ResultValue[8]   :=CustDataSet.FieldByName('NAME_CUSTOMER').Value;
     ModalResult:=mrYes;
    end;
  end;
 end;
end;

procedure TFsp_customer.FilterButtonClick(Sender: TObject);
begin
  if FilterForm.ShowModal=mrYes
  then begin
      SelectAll;
  end;
end;

function TFsp_customer.GetMainCustSqlText: String;
var ResSql:String;
    FirstFlag:Boolean;
    datestr:string;
begin
     ResSql:=' SELECT * FROM PUB_SP_CUSTOMER_SEL';
     FirstFlag:=true;

     if Assigned(FilterForm)
     then begin
          if TfrmCustomerFilter(FilterForm).CheckCustTitle.Checked
          then begin
              FirstFlag:=false;
              ResSql:=ResSql+' WHERE NAME_CUSTOMER LIKE '+''''+GlobalSpr.GetSearchTemplate(TfrmCustomerFilter(FilterForm).FilterCustTitle.Text)+'%'+'''';
          end;

          if TfrmCustomerFilter(FilterForm).CheckCustCode.Checked
          then begin
              if FirstFlag
              then ResSql:=ResSql+' WHERE KOD_EDRPOU='+(TfrmCustomerFilter(FilterForm).FilterCustCode.Text)
              else ResSql:=ResSql+' AND KOD_EDRPOU='+(TfrmCustomerFilter(FilterForm).FilterCustCode.Text);
              FirstFlag:=false;
          end;

          if TfrmCustomerFilter(FilterForm).CheckCustIsFiz.Checked
          then begin
              if FirstFlag
              then ResSql:=ResSql+' WHERE IS_FIZ_LICO=1 '
              else ResSql:=ResSql+' AND IS_FIZ_LICO=1 ';
              FirstFlag:=false;
          end;

          if TfrmCustomerFilter(FilterForm).CheckCustNNSDate.Checked
          then begin
              DateTimeToString(datestr,'dd.mm.yyyy',TfrmCustomerFilter(FilterForm).FilterCustomerNNSDate.Date);
              if FirstFlag
              then ResSql:=ResSql+' WHERE DATE_NNS='+''''+datestr+''''
              else ResSql:=ResSql+' AND DATE_NNS='+''''+datestr+'''';
              FirstFlag:=false;
          end;

          if TfrmCustomerFilter(FilterForm).CheckCustNNSNum.Checked
          then begin
              if FirstFlag
              then ResSql:=ResSql+' WHERE NNS LIKE '+''''+GlobalSpr.GetSearchTemplate(TfrmCustomerFilter(FilterForm).FIlterCustomerNNSNum.Text)+'%'+''''
              else ResSql:=ResSql+' AND NNS LIKE '+''''+GlobalSpr.GetSearchTemplate(TfrmCustomerFilter(FilterForm).FIlterCustomerNNSNum.Text)+'%'+'''';
              FirstFlag:=false;
          end;

          if TfrmCustomerFilter(FilterForm).CheckCustPDV.Checked
          then begin
              if FirstFlag
              then ResSql:=ResSql+' WHERE PLAT_NDS=1 '
              else ResSql:=ResSql+' AND PLAT_NDS=1 ';
              FirstFlag:=false;
          end;

     end;

     GetMainCustSqlText:=ResSQL;
end;


procedure TFsp_customer.cxCheckBox1Click(Sender: TObject);
begin
     PanelRight.Visible:=cxCheckBox1.Checked;
     if cxCheckBox1.Checked
     then cxSplitter1.Left:=PanelRight.Left+2;
end;

end.
