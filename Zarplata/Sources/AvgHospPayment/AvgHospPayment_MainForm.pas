unit AvgHospPayment_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, IBase, z_dmCommonStyles, cxSplitter,
  cxTextEdit, Unit_ZGlobal_Consts, cxContainer, cxCheckBox, Menus,
  PFibStoredProc, cxLookAndFeelPainters, cxButtons,ZTypes,PackageLoad;

type
  TfmAvgPayment = class(TForm)
    ResultPanel: TPanel;
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
    DSource1: TDataSource;
    DSource2: TDataSource;
    DSource3: TDataSource;
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
    IsSmenaCB: TcxCheckBox;
    IsHandsCB: TcxCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    WriteTransaction: TpFIBTransaction;
    DataSetAlg: TpFIBDataSet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    Grid2ClRMoving: TcxGridDBColumn;
    Grid2ClPeriodBeg: TcxGridDBColumn;
    Grid2ClPeriodEnd: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DSetDetail: TpFIBDataSet;
    DataSourcedetail: TDataSource;
    DataSetMan: TpFIBDataSet;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    ButtonAvg: TcxButton;
    procedure cmnKOD_SETUPGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure N1Click(Sender: TObject);
    procedure DSetDetailAfterScroll(DataSet: TDataSet);
    procedure ButtonAvgClick(Sender: TObject);

  private
    { Private declarations }
    pLanguageIndex:Byte;
    pStylesDM:TStylesDM;
    LTn:Variant;
    id_hosp_man :integer;
    id_man : integer;
    date_beg_hosp :Tdate;
    rmoving_man : integer;
  public
    TypeAlg : integer;
    procedure RefreshAll;
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ID_HOSP:Integer; rmoving : integer); reintroduce;
  end;

implementation

uses ZProc, Dates;

{$R *.dfm}

constructor TfmAvgPayment.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ID_HOSP:Integer; rmoving : integer);
begin
  inherited Create(AOwner);
  pLanguageIndex:=LanguageIndex;
//******************************************************************************
  DB.Handle:=ADB_Handle;
  ReadTransaction.Active:=True;
  id_hosp_man := id_hosp;
  rmoving_man :=rmoving;
//******************************************************************************
  cmnKOD_VIDOPL.Caption  := GridClKodVidOpl_Caption[pLanguageIndex];
  cmnNAME_VIDOPL.Caption := GridClNameVidopl_Caption[pLanguageIndex];
  cmnSUMMAdetail.Caption := GridClSumma_Caption[pLanguageIndex];
//******************************************************************************
  cmnKOD_SETUP.Caption := GridClKodSetup_Caption[pLanguageIndex];
  cmnDAYS.Caption      := GridClNday_Caption[pLanguageIndex];
  cmnHOURS.Caption     := GridClClock_Caption[pLanguageIndex];
  cmnSUMMA.Caption     := GridClSumma_Caption[pLanguageIndex];

  Grid2ClRMoving.Caption              := ZHosp_Rmoving_type[PLanguageIndex];
  Grid2ClPeriodBeg.Caption            := ZHosp_Z[PLanguageIndex];
  Grid2ClPeriodEnd.Caption            := ZHosp_Po[PLanguageIndex];
  cxGridDBTableView1DBColumn1.Caption := ZHosp_POst[PLanguageIndex];
//******************************************************************************
  pStylesDM:=TStylesDM.Create(Self);
  Grid1DBTableView1.Styles.StyleSheet      := pStylesDM.GridTableViewStyleSheetDevExpress;
  DetailGridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
  cxGridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  cxSplitter1.CloseSplitter;
//******************************************************************************

  DataSetAlg.Close;
  DataSetAlg.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_SYS_ALGORITM('+Inttostr(2)+','''+datetostr(date)+''','+IntToStr(ID_HOSP)+')';
  DataSetAlg.Open;

  TypeAlg := DataSetAlg.FieldByname('ACTIV_ALGORITM').AsInteger;

  DataSetMan.Close;
  DataSetMan.SQLs.SelectSQL.Text:='SELECT * FROM MAN_HOSPITAL where id_man_hosp='+IntToStr(ID_HOSP);
  DataSetMan.Open;

  id_man        := DataSetMan.FieldByName('ID_MAN').AsInteger;
  date_beg_hosp := DataSetMan.FieldByName('Date_beg').AsDateTime;

  RefreshAll;
  if(TypeAlg=1) then
  begin
      DSetDetail.First;//Locate('rmoving', DSetDetail['RMOVING'],[]);
  end;
end;

procedure TfmAvgPayment.RefreshAll;
begin
if(TypeAlg=1)
then
  begin
      DSetDetail.AfterScroll := nil;

      DSetDetail.Close;
      DSetDetail.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_(:ID_MAN,:Date_beg,:Date_end)';
      DSetDetail.ParamByName('ID_MAN').Value := id_man;
      DSetDetail.ParamByName('Date_beg').Value := date_beg_hosp;
      DSetDetail.ParamByName('Date_end').Value := date_beg_hosp;
      DSetDetail.Open;

      DSet1.Close;
      DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_PAYMENT_COUNT_AVG_HOSP('+IntToStr(id_hosp_man)+') where rmoving='+inttostr(DSetDetail['RMOVING']);
      DSet1.Open;
      LTn:=DSet1.FieldByName('TN').Value;

      DSet2.Close;
      DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_AVG_DATA('+IntToStr(id_hosp_man)+','+'?HOSP_DATE,?IS_SMENA,?WORK_DATE_BEG) where rmoving='+inttostr(DSetDetail['RMOVING']);
      DSet2.Open;

      DSet3.Close;
      DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_DATA_COUNT(?ID_ACCOUNT,'+
                                 ''''+DSet1['IS_SMENA']+''''+','+
                                 ''''+DateToStr(DSet1['HOSP_DATE'])+''''+','+IntToStr(id_hosp_man)+') where RMOVING=?RMoving';

      DSet3.Open;

      DSetDetail.AfterScroll := DSetDetailAfterScroll;
  end else
  begin
      cxGrid1.Visible := false;
      ButtonAvg.Visible := false;

      DSet1.Close;
      DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_PAYMENT_COUNT_AVG_HOSP('+IntToStr(id_hosp_man)+')';
      DSet1.Open;
      LTn:=DSet1.FieldByName('TN').Value;


      DSet2.Close;
      DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_AVG_DATA('+IntToStr(id_hosp_man)+','+'?HOSP_DATE,?IS_SMENA,?WORK_DATE_BEG)';
      DSet2.Open;

      DSet3.Close;
      DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_DATA_COUNT(?ID_ACCOUNT,'+
                                 ''''+DSet1['IS_SMENA']+''''+','+
                                 ''''+DateToStr(DSet1['HOSP_DATE'])+''''+','+IntToStr(id_hosp_man)+')';

      DSet3.Open;

      //******************************************************************************
      //Отображение информации в зависимости от того, как было получено среднее:
      // посредством расчетов или введено вручную.
      if DSet1.FieldByName('IS_HANDS').AsString='F' then
       begin
        IsHandsCB.Checked:=False;
       end
      else
       begin
        IsHandsCB.Checked:=True;
    //    cxSplitter1.Enabled:=False;
       end;
      IsSmenaCB.Checked:=(DSet1.FieldByName('IS_SMENA').AsString='T');
    //******************************************************************************
      with Grid1DBTableView1.DataController.Summary do
        begin
          FooterSummaryValues[0]:='Середнє - '+FloatToStrF(DSet1.FieldByName('AVG_SUM').AsFloat,ffFixed,16,2);
        end;
  end;

end;

procedure TfmAvgPayment.cmnKOD_SETUPGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText:=KodSetupToPeriod(ARecord.Values[0],4)
end;

procedure TfmAvgPayment.N1Click(Sender: TObject);
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
                         InsertSP.StoredProcName:='Z_OLD_PERIOD_DATA2_IU2';
                         InsertSP.Prepare;
                         ks:=DSet2.FieldByName('kod_setup').value;
                         InsertSP.ParamByName('kod_setup').Value:=DSet2.FieldByName('kod_setup').value;
                         InsertSP.ParamByName('num_days').Value     :=StrToFloat(InputBox('Увага!','Треба ввести суму кількість днів','22'));
                         InsertSP.ParamByName('summa').Value    :=StrToFloat(InputBox('Увага!','Треба ввести суму нарахувань','100,10'));
                         InsertSP.ParamByName('tn').Value:=LTn;
                         InsertSP.ExecProc;
                         WriteTransaction.Commit;
                         InsertSP.Close;
                         InsertSP.Free;

                         DSet2.CloseOpen(true);
                         DSet2.Locate('kod_setup',ks,[]);

               end
               else ShowMessage('Не можна корегувати середнє для місяця в якому зроблено розрахунок!');
     end;
end;

procedure TfmAvgPayment.DSetDetailAfterScroll(DataSet: TDataSet);
begin
      DSet1.Close;
      DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_PAYMENT_COUNT_AVG_HOSP('+IntToStr(ID_HOSP_MAN)+') where rmoving='+inttostr(DSetDetail['RMOVING']);
      DSet1.Open;
      LTn:=DSet1.FieldByName('TN').Value;

      DSet2.Close;
      DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_AVG_DATA('+IntToStr(ID_HOSP_MAN)+','+'?HOSP_DATE,?IS_SMENA,?WORK_DATE_BEG) where rmoving='+inttostr(DSetDetail['RMOVING']);
      DSet2.Open;

      DSet3.Close;
      DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_DATA_COUNT(?ID_ACCOUNT,'+
                                 ''''+DSet1['IS_SMENA']+''''+','+
                                 ''''+DateToStr(DSet1['HOSP_DATE'])+''''+','+IntToStr(ID_HOSP_MAN)+') where RMOVING='+inttostr(DSetDetail['RMOVING']);

      DSet3.Open;

      //******************************************************************************
      //Отображение информации в зависимости от того, как было получено среднее:
      // посредством расчетов или введено вручную.
      if DSet1.FieldByName('IS_HANDS').AsString='F' then
       begin
        IsHandsCB.Checked:=False;
       end
      else
       begin
        IsHandsCB.Checked:=True;
    //    cxSplitter1.Enabled:=False;
       end;
      IsSmenaCB.Checked:=(DSet1.FieldByName('IS_SMENA').AsString='T');
    //******************************************************************************
      with Grid1DBTableView1.DataController.Summary do
        begin
          FooterSummaryValues[0]:='Середнє - '+FloatToStrF(DSet1.FieldByName('AVG_SUM').AsFloat,ffFixed,16,2);
        end;
end;

procedure TfmAvgPayment.ButtonAvgClick(Sender: TObject);
var Parameter:TZAvgSumParameter;
    rmovin_locate : integer;
begin
    Parameter.Owner        := self;
    Parameter.DB_Handle    := DB.Handle;
    Parameter.Id_Hosp_List := ID_HOSP_MAN;
    Parameter.rmoving      := DSetDetail['RMOVING'];
    rmovin_locate          := DSetDetail['RMOVING'];
    LoadAvgSumHands(Parameter);
    RefreshAll;
    DSetDetail.Locate('rmoving', rmovin_locate,[]);
    cxGrid1.SetFocus;
end;

end.
