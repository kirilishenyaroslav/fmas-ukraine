unit ini_type_account_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDatabase, StdCtrls, Db, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  Menus, ActnList, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit,
  FIBDatabase, Ibase,Variants, ImgList, dxBar, dxBarExtItems, cxTL,
  cxCheckBox;

const
 TABLE    = 'INI_TYPE_ACCOUNT';
 SEL_VIEW = 'VIEW_INI_TYPE_ACCOUNT';
 ADD_PROC = 'PUB_SP_INI_TYPE_ACCOUNT_ADD';
 DEL_PROC = 'PUB_SP_INI_TYPE_ACCOUNT_DEL';
 MOD_PROC = 'PUB_SP_INI_TYPE_ACCOUNT_MOD';
 PK_FIELD = 'ID_TYPE_ACCOUNT';

type
  TFini_type_account = class(TForm)
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    DataSet: TpFIBDataSet;
    Query: TpFIBQuery;
    ActionList1: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
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
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridDblClick(Sender: TObject);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
  public
   CurFS:TFormStyle;
   ActualDate:TdateTime;
   ResultValue:Variant;
   procedure DeleteRecord;
   procedure AddRecord;
   procedure ModRecord;
   constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);overload;
  end;


  function GetIniAcc(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
  exports  GetIniAcc;




implementation

uses ini_type_account_FORM_ADD,
     sys_options, BaseTypes;
{$R *.DFM}

function GetIniAcc(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
    var T:TFini_type_account;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFini_type_account.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFini_type_account.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;

    GetIniAcc:=Res;

end;


procedure TFini_type_account.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure TFini_type_account.DelButtonClick(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_type_account.DeleteRecord;
var
 PK_Index : integer;
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;
 if agMessageDlg('Увага!', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(DEL_PROC, [PK_Index]);
 StoredProc.Transaction.Commit;
 DataSet.CloseOpen(true);
 selected_id := cxGridDBTableView1.Controller.FocusedRowIndex;
 dataset.CloseOpen(true);
 cxGridDBTableView1.Controller.FocusedRowIndex := selected_id;
end;

procedure TFini_type_account.AddButtonClick(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_type_account.AddRecord;
var
 PK_Index : integer;
 Fini_type_account_ADD : TFini_type_account_ADD;
 is_bank_acc, is_val_acc, no_acc : integer;
begin
 Fini_type_account_ADD := TFini_type_account_ADD.Create(Self);
 Fini_type_account_ADD.Caption := 'Новий тип рахунка';
 Fini_type_account_ADD.OKButton.Caption := 'Додати';
 Fini_type_account_ADD.ShowModal;
 if Fini_type_account_ADD.MResult = 'cancel' then exit;

 is_bank_acc := 0;
 is_val_acc := 0;
 no_acc := 0;
 if Fini_type_account_ADD.isBankAccCheck.Checked then is_bank_acc := 1;
 if Fini_type_account_ADD.cbVal.Checked then is_val_acc := 1;
 if Fini_type_account_ADD.NoAccCheck.Checked then no_acc := 1;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(ADD_PROC, [Fini_type_account_ADD.NameEdit.Text, is_bank_acc, is_val_acc, no_acc]);
 PK_Index:=StoredProc.ParamByName('OUT_ID_TYPE_ACCOUNT').AsInteger;
 StoredProc.Transaction.Commit;
 dataset.CloseOpen(true);
 DataSet.Locate('ID_TYPE_ACCOUNT', PK_Index, [loCaseInsensitive]);

 Fini_type_account_ADD.Free;
end;

procedure TFini_type_account.ModRecord;
var
 PK_Index : integer;
 Fini_type_account_ADD : TFini_type_account_ADD;
 is_bank_acc, is_val_acc, no_acc : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 Fini_type_account_ADD := TFini_type_account_ADD.Create(Self);
 Fini_type_account_ADD.Caption := 'Змінити інформацію';
 Fini_type_account_ADD.OKButton.Caption := 'Змінити';
 Fini_type_account_ADD.NameEdit.Text := DataSet.FieldByName('NAME_TYPE_ACCOUNT').AsString;
 if not VarIsNull(DataSet['IS_BANK_ACCOUNT']) then Fini_type_account_ADD.isBankAccCheck.Checked := DataSet.FieldByName('IS_BANK_ACCOUNT').AsInteger = 1;
 if not VarIsNull(DataSet['IS_VAL_ACCOUNT']) then Fini_type_account_ADD.cbVal.Checked := DataSet.FieldByName('IS_VAL_ACCOUNT').AsInteger = 1;
 if not VarIsNull(DataSet['IS_NO_ACCOUNT']) then Fini_type_account_ADD.NoAccCheck.Checked := DataSet.FieldByName('IS_NO_ACCOUNT').AsInteger = 1;

 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;
 Fini_type_account_ADD.ShowModal;
 if Fini_type_account_ADD.MResult = 'cancel' then exit;

 is_bank_acc := 0;
 if Fini_type_account_ADD.isBankAccCheck.Checked then is_bank_acc := 1;
 is_val_acc := 0;
 no_acc := 0;
 if Fini_type_account_ADD.cbVal.Checked then is_val_acc := 1;
 if Fini_type_account_ADD.NoAccCheck.Checked then no_acc := 1;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(MOD_PROC, [PK_Index, Fini_type_account_ADD.NameEdit.Text, is_bank_acc, is_val_acc, no_Acc]);
 StoredProc.Transaction.Commit;
 dataset.CloseOpen(true);
 DataSet.Locate('ID_TYPE_ACCOUNT', PK_Index, [loCaseInsensitive]);

 Fini_type_account_ADD.Free;
end;

procedure TFini_type_account.EditButtonClick(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_type_account.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;


procedure TFini_type_account.DBGridDblClick(Sender: TObject);
begin
 if (ChooseButton.Enabled) and (ivAlways = ChooseButton.Visible)
 then begin
      ChooseButton.OnClick(self);
 end;
end;


procedure TFini_type_account.ActionModExecute(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_type_account.ActionDelExecute(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_type_account.ActionAddExecute(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_type_account.ActionSelExecute(Sender: TObject);
begin
 if (ChooseButton.Enabled) and (ivAlways = ChooseButton.Visible)
 then begin
           ChooseButton.OnClick(self);

 end;
end;

procedure TFini_type_account.N1Click(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_type_account.N2Click(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_type_account.N3Click(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_type_account.N5Click(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFini_type_account.N6Click(Sender: TObject);
begin
 if (ChooseButton.Enabled) and (ivAlways = ChooseButton.Visible)
    then begin
        ChooseButton.OnClick(self);
    end;
end;

procedure TFini_type_account.RefreshButtonClick(Sender: TObject);
var
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then begin
 dataset.CloseOpen(true);
  exit;
 end;
 selected_id := DataSet.FieldByName(PK_FIELD).AsInteger;
 dataset.CloseOpen(true);
 DataSet.Locate('ID_TYPE_ACCOUNT', selected_id, [loCaseInsensitive]);
end;

procedure TFini_type_account.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then ChooseButtonClick(Self);
 if Key = #27 then Close;
end;

constructor TFini_type_account.Create(AOwner: TComponent;
  DBHANDLE: TISC_DB_HANDLE; FS: TFormStyle; ActualDate: TDateTime);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      DataSet.SQLs.SelectSQL.Text := 'select * from ' + SEL_VIEW;
      self.FormStyle:=FS;
      if FS=fsNormal then  ChooseButton.Enabled:=true; 

end;

procedure TFini_type_account.FormShow(Sender: TObject);
begin
          dataset.Open;
end;

procedure TFini_type_account.UpdateButtonClick(Sender: TObject);
begin
   ActionMod.Execute;
end;

procedure TFini_type_account.ChooseButtonClick(Sender: TObject);
begin
     if DataSet.Active and (DataSet.RecordCount>0)
     then begin
        ResultValue:=VarArrayCreate([0,4],varVariant);
        ResultValue[0]:=DataSet.fieldByName('ID_TYPE_ACCOUNT').Value;
        ResultValue[1]:=DataSet.fieldByName('NAME_TYPE_ACCOUNT').Value;
        ResultValue[2]:=DataSet.fieldByName('IS_BANK_ACCOUNT').Value;
        ResultValue[3]:=DataSet.fieldByName('IS_VAL_ACCOUNT').Value;
        ResultValue[4]:=DataSet.fieldByName('IS_NO_ACCOUNT').Value;
        Modalresult:=mrYes;
     end;
end;

end.
