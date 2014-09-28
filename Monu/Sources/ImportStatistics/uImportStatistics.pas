unit uImportStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AArray, dxBar, dxBarExtItems, DB, FIBDataSet, pFIBDataSet,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, cxMaskEdit, FIBDatabase, pFIBDatabase, ImgList,
  cxGridTableView, cxClasses, ExtCtrls, cxLabel, cxContainer, cxEdit,
  cxTextEdit, uImportStatisticsAdd, FIBQuery, pFIBQuery, pFIBStoredProc, Ib_externals,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, uMonuLoaderDM, cxImage,
  StdCtrls, cxCheckBox, cxSpinEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeelPainters, cxButtons, TeEngine, Series, TeeProcs, Chart,
  DbChart, Grids, DBGrids, cxButtonEdit, LoaderUnit, cxGridBandedTableView,
  cxGridDBBandedTableView, dxBarExtDBItems, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, frxClass, frxDBSet, cxSplitter, frxExportXLS,
  frxExportRTF, frxExportHTML, frxExportPDF, uMonuLoader, Buttons, frxDesgn;

const
 edit_margin = 16;

type
  TfrmImportStatistics = class(TForm)
    dxBarManager1: TdxBarManager;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    pFIBDatabase1: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    LargeImages: TImageList;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    ImageList1: TImageList;
    dsStatistics: TpFIBDataSet;
    DBChart1: TDBChart;
    pFIBDataSet1: TpFIBDataSet;
    Series1: TBarSeries;
    DataSource1: TDataSource;
    GridDBBandedTableView1: TcxGridDBBandedTableView;
    GridDBBandedTableView1ID_ORGANIZATION: TcxGridDBBandedColumn;
    GridDBBandedTableView1NAME_ORGANIZATION: TcxGridDBBandedColumn;
    GridDBBandedTableView1SHORT_NAME: TcxGridDBBandedColumn;
    GridDBBandedTableView1CODE: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH1: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH2: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH3: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH4: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH5: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH6: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH7: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH8: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH9: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH10: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH11: TcxGridDBBandedColumn;
    GridDBBandedTableView1MONTH12: TcxGridDBBandedColumn;
    GridDBBandedTableView1NAME_TYPE_ORG: TcxGridDBBandedColumn;
    GridDBBandedTableView1KV1: TcxGridDBBandedColumn;
    GridDBBandedTableView1KV2: TcxGridDBBandedColumn;
    GridDBBandedTableView1KV3: TcxGridDBBandedColumn;
    GridDBBandedTableView1KV4: TcxGridDBBandedColumn;
    GridDBBandedTableView1ID_TYPE_ORG: TcxGridDBBandedColumn;
    GridDBBandedTableView1EDRPOU: TcxGridDBBandedColumn;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    dsTypeOrg: TpFIBDataSet;
    dscTypeOrg: TDataSource;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    cxLookupComboBox1: TcxLookupComboBox;
    seYear: TdxBarEdit;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    eCode: TdxBarEdit;
    dxBarButton3: TdxBarButton;
    eName: TdxBarEdit;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dsReport: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    cxGrid1: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pFIBDataSet2: TpFIBDataSet;
    DataSource2: TDataSource;
    GridDBTableView1ID_LOG: TcxGridDBColumn;
    GridDBTableView1ID_USER: TcxGridDBColumn;
    GridDBTableView1COMP_NAME: TcxGridDBColumn;
    GridDBTableView1COMP_IP: TcxGridDBColumn;
    GridDBTableView1IMPORT_DATE: TcxGridDBColumn;
    GridDBTableView1IS_ERROR: TcxGridDBColumn;
    GridDBTableView1NOTE: TcxGridDBColumn;
    GridDBTableView1FILE_NAME: TcxGridDBColumn;
    GridDBTableView1DATE_DATA: TcxGridDBColumn;
    GridDBTableView1IS_KVARTAL: TcxGridDBColumn;
    GridDBTableView1ID_ORGANIZATION: TcxGridDBColumn;
    GridDBTableView1KVARTAL_NUM: TcxGridDBColumn;
    GridDBTableView1FULL_NAME: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    dxBarLargeButton2: TdxBarLargeButton;
    dsLetter: TpFIBDataSet;
    frxDBDataset2: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cxLabel1: TcxLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    cxLabel2: TcxLabel;
    SpeedButton17: TSpeedButton;
    frxDesigner1: TfrxDesigner;
    frxReport2: TfrxReport;
    ePrg: TdxBarEdit;
    dxBarButton5: TdxBarButton;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDBBandedTableView1MONTH1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure GridDBBandedTableView1NAME_ORGANIZATIONCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxLookupComboBox1PropertiesCloseUp(Sender: TObject);
    procedure seYearPropertiesChange(Sender: TObject);
    procedure seYearClick(Sender: TObject);
    procedure seYearKeyPress(Sender: TObject; var Key: Char);
    procedure seYearExit(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure seYearCurChange(Sender: TObject);
    procedure eCodeCurChange(Sender: TObject);
    procedure eCodeExit(Sender: TObject);
    procedure eCodeKeyPress(Sender: TObject; var Key: Char);
    procedure dxBarButton3Click(Sender: TObject);
    procedure eNameCurChange(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure GridDBTableView1IS_KVARTALCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure GridDBTableView1IS_ERRORCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure frxReport2PrintReport(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure ePrgCurChange(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    input, output : TAArray;
    id_type_org   : integer;
    max_year      : integer;
    va : integer;
    procedure SelectAll(ds : TpFIBDataSet);
  end;
var
  frmImportStatistics: TfrmImportStatistics;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;

implementation

uses DateUtils;


{$R *.dfm}

function Load(input, res : TAArray) : boolean;
var
 frm : TfrmImportStatistics;
begin
  Result := true;
  frm := TfrmImportStatistics.Create(TComponent(input['Owner'].asObject));
  frm.input := TAArray.Create;
  input.CopyTo(frm.input);
  frm.output := res;
  frm.FormStyle := frm.input['FormStyle'].AsVariant;
  frm.pFIBDatabase1.Handle := pvoid(frm.input['DBHandle'].asInteger);

  frm.dsTypeOrg.Open;
  frm.dsTypeOrg.FetchAll;

  frm.seYear.text := IntToStr(frm.max_year);
  frm.SelectAll(frm.DataSet);
  frm.pFIBDataSet2.Close;
  frm.pFIBDataSet2.ParamByName('ACTUAL_YEAR').AsInteger := StrToInt(frm.seYear.Text);
  frm.pFIBDataSet2.Open;

  frm.GridDBBandedTableView1.DataController.FocusedRowIndex := 0;
  frm.Grid.BeginUpdate;
  frm.GridDBBandedTableView1.ViewData.Expand(true);
  frm.Grid.EndUpdate;

  if frm.FormStyle = fsNormal then
  begin
    frm.output['MoadResult'].AsVariant := frm.ShowModal;
    frm.Free;
  end
  else
  begin

  end;
end;

{ TfrmSpravTree }

procedure TfrmImportStatistics.SelectAll(ds : TpFIBDataSet);
begin
 ds.Close;
 ds.ParamByName('ID_TYPE_ORG').AsVariant := dsTypeOrg.FBN('ID_TYPE_ORG').AsVariant;
// if cbTypeOrg.Checked then ds.ParamByName('ID_TYPE_ORG').AsInt64 := id_type_org else ds.ParamByName('ID_TYPE_ORG').AsVariant := Null;
 ds.ParamByName('ACTUAL_YEAR').AsVariant := StrToInt(seYear.text);
 if eCode.Text = '' then
    ds.ParamByName('IN_CODE').AsVariant := Null
                    else
    ds.ParamByName('IN_CODE').AsString := eCode.Text;
 if eName.Text = '' then
    ds.ParamByName('IN_NAME').AsVariant := Null
                    else
    ds.ParamByName('IN_NAME').AsString := eName.Text;
 if ePrg.Text = '' then
    ds.ParamByName('IN_PROGRAM').AsVariant := Null
                    else
    ds.ParamByName('IN_PROGRAM').AsString := ePrg.Text;


 ds.Open;
end;

procedure TfrmImportStatistics.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsTypeOrg.Close;
  Action := caFree;
end;

procedure TfrmImportStatistics.ExitButtonClick(Sender: TObject);
begin
 close;
end;

procedure TfrmImportStatistics.SelButtonClick(Sender: TObject);
var
 i : integer;
begin
 if DataSet.RecordCount <> 0 then
 begin
   for i := 0 to DataSet.FieldCount - 1 do output[DataSet.Fields[i].FieldName].AsVariant := DataSet.Fields[i].Value;
 end;
 ModalResult := mrOk;
end;

procedure TfrmImportStatistics.RefreshButtonClick(Sender: TObject);
var
 i : integer;
begin
  i := GridDBBandedTableView1.DataController.FocusedRowIndex;
  SelectAll(DataSet);
  pFIBDataSet2.Close;
  pFIBDataSet2.ParamByName('ACTUAL_YEAR').AsInteger := StrToInt(seYear.Text);
  pFIBDataSet2.Open;
  GridDBBandedTableView1.DataController.FocusedRowIndex := i;
  Grid.BeginUpdate;
  GridDBBandedTableView1.ViewData.Expand(true);
  Grid.EndUpdate;
end;

procedure TfrmImportStatistics.FormDestroy(Sender: TObject);
begin
  input.Free;
end;

procedure TfrmImportStatistics.FormCreate(Sender: TObject);
begin
  ShortTimeFormat := 'HH:mm:ss';
  LongTimeFormat  := 'HH:mm:ss';
  LongDateFormat  := 'dd.mm.YYYY HH:mm:ss';

  DBChart1.Align := alClient;
  if MonthOf(date) = 1 then max_year := YearOf(date) - 1
                       else max_year := YearOf(date);
end;

procedure TfrmImportStatistics.GridDBBandedTableView1MONTH1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.DisplayValue = 1 then
  begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + AViewInfo.Width div 2 - 8 {AViewInfo.Bounds.Left + 1}, AViewInfo.Bounds.Top, 0);
    ADone := true;
  end;
  if AViewInfo.DisplayValue = 0 then
  begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + AViewInfo.Width div 2 - 8 {AViewInfo.Bounds.Left + 1}, AViewInfo.Bounds.Top, 1);
    ADone := true;
  end;
end;

procedure TfrmImportStatistics.GridDBBandedTableView1NAME_ORGANIZATIONCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
  if AViewInfo.GridRecord.Values[GridDBBandedTableView1ID_TYPE_ORG.Index] = 399 then begin
    ACanvas.Font.Color := clBlack;
    ADone := false;
  end;
  if AViewInfo.GridRecord.Values[GridDBBandedTableView1ID_TYPE_ORG.Index] = 499 then begin
    ACanvas.Font.Color := clGreen;
    ADone := false;
  end;
  if AViewInfo.GridRecord.Values[GridDBBandedTableView1ID_TYPE_ORG.Index] = 599 then begin
    ACanvas.Font.Color := clBlue;
    ADone := false;
  end;
end;

procedure TfrmImportStatistics.cxLookupComboBox1PropertiesCloseUp(
  Sender: TObject);
begin
 RefreshButtonClick(Self);
 grid.SetFocus;
end;

procedure TfrmImportStatistics.seYearPropertiesChange(Sender: TObject);
begin
  Grid.SetFocus;
  RefreshButtonClick(Self);
end;

procedure TfrmImportStatistics.seYearClick(Sender: TObject);
begin
  Grid.SetFocus;
  RefreshButtonClick(Self);
end;

procedure TfrmImportStatistics.seYearKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
 begin
   Grid.SetFocus;
   Key := #0;
 end;
 if not (Key in ['0'..'9', #8]) then key := #0;

end;

procedure TfrmImportStatistics.seYearExit(Sender: TObject);
var
  v : integer;
begin
  if TryStrToInt(seYear.Text, v) then
  begin
    if v < 2007 then v := 2007;
    if v > max_year then v := max_year;
    seYear.Text := IntToStr(v);
    RefreshButtonClick(Self);
  end
  else
  begin
    seYear.Text := IntToStr(YearOf(date));
    RefreshButtonClick(Self);
  end;  
// if seYear.Text
end;

procedure TfrmImportStatistics.dxBarButton1Click(Sender: TObject);
begin
 seYear.Text := IntToStr(StrToInt(seYear.Text) + 1);
 seYearExit(Self);
end;

procedure TfrmImportStatistics.dxBarButton2Click(Sender: TObject);
begin
 seYear.Text := IntToStr(StrToInt(seYear.Text) - 1);
 seYearExit(Self);
end;

procedure TfrmImportStatistics.seYearCurChange(Sender: TObject);
begin
 seYear.Text := seYear.CurText;
end;

procedure TfrmImportStatistics.eCodeCurChange(Sender: TObject);
begin
  eCode.Text := eCode.CurText;
  eCodeExit(Self);
end;

procedure TfrmImportStatistics.eCodeExit(Sender: TObject);
begin
  RefreshButtonClick(Self);
end;

procedure TfrmImportStatistics.eCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Grid.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmImportStatistics.dxBarButton3Click(Sender: TObject);
begin
  eCode.Text := '';
  eCodeExit(Self);
end;

procedure TfrmImportStatistics.eNameCurChange(Sender: TObject);
begin
  eName.Text := eName.CurText;
  eCodeExit(Self);
end;

procedure TfrmImportStatistics.dxBarButton4Click(Sender: TObject);
begin
  eName.Text := '';
  eCodeExit(Self);
end;

procedure TfrmImportStatistics.dxBarLargeButton1Click(Sender: TObject);
var
 ReportFile : string;
begin
  ReportFile := ExtractFilePath(Application.ExeName) + 'Reports\Monu\import.fr3';
  if not FileExists(ReportFile) then
  begin
    ShowMessage(Format(MON_STRINGS['msgFileNotFound'].AsString, [ReportFile]));
    exit;
  end;
  frxReport1.LoadFromFile(ReportFile);
  SelectAll(dsReport);
  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then frxReport1.DesignReport else frxReport1.ShowReport();
end;

procedure TfrmImportStatistics.dxBarLargeButton2Click(Sender: TObject);
var
 ReportFile : string;
begin
  if DataSet.RecordCount = 0 then exit;
  ReportFile := ExtractFilePath(Application.ExeName) + 'Reports\Monu\Letter.fr3';
  if not FileExists(ReportFile) then
  begin
    ShowMessage(Format(MON_STRINGS['msgFileNotFound'].AsString, [ReportFile]));
    exit;
  end;
  frxReport2.LoadFromFile(ReportFile);
  dsLetter.Close;
  dsLetter.Open;
  if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then frxReport2.DesignReport else frxReport2.ShowReport();
end;

procedure TfrmImportStatistics.GridDBTableView1IS_KVARTALCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[GridDBTableView1IS_KVARTAL.Index] then
  begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 2);
    ADone := true;
  end
end;

procedure TfrmImportStatistics.GridDBTableView1IS_ERRORCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[GridDBTableView1IS_ERROR.Index] = 1 then
  begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
    ADone := true;
  end
  else
  begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 1);
    ADone := true;
  end
end;

procedure TfrmImportStatistics.frxReport2PrintReport(Sender: TObject);
begin
  StoredProc.Close;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'MON_PRINT_LETTER_LOG_INS';
  StoredProc.Prepare;
  StoredProc.ParamByName('DATE_PRINT').AsDateTime := now;
  StoredProc.ParamByName('ID_USER').AsInt64 := MON_ID_USER;
  StoredProc.ParamByName('ID_ORGANIZATION').AsInt64 := TFIBBCDField(DataSet.FieldByName('ID_ORGANIZATION')).AsInt64;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
end;

procedure TfrmImportStatistics.SpeedButton1Click(Sender: TObject);
//var
// i : integer;
begin
  GridDBBandedTableView1MONTH1.Visible := SpeedButton1.Down;
  GridDBBandedTableView1MONTH2.Visible := SpeedButton2.Down;
  GridDBBandedTableView1MONTH3.Visible := SpeedButton3.Down;
  GridDBBandedTableView1MONTH4.Visible := SpeedButton4.Down;
  GridDBBandedTableView1MONTH5.Visible := SpeedButton5.Down;
  GridDBBandedTableView1MONTH6.Visible := SpeedButton6.Down;
  GridDBBandedTableView1MONTH7.Visible := SpeedButton7.Down;
  GridDBBandedTableView1MONTH8.Visible := SpeedButton8.Down;
  GridDBBandedTableView1MONTH9.Visible := SpeedButton9.Down;
  GridDBBandedTableView1MONTH10.Visible := SpeedButton10.Down;
  GridDBBandedTableView1MONTH11.Visible := SpeedButton11.Down;
  GridDBBandedTableView1MONTH12.Visible := SpeedButton12.Down;
//  for i := 0 to GridDBBandedTableView1.ColumnCount - 1 do if GridDBBandedTableView1.Columns[i].Name = 'GridDBBandedTableView1MONTH' + IntToStr(TSpeedButton(Sender).tag) then GridDBBandedTableView1.Columns[i].Visible := not GridDBBandedTableView1.Columns[i].Visible;
  GridDBBandedTableView1.Bands[1].Visible := GridDBBandedTableView1MONTH1.Visible or GridDBBandedTableView1MONTH2.Visible or GridDBBandedTableView1MONTH3.Visible;
  GridDBBandedTableView1.Bands[2].Visible := GridDBBandedTableView1MONTH4.Visible or GridDBBandedTableView1MONTH5.Visible or GridDBBandedTableView1MONTH6.Visible;
  GridDBBandedTableView1.Bands[3].Visible := GridDBBandedTableView1MONTH7.Visible or GridDBBandedTableView1MONTH8.Visible or GridDBBandedTableView1MONTH9.Visible;
  GridDBBandedTableView1.Bands[4].Visible := GridDBBandedTableView1MONTH10.Visible or GridDBBandedTableView1MONTH11.Visible or GridDBBandedTableView1MONTH12.Visible;
end;

procedure TfrmImportStatistics.SpeedButton13Click(Sender: TObject);
begin
 SpeedButton1.Down := true;
 SpeedButton2.Down := true;
 SpeedButton3.Down := true;
 SpeedButton4.Down := false;
 SpeedButton5.Down := false;
 SpeedButton6.Down := false;
 SpeedButton7.Down := false;
 SpeedButton8.Down := false;
 SpeedButton9.Down := false;
 SpeedButton10.Down := false;
 SpeedButton11.Down := false;
 SpeedButton12.Down := false;
 SpeedButton1Click(SpeedButton1);
end;

procedure TfrmImportStatistics.SpeedButton14Click(Sender: TObject);
begin
 SpeedButton1.Down := false;
 SpeedButton2.Down := false;
 SpeedButton3.Down := false;
 SpeedButton4.Down := true;
 SpeedButton5.Down := true;
 SpeedButton6.Down := true;
 SpeedButton7.Down := false;
 SpeedButton8.Down := false;
 SpeedButton9.Down := false;
 SpeedButton10.Down := false;
 SpeedButton11.Down := false;
 SpeedButton12.Down := false;
 SpeedButton1Click(SpeedButton1);
end;

procedure TfrmImportStatistics.SpeedButton15Click(Sender: TObject);
begin
 SpeedButton1.Down := false;
 SpeedButton2.Down := false;
 SpeedButton3.Down := false;
 SpeedButton4.Down := false;
 SpeedButton5.Down := false;
 SpeedButton6.Down := false;
 SpeedButton7.Down := true;
 SpeedButton8.Down := true;
 SpeedButton9.Down := true;
 SpeedButton10.Down := false;
 SpeedButton11.Down := false;
 SpeedButton12.Down := false;
 SpeedButton1Click(SpeedButton1);
end;

procedure TfrmImportStatistics.SpeedButton16Click(Sender: TObject);
begin
 SpeedButton1.Down := false;
 SpeedButton2.Down := false;
 SpeedButton3.Down := false;
 SpeedButton4.Down := false;
 SpeedButton5.Down := false;
 SpeedButton6.Down := false;
 SpeedButton7.Down := false;
 SpeedButton8.Down := false;
 SpeedButton9.Down := false;
 SpeedButton10.Down := true;
 SpeedButton11.Down := true;
 SpeedButton12.Down := true;
 SpeedButton1Click(SpeedButton1);
end;

procedure TfrmImportStatistics.SpeedButton17Click(Sender: TObject);
begin
 SpeedButton1.Down := true;
 SpeedButton2.Down := true;
 SpeedButton3.Down := true;
 SpeedButton4.Down := true;
 SpeedButton5.Down := true;
 SpeedButton6.Down := true;
 SpeedButton7.Down := true;
 SpeedButton8.Down := true;
 SpeedButton9.Down := true;
 SpeedButton10.Down := true;
 SpeedButton11.Down := true;
 SpeedButton12.Down := true;
 SpeedButton1Click(SpeedButton1);
end;

procedure TfrmImportStatistics.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
 if VarName = 'KV1' then Value := GridDBBandedTableView1.Bands[1].Visible;
 if VarName = 'KV2' then Value := GridDBBandedTableView1.Bands[2].Visible;
 if VarName = 'KV3' then Value := GridDBBandedTableView1.Bands[3].Visible;
 if VarName = 'KV4' then Value := GridDBBandedTableView1.Bands[4].Visible;
 if VarName = 'M1' then Value := GridDBBandedTableView1MONTH1.Visible;
 if VarName = 'M2' then Value := GridDBBandedTableView1MONTH2.Visible;
 if VarName = 'M3' then Value := GridDBBandedTableView1MONTH3.Visible;
 if VarName = 'M4' then Value := GridDBBandedTableView1MONTH4.Visible;
 if VarName = 'M5' then Value := GridDBBandedTableView1MONTH5.Visible;
 if VarName = 'M6' then Value := GridDBBandedTableView1MONTH6.Visible;
 if VarName = 'M7' then Value := GridDBBandedTableView1MONTH7.Visible;
 if VarName = 'M8' then Value := GridDBBandedTableView1MONTH8.Visible;
 if VarName = 'M9' then Value := GridDBBandedTableView1MONTH9.Visible;
 if VarName = 'M10' then Value := GridDBBandedTableView1MONTH10.Visible;
 if VarName = 'M11' then Value := GridDBBandedTableView1MONTH11.Visible;
 if VarName = 'M12' then Value := GridDBBandedTableView1MONTH12.Visible;
 if VarName = 'YEAR' then Value := seYear.Text;
end;

procedure TfrmImportStatistics.ePrgCurChange(Sender: TObject);
begin
  ePrg.Text := ePrg.CurText;
  eCodeExit(Self);
end;

procedure TfrmImportStatistics.dxBarButton5Click(Sender: TObject);
begin
  ePrg.Text := '';
  eCodeExit(Self);
end;

end.
