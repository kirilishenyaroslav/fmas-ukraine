unit uOrganizationsImportPrograms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxProgressBar, cxMemo,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxLabel, FIBDatabase, pFIBDatabase, pFIBStoredProc,
  FIBQuery, pFIBQuery, DB, Halcn6db, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGridLevel, cxGrid, AArray, LoaderUnit,
  ComCtrls, uMonuLoader, cxCheckBox;

type
  TfrmImportPrg = class(TForm)
    cxLabel7: TcxLabel;
    cxButtonEdit6: TcxButtonEdit;
    cxButton6: TcxButton;
    ProgressBar: TcxProgressBar;
    Bevel1: TBevel;
    cxButton2: TcxButton;
    HalcyonDataSet: THalcyonDataSet;
    Database: TpFIBDatabase;
    Query: TpFIBQuery;
    StoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    OpenDialog: TOpenDialog;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    cxMemo1: TcxMemo;
    cxGrid1: TcxGrid;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    cxGrid1TableView1Column3: TcxGridColumn;
    cxGrid1TableView1Column4: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2TableView1: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGrid2Level1: TcxGridLevel;
    Panel1: TPanel;
    cxButton1: TcxButton;
    Panel2: TPanel;
    cxButton3: TcxButton;
    cxCheckBox1: TcxCheckBox;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButtonEdit6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1TableView1Column3PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Info(const text : string);
  end;

var
  frmImportPrg: TfrmImportPrg;

implementation

uses Math;

{$R *.dfm}

procedure TfrmImportPrg.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportPrg.cxButton6Click(Sender: TObject);
var
 added      : integer;
 ignored    : integer;
 np         : Variant;
// name_org   : Variant;
 short_name : Variant;
 kob        : Variant;
 y          : Variant;
 prg        : Variant;
 kod        : string;
 id_org     : int64;
 id_prg    : int64;
 ap : integer;
 i1, i2 : integer;
begin
  added                       := 0;
  ignored                     := 0;
  ProgressBar.Position        := 0;
  ap                          := 0;
  HalcyonDataSet.DatabaseName := ExtractFilePath(cxButtonEdit6.Text);
  HalcyonDataSet.TableName    := ExtractFileName(cxButtonEdit6.Text);
  try
    HalcyonDataSet.Open
  except
    ShowMessage('Помилка відкриття файлу');
    HalcyonDataSet.Close;
    exit;
  end;
  WriteTransaction.StartTransaction;

  Info('Файл: ' + cxButtonEdit6.Text);
  Info('Кількість записів: ' + IntToStr(HalcyonDataSet.RecordCount));
  ProgressBar.Properties.Max := HalcyonDataSet.RecordCount;
  cxGrid1TableView1.DataController.RecordCount := 0;
  cxGrid2TableView1.DataController.RecordCount := 0;
  while not HalcyonDataSet.Eof do
  begin
    ProgressBar.Position := ProgressBar.Position + 1;
    Application.ProcessMessages;

    np := HalcyonDataSet['KPOL'];
    kod := IntToStr(np);
    if Length(kod) = 1 then kod := '00' + kod;
    if Length(kod) = 2 then kod := '0' + kod;
    y := HalcyonDataSet['RIK'];
    prg := HalcyonDataSet['KFK'];
    prg := Copy(prg, 4, Length(prg) - 3);
    short_name := HalcyonDataSet['NAME_SHORT'];
    Short_name := StringReplace(short_name, '?', 'і', []);
    Short_name := StringReplace(short_name, '?', 'і', []);
    Short_name := StringReplace(short_name, '?', 'і', []);


    id_org := -1;
    Query.Close;
    Query.SQL.Text := 'select * from MON_ORGANIZATIONS_FIND(:CODE, :NAME)';
    Query.Prepare;
    Query.ParamByName('CODE').AsString := kod;
    Query.ParamByName('NAME').AsString := short_name;
    Query.ExecQuery;
    if Query.RecordCount = 0 then
    begin
      Query.Close;
      i1 := cxGrid2TableView1.DataController.FindRecordIndexByText(0, 0, kod, false, false, true);
      i2 := cxGrid2TableView1.DataController.FindRecordIndexByText(0, 1, short_name, false, false, true);
      if (i1 <> i2)  or (i1 = -1) or (i2 = -1) then
      begin
        cxGrid2TableView1.DataController.RecordCount := cxGrid2TableView1.DataController.RecordCount + 1;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 0] := kod;
        cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 1] := short_name;
        inc(ignored);
        Info(' ! Організація (' + VarToStr(kod) + ') "' + VarToStr(short_name) + '"  не існує');
      end;
      HalcyonDataSet.Next;
      Continue;
    end;
    id_org := Query.FieldByName('ID_ORGANIZATION').AsInt64;
    if Query.FieldByName('IS_MULT').AsInteger = 1 then begin
      i1 := cxGrid1TableView1.DataController.FindRecordIndexByText(0, 0, kod, false, false, true);
      i2 := cxGrid1TableView1.DataController.FindRecordIndexByText(0, 1, short_name, false, false, true);
      if (i1 <> i2)  or (i1 = -1) or (i2 = -1) then
      begin
        cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 0] := kod;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 1] := short_name;
        Query.Close;
        HalcyonDataSet.Next;
        Continue;
      end;
//      info(' ==== ' + kod + ' ==== ' + short_name);
    end;
    Query.Close;


{    Query.Close;
    Query.SQL.Text := 'select count(*) from MON_ORGANIZATIONS where (CODE = :NP)';
    Query.Prepare;
    Query.ParamByName('NP').AsString := kod;
    Query.ExecQuery;
    if Query.FieldByName('COUNT').AsInteger > 1 then inc(mm);
    Query.Close;}

    id_prg := -1;
    Query.Close;
    Query.SQL.Text := 'select * from MON_SP_PROGRAM where (CODE = :CODE)';
    Query.Prepare;
    Query.ParamByName('CODE').AsInteger := prg;
    Query.ExecQuery;
    if Query.RecordCount = 0 then
    begin
      Query.Close;
      Query.SQL.Text := 'select ID_PROGRAM from MON_SP_PROGRAM_INS(null, :CODE, ''''' + ')';
      Query.Prepare;
      Query.ParamByName('CODE').AsInteger := prg;
      Query.ExecQuery;
      id_prg := Query.FieldByName('ID_PROGRAM').AsInt64;
      Query.Close;
      inc(ap);
      Info(' + Додана программа ' + VarToStr(PRG));
//      HalcyonDataSet.Next;
//      Continue;
    end else id_prg := Query.FieldByName('ID_PROGRAM').AsInt64;
    Query.Close;


    Query.Close;
    Query.SQL.Text := 'select op.* from ' +
                      'mon_org_programs op  ' +
                      'left join mon_sp_program p on (op.id_program = p.id_program) ' +
                      'where op.id_organization = :id_organization and op.use_beg = :use_beg and op.use_end = :use_end and p.code = :prg';
    Query.Prepare;
    Query.ParamByName('id_organization').AsInt64 := id_org;
    Query.ParamByName('use_beg').AsDate := EncodeDate(y, 1, 1);
    Query.ParamByName('use_end').AsDate := EncodeDate(y, 12, 31);
    Query.ParamByName('prg').AsInteger := prg;
    Query.ExecQuery;
    if Query.RecordCount <> 0 then
    begin
      Query.Close;
      info('! Вже існує (' + VarToStr(kod) + ') "' + short_name + '", програма: ' + VarToStr(PRG));
      HalcyonDataSet.Next;
      Continue;
    end;
    Query.Close;

    Query.SQL.Text := 'select ID_ORG_PROGRAMS from MON_ORG_PROGRAMS_INS(:id_organization, :id_program, :s_num, :use_beg, :use_end)';
    Query.Prepare;
    Query.ParamByName('id_organization').AsInt64 := id_org;
    Query.ParamByName('id_program').AsInt64 := id_prg;
    Query.ParamByName('s_num').AsVariant := 0;
    Query.ParamByName('use_beg').AsDateTime := EncodeDate(y, 1, 1);
    Query.ParamByName('use_end').AsDateTime := EncodeDate(y, 12, 31);
    Query.ExecQuery;
    Query.Close;
    inc(added);
    Info(' + Додано до організації (' + VarToStr(kod) + ') "' + short_name + '", програма: ' + VarToStr(PRG));

    HalcyonDataSet.Next
  end;
  Info('Імпорт виконано!');
  Info('Усього записів оброблено: ' + IntToStr(HalcyonDataSet.RecordCount));
  Info('Додано до організацій: ' + IntToStr(added));
  Info('Додано програм: ' + IntToStr(ap));
  Info('Не знайдено організацій: ' + IntToStr(ignored));


  WriteTransaction.Commit;
  HalcyonDataSet.Close;
  Showmessage('Імпорт виконано');
end;

procedure TfrmImportPrg.Info(const text: string);
begin
  if not cxCheckBox1.Checked then exit;
  cxMemo1.Lines.Add(text);
end;

procedure TfrmImportPrg.cxButtonEdit6PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if not OpenDialog.Execute then exit;
  TcxButtonEdit(Sender).Text := OpenDialog.FileName;
end;

procedure TfrmImportPrg.FormCreate(Sender: TObject);
begin
 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;

 cxGrid2TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid2TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
end;

procedure TfrmImportPrg.cxGrid1TableView1Column3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['code'].AsString := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0];
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\Organizations.bpl', i, o);
  if o['ModalResult'].AsVariant = mrOk then
  begin
    cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2] := o['name_organization'].AsString;
    cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3] := o['id_organization'].AsInt64;
  end;
  i.Free;
  o.Free;
end;

procedure TfrmImportPrg.cxButton1Click(Sender: TObject);
var
 i : integer;
 code, name_org : string;
begin
  if cxGrid2TableView1.DataController.RecordCount = 0 then exit;
  ProgressBar.Properties.Max := cxGrid2TableView1.DataController.RecordCount;
  ProgressBar.Position := 0;

  WriteTransaction.StartTransaction;

  while cxGrid2TableView1.DataController.RecordCount <> 0 do
  begin
    cxGrid2TableView1.DataController.FocusedRecordIndex := 0;
    code := cxGrid2TableView1.DataController.Values[0, 0];
    name_org := cxGrid2TableView1.DataController.Values[0, 1];

    Query.Close;
    Query.SQL.Text := 'select id_organization from MON_ORGANIZATIONS_INS(null, :name, :short_name, null, :code, null, null, null, null, null, null, null, 0, (select first(1) id_type_org from mon_sp_type_org), 1, null)';
    Query.Prepare;
    Query.ParamByName('name').AsString := name_org;
    Query.ParamByName('short_name').AsString := name_org;
    Query.ParamByName('code').AsString := code;
    Query.ExecQuery;
    Query.Close;

    Info(' + Додано організацію (' + code + ') "' + name_org + '"');
    cxGrid2TableView1.DataController.DeleteFocused;
    ProgressBar.Position := ProgressBar.Position + 1;
    Application.ProcessMessages;
  end;

  WriteTransaction.Commit;
  Showmessage('Усі організації було додано');
end;

procedure TfrmImportPrg.cxButton3Click(Sender: TObject);
var
  i : integer;
  id_org : int64;
  code, name_org : string;
  code_dbf, name_org_dbf : string;
  np : integer; 
begin
  if cxGrid1TableView1.DataController.RecordCount = 0 then exit;

  HalcyonDataSet.DatabaseName := ExtractFilePath(cxButtonEdit6.Text);
  HalcyonDataSet.TableName    := ExtractFileName(cxButtonEdit6.Text);
  try
    HalcyonDataSet.Open
  except
    ShowMessage('Помилка відкриття файлу');
    HalcyonDataSet.Close;
    exit;
  end;

  WriteTransaction.StartTransaction;

  for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do if not VarIsNull(cxGrid1TableView1.DataController.Values[i, 3]) then
  begin
    id_org := cxGrid1TableView1.DataController.Values[i, 3];
    code := cxGrid1TableView1.DataController.Values[i, 0];
    name_org := cxGrid1TableView1.DataController.Values[i, 1];
    HalcyonDataSet.First;
    while not HalcyonDataSet.Eof do
    begin
      np := HalcyonDataSet['KPOL'];
      code_dbf := IntToStr(np);
      if Length(code_dbf) = 1 then code_dbf := '00' + code_dbf;
      if Length(code_dbf) = 2 then code_dbf := '0' + code_dbf;
      name_org_dbf := HalcyonDataSet['NAME_SHORT'];
      name_org_dbf := StringReplace(name_org_dbf, '?', 'і', []);
      name_org_dbf := StringReplace(name_org_dbf, '?', 'і', []);
      name_org_dbf := StringReplace(name_org_dbf, '?', 'і', []);

      if (code = code_dbf) and (name_org = name_org_dbf) then
      begin
        Query.Close;
        Query.SQL.Text := 'update mon_organizations set short_name = ' + QuotedStr(name_org_dbf) + ' where id_organization = ' + IntToStr(id_org);
        Query.ExecQuery;
        Query.Close;
        Info(' ! Оновлена організація (' + code + ') "' +  name_org + '"');  
        break;
      end;
      HalcyonDataSet.Next;
    end;
  end;
  HalcyonDataSet.Close;
  WriteTransaction.Commit;
  ShowMessage('Виконано');
end;

end.

