unit dt_Pair_Scheme;
{
  in InputTreeList and OutputTreeList State_Column store values
   0 - not modified;
   1 - added;
   2 - modified.
   Deleted node's id_Pair stores in DeletedArray
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  Db, FIBDataSet, pFIBDataSet, tagBaseTypes, DataModule, tagSYS_Options, cxInplaceContainer,
  cxTL, cxControls, cxGraphics, cxCustomData, cxStyles, cxTextEdit,
  cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, StdCtrls, cxCheckBox,
  cxSplitter, ActnList, cxDBTL, cxTLData, dxBar, dxBarExtItems;

type
  Tdt_Pair_Scheme_Form = class(TForm)
    MainPanel: TPanel;
    RightPanel: TPanel;
    LeftPanel: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Query: TpFIBQuery;
    StoredProc: TpFIBStoredProc;
    InputTreeList: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn8: TcxTreeListColumn;
    OutputTreeList: TcxTreeList;
    cxTreeList1cxTreeListColumn9: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn10: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn11: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn12: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn13: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn14: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn15: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn16: TcxTreeListColumn;
    CentralPanel: TPanel;
    Query1: TpFIBQuery;
    Splitter: TcxSplitter;
    Splitter1: TcxSplitter;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    TreeList: TcxDBTreeList;
    ID_TYPE_OBJECT_COLUMN: TcxDBTreeListColumn;
    ID_OBJECT_COLUMN: TcxDBTreeListColumn;
    NAME_COLUMN: TcxDBTreeListColumn;
    LINKTO_COLUMN: TcxDBTreeListColumn;
    ID_DEPARTMENT_COLUMN: TcxDBTreeListColumn;
    NAME_DEPARTMENT_COLUMN: TcxDBTreeListColumn;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    FOR_PLAN_COLUMN: TcxDBTreeListColumn;
    BarManager: TdxBarManager;
    dxBarButton1: TdxBarButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    InBarDockControl: TdxBarDockControl;
    OutBarDockControl: TdxBarDockControl;
    AddInputButton: TdxBarButton;
    CancelInputButton: TdxBarButton;
    SaveInputButton: TdxBarButton;
    DelInputButton: TdxBarButton;
    EditInputButton: TdxBarButton;
    AddOutputButton: TdxBarButton;
    CancelOutputButton: TdxBarButton;
    SaveOutputButton: TdxBarButton;
    DelOutputButton: TdxBarButton;
    EditOutputButton: TdxBarButton;
    procedure SelectInput;
    procedure SelectOutput;
    procedure DelInputButtonClick(Sender: TObject);
    procedure DelOutputButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddInputButtonClick(Sender: TObject);
    procedure EditInputButtonClick(Sender: TObject);
    procedure AddOutputButtonClick(Sender: TObject);
    procedure EditOutputButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TreeListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure ActionExitExecute(Sender: TObject);
    procedure TreeListCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure FormResize(Sender: TObject);
    procedure SaveInputButtonClick(Sender: TObject);
    procedure SaveOutputButtonClick(Sender: TObject);
    procedure CancelInputButtonClick(Sender: TObject);
    procedure CancelOutputButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
   id_Object_Sel   : integer;
   Name_Object_Sel : string;
   function tagShow(SpravOptions : TSpravOptions) : TResultArray;
   destructor Destroy; override;
   procedure SelectAll;
   procedure LocateRecord(Key : integer);
  end;

var
  dt_Pair_Scheme_Form : Tdt_Pair_Scheme_Form;
  InDeletedArray      : array of integer;
  OutDeletedArray     : array of integer;

implementation

uses sp_Object_Form, dt_Pair_Scheme_Add, Variants;

{$R *.DFM}

var
 Options : TSpravOptions;

destructor Tdt_Pair_Scheme_Form.Destroy;
begin
 dt_Pair_Scheme_Form := nil;
 inherited;
end;

function Tdt_Pair_Scheme_Form.tagShow(SpravOptions : TSpravOptions) : TResultArray;
var
 mr      : integer;
begin
 if dt_Pair_Scheme_Form <> nil then begin
  if not SpravOptions.isModal then dt_Pair_Scheme_Form.Show;
  Exit;
 end;

 Options := SpravOptions;

 Application.CreateForm(Tdt_Pair_Scheme_Form, dt_Pair_Scheme_Form);

 SetLength(Result, 0);
 if SpravOptions.isModal then begin
  mr := dt_Pair_Scheme_Form.ShowModal;
  if mr = mrOK then begin
{   SetLength(Result, 3);
   Result[0] := idVar;
   Result[1] := TextVar;
   Result[2] := CoefVar;}
  end;
 end else begin
  dt_Pair_Scheme_Form.FormStyle := fsMDIChild;
  dt_Pair_Scheme_Form.Show;
 end;
end;

procedure Tdt_Pair_Scheme_Form.DelInputButtonClick(Sender: TObject);
begin
 if InputTreeList.FocusedNode = nil then Exit;
 if MessageDlg('Увага!', 'Чи Ви дійсно бажаєте знищити вхідний об''єкт ' + #39 +
  InputTreeList.FocusedNode.Values[3] + #39 +  ' для об''єкта ' + #39 + Name_Object_Sel + #39 + '?',
  mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 if InputTreeList.FocusedNode.Values[0] = 0 then begin
  SetLength(InDeletedArray, Length(InDeletedArray) + 1);
  InDeletedArray[Length(InDeletedArray) - 1] := InputTreeList.FocusedNode.Values[1];

  InputTreeList.FocusedNode.Destroy;
 end
 else InputTreeList.FocusedNode.Destroy;

 SaveInputButton.Visible   := ivAlways;
 CancelInputButton.Visible := ivAlways;
 TreeList.Enabled          := False; 
end;

procedure Tdt_Pair_Scheme_Form.DelOutputButtonClick(Sender: TObject);
begin
 if OutputTreeList.FocusedNode = nil then Exit;
 if MessageDlg('Увага!', 'Чи Ви дійсно бажаєте знищити вихідний об''єкт ' + #39 +
  OutputTreeList.FocusedNode.Values[3] + #39 +  ' для об''єкта ' + #39 + Name_Object_Sel + #39 + '?',
  mtConfirmation, [mbYes, mbNo]) <> mrYes then exit;

 if OutputTreeList.FocusedNode.Values[0] = 0 then begin
  SetLength(OutDeletedArray, Length(OutDeletedArray) + 1);
  OutDeletedArray[Length(OutDeletedArray) - 1] := OutputTreeList.FocusedNode.Values[1];

  OutputTreeList.FocusedNode.Destroy;
 end
 else OutputTreeList.FocusedNode.Destroy;

 SaveOutputButton.Visible   := ivAlways;
 CancelOutputButton.Visible := ivAlways;
 TreeList.Enabled           := False;
end;

procedure Tdt_Pair_Scheme_Form.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure Tdt_Pair_Scheme_Form.SelectInput;
var
 id_Pair      : integer;
 id_Object    : integer;
 Name_Object  : string;
 id_Product   : integer;
 Name_Product : string;
 Percent_In   : currency;
 Percent_Out  : currency;

 Node         : TcxTreeListNode;
begin
 InputTreeList.Clear;

 if id_Object_Sel < 0 then Exit;

 Query1.SQL.Text := 'select * from PROC_DT_PAIR_SCHEME_SEL_INPUT('
 + IntToStr(id_Object_Sel) + ',' + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';

 Query1.ExecQuery;

 while not Query1.Eof do begin
  id_Pair      := Query1['ID_PAIR_PARAM'].AsInteger;
  id_Object    := Query1['ID_OBJECT_PARAM'].AsInteger;
  Name_Object  := Query1['NAME_OBJECT_PARAM'].AsString;
  id_Product   := Query1['ID_PRODUCT_PARAM'].AsInteger;
  Name_Product := Query1['NAME_PRODUCT_PARAM'].AsString;
  Percent_In   := Query1['PERCENT_IN_PARAM'].AsCurrency;
  Percent_Out  := Query1['PERCENT_OUT_PARAM'].AsCurrency;

  Node         := InputTreeList.Add;

  Node.Values[0] := 0;
  Node.Values[1] := id_Pair;
  Node.Values[2] := id_Object;
  Node.Values[3] := Name_Object;
  Node.Values[4] := id_Product;
  Node.Values[5] := Name_Product;
  Node.Values[6] := Percent_In;
  Node.Values[7] := Percent_Out;

  Query1.Next;
 end;

 Query1.Close;
end;

procedure Tdt_Pair_Scheme_Form.SelectOutput;
var
 id_Pair      : integer;
 id_Object    : integer;
 Name_Object  : string;
 id_Product   : integer;
 Name_Product : string;
 Percent_In   : Currency;
 Percent_Out  : Currency;

 Node         : TcxTreeListNode;
begin
 OutputTreeList.Clear;

 if id_Object_Sel < 0 then Exit;

 Query1.SQL.Text := 'select * from PROC_DT_PAIR_SCHEME_SEL_OUTPUT('
 + IntToStr(id_Object_Sel) + ',' + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';

 Query1.ExecQuery;

 while not Query1.Eof do begin
  id_Pair      := Query1['ID_PAIR_PARAM'].AsInteger;
  id_Object    := Query1['ID_OBJECT_PARAM'].AsInteger;
  Name_Object  := Query1['NAME_OBJECT_PARAM'].AsString;
  id_Product   := Query1['ID_PRODUCT_PARAM'].AsInteger;
  Name_Product := Query1['NAME_PRODUCT_PARAM'].AsString;
  Percent_In   := Query1['PERCENT_IN_PARAM'].AsCurrency;
  Percent_Out  := Query1['PERCENT_OUT_PARAM'].AsCurrency;

  Node         := OutputTreeList.Add;

  Node.Values[0] := 0;
  Node.Values[1] := id_Pair;
  Node.Values[2] := id_Object;
  Node.Values[3] := Name_Object;
  Node.Values[4] := id_Product;
  Node.Values[5] := Name_Product;
  Node.Values[6] := Percent_In;
  Node.Values[7] := Percent_Out;

  Query1.Next;
 end;

 Query1.Close;
end;

procedure Tdt_Pair_Scheme_Form.RefreshButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if DataSet.RecordCount > 0 then Key := DataSet.Fields[0].AsInteger else Key := -1;

 SetLength(InDeletedArray, 0);
 SetLength(OutDeletedArray, 0);

 SelectAll;
 LocateRecord(Key);
end;

procedure Tdt_Pair_Scheme_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Pair_Scheme_Form.AddInputButtonClick(Sender: TObject);
var
{ i       : integer;
 Percent : integer;}
 Node    : TcxTreeListNode;
begin
 if dt_Pair_Scheme_Add_Form <> nil then Exit;

 if VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  ShowMessage('Оберіть об''єкт водопостачання, до якого Ви бажаєте зробити зв''язок!');
  Exit;
 end;

 Application.CreateForm(Tdt_Pair_Scheme_Add_Form, dt_Pair_Scheme_Add_Form);

{ if InputTreeList.Count = 0 then Percent := 100
 else begin
  Percent := 0;
  for i := 0 to InputTreeList.Count - 1 do Percent := Percent + InputTreeList.Items[i].Values[6];
 end;

 if (Percent > 0) and (100 - Percent >= 0) then
  dt_Pair_Scheme_Add_Form.PercentEdit.Value := 100 - Percent
 else
  dt_Pair_Scheme_Add_Form.PercentEdit.Value := 0;}

 dt_Pair_Scheme_Add_Form.Kind := aINPUT;
 dt_Pair_Scheme_Add_Form.Cap  := 'Додавання вхідного';

 if dt_Pair_Scheme_Add_Form.ShowModal <> mrOk then Exit;

 Node           := InputTreeList.Add;
 Node.Values[0] := 1;
 Node.Values[1] := -1;
 Node.Values[2] := dt_Pair_Scheme_Add_Form.id_Object;
 Node.Values[3] := dt_Pair_Scheme_Add_Form.ObjectEdit.Text;
 Node.Values[4] := dt_Pair_Scheme_Add_Form.id_Product;
 Node.Values[5] := dt_Pair_Scheme_Add_Form.ProductEdit.Text;
 Node.Values[6] := dt_Pair_Scheme_Add_Form.PercentInEdit.Value;
 Node.Values[7] := dt_Pair_Scheme_Add_Form.PercentOutEdit.Value;

 SaveInputButton.Visible   := ivAlways;
 CancelInputButton.Visible := ivAlways;
 TreeList.Enabled          := False;
end;

procedure Tdt_Pair_Scheme_Form.EditInputButtonClick(Sender: TObject);
begin
 if InputTreeList.FocusedNode = nil then Exit;
 if dt_Pair_Scheme_Add_Form <> nil then Exit;

 Application.CreateForm(Tdt_Pair_Scheme_Add_Form, dt_Pair_Scheme_Add_Form);

 dt_Pair_Scheme_Add_Form.id_Object            := InputTreeList.FocusedNode.Values[2];
 dt_Pair_Scheme_Add_Form.ObjectEdit.Text      := InputTreeList.FocusedNode.Values[3];
 dt_Pair_Scheme_Add_Form.id_Product           := InputTreeList.FocusedNode.Values[4];
 dt_Pair_Scheme_Add_Form.ProductEdit.Text     := InputTreeList.FocusedNode.Values[5];
 dt_Pair_Scheme_Add_Form.PercentInEdit.Value  := InputTreeList.FocusedNode.Values[6];
 dt_Pair_Scheme_Add_Form.PercentOutEdit.Value := InputTreeList.FocusedNode.Values[7];

 dt_Pair_Scheme_Add_Form.Cap  := 'Редагування вхідного';

 if dt_Pair_Scheme_Add_Form.ShowModal <> mrOk then Exit;

 if (InputTreeList.FocusedNode.Values[2] = dt_Pair_Scheme_Add_Form.id_Object)
 and (InputTreeList.FocusedNode.Values[4] = dt_Pair_Scheme_Add_Form.id_Product)
 and (InputTreeList.FocusedNode.Values[6] = dt_Pair_Scheme_Add_Form.PercentInEdit.Value)
 and (InputTreeList.FocusedNode.Values[7] = dt_Pair_Scheme_Add_Form.PercentOutEdit.Value) then Exit;

 if InputTreeList.FocusedNode.Values[0] = 0 then
  InputTreeList.FocusedNode.Values[0] := 2;
 InputTreeList.FocusedNode.Values[2] := dt_Pair_Scheme_Add_Form.id_Object;
 InputTreeList.FocusedNode.Values[3] := dt_Pair_Scheme_Add_Form.ObjectEdit.Text;
 InputTreeList.FocusedNode.Values[4] := dt_Pair_Scheme_Add_Form.id_Product;
 InputTreeList.FocusedNode.Values[5] := dt_Pair_Scheme_Add_Form.ProductEdit.Text;
 InputTreeList.FocusedNode.Values[6] := dt_Pair_Scheme_Add_Form.PercentInEdit.Value;
 InputTreeList.FocusedNode.Values[7] := dt_Pair_Scheme_Add_Form.PercentOutEdit.Value;

 SaveInputButton.Visible   := ivAlways;
 CancelInputButton.Visible := ivAlways;
 TreeList.Enabled          := False; 
end;

procedure Tdt_Pair_Scheme_Form.AddOutputButtonClick(Sender: TObject);
var
{ i       : integer;
 Percent : integer;}
 Node    : TcxTreeListNode;
begin
 if dt_Pair_Scheme_Add_Form <> nil then Exit;

 if VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  ShowMessage('Оберіть об''єкт водопостачання, до якого Ви бажаєте зробити зв''язок!');
  Exit;
 end;

 Application.CreateForm(Tdt_Pair_Scheme_Add_Form, dt_Pair_Scheme_Add_Form);

{ if OutputTreeList.Count = 0 then Percent := 100
 else begin
  Percent := 0;
  for i := 0 to OutputTreeList.Count - 1 do Percent := Percent + OutputTreeList.Items[i].Values[6];
 end;

 if (Percent > 0) and (100 - Percent >= 0) then
  dt_Pair_Scheme_Add_Form.PercentEdit.Value := 100 - Percent
 else
  dt_Pair_Scheme_Add_Form.PercentEdit.Value := 0;}

 dt_Pair_Scheme_Add_Form.Kind := aOUTPUT;
 dt_Pair_Scheme_Add_Form.Cap  := 'Додавання вихідного';

 if dt_Pair_Scheme_Add_Form.ShowModal <> mrOk then Exit;

 Node           := OutputTreeList.Add;
 Node.Values[0] := 1;
 Node.Values[1] := -1;
 Node.Values[2] := dt_Pair_Scheme_Add_Form.id_Object;
 Node.Values[3] := dt_Pair_Scheme_Add_Form.ObjectEdit.Text;
 Node.Values[4] := dt_Pair_Scheme_Add_Form.id_Product;
 Node.Values[5] := dt_Pair_Scheme_Add_Form.ProductEdit.Text;
 Node.Values[6] := dt_Pair_Scheme_Add_Form.PercentInEdit.Value;
 Node.Values[7] := dt_Pair_Scheme_Add_Form.PercentOutEdit.Value;

 SaveOutputButton.Visible   := ivAlways;
 CancelOutputButton.Visible := ivAlways;
 TreeList.Enabled           := False;
end;

procedure Tdt_Pair_Scheme_Form.EditOutputButtonClick(Sender: TObject);
begin
 if OutputTreeList.FocusedNode = nil then Exit;
 if dt_Pair_Scheme_Add_Form <> nil then Exit;

 Application.CreateForm(Tdt_Pair_Scheme_Add_Form, dt_Pair_Scheme_Add_Form);

 dt_Pair_Scheme_Add_Form.id_Object            := OutputTreeList.FocusedNode.Values[2];
 dt_Pair_Scheme_Add_Form.ObjectEdit.Text      := OutputTreeList.FocusedNode.Values[3];
 dt_Pair_Scheme_Add_Form.id_Product           := OutputTreeList.FocusedNode.Values[4];
 dt_Pair_Scheme_Add_Form.ProductEdit.Text     := OutputTreeList.FocusedNode.Values[5];
 dt_Pair_Scheme_Add_Form.PercentInEdit.Value  := OutputTreeList.FocusedNode.Values[6];
 dt_Pair_Scheme_Add_Form.PercentOutEdit.Value := OutputTreeList.FocusedNode.Values[7];

 dt_Pair_Scheme_Add_Form.Cap  := 'Редагування вихідного';

 if dt_Pair_Scheme_Add_Form.ShowModal <> mrOk then Exit;

 if (OutputTreeList.FocusedNode.Values[2] = dt_Pair_Scheme_Add_Form.id_Object)
 and (OutputTreeList.FocusedNode.Values[4] = dt_Pair_Scheme_Add_Form.id_Product)
 and (OutputTreeList.FocusedNode.Values[6] = dt_Pair_Scheme_Add_Form.PercentInEdit.Value)
 and (OutputTreeList.FocusedNode.Values[7] = dt_Pair_Scheme_Add_Form.PercentOutEdit.Value) then Exit;

 if OutputTreeList.FocusedNode.Values[0] = 0 then
  OutputTreeList.FocusedNode.Values[0] := 2;
 OutputTreeList.FocusedNode.Values[2] := dt_Pair_Scheme_Add_Form.id_Object;
 OutputTreeList.FocusedNode.Values[3] := dt_Pair_Scheme_Add_Form.ObjectEdit.Text;
 OutputTreeList.FocusedNode.Values[4] := dt_Pair_Scheme_Add_Form.id_Product;
 OutputTreeList.FocusedNode.Values[5] := dt_Pair_Scheme_Add_Form.ProductEdit.Text;
 OutputTreeList.FocusedNode.Values[6] := dt_Pair_Scheme_Add_Form.PercentInEdit.Value;
 OutputTreeList.FocusedNode.Values[7] := dt_Pair_Scheme_Add_Form.PercentOutEdit.Value;

 SaveOutputButton.Visible   := ivAlways;
 CancelOutputButton.Visible := ivAlways;
 TreeList.Enabled           := False;
end;

procedure Tdt_Pair_Scheme_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 i       : integer;
 InFlag  : boolean;
 OutFlag : boolean;
begin
 InFlag := False;

 for i := 0 to InputTreeList.Count - 1 do
  if Integer(InputTreeList.Items[i].Values[0]) in [1, 2] then begin
   InFlag := True;
   Break;
  end;

 if not InFlag then InFlag := (Length(InDeletedArray) > 0);

 OutFlag := False;

 for i := 0 to OutputTreeList.Count - 1 do
  if Integer(OutputTreeList.Items[i].Values[0]) in [1, 2] then begin
   OutFlag := True;
   Break;
  end;

 if not OutFlag then OutFlag := (Length(OutDeletedArray) > 0);

 if InFlag or OutFlag then
  case MessageDlg('Увага', 'Чи бажаєте Ви зберегти зміни перед вихідом?', mtConfirmation, [mbYes, mbNo, mbCancel]) of
   mrYes :
    begin
     if InFlag  then SaveInputButtonClick(Sender);
     if OutFlag then SaveOutputButtonClick(Sender);
     CanClose := True;
    end;
   mrNo : CanClose := True;
   mrCancel : CanClose := False;
  end;
end;

procedure Tdt_Pair_Scheme_Form.FormShow(Sender: TObject);
begin
 SelectAll;
end;

procedure Tdt_Pair_Scheme_Form.SelectAll;
begin
 DataSet.Close;
 DataSet.Open;
end;

procedure Tdt_Pair_Scheme_Form.TreeListFocusedNodeChanged(
  Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
 if AFocusedNode = nil then
  id_Object_Sel := -2
 else if VarIsNull(AFocusedNode.Values[1]) then
   id_Object_Sel := -2
  else
   id_Object_Sel := AFocusedNode.Values[1];

 SetLength(InDeletedArray, 0);
 SetLength(OutDeletedArray, 0);

 SelectInput;
 SelectOutput;
end;

procedure Tdt_Pair_Scheme_Form.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure Tdt_Pair_Scheme_Form.LocateRecord(Key: integer);
begin
 if Key > 0 then DataSet.Locate('ID_TYPE_OBJECT', Key, [loCaseInsensitive]);
end;

procedure Tdt_Pair_Scheme_Form.TreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 if AViewInfo.Focused then Exit;

 if not VarIsNull(AViewInfo.Node.Values[1]) and (AViewInfo.Column.ItemIndex = 2) then
  ACanvas.Font.Color := clNavy;
end;

procedure Tdt_Pair_Scheme_Form.FormResize(Sender: TObject);
begin
 LeftPanel.Width := (Width - Splitter.Width - 4) div 2;
 CentralPanel.Height := (Height - Splitter1.Height) div 2;
end;

procedure Tdt_Pair_Scheme_Form.SaveInputButtonClick(Sender: TObject);
var
 i    : integer;
 Flag : boolean;
 Sum  : integer;
begin
 Flag := False;

 Sum := 0;
 for i := 0 to InputTreeList.Count - 1 do begin
  if Integer(InputTreeList.Items[i].Values[0]) in [1, 2] then Flag := True;
  Sum := Sum + InputTreeList.Items[i].Values[6];
 end;

 if (Sum > 100) and (InputTreeList.Count > 0) then begin
  ShowMessage('У списку вхідних зв''язків сума часток входу не може бути більшою 100!');
  Exit;
 end;

 if not Flag and (Length(InDeletedArray) = 0) then begin
  ShowMessage('Змін не відбулось! Нема що зберегти!');
  Exit;
 end;

 if MessageDlg('Увага', 'Чи дійсно Ви бажаєте зберегти зміни?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 StoredProc.Transaction.StartTransaction;

 for i := 0 to InputTreeList.Count - 1 do begin
  if InputTreeList.Items[i].Values[0] = 1 then
   StoredProc.ExecProcedure('PROC_DT_PAIR_SCHEME_ADD', [InputTreeList.Items[i].Values[2],
   id_Object_Sel, InputTreeList.Items[i].Values[4], InputTreeList.Items[i].Values[6],
   InputTreeList.Items[i].Values[7], SYS_MAX_TIMESTAMP])
  else if InputTreeList.Items[i].Values[0] = 2 then
   StoredProc.ExecProcedure('PROC_DT_PAIR_SCHEME_MODIFY', [InputTreeList.Items[i].Values[1],
   InputTreeList.Items[i].Values[2], id_Object_Sel, InputTreeList.Items[i].Values[4],
   InputTreeList.Items[i].Values[6], InputTreeList.Items[i].Values[7], SYS_MAX_TIMESTAMP]);
 end;

 for i := 0 to Length(InDeletedArray) - 1 do
  StoredProc.ExecProcedure('PROC_DT_PAIR_SCHEME_DEL', [InDeletedArray[i], SYS_MAX_TIMESTAMP]);

 StoredProc.Transaction.Commit;

 SetLength(InDeletedArray, 0);
 SelectInput;

 SaveInputButton.Visible   := ivNever;
 CancelInputButton.Visible := ivNever;
 TreeList.Enabled          := not((SaveInputButton.Visible = ivAlways) and (SaveOutputButton.Visible = ivAlways));
end;

procedure Tdt_Pair_Scheme_Form.SaveOutputButtonClick(Sender: TObject);
var
 i    : integer;
 Flag : boolean;
 Sum  : integer;
begin
 Flag := False;

 Sum := 0;
 for i := 0 to OutputTreeList.Count - 1 do begin
  if Integer(OutputTreeList.Items[i].Values[0]) in [1, 2] then Flag := True;
  Sum := Sum + OutputTreeList.Items[i].Values[7];
 end;

 if (Sum > 100) and (OutputTreeList.Count > 0) then begin
  ShowMessage('У списку вихідних зв''язків сума часток виходу не може бути більшою 100!');
  Exit;
 end;

 if not Flag and (Length(OutDeletedArray) = 0) then begin
  ShowMessage('Змін не відбулось! Нема що зберегти!');
  SaveOutputButton.Visible   := ivNever;
  CancelOutputButton.Visible := ivNever;
  Exit;
 end;

 if MessageDlg('Увага', 'Чи дійсно Ви бажаєте зберегти зміни?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 StoredProc.Transaction.StartTransaction;

 for i := 0 to OutputTreeList.Count - 1 do begin
  if OutputTreeList.Items[i].Values[0] = 1 then
   StoredProc.ExecProcedure('PROC_DT_PAIR_SCHEME_ADD', [id_Object_Sel, OutputTreeList.Items[i].Values[2],
   OutputTreeList.Items[i].Values[4], OutputTreeList.Items[i].Values[6],
   OutputTreeList.Items[i].Values[7], SYS_MAX_TIMESTAMP])
  else if OutputTreeList.Items[i].Values[0] = 2 then
   StoredProc.ExecProcedure('PROC_DT_PAIR_SCHEME_MODIFY', [OutputTreeList.Items[i].Values[1],
   id_Object_Sel, OutputTreeList.Items[i].Values[2], OutputTreeList.Items[i].Values[4],
   OutputTreeList.Items[i].Values[6], OutputTreeList.Items[i].Values[7], SYS_MAX_TIMESTAMP]);
 end;

 for i := 0 to Length(OutDeletedArray) - 1 do
  StoredProc.ExecProcedure('PROC_DT_PAIR_SCHEME_DEL', [OutDeletedArray[i], SYS_MAX_TIMESTAMP]);

 StoredProc.Transaction.Commit;

 SetLength(OutDeletedArray, 0);
 SelectOutput;

 SaveOutputButton.Visible   := ivNever;
 CancelOutputButton.Visible := ivNever;
 TreeList.Enabled           := not((SaveInputButton.Visible = ivAlways) and (SaveOutputButton.Visible = ivAlways));
end;

procedure Tdt_Pair_Scheme_Form.CancelInputButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then
  id_Object_Sel := -2
 else if VarIsNull(TreeList.FocusedNode.Values[1]) then
   id_Object_Sel := -2
  else
   id_Object_Sel := TreeList.FocusedNode.Values[1];

 SetLength(InDeletedArray, 0);

 SelectInput;

 SaveInputButton.Visible   := ivNever;
 CancelInputButton.Visible := ivNever;
 TreeList.Enabled          := not((SaveInputButton.Visible = ivAlways) and (SaveOutputButton.Visible = ivAlways));
end;

procedure Tdt_Pair_Scheme_Form.CancelOutputButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then
  id_Object_Sel := -2
 else if VarIsNull(TreeList.FocusedNode.Values[1]) then
   id_Object_Sel := -2
  else
   id_Object_Sel := TreeList.FocusedNode.Values[1];

 SetLength(OutDeletedArray, 0);

 SelectOutput;

 SaveOutputButton.Visible   := ivNever;
 CancelOutputButton.Visible := ivNever;
 TreeList.Enabled           := not((SaveInputButton.Visible = ivAlways) and (SaveOutputButton.Visible = ivAlways));
end;

end.
