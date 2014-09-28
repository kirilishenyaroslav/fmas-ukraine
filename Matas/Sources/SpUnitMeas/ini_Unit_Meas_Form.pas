unit ini_Unit_Meas_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, FIBDataSet, pFIBDataSet, Buttons, ToolWin, ComCtrls, Grids, DBGrids,
  FIBQuery, pFIBQuery, pFIBStoredProc, Menus, ActnList,
  cxInplaceContainer, cxTL, cxControls, cxGraphics, cxCustomData, cxStyles,
  cxTextEdit, ib_externals, Variants, FIBDatabase, pFIBDatabase,
  cxClasses, cxGridTableView, pUtils, ImgList;

type

  Tini_Unit_Meas_Form1 = class(TForm)
    ToolBar1: TToolBar;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    EditButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CloseButton: TSpeedButton;
    StoredProc: TpFIBStoredProc;
    SelectButton: TSpeedButton;
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
    Database: TpFIBDatabase;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    N1: TMenuItem;
    ImageList1: TImageList;
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
    procedure TreeListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
   id_pos : integer;
   destructor Destroy; override;
   function tagShow(SpravOptions : pUtils.TSpravOptions; id_Group_UnitMeas : integer) : pUtils.TResultArray;
  end;

var
  ini_Unit_Meas_Form1      : Tini_Unit_Meas_Form1;
  Options                  : TSpravOptions;
  idGroupUnitM             : integer;
  id_UnitM_Add_Param       : integer;
  id_Group_UnitM_Add_Param : integer;
  KeyboardLayout : string = '00000419';

function ShowSprav2(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_unit_meas : int64) : Variant; stdcall;
exports ShowSprav2;


implementation

uses ini_Unit_Meas_Form_Add, ini_Group_UnitM_Unit_Meas,
  ini_Group_UnitM_Form_Add, ini_Group_unitM_Form;

{$R *.DFM}

function ShowSprav2(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_unit_meas : int64) : Variant; stdcall;
var
 SpravForm : Tini_Unit_Meas_Form1;
 res : TResultArray;
begin
     SpravForm := Tini_Unit_Meas_Form1.Create(AOwner);
     SpravForm.Database.Handle := DBHandle;
     SpravForm.FormStyle := fs;
     SpravForm.id_pos := id_unit_meas;
     Result := NULL;
 if fs = fsNormal then begin
  if SpravForm.ShowModal = mrOK then begin
     Result := VarArrayOf([SpravForm.TreeList.FocusedNode.Values[1], SpravForm.TreeList.FocusedNode.Values[2], SpravForm.TreeList.FocusedNode.Values[3]]);
  end;
 end;
end;


destructor Tini_Unit_Meas_Form1.Destroy;
begin
 ini_Unit_Meas_Form1 := nil;
 inherited;
end;

function Tini_Unit_Meas_Form1.tagShow(SpravOptions : TSpravOptions;
         id_Group_UnitMeas : integer) : pUtils.TResultArray;
var
 mr      : integer;
 idVar   : integer;
 TextVar : string;
 CoefVar : integer;
begin
 if ini_Unit_Meas_Form1 <> nil then begin
  if not SpravOptions.isModal then ini_Unit_Meas_Form1.Show;
  Exit;
 end;

 Options := SpravOptions;
 Application.CreateForm(Tini_Unit_Meas_Form1, ini_Unit_Meas_Form1);

 idGroupUnitM := id_Group_UnitMeas;

 SetLength(Result, 0);
 if Options.isModal then begin
  mr := ini_Unit_Meas_Form1.ShowModal;
  if mr = mrOK then begin
   idVar   := ini_Unit_Meas_Form1.TreeList.FocusedNode.Values[1];
   TextVar := ini_Unit_Meas_Form1.TreeList.FocusedNode.Values[3];
   CoefVar := ini_Unit_Meas_Form1.TreeList.FocusedNode.Values[4];

   SetLength(Result, 3);
   Result[0] := idVar;
   Result[1] := TextVar;
   Result[2] := CoefVar;
  end;
 end else begin
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
 Query.SQL.Text    := 'select * from PUB_SP_GROUP_UNITM_VIEW';
 Query.ExecQuery;
 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;
 while not Query.Eof do begin
  id_Group_UnitM   := Query.FieldByName('ID_GROUP_UNITM').AsInteger;
  Name_Group_UnitM := Query.FieldByName('NAME_GROUP_UNITM').AsString;

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
 Query.SQL.Text := 'select * from PUB_SP_UNIT_MEAS_SELECT(' + IntToStr(id_Group_UnitM) + ')';
 Query.ExecQuery;
 Node.DeleteChildren;
 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;
 while not Query.eof do begin
  id_Unit_Meas   := Query.FieldByName('ID_UNIT_MEAS').AsInteger;
  Name_Unit_Meas := Query.FieldByName('NAME_UNIT_MEAS').AsString;
  Short_Name     := Query.FieldByName('SHORT_NAME').AsString;
  Coefficient    := Query.FieldByName('COEFFICIENT').AsInteger;

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
 if Options.isModal then ModalResult := mrCancel
 else Close;
end;

procedure Tini_Unit_Meas_Form1.RefreshButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then
  Refresh(-1, -1, -1)
 else
  Refresh(-1, -1, TreeList.FocusedNode.AbsoluteIndex);
end;

procedure Tini_Unit_Meas_Form1.AddButtonClick(Sender: TObject);
var
 AddForm : Tini_Group_UnitM_Form_Add1;
 GrpForm : Tini_Group_UnitM_Unit_Meas1;
begin
 GrpForm := Tini_Group_UnitM_Unit_Meas1.Create(Self);

 if TreeList.FocusedNode <> nil then
  if TreeList.FocusedNode.Values[0] < -1 then GrpForm.RadioGroup1.ItemIndex := 1
  else GrpForm.RadioGroup1.ItemIndex := 0;

 GrpForm.ShowModal;
 if GrpForm.ModalResult = mrOk then begin
  if GrpForm.RadioGroup1.ItemIndex = 0 then begin
   Addform := Tini_Group_UnitM_Form_Add1.Create(Self);
   Addform.Caption := 'Додати групу одиниць вимірювання';
   Addform.ShowModal;
   if Addform.ModalResult = mrOk then begin

    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PUB_SP_GROUP_UNIT_ADD', [Addform.Name_Group_UnitM.Text]);
    id_Group_UnitM_Add_Param := StoredProc.Fields[0].AsInteger;
    StoredProc.Transaction.Commit;
    Refresh(StoredProc.Fields[0].AsInteger, -1, -1);
   end;
  end
  else begin
   if ini_Unit_Meas_Form_Add1 <> nil then exit;
   ini_Unit_Meas_Form_Add1:=Tini_Unit_Meas_Form_Add1.Create(self);
   ini_Unit_Meas_Form_Add1.DBHandle:=Database.Handle;
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
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PUB_SP_UNIT_MEAS_ADD', [ini_Unit_Meas_Form_Add1.id_Group_UnitM,
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
  agShowMessage('Спочатку ви повинні знищити усі одиниці вимірювання,'
  +' що належить до цієї групи одиниць вимірювання.');
  exit;
 end;

 if TreeList.FocusedNode.Values[0] >= 0 then begin
  case agMessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цю групу одиниць виміру?', mtConfirmation, [mbYes, mbNo]) of
  mrYes :
   begin
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PUB_SP_GROUP_UNIT_DEL', [TreeList.FocusedNode.Values[0]]);
    StoredProc.Transaction.Commit;
    Refresh(-1, -1, TreeList.FocusedNode.AbsoluteIndex);
   end;
  mrNo : Exit;
  end;
 end
 else begin
  case agMessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цю одиницю виміру?', mtConfirmation, [mbYes, mbNo]) of
  mrYes :
   begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('PUB_SP_UNIT_MEAS_DEL', [TreeList.FocusedNode.Values[1]]);
   StoredProc.Transaction.Commit;
   Refresh(-1, -1, TreeList.FocusedNode.AbsoluteIndex);
   end;
  mrNo : Exit;
  end;
 end;
end;

procedure Tini_Unit_Meas_Form1.EditButtonClick(Sender: TObject);
var
 AddForm : Tini_Group_UnitM_Form_Add1;
 AddForm2 : Tini_Unit_Meas_Form_Add1;
begin
 if TreeList.FocusedNode = nil then Exit;
 if TreeList.FocusedNode.Values[0] >= 0 then begin
  AddForm := Tini_Group_UnitM_Form_Add1.Create(Self);
  AddForm.Caption               := 'Змінити групу одиниць вимірювання';
  AddForm.Name_Group_UnitM.Text := TreeList.FocusedNode.Values[2];
  id_Group_UnitM         := TreeList.FocusedNode.Values[0];
  AddForm.ShowModal;
  if AddForm.ModalResult = mrOk then begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('PUB_SP_GROUP_UNIT_MODIFY', [ini_Group_UnitM_Form_Add.id_Group_UnitM,
   AddForm.Name_Group_UnitM.Text]);
   StoredProc.Transaction.Commit;
   Refresh(TreeList.FocusedNode.Values[0], -1, -1);
  end;
 end
 else begin
  AddForm2 := Tini_Unit_Meas_Form_Add1.Create(Self);
  AddForm2.Caption               := 'Змінити одиниці вимірювання';
  AddForm2.Name_Unit_Meas.Text   := TreeList.FocusedNode.Values[2];
  AddForm2.Name_Group_UnitM.Text := TreeList.FocusedNode.Parent.Values[2];
  AddForm2.Short_Name.Text       := TreeList.FocusedNode.Values[3];
  AddForm2.Coefficient.Text      := TreeList.FocusedNode.Values[4];
  AddForm2.id_Group_UnitM        := TreeList.FocusedNode.Parent.Values[0];
  AddForm2.ShowModal;
  if AddForm2.ModalResult = mrOk then begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('PUB_SP_UNIT_MEAS_MODIFY', [TreeList.FocusedNode.Values[1],
   AddForm2.id_Group_UnitM, AddForm2.Name_Unit_Meas.Text,
   AddForm2.Short_Name.Text, AddForm2.Coefficient.Text]);
   StoredProc.Transaction.Commit;
   Refresh(-1, TreeList.FocusedNode.Values[1], -1);
  end;
 end;
end;

procedure Tini_Unit_Meas_Form1.SelectButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode.Values[0] >= 0 then exit;
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
 if (TreeList.FocusedNode.Values[0] < 0) and SelectButton.Visible then SelectButtonClick(Sender);
end;

procedure Tini_Unit_Meas_Form1.TreeListKeyPress(Sender: TObject;
  var Key: Char);
begin
// if Key = #27 then CloseButtonClick(Sender);
// if (TreeList.FocusedNode.Values[0] < 0) and SelectButton.Visible and (Key = #13) then SelectButtonClick(Sender);
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

procedure Tini_Unit_Meas_Form1.FormShow(Sender: TObject);
var i:Integer;
begin
     RefreshButtonClick(Sender);
     TreeList.FullExpand;
     LoadKeyboardLayout(PAnsiChar('00000419'), KLF_ACTIVATE or KLF_SUBSTITUTE_OK)
end;

procedure Tini_Unit_Meas_Form1.TreeListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  SelectButtonClick(self);
end;

end.
