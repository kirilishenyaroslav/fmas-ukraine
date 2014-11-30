unit ReeUrzbUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxTL, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, dxStatusBar, dxBarExtItems, dxBar, ImgList, iBase,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxTextEdit, cxCurrencyEdit, cxButtonEdit, frxClass,
  frxDBSet, Halcn6db, cxCalc, DogLoaderUnit, ActnList, Accmgmt, frxDesgn,
  cxShellDlgs, cxShellBrowserDialog, cxCheckBox, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, ExtCtrls, Menus, Unit4, fltReeUrzbUnit,
  cxLookAndFeelPainters, cxButtons;

type
  TfrmReeUrzb = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    dxStatusBar1: TdxStatusBar;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton_add: TdxBarLargeButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    WorkDatabase: TpFIBDatabase;
    DataSetSel: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    StoredProc: TpFIBStoredProc;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton_print: TdxBarLargeButton;
    frxDBDataset_urzb: TfrxDBDataset;
    DataSet_urzb_rep: TpFIBDataSet;
    DataSet_urzb_rep_1: TpFIBDataSet;
    frxDataset_urzb_1: TfrxDBDataset;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    DbfExport: THalcyonDataSet;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    NewDbfTableCreate: TCreateHalcyonDataSet;
    DataSetExport: TpFIBDataSet;
    dxBarLargeButton_edit: TdxBarLargeButton;
    dxBarLargeButton_view: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    cbDBFPath: TdxBarCombo;
    dxBarLargeButton6: TdxBarLargeButton;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    ActionList: TActionList;
    add: TAction;
    edit: TAction;
    view: TAction;
    del: TAction;
    upd: TAction;
    print: TAction;
    frxDesigner1: TfrxDesigner;
    DataSet_urzb_rep_2: TpFIBDataSet;
    frxDataset_urzb_2: TfrxDBDataset;
    dxBarButton2: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    Q1: TpFIBQuery;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    cxShellBrowserDialog2: TcxShellBrowserDialog;
    dxBarButton5: TdxBarButton;
    dxBarListItem1: TdxBarListItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxBarButton6: TdxBarButton;
    QueryEditDate: TpFIBQuery;
    Timer1: TTimer;
    fltUrzb: TdxBarLargeButton;
    frxReport1: TfrxReport;
    frxReport_urzb: TfrxReport;
    dxBarListItem2: TdxBarListItem;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn10: TcxGridDBColumn;
    dxBarButton7: TdxBarButton;
    cbKod: TdxBarCombo;
    GroupBox1: TGroupBox;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure viewExecute(Sender: TObject);
    procedure updExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarButton3Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure DateBegPropertiesEditValueChanged(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure fltUrzbClick(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
  private
    function DiscInDrive(Drive: char): Boolean;
    { Private declarations }

    procedure GetParametrsForReport(IDRateAcc: Int64 ;RateAcc: String);
  public
    fltForm1 : TfltReeUrzb;
    DiscForOwner:string;
    DiskTree:TStringList;
    flt_date1, flt_date2 : TDate;
    number_urzb, n_dog, regest_num : string;
    summa_urzb1, summa_urzb2, summa1, summa2 : Currency;
    CheckDateRee, CheckNumDog, CheckSumRee, CheckRegNum, CheckReeNumDog, CheckDogSum : Boolean;
    procedure SelectAll;

  end;

  function ReeUrzb(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant; stdcall;
  exports ReeUrzb;

var
  frmReeUrzb: TfrmReeUrzb;
    KPKKod :String;// Код КПК/КТКВМБ
    KVKKod :String;// Код КВК
    FondKod:String;// Код Фонд

    KPKName :String;// Название КПК/КТКВМБ
    KVKName :String;// Название КВК
    FondName:String;// Название Фонд


implementation
uses
  WSUnit, ReeUrzbAddUnit, ReeUrzbDogUnit, DateUtils, DateReeChangeUnit;

{$R *.dfm}

function ReeUrzb(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant;
var
  Per : TfrmReeUrzb;
begin
  Per := TfrmReeUrzb.Create(AOwner);
  per.WorkDatabase.Handle := DBHANDLE;
  per.ReadTransaction.Handle := RTrans;
  per.WriteTransaction.Handle := WTrans;
  per.SelectAll;
  per.WindowState:=wsMaximized;
  per.DiscForOwner:='';

  if  per.cxGrid1DBTableView1.DataController.RecordCount > 0 then
  per.cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
// ShowMessage('#  function ReeUrzb Finish');
end;

procedure TfrmReeUrzb.SelectAll;
var
 s, f : string;
 kodFlag : Integer;
begin
  Q1.Close;
  Q1.SQL.Text := 'select KOD_TYPE from DOG_SYS_OPTIONS';
  Q1.ExecQuery;
  kodFlag := Q1.FldByName['KOD_TYPE'].AsInteger;
  Q1.Close;
  cbKod.ItemIndex := kodFlag;

  DecimalSeparator := '.';
//f := WaitScreenShow(Self);
//if WorkDatabase.Connected then
//begin
  DataSetSel.Close;;
  s := '';
  f:='';

  if fltForm1.cxCheckDateRee.Checked then
    s := s + ' and (z.DATE_URZB >= ''' + DateToStr(flt_date1) + ''') and (z.DATE_URZB <= ''' + DateToStr(flt_date2) + ''')';

  if fltForm1.cxCheckRegNum.Checked then
  s := s + ' and z.NUMBER_URZB = ' + number_urzb + '';
  //else DataSetSel.ParamByName('NUM_REE').AsInteger := -1;

  if fltForm1.cxCheckSumRee.Checked then
  s := s + ' and z.SUMMA_URZB >= ' + FormatFloat('0.00', summa_urzb1) + ' and z.SUMMA_URZB <= ' + FormatFloat('0.00', summa_urzb2) + '';
  //DataSetSel.ParamByName('NUM_REE').AsInteger := StrToInt(fltForm1.cxTextEditNumRee.EditValue);
  //else DataSetSel.ParamByName('NUM_REE').AsInteger := '';

  if fltForm1.cxCheckNumDog.Checked then
  begin
    s := s + ' and ud.N_DOG = ''' + n_dog + '''';
    f:= f + ' , dog_ree_urzb_data ud ';
    s:= s + ' and z.id_urzb = ud.id_urzb ';
  end;

  if fltForm1.cxCheckReeNumDog.Checked then
  s := s + ' and d.REGEST_NUM = ''' + regest_num + '''';

  if fltForm1.cxCheckDogSum.Checked then
  begin
    s := s + ' and ud.SUMMA >= ' + FormatFloat('0.00', summa1) + ' and ud.SUMMA <= ' + FormatFloat('0.00', summa2) + '';
    f:= f + ' , dog_ree_urzb_data ud ';
    s:= s + ' and z.id_urzb = ud.id_urzb ';
  end;

  if (fltForm1.cxCheckReeNumDog.Checked) then
  begin
         f:= f + ' , dog_dt_document d, dog_ree_urzb_data ud ';
         s:= s + ' and d.id_dog = ud.id_dog and z.id_urzb = ud.id_urzb ';
  end;
  //ShowMessage(s);
  DataSetSel.ParamByName('WHERE_COND').AsString := s;
  DataSetSel.ParamByName('FROM_COND').AsString := f;
  DataSetSel.Open;
  cxGrid1DBTableView1.ViewData.Records[0].Focused:=True;
  //cxGrid1DBTableView1.ViewData.Records[cxGrid1DBTableView1.DataController.RecordCount-1].Focused:=True;
 //end;
 //WaitScreenClose(f);
end;

procedure TfrmReeUrzb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SavePositionToRegistry(Self);
  Action := caFree;
end;

procedure TfrmReeUrzb.dxBarLargeButton2Click(Sender: TObject);
begin
  Close;
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

procedure TfrmReeUrzb.cxGrid1DBTableView1DblClick(Sender: TObject);
var
  Add: TfrmUrzbDog;
begin
  Add := TfrmUrzbDog.Create(self, 'view', DataSetSel['ID_URZB']);
//  Add.SelectAll;
//  Add.ShowModal;
//  Add.Free;
//  SelectAll;
end;

procedure TfrmReeUrzb.dxBarLargeButton4Click(Sender: TObject);
var
  path : String;
  dirSch, count_z : String;
  i, k, m : Integer;
  id_reestr : array of integer;
  rs : TResourceStream;
  selected : integer;
  f : TForm;
  error_mes_note : String;
begin
  if (cbKod.CurItemIndex = 0) then DbfExport.TranslateASCII := True
    else DbfExport.TranslateASCII := False;

  selected := cxGrid1DBTableView1.DataController.RecNo;
  if GoToFirstSelected(cxGrid1DBTableView1, DataSetSel) then repeat
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := DataSetSel['ID_URZB'];
    cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRowIndex, 0] := 0;
  until not GoToNextSelected(cxGrid1DBTableView1, DataSetSel);
 if Length(id_reestr) = 0 then begin
    cxGrid1DBTableView1.DataController.RecNo := selected;
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
 count_z := '';
 DataSetExport.Close;
 DataSetExport.ParamByName('id_urzb').AsInt64 := id_reestr[k];// DataSetSel['ID_URZB'];
 DataSetExport.ParamByName('kod_type').AsInt64 := cbKod.CurItemIndex;
 DataSetExport.Open;
 DataSetExport.FetchAll;

   for m :=1 to (5-Length(DataSetExport.FBN('NREE').AsString))  do
      count_z := count_z+'0';


 dirSch:=DiscForOwner+'U-'+count_z+DataSetExport.FBN('NREE').AsString+'-'+DataSetExport.FBN('RATE_ACC').AsString+'\';
 if (DiscForOwner<>'') then begin
    if DirectoryExists(DiscForOwner+dirSch)=false then
    begin
      MkDir(DiscForOwner+'U-'+count_z+DataSetExport['nree'].AsString+'-'+DataSetExport['RATE_ACC'].AsString);
    end
  end
  else
    if DirectoryExists(cbDBFPath.Text+dirSch)=false then
    begin
      MkDir(cbDBFPath.Text+'U-'+count_z+DataSetExport.FBN('NREE').AsString+'-'+DataSetExport.FBN('RATE_ACC').AsString);
    end;

  if (DiscForOwner<>'') then
  begin
    path := DiscForOwner +dirSch+ DataSetExport.FBN('NAME_DBF').AsString;
  end
  else
  begin
    path := cbDBFPath.Text +dirSch+ DataSetExport.FBN('NAME_DBF').AsString;
  end;

 //path := dirSch+'\'+DataSetExport.FBN('NAME_DBF').AsString;
 //if DirectoryExists(dirSch)=false then
    //begin
      //MkDir(dirSch);
   // end ;

 DbfExport.Close;
 DbfExport.DatabaseName := ExtractFilePath(path);
 DbfExport.TableName := ExtractFileName(path);

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


  if (NewDbfTableCreate.Execute) then
  begin
    DbfExport.Exclusive := true;
    DbfExport.Open;
  end
  else
  begin
    ShowMessage('Неможливо створити файл!');
    Exit;
  end;

  //f := WaitScreenShowWithProgress(Self, Length(id_reestr), 'Іде експорт...');
  //for k := 0 to Length(id_reestr) - 1 do begin
  //DataSetExport.Close;
  //DataSetExport.ParamByName('id_urzb').AsInt64 := id_reestr[k];// DataSetSel['ID_URZB'];
  //DataSetExport.Open;
  //DataSetExport.FetchAll;
  DataSetExport.First;

  for i := 0 to DataSetExport.RecordCount - 1 do
  begin
    DbfExport.Append;
    DbfExport['OP'] := DataSetExport.FBN('OP').AsInteger;
    DbfExport['NP'] := DataSetExport.FBN('NP').AsInteger;
    DbfExport['DATER'] := DataSetExport.FBN('DATER').AsDateTime;
    DbfExport['RRAX'] := DataSetExport.FBN('RRAX').AsString;
    DbfExport['KPK'] := StrToInt(DataSetExport.FBN('KPK').AsString);
    DbfExport['KFK'] := StrToInt(DataSetExport.FBN('KFK').AsString);
    DbfExport['KVK'] := StrToInt(DataSetExport.FBN('KVK').AsString);
    DbfExport['KPOL'] := DataSetExport.FBN('KPOL').AsInteger;
    DbfExport['KEKV'] := DataSetExport.FBN('KEKV').AsInteger;
    DbfExport['NDOC'] := DataSetExport.FBN('NDOC').AsString;
    DbfExport['DATEDOC'] := DataSetExport.FBN('DATEDOC').AsDateTime;
    DbfExport['S'] := DataSetExport.FBN('S').AsCurrency;
    DbfExport['SO'] := DataSetExport.FBN('SO').AsCurrency;
    DbfExport['EDRPOUK'] := DataSetExport.FBN('EDRPOUK').AsString;
    DbfExport['POLUT'] := DataSetExport.FBN('POLUT').AsString;
    DbfExport['DATETERM'] := DataSetExport.FBN('DATETERM').AsDateTime;
    DbfExport['SK'] := DataSetExport.FBN('SK').AsInteger;
    DbfExport['EDRPOUR'] := DataSetExport.FBN('EDRPOUR').AsString;
    DbfExport['NAMER'] := DataSetExport.FBN('NAMER').AsString;
    DbfExport['NOTE'] := DataSetExport.FBN('NOTE').AsString;
    DbfExport['BUDGET'] := DataSetExport.FBN('BUDGET').AsString;
    DbfExport['NREE'] := DataSetExport.FBN('NREE').AsInteger;
    DbfExport['DATEPOCH'] := DataSetExport.FBN('DATEPOCH').AsDateTime;
    DbfExport['OZNTN'] := DataSetExport.FBN('OZNTN').AsString;
    error_mes_note := DataSetExport.FBN('error_mes_note').AsString;
    if(error_mes_note <> '0') then ShowMessage('У реєстрі '+VarToStr(DataSetExport.FBN('NREE').AsInteger)+' примітка була обрізана до 20 символів.');
    DbfExport.Post;
    DataSetExport.Next;
    WaitScreenStep(F);
  end;
 end;
  DbfExport.Exclusive := false;
  DbfExport.Close;
  WaitScreenClose(f);
  ShowMessage('Експорт завершено.');
end;

procedure TfrmReeUrzb.FormCreate(Sender: TObject);
begin
  fltForm1:=TfltReeUrzb.Create(Self);
  fltForm1.cxCheckDateRee.Checked:=true;
  CheckDateRee:=true;
  flt_date1:=DateOf(Now);
  flt_date2:=DateOf(Now);
  number_urzb:='';
  n_dog:='';
  regest_num:='';
  summa_urzb1:=0;
  summa_urzb2:=0;
  summa1:=0;
  summa2:=0;
  //DateBeg.Date:=DateOf(Now);

  if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Add') <> 0 then dxBarLargeButton_add.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Del') <> 0 then dxBarLargeButton_del.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Edit') <> 0 then dxBarLargeButton_edit.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','View') <> 0 then dxBarLargeButton_view.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Print') <> 0 then dxBarLargeButton_print.Visible := ivNever;

  cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cbDBFPath.ItemIndex := 0;

  cbKod.Items.Add('CP866');
  cbKod.Items.Add('WIN1251');
end;

procedure TfrmReeUrzb.FormShow(Sender: TObject);
begin
  LoadPositionFromRegistry(Self);
end;

procedure TfrmReeUrzb.dxBarLargeButton6Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmReeUrzb.addExecute(Sender: TObject);
var
 frm : TfrmUrzbAdd;
 id_urzb : Variant;
 new_num : integer;
begin
 if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Add') <> 0 then Exit;
 Q1.Close;
 Q1.SQL.Clear;
 Q1.SQL.Add('select gen_id(dog_gen_num_urzb, 0) + 1 from rdb$database');
 Q1.ExecQuery;
 new_num := Q1.FldByName['ADD'].AsInteger;

 frm := TfrmUrzbAdd.Create(Self);
 //frm.cxDateEdit_urzb.Date:=DateBeg.Date;
 frm.NumEdit.Text:= IntToStr(new_num);

 if frm.ShowModal = mrYes then
 begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'DOG_REE_URZB_INSERT';
   StoredProc.ParamByName('ID_RATE_ACC').AsInt64 := frm.id_rate_acc;
   StoredProc.ParamByName('DATE_URZB').Value := frm.cxDateEdit_urzb.Date;
   //if ((frm.cxCheckBox1.Checked) and (frm.NumEdit.Text <> '')) then
       StoredProc.ParamByName('URZB_NUM').Value := frm.NumEdit.Text;
   //else StoredProc.ParamByName('FNZB_NUM').Value := -1;
   StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
   StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
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
   fltForm1.cxCheckDateRee.Checked := True;
   fltForm1.cxDateEdit1.Date := frm.cxDateEdit_urzb.Date;
   fltForm1.cxDateEdit2.Date := frm.cxDateEdit_urzb.Date;
   fltForm1.cxCheckSumRee.Checked := False;
   fltForm1.cxCheckRegNum.Checked := False;
   fltForm1.cxCheckNumDog.Checked := False;
   fltForm1.cxCheckReeNumDog.Checked := False;
   fltForm1.cxCheckDogSum.Checked := False;
   SelectAll;
   datasetsel.First;
   id_urzb := StoredProc.ParamByName('id_urzb').AsVariant;
   DataSetSel.Locate('id_urzb', id_urzb, []);
   //добавление данных под шапку
   editExecute(Self);
 end;
 frm.Free;
end;

procedure TfrmReeUrzb.editExecute(Sender: TObject);
var
  Add: TfrmUrzbDog;
  id_urzb : Integer;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Edit') <> 0 then Exit;
  id_urzb := DataSetSel['ID_URZB'];
  Add := TfrmUrzbDog.Create(self, 'edit', DataSetSel['ID_URZB']);
  SelectAll;
  DataSetSel.Locate('id_urzb', id_urzb, [] );
end;

procedure TfrmReeUrzb.delExecute(Sender: TObject);
var
  k: Integer;
  id_reestr : array of integer;
  selected : integer;
begin
 if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Del') <> 0 then Exit;

   selected := cxGrid1DBTableView1.DataController.RecNo;
  if GoToFirstSelected(cxGrid1DBTableView1, DataSetSel) then repeat
    SetLength(id_reestr, Length(id_reestr) + 1);
    id_reestr[Length(id_reestr) - 1] := DataSetSel['ID_URZB'];
    cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRowIndex, 0] := 0;
  until not GoToNextSelected(cxGrid1DBTableView1, DataSetSel);
   if Length(id_reestr) = 0 then begin
      cxGrid1DBTableView1.DataController.RecNo := selected;
      ShowMessage('Виберіть хоча б один запис.');
      exit;
    end
  else
  if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити запис(и)?'),
      'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
   begin
      for k := 0 to Length(id_reestr) - 1 do begin
        WriteTransaction.StartTransaction;
        StoredProc.StoredProcName := 'DOG_REE_URZB_DELETE';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_URZB').AsInt64 := id_reestr[k];
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
  cxGrid1DBTableView1.DataController.FocusedRowIndex:=cxGrid1DBTableView1.DataController.RecordCount - 1;
end;

procedure TfrmReeUrzb.viewExecute(Sender: TObject);
var
  Add: TfrmUrzbDog;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','View') <> 0 then Exit;
  Add := TfrmUrzbDog.Create(self, 'view',DataSetSel['ID_URZB']);
  SelectAll;
end;

procedure TfrmReeUrzb.updExecute(Sender: TObject);
begin
  fltForm1.cxCheckDateRee.Checked := True;
  flt_date1 := DateOf(now);
  flt_date2 := DateOf(now);
  fltForm1.cxCheckSumRee.Checked := False;
  fltForm1.cxCheckRegNum.Checked := False;
  fltForm1.cxCheckNumDog.Checked := False;
  fltForm1.cxCheckReeNumDog.Checked := False;
  fltForm1.cxCheckDogSum.Checked := False;
  number_urzb:='';
  n_dog:='';
  regest_num:='';
  summa_urzb1:=0;
  summa_urzb2:=0;
  summa1:=0;
  summa2:=0;
  SelectAll;
end;

procedure TfrmReeUrzb.printExecute(Sender: TObject);
var
 RepFile : string;
 DataSetR: TpFIBDataSet;
begin
 if fibCheckPermission('/ROOT/DOG/SPRAV/URZB','Print') <> 0 then Exit;
      //frxDataset_urzb_2."MFO2
 RepFile := '';
 DataSetR := TpFIBDataSet.Create(Self);
 DataSetR.Database := WorkDatabase;
 DataSetR.Transaction := ReadTransaction;
 DataSetR.SQLs.SelectSQL.Text := 'select REPORT_FILE from dog_ini_reports where id_report = 7';
 DataSetR.Active := true;
 if  DataSetR.RecordCount <> 0 then if not VarIsNull( DataSetR.FBN('REPORT_FILE').AsVariant) then repFile :=  DataSetR.FBN('REPORT_FILE').AsString;
 DataSetR.Active := false;
 DataSetR.Free;

 DataSetR := TpFIBDataSet.Create(Self);
 DataSetR.Database := WorkDatabase;
 DataSetR.Transaction := ReadTransaction;
 DataSetR.SQLs.SelectSQL.Text := 'select REEZB_UDK,REEZB_NAME_UDK,REEZB_BUDGET,REEZB_NAME_BUDGET,REEZB_KVK,REEZB_NAME_KVK,REEEZB_KOD_GRANTEE,REEZB_DEGREE_CLIENT,REEZB_CLIENT_NAME,URZB_FNZB_SIGN from DOG_SYS_OPTIONS';
 DataSetR.Active := false;
 DataSetR.Active := true;



 if FileExists(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile) then
 begin
     frxReport_urzb.Variables['REEZB_KPK']:=KPKKod;
     frxReport_urzb.Variables['REEZB_KPK_Name']:=KPKName;

     frxReport_urzb.Variables['REEZB_Fond']:=FondKod;
     frxReport_urzb.Variables['REEZB_Fond_Name']:=FondName;

     frxReport_urzb.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Dogovor\' + repFile);
     DataSetR.Close;
     DataSetR.Prepare;
     DataSetR.SQLs.SelectSQL.Clear;
     DataSetR.SQLs.SelectSQL.Text := 'select Kod_EDRPOU,id_customer from pub_sp_customer p where p.id_customer = (select Organization from pub_sys_data)';
     DataSetR.Active := false;
     DataSetR.Active := true;
     DataSetR.Free;
 end
 else
 begin
   ShowMessage('Файл звіту "' + repFile + '" не знайден!');
   DataSetR.Free;
   exit;
 end;

 DataSet_urzb_rep_1.Active := false;
 DataSet_urzb_rep_1.ParamByName('id_urzb').AsInt64 :=  DataSetSel['ID_URZB'];
 DataSet_urzb_rep_1.ParamByName('id_user').AsInt64 := SYS_ID_USER;
 DataSet_urzb_rep_1.Active := true;

 DataSet_urzb_rep_2.Active := false;
 DataSet_urzb_rep_2.ParamByName('id_urzb').AsInt64 :=  DataSetSel['ID_URZB'];
 DataSet_urzb_rep_2.Active := true;

 if (DataSet_urzb_rep_2['MFO2']=-1) then ShowMessage(DataSet_urzb_rep_2['TYPE_KAZN_KOD_MESSAGE']);

 DataSet_urzb_rep.Active := false;
 DataSet_urzb_rep.ParamByName('id_urzb').AsInt64 :=  DataSetSel['ID_URZB'];
 DataSet_urzb_rep.Active := true;


 if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
 frxReport_urzb.DesignReport
 else frxReport_urzb.ShowReport;

 DataSet_urzb_rep.Active    := false;
 DataSet_urzb_rep_1.Active    := false;
end;

procedure TfrmReeUrzb.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = Vk_return then
  begin
    viewExecute(Self);
  end;
end;

procedure TfrmReeUrzb.GetParametrsForReport(IDRateAcc: Int64 ;RateAcc: String);
var
 QueryString: String;
 Temp:String;
 DataSetR: TpFIBDataSet;
begin
{ KPK :String;// КПК/КТКВМБ
  KVK :String;// КВК
  Fond:String;// Фонд
  KPKName :String;// КПК/КТКВМБ
  KVKName :String;// КВК
  FondName:String;// Фонд}

   KPKKod:=copy(RateAcc,1,3);
   KVKKod:=copy(RateAcc,1,7);

//   QueryString:= 'select PKV_TITLE from PUB_SP_SM_PKV PSSP where PSSP.pkv_kod=:'+KPKKod;
//   DataSetR := TpFIBDataSet.Create(Self);
//   DataSetR.Database := WorkDatabase;
//   DataSetR.Transaction := ReadTransaction;
//   DataSetR.SQLs.SelectSQL.Text :=QueryString;
//   DataSetR.Active := false;
//   DataSetR.Active := true;
//   KPKName:=VarToStr(DataSetR['PKV_TITLE']);
//   DataSetR.Free;

{
select * from pub_sp_bank d, pub_sp_cust_rate_acc c left join pub_expand_rate_acc_native b on b.id_rate_account = c.id_rate_account  where  c.id_rate_account=:Acc and c.date_beg<= :D and c.date_end>= :D and d.id_bank=c.id_bank  }

//   QueryString:='select MFO from pub_sp_bank d, pub_sp_cust_rate_acc c left join pub_expand_rate_acc_native b on b.id_rate_account = c.id_rate_account  where  c.id_rate_account='+IntToStr(IDRateAcc)+' and c.date_beg<= '+DateToStr(Now)+' and c.date_end>= '+DateToStr(Now)+' and d.id_bank=c.id_bank';
//   DataSetR := TpFIBDataSet.Create(Self);
//   DataSetR.Database := WorkDatabase;
//   DataSetR.Transaction := ReadTransaction;
//   DataSetR.SQLs.SelectSQL.Text :=QueryString;
//   DataSetR.Active := false;
//   DataSetR.Active := true;
//   Temp:=VarToStr(DataSetR['MFO']);
//   DataSetR.Free;

//   QueryString:='select type_finance_name from PUB_SP_TYPE_FINANCE PSTF where PSTF.type_kazn_kod = '+Temp;
//   DataSetR := TpFIBDataSet.Create(Self);
//   DataSetR.Database := WorkDatabase;
//   DataSetR.Transaction := ReadTransaction;
//   DataSetR.SQLs.SelectSQL.Text :=QueryString;
//   DataSetR.Active := false;
//   DataSetR.Active := true;
//   FondName:=VarToStr(DataSetR['type_finance_name']);
//   DataSetR.Free;
end;

procedure TfrmReeUrzb.dxBarButton3Click(Sender: TObject);
begin
 if (cxShellBrowserDialog1.Execute = true) then
 begin
  cbDBFPath.Text:= cxShellBrowserDialog1.Path;
 end;
end;

function TfrmReeUrzb.DiscInDrive(Drive: char): Boolean;
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

procedure TfrmReeUrzb.cxGrid1DBTableView1CellClick(
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


procedure TfrmReeUrzb.dxBarLargeButton1Click(Sender: TObject);
begin
 ShowMessage('Just Test');
end;

// Процедура импорта данных из старой системы          Гребенник М. 23.09.2013
procedure TfrmReeUrzb.dxBarLargeButton3Click(Sender: TObject);
var
 cImportItemsCount,i : Integer;
 cImportPath : string;
 cImportFileName : string;
 frm : TfrmUrzbAdd;
 id_rate_acc_for_import : Int64;
begin
 frm := TfrmUrzbAdd.Create(Self);
 frm.Label1.Visible:=False;
 frm.cxDateEdit_urzb.Visible:=False;
 frm.cxCheckBox1.Visible:=False;
 frm.NumEdit.Visible:=False;
 frm.Label2.Top:=16;
 frm.cxButtonEdit_name_un.Top:=29;
 frm.ClientHeight:=100;
 frm.cxButton1.Top:=56;
 frm.cxButton2.Top:=56;

 if frm.ShowModal = mrYes then
   id_rate_acc_for_import := frm.id_rate_acc;


 // Определяем путь к старому каталогу
 if (cxShellBrowserDialog2.Execute = true) then
 begin
  cImportPath := cxShellBrowserDialog2.Path;
 end;
 // Проверяем наличие нужных dbf: f009u.dbf

 cImportFileName := cImportPath + '\f009u.dbf';
 if FileExists(cImportFileName) <> true then
 begin
   ShowMessage('Отсутствуют файлы для импорта!');
   Exit;
 end;

 // Импорт относительно реестров
 DbfExport.Close;
 DbfExport.DatabaseName := ExtractFilePath(cImportFileName);
 DbfExport.TableName := ExtractFileName(cImportFileName);
 DbfExport.Open;

 cImportItemsCount := DbfExport.RecordCount;
 DbfExport.First;
 // Забираем данные из реестров и вставляем
 for i:=0 to cImportItemsCount - 1 do
 begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='DOG_REE_URZB_IMPORT';
  StoredProc.Prepare;
  StoredProc.ParamByName('NP').AsInteger := DbfExport.FieldByName('NP').AsInteger;
  StoredProc.ParamByName('DATER').AsDate := DbfExport.FieldByName('DATER').AsDateTime;
  StoredProc.ParamByName('RRAX').AsString := DbfExport.FieldByName('RRAX').AsString;
  StoredProc.ParamByName('KPK').AsString := DbfExport.FieldByName('KPK').AsString;
  StoredProc.ParamByName('KPOL').AsInteger := DbfExport.FieldByName('KPOL').AsInteger;
  StoredProc.ParamByName('KVK').AsString := DbfExport.FieldByName('KVK').AsString;
  StoredProc.ParamByName('KEKV').AsInteger := DbfExport.FieldByName('KEKV').AsInteger;
  StoredProc.ParamByName('DATEDOC').AsDate := DbfExport.FieldByName('DATEDOC').AsDateTime;
  StoredProc.ParamByName('NDOC').AsString := DbfExport.FieldByName('NDOC').AsString;
  StoredProc.ParamByName('S').AsCurrency := DbfExport.FieldByName('S').AsCurrency;
  StoredProc.ParamByName('DATETERM').AsDate := DbfExport.FieldByName('DATETERM').AsDateTime;
  StoredProc.ParamByName('SK').AsInteger := DbfExport.FieldByName('SK').AsInteger;
  StoredProc.ParamByName('SO').AsCurrency := DbfExport.FieldByName('SO').AsCurrency;
  StoredProc.ParamByName('BUDGET').AsString := DbfExport.FieldByName('BUDGET').AsString;
  StoredProc.ParamByName('NREE').AsInteger := DbfExport.FieldByName('NREE').AsInteger;
  StoredProc.ParamByName('ID_RATE_ACC').AsInteger := id_rate_acc_for_import;
  StoredProc.ExecProc;
  DbfExport.Next;
 end;
 ShowMessage('Імпорт виконано успішно!');
 StoredProc.Transaction.Commit;
 StoredProc.Close;
 DbfExport.Close;
end;

procedure TfrmReeUrzb.dxBarButton6Click(Sender: TObject);
  var
  formEditDate :TForm4;
  id:integer;
  date_reestr, date_reg : TDate;
begin
  formEditDate:= TForm4.Create(self);
  formEditDate.EditDate.Date:= DataSetSel['DATE_URZB'];
  formEditDate.EditNum.Text:= DataSetSel['NUMBER_URZB'];
  if (formEditDate.ShowModal=mrOk) then
  begin
    date_reestr:=DataSetSel['DATE_REESTR'];
    date_reg:=formEditDate.EditDate.Date;
    if (date_reestr >= date_reg) then
    begin
      WriteTransaction.StartTransaction;
      StoredProc.StoredProcName := 'PROC_DOG_REE_URZB_UPD';
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_URZB').AsInt64 := DataSetSel['ID_URZB'];
      StoredProc.ParamByName('DATE_URZB').AsDateTime := formEditDate.EditDate.Date;
      StoredProc.ParamByName('NUMBER_URZB').AsInteger:= StrToInt(formEditDate.EditNum.Text);
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
      id:=DataSetSel['ID_URZB'];
      SelectAll;
      DataSetSel.Locate('ID_URZB',id,[]);
  end else ShowMessage('Дата реєстра не може бути більше дати реєстрації!');
 end;
end;

procedure TfrmReeUrzb.DateBegPropertiesEditValueChanged(Sender: TObject);
begin
  SelectAll;
end;

procedure TfrmReeUrzb.Timer1Timer(Sender: TObject);
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

procedure TfrmReeUrzb.fltUrzbClick(Sender: TObject);
begin
  fltForm1 := TfltReeUrzb.Create(Self);
  
  fltForm1.cxDateEdit1.Date:=flt_date1;
  fltForm1.cxDateEdit2.Date:=flt_date2;
  fltForm1.cxTextEditNumDog.Text:=n_dog;
  fltForm1.cxTextEditDogReeNum.Text:=regest_num;
  fltForm1.cxTextEditNumRee.Text:=number_urzb;
  fltForm1.cxCurrencyEditSumRee1.Value:=summa_urzb1;
  fltForm1.cxCurrencyEditSumRee2.Value:=summa_urzb2;
  fltForm1.cxTextCurrencyDogSum1.Value:=summa1;
  fltForm1.cxTextCurrencyDogSum2.Value:=summa2;
  fltForm1.cxCheckDateRee.Checked:=CheckDateRee;
  fltForm1.cxCheckNumDog.Checked:=CheckNumDog;
  fltForm1.cxCheckSumRee.Checked:=CheckSumRee;
  fltForm1.cxCheckRegNum.Checked:=CheckRegNum;
  fltForm1.cxCheckReeNumDog.Checked:=CheckReeNumDog;
  fltForm1.cxCheckDogSum.Checked:=CheckDogSum;
  fltForm1.ShowModal;

  //if fltForm1.ShowModal <> mrCancel then SelectAll;
  flt_date1:=fltForm1.cxDateEdit1.Date;
  flt_date2:=fltForm1.cxDateEdit2.Date;
  n_dog:=fltForm1.cxTextEditNumDog.Text;
  regest_num:=fltForm1.cxTextEditDogReeNum.Text;
  number_urzb:=fltForm1.cxTextEditNumRee.Text;
  summa_urzb1:=fltForm1.cxCurrencyEditSumRee1.Value;
  summa_urzb2:=fltForm1.cxCurrencyEditSumRee2.Value;
  summa1:=fltForm1.cxTextCurrencyDogSum1.Value;
  summa2:=fltForm1.cxTextCurrencyDogSum2.Value;

  CheckDateRee:=fltForm1.cxCheckDateRee.Checked;
  CheckNumDog:=fltForm1.cxCheckNumDog.Checked;
  CheckSumRee:=fltForm1.cxCheckSumRee.Checked;
  CheckRegNum:=fltForm1.cxCheckRegNum.Checked;
  CheckReeNumDog:=fltForm1.cxCheckReeNumDog.Checked;
  CheckDogSum:=fltForm1.cxCheckDogSum.Checked;

  SelectAll;
end;



procedure TfrmReeUrzb.dxBarButton7Click(Sender: TObject);
var
  formEditDate :TForm6;
  id:integer;
  date_reestr, date_reg : TDate;
begin
  formEditDate:= TForm6.Create(self);
  formEditDate.cxDateEdit1.Date:= DataSetSel['DATE_REESTR'];
  formEditDate.cxMemo1.Text:=DataSetSel['COMMENT'];
  if (formEditDate.ShowModal=mrOk) then
  begin
    date_reestr:=DataSetSel['DATE_URZB'];
    date_reg:=formEditDate.cxDateEdit1.Date;
    if (date_reestr <= date_reg) then
    begin
      QueryEditDate.Transaction.StartTransaction;
      QueryEditDate.SQL.Text:='update DOG_REE_URZB set DATE_REESTR = '''+ formEditDate.cxDateEdit1.Text+''', COMMENT = ''' + formEditDate.cxMemo1.Text + ''' where ID_URZB = '+ IntToStr(DataSetSel['ID_URZB']);
      QueryEditDate.ExecQuery;
      QueryEditDate.Transaction.Commit;
      id:=DataSetSel['ID_URZB'];
      SelectAll;
      DataSetSel.Locate('ID_URZB',id,[]);
    end
    else
    ShowMessage('Дата реєстрації повинна бути більше або дорівнювати даті створення реєстру!');
  end;
end;

procedure TfrmReeUrzb.cxGrid1DBTableView1CustomDrawCell(
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

procedure TfrmReeUrzb.cxButton1Click(Sender: TObject);
var
 s : string;
 user_name : string;
begin
 if DataSetSel.RecordCount = 0 then Exit;
 Q1.Close;
 Q1.SQL.Text := 'select full_name from users where id_user = ' + IntToStr(DataSetSel['ADD_USER']);
 Q1.ExecQuery;
 user_name := Q1.FldByName['full_name'].AsString;
 Q1.Close;
 s := 'Користувач: ' + user_name + #13 + 'Комп''ютер: ' + ifNull(DataSetSel['ADD_COMP'], '') + #13 + 'Додано: ';
 if not VarIsNull(DataSetSel.fieldbyName('ADD_TIME').AsVariant) then s := s + DateTimeToStr(DataSetSel.fieldbyName('ADD_TIME').AsDateTime);
 agShowMessage(s);
end;

end.
