unit AvgPayment_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, IBase, z_dmCommonStyles, cxSplitter,
  cxTextEdit, Unit_ZGlobal_Consts;

type
  TfmAvgPayment = class(TForm)
    ResultPanel: TPanel;
    HospDataGroupBox: TGroupBox;
    DaysLabel: TLabel;
    HoursLabel: TLabel;
    AvgPaymentLabel: TLabel;
    DaysCaption: TLabel;
    HoursCaption: TLabel;
    AvgPaymentCaption: TLabel;
    IsSmenaLabel: TLabel;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    cmnKOD_SETUP: TcxGridDBColumn;
    cmnDAYS: TcxGridDBColumn;
    cmnHOURS: TcxGridDBColumn;
    cmnSUMMA: TcxGridDBColumn;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    DSet3: TpFIBDataSet;
    DSet4: TpFIBDataSet;
    DSource1: TDataSource;
    DSource2: TDataSource;
    DSource3: TDataSource;
    DSource4: TDataSource;
    cmnID_MAN: TcxGridDBColumn;
    MainPanel: TPanel;
    DetailPanel: TPanel;
    cxSplitter1: TcxSplitter;
    DetailGridDBTableView1: TcxGridDBTableView;
    DetailGridLevel1: TcxGridLevel;
    DetailGrid: TcxGrid;
    cmnID_VIDOPL: TcxGridDBColumn;
    cmnKOD_VIDOPL: TcxGridDBColumn;
    cmnNAME_VIDOPL: TcxGridDBColumn;
    cmnSUMMAdetail: TcxGridDBColumn;
    cmnSUMMA_HOSP: TcxGridDBColumn;
    procedure cmnKOD_SETUPGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cxSplitter1BeforeOpen(Sender: TObject;
      var AllowOpen: Boolean);
    procedure cxSplitter1AfterClose(Sender: TObject);
  private
    { Private declarations }
    pLanguageIndex:Byte;
    pStylesDM:TStylesDM;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ID_HOSP:Integer); reintroduce;
  end;

implementation

uses ZProc, Dates;

{$R *.dfm}

constructor TfmAvgPayment.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ID_HOSP:Integer);
begin
  inherited Create(AOwner);
  pLanguageIndex:=LanguageIndex;
//******************************************************************************
  DB.Handle:=ADB_Handle;
  ReadTransaction.Active:=True;
//******************************************************************************
  cmnKOD_VIDOPL.Caption  := GridClKodVidOpl_Caption[pLanguageIndex];
  cmnNAME_VIDOPL.Caption := GridClNameVidopl_Caption[pLanguageIndex];
  cmnSUMMAdetail.Caption := GridClSumma_Caption[pLanguageIndex];
//******************************************************************************
  cmnKOD_SETUP.Caption := GridClKodSetup_Caption[pLanguageIndex];
  cmnDAYS.Caption      := GridClNday_Caption[pLanguageIndex];
  cmnHOURS.Caption     := GridClClock_Caption[pLanguageIndex];
  cmnSUMMA.Caption     := GridClSumma_Caption[pLanguageIndex];
//******************************************************************************
  pStylesDM:=TStylesDM.Create(Self);
  Grid1DBTableView1.Styles.StyleSheet      := pStylesDM.GridTableViewStyleSheetDevExpress;
  DetailGridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  cxSplitter1.CloseSplitter;
//******************************************************************************
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_PAYMENT_COUNT_AVG_HOSP('+IntToStr(ID_HOSP)+')';
  DSet4.SQLs.SelectSQL.Text:='SELECT * FROM Z_PAYMENT_COUNT_HOSP('+IntToStr(ID_HOSP)+')';
  DSet1.Open;
  DSet4.Open;

  DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_AVG_DATA('+IntToStr(ID_HOSP)+','+'?HOSP_DATE,?IS_SMENA,?WORK_DATE_BEG)';
  DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_DATA_COUNT(?ID_MAN,?KOD_SETUP,'''
                             +DateToStr(DSet1['WORK_DATE_BEG'])+''','''
                             +DSet1['IS_SMENA']+''','''
                             +DateToStr(DSet1['HOSP_DATE'])+''')';
  DSet2.Open;
  DSet3.Open;
//******************************************************************************
  if DSet1.FieldByName('IS_HANDS').AsString='F' then
   begin
    DaysLabel.Caption  := DSet4['DAYS_FOR_AVG'];
    HoursLabel.Caption := DSet4['HOURS_FOR_AVG'];
   end
  else
   begin
    DaysLabel.Caption  := '---';
    HoursLabel.Caption := '---';
   end;
  AvgPaymentLabel.Caption:=DSet4['SUMMA']; 
//******************************************************************************
end;

procedure TfmAvgPayment.cmnKOD_SETUPGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText:=KodSetupToPeriod(ARecord.Values[0],4)
end;

procedure TfmAvgPayment.cxSplitter1BeforeOpen(Sender: TObject;
  var AllowOpen: Boolean);
begin
  if DSet1.FieldByName('IS_HANDS').AsString='F' then
    begin
      AllowOpen:=True;
      Width:=Width+437;
      Position:=poMainFormCenter;
    end
  else
    AllowOpen:=False;
end;

procedure TfmAvgPayment.cxSplitter1AfterClose(Sender: TObject);
begin
  Width:=Width-437;
  Position:=poMainFormCenter;
end;

end.
