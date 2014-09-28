unit uPochasType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpravControl, uCommonSp, FIBDatabase, pFIBDatabase, Ibase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxClasses, dxBar, dxBarExtItems, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, ComCtrls, RxMemDS, cxCheckBox,
  cxTextEdit, cxLabel;

type
  TfrmPochasType = class(TForm)
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
    cxGrid1DBTableView1ID_POCHAS_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1POCHAS_TYPE_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1ZAV_KAF: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
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
    frm : TfrmPochasType;
    constructor Create;
    procedure Show; override;
  end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

var
    PriznakList_Text:array[1..2] of string=('Погодинна робота у ВНЗ', 'Викладацька робота у закладах освіти');

implementation
uses uPochasTypeAdd, uFControl,upkernelunit;

{$R *.dfm}

function CreateSprav: TSprav;
begin
  Result := TUP_PochasTarifType.Create;
end;

constructor TUP_PochasTarifType.Create;
begin
  inherited Create;
  Input.FieldDefs.Add('FormStyle', ftInteger);
  Output.FieldDefs.Add('ID_POCHAS_TYPE', ftInteger);
  Output.FieldDefs.Add('POCHAS_TYPE_NAME', ftString, 4096);
  Output.FieldDefs.Add('ZAV_KAF', ftInteger);
  Output.FieldDefs.Add('PRIZNAK_POCHAS_TYPE', ftInteger);
  PrepareMemoryDatasets;
end;

procedure TUP_PochasTarifType.Show;
begin
  frm := TfrmPochasType.Create(Application.MainForm, TISC_DB_HANDLE(integer(Input['DBHandle'])), Output);
  if not VarIsNull(Input['FormStyle']) then frm.FormStyle := Input['FormStyle'];
  if frm.FormStyle = fsNormal then
  begin
    frm.btnSelect.Visible := ivAlways;
    frm.ShowModal;
    frm.Free;
  end;  
end;

{ TfrmPochasType }
constructor TfrmPochasType.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; outp : TRxMemoryData);
begin
  inherited Create(AOwner);
  Output := outp;
  Database.Handle := DBHandle;
end;
  
procedure TfrmPochasType.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPochasType.btnAddClick(Sender: TObject);
var
 frm : TfrmPochasTypeAdd;
 id : integer;
 zav_kaf: integer;
begin
 frm := TfrmPochasTypeAdd.Create(Self);
 frm.Caption := 'Додати - ' + frm.Caption;
 if frm.ShowModal = mrOk then
 begin
   if frm.ZavKaf.Checked then zav_kaf := 1
   else zav_kaf := 0;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'ASUP_INI_POCHAS_TYPE_I';
   StoredProc.Prepare;
   StoredProc.ParamByName('POCHAS_TYPE_NAME').Value := frm.NameEdit.Value;
   StoredProc.ParamByName('ZAV_KAF').Value := zav_kaf;
   StoredProc.ParamByName('PRIZNAK_POCHAS_TYPE').AsInteger := frm.CBPriznakType.ItemIndex;
   try
     StoredProc.ExecProc;
   except
     StoredProc.Transaction.Rollback;
     frm.Free;
     exit;
   end;
   id := StoredProc['ID_POCHAS_TYPE'].AsInteger;
   StoredProc.Transaction.Commit;
   SelectAll;
   DataSet.Locate('ID_POCHAS_TYPE', id, []);
 end;
 frm.Free;
end;

procedure TfrmPochasType.SelectAll;
begin
  DataSet.CloseOpen(false);
end;

procedure TfrmPochasType.btnEditClick(Sender: TObject);
var
 frm : TfrmPochasTypeAdd;
 id  : integer;
 zav_kaf : integer;
begin
  if (DataSet.RecordCount = 0) then exit;
  id := Dataset['ID_POCHAS_TYPE'];
  frm := TfrmPochasTypeAdd.Create(Self);
  frm.Caption := 'Змінити - ' + frm.Caption;
  frm.NameEdit.Value := DataSet['POCHAS_TYPE_NAME'];
  frm.ZavKaf.Checked := (DataSet['ZAV_KAF'] = 1);
  frm.CBPriznakType.ItemIndex := Dataset['PRIZNAK_POCHAS_TYPE'];
  if frm.ShowModal = mrOk then
  begin
    if frm.ZavKaf.Checked then zav_kaf := 1
    else zav_kaf := 0;

    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'ASUP_INI_POCHAS_TYPE_U';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_POCHAS_TYPE').AsInteger := id;
    StoredProc.ParamByName('POCHAS_TYPE_NAME').Value := frm.NameEdit.Value;
    StoredProc.ParamByName('ZAV_KAF').Value := zav_kaf;
    StoredProc.ParamByName('PRIZNAK_POCHAS_TYPE').AsInteger := frm.CBPriznakType.ItemIndex;
    try
      StoredProc.ExecProc;
    except
      StoredProc.Transaction.Rollback;
      frm.Free;
      exit;
    end;
    StoredProc.Transaction.Commit;
    SelectAll;
    DataSet.Locate('ID_POCHAS_TYPE', id, []);
  end;
  frm.Free;
end;

procedure TfrmPochasType.btnDeleteClick(Sender: TObject);
begin
  if DataSet.RecordCount = 0 then exit;
  if messagedlg('Ви бажаєте видалити тип?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'ASUP_INI_POCHAS_TYPE_D';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_POCHAS_TYPE').AsInteger := DataSet['ID_POCHAS_TYPE'];
  try
    StoredProc.ExecProc;
  except
    StoredProc.Transaction.Rollback;
    exit;
  end;
  StoredProc.Transaction.Commit;
  DataSet.CacheDelete;
end;

procedure TfrmPochasType.btnSelectClick(Sender: TObject);
begin
  if DataSet.RecordCount = 0 then exit;
  if btnSelect.Visible = ivNever then exit;
  Output.Open;
  Output.Append;
  Output['ID_POCHAS_TYPE'] := DataSet['ID_POCHAS_TYPE'];
  Output['POCHAS_TYPE_NAME'] := DataSet['POCHAS_TYPE_NAME'];
  Output['ZAV_KAF'] := DataSet['ZAV_KAF'];
  Output['PRIZNAK_POCHAS_TYPE'] := Dataset['PRIZNAK_POCHAS_TYPE'];
  Output.Post;
  ModalResult := mrOk;
end;

procedure TfrmPochasType.FormShow(Sender: TObject);
begin
  SelectAll;
end;

procedure TfrmPochasType.dxBarLargeButton1Click(Sender: TObject);
var
 id : integer;
begin
  id := -1;
  if DataSet.RecordCount <> 0 then id := DataSet['ID_POCHAS_TYPE'];
  SelectAll;
  if id <> -1 then DataSet.Locate('ID_POCHAS_TYPE', id, []);
end;

procedure TfrmPochasType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfrmPochasType.cxGrid1DBTableView1KeyDown(Sender: TObject;
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
