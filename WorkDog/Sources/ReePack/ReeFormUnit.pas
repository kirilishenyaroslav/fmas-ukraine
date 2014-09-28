{
 Справочник реестров
 Последняя правка:
 Герасименко Роман Вячеславович.
 6 февраля 2009 года
}
unit ReeFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, cxContainer, cxLabel, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxCalendar, cxCurrencyEdit, dxBar,
  dxBarExtItems, StdCtrls, ActnList, IBase, FIBDatabase, pFIBDatabase,
  cxTextEdit, cxMemo, cxFilterControl, cxDBFilterControl, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, LoadDogManedger, ImgList, cxTL, frxClass, frxDBSet,
  cxGroupBox, Halcn6db, Registry, DogLoaderUnit, FR_DSet, FR_Class, Grids,
  DBGrids, FR_PTabl, frxCross, dxStatusBar, frxDesgn, Accmgmt, AArray, ReeFilterUnit,FileCtrl,
  Menus;

//const
// export_file = 'D:\FPLAT.dbf';
resourcestring
  rs_FormRee_Question = 'Сформувати реєстр?';
type
  TreeForm = class(TForm)
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    WriteProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ViewButton: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    pFIBStoredProc1: TpFIBStoredProc;
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
    DisabledLargeImages: TImageList;
    DisabledSmallImages: TImageList;
    SmallImages: TImageList;
    LargeImages: TImageList;
    dxBarLargeButton3: TdxBarLargeButton;
    pFIBQuery1: TpFIBQuery;
    dxBarLargeButton1: TdxBarLargeButton;
    pFIBTransaction1: TpFIBTransaction;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ID_REESTR: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_REESTR: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_REESTR: TcxGridDBColumn;
    cxGrid1DBTableView1MFO_DONNU: TcxGridDBColumn;
    cxGrid1DBTableView1RATE_ACC_DONNU: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1SUM_ZAYAVKA: TcxGridDBColumn;
    cxGrid1DBTableView1CREATION_TIME: TcxGridDBColumn;
    cxGrid1DBTableView1PRINT_TIME: TcxGridDBColumn;
    cxGrid1DBTableView1OUT_TIME: TcxGridDBColumn;
    ExportButton: TdxBarLargeButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    HalcyonDataSet2: THalcyonDataSet;
    PrintButton: TdxBarLargeButton;
    FinObAction: TAction;
    Panel2: TPanel;
    cxLabel4: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    pFIBQuery2: TpFIBQuery;
    dxBarLargeButton5: TdxBarLargeButton;
    HalcyonDataSet2OP: TSmallintField;
    HalcyonDataSet2ND: TStringField;
    HalcyonDataSet2DA: TDateField;
    HalcyonDataSet2MFOP: TIntegerField;
    HalcyonDataSet2NLSA: TStringField;
    HalcyonDataSet2KOKPOR: TStringField;
    HalcyonDataSet2RRAX: TStringField;
    HalcyonDataSet2KPK: TIntegerField;
    HalcyonDataSet2KPOL: TIntegerField;
    HalcyonDataSet2KVK: TSmallintField;
    HalcyonDataSet2KFK: TIntegerField;
    HalcyonDataSet2S: TFloatField;
    HalcyonDataSet2KV: TSmallintField;
    HalcyonDataSet2KOBL: TSmallintField;
    HalcyonDataSet2KRAJ: TSmallintField;
    HalcyonDataSet2KSEL: TSmallintField;
    HalcyonDataSet2DATERZ: TDateField;
    HalcyonDataSet2NPRZ: TIntegerField;
    HalcyonDataSet2KEKV: TSmallintField;
    HalcyonDataSet2S1: TFloatField;
    HalcyonDataSet2NPRZ1: TIntegerField;
    HalcyonDataSet2KEKV1: TSmallintField;
    HalcyonDataSet2S2: TFloatField;
    HalcyonDataSet2NPRZ2: TIntegerField;
    HalcyonDataSet2KEKV2: TSmallintField;
    HalcyonDataSet2S3: TFloatField;
    HalcyonDataSet2NPRZ3: TIntegerField;
    HalcyonDataSet2KEKV3: TSmallintField;
    HalcyonDataSet2S4: TFloatField;
    HalcyonDataSet2PRM: TStringField;
    HalcyonDataSet2NAZB: TStringField;
    HalcyonDataSet2MFO: TIntegerField;
    HalcyonDataSet2NLSK: TStringField;
    HalcyonDataSet2KOKPO: TStringField;
    HalcyonDataSet2POLUT: TStringField;
    HalcyonDataSet2NAZ: TStringField;
    HalcyonDataSet2VZK: TSmallintField;
    HalcyonDataSet2SK: TSmallintField;
    HalcyonDataSet2SKD: TSmallintField;
    HalcyonDataSet2PRM1: TStringField;
    HalcyonDataSet2PRM2: TStringField;
    HalcyonDataSet2KEKD: TIntegerField;
    HalcyonDataSet2NAMER: TStringField;
    pFIBDataSet1: TpFIBDataSet;
    frxDBDataset1ree: TfrxDBDataset;
    frxCrossObject1: TfrxCrossObject;
    frxDBDataset2ree: TfrxDBDataset;
    pFIBDataSet2: TpFIBDataSet;
    dxStatusBar1: TdxStatusBar;
    dxBarPopupMenu1: TdxBarPopupMenu;
    cbDBFPath: TdxBarCombo;
    frxDesigner1: TfrxDesigner;
    frxDBDataset3ree: TfrxDBDataset;
    pFIBDataSet3: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    SelectButton: TdxBarLargeButton;
    frxDBDataset2: TfrxDBDataset;
    HalcyonDataSet2datedoc: TDateField;
    HalcyonDataSet2ndoc: TStringField;
    TxtExportButton: TdxBarLargeButton;
    Timer1: TTimer;
    HalcyonDataSet2NPD: TStringField;
    HalcyonDataSet2NREE: TIntegerField;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    pFIBDataSet4: TpFIBDataSet;
    frxDBDataset3: TfrxDBDataset;
    dxBarButton2: TdxBarButton;
    ReadDataSetGroupSum: TpFIBDataSet;
    frxDBDataset4: TfrxDBDataset;
    PopupMenu1: TPopupMenu;
    pFIBDataSet5: TpFIBDataSet;
    frxDBDataset5: TfrxDBDataset;
    dxBarButton3: TdxBarButton;
    PrintReport: TdxBarLargeButton;
    pFIBDataSetHeader: TpFIBDataSet;
    frxDBDatasetHeader: TfrxDBDataset;
    HeaderDataSource: TDataSource;
    pFIBDataSetDet: TpFIBDataSet;
    frxDBDataset6: TfrxDBDataset;
    pFIBDataSetSign: TpFIBDataSet;
    frxDBDataset7: TfrxDBDataset;
    frxReport2: TfrxReport;
    HalcyonDataSet2NDOCU: TStringField;
    HalcyonDataSet2DATEDOCU: TDateField;
    NewDbfTableCreate: TCreateHalcyonDataSet;
    DataSetExport: TpFIBDataSet;
    HalcyonDataSet1: THalcyonDataSet;
    cbKod: TdxBarCombo;
    dxBarLargeButtonEdit: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ExportButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dxTxtExportClick(Sender: TObject);
    procedure TxtExportButtonClick(Sender: TObject);
    procedure dxBarPopupMenu1Popup(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure PrintReportClick(Sender: TObject);
    procedure dxBarLargeButtonEditClick(Sender: TObject);
  public
    AllowMultiSelect : boolean;
    KeyField : string;
    res      : Variant;
    ree_reprt_num : integer;
    input : TAArray;
    output : TAArray;
    fltForm : TfrmReeFilter;
    DiskTree:TStringList;
    procedure SelectAll;
    procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
    procedure ResProc(id : integer; Action : TResAction);
    procedure OldDbfExportProc();


  end;

  function GetSpr(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; in_params, out_param : TAArray) : variant; stdcall;
  exports GetSpr;

implementation
uses WSUnit, DateReeUnit, LangUnit, ReeFormEdit;
{$R *.dfm}
{$R dbf.res}

type
 TKekv = record
  id_kekv : integer;
  code    : integer;
 end;

var
 prev_width : extended = 0;
 prev_left  : extended = 0;
 fWidth : integer = 0;

function GetSpr(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; in_params, out_param : TAArray) : variant;
var
  reeForm: TreeForm;
begin
 reeForm := TreeForm.Create(AOwner);
 reeForm.input := in_params;
 reeForm.output := out_param;
 reeForm.InitConnection(DBHandle, RTrans, WTrans);
 reeForm.FormStyle := fs;
 if reeForm.FormStyle = fsNormal then begin
  reeForm.SelectButton.Visible := ivAlways;
  reeForm.SelectAll;
  reeForm.cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
  reeForm.ShowModal;
  Result := reeForm.res;
  reeForm.Free;
 end else begin
  reeForm.SelectButton.Visible := ivNever;
  Result := reeForm.Handle;
  reeForm.show;
  reeForm.Repaint;
  reeForm.SelectAll;
  reeForm.cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
 end;
end;

procedure TreeForm.InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
begin
 WorkDatabase.Handle := DBhandle;
 ReadTransaction.Handle := RTransaction;
 WriteTransaction.Handle := WTransaction;
end;


procedure TreeForm.SelectAll;
var
 f : TForm;
begin
  f := WaitScreenShow(Self);
  DataSet.Close;
  if fltForm.cbNumRee.Checked then
     DataSet.ParamByName('NUM_REE').AsInt64 := StrToInt(fltForm.NumReeEdit.Text)
                             else
    DataSet.ParamByName('NUM_REE').AsVariant := Null;

  if fltForm.cbDate.Checked then
     DataSet.ParamByName('DATE_REE').AsDateTime := fltForm.DateEdit.Date
                               else
     DataSet.ParamByName('DATE_REE').AsVariant := Null;

  if fltForm.cbSumRee.Checked then
     DataSet.ParamByName('SUM_REE').AsCurrency:= StrToFloat(fltForm.SumReeEdit.Text)
                             else
     DataSet.ParamByName('SUM_REE').AsVariant := Null;

  if fltForm.cbNumDoc.Checked then
    DataSet.ParamByName('NUM_DOC').AsCurrency:= StrToFloat(fltForm.NumDocEdit.Text)
                            else
    DataSet.ParamByName('NUM_DOC').AsVariant := Null;

  DataSet.Open;
  WaitScreenClose(f);
end;

procedure TreeForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TreeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SavePositionToRegistry(Self);
  Action := caFree;
end;

procedure TreeForm.RefreshButtonClick(Sender: TObject);
var
  selected : integer;
begin
  selected := -1;
  if DataSet.RecordCount <> 0 then selected := DataSet['ID_REESTR'];
    SelectAll;
  DataSet.Locate('ID_REESTR', selected, []);
end;

procedure TreeForm.FormShow(Sender: TObject);
var
  kodFlag : Integer;
begin
  LoadPositionFromRegistry(Self);
  cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  if AllowMultiSelect then cxGrid1DBTableView1.Columns[0].Visible := true;
  // SelectAll;

  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'select KOD_TYPE from DOG_SYS_OPTIONS';
  pFIBQuery1.ExecQuery;
  kodFlag := pFIBQuery1.FldByName['KOD_TYPE'].AsInteger;
  pFIBQuery1.Close;
  cbKod.ItemIndex := kodFlag;
end;

procedure TreeForm.FormCreate(Sender: TObject);
begin
  fltForm := TfrmReeFilter.Create(Self);
  LangPackApply(Self);
  //cxGrid1DBTableView1.OnCellClick;
  //if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Add') <> 0 then AddButton.Visible := ivNever;
  //if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Del') <> 0 then DeleteButton.Visible := ivNever;
 // if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Edit') <> 0 then EditButton.Visible := ivNever;
  //if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','View') <> 0 then ViewButton.Visible := ivNever;
  //if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Print') <> 0 then PrintButton.Visible := ivNever;

  KeyField := 'ID_REESTR';
  cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cbDBFPath.ItemIndex := 0;
  Timer1.Enabled:=true;

  cbKod.Items.Add('CP866');
  cbKod.Items.Add('WIN1251'); 
end;

procedure TreeForm.DataSetAfterOpen(DataSet: TDataSet);
begin
  if DataSet.RecordCount = 0 then begin
    EditButton.Enabled := false;
    DeleteButton.Enabled := false;
  end else begin
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;
  end;
end;

procedure TreeForm.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
 AHandled := false;
 if ACellViewInfo.Item.Index <> 0 then exit;
 if Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] = 1 then
  Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] := 0
 else
  Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] := 1;
 AHandled := true;
end;

procedure TreeForm.dxBarLargeButton2Click(Sender: TObject);
begin
 if fltForm.ShowModal = mrOk then SelectAll;
// LoadDogManedger.ShowFilterForm(Application.MainForm, 'Фільтр для договорів', cxGrid1DBTableView1, ['NAME_CUSTOMER', 'NAME_TIP_DOG', 'N_DOG', 'D_DOG', 'DATE_BEG', 'SUMMA', 'DOG_NOTE', 'COMMENT', 'CLOSE']);
// cxGrid1DBTableView1.Filtering.RunCustomizeDialog;
// ShowFilterForm('Фільтр для договорів', cxGrid1DBTableView1, ['NAME_CUSTOMER', 'NAME_TIP_DOG', 'N_DOG', 'D_DOG', 'DATE_BEG', 'DATE_END', 'SUMMA', 'DOG_NOTE', 'COMMENT']);
end;

procedure TreeForm.AddButtonClick(Sender: TObject);
begin
// LoadDogManedger.WorkTypeDogSPR(Self, WorkDatabase.Handle, fsNormal, 'get', ResProc);
// SelectAll;
end;

procedure TreeForm.EditButtonClick(Sender: TObject);
begin
// LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsMDIChild, DataSet.FieldByName('KOD_DOG').AsVariant, 'red', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(DataSet.FieldByName('name_shablon').asString), ResProc);
// SelectAll;
end;

procedure TreeForm.ViewButtonClick(Sender: TObject);
begin
// LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsMDIChild, DataSet.FieldByName('KOD_DOG').AsVariant, 'prosmotr', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(DataSet.FieldByName('name_shablon').asString), ResProc);
end;

procedure TreeForm.DeleteButtonClick(Sender: TObject);
begin

 if DataSet.RecordCount = 0 then Exit;
 if MessageDlg('Увага', 'Ви дійсно бажаєте видалити реєстр?', mtConfirmation, [mbYes, mbNo]) <> mrYes then exit;
 WriteProc.Transaction.StartTransaction;
 WriteProc.ExecProcedure('PROC_DOG_DT_PL_REE_DEL', [DataSet['ID_REESTR'], SYS_ID_USER, GetIPAddress, GetCompName]);
 WriteProc.Transaction.Commit;
 DataSet.CacheDelete;
 RefreshButtonClick(Self);
end;

procedure TreeForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 if DataSet.RecordCount = 0 then exit;
 ShowPlat(Owner, WorkDatabase.Handle, ReadTransaction.Handle, WriteTransaction.Handle, fsMDIChild, DataSet['ID_REESTR']);
// ViewButtonClick(Self);
end;

procedure TreeForm.ResProc(id: integer; Action: TResAction);
begin
 if Action <> raView then begin
  SelectAll;
  DataSet.Locate('KOD_DOG', id, []);
 end;
end;

function GoToFirstSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
var
  i : integer;
begin
  Result := false;
  if DataSet.RecordCount = 0 then exit;
  TableView.DataController.FocusedRecordIndex := 0;
  i := 0;
  while (i < TableView.DataController.RecordCount) and (TableView.DataController.Values[i, 0] <> 1) do inc(i);
  DataSet.MoveBy(i);
  if i <> TableView.DataController.RecordCount then Result := true;
end;

function GoToNextSelected(TableView : TcxGridDBTableView; DataSet : TpFibDataSet) : boolean;
var
  i : integer;
begin
  Result := false;
  if DataSet.RecordCount = 0 then exit;
  i := TableView.DataController.FocusedRecordIndex + 1;
  while (i < TableView.DataController.RecordCount) and (TableView.DataController.Values[i, 0] <> 1) do inc(i);
  DataSet.MoveBy(i - TableView.DataController.FocusedRecordIndex);
  if i <> TableView.DataController.RecordCount then Result := true;
end;


{
 Процедура экспорта в дбф, привязываю ещё и тхт
 Доработанно:
 - Сохранение ДБФ в отдельный каталог на дискете,
   согласно выбранному казначейскому счёту.
 (Вызов старой/новой процедуры зависит от флага в DOG_SYS_OPTIONS)
}


procedure TreeForm.ExportButtonClick(Sender: TObject);
var
 selected : integer;
 i, k, m : integer;
 id_reestr : array of integer;
 //date_ree : variant;
 // s : string;
 f : TForm;
 rs : TResourceStream;
 fileName, count_z, buf0 : String;
 pathName : String;
 storName : string;
 storAcc  : string;
 reeFlag  : string;
begin
  if (cbKod.CurItemIndex = 0) then HalcyonDataSet1.TranslateASCII := True
  else HalcyonDataSet1.TranslateASCII := False;

  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'select REE_PATH_ACC from DOG_SYS_OPTIONS';
  pFIBQuery1.ExecQuery;

  reeFlag := pFIBQuery1.FldByName['REE_PATH_ACC'].AsString;

  if reeFlag = 'F' then
  begin
    OldDbfExportProc();
    Exit;
  end;

  selected := cxGrid1DBTableView1.DataController.RecNo;
  if GoToFirstSelected(cxGrid1DBTableView1, DataSet) then repeat
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := DataSet['ID_REESTR'];
    //cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRowIndex, 0] := 0;
  until not GoToNextSelected(cxGrid1DBTableView1, DataSet);
  if Length(id_reestr) = 0 then begin
    //cxGrid1DBTableView1.DataController.RecNo := selected;
    ShowMessage('Виберіть хоча б один запис.');
    exit;
  end;

// -----------------------------------------------------------------------------
 f := WaitScreenShowWithProgress(Self, Length(id_reestr), 'Іде експорт...');
 for i := 0 to Length(id_reestr) - 1 do begin
   count_z := '';
   DataSetExport.Close;
   DataSetExport.ParamByName('id_reestr').AsInt64 := id_reestr[i];
   DataSetExport.ParamByName('kod_type').AsInt64 := cbKod.CurItemIndex;
   DataSetExport.Open;
   DataSetExport.FetchAll;

   for m :=1 to (5-Length(DataSetExport.FBN('REE_NUM').AsString))  do
      count_z := count_z+'0';


  //pFIBQuery1.Close;
  //pFIBQuery1.SQL.Text := 'select * from PROC_DOG_DT_PL_REE_GET_EXP_DATA(' + IntToStr(id_reestr[i]) + ')';
  //pFIBQuery1.ExecQuery;
  //date_ree := DataSetExport['DATE_REESTR'].AsDate;

  //fileName:='\FPLAT.DBF';
  fileName:='\' + DataSetExport.FBN('NAME_DBF').AsString;
  pathName:=cbDBFPath.Text+'FPLAT-'+count_z+DataSetExport.FBN('REE_NUM').AsString+'-'+DataSetExport.FBN('RATE_ACC_RAX').AsString;

  storName:=GetCurrentDir;
  SetCurrentDir(cbDBFPath.Text);

  if DirectoryExists(pathName)=false then
  begin
   MkDir('FPLAT-'+count_z+DataSetExport.FBN('REE_NUM').AsString+'-'+DataSetExport.FBN('RATE_ACC_RAX').AsString);
  end;

  HalcyonDataSet1.Close;
  HalcyonDataSet1.DatabaseName := ExtractFilePath(pathName+fileName);
  HalcyonDataSet1.TableName := ExtractFileName(pathName+fileName);

  if FileExists(pathName+fileName) then
  begin
   if MessageBox(Handle,PChar('DBF Файл вже існує. Перезаписати?'),
     'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
   begin
     DeleteFile(pathName+fileName);
   end
   else
   begin
    Exit;
   end;
  end;

  if (NewDbfTableCreate.Execute) then
  begin
    HalcyonDataSet1.Exclusive := true;
    HalcyonDataSet1.Open;
  end
  else
  begin
    ShowMessage('Неможливо створити файл!');
    Exit;
  end;

  {if pathName <> storAcc then
  begin
    try
    if FileExists(pathName+fileName) then
        begin
          DeleteFile(pathName+fileName);
        end;
        rs := TResourceStream.Create(HInstance, 'FPLAT', 'BINARY');
        rs.SaveToFile(pathName+fileName);
        rs.Free;
        HalcyonDataSet1.Close;
        HalcyonDataSet1.DatabaseName := ExtractFilePath(pathName+fileName);
        HalcyonDataSet1.TableName := ExtractFileName(pathName+fileName);
    except
        ShowMessage('Невозможно произвести экспорт.');
        Exit;
    end;
  end;        }

  //storAcc:=pathName;
// -----------------------------------------------------------------------------

  {while not pFIBQuery1.Eof do begin

   HalcyonDataSet1.Open;
   HalcyonDataSet1.InsertRecord([
    3,
    pFIBQuery1['NUM_DOC'].AsString,
    pFIBQuery1['NUM_DOC'].AsString,
    pFIBQuery1['D_DOG'].AsDate,
    pFIBQuery1['REE_NUM'].AsInteger,
    pFIBQuery1['MFO_DGU'].AsString,
    pFIBQuery1['RATE_ACC_DGU'].AsString,
    pFIBQuery1['KOD_EDRPUO_DGU'].AsString,
    pFIBQuery1['RATE_ACC_RAX'].AsString,
    pFIBQuery1['KPK'].AsInteger,
    Copy(pFIBQuery1['KPOL'].AsString, Length(pFIBQuery1['KPOL'].AsString) - 4, 5),
    pFIBQuery1['KVK'].AsInteger,
    pFIBQuery1['KFK'].AsInteger,
    pFIBQuery1['SUMMA'].AsCurrency,
    0,
    pFIBQuery1['KOBL'].AsInteger,
    pFIBQuery1['KRAJ'].AsInteger,
    pFIBQuery1['KSEL'].AsInteger,
    pFIBQuery1['DATERZ'].AsDate,
    pFIBQuery1['N_PP_FINZ'].AsInteger,
    pFIBQuery1['KEKV'].AsInteger,
    pFIBQuery1['S1'].AsCurrency,
    0,
    pFIBQuery1['KEKV1'].AsInteger,
    pFIBQuery1['S2'].AsCurrency,
    0,
    pFIBQuery1['KEKV2'].AsInteger,
    pFIBQuery1['S3'].AsCurrency,
    0,
    pFIBQuery1['KEKV3'].AsInteger,
    pFIBQuery1['S4'].AsCurrency,
    0,
    pFIBQuery1['NAME_BANK'].AsString,
    pFIBQuery1['MFO'].AsString,
    pFIBQuery1['RATE_ACC'].AsString,
    pFIBQuery1['KOD_EDRPOU'].AsString,
    pFIBQuery1['NAME_CUSTOMER'].AsString,
    pFIBQuery1['NOTE'].AsString,
    pFIBQuery1['VZK'].AsInteger,
    pFIBQuery1['SK'].AsInteger,
    0,
    '',
    '',
    0,
    pFIBQuery1['NAME_CUSTOMER_DGU'].AsString,
    pFIBQuery1['FZ_NUM_DOC'].AsVariant,
    pFIBQuery1['FZ_DATEDOC'].AsVariant,
    '',
    ''
   ]);
 //  HalcyonDataSet1.Post;
   pFIBQuery1.Next
  end;  }
  //pFIBQuery1.Close;

  DataSetExport.First;
  for k := 0 to DataSetExport.RecordCount - 1 do
  begin
    HalcyonDataSet1.Append;
    HalcyonDataSet1['OP'] := 0;
    HalcyonDataSet1['ND'] := DataSetExport.FBN('NUM_DOC').AsString;
    HalcyonDataSet1['NPD'] := DataSetExport.FBN('NUM_DOC').AsString;
    HalcyonDataSet1['DA'] := DataSetExport.FBN('D_DOG').AsDateTime;
    HalcyonDataSet1['NREE'] := DataSetExport.FBN('REE_NUM').AsInteger;
    HalcyonDataSet1['NLSA'] := DataSetExport.FBN('RATE_ACC_DGU').AsString;
    HalcyonDataSet1['RRAX'] := DataSetExport.FBN('RATE_ACC_RAX').AsString;
    HalcyonDataSet1['S'] := DataSetExport.FBN('SUMMA').AsCurrency;
    HalcyonDataSet1['KV'] := null;
    HalcyonDataSet1['KOBL'] := null;
    HalcyonDataSet1['KRAJ'] := null;
    HalcyonDataSet1['KSEL'] := null;
    HalcyonDataSet1['KPK'] := DataSetExport.FBN('KPK').AsInteger;
    HalcyonDataSet1['KFK'] := DataSetExport.FBN('KFK').AsInteger;
    HalcyonDataSet1['KVK'] := DataSetExport.FBN('KVK').AsInteger;
    HalcyonDataSet1['KEKV'] := DataSetExport.FBN('KEKV').AsInteger;
    HalcyonDataSet1['DATERZ'] := DataSetExport.FBN('DATERZ').AsDateTime;
    HalcyonDataSet1['NPRZ'] := DataSetExport.FBN('N_PP_FINZ').AsInteger;
    HalcyonDataSet1['S1'] := DataSetExport.FBN('S1').AsCurrency;
    HalcyonDataSet1['KEKV1'] := DataSetExport.FBN('KEKV1').AsInteger;
    HalcyonDataSet1['NPRZ1'] := null;
    HalcyonDataSet1['S2'] := DataSetExport.FBN('S2').AsCurrency;
    HalcyonDataSet1['KEKV2'] := DataSetExport.FBN('KEKV2').AsInteger;
    HalcyonDataSet1['NPRZ2'] := null;
    HalcyonDataSet1['S3'] := DataSetExport.FBN('S3').AsCurrency;
    HalcyonDataSet1['KEKV3'] := DataSetExport.FBN('KEKV3').AsInteger;
    HalcyonDataSet1['NPRZ3'] := null;
    HalcyonDataSet1['S4'] := DataSetExport.FBN('S4').AsCurrency;
    HalcyonDataSet1['PRM'] := null;
    HalcyonDataSet1['PRM1'] := null;
    HalcyonDataSet1['PRM2'] := null;
    HalcyonDataSet1['NAZB'] := DataSetExport.FBN('NAME_BANK').AsString;
    HalcyonDataSet1['MFO'] := DataSetExport.FBN('MFO').AsString;
    HalcyonDataSet1['NLSK'] := DataSetExport.FBN('RATE_ACC').AsString;
    HalcyonDataSet1['KOKPO'] := DataSetExport.FBN('KOD_EDRPOU').AsString;
    HalcyonDataSet1['POLUT'] := DataSetExport.FBN('NAME_CUSTOMER').AsString;
    HalcyonDataSet1['SK'] := DataSetExport.FBN('SK').AsInteger;
    HalcyonDataSet1['SKD'] := null;
    HalcyonDataSet1['VZK'] := DataSetExport.FBN('VZK').AsInteger;
    //HalcyonDataSet1['KPOL'] := Copy(DataSetExport.FBN('KPOL').AsString, Length(DataSetExport.FBN('KPOL').AsString) - 4, 5);
    HalcyonDataSet1['KPOL'] := StrToInt(DataSetExport.FBN('KPOL').AsString);
    HalcyonDataSet1['NAZ'] := DataSetExport.FBN('NOTE').AsString;
    HalcyonDataSet1['NDOC'] := DataSetExport.FBN('FZ_NUM_DOC').AsString;
    HalcyonDataSet1['DATEDOC'] := DataSetExport.FBN('FZ_DATEDOC').AsDateTime;
    HalcyonDataSet1['KEKD'] := null;
    HalcyonDataSet1['MFOP'] := DataSetExport.FBN('MFO_DGU').AsString;
    HalcyonDataSet1['KOKPOR'] := DataSetExport.FBN('KOD_EDRPUO_DGU').AsString;
    HalcyonDataSet1['NAMER'] := DataSetExport.FBN('NAME_CUSTOMER_DGU').AsString;
    HalcyonDataSet1['NDOCU'] := DataSetExport.FBN('NDOCU').AsString;
    HalcyonDataSet1['DATEDOCU'] := DataSetExport.FBN('DATEDOCU').AsDateTime;
    HalcyonDataSet1.Post;
    DataSetExport.Next;
    WaitScreenStep(F);
  end;
 end;
 WaitScreenClose(f);
 HalcyonDataSet1.Close;
 cxGrid1DBTableView1.DataController.RecNo := selected;
 ShowMessage('Експорт виконано.');
 SetCurrentDir(storName);

  //pFIBQuery1.Close;
  //pFIBQuery1.SQL.Text := 'update DOG_SYS_OPTIONS s set s.KOD_TYPE = ' + IntToStr(cbKod.ItemIndex) + ';';
  //pFIBQuery1.ExecQuery;
  //pFIBQuery1.Close;
end;

procedure TreeForm.PrintButtonClick(Sender: TObject);
var
 repFile : string;
 str     : string;
 i       : integer;
 repTarget : string;
begin
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select PRINT_REE_PACK_REP from DOG_SYS_OPTIONS';
 pFIBQuery1.ExecQuery;
 if pFIBQuery1.RecordCount <> 0 then if not VarIsNull(pFIBQuery1['PRINT_REE_PACK_REP'].AsVariant) then repTarget := pFIBQuery1['PRINT_REE_PACK_REP'].AsString;
 pFIBQuery1.Close;

 if (repTarget = 'dnepr') then
 begin
  dxBarButton2Click(Self);
  exit;
 end;

 if (repTarget = 'kiev') then
 begin
  dxBarButton1Click(Self);
  exit;
 end;


 repFile := 'PlatRee.fr3';
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 3';
 pFIBQuery1.ExecQuery;
 if pFIBQuery1.RecordCount <> 0 then if not VarIsNull(pFIBQuery1['REPORT_FILE'].AsVariant) then repFile := pFIBQuery1['REPORT_FILE'].AsString;
 pFIBQuery1.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile);

 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 begin
   frxReport2.DesignReport;
   Exit;
 end;

 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select distinct s.id_kekv, k.kekv_kode_print ' +
                               'from dog_dt_pl_ree r ' +
                               'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr) ' +
                               'left join dog_dt_pl_smet s on (p.id_key = s.id_key) ' +
                               'left join pub_spr_kekv k on (s.id_kekv = k.id_kekv and (p.export_day between k.date_beg and k.date_end)) ' +
                               'where r.id_reestr = ' + IntToStr(DataSet.fieldByName('ID_REESTR').AsInteger) + ' ' +
                               ' and (p.DELETED_SYSTEM <> 3) ' +
                               'order by k.kekv_kode_print ';
 ReadDataSet.Open;
 if ReadDataSet.RecordCount = 0 then
 begin
   ReadDataSet.Close;
   ShowMessage('Не знайдени КЕКВ.');
   exit;
 end;
 str := '';
 for i := 1 to 5 do
 begin
   TfrxMemoView(frxReport2.FindObject('hKekv' + IntToStr(i))).Visible := false;
   TfrxMemoView(frxReport2.FindObject('dKekv' + IntToStr(i))).Visible := false;
   TfrxMemoView(frxReport2.FindObject('sKekv' + IntToStr(i))).Visible := false;
 end;
 i   := 1;
 while not ReadDataSet.Eof do
 begin
   str := str + 'sum((select sum(summa) from dog_dt_pl_smet where id_dog_dt_pl_smet = s.id_dog_dt_pl_smet and id_kekv = ' + IntToStr(TFIBBCDField(ReadDataSet.FieldByName('ID_KEKV')).AsInt64) + ')) as sum'+IntToStr(i)+' , ';
   TfrxMemoView(frxReport2.FindObject('hKekv' + IntToStr(i))).Text    := ReadDataSet['kekv_kode_print'];
   TfrxMemoView(frxReport2.FindObject('hKekv' + IntToStr(i))).Visible := true;
   TfrxMemoView(frxReport2.FindObject('dKekv' + IntToStr(i))).Visible := true;
   TfrxMemoView(frxReport2.FindObject('sKekv' + IntToStr(i))).Text := '[SUM(<frxDBDatasetMainData."SUM' + IntToStr(i) + '">,0,0) #n%2,2f]';
   TfrxMemoView(frxReport2.FindObject('sKekv' + IntToStr(i))).Visible := true;
   ReadDataSet.Next;
   i := i + 1;
 end;
 str := Copy(str, 1, Length(str) - 2);
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Text := 'select p.num_doc, p.export_day, p.summa, c.name_customer, b.mfo, a.rate_account, ' +
                               '%s' +
                               'from dog_dt_pl_ree r ' +
                               'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr) ' +
                               'left join dog_dt_pl_smet s on (p.id_key = s.id_key) ' +
                               'left join pub_sp_cust_rate_acc a on (p.id_rate_account = a.id_rate_account) ' +
                               'left join pub_sp_customer c on (a.id_customer = c.id_customer) ' +
                               'left join pub_sp_bank b on (a.id_bank = b.id_bank) ' +
                               'where r.id_reestr = ' + IntToStr(DataSet.fieldByName('ID_REESTR').AsInteger) + ' ' +
                               ' and (p.DELETED_SYSTEM <> 3) ' +
                               'group by p.num_doc, p.export_day, c.name_customer, b.mfo, a.rate_account, p.summa';
 ReadDataSet.SelectSQL.Text := Format(ReadDataSet.SelectSQL.Text, [str]);
 ReadDataSet.Open;
// frxReport2.DesignReport();
 frxReport2.ShowReport();


 //frxReport1.ShowReport();


 (*
// pFIBQuery1.Transaction := ReadTransaction;
 pFIBQuery1.Close;
 pFIBQuery1.SQL.Text := 'select * from PROC_DOG_DT_PL_SMET_GET_KEKV(' + IntToStr(DataSet['ID_REESTR']) + ')';
 pFIBQuery1.ExecQuery;
 KEKV := Nil;
 while not pFIBQuery1.Eof do begin
  SetLength(KEKV, Length(KEKV) + 1);
  KEKV[Length(KEKV) - 1].id_kekv := pFIBQuery1['ID_KEKV'].AsInteger;
  KEKV[Length(KEKV) - 1].code := pFIBQuery1['KEKV_CODE'].AsInteger;
  pFIBQuery1.Next;
 end;
 pFIBQuery1.Close;

 if Length(KEKV) = 0 then begin
  ShowMessage('Ошибка! Невозможно получить KEKV.');
  exit;
 end;

{ pFIBQuery2.Close;
 pFIBQuery2.Transaction.StartTransaction;
 pFIBQuery2.SQL.Text := 'select * from PROC_DOG_DT_PL_REE_GET_REP_NUM';
 pFIBQuery2.ExecProc;
 if pFIBQuery2.RecordCount = 0 then Exit;
 ree_reprt_num := pFIBQuery2.Fields[0].AsInteger;
 pFIBQuery2.Close;}
 DataSetPl.Close;
 DataSetPl.SelectSQL.Text := 'select * from PROC_DOG_DT_PL_DOC_SEL(' + IntToStr(DataSet['ID_REESTR']) + ',' + IntToStr(SYS_ID_USER) + ', -1, '''')';
 DataSetPl.Open;
 SmetDataSet.Open;
 frUserDataset1.RangeEndCount := DataSetPl.RecordCount + 1;
 frUserDataset2.RangeEndCount := 7 + Length(KEKV);
 frReport1.ShowReport;
 DataSetPl.Close;
 SmetDataSet.Close;

// pFIBQuery2.Transaction.Commit;
// pFIBQuery1.Transaction := ReadTransaction;
// SmetDataSet.Close;
// DataSetPl.Close;
*)
// frxReport1.DesignReport;

end;

procedure TreeForm.dxBarLargeButton5Click(Sender: TObject);
var
 cnt : integer;
 f : TForm;
 frm : TDateReeForm;
 d : TDate;
 id_ree_new : int64;
begin
// if MessageDlg('Dogovor', rs_FormRee_Question, mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;
 frm := TDateReeForm.Create(Self);
 if frm.ShowModal = mrCancel then Exit;
 d := frm.ReeDateEdit.Date;
 frm.Free;
 f := WaitScreenShow(Self, 'Рєстр формується...');
 WriteProc.Transaction.StartTransaction;
 WriteProc.ExecProcedure('PROC_DOG_DT_PL_REE_MAKE', [Tdate(d), SYS_ID_USER, GetIPAddress, GetCompName]);
 cnt := WriteProc['REG_COUNT'].AsInteger;
 id_ree_new := WriteProc['ID_REESTR_LAST'].AsInt64;
 WriteProc.Transaction.Commit;
 WaitScreenClose(f);
 SelectAll;
 DataSet.Locate('ID_REESTR', id_ree_new, []);
 ShowMessage('Сформовано реєстров: ' + IntToStr(cnt));
end;

procedure TreeForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_ESCAPE) then Close;
 if (Key = VK_DELETE) and (DeleteButton.Visible = ivAlways) then DeleteButtonClick(Self);
 if (Key = VK_F3) and (ViewButton.Visible = ivAlways) then ViewButtonClick(Self);
 if (Key = VK_F9) and (dxBarLargeButton5.Visible = ivAlways) then dxBarLargeButton5Click(Self);
 if (Key = VK_F8) then dxBarLargeButton2Click(Self);
 if (Key = VK_F11) and (ExportButton.Visible = ivAlways) then ExportButtonClick(Self);
 if (Key = Ord('P')) and (ssCtrl in Shift) and (PrintButton.Visible = ivAlways) then PrintButtonClick(Self);
 if (Key = VK_SPACE) then if cxGrid1DBTableView1.DataController.FocusedRecordIndex <> -1 then
 begin
   if cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex, 0] = 1 then
     cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex, 0] := 0
   else
     cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex, 0] := 1;
 end;
end;

procedure TreeForm.SelectButtonClick(Sender: TObject);
begin
 if DataSet.RecordCount <> 0 then
 begin
   output['ID_REESTR'].AsInt64 := DataSet['ID_REESTR'];
 end;
 output['ModalResult'].AsVariant := mrOk;
 ModalResult := mrOk;
end;

procedure TreeForm.FormDestroy(Sender: TObject);
begin
 fltForm.Free;
end;

procedure TreeForm.dxTxtExportClick(Sender: TObject);
begin

end;


{

Процедура экпорта платёжного поручения в текстовый файл



}
procedure TreeForm.TxtExportButtonClick(Sender: TObject);
var
txt_path     : string;
selected     : integer;
id_reestr    : array of integer;
i            : integer;
date_ree     : variant;
f            : TForm;
txt_filename : string;
hFileLink    : TextFile;
// rs : TResourceStream;
begin
{ Set path for outcomming selections }
 txt_path:='D:\TXT_PLAT\';
{ Check reestr selection }

  selected := cxGrid1DBTableView1.DataController.RecNo;
  if GoToFirstSelected(cxGrid1DBTableView1, DataSet) then repeat
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := DataSet['ID_REESTR'];
  until not GoToNextSelected(cxGrid1DBTableView1, DataSet);
  if Length(id_reestr) = 0 then begin
    ShowMessage('Виберіть хоча б один запис.');
    exit;
  end;

{ Select main data }


 f := WaitScreenShowWithProgress(Self, Length(id_reestr), 'Іде експорт...');
 for i := 0 to Length(id_reestr) - 1 do begin
  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'select * from PROC_DOG_DT_PL_REE_GET_EXP_DATA(' + IntToStr(id_reestr[i]) + ')';
  pFIBQuery1.ExecQuery;
  date_ree := pFIBQuery1['DATE_REESTR'].Value;

  while not pFIBQuery1.Eof do begin

  txt_filename := 'test_txt_file';
  AssignFile(hFileLink,txt_path+txt_filename+IntToStr(i)+'.txt');
  ReWrite(hFileLink);


  WriteLn(hFileLink,'Content-Type=','doc/ua_payment');
  WriteLn(hFileLink,'DATE_DOC=',pFIBQuery1['D_DOG'].AsString);
  WriteLn(hFileLink,'NUM_DOC=',pFIBQuery1['NUM_DOC'].AsString);
  WriteLn(hFileLink,'AMOUNT=',pFIBQuery1['SUMMA'].AsString);

  WriteLn(hFileLink,'CLN_NAME=',pFIBQuery1['NAME_CUSTOMER_DGU'].AsString);
  WriteLn(hFileLink,'CLN_OKPO=',pFIBQuery1['KOD_EDRPUO_DGU'].AsString);
  WriteLn(hFileLink,'CLN_ACCOUNT=',pFIBQuery1['RATE_ACC_DGU'].AsString);
  WriteLn(hFileLink,'CLN_BANKNAME=',pFIBQuery1['NAME_BANK'].AsString);
  WriteLn(hFileLink,'CLN_BANK_MFO=',pFIBQuery1['MFO_DGU'].AsString);

  WriteLn(hFileLink,'RCPT_NAME=',pFIBQuery1['NAME_CUSTOMER'].AsString);
  WriteLn(hFileLink,'RCPT_OKPO=',pFIBQuery1['KOD_EDRPOU'].AsString);
  WriteLn(hFileLink,'RCPT_ACCOUNT=',pFIBQuery1['RATE_ACC_RAX'].AsString);
  WriteLn(hFileLink,'RCPT_BANK_NAME=',pFIBQuery1['NAME_BANK'].AsString);
  WriteLn(hFileLink,'RCPT_BANK_MFO=',pFIBQuery1['MFO'].AsString);

  WriteLn(hFileLink,'PAYMENTS_DETAILS=',pFIBQuery1['NOTE'].AsString);
  WriteLn(hFileLink,'VALUE_DATE=',pFIBQuery1['D_DOG'].AsString);

{
 D_DOG               -  Дата документа
 NUM_DOC             -  Номер документа
 SUMMA               -  Сумма платёжки

 NAME_CUSTOMER_DGU   -  Наименование плательщика
 KOD_EDRPUO_DGU      -  ОКПО плательщика
 RATE_ACC_DGU        -  Счёт плательщика
 NAME_BANK           -  Название банка плательщика
 MFO_DGU             -  МФО плательщика

 NAME_CUSTOMER       -  Наименование получателя
 KOD_EDRPOU          -  ОКПО получателя
 RATE_ACC_RAX        -  Счёт получателя
 NAME_BANK           -  Название банка получателя (под вопросом)
 MFO                 -  МФО получателя
 NOTE                -  Назначение платежа (примечание по идее)

 DATE_REESTR         -  Дата валютирования
}

  CloseFile(hFileLink);

   pFIBQuery1.Next
  end;
  pFIBQuery1.Close;
  WaitScreenStep(F);
 end;
 WaitScreenClose(f);
 ShowMessage('Експорт виконано.');

end;


//------------------------------------------------------------------------------
// Проверка существования каталогов с существующим казначейским счётом
procedure TreeForm.dxBarPopupMenu1Popup(Sender: TObject);
var
 k     : Integer;
 stopF : Boolean;
 selected     : integer;
 id_reestr    : array of integer;
 i            : integer;
 date_ree     : variant;
begin


// stopF:=false;
// cbDBFPath.Items.Clear;

{   selected := cxGrid1DBTableView1.DataController.RecNo;
  if GoToFirstSelected(cxGrid1DBTableView1, DataSet) then repeat
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := DataSet['ID_REESTR'];
  until not GoToNextSelected(cxGrid1DBTableView1, DataSet);
  if Length(id_reestr) = 0 then begin
    ShowMessage('Виберіть хоча б один запис.');
    exit;
  end;
}
//  pFIBQuery1.Close;
//  pFIBQuery1.SQL.Text := 'select * from PROC_DOG_DT_PL_REE_GET_EXP_DATA(' + IntToStr(id_reestr[i]) + ')';
//  pFIBQuery1.ExecQuery;

// for k:=0 to cbDBFPath.Items.Count -1 do
// begin

//  if cbDBFPath.Items[k]='Test' then exit;
// end;

// cbDBFPath.Items.Add('Test');
// cbDBFPath.ItemIndex:=0;
end;

// Старая процедура экспорта для казначейства
procedure TreeForm.OldDbfExportProc();
var
 selected : integer;
 i : integer;
 id_reestr : array of integer;
 date_ree : variant;
// s : string;
 f : TForm;
 rs : TResourceStream;
begin
  try
    if FileExists(cbDBFPath.Text+'FPLAT.DBF') then begin
      DeleteFile(cbDBFPath.Text+'FPLAT.DBF');
    end;
    rs := TResourceStream.Create(HInstance, 'FPLAT', 'BINARY');
    rs.SaveToFile(cbDBFPath.Text+'FPLAT.DBF');
    rs.Free;
  except
    ShowMessage('Невозможно произвести экспорт.');
    Exit;
  end;

  HalcyonDataSet1.DatabaseName := ExtractFilePath(cbDBFPath.Text+'FPLAT.DBF');
  HalcyonDataSet1.TableName := ExtractFileName(cbDBFPath.Text+'FPLAT.DBF');

  selected := cxGrid1DBTableView1.DataController.RecNo;
  if GoToFirstSelected(cxGrid1DBTableView1, DataSet) then repeat
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := DataSet['ID_REESTR'];
    //cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRowIndex, 0] := 0;
  until not GoToNextSelected(cxGrid1DBTableView1, DataSet);
  if Length(id_reestr) = 0 then begin
    //cxGrid1DBTableView1.DataController.RecNo := selected;
    ShowMessage('Виберiть хоча б один запис.');
    exit;
  end;


 f := WaitScreenShowWithProgress(Self, Length(id_reestr), 'Iде експорт...');
 for i := 0 to Length(id_reestr) - 1 do begin
  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'select * from PROC_DOG_DT_PL_REE_GET_EXP_DATA(' + IntToStr(id_reestr[i]) + ')';
  pFIBQuery1.ExecQuery;
  date_ree := pFIBQuery1['DATE_REESTR'].Value;
  while not pFIBQuery1.Eof do begin
   HalcyonDataSet1.Open;
   HalcyonDataSet1.InsertRecord([
    3,
    pFIBQuery1['NUM_DOC'].AsString,
    pFIBQuery1['NUM_DOC'].AsString,
    pFIBQuery1['D_DOG'].AsDate,
    pFIBQuery1['REE_NUM'].AsInteger,
    pFIBQuery1['MFO_DGU'].AsString,
    pFIBQuery1['RATE_ACC_DGU'].AsString,
    pFIBQuery1['KOD_EDRPUO_DGU'].AsString,
    pFIBQuery1['RATE_ACC_RAX'].AsString,
    pFIBQuery1['KPK'].AsInteger,
    Copy(pFIBQuery1['KPOL'].AsString, Length(pFIBQuery1['KPOL'].AsString) - 4, 5),
    pFIBQuery1['KVK'].AsInteger,
    pFIBQuery1['KFK'].AsInteger,
    pFIBQuery1['SUMMA'].AsCurrency,
    0,
    pFIBQuery1['KOBL'].AsInteger,
    pFIBQuery1['KRAJ'].AsInteger,
    pFIBQuery1['KSEL'].AsInteger,
    date_ree,
    pFIBQuery1['N_PP_FINZ'].AsInteger,
    pFIBQuery1['KEKV'].AsInteger,
    pFIBQuery1['S1'].AsCurrency,
    0,
    pFIBQuery1['KEKV1'].AsInteger,
    pFIBQuery1['S2'].AsCurrency,
    0,
    pFIBQuery1['KEKV2'].AsInteger,
    pFIBQuery1['S3'].AsCurrency,
    0,
    pFIBQuery1['KEKV3'].AsInteger,
    pFIBQuery1['S4'].AsCurrency,
    0,
    pFIBQuery1['NAME_BANK'].AsString,
    pFIBQuery1['MFO'].AsString,
    pFIBQuery1['RATE_ACC'].AsString,
    pFIBQuery1['KOD_EDRPOU'].AsString,
    pFIBQuery1['NAME_CUSTOMER'].AsString,
    pFIBQuery1['NOTE'].AsString,
    pFIBQuery1['VZK'].AsInteger,
    pFIBQuery1['SK'].AsInteger,
    0,
    '',
    '',
    0,
    pFIBQuery1['NAME_CUSTOMER_DGU'].AsString,
    pFIBQuery1['FZ_NUM_DOC'].AsVariant,
    pFIBQuery1['FZ_DATEDOC'].AsVariant
   ]);
 //  HalcyonDataSet1.Post;
   pFIBQuery1.Next
  end;
  pFIBQuery1.Close;
  WaitScreenStep(F);
 end;
 WaitScreenClose(f);
 HalcyonDataSet1.Close;
 cxGrid1DBTableView1.DataController.RecNo := selected;
 ShowMessage('Експорт виконано.');
end;

// Система определения горячей вставки/выключения флешки
procedure TreeForm.Timer1Timer(Sender: TObject);
var
 r: LongWord;
 Drives: array[0..128] of char;
 pDrive: PChar;
 k     : Integer;

begin
 DiskTree:=TStringList.Create();
 DiskTree.Clear;
 DiskTree.Add('A:\');
 DiskTree.Add('C:\');

 r := GetLogicalDriveStrings(SizeOf(Drives), Drives);
 if r = 0 then Exit;
 if r > SizeOf(Drives) then
 raise Exception.Create(SysErrorMessage(ERROR_OUTOFMEMORY));
 pDrive := Drives;

 while pDrive^ <> #0 do
 begin
  if GetDriveType(pDrive) = DRIVE_REMOVABLE then
  begin
    if pDrive <> 'A:\' then
    begin
     if cbDBFPath.Items.IndexOf(pDrive) = -1 then
     begin
       cbDBFPath.Items.Add(pDrive);
     end;
     DiskTree.Add(pDrive);
    end;
  end;
  Inc(pDrive, 4);
 end;

  for k:=0 to cbDBFPath.Items.Count - 1 do
  begin
    if DiskTree.IndexOf(cbDBFPath.Items[k]) = -1  then
    begin
     cbDBFPath.Items.Delete(k);
     cbDBFPath.Text:='A:\';
    end;
  end;
end;


// Процедура формирования печати для Киева
procedure TreeForm.dxBarButton1Click(Sender: TObject);
var
 repFile : string;
 str     : string;
 i       : integer;
begin
repFile := 'PlatRee_kiev.fr3';
// pFIBQuery1.Close;

 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile);

 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 begin
   frxReport2.DesignReport;
   Exit;
 end;

 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select distinct s.id_kekv, k.kekv_kode_print ' +
                               'from dog_dt_pl_ree r ' +
                               'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr) ' +
                               'left join dog_dt_pl_smet s on (p.id_key = s.id_key) ' +
                               'left join pub_spr_kekv k on (s.id_kekv = k.id_kekv and (p.export_day between k.date_beg and k.date_end)) ' +
                               'where r.id_reestr = ' + IntToStr(DataSet.fieldByName('ID_REESTR').AsInteger) + ' ' +
                               ' and (p.DELETED_SYSTEM <> 3) ' +
                               'order by k.kekv_kode_print ';
 ReadDataSet.Open;
 if ReadDataSet.RecordCount = 0 then
 begin
   ReadDataSet.Close;
   ShowMessage('Не знайден КЕКВ.');
   exit;
 end;

 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select p.num_doc, p.export_day, p.summa, c.name_customer, b.mfo, a.rate_account,s.id_kekv, k.kekv_kode_print ' +
                               'from dog_dt_pl_ree r ' +
                               'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr) ' +
                               'left join dog_dt_pl_smet s on (p.id_key = s.id_key) ' +
                               'left join pub_sp_cust_rate_acc a on (p.id_rate_account = a.id_rate_account) ' +
                               'left join pub_spr_kekv k on (s.id_kekv = k.id_kekv and (p.export_day between k.date_beg and k.date_end)) '+
                               'left join pub_sp_customer c on (a.id_customer = c.id_customer) ' +
                               'left join pub_sp_bank b on (a.id_bank = b.id_bank) ' +
                               'where r.id_reestr = ' + IntToStr(DataSet.fieldByName('ID_REESTR').AsInteger) + ' ' +
                               ' and (p.DELETED_SYSTEM <> 3) ' +
                               'group by p.num_doc, p.export_day, c.name_customer, s.id_kekv, k.kekv_kode_print, b.mfo, a.rate_account, p.summa';
 ReadDataSet.Open;
  ReadDataSetGroupSum.Close;

 ReadDataSetGroupSum.SelectSQL.Text := 'select * from DOG_REE_PLAT__REP_GROUP_SM('+IntToStr(DataSet.fieldByName('ID_REESTR').AsInteger)+')';
  ReadDataSetGroupSum.Open;

 frxReport2.ShowReport();
end;
// Вариант печати для Днепродзержинска
procedure TreeForm.dxBarButton2Click(Sender: TObject);
var
 repFile : string;
 str     : string;
 i       : integer;
begin
  repFile := 'PlatRee_dnepr.fr3';
  // pFIBQuery1.Close;
  if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile);

  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  begin
    frxReport2.DesignReport;
    Exit;
  end;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Text := 'select distinct s.id_kekv, k.kekv_kode_print ' +
                               'from dog_dt_pl_ree r ' +
                               'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr) ' +
                               'left join dog_dt_pl_smet s on (p.id_key = s.id_key) ' +
                               'left join pub_spr_kekv k on (s.id_kekv = k.id_kekv and (p.export_day between k.date_beg and k.date_end)) ' +
                               'where r.id_reestr = ' + IntToStr(DataSet.fieldByName('ID_REESTR').AsInteger) + ' ' +
                               ' and (p.DELETED_SYSTEM <> 3) ' +
                               'order by k.kekv_kode_print ';
  ReadDataSet.Open;

  if ReadDataSet.RecordCount = 0 then
  begin
    ReadDataSet.Close;
    ShowMessage('Не знайдени КЕКВ.');
    exit;
  end;

  ReadDataSet.Close;

  ReadDataSet.SelectSQL.Text := 'select p.num_doc, p.export_day, p.summa, c.name_customer, b.mfo, b.name_mfo, a.rate_account,s.id_kekv, k.kekv_kode_print, p.note ' +
                                'from dog_dt_pl_ree r ' +
                                'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr) ' +
                                'left join dog_dt_pl_smet s on (p.id_key = s.id_key) ' +
                                'left join pub_sp_cust_rate_acc a on (p.id_rate_account = a.id_rate_account) ' +
                                'left join pub_spr_kekv k on (s.id_kekv = k.id_kekv and (p.export_day between k.date_beg and k.date_end)) '+
                                'left join pub_sp_customer c on (a.id_customer = c.id_customer) ' +
                                'left join pub_sp_bank b on (a.id_bank = b.id_bank) ' +
                                'where r.id_reestr = ' + IntToStr(DataSet.fieldByName('ID_REESTR').AsInteger) + ' ' +
                                ' and (p.DELETED_SYSTEM <> 3) ' +
                                'group by p.num_doc, p.export_day, c.name_customer,s.id_kekv,k.kekv_kode_print, b.mfo,b.name_mfo ,a.rate_account, p.summa, p.note';
  ReadDataSet.Open;

  frxReport2.ShowReport();
end;



procedure TreeForm.PrintReportClick(Sender: TObject);
var
 repFile : string;
 str, qqq   : string;
 i, k       : integer;
 repTarget : string;
 selected : integer;
 f : TForm;
 id_reestr : array of integer;
begin

  selected := cxGrid1DBTableView1.DataController.RecNo;
  if GoToFirstSelected(cxGrid1DBTableView1, DataSet) then repeat
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := DataSet['ID_REESTR'];
  until not GoToNextSelected(cxGrid1DBTableView1, DataSet);
  if Length(id_reestr) = 0 then begin
    ShowMessage('Виберіть хоча б один запис.');
    exit;
  end;

  repFile := 'PlatReeRep.fr3';
  pFIBQuery1.Close;
  pFIBQuery1.SQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 12';
  pFIBQuery1.ExecQuery;
  if pFIBQuery1.RecordCount <> 0 then if not VarIsNull(pFIBQuery1['REPORT_FILE'].AsVariant) then repFile := pFIBQuery1['REPORT_FILE'].AsString;
  pFIBQuery1.Close;

  if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile);

  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
  begin
   frxReport2.DesignReport;
   Exit;
  end;

  qqq:='where r.id_reestr = ';

  //frxReport2:=TfrxReport.Create(nil);

  f := WaitScreenShowWithProgress(Self, Length(id_reestr), 'Іде підготовка...');
   for k := 0 to Length(id_reestr) - 1 do begin
     if (k > 0) then qqq:= qqq + ' or r.id_reestr =  ';
     qqq:=qqq + IntToStr(id_reestr[k]);
   end;


    pFIBDataSetHeader.Close;
    pFIBDataSetHeader.SelectSQL.Text := 'select distinct r.id_reestr, r.num_reestr, r.date_reestr ' +
                                        ' from dog_dt_pl_ree r ' + qqq + ' ';
    pFIBDataSetHeader.Open;



     pFIBDataSetDet.Close;
     pFIBDataSetDet.SelectSQL.Text := 'select p.id_reestr, p.num_doc, p.export_day, p.summa, c.name_customer, b.mfo, a.rate_account, s.id_kekv, k.kekv_kode_print, p.note ' +
                                   'from dog_dt_pl_ree r ' +
                                   'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr) ' +
                                   'left join dog_dt_pl_smet s on (p.id_key = s.id_key) ' +
                                   'left join pub_sp_cust_rate_acc a on (p.id_rate_account = a.id_rate_account) ' +
                                   'left join pub_sp_customer c on (a.id_customer = c.id_customer) ' +
                                   'left join pub_sp_bank b on (a.id_bank = b.id_bank) ' +
                                   'left join pub_spr_kekv k on (s.id_kekv = k.id_kekv and (p.export_day between k.date_beg and k.date_end)) '+
                                   'where r.id_reestr = ?MAS_ID_REESTR ' +
                                   ' and (p.DELETED_SYSTEM <> 3) ' +
                                   'group by p.id_reestr, p.num_doc, p.export_day, c.name_customer, b.mfo, a.rate_account, p.summa, s.id_kekv, k.kekv_kode_print, p.note ' +
                                   'order by k.kekv_kode_print ';
     //ReadDataSet.SelectSQL.Text := Format(ReadDataSet.SelectSQL.Text, [str]);
     pFIBDataSetDet.Open;


    frxReport2.ShowReport();
    WaitScreenClose(f);
   //HalcyonDataSet1.Close;
   //cxGrid1DBTableView1.DataController.RecNo := selected;
   //ShowMessage('Експорт виконано.');
   //SetCurrentDir(storName);
end;

procedure TreeForm.dxBarLargeButtonEditClick(Sender: TObject);
var
 cnt : integer;
 f : TForm;
 frm : TEditNumDateRee;
 d : TDate;
 n : string;
 id_ree_new : int64;
begin
  frm := TEditNumDateRee.Create(Self);
  frm.cxDateEdit1.Date:= DataSet['DATE_REESTR'];
  frm.cxTextEdit1.Text:= DataSet['NUM_REESTR'];
  if (frm.ShowModal = mrOk) then
  begin
     WriteProc.Transaction.StartTransaction;
     WriteProc.ExecProcedure('PROC_DOG_DT_PL_REE_UPD', [DataSet['ID_REESTR'], frm.cxTextEdit1.Text, frm.cxDateEdit1.Date]);
     if (WriteProc['C'].AsInt64 = 0) then ShowMessage ('Зміни не виконані! Реєстр з таким номером у цьому році вже існує!');
     WriteProc.Transaction.Commit;
     id_ree_new:=StrToInt(DataSet['ID_REESTR']);
     SelectAll;
     DataSet.Locate('ID_REESTR',id_ree_new,[]);
     frm.Free;
  end;
end;

end.

