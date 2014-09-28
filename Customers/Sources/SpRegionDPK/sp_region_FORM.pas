unit sp_region_FORM;

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
  TFsp_region = class(TForm)
    ActionList1: TActionList;
    Action_Add: TAction;
    Action_Del: TAction;
    Action_Mod: TAction;
    Action_Refresh: TAction;
    Action_Sel: TAction;
    Action_Exit: TAction;
    StoredProc: TpFIBStoredProc;
    DataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ID_REGION: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TYPE_REGION: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_REGION: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_REGION: TcxGridDBColumn;
    cxGrid1DBTableView1REGION: TcxGridDBColumn;
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
    procedure SelButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
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

function GetRegions(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
exports  GetRegions;

implementation
uses BaseTypes, sp_region_FORM_ADD;
{$R *.DFM}
function GetRegions(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
    var T:TFsp_region;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFsp_region.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_region.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;
    GetRegions:=Res;
end;


constructor TFsp_region.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      if CurFS=fsNormal
      then ChooseButton.Enabled:=true;
      DataSet1.SQLs.SelectSQL.Text := 'select * from PUB_SP_REGION_SEL';
      DataSet1.Open;
      self.FormStyle:=FS;

end;

procedure TFsp_region.SelectAll;
begin
 DataSet1.Active := false;
 DataSet1.SQLs.SelectSQL.Text := 'select * from PUB_SP_REGION_SEL';
 DataSet1.Active := true;
 CheckButtonsState;
end;

//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record
procedure TFsp_region.AddButtonClick(Sender: TObject);
var
 add_form       : Tfsp_region_form_add;
 id_region      : integer;
 id_type_region : integer;
 name_region    : string;
begin
 add_form := Tfsp_region_form_add.Create(Self);
 add_form.Caption := 'Добавить';
 if add_form.ShowModal = mrOK then begin
  name_region    := add_form.FullNameEdit.Text;
  id_type_region := add_form.id_type_region;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_REGION_ADD', [id_type_region, name_region]);
  id_region:=StoredProc.ParamByName('ID_REGION').AsInteger;
  StoredProc.Transaction.Commit;
  SelectAll;
  LocateRecord(id_region);
 end;
 add_form.Free;
end;

//Modify record
procedure TFsp_region.ModButtonClick(Sender: TObject);
var
 mod_form      : Tfsp_region_form_add;
 id_region   : integer;
 id_type_region : integer;
 name_region : string;
 name_type_region : string;
begin
 id_region   := DataSet1['ID_REGION'];
 id_type_region := DataSet1['ID_TYPE_REGION'];
 name_region := DataSet1['NAME_REGION'];
 name_type_region := DataSet1['NAME_TYPE_REGION'];

 mod_form := Tfsp_region_form_add.Create(Self);
 mod_form.Caption := 'Изменить';
 mod_form.FullNameEdit.Text := name_region;
 mod_form.TypeEdit.Text := name_type_region;
 mod_form.id_type_region := id_type_region;

 if mod_form.ShowModal = mrOK then begin
  name_region  := mod_form.FullNameEdit.Text;
  id_type_region := mod_form.id_type_region;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_REGION_MOD', [id_region, id_type_region, name_region]);
  StoredProc.Transaction.Commit;
  SelectAll;
  LocateRecord(id_region);
 end;
 mod_form.Free;
end;

//Delete record
procedure TFsp_region.DelButtonClick(Sender: TObject);
var
 id_region : integer;
 selected_id : integer;
begin
 if agMessageDlg('Внимание', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 id_region := DataSet1['ID_REGION'];
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_SP_REGION_DEL', [id_region]);
 StoredProc.Transaction.Commit;

 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid
procedure TFsp_region.RefreshButtonClick(Sender: TObject);
var
 selected_id : integer;
begin
 if DataSet1.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 selected_id := DataSet1.FieldByName('ID_REGION').AsInteger;
 SelectAll;
 DataSet1.Locate('ID_REGION', selected_id, [loCaseInsensitive]);
end;

//Close form
procedure TFsp_region.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

//Select record
procedure TFsp_region.SelButtonClick(Sender: TObject);
begin
   if DataSet1.Active and (dataSet1.RecordCount>0)
   then begin
         ResultValue:=VarArrayCreate([0,2],varVariant);
         ResultValue[0]:=DataSet1['ID_REGION'];
         ResultValue[1]:=DataSet1['NAME_TYPE_REGION']+' '+DataSet1['NAME_REGION'];
         ResultValue[2]:=DataSet1['ID_TYPE_REGION'];
         ModalResult := mrYes;
   end;
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////
procedure TFsp_region.LocateRecord(const id : integer);
begin
 DataSet1.Locate('ID_REGION', id, []);
end;

//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////
procedure TFsp_region.CheckButtonsState;
begin
 if DataSet1.RecordCount = 0 then begin
  DelButton.Enabled  := false;
  UpdateButton.Enabled  := false;
  ChooseButton.Enabled  := false;

 end else begin
  DelButton.Enabled  := true;
  UpdateButton.Enabled  := true;

 end;
end;


procedure TFsp_region.DBGridDblClick(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////
procedure TFsp_region.Action_AddExecute(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_region.Action_DelExecute(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFsp_region.Action_ModExecute(Sender: TObject);
begin
 if UpdateButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_region.Action_RefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_region.Action_SelExecute(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;

procedure TFsp_region.Action_ExitExecute(Sender: TObject);
begin
 ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////
procedure TFsp_region.PM_AddButtonClick(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_region.PM_DelButtonClick(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFsp_region.PM_ModButtonClick(Sender: TObject);
begin
 if UpdateButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_region.PM_RefreshButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_region.PM_SelButtonClick(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;

procedure TFsp_region.PM_ExitButtonClick(Sender: TObject);
begin
 ExitButtonClick(Self);
end;

procedure TFsp_region.SelButton2Click(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrOK;
end;

procedure TFsp_region.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFsp_region.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

procedure TFsp_region.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFsp_region.CloseButtonClick(Sender: TObject);
begin
Close;
end;

end.
