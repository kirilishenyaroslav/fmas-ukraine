unit GetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ComCtrls,
  cxGridTableView, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,
  ImgList, dxBar, dxBarExtItems, ActnList, RxMemDS,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmGetParam = class(TForm)
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    StatusBar1: TStatusBar;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    NameField: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButtonRefresh: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    LargeImages: TImageList;
    pFIBDataSetSelect: TpFIBDataSet;
    DataSource: TDataSource;
    Name_ID: TcxGridDBColumn;
    ActionList1: TActionList;
    ActionF10: TAction;
    RxMemoryDataPrintSetup: TRxMemoryData;
    GridDBViewDBColumn1: TcxGridDBColumn;
    MarkAll: TAction;
    UnMarkAll: TAction;
    InvertAll: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    pFIBTransaction1: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure ActionF10Execute(Sender: TObject);
    procedure MarkAllExecute(Sender: TObject);
    procedure UnMarkAllExecute(Sender: TObject);
    procedure InvertAllExecute(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    DB : TpFIBDatabase;
    Transaction : TpFIBTransaction;
    Pid_session:Int64;
    constructor Create(AOwnwer:TComponent;ParamFilter:Integer;aDB : TpFIBDatabase; aTransaction : TpFIBTransaction);overload;
  end;

var
  frmGetParam: TfrmGetParam;
  Res:Variant;
  PFilter,PType:Integer;
implementation

{$R *.dfm}

constructor TfrmGetParam.Create (AOwnwer:TComponent;ParamFilter:Integer; aDB : TpFIBDatabase; aTransaction : TpFIBTransaction);
var
  i,j :integer;
begin
  inherited Create(AOwnwer);

  PFilter := ParamFilter;
  DB:=adb;
  Transaction := aTransaction;

  pFIBDataSetSelect.Database:= DB;
  pFIBDataSetSelect.Transaction:= Transaction;

  pFIBDataSetSelect.close;
  pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_session from GVK_GET_ID_SESSION';
  pFIBDataSetSelect.Open;
  pid_session := pFIBDataSetSelect['Id_Session'];

  pFIBDataSetSelect.Close;
  case PFilter of
    1: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_kat as id, name_kat as name from gvk_sp_kat';
    2: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_lgot as id, name_lgot as name from gvk_sp_lgot';
    3: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_subsidy as id, name_subsidy as name from gvk_sp_subsidy';
  end;
  pFIBDataSetSelect.Open;
  pFIBDataSetSelect.FetchAll;
  pFIBDataSetSelect.First;

  RxMemoryDataPrintSetup.EmptyTable;
  for i:=0 to pFIBDataSetSelect.RecordCount-1 do
    begin
      RxMemoryDataPrintSetup.Open;
      RxMemoryDataPrintSetup.Insert;
      RxMemoryDataPrintSetup.FieldByName('ID').Value:=   pFIBDataSetSelect.FieldByName('ID').AsVariant;
      RxMemoryDataPrintSetup.FieldByName('NAME').Value:= pFIBDataSetSelect.FieldByName('NAME').AsString;
      RxMemoryDataPrintSetup.FieldByName('SELECT').Value:= 0;
    end;
  RxMemoryDataPrintSetup.First;
end;

procedure TfrmGetParam.dxBarLargeButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetParam.dxBarLargeButton6Click(Sender: TObject);
var
  i,cntSelect,cntCel:Integer;
Begin
  pFIBTransaction1.DefaultDatabase := DB;
  pFIBStoredProc1.Database := DB;
  pFIBTransaction1.StartTransaction;
  RxMemoryDataPrintSetup.First;
  pFIBStoredProc1.StoredProcName:='GVK_TMP_PARAM_INS';
  for i:= 0 to RxMemoryDataPrintSetup.RecordCount-1 do
   Begin
    pFIBStoredProc1.Prepare;
    pFIBStoredProc1.ParamByName('id_session').AsInt64 := Pid_session;
    if RxMemoryDataPrintSetup['SELECT'] = 1
     then pFIBStoredProc1.ParamByName('id').AsInt64 := RxMemoryDataPrintSetup['ID'];
    pFIBStoredProc1.ExecProc;
    RxMemoryDataPrintSetup.Next;
   End;
  pFIBTransaction1.Commit;
  close;
end;

procedure TfrmGetParam.ActionF10Execute(Sender: TObject);
begin
  dxBarLargeButton6Click(self);
end;

procedure TfrmGetParam.MarkAllExecute(Sender: TObject);
var
  i:Integer;
  id:Variant;
begin
Grid.BeginUpdate;
id:=RxMemoryDataPrintSetup.FieldByName('ID').AsVariant;
RxMemoryDataPrintSetup.First;

for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
  begin
    RxMemoryDataPrintSetup.Open;
    RxMemoryDataPrintSetup.Edit;
    RxMemoryDataPrintSetup.FieldByName('SELECT').AsInteger:=1;
    RxMemoryDataPrintSetup.Post;    
    RxMemoryDataPrintSetup.Next;
  end;

RxMemoryDataPrintSetup.Locate('ID',ID,[]);
Grid.EndUpdate;
end;

procedure TfrmGetParam.UnMarkAllExecute(Sender: TObject);
var
  i:Integer;
  id:Variant;
begin
Grid.BeginUpdate;
id:=RxMemoryDataPrintSetup.FieldByName('ID').AsVariant;
RxMemoryDataPrintSetup.First;

for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
  begin
    RxMemoryDataPrintSetup.Open;
    RxMemoryDataPrintSetup.Edit;
    RxMemoryDataPrintSetup.FieldByName('SELECT').AsInteger:=0;
    RxMemoryDataPrintSetup.Post;
    RxMemoryDataPrintSetup.Next;
  end;

RxMemoryDataPrintSetup.Locate('ID',ID,[]);
Grid.EndUpdate;
end;

procedure TfrmGetParam.InvertAllExecute(Sender: TObject);
var
  i:Integer;
  id:Variant;
begin
Grid.BeginUpdate;
id:=RxMemoryDataPrintSetup.FieldByName('ID').AsVariant;
RxMemoryDataPrintSetup.First;

for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
  begin
    RxMemoryDataPrintSetup.Open;
    RxMemoryDataPrintSetup.Edit;
    if RxMemoryDataPrintSetup.FieldByName('SELECT').AsInteger=1 then
      begin
        RxMemoryDataPrintSetup.FieldByName('SELECT').AsInteger:=0;
      end
      else
      begin
        RxMemoryDataPrintSetup.FieldByName('SELECT').AsInteger:=1;
      end;
    RxMemoryDataPrintSetup.Post;
    RxMemoryDataPrintSetup.Next;
  end;

RxMemoryDataPrintSetup.Locate('ID',ID,[]);
Grid.EndUpdate;
end;

procedure TfrmGetParam.dxBarLargeButton4Click(Sender: TObject);
begin
  MarkAllExecute(Self);
end;

procedure TfrmGetParam.dxBarLargeButton8Click(Sender: TObject);
begin
  UnMarkAllExecute(Self);
end;

procedure TfrmGetParam.dxBarLargeButton9Click(Sender: TObject);
begin
  InvertAllExecute(Self);
end;

end.
