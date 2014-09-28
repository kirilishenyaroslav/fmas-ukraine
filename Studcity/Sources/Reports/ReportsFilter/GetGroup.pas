unit GetGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, ImgList, dxBar, dxBarExtItems,
  FIBDataSet, pFIBDataSet,StudcityConst,St_ser_function;

type
  TfrmGetGroup = class(TForm)
    StatusBar1: TStatusBar;
    DataSourceGroup: TDataSource;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButtonRefresh: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    LargeImages: TImageList;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    cxStyleSilver: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pFIBDataSetGroup: TpFIBDataSet;
    NAME_GROUP: TcxGridDBColumn;
    ID_GROUP: TcxGridDBColumn;
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create (AOwner : TComponent;ID_TRANS:Int64);overload;
    function Get():Variant;
    { Public declarations }
  end;

var
  frmGetGroup: TfrmGetGroup;
  res:Variant;
  Lang:Integer;
implementation
uses
  ReportsFilter;
{$R *.dfm}

constructor TfrmGetGroup.Create (AOwner : TComponent;ID_TRANS:Int64);
begin
  Inherited Create(AOwner);

  Lang:=ST_serLanguageIndex(TfrmReportsFilter(self.owner).Database.Handle);

  Caption:=StudcityConst.Studcity_ReportsFilterFormGroup_EX[lang];
  NAME_GROUP.Caption:=StudcityConst.Studcity_ReportsFilterNameGroup_EX[lang];

  pFIBDataSetGroup.Database:=TfrmReportsFilter(self.owner).Database;
  pFIBDataSetGroup.Transaction:=TfrmReportsFilter(self.owner).ReadTransaction;
  pFIBDataSetGroup.Active:=false;
  pFIBDataSetGroup.ParamByName('id_transaction').AsInt64:=ID_TRANS;
  pFIBDataSetGroup.Active:=true;
end;


procedure TfrmGetGroup.dxBarLargeButton7Click(Sender: TObject);
begin
  Close;
end;

function TfrmGetGroup.Get():Variant;
begin
  ShowModal;
  Get:=res;
  free;
end;

procedure TfrmGetGroup.dxBarLargeButton6Click(Sender: TObject);
var
  i:Integer;
begin
res:=VarArrayCreate([0,cxGridDBTableView1.DataController.GetSelectedCount-1],varVariant);
for i:=0 to cxGridDBTableView1.DataController.GetSelectedCount-1 do
  begin
    res[i]:=cxGridDBTableView1.Controller.SelectedRecords[i].Values[1];
  end;
close;
end;

end.
