unit uNotImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AArray, dxBar, dxBarExtItems, DB, FIBDataSet, pFIBDataSet,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, cxMaskEdit, FIBDatabase, pFIBDatabase, ImgList,
  cxGridTableView, cxClasses, ExtCtrls, cxLabel, cxContainer, cxEdit,
  cxTextEdit, FIBQuery, pFIBQuery, pFIBStoredProc, Ib_externals,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, uMonuLoaderDM, cxImage,
  StdCtrls, cxCheckBox, cxSpinEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeelPainters, cxButtons, TeEngine, Series, TeeProcs, Chart,
  DbChart, Grids, DBGrids, cxButtonEdit, LoaderUnit;

const
 edit_margin = 16;

type
  TfrmNotImport = class(TForm)
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
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    Panel1: TPanel;
    ImageList1: TImageList;
    cxLabel1: TcxLabel;
    Bevel1: TBevel;
    dePeriodBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    dePeriodEnd: TcxDateEdit;
    cxButton1: TcxButton;
    dxBarDockControl1: TdxBarDockControl;
    cxButton2: TcxButton;
    DBChart1: TDBChart;
    pFIBDataSet1: TpFIBDataSet;
    cxButton3: TcxButton;
    Series1: TBarSeries;
    DataSource1: TDataSource;
    beTypeOrg: TcxButtonEdit;
    cbTypeOrg: TcxCheckBox;
    cxLabel2: TcxLabel;
    GridDBTableView1NAME_ORGANIZATION: TcxGridDBColumn;
    GridDBTableView1DATE_DATA: TcxGridDBColumn;
    GridDBTableView1YEAR_OUT: TcxGridDBColumn;
    GridDBTableView1MONTH_OUT: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridDBTableView1IS_ERRORCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure GridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure GridDBTableView1IS_KVARTALCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cbOnlyKvClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure beTypeOrgPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    input, output : TAArray;
    id_type_org   : integer; 
    procedure SelectAll(ds : TpFIBDataSet);
  end;
var
  frmNotImport: TfrmNotImport;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;

implementation

uses DateUtils;


{$R *.dfm}

function Load(input, res : TAArray) : boolean;
var
 frm : TfrmNotImport;
begin
  Result := true;
  frm := TfrmNotImport.Create(TComponent(input['Owner'].asObject));
  frm.input := TAArray.Create;
  input.CopyTo(frm.input);
  frm.output := res;
  frm.FormStyle := frm.input['FormStyle'].AsVariant;
  frm.pFIBDatabase1.Handle := pvoid(frm.input['DBHandle'].asInteger);

  frm.dePeriodBeg.Properties.OnChange := nil;
  frm.dePeriodEnd.Properties.OnChange := nil;
  frm.dePeriodBeg.Date := EncodeDate(CurrentYear, 1, 1);
  frm.dePeriodEnd.Date := EncodeDate(CurrentYear, MonthOf(date), 31);
  frm.SelectAll(frm.DataSet);
  frm.SelectAll(frm.pFIBDataSet1);

  frm.dePeriodBeg.Properties.OnChange := frm.cbOnlyKvClick;
  frm.dePeriodEnd.Properties.OnChange := frm.cbOnlyKvClick;
  frm.GridDBTableView1.DataController.FocusedRowIndex := 0;
  frm.Grid.BeginUpdate;
  frm.GridDBTableView1.ViewData.Expand(true);
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

procedure TfrmNotImport.SelectAll(ds : TpFIBDataSet);
begin
 ds.Close;

 ds.ParamByName('DATE_BEG').AsDate := dePeriodBeg.Date;
 ds.ParamByName('DATE_END').AsDate := dePeriodEnd.Date;

 if cbTypeOrg.Checked then ds.ParamByName('ID_TYPE_ORG').AsInt64 := id_type_org else ds.ParamByName('ID_TYPE_ORG').AsVariant := Null;

 ds.Open;
end;

procedure TfrmNotImport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmNotImport.ExitButtonClick(Sender: TObject);
begin
 close;
end;

procedure TfrmNotImport.SelButtonClick(Sender: TObject);
var
 i : integer;
begin
 if DataSet.RecordCount <> 0 then
 begin
   for i := 0 to DataSet.FieldCount - 1 do output[DataSet.Fields[i].FieldName].AsVariant := DataSet.Fields[i].Value;
 end;
 ModalResult := mrOk;
end;

procedure TfrmNotImport.RefreshButtonClick(Sender: TObject);
var
 i : integer;
begin
  i := GridDBTableView1.DataController.FocusedRowIndex;
  SelectAll(DataSet);
  SelectAll(pFIBDataSet1);

  GridDBTableView1.DataController.FocusedRowIndex := i;
  Grid.BeginUpdate;
  GridDBTableView1.ViewData.Expand(true);
  Grid.EndUpdate;
end;

procedure TfrmNotImport.FormDestroy(Sender: TObject);
begin
  input.Free;
end;

procedure TfrmNotImport.GridDBTableView1IS_ERRORCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
{  if AViewInfo.GridRecord.Values[GridDBTableView1IS_ERROR.Index] = 1 then begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
    ADone := true;
  end
  else
  begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 1);
    ADone := true;
  end;}
end;

procedure TfrmNotImport.GridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
{ ADone := false;
 if (AViewInfo.GridRecord.Values[GridDBTableView1IS_ERROR.Index] = 1) then begin
   if AViewInfo.Item.Index = GridDBTableView1USER_NAME.Index then
   begin
     ACanvas.Font.Color := clRed;
     ACanvas.Font.Style := [fsBold];
   end;
 end;}
end;

procedure TfrmNotImport.GridDBTableView1IS_KVARTALCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
{  if AViewInfo.GridRecord.Values[GridDBTableView1IS_KVARTAL.Index] = 1 then begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 2);
    ADone := true;
  end}
end;

procedure TfrmNotImport.cbOnlyKvClick(Sender: TObject);
begin
{  SelectAll(DataSet);
  if DBChart1.Visible then SelectAll(dsStatistics);
  Grid.BeginUpdate;
  GridDBTableView1.ViewData.Expand(true);
  Grid.EndUpdate;}
end;

procedure TfrmNotImport.cxButton2Click(Sender: TObject);
begin
{ SelectAll(dsStatistics);
 dsStatistics.FetchAll;
 DBChart1.Visible := true;}
end;

procedure TfrmNotImport.cxButton3Click(Sender: TObject);
begin
  DBChart1.Visible := false;
end;

procedure TfrmNotImport.FormCreate(Sender: TObject);
begin
 DBChart1.Align := alClient;
end;

procedure TfrmNotImport.beTypeOrgPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(pFIBDatabase1.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_type_org.spr', 'Main');
  i['FormStyle'].AsInteger := integer(fsNormal);
  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);
///  o.View(Self);
  if o['ModalResult'].AsInteger = mrOk then
  begin
    beTypeOrg.Text := o['name_type_org'].AsString;
    id_type_org := o['id_type_org'].AsInt64;
    cbOnlyKvClick(Self);
  end;
  i.Free;
  o.Free;
end;

end.
