unit GetKurs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,StudcityConst, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, RxMemDS, cxTextEdit,
  cxCheckBox, dxBar, dxBarExtItems, ImgList;

type
  TfrmGetKurs = class(TForm)
    StatusBar1: TStatusBar;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
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
    RxMemoryDataKurs: TRxMemoryData;
    DataSourceKurs: TDataSource;
    Kurs: TcxGridDBColumn;
    LargeImages: TImageList;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButtonRefresh: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    function Get():Variant;
    Constructor Create(AOwner:TComponent;Language:Integer);
    { Public declarations }
  end;

var
  frmGetKurs: TfrmGetKurs;
  res:Variant;
  Lang:Integer;
implementation

{$R *.dfm}


Constructor TfrmGetKurs.Create(AOwner:TComponent;Language:Integer);
begin
  inherited Create(AOwner);
  Lang:=Language;
end;

procedure TfrmGetKurs.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  Caption:=StudcityConst.Studcity_ReportsFilterFormCurs_EX[lang];
  Kurs.Caption:=StudcityConst.Studcity_ReportsFilterNameCurs_EX[lang];
  for i:=1 to 6 do
    begin
      RxMemoryDataKurs.Open;
      RxMemoryDataKurs.Insert;
      RxMemoryDataKurs.FieldByName('RXid_kurs').AsVariant:=i;
      RxMemoryDataKurs.FieldByName('RXkurs').AsString:='Курс '+IntToStr(i);
      RxMemoryDataKurs.Post;
      RxMemoryDataKurs.last;
    end;
end;

function TfrmGetKurs.Get():Variant;
begin
  ShowModal;
  Get:=res;
  free;
end;


procedure TfrmGetKurs.dxBarLargeButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetKurs.dxBarLargeButton6Click(Sender: TObject);
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
