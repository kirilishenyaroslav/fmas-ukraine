unit gr_GrantRise_ByDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBarExtItems, dxBar, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridBandedTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ibase, gr_GrantRise_DM,
  ZProc, gr_uCommonConsts, cxCurrencyEdit, gr_uCommonProc;

type
  TFGrantRiseByDate = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Grid1DBTableView1DBDate: TcxGridDBColumn;
    SelectBtn: TdxBarLargeButton;
    Grid1DBTableView1DBTime: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure RefreshBtnClick(Sender: TObject);
  private
    PLanguageIndex:Byte;
  public
    Result: variant;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var
  FGrantRiseByDate: TFGrantRiseByDate;

implementation

{$R *.dfm}

constructor TFGrantRiseByDate.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  PLanguageIndex                := IndexLanguage;
  Caption   :=GrantRiseByDate_Text[PLanguageIndex];
//******************************************************************************
  DM.DSet1.Close;
  DM.DSet1.SelectSQL.Text:='SELECT * FROM GR_DT_RISE_HISTORY';
  DM.DSet1.RefreshSQL.Text:='SELECT * FROM GR_DT_RISE_HISTORY';
  DM.DSet1.Open;
  Grid1DBTableView1.DataController.DataSource:=DM.DSource1;
//******************************************************************************
  RefreshBtn.Caption:=RefreshBtn_Caption[PLanguageIndex];
  InsertBtn.Caption:=InsertBtn_Caption[PLanguageIndex];
  SelectBtn.Caption :=SelectBtn_Caption[PLanguageIndex];
  ExitBtn.Caption   :=ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
  Grid1DBTableView1DBDate.Caption  :=GridClDateRise_Caption[PLanguageIndex];
  Grid1DBTableView1DBTime.Caption  :=GridClDate_Caption[PLanguageIndex];
end;

procedure TFGrantRiseByDate.ExitBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFGrantRiseByDate.InsertBtnClick(Sender: TObject);
begin
  Result:=0;
  ModalResult:=mrYes;
end;

procedure TFGrantRiseByDate.SelectBtnClick(Sender: TObject);
begin
  Result:=DM.DSet1['ID_RISE_HISTORY'];
  ModalResult:=mrYes;
end;

procedure TFGrantRiseByDate.FormCreate(Sender: TObject);
begin
  if Grid1DBTableView1.Controller.FocusedRecord=nil then
    SelectBtn.Enabled:=false;
end;

procedure TFGrantRiseByDate.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord=nil then
    SelectBtn.Enabled:=false
  else
    SelectBtn.Enabled:=true;
end;

procedure TFGrantRiseByDate.RefreshBtnClick(Sender: TObject);
begin
  DM.DSet1.FullRefresh;
end;

end.
