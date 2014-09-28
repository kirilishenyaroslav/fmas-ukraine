unit SvodP49DataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit, Unit_ZGlobal_Consts,
  ZWait, frxExportXLS, RxMemDS;


type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    UserDSet: TfrxUserDataSet;
    frxXLSExport1: TfrxXLSExport;
    Report: TfrxReport;
  private
    PTypeSimpleReestr:TTypeSimpleReestr;
    PId_man:integer;
    PTn:integer;
  public
    function PrintSpr(AParameter:TSimpleReestrParam):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SimpleReestr';
const NameReport               = 'Reports\Zarplata\SvodP49.fr3';

function TDM.PrintSpr(AParameter:TSimpleReestrParam):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    VNameReport:string;
    wf:TForm;
begin
  wf:=ShowWaitForm(TForm(Self.Owner));
  PId_man:=0;
  PTypeSimpleReestr:=AParameter.TypeSimpleReestr;
  PTn:=0;
  DB.Handle:=AParameter.SvodParam.DB_Handle;

 try
   Screen.Cursor:=crHourGlass;

   DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODP49_DATA('+IntToStr(AParameter.SvodParam.ID_Session)+') ORDER BY FIO,KOD_SETUP';
   VNameReport:=NameReport;

   DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SIMPLEREESTR_GLOBALDATA('+
                                          IntToStr(IdVidOplPropFromTypeSimpleReestr(AParameter.TypeSimpleReestr))+')';

 except
   on E:Exception do
   begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Exit;
   end;
 end;
 try
   if(DSetData.Active=false)then DSetData.Open;
   if(DSetGlobalData.Active=false)then DSetGlobalData.Open;

   IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
   ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
   PathReport:=IniFile.ReadString(SectionOfIniFile,
                                  NameReport,
                                  VNameReport);

   IniFile.Free;
   Report.Clear;

   Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

   Report.Variables.Clear;
   Report.Variables[' '+'User Category']:=NULL;
   Report.Variables.AddVariable('User Category',
                                'PPeriod',
                                 ''''+KodSetupToPeriod(AParameter.SvodParam.Kod_setup,4)+'''');

   Report.Variables.AddVariable('User Category',
                                'PMonth',
                                 ''''+KodSetupToPeriod(AParameter.SvodParam.Kod_setup,1)+'''');
   Screen.Cursor:=crDefault;
   if zDesignReport
      then Report.DesignReport
      else Report.ShowReport;
   Report.Free;

  finally
   CloseWaitForm(wf);
  end;
end;

end.

