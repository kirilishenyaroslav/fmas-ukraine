{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                   Модуль "Справочник единиц измерения"                       }
{  Отображение в разрезе групп, добавление, изменение, удаление единиц         }
{  измерения                                                                   }
{                                               ответственный: Андрей Таганский}

unit ini_Unit_Meas_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, FIBDataSet, pFIBDataSet, Buttons, ToolWin, ComCtrls, Grids, DBGrids,
  FIBQuery, pFIBQuery, pFIBStoredProc, Menus, BaseTypes, ActnList,
  cxInplaceContainer, cxTL, cxControls, cxGraphics, cxCustomData, cxStyles,
  cxTextEdit, dxBar, dxBarExtItems, FIBDatabase, pFIBDatabase, dogLoaderUnit,
  IB_Externals;

type
  Tini_Unit_Meas_Form1 = class(TForm)
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
    TreeList: TcxTreeList;
    id_group_unitm_Column: TcxTreeListColumn;
    name_group_unitm_name_unit_meas_Column: TcxTreeListColumn;
    short_name_Column: TcxTreeListColumn;
    id_unit_meas_Column: TcxTreeListColumn;
    Coefficient_Column: TcxTreeListColumn;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
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
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectUnitMeas(Node: TcxTreeListNode);
    procedure TreeListDblClick(Sender: TObject);
    procedure TreeListKeyPress(Sender: TObject; var Key: Char);
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
    procedure Refresh(id_Group, id_Unit, index : integer);
    procedure ActionExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    input  : TSpravParams;
    output : TSpravParams;
  public
    procedure SelectAll;
    destructor Destroy; override;
    function tagShow(SpravOptions : TSpravOptions; id_Group_UnitMeas : integer) : TResultArray;
  end;

var
  ini_Unit_Meas_Form1      : Tini_Unit_Meas_Form1;
  Options                  : TSpravOptions;
  idGroupUnitM           : integer;
  id_UnitM_Add_Param       : integer;
  id_Group_UnitM_Add_Param : integer;

procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;
exports Load;
 
implementation

uses ini_Unit_Meas_Form_Add, ini_Group_UnitM_Unit_Meas, group_add_form;

{$R *.DFM}

procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;
var
 f : Tini_Unit_Meas_Form1;
begin
 f := Tini_Unit_Meas_Form1.Create(Owner);
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


destructor Tini_Unit_Meas_Form1.Destroy;
begin
 ini_Unit_Meas_Form1 := nil;
 inherited;
end;

function Tini_Unit_Meas_Form1.tagShow(SpravOptions : TSpravOptions;
         id_Group_UnitMeas : integer) : TResultArray;
var
 mr      : integer;
 idVar   : integer;
 TextVar : string;
 CoefVar : integer;

 Sprav   : Tini_Unit_Meas_Form1;
begin
 if ini_Unit_Meas_Form1 <> nil then
  if not SpravOptions.isModal then begin
   ini_Unit_Meas_Form1.Show;
   Exit;
  end;

 Options := SpravOptions;

 idGroupUnitM := id_Group_UnitMeas;

 SetLength(Result, 0);
 if Options.isModal then begin
  Sprav := Tini_Unit_Meas_Form1.Create(Self);
  mr := Sprav.ShowModal;
  if mr = mrOK then begin
   idVar   := Sprav.TreeList.FocusedNode.Values[1];
   TextVar := Sprav.TreeList.FocusedNode.Values[3];
   CoefVar := Sprav.TreeList.FocusedNode.Values[4];

   SetLength(Result, 3);
   
   Result[0] := idVar;
   Result[1] := TextVar;
   Result[2] := CoefVar;
  end;
 end else begin
  Application.CreateForm(Tini_Unit_Meas_Form1, ini_Unit_Meas_Form1);
  ini_Unit_Meas_Form1.FormStyle := fsMDIChild;
  ini_Unit_Meas_Form1.Show;
 end;
end;

procedure Tini_Unit_Meas_Form1.Refresh(id_Group, id_Unit, index : integer);
var
Node             : TcxTreeListNode;
id_Group_UnitM   : integer;
Name_Group_UnitM : string;
i                : integer;
begin
 TreeList.Clear;
 Query.Transaction := ReadTransaction;
 Query.SQL.Text    := 'select * from INI_GROUP_UNITM_VIEW';
 Query.ExecQuery;
 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;
 while not Query.Eof do begin
  id_Group_UnitM   := Query['ID_GROUP_UNITM'].AsInteger;
  Name_Group_UnitM := Query['NAME_GROUP_UNITM'].AsString;

  if idGroupUnitM > 0 then
   if id_Group_UnitM <> idGroupUnitM then begin
    Query.Next;
    Continue;
   end;

  Node := TreeList.Add;

  Node.Values[0] := id_Group_UnitM;
  Node.Values[1] := -1;
  Node.Values[2] := Name_Group_UnitM;

  Node.AddChild;

  Query.Next;
 end;

 Query.Close;

 for i := 0 to TreeList.Count - 1 do begin
  SelectUnitMeas(TreeList.Items[i]);
 end;

 i := 0;
 if id_Group > 0 then begin
  while i < TreeList.LastNode.AbsoluteIndex do
   if TreeList.Nodes.AbsoluteItems[i].Values[0] = id_Group then begin
    TreeList.Nodes.AbsoluteItems[i].Focused := True;
    Break;
   end
   else Inc(i);
 end
 else if id_Unit > 0 then begin
  while i < TreeList.LastNode.AbsoluteIndex do
   if TreeList.Nodes.AbsoluteItems[i].Values[1] = id_Unit then begin
    TreeList.Nodes.AbsoluteItems[i].Focused := True;
    Break;
   end
   else Inc(i);
 end
 else if index > 0 then
  if TreeList.Nodes.AbsoluteItems[Index] <> nil then TreeList.Nodes.AbsoluteItems[Index].Focused := True;
end;

procedure Tini_Unit_Meas_Form1.SelectUnitMeas(Node: TcxTreeListNode);
var
id_Group_UnitM : integer;
id_Unit_Meas   : integer;
Name_Unit_Meas : string;
Short_Name     : string;
Coefficient    : integer;

Child          : TcxTreeListNode;
begin
 id_Group_UnitM := Node.Values[0];
 Query.SQL.Text := 'select * from SP_INI_UNIT_MEAS_SELECT(' + IntToStr(id_Group_UnitM) + ')';
 Query.ExecQuery;
 Node.DeleteChildren;
 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;
 while not Query.eof do begin
  id_Unit_Meas   := Query['ID_UNIT_MEAS'].AsInteger;
  Name_Unit_Meas := Query['NAME_UNIT_MEAS'].AsString;
  Short_Name     := Query['SHORT_NAME'].AsString;
  Coefficient    := Query['COEFFICIENT'].AsInteger;

  Child := Node.AddChild;

  Child.Values[0] := -1;
  Child.Values[1] := id_Unit_Meas;
  Child.Values[2] := Name_Unit_Meas;
  Child.Values[3] := Short_Name;
  Child.Values[4] := Coefficient;

  Query.Next;
 end;
 Query.Close;
end;

procedure Tini_Unit_Meas_Form1.CloseButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
 output.Values['ModalResult'] := mrCancel; 
end;

procedure Tini_Unit_Meas_Form1.RefreshButtonClick(Sender: TObject);
begin
 if not WorkDatabase.Connected then Exit;
 if TreeList.FocusedNode = nil then
  Refresh(-1, -1, -1)
 else
  Refresh(-1, -1, TreeList.FocusedNode.AbsoluteIndex);
end;

procedure Tini_Unit_Meas_Form1.AddButtonClick(Sender: TObject);
begin
 if ini_Group_UnitM_Unit_Meas1 <> nil then exit;
 Application.CreateForm(Tini_Group_UnitM_Unit_Meas1, ini_Group_UnitM_Unit_Meas1);

 if TreeList.FocusedNode <> nil then
  if TreeList.FocusedNode.Values[0] < -1 then ini_Group_UnitM_Unit_Meas1.RadioGroup1.ItemIndex := 1
  else ini_Group_UnitM_Unit_Meas1.RadioGroup1.ItemIndex := 0;

 ini_Group_UnitM_Unit_Meas1.ShowModal;
 if ini_Group_UnitM_Unit_Meas1.ModalResult = mrOk then begin
  if ini_Group_UnitM_Unit_Meas1.RadioGroup1.ItemIndex = 0 then begin
   if ini_Group_UnitM_Form_Add1 <> nil then exit;
   ini_Group_UnitM_Form_Add1 := Tini_Group_UnitM_Form_Add1.Create(Self);
   ini_Group_UnitM_Form_Add1.Caption := 'Додати групу одиниць вимірювання';
   ini_Group_UnitM_Form_Add1.ShowModal;
   if ini_Group_UnitM_Form_Add1.ModalResult = mrOk then begin
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('SP_INI_GROUP_UNITM_ADD', [ini_Group_UnitM_Form_Add1.Name_Group_UnitM.Text]);
    id_Group_UnitM_Add_Param := StoredProc.Fields[0].AsInteger;
    StoredProc.Transaction.Commit;
    Refresh(StoredProc.Fields[0].AsInteger, -1, -1);
   end;
  end
  else begin
   if ini_Unit_Meas_Form_Add1 <> nil then exit;
   ini_Unit_Meas_Form_Add1 := Tini_Unit_Meas_Form_Add1.Create(Self);
   ini_Unit_Meas_Form_Add1.Caption                := 'Додати одиниці вимірювання';
   if TreeList.FocusedNode.Values[0] >= 0 then begin
    ini_Unit_Meas_Form_Add1.Name_Group_UnitM.Text := TreeList.FocusedNode.values[2];
    ini_Unit_Meas_Form_Add1.id_Group_UnitM        := TreeList.FocusedNode.values[0];
   end
   else begin
    ini_Unit_Meas_Form_Add1.Name_Group_UnitM.Text := TreeList.FocusedNode.Parent.Values[2];
    ini_Unit_Meas_Form_Add1.id_Group_UnitM        := TreeList.FocusedNode.Parent.Values[0];
   end;
   ini_Unit_Meas_Form_Add1.ShowModal;
   if ini_Unit_Meas_Form_Add1.ModalResult = mrOk then begin
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('SP_INI_UNIT_MEAS_ADD', [ini_Unit_Meas_Form_Add1.id_Group_UnitM,
    ini_Unit_Meas_Form_Add1.Name_Unit_Meas.Text, ini_Unit_Meas_Form_Add1.Short_Name.Text,
    ini_Unit_Meas_Form_Add1.Coefficient.Text]);
    id_UnitM_Add_Param := StoredProc.Fields[0].AsInteger;
    StoredProc.Transaction.Commit;
    Refresh(-1, StoredProc.Fields[0].AsInteger, -1);
   end;
  end;
 end;
end;

procedure Tini_Unit_Meas_Form1.DelButtonClick(Sender: TObject);
var
exp : boolean;
begin
 if TreeList.FocusedNode = nil then Exit;

 exp := TreeList.FocusedNode.Expanded;
 if not exp then TreeList.FocusedNode.Expand(false);
 if TreeList.FocusedNode.Count <> 0 then begin
  if not exp then TreeList.FocusedNode.Collapse(false);
  ShowMessage('Спочатку ви повинні знищити усі одиниці вимірювання,'
  +' що належить до цієї групи одиниць вимірювання.');
  exit;
 end;

 if TreeList.FocusedNode.Values[0] >= 0 then begin
  case MessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цю групу одиниць виміру?', mtConfirmation, [mbYes, mbNo]) of
  mrYes :
   begin
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('SP_INI_GROUP_UNITM_DEL', [TreeList.FocusedNode.Values[0]]);
    StoredProc.Transaction.Commit;
    Refresh(-1, -1, TreeList.FocusedNode.AbsoluteIndex);
   end;
  mrNo : Exit;
  end;
 end
 else begin
  case MessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цю одиницю виміру?', mtConfirmation, [mbYes, mbNo]) of
  mrYes :
   begin
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_INI_UNIT_MEAS_DEL', [TreeList.FocusedNode.Values[1]]);
   StoredProc.Transaction.Commit;
   Refresh(-1, -1, TreeList.FocusedNode.AbsoluteIndex);
   end;
  mrNo : Exit;
  end;
 end;
end;

procedure Tini_Unit_Meas_Form1.EditButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 if TreeList.FocusedNode.Values[0] >= 0 then begin
  if ini_Group_UnitM_Form_Add1 <> nil then exit;
  ini_Group_UnitM_Form_Add1 := Tini_Group_UnitM_Form_Add1.Create(Self);
  ini_Group_UnitM_Form_Add1.Caption               := 'Змінити групу одиниць вимірювання';
  ini_Group_UnitM_Form_Add1.Name_Group_UnitM.Text := TreeList.FocusedNode.Values[2];
  ini_Group_UnitM_Form_Add1.id_Group_UnitM         := TreeList.FocusedNode.Values[0];
  ini_Group_UnitM_Form_Add1.ShowModal;
  if ini_Group_UnitM_Form_Add1.ModalResult = mrOk then begin
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_INI_GROUP_UNITM_MODIFY', [ini_Group_UnitM_Form_Add1.id_Group_UnitM,
   ini_Group_UnitM_Form_Add1.Name_Group_UnitM.Text]);
   StoredProc.Transaction.Commit;
   Refresh(TreeList.FocusedNode.Values[0], -1, -1);
  end;
 end
 else begin
  if ini_Unit_Meas_Form_Add1 <> nil then exit;
  ini_Unit_Meas_Form_Add1 := Tini_Unit_Meas_Form_Add1.Create(Self);
  ini_Unit_Meas_Form_Add1.Caption               := 'Змінити одиниці вимірювання';
  ini_Unit_Meas_Form_Add1.Name_Unit_Meas.Text   := TreeList.FocusedNode.Values[2];
  ini_Unit_Meas_Form_Add1.Name_Group_UnitM.Text := TreeList.FocusedNode.Parent.Values[2];
  ini_Unit_Meas_Form_Add1.Short_Name.Text       := TreeList.FocusedNode.Values[3];
  ini_Unit_Meas_Form_Add1.Coefficient.Text      := TreeList.FocusedNode.Values[4];
  ini_Unit_Meas_Form_Add1.id_Group_UnitM        := TreeList.FocusedNode.Parent.Values[0];
  ini_Unit_Meas_Form_Add1.ShowModal;
  if ini_Unit_Meas_Form_Add1.ModalResult = mrOk then begin
   StoredProc.Transaction := WriteTransaction;
   WriteTransaction.StartTransaction;
   StoredProc.ExecProcedure('SP_INI_UNIT_MEAS_MODIFY', [TreeList.FocusedNode.Values[1],
   ini_Unit_Meas_Form_Add1.id_Group_UnitM, ini_Unit_Meas_Form_Add1.Name_Unit_Meas.Text,
   ini_Unit_Meas_Form_Add1.Short_Name.Text, ini_Unit_Meas_Form_Add1.Coefficient.Text]);
   WriteTransaction.Commit;
   Refresh(-1, TreeList.FocusedNode.Values[1], -1);
  end;
 end;
end;

procedure Tini_Unit_Meas_Form1.SelectButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode.Values[0] >= 0 then exit;
 output.Values['ID_UNIT_MEAS']   := TreeList.FocusedNode.Values[1];
 output.Values['NAME_UNIT_MEAS'] := TreeList.FocusedNode.Values[3];
 output.Values['KOEF'] := TreeList.FocusedNode.Values[4];
 output.Values['ModalResult'] := mrOk; 
 ModalResult := mrOk;
end;

procedure Tini_Unit_Meas_Form1.DBGrid1DblClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then SelectButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.FormDestroy(Sender: TObject);
begin
 ini_Unit_Meas_Form1 := NIL;
end;

procedure Tini_Unit_Meas_Form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tini_Unit_Meas_Form1.TreeListDblClick(Sender: TObject);
begin
 if (TreeList.FocusedNode.Values[0] < 0) and (SelectButton.Visible = ivAlways) then SelectButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.TreeListKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #27 then CloseButtonClick(Sender);
 if (TreeList.FocusedNode.Values[0] < 0) and (SelectButton.Visible = ivAlways) and (Key = #13) then SelectButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.AddPopupClick(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.EditPopupClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.DelPopupClick(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.RefreshPopupClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.SelectPopupClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.ActionSelExecute(Sender: TObject);
begin
 TreeListDblClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.SelectAll;
begin
 RefreshButtonClick(Self);
end;

procedure Tini_Unit_Meas_Form1.FormShow(Sender: TObject);
begin
 SelectAll;
end;

end.
