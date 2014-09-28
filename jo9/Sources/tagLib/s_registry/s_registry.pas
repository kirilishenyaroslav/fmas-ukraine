unit s_registry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxTextEdit, cxMemo, cxCheckBox, cxInplaceContainer, cxDBTL, dxBar, DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxGridBandedTableView, cxClasses, cxGridTableView, dxBarExtItems,
  FIBDatabase, pFIBDatabase, cxControls, cxTLData, ExtCtrls, IBase, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridDBTableView, cxSplitter, cxGridLevel, cxGridCustomView, cxGrid;

type
  TOpenMode=(omView, omEdit);

  Ts_registry_Form = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    InfoBarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    SelBarButton: TdxBarButton;
    SelButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    AddCurrButton: TdxBarButton;
    AddNextButton: TdxBarButton;
    dMoveUpButton: TdxBarLargeButton;
    dMoveDownButton: TdxBarLargeButton;
    StyleRepository: TcxStyleRepository;
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
    ReadTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DataSet: TpFIBDataSet;
    AddPopupMenu: TdxBarPopupMenu;
    TableView: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    Splitter: TcxSplitter;
    DataSetParam: TpFIBDataSet;
    DataSourceParam: TDataSource;
    TableViewID_KEY: TcxGridDBColumn;
    TableViewID_PARAM: TcxGridDBColumn;
    TableViewPARAM_NAME: TcxGridDBColumn;
    TableViewPARAM_VALUE: TcxGridDBColumn;
    TreeList: TcxDBTreeList;
    TreeListID_KEY: TcxDBTreeListColumn;
    TreeListLINK_TO: TcxDBTreeListColumn;
    TreeListNAME_KEY: TcxDBTreeListColumn;
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeListFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AddCurrButtonClick(Sender: TObject);
    procedure AddNextButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure dMoveUpButtonClick(Sender: TObject);
    procedure dMoveDownButtonClick(Sender: TObject);
    procedure TreeListCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SelectAll;
    procedure LocateRecord(Key : integer);
    procedure InitConnection(DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE);
    procedure MoveNode(ADirection: Integer; IdKey: Integer);
  end;

function ShowRegistry(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; RTrans: TISC_TR_HANDLE; fs: TFormStyle): variant; stdcall;
exports  ShowRegistry;

var
  s_registry_Form: Ts_registry_Form;

implementation

uses s_registry_Add{, TagTypes};

{$R *.dfm}

function ShowRegistry(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; RTrans: TISC_TR_HANDLE; fs: TFormStyle): variant; stdcall;
var
  frm: Ts_registry_Form;
begin
  if fs=fsNormal then begin
    s_registry_Form := Ts_registry_Form.Create(AOwner);
    with s_registry_Form do begin
     InitConnection(DBHandle,RTrans);

     ShowModal;
    end;
  end
  else if fs = fsMDIChild then begin
    frm := Ts_registry_Form.Create(AOwner);
    with frm do begin
      InitConnection(DBHandle,RTrans);

      FormStyle:=fs;
      Show;
    end;
  end;
end;

procedure Ts_registry_Form.SelectAll;
begin
  DataSet.CloseOpen(True);
//  TreeList.FullExpand;
end;

procedure Ts_registry_Form.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then begin
  TableViewID_KEY.Visible := not TableViewID_KEY.Visible;
  TableViewID_PARAM.Visible := not TableViewID_PARAM.Visible;
 end;
end;

procedure Ts_registry_Form.TreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Node.HasChildren then
    ACanvas.Font.Style:=[fsBold]
  else
    ACanvas.Font.Style:=[];
end;

procedure Ts_registry_Form.TreeListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
 DataSetParam.Close;

 if AFocusedNode.Parent = nil then Exit;

 if VarIsNull(AFocusedNode.Parent.Values[2]) then Exit;
 if VarIsNull(AFocusedNode.Values[2]) then Exit;

 DataSetParam.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAMS('
 + QuotedStr(AFocusedNode.Parent.Values[0]) + ', ' +  QuotedStr(AFocusedNode.Values[2]) + ',46)';

 DataSetParam.Open;
end;

procedure Ts_registry_Form.LocateRecord(Key: integer);
begin
  DataSet.Locate('ID_KEY', Key, []);
end;

procedure Ts_registry_Form.InitConnection(DBHandle: TISC_DB_HANDLE;
  RTrans: TISC_TR_HANDLE);
begin
  Database.Handle:=        DBHandle;
  ReadTransaction.Handle:= RTrans;
end;

procedure Ts_registry_Form.FormShow(Sender: TObject);
begin
  Update;
  SelectAll;
end;

procedure Ts_registry_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;


procedure Ts_registry_Form.AddCurrButtonClick(Sender: TObject);
var
 LinkTo   : Integer;
 Key      : Integer;

 Key_Name : string;

 f        : Ts_Registry_Add_Form;
begin
 LinkTo := -1;

 if TreeList.FocusedNode <> nil then
   if TreeList.FocusedNode.Level > 0 then
     LinkTo := TreeList.FocusedNode.Parent.Values[0];

 f := Ts_Registry_Add_Form.Create(Self);
 f.Caption := 'Добавление ключа реестра';

 if f.ShowModal <> mrOk then Exit;

 Key_Name :=Trim(f.NameEdit.Text);

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('S_REGESTRY_ADD', [LinkTo, Key_Name]);
 StoredProc.Transaction.Commit;

 Key := StoredProc.Fields[0].AsInteger;

 SelectAll;
 LocateRecord(Key);
end;

procedure Ts_registry_Form.AddNextButtonClick(Sender: TObject);
var
 LinkTo   : Integer;
 Key      : Integer;

 Key_Name : string;

 f        : Ts_Registry_Add_Form;
begin
 if TreeList.FocusedNode = nil then Exit;

 LinkTo := TreeList.FocusedNode.Values[0];

 f := Ts_Registry_Add_Form.Create(Self);
 f.Caption := 'Изменение ключа реестра';

 if f.ShowModal <> mrOk then Exit;

 Key_Name :=Trim(f.NameEdit.Text);

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('S_REGESTRY_ADD', [LinkTo, Key_Name]);
 StoredProc.Transaction.Commit;

 Key := StoredProc.Fields[0].AsInteger;

 SelectAll;
 LocateRecord(Key);
end;

procedure Ts_registry_Form.EditButtonClick(Sender: TObject);
var
 Key      : Integer;
 Key_Name : string;

 f        : Ts_Registry_Add_Form;
begin
 if TreeList.FocusedNode = nil then Exit;

 Key := TreeList.FocusedNode.Values[0];

 f := Ts_Registry_Add_Form.Create(Self);
 f.Caption:='Редактирование ключа реестра';


 f.NameEdit.Text := TreeList.FocusedNode.Values[2];

 if f.ShowModal <> mrOk then Exit;

 Key_Name:=Trim(f.NameEdit.Text);

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('S_REGESTRY_MOD', [Key_Name]);
 StoredProc.Transaction.Commit;

 SelectAll;
 LocateRecord(Key);
end;

procedure Ts_registry_Form.DelButtonClick(Sender: TObject);
var
 Key : Integer;
begin
 if TreeList.FocusedNode = nil then Exit;

 if TreeList.FocusedNode.HasChildren then begin
  ShowMessage('Данный ключ реестра имеет дочерние ключи. Удаление невозможно!');
  Exit;
 end;

 if MessageDlg('Вы действительно хотите удалить выбранную запись?', mtConfirmation, [mbYes, mbNo], -1) <> mrYes then Exit;

 Key:= -1;

 if ((TreeList.FocusedNode.Parent = nil) or (TreeList.FocusedNode.Parent.Level < 0)) then
 begin
   if TreeList.FocusedNode.GetNextSibling <> nil then
     Key:=TreeList.FocusedNode.GetNextSibling.Values[0]
   else
     if TreeList.FocusedNode.GetPrevSibling <> nil then
       Key:=TreeList.FocusedNode.GetPrevSibling.Values[0];
 end
 else
   if TreeList.FocusedNode.Parent.Count = 1 then
   begin
     Key:=TreeList.FocusedNode.Parent.Values[0];
   end
   else
     if TreeList.FocusedNode.Parent.Count > 0 then
     begin
       if TreeList.FocusedNode.GetNextSibling <> nil then
         Key:=TreeList.FocusedNode.GetNextSibling.Values[0]
       else
         if TreeList.FocusedNode.GetPrevSibling <> nil then
           Key:=TreeList.FocusedNode.GetPrevSibling.Values[0];
     end;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('S_REGESTRY_DEL', [TreeList.FocusedNode.Values[0]]);
 StoredProc.Transaction.Commit;

 SelectAll;
 LocateRecord(Key);
end;

procedure Ts_registry_Form.SelButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;

 ModalResult:=mrOk;
end;

procedure Ts_registry_Form.RefreshButtonClick(Sender: TObject);
var
 Key: Integer;
begin
 Key := -1;

 if TreeList.FocusedNode <> nil then Key := TreeList.FocusedNode.Values[0];

 SelectAll;
 LocateRecord(Key);
end;

procedure Ts_registry_Form.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure Ts_registry_Form.MoveNode(ADirection: Integer; IdKey: Integer);
begin
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('S_REGESTRY_MOVE', [IdKey, ADirection]);
 StoredProc.Transaction.Commit;
end;

procedure Ts_registry_Form.dMoveUpButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 MoveNode(-1, TreeList.FocusedNode.Values[0]);
 RefreshButtonClick(Sender);
end;

procedure Ts_registry_Form.dMoveDownButtonClick(Sender: TObject);
begin
 if TreeList.FocusedNode = nil then Exit;
 MoveNode(+1, TreeList.FocusedNode.Values[0]);
 RefreshButtonClick(Sender);
end;

end.
