unit AvgHolPayment_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, IBase, z_dmCommonStyles, cxSplitter,
  cxTextEdit, Unit_ZGlobal_Consts, cxContainer, cxCheckBox, cxCalendar, Math,
  Menus, PFibStoredProc, frxClass, dxBar, dxBarExtItems, frxDBSet;

type
  TfmHolAvg = class(TForm)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    DSource1: TDataSource;
    DSource2: TDataSource;
    Panel1: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    cmnGrid1DateBeg: TcxGridDBColumn;
    cmnGrid1DateEnd: TcxGridDBColumn;
    cmnGrid1Days: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    Grid2: TcxGrid;
    Grid2DBTableView: TcxGridDBTableView;
    cmnGrid2DateBeg: TcxGridDBColumn;
    cmnGrid2Days: TcxGridDBColumn;
    cmnGrid2Summa: TcxGridDBColumn;
    cmnGrid2Koeff: TcxGridDBColumn;
    cmnGrid2AvgSum: TcxGridDBColumn;
    HospitalTableView: TcxGridDBTableView;
    HospitalDateBegColumn: TcxGridDBColumn;
    HospitalTotalDaysColumn: TcxGridDBColumn;
    HospitalTotalSumColumn: TcxGridDBColumn;
    HospitalTotalHoursColumn: TcxGridDBColumn;
    Grid2Level: TcxGridLevel;
    Grid3: TcxGrid;
    Grid3DBTableView: TcxGridDBTableView;
    cmnGrid3VO: TcxGridDBColumn;
    cmnGrid3VoName: TcxGridDBColumn;
    cmnGrid3KodSmeta: TcxGridDBColumn;
    cmnGrid3Summa: TcxGridDBColumn;
    cmnGrid3SummaForCount: TcxGridDBColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DSet3: TpFIBDataSet;
    DSource3: TDataSource;
    pmGetAvgPopupMenu: TPopupMenu;
    N1: TMenuItem;
    WriteTransaction: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    btnPrint: TdxBarLargeButton;
    Report: TfrxReport;
    frxDSetGlobalData: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    frxUserDataSet: TfrxUserDataSet;
    procedure Grid2DBTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure N1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    pLanguageIndex:Byte;
    pStylesDM:TStylesDM;
    LRmoving:Int64;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); overload;
    procedure PrepareHolAvg(ADB_Handle:TISC_DB_HANDLE;IdHol:Integer);
    procedure PrepareAvg(ADB_Handle:TISC_DB_HANDLE;Rmoving:Integer;KOD_SETUP_B:Integer);
  end;

implementation

uses ZProc, Dates, UAvgEdit;

const FullNameReport           = 'Reports\Zarplata\AvgZarplata.fr3';
{$R *.dfm}

constructor TfmHolAvg.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  pLanguageIndex:=LanguageIndex;
//******************************************************************************
  cmnGrid1DateBeg.Caption := GridClBegPeriod_Caption[pLanguageIndex];
  cmnGrid1DateEnd.Caption := GridClEndPeriod_Caption[pLanguageIndex];
  cmnGrid1Days.Caption    := GridClNday_Caption[pLanguageIndex];
  cmnGrid2Days.Caption    := GridClNday_Caption[pLanguageIndex];
  cmnGrid2Summa.Caption   := GridClSumma_Caption[pLanguageIndex];
  cmnGrid2Koeff.Caption   := GridClKoefficicent_Caption[pLanguageIndex];
  cmnGrid2AvgSum.Caption  := GridClCount_Caption[pLanguageIndex];
  cmnGrid2DateBeg.Caption := GridClTerm_Caption[pLanguageIndex];

//******************************************************************************
  cmnGrid3VO.Caption             := GridClKodVidOpl_Caption[pLanguageIndex];
  cmnGrid3VoName.Caption         := GridClNameVidOpl_Caption[pLanguageIndex];
  cmnGrid3KodSmeta.Caption       := GridClKodSmeta_Caption[pLanguageIndex];
  cmnGrid3Summa.Caption          := GridClSumma_Caption[pLanguageIndex];
  cmnGrid3SummaForCount.Caption  := GridClCount_Caption[pLanguageIndex];
//******************************************************************************
  pStylesDM:=TStylesDM.Create(Self);
  Grid1DBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
  Grid2DBTableView.Styles.StyleSheet  := pStylesDM.GridTableViewStyleSheetDevExpress;
  Grid3DBTableView.Styles.StyleSheet  := pStylesDM.GridTableViewStyleSheetDevExpress;
end;

procedure TfmHolAvg.PrepareHolAvg(ADB_Handle:TISC_DB_HANDLE;IdHol:Integer);
begin
  DB.Handle:=ADB_Handle;

  ReadTransaction.Active:=True;
//******************************************************************************
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_COUNT_HOL_TERMS('+IntToStr(IdHol)+')';
  DSet1.Open;

  if Dset1.RecordCount>0 then LRmoving:=DSet1['RMOVING'];

  DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_COUNT_AVARAGE_PAYMENT_UNIVER('''+
                              VarToStr(DSet1['HOLIDAY_BEG'])+''',12,'+
                              VarToStr(DSet1['RMOVING'])+',?KOD_SETUP,''F'')';


  DSet2.Open;

  DSet3.SQLs.SelectSQL.Text:='Select * FROM Z_COUNT_GET_DATA_FOR_AVG_HOL(?ID_ACCOUNT,NULL,'+VarToStr(DSet1['RMOVING'])+',?KS)';
  DSet3.Open;

  DSetGlobalData.close;
  DSetGlobalData.SQLs.SelectSQL.Text:='Select * FROM Z_MAN_MOVINGS_BY_R('+
                                      VarToStr(DSet1['RMOVING'])+', '+
                                      VarToStr(DSet1['KOD_SETUP'])+')';

  DSetGlobalData.Open;
end;

procedure TfmHolAvg.PrepareAvg(ADB_Handle:TISC_DB_HANDLE;Rmoving:Integer;KOD_SETUP_B:Integer);
begin
  DB.Handle:=ADB_Handle;
  ReadTransaction.Active:=True;
  LRmoving:=Rmoving;
//******************************************************************************
  Grid1.Visible := False;
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_AVARAGE_HOLIDAY('+IntToStr(Rmoving)+','+
                                                                IntToStr(KOD_SETUP_B)+',12)';
  DSet1.Open;
  DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_COUNT_AVARAGE_PAYMENT_UNIVER('''+
                              VarToStr(DSet1['DATE_BEG'])+''',12,'+
                              IntToStr(Rmoving)+','+IntToStr(KOD_SETUP_B)+',''F'')';
  DSet2.Open;
  DSet3.SQLs.SelectSQL.Text:='Select * FROM Z_COUNT_GET_DATA_FOR_AVG_HOL(?ID_ACCOUNT,NULL,'+IntToStr(Rmoving)+','+IntToStr(KOD_SETUP_B)+')';
  DSet3.Open;

end;

procedure TfmHolAvg.Grid2DBTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);

  var
    TotalDays:Variant;
    TotalSum:Variant;

begin
    try
           TotalSum:=Grid2DBTableView.DataController.Summary.FooterSummaryValues[0];
           TotalDays:=Grid2DBTableView.DataController.Summary.FooterSummaryValues[1];


         if (not VarIsNull(TotalSum)) then
          ASender.DataController.Summary.FooterSummaryValues[2]:=
                    'Середнє = '+FloatToStr(SimpleRoundTo(VarAsType(TotalSum, varDouble)/varAsType(TotalDays,varDouble),-2));
    except on E:Exception do begin end;

    end;
end;

procedure TfmHolAvg.N1Click(Sender: TObject);
var InsertSP:TPFibStoredProc;
    ks:Integer;
    dcount:string;
    T: TfrmAvgEdit;
begin
     if (DSet2.RecordCount>0)
     then begin
               if  (DSet2.FieldByName('BEFORE_START').Value=1)
               then begin
                         T:=TfrmAvgEdit.Create(self, DB.Handle);

                         case YearMonthFromKodSetup(DSet2.FieldByName('ks').value, false) of
                              1, 3, 5, 7, 8, 10, 12: T.NumDays.EditValue:=31;
                              4, 6, 9, 11 : T.NumDays.EditValue:=30;
                              2:T.NumDays.EditValue:=28;
                         end;

                         if T.ShowModal=mrYes
                         then begin
                                   InsertSP:=TPFibStoredProc.Create(self);
                                   InsertSP.Database:=DB;
                                   InsertSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   InsertSP.StoredProcName:='Z_OLD_PERIOD_DATA2_IU';
                                   InsertSP.Prepare;
                                   ks:=DSet2.FieldByName('ks').value;
                                   InsertSP.ParamByName('kod_setup').AsInteger:=ks;
                                   //od_Caption[pLanguageIndex];



//******************************************************************************

  //cmnGrid2DateBeg.Caption.Value:=DSet2.FieldByName('ks').value;
                                   InsertSP.ParamByName('num_days').Value :=T.NumDays.EditValue;
                                   InsertSP.ParamByName('summa').Value    :=T.SummaNar.EditValue;
                                   InsertSP.ParamByName('kod_smet').Value :=T.FidSmeta;

                                   InsertSP.ParamByName('rmoving').asInt64:=LRmoving;
                                   InsertSP.ExecProc;
                                   WriteTransaction.Commit;
                                   InsertSP.Close;
                                   InsertSP.Free;

                                   DSet2.CloseOpen(true);
                                   DSet2.Locate('ks',ks,[]);
                                   DSet3.CloseOpen(true);
                          end;
               end
               else ShowMessage('Не можна корегувати середнє для місяця в якому зроблено розрахунок!');
     end;
end;

procedure TfmHolAvg.btnPrintClick(Sender: TObject);
var TotalDays:Variant;
    TotalSum:Variant;
    Total_AVG_SUMMA:Variant;
begin
  TotalSum:=Grid2DBTableView.DataController.Summary.FooterSummaryValues[0];
  TotalDays:=Grid2DBTableView.DataController.Summary.FooterSummaryValues[1];
  Total_AVG_SUMMA:=Grid2DBTableView.DataController.Summary.FooterSummaryValues[4];
  Report.Clear;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+FullNameReport,True);
  Report.Variables.Clear;
  Report.Variables['AVG']:=''''+'Середнє = '+FloatToStr(SimpleRoundTo(VarAsType(TotalSum, varDouble)/varAsType(TotalDays,varDouble),-2))+'''';
  Report.Variables['COUNT_DAYS']:=''''+FloatToStr(TotalDays)+'''';
  Report.Variables['SUM_SUMMA_N_KOEFF']:=''''+FloatToStr(TotalSum)+'''';
  Report.Variables['KOEFF']:='''====''';
  Report.Variables['SUM_AVG_SUMMA']:=''''+FloatToStr(Total_AVG_SUMMA)+'''';
  Report.Variables['AVG_TEXT']:=''''+FloatToStr(SimpleRoundTo(VarAsType(TotalSum, varDouble)/varAsType(TotalDays,varDouble),-2))+'''';

  DSet1.First;
  Report.Variables['PERIOD_BEG']:=''''+DateToStr(DSet1['DATE_BEG'])+'''';
  DSet1.Last;
  Report.Variables['PERIOD_END']:=''''+DateToStr(DSet1['DATE_END'])+'''';
  DSet1.First;



  if zDesignReport then Report.DesignReport
                   else Report.ShowReport;

end;

end.
