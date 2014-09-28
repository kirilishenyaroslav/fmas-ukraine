unit sp_country_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
  pFIBDataSet, pFIBStoredProc, ActnList, Menus, COMMON, Grids, Db, DBGrids,
  pFIBQuery, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit, ImgList,
  Ibase, Variants, FIBDatabase, dxBar, dxBarExtItems, cxTL;

type
  TFsp_country = class(TForm)
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
    cxGrid1DBTableView1ID_COUNTRY: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_COUNTRY: TcxGridDBColumn;
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
    dxBarSubItem1: TdxBarSubItem;
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

function GetCountries(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
exports  GetCountries;

implementation
uses BaseTypes, sp_country_FORM_ADD;
{$R *.DFM}
function GetCountries(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
    var T:TFsp_country;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFsp_country.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_country.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;

    GetCountries:=Res;
end;


constructor TFsp_country.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      if CurFS=fsNormal
      then ChooseButton.Enabled:=true;
      DataSet.SQLs.SelectSQL.Text := 'select * from VIEW_SP_COUNTRY';
      DataSet.Open;
      self.FormStyle:=FS;

end;

procedure TFsp_country.SelectAll;
begin
 DataSet.Active := false;
 DataSet.SQLs.SelectSQL.Text := 'select * from VIEW_SP_COUNTRY';
 DataSet.Active := true;
 CheckButtonsState;
end;


//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record
procedure TFsp_country.AddButtonClick(Sender: TObject);
var
 add_form      : Tfsp_country_form_add;
 id_country   : integer;
 name_country : string;
begin
 add_form := Tfsp_country_form_add.Create(Self);
 add_form.Caption := 'Добавить';
 if add_form.ShowModal = mrOK then begin
  name_country  := add_form.FullNameEdit.Text;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_COUNTRY_ADD', [name_country]);
  id_country:=StoredProc.ParamByName('ID_COUNTRY').AsInteger;
  StoredProc.Transaction.Commit;
  SelectAll;
  LocateRecord(id_country);
 end;
 add_form.Free;
end;

//Modify record
procedure TFsp_country.ModButtonClick(Sender: TObject);
var
 mod_form      : Tfsp_country_form_add;
 id_country   : integer;
 name_country : string;
begin
 id_country   := DataSet['ID_COUNTRY'];
 name_country := DataSet['NAME_COUNTRY'];

 mod_form := Tfsp_country_form_add.Create(Self);
 mod_form.Caption := 'Изменить';
 mod_form.FullNameEdit.Text := name_country;

 if mod_form.ShowModal = mrOK then begin
  name_country  := mod_form.FullNameEdit.Text;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_COUNTRY_MOD', [id_country, name_country]);
  StoredProc.Transaction.Commit;
  SelectAll;
  LocateRecord(id_country);
 end;
 mod_form.Free;
end;

//Delete record
procedure TFsp_country.DelButtonClick(Sender: TObject);
var
 id_country, selected_id : integer;
begin
 if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 id_country := DataSet['ID_COUNTRY'];
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_SP_COUNTRY_DEL', [id_country]);
 StoredProc.Transaction.Commit;

 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 SelectAll;
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid
procedure TFsp_country.RefreshButtonClick(Sender: TObject);
var
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then begin
  SelectAll;
  exit;
 end;
 selected_id := DataSet.FieldByName('ID_COUNTRY').AsInteger;
 SelectAll;
 DataSet.Locate('ID_COUNTRY', selected_id, [loCaseInsensitive]);
end;

//Close form
procedure TFsp_country.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

//Select record
procedure TFsp_country.SelButtonClick(Sender: TObject);
begin
   if DataSet.Active and (dataSet.RecordCount>0)
   then begin
         ResultValue:=VarArrayCreate([0,1],varVariant);
         ResultValue[0]:=DataSet['ID_COUNTRY'];
         ResultValue[1]:=DataSet['NAME_COUNTRY'];
         ModalResult := mrYes;
   end;
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////
procedure TFsp_country.LocateRecord(const id : integer);
begin
 DataSet.Locate('ID_COUNTRY', id, []);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////
procedure TFsp_country.CheckButtonsState;
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

procedure TFsp_country.FormShow(Sender: TObject);
begin
 cxGrid1.SetFocus;
end;

procedure TFsp_country.DBGridDblClick(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////
procedure TFsp_country.Action_AddExecute(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_country.Action_DelExecute(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFsp_country.Action_ModExecute(Sender: TObject);
begin
 if UpdateButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_country.Action_RefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_country.Action_SelExecute(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;

procedure TFsp_country.Action_ExitExecute(Sender: TObject);
begin
 ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////
procedure TFsp_country.PM_AddButtonClick(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_country.PM_DelButtonClick(Sender: TObject);
begin
 DelButtonClick(Self);
end;

procedure TFsp_country.PM_ModButtonClick(Sender: TObject);
begin
 ModButtonClick(Self);
end;

procedure TFsp_country.PM_RefreshButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_country.PM_SelButtonClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;

procedure TFsp_country.PM_ExitButtonClick(Sender: TObject);
begin
 ExitButtonClick(Self);
end;

procedure TFsp_country.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFsp_country.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFsp_country.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

procedure TFsp_country.CloseButtonClick(Sender: TObject);
begin
   Close;
end;

end.
