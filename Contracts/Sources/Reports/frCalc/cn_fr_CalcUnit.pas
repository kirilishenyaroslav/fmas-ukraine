unit cn_fr_CalcUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cn_DM_Calc,
  cn_Common_Types, cn_Common_Funcs, cnConsts, cxRadioGroup, cxControls,
  cxGroupBox, ExtCtrls, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, frxExportPDF, frxExportXLS,
  frxExportHTML, frxClass, frxExportRTF, ActnList, FIBQuery, pFIBQuery,
  pFIBStoredProc, frxDBSet, DB, FIBDataSet, pFIBDataSet, frxDesgn,
  FIBDatabase, pFIBDatabase, ComCtrls, cxProgressBar;

type
  TfrmCalc = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    StatusBar1: TStatusBar;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    frxDesigner1: TfrxDesigner;
    pFIBDataSet: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    pFIBStoredProc: TpFIBStoredProc;
    pFIBDataSet3: TpFIBDataSet;
    ActionList1: TActionList;
    Action1: TAction;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    cxDateEdit: TcxDateEdit;
    cxLabelDate: TcxLabel;
    pFIBStoredProcFinal: TpFIBStoredProc;
    ProgressBar: TcxProgressBar;
    frxReport: TfrxReport;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure frxReportPrintReport(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Calc;
    ID_DOG: int64;
    ID_STUD: int64;
    ID_DOG_ROOT: int64;
    NUM_DOG : string;
    count_print: byte;
    procedure FormIniLanguage;
  public
    constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;

var
  count_print:Integer;
  ID_TRANSACTION:Variant;
  designer_rep:Integer;

implementation

{$R *.dfm}
constructor TfrmCalc.Create(AParameter:TcnSimpleParamsEx);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AParameter.Owner);

count_print := 0;

DM:=TDM_Calc.Create(Self);
DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from sys_options'; // просто чтобы убить транзакцию галимую
DM.DB.Handle:=AParameter.Db_Handle;
DM.ReadDataSet.Open;
DM.ReadDataSet.Close;
Database.Handle:=DM.DB.Handle;
 ID_DOG_ROOT := AParameter.cnParamsToPakage.ID_DOG_ROOT;
 ID_DOG      := AParameter.cnParamsToPakage.ID_DOG;
 ID_STUD     := AParameter.cnParamsToPakage.ID_STUD;
 NUM_DOG     := AParameter.cnParamsToPakage.Num_Doc;
Screen.Cursor:=crDefault;
FormIniLanguage();
end;

procedure TfrmCalc.FormIniLanguage;
begin
 PLanguageIndex:= cn_Common_Funcs.cnLanguageIndex();
 caption :=              cnConsts.fr_Reports_PrintSpravkaCalc[PLanguageIndex];
 cxLabelDate.Caption:=   cnConsts.fr_Reports_CALC_NameREP0[PLanguageIndex];
 OkButton.Caption:=      cnConsts.cn_Accept[PLanguageIndex];
 CancelButton.Caption:=  cnConsts.cn_Cancel[PLanguageIndex];
end;
procedure TfrmCalc.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmCalc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dm.free;
end;

procedure TfrmCalc.FormCreate(Sender: TObject);
begin
  cxDateEdit.Date:=Date;
  count_print:=0;
  designer_rep:=0;
end;

procedure TfrmCalc.Action1Execute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    StatusBar1.Panels[0].Text:='–ежим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    StatusBar1.Panels[0].Text:='';
  end;
end;

procedure TfrmCalc.OkButtonClick(Sender: TObject);
var
  numberDoc,ORG,OTD:String;
//  dateopl:TDate;
//  summa:Variant;
  id_session_pay, id_session_calc : int64;
  CN_SNEED, CNUPLSUM, DOLG_FINAL : Currency;
  CNDATEOPL : TDate;
begin
  Screen.Cursor := crHourGlass;
  ProgressBar.Position := 1;
  ProgressBar.Update;

  if (ID_TRANSACTION>0) then
    begin
      pFIBStoredProc.Database:=Database;
      pFIBStoredProc.Transaction:=WriteTransaction;
      WriteTransaction.StartTransaction;
      pFIBStoredProc.StoredProcName:='CN_TMP_PRINT_CN_CALC_DELETE';
      pFIBStoredProc.Prepare;
      try
        pFIBStoredProc.ExecProc;
      except
        begin
          WriteTransaction.Rollback;
          Exit;
        end;
       end;
      WriteTransaction.Commit;
    end;

  ProgressBar.Position := 10;
  ProgressBar.Update;

  //получаем идентификатор транзакции
  pFIBStoredProc.Database:=Database;
  pFIBStoredProc.Transaction:=WriteTransaction;
  WriteTransaction.StartTransaction;
  pFIBStoredProc.StoredProcName:='CN_FR_GET_ID_SESSION';
  pFIBStoredProc.Prepare;
  try
    pFIBStoredProc.ExecProc;
    ID_TRANSACTION:=pFIBStoredProc.FieldByName('ID_SESSION').AsVariant;
    WriteTransaction.Commit;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;

  ProgressBar.Position := 20;
  ProgressBar.Update;

 //отбор данных из базы
  pFIBStoredProc.Database:=Database;
  pFIBStoredProc.Transaction:=WriteTransaction;
  WriteTransaction.StartTransaction;
  pFIBStoredProc.StoredProcName:='CN_PRINT_CN_CALC';
  WriteTransaction.StartTransaction;
  pFIBStoredProc.Prepare;

  pFIBStoredProc.ParamByName('ID_STUD').AsInt64:=ID_STUD;
  pFIBStoredProc.ParamByName('end_check').AsDate:=cxDateEdit.Date;
  pFIBStoredProc.ParamByName('ID_SESSION').AsVariant:=ID_TRANSACTION;

  try
      pFIBStoredProc.ExecProc;
    except
      begin
       WriteTransaction.Rollback;
       Exit;
      end;
    end;
  WriteTransaction.Commit;

  with pFIBDataSet3 do
    begin
      Database:=Database;
      Transaction:=ReadTransaction;
      Active:=false;
      SQLs.SelectSQL.Text:='SELECT FIO_PEOPLE AS FIO from CN_DT_STUDINFO_CALC_SELECT('+VarToStr(ID_STUD)+')';
      Active:=true;
    end;

  ProgressBar.Position := 30;
  ProgressBar.Update;

  With pFIBStoredProc do
    begin
    try
    StoredProcName:='CN_DT_NUMBER_SPAV_SELECT';
    Database:=Database;
    Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    Prepare;
    ExecProc;
    numberDoc:=FieldByName('NUMBER_SPRAV').AsString;
    ORG:=FieldByName('OUT_MAIN_DEP').AsString;
    OTD:=FieldByName('OUT_CHILD_DEP').AsString;
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
  end;
  //забор данных
  with pFIBDataSet do
    begin
      Database:=Database;
      Transaction:=ReadTransaction;
      Active:=false;
      ParamByName('param_id_transaction').AsVariant:=ID_TRANSACTION;
      Active:=true;
      FetchAll;

    end;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+'PeoplePay'+'.fr3');
  frxReport.Variables.Clear;

  ProgressBar.Position := 50;
  ProgressBar.Update;

  // определ€ю общую уже уплаченную сумму
  With pFIBStoredProcFinal do
    begin
    try
  StoredProcName := 'CN_PAY';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_STUD').AsInt64 := ID_STUD;
  ParamByName('DATE_PROV_CHECK').AsShort := 1;
  ParamByName('IS_DOC_GEN').AsShort := 0;
  ParamByName('IS_PROV_GEN').AsShort := 0;
  ParamByName('IS_SMET_GEN').AsShort := 0;
  ParamByName('NOFPROV').AsShort := 1;
  ParamByName('DIGNORDOCID').AsShort := 1;
  ExecProc;

  frxReport.Variables['PLATIL_FINAL']:= '''' +  VarToStr(ParamByName('CNUPLSUM').AsCurrency) +'''';
  CNUPLSUM := ParamByName('CNUPLSUM').AsCurrency ;

  id_session_pay:= ParamByName('ID_SESSION').AsInt64;

  Transaction.Commit;
  Close;
  except
    Transaction.Rollback;
    raise;
  end;
  end;

  ProgressBar.Position := 60;
  ProgressBar.Update;

  With pFIBStoredProcFinal do
  begin
  StoredProcName := 'CN_PAY_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  ExecProc;
  Transaction.Commit;
  Close;
  end;

  ProgressBar.Position := 70;
    ProgressBar.Update;
  // определ€ю общую сумму необх. дл€ уплаты
  With pFIBStoredProcFinal do
  begin
  try
  StoredProcName := 'CN_CALC';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_STUD').AsInt64 := ID_STUD ;
  ParamByName('BEG_CHECK').AsVariant := null;
  ParamByName('END_CHECK').AsVariant := null;
  ParamByName('CNUPLSUM').AsCurrency := CNUPLSUM;
  ExecProc;

  frxReport.Variables['NADO_FINAL']:= '''' +  VarToStr(ParamByName('CN_SNEED').AsCurrency) +'''';
  CN_SNEED:= ParamByName('CN_SNEED').AsCurrency;
  CNDATEOPL := ParamByName('CNDATEOPL').AsDate;

  id_session_calc:= ParamByName('ID_SESSION').AsInt64;

  Transaction.Commit;
  Close;
  except
    Transaction.Rollback;
    raise;
  end;
  end;

  ProgressBar.Position := 80;
  ProgressBar.Update;

  With pFIBStoredProcFinal do
  begin
  StoredProcName := 'CN_CALC_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  ExecProc;
  Transaction.Commit;
  Close;
  end;

  ProgressBar.Position := 90;
  ProgressBar.Update;

  DOLG_FINAL := CN_SNEED - CNUPLSUM;
  frxReport.Variables['DOLG_FINAL']:= ''''+ VarToStr(DOLG_FINAL) +'''';

  frxReport.Variables['CNDATEOPL_cap']:= ''''+  cnConsts.cn_PayPo_Pay[1]+'''';
  frxReport.Variables['CNDATEOPL']:= ''''+  datetostr(CNDATEOPL) +'''';

  frxReport.Variables['NAMEREP0']:= ''''+  cnConsts.fr_Reports_CALC_NameREP0[1]+'''';
  frxReport.Variables['NAMEREP']:= ''''+   cnConsts.fr_Reports_CALC_NameREP[1]+'''';
  frxReport.Variables['NAMEREP1']:= ''''+  cnConsts.fr_Reports_CALC_NameREP1[1]+'''';
  frxReport.Variables['NAMEREP2']:= ''''+  cnConsts.fr_Reports_CALC_NameREP2[1]+'''';
  frxReport.Variables['OBUCHAEMIY']:= ''''+ cnConsts.fr_Reports_CALC_NameStuder[1]+'''';

  frxReport.Variables['BEGDATE']:= ''''+   cnConsts.fr_Reports_CALC_Beg[1]+'''';
  frxReport.Variables['ENDDATE']:= ''''+   cnConsts.fr_Reports_CALC_End[1]+'''';

  frxReport.Variables['BEGDATE']:= ''''+   cnConsts.fr_Reports_CALC_Beg[1]+'''';
  frxReport.Variables['ENDDATE']:= ''''+   cnConsts.fr_Reports_CALC_End[1]+'''';
  frxReport.Variables['STOIMOTS']:= ''''+   cnConsts.fr_Reports_CALC_Stoimost[1]+'''';
  frxReport.Variables['SUMMA_LG']:= ''''+   cnConsts.fr_Reports_CALC_SummaLg[1]+'''';
  frxReport.Variables['PERCENT_LG']:= ''''+   cnConsts.fr_Reports_CALC_PersentLg[1]+'''';
  frxReport.Variables['BEG_DOLG']:= ''''+   cnConsts.fr_Reports_CALC_DolgBeg[1]+'''';

  frxReport.Variables['ALLPERIOD']:= ''''+ cnConsts.fr_Reports_CALC_AllPeriod[1]+'''';
  frxReport.Variables['SUMPAY']:= ''''+    cnConsts.fr_Reports_CALC_SumPay[1]+'''';
  frxReport.Variables['SUMDOLG']:= ''''+   cnConsts.fr_Reports_CALC_DolgEnd[1]+'''';

  frxReport.Variables['PAYCONF1']:= ''''+  cnConsts.fr_Reports_CALC_PayConf[1]+'''';
  frxReport.Variables['PAYCONF2']:= ''''+  cnConsts.fr_Reports_CALC_PayConf1[1]+'''';
  frxReport.Variables['BUHG']:= ''''+      cnConsts.fr_Reports_CALC_Buhg[1]+'''';
  frxReport.Variables['ORG']:= ''''+ORG+'''';
  frxReport.Variables['FIO']:= ''''+StringPrepareToQueryText(pFIBDataSet3.FieldByName('FIO').AsString)+'''';
  frxReport.Variables['NUMBER']:= ''''+numberDoc+'''';
  frxReport.Variables['SUMOPL']:=''''+VarToStr(0)+'''';
  frxReport.Variables['REC']:=''''+VarToStr(pFIBDataSet.RecordCount)+'''';

  frxReport.Variables['SP_VIDANA']:= ''''+cnConsts.fr_Reports_CALC_KydaVidana[1]+'''';
  frxReport.Variables['VSEGO']:= ''''+cnConsts.fr_Reports_CALC_All[1]+'''';
  frxReport.Variables['SUMMA_K_OPLATE']:= '''' + cnConsts.fr_Reports_SUMMA_K_OPLATE[1] + '''';
  frxReport.Variables['UGE_OPLACHENO']:=  '''' + cnConsts.fr_Reports_UGE_OPLACHENO[1] + '''';
  frxReport.Variables['SUMMA_DOLGA']:=    '''' + cnConsts.fr_Reports_SUMMA_DOLGA[1] + '''';
  frxReport.Variables['NUM_DOG']:='''' +  NUM_DOG +'''';

  pFIBDataSet.Last;
  frxReport.Variables['SUM_DOLG_FINAL']:= '''' +  VarToStr(pFIBDataSet['DOLG_KONEZ']) +'''';

  ProgressBar.Position := 100;
  Screen.Cursor := crDefault;

  frxReport.PrepareReport(true);
  frxReport.ShowReport;
  if designer_rep=1 then
    begin
      frxReport.DesignReport;
    end;
  pFIBDataSet.Close;
  pFIBDataSet3.Close;
  //удаление из Ѕƒ
  pFIBStoredProc.Database:=Database;
  pFIBStoredProc.Transaction:=WriteTransaction;
  WriteTransaction.StartTransaction;
  pFIBStoredProc.StoredProcName:='CN_TMP_PRINT_CN_CALC_DELETE';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
  try
    pFIBStoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
  WriteTransaction.Commit;
end;

procedure TfrmCalc.frxReportPrintReport(Sender: TObject);
var
  numberDoc:String;
begin
if count_print=0 then
  begin
    With pFIBStoredProc do
      begin
      try
      StoredProcName:='CN_DT_NUMBER_SPAV_UPDATE';
      Database:=Database;
      Transaction:=WriteTransaction;
      WriteTransaction.StartTransaction;
      Prepare;
      ExecProc;
      numberDoc:=FieldByName('NUMBER_SPRAV').AsString;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
    end;
    frxReport.Variables['NUMBER']:= ''''+'є'+numberDoc+'''';
    frxReport.PrepareReport;
    inc(count_print);
  end;
end;

end.
