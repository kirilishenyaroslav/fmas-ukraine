unit Ree_Hosp_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit, Unit_ZGlobal_Consts,
  frxExportRTF, frxExportXLS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    Report: TfrxReport;
    DSetGroups: TpFIBDataSet;
    ReportsDSetGroups: TfrxDBDataset;
    DSetGroupsDep: TpFIBDataSet;
    ReportsDSetGroupsDep: TfrxDBDataset;
    frxXLSExport: TfrxXLSExport;
    frxRTFExport: TfrxRTFExport;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    function PrintSpr(AParameter:TReeHospParam):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'Ree_Hosp';
const NameReportTn             = 'Reports\Zarplata\Ree_Hosp_ByTn.fr3';
const NameReportDep            = 'Reports\Zarplata\Ree_Hosp_ByDep.fr3';

function TDM.PrintSpr(AParameter:TReeHospParam):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
begin
 Screen.Cursor:=crHourGlass;

 case AParameter.TypeReeHosp of
  trhByTn:
   DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_HOSP_PRINT('+
                                 IntToStr(AParameter.SvodParam.Kod_setup)+') order by doplata,tn,fio';
  trhByDepartment:
   DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_HOSP_PRINT('+
                                 IntToStr(AParameter.SvodParam.Kod_setup)+') order by doplata,NAME_DEPATMENT,tn,fio';
 end;
 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT SHORT_NAME FROM Z_SETUP';
 DSetGroups.SQLs.SelectSQL.Text := 'SELECT * FROM Z_HOSP_GROUP_VIDOPL('+IntToStr(AParameter.SvodParam.Kod_setup)+') order by Kod_Vidopl';
 try
  DB.Handle:=AParameter.SvodParam.DB_Handle;

  DSetData.Open;
  DSetGlobalData.Open;
  DSetGroups.Open;
  if AParameter.TypeReeHosp=trhByDepartment then
   begin
    DSetGroupsDep.SQLs.SelectSQL.Text := 'SELECT * FROM Z_HOSP_GROUP_DEPARTMENT('+IntToStr(AParameter.SvodParam.Kod_setup)+') order by dept_order';
    DSetGroupsDep.Open;
   end;
 except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=ifThen(AParameter.TypeReeHosp=trhByTn,
                               IniFile.ReadString(SectionOfIniFile,'NameReportTn',NameReportTn),
                               IniFile.ReadString(SectionOfIniFile,'NameReportDep',NameReportDep));

 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category',
                              'PPeriod',
                               ''''+KodSetupToPeriod(AParameter.SvodParam.Kod_setup,4)+'''');

 Screen.Cursor:=crDefault;
 if zDesignReport
   then Report.DesignReport
   else Report.ShowReport;
 Report.Free;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.

