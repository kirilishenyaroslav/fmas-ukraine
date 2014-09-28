unit uMonuForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AArray, dxBar, dxBarExtItems, DB, FIBDataSet, pFIBDataSet,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, cxMaskEdit, FIBDatabase, pFIBDatabase, ImgList,
  cxGridTableView, cxClasses, ExtCtrls, cxLabel, cxContainer, cxEdit,
  cxTextEdit, uMonuFormAdd, FIBQuery, pFIBQuery, pFIBStoredProc, Ib_externals,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid;

const
 edit_margin = 16;

type
  TfrmSpravLinear = class(TForm)
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
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
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
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
    GridDBTableView1CONCAT: TcxGridDBColumn;
    GridDBTableView1ID_FORM: TcxGridDBColumn;
    GridDBTableView1ID_FORM_CODE: TcxGridDBColumn;
    GridDBTableView1ID_KVK: TcxGridDBColumn;
    GridDBTableView1ID_PROGRAM: TcxGridDBColumn;
    GridDBTableView1ID_TYPE_FORM: TcxGridDBColumn;
    GridDBTableView1NAME_FORM: TcxGridDBColumn;
    GridDBTableView1NUM_FORM: TcxGridDBColumn;
    GridDBTableView1OST: TcxGridDBColumn;
    GridDBTableView1FORM_CODE: TcxGridDBColumn;
    GridDBTableView1KVK: TcxGridDBColumn;
    GridDBTableView1PROGRAM: TcxGridDBColumn;
    GridDBTableView1TYPE_FORM: TcxGridDBColumn;
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
    procedure GridDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    input, output : TAArray;
    procedure SelectAll;

  end;
var
  frmSpravLinear: TfrmSpravLinear;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;

implementation


{$R *.dfm}

function Load(input, res : TAArray) : boolean;
var
 frm : TfrmSpravLinear;
begin
  Result := true;
//  ViewArray(Nil, input);
  frm := TfrmSpravLinear.Create(TComponent(input['Owner'].asObject));
  frm.input := TAArray.Create;
  input.CopyTo(frm.input);
//  frm.input := input;
  frm.output := res;
  frm.FormStyle := frm.input['FormStyle'].AsVariant;
  frm.SelButton.Enabled := frm.FormStyle = fsNormal;
  frm.pFIBDatabase1.Handle := pvoid(frm.input['DBHandle'].asInteger);


  frm.SelectAll;


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



procedure TfrmSpravLinear.SelectAll;
begin
 Dataset.Close;
 Dataset.SelectSQL.Text := 'select * from mon_sp_form_sel';
 Dataset.Open;
end;

procedure TfrmSpravLinear.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmSpravLinear.ExitButtonClick(Sender: TObject);
begin
 close;
end;

procedure TfrmSpravLinear.SelButtonClick(Sender: TObject);
var
 i : integer;
begin
 if DataSet.RecordCount <> 0 then
 begin
   for i := 0 to DataSet.FieldCount - 1 do output[DataSet.Fields[i].FieldName].AsVariant := DataSet.Fields[i].Value;
 end;
 ModalResult := mrOk;
end;

procedure TfrmSpravLinear.TreeDblClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;

procedure TfrmSpravLinear.cxTextEdit1PropertiesChange(Sender: TObject);
begin
{ if FilterEdit.Text = '' then
 begin
   GridDBTableView1.DataController.Filter.Root.Clear;
   GridDBTableView1.DataController.Filter.Active := false;
   exit;
 end;
  GridDBTableView1.DataController.Filter.Root.Clear;
  GridDBTableView1.DataController.Filter.Root.AddItem(GridDBTableView1.GetColumnByFieldName(input['SearchField'].AsString), foLike, '%' + AnsiUpperCase(FilterEdit.Text) + '%', '%' + AnsiUpperCase(FilterEdit.Text) + '%');
  GridDBTableView1.DataController.Filter.Active := true;
  }

end;

procedure TfrmSpravLinear.AddButtonClick(Sender: TObject);
var
 frm : TfrmAdd;
 new_id : int64;
 i : integer;
begin
  frm := TfrmAdd.Create(Self);
  frm.Caption := 'Додати форму';
  if frm.ShowModal = mrOk then
  begin                           //MON_SP_FORM_INS       mon_sp_form_ins
    StoredProc.StoredProcName := 'MON_SP_FORM_INS';
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    if frm.Id_Form_Code <> -1 then
      StoredProc.ParamByName('id_form_code').AsInt64 :=  frm.Id_Form_Code
    else
      StoredProc.ParamByName('id_form_code').AsVariant := Null;
    if frm.Id_KVK <> -1 then
      StoredProc.ParamByName('id_kvk').AsInt64 := frm.Id_KVK
    else
      StoredProc.ParamByName('id_kvk').AsVariant := Null;
    if frm.Id_program <> -1 then
      StoredProc.ParamByName('id_program').AsInt64 := frm.Id_program
    else
      StoredProc.ParamByName('id_program').AsVariant := null;
    if frm.Id_Type_Form <> -1 then
      StoredProc.ParamByName('id_type_form').AsInt64 := frm.Id_Type_Form
    else
      StoredProc.ParamByName('id_type_form').AsVariant := Null;

    StoredProc.ParamByName('name_form').AsString := frm.eNameForm.Text;
    StoredProc.ParamByName('num_form').AsString := frm.eNumForm.Text;
    StoredProc.ParamByName('ost').AsVariant := Null;

   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   StoredProc.Close;
   new_id := StoredProc['ID_FORM'].asInt64;
   SelectAll;
   DataSet.Locate('ID_FORM', new_id, []);
 end;
 frm.Free;
end;

procedure TfrmSpravLinear.DeleteButtonClick(Sender: TObject);
var
 i : integer;
 id : integer;
begin
  if DataSet.RecordCount = 0 then exit;
  i := GridDBTableView1.DataController.FocusedRowIndex;
  id := TFIBBCDField(DataSet.FBN('ID_FORM')).AsInt64;
  if MessageDlg('Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  StoredProc.StoredProcName := 'MON_SP_FORM_DEL';
  StoredProc.Transaction.StartTransaction;
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_FORM').AsInt64 := id;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  StoredProc.Close;
  SelectAll;
  GridDBTableView1.DataController.FocusedRowIndex := i;
end;

procedure TfrmSpravLinear.RefreshButtonClick(Sender: TObject);
var
 i : integer;
begin
  i := GridDBTableView1.DataController.FocusedRowIndex;
  SelectAll;
  GridDBTableView1.DataController.FocusedRowIndex := i;
end;

procedure TfrmSpravLinear.EditButtonClick(Sender: TObject);
var
 frm : TfrmAdd;
 id : int64;
 i : integer;
begin
  if DataSet.RecordCount = 0 then exit;
  frm := TfrmAdd.Create(Self);
  frm.Caption := 'Змінити форму';
  frm.eFormCode.Text := DataSet.FBN('FORM_CODE').AsString;
  frm.eKVK.Text := DataSet.FBN('KVK').AsString;
  frm.eProgram.Text := DataSet.FBN('PROGRAM').AsString;
  frm.eTypeForm.Text := DataSet.FBN('TYPE_FORM').AsString;
  frm.Id_Form_Code := TFIBBCDField(DataSet.FBN('ID_FORM_CODE')).AsInt64;
  frm.Id_KVK := TFIBBCDField(DataSet.FBN('ID_KVK')).AsInt64;
  frm.Id_program := TFIBBCDField(DataSet.FBN('ID_PROGRAM')).AsInt64;
  frm.Id_Type_Form := TFIBBCDField(DataSet.FBN('ID_TYPE_FORM')).AsInt64;
  frm.eNameForm.Text := DataSet.FBN('NAME_FORM').AsString;
  frm.eNumForm.Text := DataSet.FBN('NUM_FORM').AsString;
  if frm.ShowModal = mrOk then
  begin
    id := TFIBBCDField(DataSet.FBN('ID_FORM')).AsInt64;
    StoredProc.StoredProcName := 'MON_SP_FORM_UPD';
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_FORM').AsInt64 := id;
    StoredProc.ParamByName('id_form_code').AsInt64 := frm.Id_Form_Code;
    StoredProc.ParamByName('id_kvk').AsInt64 := frm.Id_KVK;
    StoredProc.ParamByName('id_program').AsInt64 := frm.Id_program;
    StoredProc.ParamByName('id_type_form').AsInt64 := frm.Id_Type_Form;
    StoredProc.ParamByName('NAME_FORM').AsString := frm.eNameForm.Text;
    StoredProc.ParamByName('NUM_FORM').AsString := frm.eNumForm.Text;
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    StoredProc.Close;
    SelectAll;
    DataSet.Locate('ID_FORM', id, []);
  end;
  frm.Free;
end;

procedure TfrmSpravLinear.TreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_RETURN then SelButtonClick(Self);
 if key = VK_insert then AddButtonClick(AddButton);
 if key = VK_f3 then EditButtonClick(EditButton);
 if key = VK_f5 then RefreshButtonClick(Self);
 if key = VK_Delete then DeleteButtonClick(Self);
end;

procedure TfrmSpravLinear.FormDestroy(Sender: TObject);
begin
  input.Free;
end;

procedure TfrmSpravLinear.GridDBTableView1DblClick(Sender: TObject);
begin
  if SelButton.Enabled then SelButtonClick(Self);
end;

end.
