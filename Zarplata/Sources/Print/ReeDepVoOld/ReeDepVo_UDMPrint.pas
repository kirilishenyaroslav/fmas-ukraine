unit ReeDepVo_UDMPrint;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit, Unit_ZGlobal_Consts,
  ZWait;

type TzReeDepVOFilter = record
 Kod_Setup:integer;
 Is_Smeta:boolean;
 Is_Department:boolean;
 Is_VidOpl:boolean;
 Id_smeta:integer;
 Title_Smeta:string;
 Id_department:integer;
 Title_department: string;
 Code_department: string;
 IsDepSprav: boolean;
 Id_VidOpl:integer;
 Title_VidOpl: string;
end;


type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    Report: TfrxReport;
  private
  public
    function PrintSpr(AHandle:TISC_DB_HANDLE;Param:TzReeDepVOFilter):variant;
end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'ReeDepVo';
const NameReport               = 'Reports\Zarplata\ReeDepVo.fr3';

function TDM.PrintSpr(AHandle:TISC_DB_HANDLE;Param:TzReeDepVOFilter):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    wf:TForm;
begin
wf:=ShowWaitForm(TForm(Self.Owner));
 Screen.Cursor:=crHourGlass;

 DSetData.SQLs.SelectSQL.Text :=
          'SELECT * FROM Z_REESTR_SUMS('+intToStr(Param.Kod_Setup)+','+
                  ifThen(Param.Is_VidOpl,IntToStr(Param.Id_VidOpl),'NULL')+','+
                  ifThen(Param.Is_Department,IntToStr(Param.Id_department),'NULL')+','+
                  ifThen(Param.Is_Smeta,IntToStr(Param.Id_smeta),'NULL')+') order by tn';

// ShowMessage(DSetData.SQLs.SelectSQL.Text);
 try
  DB.Handle:=AHandle;

  DSetData.Open;

 except
   on E:Exception do
    begin
     CloseWaitForm(wf);
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=IniFile.ReadString(SectionOfIniFile,'ReeDepVo',NameReport);

 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category',
                              'PPeriod',
                               ''''+KodSetupToPeriod(Param.Kod_setup,4)+'''');


 Report.Variables.AddVariable('User Category',
                              'PDepartment',
                               ''''+StringPrepareToQueryText(IfThen(Param.Is_Department,Param.Title_department,''))+'''');
 Report.Variables.AddVariable('User Category',
                              'PSmeta',
                               ''''+StringPrepareToQueryText(IfThen(Param.Is_Smeta,Param.Title_Smeta,''))+'''');
 Report.Variables.AddVariable('User Category',
                              'PVidOpl',
                               ''''+StringPrepareToQueryText(IfThen(Param.Is_VidOpl,Param.Title_VidOpl,''))+'''');


 Screen.Cursor:=crDefault;
 CloseWaitForm(wf);
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;
 Report.Free;
end;

end.

