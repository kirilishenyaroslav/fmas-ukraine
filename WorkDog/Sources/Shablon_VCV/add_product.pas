{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                      Модуль "Выбор продукции"                                }
{       Выбор продукции, для которой существует цена в прейскурантах в заданном}
{       периоде                                                                }
{                                               ответственный: Андрей Таганский}

unit Add_Product;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, ActnList, FIBQuery, pFIBQuery,
  StdCtrls,  ExtCtrls, cxInplaceContainer, cxTL, cxControls, cxGraphics,
  cxCustomData, cxStyles, cxTextEdit, cxMemo, cxContainer, cxEdit, cxCheckBox,
  Variants, FIBDatabase, pFIBDatabase, dogLoaderUnit, IB_externals,
  cxGridTableView, cxClasses;

type
TResultArray = array of variant;
 TSpravOptions = packed record
  canAdd     : boolean;
  canEdit    : boolean;
  canDelete  : boolean;
  canSelect  : boolean;
  canSelect2 : boolean;
  HideButtons : boolean;
  isModal    : boolean;
  MoveUp     : boolean;
  MoveDown   : boolean;
 end;

  TTypeProdRecord = packed record
   _id_Type_Prod   : integer;
   _Name_Type_Prod : string;
   _Link_To        : integer;
   _Order          : integer;
  end;

  TProdRecord = packed record
   _id_Type_Product   : Integer;
   _id_Product        : Integer;
   _id_Cat_Cust       : Integer;
   _Name_Product      : String;
   _Name_Cat_Cust     : String;
   _id_Unit_Meas      : Integer;
   _Name_Unit_Meas    : String;
   _Main_Product      : Boolean;
   _Need_Cat_Cust     : Boolean;
   _Cost_Can_Change   : Boolean;
   _Need_Objects      : Boolean;
   _Cost              : currency;
  end;

  TProdArray     = array of TProdRecord;
  TTypeProdArray = array of TTypeProdRecord;

  TAdd_Product_Form = class(TForm)
    ToolBar1: TToolBar;
    SelectButton: TSpeedButton;
    ExitButton: TSpeedButton;
    ToolButton1: TToolButton;
    ActionList: TActionList;
    ActionSel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    Query: TpFIBQuery;
    RefreshButton: TSpeedButton;
    Panel1: TPanel;
    TreeList: TcxTreeList;
    Name_Column: TcxTreeListColumn;
    id_Type_Product_Column: TcxTreeListColumn;
    id_Product_Column: TcxTreeListColumn;
    id_Cat_Cust_Column: TcxTreeListColumn;
    Name_Unit_Meas_Column: TcxTreeListColumn;
    Main_Product_Column: TcxTreeListColumn;
    Need_Cat_Cust_Column: TcxTreeListColumn;
    Cost_Can_Change_Column: TcxTreeListColumn;
    Need_Objects_Column: TcxTreeListColumn;
    id_Unit_Meas_Column: TcxTreeListColumn;
    MainProdCheck: TcxCheckBox;
    CatCustCheck: TcxCheckBox;
    CostCheck: TcxCheckBox;
    ObjectCheck: TcxCheckBox;
    Cost_Column: TcxTreeListColumn;
    WorkDatabase: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
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
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure TreeListChangeNode(Sender: TObject; OldNode,
      Node: TcxTreeListNode);
    procedure TreeListDblClick(Sender: TObject);
    procedure SelectAll(F_id_Product, F_id_Cat_Cust : integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
   function tagShow(SpravOptions : TSpravOptions; dbhandle, readtrans : PVoid) : TResultArray;
  end;

var
  Add_Product_Form : TAdd_Product_Form;
  Options          : TSpravOptions;
  Date_Beg         : TDate;
  Date_End         : TDate;

implementation


{$R *.DFM}

destructor TAdd_Product_Form.Destroy;
begin
 Add_Product_Form := nil;
 inherited;
end;

function TAdd_Product_Form.tagShow(SpravOptions : TSpravOptions; dbhandle, readtrans : pvoid) : TResultArray;
var
 mr           : integer;
begin
 if Add_Product_Form <> nil then Exit;
 Options := SpravOptions;
 Add_Product_Form := TAdd_Product_Form.Create(Self);
 Add_Product_Form.WorkDatabase.Handle := dbhandle;
 Add_Product_Form.pFIBTransaction1.Handle := readtrans;
 SetLength(Result, 0);
 if Options.isModal then begin
  mr := Add_Product_Form.ShowModal;
  if mr <> mrOK then Exit;
  SetLength(Result, 10);

  if not VarIsNull(Add_Product_Form.TreeList.FocusedNode.Values[2]) then begin
   Result[0] := Add_Product_Form.TreeList.FocusedNode.Values[2]; // id_Product
   Result[1] := Add_Product_Form.TreeList.FocusedNode.Values[0]; // Name_Product
   Result[2] := 0;                                               // id_Cat_Cust
   Result[3] := '';                                              // NameCatCust
   Result[4] := Add_Product_Form.TreeList.FocusedNode.Values[4]; // NameUnitMeas
   Result[5] := Add_Product_Form.TreeList.FocusedNode.Values[6]; // Need_Cat_Cust
   Result[6] := Add_Product_Form.TreeList.FocusedNode.Values[8]; // Need_Objects
   Result[7] := Add_Product_Form.TreeList.FocusedNode.Values[9]; // idUnitMeas
   Result[8] := Add_Product_Form.TreeList.FocusedNode.Values[10];// Cost
  end
  else if not VarIsNull(Add_Product_Form.TreeList.FocusedNode.Values[3]) then begin
   Result[0] := Add_Product_Form.TreeList.FocusedNode.Parent.Values[2]; // id_Product
   Result[1] := Add_Product_Form.TreeList.FocusedNode.Parent.Values[0]; // Name_Product
   Result[2] := Add_Product_Form.TreeList.FocusedNode.Values[3];        // id_Cat_Cust
   Result[3] := Add_Product_Form.TreeList.FocusedNode.Values[0];        // NameCatCust
   Result[4] := Add_Product_Form.TreeList.FocusedNode.Parent.Values[4]; // NameUnitMeas
   Result[5] := Add_Product_Form.TreeList.FocusedNode.Parent.Values[6]; // Need_Cat_Cust
   Result[6] := Add_Product_Form.TreeList.FocusedNode.Parent.Values[8]; // Need_Objects
   Result[7] := Add_Product_Form.TreeList.FocusedNode.Parent.Values[9]; // idUnitMeas
   Result[8] := Add_Product_Form.TreeList.FocusedNode.Values[10];       // Cost
  end
  else Result := nil;
 end
 else begin
  Add_Product_Form.FormStyle := fsMDIChild;
  Add_Product_Form.Show;
 end;
end;

procedure TAdd_Product_Form.ExitButtonClick(Sender: TObject);
begin
 if Options.isModal then ModalResult := mrCancel
 else Close;
end;

procedure TAdd_Product_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TAdd_Product_Form.FormCreate(Sender: TObject);
begin
 if Options.isModal then begin
  BorderStyle := bsSingle;
  BorderIcons := BorderIcons - [biMaximize];
 end
 else begin
  TreeList.Align := alClient;
  BorderStyle := bsSizeable;
 end;
end;

procedure TAdd_Product_Form.SelectButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 if TreeList.FocusedNode.HasChildren then Exit;
 if not VarIsNull(TreeList.FocusedNode.Values[1]) then Exit;
 
 ModalResult   := mrOk;
end;

procedure TAdd_Product_Form.RefreshButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then SelectAll(-1, -1)
 else if VarIsNull(TreeList.FocusedNode.Values[3]) then begin
  if VarIsNull(TreeList.FocusedNode.Values[2]) then
   SelectAll(-1, -1)
  else
   SelectAll(TreeList.FocusedNode.Values[2], -1);
 end
 else SelectAll(TreeList.FocusedNode.Parent.Values[2], TreeList.FocusedNode.Values[3]);
end;

procedure TAdd_Product_Form.TreeListChangeNode(Sender: TObject; OldNode,
  Node: TcxTreeListNode);
begin
 MainProdCheck.Checked := not (VarIsNull(Node.Values[2]) and VarIsNull(Node.Values[3]));
 CatCustCheck.Checked  := not (VarIsNull(Node.Values[2]) and VarIsNull(Node.Values[3]));
 CostCheck.Checked     := not (VarIsNull(Node.Values[2]) and VarIsNull(Node.Values[3]));
 ObjectCheck.Checked   := not (VarIsNull(Node.Values[2]) and VarIsNull(Node.Values[3]));

 MainProdCheck.Enabled := not (VarIsNull(Node.Values[2]) and VarIsNull(Node.Values[3]));
 CatCustCheck.Enabled  := not (VarIsNull(Node.Values[2]) and VarIsNull(Node.Values[3]));
 CostCheck.Enabled     := not (VarIsNull(Node.Values[2]) and VarIsNull(Node.Values[3]));
 ObjectCheck.Enabled   := not (VarIsNull(Node.Values[2]) and VarIsNull(Node.Values[3]));

 if not VarIsNull(Node.Values[2]) then begin
  MainProdCheck.Checked := Node.Values[5];
  CatCustCheck.Checked  := Node.Values[6];
  CostCheck.Checked     := Node.Values[7];
  ObjectCheck.Checked   := Node.Values[8];
 end
 else if not VarIsNull(Node.Values[3]) then begin
  MainProdCheck.Checked := Node.Parent.Values[5];
  CatCustCheck.Checked  := Node.Parent.Values[6];
  CostCheck.Checked     := Node.Parent.Values[7];
  ObjectCheck.Checked   := Node.Parent.Values[8];
 end
 else begin
  MainProdCheck.Checked := False;
  CatCustCheck.Checked  := False;
  CostCheck.Checked     := False;
  ObjectCheck.Checked   := False;
 end;
end;

procedure TAdd_Product_Form.TreeListDblClick(Sender: TObject);
begin
 if SelectButton.Visible then SelectButtonClick(Sender);
end;

procedure TAdd_Product_Form.SelectAll(F_id_Product, F_id_Cat_Cust : integer);

var
 i             : integer;
 TypeProdArray : TTypeProdArray;
 ProdArray     : TProdArray;
 F_Abs_Index   : integer;

 procedure FillTypeProdArray(id_Type_Prod : integer);
 var
  i : integer;
 begin
  Query.Close;
  Query.SQL.Text := 'select * from PROC_SP_TYPE_PRODUCT_SEL_PARENT(' + IntToStr(id_Type_Prod) + ')';
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Exit;
  end;

  if VarIsNull(Query.FieldByName('ID_TYPE_PRODUCT_PARAM').AsVariant) then begin
   Query.Close;
   Exit;
  end;

  for i := 0 to Length(TypeProdArray) - 1 do
   if TypeProdArray[i]._id_Type_Prod = Query.FieldByName('ID_TYPE_PRODUCT_PARAM').AsInteger then begin
    Query.Close;
    Exit;
    Break;
   end;


  SetLength(TypeProdArray, Length(TypeProdArray) + 1);
  with TypeProdArray[Length(TypeProdArray) - 1] do begin
   _id_Type_Prod   := Query.FieldByName('ID_TYPE_PRODUCT_PARAM').AsInteger;
   _Name_Type_Prod := Query.FieldByName('NAME_TYPE_PRODUCT_PARAM').AsString;
   _Link_To        := Query.FieldByName('LINKTO_PARAM').AsInteger;
   _Order          := Query.FieldByName('DISPLAY_ORDER_PARAM').AsInteger;

   if _Link_To >= 0 then FillTypeProdArray(_Link_To);
  end;

  Query.Close;
 end;


 procedure AddTypeProdNode(ANode : TcxTreeListNode; id_Type_Prod : integer);
 var
  i, j  : integer;
  Node  : TcxTreeListNode;
  Child : TcxTreeListNode;
  Flag  : boolean;
  Min   : integer;
  Max   : integer;
 begin
  Min := -2;
  Max := 0;
  for i := 0 to Length(TypeProdArray) - 1 do
   if TypeProdArray[i]._Link_To = id_Type_Prod then begin
    if TypeProdArray[i]._Order > Max then Max := TypeProdArray[i]._Order
    else if TypeProdArray[i]._Order < Min then Min := TypeProdArray[i]._Order;
   end;

  while Min <= Max do begin
   for i := 0 to Length(TypeProdArray) - 1 do
    if (TypeProdArray[i]._Link_To = id_Type_Prod)
    and (TypeProdArray[i]._Order = Min) then begin
     if ANode = nil then
      Node := TreeList.Add
     else
      Node := ANode.AddChild;


     Node.Values[1] := TypeProdArray[i]._id_Type_Prod;
     Node.Values[0] := TypeProdArray[i]._Name_Type_Prod;

     AddTypeProdNode(Node, TypeProdArray[i]._id_Type_Prod);
    end;

   Inc(Min);
  end;

  if id_Type_Prod < 0 then Exit;
  if ANode = nil then Exit;

  for i := 0 to Length(ProdArray) - 1 do
   if ProdArray[i]._id_Type_Product = id_Type_Prod then begin
    if not ProdArray[i]._Need_Cat_Cust then begin
     Node := ANode.AddChild;

     Node.Values[0]  := ProdArray[i]._Name_Product;
     Node.Values[1]  := Null;
     Node.Values[2]  := ProdArray[i]._id_Product;
     Node.Values[3]  := Null;
     Node.Values[4]  := ProdArray[i]._Name_Unit_Meas;
     Node.Values[5]  := ProdArray[i]._Main_Product;
     Node.Values[6]  := ProdArray[i]._Need_Cat_Cust;
     Node.Values[7]  := ProdArray[i]._Cost_Can_Change;
     Node.Values[8]  := ProdArray[i]._Need_Objects;
     Node.Values[9]  := ProdArray[i]._id_Unit_Meas;
     Node.Values[10] := ProdArray[i]._Cost;

     if F_id_Product > 0 then
      if F_id_Product = ProdArray[i]._id_Product then begin
       F_Abs_Index := Node.AbsoluteIndex;
       F_id_Product := -1;
      end;
    end
    else begin
     Flag := True;

     for j := 0 to ANode.Count - 1 do
      if not VarIsNull(ANode.Items[j].Values[2]) then
       if ANode.Items[j].Values[2] = ProdArray[i]._id_Product then begin
        Flag := False;
        Break;
       end;

     if Flag then begin
      Node := ANode.AddChild;

      Node.Values[0]  := ProdArray[i]._Name_Product;
      Node.Values[1]  := Null;
      Node.Values[2]  := ProdArray[i]._id_Product;
      Node.Values[3]  := Null;
      Node.Values[4]  := ProdArray[i]._Name_Unit_Meas;
      Node.Values[5]  := ProdArray[i]._Main_Product;
      Node.Values[6]  := ProdArray[i]._Need_Cat_Cust;
      Node.Values[7]  := ProdArray[i]._Cost_Can_Change;
      Node.Values[8]  := ProdArray[i]._Need_Objects;
      Node.Values[9]  := ProdArray[i]._id_Unit_Meas;
     end
     else Node := ANode.Items[j];


     Child := Node.AddChild;

     Child.Values[0]  := ProdArray[i]._Name_Cat_Cust;
     Child.Values[3]  := ProdArray[i]._id_Cat_Cust;
     Child.Values[10] := ProdArray[i]._Cost;

     if F_id_Product > 0 then
      if F_id_Product = ProdArray[i]._id_Product then begin
       if (F_id_Cat_Cust > 0) and (F_id_Cat_Cust = ProdArray[i]._id_Cat_Cust) then begin
        F_Abs_Index   := Child.AbsoluteIndex;
        F_id_Product  := -1;
        F_id_Cat_Cust := -1;
       end
       else F_Abs_Index := Node.AbsoluteIndex;
      end;

    end;
   end;
 end;
begin
 if not WorkDatabase.Connected then Exit;
 Query.Close;
 TypeProdArray := nil;
 ProdArray     := nil;

 TreeList.Clear;

 Query.SQL.Text := 'select * from PL_SELECT_PRICES_FOR_PLAN_2('
 + QuotedStr(DateToStr(Date_Beg)) + ',' + QuotedStr(DateToStr(Date_End)) + ')';
 Query.ExecQuery;

 if Query.Eof then begin
  Query.Close;
  Exit;
 end;

 while not Query.Eof do begin
  SetLength(ProdArray, Length(ProdArray) + 1);

  with ProdArray[Length(ProdArray) - 1] do begin
   _id_Type_Product   :=  Query['id_Type_Product'].AsInteger;
   _id_Product        :=  Query['id_Product'].AsInteger;
   _id_Cat_Cust       :=  Query['id_Cat_Cust'].AsInteger;
   _Name_Product      :=  Query['Name_Product'].AsString;
   _Name_Cat_Cust     :=  Query['Name_Cat_Cust'].AsString;
   _Name_Unit_Meas    :=  Query['Name_Unit_Meas'].AsString;
   _Main_Product      := (Query['MAIN_PRODUCT'].AsInteger = 1);
   _Need_Cat_Cust     := (Query['NEED_CAT_CUST'].AsInteger = 1);
   _Cost_Can_Change   := (Query['COST_CAN_CHANGE'].AsInteger = 1);
   _Need_Objects      := (Query['NEED_OBJECTS'].AsInteger = 1);
   _Cost              :=  Query['Cost'].AsCurrency;
  end;

  Query.Next;
 end;
 Query.Close;

 for i := 0 to Length(ProdArray) - 1 do FillTypeProdArray(ProdArray[i]._id_Type_Product);

 if Length(TypeProdArray) = 0 then Exit;

 TreeList.BeginUpdate;
  AddTypeProdNode(nil, -1);
 TreeList.EndUpdate;

 TreeList.Nodes.AbsoluteItems[F_Abs_Index].Focused := True;
end;

procedure TAdd_Product_Form.FormShow(Sender: TObject);
begin
 SelectAll(-1, -1);
 TreeList.SetFocus; 
end;

end.
