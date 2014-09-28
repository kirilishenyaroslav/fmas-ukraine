unit UpComandOrderSpOrg;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, dxBar, dxBarExtItems, FIBDatabase,
    pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, ImgList,
    cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet,
    pFIBDataSet, ExtCtrls, iBase, BaseTypes,
    UpComandOrderAddOrg, UpKernelUnit, cxTextEdit, cxContainer, cxLabel,
    StdCtrls;

type
    TFormComandSpOrg = class(TForm)
        BarPanel: TPanel;
        DSetOrg: TpFIBDataSet;
        GridOrgDBTableView: TcxGridDBTableView;
        GridOrgLevel: TcxGridLevel;
        GridOrg: TcxGrid;
        IL_OrdAcc: TImageList;
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        ActionList: TActionList;
        Add: TAction;
        Modify: TAction;
        Refresh: TAction;
        Delete: TAction;
        Exit: TAction;
        Select: TAction;
        StorProc: TpFIBStoredProc;
        WTransaction: TpFIBTransaction;
        DSource: TDataSource;
        dxBarManager1: TdxBarManager;
        dxBarDockControl1: TdxBarDockControl;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBarLargeButton2: TdxBarLargeButton;
        dxBarLargeButton3: TdxBarLargeButton;
        dxBarLargeButton4: TdxBarLargeButton;
        dxBarLargeButton5: TdxBarLargeButton;
        dxBarLargeButton6: TdxBarLargeButton;
        colId_Comand_Org: TcxGridDBColumn;
        colName_Org: TcxGridDBColumn;
        colName_City: TcxGridDBColumn;
        colId_Comand_City: TcxGridDBColumn;
        PanelSearch: TPanel;
        chPanelGroup: TCheckBox;
        lblLocFilter: TcxLabel;
        chLocFilter: TCheckBox;
        SearchEdit: TcxTextEdit;
        lblSearch: TcxLabel;
        lblPanelGroup: TcxLabel;
        procedure ExitExecute(Sender: TObject);
        procedure SelectExecute(Sender: TObject);
        procedure DeleteExecute(Sender: TObject);
        procedure RefreshExecute(Sender: TObject);
        procedure ModifyExecute(Sender: TObject);
        procedure AddExecute(Sender: TObject);
        procedure GridOrgDBTableViewDblClick(Sender: TObject);
        procedure GridOrgDBTableViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SearchEditPropertiesChange(Sender: TObject);
        procedure chLocFilterClick(Sender: TObject);
        procedure chPanelGroupClick(Sender: TObject);
    private
        { Private declarations }
        procedure DSetOrgCloseOpen;
        function DSetOrgIU(Id: Integer; Name: string; aId_City: Integer): Integer;
    public
        { Public declarations }
        Id_City: Integer;
        Name_City: string;
        DBHandle: TISC_DB_HANDLE;
        constructor Create(aOwner: TComponent; aId_City: Integer; aName_City: string; aHandle: TISC_DB_HANDLE); reintroduce;
    end;

var
    FormComandSpOrg: TFormComandSpOrg;

implementation

{$R *.dfm}

procedure TFormComandSpOrg.DSetOrgCloseOpen;
var
    Where_Str: string;
begin

    if Id_City = -1 then
        Where_Str := ' '
    else
        Where_Str := ' WHERE ID_COMAND_CITY = ' + IntToStr(Id_City);
    DSetOrg.Close;
    DSetOrg.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_ORG_SELECT ' +
        Where_str + ' ORDER BY NAME_ORG COLLATE WIN1251_UA';

    DSetOrg.Open;

end;

function TFormComandSpOrg.DSetOrgIU(Id: Integer; Name: string; aId_City: Integer): Integer;
begin
    try
        StorProc.Close;
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'UP_DT_COMAND_ORG_IU';
        StorProc.Prepare;
        StorProc.ParamByName('IN_ID_COMAND_ORG').AsInteger := Id;
        StorProc.ParamByName('NAME_ORG').AsString := Name;
        StorProc.ParamByName('ID_COMAND_CITY').AsInteger := aId_City;
        StorProc.ExecProc;
        DSetOrgIU := StorProc.FN('ID_COMAND_ORG').AsInteger;
        StorProc.Transaction.Commit;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            StorProc.Transaction.Rollback;
            Result := -1;
        end;
    end;
end;

constructor TFormComandSpOrg.Create(aOwner: TComponent; aId_City: Integer; aName_City: string; aHandle: TISC_DB_HANDLE);
begin

    inherited Create(aOwner);
    Id_City := aId_City;
    Name_City := aName_City;
    DBHandle := aHandle;
    DSetOrg.Database.Handle := DBHandle;
    try

        DSetOrgCloseOpen;
    except on E: Exception do
            Showmessage(E.Message);
    end;
end;

procedure TFormComandSpOrg.ExitExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

procedure TFormComandSpOrg.SelectExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFormComandSpOrg.DeleteExecute(Sender: TObject);
var
    Id: Integer;
    NextId: Integer;
begin
    if (DSetOrg.RecordCount > 0)
        then
    begin
        Id := DSetOrg.FieldByName('ID_COMAND_ORG').AsInteger;
        DSetOrg.Next;
        if not DSetOrg.Eof then
        begin
            NextId := DSetOrg.FieldByName('ID_COMAND_ORG').AsInteger;
            DSetOrg.Prior;
        end
        else
            NextId := -1;

        if agMessageDlg('Увага!', 'Ви бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
        begin
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'UP_DT_COMAND_ORG_DEL';
            StorProc.Prepare;
            StorProc.ParamByName('ID_COMAND_ORG').AsInteger := Id;
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
            DSetOrgCloseOpen;
            if NextId = -1 then
                DSetOrg.Last
            else
                DSetOrg.Locate('ID_COMAND_ORG', NextId, []);
        end;
    end;
end;

procedure TFormComandSpOrg.RefreshExecute(Sender: TObject);
var
    Id: Integer;
begin
    Id := DSetOrg.FieldByName('ID_COMAND_ORG').AsInteger;
    DSetOrgCloseOpen;
    DSetOrg.Locate('ID_COMAND_ORG', Id, []);
end;

procedure TFormComandSpOrg.ModifyExecute(Sender: TObject);
var
    frmAdd: TFormAddOrg;
    Id: Integer;
begin
    Id := DSetOrg.FieldByName('ID_COMAND_ORG').AsInteger;
    frmAdd := TFormAddOrg.Create(Self);
    frmAdd.NameTE.Text := DSetOrg.FieldByName('NAME_ORG').AsString;
    frmAdd.Id_City := DSetOrg.FieldByName('ID_COMAND_CITY').AsInteger;
    frmAdd.CityBE.EditValue := DSetOrg.FieldByName('NAME_CITY').AsString;

    if frmAdd.ShowModal = mrOk then
    begin
        Id := DSetOrgIU(Id, frmAdd.NameTE.EditingText, frmAdd.Id_City);
        DSetOrgCloseOpen;
        DSetOrg.Locate('ID_COMAND_ORG', Id, []);
    end;
    frmAdd.Free;
end;

procedure TFormComandSpOrg.AddExecute(Sender: TObject);
var
    frmAdd: TFormAddOrg;
    id: Integer;
begin
    frmAdd := TFormAddOrg.Create(Self);
    frmAdd.Id_City := Id_City;
    frmAdd.CityBE.EditValue := Name_City;
    frmAdd.DBHandle := DBHandle;
    // frmAdd.CityBE.EditValue := DSetOrg.FieldByName('NAME_CITY').AsString;
    if (frmAdd.ShowModal = mrOK) then
    begin
        Id := DSetOrgIU(-1, frmAdd.NameTE.EditingText, frmAdd.Id_City);
        DSetOrgCloseOpen;
        DSetOrg.Locate('ID_COMAND_ORG', Id, []);
    end;
    frmAdd.Free;
end;

procedure TFormComandSpOrg.GridOrgDBTableViewDblClick(Sender: TObject);
begin
    SelectExecute(Self);
end;

procedure TFormComandSpOrg.GridOrgDBTableViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift)) then
        ShowInfo(DSetOrg);
end;

procedure TFormComandSpOrg.SearchEditPropertiesChange(Sender: TObject);
var
    sFilter: string;
begin
    if ((SearchEdit.Text = '') or VarIsNull(SearchEdit.Text)) then
    begin
        GridOrgDBTableView.DataController.DataSet.Filtered := False;
    end
    else
    begin
        try
            GridOrgDBTableView.DataController.DataSet.Filtered := False;
            sFilter := 'UPPER(' + AnsiUpperCase('NAME_ORG') + ') LIKE ''' +
                '%' + AnsiUpperCase(SearchEdit.Text) + '%'' AND ' +
                'NAME_ORG IS NOT NULL';
            GridOrgDBTableView.DataController.DataSet.Filter := sFilter;
            GridOrgDBTableView.DataController.DataSet.Filtered := True;
            GridOrgDBTableView.DataController.SelectRows(0, 0);
        except
            on E: Exception do
                ShowMessage(E.Message);
        end;
    end;

end;

procedure TFormComandSpOrg.chLocFilterClick(Sender: TObject);
var
    i: Integer;
begin
    for i := 0 to GridOrgDBTableView.ColumnCount - 1 do
        GridOrgDBTableView.Columns[i].Options.Filtering := chLocFilter.Checked;

end;

procedure TFormComandSpOrg.chPanelGroupClick(Sender: TObject);
begin
    GridOrgDBTableView.OptionsView.GroupByBox := chPanelGroup.Checked;
end;

end.
