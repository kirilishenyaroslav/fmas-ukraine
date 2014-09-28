unit SheetToBankDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit, Unit_ZGlobal_Consts,
  frxExportXLS, Windows;


type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    DSetSetup: TpFIBDataSet;
    ReportDSetSetup: TfrxDBDataset;
    frxXLSExport: TfrxXLSExport;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleCreate(Sender: TObject);
  private
    IdSystem:Boolean;  
    IsUniver:variant;
    PId_man:integer;
    PTn:integer;
    PStrIdBank:string;
    PNameBank:string;
    PIdBank:integer;
    PStrOrderBy:string;
    procedure SetBank(ABank:integer);
  public
    function PrintSpr(AParameter:TSheetToBankParameter):variant;
    property Bank:integer read PIdBank write SetBank;
    property NameBank:string read PNameBank write PNameBank;
    property OrderBy:String read PStrOrderBy write PStrOrderBy;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SheetToBank';
const NameReport               = 'Reports\Zarplata\SheetToBank.fr3';
const NameReportVUZ            = 'Reports\Zarplata\SheetToBankVUZ.fr3';

function TDM.PrintSpr(AParameter:TSheetToBankParameter):variant;
var ViewMode:integer;
    PathReport,TPathReport:string;
    PlanguageIndex:byte;
    LengthOfFileNameExt:byte;
begin
 PLanguageIndex:=LanguageIndex;
 IsUniver := ValueFieldZSetup(AParameter.DB_Handle,'IS_UNIVER');
 if IsUniver='T' then PathReport := NameReportVUZ
                 else PathReport := NameReport;
 IdSystem := AParameter.id_system;
 TPathReport:=ExtractFilePath(Application.ExeName)+PathReport;
 LengthOfFileNameExt:=length(ExtractFileExt(TPathReport));
 TPathReport:=copy(TPathReport,1,Length(TPathReport)-LengthOfFileNameExt)+PStrIdBank+ExtractFileExt(TPathReport);
 if FileExists(TPathReport) then
    PathReport:=TPathReport
 else
    if FileExists(ExtractFilePath(Application.ExeName)+PathReport) then
       PathReport:=ExtractFilePath(Application.ExeName)+PathReport
    else
    begin
      ZShowMessage(Error_Caption[PlanguageIndex],ZePrintShablonNotFound_Error_Text[PLanguageIndex],mtError,[mbOK]);
      Exit;
    end;

 PId_man:=0;
 PTn:=0;

 Screen.Cursor:=crHourGlass;

 DSetSetup.SQLs.SelectSQL.Text:='SELECT FIRM_NAME_FULL,DIRECTOR,GLAV_BUHG,OKPO,NAME_MANEG,GlBuhg_post FROM Z_SETUP';
 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT_BY_ID('+
   IntToStr(AParameter.Id_reestr)+')';

 DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SHEET_TO_BANK('+
    IntToStr(AParameter.Id_reestr)+') '+PStrOrderBy;

 try
  DB.Handle:=AParameter.DB_Handle;

  DSetData.Open;
  DSetGlobalData.Open;
  DSetSetup.Open;
 except
   on E:Exception do
    begin
     Screen.Cursor:=crDefault;
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;
 if DSetData.IsEmpty then
  begin
   Screen.Cursor:=crDefault;
   ZShowMessage(Error_Caption[LanguageIndex],Message_Data_Nothing_Selected[LanguageIndex],mtInformation,[mbOK]);
   Exit;
  end;

 Report.Clear;

 Report.LoadFromFile(PathReport,True);
 Report.Variables.Clear;
 Report.Variables['BANK_NAME'] := ''''+StringPrepareToQueryText(PNameBank)+'''';

 Screen.Cursor:=crDefault;
 if zDesignReport then Report.DesignReport
 else Report.ShowReport;
 Report.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PPERIOD' then
begin
  if(ValueFieldZSetup(DB.Handle,'NUM_PREDPR')=1)then
    Value:= AnsiLowercase(KodSetupToPeriod(DSetGlobalData['KOD_SETUP'],4))
  else
    Value:= AnsiLowercase(KodSetupToPeriod(DSetGlobalData['KOD_SETUP'],5));
end;
if IsUniver='T' then
begin
 if(ValueFieldZSetup(DB.Handle,'NUM_PREDPR')=4)then
  begin
   if IdSystem=False then
    begin
     if UpperCase(VarName)='ZP_OR_GRANT' then  Value:='заробітної плати';
     if UpperCase(VarName)='RAB_OR_STUD' then  Value:='співробітників';
     if UpperCase(VarName)='ZP_OR_GRANT2' then  Value:='заробітної плати';
    end
   else
    begin
     if UpperCase(VarName)='ZP_OR_GRANT' then  Value:='стипендії';
     if UpperCase(VarName)='RAB_OR_STUD' then  Value:='стипендіатів';
     if UpperCase(VarName)='ZP_OR_GRANT2' then  Value:='стипендії';
    end;
 end
 else
  begin
    if UpperCase(VarName)='ZP_OR_GRANT' then  Value:='заробітної плати та стипендії';
    if UpperCase(VarName)='RAB_OR_STUD' then  Value:='співробітників';
    if UpperCase(VarName)='ZP_OR_GRANT2' then  Value:='заробітної плати';
  end;
end;
if UpperCase(VarName)='PSUMMASTR' then
 Value:= SumToString(DSetGlobalData['SUMMA']);
if UpperCase(VarName)='PDATE_PERIOD' then
  if  DSetGlobalData['LAST_DATE_PRINT']<>null then
    Value:=' от ' +DateToStr(DSetGlobalData['LAST_DATE_PRINT'])
  else
   Value:='';
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
PStrIdBank:='';
PStrOrderBy:='';
end;

procedure TDM.SetBank(ABank:integer);
begin
 PIdBank:=ABank;
 PStrIdBank:=IntToStr(ABank);
end;

end.

