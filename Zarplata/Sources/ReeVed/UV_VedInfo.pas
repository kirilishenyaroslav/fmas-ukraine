unit UV_VedInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Dates, ZProc,
  Unit_ReeVed_Consts, cxMemo, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, IBase, dxBar, dxBarExtItems;

type
  TFUVVedInfo = class(TForm)
    Grid: TcxGrid;
    GridView1: TcxGridDBTableView;
    GrColVidOplName: TcxGridDBColumn;
    GrColPeriod: TcxGridDBColumn;
    GrColSumma: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    DataSource: TDataSource;
    DataBase: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    procedure GridView1KeyPress(Sender: TObject; var Key: Char);
    procedure ExitBtnClick(Sender: TObject);
    procedure GrColPeriodGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure RefreshBtnClick(Sender: TObject);
  private
  public
    constructor Create(Component: TComponent;DB:TISC_DB_HANDLE;ComeIdSheet:LongWord);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFUVVedInfo.Create(Component: TComponent;DB:TISC_DB_HANDLE;ComeIdSheet:LongWord);
begin
 inherited Create(Component);
 RefreshBtn.Caption      := RefreshBtn_Caption;
 ExitBtn.Caption         := ExitBtn_Caption;
//******************************************************************************
 GrColVidOplName.Caption := FUVVedInfo_GrColVidOplName_Caption;
 GrColPeriod.Caption     := FUVVedInfo_GrColPeriod_Caption;
 GrColSumma.Caption      := FUVVedInfo_GrColSumma_Caption;
//******************************************************************************
 GrColVidOplName.DataBinding.FieldName := 'NAME_VIDOPL';
 GrColPeriod.DataBinding.FieldName     := 'KOD_SETUP3';
 GrColSumma.DataBinding.FieldName      := 'SUMMA';
//******************************************************************************
 DataBase.Handle         := DB;
 DataSet.SQLs.SelectSQL.Text :='SELECT * FROM UV_SHEETPRO_SELECTMAN('+IntToStr(ComeIdSheet)+')';
 DataSet.Open;
end;



procedure TFUVVedInfo.GridView1KeyPress(Sender: TObject; var Key: Char);
begin
If Key=#27 then Close;
end;

procedure TFUVVedInfo.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFUVVedInfo.GrColPeriodGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText<>'' then AText:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFUVVedInfo.RefreshBtnClick(Sender: TObject);
begin
DataSetCloseOpen(DataSet, 'ID_SHEETPRO');
end;

end.
