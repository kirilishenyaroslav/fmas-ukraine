unit gr_PrintVedByMonth_DM;

interface

uses
  SysUtils, Classes, ibase, gr_uCommonLoader, Forms, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, frxClass, frxDBSet, frxDesgn,
  gr_uCommonConsts, gr_uCommonProc, gr_uMessage, Dialogs, gr_uWaitForm,
  Variants, Dates, frxExportXLS;

type
  TDM = class(TDataModule)
    Report: TfrxReport;
    DBDataset: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    DB: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    frxDesigner1: TfrxDesigner;
    DataSet1: TpFIBDataSet;
    DBDataset1: TfrxDBDataset;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    PKodSetup: integer;
  public
    procedure ReportCreate(AParameter:TgrAccListParam;KodSetup:integer);
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
const FullNameReport           = '\grPrintVedByMonth.fr3';

procedure TDM.ReportCreate(AParameter:TgrAccListParam;KodSetup:integer);
var wf:TForm;
begin
try
  PKodSetup:=KodSetup;
  DB.Handle:=AParameter.DB_handle;
  DataSet.SQLs.SelectSQL.Text:='SELECT * FROM GR_PRINT_VED_BY_MONTH('+IntToStr(KodSetup)+') ORDER BY DEP_NAME, FIO';
  DataSet1.SQLs.SelectSQL.Text:='SELECT FIRM_NAME_FULL FROM Z_SETUP';
  DataSet.Open;
  DataSet1.Open;
  Report.Clear;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+FullNameReport,True);

  if grDesignReport then Report.DesignReport
                    else Report.ShowReport;
  Report.Free;
except
  on E:Exception do
  begin
    grShowMessage(ECaption[Indexlanguage],e.Message,mtError,[mbOK]);
  end;
end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if Transaction.InTransaction then Transaction.Commit;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='DATEP' then
  begin
    Value:=KodSetupToPeriod(PKodSetup,2);
  end;
end;

end.
