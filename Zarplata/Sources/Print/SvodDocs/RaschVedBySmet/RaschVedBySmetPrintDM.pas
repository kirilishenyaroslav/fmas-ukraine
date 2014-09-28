unit RaschVedBySmetPrintDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, frxClass, frxDesgn, frxDBSet, IBase, ZMessages, IniFiles,
  ZProc, Forms,Unit_PrintAccList_Consts, Variants, Dates, Dialogs,
  ZSvodTypesUnit, RxMemDS;

type
  TPrintDM = class(TDataModule)
    Report: TfrxReport;
    frxDSetGlobalData: TfrxDBDataset;
    frxDSetShtatRas: TfrxDBDataset;
    frxDSetPrivileges: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxUserDataSet: TfrxUserDataSet;
    ReadTransaction: TpFIBTransaction;
    DSetAccUdList: TpFIBDataSet;
    DSetPrivileges: TpFIBDataSet;
    DSetAccNarList: TpFIBDataSet;
    DSetShtatRas: TpFIBDataSet;
    DSetGlobalData: TpFIBDataSet;
    DB: TpFIBDatabase;
    DSourceGlobalData: TDataSource;
    DSetSystemData: TpFIBDataSet;
    frxDSetSystemData: TfrxDBDataset;
    DSetComingLeaving: TpFIBDataSet;
    frxUserDataSetComingLeaving: TfrxUserDataSet;
    DSetSmetaList: TpFIBDataSet;
    frxDSetSmetaList: TfrxDBDataset;
    DSetSheets: TpFIBDataSet;
    frxDSetSheets: TfrxDBDataset;
    MemoryDataAccNarList: TRxMemoryData;
    MemoryDataAccUdList: TRxMemoryData;
    MemoryDataShtatRas: TRxMemoryData;
    MemoryDataSmetaList: TRxMemoryData;
    MemoryDataSheets: TRxMemoryData;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
    function DayClocks(Sender:TObject):String;
  private
    PComingLeavingText:string;
  public
    procedure ReportCreate(AParameter:TZAccListParameter;IdSmeta:variant);
  end;

implementation

{$R *.dfm}
const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'AccList';
const FullNameReport           = 'Reports\Zarplata\AccList.fr3';
const FullNameReportVUZ        = 'Reports\Zarplata\AccListVUZ.fr3';

procedure TPrintDM.ReportCreate(AParameter:TZAccListParameter;IdSmeta:variant);
var IniFile:TIniFile;
    ViewMode:byte;
    PathReport:string;
    IsUniver:variant;
    i:byte;
    CRecord :integer;
begin
 IsUniver:=ValueFieldZSetup(AParameter.DB_Handle,'IS_UNIVER');
 if VarIsNull(IsUniver) then IsUniver:='F';

try
 DB.Handle:=AParameter.DB_handle;

 DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_S2('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                          IntToStr(AParameter.Id_Man)+','+
                                                                          IntToStr(AParameter.Kod_Setup)+','+
                                                                          IntToStr(AParameter.TypeData)+','+VarToStrDef(IdSmeta[0],'NULL')+') ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
 CRecord:=DSetAccNarList.RecordCount;
 MemoryDataAccNarList.CopyStructure(DSetAccNarList);
 MemoryDataAccNarList.LoadFromDataSet(DSetAccNarList,CRecord,lmCopy);
 DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_S2('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                        IntToStr(AParameter.Id_Man)+','+
                                                                        IntToStr(AParameter.Kod_Setup)+','+
                                                                        IntToStr(AParameter.TypeData)+','+VarToStrDef(IdSmeta[0],'NULL')+') order by KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
 CRecord:=DSetAccUdList.RecordCount;
 MemoryDataAccUdList.CopyStructure(DSetAccUdList);
 MemoryDataAccUdList.LoadFromDataSet(DSetAccUdList,CRecord,lmCopy);
 DSetPrivileges.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_PRIV_S('+IntToStr(AParameter.Id_Man)+','+
                                                                      IntToStr(AParameter.Kod_Setup)+')';
 DSetShtatRas.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_MAN_MOVING_S2('+IntToStr(AParameter.Id_Man)+','+
                                                                           IntToStr(AParameter.Kod_Setup)+','+VarToStrDef(IdSmeta[0],'NULL')+')';
 CRecord:=DSetShtatRas.RecordCount;
 MemoryDataShtatRas.CopyStructure(DSetShtatRas);
 MemoryDataShtatRas.LoadFromDataSet(DSetShtatRas,CRecord,lmCopy);
 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_GLOBALDATA_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                            IntToStr(AParameter.Id_Man)+','+
                                                                            IntToStr(AParameter.Kod_Setup)+')';
 DSetComingLeaving.SQLs.SelectSQL.Text :='SELECT * FROM Z_MAN_COMING_LEAVING('+IntToStr(AParameter.Id_Man)+','+
                                                                      IntToStr(AParameter.Kod_Setup)+') order by REAL_DATE';
 DSetSmetaList.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_SMETA_S3('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                         IntToStr(AParameter.Id_Man)+','+
                                                                         IntToStr(AParameter.Kod_Setup)+','+
                                                                         IntToStr(AParameter.TypeData)+','+VarToStrDef(IdSmeta[0],'NULL')+')'; // GROUP BY ID_DEPARTMENT,ID_SMETA, SMETA_TITLE, NAME_SHORT, P1';
 CRecord:=DSetSmetaList.RecordCount;
 MemoryDataSmetaList.CopyStructure(DSetSmetaList);
 MemoryDataSmetaList.LoadFromDataSet(DSetSmetaList,CRecord,lmCopy);
 DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET2('+IntToStr(AParameter.Id_Man)+','+IntToStr(AParameter.Id_Group_Account)+','+VarToStrDef(IdSmeta[0],'NULL')+')';
 CRecord:=DSetSheets.RecordCount;
 MemoryDataSheets.CopyStructure(DSetSheets);
 MemoryDataSheets.LoadFromDataSet(DSetSheets,CRecord,lmCopy);

 DSetSystemData.SQLs.SelectSQL.Text := 'SELECT SHORT_NAME FROM Z_SETUP';

 DSetGlobalData.Open;

 DSetAccNarList.Open;
 DSetAccUdList.Open;
 DSetPrivileges.Open;
 DSetShtatRas.Open;
 DSetSystemData.Open;
 DSetComingLeaving.Open;

  if IsUniver='T' then
  begin
   DSetSmetaList.Open;
   DSetSheets.Open;
  end;

 for i:=1 to (VarArrayHighBound(IdSmeta,1)-1) do
 begin
   DSetAccNarList.Close;
   DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_S2('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                        IntToStr(AParameter.Id_Man)+','+
                                                                        IntToStr(AParameter.Kod_Setup)+','+
                                                                        IntToStr(AParameter.TypeData)+','+VarToStrDef(IdSmeta[i],'NULL')+') ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
   DSetAccNarList.Open;
   CRecord:=DSetAccNarList.RecordCount;
   MemoryDataAccNarList.LoadFromDataSet(DSetAccNarList,CRecord,lmAppend);
   DSetAccUdList.Close;
   DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_S2('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                        IntToStr(AParameter.Id_Man)+','+
                                                                        IntToStr(AParameter.Kod_Setup)+','+
                                                                        IntToStr(AParameter.TypeData)+','+VarToStrDef(IdSmeta[i],'NULL')+') order by KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
   DSetAccUdList.Open;
   CRecord:=DSetAccUdList.RecordCount;
   MemoryDataAccUdList.LoadFromDataSet(DSetAccUdList,CRecord,lmAppend);
   DSetShtatRas.Close;
   DSetShtatRas.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_MAN_MOVING_S2('+IntToStr(AParameter.Id_Man)+','+
                                                                             IntToStr(AParameter.Kod_Setup)+','+VarToStrDef(IdSmeta[i],'NULL')+')';
   DSetShtatRas.Open;
   CRecord:=DSetShtatRas.RecordCount;
   MemoryDataShtatRas.LoadFromDataSet(DSetShtatRas,CRecord,lmAppend);
   DSetSmetaList.Close;
   DSetSmetaList.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_SMETA_S3('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                         IntToStr(AParameter.Id_Man)+','+
                                                                         IntToStr(AParameter.Kod_Setup)+','+
                                                                         IntToStr(AParameter.TypeData)+','+VarToStrDef(IdSmeta[i],'NULL')+')'; // GROUP BY ID_DEPARTMENT,ID_SMETA, SMETA_TITLE, NAME_SHORT, P1';
   DSetSmetaList.Open;
   CRecord:=DSetSmetaList.RecordCount;
   MemoryDataSmetaList.LoadFromDataSet(DSetSmetaList,CRecord,lmAppend);
   DSetSheets.Close;
   DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET2('+IntToStr(AParameter.Id_Man)+','+IntToStr(AParameter.Id_Group_Account)+','+VarToStrDef(IdSmeta[i],'NULL')+')';
   DSetSheets.Open;
   //CRecord:=DSetSheets.RecordCount;
   //MemoryDataSheets.LoadFromDataSet(DSetSheets,CRecord,lmAppend);
   MemoryDataSheets.LoadFromDataSet(DSetSheets,0,lmAppend);
 end;

frxUserDataSet.Fields.Add('N_CODE_DEPARTMENT');
frxUserDataSet.Fields.Add('N_KOD_SETUP_3');
frxUserDataSet.Fields.Add('N_KOD_SM');
frxUserDataSet.Fields.Add('N_KOD_VIDOPL');
frxUserDataSet.Fields.Add('N_NAME_VIDOPL');
frxUserDataSet.Fields.Add('N_DAY_CLOCK');
frxUserDataSet.Fields.Add('N_PERCENT_SUMCLOCK');
frxUserDataSet.Fields.Add('N_SUMMA');
frxUserDataSet.Fields.Add('U_KOD_SETUP_3');
frxUserDataSet.Fields.Add('U_KOD_VIDOPL');
frxUserDataSet.Fields.Add('U_NAME_VIDOPL');
frxUserDataSet.Fields.Add('U_SUMMA');

frxUserDataSetComingLeaving.Fields.Add('P_COMING_LEAVING');

IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
if IsUniver='T' then PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',FullNameReportVUZ)
                else PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',FullNameReport);
 IniFile.Free;

 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
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
 Report.Variables['P_ACCLIST_TYPE']:=NULL;
 Report.Variables['P_ACCLIST']:=''''+FZPrintAccList_P_AccList_Title+' '+AnsiLowerCase(KodSetupToPeriod(AParameter.Kod_Setup,2))+'''';
 Report.Variables['P_FROM']:=''''+FZPrintAccList_P_From_Text+'''';
 Report.Variables['P_SUMMARY']:=''''+FZPrintAccList_P_Summary_Text+'''';

 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;

 Report.Free;
except
 on E:Exception do
  begin
   ZShowMessage(FZPrintAccList_Error_Caption,e.Message,mtError,[mbOK]);
  end;
end;
end;


procedure TPrintDM.ReportGetValue(const VarName: String;
  var Value: Variant);
var PValue:Variant;
    Sum_Nar,Sum_Ud:Extended;
begin
if UpperCase(VarName)='P_COMING_LEAVING' then
 begin
  Value:=PComingLeavingText;
  Exit;
 end;

if UpperCase(VarName)='P_TN' then
 begin
  frxUserDataSetComingLeaving.RangeEndCount:=IfThen(DSetComingLeaving.IsEmpty,0,1);
  frxUserDataSetComingLeaving.RangeEnd:=reCount;
  PComingLeavingText:='';
  DSetComingLeaving.First;
  while not DSetComingLeaving.Eof do
   begin
    if VarToStrDef(DSetComingLeaving['IS_COMING'],'')='T' then
      PComingLeavingText:=PComingLeavingText+'Прийняття: '+VarToStr(DSetComingLeaving['REAL_DATE'])+'    '
    else
      PComingLeavingText:=PComingLeavingText+'Звільнення: '+VarToStr(DSetComingLeaving['REAL_DATE'])+'    ';
    DSetComingLeaving.Next;
   end;
  frxUserDataSet.RangeEndCount:=IfThen(MemoryDataAccNarList.RecordCount>MemoryDataAccUdList.RecordCount,MemoryDataAccNarList.RecordCount,MemoryDataAccUdList.RecordCount);
  frxUserDataSet.RangeEnd:=reCount;
  Value:=FZPrintAccList_P_Tn_Text;
  Exit;
 end;

if UpperCase(VarName)='P_SUM_NAR' then
 begin
  Sum_Nar:=0;
  MemoryDataAccNarList.First;
  while not MemoryDataAccNarList.Eof do
   Begin
    Sum_Nar:=Sum_Nar+MemoryDataAccNarList['SUMMA'];
    MemoryDataAccNarList.Next;
   end;
  Value:=FloatToStrF(Sum_Nar,ffFixed,16,2);
 end;

if UpperCase(VarName)='P_SUM_UD' then
 begin
  Sum_Ud:=0;
  MemoryDataAccUdList.First;
  while not MemoryDataAccUdList.Eof do
   Begin
    Sum_Ud:=Sum_Ud+MemoryDataAccUdList['SUMMA'];
    MemoryDataAccUdList.Next;
   end;
 Value :=FloatToStrF(Sum_Ud,ffFixed,16,2);
 end;

if UpperCase(VarName)='P_VIPLATA' then
 begin
  Sum_Nar:=0;
  MemoryDataAccNarList.First;
  while not MemoryDataAccNarList.Eof do
   Begin
    Sum_Nar:=Sum_Nar+MemoryDataAccNarList['SUMMA'];
    MemoryDataAccNarList.Next;
   end;
  Sum_Ud:=0;
  MemoryDataAccUdList.First;
  while not MemoryDataAccUdList.Eof do
   Begin
    Sum_Ud:=Sum_Ud+MemoryDataAccUdList['SUMMA'];
    MemoryDataAccUdList.Next;
   end;
  Value:=FZPrintAccList_P_Viplata_Text+'  '+FloatToStrF(Sum_Nar-Sum_Ud,ffFixed,16,2);
 end;

if UpperCase(VarName)='N_SUMMA' then
 begin
  if MemoryDataAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=MemoryDataAccNarList.FieldValues['SUMMA'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_CODE_DEPARTMENT' then
 begin
  if MemoryDataAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=MemoryDataAccNarList.FieldValues['CODE_DEPARTMENT'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_KOD_SETUP_3' then
 begin
  if MemoryDataAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=KodSetupToPeriod(MemoryDataAccNarList['KOD_SETUP3'],1);
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_KOD_SM' then
 begin
  if MemoryDataAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=MemoryDataAccNarList['KOD_SMETA'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_KOD_VIDOPL' then
 begin
  if MemoryDataAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=MemoryDataAccNarList.FieldValues['KOD_VIDOPL'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_NAME_VIDOPL' then
 begin
  if MemoryDataAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=MemoryDataAccNarList.FieldValues['NAME_VIDOPL'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_DAY_CLOCK' then
 begin
  if MemoryDataAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DayClocks(self);
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='N_PERCENT_SUMCLOCK' then
 begin
  if MemoryDataAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    if (MemoryDataAccNarList['PERCENT']<>NULL) and (MemoryDataAccNarList['PERCENT']<>0) then
     begin
      if (MemoryDataAccNarList['SUM_CLOCK']<>NULL) and (MemoryDataAccNarList['SUM_CLOCK']<>0) then
      begin
        PValue:=MemoryDataAccNarList['SUM_CLOCK'];
        Value:=FloatToStrF(PValue,ffFixed,5,2);
      end
      else Value := '';  
      PValue:=MemoryDataAccNarList['PERCENT'];
      if Value<>'' then Value:=Value+'/'+FloatToStrF(PValue,ffFixed,4,2)+'%'
                   else Value:=FloatToStrF(PValue,ffFixed,4,2)+'%';
     end
    else
     begin
      PValue:=MemoryDataAccNarList['SUM_CLOCK'];
      Value:=FloatToStrF(PValue,ffFixed,5,2);
     end;
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='U_KOD_SETUP_3' then
 begin
  if MemoryDataAccUdList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccUdList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=KodSetupToPeriod(MemoryDataAccUdList['KOD_SETUP3'],1);
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='U_KOD_VIDOPL' then
 begin
  if MemoryDataAccUdList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccUdList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=MemoryDataAccUdList.FieldValues['KOD_VIDOPL'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='U_NAME_VIDOPL' then
 begin
  if MemoryDataAccUdList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccUdList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=MemoryDataAccUdList.FieldValues['NAME_VIDOPL'];
   end
  else
   Value:=NULL;
 end;
if UpperCase(VarName)='U_SUMMA' then
 begin
  if MemoryDataAccUdList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    MemoryDataAccUdList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=MemoryDataAccUdList.FieldValues['SUMMA'];
   end
  else
   Value:=NULL;
 end;
end;

procedure TPrintDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

function TPrintDM.DayClocks(Sender:TObject):String;
var PValue:Variant;
    Sign:string[1];
begin
  if (MemoryDataAccNarList['NDAY']=0) or (VarIsNull(MemoryDataAccNarList['NDAY'])) then Result:='--'
  else
   begin
    sign:=IfThen(MemoryDataAccNarList['NDAY']<0,'-','');
    PValue:=Abs(MemoryDataAccNarList['NDAY']);
    Result:=Sign+ifThen(PValue<10,'0','')+VarToStr(PValue);
   end;
  Result:=Result+'/';
  if (MemoryDataAccNarList['CLOCK']=0) or (VarIsNull(MemoryDataAccNarList['CLOCK'])) then Result:=Result+'---,--'
  else
   begin
    sign:=IfThen(MemoryDataAccNarList['CLOCK']<0,'-','');
    PValue:=Abs(MemoryDataAccNarList['CLOCK']);
    Result:=Result+Sign+ifThen(PValue<10,'0'+FloatToStrF(PValue,ffFixed,5,3),FloatToStrF(PValue,ffFixed,6,3));
   end;
end;

end.
