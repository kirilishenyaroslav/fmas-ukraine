unit f1df_AddOstm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, dxBar,
  dxBarExtItems, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridBandedTableView, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, ibase,
  ZProc, FIBQuery, pFIBQuery, pFIBStoredProc, ZMessages, ZDPKConsts,
  dates, cxTextEdit, Unit_ZGlobal_Consts;

type
  TFAddOst = class(TForm)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    DSource: TDataSource;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
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
    GridDBTableView1DBSmetaKod: TcxGridDBColumn;
    GridDBTableView1DBKodSetup: TcxGridDBColumn;
    GridDBTableView1DBSDoh: TcxGridDBColumn;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    GridDBTableView1DBSTax: TcxGridDBColumn;
    GridDBTableView1DBSchNumber: TcxGridDBColumn;
    procedure SelectBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GridDBTableView1DBKodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex:Byte;
    PDb_Handle:TISC_DB_HANDLE;
    Id_1df:integer;
  public
    constructor Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE; PId_1df:integer);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TFAddOst.Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE; PId_1df:integer);
begin
  inherited Create(AOwner);
  PDb_Handle := ADB_handle;
  PLanguageIndex := LanguageIndex;
  Id_1df:=PId_1df;
//******************************************************************************
  DB.Handle:=PDb_Handle;
  DSet.SelectSQL.Text:='SELECT * FROM Z_1DF_OST_FOR_ADD_S('+IntToStr(PId_1df)+')';
  DSet.Open;
//******************************************************************************
  self.Caption            := Ostatok_Const[PLanguageIndex];

  RefreshBtn.Caption      := RefreshBtn_Caption[PLanguageIndex];
  SelectBtn.Caption       := SelectBtn_Caption[PLanguageIndex];
  ExitBtn.Caption         := ExitBtn_Caption[PLanguageIndex];

  GridDBTableView1DBKodSetup.Caption   := GridClKodSetup_Caption[PLanguageIndex];
  GridDBTableView1DBSmetaKod.Caption   := GridClKodSmeta_Caption[PLanguageIndex];
  GridDBTableView1DBSchNumber.Caption  := GridClFullNumberSch_Caption[PLanguageIndex];
  GridDBTableView1DBSDoh.Caption       := GridClSumNar_Caption[PLanguageIndex];
  GridDBTableView1DBSTax.Caption       := GridClSumUd_Caption[PLanguageIndex];
end;

procedure TFAddOst.SelectBtnClick(Sender: TObject);
begin
  try
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'Z_1DF_VEDOMOST_ADD';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_REESTR').AsVariant := 9999999998;
    StoredProc.ParamByName('ID_1DF_REPORT').AsInteger := Id_1df;
    StoredProc.ParamByName('ID_SMETA').AsVariant := DSet['ID_SMETA'];
    StoredProc.ParamByName('ID_SCH').AsVariant := DSet['ID_SCH'];
    StoredProc.ParamByName('KOD_SETUP').AsVariant := DSet['KOD_SETUP'];
    StoredProc.ParamByName('TYPE_OPER').AsVariant := null;
    StoredProc.ParamByName('TYPE_R').AsString := 'F';
    StoredProc.ExecProc;
    WriteTransaction.Commit;
    DSet.FullRefresh;
  except
    on E:Exception do
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      WriteTransaction.Rollback;
    end;
  end;
end;

procedure TFAddOst.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFAddOst.RefreshBtnClick(Sender: TObject);
begin
  DSet.FullRefresh;
end;

procedure TFAddOst.GridDBTableView1DBKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText<>'' then
  AText:=KodSetupToPeriod(strToInt(AText),1);
end;

procedure TFAddOst.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if(AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
    SelectBtn.Enabled:=false;
end;

procedure TFAddOst.FormShow(Sender: TObject);
begin
  GridDBTableView1FocusedRecordChanged(GridDBTableView1,nil,GridDBTableView1.Controller.FocusedRecord,True);
end;

end.
