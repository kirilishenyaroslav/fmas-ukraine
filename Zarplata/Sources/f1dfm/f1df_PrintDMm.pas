unit f1df_PrintDMm;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxDesgn, Dialogs, Forms,
  iBase, zProc, Unit_zGlobal_Consts, zMessages, zWait,
  f1df_CtrlCntWorkersm, frxExportHTML, frxExportRTF, frxExportXLS;

type
  TPrintDM = class(TDataModule)
    frxDesigner: TfrxDesigner;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    frxDSet: TfrxDBDataset;
    DSetGlobal: TpFIBDataSet;
    frxDSetGlobal: TfrxDBDataset;
    frxXLSExport: TfrxXLSExport;
    frxRTFExport: TfrxRTFExport;
    frxHTMLExport: TfrxHTMLExport;
    DSetWinning: TpFIBDataSet;
    frxDBSetWinning: TfrxDBDataset;
    frxReport: TfrxReport;
    procedure frxReportGetValue(const VarName: String; var Value: Variant);
  private
    PLanguageIndex:byte;
    Cnt_Shtat   :integer;
    Cnt_Sovmest :integer;
    FYEAR        :Word;
    FMONTH       :Word;
    FDAY         :Word;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    procedure PrintReport(DB_Handle:TISC_DB_HANDLE;ID_1Df:Integer);
  end;

procedure CreateReport(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;ID_1Df:Integer);

implementation
{$R *.dfm}

const NameReport = '\Reports\Zarplata\f_1df.fr3';
const NameReportCor = '\Reports\Zarplata\f_1df.fr3';

procedure CreateReport(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;ID_1Df:Integer);
var PrintDM:TPrintDM;
begin
  PrintDM := TPrintDM.Create(AOwner);
  PrintDM.PrintReport(DB_Handle,ID_1Df);
  PrintDM.Destroy;
end;

constructor TPrintDM.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 PLanguageIndex := LanguageIndex;
 DecodeDate(Date, FYear, FMonth, FDay);
end;

procedure TPrintDM.PrintReport(DB_Handle:TISC_DB_HANDLE;ID_1Df:Integer);
var wf:TForm;
begin
try
 wf := ShowWaitForm(Application.MainForm);

 try
  DB.Handle := DB_Handle;
  DSetGlobal.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_PRINT_GLOBALDATA('+IntToStr(ID_1Df)+')';
  DSetGlobal.Open;
  Cnt_Shtat := DSetGlobal['CNT_SHTAT'];
  Cnt_Sovmest := DSetGlobal['CNT_SOVMEST'];

  DSetWinning.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_PRINT_WINNING';
  DSetWinning.Open;

  EditCntWorkers(Self.Owner,Cnt_Shtat,Cnt_Sovmest);
  DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S('+IntToStr(ID_1Df)+') order by tin_pasport,kod_1df';
  DSet.Open;
  frxReport.Clear;
  if DSetGlobal['ID_TYPE']=2 then frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportCor,True)
                             else frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
  frxReport.Variables.Clear;

  if zDesignReport then frxReport.DesignReport
                   else frxReport.ShowReport;
 except
  on E:exception do
   begin
    DefaultTransaction.Rollback;
    ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
   end;
 end;
finally
  CloseWaitForm(wf);
end;
end;

procedure TPrintDM.frxReportGetValue(const VarName: String;
  var Value: Variant);
begin
if AnsiUpperCase(VarName)='CNT_SHTAT' then
   Value:=cnt_shtat;

if AnsiUpperCase(VarName)='CNT_SOVMEST' then
   Value:=cnt_sovmest;

if AnsiUpperCase(VarName)='P_IS_ADD' then
   Value:=ifThen(DSet['IS_ADD']='T',0,1);

if AnsiUpperCase(VarName)='FYEAR' then
   Value:=FYEAR;

if AnsiUpperCase(VarName)='FMON' then
begin
  Value:=FMONTH;
  if FMONTH<10 then Value:='0'+IntToStr(FMONTH);
end;


if AnsiUpperCase(VarName)='FDAY' then
begin
  Value:=FMONTH;
  if FDAY<10 then Value:='0'+IntToStr(FDAY);
end;

end;

end.
