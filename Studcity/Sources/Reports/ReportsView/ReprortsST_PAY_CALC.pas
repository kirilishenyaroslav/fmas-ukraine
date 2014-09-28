unit ReprortsST_PAY_CALC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StudcityConst, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeelPainters, StdCtrls, cxButtons, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, frxClass, frxDBSet,
  FIBDatabase, pFIBDatabase;

type
  TfrmReportsST_PAY_CALC = class(TForm)
    cxDateEdit: TcxDateEdit;
    cxLabelDate: TcxLabel;
    cxButtonOK: TcxButton;
    cxButtonExit: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    pFIBDataSet2: TpFIBDataSet;
    frxDBDataset2: TfrxDBDataset;
    pFIBDataSet3: TpFIBDataSet;
    frxReport: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonExitClick(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
    procedure frxReportPrintReport(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportsST_PAY_CALC: TfrmReportsST_PAY_CALC;
  count_print:Integer;
implementation
uses
  ViewDocPrint;
{$R *.dfm}

procedure TfrmReportsST_PAY_CALC.FormCreate(Sender: TObject);
begin
  Caption:=StudcityConst.Studcity_ReportsST_CALC_NameForm;
  cxButtonOK.Caption:=StudcityConst.Studcity_ACTION_OK_CONST;
  cxButtonExit.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST;
  cxDateEdit.Date:=Date;
  cxLabelDate.Caption:=StudcityConst.Studcity_ReportsST_CALC_DATE;

  count_print:=0;
end;

procedure TfrmReportsST_PAY_CALC.cxButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReportsST_PAY_CALC.cxButtonOKClick(Sender: TObject);
var
  dateopl:TDateTime;
  numberDoc,ORG,OTD:String;
  Summa:Variant;
begin
  with pFIBStoredProc do
    begin
      try
      StoredProcName:='ST_PAY';
      Database:=TfrmViewDocPrint(self.owner).Database;
      Transaction:=TfrmViewDocPrint(self.owner).WriteTransaction;
      TfrmViewDocPrint(self.owner).WriteTransaction.StartTransaction;
      Prepare;
      ParamByName('ID_DOG_STUD').AsInt64 := TfrmViewDocPrint(self.owner).id_people_print;
//      ParamByName('BEG_CHECK').AsDate :=
      ParamByName('END_CHECK').AsDate :=cxDateEdit.Date;
      ParamByName('DATE_PROV_CHECK').AsInteger:=1;
      ParamByName('DIGNORDOCID').AsInteger:=-1;
      ExecProc;
      Summa:=FieldByName('STUPLSUM').AsVariant;
      Transaction.Commit;
      close;
      except
        Transaction.Rollback;
        raise;
      end;

    end;

  With pFIBStoredProc do
    begin
    try
    StoredProcName:='ST_TMP_CLEAR';
    Database:=TfrmViewDocPrint(self.owner).Database;
    Transaction:=TfrmViewDocPrint(self.owner).WriteTransaction;
    TfrmViewDocPrint(self.owner).WriteTransaction.StartTransaction;
    Prepare;
    ExecProc;
    Transaction.Commit;
    close;

    StoredProcName := 'ST_CALC';
    TfrmViewDocPrint(self.owner).WriteTransaction.StartTransaction;
    Prepare;
    ParamByName('ID_KOD').AsInt64 := TfrmViewDocPrint(self.owner).id_people_print;
    ParamByName('STUPLSUM').AsVariant := Summa;

    ExecProc;
    Transaction.Commit;
    dateopl:=FieldByName('STDATEOPL').AsDateTime;
    Close;

  except
    Transaction.Rollback;
    raise;
  end;
  end;

  with pFIBDataSet do
    begin
      Database:=TfrmViewDocPrint(self.owner).Database;
      Transaction:=TfrmViewDocPrint(self.owner).ReadTransaction;
      Active:=false;
      SQLs.SelectSQL.Text:='SELECT ST_.ID_KATEGORIYA,ST_.TYPE_KAT,ST_.BEG_DATE,ST_.END_DATE,ST_.PAY_SUM,ST_."PERCENT",ST_.SUM_SUBS,ST_.SUMMA,ST_.SUM_KAT,ST_.CNT_MONTH,ST_.NOT_LIVE,ST_.SUB_MAX FROM ST_TMP_TN_CALC_SELECT ST_';
      Active:=true;
    end;  

  with pFIBDataSet3 do
    begin
      Database:=TfrmViewDocPrint(self.owner).Database;
      Transaction:=TfrmViewDocPrint(self.owner).ReadTransaction;
      Active:=false;
      SQLs.SelectSQL.Text:='SELECT familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO from st_dt_pfio where st_dt_pfio.id_kod='+VarToStr(TfrmViewDocPrint(self.owner).id_people_print);
      Active:=true;
    end;

  With pFIBStoredProc do
    begin
    try
    StoredProcName:='ST_DTY_NUMBER_SPAV_SELECT';
    Database:=TfrmViewDocPrint(self.owner).Database;
    Transaction:=TfrmViewDocPrint(self.owner).WriteTransaction;
    TfrmViewDocPrint(self.owner).WriteTransaction.StartTransaction;
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

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeoplePay'+'.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['DATEOPL']:= ''''+DateToStr(dateopl)+'''';
  frxReport.Variables['NAMEREP0']:= ''''+StudcityConst.Studcity_ReportsST_CALC_NameREP0+'''';
  frxReport.Variables['NAMEREP']:= ''''+StudcityConst.Studcity_ReportsST_CALC_NameREP+'''';
  frxReport.Variables['NAMEREP1']:= ''''+StudcityConst.Studcity_ReportsST_CALC_NameREP1+'''';
  frxReport.Variables['NAMEREP2']:= ''''+StudcityConst.Studcity_ReportsST_CALC_NameREP2+'''';
  frxReport.Variables['BEGDATE']:= ''''+StudcityConst.Studcity_ReportsST_CALC_Beg+'''';
  frxReport.Variables['ENDDATE']:= ''''+StudcityConst.Studcity_ReportsST_CALC_End+'''';
  frxReport.Variables['SUMMONTH']:= ''''+StudcityConst.Studcity_ReportsST_CALC_SumMonth+'''';
  frxReport.Variables['PERSENT']:= ''''+StudcityConst.Studcity_ReportsST_CALC_Persent+'''';
  frxReport.Variables['SUMSUB']:= ''''+StudcityConst.Studcity_ReportsST_CALC_Sum_Sub+'''';
  frxReport.Variables['CNTMONTH']:= ''''+StudcityConst.Studcity_ReportsST_CALC_CNTMonth+'''';
  frxReport.Variables['ALLPERIOD']:= ''''+StudcityConst.Studcity_ReportsST_CALC_AllPeriod+'''';
  frxReport.Variables['SUMPAY']:= ''''+StudcityConst.Studcity_ReportsST_CALC_SumPay+'''';
  frxReport.Variables['SUMDOLG']:= ''''+StudcityConst.Studcity_ReportsST_CALC_SumDolg+'''';
  frxReport.Variables['ALL']:= ''''+StudcityConst.Studcity_ReportsST_CALC_All+'''';
  frxReport.Variables['PAYCONF1']:= ''''+StudcityConst.Studcity_ReportsST_CALC_PayConf+'''';
  frxReport.Variables['PAYCONF2']:= ''''+StudcityConst.Studcity_ReportsST_CALC_PayConf1+'''';
  frxReport.Variables['BUHG']:= ''''+StudcityConst.Studcity_ReportsST_CALC_Buhg+'''';
  frxReport.Variables['ORG']:= ''''+ORG+'''';
  frxReport.Variables['OTGOTD']:= ''''+OTD+'''';
  frxReport.Variables['FIO']:= ''''+pFIBDataSet3.FieldByName('FIO').AsString+'''';
  frxReport.Variables['NUMBER']:= ''''+'¹'+numberDoc+'''';
  frxReport.Variables['SUMOPL']:=''''+VarToStr(summa)+'''';
  frxReport.ShowReport;

end;

procedure TfrmReportsST_PAY_CALC.frxReportPrintReport(Sender: TObject);
var
  numberDoc:String;
begin
if count_print=0 then
  begin
    With pFIBStoredProc do
      begin
      try
      StoredProcName:='ST_DTY_NUMBER_SPAV_UPDATE';
      Database:=TfrmViewDocPrint(self.owner).Database;
      Transaction:=TfrmViewDocPrint(self.owner).WriteTransaction;
      TfrmViewDocPrint(self.owner).WriteTransaction.StartTransaction;
      Prepare;
      ExecProc;
      numberDoc:=FieldByName('NUMBER_SPRAV').AsString;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
    end;
    frxReport.Variables['NUMBER']:= ''''+'¹'+numberDoc+'''';
    frxReport.PrepareReport;
    inc(count_print);
  end;
end;

end.
