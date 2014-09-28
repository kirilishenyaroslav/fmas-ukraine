unit SvodFODDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDOcs_Consts;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetFOD: TpFIBDataSet;
    ReportDBDSetFOD: TfrxDBDataset;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    function PrintSpr(AParameter:TSvodParam):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodFOD';
const NameReport               = 'Reports\Zarplata\SvodFOD.fr3';

function TDM.PrintSpr(AParameter:TSvodParam):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SummaAll:Extended;
begin
 Screen.Cursor:=crHourGlass;
 DSetFOD.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYDEP2_DEP_S(1,'+IntToStr(AParameter.Kod_setup)+','+
                                 IntToStr(AParameter.ID_Session)+')';

 try
  DB.Handle:=AParameter.DB_Handle;

  DSetFOD.Open;

 except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);

 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;

 DSetFOD.First;
 SummaAll:=0;
 while not DSetFOD.Eof do
  begin
   SummaAll:=SummaAll+
             ifThen(VarIsNULL(DSetFOD['SUM_PENS']),0,DSetFOD['SUM_PENS']*0.32)+
             ifThen(VarIsNULL(DSetFOD['SUM_SOC']),0,DSetFOD['SUM_SOC']*0.0677);
   DSetFOD.Next;
  end;

 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category',
                              'PSumAll',
                               RoundTo(SummaAll,-2));
 Report.Variables.AddVariable('User Category',
                              'PPeriod',
                               ''''+LowerCase(KodSetupToPeriod(AParameter.Kod_setup,4))+'''');

 Screen.Cursor:=crDefault;
 case ViewMode of
   1: Report.ShowReport;
   2: Report.DesignReport;
  end;
 Report.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
var SUm:extended;
begin
if UpperCase(VarName)='P_SUM' then
  begin
   Sum:=ifThen(VarIsNULL(DSetFOD['SUM_PENS']),0,DSetFOD['SUM_PENS']*0.32)+
            ifThen(VarIsNULL(DSetFOD['SUM_SOC']),0,DSetFOD['SUM_SOC']*0.0677);
   Value:=ifThen(RoundTo(SUm,1)=0,NULL,FloatToStrF(Sum,ffFixed,5,2));
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
