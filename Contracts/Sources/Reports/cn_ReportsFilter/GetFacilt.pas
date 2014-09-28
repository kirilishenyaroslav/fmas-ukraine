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
    pFIBDataSetValue: TpFIBDataSet;
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
uses
  cn_FormReportsFilter;
{$R *.dfm}
constructor TfrmGetFacult.Create (AOwnwer:TComponent;ParamFilter:Integer;id_session:Int64);
var
  i,j:Integer;
begin
  inherited Create(AOwnwer);

  PFilter := ParamFilter;
  Pid_session := id_session;

  pFIBDataSetSelect.Active := false;
  pFIBDataSetSelect.Database:=TfrmFilter(self.owner).DB;
  pFIBDataSetSelect.Transaction:=TfrmFilter(self.owner).ReadTransaction;
  case PFilter of
    1: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_facul as id,name as name from   cn_sp_facul order by name DESC';
    2:
      begin
        pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select * from   CN_TMP_FILTER_SPEC(:pid_session) order by name DESC';
        pFIBDataSetSelect.ParamByName('pid_session').AsInt64 := id_session;
      end;
    3: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_national as id,name as name from   cn_sp_national order by name DESC';
    4: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_form_stud as id,name as name from   CN_SP_FORM_STUD order by name DESC';
    5: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_kat_stud as id,name as name from   cn_sp_kat_stud order by name DESC';
    6: pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select * from   CN_TMP_FILTER_KURS order by name DESC';
    7:
      begin
        pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select * from   CN_TMP_FILTER_GROUP(:pid_session) order by name DESC';
        pFIBDataSetSelect.ParamByName('pid_session').AsInt64 := id_session;
      end;
    8:pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select ID_TYPE_STAGE as id,NAME_STAGE as name from   CN_INI_TYPE_STAGE order by name_stage DESC';
    9:pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select ID_TYPE_DOG as id,NAME as name from   CN_INI_TYPE_DOG order by NAME DESC';
   10:pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select ID_TYPE_PAYER as id,NAME_TYPE_PAYER as name from  CN_INI_TYPE_PAYER order by NAME_TYPE_PAYER DESC';
   11:pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select ID_DOG_STATUS as id,NAME_DOG_STATUS as name from  CN_INI_DOG_STATUS order by NAME_DOG_STATUS DESC';
   12:pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select ID_SP_CEL_ZAMOVNIK as id,NAME as name from  PRK_SP_CEL_ZAMOVNIK order by NAME DESC';
   13:pFIBDataSetSelect.SQLs.SelectSQL.Text := 'select id_order as id,name as name from  st_ini_ordtypes order by NAME DESC';
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
      RxMemoryDataPrintSetup.FieldByName('ID').Value:=   pFIBDataSetSelect.FieldByName('ID').AsVariant;
      RxMemoryDataPrintSetup.FieldByName('NAME').Value:= pFIBDataSetSelect.FieldByName('NAME').AsString;
      RxMemoryDataPrintSetup.FieldByName('SELECT').Value:= 0;

      pFIBDataSetValue.First;
      for j:=0 to pFIBDataSetValue.RecordCount-1 do
       Begin
        PType:=pFIBDataSetValue.FieldByName('TYPE_VALUE').Asinteger;
        if (RxMemoryDataPrintSetup.FieldByName('ID').Value=pFIBDataSetValue.FieldByName('VALUE_PARAM').AsInteger)
           and  (PType=PFilter) then
         RxMemoryDataPrintSetup.FieldByName('SELECT').Value:= 1;
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
