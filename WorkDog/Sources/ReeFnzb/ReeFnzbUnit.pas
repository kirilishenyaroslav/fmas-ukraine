unit ReeFnzbUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar, dxBar, dxBarExtItems, ImgList,
  cxClasses, cxTL, cxCurrencyEdit, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, iBase, cxCalc, cxButtonEdit, cxTextEdit, frxClass, frxDBSet,
  Halcn6db, DogLoaderUnit, FIBQuery, pFIBQuery, pFIBStoredProc, cxCalendar,
  ActnList, Accmgmt, cxMaskEdit, cxShellDlgs, cxShellBrowserDialog, ReeFnzbShapkaAdd,
  cxCheckBox, cxContainer, cxDropDownEdit, StdCtrls, ExtCtrls, Unit5, ReeFnzbFlt,
  cxLookAndFeelPainters, cxButtons;

type
  TfrmReeFnzb = class(TForm)
    cxStyleRepository2: TcxStyleRepository;
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
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    LargeImages: TImageList;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton_prosm: TdxBarLargeButton;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton_print: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn_date: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_r_acc: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_b_acc: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_summa_fnzb: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_sum_fact_pay: TcxGridDBColumn;
    DataSource: TDataSource;
    DataSetSel: TpFIBDataSet;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    frxDBDatasetFnzb: TfrxDBDataset;
    pFIBDataSetFnzb: TpFIBDataSet;
    frxDBDataset_fnzb_1: TfrxDBDataset;
    pFIBDataSet_fnzb_1: TpFIBDataSet;
    DataSetExportFz: TpFIBDataSet;
    DbfExportFn: THalcyonDataSet;
    NewDbfTableFnCreate: TCreateHalcyonDataSet;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton_edit: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    cbDBFPath: TdxBarCombo;
    StoredProc: TpFIBStoredProc;
    cxGrid1DBTableView1DBColumn_num: TcxGridDBColumn;
    ActionList: TActionList;
    add: TAction;
    edit: TAction;
    view: TAction;
    del: TAction;
    upd: TAction;
    print: TAction;
    frxDBDataset1: TfrxDBDataset;
    pFIBDataSet_fnzb_3: TpFIBDataSet;
    dxBarButton2: TdxBarButton;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    Q1: TpFIBQuery;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    dxBarLargeButton6: TdxBarLargeButton;
    cxShellBrowserDialog2: TcxShellBrowserDialog;
    BottomPanel: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    frxReport_fnzb: TfrxReport;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    QueryEditDate: TpFIBQuery;
    dxBarLargeButton7: TdxBarLargeButton;
    Timer1: TTimer;
    cbKod: TdxBarCombo;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure viewExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure updExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
  private
    function DiscInDrive(Drive: char): Boolean;
    { Private declarations }
  public
    fltForm1 : TFnzbFormFlt;
    DiscForOwner:string;
    DiskTree:TStringList;
    procedure SelectAll;
    { Public declarations }
  end;

  function ReeFnzb(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant; stdcall;
  exports ReeFnzb;

var
  frmReeFnzb: TfrmReeFnzb;


implementation
uses
  WSUnit,ReeFnzbData, ReeInputDate;

{$R *.dfm}
function ReeFnzb(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
var
  Per : TfrmReeFnzb;
begin
  Per := TfrmReeFnzb.Create(AOwner);
  per.WorkDatabase.Handle := DBHANDLE;
  per.ReadTransaction.Handle := RTrans;
  per.WriteTransaction.Handle := WTrans;
  per.SelectAll;

  per.WindowState:=wsMaximized;
  per.DiscForOwner:='';
    if  per.cxGrid1DBTableView1.DataController.RecordCount > 0 then
  per.cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
  
end;

procedure TfrmReeFnzb.SelectAll;
var
 kodFlag : Integer;
begin
  Q1.Close;
  Q1.SQL.Text := 'select KOD_TYPE from DOG_SYS_OPTIONS';
  Q1.ExecQuery;
  kodFlag := Q1.FldByName['KOD_TYPE'].AsInteger;
  Q1.Close;
  cbKod.ItemIndex := kodFlag;
  
  DataSetSel.Active := false;
  DataSetSel.ParamByName('DATE_BEG').AsDate:=DateBeg.Date;
  DataSetSel.ParamByName('DATE_END').AsDate:=DateEnd.Date;
  DataSetSel.ParamByName('REG_DOG').AsString:=fltForm1.RegNumEdit.Text;
  DataSetSel.ParamByName('NUM_REE').AsString:=fltForm1.NumEdit.Text;
  DataSetSel.Active := true;
  fltForm1.RegNumEdit.Text:='';       
  fltForm1.NumEdit.Text:='';
  //cxGrid1DBTableView1.ViewData.Records[0].Focused:=True;
  //cxGrid1DBTableView1.ViewData.Records[cxGrid1DBTableView1.DataController.RecordCount-1].Focused:=True;
end;

procedure TfrmReeFnzb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 SavePositionToRegistry(Self);
 Action := caFree;
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


procedure TfrmReeFnzb.cxGrid1DBTableView1DblClick(Sender: TObject);
var
  Add: TfrmFnzbData;
begin
  Add := TfrmFnzbData.Create(self, 'view', DataSetSel['ID_FNZB'],DataSetSel['rate_account_bank'],DataSetSel['rate_account'],DataSetSel['number_fnzb'], SYS_ID_USER);
end;

procedure TfrmReeFnzb.dxBarLargeButton4Click(Sender: TObject);
var
  path,dirSch,count_z: String;
  i,k,m: Integer;
  id_reestr : array of integer;
  rs : TResourceStream;
  selected : integer;
  f : TForm;
begin
  //создаем dbf-файл
  if (cbKod.CurItemIndex = 0) then DbfExportFn.TranslateASCII := True
    else DbfExportFn.TranslateASCII := False;

 selected:=cxGrid1DBTableView1.DataController.RecNo;
 if GoToFirstSelected(cxGrid1DBTableView1, DataSetSel) then repeat
  SetLength(id_reestr, Length(id_reestr) + 1);
  id_reestr[Length(id_reestr) - 1]:=DataSetSel['ID_FNZB'];
  cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRowIndex, 0]:=0;
 until not GoToNextSelected(cxGrid1DBTableView1, DataSetSel);
 if Length(id_reestr) = 0 then begin
  cxGrid1DBTableView1.DataController.RecNo:=selected;
  ShowMessage('Виберіть хоча б один запис.');
  exit;
 end;

 if (cbDBFPath.Text = 'A:\') then
 begin
   if(DiscInDrive('A') <> true) then
   begin
    ShowMessage('Невозможно произвести экспорт!');
    Exit;
   end;
 end;

 f := WaitScreenShowWithProgress(Self, Length(id_reestr), 'Іде експорт...');
 for k := 0 to Length(id_reestr) - 1 do begin
  count_z:='';
  DataSetExportFz.Close;
  DataSetExportFz.ParamByName('id_fnzb').AsInt64 := id_reestr[k];
  DataSetExportFz.ParamByName('kod_type').AsInt64 := cbKod.CurItemIndex;
  DataSetExportFz.Open;
  DataSetExportFz.FetchAll;

  for m :=1 to (5-Length(DataSetExportFz.FBN('NREE').AsString))  do
    count_z := count_z+'0';

  dirSch:=DiscForOwner+'F-'+count_z+DataSetExportFz.FBN('NREE').AsString+'-'+DataSetExportFz.FBN('RATE_ACC').AsString+'\';
  if (DiscForOwner<>'') then begin
    if DirectoryExists(DiscForOwner+dirSch)=false then
    begin
      MkDir(DiscForOwner+'F-'+count_z+DataSetExportFz['nree'].AsString+'-'+DataSetExportFz['RATE_ACC'].AsString);
    end
  end
  else
    if DirectoryExists(cbDBFPath.Text+dirSch)=false then
    begin
      MkDir(cbDBFPath.Text+'F-'+count_z+DataSetExportFz.FBN('NREE').AsString+'-'+DataSetExportFz.FBN('RATE_ACC').AsString);
    end;

  if (DiscForOwner<>'') then
  begin
    path := DiscForOwner +dirSch+ DataSetExportFz.FBN('NAME_DBF').AsString;
  end
  else
  begin
    path := cbDBFPath.Text +dirSch+ DataSetExportFz.FBN('NAME_DBF').AsString;
  end;

  DbfExportFn.Close;
  DbfExportFn.DatabaseName := ExtractFilePath(path);
  DbfExportFn.TableName := ExtractFileName(path);

  if FileExists(path) then
  begin
    if MessageBox(Handle,PChar('DBF Файл вже існує. Перезаписати?'),
   'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
    begin
      DeleteFile(path);
    end
    else
    begin
      Exit;
    end;
  end;

  if (NewDbfTableFnCreate.Execute) then
  begin
  //  ShowMessage('Файл cоздан!');
    DbfExportFn.Exclusive := true;
    DbfExportFn.Open;
  end
  else
  begin
    ShowMessage('Неможливо створити файл!');
    Exit;
  end;

  DataSetExportFz.First;

  for i := 0 to DataSetExportFz.RecordCount - 1 do
  begin
    DbfExportFn.Append;
    DbfExportFn['OP']       := DataSetExportFz.FBN('OP').AsInteger;
    DbfExportFn['NP']       := DataSetExportFz.FBN('NP').AsInteger;
    DbfExportFn['DATER']    := DataSetExportFz.FBN('DATER').AsDateTime;
    DbfExportFn['RRAX']     := DataSetExportFz.FBN('RRAX').AsString;
    DbfExportFn['KPK']      := DataSetExportFz.FBN('KPK').AsString;
    DbfExportFn['KFK']      := DataSetExportFz.FBN('KFK').AsString;
    DbfExportFn['KVK']      := DataSetExportFz.FBN('KVK').AsString;
    DbfExportFn['KPOL']     := DataSetExportFz.FBN('KPOL').AsInteger;
    DbfExportFn['KEKV']     := DataSetExportFz.FBN('KEKV').AsInteger;
    DbfExportFn['NDOC']     := DataSetExportFz.FBN('NDOC').AsString;
    DbfExportFn['DATEDOC']  := DataSetExportFz.FBN('DATEDOC').AsDateTime;
    DbfExportFn['NDOCF']    := DataSetExportFz.FBN('NDOCF').AsString;
    DbfExportFn['DATEDOCF'] := DataSetExportFz.FBN('DATEDOCF').AsDateTime;
    DbfExportFn['S']        := DataSetExportFz.FBN('S').AsCurrency;
    DbfExportFn['SO']       := DataSetExportFz.FBN('SO').AsCurrency;
    DbfExportFn['MFOK']     := DataSetExportFz.FBN('MFOK').AsInteger;
    DbfExportFn['NAZB']     := DataSetExportFz.FBN('NAZB').AsString;
    DbfExportFn['NLSK']     := DataSetExportFz.FBN('NLSK').AsString;
    DbfExportFn['EDRPOUK']  := DataSetExportFz.FBN('EDRPOUK').AsString;
    DbfExportFn['POLUT']    := DataSetExportFz.FBN('POLUT').AsString;
    DbfExportFn['SK']       := DataSetExportFz.FBN('SK').AsInteger;
    DbfExportFn['DATERZ']   := DataSetExportFz.FBN('DATERZ').AsDateTime;
    DbfExportFn['NPRZ']     := DataSetExportFz.FBN('NPRZ').AsInteger;
    DbfExportFn['EDRPOUR']  := DataSetExportFz.FBN('EDRPOUR').AsString;
    DbfExportFn['NAMER']    := DataSetExportFz.FBN('NAMER').AsString;
    DbfExportFn['BUDGET']   := DataSetExportFz.FBN('BUDGET').AsString;
    DbfExportFn['NREE']     :=  DataSetExportFz.FBN('NREE').AsInteger;
    DbfExportFn['NOTE']     := DataSetExportFz.FBN('LAST_DAY').AsDateTime;
    DbfExportFn.Post;
    DataSetExportFz.Next;
    WaitScreenStep(F);
  end;
 end;
  DbfExportFn.Exclusive := false;
  DbfExportFn.Close;
  WaitScreenClose(f);
  ShowMessage('Експорт завершено.');
  DiscForOwner:='';
end;

procedure TfrmReeFnzb.dxBarLargeButton8Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmReeFnzb.FormCreate(Sender: TObject);
begin

  fltForm1:=TFnzbFormFlt.Create(Self);
  fltForm1.RegNumEdit.Text:='';
  fltForm1.NumEdit.Text:='';
  DateBeg.Date:=DateOf(Now);
  DateEnd.Date:=DateOf(Now);

  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Add') <> 0 then dxBarLargeButton_add.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Del') <> 0 then dxBarLargeButton_del.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Edit') <> 0 then dxBarLargeButton_edit.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','View') <> 0 then dxBarLargeButton_prosm.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Print') <> 0 then dxBarLargeButton_print.Visible := ivNever;

  cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cbDBFPath.ItemIndex := 0;

  cbKod.Items.Add('CP866');
  cbKod.Items.Add('WIN1251');

end;

procedure TfrmReeFnzb.FormShow(Sender: TObject);
begin
  LoadPositionFromRegistry(Self);
end;

procedure TfrmReeFnzb.addExecute(Sender: TObject);
var
  count_ree : String;
  frm       : TfrmDateRee;
  d         : TDate;
  new_num   : integer;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Add') <> 0 then Exit;

  Q1.Close;
  Q1.SQL.Clear;
  Q1.SQL.Add('select gen_id(dog_gen_num_fnzb, 0) + 1   from rdb$database');
  Q1.ExecQuery;
  new_num := Q1.FldByName['ADD'].AsInteger;

  frm := TfrmDateRee.Create(Self);
  frm.NumEdit.Text:= IntToStr(new_num);
  if frm.ShowModal = mrCancel then Exit;
  d := frm.ReeDateEdit.Date;


  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName := 'DOG_REE_FNZB_MAKE_BY_ID_REESTR';
  StoredProc.Prepare;
  // if ((frm.cxCheckBox1.Checked) and (frm.NumEdit.Text <> '')) then
  StoredProc.ParamByName('FNZB_NUM').Value := frm.NumEdit.Text;
  // else StoredProc.ParamByName('FNZB_NUM').Value := -1;
  frm.Free;
  StoredProc.ParamByName('DATE_REE_FNZB').value := d;
  StoredProc.ParamByName('ID_USER').value := SYS_ID_USER;
  StoredProc.ParamByName('COMP_IP').value := GetIPAddress;
  try
    StoredProc.ExecProc;
  except on e: Exception do
    begin
      ShowMessage(e.Message);
      WriteTransaction.Rollback;
      Exit;
      ShowMessage('Жодного реєстру не сформовано.');
    end;
  end;
  COUNT_REE := StoredProc.FieldByName('COUNT_REE').AsString;
  WriteTransaction.Commit;
  if (StoredProc.FieldByName('COUNT_REE').AsInteger = 1) then ShowMessage ('Було створено реєстр з номером ' + StoredProc.FieldByName('NEW_NUM').AsString + '!');
  DataSetSel.First;
  SelectAll;
  //DataSetSel.First;
  ShowMessage('Сформовано ' +  COUNT_REE + ' реєстрів.');
end;

procedure TfrmReeFnzb.editExecute(Sender: TObject);
var
  Add: TfrmFnzbData;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Edit') <> 0 then Exit;
  if (not Visible) or (cxGrid1DBTableView1.DataController.RecordCount = 0) then Exit;
  Add := TfrmFnzbData.Create(self, 'edit', DataSetSel['ID_FNZB'], DataSetSel['rate_account_bank'], DataSetSel['rate_account'], DataSetSel['number_fnzb'], SYS_ID_USER);
  SelectAll;
end;

procedure TfrmReeFnzb.viewExecute(Sender: TObject);
var
  Add: TfrmFnzbData;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','View') <> 0 then Exit;
  Add := TfrmFnzbData.Create(self, 'view', DataSetSel['ID_FNZB'],DataSetSel['rate_account_bank'],DataSetSel['rate_account'],DataSetSel['number_fnzb'], SYS_ID_USER);
  SelectAll;
end;

procedure TfrmReeFnzb.delExecute(Sender: TObject);
var
  k: Integer;
  id_reestr : array of integer;
  selected : integer;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Del') <> 0 then Exit;

     selected:=cxGrid1DBTableView1.DataController.RecNo;
     if GoToFirstSelected(cxGrid1DBTableView1, DataSetSel) then repeat
      SetLength(id_reestr, Length(id_reestr) + 1);
      id_reestr[Length(id_reestr) - 1] := DataSetSel['ID_FNZB'];
      cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRowIndex, 0] := 0;
     until not GoToNextSelected(cxGrid1DBTableView1, DataSetSel);
     if Length(id_reestr) = 0 then begin
      cxGrid1DBTableView1.DataController.RecNo:=selected;
      ShowMessage('Виберіть хоча б один запис.');
      exit;
    end
    else
    if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити запис(и)?'),
        'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
     begin
        for k := 0 to Length(id_reestr) - 1 do begin
          WriteTransaction.StartTransaction;
          StoredProc.StoredProcName := 'DOG_REE_FNZB_DEL';
          StoredProc.Prepare;
          StoredProc.ParamByName('ID_FNZB').AsInt64 := id_reestr[k];
           try
             StoredProc.ExecProc;
           except on e: Exception do
             begin
               ShowMessage(e.Message);
               WriteTransaction.Rollback;
               Exit;
             end;
           end;
           WriteTransaction.Commit;
           SelectAll;
     end;
    end;

    //cxGrid1DBTableView1.DataController.FocusedRowIndex:=cxGrid1DBTableView1.DataController.RecordCount - 1;
end;

procedure TfrmReeFnzb.updExecute(Sender: TObject);
begin
  SelectAll;
end;

procedure TfrmReeFnzb.printExecute(Sender: TObject);
var
 RepFile : string;
 DataSetR: TpFIBDataSet;
begin
   if fibCheckPermission('/ROOT/DOG/SPRAV/FNZB','Print') <> 0 then Exit;

   RepFile := '';
   DataSetR := TpFIBDataSet.Create(Self);
   DataSetR.Database := WorkDatabase;
   DataSetR.Transaction := ReadTransaction;
   DataSetR.SQLs.SelectSQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 8';
   DataSetR.Active := true;
   if  DataSetR.RecordCount <> 0 then if not VarIsNull( DataSetR.FBN('REPORT_FILE').AsVariant) then repFile :=  DataSetR.FBN('REPORT_FILE').AsString;
   DataSetR.Active := false;
   DataSetR.Free;


   DataSetR := TpFIBDataSet.Create(Self);
   DataSetR.Database := WorkDatabase;
   DataSetR.Transaction := ReadTransaction;
   DataSetR.SQLs.SelectSQL.Text := 'select REEZB_UDK,REEZB_NAME_UDK,REEZB_BUDGET,REEZB_NAME_BUDGET,REEZB_KVK,REEZB_NAME_KVK,REEEZB_KOD_GRANTEE,REEZB_DEGREE_CLIENT,REEZB_CLIENT_NAME from DOG_SYS_OPTIONS';
   DataSetR.Active := false;
   DataSetR.Active := true;


   if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then
   begin
       frxReport_fnzb.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile);
       frxReport_fnzb.Variables['REEZB_UDK']:=QuotedStr(DataSetR['REEZB_UDK']);
       frxReport_fnzb.Variables['REEZB_NAME_UDK']:=QuotedStr(DataSetR['REEZB_NAME_UDK']);
       frxReport_fnzb.Variables['REEZB_BUDGET']:=QuotedStr(DataSetR['REEZB_BUDGET']);
       frxReport_fnzb.Variables['REEZB_NAME_BUDGET']:=QuotedStr(DataSetR['REEZB_NAME_BUDGET']);
       frxReport_fnzb.Variables['REEZB_KVK']:=QuotedStr(DataSetR['REEZB_KVK']);
       frxReport_fnzb.Variables['REEZB_NAME_KVK']:=QuotedStr(DataSetR['REEZB_NAME_KVK']);
       frxReport_fnzb.Variables['REEEZB_KOD_GRANTEE']:=QuotedStr(DataSetR['REEEZB_KOD_GRANTEE']);
       frxReport_fnzb.Variables['REEZB_DEGREE_CLIENT']:=QuotedStr(DataSetR['REEZB_DEGREE_CLIENT']);
       frxReport_fnzb.Variables['REEZB_CLIENT_NAME']:=QuotedStr(DataSetR['REEZB_CLIENT_NAME']);

       DataSetR.Close;
       DataSetR.Prepare;
       DataSetR.SQLs.SelectSQL.Clear;
       DataSetR.SQLs.SelectSQL.Text := 'select Kod_EDRPOU from pub_sp_customer p where p.id_customer = (select Organization from pub_sys_data)';
       DataSetR.Active := false;
       DataSetR.Active := true;

       frxReport_fnzb.Variables['REEZB_EDRPOU']:=QuotedStr(DataSetR['Kod_EDRPOU']);

       DataSetR.Free;
       {
      REEZB_UDK - УДК
      REEZB_NAME_UDK - Назва УДК
      REEZB_BUDGET- бюджет
      REEZB_NAME_BUDGET - назва бюджета
      REEZB_KVK - КВК
      REEZB_NAME_KVK - назва КВк
      REEEZB_KOD_GRANTEE - код получателя
      REEZB_DEGREE_CLIENT - степень клиента
      REEZB_CLIENT_NAME - название роспорядителя средств
       }
   end
   else
   begin
     ShowMessage('Файл звіту "' + repFile + '" не знайден!');
     DataSetR.Free;
     exit;
   end;

   pFIBDataSetFnzb.Active := false;
   pFIBDataSetFnzb.ParamByName('id_fnzb').AsInt64 :=  DataSetSel['ID_FNZB'];
   pFIBDataSetFnzb.Active := true;

   pFIBDataSet_fnzb_1.Active := false;
   pFIBDataSet_fnzb_1.ParamByName('id_fnzb').AsInt64 :=  DataSetSel['ID_FNZB'];
   pFIBDataSet_fnzb_1.ParamByName('id_user').AsInt64 := SYS_ID_USER;
   pFIBDataSet_fnzb_1.Active := true;

   pFIBDataSet_fnzb_3.Active:=false;
   pFIBDataSet_fnzb_3.ParamByName('id_fnzb').AsInt64 :=  DataSetSel['ID_FNZB'];
   pFIBDataSet_fnzb_3.Active := true;

   if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
    frxReport_fnzb.DesignReport
   else frxReport_fnzb.ShowReport;

   pFIBDataSet_fnzb_1.Active := false;
   pFIBDataSetFnzb.Active    := false;

end;

procedure TfrmReeFnzb.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = Vk_return then
  begin
    viewExecute(Self);
  end;
end;

procedure TfrmReeFnzb.dxBarButton2Click(Sender: TObject);
begin
 if (cxShellBrowserDialog1.Execute = true) then
 begin
  cbDBFPath.Text:= cxShellBrowserDialog1.Path;
 end;
end;
// -----------------------------------------------------------------------------
// Добавление отдельной шапки Фин. обязательств
procedure TfrmReeFnzb.dxBarLargeButton3Click(Sender: TObject);
var
 frm : TfrmFnzbShapkaAdd;
 id_fnzb : Variant;
 new_num : integer;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Add') <> 0 then Exit;

 Q1.Close;
 Q1.SQL.Clear;
 Q1.SQL.Add('select gen_id(dog_gen_num_fnzb, 0) + 1 from rdb$database');
 Q1.ExecQuery;

 new_num := Q1.FldByName['ADD'].AsInteger;

 frm := TfrmFnzbShapkaAdd.Create(Self);
 frm.NumEdit.Text:= IntToStr(new_num);

 if frm.ShowModal = mrYes then
 begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'DOG_REE_FNZB_INSERT';
   StoredProc.ParamByName('ID_RATE_ACC').AsInt64 := frm.id_rate_acc;
   StoredProc.ParamByName('DATE_FNZB').Value := frm.cxDateEdit_urzb.Date;
   StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
   StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
   //if ((frm.cxCheckBox1.Checked) and (frm.NumEdit.Text <> '')) then
   StoredProc.ParamByName('FNZB_NUM').Value := frm.NumEdit.Text;
   //else StoredProc.ParamByName('FNZB_NUM').Value := -1;
   try
    StoredProc.ExecProc;
   except on e: Exception do
     begin
       ShowMessage(e.Message);
       StoredProc.Transaction.Rollback;
       frm.Free;
       Exit;
     end;
   end;
   StoredProc.Transaction.Commit;
   if (StoredProc.FieldByName('P').AsInteger = 1) then ShowMessage ('Було створено реєстр з номером ' + StoredProc.FieldByName('NEW_NUM').AsString + '!');
   SelectAll;
   datasetsel.First;
   id_fnzb := StoredProc.ParamByName('id_fnzb').AsVariant;
   DataSetSel.Locate('id_fnzb', id_fnzb, []);
   editExecute(Self);
 end;
 frm.Free;
end;

function TfrmReeFnzb.DiscInDrive(Drive: char): Boolean;
var
  ErrorMode: Word;
begin
  ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
  try
    if DiskSize(Ord(Drive) - $40) = -1 then
      Result := False
    else
      Result := True;
  finally
    SetErrorMode(ErrorMode);
  end;
end;

procedure TfrmReeFnzb.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 AHandled := false;
 if ACellViewInfo.Item.Index <> 0 then exit;
 if Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] = 1 then
  Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] := 0
 else
  Sender.DataController.Values[Sender.DataController.FocusedRecordIndex, 0] := 1;
 AHandled := true;
end;
//!


// Процедура импорта финансовых обязательств
procedure TfrmReeFnzb.dxBarLargeButton6Click(Sender: TObject);
var
 cImportItemsCount,i : Integer;
 cImportPath : string;
 cImportFileName : string;
begin
 StoredProc.Close;
 StoredProc.StoredProcName:='DOG_REE_FNZB_IMPORT';

 // Определяем путь к старому каталогу
 if (cxShellBrowserDialog2.Execute = true) then
 begin
  cImportPath := cxShellBrowserDialog2.Path;
 end;
 // Проверяем наличие нужных dbf:
 // Urzb.dbf

 cImportFileName := cImportPath + '\f009f.dbf';
 if FileExists(cImportFileName) <> true then
 begin
   ShowMessage('Отсутствуют файлы для импорта!');
   Exit;
 end;

 // Импорт относительно реестров
 DbfExportFn.Close;
 DbfExportFn.DatabaseName := ExtractFilePath(cImportFileName);
 DbfExportFn.TableName := ExtractFileName(cImportFileName);
 DbfExportFn.Open;

 cImportItemsCount := DbfExportFn.RecordCount;
 DbfExportFn.First;
 // Забираем данные из реестров и вставляем
 for i:=0 to cImportItemsCount - 1 do
 begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='DOG_REE_FNZB_IMPORT';
  StoredProc.Prepare;
  StoredProc.ParamByName('NP').AsInteger := DbfExportFn.FieldByName('NP').AsInteger;
  StoredProc.ParamByName('DATER').AsDate := DbfExportFn.FieldByName('DATER').AsDateTime;
  StoredProc.ParamByName('RRAX').AsString := DbfExportFn.FieldByName('RRAX').AsString;
  StoredProc.ParamByName('KPK').AsString := DbfExportFn.FieldByName('KPK').AsString;
  StoredProc.ParamByName('KPOL').AsInteger := DbfExportFn.FieldByName('KPOL').AsInteger;
  StoredProc.ParamByName('KVK').AsString := DbfExportFn.FieldByName('KVK').AsString;
  StoredProc.ParamByName('KEKV').AsInteger := DbfExportFn.FieldByName('KEKV').AsInteger;
  StoredProc.ParamByName('DATEDOC').AsDate := DbfExportFn.FieldByName('DATEDOC').AsDateTime;
  StoredProc.ParamByName('NDOC').AsString := DbfExportFn.FieldByName('NDOC').AsString;
  StoredProc.ParamByName('S').AsCurrency := DbfExportFn.FieldByName('S').AsCurrency;
  StoredProc.ParamByName('DATEDOCF').AsDate := DbfExportFn.FieldByName('DATEDOCF').AsDateTime;
  StoredProc.ParamByName('NDOCF').AsString := DbfExportFn.FieldByName('NDOCF').AsString;
  StoredProc.ParamByName('EDRPOUK').AsString := DbfExportFn.FieldByName('EDRPOUK').AsString;
  StoredProc.ParamByName('POLUT').AsString := DbfExportFn.FieldByName('POLUT').AsString;
  StoredProc.ParamByName('NAZB').AsString := DbfExportFn.FieldByName('NAZB').AsString;
  StoredProc.ParamByName('MFOK').AsInteger := DbfExportFn.FieldByName('MFOK').AsInteger;
  StoredProc.ParamByName('NLSK').AsString := DbfExportFn.FieldByName('NLSK').AsString;
  StoredProc.ParamByName('DATERZ').AsDate := DbfExportFn.FieldByName('DATERZ').AsDateTime;
  StoredProc.ParamByName('NPRZ').AsInteger := DbfExportFn.FieldByName('NPRZ').AsInteger;
  StoredProc.ParamByName('SK').AsInteger := DbfExportFn.FieldByName('SK').AsInteger;
  StoredProc.ParamByName('SO').AsCurrency := DbfExportFn.FieldByName('SO').AsCurrency;
  StoredProc.ParamByName('BUDGET').AsString := DbfExportFn.FieldByName('BUDGET').AsString;
  StoredProc.ParamByName('NREE').AsInteger := DbfExportFn.FieldByName('NREE').AsInteger;
  StoredProc.ParamByName('NAMER').AsString := DbfExportFn.FieldByName('NAMER').AsString;

  StoredProc.ExecProc;

  DbfExportFn.Next;
 end;
 ShowMessage('Імпорт виконано успішно!');
 StoredProc.Transaction.Commit;
 StoredProc.Close;
 DbfExportFn.Close;
 Q1.Close;
end;

procedure TfrmReeFnzb.dxBarButton3Click(Sender: TObject);
  var formEditDate :TForm5;
  id:integer;
begin
  //Гребенник 20.06.13
  formEditDate:= TForm5.Create(self);
  formEditDate.DateEdit.Date:= DataSetSel['DATE_FNZB'];
  formEditDate.Num_edit.EditValue:= DataSetSel['NUMBER_FNZB'];
  if (formEditDate.ShowModal=mrYes) then
  begin
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'PROC_DOG_REE_FNZB_UPD';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_FNZB').AsInt64 := DataSetSel['ID_FNZB'];
    StoredProc.ParamByName('DATE_FNZB').AsDateTime := formEditDate.DateEdit.Date;
    StoredProc.ParamByName('NUMBER_FNZB').AsInteger := formEditDate.Num_edit.EditValue;
    StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
    StoredProc.ParamByName('COMP_IP').AsString:= GetIPAddress;
    //QueryEditDate.Transaction.StartTransaction;
    //QueryEditDate.SQL.Text:='update DOG_REE_FNZB set DATE_FNZB = '''+ formEditDate.DateEdit.Text+''', NUMBER_FNZB = '+IntToStr(formEditDate.Num_edit.EditValue)+' where ID_FNZB = '+ IntToStr(DataSetSel['ID_FNZB']);
    //QueryEditDate.ExecQuery;
    //QueryEditDate.Transaction.Commit;
    try
      StoredProc.ExecProc;
    except on e: Exception do
      begin
        ShowMessage(e.Message);
        WriteTransaction.Rollback;
        Exit;
      end;
    end;
    WriteTransaction.Commit;
    if (StoredProc.FieldByName('C').AsInteger = 0) then ShowMessage ('Зміни не виконані! Реєстр з таким номером у цьому році вже існує!');
    id:=DataSetSel['ID_FNZB'];
    SelectAll;
    DataSetSel.Locate('ID_FNZB',id,[]);
  end;
end;

procedure TfrmReeFnzb.Timer1Timer(Sender: TObject);
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
 DiskTree.Add('D:\');

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

procedure TfrmReeFnzb.dxBarLargeButton7Click(Sender: TObject);
begin
    fltForm1 := TFnzbFormFlt.Create(Self);
    fltForm1.ShowModal;
    SelectAll;
end;

procedure TfrmReeFnzb.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect: TRect;
begin
  Arect := AViewInfo.Bounds;
  ACanvas.Canvas.Font.Color := clBlack;
  ACanvas.Canvas.Font.Style := [];
  ACanvas.Canvas.FillRect(Arect);
end;

procedure TfrmReeFnzb.cxButton1Click(Sender: TObject);
var
 s : string;
 user_name : string;
begin
 if DataSetSel.RecordCount = 0 then Exit;
 Q1.Close;
 Q1.SQL.Text := 'select full_name from users where id_user = ' + IntToStr(DataSetSel['EDIT_USER']);
 Q1.ExecQuery;
 user_name := Q1.FldByName['full_name'].AsString;
 Q1.Close;
 s := 'Користувач: ' + user_name + #13 + 'Комп''ютер: ' + ifNull(DataSetSel['EDIT_COMP'], '') + #13 + 'Додано: ';
 if not VarIsNull(DataSetSel.fieldbyName('EDIT_TIME').AsVariant) then s := s + DateTimeToStr(DataSetSel.fieldbyName('EDIT_TIME').AsDateTime);
 agShowMessage(s);
end;

end.
