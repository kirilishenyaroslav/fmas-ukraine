unit ini_type_street_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
  pFIBDataSet, pFIBStoredProc, ActnList, Menus, COMMON, Grids, Db, DBGrids,
  pFIBQuery, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxContainer,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  FIBDatabase, ImgList, Ibase, Variants, dxBar, dxBarExtItems, cxTL;

type
  TFini_type_street = class(TForm)
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    ActionList1: TActionList;
    Action_Add: TAction;
    Action_Del: TAction;
    Action_Mod: TAction;
    Action_Refresh: TAction;
    Action_Up: TAction;
    Action_Down: TAction;
    Action_Sel: TAction;
    Action_Exit: TAction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_TYPE_PLACE: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_FULL: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_SHORT: TcxGridDBColumn;
    cxGrid1DBTableView1ORDER: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
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
    DownButton: TdxBarLargeButton;
    UpButton: TdxBarLargeButton;
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
    procedure AddButtonClick(Sender: TObject);
    procedure ModButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure UpButtonClick(Sender: TObject);
    procedure DownButtonClick(Sender: TObject);
    procedure Action_AddExecute(Sender: TObject);
    procedure Action_DelExecute(Sender: TObject);
    procedure Action_ModExecute(Sender: TObject);
    procedure Action_RefreshExecute(Sender: TObject);
    procedure Action_DownExecute(Sender: TObject);
    procedure Action_UpExecute(Sender: TObject);
    procedure Action_SelExecute(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure PM_AddButtonClick(Sender: TObject);
    procedure PM_DelButtonClick(Sender: TObject);
    procedure PM_ModButtonClick(Sender: TObject);
    procedure PM_RefreshButtonClick(Sender: TObject);
    procedure PM_DownButtonClick(Sender: TObject);
    procedure PM_UpButtonClick(Sender: TObject);
    procedure PM_SelButtonClick(Sender: TObject);
    procedure PM_ExitButtonClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
  public
    CurFS:TFormStyle;
    ActualDate:TDateTime;
    ResultValue:Variant;
    constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);overload;
    procedure CheckButtonsState;
    procedure SelectAll;
    procedure LocateRecord(const id : integer);
  end;

function GetIniTypeStreet(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
exports GetIniTypeStreet;


implementation
uses BaseTypes, ini_type_street_FORM_ADD;
{$R *.DFM}
function GetIniTypeStreet(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
    var T:TFini_type_street;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFini_type_street.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFini_type_street.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;

    GetIniTypeStreet:=Res;
end;

constructor TFini_type_street.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      if CurFS=fsNormal
      then ChooseButton.Enabled:=true;
      DataSet.SQLs.SelectSQL.Text := 'select * from VIEW_INI_TYPE_STREET ORDER BY "ORDER"';
      DataSet.Open;
      self.FormStyle:=FS;
end;

procedure TFini_type_street.SelectAll;
begin
 DataSet.Active := false;
 DataSet.SQLs.SelectSQL.Text := 'select * from VIEW_INI_TYPE_STREET ORDER BY "ORDER"';
 DataSet.Active := true;
 CheckButtonsState;
end;


//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record
procedure TFini_type_street.AddButtonClick(Sender: TObject);
var
 add_form : Tfini_type_street_form_add;
 id_type_street : integer;
 full_name, short_name : string;
begin
 add_form := Tfini_type_street_form_add.Create(Self);
 add_form.Caption := 'Добавить';
 if add_form.ShowModal = mrOK then begin
  full_name  := add_form.FullNameEdit.Text;
  short_name := add_form.ShortNameEdit.Text;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_INI_TYPE_STREET_ADD', [full_name, short_name]);
  id_type_street:=StoredProc.ParamByName('ID_TYPE_STREET').AsInteger;
  StoredProc.Transaction.Commit;
  SelectAll;
  LocateRecord(id_type_street);
 end;
 add_form.Free;
end;

//Modify record
procedure TFini_type_street.ModButtonClick(Sender: TObject);
var
 mod_form : Tfini_type_street_form_add;
 id_type_street : integer;
 full_name, short_name : string;
begin
 id_type_street := DataSet['ID_TYPE_STREET'];
 full_name      := DataSet['NAME_FULL'];
 short_name     := DataSet['NAME_SHORT'];

 mod_form := Tfini_type_street_form_add.Create(Self);
 mod_form.Caption := 'Изменить';
 mod_form.FullNameEdit.Text := full_name;
 mod_form.ShortNameEdit.Text := short_name;
 if mod_form.ShowModal = mrOK then begin
  full_name  := mod_form.FullNameEdit.Text;
  short_name := mod_form.ShortNameEdit.Text;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_INI_TYPE_STREET_MOD', [id_type_street, full_name, short_name]);
  StoredProc.Transaction.Commit;
  mod_form.Free;
  SelectAll;
 end;
 LocateRecord(id_type_street);
end;

//Delete record
procedure TFini_type_street.DelButtonClick(Sender: TObject);
var
 id_type_street : integer;
 selected_id : integer;
begin
 if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 id_type_street := DataSet['ID_TYPE_STREET'];
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_INI_TYPE_STREET_DEL', [id_type_street]);
 StoredProc.Transaction.Commit;
 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid
procedure TFini_type_street.RefreshButtonClick(Sender: TObject);
var
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 selected_id := DataSet.FieldByName('ID_TYPE_STREET').AsInteger;
 SelectAll;
 DataSet.Locate('ID_TYPE_STREET', selected_id, [loCaseInsensitive]);
end;

//Close form
procedure TFini_type_street.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

//Select record
procedure TFini_type_street.SelButtonClick(Sender: TObject);
begin
   if DataSet.Active and (dataSet.RecordCount>0)
   then begin
         ResultValue:=VarArrayCreate([0,1],varVariant);
         ResultValue[0]:=DataSet['ID_TYPE_STREET'];
         ResultValue[1]:=DataSet['NAME_FULL'];
         ModalResult := mrYes;
   end;
end;

//Move record up
procedure TFini_type_street.UpButtonClick(Sender: TObject);
var
 id_type_street : integer;
begin
 id_type_street := DataSet['ID_TYPE_STREET'];

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_INI_TYPE_STREET_MOVE_UP', [id_type_street]);
 StoredProc.Transaction.Commit;

 SelectAll;
 LocateRecord(id_type_street);
end;

//Move record down
procedure TFini_type_street.DownButtonClick(Sender: TObject);
var
 id_type_street : integer;
begin
 id_type_street := DataSet['ID_TYPE_STREET'];

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_INI_TYPE_STREET_MOVE_DOWN', [id_type_street]);
 StoredProc.Transaction.Commit;

 SelectAll;
 LocateRecord(id_type_street);
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////
procedure TFini_type_street.LocateRecord(const id : integer);
begin
 DataSet.Locate('ID_TYPE_STREET', id, []);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////
procedure TFini_type_street.CheckButtonsState;
begin
 if DataSet.RecordCount = 0 then begin
  DelButton.Enabled  := false;
  UpdateButton.Enabled  := false;
  DownButton.Enabled := false;
  UpButton.Enabled   := false;
  ChooseButton.Enabled  := false;

 end else begin
  DelButton.Enabled  := true;
  UpdateButton.Enabled  := true;

 end;
end;

//Procedure checks up and down buttons accessibility
procedure TFini_type_street.DataSetAfterScroll(DataSet: TDataSet);
begin
 if DataSet.RecNo = DataSet.RecordCount then begin
  DownButton.Enabled    := false;
 end else begin
  DownButton.Enabled    := true;
 end;
 if DataSet.RecNo = 1 then begin
  UpButton.Enabled    := false;
 end else begin
  UpButton.Enabled    := true;
 end;
end;

procedure TFini_type_street.DBGridDblClick(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////
procedure TFini_type_street.Action_AddExecute(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFini_type_street.Action_DelExecute(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFini_type_street.Action_ModExecute(Sender: TObject);
begin
 if UpdateButton.Enabled then ModButtonClick(Self);
end;

procedure TFini_type_street.Action_RefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFini_type_street.Action_DownExecute(Sender: TObject);
begin
 if DownButton.Enabled then DownButtonClick(Self);
end;

procedure TFini_type_street.Action_UpExecute(Sender: TObject);
begin
 if UpButton.Enabled then UpButtonClick(Self);
end;

procedure TFini_type_street.Action_SelExecute(Sender: TObject);
begin
 if UpdateButton.Enabled then SelButtonClick(Self);
end;

procedure TFini_type_street.Action_ExitExecute(Sender: TObject);
begin
 ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////
procedure TFini_type_street.PM_AddButtonClick(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFini_type_street.PM_DelButtonClick(Sender: TObject);
begin
 DelButtonClick(Self);
end;

procedure TFini_type_street.PM_ModButtonClick(Sender: TObject);
begin
 ModButtonClick(Self);
end;

procedure TFini_type_street.PM_RefreshButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFini_type_street.PM_DownButtonClick(Sender: TObject);
begin
 DownButtonClick(Self);
end;

procedure TFini_type_street.PM_UpButtonClick(Sender: TObject);
begin
 UpButtonClick(Self);
end;

procedure TFini_type_street.PM_SelButtonClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;

procedure TFini_type_street.PM_ExitButtonClick(Sender: TObject);
begin
 ExitButtonClick(Self);
end;

procedure TFini_type_street.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFini_type_street.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFini_type_street.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

end.
