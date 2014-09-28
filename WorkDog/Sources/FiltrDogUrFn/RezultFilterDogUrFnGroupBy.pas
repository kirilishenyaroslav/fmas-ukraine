unit RezultFilterDogUrFnGroupBy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit,
  StdCtrls, Buttons, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, ExtCtrls, cxTL, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems, cxContainer, cxLabel,
  cxDBLabel, cxCheckBox,ibase, cxGridBandedTableView,
  cxGridDBBandedTableView, ImgList;

type
  TRezultFilterGroupByForm = class(TForm)
    dxBarManager1: TdxBarManager;
    FiltrButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    Panel1: TPanel;
    Panel3: TPanel;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GroupBox6: TGroupBox;
    Bevel2: TBevel;
    Panel5: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    SmetDBLabel: TcxDBLabel;
    RazdDBLabel: TcxDBLabel;
    StatDBLabel: TcxDBLabel;
    KEKVDBLabel: TcxDBLabel;
    SelectDocButton: TdxBarLargeButton;
    ImageList: TImageList;
    Panel2: TPanel;
    Label1: TLabel;
    OsnovaDogDBLabel: TcxDBLabel;
    cxGridDogGroupBy: TcxGrid;
    cxGridDogGroupByDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDogGroupByDBBandedTableView1DBBanded_NAME_CUSTOMER: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_REGEST_NUM: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_N_DOG: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_D_DOG: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_DATE_BEG: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_DATE_END: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_IS_NOT_SOVPAD: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_DOG: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_DOG_PLAN: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_UR_OB: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_FN_OB: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_SF_PL: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_IN_ALL_PROV: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_ID_SM_NUM: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_ID_RZ_NUM: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_ID_ST_NUM: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_ID_KEKV_NUM: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_ALL_PROV_SMET: TcxGridDBBandedColumn;
    cxGridDogGroupByLevel1: TcxGridLevel;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_PLAN_SMET: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_UR_OB_SMET: TcxGridDBBandedColumn;
    cxGridDogGroupByDBBandedTableView1DBBanded_SUMMA_SF_PL_SMET: TcxGridDBBandedColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure SelectDocButtonClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridDogGroupByDBBandedTableView1DblClick(Sender: TObject);
    procedure cxGridDogGroupByDBBandedTableView1DBBanded_IS_NOT_SOVPADCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    key_session : Integer;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  RezultFilterGroupByForm: TRezultFilterGroupByForm;

implementation

uses FiltrDogUrFn_DM, UrFnDogFilterDogUrFn, FilterformFiltrDogUrFn;

{$R *.dfm}
constructor TRezultFilterGroupByForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  cxGridDogGroupByDBBandedTableView1.DataController.DataSource := FiltrDogUrFnDM.DSourceGroupDog;
end;

procedure TRezultFilterGroupByForm.dxBarLargeButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TRezultFilterGroupByForm.SelectDocButtonClick(Sender: TObject);
var
  ViewForm : TUrFnDogForm;
begin
  FiltrDogUrFnDM.DSetUrOb.Close;
  FiltrDogUrFnDM.DSetFnOb.Close;
  FiltrDogUrFnDM.DSetPlat.Close;
  FiltrDogUrFnDM.DSetUrOb.SelectSQL.Text := 'select distinct * from DOG_DT_UR_ZOB_BY_DOG(:id_dog)';
  FiltrDogUrFnDM.DSetFnOb.SelectSQL.Text := 'select distinct * from DOG_DT_FN_ZOB_BY_DOG(:id_dog)';
  FiltrDogUrFnDM.DSetPlat.SelectSQL.Text := 'select distinct * from DOG_DT_PL_BY_DOG(:id_dog)';
  FiltrDogUrFnDM.DSetUrOb.Open;
  FiltrDogUrFnDM.DSetFnOb.Open;
  FiltrDogUrFnDM.DSetPlat.Open;



  ViewForm := TUrFnDogForm.Create(Self);
  ViewForm.ContragentDBLabel.DataBinding.DataSource := FiltrDogUrFnDM.DSourceDog;
  ViewForm.N_DOG_DBLabel.DataBinding.DataSource     := FiltrDogUrFnDM.DSourceDog;
  ViewForm.DateDogDBLabel.DataBinding.DataSource    := FiltrDogUrFnDM.DSourceDog;
  ViewForm.SUMMA_DOG_DBLabel.DataBinding.DataSource := FiltrDogUrFnDM.DSourceDog;
  ViewForm.cxGridUrObDBTableView1.DataController.DataSource := FiltrDogUrFnDM.DSourceUrOb;
  ViewForm.cxGridFnObDBTableView1.DataController.DataSource := FiltrDogUrFnDM.DSourceFnOb;
  ViewForm.cxGridPlatDBTableView1.DataController.DataSource := FiltrDogUrFnDM.DSourcePlat;
  ViewForm.cxGridPlatDBTableView1
  .ViewData.Expand(True);
  ViewForm.Show;
end;

procedure TRezultFilterGroupByForm.cxGridDBTableView1DblClick(Sender: TObject);
begin
  SelectDocButton.Click;
end;

procedure TRezultFilterGroupByForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  SelectDocButton.Click;
end;

procedure TRezultFilterGroupByForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TRezultFilterGroupByForm.cxGridDogGroupByDBBandedTableView1DblClick(
  Sender: TObject);
begin
  SelectDocButton.Click;
end;

procedure TRezultFilterGroupByForm.cxGridDogGroupByDBBandedTableView1DBBanded_IS_NOT_SOVPADCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.FillRect(AViewInfo.Bounds);
  ImageList.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left+1, AViewInfo.Bounds.Top, 1-AViewInfo.GridRecord.Values[cxGridDogGroupByDBBandedTableView1DBBanded_IS_NOT_SOVPAD.Index]);
  ADone := True;
end;

end.
