unit MainInfl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, ActnList, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxGridTableView, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, ExtCtrls, Buttons, ToolWin,
  ComCtrls, dxBar, dxBarExtItems,UnitDM, ZTypes, IBase, Dates, cxSpinEdit,
  gr_uCommonProc, gr_uCommonConsts, cxGridBandedTableView;

type
  TFMainInfl = class(TForm)
    pnlPeriod: TPanel;
    Label2: TLabel;
    grMain: TcxGrid;
    grMainDBVwMain: TcxGridDBTableView;
    grMainDBVwMainYear: TcxGridDBColumn;
    grMainDBVwMainMonth: TcxGridDBColumn;
    grMainDBVwMainZ_INDEX_INFL: TcxGridDBColumn;
    grMainDBVwMainIndInfl: TcxGridDBColumn;
    grMainDBVwMainProjMin: TcxGridDBColumn;
    grMainDBVwMainSummInd: TcxGridDBColumn;
    grMainLevel1: TcxGridLevel;
    ActionList1: TActionList;
    act_Refresh: TAction;
    act_Insert: TAction;
    act_Upd: TAction;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    LBtnUpdate: TdxBarLargeButton;
    LBtnDeletePayment: TdxBarLargeButton;
    BtnSave: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    LargeBtn: TdxBarLargeButton;
    dxBarGroup1: TdxBarGroup;
    EditMonth: TcxComboBox;
    EditYear: TcxSpinEdit;
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
    constructor create(AOwner:TComponent; DB:TISC_DB_HANDLE); reintroduce;
    procedure grMainDBVwMainMonthGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure grMainDBVwMainYearGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure EditMonthPropertiesEditValueChanged(Sender: TObject);
    procedure EditYearPropertiesEditValueChanged(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure LargeBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainInfl: TFMainInfl;

implementation

uses EditInfl;

{$R *.dfm}

{ TFMain }

constructor TFMainInfl.create(AOwner:TComponent; DB:TISC_DB_HANDLE);
var KodSetup:integer;
begin
  inherited create(AOwner);
  DM:=TDM.create(AOwner,DB);
  grMainDBVwMain.datacontroller.datasource:=DM.DataSource1;

  EditMonth.Properties.Items.Text                 := MonthesList_Text[1];
  KodSetup := grKodSetup(DB);

  EditYear.EditValue:=YearMonthFromKodSetup(KodSetup);
  EditMonth.ItemIndex:=YearMonthFromKodSetup(KodSetup,False)-2;
end;

procedure TFMainInfl.grMainDBVwMainMonthGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText:=MonthNumToName(YearMonthFromKodSetup(StrToInt(AText),False));
end;

procedure TFMainInfl.grMainDBVwMainYearGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText:=IntToStr(YearMonthFromKodSetup(StrToInt(AText),True));
end;

procedure TFMainInfl.EditMonthPropertiesEditValueChanged(Sender: TObject);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.SQLs.SelectSQL.Text := 'Select * from Z_INDEX_INFLYACII_S(' + IntToStr( PeriodToKodSetup(EditYear.EditValue,EditMonth.ItemIndex+1) )+')';
  DM.pFIBDataSet1.Open;
end;

procedure TFMainInfl.EditYearPropertiesEditValueChanged(Sender: TObject);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.SQLs.SelectSQL.Text := 'Select * from Z_INDEX_INFLYACII_S(' + IntToStr( PeriodToKodSetup(EditYear.EditValue,EditMonth.ItemIndex+1) )+')';
  DM.pFIBDataSet1.Open;
end;

procedure TFMainInfl.dxBarLargeButton5Click(Sender: TObject);
var param:TZInfl_Hand_Param;
begin
  param.Aowner:=self;
  param.fs:=zcfsInsert;
  param.Kod_Setup:=grKodSetup(DM.pFIBDatabase1.Handle);
  param.Index_infl:=100.00;
  if View_FInflInd(param)
    then DM.pFIBDataSet1.Closeopen(True);

end;

procedure TFMainInfl.LBtnUpdateClick(Sender: TObject);
var param:TZInfl_Hand_Param;
begin
  param.Aowner:=self;
  param.fs:=zcfsUpdate;
  param.Kod_Setup:=DM.pFIBDataSet1['KOD_SETUP'];
  param.Index_infl:=DM.pFIBDataSet1['Z_INDEX_INFL'];
  if View_FInflInd(param)
    then DM.pFIBDataSet1.Closeopen(True);
end;

procedure TFMainInfl.dxBarLargeButton2Click(Sender: TObject);
begin
  if DM.RTransaction.Active then DM.RTransaction.Commit;
  if DM.WTransaction.Active then DM.WTransaction.Rollback;
  close;
end;

procedure TFMainInfl.LBtnDeletePaymentClick(Sender: TObject);
var param:TZInfl_Hand_Param;
begin
  param.Aowner:=self;
  param.fs:=zcfsDelete;
  param.Kod_Setup:=DM.pFIBDataSet1['KOD_SETUP'];
  if View_FInflInd(param)
    then DM.pFIBDataSet1.Closeopen(True);
end;

procedure TFMainInfl.LargeBtnClick(Sender: TObject);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.Open;
end;

end.
