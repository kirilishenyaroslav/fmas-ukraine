unit AvgComPayment_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, IBase, z_dmCommonStyles, cxSplitter,
  cxTextEdit, Unit_ZGlobal_Consts, cxContainer, cxCheckBox, cxCalendar, Math,
  Menus, PFibStoredProc;

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
    WriteTransaction: TpFIBTransaction;
    Grid2DBTableViewDBColumn1: TcxGridDBColumn;
    Grid2DBTableViewDBColumn2: TcxGridDBColumn;
    procedure Grid2DBTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    pLanguageIndex:Byte;
    pStylesDM:TStylesDM;
    LRmoving:Int64;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); overload;
    procedure PrepareComAvg(ADB_Handle:TISC_DB_HANDLE;IdCom:Integer);
    procedure PrepareAvg(ADB_Handle:TISC_DB_HANDLE;Rmoving:Integer;KOD_SETUP_B:Integer);
  end;

implementation

uses ZProc, Dates;

{$R *.dfm}

constructor TfmHolAvg.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  pLanguageIndex:=LanguageIndex;
//******************************************************************************
  cmnGrid1DateBeg.Caption := GridClBegPeriod_Caption[pLanguageIndex];
  cmnGrid1DateEnd.Caption := GridClEndPeriod_Caption[pLanguageIndex];
  cmnGrid1Days.Caption    := GridClNday_Caption[pLanguageIndex];
//******************************************************************************
  cmnGrid2Days.Caption    := GridClNday_Caption[pLanguageIndex];
  cmnGrid2DateBeg.Caption := GridClKodSetup_Caption[pLanguageIndex];
  //cmnGrid2Summa.Caption   := GridClSumma_Caption[pLanguageIndex];
  //cmnGrid2Koeff.Caption   := GridClKoefficicent_Caption[pLanguageIndex];
  //cmnGrid2AvgSum.Caption  := GridClCount_Caption[pLanguageIndex];
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

procedure TfmHolAvg.PrepareComAvg(ADB_Handle:TISC_DB_HANDLE;IdCom:Integer);
begin
  DB.Handle:=ADB_Handle;
  ReadTransaction.Active:=True;
//******************************************************************************
  DSet1.SQLs.SelectSQL.Text:=' SELECT * FROM Z_COUNT_COL_TERMS('+IntToStr(IdCom)+') ';
  DSet1.Open;

  if Dset1.RecordCount>0 then LRmoving:=DSet1['RMOVING'];

  DSet2.SQLs.SelectSQL.Text:=' SELECT * FROM Z_COUNT_AVARAGE_COMANDIROVKI('''+
                               VarToStr(DSet1['c_BEG'])+''''+','+
                               VarToStr(DSet1['RMOVING'])+','+VarToStr(DSet1['ID_MAN'])+')';


  DSet2.Open;

  DSet3.SQLs.SelectSQL.Text:='Select * FROM Z_COUNT_GET_DATA_FOR_AVG_COM(?ID_ACCOUNT,'+VarToStr(DSet1['RMOVING'])+')';
  DSet3.Open;
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
  DSet3.SQLs.SelectSQL.Text:='Select * FROM Z_COUNT_GET_DATA_FOR_AVG_HOL(?ID_ACCOUNT,NULL,'+IntToStr(Rmoving)+')';
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
                    'Середнє = '+FloatToStr(SimpleRoundTo(TotalSum/TotalDays,-2));
    except on E:Exception do begin end;

    end;
end;

procedure TfmHolAvg.N1Click(Sender: TObject);
var InsertSP:TPFibStoredProc;
    ks:Integer;
begin
     if (DSet2.RecordCount>0)
     then begin
               if  (DSet2.FieldByName('BEFORE_START').Value=1)
               then begin
                         InsertSP:=TPFibStoredProc.Create(self);
                         InsertSP.Database:=DB;
                         InsertSP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='Z_OLD_PERIOD_DATA2_IU';
                         InsertSP.Prepare;
                         ks:=DSet2.FieldByName('ks').value;
                         InsertSP.ParamByName('kod_setup').Value:=DSet2.FieldByName('ks').value;
                         InsertSP.ParamByName('num_days').Value     :=StrToFloat(InputBox('Увага!','Треба ввести суму кількість днів','22'));
                         InsertSP.ParamByName('summa').Value    :=StrToFloat(InputBox('Увага!','Треба ввести суму нарахувань','100,10'));
                         InsertSP.ParamByName('rmoving').asInt64:=LRmoving;
                         InsertSP.ExecProc;
                         WriteTransaction.Commit;
                         InsertSP.Close;
                         InsertSP.Free;

                         DSet2.CloseOpen(true);
                         DSet2.Locate('ks',ks,[]);

               end
               else ShowMessage('Не можна корегувати середнє для місяця в якому зроблено розрахунок!');
     end;
end;

end.
