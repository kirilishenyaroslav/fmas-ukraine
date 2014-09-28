unit dogSpecUnit;

interface

uses
  Windows, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, ImgList, Controls,
  cxGridTableView, cxTL, FIBDatabase, pFIBDatabase, dxBar, dxBarExtItems,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet,
  dxStatusBar, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Classes, ExtCtrls, Forms,
  DogLoaderUnit, IBASE, Dialogs, AddDogSpecUnit, SysUtils, cxTextEdit,
  cxContainer, StdCtrls, cxLabel, cxMemo, cxDBEdit, AccMgmt, Variants;

type
  TfrmDogSpec = class(TForm)
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    WriteProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    WorkDatabase: TpFIBDatabase;
    ViewButton: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DisabledLargeImages: TImageList;
    DisabledSmallImages: TImageList;
    SmallImages: TImageList;
    LargeImages: TImageList;
    Panel1: TPanel;
    dxStatusBar1: TdxStatusBar;
    DataSetID_SPEC: TFIBBCDField;
    DataSetPLAN_PRICE: TFIBBCDField;
    DataSetTOP_PRICE: TFIBBCDField;
    DataSetTOP_PRICE_PERCENT: TFIBBCDField;
    DataSetBOTTOM_PRICE: TFIBBCDField;
    DataSetBOTTOM_PRICE_PERCENT: TFIBBCDField;
    DataSetID_MATERIAL: TFIBBCDField;
    DataSetNAME_MATERIAL: TFIBStringField;
    DataSetTP: TStringField;
    DataSetBP: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID_SPEC: TcxGridDBColumn;
    cxGrid1DBTableView1PLAN_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1TOP_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1TOP_PRICE_PERCENT: TcxGridDBColumn;
    cxGrid1DBTableView1BOTTOM_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1BOTTOM_PRICE_PERCENT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MATERIAL: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_MATERIAL: TcxGridDBColumn;
    cxGrid1DBTableView1TP: TcxGridDBColumn;
    cxGrid1DBTableView1BP: TcxGridDBColumn;
    Panel2: TPanel;
    Label1: TLabel;
    FilterEdit: TcxTextEdit;
    cxGrid1DBTableView1LAST_PRICE: TcxGridDBColumn;
    DataSetCOMMENT: TFIBStringField;
    DataSetLAST_PRICE: TFIBBCDField;
    cxDBMemo1: TcxDBMemo;
    cxLabel1: TcxLabel;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction2: TpFIBTransaction;
    cxGrid1DBTableView1VOLUME: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    DataSetVOLUME: TFIBBCDField;
    DataSetPLAN_COST: TFIBBCDField;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    WriteTransaction: TpFIBTransaction;
    DataSetPLAN_COST_NDS: TFIBBCDField;
    cxGrid1DBTableView1SUMMA_NDS: TcxGridDBColumn;
    DataSetSUMMA: TFIBBCDField;
    DataSetSUMMA_NDS: TFIBBCDField;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DataSetCalcFields(DataSet: TDataSet);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
  public
    a_in   : DogLoaderUnit.TSpravParams;
    a_out  : DogLoaderUnit.PSpravParams;
    id_dog : int64;
    procedure SelectAll;
    procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
  end;

  procedure Load(Owner : TComponent; input : DogLoaderUnit.PSpravParams; output : DogLoaderUnit.PSpravParams); stdcall;
  exports Load;

implementation
uses
    WSUnit, LangUnit, IB_EXTERNALS;

{$R *.dfm}
procedure Load(Owner : TComponent; input : DogLoaderUnit.PSpravParams; output : DogLoaderUnit.PSpravParams); stdcall;
var
  frm : TfrmDogSpec;
begin

 frm := TfrmDogSpec.Create(Owner);
 frm.a_in := input^;
 frm.a_out := output;
 frm.id_dog := frm.a_in['ID_DOG'];
 frm.a_out^['CHANGED'] := 0;
 frm.Label3.Caption := FormatFloat('0.00', frm.a_in['summa']);

 if frm.a_in['OnlyView'] = true then
 begin
   frm.AddButton.Enabled := false;
   frm.dxBarLargeButton1.Enabled := false;
   frm.dxBarLargeButton2.Enabled := false;
   frm.EditButton.Enabled := false;
   frm.DeleteButton.Enabled := false;
 end;

 frm.InitConnection(PVoid(integer(frm.a_in['Database'])), PVoid(integer(frm.a_in['ReadTransaction'])), PVoid(integer(frm.a_in['WriteTransaction'])));
 frm.WriteTransaction2.Handle := pvoid(integer(frm.a_in['WriteTransaction2'])); 
// frm.FormStyle := frm.a_in['FormStyle'].AsVariant;

 if frm.FormStyle = fsNormal then
 begin
   frm.ShowModal;
   frm.Free;
 end
 else
 begin
///   frm.a_out['Handle'].AsVariant := frm.Handle;
   frm.show;
   frm.Repaint;
   frm.SelectAll;
 end;
end;

procedure TfrmDogSpec.InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
begin
 WorkDatabase.Handle := DBhandle;
 ReadTransaction.Handle := RTransaction;
 WriteTransaction.Handle := WTransaction;
end;

procedure TfrmDogSpec.SelectAll;
begin
 DataSet.Close;
 DataSet.ParamByName('ID_DOG').AsInt64 := id_dog;
 DataSet.Open;
end;

procedure TfrmDogSpec.ExitButtonClick(Sender: TObject);
begin
 if not VarIsNull(cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[1]) then
   if cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[1] > a_in['summa']
   then
   begin
     showMessage('Сума специфікаціі перевищує суму кошториса.');
     exit;
   end;
// if cxGrid1DBTableView1. input['summa']
 Close;
end;

procedure TfrmDogSpec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 SavePositionToRegistry(Self);
 Action := caFree;
end;

procedure TfrmDogSpec.RefreshButtonClick(Sender: TObject);
var
 selected : int64;
begin
 selected := -1;

 if DataSet.RecordCount <> 0 then selected := TFIBBCDField(DataSet.fbn('ID_SPEC')).AsInt64;
 SelectAll;
 DataSet.Locate('ID_SPEC', selected, []);
end;

procedure TfrmDogSpec.FormShow(Sender: TObject);
begin
 LoadPositionFromRegistry(Self);
 if FormStyle = fsNormal then begin
   SelectAll;
 end;
 cxGrid1.SetFocus;
end;

procedure TfrmDogSpec.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
 if fibCheckPermission('/ROOT/DOG/SPEC','Add') <> 0 then
 begin
   AddButton.Enabled := false;
   dxBarLargeButton1.Enabled := false;
   dxBarLargeButton2.Enabled := false;
 end;
 if fibCheckPermission('/ROOT/DOG/SPEC','Edit') <> 0 then EditButton.Enabled := false;
 if fibCheckPermission('/ROOT/DOG/SPEC','Del') <> 0 then DeleteButton.Enabled := false;
end;

procedure TfrmDogSpec.EditButtonClick(Sender: TObject);
var
 frm : TfrmAddSpec;
 id : int64;
begin
  if DataSet.RecordCount = 0 then exit;
  id := TFIBBCDField(DataSet.FieldByName('ID_SPEC')).AsInt64;
  frm := TfrmAddSpec.Create(Self);
  frm.db_handle := WorkDatabase.Handle;
  frm.sel_mode := 0;
  frm.r_trans := ReadTransaction.Handle;
  frm.w_trans := WriteTransaction2.Handle;
  frm.MatEdit.Text := DataSet.FBN('NAME_MATERIAL').asString;
  frm.id_material := TFIBBCDField(DataSet.FBN('ID_MATERIAL')).asInt64;
  frm.PlanPriceEdit.Text := FloatToStr(DataSet.FBN('PLAN_PRICE').asCurrency);
  frm.TopPriceEdit.Text := FloatToStr(DataSet.FBN('TOP_PRICE').asCurrency);
  frm.TopPricePercentEdit.Text := FloatToStr(DataSet.FBN('TOP_PRICE_PERCENT').asCurrency);
  frm.BottomPriceEdit.Text := FloatToStr(DataSet.FBN('BOTTOM_PRICE').asCurrency);
  frm.BottomPricePercentEdit.Text := FloatToStr(DataSet.FBN('BOTTOM_PRICE_PERCENT').asCurrency);
  frm.CommentEdit.Text := DataSet.FBN('COMMENT').asString;
  frm.LastPriceEdit.Text := FloatToStr(DataSet.FBN('LAST_PRICE').asCurrency);
  frm.VolumeEdit.Text := FloatToStr(DataSet.FBN('VOLUME').asCurrency);
  frm.SummaEdit.Text := FloatToStr(DataSet.FBN('SUMMA').AsCurrency);
  frm.SummaNDSEdit.Text := FloatToStr(DataSet.FBN('SUMMA_NDS').AsCurrency);
  frm.LastPriceEdit.Visible := true;
  frm.cxLabel7.Visible := true;

  if frm.ShowModal = mrOk then
  begin
//    WriteProc.Transaction.StartTransaction;
    WriteProc.StoredProcName := 'DOG_DT_SPEC_UPD';
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_DOG').AsInt64 := id_dog;
    WriteProc.ParamByName('ID_SPEC').AsInt64 := id;
    WriteProc.ParamByName('PLAN_PRICE').AsCurrency := StrToFloat(frm.PlanPriceEdit.Text);
    WriteProc.ParamByName('TOP_PRICE').AsCurrency := StrToFloat(frm.TopPriceEdit.Text);
    WriteProc.ParamByName('TOP_PRICE_PERCENT').AsCurrency := StrToFloat(frm.TopPricePercentEdit.Text);
    WriteProc.ParamByName('BOTTOM_PRICE').AsCurrency := StrToFloat(frm.BottomPriceEdit.Text);
    WriteProc.ParamByName('BOTTOM_PRICE_PERCENT').AsCurrency := StrToFloat(frm.BottomPricePercentEdit.Text);
    WriteProc.ParamByName('ID_MATERIAL').AsInt64 := frm.id_material;
    WriteProc.ParamByName('COMMENT').AsString := frm.CommentEdit.Text;
    WriteProc.ParamByName('LAST_PRICE').AsCurrency := StrToFloat(frm.LastPriceEdit.Text);
    WriteProc.ParamByName('BOTTOM_PRICE').AsCurrency := StrToFloat(frm.BottomPriceEdit.Text);
    WriteProc.ParamByName('volume').AsCurrency := StrToFloat(frm.VolumeEdit.Text);
    WriteProc.ParamByName('SUMMA').AsCurrency := StrToFloat(frm.SummaEdit.Text);
    WriteProc.ParamByName('SUMMA_NDS').AsCurrency := StrToFloat(frm.SummaNDSEdit.Text);
    WriteProc.ExecProc;
    WriteProc.Close;
//    WriteProc.Transaction.Commit;
    SelectAll;
    DataSet.Locate('ID_SPEC', id, []);
    a_out^['CHANGED'] := 1;
  end;
  frm.Free;

end;

procedure TfrmDogSpec.ViewButtonClick(Sender: TObject);
begin
 if DataSet.RecordCount = 0 then exit;
end;

procedure TfrmDogSpec.DeleteButtonClick(Sender: TObject);
var
 selected : Int64;
 i : integer;
begin
 if DataSet.RecordCount = 0 then exit;

 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex;

 if MessageDlg('Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;


 if cxGrid1DBTableView1.DataController.GetSelectedCount = 1 then
 begin

//  WriteProc.Transaction.StartTransaction;
  WriteProc.StoredProcName := 'DOG_DT_SPEC_DEL';
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SPEC').AsInt64 := TFIBBCDField(DataSet.FieldByName('ID_SPEC')).AsInt64;
  WriteProc.ExecProc;
  // WriteProc.Transaction.Commit;
  WriteProc.Close;
  a_out^['CHANGED'] := 1;
 end
 else
 begin
   for i := 0 to cxGrid1DBTableView1.DataController.GetSelectedCount - 1 do
   begin
     cxGrid1DBTableView1.DataController.FocusedRowIndex := cxGrid1DBTableView1.DataController.GetSelectedRowIndex(i);
//     WriteProc.Transaction.StartTransaction;
     WriteProc.StoredProcName := 'DOG_DT_SPEC_DEL';
     WriteProc.Prepare;
     WriteProc.ParamByName('ID_SPEC').AsInt64 := TFIBBCDField(DataSet.FieldByName('ID_SPEC')).AsInt64;
     WriteProc.ExecProc;
     // WriteProc.Transaction.Commit;
     WriteProc.Close;
     a_out^['CHANGED'] := 1;
   end;
 end;

 SelectAll;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TfrmDogSpec.AddButtonClick(Sender: TObject);
var
 frm : TfrmAddSpec;
 new_id : int64;
begin
  frm := TfrmAddSpec.Create(Self);
  frm.sel_mode := 0;
  frm.db_handle := WorkDatabase.Handle;
  frm.r_trans := ReadTransaction.Handle;
  frm.w_trans := WriteTransaction2.Handle;
  if TdxBarLargeButton(Sender).Tag = 1 then
  begin
    frm.MatEdit.Visible := false;
    frm.cxLabel2.Visible := false;
    frm.MatEdit2.Visible := true;
    frm.lbShablon.Visible := true;
    frm.SummaEdit.Visible := false;
    frm.SummaNDSEdit.Visible := false;
    frm.lbSumma.Visible := false;
    frm.lbSummaNDS.Visible := false;
  end;
  if TdxBarLargeButton(Sender).Tag = 2 then
  begin
    frm.sel_mode := 2;
    frm.SummaEdit.Visible := false;
    frm.SummaNDSEdit.Visible := false;
    frm.lbSumma.Visible := false;
    frm.lbSummaNDS.Visible := false;
  end;
  if frm.ShowModal = mrOk then
  begin
//    WriteProc.Transaction.StartTransaction;
    WriteProc.StoredProcName := 'DOG_DT_SPEC_ADD';
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_DOG').AsInt64 := id_dog;
    WriteProc.ParamByName('PLAN_PRICE').AsCurrency := StrToFloat(frm.PlanPriceEdit.Text);
    WriteProc.ParamByName('TOP_PRICE').AsCurrency := StrToFloat(frm.TopPriceEdit.Text);
    WriteProc.ParamByName('TOP_PRICE_PERCENT').AsCurrency := StrToFloat(frm.TopPricePercentEdit.Text);
    WriteProc.ParamByName('BOTTOM_PRICE').AsCurrency := StrToFloat(frm.BottomPriceEdit.Text);
    WriteProc.ParamByName('BOTTOM_PRICE_PERCENT').AsCurrency := StrToFloat(frm.BottomPricePercentEdit.Text);
    WriteProc.ParamByName('ID_MATERIAL').AsInt64 := frm.id_material;
    WriteProc.ParamByName('COMMENT').ASString := frm.CommentEdit.Text;
    WriteProc.ParamByName('LAST_PRICE').AsCurrency := StrToFloat(frm.LastPriceEdit.Text);
    WriteProc.ParamByName('ID_SHABLON').asInt64 := frm.id_shablon;
    WriteProc.ParamByName('VOLUME').AsCurrency := StrToFloat(frm.VolumeEdit.Text);
    WriteProc.ParamByName('SUMMA').AsCurrency := StrToFloat(frm.SummaEdit.Text);
    WriteProc.ParamByName('SUMMA_NDS').AsCurrency := StrToFloat(frm.SummaNDSEdit.Text);
    WriteProc.ExecProc;
    new_id := WriteProc['ID_SPEC'].asInt64;
    WriteProc.Close;
//    WriteProc.Transaction.Commit;
    SelectAll;
    DataSet.Locate('ID_SPEC', new_id, []);
    a_out^['CHANGED'] := 1;
  end;
  frm.Free;
end;

procedure TfrmDogSpec.DataSetCalcFields(DataSet: TDataSet);
var
 s : string;
begin
 if DataSet.RecordCount = 0 then exit;
 if DataSetTop_PRICE_PERCENT.Value > 0 then s := '+' else s := '';
 DataSetTP.Value := FormatFloat('0.0000', DataSetTOP_PRICE.Value) + ' (' + s + FormatFloat('0.00', DataSetTop_PRICE_PERCENT.Value) + '%)';
 if DataSetBOTTOM_PRICE_PERCENT.Value > 0 then s := '+' else s := '';
 DataSetBP.Value := FormatFloat('0.0000', DataSetBOTTOM_PRICE.Value) + ' (' + s + FormatFloat('0.00', DataSetBOTTOM_PRICE_PERCENT.Value) + '%)';
end;

procedure TfrmDogSpec.cxTextEdit1PropertiesChange(Sender: TObject);
begin
 if FilterEdit.Text = '' then
 begin
   DataSet.Filtered := false;
   DataSet.Filter := '';
   exit;
 end;
 DataSet.Filtered := false;
 DataSet.Filter := 'UPPER(NAME_MATERIAL) like ' + QuotedStr('%' + AnsiUpperCase(FilterEdit.Text) + '%');
 DataSet.Filtered := true;
end;

end.




