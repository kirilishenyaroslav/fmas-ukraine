unit sp_country_FORM;

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
    TFsp_country = class(TForm)
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
        Panel2: TPanel;
        Label1: TLabel;
        SearchEdit: TcxTextEdit;
        cxGrid1: TcxGrid;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1DBTableView1ID_COUNTRY: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_COUNTRY: TcxGridDBColumn;
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
        procedure SearchEditPropertiesChange(Sender: TObject);
        procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
        procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
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
    Fsp_country: TFsp_country;

implementation
uses AGBaseTypes, sp_country_FORM_ADD;
{$R *.DFM}
{$R ..\AdrButtons.res}

//////////////////////////////////////////////////////////////
// Standard form procedures
//////////////////////////////////////////////////////////////

procedure TFsp_country.Initialize(_Database: tpFIBDatabase; _ReadTransaction: TpFIBTransaction; _WriteTransaction: TpFIBTransaction; const Options: TSPOptions);
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
    StoredProc.Database := uAddressCommon.FIBDatabase;
    StoredProc.Transaction := uAddressCommon.AdrWriteTransaction;
    DataSet.Database := uAddressCommon.FIBDatabase;
    DataSet.Transaction := uAddressCommon.AdrReadTransaction;

      // фильтр по структуре
    ServersBox.ListSource := ServersSource;
    ServersBox.KeyValue := Current_Server;
    if Servers_Count <= 2 then FilterPanel.Visible := False;

     //Select all records from table
    SelectAll;
end;

procedure TFsp_country.SelectAll;
begin
    DataSet.Active := false;
    DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_COUNTRY_SELECT(:Id_Server)';
    DataSet.ParamByName('Id_Server').AsInteger := ServersBox.KeyValue;
    DataSet.Active := true;
    CheckButtonsState;
end;


//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record

procedure TFsp_country.AddButtonClick(Sender: TObject);
var
    add_form: Tfsp_country_form_add;
    id_country: integer;
    name_country: string;
begin
    add_form := Tfsp_country_form_add.Create(Self);
    add_form.Caption := 'Додати';
    if add_form.ShowModal = mrOK then
    begin
        name_country := add_form.FullNameEdit.Text;

        StoredProc.Transaction.StartTransaction;

        if version = 2 then
            StoredProc.ExecProcedure('PUB_SP_COUNTRY_ADD', [name_country]);



        if version = 1 then
        begin
            id_country := -1;
            StoredProc.ExecProcedure('PROC_SP_COUNTRY_ADD', [id_country, name_country]);
        end;

        StoredProc.Transaction.Commit;
        SelectAll;
        DataSet.Locate('Name_Country', name_country, []);
    end;
    add_form.Free;
end;

//Modify record

procedure TFsp_country.ModButtonClick(Sender: TObject);
var
    mod_form: Tfsp_country_form_add;
    id_country: integer;
    name_country: string;
begin
    if DataSet['Id_Server'] <> Current_Server then
    begin
        MessageDlg('Не можна змінювати дані іншої структури!', mtError, [mbOk], 0);
        ModalResult := 0;
        Exit;
    end;

    id_country := DataSet['ID_COUNTRY'];
    name_country := DataSet['NAME_COUNTRY'];

    mod_form := Tfsp_country_form_add.Create(Self);
    mod_form.Caption := 'Змінити';
    mod_form.FullNameEdit.Text := name_country;

    if mod_form.ShowModal = mrOK then
    begin
        name_country := mod_form.FullNameEdit.Text;
        StoredProc.Transaction.StartTransaction;

        if version = 2 then
            StoredProc.ExecProcedure('PUB_SP_COUNTRY_MOD', [id_country, name_country]);

        if version = 1 then
            StoredProc.ExecProcedure('PROC_SP_COUNTRY_MOD', [id_country, name_country]);

        StoredProc.Transaction.Commit;
        SelectAll;
        LocateRecord(id_country);
    end;
    mod_form.Free;
end;

//Delete record

procedure TFsp_country.DelButtonClick(Sender: TObject);
var
    id_country, selected_id: integer;
begin
    if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

    if DataSet['Id_Server'] <> Current_Server then
    begin
        MessageDlg('Не можна змінювати дані іншої структури!', mtError, [mbOk], 0);
        ModalResult := 0;
        Exit;
    end;


    id_country := DataSet['ID_COUNTRY'];
    StoredProc.Transaction.StartTransaction;

    if version = 2 then
        StoredProc.ExecProcedure('PUB_SP_COUNTRY_DEL', [id_country]);

    if version = 1 then
        StoredProc.ExecProcedure('PROC_SP_COUNTRY_DEL', [id_country]);

    StoredProc.Transaction.Commit;

    selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
    SelectAll;
    cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

//Refresh dbgrid

procedure TFsp_country.RefreshButtonClick(Sender: TObject);
var
    selected_id: integer;
begin
    if DataSet.RecordCount = 0 then
    begin
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
    if FormStyle = fsMDIChild then
        Close
    else
        ModalResult := mrCancel;
end;

//Select record

procedure TFsp_country.SelButtonClick(Sender: TObject);
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

procedure TFsp_country.LocateRecord(const id: integer);
begin
    DataSet.Locate('ID_COUNTRY', id, []);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////

procedure TFsp_country.CheckButtonsState;
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

procedure TFsp_country.FormShow(Sender: TObject);
begin
    AddButton.Glyph.LoadFromResourceName(HInstance, 'add');
    ModButton.Glyph.LoadFromResourceName(HInstance, 'edit');
    DelButton.Glyph.LoadFromResourceName(HInstance, 'delete');
    RefreshButton.Glyph.LoadFromResourceName(HInstance, 'refresh');
    SelButton.Glyph.LoadFromResourceName(HInstance, 'select');
    ExitButton.Glyph.LoadFromResourceName(HInstance, 'exit');
    cxGrid1.SetFocus;
end;

procedure TFsp_country.DBGridDblClick(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
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
    if ModButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_country.Action_RefreshExecute(Sender: TObject);
begin
    RefreshButtonClick(Self);
end;

procedure TFsp_country.Action_SelExecute(Sender: TObject);
begin
    if SelButton.Enabled then SelButtonClick(Self);
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

procedure TFsp_country.SearchEditPropertiesChange(Sender: TObject);
begin
    DataSet.Locate('NAME_COUNTRY', SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFsp_country.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFsp_country.cxGrid1DBTableView1KeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        if SelButton.Enabled then SelButtonClick(Self);
    if Key = #27 then Close;
end;

procedure TFsp_country.ServersBoxCloseUp(Sender: TObject);
begin
    RefreshButtonClick(Self)
end;

end.

