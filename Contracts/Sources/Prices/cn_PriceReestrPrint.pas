unit cn_PriceReestrPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PricesMain, DB, FIBDataSet, pFIBDataSet, cxGraphics, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, ImgList,
  dxBar, dxBarExtItems, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar;

type
  TfrmPriceReestrPrint = class(TForm)
    pReadDataSet: TpFIBDataSet;
    StatusBar: TdxStatusBar;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    LargeImages: TImageList;
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
    DataSource1: TDataSource;
    colNAME_PRICE: TcxGridDBColumn;
    colBEG_DATE: TcxGridDBColumn;
    colEND_DATE: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    ID_YEAR, ID_PRICE : Int64;
    NamePrice : string;
  end;

implementation



{$R *.dfm}

procedure TfrmPriceReestrPrint.ExitButtonClick(Sender: TObject);
begin
 pReadDataSet.Close;
 Close;
end;

procedure TfrmPriceReestrPrint.SelectButtonClick(Sender: TObject);
begin
 ID_PRICE := pReadDataSet['ID_PRICE'];
 NamePrice := pReadDataSet['NAME_PRICE'];
 pReadDataSet.Close;
 ModalResult := mrOk;
end;

procedure TfrmPriceReestrPrint.FormCreate(Sender: TObject);
begin
 ID_PRICE := -1;
 NamePrice:= '';
end;

procedure TfrmPriceReestrPrint.FormShow(Sender: TObject);
begin
  pReadDataSet.SelectSQL.Text := 'select * from CN_PRICES_PRINT_REESTR_SELECT(' + IntToStr(ID_YEAR) + ')';
  pReadDataSet.Open;
  pReadDataSet.FetchAll;

  if pReadDataSet.RecordCount = 0 then SelectButton.Enabled := False;
end;

procedure TfrmPriceReestrPrint.GridDBViewDblClick(Sender: TObject);
begin
  SelectButtonClick(Sender);
end;

end.
