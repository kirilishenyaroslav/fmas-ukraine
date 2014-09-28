unit SvodOtchisl_PrintDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery, ZWait,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDocs_Consts,
  frxExportXLS, frxExportRTF;

Type TAllParams = record
  FoundationParam : TSvodParam;
  Id_Sch : Integer;
end;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetReestr: TpFIBDataSet;
    ReportDSetReestr: TfrxDBDataset;
    Designer: TfrxDesigner;
    DSetFoundationData: TpFIBDataSet;
    ReportDBDSetFoundationData: TfrxDBDataset;
    DSetSvod: TpFIBDataSet;
    ReportDSetSvod: TfrxDBDataset;
    DSourceFoundationData: TDataSource;
    ReportUserDSet: TfrxUserDataSet;
    ReportDSetPFU: TfrxDBDataset;
    DSetPFU: TpFIBDataSet;
    ReportDSetFSS: TfrxDBDataset;
    DSetFSS: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    DSetKops: TpFIBDataSet;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    function PrintSpr(AParameter:TSvodParam):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodOtchisl';
const NameReport               = 'Reports\Zarplata\SvodOtchisl.fr3';

function TDM.PrintSpr(AParameter:TSvodParam):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    Kops:double;
    Wf:TForm;
    sAllPens,sAll:Extended;
begin
 wf := ShowWaitForm(Application.MainForm);

 DSetReestr.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REESTR_OTCHISL_DODAT23('+IntToStr(AParameter.Kod_setup)+')';
 DSetSvod.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVOD_OTCHISLEN('+IntToStr(AParameter.Kod_setup)+')';
// DSetPFU.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVOD_OTCHISL_SUMS('+IntToStr(AParameter.Kod_setup)+',1)';
// DSetFSS.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVOD_OTCHISL_SUMS('+IntToStr(AParameter.Kod_setup)+',2)';
 DSetKops.SQLs.SelectSQL.Text := 'SELECT * FROM Z_DFSS_NA_VB_KOPS_S('+IntToStr(AParameter.Kod_setup)+')';

 try
  DB.Handle:=AParameter.DB_Handle;

  DSetReestr.Open;
  DSetSvod.Open;
//  DSetPFU.Open;
//  DSetFSS.Open;
  DSetKops.Open;

  if not(VarIsNull(DSetKops['KOPS'])) then Kops:=DSetKops['KOPS']
  else
   begin
    Randomize;
    kops:=RandomRange(0,99)/100;
    try
     StProc.Transaction.StartTransaction;
     StProc.StoredProcName:='Z_DFSS_NA_VB_KOPS_I';
     StProc.Prepare;
     StProc.ParamByName('KOD_SETUP').AsInteger := AParameter.Kod_setup;
     StProc.ParamByName('KOPS').AsDouble := Kops;
     StProc.ExecProc;
     StProc.Transaction.Commit;
    except
     on E:Exception do
      begin
       ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
       StProc.Transaction.Rollback;
       Exit;
      end;
     end;
   end;

 except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
     ReadTransaction.Rollback;
     Exit;
    end;
 end;

 sAllPens:=0;
 DSetReestr.First;
 while not DSetReestr.Eof do
  begin
   sAllPens:=sAllPens+DSetReestr['SUM_PROC_PENS']+DSetReestr['SUM_PROC_INV'];
   DSetReestr.Next;
  end;

 DSetSvod.First;
 sAll:=sAllPens+DSetSvod['DIFF_PROF_PROC']+DSetSvod['DIFF_SOC_PROC']+
                DSetSvod['DIFF_ZAN_PROC']+DSetSvod['DIFF_NSLUCH_PROC'];

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);
 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;

 Report.Variables.AddVariable('User Category',
                              'sAllSumPens',
                               zRoundTo(sAllPens,-2));
 Report.Variables.AddVariable('User Category',
                              'sAll',
                               zRoundTo(sAll,-2));
 Report.Variables.AddVariable('User Category',
                              'CURRENT_KS',
                               ''''+KodSetupToPeriod(AParameter.Kod_setup,0)+'''');
 Report.Variables.AddVariable('User Category',
                              'sDFSSonVB',
                               zRoundTo(DSetSvod['FOND_FSSS_NA_VP']*200+Kops,-2));

 CloseWaitForm(Wf);

 if zDesignReport
    then Report.DesignReport
    else Report.ShowReport;

{ case ViewMode of
   1: Report.ShowReport;
   2: Report.DesignReport;
  end;}
 Report.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PKOD_SETUP' then
  Value:=KodSetupToPeriod(DSetReestr['KOD_SETUP3'],0);
if UpperCase(VarName)='P_PFU_SUM' then
 begin
  if DSetPFU.RecNo=DSetPFU.RecordCount then
    Value:=DSetPFU['SUMMA']-DSetSvod['NSUM_PENS']
  else
    Value:=DSetPFU['SUMMA'];
 end;
if UpperCase(VarName)='P_FSS_SUM' then
 begin
  if DSetFSS.RecNo=DSetFSS.RecordCount then
    Value:=DSetFSS['SUMMA']-DSetSvod['NSUM_SOC']
  else
    Value:=DSetFSS['SUMMA'];
 end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
