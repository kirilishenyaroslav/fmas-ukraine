unit UpComandOrderSpCity;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, dxBar, dxBarExtItems, cxGridLevel,
    cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, ImgList, cxClasses, ActnList, ExtCtrls,
    FIBDataSet, pFIBDataSet, cxTextEdit, cxContainer, cxLabel, StdCtrls,
    FIBQuery, pFIBQuery, pFIBStoredProc, BaseTypes,
    FIBDatabase, pFIBDatabase, UpKernelUnit, iBase, UpComandOrderCityAdd;

type
    TFormComandSpCity = class(TForm)
        PanelBar: TPanel;
        dxBarDockControl1: TdxBarDockControl;
        dxBarManager: TdxBarManager;
        ActionList: TActionList;
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
        IL_OrdAcc: TImageList;
        GridCityDBTableView: TcxGridDBTableView;
        GridCityLevel: TcxGridLevel;
        GridCity: TcxGrid;
        AddBtn: TdxBarLargeButton;
        Add: TAction;
        Modify: TAction;
        Refresh: TAction;
        Delete: TAction;
        Exit: TAction;
        ModifyBtn: TdxBarLargeButton;
        RefreshBtn: TdxBarLargeButton;
        DeleteBtn: TdxBarLargeButton;
        ExitBtn: TdxBarLargeButton;
        PanelSearch: TPanel;
        SearchEdit: TcxTextEdit;
        lblSearch: TcxLabel;
        DSSity: TDataSource;
        DSetCity: TpFIBDataSet;
        colIdCity: TcxGridDBColumn;
        colNameCity: TcxGridDBColumn;
        StorProc: TpFIBStoredProc;
        Tr: TpFIBTransaction;
        SelectBtn: TdxBarLargeButton;
        Select: TAction;
        procedure AddExecute(Sender: TObject);
        procedure ModifyExecute(Sender: TObject);
        procedure RefreshExecute(Sender: TObject);
        procedure DeleteExecute(Sender: TObject);
        procedure ExitExecute(Sender: TObject);
        procedure SelectExecute(Sender: TObject);
        procedure GridCityDBTableViewDblClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure SearchEditPropertiesChange(Sender: TObject);
        procedure GridCityDBTableViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        { Private declarations }
        procedure DSetCityCloseOpen;
        function DSetCityIU(Id: Integer; Name: string): Integer;
    public
        DBHandle: TISC_DB_HANDLE;
        { Public declarations }
    end;

var
    FormComandSpCity: TFormComandSpCity;

implementation

{$R *.dfm}

procedure TFormComandSpCity.DSetCityCloseOpen;
begin
    DSetCity.Close;
    DSetCity.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_CITY ORDER BY NAME_CITY COLLATE WIN1251_UA';
    DSetCity.Open;
end;

function TFormComandSpCity.DSetCityIU(Id: Integer; Name: string): Integer;
begin
    try
        StorProc.Close;
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'UP_DT_COMAND_CITY_IU';
        StorProc.Prepare;
        StorProc.ParamByName('IN_ID_COMAND_CITY').AsInteger := Id;
        StorProc.ParamByName('NAME_CITY').AsString := Name;
        StorProc.ExecProc;
        DSetCityIU := StorProc.FN('ID_COMAND_CITY').AsInteger;
        StorProc.Transaction.Commit;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            StorProc.Transaction.Rollback;
            Result := -1;
        end;
    end;
end;


procedure TFormComandSpCity.AddExecute(Sender: TObject);
var
    frmAdd: TFormCityAdd;
    id: Integer;
begin
    frmAdd := TFormCityAdd.Create(Self);
    if (frmAdd.ShowModal = mrOK) then
    begin
        Id := DSetCityIU(-1, frmAdd.NameTE.EditingText);
        DSetCityCloseOpen;
        DSetCity.Locate('ID_COMAND_CITY', Id, []);
    end;
    frmAdd.Free;
end;



procedure TFormComandSpCity.ModifyExecute(Sender: TObject);
var
    frmAdd: TFormCityAdd;
    Id: Integer;
begin
    Id := DSetCity.FieldByName('ID_COMAND_CITY').AsInteger;
    frmAdd := TFormCityAdd.Create(Self);
    frmAdd.NameTE.Text := DSetCity.FieldByName('NAME_CITY').AsString;
    if frmAdd.ShowModal = mrOk then
    begin
        Id := DSetCityIU(Id, frmAdd.NameTE.EditingText);
        DSetCityCloseOpen;
        DSetCity.Locate('ID_COMAND_CITY', Id, []);
    end;
    frmAdd.Free;
end;

procedure TFormComandSpCity.RefreshExecute(Sender: TObject);
var
    Id: Integer;
begin
    Id := DSetCity.FieldByName('ID_COMAND_CITY').AsInteger;
    DSetCityCloseOpen;
    DSetCity.Locate('ID_COMAND_CITY', Id, []);
end;

procedure TFormComandSpCity.DeleteExecute(Sender: TObject);
var
    Id: Integer;
    NextId: Integer;
begin
    if (DSetCity.RecordCount > 0)
        then
    begin
        Id := DSetCity.FieldByName('ID_COMAND_CITY').AsInteger;
        DSetCity.Next;
        if not DSetCity.Eof then
        begin
            NextId := DSetCity.FieldByName('ID_COMAND_CITY').AsInteger;
            DSetCity.Prior;
        end
        else
            NextId := -1;

        if agMessageDlg('Увага!', 'Ви бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
        begin
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'UP_DT_COMAND_CITY_DEL';
            StorProc.Prepare;
            StorProc.ParamByName('ID_COMAND_CITY').AsInteger := Id;
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
            DSetCityCloseOpen;
            if NextId = -1 then
                DSetCity.Last
            else
                DSetCity.Locate('ID_COMAND_CITY', NextId, []);
        end;
    end;
end;

procedure TFormComandSpCity.ExitExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

procedure TFormComandSpCity.SelectExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFormComandSpCity.GridCityDBTableViewDblClick(Sender: TObject);
begin
    SelectExecute(Self);
end;

procedure TFormComandSpCity.FormCreate(Sender: TObject);
begin
    DSetCityCloseOpen;
end;

procedure TFormComandSpCity.SearchEditPropertiesChange(Sender: TObject);
var
    sFilter: string;
begin
    if ((SearchEdit.Text = '') or VarIsNull(SearchEdit.Text)) then
    begin
        GridCityDBTableView.DataController.DataSet.Filtered := False;
    end
    else
    begin
        try
            GridCityDBTableView.DataController.DataSet.Filtered := False;
            sFilter := 'UPPER(' + AnsiUpperCase('NAME_CITY') + ') LIKE ''' +
                '%' + AnsiUpperCase(SearchEdit.Text) + '%'' AND ' +
                'NAME_CITY IS NOT NULL';
            GridCityDBTableView.DataController.DataSet.Filter := sFilter;
            GridCityDBTableView.DataController.DataSet.Filtered := True;
            GridCityDBTableView.DataController.SelectRows(0, 0);
        except
            on E: Exception do
                ShowMessage(E.Message);
        end;
    end;
end;

procedure TFormComandSpCity.GridCityDBTableViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift)) then
        ShowInfo(DSetCity);
end;

end.
