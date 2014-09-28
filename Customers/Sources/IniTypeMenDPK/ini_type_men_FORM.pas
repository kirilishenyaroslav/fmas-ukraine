unit ini_type_men_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDatabase, StdCtrls, Db, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  Menus, ActnList, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit,
  FIBDatabase, Ibase, Variants, ImgList, Resources_unitb, dxBar,
  dxBarExtItems, cxTL;

const

 TABLE    = 'INI_TYPE_MEN';
 SEL_VIEW = 'VIEW_INI_TYPE_MEN';
 ADD_PROC = 'PUB_SP_INI_TYPE_MEN_ADD';
 DEL_PROC = 'PUB_SP_INI_TYPE_MEN_DEL';
 MOD_PROC = 'PUB_SP_INI_TYPE_MEN_MOD';
 PK_FIELD = 'ID_TYPE_MEN';

type
  TFini_type_men = class(TForm)
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    DataSet: TpFIBDataSet;
    Query: TpFIBQuery;
    ActionList1: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ID_TYPE_MEN: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_MEN: TcxGridDBColumn;
    cxGrid1DBTableView1IS_MAIN_ACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1IS_CHIEF: TcxGridDBColumn;
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
    procedure ModButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
  public
   ResultValue:Variant;
   CurFS:TFormStyle;
   ActualDate:TDateTime;
   constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);overload;
   procedure SelectAll;
   procedure DeleteRecord;
   procedure AddRecord;
   procedure ModRecord;
  end;

function GetIniTypeMen(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;

exports  GetIniTypeMen;



implementation

uses ini_type_men_FORM_ADD,
     sys_options;
{$R *.DFM}
function GetIniTypeMen(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
    var T:TFini_type_men;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFini_type_men.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFini_type_men.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;

    GetIniTypeMen:=Res;
end;

constructor TFini_type_men.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      if CurFS=fsNormal
      then begin
         ChooseButton.Enabled:=true;
      end;
      DataSet.SQLs.SelectSQL.Text := 'select * from ' + SEL_VIEW;
      DataSet.Open;
      self.FormStyle:=FS;
end;

procedure TFini_type_men.SelectAll;
begin
 DataSet.Active := false;
 DataSet.Active := true;
end;

procedure TFini_type_men.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure TFini_type_men.DelButtonClick(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_type_men.DeleteRecord;
var
 PK_Index    : integer;
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;
 if MessageBox(handle,PChar(CUSTOMER_DELETE_QUESTION),PChar(CUSTOMER_INITYPEMENCONST), MB_YESNO or MB_ICONQUESTION)=mrNo
 then exit;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(DEL_PROC, [PK_Index]);
 StoredProc.Transaction.Commit;
 SelectAll;
 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

procedure TFini_type_men.AddButtonClick(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_type_men.AddRecord;
var
 PK_Index : integer;
 main_account, chief : integer;
 Fini_type_men_ADD : TFini_type_men_ADD;
begin
 Fini_type_men_ADD := TFini_type_men_ADD.Create(Self);
 Fini_type_men_ADD.Caption := CUSTOMER_ADD_CONST;
 Fini_type_men_ADD.OKButton.Caption := CUSTOMER_ADD_CONST;
 Fini_type_men_ADD.ShowModal;
 if Fini_type_men_ADD.MResult = 'cancel' then exit;

 if Fini_type_men_ADD.MainAccountCheck.checked then main_account := 1 else main_account := 0;
 if Fini_type_men_ADD.ChiefCheck.checked then chief := 1 else chief := 0;



 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(ADD_PROC, [Fini_type_men_ADD.NameEdit.Text, main_account, chief]);
 PK_Index:=StoredProc.ParamByName('OUT_ID_TYPE_MEN').AsInteger;
 StoredProc.Transaction.Commit;
 SelectAll;
 DataSet.Locate('ID_TYPE_MEN', PK_Index, [loCaseInsensitive]);

 Fini_type_men_ADD.Free;
end;

procedure TFini_type_men.ModRecord;
var
 PK_Index : integer;
 main_account, chief : integer;
 Fini_type_men_ADD : TFini_type_men_ADD;
begin
 if DataSet.RecordCount = 0 then exit;
 Fini_type_men_ADD := TFini_type_men_ADD.Create(Self);
 Fini_type_men_ADD.Caption := CUSTOMER_MOD_CONST;
 Fini_type_men_ADD.OKButton.Caption := CUSTOMER_MOD_CONST;
 Fini_type_men_ADD.NameEdit.Text := DataSet.FieldByName('NAME_TYPE_MEN').AsString;
 Fini_type_men_ADD.MainAccountCheck.Checked := DataSet['IS_MAIN_ACCOUNT'] <> 0;
 Fini_type_men_ADD.ChiefCheck.Checked := DataSet['IS_CHIEF'] <> 0;
 Fini_type_men_ADD.ShowModal;
 if Fini_type_men_ADD.MResult = 'cancel' then exit;

 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;
 if Fini_type_men_ADD.MainAccountCheck.checked then main_account := 1 else main_account := 0;
 if Fini_type_men_ADD.ChiefCheck.checked then chief := 1 else chief := 0;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(MOD_PROC, [PK_Index, Fini_type_men_ADD.NameEdit.Text,  main_account, chief]);
 StoredProc.Transaction.Commit;
 SelectAll;
 DataSet.Locate('ID_TYPE_MEN', PK_Index, [loCaseInsensitive]);

 Fini_type_men_ADD.Free;
end;

procedure TFini_type_men.EditButtonClick(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_type_men.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFini_type_men.DBGridDblClick(Sender: TObject);
begin
 if (ChooseButton.Enabled) and (ivAlways = ChooseButton.Visible) then ChooseButtonClick(self);
end;

procedure TFini_type_men.SelButtonClick(Sender: TObject);
begin
 ModalResult := mrOK;
end;

procedure TFini_type_men.ActionModExecute(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_type_men.ActionDelExecute(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_type_men.ActionAddExecute(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_type_men.ActionSelExecute(Sender: TObject);
begin
 DBGridDblClick(Sender);
end;

procedure TFini_type_men.N1Click(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_type_men.N2Click(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_type_men.N3Click(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_type_men.N6Click(Sender: TObject);
begin
 DBGridDblClick(Sender);
end;

procedure TFini_type_men.N5Click(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFini_type_men.RefreshButtonClick(Sender: TObject);
var
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 selected_id := DataSet.FieldByName(PK_FIELD).AsInteger;
 SelectAll;
 DataSet.Locate('ID_TYPE_MEN', selected_id, [loCaseInsensitive]);
end;

procedure TFini_type_men.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

procedure TFini_type_men.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFini_type_men.ModButtonClick(Sender: TObject);
begin
     ModRecord;
end;

procedure TFini_type_men.CloseButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TFini_type_men.ChooseButtonClick(Sender: TObject);
begin
     if DataSet.Active and (DataSEt.RecordCount>0)
     then begin
          ResultValue:=VarArrayCreate([0,1],varVariant);
          ResultValue[0]:=DataSet.FieldByName('ID_TYPE_MEN').Value;
          ResultValue[1]:=DataSet.FieldByName('NAME_TYPE_MEN').Value;
          ModalResult:=mrYes;
     end;

end;

end.
