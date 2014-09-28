unit sp_place_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
  pFIBDataSet, pFIBStoredProc, ActnList, Menus, COMMON, Grids, Db, DBGrids,
  pFIBQuery, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxContainer,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ImgList, FIBDatabase, Ibase, Variants, dxBar, dxBarExtItems, cxTL;

type
  TFsp_place = class(TForm)
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ID_PLACE: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TYPE_PLACE: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_PLACE: TcxGridDBColumn;
    cxGrid1DBTableView1IS_DISTRICT_CENTRE: TcxGridDBColumn;
    cxGrid1DBTableView1IS_REGIONAL_CENTRE: TcxGridDBColumn;
    cxGrid1DBTableView1IS_CAPITAL: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_PLACE: TcxGridDBColumn;
    cxGrid1DBTableView1PLACE: TcxGridDBColumn;
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
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure CloseButtonClick(Sender: TObject);
  public
    CurFS:TFormStyle;
    ActualDate:TDateTime;
    ResultValue:Variant;
    constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);overload;
    procedure CheckButtonsState;
    procedure SelectAll;
    procedure LocateRecord(const id : integer);
  end;

function GetPlaces(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
exports  GetPlaces;

implementation
uses BaseTypes, sp_place_FORM_ADD;
{$R *.DFM}

function GetPlaces(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
    var T:TFsp_place;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFsp_place.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_place.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;
    GetPlaces:=Res;
end;

constructor TFsp_place.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      if CurFS=fsNormal
      then ChooseButton.Enabled:=true;
      DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_PLACE_SEL';
      DataSet.Open;
      self.FormStyle:=FS;
end;

procedure TFsp_place.SelectAll;
begin
 DataSet.Active := false;
 DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_PLACE_SEL';
 DataSet.Active := true;
 CheckButtonsState;
end;


//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record
procedure TFsp_place.AddButtonClick(Sender: TObject);
var
 add_form      : Tfsp_place_form_add;
 id_place   : integer;
 id_type_place : integer;
 name_place : string;
 is_dc : integer;
 is_rc : integer;
 is_ca : integer;
begin
 add_form := Tfsp_place_form_add.Create(Self);
 add_form.Caption := 'Добавить';
 if add_form.ShowModal = mrOK then begin
  name_place  := add_form.FullNameEdit.Text;
  id_type_place := add_form.id_type_place;
  if add_form.DistrictCheck.Checked then is_dc := 1 else is_dc := 0;
  if add_form.RegionCheck.Checked then is_rc := 1 else is_rc := 0;
  if add_form.CapitalCheck.Checked then is_ca := 1 else is_ca := 0;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_PLACE_ADD', [id_type_place, name_place, is_dc, is_rc, is_ca]);
  id_place:=StoredProc.ParamByName('ID_PLACE').AsInteger;
  StoredProc.Transaction.Commit;
  SelectAll;
  LocateRecord(id_place);
 end;
 add_form.Free;
end;

//Modify record
procedure TFsp_place.ModButtonClick(Sender: TObject);
var
 mod_form      : Tfsp_place_form_add;
 id_place   : integer;
 name_place : string;
 id_type_place : integer;
 is_dc : integer;
 is_rc : integer;
 is_ca : integer;
 name_type_place : string;
begin
 id_place := DataSet['ID_PLACE'];
 id_type_place := DataSet['ID_TYPE_PLACE'];
 name_place :=DataSet['NAME_PLACE'];
 is_dc := DataSet['IS_DISTRICT_CENTRE'];
 is_rc := DataSet['IS_REGIONAL_CENTRE'];
 is_ca := DataSet['IS_CAPITAL'];
 name_type_place := DataSet['NAME_TYPE_PLACE'];

 mod_form := Tfsp_place_form_add.Create(Self);
 mod_form.Caption := 'Удалить';
 mod_form.FullNameEdit.Text := name_place;
 mod_form.TypeEdit.Text := name_type_place;

 if mod_form.ShowModal = mrOK then begin
  name_place  := mod_form.FullNameEdit.Text;
  id_type_place := mod_form.id_type_place;
  if mod_form.DistrictCheck.Checked then is_dc := 1 else is_dc := 0;
  if mod_form.RegionCheck.Checked then is_rc := 1 else is_rc := 0;
  if mod_form.CapitalCheck.Checked then is_ca := 1 else is_ca := 0;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_PLACE_MOD', [id_place, id_type_place, name_place, is_dc, is_rc, is_ca]);
  StoredProc.Transaction.Commit;
  SelectAll;
  LocateRecord(id_place);
 end;
 mod_form.Free;
end;

//Delete record
procedure TFsp_place.DelButtonClick(Sender: TObject);
var
 id_place : integer;
 selected_id : integer;
begin
 if agMessageDlg('Внимание', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 id_place := DataSet['ID_PLACE'];
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_SP_PLACE_DEL', [id_place]);
 StoredProc.Transaction.Commit;

 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid
procedure TFsp_place.RefreshButtonClick(Sender: TObject);
var
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 selected_id := DataSet.FieldByName('ID_PLACE').AsInteger;
 SelectAll;
 DataSet.Locate('ID_PLACE', selected_id, [loCaseInsensitive]);
end;

//Close form
procedure TFsp_place.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

//Select record
procedure TFsp_place.SelButtonClick(Sender: TObject);
begin
   if DataSet.Active and (dataSet.RecordCount>0)
   then begin
         ResultValue:=VarArrayCreate([0,2],varVariant);
         ResultValue[0]:=DataSet['ID_PLACE'];
         ResultValue[1]:=DataSet['NAME_TYPE_PLACE']+' '+DataSet['NAME_PLACE'];
         ResultValue[2]:=DataSet['ID_TYPE_PLACE'];
         ModalResult := mrYes;
   end;
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////
procedure TFsp_place.LocateRecord(const id : integer);
begin
 DataSet.Locate('ID_PLACE', id, []);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////
procedure TFsp_place.CheckButtonsState;
begin
 if DataSet.RecordCount = 0 then begin
  DelButton.Enabled  := false;
  UpdateButton.Enabled  := false;
  ChooseButton.Enabled  := false;

 end else begin
  DelButton.Enabled  := true;
  UpdateButton.Enabled  := true;

 end;
end;

procedure TFsp_place.DBGridDblClick(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////
procedure TFsp_place.Action_AddExecute(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_place.Action_DelExecute(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFsp_place.Action_ModExecute(Sender: TObject);
begin
 if UpdateButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_place.Action_RefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_place.Action_SelExecute(Sender: TObject);
begin
 if UpdateButton.Enabled then SelButtonClick(Self);
end;

procedure TFsp_place.Action_ExitExecute(Sender: TObject);
begin
 ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////
procedure TFsp_place.PM_AddButtonClick(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_place.PM_DelButtonClick(Sender: TObject);
begin
 DelButtonClick(Self);
end;

procedure TFsp_place.PM_ModButtonClick(Sender: TObject);
begin
 ModButtonClick(Self);
end;

procedure TFsp_place.PM_RefreshButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_place.PM_SelButtonClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;

procedure TFsp_place.PM_ExitButtonClick(Sender: TObject);
begin
 ExitButtonClick(Self);
end;

procedure TFsp_place.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFsp_place.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFsp_place.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

procedure TFsp_place.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

end.
