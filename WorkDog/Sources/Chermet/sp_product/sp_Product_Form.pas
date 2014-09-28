{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                          Модуль "Справочник продукции"                       }
{       Отображение прдукции в разрезе типов продукции, ее изменение и         }
{       удаление                                                               }
{                                               ответственный: Андрей Таганский}

unit sp_Product_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, Grids, DBGrids, Db, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, ExtCtrls, StdCtrls, Menus, BaseTypes,
  ActnList, cxInplaceContainer, cxTL, cxControls, cxGraphics, cxCustomData,
  cxStyles, cxTextEdit, cxContainer, cxEdit, cxCheckBox, cxMaskEdit,
  cxDBTL, cxTLData, FR_DSet, FR_Class, dxBar, dxBarExtItems, FIBDatabase,
  pFIBDatabase, dogLoaderUnit, IB_Externals;

type
  Tsp_product_form1 = class(TForm)
    StoredProc: TpFIBStoredProc;
    Query: TpFIBQuery;
    Panel1: TPanel;
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
    CheckBox1: TcxCheckBox;
    CheckBox2: TcxCheckBox;
    CheckBox3: TcxCheckBox;
    CheckBox4: TcxCheckBox;
    TreeList: TcxDBTreeList;
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
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
    Report: TfrReport;
    RowDataset: TfrUserDataset;
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
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   id_Prod          : integer;
   Name_Prod        : string;
   input, output    : TSpravParams;
   destructor Destroy; override;
   function tagShow(SpravOptions : TSpravOptions) : TResultArray;
   function SelectAll : integer;
   procedure LocateRecord(Key : integer);
  end;

var
  sp_product_form1 : Tsp_product_form1;
  Options          : TSpravOptions;

  procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;
  exports Load;

implementation

uses Variants, sp_Product_Add;

{$R *.DFM}

procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;
var
 f : Tsp_product_form1;
begin
 f := Tsp_product_form1.Create(Owner);
 f.Input := input^;
 f.output := output^;
 f.WorkDatabase.Handle := PVoid(Integer(input.Values['DataBase']));
 f.ReadTransaction.Handle := PVoid(Integer(input.Values['ReadTransaction']));
 f.WriteTransaction.Handle := PVoid(Integer(input.Values['WriteTransaction']));
 input.ApplyOnForm(f);
 if f.FormStyle = fsNormal then begin
  f.ShowModal;
  f.Free;
 end else f.Show;
end;

destructor Tsp_product_form1.Destroy;
begin
 sp_product_form1 := nil;
 inherited;
end;

function Tsp_product_form1.tagShow(SpravOptions : TSpravOptions) : TResultArray;
var
 mr             : integer;
 idVar          : integer;
 TextVar        : string;
 NeedCatCust    : variant;
 Name_Unit_Meas : string;

 Sprav          : Tsp_product_form1;
begin
 if sp_product_form1 <> nil then
  if not SpravOptions.isModal then begin
   sp_product_form1.Show;
   Exit;
  end;

 Options := SpravOptions;

 SetLength(Result, 0);
 if Options.isModal then begin
  Sprav := Tsp_product_form1.Create(Self);
  mr := Sprav.ShowModal;
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
  sp_product_form1 := Tsp_product_form1.Create(Self);
  sp_product_form1.FormStyle := fsMDIChild;
  sp_product_form1.Show;
 end;
end;

procedure Tsp_product_form1.CloseButtonClick(Sender: TObject);
begin
 output.Values['ModalResult'] := mrCancel;
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure Tsp_product_form1.RefreshButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if  DataSet.RecordCount > 0 then Key := DataSet.Fields[0].AsInteger else Key := -1;

 SelectAll;
 LocateRecord(Key);
end;

procedure Tsp_product_form1.AddButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if sp_Product_Add_Form <> nil then exit;
 Key := 0;

 sp_Product_Add_Form := Tsp_Product_Add_Form.Create(Self);

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
   TreeList.FocusedNode.Parent.Values[0]]);
   StoredProc.Transaction.Commit;
  end
  else if sp_Product_Add_Form.LevelRadioGroup.ItemIndex = 1 then begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_SP_TYPE_PRODUCT_ADD', [sp_Product_Add_Form.NameEdit.Text,
   TreeList.FocusedNode.Values[0]]);
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

procedure Tsp_product_form1.DelButtonClick(Sender: TObject);
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

procedure Tsp_product_form1.EditButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if TreeList.FocusedNode = nil then Exit;
 if sp_Product_Add_Form <> nil then exit;
 Key := TreeList.FocusedNode.Values[0];

 sp_Product_Add_Form := Tsp_Product_Add_Form.Create(Self);
 
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
  sp_Product_Add_Form.NameEdit.Text]);
 end;

 StoredProc.Transaction.Commit;

 SelectAll;
 LocateRecord(Key);
end;

procedure Tsp_product_form1.SelectButtonClick(Sender: TObject);
begin
 if VarIsNull(TreeList.FocusedNode.Values[1]) then Exit;
 output.Values['ID_PRODUCT'] := TreeList.FocusedNode.Values[1];
 output.Values['NAME_PRODUCT'] := TreeList.FocusedNode.Values[2];
 output.Values['ModalResult'] := mrOk;
 ModalResult := mrOk;
end;

procedure Tsp_product_form1.TreeListChangeNode(Sender: TObject; OldNode,
  Node: TcxTreeListNode);
begin
 if Node = nil then Exit;

 if not VarIsNull(Node.Values[1]) then begin
  CheckBox1.Checked := (1 = Node.Values[4]);
  CheckBox2.Checked := (1 = Node.Values[5]);
  CheckBox3.Checked := (1 = Node.Values[6]);
  CheckBox4.Checked := (1 = Node.Values[7]);
 end
 else begin
  CheckBox1.Checked := False;
  CheckBox2.Checked := False;
  CheckBox3.Checked := False;
  CheckBox4.Checked := False;
 end;
end;

procedure Tsp_product_form1.TreeListDblClick(Sender: TObject);
begin
 if SelectButton.Visible = ivAlways then SelectButtonClick(Sender);
end;

procedure Tsp_product_form1.TreeListKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (Key = #13) then SelectButtonClick(Sender);
 if Key = #27 then CloseButtonClick(Sender);
end;

procedure Tsp_product_form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tsp_product_form1.QueryBeforeExecute(Sender: TObject);
begin
 Query.Database := WorkDatabase;
end;

procedure Tsp_product_form1.AddPopupClick(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tsp_product_form1.EditPopupClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tsp_product_form1.DelPopupClick(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tsp_product_form1.RefreshPopupClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tsp_product_form1.SelectPopupClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

procedure Tsp_product_form1.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tsp_product_form1.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tsp_product_form1.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tsp_product_form1.ActionSelExecute(Sender: TObject);
begin
 TreeListDblClick(Sender);
end;

procedure Tsp_product_form1.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tsp_product_form1.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

function Tsp_product_form1.SelectAll : integer;
begin
 if not WorkDatabase.Connected then Exit;

 Query.SQL.Text := 'select max(id_type_product) from sp_type_product';
 Query.ExecQuery;
 if not VarIsNull(Query.Fields[0].AsVariant) then Result := Query.Fields[0].AsInteger
 else Result := -1;
 Query.Close;

 DataSet.Close;
 DataSet.Open;
end;

procedure Tsp_product_form1.LocateRecord(Key : integer);
begin
 if Key >= 0 then DataSet.Locate('ID_TYPE_PRODUCT', Key, [loCaseInsensitive]);
end;

procedure Tsp_product_form1.TreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 if AViewInfo.Focused then Exit;
 if not VarIsNull(AViewInfo.Node.Values[1]) and (AViewInfo.Column.ItemIndex = 2) then
  ACanvas.Font.Color := clNavy;
end;

procedure Tsp_product_form1.MoveNode(ADirection: integer;
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

procedure Tsp_product_form1.MoveUpButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 MoveNode(-1, TreeList.FocusedNode);
 RefreshButtonClick(Sender);
end;

procedure Tsp_product_form1.MoveDownButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 MoveNode(+1, TreeList.FocusedNode);
 RefreshButtonClick(Sender);
end;

function Tsp_product_form1.BeforePrint: boolean;
var
 i : integer;
 k : integer;
begin
 if TreeList.Count <= 0 then begin
  ShowMessage('Неможна друкувати порожній документ!');
  Result := False;
  Exit;
 end;

 Report.LoadFromFile('Reports\sp_Product.frf');

 k := 0;
 for i := 0 to TreeList.LastNode.AbsoluteIndex do
  if not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[1]) or not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[2]) then inc(k);

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := k;

 Result := True;
end;

procedure Tsp_product_form1.PreviewButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.ShowReport;
end;

procedure Tsp_product_form1.PrintButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.PrepareReport;
 Report.PrintPreparedReportDlg;
end;

procedure Tsp_product_form1.ReportGetValue(const ParName: String;
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

procedure Tsp_product_form1.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then TreeList.SetFocus;
end;

procedure Tsp_product_form1.SearchEditPropertiesChange(Sender: TObject);
begin
 DataSet.Locate('NAME', SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure Tsp_product_form1.FormShow(Sender: TObject);
begin
 SelectAll;
end;

end.
