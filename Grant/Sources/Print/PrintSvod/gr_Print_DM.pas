unit gr_Print_DM;

interface

uses
  SysUtils, Classes, ibase, gr_uCommonLoader, Forms, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, frxClass, frxDBSet, frxDesgn,
  gr_uCommonConsts, gr_uCommonProc, gr_uMessage, Dialogs, gr_uWaitForm,
  Variants, Dates, frxExportXLS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DBDataset: TfrxDBDataset;
    DataSet1: TpFIBDataSet;
    DBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    Report: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    PKodSetup: integer;
  public
    { Public declarations }
    procedure ReportCreate(AParameter:TgrAccListParam;KodSetup:integer);
  end;

implementation

{$R *.dfm}
const FullNameReport           = '\grPrint.fr3';

procedure TDM.ReportCreate(AParameter:TgrAccListParam;KodSetup:integer);
var wf:TForm;
begin
try
  PKodSetup:=KodSetup;
  DB.Handle:=AParameter.DB_handle;
  DataSet.SQLs.SelectSQL.Text:='SELECT * FROM GR_DT_GRANT_PRINT('+IntToStr(KodSetup)+')';
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
  if UpperCase(VarName)='FIRM' then
    Value:=grNameFirm(DB.Handle);

  if UpperCase(VarName)='TYPE' then
  begin
    if (DataSet['P1']='T')then
      Value:='Нарахування:'
    else
      if(DataSet['P1']='F')then
        Value:='Утримання:'
      else
        Value:='До сплати:';

  end;

  if UpperCase(VarName)='FSUMMA' then
  begin
    Value:=DataSet['SUMMA']
  end;

  if UpperCase(VarName)='NSUMMA' then
  begin
    if (DataSet['P1']='T') then
      Value:=DataSet['SUMMA']
    else
      Value:=null;
  end;

  if UpperCase(VarName)='USUMMA' then
  begin
    if (DataSet['P1']='F') then
      Value:=DataSet['SUMMA']
    else
      Value:=null;
  end;

  if UpperCase(VarName)='SUMMA' then
  begin
    if (DataSet['P1']=null) then
      Value:=DataSet['SUMMA']
    else
      Value:=0;
  end;

  if UpperCase(VarName)='DATEP' then
  begin
    Value:=KodSetupToPeriod(PKodSetup,2);
  end;

end;

end.
