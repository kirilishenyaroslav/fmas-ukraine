unit RaschVedReestrPrintDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery, ZWait,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDocs_Consts,
  frxExportXLS;

Type TAllParams = record
  FoundationParam : TSvodParam;
  Id_Sch : Integer;
end;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetGlobalData: TpFIBDataSet;
    ReportDBDSetGlobalData: TfrxDBDataset;
    DSetDepartment: TpFIBDataSet;
    ReportDBDSetDepartment: TfrxDBDataset;
    Report: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    function PrintSpr(AParameter: TZAccListParameter):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'ReePeopleRaschVed';
const NameReport               = 'Reports\Zarplata\ReePeopleRaschVed.fr3';

function TDM.PrintSpr(AParameter: TZAccListParameter):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    Wf:TForm;
begin
 wf := ShowWaitForm(Application.MainForm);

 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE('+IntToStr(AParameter.Id_Department)+','+
                                       IntToStr(AParameter.Id_Session)+') order by tn';
 DSetDepartment.SQLs.SelectSQL.Text := 'SELECT * FROM Z_DEPARTMENT_BY_ID('+IntToStr(AParameter.Id_Department)+','+
                                       IntToStr(AParameter.Kod_setup)+')';

 DB.Handle:=AParameter.DB_Handle;

 DSetGlobalData.Open;
 DSetDepartment.Open;

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);
 IniFile.Free;

 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category',
                              'CURRENT_KS',
                               ''''+KodSetupToLitFormat(AParameter.Kod_setup,pVinitelny)+'''');

 CloseWaitForm(Wf);
 case ViewMode of
   1: Report.ShowReport;
   2: Report.DesignReport;
  end;
 Report.Free;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
