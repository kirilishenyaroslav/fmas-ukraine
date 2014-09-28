unit ini_Group_unitM_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, Db, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, Menus, ActnList, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, ib_externals,
  FIBDatabase, pFIBDatabase, Variants, pUtils;

type

  Tini_Group_unitM_Form1 = class(TForm)
    ToolBar1: TToolBar;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    EditButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CloseButton: TSpeedButton;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    SelectButton: TSpeedButton;
    DataSource1: TDataSource;
    PopupMenu: TPopupMenu;
    AddPopup: TMenuItem;
    EditPopup: TMenuItem;
    DelPopup: TMenuItem;
    N4: TMenuItem;
    RefreshPopup: TMenuItem;
    SelectPopup: TMenuItem;
    ToolButton1: TToolButton;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    DBGrid1: TcxGrid;
    DBGrid1Level1: TcxGridLevel;
    TableView: TcxGridDBTableView;
    ID_GROUP_UNITM_Column: TcxGridDBColumn;
    NAME_GROUP_UNITM_Column: TcxGridDBColumn;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pFIBTransaction2: TpFIBTransaction;
    procedure RefreshButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddPopupClick(Sender: TObject);
    procedure EditPopupClick(Sender: TObject);
    procedure DelPopupClick(Sender: TObject);
    procedure RefreshPopupClick(Sender: TObject);
    procedure SelectPopupClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
   id_Group_unitM_Add    : Integer;
   id_pos : integer;
   destructor Destroy; override;
  end;

function ShowSprav(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_unit_meas : int64) : Variant; stdcall;
exports ShowSprav;

implementation
uses ini_Group_UnitM_Form_Add;
{$R *.DFM}


function ShowSprav(AOwner : TComponent; DBHandle : PVoid; fs : TFormStyle; id_unit_meas : int64) : Variant; stdcall;
var
 SpravForm : Tini_Group_unitM_Form1;
 res : TResultArray;
begin
 SpravForm := Tini_Group_unitM_Form1.Create(AOwner);
 SpravForm.Database.Handle := DBHandle;
 SpravForm.FormStyle := fs;
 SpravForm.id_pos := id_unit_meas;      
 Result := NULL;
 if fs = fsNormal then begin
  if SpravForm.ShowModal = mrOK then begin
   Result := VarArrayOf([SpravForm.DataSet.Fields[0].Value, SpravForm.DataSet.Fields[1].Value]);
  end;
 end; 
end;

destructor Tini_Group_unitM_Form1.Destroy;
begin
 inherited;
end;


procedure Tini_Group_unitM_Form1.RefreshButtonClick(Sender: TObject);
var
 id_Key : integer;
begin
 id_Key := DataSet['ID_GROUP_UNITM'];

 DataSet.Active := False;
 DataSet.Active := True;

 DataSet.Locate('ID_GROUP_UNITM', id_Key, []);
end;

procedure Tini_Group_unitM_Form1.CloseButtonClick(Sender: TObject);
begin
 if FormStyle = fsNormal then ModalResult := mrCancel
 else Close;
end;

procedure Tini_Group_unitM_Form1.AddButtonClick(Sender: TObject);
var
 AddForm : Tini_Group_UnitM_Form_Add1;
begin
 AddForm := Tini_Group_UnitM_Form_Add1.Create(Self);
 AddForm.Caption := 'Додати групу одиниць вимірювання';
 AddForm.ShowModal;
 if AddForm.ModalResult = mrOk then begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_GROUP_UNIT_ADD', [AddForm.Name_Group_unitM.Text]);
  id_Group_unitM_Add := StoredProc.Fields[0].AsInteger;
  StoredProc.Transaction.Commit;
  RefreshButtonClick(Sender);
 end;
 AddForm.Free;
end;

procedure Tini_Group_unitM_Form1.EditButtonClick(Sender: TObject);
var
 AddForm : Tini_Group_unitM_Form_Add1;
begin
 if DataSet.Fields[0].AsString = '' then Exit;
 AddForm := Tini_Group_UnitM_Form_Add1.Create(Self);
 AddForm.Caption := 'Змінити групу одиниць вимірювання';
 AddForm.Name_Group_unitM.Text := DataSet.Fields[1].AsString;
 ini_Group_unitM_Form_Add.id_Group_unitM         := DataSet.Fields[0].AsInteger;
 AddForm.ShowModal;
 if AddForm.ModalResult = mrOk then begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_GROUP_UNIT_MODIFY', [ini_Group_unitM_Form_Add.id_Group_unitM,
  AddForm.Name_Group_unitM.Text]);
  StoredProc.Transaction.Commit;
  RefreshButtonClick(Sender);
 end;
 AddForm.Free;
end;

procedure Tini_Group_unitM_Form1.DelButtonClick(Sender: TObject);
begin
 if DataSet.Fields[0].AsString = '' then Exit;
 case MessageDlg('Ви дійсно бажаєте знищити цей запис?', mtConfirmation, [mbYes, mbNo], 0) of
 mrYes :
  begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('PUB_SP_GROUP_UNIT_DEL', [DataSet.Fields[0].AsInteger]);
   StoredProc.Transaction.Commit;
   RefreshButtonClick(Sender);
  end;
 mrNo : Exit;
 end;
end;

procedure Tini_Group_unitM_Form1.SelectButtonClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure Tini_Group_unitM_Form1.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #27 then CloseButtonClick(Sender);
 if SelectButton.Visible and (Key = #13) then SelectButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.DBGrid1DblClick(Sender: TObject);
begin
 if SelectButton.Visible then SelectButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tini_Group_unitM_Form1.AddPopupClick(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.EditPopupClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.DelPopupClick(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.RefreshPopupClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.SelectPopupClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.DBGrid1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_F5 then RefreshButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionSelExecute(Sender: TObject);
begin
 DBGrid1DblClick(Sender); 
end;

procedure Tini_Group_unitM_Form1.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.FormShow(Sender: TObject);
begin
 DataSet.Active := False;
 DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_GROUP_UNITM_VIEW';
 DataSet.Active := True;
 if id_pos <> -1 then begin
  id_pos := -1;
  DataSet.Locate('ID_GROUP_UNITM', id_pos, []);
 end;
end;

procedure Tini_Group_unitM_Form1.FormCreate(Sender: TObject);
begin
 id_pos := -1;
end;

end.
