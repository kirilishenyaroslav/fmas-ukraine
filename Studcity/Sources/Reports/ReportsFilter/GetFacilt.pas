unit GetFacilt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ComCtrls,
  cxGridTableView, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,
  ImgList, dxBar, dxBarExtItems, ActnList, RxMemDS;

type
  TfrmGetFacult = class(TForm)
    StatusBar1: TStatusBar;
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
    ActionList1: TActionList;
    ActionF10: TAction;
    RxMemoryDataPrintSetup: TRxMemoryData;
    MarkAll: TAction;
    UnMarkAll: TAction;
    InvertAll: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    pFIBDataSetValue: TpFIBDataSet;
    Grid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    GridDBViewDBColumn1: TcxGridDBColumn;
    NameField: TcxGridDBColumn;
    Name_ID: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    constructor Create (AOwnwer:TComponent;ParamFilter:Integer;id_session:Int64);overload;
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
    function Get():Variant;
    { Public declarations }
  end;

var
  frmGetFacult: TfrmGetFacult;
  Res:Variant;
  PFilter,PType:Integer;
  Pid_session:Int64;
implementation

uses ReportsFilter;
{$R *.dfm}

constructor TfrmGetFacult.Create (AOwnwer:TComponent;ParamFilter:Integer;id_session:Int64);
var
  //sp: TSprav;
  i,j:Integer;
begin
  inherited Create(AOwnwer);

  PFilter := ParamFilter;
  Pid_session := id_session;

  pFIBDataSetSelect.Active := false;
  pFIBDataSetSelect.Database:=TfrmFilter(self.owner).DB;
  pFIBDataSetSelect.Transaction:=TfrmFilter(self.owner).ReadTransaction;
  case PFilter of
    {1: begin
        pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select d.id_department as id, upper(d.name_full) as name from sp_department d join pub_sys_data p on d.id_parent = p.st_parent where d.use_end = :use_end order by name collate win1251_ua desc';
        pFIBDataSetSelect.ParamByName('use_end').AsDate := StrToDate('01.01.3333');
       End;}
    2: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select * from CN_TMP_FILTER_KURS order by name collate win1251_ua DESC';
    3: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_build as id, upper(name_build) as name  from ST_SP_Builds order by name collate win1251_ua desc';
    4: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select * from ST_SP_KAT_FOR_FILTER';
    5: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_type_category as id, upper(name_type_category) as name from ST_INI_TYPE_CATEGORY order by name collate win1251_ua desc';
    6: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_category_class as id, upper(name_category_class) as name from ST_INI_CATEGORY_CLASS order by name collate win1251_ua desc';
    {7: begin
        pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_group as id, upper(name_group) as name from st_filter_group(:id_session) order by name collate win1251_ua desc';
        pFIBDataSetSelect.ParamByName('id_session').AsInt64 := id_session;
       end;}
    8:pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select n.id_narush as id, upper(n.narush) as name from st_sp_narush n order by name collate win1251_ua desc';
    9:pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select KOD_LG as id, upper(NAME_LG) as name from ST_SP_LGOTA order by name collate win1251_ua desc';
  end;


  pFIBDataSetSelect.Active := true;
  pFIBDataSetSelect.FetchAll;

  pFIBDataSetValue.Active := false;
  pFIBDataSetValue.Database:=TfrmFilter(self.owner).DB;
  pFIBDataSetValue.Transaction:=TfrmFilter(self.owner).ReadTransaction;
  pFIBDataSetValue.ParamByName('ID_SESSION').AsInt64:= id_session;
  pFIBDataSetValue.Active := True;
  pFIBDataSetValue.FetchAll;

  Grid.BeginUpdate;

  RxMemoryDataPrintSetup.EmptyTable;
  for i:=0 to pFIBDataSetSelect.RecordCount-1 do
    begin
      RxMemoryDataPrintSetup.Open;
      RxMemoryDataPrintSetup.Insert;
      RxMemoryDataPrintSetup.FieldByName('ID').Value     := pFIBDataSetSelect.FieldByName('ID').AsVariant;
      RxMemoryDataPrintSetup.FieldByName('NAME').Value   := pFIBDataSetSelect.FieldByName('NAME').AsString;
      RxMemoryDataPrintSetup.FieldByName('SELECT').Value := 0;

      pFIBDataSetValue.First;
      for j:=0 to pFIBDataSetValue.RecordCount-1 do
       Begin
        PType:=pFIBDataSetValue.FieldByName('TYPE_VALUE').Asinteger;
        if (RxMemoryDataPrintSetup.FieldByName('ID').Value = pFIBDataSetValue.FieldByName('VALUE_PARAM').AsInteger)
           and  (PType=PFilter)
         then RxMemoryDataPrintSetup.FieldByName('SELECT').Value:= 1;
        pFIBDataSetValue.Next;
       End;
      RxMemoryDataPrintSetup.Post;
      pFIBDataSetSelect.Next;
    end;
  RxMemoryDataPrintSetup.First;
  Grid.EndUpdate;
end;

function TfrmGetFacult.Get():Variant;
begin
  ShowModal;
  Get:=res;
  free;
end;
procedure TfrmGetFacult.dxBarLargeButton7Click(Sender: TObject);
begin
  res:=null;
  Close;
end;

procedure TfrmGetFacult.dxBarLargeButton6Click(Sender: TObject);
var
  i,cntSelect,cntCel:Integer;
begin
  {удалить все старые значения}
  Grid.BeginUpdate;
  res:=null;

  cntSelect:=0;

  RxMemoryDataPrintSetup.First;

  for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
   begin
    if RxMemoryDataPrintSetup.FieldByName('SELECT').AsInteger=1 then
      begin
        inc(cntSelect);
      end;
    RxMemoryDataPrintSetup.Next;
   end;

  cntCel:=0;

  RxMemoryDataPrintSetup.First;

  if cntSelect>0 then
   begin
    res:=VarArrayCreate([0,cntSelect-1],varVariant);
    for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
     begin
      if RxMemoryDataPrintSetup.FieldByName('SELECT').AsInteger=1 then
       begin
        res[cntCel]:=RxMemoryDataPrintSetup.FieldByName('ID').AsVariant;
        inc(cntCel);
       end;
      RxMemoryDataPrintSetup.Next;
    end;
   end;
  Grid.EndUpdate;
  close;
end;

procedure TfrmGetFacult.ActionF10Execute(Sender: TObject);
begin
  dxBarLargeButton6Click(self);
end;

procedure TfrmGetFacult.MarkAllExecute(Sender: TObject);
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

procedure TfrmGetFacult.UnMarkAllExecute(Sender: TObject);
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

procedure TfrmGetFacult.InvertAllExecute(Sender: TObject);
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

procedure TfrmGetFacult.dxBarLargeButton4Click(Sender: TObject);
begin
  MarkAllExecute(Self);
end;

procedure TfrmGetFacult.dxBarLargeButton8Click(Sender: TObject);
begin
  UnMarkAllExecute(Self);
end;

procedure TfrmGetFacult.dxBarLargeButton9Click(Sender: TObject);
begin
  InvertAllExecute(Self);
end;

end.
