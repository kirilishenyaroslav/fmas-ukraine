{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                          Модуль "Справочник продукции"                       }
{       Отображение прдукции в разрезе типов продукции, ее изменение и         }
{       удаление                                                               }
{                                               ответственный: Андрей Таганский}

unit sp_Product;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, Grids, DBGrids, Db, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, ExtCtrls, StdCtrls, Menus, tagBaseTypes,
  ActnList, cxInplaceContainer, cxTL, cxControls, cxGraphics, cxCustomData,
  cxStyles, cxTextEdit, cxContainer, cxEdit, cxCheckBox, cxMaskEdit,
  cxDBTL, cxTLData, FR_DSet, FR_Class, dxBar, dxBarExtItems, cxFilter,
  cxData, cxDataStorage, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGridLevel, cxGrid, cxSplitter, cxCalendar,
  cxCurrencyEdit, FIBDatabase, pFIBDatabase, IBase;

type
  Tsp_Product_Form = class(TForm)
    StoredProc: TpFIBStoredProc;
    Query: TpFIBQuery;
    PopupMenu: TPopupMenu;
    AddPopup: TMenuItem;
    EditPopup: TMenuItem;
    DelPopup: TMenuItem;
    N4: TMenuItem;
    RefreshPopup: TMenuItem;
    SelectPopup: TMenuItem;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    Report: TfrReport;
    RowDataset: TfrUserDataset;
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
    MainPanel: TPanel;
    AddCostButton: TdxBarButton;
    EditCostButton: TdxBarButton;
    DelCostButton: TdxBarButton;
    RefreshCostButton: TdxBarButton;
    CDataSet: TpFIBDataSet;
    TreeList: TcxDBTreeList;
    ID_TYPE_PRODUCT_COLUMN: TcxDBTreeListColumn;
    ID_PRODUCT_COLUMN: TcxDBTreeListColumn;
    NAME_COLUMN: TcxDBTreeListColumn;
    ID_UNIT_MEAS_COLUMN: TcxDBTreeListColumn;
    MAIN_PRODUCT_COLUMN: TcxDBTreeListColumn;
    NEED_CAT_CUST_COLUMN: TcxDBTreeListColumn;
    COST_CAN_CHANGE_COLUMN: TcxDBTreeListColumn;
    NEED_OBJECTS_COLUMN: TcxDBTreeListColumn;
    LINK_TO_PARAM_COLUMN: TcxDBTreeListColumn;
    NAME_UNIT_MEAS_COLUMN: TcxDBTreeListColumn;
    RightPanel: TPanel;
    DockControl: TdxBarDockControl;
    Splitter: TcxSplitter;
    BottomPanel: TPanel;
    Label3: TLabel;
    SearchEdit: TcxTextEdit;
    CheckBox1: TcxCheckBox;
    CheckBox2: TcxCheckBox;
    CheckBox4: TcxCheckBox;
    CheckBox3: TcxCheckBox;
    ID_DEPARTMENT_COLUMN: TcxDBTreeListColumn;
    NAME_DEPARTMENT_COLUMN: TcxDBTreeListColumn;
    CDataSource: TDataSource;
    CTreeList: TcxDBTreeList;
    CTreeListPK_ID: TcxDBTreeListColumn;
    CTreeListID_CAT_CUST: TcxDBTreeListColumn;
    CTreeListNAME_FIELD: TcxDBTreeListColumn;
    CTreeListDISPLAY_ORDER: TcxDBTreeListColumn;
    CTreeListQNT_UNIT_MEAS: TcxDBTreeListColumn;
    CTreeListCOST: TcxDBTreeListColumn;
    CTreeListCOST_NDS: TcxDBTreeListColumn;
    CTreeListDATE_END: TcxDBTreeListColumn;
    CTreeListLINK_TO: TcxDBTreeListColumn;
    CTreeListDATE_BEG: TcxDBTreeListColumn;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WTransaction: TpFIBTransaction;
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
    procedure FormCreate(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure TreeListChangeNode(Sender: TObject; OldNode,
      Node: TcxTreeListNode);
    procedure TreeListDblClick(Sender: TObject);
    procedure TreeListKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QueryBeforeExecute(Sender: TObject);
    procedure AddPopupClick(Sender: TObject);
    procedure EditPopupClick(Sender: TObject);
    procedure DelPopupClick(Sender: TObject);
    procedure RefreshPopupClick(Sender: TObject);
    procedure SelectPopupClick(Sender: TObject);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure TreeListCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure MoveNode(ADirection : integer; ANode : TcxTreeListNode);
    procedure MoveUpButtonClick(Sender: TObject);
    procedure MoveDownButtonClick(Sender: TObject); // ADirection: +1 - MoveDawn and -1 - MoveUp
    function  BeforePrint : boolean;
    procedure PreviewButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ReportGetValue(const ParName: String; var ParValue: Variant);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditPropertiesChange(Sender: TObject);
    procedure AddCostButtonClick(Sender: TObject);
    procedure EditCostButtonClick(Sender: TObject);
    procedure DelCostButtonClick(Sender: TObject);
    procedure RefreshCostButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
   id_Prod          : integer;
   Name_Prod        : string;
   function  tagShow(SpravOptions : TSpravOptions) : TResultArray;
   function  SelectAll : integer;
   procedure LocateRecord(Key : integer);
   procedure SelectCosts(id_Product : integer);
   procedure LocateCost(Key : integer);

   procedure InitConnection(DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE);
  end;

var
  sp_Product_Form : Tsp_Product_Form;
  Options          : TSpravOptions;

function Show_sp_Product(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle): variant; stdcall;
exports  Show_sp_Product;

implementation

uses Variants, sp_Product_Add, tagSYS_OPTIONS, dt_Cost_Product_Add, DateUtils;

{$R *.DFM}

function Show_sp_Product(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle): variant; stdcall;
var
 f : Tsp_Product_Form;

 idVar          : integer;
 TextVar        : string;
 NeedCatCust    : variant;
 Name_Unit_Meas : string; 
begin
 if FS = fsNormal then begin
  f := Tsp_Product_Form.Create(AOwner);

  f.InitConnection(DBHandle, RTrans);

  GetFormParams(f);

  f.FormStyle  := FS;

  f.SelectAll;

  if f.ShowModal = mrOk then begin
   Result := VarArrayCreate([0, 4], varVariant);

   idVar          := f.TreeList.FocusedNode.Values[1];
   TextVar        := f.TreeList.FocusedNode.Values[2];
   NeedCatCust    := f.TreeList.FocusedNode.Values[5];
   Name_Unit_Meas := f.TreeList.FocusedNode.Values[9];

   Result := VarArrayCreate([0, 4], varVariant);

   Result[0] := idVar;
   Result[1] := TextVar;
   Result[2] := NeedCatCust;
   Result[3] := Name_Unit_Meas;
  end;

  SetFormParams(f);
 end
 else begin
  F := Tsp_Product_Form.Create(AOwner);
  F.InitConnection(DBHandle, RTrans);

  F.FormStyle  := FS;

  GetFormParams(F);
  f.SelectAll;
 end;
end;

function Tsp_Product_Form.tagShow(SpravOptions : TSpravOptions) : TResultArray;
var
 mr             : integer;
 idVar          : integer;
 TextVar        : string;
 NeedCatCust    : variant;
 Name_Unit_Meas : string;

 Sprav          : Tsp_product_form;
begin
 if sp_product_form <> nil then
  if not SpravOptions.isModal then begin
   sp_product_form.Show;
   Exit;
  end;

 Options := SpravOptions;

 SetLength(Result, 0);
 if Options.isModal then begin
  Sprav := Tsp_product_form.Create(Self);

  GetFormParams(sp_product_form);
  mr := Sprav.ShowModal;
  SetFormParams(sp_product_form);

  if mr = mrOK then begin
   idVar          := Sprav.TreeList.FocusedNode.Values[1];
   TextVar        := Sprav.TreeList.FocusedNode.Values[2];
   NeedCatCust    := Sprav.TreeList.FocusedNode.Values[5];
   Name_Unit_Meas := Sprav.TreeList.FocusedNode.Values[9];

   SetLength(Result, 4);

   Result[0] := idVar;
   Result[1] := TextVar;
   Result[2] := NeedCatCust;
   Result[3] := Name_Unit_Meas;

   Sprav.DataSet.Close;
  end;
 end else begin
  Application.CreateForm(Tsp_product_form, sp_product_form);
  sp_product_form.FormStyle := fsMDIChild;
  GetFormParams(sp_product_form);
  sp_product_form.Show;
 end;
end;

procedure Tsp_Product_Form.FormCreate(Sender: TObject);
begin
 if Options.isModal then begin
  BorderStyle := bsSingle;
  BorderIcons := BorderIcons - [biMaximize];
 end
 else begin
  BorderStyle := bsSizeable;
 end;

 if Options.canAdd then AddButton.Visible := ivAlways else AddButton.Visible := ivNever;
 if Options.canEdit then EditButton.Visible := ivAlways else EditButton.Visible := ivNever;
 if Options.canDelete then DelButton.Visible := ivAlways else DelButton.Visible := ivNever;
 if Options.MoveUp then MoveUpButton.Visible := ivAlways else MoveUpButton.Visible := ivNever;
 if Options.MoveDown then MoveDownButton.Visible := ivAlways else MoveDownButton.Visible := ivNever;
 if Options.canSelect then SelectButton.Visible := ivAlways else SelectButton.Visible := ivNever;
 BarManager.Bars[0].Visible := not(Options.HideButtons);

 AddPopup.Visible    := Options.canAdd;
 SelectPopup.Visible := Options.canSelect;
 EditPopup.Visible   := Options.canEdit;
 DelPopup.Visible    := Options.canDelete;
end;

procedure Tsp_Product_Form.CloseButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure Tsp_Product_Form.RefreshButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if  DataSet.RecordCount > 0 then Key := DataSet.Fields[0].AsInteger else Key := -1;

 SelectAll;
 LocateRecord(Key);
end;

procedure Tsp_Product_Form.AddButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if sp_Product_Add_Form <> nil then exit;
 Key := 0;

 Application.CreateForm(Tsp_Product_Add_Form, sp_Product_Add_Form);

 sp_Product_Add_Form.is_Edit := False;

 if TreeList.FocusedNode = nil then begin
  sp_Product_Add_Form.KindRadioGroup.ItemIndex := 0;
  sp_Product_Add_Form.KindRadioGroup.Enabled   := False;

  sp_Product_Add_Form.LevelRadioGroup.ItemIndex := 0;
  sp_Product_Add_Form.LevelRadioGroup.Enabled   := False;
 end
 else if not VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  sp_Product_Add_Form.KindRadioGroup.ItemIndex := 1;
  sp_Product_Add_Form.KindRadioGroup.Enabled   := True;

  sp_Product_Add_Form.LevelRadioGroup.ItemIndex := 0;
  sp_Product_Add_Form.LevelRadioGroup.Enabled   := False;
 end
 else begin
  sp_Product_Add_Form.KindRadioGroup.ItemIndex := 0;
  sp_Product_Add_Form.KindRadioGroup.Enabled   := True;

  sp_Product_Add_Form.LevelRadioGroup.ItemIndex := 0;
  sp_Product_Add_Form.LevelRadioGroup.Enabled   := True;
 end;


 if sp_Product_Add_Form.ShowModal <> mrOk then Exit;


 if sp_Product_Add_Form.KindRadioGroup.ItemIndex = 0  then begin
  if sp_Product_Add_Form.LevelRadioGroup.ItemIndex = 0 then begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_SP_TYPE_PRODUCT_ADD', [sp_Product_Add_Form.NameEdit.Text,
   TreeList.FocusedNode.Parent.Values[0], sp_Product_Add_Form.id_Department]);
   StoredProc.Transaction.Commit;
  end
  else if sp_Product_Add_Form.LevelRadioGroup.ItemIndex = 1 then begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_SP_TYPE_PRODUCT_ADD', [sp_Product_Add_Form.NameEdit.Text,
   TreeList.FocusedNode.Values[0], sp_Product_Add_Form.id_Department]);
   StoredProc.Transaction.Commit;
  end;

  if not VarIsNull(StoredProc.Fields[0].AsVariant) then Key := StoredProc.Fields[0].AsInteger;
  SelectAll;
 end
 else if sp_Product_Add_Form.KindRadioGroup.ItemIndex = 1 then begin
  if sp_Product_Add_Form.LevelRadioGroup.ItemIndex = 0 then begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_SP_PRODUCT_ADD', [sp_Product_Add_Form.id_unit_meas,
   TreeList.FocusedNode.Parent.Values[0], sp_Product_Add_Form.NameEdit.Text,
   Integer(sp_Product_Add_Form.CheckBox1.EditValue), Integer(sp_Product_Add_Form.CheckBox2.EditValue),
   Integer(sp_Product_Add_Form.CheckBox3.EditValue), Integer(sp_Product_Add_Form.CheckBox4.EditValue)]);
   StoredProc.Transaction.Commit;
  end
  else if sp_Product_Add_Form.LevelRadioGroup.ItemIndex = 1 then begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_SP_PRODUCT_ADD', [sp_Product_Add_Form.id_unit_meas,
   TreeList.FocusedNode.Values[0], sp_Product_Add_Form.NameEdit.Text,
   Integer(sp_Product_Add_Form.CheckBox1.EditValue), Integer(sp_Product_Add_Form.CheckBox2.EditValue),
   Integer(sp_Product_Add_Form.CheckBox3.EditValue), Integer(sp_Product_Add_Form.CheckBox4.EditValue)]);
   StoredProc.Transaction.Commit;
  end;

  if not VarIsNull(StoredProc.Fields[0].AsVariant) then Key := SelectAll + StoredProc.Fields[0].AsInteger;
 end;

 LocateRecord(Key);
end;

procedure Tsp_Product_Form.DelButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if TreeList.FocusedNode = nil then Exit;

 if TreeList.FocusedNode.Count > 0 then begin
  ShowMessage('Спочатку ви повинні знищити усю продукцію, що належить до цього типу продукції.');
  exit;
 end;

 if VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  if MessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цей тип продукції?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_SP_TYPE_PRODUCT_DEL', [TreeList.FocusedNode.Values[0]]);
  StoredProc.Transaction.Commit;
 end
 else begin
  Query.Close;
  Query.SQL.Text := 'select id_price from dt_cost_product where id_product='
  + IntToStr(TreeList.FocusedNode.Values[1]) + ' and use_end=' + QuotedStr(DateTimeToStr(SYS_MAX_TIMESTAMP));
  Query.ExecQuery;

  if Query.RecordCount > 0 then begin
   Query.Close;
   ShowMessage('Неможна видалити цю продукцію оскільки вона використовується'
   + ' у довіднику тарифів та прейскурантів цін!');
   Exit;
  end
  else Query.Close;

  if MessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цю продукцію?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_SP_PRODUCT_DEL', [TreeList.FocusedNode.Values[1]]);
  StoredProc.Transaction.Commit;
 end;


 Key := 0;

 if TreeList.FocusedNode.Parent = nil then begin
  if TreeList.FocusedNode.GetNextSibling <> nil then Key := TreeList.FocusedNode.GetNextSibling.Values[0]
  else if TreeList.FocusedNode.GetPrevSibling <> nil then Key := TreeList.FocusedNode.GetPrevSibling.Values[0];
 end
 else if TreeList.FocusedNode.Parent.Count = 1 then begin
  Key := TreeList.FocusedNode.Parent.Values[0];
 end
 else if TreeList.FocusedNode.Parent.Count > 0 then begin
  if TreeList.FocusedNode.GetNextSibling <> nil then
    Key := TreeList.FocusedNode.GetNextSibling.Values[0]
  else if TreeList.FocusedNode.GetPrevSibling <> nil then
    Key := TreeList.FocusedNode.GetPrevSibling.Values[0];
 end;

 SelectAll;
 LocateRecord(Key);

end;

procedure Tsp_Product_Form.EditButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if TreeList.FocusedNode = nil then Exit;
 if sp_Product_Add_Form <> nil then exit;
 Key := TreeList.FocusedNode.Values[0];

 Application.CreateForm(Tsp_Product_Add_Form, sp_Product_Add_Form);
 
 sp_Product_Add_Form.is_Edit := True;

 sp_Product_Add_Form.CheckBox1.EditValue := TreeList.FocusedNode.Values[4];
 sp_Product_Add_Form.CheckBox2.EditValue := TreeList.FocusedNode.Values[5];
 sp_Product_Add_Form.CheckBox3.EditValue := TreeList.FocusedNode.Values[6];
 sp_Product_Add_Form.CheckBox4.EditValue := TreeList.FocusedNode.Values[7];

 if not VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  sp_Product_Add_Form.KindRadioGroup.ItemIndex  := 1;
  sp_Product_Add_Form.KindRadioGroup.Enabled    := False;

  sp_Product_Add_Form.LevelRadioGroup.ItemIndex := -1;
  sp_Product_Add_Form.LevelRadioGroup.Enabled   := False;

  sp_Product_Add_Form.NameEdit.Text             := TreeList.FocusedNode.Values[2];
  sp_Product_Add_Form.NameUnitMeasEdit.Text     := TreeList.FocusedNode.Values[9];
  sp_Product_Add_Form.id_unit_meas              := TreeList.FocusedNode.Values[3];
 end
 else begin
  sp_Product_Add_Form.KindRadioGroup.ItemIndex  := 0;
  sp_Product_Add_Form.KindRadioGroup.Enabled    := False;

  sp_Product_Add_Form.LevelRadioGroup.ItemIndex := -1;
  sp_Product_Add_Form.LevelRadioGroup.Enabled   := False;

  sp_Product_Add_Form.NameEdit.Text             := TreeList.FocusedNode.Values[2];

  if not VarIsNull(TreeList.FocusedNode.Values[11]) then sp_Product_Add_Form.NameDepartmentEdit.Text := TreeList.FocusedNode.Values[11];
  if not VarIsNull(TreeList.FocusedNode.Values[10]) then sp_Product_Add_Form.id_Department           := TreeList.FocusedNode.Values[10];
 end;


 if sp_Product_Add_Form.ShowModal <> mrOk then Exit;

 StoredProc.Transaction.StartTransaction;

 if not VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  StoredProc.ExecProcedure('SP_SP_PRODUCT_MODIFY', [TreeList.FocusedNode.Values[1],
  sp_Product_Add_Form.id_unit_meas,  sp_Product_Add_Form.NameEdit.Text,
  Integer(sp_Product_Add_Form.CheckBox1.EditValue), Integer(sp_Product_Add_Form.CheckBox2.EditValue),
  Integer(sp_Product_Add_Form.CheckBox3.EditValue), Integer(sp_Product_Add_Form.CheckBox4.EditValue)]);
 end
 else begin
  StoredProc.ExecProcedure('SP_SP_TYPE_PRODUCT_MODIFY', [TreeList.FocusedNode.Values[0],
  sp_Product_Add_Form.NameEdit.Text, sp_Product_Add_Form.id_Department]);
 end;

 StoredProc.Transaction.Commit;

 SelectAll;
 LocateRecord(Key);
end;

procedure Tsp_Product_Form.SelectButtonClick(Sender: TObject);
begin
 if VarIsNull(TreeList.FocusedNode.Values[1]) then Exit;
 id_Prod     := TreeList.FocusedNode.Values[1];
 Name_Prod   := TreeList.FocusedNode.Values[2];
 ModalResult := mrOk;
end;

procedure Tsp_Product_Form.TreeListChangeNode(Sender: TObject; OldNode,
  Node: TcxTreeListNode);
begin
 CDataSet.Close;

 if Node = nil then Exit;

 if not VarIsNull(Node.Values[1]) then begin
  CheckBox1.Checked := (1 = Node.Values[4]);
  CheckBox2.Checked := (1 = Node.Values[5]);
  CheckBox3.Checked := (1 = Node.Values[6]);
  CheckBox4.Checked := (1 = Node.Values[7]);

  BarManager.Bars[1].Visible := True;

  CTreeListNAME_FIELD.Visible := (Node.Values[5] = 1);

  SelectCosts(Node.Values[1]);
 end
 else begin
  BarManager.Bars[1].Visible := False;

  CheckBox1.Checked := False;
  CheckBox2.Checked := False;
  CheckBox3.Checked := False;
  CheckBox4.Checked := False;
 end;

 if TreeList.FocusedNode <> nil then begin
  if VarIsNull(TreeList.FocusedNode.Values[1]) then begin
   if (SYS_DEF_ID_DEPARTMENT <> 2612) and (TreeList.FocusedNode.Values[10] <> SYS_DEF_ID_DEPARTMENT) then begin
    AddButton.Enabled      := False;
    EditButton.Enabled     := False;
    DelButton.Enabled      := False;
    MoveUpButton.Enabled   := False;
    MoveDownButton.Enabled := False;
   end
   else begin
    AddButton.Enabled      := True;
    EditButton.Enabled     := True;
    DelButton.Enabled      := True;
    MoveUpButton.Enabled   := True;
    MoveDownButton.Enabled := True;
   end;
  end
  else begin
   if (SYS_DEF_ID_DEPARTMENT <> 2612) and (TreeList.FocusedNode.Parent.Values[10] <> SYS_DEF_ID_DEPARTMENT) then begin
    AddButton.Enabled      := False;
    EditButton.Enabled     := False;
    DelButton.Enabled      := False;
    MoveUpButton.Enabled   := False;
    MoveDownButton.Enabled := False;

    AddCostButton.Visible  := ivNever;
    EditCostButton.Visible := ivNever;
    DelCostButton.Visible  := ivNever;
   end
   else begin
    AddButton.Enabled      := True;
    EditButton.Enabled     := True;
    DelButton.Enabled      := True;
    MoveUpButton.Enabled   := True;
    MoveDownButton.Enabled := True;

    AddCostButton.Visible  := ivAlways;
    EditCostButton.Visible := ivAlways;
    DelCostButton.Visible  := ivAlways;
   end;
  end;
 end;
end;

procedure Tsp_Product_Form.TreeListDblClick(Sender: TObject);
begin
 if SelectButton.Visible = ivAlways then SelectButtonClick(Sender);
end;

procedure Tsp_Product_Form.TreeListKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (Key = #13) then SelectButtonClick(Sender);
 if Key = #27 then CloseButtonClick(Sender);
end;

procedure Tsp_Product_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DataSet.Close;
 CDataSet.Close;

 if not (fsModal in FormState) then SetFormParams(Self);

 Action := caFree;
end;

procedure Tsp_Product_Form.QueryBeforeExecute(Sender: TObject);
begin
 Query.Database := Database;
end;

procedure Tsp_Product_Form.AddPopupClick(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tsp_Product_Form.EditPopupClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tsp_Product_Form.DelPopupClick(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tsp_Product_Form.RefreshPopupClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tsp_Product_Form.SelectPopupClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

procedure Tsp_Product_Form.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tsp_Product_Form.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tsp_Product_Form.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tsp_Product_Form.ActionSelExecute(Sender: TObject);
begin
 TreeListDblClick(Sender);
end;

procedure Tsp_Product_Form.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tsp_Product_Form.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

function Tsp_Product_Form.SelectAll : integer;
begin
 Query.SQL.Text := 'select max(id_type_product) from sp_type_product';
 Query.ExecQuery;
 if not VarIsNull(Query.Fields[0].AsVariant) then Result := Query.Fields[0].AsInteger
 else Result := -1;
 Query.Close;

 DataSet.Close;
 DataSet.Open;

 if TreeList.Nodes.Count > 0 then TreeList.Nodes[0].Focused := True;
end;

procedure Tsp_Product_Form.LocateRecord(Key : integer);
begin
 if Key >= 0 then DataSet.Locate('ID_TYPE_PRODUCT', Key, [loCaseInsensitive]);
end;

procedure Tsp_Product_Form.TreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 if AViewInfo.Focused then Exit;
 if not VarIsNull(AViewInfo.Node.Values[1]) and (AViewInfo.Column.ItemIndex = 2) then
  ACanvas.Font.Color := clNavy;
end;

procedure Tsp_Product_Form.MoveNode(ADirection: integer;
  ANode: TcxTreeListNode);
begin
 if ANode = nil then Exit;

 if VarIsNull(ANode.Values[1]) then begin
  if (ANode.AbsoluteIndex = 0) and (ADirection = -1) then Exit;
  if (ANode.GetNext = nil) and (ADirection = +1) then Exit;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_SP_TYPE_PRODUCT_MOVE', [ANode.Values[0], ADirection]);
  StoredProc.Transaction.Commit;
 end
 else begin
  if (ANode.GetNextSibling = nil) and (ADirection = +1) then Exit;
  if (ANode.GetPrevSibling = nil) and (ADirection = -1) then Exit;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_SP_PRODUCT_MOVE', [ANode.Values[1], ADirection]);
  StoredProc.Transaction.Commit;
 end;
end;

procedure Tsp_Product_Form.MoveUpButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 MoveNode(-1, TreeList.FocusedNode);
 RefreshButtonClick(Sender);
end;

procedure Tsp_Product_Form.MoveDownButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 MoveNode(+1, TreeList.FocusedNode);
 RefreshButtonClick(Sender);
end;

function Tsp_Product_Form.BeforePrint: boolean;
var
 i : integer;
 k : integer;
begin
 if TreeList.Count <= 0 then begin
  ShowMessage('Неможна друкувати порожній документ!');
  Result := False;
  Exit;
 end;

 Report.LoadFromFile('Reports\FPOP\sp_Product.frf');

 k := 0;
 for i := 0 to TreeList.LastNode.AbsoluteIndex do
  if not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[1]) or not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[2]) then inc(k);

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := k;

 Result := True;
end;

procedure Tsp_Product_Form.PreviewButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.ShowReport;
end;

procedure Tsp_Product_Form.PrintButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.PrepareReport;
 Report.PrintPreparedReportDlg;
end;

procedure Tsp_Product_Form.ReportGetValue(const ParName: String;
  var ParValue: Variant);
var
 s    : string;
 i    : integer;

 Memo : TfrMemoView;
begin
 if ParName = 'NameProd' then begin
  Memo := TfrMemoView(Report.FindObject('Memo3'));

  s := '';
  for i := 0 to TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Level do s := s + '  ';

  if VarIsNull(TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Values[1]) then
   Memo.Font.Style := Memo.Font.Style - [fsItalic] + [fsBold]
  else
   Memo.Font.Style := Memo.Font.Style + [fsItalic] - [fsBold];

  ParValue := s + TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Values[2];
 end
 else if ParName = 'NameUnitMeas' then begin
  if VarIsNull(TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Values[1]) then
   ParValue := ''
  else
   ParValue := TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Values[9];
 end;
end;

procedure Tsp_Product_Form.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then TreeList.SetFocus;
end;

procedure Tsp_Product_Form.SearchEditPropertiesChange(Sender: TObject);
begin
 DataSet.Locate('NAME', SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure Tsp_Product_Form.SelectCosts(id_Product: integer);
begin
 CDataSet.Close;
 CDataSet.SelectSQL.Text := 'select * from PL_DT_COST_PRODUCT_SEL(' + IntToStr(id_Product) + ') order by LINK_TO, DISPLAY_ORDER, DATE_BEG';
 CDataSet.Open;

 CTreeList.FullExpand;
end;

procedure Tsp_Product_Form.AddCostButtonClick(Sender: TObject);
var
 f : Tdt_Cost_Product_Form_Add;

 id_Product    : integer;
 id_Cat_Cust   : integer;
 Qnt_Unit_Meas : integer;
 Cost          : extended;
 Cost_NDS      : extended;
 Date_Beg      : TDate;
 Date_End      : TDate;
begin
 if VarIsNull(TreeList.FocusedNode.Values[1]) then Exit;

 f := Tdt_Cost_Product_Form_Add.Create(Self);

 f.Caption := 'Додати вартість продукції';

 f._id_product := TreeList.FocusedNode.Values[1];
 f.Name_Product.Text := TreeList.FocusedNode.Values[2];
 f._id_cat_cust := null;
 f.PK_ID        := null;

 f.DateBegEdit.Date := StartOfTheMonth(Now);
 f.DateEndEdit.Date := EndOfTheMonth(Now);

 if TreeList.FocusedNode.Values[5] = 0 then begin
  f._id_cat_cust := null;
  f.Name_Cat_Cust.Text := 'Не потребує категорії споживачів';
  f.Name_Cat_Cust.Properties.Buttons[0].Visible := False;
  f.Name_Cat_Cust.Style.Color := clMoneyGreen;
 end
 else begin
  if CTreeList.FocusedNode <> nil then begin
   if CTreeList.FocusedNode.HasChildren then begin
    f._id_cat_cust       := CTreeList.FocusedNode.Values[1];
    f.Name_Cat_Cust.Text := CTreeList.FocusedNode.Values[2];
   end
   else begin
    f._id_cat_cust       := CTreeList.FocusedNode.Parent.Values[1];
    f.Name_Cat_Cust.Text := CTreeList.FocusedNode.Parent.Values[2];
   end;
  end;
 end;

 f.Name_Unit_Meas.Text := TreeList.FocusedNode.Values[9];

 if f.ShowModal <> mrOk then Exit;

 id_Product    := f._id_product;

 if VarIsNull(f._id_cat_cust) then
  id_Cat_Cust   := 0
 else
  id_Cat_Cust   := f._id_cat_cust;
  
 Qnt_Unit_Meas := f._qnt_unit_meas;
 Cost          := f._cost;
 Cost_NDS      := f._cost_nds;
 Date_Beg      := f._date_beg;
 Date_End      := f._date_end;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PL_DT_COST_PRODUCT_ADD', [id_Product,
 id_Cat_Cust, Qnt_Unit_Meas, Cost, Cost_NDS, Date_Beg, Date_End]);
 StoredProc.Transaction.Commit;

 SelectCosts(TreeList.FocusedNode.Values[1]);

 LocateCost(StoredProc.Fields[0].AsInteger);
end;

procedure Tsp_Product_Form.EditCostButtonClick(Sender: TObject);
var
 f : Tdt_Cost_Product_Form_Add;

 id_Product    : integer;
 id_Cat_Cust   : integer;
 Qnt_Unit_Meas : integer;
 Cost          : extended;
 Cost_NDS      : extended;
 Date_Beg      : TDate;
 Date_End      : TDate;
begin
 if TreeList.FocusedNode = nil then Exit;
 if VarIsNull(TreeList.FocusedNode.Values[1]) then Exit;
 if CTreeList.FocusedNode = nil then Exit;
 if CTreeList.FocusedNode.HasChildren then Exit;

 f := Tdt_Cost_Product_Form_Add.Create(Self);

 f.Caption := 'Змінити вартість продукції';

 f._id_product       := TreeList.FocusedNode.Values[1];
 f.Name_Product.Text := TreeList.FocusedNode.Values[2];

 f.PK_ID              := CTreeList.FocusedNode.Values[0];

 if TreeList.FocusedNode.Values[5] = 1 then begin
  f._id_cat_cust       := CTreeList.FocusedNode.Parent.Values[1];
  f.Name_Cat_Cust.Text := CTreeList.FocusedNode.Parent.Values[2];
 end
 else begin
  f.Name_Cat_Cust.Text := 'Не потребує категорії споживачів';
  f._id_cat_cust       := null;
  f.Name_Cat_Cust.Properties.Buttons[0].Visible := False;
  f.Name_Cat_Cust.Style.Color := clMoneyGreen;
 end;

 f.DateBegEdit.Date   := CTreeList.FocusedNode.Values[7];
 f.DateEndEdit.Date   := CTreeList.FocusedNode.Values[8];
 f.qnt_unit_meas.Text := CTreeList.FocusedNode.Values[4];
 f.Cost.Value         := CTreeList.FocusedNode.Values[5];
 f.TotalEdit.Value    := CTreeList.FocusedNode.Values[6];

 f.CostPropertiesChange(Self);

 f.Name_Unit_Meas.Text := TreeList.FocusedNode.Values[9];

 if f.ShowModal <> mrOk then Exit;

 id_Product    := TreeList.FocusedNode.Values[1];

 if VarIsNull(f._id_cat_cust) then
  id_Cat_Cust   := 0
 else
  id_Cat_Cust   := f._id_cat_cust;

 Qnt_Unit_Meas := f._qnt_unit_meas;
 Cost          := f._cost;
 Cost_NDS      := f._cost_nds;
 Date_Beg      := f._date_beg;
 Date_End      := f._date_end;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PL_DT_COST_PRODUCT_UPD', [f.PK_ID, id_Product,
 id_Cat_Cust, Qnt_Unit_Meas, Cost, Cost_NDS, Date_Beg, Date_End]);
 StoredProc.Transaction.Commit;

 SelectCosts(TreeList.FocusedNode.Values[1]);

 LocateCost(f.PK_ID);
end;

procedure Tsp_Product_Form.DelCostButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 if VarIsNull(TreeList.FocusedNode.Values[1]) then Exit;
 if CTreeList.FocusedNode = nil then Exit;
 if CTreeList.FocusedNode.HasChildren then Exit;

 if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити обраний запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PL_DT_COST_PRODUCT_DEL', [CTreeList.FocusedNode.Values[0]]);
 StoredProc.Transaction.Commit;

 SelectCosts(TreeList.FocusedNode.Values[1]);
end;

procedure Tsp_Product_Form.RefreshCostButtonClick(Sender: TObject);
var
 Key : integer;
begin
 Key := -1;

 if CTreeList.FocusedNode <> nil then Key := CTreeList.FocusedNode.Values[1];

 SelectCosts(TreeList.FocusedNode.Values[1]);

 LocateCost(Key);
end;

procedure Tsp_Product_Form.LocateCost(Key: integer);
begin
 CTreeList.DataController.LocateByKey(Key);
end;

procedure Tsp_Product_Form.FormResize(Sender: TObject);
begin
// RightPanel.Width := Trunc(Width / 2);
end;

procedure Tsp_Product_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle      := DBhandle;
 ReadTransaction.Handle  := RTransaction;
end;

end.
