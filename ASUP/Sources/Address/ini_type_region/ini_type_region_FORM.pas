unit ini_type_region_FORM;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
    pFIBDataSet, pFIBStoredProc, ActnList, Menus, AGCommon, Grids, Db, DBGrids,
    pFIBQuery, StdCtrls, AGComponents, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
    cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit, uAddressCommon,
  DBCtrls;

type
    TFini_type_region = class(TForm)
        Panel1: TPanel;
        DataSource: TDataSource;
        DataSet: TpFIBDataSet;
        AddButton: TSpeedButton;
        DelButton: TSpeedButton;
        ModButton: TSpeedButton;
        SelButton: TSpeedButton;
        ExitButton: TSpeedButton;
        DownButton: TSpeedButton;
        UpButton: TSpeedButton;
        StoredProc: TpFIBStoredProc;
        RefreshButton: TSpeedButton;
        ActionList1: TActionList;
        Action_Add: TAction;
        Action_Del: TAction;
        Action_Mod: TAction;
        Action_Refresh: TAction;
        Action_Up: TAction;
        Action_Down: TAction;
        Action_Sel: TAction;
        Action_Exit: TAction;
        PopupMenu1: TPopupMenu;
        PM_AddButton: TMenuItem;
        PM_DelButton: TMenuItem;
        PM_ModButton: TMenuItem;
        N4: TMenuItem;
        PM_RefreshButton: TMenuItem;
        N6: TMenuItem;
        PM_DownButton: TMenuItem;
        PM_UpButton: TMenuItem;
        N9: TMenuItem;
        PM_SelButton: TMenuItem;
        N11: TMenuItem;
        PM_ExitButton: TMenuItem;
        cxGrid1: TcxGrid;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1DBTableView1ID_TYPE_PLACE: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_FULL: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_SHORT: TcxGridDBColumn;
        cxGrid1DBTableView1ORDER: TcxGridDBColumn;
        cxGrid1Level1: TcxGridLevel;
        Panel2: TPanel;
        Label1: TLabel;
        SearchEdit: TcxTextEdit;
    FilterPanel: TPanel;
    Label2: TLabel;
    ServersBox: TDBLookupComboBox;
        procedure ExitButtonClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
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
        procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
        procedure SearchEditPropertiesChange(Sender: TObject);
        procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure ServersBoxCloseUp(Sender: TObject);
    private
        fCanSelect: boolean;
    public
        Database: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        procedure Initialize(_Database: tpFIBDatabase; _ReadTransaction: TpFIBTransaction; _WriteTransaction: TpFIBTransaction; const Options: TSPOptions);
        procedure CheckButtonsState;
        procedure SelectAll;
        procedure LocateRecord(const id: integer);
    end;

var
    Fini_type_region: TFini_type_region;

implementation
uses AGBaseTypes, ini_type_region_FORM_ADD;
{$R *.DFM}

//////////////////////////////////////////////////////////////
// Standard form procedures
//////////////////////////////////////////////////////////////

procedure TFini_type_region.Initialize(_Database: tpFIBDatabase; _ReadTransaction: TpFIBTransaction; _WriteTransaction: TpFIBTransaction; const Options: TSPOptions);
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
    fCanSelect := Options.soSel;
    SelButton.Enabled := Options.soSel;
    AddButton.Enabled := Options.soAdd;
    DelButton.Enabled := Options.soDel;
    ModButton.Enabled := Options.soMod;
    UpButton.Enabled := Options.soMod;
    DownButton.Enabled := Options.soMod;
 //Assign database and transactions to data access components
    StoredProc.Database := uAddressCommon.FibDatabase; ;
    StoredProc.Transaction := uAddressCommon.AdrWriteTransaction;
    DataSet.Database := uAddressCommon.FIBDatabase;
    DataSet.Transaction := uAddressCommon.AdrReadTransaction;

            // фильтр по структуре
    ServersBox.ListSource := ServersSource;
    ServersBox.KeyValue := Current_Server;
    if ( Servers_Count <= 2 ) or ( Version =1 ) then FilterPanel.Visible := False;

 //Select all records from table
    SelectAll;
end;

procedure TFini_type_region.SelectAll;
begin
    DataSet.Active := false;
    DataSet.SQLs.SelectSQL.Text := 'select * from PUB_INI_TYPE_REGION_SELECT(:Id_Server)';
    DataSet.ParamByName('Id_Server').AsInteger := ServersBox.KeyValue;
    DataSet.Active := true;
    CheckButtonsState;
end;


//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record

procedure TFini_type_region.AddButtonClick(Sender: TObject);
var
    add_form: Tfini_type_region_form_add;
    id_type_region: integer;
    full_name, short_name: string;
begin
    add_form := Tfini_type_region_form_add.Create(Self);
    add_form.Caption := 'Додати';
    if add_form.ShowModal = mrOK then
    begin
        full_name := add_form.FullNameEdit.Text;
        short_name := add_form.ShortNameEdit.Text;
//  GetNewPrimaryKey(StoredProc, 'INI_TYPE_REGION', id_type_region);
        StoredProc.Transaction.StartTransaction;

        if Version = 1 then
        begin
            id_type_region := -1;
            StoredProc.ExecProcedure('PROC_INI_TYPE_REGION_ADD', [id_type_region, full_name, short_name]);
        end;

        if Version = 2 then
            StoredProc.ExecProcedure('PUB_INI_TYPE_REGION_ADD', [full_name, short_name]);

        StoredProc.Transaction.Commit;
        SelectAll;
        LocateRecord(id_type_region);
    end;
    add_form.Free;
end;

//Modify record

procedure TFini_type_region.ModButtonClick(Sender: TObject);
var
    mod_form: Tfini_type_region_form_add;
    id_type_region: integer;
    full_name, short_name: string;
begin
    if DataSet['Id_Server'] <> Current_Server then
    begin
      MessageDlg('Не можна змінювати дані іншої структури!', mtError, [mbOk], 0);
      ModalResult := 0;
      Exit;
    end;

    id_type_region := DataSet['ID_TYPE_REGION'];
    full_name := DataSet['NAME_FULL'];
    short_name := DataSet['NAME_SHORT'];

    mod_form := Tfini_type_region_form_add.Create(Self);
    mod_form.Caption := 'Змінити';
    mod_form.FullNameEdit.Text := full_name;
    mod_form.ShortNameEdit.Text := short_name;
    if mod_form.ShowModal = mrOK then
    begin
        full_name := mod_form.FullNameEdit.Text;
        short_name := mod_form.ShortNameEdit.Text;

        StoredProc.Transaction.StartTransaction;

        if Version = 1 then
            StoredProc.ExecProcedure('PROC_INI_TYPE_REGION_MOD', [id_type_region, full_name, short_name]);

        if Version = 2 then
            StoredProc.ExecProcedure('PUB_INI_TYPE_REGION_MOD', [id_type_region, full_name, short_name]);

        StoredProc.Transaction.Commit;
        SelectAll;
        LocateRecord(id_type_region);
    end;
    mod_form.Free;
end;

//Delete record

procedure TFini_type_region.DelButtonClick(Sender: TObject);
var
    id_type_region: integer;
    selected_id: integer;
begin
    if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

    if DataSet['Id_Server'] <> Current_Server then
    begin
      MessageDlg('Не можна змінювати дані іншої структури!', mtError, [mbOk], 0);
      ModalResult := 0;
      Exit;
    end;


    id_type_region := DataSet['ID_TYPE_REGION'];
    StoredProc.Transaction.StartTransaction;

    if Version = 1 then
        StoredProc.ExecProcedure('PROC_INI_TYPE_REGION_DEL', [id_type_region]);

    if Version = 2 then
        StoredProc.ExecProcedure('PUB_INI_TYPE_REGION_DEL', [id_type_region]);

    StoredProc.Transaction.Commit;

    selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
    SelectAll;
    cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid

procedure TFini_type_region.RefreshButtonClick(Sender: TObject);
var
    selected_id: integer;
begin
    if DataSet.RecordCount = 0 then
    begin
        SelectAll;
        exit;
    end;
    selected_id := DataSet.FieldByName('ID_TYPE_REGION').AsInteger;
    SelectAll;
    DataSet.Locate('ID_TYPE_REGION', selected_id, [loCaseInsensitive]);
end;

//Close form

procedure TFini_type_region.ExitButtonClick(Sender: TObject);
begin
    if FormStyle = fsMDIChild then
        Close
    else
        ModalResult := mrCancel;
end;

//Select record

procedure TFini_type_region.SelButtonClick(Sender: TObject);
begin
    // выбираем записи только из текущего сервера
    if DataSet['Id_Server'] <> Current_Server then
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

//Move record up

procedure TFini_type_region.UpButtonClick(Sender: TObject);
var
    id_type_region: integer;
begin
    id_type_region := DataSet['ID_TYPE_REGION'];

    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PROC_INI_TYPE_REGION_MOVE_UP', [id_type_region]);
    StoredProc.Transaction.Commit;

    SelectAll;
    LocateRecord(id_type_region);
end;

//Move record down

procedure TFini_type_region.DownButtonClick(Sender: TObject);
var
    id_type_region: integer;
begin
    id_type_region := DataSet['ID_TYPE_REGION'];

    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PROC_INI_TYPE_REGION_MOVE_DOWN', [id_type_region]);
    StoredProc.Transaction.Commit;

    SelectAll;
    LocateRecord(id_type_region);
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////

procedure TFini_type_region.LocateRecord(const id: integer);
begin
    DataSet.Locate('ID_TYPE_REGION', id, []);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////

procedure TFini_type_region.CheckButtonsState;
begin
    if DataSet.RecordCount = 0 then
    begin
        DelButton.Enabled := false;
        ModButton.Enabled := false;
        DownButton.Enabled := false;
        UpButton.Enabled := false;
        SelButton.Enabled := false;

        PM_DelButton.Enabled := false;
        PM_ModButton.Enabled := false;
        PM_SelButton.Enabled := false;
        PM_DownButton.Enabled := false;
        PM_UpButton.Enabled := false;
    end
    else
    begin
        DelButton.Enabled := true;
        ModButton.Enabled := true;
        SelButton.Enabled := fCanSelect;

        PM_DelButton.Enabled := true;
        PM_ModButton.Enabled := true;
        PM_SelButton.Enabled := fCanSelect
  //Up and Down Buttons checks in DataSet AfterScroll event:  DataSetAfterScroll
    end;
end;

//Procedure checks up and down buttons accessibility

procedure TFini_type_region.DataSetAfterScroll(DataSet: TDataSet);
begin
    if DataSet.RecNo = DataSet.RecordCount then
    begin
        DownButton.Enabled := false;
        PM_DownButton.Enabled := false;
    end
    else
    begin
        DownButton.Enabled := true;
        PM_DownButton.Enabled := true;
    end;
    if DataSet.RecNo = 1 then
    begin
        UpButton.Enabled := false;
        PM_UpButton.Enabled := false;
    end
    else
    begin
        UpButton.Enabled := true;
        PM_UpButton.Enabled := true;
    end;
end;

procedure TFini_type_region.FormShow(Sender: TObject);
begin
    AddButton.Glyph.LoadFromResourceName(HInstance, 'add');
    ModButton.Glyph.LoadFromResourceName(HInstance, 'edit');
    DelButton.Glyph.LoadFromResourceName(HInstance, 'delete');
    RefreshButton.Glyph.LoadFromResourceName(HInstance, 'refresh');
    SelButton.Glyph.LoadFromResourceName(HInstance, 'select');
    DownButton.Glyph.LoadFromResourceName(HInstance, 'down2');
    UpButton.Glyph.LoadFromResourceName(HInstance, 'up2');
    ExitButton.Glyph.LoadFromResourceName(HInstance, 'exit');
end;

procedure TFini_type_region.DBGridDblClick(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////

procedure TFini_type_region.Action_AddExecute(Sender: TObject);
begin
    AddButtonClick(Self);
end;

procedure TFini_type_region.Action_DelExecute(Sender: TObject);
begin
    if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFini_type_region.Action_ModExecute(Sender: TObject);
begin
    if ModButton.Enabled then ModButtonClick(Self);
end;

procedure TFini_type_region.Action_RefreshExecute(Sender: TObject);
begin
    RefreshButtonClick(Self);
end;

procedure TFini_type_region.Action_DownExecute(Sender: TObject);
begin
    if DownButton.Enabled then DownButtonClick(Self);
end;

procedure TFini_type_region.Action_UpExecute(Sender: TObject);
begin
    if UpButton.Enabled then UpButtonClick(Self);
end;

procedure TFini_type_region.Action_SelExecute(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
end;

procedure TFini_type_region.Action_ExitExecute(Sender: TObject);
begin
    ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////

procedure TFini_type_region.PM_AddButtonClick(Sender: TObject);
begin
    AddButtonClick(Self);
end;

procedure TFini_type_region.PM_DelButtonClick(Sender: TObject);
begin
    DelButtonClick(Self);
end;

procedure TFini_type_region.PM_ModButtonClick(Sender: TObject);
begin
    ModButtonClick(Self);
end;

procedure TFini_type_region.PM_RefreshButtonClick(Sender: TObject);
begin
    RefreshButtonClick(Self);
end;

procedure TFini_type_region.PM_DownButtonClick(Sender: TObject);
begin
    DownButtonClick(Self);
end;

procedure TFini_type_region.PM_UpButtonClick(Sender: TObject);
begin
    UpButtonClick(Self);
end;

procedure TFini_type_region.PM_SelButtonClick(Sender: TObject);
begin
    SelButtonClick(Self);
end;

procedure TFini_type_region.PM_ExitButtonClick(Sender: TObject);
begin
    ExitButtonClick(Self);
end;

procedure TFini_type_region.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFini_type_region.cxGrid1DBTableView1KeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        if SelButton.Enabled then SelButtonClick(Self);
    if Key = #27 then Close;
end;

procedure TFini_type_region.SearchEditPropertiesChange(Sender: TObject);
begin
    DataSet.Locate('NAME_FULL', SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFini_type_region.SearchEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFini_type_region.ServersBoxCloseUp(Sender: TObject);
begin
  RefreshButtonClick(Self);
end;

end.
