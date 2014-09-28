unit SvodByFOTDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetVoplGroup: TpFIBDataSet;
    ReportDSetVoplGroup: TfrxDBDataset;
    Designer: TfrxDesigner;
    DSetFOT: TpFIBDataSet;
    ReportDBDSetFOT: TfrxDBDataset;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSourceFOT: TDataSource;
    ReportUserDSet: TfrxUserDataSet;
    Report: TfrxReport;
    DSourceVoplGroup: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    function PrintSpr(AParameter:TSvodParam;IsFullSvod:boolean):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodByFOT';
const NameReportFULL           = 'Reports\Zarplata\SvodByFOTFull.fr3';
const NameReportShort          = 'Reports\Zarplata\SvodByFOTShort.fr3';

function TDM.PrintSpr(AParameter:TSvodParam;IsFullSvod:boolean):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SummaAll:Extended;
    SummaFund:Extended;
begin
 Screen.Cursor:=crHourGlass;
 DSetFOT.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYFOT_FOT('+IntToStr(AParameter.ID_Session)+')';

 DSetVoplGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYFOT_VOPL_GROUP(?ID_TIP_FUND,'+IntToStr(AParameter.ID_Session)+')';

 DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYFOT_SUMS(?ID_TIP_FUND,?ID_VOPL_GROUP,'+IntToStr(AParameter.ID_Session)+')';

 try
  DB.Handle:=AParameter.DB_Handle;

  DSetFOT.Open;
  DSetVoplGroup.Open;
  DSetData.Open;

 except
   on E:Exception do
    begin
     ZShowMessage('',e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;

 SummaAll:=0;
 SummaFund:=0;

 DSetFOT.First;
 while not DSetFOT.Eof do
  begin
   SummaAll:=SummaAll+DSetFOT['SUM_ALL'];
   if (DSetFOT['ID_TIP_FUND']>=1) and (DSetFOT['ID_TIP_FUND']<=3) then
       SummaFund:=SummaFund+DSetFOT['SUM_ALL'];
   DSetFOT.Next;
  end;


 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 if IsFullSvod then
    PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReportFULL',NameReportFULL)
 else
    PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReportShort',NameReportShort);
 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category',
                              'PSumAll',
                               RoundTo(SummaAll,-2));
 Report.Variables.AddVariable('User Category',
                              'PSumFund',
                               RoundTo(SummaFund,-2));
 Report.Variables.AddVariable('User Category',
                              'PPeriod',
                               ''''+KodSetupToPeriod(AParameter.Kod_setup,4)+'''');

 Screen.Cursor:=crDefault;
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
