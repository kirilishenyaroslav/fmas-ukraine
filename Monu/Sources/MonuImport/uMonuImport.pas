unit uMonuImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxProgressBar, cxMemo, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, AArray, DB, Halcn6db,
  cxCheckBox, LoaderUnit, Registry;

type
  TfrmImport = class(TForm)
    cxButton2: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxButton3: TcxButton;
    cxLabel2: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxButton4: TcxButton;
    cxMemo1: TcxMemo;
    cxLabel3: TcxLabel;
    ProgressBar: TcxProgressBar;
    Bevel1: TBevel;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    OpenDialog: TOpenDialog;
    HalcyonDataSet: THalcyonDataSet;
    Query: TpFIBQuery;
    cxButtonEdit3: TcxButtonEdit;
    cxLabel4: TcxLabel;
    cxButton1: TcxButton;
    cbKekv: TcxCheckBox;
    cxButtonEdit4: TcxButtonEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxButtonEdit5: TcxButtonEdit;
    cxButton5: TcxButton;
    cxLabel7: TcxLabel;
    cxButtonEdit6: TcxButtonEdit;
    cxButton6: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
  private
  public
    input, output : TAArray;
    id_type_org   : int64; 
    procedure Info(const text : string);
  end;

var
  frmImport: TfrmImport;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;


implementation
uses IB_EXTERNALS, uMonuImportDbf, uMonuImportXls;
{$R *.dfm}


function Load(input, res : TAArray) : boolean;
var
 frm  : TfrmImport;
 frm2 : TfrmImportDbf;
 frm3 : TfrmImportXls;
 r : TRegistry;
begin
  Result              := true;

  if input['ImportForm'].AsVariant = 1 then
  begin
    frm                 := TfrmImport.Create(TComponent(input['Owner'].asObject));
    frm.input           := TAArray.Create;
    input.CopyTo(frm.input);
    frm.output          := res;
    frm.FormStyle       := frm.input['FormStyle'].AsVariant;
    frm.Database.Handle := pvoid(frm.input['DBHandle'].asInteger);
    if frm.FormStyle = fsNormal then
    begin
      frm.output['MoadResult'].AsVariant := frm.ShowModal;
      frm.Free;
    end;
  end;
  if input['ImportForm'].AsVariant = 2 then
  begin
    frm2                := TfrmImportDbf.Create(TComponent(input['Owner'].asObject));
    frm2.input           := TAArray.Create;
    input.CopyTo(frm2.input);
    frm2.output          := res;
    frm2.FormStyle       := frm2.input['FormStyle'].AsVariant;
    frm2.Database.Handle := pvoid(frm2.input['DBHandle'].asInteger);
    
   { r := TRegistry.Create;
    r.RootKey := HKEY_CURRENT_USER;
    r.OpenKey('Software\FMAS\MONU\', true);
    frm2.beFile.Text := r.ReadString('DbfPath');
    r.Free;
    if frm2.beFile.Text <> '' then frm2.FindInDir(frm2.beFile.Text);    }

    if frm2.FormStyle = fsNormal then
    begin
      frm2.output['MoadResult'].AsVariant := frm2.ShowModal;
      frm2.Free;
    end;
  end;
  if input['ImportForm'].AsVariant = 3 then
  begin
    frm3                := TfrmImportXls.Create(TComponent(input['Owner'].asObject));
    frm3.input           := TAArray.Create;
    input.CopyTo(frm3.input);
    frm3.output          := res;
    frm3.FormStyle       := frm3.input['FormStyle'].AsVariant;
    frm3.Database.Handle := pvoid(frm3.input['DBHandle'].asInteger);

    r := TRegistry.Create;
    r.RootKey := HKEY_CURRENT_USER;
    r.OpenKey('Software\FMAS\MONU\', true);
    frm3.beFile.Text := r.ReadString('XlsPath');
    r.Free;
    frm3.doFind := frm3.beFile.Text <> '';

    if frm3.FormStyle = fsNormal then
    begin
      frm3.output['MoadResult'].AsVariant := frm3.ShowModal;
      frm3.Free;
    end;
  end;

end;


procedure TfrmImport.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmImport.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 if not OpenDialog.Execute then exit;
 TcxButtonEdit(Sender).Text := OpenDialog.FileName;
end;

procedure TfrmImport.cxButton3Click(Sender: TObject);
var
 kf, kr, kp, kv : Variant;
 name_form, num_form, ost : Variant;
 added, ignored : integer;
 id_form_code, id_kvk, id_program, id_type_form : int64;
 name_program : Variant;
begin
  added                       := 0;
  ignored                     := 0;
  ProgressBar.Position        := 0;
  HalcyonDataSet.DatabaseName := ExtractFilePath(cxButtonEdit1.Text);
  HalcyonDataSet.TableName    := ExtractFileName(cxButtonEdit1.Text);
  try
    HalcyonDataSet.Open
  except
    ShowMessage('Помилка відкриття файлу');
    HalcyonDataSet.Close;
    exit;
  end;
  WriteTransaction.StartTransaction;

  Info('Файл: ' + cxButtonEdit1.Text);
  Info('Кількість записів: ' + IntToStr(HalcyonDataSet.RecordCount));
  ProgressBar.Properties.Max := HalcyonDataSet.RecordCount;
  while not HalcyonDataSet.Eof do
  begin
    ProgressBar.Position := ProgressBar.Position + 1;
    Application.ProcessMessages;

    kf := HalcyonDataSet['KF'];
    kr := HalcyonDataSet['Kr'];
    kp := HalcyonDataSet['Kp'];
    kv := HalcyonDataSet['Kv'];
    name_program := HalcyonDataSet['OPN'];
    name_form := HalcyonDataSet['OP'];
    ost := HalcyonDataSet['OST'];
    Query.Close;
    Query.SQL.Text := 'select * from MON_IMPORT_IS_FORM_EXISTS(:KF, :KR, :KP, :KV, :NAME_PROGRAM)';
    Query.Prepare;
    Query.ParamByName('KF').AsVariant := kf;
    Query.ParamByName('KR').AsVariant := kr;
    Query.ParamByName('KP').AsVariant := kP;
    Query.ParamByName('KV').AsVariant := kV;
    Query.ParamByName('NAME_PROGRAM').AsVariant := name_program;
    Query.ExecQuery;
    id_form_code := Query.FieldByName('id_form_code').AsInt64;
    id_kvk := Query.FieldByName('id_kvk').AsInt64;
    id_program := Query.FieldByName('id_program').AsInt64;
    id_type_form := Query.FieldByName('id_type_form').AsInt64;
    if Query.FieldByName('CNT').AsInteger <> 0 then
    begin
      Query.Close;
      inc(ignored);
      Info(' ! ' + VarToStr(KF) + ' ' + VarToStr(KR) + ' ' + VarToStr(KP) + ' ' + VarToStr(KV) + ': ' + VarToStr(num_form) + ' -> Вже існує');
      HalcyonDataSet.Next;
      Continue;
    end;
    Query.Close;

    Query.SQL.Text := 'select id_form from MON_SP_FORM_INS (:ID_FORM_CODE, :ID_KVK, :ID_PROGRAM, :ID_TYPE_FORM, :NAME_FORM, :NUM_FORM, :OST)';
    Query.Prepare;
    Query.ParamByName('ID_FORM_CODE').AsInt64 := id_form_code;
    Query.ParamByName('ID_KVK').AsInt64 := id_kvk;
    Query.ParamByName('ID_PROGRAM').AsInt64 := id_program;
    Query.ParamByName('ID_TYPE_FORM').AsInt64 := id_type_form;
    Query.ParamByName('OST').AsVariant := ost;
    Query.ParamByName('NAME_FORM').AsVariant := name_form;
    Query.ParamByName('NUM_FORM').AsVariant := '';
    Query.ExecQuery;
    Query.Close;
    inc(added);
    Info(' + ' + VarToStr(KF) + ' ' + VarToStr(KR) + ' ' + VarToStr(KP) + ' ' + VarToStr(KV) + ': ' + VarToStr(name_form) + ' -> Додано');

    HalcyonDataSet.Next
  end;
  Info('Імпорт виконано!');
  Info('Усього записів оброблено: ' + IntToStr(HalcyonDataSet.RecordCount));
  Info('Додано: ' + IntToStr(added));
  Info('Відхилено: ' + IntToStr(ignored));


  WriteTransaction.Commit;
  HalcyonDataSet.Close
end;

procedure TfrmImport.Info(const text: string);
begin
  cxMemo1.Lines.Add(text);
end;

procedure TfrmImport.cxButton4Click(Sender: TObject);
var
 added      : integer;
 ignored    : integer;
 np         : Variant;
 name_org   : Variant;
 short_name : Variant;
 kob        : Variant;
begin
  added                       := 0;
  ignored                     := 0;
  ProgressBar.Position        := 0;
  HalcyonDataSet.DatabaseName := ExtractFilePath(cxButtonEdit2.Text);
  HalcyonDataSet.TableName    := ExtractFileName(cxButtonEdit2.Text);
  try
    HalcyonDataSet.Open
  except
    ShowMessage('Помилка відкриття файлу');
    HalcyonDataSet.Close;
    exit;
  end;
  WriteTransaction.StartTransaction;

  Info('Файл: ' + cxButtonEdit2.Text);
  Info('Кількість записів: ' + IntToStr(HalcyonDataSet.RecordCount));
  ProgressBar.Properties.Max := HalcyonDataSet.RecordCount;
  while not HalcyonDataSet.Eof do
  begin
    ProgressBar.Position := ProgressBar.Position + 1;
    Application.ProcessMessages;

    np := HalcyonDataSet['NP'];
    name_org := HalcyonDataSet['NAIM'];
    short_name := HalcyonDataSet['AB'];
    kob := HalcyonDataSet['KOB'];

    Query.Close;
    Query.SQL.Text := 'select * from MON_ORGANIZATIONS where (CODE = :NP) and (id_type_org = :id_type_org)';
    Query.Prepare;
    Query.ParamByName('NP').AsVariant := np;
    Query.ParamByName('ID_TYPE_ORG').asInt64 := id_type_org;
    Query.ExecQuery;
    if Query.RecordCount <> 0 then
    begin
      Query.Close;
      inc(ignored);
      Info(' ! ' + VarToStr(np) + ' ' + VarToStr(name_org) + ' -> Вже існує');
      HalcyonDataSet.Next;
      Continue;
    end;
    Query.Close;

    Query.SQL.Text := 'select id_organization from MON_ORGANIZATIONS_INS (Null, :NAME_ORG, :SHORT_NAME, Null, :NP, Null, Null, Null, Null, Null, Null, Null, :KOB, :ID_TYPE_ORG, 1, '''')';
    Query.Prepare;
    Query.ParamByName('NAME_ORG').AsVariant := name_org;
    Query.ParamByName('SHORT_NAME').AsVariant := short_name;
    Query.ParamByName('NP').AsVariant := np;
    Query.ParamByName('KOB').AsVariant := kob;
    Query.ParamByName('ID_TYPE_ORG').AsInt64 := id_type_org;
    Query.ExecQuery;
    Query.Close;
    inc(added);
    Info(' + ' + VarToStr(np) + ' ' + VarToStr(name_org) + ' -> Додано');

    HalcyonDataSet.Next
  end;
  Info('Імпорт виконано!');
  Info('Усього записів оброблено: ' + IntToStr(HalcyonDataSet.RecordCount));
  Info('Додано: ' + IntToStr(added));
  Info('Відхилено: ' + IntToStr(ignored));


  WriteTransaction.Commit;
  HalcyonDataSet.Close
end;

procedure TfrmImport.cxButton1Click(Sender: TObject);
var
 added, kadded : integer;
 ignored, errors : integer;
 c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20 : Variant;
 kf, kg, ig : Variant;
 ns, ks     : Variant;
 id_kekv    : int64;
 kekv       : Variant;
 id_form_code : int64;
begin
  added                       := 0;
  ignored                     := 0;
  kadded                      := 0;
  errors                      := 0;
  ProgressBar.Position        := 0;
  HalcyonDataSet.DatabaseName := ExtractFilePath(cxButtonEdit3.Text);
  HalcyonDataSet.TableName    := ExtractFileName(cxButtonEdit3.Text);
  try
    HalcyonDataSet.Open
  except
    ShowMessage('Помилка відкриття файлу');
    HalcyonDataSet.Close;
    exit;
  end;
  WriteTransaction.StartTransaction;

  Info('Файл: ' + cxButtonEdit3.Text);
  Info('Кількість записів: ' + IntToStr(HalcyonDataSet.RecordCount));
  ProgressBar.Properties.Max := HalcyonDataSet.RecordCount;
  while not HalcyonDataSet.Eof do
  begin
    ProgressBar.Position := ProgressBar.Position + 1;
    Application.ProcessMessages;

    kf := HalcyonDataSet['KF'];
    kg := HalcyonDataSet['KG'];
    ig := HalcyonDataSet['IG'];
    ns := HalcyonDataSet['NS'];
    ks := HalcyonDataSet['KS'];
    kekv := HalcyonDataSet['KEKV'];
    c1 := HalcyonDataSet['OG1'];
    c2 := HalcyonDataSet['OG2'];
    c3 := HalcyonDataSet['OG3'];
    c4 := HalcyonDataSet['OG4'];
    c5 := HalcyonDataSet['OG5'];
    c6 := HalcyonDataSet['OG6'];
    c7 := HalcyonDataSet['OG7'];
    c8 := HalcyonDataSet['OG8'];
    c9 := HalcyonDataSet['OG9'];
    c10 := HalcyonDataSet['OG10'];
    c11 := HalcyonDataSet['OG11'];
    c12 := HalcyonDataSet['OG12'];
    c13 := HalcyonDataSet['OG13'];
    c14 := HalcyonDataSet['OG14'];
    c15 := HalcyonDataSet['OG15'];
    c16 := HalcyonDataSet['OG16'];
    c17 := HalcyonDataSet['OG17'];
    c18 := HalcyonDataSet['OG18'];
    c19 := HalcyonDataSet['OG19'];
    c20 := HalcyonDataSet['OG20'];

    // Находим КЕКВ
    ID_KEKV := -1;
    if not VarIsNull(kekv) then
    begin
      Query.Close;
      Query.SQL.Text := 'select k.* from pub_spr_kekv k where k.kekv_kode = :KEKV';
      Query.Prepare;
      Query.ParamByName('KEKV').AsVariant := kekv;
      Query.ExecQuery;
      if Query.RecordCount = 0 then //КЕКВ не найден
      begin
        Query.Close;

        Query.Close;
        Query.SQL.Text := 'select id_res from MON_PUB_SPR_KEKV_INS(:KEKV, :TITLE, :ENABLED)';
        Query.Prepare;
        Query.ParamByName('KEKV').AsVariant := kekv;
        Query.ParamByName('TITLE').AsVariant := NS;
        if cbKekv.Checked then Query.ParamByName('ENABLED').AsInteger := 1
                          else Query.ParamByName('ENABLED').AsInteger := 0;
        Query.ExecQuery;
        ID_KEKV := Query.FieldByName('ID_RES').AsInt64;
        inc(kadded);
        Info('   + Додано КЕКВ: ' + VarToStr(kekv) + ' - ' + VarToStr(ns));
      end else ID_KEKV := Query.FieldByName('ID_KEKV').AsInt64;
      Query.Close;
    end;

    // Получаем связь с формой и получаем ключ для связки
    Query.Close;
    Query.SQL.Text := 'select id_form_code from mon_sp_form_code where name_form_code = :KF';
    Query.ParamByName('KF').AsVariant := kf;
    Query.Prepare;
    Query.ExecQuery;
    if Query.RecordCount = 0 then
    begin
      Query.Close;
      Info(' E> Не знайден код форми: ' + VarToStr(KF));
      HalcyonDataSet.Next;
      Continue;
    end else id_form_code := Query.FieldByName('id_form_code').AsInt64;
    Query.Close;


    Query.SQL.Text := 'select id_line from MON_SP_LINES_INS(:code_line, :name_line, :id_kekv, ' +
                      ':id_form_code, :kg, :ig, :col1, :col2, :col3, :col4, :col5, :col6, ' +
                      ':col7,  :col8,  :col9,  :col10,  :col11,  :col12,  :col13,  :col14, :col15, ' +
                      ':col16,  :col17,  :col18,  :col19,  :col20)';
    Query.Prepare;
    Query.ParamByName('code_line').AsVariant := ks;
    Query.ParamByName('name_line').AsVariant := ns;
    if id_kekv = -1 then Query.ParamByName('ID_KEKV').AsVariant := Null
                    else Query.ParamByName('ID_KEKV').AsInt64 := id_kekv;
    Query.ParamByName('id_form_code').AsInt64 := id_form_code;
    Query.ParamByName('kg').AsVariant := kg;
    Query.ParamByName('ig').AsVariant := ig;
    Query.ParamByName('col1').AsVariant := c1;
    Query.ParamByName('col2').AsVariant := c2;
    Query.ParamByName('col3').AsVariant := c3;
    Query.ParamByName('col4').AsVariant := c4;
    Query.ParamByName('col5').AsVariant := c5;
    Query.ParamByName('col6').AsVariant := c6;
    Query.ParamByName('col7').AsVariant := c7;
    Query.ParamByName('col8').AsVariant := c8;
    Query.ParamByName('col9').AsVariant := c9;
    Query.ParamByName('col10').AsVariant := c10;
    Query.ParamByName('col11').AsVariant := c11;
    Query.ParamByName('col12').AsVariant := c12;
    Query.ParamByName('col13').AsVariant := c13;
    Query.ParamByName('col14').AsVariant := c14;
    Query.ParamByName('col15').AsVariant := c15;
    Query.ParamByName('col16').AsVariant := c16;
    Query.ParamByName('col17').AsVariant := c17;
    Query.ParamByName('col18').AsVariant := c18;
    Query.ParamByName('col19').AsVariant := c19;
    Query.ParamByName('col20').AsVariant := c20;

    Query.ExecQuery;
    Query.Close;
    inc(added);
    Info(' + ' + VarToStr(ns) + ' ' + VarToStr(ks) + ' -> Додано');

    HalcyonDataSet.Next
  end;
  if errors = 0 then Info('Імпорт виконано!') else Info('Імпорт НЕ виконано');
  Info('Усього записів оброблено: ' + IntToStr(HalcyonDataSet.RecordCount));
  Info('Додано: ' + IntToStr(added));
  Info('Додано КЕКВ: ' + IntToStr(kadded));
  Info('Відхилено: ' + IntToStr(ignored));
  Info('Помылок: ' + IntToStr(errors));

  if errors = 0 then WriteTransaction.Commit else WriteTransaction.Rollback;
  HalcyonDataSet.Close
end;

procedure TfrmImport.cxButtonEdit4PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_type_org.spr', 'Main');
  i['FormStyle'].AsInteger := integer(fsNormal);
  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);
///  o.View(Self);
  if o['ModalResult'].AsInteger = mrOk then
  begin
    cxButtonEdit4.Text := o['name_type_org'].AsString;
    id_type_org := o['id_type_org'].AsInt64;
  end;
  i.Free;
  o.Free;
end;

procedure TfrmImport.FormCreate(Sender: TObject);
begin
  id_type_org := -1;
end;

function changeq(str : string) : string;
var
  i : integer;
begin
 Result := '';
 if str = '' then exit;
 for i := 1 to Length(str) do if str[i] = '?' then str[i] := 'і';
 Result := str;
end; 

procedure TfrmImport.cxButton5Click(Sender: TObject);
var
 added      : integer;
 ignored    : integer;
 np         : Variant;
 name_org   : Variant;
 short_name : Variant;
 kob        : Variant;
 kstr       : string;
begin
  added                       := 0;
  ignored                     := 0;
  ProgressBar.Position        := 0;
  HalcyonDataSet.DatabaseName := ExtractFilePath(cxButtonEdit5.Text);
  HalcyonDataSet.TableName    := ExtractFileName(cxButtonEdit5.Text);
  try
    HalcyonDataSet.Open
  except
    ShowMessage('Помилка відкриття файлу');
    HalcyonDataSet.Close;
    exit;
  end;
  WriteTransaction.StartTransaction;

  Info('Файл: ' + cxButtonEdit2.Text);
  Info('Кількість записів: ' + IntToStr(HalcyonDataSet.RecordCount));
  ProgressBar.Properties.Max := HalcyonDataSet.RecordCount;
  while not HalcyonDataSet.Eof do
  begin
    ProgressBar.Position := ProgressBar.Position + 1;
    Application.ProcessMessages;

    np := HalcyonDataSet['KPOL'];
    name_org := changeq(HalcyonDataSet['NAME_FULL']);
    short_name := changeq(HalcyonDataSet['NAME_SHORT']);
    kob := HalcyonDataSet['KOD_OBL'];

    {Query.Close;
    Query.SQL.Text := 'select * from MON_ORGANIZATIONS where (CODE = :NP)';
    Query.Prepare;
    Query.ParamByName('NP').AsVariant := np;
    Query.ExecQuery;
    if Query.RecordCount <> 0 then
    begin
      Query.Close;
      inc(ignored);
      Info(' ! ' + VarToStr(np) + ' ' + VarToStr(name_org) + ' -> Вже існує');
      HalcyonDataSet.Next;
      Continue;
    end;
    Query.Close;     }
    kstr := IntToStr(np);
    if Length(kstr) = 1 then kstr := '00' + kstr;
    if Length(kstr) = 2 then kstr := '0' + kstr;

    Query.SQL.Text := 'select id_organization from MON_ORGANIZATIONS_INS_TMP (Null, :NAME_ORG, :SHORT_NAME, Null, :NP, Null, Null, Null, Null, Null, Null, Null, :KOB, 399)';
    Query.Prepare;
    Query.ParamByName('NAME_ORG').AsVariant := name_org;
    Query.ParamByName('SHORT_NAME').AsVariant := short_name;
    Query.ParamByName('NP').AsString := kstr;
    Query.ParamByName('KOB').AsString := IntToStr(kob);
//    Query.ParamByName('ID_TYPE_ORG').AsInt64 := id_type_org;
    Query.ExecQuery;
    Query.Close;
    inc(added);

    Info(' + ' + VarToStr(np) + ' ' + VarToStr(name_org) + ' -> Додано');

    HalcyonDataSet.Next
  end;
  Info('Імпорт виконано!');
  Info('Усього записів оброблено: ' + IntToStr(HalcyonDataSet.RecordCount));
  Info('Додано: ' + IntToStr(added));
  Info('Відхилено: ' + IntToStr(ignored));

 // WriteTransaction.Rollback;
  WriteTransaction.Commit;
  HalcyonDataSet.Close;
end;


procedure TfrmImport.cxButton6Click(Sender: TObject);
var
 added      : integer;
 ignored    : integer;
 np         : Variant;
 name_org   : Variant;
 short_name : Variant;
 kob        : Variant;
 y          : Variant;
 prg        : Variant;
 kod        : string;
 id_org     : int64;
 id_prg    : int64;
begin
  added                       := 0;
  ignored                     := 0;
  ProgressBar.Position        := 0;
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

    id_org := -1;
    Query.Close;
    Query.SQL.Text := 'select * from MON_ORGANIZATIONS where (CODE = :NP)';
    Query.Prepare;
    Query.ParamByName('NP').AsString := kod;
    Query.ExecQuery;
    if Query.RecordCount = 0 then
    begin
      Query.Close;
      inc(ignored);
//      Info(' ! ' + VarToStr(np) + ' ' + VarToStr(name_org) + ' -> не існує');
      HalcyonDataSet.Next;
      Continue;
    end;
    id_org := Query.FieldByName('ID_ORGANIZATION').AsInt64;
    Query.Close;

    id_prg := -1;
    Query.Close;
    Query.SQL.Text := 'select * from MON_SP_PROGRAM where (CODE = :CODE)';
    Query.Prepare;
    Query.ParamByName('CODE').AsInteger := prg;
    Query.ExecQuery;
    if Query.RecordCount = 0 then
    begin
      Query.Close;
      inc(ignored);
      Info(' ! программа ' + VarToStr(PRG) + ' ' + ' -> не існує');
      HalcyonDataSet.Next;
      Continue;
    end;
    id_prg := Query.FieldByName('ID_PROGRAM').AsInt64;
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
    Info(' + ' + VarToStr(prg) + ' -> Додано');

    HalcyonDataSet.Next
  end;
  Info('Імпорт виконано!');
  Info('Усього записів оброблено: ' + IntToStr(HalcyonDataSet.RecordCount));
  Info('Додано: ' + IntToStr(added));
  Info('Відхилено: ' + IntToStr(ignored));


  WriteTransaction.Commit;
  HalcyonDataSet.Close
end;

end.

