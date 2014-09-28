unit GetNarush;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, dxBarExtItems, ImgList,
  RxMemDS, cxGridTableView, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ComCtrls, FIBDataSet, pFIBDataSet,StudcityConst;

type
  TfrmGetNarush = class(TForm)
    StatusBar1: TStatusBar;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    NAME_GROUP: TcxGridDBColumn;
    ID_GROUP: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
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
    pFIBDataSetNarush: TpFIBDataSet;
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    function Get():Variant;
    { Public declarations }
  end;

var
  frmGetNarush: TfrmGetNarush;
  res:Variant;
  lng:Integer;
implementation
uses
  ReportsFilter;
{$R *.dfm}


function TfrmGetNarush.Get():Variant;
begin
  ShowModal;
  Get:=res;
  free;
end;

procedure TfrmGetNarush.dxBarLargeButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetNarush.FormCreate(Sender: TObject);
begin
  lng:=2;

  Caption:=StudcityConst.Studcity_ReportsFilterFormNarush_EX[lng];
  NAME_GROUP.Caption:=StudcityConst.Studcity_ReportsFilterNarush_EX[lng];

  pFIBDataSetNarush.Database:=TfrmReportsFilter(self.owner).Database;
  pFIBDataSetNarush.Transaction:=TfrmReportsFilter(self.owner).ReadTransaction;
  pFIBDataSetNarush.Active:=false;
  pFIBDataSetNarush.Active:=true;
end;

procedure TfrmGetNarush.dxBarLargeButton6Click(Sender: TObject);
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
