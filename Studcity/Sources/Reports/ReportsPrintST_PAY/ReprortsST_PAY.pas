unit ReprortsST_PAY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, frxDesgn,StudcityConst, RxMemDS,IBase,
  FIBDatabase, pFIBDatabase, ActnList, frxExportXLS, frxExportHTML,
  frxExportRTF, frxExportPDF;

type
  TfrmST_PAY = class(TForm)
    pFIBStoredProc: TpFIBStoredProc;
    pFIBDataSet: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    pFIBDataSet3: TpFIBDataSet;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ActionList1: TActionList;
    Action1: TAction;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure frxReportPrintReport(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function ST_PAY(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports ST_PAY;

var
  frmST_PAY: TfrmST_PAY;
  count_print:Integer;
  id_people_pr:Int64;
  Design_rep:Integer;
implementation
{$R *.dfm}
function ST_PAY(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
var
  PrProp:TfrmST_PAY;
begin
  PrProp:=TfrmST_PAY.Create(AOwner,DB,id_people,type_doc_print);
//  PrProp.ShowModal;
  PrProp.Free;
end;

constructor  TfrmST_PAY.Create(Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  Database.Handle:=DBL;
  id_people_pr:=id_people;
end;

procedure TfrmST_PAY.FormCreate(Sender: TObject);
var
  numberDoc,ORG,OTD,OSN:String;
  Summa:Variant;
  Summa_Need:Variant;
  dateopl:TDateTime;
  i:Integer;
  p:TfrxReportPage;
  id_s,id_s1:Int64;
  OUT_MAIN_PEOPLE:String;
begin
    With pFIBStoredProc do
    begin
    try
    // --------------запуск процедуры st_pay------------------------------
    // расчет уже уплаченной суммы
    Database:=Database;
    Transaction:=WriteTransaction;
    StoredProcName := 'ST_PAY';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_DOG_STUD').AsInt64 := id_people_pr;
    ParamByName('DATE_PROV_CHECK').AsShort := 1;
    ParamByName('IS_DOC_GEN').AsShort := 1;
    ParamByName('IS_PROV_GEN').AsShort := 1;
    ParamByName('IS_SMET_GEN').AsShort := 1;
    ExecProc;
    Summa:=FieldByName('STUPLSUM').AsVariant;
    id_s:=FieldByName('ID_SESSION').AsInt64;
    except
        Transaction.Rollback;
        raise;
    end;
    end;
    With pFIBStoredProc do
    begin
    try
        StoredProcName := 'ST_CALC';
        WriteTransaction.StartTransaction;
        Prepare;
        ParamByName('ID_KOD').AsInt64 := id_people_pr;
        ParamByName('STUPLSUM').AsVariant := Summa;

        ExecProc;
        Transaction.Commit;
        dateopl:=FieldByName('STDATEOPL').AsDateTime;
        Summa_Need:=FieldByName('ST_SNEED').AsVariant;
        id_s1:=FieldByName('ID_SESSION').AsInt64;
        Close;

    except
    Transaction.Rollback;
    raise;
    end;
    end;

    with pFIBDataSet do
    begin
        Database:=Database;
        Transaction:=ReadTransaction;
        Active:=false;
        ParamByName('param_session').AsInt64:=id_s;
        Active:=true;
        FetchAll;
    end;
//получаем ФИО
    with pFIBDataSet3 do
    begin
        Database:=Database;
        Transaction:=ReadTransaction;
        Active:=false;
        SQLs.SelectSQL.Text:='SELECT fam_uk||'''+' '+'''||imya_uk||'''+' '+'''||ot_uk as FIO from st_dt_pfio where st_dt_pfio.id_kod='+VarToStr(id_people_pr);
        Active:=true;
    end;

//получаем номер справки, и реквизиты организации
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

//находим адресс и период проживания
    With pFIBStoredProc do
    begin
      try
      StoredProcName:='ST_DT_PRINT_ST_PAY_DOC';
      Database:=Database;
      Transaction:=WriteTransaction;
      WriteTransaction.StartTransaction;
      ParamByName('INPUT_ID_PEOPLE').AsInt64:=id_people_pr;
      Prepare;
      ExecProc;
      OSN:=pFIBDataSet3.FieldByName('FIO').AsString+' '+Studcity_ReportsST_PAY_OSN1;
      OSN:=OSN+' '+FieldByName('OUT_BUILDS').AsString+','+FieldByName('OUT_ROOMSTR').AsString;
      OSN:=OSN+' '+FieldByName('OUT_TOWN').AsString+','+Studcity_ReportsST_PAY_OSN3;
      OSN:=OSN+FieldByName('OUT_ADRESS').AsString+' '+Studcity_ReportsST_PAY_OSN4+FieldByName('OUT_HOUSE').AsString;
      OSN:=OSN+' '+Studcity_ReportsST_PAY_OSN5+' '+FieldByName('OUT_DATE_BEGIN').AsString;
      OSN:=OSN+' '+Studcity_ReportsST_PAY_OSN6+' '+FieldByName('OUT_DATE_END').AsString;
      OUT_MAIN_PEOPLE:=FieldByName('OUT_MAIN_PEOPLE').AsString;
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
    frxReport.Variables['REC']:=''''+VarToStr(pFIBDataSet.RecordCount)+'''';
    frxReport.Variables['ST_MAIN_PEOPLE']:=''''+VarToStr(OUT_MAIN_PEOPLE)+'''';
    frxReport.PrepareReport(true);
    frxReport.ShowReport(true);

    if Design_rep=1
    then frxReport.DesignReport;

with pFIBStoredProc do
  begin
    try
    Database:=Database;
    Transaction:=ReadTransaction;
    StoredProcName := 'ST_PAY_TMP_CLEAR';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_SESSION').AsInt64:=id_s;
    ExecProc;
    Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;
with pFIBStoredProc do
  begin
    try
    Database:=Database;
    Transaction:=ReadTransaction;
    StoredProcName := 'ST_CALC_TMP_CLEAR';
    Transaction.StartTransaction;
    Prepare;
    ParamByName('ID_SESSION').AsInt64:=id_s1;
    ExecProc;
    Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;
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
    frxReport.Variables['NUMBER']:= ''''+Studcity_ReportsST_PAY_SPRAV+' № '+numberDoc+'''';
    frxReport.PrepareReport;
    inc(count_print);
  end;
end;

procedure TfrmST_PAY.Action1Execute(Sender: TObject);
begin
if Design_rep=0 then
  begin
    Design_rep:=1;
    MessageBox(Handle,PChar('Вы перешли в режим отладки отчетов.'+#13+'Для отключения данного режима нажмите Ctrl+Shift+Alt+D.'),PChar('Внимание!!!'),MB_OK+MB_ICONWARNING);
  end
  else
  begin
    Design_rep:=0;
    MessageBox(Handle,PChar('Режим отладки отчетов отключен.'),PChar('Внимание!!!'),MB_OK+MB_ICONWARNING);
  end;
end;

end.
