{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                   Модуль "Справочник объектов водоснабжения"                 }
{       Отображение, изменение и удаление объектов водоснабжения ГПП, а также  }
{       их характеристик                                                       }
{                                               ответственный: Андрей Таганский}

unit sp_Object_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, StdCtrls, Grids, DBGrids, ExtCtrls, ImgList,
  DBCtrls, Menus, IniFiles, AppEvnts, FIBQuery, pFIBQuery, pFIBStoredProc,
  BaseTypes, Sys_Options, cxInplaceContainer, cxTL, cxControls, cxGraphics,
  cxCustomData, cxStyles, cxCheckBox, cxTextEdit, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxSplitter, ActnList, cxMaskEdit, cxDBTL,
  FIBDataSet, pFIBDataSet, cxTLData, FR_DSet, FR_Class, cxContainer, dxBar,
  dxBarExtItems, dogLoaderUnit, FIBDatabase, pFIBDatabase, IB_Externals;
type
  TTreeRecord = packed record
   _Column : integer;
   _Value  : variant;
  end;
  TTreeArray = array of TTreeRecord;

  Tsp_Object_Form1 = class(TForm)
    RightPanel: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    PopupMenu2: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    LeftPanel: TPanel;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Query: TpFIBQuery;
    StoredProc: TpFIBStoredProc;
    N4: TMenuItem;
    pSelectButton: TMenuItem;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    StringGrid1: TcxGridTableView;
    Modified_Column: TcxGridColumn;
    id_Plan_Ch_Column: TcxGridColumn;
    id_Object_Column2: TcxGridColumn;
    Date_Beg_Column: TcxGridColumn;
    Date_End_Column: TcxGridColumn;
    Capacity_Column: TcxGridColumn;
    Percent_Column: TcxGridColumn;
    Splitter1: TcxSplitter;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    TreeList: TcxDBTreeList;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ID_TYPE_OBJECT_COLUMN: TcxDBTreeListColumn;
    ID_OBJECT_COLUMN: TcxDBTreeListColumn;
    NAME_COLUMN: TcxDBTreeListColumn;
    ID_DEPARTMENT_COLUMN: TcxDBTreeListColumn;
    LINKTO_COLUMN: TcxDBTreeListColumn;
    NAME_DEPARTMENT_COLUMN: TcxDBTreeListColumn;
    Report: TfrReport;
    RowDataset: TfrUserDataset;
    Panel1: TPanel;
    Label2: TLabel;
    DepLabel: TLabel;
    Label1: TLabel;
    ForPlanLabel: TLabel;
    FOR_PLAN_COLUMN: TcxDBTreeListColumn;
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
    dxBarDockControl: TdxBarDockControl;
    Edit_Ch: TdxBarButton;
    Cancel_Button: TdxBarButton;
    Apply_Button: TdxBarButton;
    Del_Ch_Button: TdxBarButton;
    Edit_Ch_Button: TdxBarButton;
    Add_Ch_Button: TdxBarButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure StringGridSaveResult(Sender : TObject; var Flag1 : boolean);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Add_Ch_ButtonClick(Sender: TObject);
    procedure Del_Ch_ButtonClick(Sender: TObject);
    procedure Edit_Ch_ButtonClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure Edit_ChClick(Sender: TObject);
    procedure Cancel_ButtonClick(Sender: TObject);
    procedure Apply_ButtonClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure TreeListDblClick(Sender: TObject);
    procedure TreeListContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure pSelectButtonClick(Sender: TObject);
    procedure TreeListFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure TreeListCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    function BeforePrint: boolean;
    procedure PreviewButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ReportGetValue(const ParName: String; var ParValue: Variant);
    procedure MoveButtonClick(Sender : TObject);
    procedure SearchEditPropertiesChange(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
  private
   DelChargeArray : array of integer;
  public
   id_Object       : Integer;
   Name_Object     : string;
   input, output   : TSpravParams;
   function SelectAll : integer;
   procedure LocateRecord(Key : integer);
   destructor Destroy; override;
   function tagShow(SpravOptions : TSpravOptions) : TResultArray;
  end;
var
//  sp_Object_Form1 : Tsp_Object_Form1;
  PanelVisible    : boolean;

 procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;
 exports Load;

implementation
{$Define rt}
{$R *.DFM}

uses sp_Object_Charge_Form_Add, sp_Object_Form_Add, Variants;

var
 Options : TSpravOptions;

procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;
var
 f : Tsp_Object_Form1;
begin
 f := Tsp_Object_Form1.Create(Owner);
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


destructor Tsp_Object_Form1.Destroy;
var
 sp_Object_Form1 : Tsp_Object_Form1;
begin
// sp_Object_Form1 := nil;
 inherited;
end;

function Tsp_Object_Form1.tagShow(SpravOptions : TSpravOptions) : TResultArray;
var
 mr      : integer;
 idVar   : integer;
 TextVar : string;

 Sprav   : Tsp_Object_Form1;
begin
// if sp_Object_Form1 <> nil then
  if not SpravOptions.isModal then begin
   Show;
   Exit;
  end;

 Options := SpravOptions;

 SetLength(Result, 0);
 if Options.isModal then begin
  Sprav := Tsp_Object_Form1.Create(Self);
  mr := Sprav.ShowModal;
  if mr = mrOK then begin
   idVar   := Sprav.TreeList.FocusedNode.Values[1];
   TextVar := Sprav.TreeList.FocusedNode.Values[2];

   SetLength(Result, 2);

   Result[0] := idVar;
   Result[1] := TextVar;

   Sprav.DataSet.Close;
  end;
 end else begin
  Sprav := Tsp_Object_Form1.Create(Self);
  Sprav.FormStyle := fsMDIChild;
  Sprav.Show;
 end;
end;

procedure Tsp_Object_Form1.StringGridSaveResult(Sender : TObject; var Flag1 : boolean);
var
i, j : integer;
begin
  if Flag1 then begin
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;

   for j := 0 to StringGrid1.DataController.RecordCount - 1 do begin
{Значения нулевого поля StringGrid1: 0 - нет изменений, 1 - запись модифицирована,
                                     2 - добавлена запись}


    if StringGrid1.DataController.Values[j, 0] = '0' then continue;
    if StringGrid1.DataController.Values[j, 0] = '1' then begin

     StoredProc.ExecProcedure('SP_SP_OBJECT_CHARGE_MODIFY',
     [StringGrid1.DataController.Values[j, 1], StringGrid1.DataController.Values[2, j],
     StringGrid1.DataController.Values[j, 5], StringGrid1.DataController.Values[6, j],
     StrToDate(StringGrid1.DataController.Values[j, 3]),
     StrToDate(StringGrid1.DataController.Values[j, 4]), SYS_MAX_TIMESTAMP]);

    end;
    if StringGrid1.DataController.Values[j, 0] = '2' then begin

     for i := 0 to StringGrid1.DataController.RecordCount - 1 do begin
      if StringGrid1.DataController.Values[i, 0] = '0' then begin
       StoredProc.ExecProcedure('sp_sp_object_charge_add_1',
       [StringGrid1.DataController.Values[i, 1], SYS_MAX_TIMESTAMP]);
      end;
     end;
     StoredProc.ExecProcedure('sp_sp_object_charge_add_2',
     [StringGrid1.DataController.Values[j, 2], StringGrid1.DataController.Values[j, 5],
     StringGrid1.DataController.Values[j, 6], StrToDate(StringGrid1.DataController.Values[j, 3]),
     StrToDate(StringGrid1.DataController.Values[j, 4]), SYS_MAX_TIMESTAMP]);
    end;
   end;
   for j := 0 to Length(DelChargeArray) - 1 do begin
    StoredProc.ExecProcedure('SP_SP_OBJECT_CHARGE_DEL',
    [DelChargeArray[j]]);
   end;
   SetLength(DelChargeArray, 0);

   StoredProc.Transaction.Commit;
  end;
end;

procedure Tsp_Object_Form1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tsp_Object_Form1.FormCreate(Sender: TObject); //Добавляю корневые узлы
begin
 Modified_Column.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 id_Plan_Ch_Column.DataBinding.ValueTypeClass := TcxIntegerValueType;
 id_Object_Column2.DataBinding.ValueTypeClass := TcxIntegerValueType;
 Date_Beg_Column.DataBinding.ValueTypeClass   := TcxDateTimeValueType;
 Date_End_Column.DataBinding.ValueTypeClass   := TcxDateTimeValueType;
 Capacity_Column.DataBinding.ValueTypeClass   := TcxCurrencyValueType;
 Percent_Column.DataBinding.ValueTypeClass    := TcxCurrencyValueType;

{ if PanelVisible then begin
  Grid.Visible               := False;
  BarManager.Bars[1].Visible := False;

  N9.Enabled             := False;
  N10.Enabled            := False;
  N11.Enabled            := False;
  N13.Enabled            := False;
  N14.Enabled            := False;
  Add_Ch_Button.Visible  := ivNever;
  Del_Ch_Button.Visible  := ivNever;
  Edit_Ch_Button.Visible := ivNever;
  Apply_Button.Visible   := ivNever;
  Cancel_Button.Visible  := ivNever;
 end
 else begin
  Splitter1.Visible      := False;
  RightPanel.Visible     := False;
  LeftPanel.Align        := alClient;
 end;

 if Options.canAdd then AddButton.Visible := ivAlways else AddButton.Visible := ivNever;
 if Options.canEdit then EditButton.Visible := ivAlways else EditButton.Visible := ivNever;
 if Options.canDelete then DelButton.Visible := ivAlways else DelButton.Visible := ivNever;
 if Options.MoveUp then MoveUpButton.Visible := ivAlways else MoveUpButton.Visible := ivNever;
 if Options.MoveDown then MoveDownButton.Visible := ivAlways else MoveDownButton.Visible := ivNever;
 if Options.canSelect then SelectButton.Visible := ivAlways else SelectButton.Visible := ivNever;
 BarManager.Bars[0].Visible := not(Options.HideButtons);
}
 Splitter1.CloseSplitter;
end;

procedure Tsp_Object_Form1.AddButtonClick(Sender: TObject);
var
 Key     : integer;
 Flag    : boolean;
 ForPlan : integer;
 sp_Object_Form_Add1 : Tsp_Object_Form_Add1;
 function Get_idTypeProduct(ANode : TcxTreeListNode) : integer;
 begin
  if ANode = nil then begin
   Result := 0;
   Exit;
  end;

  if VarIsNull(ANode.Values[1]) then Result := ANode.Values[0]
  else Result := Get_idTypeProduct(ANode.Parent);
 end;
begin
// if sp_Object_Form_Add1 <> nil then Exit;

 sp_Object_Form_Add1 := Tsp_Object_Form_Add1.Create(Self);
 sp_Object_Form_Add1.pFIBDatabase1.Handle := WorkDatabase.Handle;

 sp_Object_Form_Add1._is_Edit := False;

 if TreeList.FocusedNode = nil then begin
  sp_Object_Form_Add1.KindRadioGroup.ItemIndex := 0;
  sp_Object_Form_Add1.KindRadioGroup.Enabled   := False;

  sp_Object_Form_Add1.LevelRadioGroup.ItemIndex := 0;
  sp_Object_Form_Add1.LevelRadioGroup.Enabled   := False;
 end
 else begin
  if not VarIsNull(TreeList.FocusedNode.Values[1]) then begin
   Query.SQL.Text := 'select count(id_Plan_Ch) from sp_Object_Charge where id_Object='
   + IntToStr(TreeList.FocusedNode.Values[1]) + ' and use_end='
   + QuotedStr(DateTimeToStr(SYS_MAX_TIMESTAMP));
   Query.ExecQuery;

   sp_Object_Form_Add1.HasPlanCh := (Query.Fields[0].AsInteger > 0);
   sp_Object_Form_Add1.KindRadioGroup.ItemIndex := 1;

   Query.Close;
  end else sp_Object_Form_Add1.KindRadioGroup.ItemIndex := 0;

  if TreeList.FocusedNode.Parent <> nil then
   if not VarIsNull(TreeList.FocusedNode.Parent.Values[1]) then begin
    sp_Object_Form_Add1.KindRadioGroup.ItemIndex := 1;
    sp_Object_Form_Add1.KindRadioGroup.Enabled   := False;
   end;
 end;

//-----------

 if sp_Object_Form_Add1.ShowModal <> mrOk then Exit;

 Flag    := False;
 ForPlan := sp_Object_Form_Add1.ForPlanCheckBox.EditValue;

 StoredProc.Transaction.StartTransaction;
 if TreeList.FocusedNode <> nil then begin
  if VarIsNull(TreeList.FocusedNode.Values[1]) then begin
   if sp_Object_Form_Add1.LevelRadioGroup.ItemIndex = 0 then begin
    if sp_Object_Form_Add1.KindRadioGroup.ItemIndex = 0 then begin
     if TreeList.FocusedNode.Level = 0 then begin
      StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_ADD', ['-1', sp_Object_Form_Add1.Edit1.Text])
     end
     else begin
      StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_ADD',
      [TreeList.FocusedNode.Parent.Values[0], sp_Object_Form_Add1.Edit1.Text]);
     end;
    end;
    if sp_Object_Form_Add1.KindRadioGroup.ItemIndex = 1 then begin
     StoredProc.ExecProcedure('SP_SP_OBJECT_ADD',
     [Get_idTypeProduct(TreeList.FocusedNode), sp_Object_Form_Add1.Edit1.Text,
      sp_Object_Form_Add.Id_Department, '-1', ForPlan]);

     Flag := True;
    end;
   end
   else if sp_Object_Form_Add1.LevelRadioGroup.ItemIndex = 1 then begin
    if sp_Object_Form_Add1.KindRadioGroup.ItemIndex = 0 then begin
     StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_ADD',
     [TreeList.FocusedNode.Values[0], sp_Object_Form_Add1.Edit1.Text]);
    end;
    if sp_Object_Form_Add1.KindRadioGroup.ItemIndex = 1 then begin
     StoredProc.ExecProcedure('SP_SP_OBJECT_ADD',
     [Get_idTypeProduct(TreeList.FocusedNode), sp_Object_Form_Add1.Edit1.Text,
     sp_Object_Form_Add.Id_Department, '-1', ForPlan]);

     Flag := True;
    end;
   end;
  end
  else begin
   if sp_Object_Form_Add1.LevelRadioGroup.ItemIndex = 0 then begin
    if (sp_Object_Form_Add1.KindRadioGroup.ItemIndex = 0)
    and VarIsNull(TreeList.FocusedNode.Parent.Values[1]) then begin
     StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_ADD',
     [TreeList.FocusedNode.Parent.Values[0], sp_Object_Form_Add1.Edit1.Text]);
    end;

    if sp_Object_Form_Add1.KindRadioGroup.ItemIndex = 1 then begin
     if VarIsNull(TreeList.FocusedNode.Parent.Values[1]) then begin
      StoredProc.ExecProcedure('SP_SP_OBJECT_ADD', [Get_idTypeProduct(TreeList.FocusedNode),
      sp_Object_Form_Add1.Edit1.Text, sp_Object_Form_Add.Id_Department, '-1', ForPlan]);

      Flag := True;
     end
     else begin
      StoredProc.ExecProcedure('SP_SP_OBJECT_ADD',
      [Get_idTypeProduct(TreeList.FocusedNode), sp_Object_Form_Add1.Edit1.Text,
      sp_Object_Form_Add.Id_Department, TreeList.FocusedNode.Parent.Values[1], ForPlan]);

      Flag := True;
     end;
    end;
   end
   else if sp_Object_Form_Add1.LevelRadioGroup.ItemIndex = 1 then begin
    StoredProc.ExecProcedure('SP_SP_OBJECT_ADD',
    [Get_idTypeProduct(TreeList.FocusedNode), sp_Object_Form_Add1.Edit1.Text,
    sp_Object_Form_Add.Id_Department, TreeList.FocusedNode.Values[1], ForPlan]);

    Flag := True;
   end;
  end;
 end
 else StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_ADD', ['-1', sp_Object_Form_Add1.Edit1.Text]);
 StoredProc.Transaction.Commit;

 if Flag then Key := SelectAll + StoredProc.Fields[0].AsInteger
 else begin
  SelectAll;
  Key := StoredProc.Fields[0].AsInteger;
 end;

 LocateRecord(Key);
end;


procedure Tsp_Object_Form1.RefreshButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if DataSet.RecordCount > 0 then Key := DataSet.Fields[0].AsInteger else Key := -1;

 SelectAll;
 LocateRecord(Key);
end;

procedure Tsp_Object_Form1.DelButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if TreeList.FocusedNode = nil then Exit;

 if TreeList.FocusedNode.Count <> 0 then begin
  if VarIsNull(TreeList.FocusedNode.Values[1]) then
   ShowMessage('Спочатку ви повинні знищити усі об''єкти та типи об''єктів,'
      + ' що належать до цього типу об''єктів.')
  else ShowMessage('Спочатку ви повинні знищити усі об''єкти,'
      + ' що належать до цього об''єкту.');

  Exit;
 end;

 if  VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  if MessageDlg('Увага', 'Чи ви дійсно бажаєте знищити тип об''екту ' + #39
  + TreeList.FocusedNode.Values[2] + #39, mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_DEL', [TreeList.FocusedNode.Values[0]]);
  StoredProc.Transaction.Commit;

 end
 else begin
  if MessageDlg('Увага', 'Чи ви дійсно бажаєте знищити тип об''екту ' + #39
  + TreeList.FocusedNode.Values[2] + #39, mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_SP_OBJECT_DEL', [TreeList.FocusedNode.Values[1]]);
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

procedure Tsp_Object_Form1.CloseButtonClick(Sender: TObject);
begin
 output['ModalResult'] := mrCancel;
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure Tsp_Object_Form1.EditButtonClick(Sender: TObject);
var
 Key     : integer;
 ForPlan : integer;
 sp_Object_Form_Add1 : Tsp_Object_Form_Add1;
begin
 if TreeList.FocusedNode = nil then Exit;
 sp_Object_Form_Add1 := Tsp_Object_Form_Add1.Create(Self);
 sp_Object_Form_Add1.pFIBDatabase1.Handle := WorkDatabase.Handle;

 sp_Object_Form_Add1._is_Edit                    := True;
 sp_Object_Form_Add1.LevelRadioGroup.Enabled     := False;
 sp_Object_Form_Add1.KindRadioGroup.Enabled      := False;
 sp_Object_Form_Add1.Edit1.Text                  := TreeList.FocusedNode.Values[2];
 sp_Object_Form_Add1.ForPlanCheckBox.EditValue   := TreeList.FocusedNode.Values[6];

 Key := TreeList.FocusedNode.Values[0];

 if VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  sp_Object_Form_Add1.Name_Department.Text      := 'немає';
  sp_Object_Form_Add1.Name_Department.Enabled   := False;
  sp_Object_Form_Add1.KindRadioGroup.ItemIndex  := 0;
  sp_Object_Form_Add1.LevelRadioGroup.ItemIndex := 0;
 end
 else begin
  if not VarIsNull(TreeList.FocusedNode.Values[5]) then sp_Object_Form_Add1.Name_Department.Text      := TreeList.FocusedNode.Values[5];
  if not VarIsNull(TreeList.FocusedNode.Values[4]) then sp_Object_Form_Add.Id_Department              := TreeList.FocusedNode.Values[4];
  sp_Object_Form_Add1.KindRadioGroup.ItemIndex  := 1;
  sp_Object_Form_Add1.LevelRadioGroup.ItemIndex := 0;
 end;

 if sp_Object_Form_Add1.ShowModal <> mrOk then Exit;

 StoredProc.Transaction.StartTransaction;

 if  VarIsNull(TreeList.FocusedNode.Values[1]) then
  StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_MODIFY',
  [TreeList.FocusedNode.Values[0], sp_Object_Form_Add1.Edit1.Text])
 else begin
  ForPlan := sp_Object_Form_Add1.ForPlanCheckBox.EditValue;
  
  StoredProc.ExecProcedure('SP_SP_OBJECT_MODIFY',
  [TreeList.FocusedNode.Values[1], sp_Object_Form_Add1.Edit1.Text,
  sp_Object_Form_Add.Id_Department, ForPlan]);
 end;

 StoredProc.Transaction.Commit;

 SelectAll;
 LocateRecord(Key);
end;

procedure Tsp_Object_Form1.N1Click(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tsp_Object_Form1.N2Click(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tsp_Object_Form1.N3Click(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tsp_Object_Form1.N5Click(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tsp_Object_Form1.N7Click(Sender: TObject);
begin
 TreeList.FullExpand;
end;

procedure Tsp_Object_Form1.N8Click(Sender: TObject);
begin
 TreeList.FullCollapse;
end;

procedure Tsp_Object_Form1.Add_Ch_ButtonClick(Sender: TObject);
var
i : integer;
begin
 if sp_Object_Charge_Form_Add1 <> nil then Exit;
 sp_Object_Charge_Form_Add.State := False;
 sp_Object_Charge_Form_Add1 := Tsp_Object_Charge_Form_Add1.Create(Self);
 sp_Object_Charge_Form_Add1.Caption := 'Додавання характеристики об''єкту';

 if sp_Object_Charge_Form_Add1.ShowModal <> mrOk then Exit;

 StringGrid1.DataController.BeginUpdate;

 i := StringGrid1.DataController.RecordCount;
 StringGrid1.DataController.RecordCount := i + 1;

 StringGrid1.DataController.Values[i, 0] := '2';
 StringGrid1.DataController.Values[i, 1] := -1;
 StringGrid1.DataController.Values[i, 2] := TreeList.FocusedNode.Values[1];
 StringGrid1.DataController.Values[i, 3] := sp_Object_Charge_Form_Add1.DateTimePicker1.Date;
 StringGrid1.DataController.Values[i, 4] := sp_Object_Charge_Form_Add1.DateTimePicker2.Date;
 StringGrid1.DataController.Values[i, 5] := StrToCurr(sp_Object_Charge_Form_Add1.VolumeEdit.Text);
 StringGrid1.DataController.Values[i, 6] := StrToCurr(sp_Object_Charge_Form_Add1.PercentEdit.Text);

 StringGrid1.DataController.EndUpdate;
end;

procedure Tsp_Object_Form1.Del_Ch_ButtonClick(Sender: TObject);
var
 k : integer;
begin
 if StringGrid1.DataController.FocusedRowIndex < 0 then Exit;

 case MessageDlg('Увага', 'Чи ви дійсно бажаєте знищити цей запис?', mtConfirmation, [mbYes, mbNo]) of
 mrYes :
  begin
   k := StringGrid1.DataController.FocusedRowIndex;
   if StringGrid1.DataController.Values[k, 0] <>  '2' then begin
    SetLength(DelChargeArray, Length(DelChargeArray) + 1);
    DelChargeArray[Length(DelChargeArray) - 1] := StrToInt(StringGrid1.DataController.Values[k, 1]);
   end;
//---

   StringGrid1.ViewData.Rows[k].Destroy;
  end;
 end;
end;

procedure Tsp_Object_Form1.Edit_Ch_ButtonClick(Sender: TObject);
var
 k : integer;
begin
 k := StringGrid1.DataController.FocusedRowIndex;
 if k < 0 then Exit;

 if sp_Object_Charge_Form_Add1 <> nil then Exit;
 sp_Object_Charge_Form_Add.State := True;
 sp_Object_Charge_Form_Add1 := Tsp_Object_Charge_Form_Add1.Create(Self);
 sp_Object_Charge_Form_Add1.Caption := 'Модифікація характеристики об''єкту';
 sp_Object_Charge_Form_Add1.DateTimePicker1.Date := StringGrid1.DataController.Values[k, 3];
 sp_Object_Charge_Form_Add1.DateTimePicker2.Date := StringGrid1.DataController.Values[k, 4];
 sp_Object_Charge_Form_Add1.VolumeEdit.Text      := StringGrid1.DataController.Values[k, 5];
 sp_Object_Charge_Form_Add1.PercentEdit.Text     := StringGrid1.DataController.Values[k, 6];

 sp_Object_Charge_Form_Add1.ShowModal;

 if sp_Object_Charge_Form_Add1.ModalResult = mrOk then begin
  StringGrid1.DataController.BeginUpdate;

  StringGrid1.DataController.Values[k, 3] := sp_Object_Charge_Form_Add1.DateTimePicker1.Date;
  StringGrid1.DataController.Values[k, 4] := sp_Object_Charge_Form_Add1.DateTimePicker2.Date;
  StringGrid1.DataController.Values[k, 5] := sp_Object_Charge_Form_Add1.VolumeEdit.Text;
  StringGrid1.DataController.Values[k, 6] := sp_Object_Charge_Form_Add1.PercentEdit.Text;

  if StringGrid1.DataController.Values[k, 0] <> '2' then begin
    StringGrid1.DataController.Values[k, 0] := '1';
  end;

  StringGrid1.DataController.EndUpdate;
 end;
end;

procedure Tsp_Object_Form1.N9Click(Sender: TObject);
begin
 Edit_Ch_ButtonClick(Sender);
end;

procedure Tsp_Object_Form1.N10Click(Sender: TObject);
begin
 Add_Ch_ButtonClick(Sender);
end;

procedure Tsp_Object_Form1.N11Click(Sender: TObject);
begin
 Del_Ch_ButtonClick(Sender);
end;

procedure Tsp_Object_Form1.Edit_ChClick(Sender: TObject);
begin
 Edit_Ch.Visible        := ivNever;

 Add_Ch_Button.Visible  := ivAlways;
 Del_Ch_Button.Visible  := ivAlways;
 Edit_Ch_Button.Visible := ivAlways;
 Apply_Button.Visible   := ivAlways;
 Cancel_Button.Visible  := ivAlways;
 N9.Enabled             := True;
 N10.Enabled            := True;
 N11.Enabled            := True;
 N12.Enabled            := False;
 N13.Enabled            := True;
 N14.Enabled            := True;
end;

procedure Tsp_Object_Form1.Cancel_ButtonClick(Sender: TObject);
begin
 Add_Ch_Button.Visible  := ivNever;
 Del_Ch_Button.Visible  := ivNever;
 Edit_Ch_Button.Visible := ivNever;
 Apply_Button.Visible   := ivNever;
 Cancel_Button.Visible  := ivNever;

 Edit_Ch.Visible        := ivAlways;

 N9.Enabled             := False;
 N10.Enabled            := False;
 N11.Enabled            := False;
 N12.Enabled            := True;
 N13.Enabled            := False;
 N14.Enabled            := False;
 TreeListFocusedNodeChanged(Sender, TreeList.FocusedNode, TreeList.FocusedNode);
 SetLength(DelChargeArray, 0);
end;

procedure Tsp_Object_Form1.N12Click(Sender: TObject);
begin
 Edit_ChClick(sender);
end;

procedure Tsp_Object_Form1.N13Click(Sender: TObject);
begin
 Apply_ButtonClick(Sender);
end;

procedure Tsp_Object_Form1.N14Click(Sender: TObject);
begin
 Cancel_ButtonClick(Sender);
end;

procedure Tsp_Object_Form1.Apply_ButtonClick(Sender: TObject);
var
j     : integer;
Flag  : boolean;
Flag1 : boolean;
begin
 Flag  := False;
 Flag1 := False;
 if Grid.Enabled then begin
  for j := 0 to StringGrid1.DataController.RecordCount - 1 do begin
   if (StringGrid1.DataController.Values[j, 0] = '1') or (StringGrid1.DataController.Values[j, 0] = '2') then begin
    Flag := True;
    Break;
   end;
  end;
  if Length(DelChargeArray) > 0 then Flag := True;

  if Flag then begin
   case MessageDlg('Увага', 'Чи бажаєте Ви зберегти зміни?', mtConfirmation, [mbYes, mbCancel]) of
   mrYes :
    begin
     Flag1 := True;
    end;
   mrCancel : exit;
   end;
   if Flag1 then begin
    StringGridSaveResult(Sender, Flag1);
    for j := 0 to StringGrid1.DataController.RecordCount - 1 do begin
     StringGrid1.DataController.Values[j, 0] := '0';
    end;
    TreeListFocusedNodeChanged(Sender, TreeList.FocusedNode, TreeList.FocusedNode);
   end;
  end;
 end;

 Edit_Ch.Visible        := ivAlways;

 Add_Ch_Button.Visible  := ivNever;
 Del_Ch_Button.Visible  := ivNever;
 Edit_Ch_Button.Visible := ivNever;
 Apply_Button.Visible   := ivNever;
 Cancel_Button.Visible  := ivNever;
 N9.Enabled             := False;
 N10.Enabled            := False;
 N11.Enabled            := False;
 N12.Enabled            := True;
 N13.Enabled            := False;
 N14.Enabled            := False;
end;

procedure Tsp_Object_Form1.FormShow(Sender: TObject);
begin
 SelectAll;
 TreeList.SetFocus;
end;

procedure Tsp_Object_Form1.SelectButtonClick(Sender: TObject);
begin
 if not VarIsNull(TreeList.FocusedNode.Values[1]) then
 begin
   output['ID_OBJECT'] := TreeList.FocusedNode.Values[1];
   output['NAME_OBJECT'] := TreeList.FocusedNode.Values[2];
   output['ModalResult'] := mrOk;
   ModalResult := mrOk;
 end;
end;

procedure Tsp_Object_Form1.TreeListDblClick(Sender: TObject);
begin
 if SelectButton.Visible = ivAlways then SelectButtonClick(Sender);
end;

procedure Tsp_Object_Form1.TreeListContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
 pSelectButton.Enabled := SelectButton.Enabled;
 pSelectButton.Visible := SelectButton.Visible = ivAlways;
end;

procedure Tsp_Object_Form1.pSelectButtonClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

procedure Tsp_Object_Form1.TreeListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var
 j : integer;

 Flag, Flag1 : boolean;

 ID_PLAN_CH : integer;
 ID_OBJECT  : integer;
 DATE_BEG   : TDate;
 DATE_END   : TDate;
 CAPACITY   : Currency;
 PERCENT    : Currency;
begin
 if AFocusedNode = nil then begin
  DepLabel.Caption     := 'Немає';
  ForPlanLabel.Caption := 'Ні';
  Exit;
 end;

 if VarIsNull(AFocusedNode.Values[5]) then
  DepLabel.Caption     := 'Немає'
 else
  DepLabel.Caption := AFocusedNode.Values[5];

 if VarIsNull(AFocusedNode.Values[1]) then
  ForPlanLabel.Caption := 'Ні'
 else begin
  if AFocusedNode.Values[6] then
   ForPlanLabel.Caption := 'Так'
  else
   ForPlanLabel.Caption := 'Ні';
 end;
  

 if not PanelVisible then Exit;

 Flag := False;
 if StringGrid1.Visible then begin
  for j := 0 to StringGrid1.DataController.RecordCount - 1 do begin
   if (StringGrid1.DataController.Values[j, 0] = '1') or (StringGrid1.DataController.Values[j, 0] = '2') then begin
    Flag := True;
    Break;
   end;
  end;

  if Length(DelChargeArray) > 0 then Flag := True;

  if Flag then begin
   case MessageDlg('Увага', 'Чи бажаєте Ви зберегти зміни ?', mtConfirmation, [mbYes, mbNo]) of
    mrYes : Flag1 := True;
    mrNo  : StringGrid1.DataController.RecordCount := 0;
   end;
   StringGridSaveResult(Sender, Flag1);
  end;
 end;

 if TreeList.FocusedNode.HasChildren then begin
  Grid.Visible     := False;
  BarManager.Bars[1].Visible := False;
  Exit;
 end;

 if not VarIsNull(TreeList.FocusedNode.Values[1]) then begin
  Grid.Visible               := True;
  BarManager.Bars[1].Visible := True;

  Edit_Ch.Visible        := ivAlways;

  Add_Ch_Button.Visible  := ivNever;
  Del_Ch_Button.Visible  := ivNever;
  Edit_Ch_Button.Visible := ivNever;
  Add_Ch_Button.Visible  := ivNever;
  Apply_Button.Visible   := ivNever;
  Cancel_Button.Visible  := ivNever;
  N9.Enabled             := False;
  N10.Enabled            := False;
  N11.Enabled            := False;
  N12.Enabled            := True;
  N13.Enabled            := False;
  N14.Enabled            := False;

  StringGrid1.DataController.RecordCount := 0;

  Query.SQL.Text := 'select * from SP_SP_OBJECT_CHARGE_SEL(' + IntToStr(TreeList.FocusedNode.Values[1])
  + ', ' + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   Exit;
  end;

  StringGrid1.DataController.BeginUpdate;

  while not Query.Eof do begin
   StringGrid1.DataController.RecordCount := StringGrid1.DataController.RecordCount + 1;
   j := StringGrid1.DataController.RecordCount - 1;

   ID_PLAN_CH := Query['ID_PLAN_CH_PARAM'].AsInteger;
   ID_OBJECT  := Query['ID_OBJECT_PARAM'].AsInteger;
   DATE_BEG   := Query['DATE_BEG_PARAM'].AsDate;
   DATE_END   := Query['DATE_END_PARAM'].AsDate;
   CAPACITY   := Query['CAPACITY_PARAM'].AsCurrency;
   PERCENT    := Query['PERCENT_PARAM'].AsCurrency;

   StringGrid1.DataController.Values[j, 0] := '0';
   StringGrid1.DataController.Values[j, 1] := ID_PLAN_CH;
   StringGrid1.DataController.Values[j, 2] := ID_OBJECT;
   StringGrid1.DataController.Values[j, 3] := DATE_BEG;
   StringGrid1.DataController.Values[j, 4] := DATE_END;
   StringGrid1.DataController.Values[j, 5] := CAPACITY;
   StringGrid1.DataController.Values[j, 6] := PERCENT;

   Query.Next;
  end;

  StringGrid1.DataController.EndUpdate;
  Query.Close;
 end
 else begin
  Grid.Visible               := False;
  BarManager.Bars[1].Visible := False;
 end;
end;

procedure Tsp_Object_Form1.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tsp_Object_Form1.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tsp_Object_Form1.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tsp_Object_Form1.ActionSelExecute(Sender: TObject);
begin
 TreeListDblClick(Sender);
end;

procedure Tsp_Object_Form1.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tsp_Object_Form1.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

function Tsp_Object_Form1.SelectAll : integer;
begin
 if not WorkDatabase.Connected then Exit;
 DataSet.Close;
 DataSet.Open;

 Query.SQL.Text := 'select max(id_Type_Object) from ini_Type_Object';
 Query.ExecQuery;
 Result := Query.Fields[0].AsInteger;
 Query.Close;
end;

procedure Tsp_Object_Form1.LocateRecord(Key: integer);
begin
 if Key > 0 then DataSet.Locate('ID_TYPE_OBJECT', Key, [loCaseInsensitive]);
end;

procedure Tsp_Object_Form1.TreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 if AViewInfo.Focused then Exit;

 if not VarIsNull(AViewInfo.Node.Values[1]) and (AViewInfo.Column.ItemIndex = 2) then
  ACanvas.Font.Color := clNavy;
end;

function Tsp_Object_Form1.BeforePrint: boolean;
var
 i : integer;
 k : integer;
begin
 if TreeList.Count <= 0 then begin
  ShowMessage('Неможна друкувати порожній документ!');
  Result := False;
  Exit;
 end;

 Report.LoadFromFile('Reports\sp_Object.frf');

 k := 0;
 for i := 0 to TreeList.LastNode.AbsoluteIndex do
  if not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[1]) or not VarIsNull(TreeList.Nodes.AbsoluteItems[i].Values[2]) then inc(k);

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := k;

 Result := True;
end;

procedure Tsp_Object_Form1.PreviewButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.ShowReport;
end;

procedure Tsp_Object_Form1.PrintButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.PrepareReport;
 Report.PrintPreparedReportDlg;
end;

procedure Tsp_Object_Form1.ReportGetValue(const ParName: String;
  var ParValue: Variant);
var
 s    : string;
 i    : integer;

 Memo : TfrMemoView;
begin
 if ParName = 'NameObject' then begin
  Memo := TfrMemoView(Report.FindObject('Memo3'));

  s := '';
  for i := 0 to TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Level do s := s + '  ';

  if VarIsNull(TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Values[1]) then
   Memo.Font.Style := Memo.Font.Style - [fsItalic] + [fsBold]
  else
   Memo.Font.Style := Memo.Font.Style + [fsItalic] - [fsBold];

  ParValue := s + TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Values[2];
 end
 else if ParName = 'NameDep' then begin
  if VarIsNull(TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Values[1]) then
   ParValue := ''
  else
   ParValue := TreeList.Nodes.AbsoluteItems[RowDataset.RecNo].Values[5];
 end;
end;

procedure Tsp_Object_Form1.MoveButtonClick(Sender: TObject);
var
 Key : integer;
begin
 if DataSet.RecordCount = 0 then Exit;

 Key := DataSet['ID_TYPE_OBJECT'];

 if Sender = MoveUpButton then begin
  StoredProc.Transaction.StartTransaction;

  if VarIsNull(TreeList.FocusedNode.Values[1]) then
   StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_MOVE', [TreeList.FocusedNode.Values[0], '-1'])
  else
   StoredProc.ExecProcedure('SP_SP_OBJECT_MOVE', [TreeList.FocusedNode.Values[1], '-1']);

  StoredProc.Transaction.Commit;
 end
 else begin
  StoredProc.Transaction.StartTransaction;

  if VarIsNull(TreeList.FocusedNode.Values[1]) then
   StoredProc.ExecProcedure('SP_INI_TYPE_OBJECT_MOVE', [TreeList.FocusedNode.Values[0], '+1'])
  else
   StoredProc.ExecProcedure('SP_SP_OBJECT_MOVE', [TreeList.FocusedNode.Values[1], '+1']);

  StoredProc.Transaction.Commit;
 end;

 SelectAll;
 LocateRecord(Key);
end;

procedure Tsp_Object_Form1.SearchEditPropertiesChange(Sender: TObject);
begin
 DataSet.Locate('NAME', SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure Tsp_Object_Form1.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then TreeList.SetFocus;
end;

end.
