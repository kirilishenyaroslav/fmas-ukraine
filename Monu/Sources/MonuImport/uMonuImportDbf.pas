unit uMonuImportDbf;

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
  Grids, DBGrids, ExcelXP, OleServer, ComObj, cxCheckListBox, cxCheckBox,
  cxImage, ImgList, LoaderUnit, Registry;

type
  TfrmImportDbf = class(TForm)
    beFile: TcxButtonEdit;
    cxLabel1: TcxLabel;
    StoredProc: TpFIBStoredProc;
    Query: TpFIBQuery;
    WriteTransaction: TpFIBTransaction;
    Database: TpFIBDatabase;
    OpenDialog: TOpenDialog;
    HalcyonDataSet: THalcyonDataSet;
    lbOrganization: TcxLabel;
    ReadTransaction: TpFIBTransaction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxProgressBar1: TcxProgressBar;
    mLog: TcxMemo;
    cxLabel3: TcxLabel;
    pFIBQuery1: TpFIBQuery;
    WaitPanel: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    seYear: TcxSpinEdit;
    cxLabel2: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    rb1: TcxRadioButton;
    rb2: TcxRadioButton;
    rb3: TcxRadioButton;
    rb4: TcxRadioButton;
    cxLabel4: TcxLabel;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2TableView1: TcxGridTableView;
    cxGrid2TableView1Column1: TcxGridColumn;
    cxGrid2TableView1Column2: TcxGridColumn;
    cxGrid2TableView1Code: TcxGridColumn;
    cxGrid2TableView1Organization: TcxGridColumn;
    cxGrid2TableView1ID_ORGANIZATION: TcxGridColumn;
    cxGrid2TableView1Column6: TcxGridColumn;
    ImageList1: TImageList;
    cxGrid2TableView1Duplicate: TcxGridColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure seYearExit(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure beFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGrid2TableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid2TableView1Column6CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid2TableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid2TableView1DblClick(Sender: TObject);
  private
  public
    input, output : TAArray;
    maxYear : integer;
    function GetKvartal(const date_in : TDate) : integer;
    procedure Info(const str : string);
    procedure UnpackArchive(const fileName : string);
    procedure FindInDir(const path : string);
    procedure ImportFile(const FileName: string; const id_organization : int64; var isError : boolean; var ErrorText : string);
  end;

var
  frmImportDbf: TfrmImportDbf;

implementation
uses uMonuLoader;

{$R *.dfm}

const
  temp_path = 'c:\monu_temp_dbf\';
var
  import_path : string;

procedure RunProgram(const prg, params : string);
var
  Rlst: LongBool;
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  ExitCode: Cardinal;
begin
  FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);
  with StartUpInfo do
  begin
    cb := SizeOf(TStartUpInfo);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := SW_HIDE;
  end;
  Rlst := CreateProcess(pansichar(prg), pansichar(params), nil, nil, false, NORMAL_PRIORITY_CLASS, nil, nil, StartUpInfo, ProcessInfo);
  if Rlst then
  with ProcessInfo do begin
    WaitForInputIdle(hProcess, INFINITE); // ждем завершения инициализации
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE); // ждем завершения процесса
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode); // получаем код завершения
    CloseHandle(hThread); // закрываем дескриптор процесса
    CloseHandle(hProcess); // закрываем дескриптор потока
  end;

end;

 { TfrmImportDbf }

procedure TfrmImportDbf.cxButton1Click(Sender: TObject);
begin
  Close;
end;

function TfrmImportDbf.GetKvartal(const date_in: TDate): integer;
begin
  Result := -1;
  if (date_in >= EncodeDate(YearOf(date_in), 1, 1)) and (date_in <= EncodeDate(YearOf(date_in), 3, 31)) then Result := 1;
  if (date_in >= EncodeDate(YearOf(date_in), 4, 1)) and (date_in <= EncodeDate(YearOf(date_in), 6, 30)) then Result := 2;
  if (date_in >= EncodeDate(YearOf(date_in), 7, 1)) and (date_in <= EncodeDate(YearOf(date_in), 9, 30)) then Result := 3;
  if (date_in >= EncodeDate(YearOf(date_in), 10, 1)) and (date_in <= EncodeDate(YearOf(date_in), 12, 31)) then Result := 4;
end;

procedure TfrmImportDbf.FormCreate(Sender: TObject);
var
 i : integer;
begin
  i := GetKvartal(date);
  maxYear := YearOf(date);
  if i = 1 then
  begin
    maxYear := YearOf(date) - 1;
    rb4.Checked := true;
  end
  else
  begin
    i := i - 1;
    if i = 1 then rb1.Checked := true;
    if i = 2 then rb2.Checked := true;
    if i = 3 then rb3.Checked := true;
    if i = 4 then rb4.Checked := true;
  end;
  seYear.Value := maxYear;

  cxGrid2TableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1.Items[4].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1.Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1.Items[6].DataBinding.ValueTypeClass := TcxIntegerValueType;
end;

procedure TfrmImportDbf.seYearExit(Sender: TObject);
begin
 if seYear.Value > maxYear then seYear.Value := maxYear;
end;

procedure TfrmImportDbf.cxButton2Click(Sender: TObject);
var
 i          : integer;
 isError    : boolean;
 ErrorText        : string;
begin
  if (beFile.Text = '') or (cxGrid2TableView1.DataController.RecordCount = 0) then
  begin
    showmessage('Вкажіть файл імпорту.');
    exit;
  end;
  isError := false;
  for i := 0 to cxGrid2TableView1.DataController.RecordCount - 1 do if cxGrid2TableView1.DataController.Values[i, 0] = 1 then 
  begin
    ImportFile(import_path + cxGrid2TableView1.DataController.Values[i, 1], cxGrid2TableView1.DataController.Values[i, 4], isError, ErrorText);
    if isError then cxGrid2TableView1.DataController.Values[i, 5] := 1 else cxGrid2TableView1.DataController.Values[i, 5] := 0;
  end;
  ShowMessage('Імпорт виконано.');
end;

procedure TfrmImportDbf.Info(const str: string);
begin
  mLog.Lines.Add(str);
end;

procedure TfrmImportDbf.beFilePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  ext  : string;
  r : TRegistry;
begin
//  OpenDialog.defa
  if not OpenDialog.Execute then exit;
  ext  := UpperCase(ExtractFileExt(OpenDialog.FileName));
  import_path := ExtractFilePath(OpenDialog.FileName);

  r := TRegistry.Create;
  r.RootKey := HKEY_CURRENT_USER;
  r.OpenKey('Software\FMAS\MONU\', true);
  r.WriteString('DbfPath', beFile.Text);
  r.Free;
    
  beFile.Text := import_path;
  if ext = '.RAR' then
  begin
    UnpackArchive(OpenDialog.FileName);
    import_path := temp_path;
  end;
  FindInDir(import_path);

end;

procedure TfrmImportDbf.UnpackArchive(const fileName: string);
begin
  if not DirectoryExists(temp_path) then MkDir(temp_path);
  CopyFile(PAnsichar(FileName), PAnsichar(temp_path + 'baza.rar'), false);
  CopyFile(PAnsichar(ExtractFilePath(Application.ExeName) + 'unpack.bat'), PAnsichar(temp_path + 'unpack.bat'), false);
  CopyFile(PAnsichar(ExtractFilePath(Application.ExeName) + 'rar.exe'), PAnsichar(temp_path + 'rar.exe'), false);
  SetCurrentDir(temp_path);
  RunProgram('unpack.bat', '');
  DeleteFile(temp_path + 'unpack.bat');
  DeleteFile(temp_path + 'rar.exe');
  DeleteFile(temp_path + 'baza.rar');
end;

procedure TfrmImportDbf.FindInDir(const path: string);
var
  sr : TSearchRec;
  i  : integer;
  f    : HFILE;
  size : int64;
  fdate : TDateTime;
  file_full_name : string;
begin
  HalcyonDataSet.DatabaseName := path;
  cxGrid2TableView1.DataController.RecordCount := 0;
  if FindFirst(path + 'bw*.dbf', faAnyFile, sr) = 0 then
  begin
    repeat
      try
        HalcyonDataSet.TableName := sr.Name;
        HalcyonDataSet.Open;
      except
      end;
      if HalcyonDataSet.RecordCount <> 0 then
      begin
        cxGrid2TableView1.DataController.RecordCount := cxGrid2TableView1.DataController.RecordCount + 1;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 0] := 1;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 1] := sr.Name;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 2] := HalcyonDataSet['KO'];
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 5] := -1;
      end;
      HalcyonDataSet.Close;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  if FindFirst(path + 'bt*.dbf', faAnyFile, sr) = 0 then
  begin
    repeat
      try
        HalcyonDataSet.TableName := sr.Name;
        HalcyonDataSet.Open;
      except
      end;
      if HalcyonDataSet.RecordCount <> 0 then
      begin
        cxGrid2TableView1.DataController.RecordCount := cxGrid2TableView1.DataController.RecordCount + 1;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 0] := 1;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 1] := sr.Name;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 2] := HalcyonDataSet['KO'];
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 5] := -1;
      end;
      HalcyonDataSet.Close;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  if FindFirst(path + 'bp*.dbf', faAnyFile, sr) = 0 then
  begin
    repeat
      try
        HalcyonDataSet.TableName := sr.Name;
        HalcyonDataSet.Open;
      except
      end;
      if HalcyonDataSet.RecordCount <> 0 then
      begin
        cxGrid2TableView1.DataController.RecordCount := cxGrid2TableView1.DataController.RecordCount + 1;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 0] := 1;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 1] := sr.Name;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 2] := HalcyonDataSet['KO'];
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 5] := -1;
      end;
      HalcyonDataSet.Close;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  // загружаем названия организаций
  for i := 0 to cxGrid2TableView1.DataController.RecordCount - 1 do
  begin
    Query.Transaction.StartTransaction;
    Query.SQL.Text := 'select * from MON_ORGANIZATIONS where code = :KO';
    Query.Prepare;
    Query.ParamByName('KO').AsVariant := cxGrid2TableView1.DataController.Values[i, 2];
    Query.ExecQuery;
    while not Query.Eof do Query.Next;
    cxGrid2TableView1.DataController.Values[i, 3] := Query.FieldByName('NAME_ORGANIZATION').AsString;
    cxGrid2TableView1.DataController.Values[i, 4] := Query.FieldByName('ID_ORGANIZATION').AsString;
    if Query.RecordCount <> 1 then
         cxGrid2TableView1.DataController.Values[i, cxGrid2TableView1Duplicate.Index] := 1
                                else
         cxGrid2TableView1.DataController.Values[i, cxGrid2TableView1Duplicate.Index] := 0;
    Query.Close;
    Query.Transaction.Commit;

    file_full_name := path + cxGrid2TableView1.DataController.Values[i, 1];
    f := _lopen(PansiChar(file_full_name), OF_READ);
    size := GetFileSize(f, @size);
    _lclose(f);
    fdate := (FileDateToDateTime(FileAge(file_full_name)));
    Query.Transaction.StartTransaction;
    Query.SQL.Text := 'select l.* from MON_IMPORT_LOG l where l.fn = :fn and l.file_size = :file_size and l.file_date = :file_date and l.id_organization = :id_organization';
    Query.Prepare;
    Query.ParamByName('FN').AsString := cxGrid2TableView1.DataController.Values[i, 1];
    Query.ParamByName('file_size').AsInt64 := size;
    Query.ParamByName('file_date').AsDateTime := fdate;
    Query.ParamByName('id_organization').AsInt64 := cxGrid2TableView1.DataController.Values[i, 4];
    Query.ExecQuery;
    if Query.RecordCount <> 0 then cxGrid2TableView1.DataController.Values[i, 0] := 0;
    Query.Close;
    Query.Transaction.Commit;
  end;
end;

procedure TfrmImportDbf.cxGrid2TableView1CellClick(
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

procedure TfrmImportDbf.ImportFile(const FileName: string; const id_organization : int64; var isError : boolean; var ErrorText : string);
var
 kv_num : integer;
 id_session : int64;
 data_date : TDate;
 i : integer;
 f    : HFILE;
 size : int64;
 fdate : TDateTime;
begin
 f := _lopen(PansiChar(FileName), OF_READ);
 size := GetFileSize(f, @size);
  _lclose(f);
 fdate := (FileDateToDateTime(FileAge(FileName)));

  WriteTransaction.StartTransaction;
  isError := false;
  kv_num := -1;

   if rb1.Checked then
   begin
     Data_Date := EncodeDate(seYear.Value, 1, 1);
     kv_num := 1;
   end;
   if rb2.Checked then
   begin Data_Date := EncodeDate(seYear.Value, 4, 1);
     kv_num := 2;
   end;
   if rb3.Checked then
   begin
     Data_Date := EncodeDate(seYear.Value, 7, 1);
     kv_num := 3;
   end;
   if rb4.Checked then
   begin
     Data_Date := EncodeDate(seYear.Value, 10, 1);
     kv_num := 4;
   end;

  pFIBQuery1.SQL.Text := 'select gen_id(GEN_MON_IMPORT_BUFFER_SESSION, 1) as id_session from RDB$Database';
  pFIBQuery1.ExecQuery;
  id_session := pFIBQuery1.FieldByName('id_session').AsInt64;
  pFIBQuery1.Close;

  HalcyonDataSet.DatabaseName := ExtractFilePath(FileName);
  HalcyonDataSet.TableName := ExtractFileName(FileName);

  HalcyonDataSet.Open;
  cxProgressBar1.Position := 0;
  cxProgressBar1.Properties.Max := HalcyonDataSet.RecordCount;
  while not HalcyonDataSet.Eof do
  begin
     try
       StoredProc.StoredProcName := 'MON_IMPORT_BUFFER_INS';
       StoredProc.Prepare;
       StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
       for i := 0 to HalcyonDataSet.FieldCount - 1 do StoredProc.ParamByName(HalcyonDataSet.Fields[i].FullName).AsVariant := HalcyonDataSet.FieldValues[HalcyonDataSet.Fields[i].FullName];
       StoredProc.ExecProc;
       StoredProc.Close;
     except
       on e: Exception do begin
         ErrorText := e.Message;
         isError := true;
         break;
       end;
     end;

     Info(' + ' + VarToStr(HalcyonDataSet.Fields[1].Value) + ' ' + VarToStr(HalcyonDataSet.Fields[2].Value) + ' ' + VarToStr(HalcyonDataSet.Fields[3].Value) + ' ' + VarToStr(HalcyonDataSet.Fields[4].Value));
     cxProgressBar1.Position := cxProgressBar1.Position + 1;
     Application.ProcessMessages;
     HalcyonDataSet.Next;
   end;
   HalcyonDataSet.Close;

   if not isError then
   begin
     WaitPanel.Visible := true;
     Application.ProcessMessages;
     try
       StoredProc.StoredProcName := 'MON_DO_IMPORT';
       StoredProc.Prepare;
       StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
       StoredProc.ParamByName('DATE_DATA').AsDate := data_date;
       StoredProc.ParamByName('IS_KVARTAL').AsInteger := 1;
       StoredProc.ParamByName('KVARTAL_NUM').AsInteger := kv_num;
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
     WaitPanel.Visible := false;
     Application.ProcessMessages;
   end;

  if isError then WriteTransaction.Rollback;

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
  StoredProc.ParamByName('FILE_NAME').AsString := beFile.Text;
  StoredProc.ParamByName('DATE_DATA').AsDate := data_date;
  StoredProc.ParamByName('IS_KVARTAL').AsInteger := 1;
  StoredProc.ParamByName('ID_ORGANIZATION').AsInt64 := id_organization;
  StoredProc.ParamByName('KVARTAL_NUM').AsInteger := kv_num;
  StoredProc.ParamByName('FN').AsString := ExtractFileName(FileName);
  StoredProc.ParamByName('FILE_SIZE').AsInt64 := size;
  StoredProc.ParamByName('FILE_DATE').AsDateTime := fdate;
  StoredProc.ExecProc;
  StoredProc.Close;

  WriteTransaction.Commit;
 // if not isError then ShowMessage('Імпорт виконано успішно.');
end;

procedure TfrmImportDbf.cxGrid2TableView1Column6CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[cxGrid2TableView1Column6.Index] = 1 then begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
    ADone := true;
  end;
  if AViewInfo.GridRecord.Values[cxGrid2TableView1Column6.Index] = 0 then begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 1);
    ADone := true;
  end
end;

procedure TfrmImportDbf.FormDestroy(Sender: TObject);
begin
 // temp_path
end;

procedure TfrmImportDbf.cxGrid2TableView1CustomDrawCell(
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

procedure TfrmImportDbf.cxGrid2TableView1DblClick(Sender: TObject);
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

end.
