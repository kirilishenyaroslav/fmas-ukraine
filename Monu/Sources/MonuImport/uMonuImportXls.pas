unit uMonuImportXls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, AArray, DB, Halcn6db, StdCtrls, cxRadioGroup, cxGroupBox,
  FIBDataSet, pFIBDataSet, cxLookAndFeelPainters, cxButtons, DateUtils,
  cxSpinEdit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  uMonuLoaderDM, cxMemo, cxProgressBar, dogLoaderUnit, ExtCtrls, ADODB,
  Grids, DBGrids, uExcelFile, ExcelXP, OleServer, ComObj, cxCheckBox, cxImage,
  cxShellDlgs, cxShellBrowserDialog, cxDropDownEdit, LoaderUnit, Registry;

type
  TfrmImportXls = class(TForm)
    beFile: TcxButtonEdit;
    cxLabel1: TcxLabel;
    StoredProc: TpFIBStoredProc;
    Query: TpFIBQuery;
    WriteTransaction: TpFIBTransaction;
    Database: TpFIBDatabase;
    OpenDialog: TOpenDialog;
    ReadTransaction: TpFIBTransaction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxProgressBar1: TcxProgressBar;
    mLog: TcxMemo;
    cxLabel3: TcxLabel;
    pFIBQuery1: TpFIBQuery;
    xl: TExcelApplication;
    ws: TExcelWorksheet;
    wb: TExcelWorkbook;
    cxLabel4: TcxLabel;
    cxGrid2: TcxGrid;
    cxGrid2TableView1: TcxGridTableView;
    cxGrid2TableView1Column1: TcxGridColumn;
    cxGrid2TableView1Column2: TcxGridColumn;
    cxGrid2TableView1Code: TcxGridColumn;
    cxGrid2TableView1Organization: TcxGridColumn;
    cxGrid2TableView1ID_ORGANIZATION: TcxGridColumn;
    cxGrid2TableView1Column6: TcxGridColumn;
    cxGrid2Level1: TcxGridLevel;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    cxGrid2TableView1Column7: TcxGridColumn;
    cxGrid2TableView1Duplicate: TcxGridColumn;
    WaitPanel: TPanel;
    Image1: TImage;
    procedure cxButton1Click(Sender: TObject);
    procedure beFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid2TableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton2Click(Sender: TObject);
    procedure xlWorkbookBeforeSave(ASender: TObject; const Wb: _Workbook;
      SaveAsUI: WordBool; var Cancel: WordBool);
    procedure cxGrid2TableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid2TableView1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
  public
    input, output : TAArray;
    maxYear : integer;
    doFind  : boolean; 
    procedure Info(const str : string);
    procedure ImportFile(const fileName : string; const id_organization : int64; var isError : boolean; var ErrorText : string; const date_data : TDate);
    procedure FindInDir(const path : string);
  end;

var
  frmImportXls: TfrmImportXls;

implementation
uses uMonuLoader, Math;

{$R *.dfm}

{ TfrmImportDbf }

procedure TfrmImportXls.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportXls.Info(const str: string);
begin
  mLog.Lines.Add(str);
end;

procedure TfrmImportXls.beFilePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  r : TRegistry;
begin
  if not cxShellBrowserDialog1.Execute then exit;
  beFile.Text := cxShellBrowserDialog1.Path + '\';
  FindInDir(cxShellBrowserDialog1.Path + '\');
  r := TRegistry.Create;
  r.RootKey := HKEY_CURRENT_USER;
  r.OpenKey('Software\FMAS\MONU\', true);
  r.WriteString('XlsPath', beFile.Text);
  r.Free;
end;

procedure TfrmImportXls.ImportFile(const fileName: string; const id_organization : int64;
  var isError: boolean; var ErrorText: string; const date_data : TDate);
var
  id_session : int64;
  i, j       : integer;
  f          : HFILE;
  size : int64;
  fdate : TDateTime;
  xl         : TExcel;
  recCount   : integer;
  ko, kf, kr, kp, kv, ks : string;
  sheet : uexcelfile.TExcelWorksheet;
  v : Extended;
  data : OleVariant;
  r, c : integer;
  tmp : integer;
begin
  isError := false;

  f := _lopen(PansiChar(FileName), OF_READ);
  size := GetFileSize(f, @size);
  _lclose(f);
  fdate := (FileDateToDateTime(FileAge(FileName)));


  WriteTransaction.StartTransaction;
  isError := false;

  pFIBQuery1.SQL.Text := 'select gen_id(GEN_MON_IMPORT_BUFFER_SESSION, 1) as id_session from RDB$Database';
  pFIBQuery1.ExecQuery;
  id_session := pFIBQuery1.FieldByName('id_session').AsInt64;
  pFIBQuery1.Close;

  xl := TExcel.Create(Self);
  xl.AddWorkBook(FileName);
  sheet := xl.WorkBooks[0].SheetByName('import');
  recCount := sheet.Cells[1, 27];
  cxProgressBar1.Properties.Max := recCount;

  data := sheet.WorkSheet.Range[sheet.WorkSheet.Cells.Item[1,1], sheet.WorkSheet.Cells.Item[2 + recCount, 26]].Value[xlRangeValueDefault];

//  tmp := 1;

  for i := 0 to recCount - 1 do
  begin
    {Caption := IntToStr(tmp);
    inc(tmp);
    if tmp = 2160 then
    begin
      tmp := 0;
    end;      }
    if (VarType(data[i + 2, 1]) = varError) or
       (VarType(data[i + 2, 2]) = varError) or
       (VarType(data[i + 2, 3]) = varError) or
       (VarType(data[i + 2, 4]) = varError) or
       (VarType(data[i + 2, 5]) = varError) or
       (VarType(data[i + 2, 6]) = varError) then
    begin
       cxProgressBar1.Position := i + 1;
       Application.ProcessMessages;
       continue;
    end;

    ko := VarToStr(data[i + 2, 1]);
    kf := VarToStr(data[i + 2, 2]);
    kr := VarToStr(data[i + 2, 3]);
    kp := VarToStr(data[i + 2, 4]);
    kv := VarToStr(data[i + 2, 5]);
    ks := VarToStr(data[i + 2, 6]);
 
    StoredProc.StoredProcName := 'MON_IMPORT_BUFFER_INS';
    StoredProc.Prepare;
    StoredProc.ParamByName('KO').AsString := ko;
    StoredProc.ParamByName('KF').AsString := kf;
    StoredProc.ParamByName('KR').AsString := kr;
    StoredProc.ParamByName('KP').AsString := kp;
    StoredProc.ParamByName('KV').AsString := kv;
    StoredProc.ParamByName('KS').AsString := ks;

    for j := 1 to 20 do
    begin
      try
       if not TryStrToFloat(VarToStr(data[i + 2, 6 + j]), v) then v := 0;
      except
       v := 0;
      end;
      StoredProc.ParamByName('G' + IntToStr(j)).AsCurrency := v;
    end;
    StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
    StoredProc.ExecProc;
    StoredProc.Close;
    cxProgressBar1.Position := i + 1;
    Application.ProcessMessages;
  end;

  xl.Free;
  xl := Nil;

//  WriteTransaction.Commit;// !!!!!!!!!!!!!!!!!!!!!!!! REMOVE THIS !!! ONLY FOR TEST !!!!!

  if not isError then
  begin
    WaitPanel.Visible := true;
    Application.ProcessMessages;
    try
      StoredProc.StoredProcName := 'MON_DO_IMPORT';
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
      StoredProc.ParamByName('DATE_DATA').AsDate := date_data;
      StoredProc.ParamByName('IS_KVARTAL').AsInteger := 0;
      StoredProc.ParamByName('KVARTAL_NUM').AsInteger := -1;
      StoredProc.ParamByName('ID_ORGANIZATION').AsInt64 := ID_ORGANIZATION;
      StoredProc.ExecProc;
      if StoredProc.FieldByName('IS_ERROR').AsInteger = 1 then
      begin
        isError := true;
        ErrorText := StoredProc.FieldByName('ERROR_TEXT').AsString;
      end;
    except
      on e: Exception do begin
        ErrorText := e.Message;
        isError := true;
      end;
    end;
  // WriteTransaction.Commit;
    WaitPanel.Visible := false;
    Application.ProcessMessages;
  end;

  if isError then WriteTransaction.Rollback else WriteTransaction.Commit;

  if not WriteTransaction.Active then WriteTransaction.StartTransaction;

  StoredProc.StoredProcName := 'MON_IMPORT_LOG_INS';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_USER').AsInt64 := MON_ID_USER;
  StoredProc.ParamByName('COMP_NAME').AsString := GetCompName;
  StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
  StoredProc.ParamByName('IMPORT_DATE').AsDateTime := now;
  if isError then
  begin
    StoredProc.ParamByName('IS_ERROR').AsInteger := 1;
    StoredProc.ParamByName('NOTE').AsString := ErrorText;
  end
  else
  begin
    StoredProc.ParamByName('IS_ERROR').AsInteger := 0;
    StoredProc.ParamByName('NOTE').AsString := 'Виконано успішно';
  end;
  StoredProc.ParamByName('FILE_NAME').AsString := FileName;
  StoredProc.ParamByName('DATE_DATA').AsDate := date_data;
  StoredProc.ParamByName('IS_KVARTAL').AsInteger := 0;
  StoredProc.ParamByName('ID_ORGANIZATION').AsInt64 := id_organization;
  StoredProc.ParamByName('KVARTAL_NUM').AsInteger := -1;
  StoredProc.ParamByName('FN').AsString := ExtractFileName(FileName);
  StoredProc.ParamByName('FILE_SIZE').AsInt64 := size;
  StoredProc.ParamByName('FILE_DATE').AsDateTime := fdate;
  StoredProc.ExecProc;
  StoredProc.Close;

  WriteTransaction.Commit;
end;

procedure TfrmImportXls.FindInDir(const path: string);
var
  sr : TSearchRec;
  ko : string;
  date_data : TDate;
  cnt : integer;
  i : integer;
  f    : HFILE;
  size : int64;
  fdate : TDateTime;
begin
  beFile.Enabled := false;
  Application.ProcessMessages;
  cxProgressBar1.Position := 0;
  cxGrid2TableView1.DataController.RecordCount := 0;
  cxGrid2TableView1.BeginUpdate;

  cnt := 0;
  if FindFirst(path + '*.xls', faAnyFile, sr) = 0 then
  begin
    repeat
      inc(cnt);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  cxProgressBar1.Properties.Max := cnt-1;

  if FindFirst(path + '*.xls', faAnyFile, sr) = 0 then
  begin
    repeat
      xl.Connect;

      xl.DisplayAlerts[0] :=  false;
      xl.ShowStartupDialog := false;

      xl.Workbooks.Add(path + sr.Name, 0);
      wb.ConnectTo(xl.Workbooks[1] as _workbook);
      ws.ConnectTo(xl.Sheets[1] as _Worksheet);
      if AnsiUpperCase(ws.Name) <> 'ДОВІДКА' then
      begin
        xl.Quit;
        xl.Disconnect;
        continue;
      end;
      date_data := IncMonth( ws.Cells.Item[2,2].Value, -1);
      ko := ws.Cells.Item[4, 2].Value;
      xl.Quit;
      xl.Disconnect;

      cxGrid2TableView1.DataController.RecordCount := cxGrid2TableView1.DataController.RecordCount + 1;
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 0] := 1;
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 1] := sr.Name;
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 2] := ko;
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 5] := -1;
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 6] := DateToStr(date_data);

      Query.Transaction.StartTransaction;
      Query.SQL.Text := 'select * from MON_ORGANIZATIONS where code = :KO';
      Query.Prepare;
      Query.ParamByName('KO').AsVariant := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 2];
      Query.ExecQuery;
      while not Query.Eof do Query.Next;


      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 3] := Query.FieldByName('NAME_ORGANIZATION').AsString;
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 4] := Query.FieldByName('ID_ORGANIZATION').AsString;
      if Query.RecordCount <> 1 then
         cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, cxGrid2TableView1Duplicate.Index] := 1
                                else
         cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, cxGrid2TableView1Duplicate.Index] := 0;
      Query.Close;
      Query.Transaction.Commit;

      f := _lopen(PansiChar(path + sr.Name), OF_READ);
      size := GetFileSize(f, @size);
      _lclose(f);
      fdate := (FileDateToDateTime(FileAge(path + sr.Name)));
      Query.Transaction.StartTransaction;
      Query.SQL.Text := 'select l.* from MON_IMPORT_LOG l where l.fn = :fn and l.file_size = :file_size and l.file_date = :file_date and l.id_organization = :id_organization';
      Query.Prepare;
      Query.ParamByName('FN').AsString := sr.Name;
      Query.ParamByName('file_size').AsInt64 := size;
      Query.ParamByName('file_date').AsDateTime := fdate;
      Query.ParamByName('id_organization').AsInt64 := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 4];
      Query.ExecQuery;
      if Query.RecordCount <> 0 then cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 0] := 0;
      Query.Close;
      Query.Transaction.Commit;


      cxProgressBar1.Position := cxProgressBar1.Position + 1;
      Application.ProcessMessages;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  cxGrid2TableView1.EndUpdate;
  beFile.Enabled := true;
end;

procedure TfrmImportXls.FormCreate(Sender: TObject);
var
  r : TRegistry;
begin
  cxGrid2TableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1.Items[4].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1.Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1.Items[7].DataBinding.ValueTypeClass := TcxIntegerValueType;

end;

procedure TfrmImportXls.cxGrid2TableView1CellClick(
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

procedure TfrmImportXls.cxButton2Click(Sender: TObject);
var
  isError : boolean;
  ErrorText : string;
  i : integer;
begin
  if cxGrid2TableView1.DataController.RecordCount = 0 then
  begin
    ShowMessage('Вкажить файли для імпорту.');
    exit;
  end;
  isError := false;
  cxProgressBar1.Properties.Max := cxGrid2TableView1.DataController.RecordCount - 1;
  for i := 0 to cxGrid2TableView1.DataController.RecordCount - 1 do if cxGrid2TableView1.DataController.Values[i, 0] = 1 then
  begin
    ImportFile(beFile.Text + cxGrid2TableView1.DataController.Values[i, 1], cxGrid2TableView1.DataController.Values[i, 4], isError, ErrorText, StrToDate(cxGrid2TableView1.DataController.Values[i, 6]));
    if isError then cxGrid2TableView1.DataController.Values[i, 5] := 1 else cxGrid2TableView1.DataController.Values[i, 5] := 0;
    cxProgressBar1.Position := cxProgressBar1.Position + 1;
    Application.ProcessMessages;
  end;
  ShowMessage('Імпорт виконано.');
end;


procedure TfrmImportXls.xlWorkbookBeforeSave(ASender: TObject;
  const Wb: _Workbook; SaveAsUI: WordBool; var Cancel: WordBool);
begin
 //SaveAsUI := FALSE;
 //cANCEL := FALSE;
end;

procedure TfrmImportXls.cxGrid2TableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ADone := false;
  if AViewInfo.GridRecord.Values[cxGrid2TableView1Duplicate.Index] = 1 then
  begin
    ACanvas.Brush.Color := clRed;
    ACanvas.Font.Style := [fsBold];
  end
  else
  begin
//    ACanvas.Br//.Color := clBlack;
    ACanvas.Font.Style := [];
  end;
end;

procedure TfrmImportXls.cxGrid2TableView1DblClick(Sender: TObject);
var
  i, o : TAArray;
begin
  if cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, cxGrid2TableView1Duplicate.Index] = 1 then
  begin
    i := TAArray.Create;
    o := TAArray.Create;
    i['DBHandle'].AsInteger := integer(Database.Handle);
    i['Owner'].AsObject := Self;
    i['FormStyle'].AsVariant := fsNormal;
    i['code'].AsString := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, cxGrid2TableView1Code.index];
    LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\Organizations.bpl', i, o);
    if o['ModalResult'].AsInteger = mrOk then
    begin
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, cxGrid2TableView1Organization.Index] := o['NAME_ORGANIZATION'].AsString;
      cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, cxGrid2TableView1ID_ORGANIZATION.Index] := o['ID_ORGANIZATION'].AsInt64;
    end;
    i.Free;
    o.Free;
  end;
end;

procedure TfrmImportXls.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
  if doFind then FindInDir(beFile.Text);
  doFind := false;
end;

end.



