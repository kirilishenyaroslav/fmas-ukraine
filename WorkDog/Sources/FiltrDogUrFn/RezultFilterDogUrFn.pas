unit RezultFilterDogUrFn;

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
  TRezultFilterForm = class(TForm)
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
    cxGridSmetUrFn: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_ID_SM_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1DB_ID_RZ_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1DB_ID_ST_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1DB_ID_KEKV_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1DB_SUMMA_PLAN_SMET: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel5: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    cxGridDBTableView1DB_SUMMA_UR_OB_SMET: TcxGridDBColumn;
    cxGridDBTableView1DB_SUMMA_SF_PL_SMET: TcxGridDBColumn;
    cxGridDBTableView1DB_SUMMA_ALL_PROV_SMET: TcxGridDBColumn;
    SmetDBLabel: TcxDBLabel;
    RazdDBLabel: TcxDBLabel;
    StatDBLabel: TcxDBLabel;
    KEKVDBLabel: TcxDBLabel;
    SelectDocButton: TdxBarLargeButton;
    cxGridDogLevel1: TcxGridLevel;
    cxGridDog: TcxGrid;
    cxGridDogDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDogDBBandedTableView1DBBanded_NAME_CUSTOMER: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_REGEST_NUM: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_N_DOG: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_D_DOG: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_DATE_BEG: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_DATE_END: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_IS_NOT_SOVPAD: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_SUMMA_DOG: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_SUMMA_DOG_PLAN: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_SUMMA_UR_OB: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_SUMMA_FN_OB: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_SUMMA_SF_PL: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_SUMMA_IN_ALL_PROV: TcxGridDBBandedColumn;
    ImageList: TImageList;
    Panel2: TPanel;
    Label1: TLabel;
    OsnovaDogDBLabel: TcxDBLabel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    dxBarLargeButton1: TdxBarLargeButton;
    cxGridDogDBBandedTableView1DBBanded_id_kekv_num: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_id_rz_num: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_is_only_kekv: TcxGridDBBandedColumn;
    cxGridDogDBBandedTableView1DBBanded_is_only_razd: TcxGridDBBandedColumn;
    dxBarLargeButton2: TdxBarLargeButton;
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure SelectDocButtonClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridDogDBBandedTableView1DblClick(Sender: TObject);
    procedure cxGridDogDBBandedTableView1DBBanded_IS_NOT_SOVPADCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    key_session : Integer;
    DATE_BEG_IN : TDate;
    DATE_END_IN : TDate;
    groupByKEKV : Integer;
    groupByRAZD : Integer;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  RezultFilterForm: TRezultFilterForm;

implementation

uses FiltrDogUrFn_DM, UrFnDogFilterDogUrFn, FilterformFiltrDogUrFn, RezultFilterDogUrFnGroupBy,
WSUnit,XLSReadWriteII2, BIFFRecsII2;

{$R *.dfm}
constructor TRezultFilterForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var
  ViewForm    : TFilterForm;
begin

  ViewForm := TFilterForm.Create(AOwner,Db_Handle);
  ViewForm.FormStyle := fsNormal;
  ViewForm.showModal;

  if (ViewForm.ModalResult = mrYes) then
  begin
    key_session := ViewForm.key_session;
    DATE_BEG_IN := ViewForm.cxDateBegIn.Date;
    DATE_END_IN := ViewForm.cxDateEndIn.Date;
    if (ViewForm.GroupByKEKVRadioButton.Checked = True) then
      begin
        groupByKEKV := 1;
        groupByRAZD := 0;
      end
    else
      begin
        groupByKEKV := 0;
        groupByRAZD := 1;
      end;
    ViewfORM.Free;
    inherited Create(AOwner);
  end;

  cxGridDogDBBandedTableView1.DataController.DataSource := FiltrDogUrFnDM.DSourceDog;
  cxGridDBTableView1.DataController.DataSource          := FiltrDogUrFnDM.DSourceSmet;
  OsnovaDogDBLabel.DataBinding.DataSource               := FiltrDogUrFnDM.DSourceDog;

  if (groupByKEKV = 1) then
  begin
    cxGridDogDBBandedTableView1DBBanded_id_kekv_num.Visible    := True;
    cxGridDogDBBandedTableView1DBBanded_id_kekv_num.GroupIndex := 0;
    cxGridDogDBBandedTableView1DBBanded_id_rz_num.Visible      := False;
    cxGridDogDBBandedTableView1DBBanded_id_rz_num.GroupIndex   := -1;
  end
  else
  begin
    cxGridDogDBBandedTableView1DBBanded_id_kekv_num.Visible    := False;
    cxGridDogDBBandedTableView1DBBanded_id_kekv_num.GroupIndex := -1;
    cxGridDogDBBandedTableView1DBBanded_id_rz_num.Visible      := True;
    cxGridDogDBBandedTableView1DBBanded_id_rz_num.GroupIndex   := 0;
  end;
end;

procedure TRezultFilterForm.dxBarLargeButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TRezultFilterForm.SelectDocButtonClick(Sender: TObject);
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

procedure TRezultFilterForm.cxGridDBTableView1DblClick(Sender: TObject);
begin
  SelectDocButton.Click;
end;

procedure TRezultFilterForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  SelectDocButton.Click;
end;

procedure TRezultFilterForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TRezultFilterForm.cxGridDogDBBandedTableView1DblClick(
  Sender: TObject);
begin
  SelectDocButton.Click;
end;

procedure TRezultFilterForm.cxGridDogDBBandedTableView1DBBanded_IS_NOT_SOVPADCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.FillRect(AViewInfo.Bounds);
  ImageList.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left+1, AViewInfo.Bounds.Top, 1-AViewInfo.GridRecord.Values[cxGridDogDBBandedTableView1DBBanded_IS_NOT_SOVPAD.Index]);
  ADone := True;
end;

procedure TRezultFilterForm.dxBarLargeButton1Click(Sender: TObject);
var
 ViewForm : TRezultFilterGroupByForm;
 //ViewForm : TForm6;
begin
  FiltrDogUrFnDM.DSetGroupDog.Close;
  FiltrDogUrFnDM.DSetGroupDog.SelectSQL.Text := 'select * from DOG_SELECT_UR_FN_BY_GROUP_BUDG(:KEY_SESSION, :DATE_BEG_IN,:DATE_END_IN)';
  FiltrDogUrFnDM.DSetGroupDog.ParamByName('KEY_SESSION').AsInt64 := key_session;
  FiltrDogUrFnDM.DSetGroupDog.ParamByName('DATE_BEG_IN').AsDate  := DATE_BEG_IN;
  FiltrDogUrFnDM.DSetGroupDog.ParamByName('DATE_END_IN').AsDate  := DATE_END_IN;
  FiltrDogUrFnDM.DSetGroupDog.Open;
  ViewForm := TRezultFilterGroupByForm.Create(Self,FiltrDogUrFnDM.DB.Handle);
  ViewForm.FormStyle := fsMDIChild;
  ViewForm.Show;
  {ViewForm := TForm6.Create(Self);
  ViewForm.FormStyle := fsMDIChild;
  ViewForm.Show; }
end;



procedure TRezultFilterForm.PrintButtonClick(Sender: TObject);
const NameReportKEKV = '\Reports\Dogovor\FilterDogUrFnKEKV.fr3';
const NameReportRazd = '\Reports\Dogovor\FilterDogUrFnRAZD.fr3';
var
  t : Char;
begin
  t := ThousandSeparator;
  ThousandSeparator := #0;
  if (groupByKEKV = 1) then
  begin
    FiltrDogUrFnDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportKEKV,True);
    FiltrDogUrFnDM.Report.Variables.Clear;
    FiltrDogUrFnDM.Report.Variables['datebeg'] := ''''+DateToStr(DATE_BEG_IN)+'''';
    FiltrDogUrFnDM.Report.Variables['dateend'] := ''''+DateToStr(DATE_END_IN)+'''';
  end
  else
  begin
    FiltrDogUrFnDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportRazd,True);
    FiltrDogUrFnDM.Report.Variables.Clear;
    FiltrDogUrFnDM.Report.Variables['datebeg'] := ''''+DateToStr(DATE_BEG_IN)+'''';
    FiltrDogUrFnDM.Report.Variables['dateend'] := ''''+DateToStr(DATE_END_IN)+'''';
  end;
 //FiltrDogUrFnDM.Report.DesignReport;

 FiltrDogUrFnDM.Report.ShowReport;
 ThousandSeparator := t;
end;

end.
