unit uOrganizations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AArray, dxBar, dxBarExtItems, DB, FIBDataSet, pFIBDataSet,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, cxMaskEdit, FIBDatabase, pFIBDatabase, ImgList,
  cxGridTableView, cxClasses, ExtCtrls, cxLabel, cxContainer, cxEdit,
  cxTextEdit, uOrganizationsAdd, FIBQuery, pFIBQuery, pFIBStoredProc, Ib_externals,
  cxFilter, cxCurrencyEdit, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView,
  cxGrid, cxSplitter, uMonuLoaderDM, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxButtonEdit, cxDropDownEdit, cxCalendar, cxGroupBox,
  cxCheckBox, DateUtils, uExcelFile;

const
 edit_margin = 16;

type
  TfrmOrganizations = class(TForm)
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    Tree: TcxDBTreeList;
    pFIBDatabase1: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    SelButton: TdxBarLargeButton;
    LargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    Panel1: TPanel;
    FilterEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    dxBarLargeButton1: TdxBarLargeButton;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
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
    TreeID_ORGANIZATION: TcxDBTreeListColumn;
    TreeLINKTO: TcxDBTreeListColumn;
    TreeNAME_ORGANIZATION: TcxDBTreeListColumn;
    TreeSHORT_NAME: TcxDBTreeListColumn;
    TreeID_CUSTOMER: TcxDBTreeListColumn;
    TreeCODE: TcxDBTreeListColumn;
    TreeEDRPOU: TcxDBTreeListColumn;
    TreeKOATUU: TcxDBTreeListColumn;
    TreeZKGNG: TcxDBTreeListColumn;
    TreeKVED: TcxDBTreeListColumn;
    TreeKVF: TcxDBTreeListColumn;
    TreeKOPFG: TcxDBTreeListColumn;
    TreeSPODU: TcxDBTreeListColumn;
    TreeKOB: TcxDBTreeListColumn;
    TreeID_TYPE_ORG: TcxDBTreeListColumn;
    dsProgram: TpFIBDataSet;
    _dsProgram: TDataSource;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_ORG_PROGRAMS: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PROGRAM: TcxGridDBColumn;
    cxGrid1DBTableView1S_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1USE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1USE_END: TcxGridDBColumn;
    cxGrid1DBTableView1CODE_PRG: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_PRG: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    ImageList1: TImageList;
    PanelAddPrg: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    beProgram: TcxButtonEdit;
    cxLabel2: TcxLabel;
    eCode: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    SelQuery: TpFIBQuery;
    cbCurYear: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel6: TcxLabel;
    DateEndEdit: TcxDateEdit;
    DateBegEdit: TcxDateEdit;
    cxLabel5: TcxLabel;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure TreeDblClick(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure TreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure eCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eCodeExit(Sender: TObject);
    procedure cbCurYearClick(Sender: TObject);
    procedure DateBegEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEndEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    xl : TExcel;
    input, output : TAArray;
    id_program : int64;
    LastRow : integer;
    procedure AddForm(const FormCode, FormType, kvk : string; const prg : array of integer);
    procedure SelectAll;
  end;
var
  frmOrganizations: TfrmOrganizations;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;

implementation
uses uOrganizationsImportPrograms;

{$R *.dfm}
const
 MON_PASSWORD = 'pRjLdM7zDqll2f[1=';

 
function Load(input, res : TAArray) : boolean;
var
 frm : TfrmOrganizations;
begin
  Result := true;
  frm := TfrmOrganizations.Create(TComponent(input['Owner'].asObject));
  frm.input := TAArray.Create;
  input.CopyTo(frm.input);
  frm.output := res;
  frm.FormStyle := frm.input['FormStyle'].AsVariant;
  frm.SelButton.Enabled := frm.FormStyle = fsNormal;
//  frm.Caption := frm.input['Caption'].AsString;
  frm.pFIBDatabase1.Handle := pvoid(frm.input['DBHandle'].asInteger);

  frm.tree.DataController.KeyField := 'ID_ORGANIZATION';
  frm.tree.DataController.ParentField := 'LINKTO';
  if not VarIsNull(input['code'].AsVariant) then
  begin
    frm.DataSet.SelectSQL.Text := frm.DataSet.SelectSQL.Text + ' where code = ' + input['code'].AsString;
  end;
  frm.SelectAll;
  frm.Tree.DataController.FocusedRowIndex := 0;
//  frm.Tree.SetFocus;


  if frm.FormStyle = fsNormal then
  begin
    frm.output['ModalResult'].AsVariant := frm.ShowModal;
    frm.Free;
  end
  else
  begin

  end;
end;

{ TfrmSpravTree }

procedure TfrmOrganizations.SelectAll;
begin
 dsProgram.Close;
 Dataset.Close;
// Dataset.SelectSQL.Text := 'select * from ' + input['SelProc'].AsString;
 Dataset.Open;
 dsProgram.Open;
end;

procedure TfrmOrganizations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmOrganizations.ExitButtonClick(Sender: TObject);
begin
 close;
end;

procedure TfrmOrganizations.SelButtonClick(Sender: TObject);
var
 i : integer;
begin
 if DataSet.RecordCount <> 0 then
 begin
   for i := 0 to DataSet.FieldCount - 1 do output[DataSet.Fields[i].FieldName].AsVariant := DataSet.Fields[i].Value;
 end;
 output['ModalResult'].AsVariant := mrOk;
 ModalResult := mrOk;
end;

procedure TfrmOrganizations.TreeDblClick(Sender: TObject);
begin
 if SelButton.Enabled then SelButtonClick(Self);
end;

procedure TfrmOrganizations.cxTextEdit1PropertiesChange(Sender: TObject);
begin
 (*if FilterEdit.Text = '' then
 begin
   Tree.DataController.Filter.Root.Clear;
   Tree.DataController.Filter.Active := false;
   exit;
 end;
 Tree.DataController.Filter.Root.Clear;

// for i := 0 to Tree.ColumnCount - 1 do if Tree.Columns[i].DataBinding.FieldName = input['SearchField'].AsString then break;
 Tree.DataController.Filter.Root.AddItem(Tree.Columns[0], foLike, '%' + AnsiUpperCase(FilterEdit.Text) + '%', '%' + AnsiUpperCase(FilterEdit.Text) + '%');
 Tree.DataController.Filter.Active := true;

                                               
{ DataSet.Filtered := false;
 DataSet.Filter := 'UPPER(' + input['SearchField'].AsString + ') like ' + QuotedStr('%' + AnsiUpperCase(FilterEdit.Text) + '%');
 DataSet.Filtered := true;}*)
end;

procedure TfrmOrganizations.AddButtonClick(Sender: TObject);
var
 frm : TfrmAdd;
 new_id : int64;
 linkto : int64;
begin
 frm := TfrmAdd.Create(Self);
 frm.Caption := 'Додати ' + frm.Caption;

 if frm.ShowModal = mrOk then
 begin
   StoredProc.StoredProcName := 'MON_ORGANIZATIONS_INS';
   StoredProc.Transaction.StartTransaction;
   StoredProc.Prepare;
   if DataSet.RecordCount <> 0 then
   begin
     linkto := -1;
     if TdxBarLargeButton(Sender).Tag = 1 then linkto := TFIBBCDField(DataSet.FBN('ID_ORGANIZATION')).AsInt64;
   end else linkto := -1;

   StoredProc.ParamByName('LINKTO').AsInt64 := linkto;
   StoredProc.ParamByName('NAME_ORGANIZATION').AsString := frm.eName.Text;
   StoredProc.ParamByName('SHORT_NAME').AsString := frm.eShortName.Text;
   StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := frm.id_customer;
   StoredProc.ParamByName('CODE').AsString := frm.eCode.Text;
   StoredProc.ParamByName('EDRPOU').AsString := frm.eEDRPOU.Text;
   StoredProc.ParamByName('KOATUU').AsString := frm.eKOATUU.Text;
   StoredProc.ParamByName('ZKGNG').AsString := frm.eZKGNG.Text;
   StoredProc.ParamByName('KVED').AsString := frm.eKVED.Text;
   StoredProc.ParamByName('KVF').AsString := frm.eKVED.Text;
   StoredProc.ParamByName('KOPFG').AsString := frm.eKOPFG.Text;
   StoredProc.ParamByName('SPODU').AsString := frm.eSPODU.Text;
   StoredProc.ParamByName('ID_TYPE_ORG').AsInt64 := frm.id_type_org;
   StoredProc.ParamByName('KOB').AsString := '00';
   StoredProc.ParamByName('DIR').AsString := frm.eDir.Text;

   StoredProc.ExecProc;

   StoredProc.Transaction.Commit;
   StoredProc.Close;
   new_id := StoredProc['ID_ORGANIZATION'].asInt64;
   SelectAll;
   DataSet.Locate('ID_ORGANIZATION', new_id, []);
 end;
 frm.Free;
end;


procedure TfrmOrganizations.DeleteButtonClick(Sender: TObject);
var
 i : integer;
 id : integer;
begin
  if DataSet.RecordCount = 0 then exit;
  i := Tree.DataController.FocusedRowIndex;
  id := TFIBBCDField(DataSet.FBN('ID_ORGANIZATION')).AsInt64;
  if MessageDlg('Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  StoredProc.StoredProcName := 'MON_ORGANIZATIONS_DEL';
  StoredProc.Transaction.StartTransaction;
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_ORGANIZATION').AsInt64 := id;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  StoredProc.Close;
  SelectAll;
  Tree.DataController.FocusedRowIndex := i;
end;

procedure TfrmOrganizations.RefreshButtonClick(Sender: TObject);
var
 i : integer;
begin
  i := Tree.DataController.FocusedRowIndex;
  SelectAll;
  Tree.DataController.FocusedRowIndex := i;
end;

procedure TfrmOrganizations.EditButtonClick(Sender: TObject);
var
 frm : TfrmAdd;
 id : int64;
begin
 if DataSet.RecordCount = 0 then exit;
 frm := TfrmAdd.Create(Self);
 frm.Caption := 'Змінити ' + frm.Caption;
 frm.eCode.Text := DataSet.FBN('CODE').AsString;
 frm.eName.Text := DataSet.FBN('NAME_ORGANIZATION').AsString;
 frm.eShortName.Text := DataSet.FBN('SHORT_NAME').AsString;
 frm.eEDRPOU.Text := DataSet.FBN('EDRPOU').AsString;
 frm.eKOATUU.Text := DataSet.FBN('KOATUU').AsString;
 frm.eZKGNG.Text := DataSet.FBN('ZKGNG').AsString;
 frm.eKVED.Text := DataSet.FBN('KVED').AsString;
 frm.eKFV.Text := DataSet.FBN('KVF').AsString;
 frm.eKOPFG.Text := DataSet.FBN('KOPFG').AsString;
 frm.eSPODU.Text := DataSet.FBN('SPODU').AsString;
 frm.beCustomer.Text := DataSet.FBN('NAME_CUSTOMER').AsString;
 frm.beTypeOrg.Text := DataSet.FBN('NAME_TYPE_ORG').AsString;
 frm.id_customer := TFIBBCDField(DataSet.FBN('ID_CUSTOMER')).AsInt64;
 frm.id_type_org := TFIBBCDField(DataSet.FBN('ID_TYPE_ORG')).AsInt64;
 frm.eDir.Text := VarToStr(DataSet.FBN('Dir').AsVariant);

 if frm.ShowModal = mrOk then
 begin
   id := TFIBBCDField(DataSet.FBN('ID_ORGANIZATION')).AsInt64;
   StoredProc.StoredProcName := 'MON_ORGANIZATIONS_UPD';
   StoredProc.Transaction.StartTransaction;
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_ORGANIZATION').AsInt64 := id;
   StoredProc.ParamByName('linkto').AsInt64 := TFIBBCDField(DataSet.FBN('linkto')).AsInt64;
   StoredProc.ParamByName('NAME_ORGANIZATION').AsString := frm.eName.Text;
   StoredProc.ParamByName('SHORT_NAME').AsString := frm.eShortName.Text;
   StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := frm.id_customer;
   StoredProc.ParamByName('CODE').AsString := frm.eCode.Text;
   StoredProc.ParamByName('EDRPOU').AsString := frm.eEDRPOU.Text;
   StoredProc.ParamByName('KOATUU').AsString := frm.eKOATUU.Text;
   StoredProc.ParamByName('ZKGNG').AsString := frm.eZKGNG.Text;
   StoredProc.ParamByName('KVED').AsString := frm.eKVED.Text;
   StoredProc.ParamByName('KVF').AsString := frm.eKVED.Text;
   StoredProc.ParamByName('KOPFG').AsString := frm.eKOPFG.Text;
   StoredProc.ParamByName('SPODU').AsString := frm.eSPODU.Text;
   StoredProc.ParamByName('ID_TYPE_ORG').AsInt64 := frm.id_type_org;
   StoredProc.ParamByName('KOB').AsString := '00';
   StoredProc.ParamByName('DIR').AsString := frm.eDir.Text;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   StoredProc.Close;
   SelectAll;
   DataSet.Locate('ID_ORGANIZATION', id, []);
 end;
 frm.Free;
end;

procedure TfrmOrganizations.TreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key = VK_RETURN) and (SelButton.Enabled) then SelButtonClick(Self);
 if key = VK_insert then AddButtonClick(dxBarLargeButton1);
 if key = VK_f3 then EditButtonClick(EditButton);
 if key = VK_f5 then RefreshButtonClick(Self);
 if key = VK_Delete then DeleteButtonClick(Self);
end;

procedure TfrmOrganizations.FormDestroy(Sender: TObject);
begin
  input.Free;
end;

procedure TfrmOrganizations.FormShow(Sender: TObject);
begin
  Tree.DataController.FocusedRowIndex := 0;
  Tree.SetFocus;
end;

procedure TfrmOrganizations.dxBarButton1Click(Sender: TObject);
begin
  beProgram.Text := '';
  id_program := -1;
  eCode.Text := '';
  DateBegEdit.Date := EncodeDate(YearOf(Date), 1, 1);
  DateEndEdit.Date := EncodeDate(YearOf(Date), 12, 31);
  cbCurYear.Checked := true;
  PanelAddPrg.Visible := true;
  eCode.SetFocus;
end;

procedure TfrmOrganizations.cxButton2Click(Sender: TObject);
begin
  PanelAddPrg.Visible := false;
end;

procedure TfrmOrganizations.cxButton1Click(Sender: TObject);
var
 id_org_prog : int64;
begin
  if id_program = -1 then
  begin
    ShowMessage('Оберить програму.');
    eCode.SetFocus;
    exit;
  end;  
  StoredProc.StoredProcName := 'MON_ORG_PROGRAMS_INS';
  StoredProc.Transaction.StartTransaction;
  StoredProc.Prepare;

  StoredProc.ParamByName('ID_ORGANIZATION').AsInt64 := TFIBBCDField(DataSet.FieldByName('ID_ORGANIZATION')).AsInt64;
  StoredProc.ParamByName('ID_PROGRAM').AsInt64 := id_program;
  StoredProc.ParamByName('USE_BEG').AsDate := DateBegEdit.Date;
  StoredProc.ParamByName('USE_END').AsDate := DateEndEdit.Date;

  StoredProc.ExecProc;
  id_org_prog := StoredProc['ID_ORG_PROGRAMS'].AsInt64;
  StoredProc.Transaction.Commit;
  StoredProc.Close;
  dsProgram.Close;
  dsProgram.Open;
  dsProgram.Locate('ID_ORG_PROGRAMS', id_org_prog, []);

  PanelAddPrg.Visible := false;
end;

procedure TfrmOrganizations.eCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
 begin
   Key := 0;
   cxButton1.SetFocus;
 end;
end;

procedure TfrmOrganizations.eCodeExit(Sender: TObject);
var
 code : integer;
begin
  id_program := -1;
  beProgram.Text := '';
  if TryStrToInt(eCode.Text, code) then
  begin
    SelQuery.Close;
    SelQuery.SQL.Text := 'select * from MON_SP_PROGRAM where code = :code';
    SelQuery.Prepare;
    SelQuery.ParamByName('CODE').AsInteger := code;
    SelQuery.ExecQuery;
    if SelQuery.RecordCount <> 0 then
    begin
      id_program := SelQuery.FieldByName('ID_PROGRAM').AsInt64;
      beProgram.Text := SelQuery.FieldByName('NAME_PROGRAM').AsString;
    end;
    SelQuery.Close;
  end;
end;

procedure TfrmOrganizations.cbCurYearClick(Sender: TObject);
begin
  DateBegEdit.Enabled := not cbCurYear.Checked;
  DateEndEdit.Enabled := not cbCurYear.Checked;
  if cbCurYear.Checked then
  begin
    DateBegEdit.Date := EncodeDate(YearOf(Date), 1, 1);
    DateEndEdit.Date := EncodeDate(YearOf(Date), 12, 31);
  end else DateBegEdit.SetFocus;
end;

procedure TfrmOrganizations.DateBegEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    DateEndEdit.SetFocus;
  end;
end;

procedure TfrmOrganizations.DateEndEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    cxButton1.SetFocus;
  end;
end;

procedure TfrmOrganizations.dxBarButton3Click(Sender: TObject);
begin
  StoredProc.StoredProcName := 'MON_ORG_PROGRAMS_DEL';
  StoredProc.Transaction.StartTransaction;
  StoredProc.Prepare;

  StoredProc.ParamByName('ID_ORG_PROGRAMS').AsInt64 := TFIBBCDField(dsProgram.FieldByName('ID_ORG_PROGRAMS')).AsInt64;

  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  StoredProc.Close;
  dsProgram.CacheDelete;
end;

procedure TfrmOrganizations.dxBarLargeButton2Click(Sender: TObject);
var
  frm : TfrmImportPrg;
begin
  frm := TfrmImportPrg.Create(Self);
  frm.Database.Handle := pFIBDatabase1.Handle;
  frm.ShowModal;
  frm.Close;
end;

procedure TfrmOrganizations.AddForm(const FormCode, FormType, kvk : string; const prg : array of integer);
var
  srcSheet  : TExcelWorksheet;
  dstSheet  : TExcelWorksheet;
  i, j, k   : integer;
  FormNames : array of string;
  str       : string;
  start_row : integer;
  start_col : integer;
  end_row   : integer;
  end_col   : integer;
begin
  //Находим форму с нужным кодом
  srcSheet := xl.WorkBooks[0].SheetByName('Ф' + FormCode);
  if srcSheet = Nil then exit;
  SetLength(FormNames, Length(prg));
  //Проходим по всем программам
  for i := 0 to Length(prg) - 1 do
  begin
    //Копируем лист с шаблона в новый файл
    srcSheet.Copy(xl.WorkBooks[1].Sheets[0]);
    dstSheet := xl.WorkBooks[1].Sheets[xl.WorkBooks[1].SheetsCount - 1];
    dstSheet.SheetName := 'Ф' + FormCode + '-' + IntToStr(prg[i]) + '-' + FormType;
    FormNames[i] := dstSheet.SheetName;

    //Добавляем на лист импорта информацию по новому листу
    xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 28] := dstSheet.SheetName;
    xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 29] := FormCode;
    xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 30] := kvk;
    xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 31] := IntToStr(prg[i]);
    xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 32] := FormType;

    //Пишем на лист программу
    dstSheet.WorkSheet.Range['A1','K21'].Replace('%PROG%', kvk + IntToStr(prg[i]), EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);

    //Блокируем лист
    dstSheet.Protect(MON_PASSWORD);
    inc(LastRow);
  end;
  //Создаем агрегирующий лист
  srcSheet.Copy(xl.WorkBooks[1].Sheets[0]);
  dstSheet := xl.WorkBooks[1].Sheets[xl.WorkBooks[1].SheetsCount - 1];
  dstSheet.SheetName := 'Ф' + FormCode + '-' + FormType + '-зв';
  //Находим диапозон данных на листе
  i := 1;
  while (VarToStr(xl.WorkBooks[0].SheetByName('sysinfo').Cells[i, 1]) <> 'Ф' + FormCode) do
  begin
    if  (VarToStr(xl.WorkBooks[0].SheetByName('sysinfo').Cells[i, 1]) = ' ') then
    begin
      i := -1;
      break;
    end;
    inc(i);
  end;  
  if i <> -1 then
  begin
    str := xl.WorkBooks[0].SheetByName('sysinfo').Cells[i, 2];
    start_row := StrToInt(Copy(str, 1, pos(':', str) - 1));
    start_col := StrToInt(Copy(str, pos(':', str) + 1, Length(str) - pos(':', str)));
    str := xl.WorkBooks[0].SheetByName('sysinfo').Cells[i, 3];
    end_row := StrToInt(Copy(str, 1, pos(':', str) - 1));
    end_col := StrToInt(Copy(str, pos(':', str) + 1, Length(str) - pos(':', str)));
  end
  else
  begin
    ShowMessage('Невозможно создать агрегационную форму т.к. не заданы диапозоны на листе sysinfo. Форма ' + FormCode);
    exit;
  end;

  //Заполняем агрегационную форму
  for i := start_col to end_col do for j := start_row to end_row do if (VarToStr(dstSheet.Cells[j, i]) <> 'X') then
  begin
    str := '=';
    for k := 0 to Length(FormNames) - 1 do str := str + '''' + FormNames[k] + '''!' + 'R' + InttoStr(j) + 'C' + IntToStr(i) + ' + ';
    str := copy(str, 1, Length(str) - 2);
    dstSheet.Formula[j, i] := str;
    dstSheet.LockCell[j, i] := true;
  end;

  //Добавляем на лист импорта информацию по агрегационной форме
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 28] := dstSheet.SheetName;
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 29] := FormCode;
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 30] := kvk;
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 31] := '0';
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 32] := 'зв';
  inc(LastRow);
  //Пишем на лист "Зведена" и блокируем лист
  dstSheet.WorkSheet.Range['A1','K21'].Replace('%PROG%', 'Зведена',  EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  dstSheet.Protect(MON_PASSWORD);
end;

procedure TfrmOrganizations.dxBarLargeButton3Click(Sender: TObject);
var
  prg : array of integer;
begin
  if (DataSet.RecordCount = 0) or (dsProgram.RecordCount = 0) then exit;

  xl := TExcel.Create(Self);
  xl.AddWorkBook('c:\shablon.xls');
  xl.AddWorkBook;

  //Копируем макрос
  xl.WorkBooks[0].CopyMacro(xl.WorkBooks[1]);

  //Копируем листы
  xl.WorkBooks[0].SheetByName('Довідка').Copy(xl.WorkBooks[1].Sheets[0]);
{  xl.WorkBooks[0].SheetByName('Титул баланса').Copy(xl.WorkBooks[1].Sheets[0]);
  xl.WorkBooks[0].SheetByName('Баланс').Copy(xl.WorkBooks[1].Sheets[0]);
  xl.WorkBooks[0].SheetByName('Довідка до балансу').Copy(xl.WorkBooks[1].Sheets[0]);
  xl.WorkBooks[0].SheetByName('Розшифровка до балансу (ДКУ)').Copy(xl.WorkBooks[1].Sheets[0]);
  xl.WorkBooks[0].SheetByName('Додаток 22').Copy(xl.WorkBooks[1].Sheets[0]);}
  LastRow := 2;

  xl.WorkBooks[0].SheetByName('import').Copy(xl.WorkBooks[1].Sheets[0]);

  //Копируем потребу
  xl.WorkBooks[0].SheetByName('Потреба').WorkSheet.UsedRange[0].Copy(0);
  xl.WorkBooks[1].AddSheet('test1');
  xl.WorkBooks[1].SheetByName('test1').WorkSheet.Paste(0, 0, 0);

{  xl.WorkBooks[0].SheetByName('Потреба').Copy(xl.WorkBooks[1].Sheets[0]);
  xl.WorkBooks[1].SheetByName('Потреба').WorkSheet.Range['D11','D14'].MergeCells := true;
  xl.WorkBooks[1].SheetByName('Потреба').WorkSheet.Range['D11','D14'].AutoFit;}


  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 28] := 'Потреба';
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 29] := '0';
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 30] := 220;
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 31] := '0';
  xl.WorkBooks[1].SheetByName('import').Cells[LastRow, 32] := 'зв';
  inc(LastRow);

  ///
  dsProgram.First;
  prg := nil;
  while not dsProgram.Eof do
  begin
    SetLength(prg, Length(prg) + 1);
    prg[Length(prg) - 1] := dsProgram.FBN('CODE_PRG').AsInteger;
    dsProgram.Next;
  end;

  AddForm('2', 'б', '220', prg);
  AddForm('2', 'м', '220', prg);


  xl.WorkBooks[1].SheetByName('import').Cells[2, 27] := xl.WorkBooks[0].SheetByName('sysinfo').Cells[1, 6];
  xl.WorkBooks[1].SheetByName('import').Hide;
  xl.WorkBooks[1].DeleteSheet(0);
  xl.WorkBooks[0].Close;

//  s := GetTickCount;
//  xl.RunMacro('Module1.Import');
//  e := GetTickCount;
//  Caption := IntToStr(e - s);
  xl.WorkBooks[1].Save('C:\test.xls');
  xl.Free;
  Showmessage('All done');

end;

end.
