unit uPochasTarif;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uSpravControl, uCommonSp, FIBDatabase, pFIBDatabase, Ibase,
    cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
    cxEdit, DB, cxDBData, cxGridLevel, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    ExtCtrls, cxClasses, dxBar, dxBarExtItems, FIBDataSet, pFIBDataSet,
    FIBQuery, pFIBQuery, pFIBStoredProc, ComCtrls, RxMemDS, cxContainer,
    cxCheckBox, uFControl, uLabeledFControl, uDateControl, StdCtrls,
    cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
    TfrmPochasTarif = class(TForm)
        Database: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        dxBarManager1: TdxBarManager;
        btnAdd: TdxBarLargeButton;
        btnEdit: TdxBarLargeButton;
        btnDelete: TdxBarLargeButton;
        btnView: TdxBarLargeButton;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        cxGrid1: TcxGrid;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        btnClose: TdxBarLargeButton;
        btnSelect: TdxBarLargeButton;
        DataSet: TpFIBDataSet;
        DataSource1: TDataSource;
        StoredProc: TpFIBStoredProc;
        StatusBar1: TStatusBar;
        btnRefresh: TdxBarLargeButton;
        cxGrid1DBTableView1ID_POCHAS_PERC: TcxGridDBColumn;
        cxGrid1DBTableView1ID_TARIF_TYPE: TcxGridDBColumn;
        cxGrid1DBTableView1TARIF: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
        cxGrid1DBTableView1TARIF_TYPE_NAME: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_CONCAT: TcxGridDBColumn;
        dxBarControlContainerItem1: TdxBarControlContainerItem;
        Panel1: TPanel;
        cbFilter: TcxCheckBox;
        DateFilter: TcxDateEdit;
        Label1: TLabel;
        DataSetID_POCHAS_TARIF: TFIBBCDField;
        DataSetID_TARIF_TYPE: TFIBBCDField;
        DataSetTARIF: TFIBBCDField;
        DataSetDATE_BEG: TFIBDateField;
        DataSetDATE_END: TFIBDateField;
        DataSetTARIF_TYPE_NAME: TFIBStringField;
        DataSetDATE_CONCAT: TFIBStringField;
        DataSetKOD_SM: TFIBBCDField;
    btnPrintPochasTarif: TdxBarLargeButton;
        procedure btnCloseClick(Sender: TObject);
        procedure btnAddClick(Sender: TObject);
        procedure btnEditClick(Sender: TObject);
        procedure btnDeleteClick(Sender: TObject);
        procedure btnSelectClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure btnRefreshClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure cbFilterClick(Sender: TObject);
        procedure DateFilterChange(Sender: TObject);
        procedure DateFilterExit(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure DataSetDATE_CONCATGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    procedure btnPrintPochasTarifClick(Sender: TObject);
    private
    public
        Output: TrxMemoryData;
        constructor Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; outp: TRxMemoryData); reintroduce;
        procedure SelectAll;
    end;

    TUP_PochasTarifType = class(TSprav)
    public
        frm: TfrmPochasTarif;
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation
uses uPochasTarifAdd, BaseTypes, uPochasPrint, upkernelunit;

{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TUP_PochasTarifType.Create;
end;

constructor TUP_PochasTarifType.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('FormStyle', ftInteger);
    Input.FieldDefs.Add('DateFlt', ftDate);
    Output.FieldDefs.Add('ID_POCHAS_TARIF', ftInteger);
    Output.FieldDefs.Add('TARIF_TYPE_NAME', ftString, 4096);
    Output.FieldDefs.Add('ID_TARIF_TYPE', ftInteger);
    Output.FieldDefs.Add('TARIF', ftFloat);
    Output.FieldDefs.Add('DATE_BEG', ftDate);
    Output.FieldDefs.Add('DATE_END', ftDate);
    Output.FieldDefs.Add('KOD_SM', ftInteger);
    PrepareMemoryDatasets;
end;

procedure TUP_PochasTarifType.Show;
begin
    frm := TfrmPochasTarif.Create(Application.MainForm, TISC_DB_HANDLE(integer(Input['DBHandle'])), Output);
    Input.Edit;
    if VarIsNull(Input['DateFlt']) then
        Input['DateFlt'] := Date;
    Input.Post;
    frm.DateFilter.Date := input['DateFlt'];
    if not VarIsNull(Input['FormStyle']) then frm.FormStyle := Input['FormStyle'];
    if frm.FormStyle = fsNormal then
    begin
        frm.btnSelect.Visible := ivAlways;
        frm.ShowModal;
        frm.Free;
    end;
end;

{ TfrmPochasTarif }

constructor TfrmPochasTarif.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; outp: TRxMemoryData);
begin
    inherited Create(AOwner);
    Output := outp;
    Database.Handle := DBHandle;
end;

procedure TfrmPochasTarif.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPochasTarif.btnAddClick(Sender: TObject);
var
    frm: TfrmPochasTarifAdd;
    id: integer;
begin
    frm := TfrmPochasTarifAdd.Create(Self);
    frm.Caption := 'Додати - ' + frm.Caption;
    if frm.ShowModal = mrOk then
    begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_SP_POCHAS_TARIF_I';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_TARIF_TYPE').Value := frm.TarifTypeEdit.Value;
        StoredProc.ParamByName('TARIF').Value := frm.PercentEdit.Value;
        StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBegEdit.Value;
        StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Value;
        StoredProc.ParamByName('KOD_SM').Value := null;
        try
            StoredProc.ExecProc;
        except on e: Exception do
            begin
                agShowMessage('Увага виникла помилка: ' + E.Message);
                StoredProc.Transaction.Rollback;
                frm.Free;
                exit;
            end;
        end;
        id := StoredProc['ID_POCHAS_TARIF'].AsInteger;
        StoredProc.Transaction.Commit;
        SelectAll;
        DataSet.Locate('ID_POCHAS_TARIF', id, []);
    end;
    frm.Free;
end;

procedure TfrmPochasTarif.SelectAll;
begin
    DataSet.Close;
    if cbFilter.Checked then
        DataSet.ParamByName('DATE_FILTER').AsDateTime := DateFilter.Date
    else
        DataSet.ParamByName('DATE_FILTER').AsVariant := Null;
    DataSet.Open;
    cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
    cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TfrmPochasTarif.btnEditClick(Sender: TObject);
var
    frm: TfrmPochasTarifAdd;
    id: int64;
begin
    if DataSet.RecordCount = 0 then exit;
    id := Dataset['ID_POCHAS_TARIF'];
    frm := TfrmPochasTarifAdd.Create(Self);
    frm.Caption := 'Змінити - ' + frm.Caption;
    frm.TarifTypeEdit.Value := DataSet['ID_TARIF_TYPE'];
    frm.TarifTypeEdit.DisplayText := DataSet['TARIF_TYPE_NAME'];
    frm.DateBegEdit.Value := DataSet['DATE_BEG'];
    frm.DateEndEdit.Value := DataSet['DATE_END'];
    frm.PercentEdit.Value := DataSet['TARIF'];
    if frm.ShowModal = mrOk then
    begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_SP_POCHAS_TARIF_U';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_POCHAS_TARIF').AsInt64 := id;
        StoredProc.ParamByName('ID_TARIF_TYPE').Value := frm.TarifTypeEdit.Value;
        StoredProc.ParamByName('TARIF').Value := frm.PercentEdit.Value;
        StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBegEdit.Value;
        StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Value;
        StoredProc.ParamByName('KOD_SM').Value := Null;
        try
            StoredProc.ExecProc;
        except on e: Exception do
            begin
                agShowMessage('Увага виникла помилка: ' + E.Message);
                StoredProc.Transaction.Rollback;
                frm.Free;
                exit;
            end;
        end;
        StoredProc.Transaction.Commit;
        SelectAll;
        DataSet.Locate('ID_POCHAS_TARIF', id, []);
    end;
    frm.Free;
end;

procedure TfrmPochasTarif.btnDeleteClick(Sender: TObject);
begin
    if DataSet.RecordCount = 0 then exit;
    if (agMessageDlg('Увага!', 'Ви бажаєте видалити тариф?', mtConfirmation, [mbYes, mbNo]) <> mrYes) then exit;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_SP_POCHAS_TARIF_D';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_POCHAS_TARIF').AsInteger := DataSet['ID_POCHAS_TARIF'];
    try
        StoredProc.ExecProc;
    except on e: Exception do
        begin
            agShowMessage('Увага виникла помилка: ' + E.Message);
            StoredProc.Transaction.Rollback;
            exit;
        end;
    end;
    StoredProc.Transaction.Commit;
    DataSet.CacheDelete;
end;

procedure TfrmPochasTarif.btnSelectClick(Sender: TObject);
begin
    if DataSet.RecordCount = 0 then exit;
    if btnSelect.Visible = ivNever then exit;
    Output.Open;
    Output.Append;
    Output['ID_POCHAS_TARIF'] := DataSet['ID_POCHAS_TARIF'];
    Output['ID_TARIF_TYPE'] := DataSet['ID_TARIF_TYPE'];
    Output['TARIF_TYPE_NAME'] := DataSet['TARIF_TYPE_NAME'];
    Output['TARIF'] := DataSet['TARIF'];
    Output['DATE_BEG'] := DataSet['DATE_BEG'];
    Output['DATE_END'] := DataSet['DATE_END'];
    Output['KOD_SM'] := DataSet['KOD_SM'];
    Output.Post;
    ModalResult := mrOk;
end;

procedure TfrmPochasTarif.FormShow(Sender: TObject);
begin
    SelectAll;
end;

procedure TfrmPochasTarif.btnRefreshClick(Sender: TObject);
var
    id: int64;
begin
    id := -1;
    if DataSet.RecordCount <> 0 then id := DataSet['ID_POCHAS_TARIF'];
    SelectAll;
    if id <> -1 then DataSet.Locate('ID_POCHAS_TARIF', id, []);
end;

procedure TfrmPochasTarif.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfrmPochasTarif.cbFilterClick(Sender: TObject);
begin
    btnRefreshClick(Self);
end;

procedure TfrmPochasTarif.DateFilterChange(Sender: TObject);
begin
    btnRefreshClick(Self);
end;

procedure TfrmPochasTarif.DateFilterExit(Sender: TObject);
begin
    btnRefreshClick(Self);
end;

procedure TfrmPochasTarif.FormCreate(Sender: TObject);
begin
    DateFilter.Date := now;
end;

procedure TfrmPochasTarif.DataSetDATE_CONCATGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    Text := DateToStr(DataSet['DATE_BEG']) + ' - ' + DateToStr(DataSet['DATE_END']);
end;

procedure TfrmPochasTarif.cxGrid1DBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if key = VK_insert then btnAddClick(Self);
    if key = VK_DELETE then btnDeleteClick(Self);
    if key = VK_F2 then btnEditClick(Self);
    if key = VK_return then btnSelectClick(Self);
    if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(DataSet);
end;



procedure TfrmPochasTarif.btnPrintPochasTarifClick(Sender: TObject);
var frm:TfrmPochasTarifPrint;
begin
   frm:=TfrmPochasTarifPrint.Create(Self);
   frm.ShowModal;
   frm.Free;
end;

end.

