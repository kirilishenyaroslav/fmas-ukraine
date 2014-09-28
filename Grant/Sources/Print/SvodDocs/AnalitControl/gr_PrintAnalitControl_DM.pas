unit gr_PrintAnalitControl_DM;

interface

uses
 SysUtils, Classes, ibase, gr_uCommonLoader, Forms, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, frxClass, frxDBSet, frxDesgn,
  gr_uCommonConsts, gr_uCommonProc, gr_uMessage, Dialogs, gr_uWaitForm,
  Variants, Dates, frxExportXLS;

type
  TDM = class(TDataModule)
    DBDataset: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    DB: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    frxDesigner1: TfrxDesigner;
    DataSet1: TpFIBDataSet;
    DBDataset1: TfrxDBDataset;
    DataSetS: TpFIBDataSet;
    DBDataSetS: TfrxDBDataset;
    Report: TfrxReport;
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
const FullNameReport           = '\grPrintAnalitControl.fr3';

procedure TDM.ReportCreate(AParameter:TgrAccListParam;KodSetup:integer);
var wf:TForm;
GroupHeader3: TfrxGroupHeader;
GroupHeader1: TfrxGroupHeader;
begin
try
  PKodSetup:=KodSetup;                                            //+IntToStr(KodSetup)+
  DB.Handle:=AParameter.DB_handle;
  DataSet.SQLs.SelectSQL.Text:='SELECT * FROM GR_ANALIT_CONTROL('+IntToStr(KodSetup)+') ORDER BY DEP_NAME, KURS, DEP_CHILD_NAME, FIO';
  DataSet1.SQLs.SelectSQL.Text:='SELECT SHORT_NAME FROM Z_SETUP';
  DataSetS.SQLs.SelectSQL.Text:='SELECT * From GR_ANALIT_CONTROL_FAC('+IntToStr(KodSetup)+')';
  DataSet.Open;
  DataSet1.Open;
  DataSetS.Open;
  Report.Clear;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+FullNameReport,True);
  GroupHeader1:=Report.FindObject('GroupHeader1') as TfrxGroupHeader;
  GroupHeader3:=Report.FindObject('GroupHeader3') as TfrxGroupHeader;
  if AParameter.AnalitControl=False then
  begin
  GroupHeader3.StartNewPage:=False;
  end
  else
  begin
  GroupHeader1.StartNewPage:=False;
  GroupHeader3.StartNewPage:=True;
  end;


  if grDesignReport then Report.DesignReport
                    else Report.ShowReport;
   // Report.DesignReport;
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
