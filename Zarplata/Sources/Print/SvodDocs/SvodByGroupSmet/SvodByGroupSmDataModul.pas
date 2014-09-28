unit SvodByGroupSmDataModul;

interface

uses
  SysUtils, Classes, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDocs_Consts,
  frxExportXLS, DB;

type
  TSvodByGroupSm_DM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetCategoryGroup: TpFIBDataSet;
    ReportDSetCategoryGroup: TfrxDBDataset;
    Designer: TfrxDesigner;
    DSetFoundationData: TpFIBDataSet;
    ReportDBDSetFoundationData: TfrxDBDataset;
    Report: TfrxReport;
    DSetPropPaymGroup: TpFIBDataSet;
    ReportDsetPropPaymGroup: TfrxDBDataset;
    DSourceFoundationData: TDataSource;
    DSetUDGroup: TpFIBDataSet;
    ReportDSetUDGroup: TfrxDBDataset;
    DSetNotPodNalGroup: TpFIBDataSet;
    ReportDSetNotPodNalGroup: TfrxDBDataset;
    DsetGrSheet: TpFIBDataSet;
    ReportDsetGrSheet: TfrxDBDataset;
    DsetDolg: TpFIBDataSet;
    ReportDsetDolg: TfrxDBDataset;
    ReportUserDSet: TfrxUserDataSet;
    frxXLSExport1: TfrxXLSExport;
    DSetShifr: TpFIBDataSet;
    ReportDSetShifr: TfrxDBDataset;
    ReportDSetIput: TfrxDBDataset;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
    PKod_Setup:Integer;
  public
    procedure PrintSpr(AParameter:TSvodParam; ResDateSet:TDataSet);
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodByGroupSm';
const NameReport               = 'Reports\Zarplata\SvodByGroupSm.fr3';
const NameReport1               = 'Reports\Zarplata\SvodByGroupSm1.fr3';

procedure TSvodByGroupSm_DM.PrintSpr(AParameter:TSvodParam;ResDateSet:TDataSet);
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SummaAllDed:Extended;
    SummaGr:Extended;
    SummaAll:Extended;
    SummaDolg:Extended;
    DateForm:tdate;
    i:byte;
    DataSource:TDataSource;
begin
 DateForm:=ConvertKodToDate(AParameter.Kod_setup);
 PKod_Setup:=AParameter.Kod_setup;
 DataSource:=TDataSource.create(self);
 DataSource.DataSet:=ResDateSet;
 ReportDSetIput.DataSet:= ResDateSet;
 ResDateSet.First;
 DSetFoundationData.DataSource:=DataSource;

 DSetFoundationData.SQLs.SelectSQL.Text :=     'SELECT * FROM Z_SVODBYGROUPSM_SMETA1(:ID_GROUP'+','''+
                                                                                    DateToStr(DateForm)+''','+
                                                                                     IntToStr(AParameter.ID_Session)+')';
   DSetCategoryGroup.SQLs.SelectSQL.Text :=      'SELECT * FROM Z_SVODBYGROUPSM_CATEGORY_GROUP1(?id_sm_group,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''')';
   DSetPropPaymGroup.SQLs.SelectSQL.Text :=      'SELECT * FROM Z_SVODBYGROUPSM_PROPPAYM_GROUP1(?id_sm_group,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''')';
   DSetUDGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_UD1(?id_sm_group,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''') order by KOD_VO';
   DSetNotPodNalGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_NOTPODNAL1(?id_sm_group,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''')';
   DsetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_GRSHEET1 (?id_sm_group,'+IntToStr(AParameter.Kod_setup)+')';
   DsetDolg.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_DOLG1(?id_sm_group,'+IntToStr(AParameter.Kod_setup)+')';
   DSetShifr.SQLs.SelectSQL.Text :=  'SELECT * FROM Z_SVODBYGROUPSM_UD_SHIFR1(?id_sm_group,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''')';


 {DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_SMETA(:ID_PKV,:ID_TYPE_FINANCE'+','''+
                                                                                  DateToStr(DateForm)+''','+
                                                                                  IntToStr(AParameter.ID_Session)+')';
 DSetCategoryGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_CATEGORY_GROUP(?ID_PKV,?ID_TYPE_FINANCE,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''')';
 DSetPropPaymGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_PROPPAYM_GROUP(?ID_PKV,?ID_TYPE_FINANCE,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''')';
 DSetUDGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_UD(?ID_PKV,?ID_TYPE_FINANCE,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''') order by KOD_VO';
 DSetNotPodNalGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_NOTPODNAL(?ID_PKV,?ID_TYPE_FINANCE,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''')';
 DsetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_GRSHEET (?ID_PKV,?ID_TYPE_FINANCE,'+IntToStr(AParameter.Kod_setup)+')';
 DsetDolg.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYGROUPSM_DOLG(?ID_PKV,?ID_TYPE_FINANCE,'+IntToStr(AParameter.Kod_setup)+')';
 DSetShifr.SQLs.SelectSQL.Text :=  'SELECT * FROM Z_SVODBYGROUPSM_UD_SHIFR(?ID_PKV,?ID_TYPE_FINANCE,'+IntToStr(AParameter.ID_Session)+','''+DateToStr(DateForm)+''')';}

 try
  DB.Handle:=AParameter.DB_Handle;
  ReadTransaction.starttransaction;
  DSetFoundationData.Open;
  //DSetFoundationData.DoSort(['ID_PKV','ID_TYPE_FINANCE'],[true,true]);
  DSetCategoryGroup.Open;
  DSetPropPaymGroup.Open;
  DSetUDGroup.Open;
  DSetNotPodNalGroup.Open;
  DsetGrSheet.Open;
  DsetDolg.Open;
  DSetShifr.Open;
 except
   on E:Exception do
    begin
     ReadTransaction.Rollback;
     ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport1',NameReport1);
 //else
   //PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport1);

 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;

 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;

 Report.Free;
end;

procedure TSvodByGroupSm_DM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PKOD_SETUP' then
  Value:=KodSetupToPeriod(PKod_Setup,4);
end;

procedure TSvodByGroupSm_DM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
