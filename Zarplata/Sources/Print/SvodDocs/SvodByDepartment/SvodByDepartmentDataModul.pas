unit SvodByDepartmentDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, FR_E_TXT, FR_E_RTF,
  frRtfExp, frXMLExl, FR_Class, frOLEExl, frxExportHTML, frxExportRTF,
  frxExportXML, frxExportXLS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetDep: TpFIBDataSet;
    ReportDBDSetDep: TfrxDBDataset;
    DSourceDep: TDataSource;
    WriteTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    Report: TfrxReport;
    DSetAllData: TpFIBDataSet;
    frxDBDSetAllData: TfrxDBDataset;
    DSetCategoryGroup: TpFIBDataSet;
    frxDBDSetCategoryGroup: TfrxDBDataset;
    DSetUd: TpFIBDataSet;
    frxDBDSetUd: TfrxDBDataset;
    DSetNotPodNal: TpFIBDataSet;
    frxDBDSetNotPodNal: TfrxDBDataset;
    frxUserDataSet: TfrxUserDataSet;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    function PrintSpr(AParameter:TSvodByDepartmentParam):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodByDepartment';
const NameReport               = 'Reports\Zarplata\SvodByDepartment.fr3';

function TDM.PrintSpr(AParameter:TSvodByDepartmentParam):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SumBalans:extended;
begin
 Screen.Cursor:=crHourGlass;

 ShowMessage('ID_SESSION='+IntToStr(AParameter.SvodParam.ID_Session)+#13+
             'KOD_SETUP='+IntToStr(AParameter.SvodParam.Kod_setup)+#13+
             'ID_DEPARTMENT='+IntToStr(AParameter.Id_Department));

 DSetDep.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYDEP_DEP('+IntToStr(AParameter.Id_Department)+','+
                                 IntToStr(AParameter.SvodParam.Kod_setup)+','+
                                 IntToStr(AParameter.SvodParam.ID_Session)+')';

 DSetAllData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYDEP_DATA('+IntToStr(AParameter.Id_Department)+','+
                                  IntToStr(AParameter.SvodParam.ID_Session)+') ORDER BY NAME_VOPL_GROUP DESCENDING, KOD_VIDOPL';

 DSetCategoryGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYDEP_CATEGORY_GROUP('+IntToStr(AParameter.Id_Department)+','+
                                          IntToStr(AParameter.SvodParam.ID_Session)+') ORDER BY NAME_CATEGORY';

 DSetUd.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYDEP_UD('+IntToStr(AParameter.Id_Department)+','+IntToStr(AParameter.SvodParam.ID_Session)+') ORDER BY KOD_VO';

 DSetNotPodNal.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYDEP_NOTPODNAL('+IntToStr(AParameter.Id_Department)+','+
                                   IntToStr(AParameter.SvodParam.ID_Session)+') ORDER BY KOD_VIDOPL';

 try
  DB.Handle:=AParameter.SvodParam.DB_Handle;

  DSetDep.Open;
  DSetAllData.Open;
  DSetCategoryGroup.Open;
  DSetUd.Open;
  DSetNotPodNal.Open;

 except
   on E:Exception do
    begin
     ZShowMessage('',e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
     Exit;
    end;
 end;

 SumBalans:=IfThen(VarIsNull(DSetDep['SUM_ALL']),0,DSetDep['SUM_ALL'])-
            IfThen(VarIsNull(DSetDep['SUM_UD']),0,DSetDep['SUM_UD'])+
            IfThen(VarIsNull(DSetDep['SUM_DOLG']),0,DSetDep['SUM_DOLG'])-
            IfThen(VarIsNull(DSetDep['SUM_VIPL']),0,DSetDep['SUM_VIPL']);

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);

 PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);

 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category',
                              'PSumBoln',
                               RoundTo(IfThen(VarIsNull(DSetDep['SUM_BOLN']),0,DSetDep['SUM_BOLN']),-2));
 Report.Variables.AddVariable('User Category',
                              'PSumVidrax',
                               RoundTo(
                                  0.32*IfThen(VarIsNull(DSetDep['FOND_PENS']),0,DSetDep['FOND_PENS'])+
                                  0.0677*IfThen(VarIsNull(DSetDep['FOND_SOC']),0,DSetDep['FOND_SOC']),-2));
 Report.Variables.AddVariable('User Category',
                              'PSumBalans',
                               RoundTo(SumBalans,-2));
 Report.Variables.AddVariable('User Category',
                              'PPeriod',
                               ''''+LowerCase(KodSetupToPeriod(AParameter.SvodParam.Kod_setup,4))+'''');

 Screen.Cursor:=crDefault;

 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;

 Report.Free;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
