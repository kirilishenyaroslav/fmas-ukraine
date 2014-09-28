unit uPochasTarifPerc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpravControl, uCommonSp, FIBDatabase, pFIBDatabase, Ibase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxClasses, dxBar, dxBarExtItems, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, ComCtrls, RxMemDS;

type
  TfrmPochasPerc = class(TForm)
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
    dxBarLargeButton1: TdxBarLargeButton;
    cxGrid1DBTableView1ID_POCHAS_PERC: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TARIF_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1PERCENT: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
    cxGrid1DBTableView1TARIF_TYPE_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_CONCAT: TcxGridDBColumn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    Output : TrxMemoryData;
    constructor Create(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; outp : TRxMemoryData); reintroduce;
    procedure SelectAll;
  end;

  TUP_PochasTarifType = class(TSprav)
  public
    frm : TfrmPochasPerc;
    constructor Create;
    procedure Show; override;
  end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses uPochasTarifPercAdd, uFControl, UpKernelUnit;

{$R *.dfm}

function CreateSprav: TSprav;
begin
  Result := TUP_PochasTarifType.Create;
end;

constructor TUP_PochasTarifType.Create;
begin
  inherited Create;
  Input.FieldDefs.Add('FormStyle', ftInteger);
  Output.FieldDefs.Add('ID_POCHAS_PERC', ftInteger);
  Output.FieldDefs.Add('TARIF_TYPE_NAME', ftString, 4096);
  Output.FieldDefs.Add('ID_TARIF_TYPE', ftInteger);
  Output.FieldDefs.Add('PERCENT', ftFloat);
  Output.FieldDefs.Add('DATE_BEG', ftDate);
  Output.FieldDefs.Add('DATE_END', ftDate);
  PrepareMemoryDatasets;
end;

procedure TUP_PochasTarifType.Show;
begin
  frm := TfrmPochasPerc.Create(Application.MainForm, TISC_DB_HANDLE(integer(Input['DBHandle'])), Output);
  if not VarIsNull(Input['FormStyle']) then frm.FormStyle := Input['FormStyle'];
  if frm.FormStyle = fsNormal then
  begin
    frm.btnSelect.Visible := ivAlways;
    frm.ShowModal;
    frm.Free;
  end;  
end;

{ TfrmPochasPerc }

constructor TfrmPochasPerc.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; outp : TRxMemoryData);
begin
  inherited Create(AOwner);
  Output := outp;
  Database.Handle := DBHandle;
end;
  
procedure TfrmPochasPerc.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPochasPerc.btnAddClick(Sender: TObject);
var
 frm : TfrmPochasPercAdd;
 id : integer;
begin
 frm := TfrmPochasPercAdd.Create(Self);
 frm.Caption := 'Додати - ' + frm.Caption;
 if frm.ShowModal = mrOk then
 begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'UP_SP_POCHAS_TARIF_PERC_I';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_TARIF_TYPE').Value := frm.TarifTypeEdit.Value;
   StoredProc.ParamByName('PERCENT').Value := frm.PercentEdit.Value;
   StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBegEdit.Value;
   StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Value;
   try
     StoredProc.ExecProc;
   except
     StoredProc.Transaction.Rollback;
     frm.Free;
     exit;
   end;
   id := StoredProc['ID_POCHAS_PERC'].AsInteger;
   StoredProc.Transaction.Commit;
   SelectAll;
   DataSet.Locate('ID_POCHAS_PERC', id, []);
 end;
 frm.Free;
end;

procedure TfrmPochasPerc.SelectAll;
begin
  DataSet.CloseOpen(false);
end;

procedure TfrmPochasPerc.btnEditClick(Sender: TObject);
var
 frm : TfrmPochasPercAdd;
 id  : int64;
begin
  if DataSet.RecordCount = 0 then exit;
  id := Dataset['ID_POCHAS_PERC'];
  frm := TfrmPochasPercAdd.Create(Self);
  frm.Caption := 'Змінити - ' + frm.Caption;
  frm.TarifTypeEdit.Value := DataSet['ID_TARIF_TYPE'];
  frm.TarifTypeEdit.DisplayText := DataSet['TARIF_TYPE_NAME'];
  frm.DateBegEdit.Value := DataSet['DATE_BEG'];
  frm.DateEndEdit.Value := DataSet['DATE_END'];
  frm.PercentEdit.Value := DataSet['PERCENT'];              
  if frm.ShowModal = mrOk then
  begin
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_SP_POCHAS_TARIF_PERC_U';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_POCHAS_PERC').AsInt64 := id;
    StoredProc.ParamByName('ID_TARIF_TYPE').Value := frm.TarifTypeEdit.Value;
    StoredProc.ParamByName('PERCENT').Value := frm.PercentEdit.Value;
    StoredProc.ParamByName('DATE_BEG').AsDate := frm.DateBegEdit.Value;
    StoredProc.ParamByName('DATE_END').AsDate := frm.DateEndEdit.Value;
    try
      StoredProc.ExecProc;
    except
      StoredProc.Transaction.Rollback;
      frm.Free;
      exit;
    end;
    StoredProc.Transaction.Commit;
    SelectAll;
    DataSet.Locate('ID_POCHAS_PERC', id, []);
  end;
  frm.Free;
end;

procedure TfrmPochasPerc.btnDeleteClick(Sender: TObject);
begin
  if DataSet.RecordCount = 0 then exit;
  if messagedlg('Ви бажаєте видалити процент?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'UP_SP_POCHAS_TARIF_PERC_D';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_POCHAS_PERC').AsInteger := DataSet['ID_POCHAS_PERC'];
  try
    StoredProc.ExecProc;
  except
    StoredProc.Transaction.Rollback;
    exit;
  end;
  StoredProc.Transaction.Commit;
  DataSet.CacheDelete;
end;

procedure TfrmPochasPerc.btnSelectClick(Sender: TObject);
begin
  if DataSet.RecordCount = 0 then exit;
  if btnSelect.Visible = ivNever then exit;
  Output.Open;
  Output.Append;
  Output['ID_POCHAS_PERC'] := DataSet['ID_POCHAS_PERC'];
  Output['ID_TARIF_TYPE'] := DataSet['ID_TARIF_TYPE'];
  Output['TARIF_TYPE_NAME'] := DataSet['TARIF_TYPE_NAME'];
  Output['PERCENT'] := DataSet['PERCENT'];
  Output['DATE_BEG'] := DataSet['DATE_BEG'];
  Output['DATE_END'] := DataSet['DATE_END'];
  Output.Post;
  ModalResult := mrOk;
end;

procedure TfrmPochasPerc.FormShow(Sender: TObject);
begin
  SelectAll;
end;

procedure TfrmPochasPerc.dxBarLargeButton1Click(Sender: TObject);
var
 id : int64;
begin
  id := -1;
  if DataSet.RecordCount <> 0 then id := DataSet['ID_POCHAS_PERC'];
  SelectAll;
  if id <> -1 then DataSet.Locate('ID_POCHAS_PERC', id, []);
end;

procedure TfrmPochasPerc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfrmPochasPerc.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_insert then btnAddClick(Self);
 if key = VK_DELETE then btnDeleteClick(Self);
 if key = VK_F2 then btnEditClick(Self);
 if Key = VK_RETURN then btnSelectClick(Self);
 if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(DataSet);
end;

end.
