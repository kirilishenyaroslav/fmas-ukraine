unit sp_branch_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDatabase, StdCtrls, Db, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  Menus, ActnList, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxRadioGroup,
  FIBDatabase, Ibase, Variants, ImgList, dxBar, dxBarExtItems, cxTL;
const
 TABLE          = 'SP_BRANCH';
 SEL_VIEW       = 'VIEW_SP_BRANCH';
 ADD_PROC       = 'PUB_SP_BRANCH_ADD';
 DEL_PROC       = 'PUB_SP_BRANCH_DEL';
 MOD_PROC       = 'PUB_SP_BRANCH_MOD';
 PK_FIELD       = 'ID_BRANCH';

type
  TFsp_branch = class(TForm)
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    DataSet: TpFIBDataSet;
    Query: TpFIBQuery;
    ActionList1: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID_BRANCH: TcxGridDBColumn;
    cxGrid1DBTableView1CODE_BRANCH: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_BRANCH: TcxGridDBColumn;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    ChooseButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
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
    procedure DelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridDblClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure CloseButtonClick(Sender: TObject);
  public
   CurFS:TFormStyle;
   ActualDate:TDateTime;
   ResultValue:Variant;
   constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);overload;
   procedure SelectAll;
   procedure DeleteRecord;
   procedure AddRecord;
   procedure ModRecord;
   procedure RefreshDbGrid;
  end;

function GetBranches(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
exports GetBranches;

implementation

uses sp_branch_FORM_ADD, sys_options;
{$R *.DFM}

function GetBranches(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
    var T:TFsp_branch;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFsp_branch.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_branch.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;

    GetBranches:=Res;
end;



constructor TFsp_branch.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      if CurFS=fsNormal
      then ChooseButton.Enabled:=true;
      DataSet.SQLs.SelectSQL.Text := 'select * from ' + SEL_VIEW;
      DataSet.Open;
      self.FormStyle:=FS;
end;

procedure TFsp_branch.RefreshDbGrid;
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


procedure TFsp_branch.SelectAll;
begin
 DataSet.Active := false;
 DataSet.Active := true;
end;

procedure TFsp_branch.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure TFsp_branch.DelButtonClick(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFsp_branch.DeleteRecord;
var
 PK_Index : integer;
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(DEL_PROC, [PK_Index]);
 StoredProc.Transaction.Commit;

 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

procedure TFsp_branch.AddButtonClick(Sender: TObject);
begin
 AddRecord;
end;

procedure TFsp_branch.AddRecord;
var
 PK_Index : integer;
begin
 Fsp_branch_ADD := TFsp_branch_ADD.Create(Self);
 Fsp_branch_ADD.Caption := 'Додати запис';
 Fsp_branch_ADD.OKButton.Caption := 'Додати';
 Fsp_branch_ADD.ShowModal;
 if Fsp_branch_ADD.MResult = 'cancel' then exit;


 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(ADD_PROC, [Fsp_branch_ADD.KodEdit.Text, Fsp_branch_ADD.NameEdit.Text]);
 PK_index:=StoredProc.ParamByName('OUT_ID_BRANCH').AsInteger;
 StoredProc.Transaction.Commit;

 SelectAll;
 DataSet.Locate('ID_BRANCH', PK_index, [loCaseInsensitive]);

 Fsp_branch_ADD.Free;
end;

procedure TFsp_branch.ModRecord;
var
 PK_Index : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 Fsp_branch_ADD := TFsp_branch_ADD.Create(Self);
 Fsp_branch_ADD.Caption := 'Змінити запис';
 Fsp_branch_ADD.OKButton.Caption := 'Змінити';
 Fsp_branch_ADD.KodEdit.Text := DataSet.FieldByName('CODE_BRANCH').AsString;
 Fsp_branch_ADD.NameEdit.Text := DataSet.FieldByName('NAME_BRANCH').AsString;
 Fsp_branch_ADD.ShowModal;
 if Fsp_branch_ADD.MResult = 'cancel' then exit;

 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(MOD_PROC, [PK_Index, Fsp_branch_ADD.kodEdit.Text, Fsp_branch_ADD.NameEdit.Text]);
 StoredProc.Transaction.Commit;
 SelectAll;
 DataSet.Locate('ID_BRANCH', PK_index, [loCaseInsensitive]);

 Fsp_branch_ADD.Free;
end;

procedure TFsp_branch.EditButtonClick(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_branch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFsp_branch.DBGridDblClick(Sender: TObject);
begin
 if (ChooseButton.Enabled) and (ivAlways = ChooseButton.Visible) then SelButtonClick(self);
end;

procedure TFsp_branch.SelButtonClick(Sender: TObject);
begin
        if dataSet.Active and (dataset.RecordCount>0)
        then begin
                  ResultValue:=VarArrayCreate([0,1],varVariant);
                  ResultValue[0]:=DataSet.FieldByName('ID_BRANCH').Value;
                  ResultValue[1]:=DataSet.FieldByName('NAME_BRANCH').Value;
                  ModalResult := mrYes;
        end;

end;

procedure TFsp_branch.ActionModExecute(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_branch.ActionDelExecute(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFsp_branch.ActionAddExecute(Sender: TObject);
begin
 AddREcord;
end;

procedure TFsp_branch.ActionSelExecute(Sender: TObject);
begin
 DBGridDblClick(Sender);
end;

procedure TFsp_branch.N1Click(Sender: TObject);
begin
 AddRecord;
end;

procedure TFsp_branch.N2Click(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_branch.N3Click(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFsp_branch.N6Click(Sender: TObject);
begin
  DBGridDblClick(Sender);
end;

procedure TFsp_branch.N5Click(Sender: TObject);
begin
 RefreshDbGrid;
end;

procedure TFsp_branch.RefreshButtonClick(Sender: TObject);
var
 id_branch : integer;
begin
 if DataSet.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 id_branch := DataSet['ID_BRANCH'];
 SelectAll;
 DataSet.Locate('ID_BRANCH', id_branch, [loCaseInsensitive]);
end;

procedure TFsp_branch.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

procedure TFsp_branch.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFsp_branch.CloseButtonClick(Sender: TObject);
begin
    close;
end;

end.
