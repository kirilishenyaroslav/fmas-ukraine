unit BuffRelations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, dbcgrids, DB, FIBDataSet, pFIBDataSet, Mask,
  cxLookAndFeelPainters, cxButtons, cxHeader, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDBEdit, Grids, DBGrids,
  FIBQuery, pFIBQuery, pFIBStoredProc, IBSQL, FIBDatabase, pFIBDatabase,
  IBDatabase, IBEXTERNALS, IB_EXTERNALS, ShellApi, IniFiles, ExtCtrls;

type
  TStringArray = array of string;
  TfrmRelations = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    DataSource: TDataSource;
    pFIBDataSet_sel: TpFIBDataSet;
    DBEdit_field: TDBEdit;
    cxHeader1: TcxHeader;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pFIBDataSet_selRDBPARAMETER_NAME: TFIBStringField;
    pFIBDataSet_selRDBPROCEDURE_NAME: TFIBStringField;
    pFIBDataSet_selRDBPARAMETER_NUMBER: TFIBSmallIntField;
    pFIBDataSet_selRDBPARAMETER_TYPE: TFIBSmallIntField;
    pFIBDataSet_selRDBFIELD_SOURCE: TFIBStringField;
    pFIBDataSet_selRDBDESCRIPTION: TMemoField;
    pFIBDataSet_selRDBSYSTEM_FLAG: TFIBSmallIntField;
    pFIBDataSet_selDBF_FIELDS: TFIBStringField;
    DBEdit_dbf_field: TDBEdit;
    cxDBButtonEdit1: TcxDBButtonEdit;
    pFIBStoredProc: TpFIBStoredProc;
    DBMemo1: TDBMemo;
    pFIBDataSet_buff_relat: TpFIBDataSet;
    Button1: TButton;
    pFIBDataSet_selFIELDS_TYPE: TFIBStringField;
    DBEdit1: TDBEdit;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    Memo2: TMemo;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
  id_bankbuff: Integer;
  path: String;
  alias: String;
    { Public declarations }
  end;

var
  frmRelations: TfrmRelations;
  type_dbf: String;

implementation
uses BankBuff, DbfIFields, cxCheckListBox, IBase;

{$R *.dfm}


function GetIBType(HalcyonField : TField): String;
begin
  if HalcyonField.DataType = ftString then
  begin
    Result := 'VARCHAR ' + '(' + IntToStr(HalcyonField.DataSize - 1) + ')';
  end;
  if HalcyonField.DataType = ftInteger then Result := 'INTEGER';
  if HalcyonField.DataType = ftSmallint then Result := 'SMALLINT';
  if HalcyonField.DataType = ftWord then Result := 'INTEGER';
  if HalcyonField.DataType = ftBoolean then Result := 'INTEGER';
  if HalcyonField.DataType = ftFloat then Result := 'NUMERIC(16,2)';
  if HalcyonField.DataType = ftCurrency then Result := 'NUMERIC(16,2)';
  if HalcyonField.DataType = ftDate then Result := 'DATE';
  if HalcyonField.DataType = ftTime then Result := 'TIME';
  if HalcyonField.DataType = ftDateTime then Result := 'TIMESTAMP';
end;

//разбор строки
function ParseString(s : string; const divider : STRING) : TStringArray;
var
  i: Integer;
begin
  Result := Nil;
  i := pos(divider,s);
  if i = 0 then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[Length(Result) - 1]:= Trim(s);
    end;
  while i <> 0 do
  begin
    i := pos(divider,s);
    SetLength(Result, Length(Result) + 1);
    Result[Length(Result) - 1]:= copy(s,1,i - 1);
    delete(s,1,i);
    i := pos(divider,s);
    if i = 0 then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[Length(Result) - 1]:= Trim(s);
    end;
  end;
end;

procedure TfrmRelations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRelations.FormCreate(Sender: TObject);
begin
    //
end;

procedure TfrmRelations.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  frmdbf : TfrmDbfFields;
  s : string;
  i, j, k : integer;
  field_array : TStringArray;
begin
  if not FileExists(path + '\' + alias) then
  begin
    ShowMessage('Файл ' +  alias + ' по пути ' +  path +  ' не найден');
  end
  else
  begin
    frmdbf := TfrmDbfFields.Create(Self);

    field_array := ParseString(pFIBDataSet_sel.fieldByName('dbf_fields').AsString, ',');
    for k := 0 to Length(field_array) - 1 do
    begin
      for j := 0 to frmdbf.cxCheckListBox1.Count - 1 do
      begin
        if frmdbf.cxCheckListBox1.Items[j].Text = field_array[k] then frmdbf.cxCheckListBox1.Items[j].Checked := true;
      end;
    end;

    if frmdbf.ShowModal = mrOk then
    begin
      s := '';
      type_dbf := '';
      for i := 0 to frmdbf.cxCheckListBox1.Count - 1 do
      begin
        if frmdbf.cxCheckListBox1.Items[i].Checked then
        begin
          s := s  + frmdbf.cxCheckListBox1.Items[i].Text + ',';//наименование поля
          type_dbf := type_dbf + frmdbf.types[i] + ',';
        end;
      end;
      s := Copy(s, 1, Length(s) - 1);
      type_dbf := Copy(type_dbf, 1, Length(type_dbf) - 1);
      pFIBDataSet_sel.CacheModify([7, 8], [s, type_dbf], 0);
    end;
    frmdbf.Free;
  end;
end;

procedure TfrmRelations.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelations.cxButton2Click(Sender: TObject);
begin
   try
     pFIBStoredProc.Transaction.StartTransaction;
     pFIBStoredProc.StoredProcName := 'DOG_BANKBUFF_RELATION_DELETE';
     pFIBStoredProc.ParamByName('id_bank_buff').Value := id_bankbuff;
     pFIBStoredProc.ExecProc;

     pFIBDataSet_sel.First;
     while not pFIBDataSet_sel.Eof do
     begin
      pFIBStoredProc.StoredProcName := 'DOG_BANKBUFF_RELATION_INSERT';
      pFIBStoredProc.ParamByName('id_bank_buff').Value := id_bankbuff;
      pFIBStoredProc.ParamByName('name_field').Value := pFIBDataSet_sel.fieldByName('RDB$PARAMETER_NAME').AsString;
      pFIBStoredProc.ParamByName('name_field_dbf').Value := pFIBDataSet_sel.fieldByName('dbf_fields').AsString;
      pFIBStoredProc.ParamByName('type_field_dbf').Value := pFIBDataSet_sel.fieldByName('FIELDS_TYPE').AsString;

      pFIBStoredProc.ExecProc;
      pFIBDataSet_sel.Next;
     end;
     except on e: Exception do
      begin
       ShowMessage(e.Message);
       pFIBStoredProc.Transaction.Rollback;
       Exit;
      end;
     end;

     pFIBStoredProc.Transaction.Commit;

  Close;
end;

procedure TfrmRelations.FormShow(Sender: TObject);
var
  i: Integer;
  st, tp: String;
begin
  pFIBDataSet_sel.Database := TfrmBuff(Self.Owner).pFIBDatabase;
  pFIBDataSet_sel.Transaction := TfrmBuff(Self.Owner).pFIBTransactionRead;
  pFIBDataSet_sel.Active := false;
  pFIBDataSet_sel.Active := true;
  pFIBDataSet_buff_relat.Active := false;
  pFIBDataSet_buff_relat.ParamByName('param').Value := id_bankbuff;
  pFIBDataSet_buff_relat.Active := true;

  pFIBDataSet_buff_relat.FetchAll;
  pFIBDataSet_buff_relat.First;
  while not pFIBDataSet_buff_relat.Eof do
  begin
    pFIBDataSet_sel.Locate('RDB$PARAMETER_NAME', pFIBDataSet_buff_relat.fieldByName('name_field').AsString, []);
    st := pFIBDataSet_buff_relat.FieldByName('NAME_FIELD_DBF').AsString;
    tp := pFIBDataSet_buff_relat.FieldByName('TYPE_FIELD_DBF').AsString;
    pFIBDataSet_sel.CacheModify([7], [st],0);
    pFIBDataSet_sel.CacheModify([8], [tp],0);
    pFIBDataSet_buff_relat.Next;
  end;

//  pFIBDataSet_sel.FetchAll;
//  DBEdit1.Text :=  pFIBDataSet_sel.FieldByName('RDB$PARAMETER_NAME').AsString;
end;



procedure TfrmRelations.Button1Click(Sender: TObject);
var
  i, j: Integer;
  create_text, sel: String;
  sl : TStringList;
  IniFile : TMemIniFile;
  DATABASE_PATH : String;
begin
 if not FileExists(ExtractFileDir(Application.ExeName) + '\' + 'config.ini') then exit;
 IniFile := TMemIniFile.Create(ExtractFileDir(Application.ExeName) + '\' + 'config.ini');

 DATABASE_PATH := 'SET SQL DIALECT 3; SET NAMES WIN1251; CONNECT ''server1212:RELEASE'' USER ''SYSDBA'' PASSWORD ''masterkey'';';


  pFIBDataSet_buff_relat.First;
  for i := 0 to pFIBDataSet_buff_relat.RecordCount - 1 do
  begin
    sel := sel + pFIBDataSet_buff_relat.FieldByName('name_field_dbf').AsString + ' '+
           pFIBDataSet_buff_relat.FieldByName('type_field_dbf').AsString + ', ';
    pFIBDataSet_buff_relat.Next;
  end;
  delete(sel,Length(sel)-1,1);
  j := pos('.',alias);
  delete(alias,j,4);
  create_text := 'Create table ttt' + alias + '(' + sel + ');' + '  ' + 'commit work;';
  sl := TStringList.Create;
  sl.Add(DATABASE_PATH);
  sl.Add(create_text);

  sl.SaveToFile('c:\temp.sql');
  sl.Free;

  ShellExecute(0, 'Open', 'ibescript.exe', 'c:\temp.sql -Vout.txt', nil, SW_HIDE);
  sleep(100);
  Timer1.Enabled := True;

 {
  pFIBTransaction1.StartTransaction;
  pFIBStoredProc.Transaction := pFIBTransaction1;
  pFIBStoredProc.StoredProcName := 'DOG_DT_BANKBUFF_UPDATE';
  pFIBStoredProc.ParamByName('id_bank_buff').Value := id_bankbuff;
  pFIBStoredProc.ParamByName('name_table_buff').Value := 'dog_dt_buffer_' + alias;
  pFIBStoredProc.ExecProc;

  pFIBTransaction1.Commit;}

end;

procedure TfrmRelations.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Memo2.Lines.LoadFromFile('out.txt');
end;

end.
