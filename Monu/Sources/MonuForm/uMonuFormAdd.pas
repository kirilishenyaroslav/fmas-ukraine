unit uMonuFormAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, aarray, cxButtonEdit,
  FIBQuery, pFIBQuery, cxGroupBox;

type
  TfrmAdd = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Query1: TpFIBQuery;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    beFormCode: TcxButtonEdit;
    beKVK: TcxButtonEdit;
    beProgram: TcxButtonEdit;
    beTypeForm: TcxButtonEdit;
    eTypeForm: TcxTextEdit;
    eFormCode: TcxTextEdit;
    eKVK: TcxTextEdit;
    eProgram: TcxTextEdit;
    eNameForm: TcxTextEdit;
    eNumForm: TcxTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beKVKPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beTypeFormPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beProgramPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure eFormCodeExit(Sender: TObject);
    procedure eKVKExit(Sender: TObject);
    procedure eFormCodeKeyPress(Sender: TObject; var Key: Char);
    procedure eKVKKeyPress(Sender: TObject; var Key: Char);
    procedure eProgramExit(Sender: TObject);
    procedure eProgramKeyPress(Sender: TObject; var Key: Char);
    procedure eTypeFormKeyPress(Sender: TObject; var Key: Char);
    procedure eTypeFormExit(Sender: TObject);
    procedure eTypeFormPropertiesChange(Sender: TObject);
    procedure eNameFormKeyPress(Sender: TObject; var Key: Char);
    procedure eNumFormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure MakeName;
  public
    Id_Form_Code, Id_KVK, Id_Type_Form, Id_program: Int64;

  end;

var
  frmAdd: TfrmAdd;


implementation
uses uMonuform, LoaderUnit, Math;
{$R *.dfm}

procedure TfrmAdd.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmAdd.cxButton1Click(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfrmAdd.FormShow(Sender: TObject);
begin
  eFormCode.SetFocus;
  Query1.Close;
  Query1.SQL.Text := 'select DESCR from mon_sp_form_code where ID_FORM_CODE = :ID_FORM_CODE';
  Query1.Prepare;
  Query1.ParamByName('ID_FORM_CODE').AsInt64 := Id_Form_Code;
  Query1.ExecQuery;
  beFormCode.Text := '';
  if Query1.RecordCount <> 0 then
  begin
    beFormCode.Text := Query1.fieldbyname('DESCR').AsString;
  end;
  Query1.Close;
  Query1.SQL.Text := 'select NAME_KVK from mon_sp_KVK where ID_KVK = :ID_KVK';
  Query1.Prepare;
  Query1.ParamByName('ID_KVK').AsInt64 := Id_KVK;
  Query1.ExecQuery;
  beKVK.Text := '';
  if Query1.RecordCount <> 0 then
  begin
    beKVK.Text := Query1.fieldbyname('NAME_KVK').AsString;
  end;
  Query1.Close;
  Query1.SQL.Text := 'select Name_Program from mon_sp_program where ID_PROGRAM = :ID_PROGRAM';
  Query1.Prepare;
  Query1.ParamByName('ID_PROGRAM').AsInt64 := ID_PROGRAM;
  Query1.ExecQuery;
  if Query1.RecordCount <> 0 then
  begin
    beProgram.Text := Query1.fieldbyname('NAME_Program').AsString;
  end;
  Query1.Close;
  Query1.SQL.Text := 'select NAME_type_form from mon_sp_type_form where ID_Type_Form = :ID_Type_Form';
  Query1.Prepare;
  Query1.ParamByName('ID_Type_Form').AsInt64 := Id_Type_Form;
  Query1.ExecQuery;
  beTypeForm.Text := '';
  if Query1.RecordCount <> 0 then
  begin
    beTypeForm.Text := Query1.fieldbyname('NAME_type_form').AsString;
  end;
  Query1.Close;

end;



procedure TfrmAdd.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(TfrmSpravLinear(owner).pFIBDatabase1.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_form_code.spr', 'Main');
  i['FormStyle'].AsVariant := fsNormal;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);
  if (o['ModalResult'].AsVariant = mrOk) then
  begin
    beFormCode.Text := o['DESCR'].AsString;
    eFormCode.Text := o['NAME_FORM_CODE'].AsString;
    Id_Form_Code := o['Id_Form_Code'].AsInt64;
  end;
  i.Free;
  o.Free;
end;

procedure TfrmAdd.beKVKPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(TfrmSpravLinear(owner).pFIBDatabase1.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_kvk.spr', 'Main');
  i['FormStyle'].AsVariant := fsNormal;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);
  if (o['ModalResult'].AsVariant = mrOk) then
  begin
    beKVK.Text := o['Name_KVK'].AsString;
    eKVK.Text := o['NUM_KVK'].AsString;
    Id_KVK := o['Id_KVK'].AsInt64;
  end;
  i.Free;
  o.Free;
end;

procedure TfrmAdd.beTypeFormPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(TfrmSpravLinear(owner).pFIBDatabase1.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_type_form.spr', 'Main');
  i['FormStyle'].AsVariant := fsNormal;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);
  if (o['ModalResult'].AsVariant = mrOk) then
  begin
    beTypeForm.Text :=o['Name_Type_Form'].AsString;
    eTypeForm.Text :=o['code'].AsString;
    Id_Type_Form := o['Id_Type_Form'].AsInt64;
  end;
  i.Free;
  o.Free;
end;

procedure TfrmAdd.beProgramPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(TfrmSpravLinear(owner).pFIBDatabase1.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_program.spr', 'Main');
  i['FormStyle'].AsVariant := fsNormal;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if (o['ModalResult'].AsVariant = mrOk) then
  begin
    beProgram.Text :=o['Name_Program'].AsString;
    eProgram.Text :=o['Code'].AsString;
    Id_program := o['Id_program'].AsInt64;
  end;
  i.Free;
  o.Free;
end;

procedure TfrmAdd.FormCreate(Sender: TObject);
begin
  Query1.Database := TfrmSpravLinear(owner).pFIBDatabase1;
  Query1.Transaction := TfrmSpravLinear(owner).ReadTransaction;
end;

procedure TfrmAdd.eFormCodeExit(Sender: TObject);
begin
  Query1.Close;
  Query1.SQL.Text := 'select ID_FORM_CODE, DESCR from mon_sp_form_code where NAME_FORM_CODE = :Code';
  Query1.Prepare;
  Query1.ParamByName('Code').AsString := eFormCode.Text;
  Query1.ExecQuery;
  Id_Form_Code := -1;
  beFormCode.Text := '';
  if Query1.RecordCount <> 0 then
  begin
    beFormCode.Text := Query1.fieldbyname('DESCR').AsString;
    Id_Form_Code := Query1.fieldbyname('ID_FORM_CODE').AsInt64;
  end;
  Query1.Close;
end;

procedure TfrmAdd.eKVKExit(Sender: TObject);
begin
  Query1.Close;
  Query1.SQL.Text := 'select ID_KVK, NAME_KVK from mon_sp_KVK where NUM_KVK = :KVK';
  Query1.Prepare;
  Query1.ParamByName('KVK').AsString := eKVK.Text;
  Query1.ExecQuery;
  Id_KVK := -1;
  beKVK.Text := '';
  if Query1.RecordCount <> 0 then
  begin
    beKVK.Text := Query1.fieldbyname('NAME_KVK').AsString;
    Id_KVK := Query1.fieldbyname('ID_KVK').AsInt64;
  end;
  Query1.Close;
end;

procedure TfrmAdd.eFormCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then eKVK.SetFocus;
end;

procedure TfrmAdd.eKVKKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then eProgram.SetFocus;
end;


procedure TfrmAdd.eProgramExit(Sender: TObject);
var
  kod : integer;
begin
  Id_program := -1;
  beProgram.Text := '';
  if (TryStrToInt(eProgram.Text, kod)) then
  begin
    Query1.Close;
    Query1.SQL.Text := 'select ID_PROGRAM, Name_Program from mon_sp_program where CODE = :CODE';
    Query1.Prepare;
    Query1.ParamByName('CODe').AsInteger := kod;
    Query1.ExecQuery;
    if Query1.RecordCount <> 0 then
    begin
      beProgram.Text := Query1.fieldbyname('NAME_Program').AsString;
      Id_program := Query1.fieldbyname('ID_Program').AsInt64;
    end;
  end;
  Query1.Close;
end;

procedure TfrmAdd.eProgramKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then eTypeForm.SetFocus;
end;

procedure TfrmAdd.eTypeFormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then eNameForm.SetFocus;
end;

procedure TfrmAdd.MakeName;
begin
  eNumForm.Text := 'Ô' + eFormCode.Text + '-' + eProgram.Text + '-' + eTypeForm.Text;
end;



procedure TfrmAdd.eTypeFormExit(Sender: TObject);
begin
  Query1.Close;
  Query1.SQL.Text := 'select ID_Type_Form, NAME_type_form from mon_sp_type_form where Code = :Code';
  Query1.Prepare;
  Query1.ParamByName('Code').AsString := eTypeForm.Text;
  Query1.ExecQuery;
  Id_TYpe_Form := -1;
  beTypeForm.Text := '';
  if Query1.RecordCount <> 0 then
  begin
    beTypeForm.Text := Query1.fieldbyname('NAME_type_form').AsString;
    Id_Type_Form := Query1.fieldbyname('ID_type_form').AsInt64;
  end;
  Query1.Close;
end;

procedure TfrmAdd.eTypeFormPropertiesChange(Sender: TObject);
begin
MakeName;
end;

procedure TfrmAdd.eNameFormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then eNumForm.SetFocus;
end;

procedure TfrmAdd.eNumFormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then cxButton1.SetFocus;
end;

end.
