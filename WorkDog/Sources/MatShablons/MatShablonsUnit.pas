unit MatShablonsUnit;

interface

uses
  Windows, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, ImgList, Controls,
  cxGridTableView, cxTL, FIBDatabase, pFIBDatabase, dxBar, dxBarExtItems,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet,
  dxStatusBar, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Classes, ExtCtrls, Forms,
  DogLoaderUnit, IBASE, Dialogs, SysUtils, cxTextEdit,
  cxContainer, StdCtrls, cxLabel, cxMemo, cxDBEdit, cxInplaceContainer,
  cxTLData, cxDBTL, cxSplitter, cxMaskEdit, Variants;

type
  TfrmMatShablons = class(TForm)
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
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
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
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1ID_SHABLON: TcxDBTreeListColumn;
    cxDBTreeList1LINKTO: TcxDBTreeListColumn;
    cxDBTreeList1NAME_SHABLON: TcxDBTreeListColumn;
    cxDBTreeList1COMMENT: TcxDBTreeListColumn;
    Panel3: TPanel;
    cxDBMemo1: TcxDBMemo;
    cxLabel1: TcxLabel;
    Panel4: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    DataSet2: TpFIBDataSet;
    DataSource2: TDataSource;
    cxGrid1DBTableView1ID_SHABLON_MATERIAL: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MATERIAL: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_MATERIAL: TcxGridDBColumn;
    dxBarLargeButton4: TdxBarLargeButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure cxDBTreeList1DblClick(Sender: TObject);
  public
    a_in   : DogLoaderUnit.TSpravParams;
    a_out  : DogLoaderUnit.PSpravParams;
    procedure SelectAll;
    procedure SelectMat;
    procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
  end;

 TSpravFuncN = function (aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aFS: TFormStyle; aID_USER : INT64;
                       aID_NOMN: int64; aID_PROP: int64; aNType: integer; aMView: integer; aMSelect:integer; aLang: integer =0):Variant;stdcall;

  procedure Load(Owner : TComponent; input : DogLoaderUnit.PSpravParams; output : DogLoaderUnit.PSpravParams); stdcall;
  exports Load;

implementation
uses
    WSUnit, LangUnit, IB_EXTERNALS, MatShablonsAddUnit;

{$R *.dfm}
procedure Load(Owner : TComponent; input : DogLoaderUnit.PSpravParams; output : DogLoaderUnit.PSpravParams); stdcall;
var
  frm : TfrmMatShablons;
begin

 frm := TfrmMatShablons.Create(Owner);
 frm.a_in := input^;
 frm.a_out := output;

 frm.InitConnection(PVoid(integer(frm.a_in['Database'])), PVoid(integer(frm.a_in['ReadTransaction'])), PVoid(integer(frm.a_in['WriteTransaction'])));
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

procedure TfrmMatShablons.InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE; WTransaction : TISC_TR_HANDLE);
begin
 WorkDatabase.Handle := DBhandle;
 ReadTransaction.Handle := RTransaction;
 WriteTransaction.Handle := WTransaction;
end;

procedure TfrmMatShablons.SelectAll;
begin
 DataSet.Close;
// DataSet.ParamByName('ID_DOG').AsInt64 := id_dog;
 DataSet.Open;
 SelectMat;
end;

procedure TfrmMatShablons.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmMatShablons.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 SavePositionToRegistry(Self);
 Action := caFree;
end;

procedure TfrmMatShablons.RefreshButtonClick(Sender: TObject);
var
 selected : int64;
begin
 selected := -1;

 if DataSet.RecordCount <> 0 then selected := TFIBBCDField(DataSet.fbn('ID_SHABLON')).AsInt64;
 SelectAll;
 DataSet.Locate('ID_SHABLON', selected, []);
end;

procedure TfrmMatShablons.FormShow(Sender: TObject);
begin
 LoadPositionFromRegistry(Self);
 if FormStyle = fsNormal then begin
   SelectAll;
 end;
 cxGrid1.SetFocus;
end;

procedure TfrmMatShablons.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
end;

procedure TfrmMatShablons.EditButtonClick(Sender: TObject);
var
 id : int64;
 frm : TfrmShablonAdd;
begin
  if DataSet.RecordCount = 0 then exit;
  id := TFIBBCDField(DataSet.FieldByName('ID_SHABLON')).AsInt64;
  frm := TfrmShablonAdd.Create(Self);
  frm.Caption := 'Змінити ' + frm.Caption;
  frm.cxButton1.Caption := 'Змінити';
  frm.cxButton3.Visible := false;
  frm.NameEdit.Text := IfNull(DataSet['NAME_SHABLON'], '');
  frm.CommentEdit.Text := IfNull(DataSet['COMMENT'], '');

  if frm.ShowModal <> mrCancel then
  begin
    WriteProc.StoredProcName := 'DOG_DT_SPEC_SHABLON_UPD';
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_SHABLON').asint64 := id;
    WriteProc.ParamByName('NAME_SHABLON').AsString := frm.NameEdit.Text;
    WriteProc.ParamByName('COMMENT').AsString := frm.CommentEdit.Text;

    WriteProc.ExecProc;
    WriteProc.Transaction.Commit;

    SelectAll;
    DataSet.Locate('ID_SHABLON', id, []);
  end;
  frm.Free;
end;

procedure TfrmMatShablons.DeleteButtonClick(Sender: TObject);
//var
// selected : Int64;
begin
 if DataSet.RecordCount = 0 then exit;

// selected := cxGrid1DBTableView1.DataController.FocusedRowIndex;

 if MessageDlg('Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
 WriteProc.Transaction.StartTransaction;
 WriteProc.StoredProcName := 'DOG_DT_SPEC_SHABLON_DEL';
 WriteProc.Prepare;
 WriteProc.ParamByName('ID_SHABLON').AsInt64 := TFIBBCDField(DataSet.FieldByName('ID_SHABLON')).AsInt64;
 WriteProc.ExecProc;
 WriteProc.Transaction.Commit;
 WriteProc.Close;
 SelectAll;
// cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TfrmMatShablons.AddButtonClick(Sender: TObject);
var
 new_id : int64;
 frm : TfrmShablonAdd;
 id_parent : int64;
begin
 if DataSet.RecordCount <> 0 then id_parent := TFIBBCDField(DataSet.fbn('ID_SHABLON')).asInt64 else id_parent := -1;
 frm := TfrmShablonAdd.Create(Self);
 frm.Caption := 'Додати ' + frm.Caption;
 if frm.ShowModal <> mrCancel then
 begin
   WriteProc.StoredProcName := 'DOG_DT_SPEC_SHABLON_INS';
   WriteProc.Transaction.StartTransaction;
   WriteProc.Prepare;
   if frm.ModalResult = mrOk then
     WriteProc.ParamByName('LINKTO').asint64 := -1
                              else
     WriteProc.ParamByName('LINKTO').asint64 := id_parent;
     
   WriteProc.ParamByName('NAME_SHABLON').AsString := frm.NameEdit.Text;
   WriteProc.ParamByName('COMMENT').AsString := frm.CommentEdit.Text;

   WriteProc.ExecProc;
   new_id := WriteProc['ID_SHABLON'].AsInt64;
   WriteProc.Transaction.Commit;

   SelectAll;
   DataSet.Locate('ID_SHABLON', new_id, []);
 end;
 frm.Free;
end;

procedure TfrmMatShablons.cxTextEdit1PropertiesChange(Sender: TObject);
begin
{ if FilterEdit.Text = '' then
 begin
   DataSet.Filtered := false;
   DataSet.Filter := '';
   exit;
 end;
 DataSet.Filtered := false;
 DataSet.Filter := 'UPPER(NAME_MATERIAL) like ' + QuotedStr('%' + AnsiUpperCase(FilterEdit.Text) + '%');
 DataSet.Filtered := true;}
end;

procedure TfrmMatShablons.dxBarLargeButton1Click(Sender: TObject);
var
 hPack     : HModule;
 SpravFunc : TSpravFuncN;
 Res:Variant;
 id : int64;
begin
 if DataSet.RecordCount = 0 then exit;

 hPack := GetModuleHandle('SpNom.bpl');
 if hPack < 32 then hPack := LoadPackage('SpNom.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetNomnEx'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, WorkDatabase.Handle, fsNormal, 0, 0, 0, 0, 0, TdxBarLargeButton(Sender).Tag, 0);
 end else begin
  ShowMessage(PChar('Ошибка загрузки номенклатора'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
   WriteProc.StoredProcName := 'DOG_DT_SPEC_SHABLON_MAT_INS';
   WriteProc.Transaction.StartTransaction;
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_MATERIAL').AsInt64 := res[0];
   WriteProc.ParamByName('ID_SHABLON').AsInt64 := TFIBBCDField(DataSet.FieldByName('ID_SHABLON')).AsInt64;
   WriteProc.ExecProc;
   id := WriteProc['ID_SHABLON_MATERIAL'].AsInt64;
   WriteProc.Transaction.Commit;
   SelectMat;
   DataSet2.Locate('ID_SHABLON_MATERIAL', id, []);
 end;
end;

procedure TfrmMatShablons.dxBarLargeButton3Click(Sender: TObject);
var
 selected : int64;
begin
 if DataSet.RecordCount = 0 then exit;
 if DataSet2.RecordCount = 0 then exit;

 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex;

 if MessageDlg('Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
 WriteProc.Transaction.StartTransaction;
 WriteProc.StoredProcName := 'DOG_DT_SPEC_SHABLON_MAT_DEL';
 WriteProc.Prepare;
 WriteProc.ParamByName('ID_SHABLON_MATERIAL').AsInt64 := TFIBBCDField(DataSet2.FieldByName('ID_SHABLON_MATERIAL')).AsInt64;
 WriteProc.ExecProc;
 WriteProc.Transaction.Commit;
 WriteProc.Close;
 SelectMat;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TfrmMatShablons.SelectMat;
begin
  DataSet2.CloseOpen(false);
end;

procedure TfrmMatShablons.dxBarLargeButton4Click(Sender: TObject);
begin
 if DataSet.RecordCount <> 0 then
 begin
   a_out^['ID_SHABLON'] := TFIBBCDField(DataSet.FieldByName('ID_SHABLON')).AsInt64;
   a_out^['NAME_SHABLON'] := DataSet.FieldByName('NAME_SHABLON').AsString;
   a_out^['ModalResult'] := mrOk;
   ModalResult := mrOk;
 end;
end;

procedure TfrmMatShablons.cxDBTreeList1DblClick(Sender: TObject);
begin
 dxBarLargeButton4Click(Self);
end;

end.




