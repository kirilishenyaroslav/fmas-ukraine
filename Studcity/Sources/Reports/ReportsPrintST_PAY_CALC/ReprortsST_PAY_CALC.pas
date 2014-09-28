unit ReprortsST_PAY_CALC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDesgn, FIBDatabase, pFIBDatabase,IBase,StudcityConst,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  frxDBSet, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, frxExportRTF, frxExportXLS, frxExportHTML,
  frxExportPDF, ComCtrls;

type
  TfrmReportsST_PAY_CALC = class(TForm)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    frxDesigner1: TfrxDesigner;
    cxButtonOK: TcxButton;
    cxButtonExit: TcxButton;
    cxDateEdit: TcxDateEdit;
    cxLabelDate: TcxLabel;
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
    StatusBar1: TStatusBar;
    frxReport: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonExitClick(Sender: TObject);
    procedure frxReportPrintReport(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function ST_PAY_CALC(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports ST_PAY_CALC;
var
  frmReportsST_PAY_CALC: TfrmReportsST_PAY_CALC;
  count_print:Integer;
  id_people_pr:int64;
  ID_TRANSACTION:Variant;
  designer_rep:Integer;
implementation

{$R *.dfm}
function ST_PAY_CALC(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
var
  PrProp:TfrmReportsST_PAY_CALC;
begin
  PrProp:=TfrmReportsST_PAY_CALC.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;

constructor  TfrmReportsST_PAY_CALC.Create(Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  Database.Handle:=DBL;
  id_people_pr:=id_people;
end;

procedure TfrmReportsST_PAY_CALC.FormCreate(Sender: TObject);
begin
  Caption:=StudcityConst.Studcity_ReportsST_CALC_NameForm;
  cxButtonOK.Caption:=StudcityConst.Studcity_ACTION_OK_CONST;
  cxButtonExit.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST;
  cxDateEdit.Date:=Date;
  cxLabelDate.Caption:=StudcityConst.Studcity_ReportsST_CALC_DATE;

  count_print:=0;
  designer_rep:=0;
end;

procedure TfrmReportsST_PAY_CALC.cxButtonExitClick(Sender: TObject);
begin
 Close;
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
    frxReport.Variables['NUMBER']:= ''''+'№'+numberDoc+'''';
    frxReport.PrepareReport;
    inc(count_print);
  end;
end;

procedure TfrmReportsST_PAY_CALC.cxButtonOKClick(Sender: TObject);
var
  numberDoc,ORG,OTD,FIO:String;
  i:Integer;
  dateopl:TDate;
  summa:Variant;
begin
    if (ID_TRANSACTION>0)
    then begin
        pFIBStoredProc.Database:=Database;
        pFIBStoredProc.Transaction:=WriteTransaction;
        WriteTransaction.StartTransaction;
        pFIBStoredProc.StoredProcName:='ST_TMP_PRINT_ST_CALC_DELETE';
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

  //получаем идентификатор транзакции
    pFIBStoredProc.Database:=Database;
    pFIBStoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_REPORTS_TRANSACTION';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_TRANSACTION').AsInt64:=ID_TRANSACTION;
    try
      pFIBStoredProc.ExecProc;
    except
      begin
        WriteTransaction.Rollback;
        Exit;
      end;
     end;

    ID_TRANSACTION:=pFIBStoredProc.FieldByName('ID_TRANSACTION').AsVariant;
    WriteTransaction.Commit;

   //отбор данных из базы
    pFIBStoredProc.Database:=Database;
    pFIBStoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_PRINT_ST_CALC';
    WriteTransaction.StartTransaction;
    pFIBStoredProc.Prepare;

    pFIBStoredProc.ParamByName('in_id_people').AsInt64:=id_people_pr;
    pFIBStoredProc.ParamByName('end_check').AsDate:=cxDateEdit.Date;
    pFIBStoredProc.ParamByName('ID_TRANSACTION').AsVariant:=ID_TRANSACTION;

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
        SQLs.SelectSQL.Text:='SELECT familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO from st_dt_pfio where st_dt_pfio.id_kod='+VarToStr(id_people_pr);
        Open;
        FIO:=FBN('FIO').AsString;
    end;

  With pFIBStoredProc do
    begin
    try
    StoredProcName:='ST_DTY_NUMBER_SPAV_SELECT';
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

    summa:=pFIBDataSet.FieldByName('summa_opl').AsVariant;
    dateopl:=pFIBDataSet.FieldByName('dateopl').AsDateTime;

    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeoplePay'+'.fr3');
    frxReport.Variables.Clear;
    frxReport.Variables['DATEOPL']:= ''''+DateToStr(dateopl)+'''';
    frxReport.Variables['DATEREP']:= ''''+DateToStr(cxDateEdit.Date)+'''';
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
    frxReport.Variables['FIO']:= ''''+FIO+'''';
    frxReport.Variables['NUMBER']:= ''''+'№'+numberDoc+'''';
    frxReport.Variables['SUMOPL']:=''''+VarToStr(0)+'''';
    frxReport.Variables['REC']:=''''+VarToStr(pFIBDataSet.RecordCount)+'''';
    frxReport.PrepareReport(true);
    frxReport.ShowReport;

    if designer_rep=1
    then frxReport.DesignReport;
    //удаление из БД
    pFIBStoredProc.Database:=Database;
    pFIBStoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_TMP_PRINT_ST_CALC_DELETE';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_TRANSACTION').AsInt64:=ID_TRANSACTION;
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

procedure TfrmReportsST_PAY_CALC.Action1Execute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    StatusBar1.Panels[0].Text:='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    StatusBar1.Panels[0].Text:='';
  end;
end;

end.
