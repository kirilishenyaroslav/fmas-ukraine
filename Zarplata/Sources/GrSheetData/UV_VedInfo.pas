unit UV_VedInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Dates, ZProc, ZTypes,
  Unit_VedInfo_Consts, cxMemo, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, IBase, dxBar, dxBarExtItems, cxContainer, cxLabel, ExtCtrls;

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
    Styles: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    GrColP1: TcxGridDBColumn;
    Panel1: TPanel;
    LabelSumma: TcxLabel;
    procedure GridView1KeyPress(Sender: TObject; var Key: Char);
    procedure ExitBtnClick(Sender: TObject);
    procedure GrColPeriodGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GrColP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
  private
  public
    constructor Create(AOwner:TComponent;DB:TISC_DB_HANDLE;AParameter:TUVSheetDataParameters);reintroduce;
  end;

function FZ_ViewSheetData(AOwner:TComponent;DB:TISC_DB_HANDLE;AParameter:TUVSheetDataParameters):variant;stdcall;
exports FZ_ViewSheetData;

implementation

{$R *.dfm}

function FZ_ViewSheetData(AOwner:TComponent;DB:TISC_DB_HANDLE;AParameter:TUVSheetDataParameters):variant;stdcall;
var ViewForm:TFUVVedInfo;
begin
ViewForm:=TFUVVedInfo.Create(AOwner,DB,AParameter);
ViewForm.ShowModal;
end;

constructor TFUVVedInfo.Create(AOwner:TComponent;DB:TISC_DB_HANDLE;AParameter:TUVSheetDataParameters);
var summa:Double;
begin
 inherited Create(AOwner);
 Caption                 := FUVVedInfo_Caption+' '+AParameter.Caption;
 RefreshBtn.Caption      := FUVVedInfo_RefreshBtn_Caption;
 ExitBtn.Caption         := FUVVedInfo_ExitBtn_Caption;
//******************************************************************************
 GrColVidOplName.Caption := FUVVedInfo_GrColVidOplName_Caption;
 GrColPeriod.Caption     := FUVVedInfo_GrColPeriod_Caption;
 GrColSumma.Caption      := FUVVedInfo_GrColSumma_Caption;
//******************************************************************************
 GrColVidOplName.DataBinding.FieldName := 'NAME_VIDOPL';
 GrColPeriod.DataBinding.FieldName     := 'KOD_SETUP3';
 GrColSumma.DataBinding.FieldName      := 'SUMMA';
 GrColP1.DataBinding.FieldName         := 'P1';
 GrColP1.Caption         := '';
//******************************************************************************
 DataBase.Handle         := DB;
 DataSet.SQLs.SelectSQL.Text :='SELECT * FROM UV_SHEETPRO_SELECTMAN('+IntToStr(AParameter.ID)+')';
 DataSet.Open;
 DataSet.First;
 summa:=0;
 while not DataSet.Eof do
  begin
   summa:=summa+ifthen(DataSet['P1']='T',DataSet['SUMMA'],-DataSet['SUMMA']);
   DataSet.Next;
  end;
 LabelSumma.Caption := FUVVedInfo_Summary_Text+': '+FloatToStr(summa);
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

procedure TFUVVedInfo.GrColP1GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: String);
begin
if AText='F' then
   AText:=FUVVedInfo_GrColP1_Text_Ud;
if AText='T' then
   AText:=FUVVedInfo_GrColP1_Text_Nar;
end;

end.
