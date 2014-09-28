unit ReeListPrintDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDocs_Consts,
  frxExportXLS;

type
  TDM = class(TDataModule)
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    ReportDBDSetFoundationData: TfrxDBDataset;
    Report: TfrxReport;
    DSetPropPaymGroup: TpFIBDataSet;
    ReportDsetPropPaymGroup: TfrxDBDataset;
    DSetUDGroup: TpFIBDataSet;
    ReportDSetUDGroup: TfrxDBDataset;
    DSetNotPodNalGroup: TpFIBDataSet;
    ReportDSetNotPodNalGroup: TfrxDBDataset;
    DsetGrSheet: TpFIBDataSet;
    ReportDsetGrSheet: TfrxDBDataset;
    DB: TpFIBDatabase;
    DSetFoundationData: TpFIBDataSet;
    frxXLSExport1: TfrxXLSExport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
    PKod_Setup:Integer;
  public
    function PrintSpr(DB_Handle:TISC_DB_HANDLE;id_reestr:integer):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodBySch';
const NameReport               = 'Reports\Zarplata\ReeList.fr3';

function TDM.PrintSpr(DB_Handle:TISC_DB_HANDLE;id_reestr:integer):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SummaAllDed:Extended;
    SummaGr:Extended;
    SummaAll:Extended;
    SummaDolg:Extended;
    DateForm:tdate;
    i:byte;
begin
 DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SVODBYREEVED_SCHES('+IntToStr(id_reestr)+')';

 DSetPropPaymGroup.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SVODBYREEVED_PROPPAYM_GROUP('+IntToStr(id_reestr)+')';

 DSetUDGroup.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SVODBYREEVED_UD('+IntToStr(id_reestr)+')';

 DSetNotPodNalGroup.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SVODBYREEVED_NOTPODNAL('+IntToStr(id_reestr)+')';

 DsetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SVODBYREEVED_GRSHEET('+IntToStr(id_reestr)+')';

 try


  DB.Handle:=DB_Handle;

  DSetFoundationData.Open;
  DSetPropPaymGroup.Open;
  DSetUDGroup.Open;
  DSetNotPodNalGroup.Open;
  DsetGrSheet.Open;

 except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;

 SummaAll:=IfThen(VarIsNull(DSetFoundationData['SUM_ALL']),0,DSetFoundationData['SUM_ALL']);

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
 Report.Variables.AddVariable('User Category',
                              'id_reestr',
                              id_reestr);

{ if RoundTo(SummaAll-SummaAllDed+SummaDolg-SummaGr,2)<>0 then
    Report.Variables.AddVariable('User Category',
                                 'PSumRazbalans','''Увага! Свод розбалансовано на суму: '+FloatToStr(RoundTo(SummaAll-SummaAllDed+SummaDolg-SummaGr,2))+'''')
 else
    Report.Variables.AddVariable('User Category',
                                 'PSumRazbalans',''' ''');
}
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;

 Report.Free;
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
