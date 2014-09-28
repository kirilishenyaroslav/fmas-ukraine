unit ReprortsST_PAY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, frxDesgn,StudcityConst;

type
  TfrmST_PAY = class(TForm)
    pFIBStoredProc: TpFIBStoredProc;
    pFIBDataSet: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxReport: TfrxReport;
    pFIBDataSet3: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure frxReportPrintReport(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmST_PAY: TfrmST_PAY;
  count_print:Integer;
implementation
uses
  ViewDocPrint;
{$R *.dfm}

procedure TfrmST_PAY.FormCreate(Sender: TObject);
var
  numberDoc,ORG,OTD,OSN:String;
  Summa:Variant;
  Summa_Need:Variant;
  dateopl:TDateTime;
begin
  With pFIBStoredProc do
  begin
    try
    // ---чистка-----------------------------------
    Database:=TfrmViewDocPrint(self.owner).Database;
    Transaction:=TfrmViewDocPrint(self.owner).ReadTransaction;
    StoredProcName := 'ST_TOTAL_TEMP_ANNIGILATION';
    Transaction.StartTransaction;
    Prepare;
    ExecProc;
    Transaction.Commit;
    close;

    // --------------запуск процедуры st_pay------------------------------
    // расчет уже уплаченной суммы

    StoredProcName := 'ST_PAY';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_DOG_STUD').AsInt64 := TfrmViewDocPrint(self.owner).id_people_print;
    ParamByName('DATE_PROV_CHECK').AsShort := 1;
    ParamByName('IS_DOC_GEN').AsShort := 1;
    ParamByName('IS_PROV_GEN').AsShort := 1;
    ParamByName('IS_SMET_GEN').AsShort := 1;
    ExecProc;
    Summa:=FieldByName('STUPLSUM').AsVariant;
    except
      Transaction.Rollback;
      raise;
    end;
  end;
  With pFIBStoredProc do
    begin
    try
    StoredProcName := 'ST_CALC';
    TfrmViewDocPrint(self.owner).WriteTransaction.StartTransaction;
    Prepare;
    ParamByName('ID_KOD').AsInt64 := TfrmViewDocPrint(self.owner).id_people_print;
    ParamByName('STUPLSUM').AsVariant := Summa;

    ExecProc;
    Transaction.Commit;
    dateopl:=FieldByName('STDATEOPL').AsDateTime;
    Summa_Need:=FieldByName('ST_SNEED').AsVariant;
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
      Active:=true;
    end;
//получаем ФИО
  with pFIBDataSet3 do
    begin
      Database:=TfrmViewDocPrint(self.owner).Database;
      Transaction:=TfrmViewDocPrint(self.owner).ReadTransaction;
      Active:=false;
      SQLs.SelectSQL.Text:='SELECT familia||'''+' '+'''||imya||'''+' '+'''||otchestvo as FIO from st_dt_pfio where st_dt_pfio.id_kod='+VarToStr(TfrmViewDocPrint(self.owner).id_people_print);
      Active:=true;
    end;

//получаем номер справки, и реквизиты организации
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

//находим адресс и период проживания
  With pFIBStoredProc do
    begin
    try
    StoredProcName:='ST_DT_PRINT_ST_PAY_DOC';
    Database:=TfrmViewDocPrint(self.owner).Database;
    Transaction:=TfrmViewDocPrint(self.owner).WriteTransaction;
    TfrmViewDocPrint(self.owner).WriteTransaction.StartTransaction;
    ParamByName('INPUT_ID_PEOPLE').AsInt64:=TfrmViewDocPrint(self.owner).id_people_print;
    Prepare;
    ExecProc;
    OSN:=pFIBDataSet3.FieldByName('FIO').AsString+' '+Studcity_ReportsST_PAY_OSN1;
    OSN:=OSN+' '+FieldByName('OUT_BUILDS').AsString+','+FieldByName('OUT_ROOMSTR').AsString;
    OSN:=OSN+' '+Studcity_ReportsST_PAY_OSN2+FieldByName('OUT_TOWN').AsString+','+Studcity_ReportsST_PAY_OSN3;
    OSN:=OSN+FieldByName('OUT_ADRESS').AsString+' '+Studcity_ReportsST_PAY_OSN4+FieldByName('OUT_HOUSE').AsString;
    OSN:=OSN+' '+Studcity_ReportsST_PAY_OSN5+' '+FieldByName('OUT_DATE_BEGIN').AsString;
    OSN:=OSN+' '+Studcity_ReportsST_PAY_OSN6+' '+FieldByName('OUT_DATE_END').AsString;
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
  end;



  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleStPayDoc.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['NAMEREP0']:= ''''+StudcityConst.Studcity_ReportsST_CALC_NameREP0+'''';
  frxReport.Variables['DATEOPL']:= ''''+DateToStr(dateopl)+'''';
  frxReport.Variables['ALL_SUM_CAP']:= ''''+Studcity_ReportsST_PAY_OSN7+'''';
  frxReport.Variables['NUM']:= ''''+Studcity_ReportsST_PAY_CAP_N+'''';
  frxReport.Variables['DOC']:= ''''+Studcity_ReportsST_PAY_CAP_DOC+'''';
  frxReport.Variables['SUM']:= ''''+Studcity_ReportsST_PAY_CAP_SUM+'''';
  frxReport.Variables['OSN_DOC']:= ''''+Studcity_ReportsST_PAY_CAP_OSN+'''';
  frxReport.Variables['ITOGO']:= ''''+Studcity_ReportsST_PAY_ITOGO+'''';
  frxReport.Variables['ALL_SUM']:= ''''+Studcity_ReportsST_PAY_ALL+'''';
  frxReport.Variables['OPL_SUM']:= ''''+Studcity_ReportsST_PAY_OPLSUM+'''';
  frxReport.Variables['NEED_OPL']:= ''''+Studcity_ReportsST_PAY_NEEDOPLSUM+'''';
  frxReport.Variables['DOLG']:= ''''+Studcity_ReportsST_PAY_DOLG+'''';
  frxReport.Variables['OSN']:= ''''+OSN+'''';
  frxReport.Variables['BUHG']:= ''''+Studcity_ReportsST_PAY_Buhg+'''';
  frxReport.Variables['DIR']:= ''''+Studcity_ReportsST_PAY_DIR+'''';
  frxReport.Variables['ORG']:= ''''+ORG+'''';
  frxReport.Variables['OTGOTD']:= ''''+OTD+'''';
  frxReport.Variables['NUMBER']:= ''''+Studcity_ReportsST_PAY_SPRAV+' № '+numberDoc+'''';
  frxReport.Variables['REAL_NEED_OPL']:=''''+VarToStr(Summa_Need)+'''';
  frxReport.Variables['DOLG_OPL']:=''''+VarToStr(Summa_Need-summa)+'''';
  frxReport.Variables['GRN']:=''''+Studcity_ReportsST_PAY_GRN+'''';
  frxReport.Variables['PAYCONF1']:= ''''+StudcityConst.Studcity_ReportsST_CALC_PayConf+'''';
  frxReport.Variables['PAYCONF2']:= ''''+StudcityConst.Studcity_ReportsST_CALC_PayConf1+'''';
//  frxReport.DesignReport;
  frxReport.ShowReport(true);
end;

procedure TfrmST_PAY.frxReportPrintReport(Sender: TObject);
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
    frxReport.Variables['NUMBER']:= ''''+Studcity_ReportsST_PAY_SPRAV+' № '+numberDoc+'''';
    frxReport.PrepareReport;
    inc(count_print);
  end;
end;

end.
