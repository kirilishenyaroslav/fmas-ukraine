unit SvodBySmDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDocs_Consts,
  RxMemDS;

type
  TDM = class(TDataModule)
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
    DataSourceInput: TDataSource;
    frxDBDatasetInput: TfrxDBDataset;
    DSetInput: TRxMemoryData;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
    PKod_Setup:Integer;
  public
    function PrintSpr(AParameter:TSvodParam;Smeta:TDataSet):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodBySch';
const NameReport               = 'Reports\Zarplata\SvodBySm.fr3';

function TDM.PrintSpr(AParameter:TSvodParam; Smeta:TDataSet):variant;  //IDSmeta
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SummaAllDed:Extended;
    SummaGr:Extended;
    SummaAll:Extended;
    SummaDolg:Extended;
    DateForm:tdate;
begin
 DateForm:=ConvertKodToDate(AParameter.Kod_setup);
 PKod_Setup:=AParameter.Kod_setup;

 DSetInput:=TRxMemoryData(Smeta);

 if not DSetInput.active then DSetInput.open;

 DataSourceInput.DataSet:=DSetInput;

 DSetFoundationData.DataSource:=DataSourceInput;

 DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSM_SMETA(:ID_SMETA,'+IntToStr(AParameter.ID_Session)+')';

 DSetCategoryGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSM_CATEGORY_GROUP(?ID_SMETA,'+IntToStr(AParameter.ID_Session)+')';

 DSetPropPaymGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSM_PROPPAYM_GROUP(?ID_SMETA,'+IntToStr(AParameter.ID_Session)+') ORDER BY SUMMA DESCENDING';

 DSetUDGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSM_UD(?ID_SMETA,'+IntToStr(AParameter.ID_Session)+') order by KOD_VO';

 DSetNotPodNalGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSM_NOTPODNAL(?ID_SMETA,'+IntToStr(AParameter.ID_Session)+')';

 DsetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSM_GRSHEET(?ID_SMETA,'+IntToStr(AParameter.Kod_setup)+')';

 DsetDolg.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSM_DOLG(?ID_SMETA,'+IntToStr(AParameter.Kod_setup)+')';

 try
  DB.Handle:=AParameter.DB_Handle;

  DSetFoundationData.Open;
  DSetCategoryGroup.Open;
  DSetPropPaymGroup.Open;
  DSetUDGroup.Open;
  DSetNotPodNalGroup.Open;
  DsetGrSheet.Open;
  DsetDolg.Open;

 except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;

 SummaAll:=IfThen(VarIsNull(DSetFoundationData['SUM_ALL']),0,DSetFoundationData['SUM_ALL']);
 SummaDolg:=IfThen(varIsNULL(DsetDolg['SUMMA']),0,DsetDolg['SUMMA']);

 SummaAllDed:=0;
 DSetUDGroup.First;
 while not DSetUDGroup.Eof do
  begin
   SummaAllDed:=SummaAllDed+DSetUDGroup['SUMMA'];
   DSetUDGroup.Next;
  end;

 SummaGr:=0;
 DsetGrSheet.First;
 while not DsetGrSheet.Eof do
  begin
   SummaGr:=SummaGr+DsetGrSheet['SUMMA'];
   DsetGrSheet.Next;
  end;

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);
 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category',
                              'PSumBalans',
                               RoundTo(SummaAll-SummaAllDed+SummaDolg,-2));
 Report.Variables.AddVariable('User Category',
                              'PSumGr',SummaGr);
 Report.Variables.AddVariable('User Category',
                              'PSumBalans',
                               RoundTo(SummaAll-SummaAllDed+SummaDolg,-2));

 if RoundTo(SummaAll-SummaAllDed+SummaDolg-SummaGr,-2)<>0 then
    Report.Variables.AddVariable('User Category',
                                 'PSumRazbalans','''Увага! Свод розбалансовано на суму: '+FloatToStr(RoundTo(SummaAll-SummaAllDed+SummaDolg-SummaGr,-2))+'''')
 else
    Report.Variables.AddVariable('User Category',
                                 'PSumRazbalans',''' ''');

 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;

 Report.Free;
 Smeta.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PKOD_SETUP' then
  Value:=KodSetupToPeriod(PKod_Setup,4);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
