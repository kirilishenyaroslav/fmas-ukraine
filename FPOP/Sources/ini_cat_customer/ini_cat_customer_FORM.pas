unit ini_cat_customer_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDatabase, StdCtrls, Db, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  Menus, ActnList, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxTextEdit, FR_DSet, FR_DBSet, FR_Class, cxContainer, ExtCtrls,
  dxBar, dxBarExtItems, FIBDatabase, IBase, cxTL;
const
 TABLE    = 'INI_CAT_CUSTOMER';
 SEL_VIEW = 'SP_INI_CAT_CUSTOMER_SEL';
 ADD_PROC = 'SP_INI_CAT_CUSTOMER_ADD';
 DEL_PROC = 'SP_INI_CAT_CUSTOMER_DEL';
 MOD_PROC = 'SP_INI_CAT_CUSTOMER_MOD';
 GENERATOR_PROC = 'SP_GEN_INI_CAT_CUSTOMER';
 PK_FIELD = 'ID_CAT_CUST_PARAM';

type
  TFini_cat_customer = class(TForm)
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    DataSet: TpFIBDataSet;
    Query: TpFIBQuery;
    ActionList1: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    DBGrid: TcxGrid;
    DBGridLevel1: TcxGridLevel;
    TableView: TcxGridDBTableView;
    ID_CAT_CUSTOMER_Column: TcxGridDBColumn;
    NAME_CAT_CUSTOMER_Column: TcxGridDBColumn;
    ActionExit: TAction;
    ActionRefresh: TAction;
    Report: TfrReport;
    frDataSet: TfrDBDataSet;
    Panel: TPanel;
    SearchEdit: TcxTextEdit;
    Label3: TLabel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    MoveDownButton: TdxBarLargeButton;
    MoveUpButton: TdxBarLargeButton;
    PreviewButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
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
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure MoveButtonClick(Sender: TObject);
    procedure PreviewButtonClick(Sender: TObject);
    function  BeforePrint : boolean;
    procedure PrintButtonClick(Sender: TObject);
    procedure SearchEditPropertiesChange(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
  public
   DB           : TpFIBDataBase;
   OwnerSPObject: TObject;
   function GetMaxID : integer;
   procedure SelectAll;
   procedure DeleteRecord;
   procedure AddRecord;
   procedure ModRecord;
   procedure RefreshDbGrid;
   procedure InitConnection(DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE);
  end;

var
  Fini_cat_customer: TFini_cat_customer;

implementation
uses ini_cat_customer_unit, ini_cat_customer_FORM_ADD,
     tagsys_options, tagBaseTypes, Variants;
{$R *.DFM}

procedure TFini_cat_customer.RefreshDbGrid;
var
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 selected_id := DataSet.FieldByName(PK_FIELD).AsInteger;
 SelectAll;
 while (DataSet.FieldByName(PK_FIELD).Value <> selected_id) do begin
  DataSet.Next;
  if DataSet.eof then break;
 end;
end;

function TFini_cat_customer.GetMaxID : integer;
var
 new_id : string;
begin
 Query.SQL.Text := 'select * from ' + GENERATOR_PROC;
 Query.ExecQuery;
 new_id := IntToStr(SYS_SERVER) + Query.Fields[0].AsString;
 Result := StrToInt(new_id);
 Query.Close;
end;

procedure TFini_cat_customer.SelectAll;
begin
 DataSet.Active := false;
 DataSet.Active := true;
end;

procedure TFini_cat_customer.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure TFini_cat_customer.FormCreate(Sender: TObject);
begin
 DataSet.SQLs.SelectSQL.Text := 'select * from ' + SEL_VIEW;
end;

procedure TFini_cat_customer.DelButtonClick(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_cat_customer.DeleteRecord;
var
 PK_Index : integer;
 selected_index : integer;
begin
 if DataSet.RecordCount = 0 then exit;

 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;

 Query.Close;
 Query.SQL.Text := 'select id_price from dt_cost_product where id_cat_cust='
 + IntToStr(PK_Index) + ' and use_end=' + QuotedStr(DateTimeToStr(SYS_MAX_TIMESTAMP));
 Query.ExecQuery;

 if Query.RecordCount > 0 then begin
  Query.Close;
  ShowMessage('Неможна видалити цю категорію покупця оскільки вона використовується'
  + ' у довіднику тарифів та прейскурантів цін!');
  Exit;
 end
 else Query.Close;

 if MessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 selected_index := TableView.DataController.FocusedRowIndex;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(DEL_PROC, [PK_Index]);
 StoredProc.Transaction.Commit;
 SelectAll;

 TableView.DataController.FocusedRowIndex := selected_index;
end;

procedure TFini_cat_customer.AddButtonClick(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_cat_customer.AddRecord;
var
 PK_Index : integer;
begin
 Fini_cat_customer_ADD := TFini_cat_customer_ADD.Create(Self);
 Fini_cat_customer_ADD.Caption := 'Додати запис';
 Fini_cat_customer_ADD.OKButton.Caption := 'Додати';
 Fini_cat_customer_ADD.ShowModal;
 if Fini_cat_customer_ADD.MResult = 'cancel' then exit;

 PK_Index := GetMaxID;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(ADD_PROC, [PK_Index, Fini_cat_customer_ADD.NameEdit.Text]);
 StoredProc.Transaction.Commit;
 SelectAll;
 while DataSet.FieldByName(PK_FIELD).Value <> PK_INDEX do DataSet.Next;

 Fini_cat_customer_ADD.Free;

 TableView.DataController.LocateByKey(PK_Index);
end;

procedure TFini_cat_customer.ModRecord;
var
 PK_Index : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 Fini_cat_customer_ADD := TFini_cat_customer_ADD.Create(Self);
 Fini_cat_customer_ADD.Caption := 'Змінити запис';
 Fini_cat_customer_ADD.OKButton.Caption := 'Змінити';
 Fini_cat_customer_ADD.NameEdit.Text := DataSet.FieldByName('NAME_CAT_CUST_PARAM').AsString;
 Fini_cat_customer_ADD.ShowModal;
 if Fini_cat_customer_ADD.MResult = 'cancel' then exit;

 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(MOD_PROC, [PK_Index, Fini_cat_customer_ADD.NameEdit.Text]);
 StoredProc.Transaction.Commit;
 SelectAll;
 while DataSet.FieldByName(PK_FIELD).Value <> PK_INDEX do DataSet.Next;

 Fini_cat_customer_ADD.Free;

 TableView.DataController.LocateByKey(PK_Index);
end;

procedure TFini_cat_customer.EditButtonClick(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_cat_customer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFini_cat_customer.FormDestroy(Sender: TObject);
begin
 Tini_cat_customer(OwnerSPObject).FreeObject;
end;

procedure TFini_cat_customer.SelButtonClick(Sender: TObject);
begin
 ModalResult := mrOK;
end;

procedure TFini_cat_customer.ActionModExecute(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_cat_customer.ActionDelExecute(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_cat_customer.ActionAddExecute(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_cat_customer.ActionSelExecute(Sender: TObject);
begin
 if (SelectButton.Enabled) and (SelectButton.Visible = ivAlways) then ModalResult := mrOK;
end;

procedure TFini_cat_customer.N1Click(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_cat_customer.N2Click(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_cat_customer.N3Click(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_cat_customer.N5Click(Sender: TObject);
begin
 RefreshDBGrid;
end;

procedure TFini_cat_customer.N6Click(Sender: TObject);
begin
 if (SelectButton.Enabled) and (SelectButton.Visible = ivAlways) then ModalResult := mrOK;
end;

procedure TFini_cat_customer.RefreshButtonClick(Sender: TObject);
var
 id_Cat_Cust : integer;
begin
 id_Cat_Cust := DataSet['ID_CAT_CUST_PARAM'];

 SelectAll;

 TableView.DataController.LocateByKey(id_Cat_Cust);
end;

procedure TFini_cat_customer.TableViewDblClick(Sender: TObject);
begin
  if (SelectButton.Enabled) and (SelectButton.Visible = ivAlways) then ModalResult := mrOK;
end;

procedure TFini_cat_customer.ActionExitExecute(Sender: TObject);
begin
 ExitButtonClick(Sender);
end;

procedure TFini_cat_customer.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure TFini_cat_customer.MoveButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if DataSet.RecordCount = 0 then Exit;

 Key := DataSet['ID_CAT_CUST_PARAM'];

 if Sender = MoveUpButton then begin
  if TableView.DataController.FocusedRecordIndex = 0 then Exit;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_INI_CAT_CUSTOMER_MOVE', [Key, '-1']);
  StoredProc.Transaction.Commit;
 end
 else if Sender = MoveDownButton then begin
  if TableView.DataController.FocusedRecordIndex = TableView.DataController.RecordCount - 1 then Exit;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_INI_CAT_CUSTOMER_MOVE', [Key, '+1']);
  StoredProc.Transaction.Commit;
 end;

 SelectAll;

 TableView.DataController.LocateByKey(Key);
end;

procedure TFini_cat_customer.PreviewButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.ShowReport;
end;

function TFini_cat_customer.BeforePrint: boolean;
begin
 if TableView.DataController.RecordCount = 0 then begin
  ShowMessage('Неможна друкувати порожній документ!');
  Result := False;
  Exit;
 end;

 if not Report.LoadFromFile('Reports\FPOP\ini_Cat_Customer.frf') then begin
  ShowMessage('Файл звіту [Reports\FPOP\ini_Cat_Customer.frf] не знайдено!');
  Exit;
 end;

 Result := True;
end;

procedure TFini_cat_customer.PrintButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.PrepareReport;
 Report.PrintPreparedReportDlg;
end;

procedure TFini_cat_customer.SearchEditPropertiesChange(Sender: TObject);
begin
 DataSet.Locate('NAME_CAT_CUST_PARAM', SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFini_cat_customer.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then DBGrid.SetFocus;
end;

procedure TFini_cat_customer.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle         := DBhandle;
 ReadTransaction.Handle  := RTransaction;
end;

end.
