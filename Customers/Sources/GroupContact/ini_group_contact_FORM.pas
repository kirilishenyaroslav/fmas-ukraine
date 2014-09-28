unit ini_group_contact_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDatabase, StdCtrls, Db, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  Menus, ActnList, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit, ImgList, FIBDatabase, Ibase, Variants, dxBar,
  dxBarExtItems, cxTL;
const

 TABLE    = 'INI_GROUP_CONTACT';
 SEL_VIEW = 'VIEW_INI_GROUP_CONTACT';
 ADD_PROC = 'PUB_SP_INI_GROUP_CONTACT_ADD';
 DEL_PROC = 'PUB_SP_INI_GROUP_CONTACT_DEL';
 MOD_PROC = 'PUB_SP_INI_GROUP_CONTACT_MOD';
 PK_FIELD = 'ID_GROUP_CONTACT';

type
  TFini_group_contact = class(TForm)
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    DataSet: TpFIBDataSet;
    Query: TpFIBQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ActionList1: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID_GROUP_CONTACT: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_GROUP_CONTACT: TcxGridDBColumn;
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
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
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
  end;

function GetGroupContact(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
exports GetGroupContact;




implementation
uses ini_group_contact_FORM_ADD,
     sys_options, BaseTypes;
{$R *.DFM}
function GetGroupContact(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
    var T:TFini_group_contact;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFini_group_contact.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFini_group_contact.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;

    GetGroupContact:=Res;
end;

constructor TFini_group_contact.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);
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

procedure TFini_group_contact.SelectAll;
begin
 DataSet.Active := false;
 DataSet.Active := true;
end;

procedure TFini_group_contact.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure TFini_group_contact.DelButtonClick(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_group_contact.DeleteRecord;
var
 PK_Index : integer;
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;
 if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(DEL_PROC, [PK_Index]);
 StoredProc.Transaction.Commit;

 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

procedure TFini_group_contact.AddButtonClick(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_group_contact.AddRecord;
var
 PK_Index : integer;
begin
 Fini_group_contact_ADD := TFini_group_contact_ADD.Create(Self);
 Fini_group_contact_ADD.Caption := 'Додати запис';
 Fini_group_contact_ADD.OKButton.Caption := 'Додати';
 Fini_group_contact_ADD.ShowModal;
 if Fini_group_contact_ADD.MResult = 'cancel' then exit;



 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(ADD_PROC, [Fini_group_contact_ADD.NameEdit.Text]);
 PK_Index:=StoredProc.ParamByName('OUT_ID_GROUP_CONTACT').AsInteger;
 StoredProc.Transaction.Commit;
 SelectAll;
 DataSet.Locate('ID_GROUP_CONTACT', PK_Index, [loCaseInsensitive]);
 Fini_group_contact_ADD.Free;
end;

procedure TFini_group_contact.ModRecord;
var
 PK_Index : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 Fini_group_contact_ADD := TFini_group_contact_ADD.Create(Self);
 Fini_group_contact_ADD.Caption := 'Змінити запис';
 Fini_group_contact_ADD.OKButton.Caption := 'Змінити';
 Fini_group_contact_ADD.NameEdit.Text := DataSet.FieldByName('NAME_GROUP_CONTACT').AsString;
 Fini_group_contact_ADD.ShowModal;
 if Fini_group_contact_ADD.MResult = 'cancel' then exit;

 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(MOD_PROC, [PK_Index, Fini_group_contact_ADD.NameEdit.Text]);
 StoredProc.Transaction.Commit;
 SelectAll;
 DataSet.Locate('ID_GROUP_CONTACT', PK_Index, [loCaseInsensitive]);

 Fini_group_contact_ADD.Free;
end;

procedure TFini_group_contact.EditButtonClick(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_group_contact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFini_group_contact.DBGridDblClick(Sender: TObject);
begin
 if (ChooseButton.Enabled) and (ivAlways = ChooseButton.Visible) then SelButtonClick(self);
end;

procedure TFini_group_contact.SelButtonClick(Sender: TObject);
begin
   if DataSet.Active and (dataSet.RecordCount>0)
   then begin
         ResultValue:=VarArrayCreate([0,1],varVariant);
         ResultValue[0]:=DataSet['ID_GROUP_CONTACT'];
         ResultValue[1]:=DataSet['NAME_GROUP_CONTACT'];
         ModalResult := mrYes;
   end;
end;

procedure TFini_group_contact.N5Click(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFini_group_contact.N1Click(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_group_contact.N2Click(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_group_contact.N3Click(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_group_contact.ActionModExecute(Sender: TObject);
begin
 ModRecord;
end;

procedure TFini_group_contact.ActionDelExecute(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFini_group_contact.ActionAddExecute(Sender: TObject);
begin
 AddRecord;
end;

procedure TFini_group_contact.ActionSelExecute(Sender: TObject);
begin
 if (ChooseButton.Enabled) and (ivAlways = ChooseButton.Visible) then SelButtonClick(self);
end;

procedure TFini_group_contact.RefreshButtonClick(Sender: TObject);
var
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 selected_id := DataSet.FieldByName(PK_FIELD).AsInteger;
 SelectAll;
 DataSet.Locate('ID_GROUP_CONTACT', selected_id, [loCaseInsensitive]);
end;

procedure TFini_group_contact.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

procedure TFini_group_contact.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFini_group_contact.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

end.
