unit UnitPrintAcc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  frxClass, frxDBSet, IBase, ZTypes, IniFiles, frxDesgn, frxCross, ZProc, Dates,
  Unit_PrintAccList_Consts, ZMessages, frxExportTXT, frxExportRTF;

type
  TFZPrintAccList = class(TForm)
    frxDSetGlobalData: TfrxDBDataset;
    frxDSetShtatRas: TfrxDBDataset;
    frxDSetPrivileges: TfrxDBDataset;
    DB: TpFIBDatabase;
    DSetPrivileges: TpFIBDataSet;
    DSetAccNarList: TpFIBDataSet;
    DSetShtatRas: TpFIBDataSet;
    DSetGlobalData: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    Report: TfrxReport;
    frxDesigner1: TfrxDesigner;
    DSetAccUdList: TpFIBDataSet;
    frxUserDataSet: TfrxUserDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    Parameter:TZPrintAccListParameter;
  public
    constructor Create(Aowner: TComponent;DB_handle:TISC_DB_HANDLE;AParameter:TZPrintAccListParameter);reintroduce;
  end;

function CreateReportAccList(Aowner: TComponent;DB:TISC_DB_HANDLE;AParameter:TZPrintAccListParameter):Variant;stdcall;
exports CreateReportAccList;

implementation

uses Math;

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'AccList';
const FullNameReport           = 'Reports\Zarplata\AccList.fr3';

function CreateReportAccList(Aowner: TComponent;DB:TISC_DB_HANDLE;AParameter:TZPrintAccListParameter):Variant;stdcall;
var ViewForm:TFZPrintAccList;
begin
ViewForm:=TFZPrintAccList.Create(Aowner,DB,AParameter);
end;

constructor TFZPrintAccList.Create(Aowner: TComponent;DB_handle:TISC_DB_HANDLE;AParameter:TZPrintAccListParameter);
begin
inherited Create(Aowner);
try
 Parameter:=AParameter;
 DB.Handle:=DB_handle;
 DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                            IntToStr(AParameter.Id_Man)+','+
                                                                            IntToStr(AParameter.Kod_Setup2)+','+
                                                                            IntToStr(AParameter.TypeData)+') ORDER BY KOD_VIDOPL';
 DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                          IntToStr(AParameter.Id_Man)+','+
                                                                          IntToStr(AParameter.Kod_Setup2)+','+
                                                                          IntToStr(AParameter.TypeData)+') order by KOD_VIDOPL';
 DSetPrivileges.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_PRIV_S('+IntToStr(AParameter.Id_Man)+','+
                                                                         IntToStr(AParameter.Kod_Setup2)+')';
 DSetShtatRas.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_MAN_MOVING_S('+IntToStr(AParameter.Id_Man)+','+
                                                                             IntToStr(AParameter.Kod_Setup2)+')';
 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_GLOBALDATA_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                              IntToStr(AParameter.Id_Man)+','+
                                                                              IntToStr(AParameter.Kod_Setup2)+')';

// ShowMessage(DSetAccNarList.SQLs.SelectSQL.Text);
 DSetAccNarList.Open;
// ShowMessage(DSetAccUdList.SQLs.SelectSQL.Text);
 DSetAccUdList.Open;
// ShowMessage(DSetPrivileges.SQLs.SelectSQL.Text);
 DSetPrivileges.Open;
// ShowMessage(DSetShtatRas.SQLs.SelectSQL.Text);
 DSetShtatRas.Open;
// ShowMessage(DSetGlobalData.SQLs.SelectSQL.Text);
 DSetGlobalData.Open;
except
 on E:Exception do
  begin
   ZShowMessage(FZPrintAccList_Error_Caption,e.Message,mtError,[mbOK]);
   Self.Close;
  end;
end;
end;

procedure TFZPrintAccList.FormCreate(Sender: TObject);
var IniFile:TIniFile;
    ViewMode:byte;
    PathReport:string;
    Sum_Nar,Sum_Ud:double;
begin
Sum_Nar:=0;
Sum_Ud:=0;
DSetAccNarList.First;
while not DSetAccNarList.Eof do
 Begin
  Sum_Nar:=Sum_Nar+DSetAccNarList['SUMMA'];
  DSetAccNarList.Next;
 end;
DSetAccUdList.First;
while not DSetAccUdList.Eof do
 Begin
  Sum_Ud:=Sum_Ud+DSetAccUdList['SUMMA'];
  DSetAccUdList.Next;
 end;
frxUserDataSet.Fields.Add('N_CODE_DEPARTMENT');
frxUserDataSet.Fields.Add('N_KOD_SETUP_3');
frxUserDataSet.Fields.Add('N_KOD_VIDOPL');
frxUserDataSet.Fields.Add('N_NAME_VIDOPL');
frxUserDataSet.Fields.Add('N_DAY_CLOCK');
frxUserDataSet.Fields.Add('N_PERCENT_SUMCLOCK');
frxUserDataSet.Fields.Add('N_SUMMA');
frxUserDataSet.Fields.Add('U_KOD_SETUP_3');
frxUserDataSet.Fields.Add('U_KOD_VIDOPL');
frxUserDataSet.Fields.Add('U_NAME_VIDOPL');
frxUserDataSet.Fields.Add('U_SUMMA');
frxUserDataSet.RangeEndCount:=IfThen(DSetAccNarList.RecordCount>DSetAccUdList.RecordCount,DSetAccNarList.RecordCount,DSetAccUdList.RecordCount);
frxUserDataSet.RangeEnd:=reCount;

IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',FullNameReport);
IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables['P_CODE_DEPARTMENT']:=''''+FZPrintAccList_P_CODE_DEPARTMENT_Text+'''';
 Report.Variables['P_KOD_SETUP_3']:=''''+FZPrintAccList_P_KOD_SETUP_3_Text+'''';
 Report.Variables['P_KOD_VIDOPL']:=''''+FZPrintAccList_P_KOD_VIDOPL_Text+'''';
 Report.Variables['P_NAME_VIDOPL']:=''''+FZPrintAccList_P_NAME_VIDOPL_Text+'''';
 Report.Variables['P_DAY_CLOCK']:=''''+FZPrintAccList_P_DAY_CLOCK_Text+'''';
 Report.Variables['P_PERCENT_SUMCLOCK']:=''''+FZPrintAccList_P_PERCENT_SUMCLOCK_Text+'''';
 Report.Variables['P_SUMMA']:=''''+FZPrintAccList_P_SUMMA_Text+'''';
 Report.Variables['P_NAR']:=''''+FZPrintAccList_P_Nar_Text+'''';
 Report.Variables['P_UD']:=''''+FZPrintAccList_P_Ud_Text+'''';
 Report.Variables['P_TARIFOKLAD']:=''''+FZPrintAccList_P_TarifOklad_Text+'''';
 if DSetGlobalData['KOD_SETUP1']<>Parameter.Kod_Setup2 then
    Report.Variables['P_ACCLIST_TYPE']:=''''+FZPrintAccList_P_AccList_Type_Title+KodSetupToPeriod(DSetGlobalData['KOD_SETUP1'],2)+''''
 else
    Report.Variables['P_ACCLIST_TYPE']:=NULL;
 Report.Variables['P_ACCLIST']:=''''+FZPrintAccList_P_AccList_Title+KodSetupToPeriod(Parameter.Kod_Setup2,2)+'''';
 Report.Variables['P_TN']:=''''+FZPrintAccList_P_Tn_Text+'''';
 Report.Variables['P_FROM']:=''''+FZPrintAccList_P_From_Text+'''';
 Report.Variables['P_VIPLATA']:=''''+FZPrintAccList_P_Viplata_Text+'  '+FloatToStrF(Sum_Nar-Sum_Ud,ffFixed,16,2)+'''';
 Report.Variables['P_SUMMARY']:=''''+FZPrintAccList_P_Summary_Text+'''';
 Report.Variables['P_SUM_NAR']:=''''+FloatToStrF(Sum_Nar,ffFixed,16,2)+'''';
 Report.Variables['P_SUM_UD'] :=''''+FloatToStrF(Sum_Ud,ffFixed,16,2)+'''';
  case ViewMode of
   1: Report.ShowReport;
   2: Report.DesignReport;
  end;
 Report.Free;
 Close;
end;

procedure TFZPrintAccList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
Action:=caFree;
end;

procedure TFZPrintAccList.ReportGetValue(const VarName: String;
  var Value: Variant);
var PValue:double;
begin

if UpperCase(VarName)='N_SUMMA' then
 begin
  if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DSetAccNarList.FieldValues['SUMMA'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_CODE_DEPARTMENT' then
 begin
  if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DSetAccNarList.FieldValues['CODE_DEPARTMENT'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_KOD_SETUP_3' then
 begin
  if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=YearMonthFromKodSetup(DSetAccNarList.FieldValues['KOD_SETUP3'],False);
    if Value<10 then Value:='0'+VarToStr(Value);
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_KOD_VIDOPL' then
 begin
  if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DSetAccNarList.FieldValues['KOD_VIDOPL'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_NAME_VIDOPL' then
 begin
  if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DSetAccNarList.FieldValues['NAME_VIDOPL'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_DAY_CLOCK' then
 begin
  if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    PValue:=DSetAccNarList['CLOCK'];
    Value:=VarToStr(IfThen((DSetAccNarList['NDAY']=0) or varIsNull(DSetAccNarList['NDAY']),
                           '--',
                           ifThen(DSetAccNarList['NDAY']<10,
                                  '0'+VarToStr(DSetAccNarList['NDAY']),
                                  DSetAccNarList['NDAY']
                                  )
                           )
                    )
           +'/'+IfThen( VarisNULL(DSetAccNarList['CLOCK']) or (DSetAccNarList['CLOCK']=0),
                       '--,---',
                       ifthen(PValue<10,
                              '0'+FloatToStrF(PValue,ffFixed,5,2),
                              FloatToStrF(PValue,ffFixed,6,2)));
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_PERCENT_SUMCLOCK' then
 begin
  if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    if (DSetAccNarList['PERCENT']<>NULL) and (DSetAccNarList['PERCENT']<>0) then
     begin
      PValue:=DSetAccNarList['PERCENT'];
      Value:=FloatToStrF(PValue,ffFixed,4,1)+'%';
     end
    else
     begin
      PValue:=DSetAccNarList['SUM_CLOCK'];
      Value:=FloatToStrF(PValue,ffFixed,5,2);
     end;
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='U_KOD_SETUP_3' then
 begin
  if DSetAccUdList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccUdList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=YearMonthFromKodSetup(DSetAccUdList.FieldValues['KOD_SETUP3'],False);
    if Value<10 then Value:='0'+VarToStr(Value);
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='U_KOD_VIDOPL' then
 begin
  if DSetAccUdList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccUdList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DSetAccUdList.FieldValues['KOD_VIDOPL'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='U_NAME_VIDOPL' then
 begin
  if DSetAccUdList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccUdList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DSetAccUdList.FieldValues['NAME_VIDOPL'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='U_SUMMA' then
 begin
  if DSetAccUdList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccUdList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DSetAccUdList.FieldValues['SUMMA'];
   end
  else
   Value:=NULL;
 end;
{if UpperCase(VarName)='P_CODE_DEPARTMENT' then Value:=FZPrintAccList_P_CODE_DEPARTMENT_Text;
if UpperCase(VarName)='P_KOD_SETUP_3' then Value:=FZPrintAccList_P_KOD_SETUP_3_Text;
if UpperCase(VarName)='P_KOD_VIDOPL' then Value:=FZPrintAccList_P_KOD_VIDOPL_Text;
if UpperCase(VarName)='P_NAME_VIDOPL' then Value:=FZPrintAccList_P_NAME_VIDOPL_Text;
if UpperCase(VarName)='P_DAY_CLOCK' then Value:=FZPrintAccList_P_DAY_CLOCK_Text;
if UpperCase(VarName)='P_PERCENT_SUMCLOCK' then Value:=FZPrintAccList_P_PERCENT_SUMCLOCK_Text;
if UpperCase(VarName)='P_SUMMA' then Value:=FZPrintAccList_P_SUMMA_Text;}
end;

end.
