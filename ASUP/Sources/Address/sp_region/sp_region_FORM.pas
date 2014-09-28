unit sp_region_FORM;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
    pFIBDataSet, pFIBStoredProc, ActnList, Menus, AGCommon, Grids, Db, DBGrids,
    pFIBQuery, StdCtrls, AGComponents, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxContainer,
    cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, uAddressCommon,
  DBCtrls;

type
    TFsp_region = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        DelButton: TSpeedButton;
        ModButton: TSpeedButton;
        SelButton: TSpeedButton;
        ExitButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        ActionList1: TActionList;
        Action_Add: TAction;
        Action_Del: TAction;
        Action_Mod: TAction;
        Action_Refresh: TAction;
        Action_Sel: TAction;
        Action_Exit: TAction;
        StoredProc: TpFIBStoredProc;
        PopupMenu1: TPopupMenu;
        PM_AddButton: TMenuItem;
        PM_DelButton: TMenuItem;
        PM_ModButton: TMenuItem;
        N4: TMenuItem;
        PM_RefreshButton: TMenuItem;
        N6: TMenuItem;
        PM_SelButton: TMenuItem;
        N11: TMenuItem;
        PM_ExitButton: TMenuItem;
        DataSet1: TpFIBDataSet;
        DataSource1: TDataSource;
        cxGrid1: TcxGrid;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        Panel2: TPanel;
        Label1: TLabel;
        SearchEdit: TcxTextEdit;
        cxGrid1DBTableView1ID_REGION: TcxGridDBColumn;
        cxGrid1DBTableView1ID_TYPE_REGION: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_REGION: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_TYPE_REGION: TcxGridDBColumn;
        cxGrid1DBTableView1REGION: TcxGridDBColumn;
    FilterPanel: TPanel;
    Label2: TLabel;
    ServersBox: TDBLookupComboBox;
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
        procedure SelButton2Click(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
        procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
        procedure SearchEditPropertiesChange(Sender: TObject);
    procedure ServersBoxCloseUp(Sender: TObject);
    private
    public
        Database: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        CanSelect1: boolean;
        CanSelect2: boolean;
        procedure Initialize(_Database: tpFIBDatabase; _ReadTransaction: TpFIBTransaction; _WriteTransaction: TpFIBTransaction; const Options: TSPOptions);
        procedure CheckButtonsState;
        procedure SelectAll;
        procedure LocateRecord(const id: integer);
    end;

var
    Fsp_region: TFsp_region;

implementation
uses AGBaseTypes, sp_region_FORM_ADD, sp_place_FORM_ADD;
{$R *.DFM}

//////////////////////////////////////////////////////////////
// Standard form procedures
//////////////////////////////////////////////////////////////

procedure TFsp_region.Initialize(_Database: tpFIBDatabase; _ReadTransaction: TpFIBTransaction; _WriteTransaction: TpFIBTransaction; const Options: TSPOptions);
begin
 //Assign database and transactions to internal var's
    if _Database <> nil then
        Database := _Database
    else
        Database := common_database;
    if _ReadTransaction <> nil then
        ReadTransaction := _ReadTransaction
    else
        ReadTransaction := common_read_transaction;
    if _WriteTransaction <> nil then
        WriteTransaction := _WriteTransaction
    else
        WriteTransaction := common_write_transaction;
 //Process form options
    CanSelect1 := Options.soSel;
    CanSelect2 := Options.soSel;
    SelButton.Enabled := Options.soSel;
    AddButton.Enabled := Options.soAdd;
    DelButton.Enabled := Options.soDel;
    ModButton.Enabled := Options.soMod;
 //Assign database and transactions to data access components
    StoredProc.Database := uAddressCommon.FibDatabase;
    StoredProc.Transaction := uAddressCommon.AdrWriteTransaction;
    DataSet1.Database := uAddressCommon.FibDatabase;
    DataSet1.Transaction := uAddressCommon.AdrReadTransaction;

      // фильтр по структуре
    ServersBox.ListSource := ServersSource;
    ServersBox.KeyValue := Current_Server;
    if ( Servers_Count <= 2 ) or ( Version =1 ) then FilterPanel.Visible := False;

 //Select all records from table
    SelectAll;
end;

procedure TFsp_region.SelectAll;
begin
    DataSet1.Active := false;

    if uAddressCommon.version = 2 then
    begin
        DataSet1.SQLs.SelectSQL.Text := 'select * from PUB_SP_REGION_SEL_2(:Id_Server)';
        DataSet1.ParamByName('ID_SERVER').AsInteger := ServersBox.KeyValue;
    end;

    if uAddressCommon.version = 1 then
        DataSet1.SQLs.SelectSQL.Text := 'select * from PROC_SP_REGION_SEL';

    DataSet1.Active := true;
    CheckButtonsState;
end;

//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record

procedure TFsp_region.AddButtonClick(Sender: TObject);
var
    add_form: Tfsp_region_form_add;
    id_region: integer;
    id_type_region: integer;
    name_region: string;
begin
    add_form := Tfsp_region_form_add.Create(Self);
    add_form.Caption := 'Додати';
    if add_form.ShowModal = mrOK then
    begin
        name_region := add_form.FullNameEdit.Text;
        id_type_region := add_form.id_type_region;

        StoredProc.Transaction.StartTransaction;

        if version = 2 then
            StoredProc.ExecProcedure('PUB_SP_REGION_ADD', [id_type_region, name_region]);

        if version = 1 then
            StoredProc.ExecProcedure('PROC_SP_REGION_ADD', [id_type_region, name_region]);

        StoredProc.Transaction.Commit;
        SelectAll;

        DataSet1.Locate('Name_Region', Name_Region, []);
    end;
    add_form.Free;
end;

//Modify record

procedure TFsp_region.ModButtonClick(Sender: TObject);
var
    mod_form: Tfsp_region_form_add;
    id_region: integer;
    id_type_region: integer;
    name_region: string;
    name_type_region: string;
begin
    id_region := DataSet1['ID_REGION'];
    id_type_region := DataSet1['ID_TYPE_REGION'];
    name_region := DataSet1['NAME_REGION'];
    name_type_region := DataSet1['NAME_TYPE_REGION'];

    mod_form := Tfsp_region_form_add.Create(Self);
    mod_form.Caption := 'Змінити';
    mod_form.FullNameEdit.Text := name_region;
    mod_form.TypeEdit.Text := name_type_region;
    mod_form.id_type_region := id_type_region;

    if mod_form.ShowModal = mrOK then
    begin
        name_region := mod_form.FullNameEdit.Text;
        id_type_region := mod_form.id_type_region;

        StoredProc.Transaction.StartTransaction;

        if version = 2 then
            StoredProc.ExecProcedure('PUB_SP_REGION_MOD', [id_region, id_type_region, name_region]);

        if version = 1 then
            StoredProc.ExecProcedure('PROC_SP_REGION_MOD', [id_region, id_type_region, name_region]);

        StoredProc.Transaction.Commit;
        SelectAll;
        LocateRecord(id_region);
    end;
    mod_form.Free;
end;

//Delete record

procedure TFsp_region.DelButtonClick(Sender: TObject);
var
    id_region: integer;
    selected_id: integer;
begin
    if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

    if DataSet1['Id_Server'] <> Current_Server then
    begin
        MessageDlg('Не можна змінювати дані іншої структури!', mtError, [mbOk], 0);
        ModalResult := 0;
        Exit;
    end;

    id_region := DataSet1['ID_REGION'];
    StoredProc.Transaction.StartTransaction;

    if version = 2 then
        StoredProc.ExecProcedure('PUB_SP_REGION_DEL', [id_region]);

    if version = 1 then
        StoredProc.ExecProcedure('PROC_SP_REGION_DEL', [id_region]);

    StoredProc.Transaction.Commit;

    selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
    SelectAll;
    cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid

procedure TFsp_region.RefreshButtonClick(Sender: TObject);
var
    selected_id: integer;
begin
    if DataSet1.RecordCount = 0 then
    begin
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
    if FormStyle = fsMDIChild then
        Close
    else
        ModalResult := mrCancel;
end;

//Select record

procedure TFsp_region.SelButtonClick(Sender: TObject);
begin
     // выбираем записи только из текущего сервера
    if DataSet1['Id_Server'] <> Current_Server then
    begin
      MessageDlg('Не можна вибирати запис з іншої структури!', mtError, [mbOk], 0);
      ModalResult := 0;
      Exit;
    end;

    if FormStyle = fsMDIChild then
        Close
    else
        ModalResult := mrOK;
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////

procedure TFsp_region.LocateRecord(const id: integer);
begin
    DataSet1.Locate('ID_REGION', id, []);
end;

//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////

procedure TFsp_region.CheckButtonsState;
begin
    if DataSet1.RecordCount = 0 then
    begin
        DelButton.Enabled := false;
        ModButton.Enabled := false;
        SelButton.Enabled := false;

        PM_DelButton.Enabled := false;
        PM_ModButton.Enabled := false;
        PM_SelButton.Enabled := false;
    end
    else
    begin
        DelButton.Enabled := true;
        ModButton.Enabled := true;
        SelButton.Enabled := CanSelect1;

        PM_DelButton.Enabled := true;
        PM_ModButton.Enabled := true;
        PM_SelButton.Enabled := CanSelect1;
  //Up and Down Buttons checks in DataSet1 AfterScroll event:  DataSet1AfterScroll
    end;
end;


procedure TFsp_region.FormShow(Sender: TObject);
begin
    AddButton.Glyph.LoadFromResourceName(HInstance, 'add');
    ModButton.Glyph.LoadFromResourceName(HInstance, 'edit');
    DelButton.Glyph.LoadFromResourceName(HInstance, 'delete');
    RefreshButton.Glyph.LoadFromResourceName(HInstance, 'refresh');
    SelButton.Glyph.LoadFromResourceName(HInstance, 'select');
    ExitButton.Glyph.LoadFromResourceName(HInstance, 'exit');
end;

procedure TFsp_region.DBGridDblClick(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
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
    if ModButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_region.Action_RefreshExecute(Sender: TObject);
begin
    RefreshButtonClick(Self);
end;

procedure TFsp_region.Action_SelExecute(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
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
    if ModButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_region.PM_RefreshButtonClick(Sender: TObject);
begin
    RefreshButtonClick(Self);
end;

procedure TFsp_region.PM_SelButtonClick(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
end;

procedure TFsp_region.PM_ExitButtonClick(Sender: TObject);
begin
    ExitButtonClick(Self);
end;

procedure TFsp_region.SelButton2Click(Sender: TObject);
begin
    if FormStyle = fsMDIChild then
        Close
    else
        ModalResult := mrOK;
end;

procedure TFsp_region.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFsp_region.cxGrid1DBTableView1KeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        if SelButton.Enabled then SelButtonClick(Self);
    if Key = #27 then Close;
end;

procedure TFsp_region.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFsp_region.SearchEditPropertiesChange(Sender: TObject);
begin
    DataSet1.Locate('REGION', SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFsp_region.ServersBoxCloseUp(Sender: TObject);
begin
  RefreshButtonClick(Self)
end;

end.

