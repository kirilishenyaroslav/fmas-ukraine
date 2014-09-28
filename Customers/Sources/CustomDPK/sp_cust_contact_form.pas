unit sp_cust_contact_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
  pFIBDataSet, pFIBStoredProc, ActnList, Menus, COMMON, Grids, Db, DBGrids,
  pFIBQuery, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Variants, ImgList, dxBar,
  dxBarExtItems, cxTL;

type
  TFsp_cust_contact = class(TForm)
    ActionList1: TActionList;
    Action_Add: TAction;
    Action_Del: TAction;
    Action_Mod: TAction;
    Action_Refresh: TAction;
    Action_Sel: TAction;
    Action_Exit: TAction;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID_GROUP_CONTACT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TYPE_CONTACT: TcxGridDBColumn;
    cxGrid1DBTableView1CONTACT: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_GROUP_CONTACT: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_CONTACT: TcxGridDBColumn;
    SmallImages: TImageList;
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
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure Action_AddExecute(Sender: TObject);
    procedure Action_DelExecute(Sender: TObject);
    procedure Action_ModExecute(Sender: TObject);
    procedure Action_RefreshExecute(Sender: TObject);
    procedure Action_SelExecute(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure PM_AddButtonClick(Sender: TObject);
    procedure PM_DelButtonClick(Sender: TObject);
    procedure PM_ModButtonClick(Sender: TObject);
    procedure PM_RefreshButtonClick(Sender: TObject);
    procedure PM_SelButtonClick(Sender: TObject);
    procedure PM_ExitButtonClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fCanSelect       : boolean;

  public
    id_customer      : int64;
    procedure CheckButtonsState;
    procedure SelectAll;
    procedure LocateRecord(const id_group_contact, id_type_contact : integer; const contact : string);
  end;



implementation
uses BaseTypes, sp_cust_contact_FORM_ADD, dogLoaderUnit, LangUnit;
{$R *.DFM}


procedure TFsp_cust_contact.SelectAll;
begin
 DataSet.Active := false;
 DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_CUST_CONTACT_SEL(' + IntToStr(id_customer) + ')';
 DataSet.Active := true;
 CheckButtonsState;
end;


//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record
procedure TFsp_cust_contact.AddButtonClick(Sender: TObject);
var
 add_form : Tfsp_cust_contact_form_add;
begin
 add_form := Tfsp_cust_contact_form_add.Create(Self);
 add_form.Caption := 'Додати';
 if add_form.ShowModal = mrOK then begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_CUST_CONTACT_ADD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_GROUP_CONTACT').AsInteger := add_form.id_group_contact;
  StoredProc.ParamByName('ID_TYPE_CONTACT').AsInteger := add_form.id_type_contact;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
  StoredProc.ParamByName('CONTACT').AsString := add_form.ContactEdit.Text;
  StoredProc.ExecProc;
//  StoredProc.ExecProcedure('PUB_SP_CUST_CONTACT_ADD', [add_form.id_group_contact, add_form.id_type_contact ,id_customer, add_form.ContactEdit.Text]);
  StoredProc.Transaction.Commit;

  SelectAll;
  LocateRecord(add_form.id_group_contact, add_form.id_type_contact, add_form.ContactEdit.Text);
 end;
 add_form.Free;
end;

//Modify record
procedure TFsp_cust_contact.ModButtonClick(Sender: TObject);
var
 mod_form      : Tfsp_cust_contact_form_add;
 id_group_contact   : integer;
 id_type_contact : integer;
 contact : string;
begin
 id_group_contact   := DataSet['ID_GROUP_CONTACT'];
 id_type_contact := DataSet['ID_TYPE_CONTACT'];
 contact := DataSet['CONTACT'];

 mod_form := Tfsp_cust_contact_form_add.Create(Self);
 mod_form.Caption := 'Змінити';
 mod_form.ContactEdit.Text := DataSet['CONTACT'];
 mod_form.GroupContactEdit.Text := DataSet['NAME_GROUP_CONTACT'];
 mod_form.TypeContactEdit.Text := DataSet['NAME_TYPE_CONTACT'];

 mod_form.id_group_contact := id_group_contact;
 mod_form.id_type_contact := id_type_contact;

 if mod_form.ShowModal = mrOK then begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_CUST_CONTACT_MOD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
  StoredProc.ParamByName('ID_GROUP_CONTACT').AsInteger := id_group_contact;
  StoredProc.ParamByName('ID_TYPE_CONTACT').AsInteger := id_type_contact;
  StoredProc.ParamByName('CONTACT').AsString := contact;
  StoredProc.ParamByName('ID_GROUP_CONTACT_NEW').AsInteger := mod_form.id_group_contact;
  StoredProc.ParamByName('ID_TYPE_CONTACT_NEW').AsInteger := mod_form.id_type_contact;
  StoredProc.ParamByName('CONTACT_NEW').AsString := mod_form.ContactEdit.Text;
  StoredProc.ExecProc;

//  StoredProc.ExecProcedure('PUB_SP_CUST_CONTACT_MOD', [id_customer, id_group_contact, id_type_contact, contact, mod_form.id_group_contact, mod_form.id_type_contact, mod_form.ContactEdit.Text]);
  StoredProc.Transaction.Commit;
  SelectAll;
  LocateRecord(mod_form.id_group_contact, mod_form.id_type_contact, mod_form.ContactEdit.Text);
 end;
 mod_form.Free;
end;

//Delete record
procedure TFsp_cust_contact.DelButtonClick(Sender: TObject);
var
 id_group_contact : integer;
 id_type_contact  : integer;
 contact : string;
 selected_id : integer;
begin
 if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 id_group_contact   := DataSet['ID_GROUP_CONTACT'];
 id_type_contact := DataSet['ID_TYPE_CONTACT'];
 contact := DataSet['CONTACT'];

 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName := 'PUB_SP_CUST_CONTACT_DEL';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := id_customer;
 StoredProc.ParamByName('ID_GROUP_CONTACT').AsInteger := id_group_contact;
 StoredProc.ParamByName('ID_TYPE_CONTACT').AsInteger := id_type_contact;
 StoredProc.ParamByName('CONTACT').AsString := contact;
 StoredProc.ExecProc;
// StoredProc.ExecProcedure('PUB_SP_CUST_CONTACT_DEL', [id_customer, id_group_contact, id_type_contact, contact]);
 StoredProc.Transaction.Commit;


 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid
procedure TFsp_cust_contact.RefreshButtonClick(Sender: TObject);
var
 id_group_contact, id_type_contact : integer;
 contact : string;
begin
 if DataSet.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 id_group_contact := DataSet['ID_GROUP_CONTACT'];
 id_type_contact := DataSet['ID_TYPE_CONTACT'];
 contact := DataSet['CONTACT'];
 SelectAll;
 LocateRecord(id_group_contact, id_type_contact, contact);
end;

//Close form
procedure TFsp_cust_contact.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

//Select record
procedure TFsp_cust_contact.SelButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrOK;
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////
procedure TFsp_cust_contact.LocateRecord(const id_group_contact, id_type_contact : integer; const contact : string);
var
 ar : Variant;
begin
 ar := VarArrayCreate([0, 2], varVariant);
 ar[0] := id_group_contact;
 ar[1] := id_type_contact;
 ar[2] := contact;
 DataSet.Locate('ID_GROUP_CONTACT;ID_TYPE_CONTACT;CONTACT', ar, []);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////
procedure TFsp_cust_contact.CheckButtonsState;
begin
 if DataSet.RecordCount = 0 then begin
  DelButton.Enabled  := false;
  UpdateButton.Enabled  := false;
  ChooseButton.Enabled  := false;

 end else begin
  DelButton.Enabled  := true;
  UpdateButton.Enabled  := true;
  ChooseButton.Enabled  := fCanSelect;

 end;
end;

procedure TFsp_cust_contact.FormShow(Sender: TObject);
begin
    SelectAll;
end;

procedure TFsp_cust_contact.DBGridDblClick(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////
procedure TFsp_cust_contact.Action_AddExecute(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_cust_contact.Action_DelExecute(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFsp_cust_contact.Action_ModExecute(Sender: TObject);
begin
 if UpdateButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_cust_contact.Action_RefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_cust_contact.Action_SelExecute(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;

procedure TFsp_cust_contact.Action_ExitExecute(Sender: TObject);
begin
 ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////
procedure TFsp_cust_contact.PM_AddButtonClick(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_cust_contact.PM_DelButtonClick(Sender: TObject);
begin
 DelButtonClick(Self);
end;

procedure TFsp_cust_contact.PM_ModButtonClick(Sender: TObject);
begin
 ModButtonClick(Self);
end;

procedure TFsp_cust_contact.PM_RefreshButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_cust_contact.PM_SelButtonClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;

procedure TFsp_cust_contact.PM_ExitButtonClick(Sender: TObject);
begin
 ExitButtonClick(Self);
end;

procedure TFsp_cust_contact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFsp_cust_contact.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then ModalResult := mrCancel;
end;

procedure TFsp_cust_contact.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_ESCAPE then ModalResult := mrCancel;
end;

procedure TFsp_cust_contact.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFsp_cust_contact.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
end;

end.
