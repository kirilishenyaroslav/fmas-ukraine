unit sp_place_FORM;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
    pFIBDataSet, pFIBStoredProc, ActnList, Menus, AGCommon, Grids, Db, DBGrids,
    pFIBQuery, StdCtrls, AGComponents, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxContainer,
    cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
    uAddressCommon, uSearchFrame, DBCtrls;

type
    TFsp_place = class(TForm)
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
        fmSearch1: TfmSearch;
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
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
        procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
        procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
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
    Fsp_place: TFsp_place;

implementation
uses AGBaseTypes, sp_place_FORM_ADD;
{$R *.DFM}

//////////////////////////////////////////////////////////////
// Standard form procedures
//////////////////////////////////////////////////////////////

procedure TFsp_place.Initialize(_Database: tpFIBDatabase; _ReadTransaction: TpFIBTransaction; _WriteTransaction: TpFIBTransaction; const Options: TSPOptions);
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
 //Assign database and transactions to data access components
    StoredProc.Database := uAddressCommon.FibDatabase;
    StoredProc.Transaction := uAddressCommon.AdrWriteTransaction;
    DataSet.Database := uAddressCommon.FibDatabase;
    DataSet.Transaction := uAddressCommon.AdrReadTransaction;

       // фильтр по структуре
    ServersBox.ListSource := ServersSource;
    ServersBox.KeyValue := Current_Server;
    if (Servers_Count <= 2) or (Version = 1) then FilterPanel.Visible := False;

 //Select all records from table
    SelectAll;
end;

procedure TFsp_place.SelectAll;
begin
    DataSet.Active := false;

    if Version = 2 then
    begin
        DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_PLACE_SEL_2(:Id_Server)';
        DataSet.ParamByName('Id_Server').AsInteger := ServersBox.KeyValue;
    end
    else
        DataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_PLACE_SEL';

    DataSet.Active := true;
    CheckButtonsState;
end;


//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record

procedure TFsp_place.AddButtonClick(Sender: TObject);
var
    add_form: Tfsp_place_form_add;
    id_place: integer;
    id_type_place: integer;
    name_place: string;
    is_dc: integer;
    is_rc: integer;
    is_ca: integer;
begin
    add_form := Tfsp_place_form_add.Create(Self);
    add_form.Caption := 'Додати';
    if add_form.ShowModal = mrOK then
    begin
        name_place := add_form.FullNameEdit.Text;
  //GetNewPrimaryKey(StoredProc, 'SP_PLACE', id_place);
        id_type_place := add_form.id_type_place;
        if add_form.DistrictCheck.Checked then
            is_dc := 1
        else
            is_dc := 0;
        if add_form.RegionCheck.Checked then
            is_rc := 1
        else
            is_rc := 0;
        if add_form.CapitalCheck.Checked then
            is_ca := 1
        else
            is_ca := 0;

        StoredProc.Transaction.StartTransaction;

        try
            if version = 2 then
                StoredProc.ExecProcedure('PUB_SP_PLACE_ADD', [id_type_place, name_place, is_dc, is_rc, is_ca]);

            if version = 1 then
                StoredProc.ExecProcedure('PROC_SP_PLACE_ADD', [0, id_type_place, name_place, is_dc, is_rc, is_ca]);
        except on E: exception do
            begin
                MessageDlg(E.Message, mtError, [mbOk], 0);
                StoredProc.Transaction.Rollback;
                exit;
            end;
        end;

        StoredProc.Transaction.Commit;
        SelectAll;
        DataSet.Locate('name_place', name_place, []);
    end;
    add_form.Free;
end;

//Modify record

procedure TFsp_place.ModButtonClick(Sender: TObject);
var
    mod_form: Tfsp_place_form_add;
    id_place: integer;
    name_place: string;
    id_type_place: integer;
    is_dc: integer;
    is_rc: integer;
    is_ca: integer;
    name_type_place: string;
begin
    if DataSet['Id_Server'] <> Current_Server then
    begin
        MessageDlg('Не можна змінювати дані іншої структури!', mtError, [mbOk], 0);
        ModalResult := 0;
        Exit;
    end;

    id_place := DataSet['ID_PLACE'];
    id_type_place := DataSet['ID_TYPE_PLACE'];
    name_place := DataSet['NAME_PLACE'];
    is_dc := DataSet['IS_DISTRICT_CENTRE'];
    is_rc := DataSet['IS_REGIONAL_CENTRE'];
    is_ca := DataSet['IS_CAPITAL'];
    name_type_place := DataSet['NAME_TYPE_PLACE'];

    mod_form := Tfsp_place_form_add.Create(Self);
    mod_form.Caption := 'Змінити';
    mod_form.FullNameEdit.Text := name_place;
    mod_form.TypeEdit.Text := name_type_place;

    if mod_form.ShowModal = mrOK then
    begin
        name_place := mod_form.FullNameEdit.Text;
        id_type_place := mod_form.id_type_place;
        if mod_form.DistrictCheck.Checked then
            is_dc := 1
        else
            is_dc := 0;
        if mod_form.RegionCheck.Checked then
            is_rc := 1
        else
            is_rc := 0;
        if mod_form.CapitalCheck.Checked then
            is_ca := 1
        else
            is_ca := 0;

        StoredProc.Transaction.StartTransaction;

        if version = 2 then
            StoredProc.ExecProcedure('PUB_SP_PLACE_MOD', [id_place, id_type_place, name_place, is_dc, is_rc, is_ca]);

        if version = 1 then
            StoredProc.ExecProcedure('PROC_SP_PLACE_MOD', [id_place, id_type_place, name_place, is_dc, is_rc, is_ca]);

        StoredProc.Transaction.Commit;
        SelectAll;
        LocateRecord(id_place);
    end;
    mod_form.Free;
end;

//Delete record

procedure TFsp_place.DelButtonClick(Sender: TObject);
var
    id_place: integer;
    selected_id: integer;
begin
    if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

    if DataSet['Id_Server'] <> Current_Server then
    begin
        MessageDlg('Не можна змінювати дані іншої структури!', mtError, [mbOk], 0);
        ModalResult := 0;
        Exit;
    end;

    id_place := DataSet['ID_PLACE'];
    StoredProc.Transaction.StartTransaction;

    if version = 2 then
        StoredProc.ExecProcedure('PUB_SP_PLACE_DEL', [id_place]);

    if version = 1 then
        StoredProc.ExecProcedure('PROC_SP_PLACE_DEL', [id_place]);

    StoredProc.Transaction.Commit;

    selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
    SelectAll;
    cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid

procedure TFsp_place.RefreshButtonClick(Sender: TObject);
var
    selected_id: integer;
begin
    if DataSet.RecordCount = 0 then
    begin
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
    if FormStyle = fsMDIChild then
        Close
    else
        ModalResult := mrCancel;
end;

//Select record

procedure TFsp_place.SelButtonClick(Sender: TObject);
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

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////

procedure TFsp_place.LocateRecord(const id: integer);
begin
    DataSet.Locate('ID_PLACE', id, []);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////

procedure TFsp_place.CheckButtonsState;
begin
    if DataSet.RecordCount = 0 then
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
        SelButton.Enabled := fCanSelect;

        PM_DelButton.Enabled := true;
        PM_ModButton.Enabled := true;
        PM_SelButton.Enabled := fCanSelect
  //Up and Down Buttons checks in DataSet AfterScroll event:  DataSetAfterScroll
    end;
end;

procedure TFsp_place.FormShow(Sender: TObject);
begin
    AddButton.Glyph.LoadFromResourceName(HInstance, 'add');
    ModButton.Glyph.LoadFromResourceName(HInstance, 'edit');
    DelButton.Glyph.LoadFromResourceName(HInstance, 'delete');
    RefreshButton.Glyph.LoadFromResourceName(HInstance, 'refresh');
    SelButton.Glyph.LoadFromResourceName(HInstance, 'select');
    ExitButton.Glyph.LoadFromResourceName(HInstance, 'exit');

    fmSearch1.Prepare(DataSet);
end;

procedure TFsp_place.DBGridDblClick(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
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
    if ModButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_place.Action_RefreshExecute(Sender: TObject);
begin
    RefreshButtonClick(Self);
end;

procedure TFsp_place.Action_SelExecute(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
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
    if Key = #13 then
        if SelButton.Enabled then SelButtonClick(Self);
    if Key = #27 then Close;

    if ord(Key) > 31 then
        fmSearch1.SearchEdit.Text := fmSearch1.SearchEdit.Text + Key;
end;

procedure TFsp_place.cxGrid1DBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_BACK then fmSearch1.SearchEdit.Text := '';
end;

procedure TFsp_place.ServersBoxCloseUp(Sender: TObject);
begin
    RefreshButtonClick(Self)
end;

end.

