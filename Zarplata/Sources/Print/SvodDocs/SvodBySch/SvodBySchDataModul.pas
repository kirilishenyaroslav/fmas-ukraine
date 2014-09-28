unit SvodBySchDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDocs_Consts,
  frxExportXLS, ZWait;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetCategoryGroup: TpFIBDataSet;
    ReportDSetCategoryGroup: TfrxDBDataset;
    Designer: TfrxDesigner;
    DSetFoundationData: TpFIBDataSet;
    ReportDBDSetFoundationData: TfrxDBDataset;
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
    frxXLSExport1: TfrxXLSExport;
    DSetShifr: TpFIBDataSet;
    ReportDSetShifr: TfrxDBDataset;
    frxUserDataSet: TfrxUserDataSet;
    DSetNar: TpFIBDataSet;
    DsetUtr: TpFIBDataSet;
    DSetNp6: TpFIBDataSet;
    ReportDSetAdditionalData: TfrxDBDataset;
    DSetAdditionalData: TpFIBDataSet;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
    PKod_Setup:Integer;
  public
    n_num, u_num, id_sch:integer;
    TYPE_FORM:TTypeSchForm ;
    function PrintSpr(AParameter:TSvodBySchParam):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodBySch';
const NameReport               = 'Reports\Zarplata\SvodBySch.fr3';
const NameReportNP7            = 'Reports\Zarplata\SvodBySchNP7.fr3';
const NameReportNP6            = 'Reports\Zarplata\SvodBySchNP6.fr3';
const NameReportReeSingleBySch = 'Reports\Zarplata\ReeAccrualSingleBySch.fr3';

function TDM.PrintSpr(AParameter:TSvodBySchParam):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SummaAllDed:Extended;
    SummaGr:Extended;
    SummaAll:Extended;
    SummaDolg:Extended;
    DateForm:tdate;
    wf:TForm;
    i:byte;
begin
   wf:=ShowWaitForm(TForm(Self.Owner));
   DateForm:=ConvertKodToDate(AParameter.FoundationParam.Kod_setup);
   PKod_Setup:=AParameter.FoundationParam.Kod_setup;
   n_num:=1;
   u_num:=1;
   TYPE_FORM:=AParameter.TypeForm;
   DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_SCHES('+VarToStrDef(AParameter.Id_Sch[0],'NULL')+','''+DateToStr(DateForm)+''','+IntToStr(AParameter.FoundationParam.ID_Session)+')';
   if AParameter.TypeForm=tfsReeAccrualSingleBySch then
   DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_REESTR_ESV_BY_SCH('+VarToStrDef(AParameter.Id_Sch[0],'NULL')+','+IntToStr(AParameter.FoundationParam.Kod_setup)+',''T'','+IntToStr(AParameter.FoundationParam.id_session_fond)+')';

   if AParameter.TypeForm=tfsNP6 then
     DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_INFO_NP6('+IntToStr(AParameter.FoundationParam.ID_Session)+','+IntToStr(AParameter.FoundationParam.Kod_setup)+')   where id_department='+VarToStrDef(AParameter.Id_Sch[0],'NULL');
   DSetCategoryGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_CATEGORY_GROUP(?ID_SCH,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''')';
   DSetPropPaymGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_PROPPAYM_GROUP(?ID_SCH,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''')';
   DSetUDGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_UD(?ID_SCH,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''') order by KOD_VO';
   DSetNotPodNalGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_NOTPODNAL(?ID_SCH,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''')';
   DsetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_GRSHEET(?ID_SCH,'+IntToStr(AParameter.FoundationParam.Kod_setup)+')';
   DsetDolg.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_DOLG(?ID_SCH,'+IntToStr(AParameter.FoundationParam.Kod_setup)+')';
   DSetShifr.SQLs.SelectSQL.Text :=  'SELECT * FROM Z_SVODBYSCH_UD_SHIFR(?ID_SCH,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''')';


   if AParameter.TypeForm=tfsNP7 then
   begin
   DSetNar.SQLs.SelectSQL.Text:='Select * from Z_SVODBYSCH_NP7(?ID_SCH,'+IntToStr(AParameter.FoundationParam.ID_Session)+','+IntToStr(AParameter.FoundationParam.Kod_setup)+',''N'') order by order_num_fund_type, kod_vidopl';
   DSetUtr.SQLs.SelectSQL.Text:='Select * from Z_SVODBYSCH_NP7(?ID_SCH,'+IntToStr(AParameter.FoundationParam.ID_Session)+','+IntToStr(AParameter.FoundationParam.Kod_setup)+',''U'') order by order_num_fund_type, kod_vidopl';
   end ;
   if AParameter.TypeForm=tfsNP6 then
   begin
   DSetNar.SQLs.SelectSQL.Text:='Select * from Z_SVODBYSCH_NP6(?id_man,'+IntToStr(AParameter.FoundationParam.ID_Session)+','+IntToStr(AParameter.FoundationParam.Kod_setup)+',''N'') order by order_num_fund_type, kod_vidopl';
   DSetUtr.SQLs.SelectSQL.Text:='Select * from Z_SVODBYSCH_NP6(?id_man,'+IntToStr(AParameter.FoundationParam.ID_Session)+','+IntToStr(AParameter.FoundationParam.Kod_setup)+',''U'') order by order_num_fund_type, kod_vidopl';
   end  ;
   if AParameter.TypeForm=tfsReeAccrualSingleBySch then
   begin
       DSetAdditionalData.SQLs.SelectSQL.Text:='SELECT * FROM Z_PAR_SET_SELECT_BY_KOD_SETUP('+IntToStr(AParameter.FoundationParam.Kod_setup)+')';
   end ;

   try
     DB.Handle:=AParameter.FoundationParam.DB_Handle;
     DSetFoundationData.Open;

     for i:=1 to (VarArrayHighBound(AParameter.Id_Sch,1)-1) do
     begin
       if AParameter.TypeForm=tfsReeAccrualSingleBySch then
       begin
           DSetFoundationData.SQLs.InsertSQL.Text:='SELECT * FROM Z_REESTR_ESV_BY_SCH('+VarToStrDef(AParameter.Id_Sch[i],'NULL')+','+IntToStr(AParameter.FoundationParam.Kod_setup)+',''T'','+IntToStr(AParameter.FoundationParam.id_session_fond)+')';;

       end else
       if AParameter.TypeForm=tfsNP6 then
         DSetFoundationData.SQLs.InsertSQL.Text := 'SELECT * FROM Z_SVODBYSCH_INFO_NP6('+IntToStr(AParameter.FoundationParam.ID_Session)+','+IntToStr(AParameter.FoundationParam.Kod_setup)+')   where id_department='+VarToStrDef(AParameter.Id_Sch[i],'NULL')
       else
         DSetFoundationData.SQLs.InsertSQL.Text := 'SELECT * FROM Z_SVODBYSCH_SCHES('+VarToStrDef(AParameter.Id_Sch[i],'NULL')+','''+DateToStr(DateForm)+''','+IntToStr(AParameter.FoundationParam.ID_Session)+')';
       DSetFoundationData.Insert;
       DSetFoundationData.Post;
     end;

    if AParameter.TypeForm=tfsReeAccrualSingleBySch then
       begin
       DSetAdditionalData.Open;
       end
     else
     if AParameter.TypeForm=tfsNP7 then
       begin
       DSetNar.Open;
       DSetUtr.Open;
       end
     else
       if AParameter.TypeForm=tfsNP6 then
         begin
         DSetNar.Open;
         DSetUtr.Open;
         end
       else
         begin
         DSetCategoryGroup.Open;
         DSetPropPaymGroup.Open;
         DSetUDGroup.Open;
         DSetNotPodNalGroup.Open;
         DsetGrSheet.Open;
         DsetDolg.Open;
         DSetShifr.Open;
         end
   except
     on E:Exception do
     begin
       ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
       Exit;
     end;
   end;
   IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
   ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);

   if AParameter.TypeForm=tfsReeAccrualSingleBySch then
   begin
     PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReportReeSingleBySch) ;
   end else
   if AParameter.TypeForm=tfsNP7 then
   begin
     frxUserDataSet.Fields.Add('N_NUM');
     frxUserDataSet.Fields.Add('N_NAME');
     frxUserDataSet.Fields.Add('N_SUMM');
     frxUserDataSet.Fields.Add('U_NUM');
     frxUserDataSet.Fields.Add('U_NAME');
     frxUserDataSet.Fields.Add('U_SUMM');
     PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReportNP7) ;
   end
   else
    if AParameter.TypeForm=tfsNP6 then
      PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReportNP6)
    else
      PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);
   IniFile.Free;
   Report.Clear;
   Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
   Report.Variables.Clear;
   Report.Variables[' '+'User Category']:=NULL;
   CloseWaitForm(wf);
   if zDesignReport then
       Report.DesignReport
   else
   Report.ShowReport;
   Report.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
  var Sum_Nar: extended;
begin
  {if (TYPE_FORM=tfsNP7) then
  if id_sch<>DSetFoundationData['id_sch'] then
  begin
      u_num:=1;
      n_num:=1;
  end; }
  if (TYPE_FORM=tfsNP7) then
    if id_sch<>DSetFoundationData['id_sch'] then
      begin
      u_num:=1;
      n_num:=1;
      end;
   if (TYPE_FORM=tfsNP6) then
    if id_sch<>DSetFoundationData['id_man'] then
      begin
      u_num:=1;
      n_num:=1;
      end;
    if UpperCase(VarName)='PKOD_SETUP' then
      begin
      Value:=KodSetupToPeriod(PKod_Setup,4);
      if (TYPE_FORM=tfsNP7) or (TYPE_FORM=tfsNP6)  then
        BEGIN
        DSetNar.Last;
        DSetUtr.Last;
        frxUserDataSet.RangeEndCount:=IfThen(DSetNar.RecordCount>DSetUtr.RecordCount,DSetNar.RecordCount,DSetUtr.RecordCount);
        //frxUserDataSet.RangeEndCount:=IfThen(DSetNar.RecordCountFromSrv>DSetUtr.RecordCountFromSrv,DSetNar.RecordCountFromSrv,DSetUtr.RecordCountFromSrv);
        frxUserDataSet.RangeEnd:=reCount;
        END
      end;

  if UpperCase(VarName)='N_NUM' then
  begin
    if DSetNar.RecordCount-1>=frxUserDataSet.RecNo then
    begin
      DSetNar.RecNo:=frxUserDataSet.RecNo+1;
      if DSetNar['IS_GROUP']='F' then
      begin
        Value:=n_num;
        n_num:=n_num+1;
      end
      else
        Value:='';
    end
    else
      Value:=NULL;
  end;
  if UpperCase(VarName)='N_NAME' then
  begin
    if DSetNar.RecordCount-1>=frxUserDataSet.RecNo then
    begin
      DSetNar.RecNo:=frxUserDataSet.RecNo+1;
      if DSetNar['IS_GROUP']='F' then
        Value:=DSetNar.FieldValues['NAME']
      else
        Value:='<b>'+DSetNar.FieldValues['NAME']+'</b>';
    end
    else
      Value:=NULL;
  end;
  if UpperCase(VarName)='N_SUMM' then
  begin
    if DSetNar.RecordCount-1>=frxUserDataSet.RecNo then
    begin
      DSetNar.RecNo:=frxUserDataSet.RecNo+1;
      if DSetNar['IS_GROUP']='F' then
        if  DSetNar.FieldValues['SUMM']<>0 then
          Value:=DSetNar.FieldValues['SUMM']
        else
          Value:=''
      else
        Value:='<b>'+FloatToStr(DSetNar.FieldValues['SUMM'])+'</b>';
    end
    else
      Value:=NULL;
  end;

    if UpperCase(VarName)='U_NUM' then
  begin
    if DSetUtr.RecordCount-1>=frxUserDataSet.RecNo then
    begin
      DSetUtr.RecNo:=frxUserDataSet.RecNo+1;
      Value:=u_num;
      u_num:=u_num+1;
    end
    else
      Value:=NULL;
  end;
  if UpperCase(VarName)='U_NAME' then
  begin
    if DSetUtr.RecordCount-1>=frxUserDataSet.RecNo then
    begin
      DSetUtr.RecNo:=frxUserDataSet.RecNo+1;
      Value:=DSetUtr.FieldValues['NAME'];
    end
    else
      Value:=NULL;
  end;
  if UpperCase(VarName)='U_SUMM' then
  begin
    if DSetUtr.RecordCount-1>=frxUserDataSet.RecNo then
    begin
      DSetUtr.RecNo:=frxUserDataSet.RecNo+1;
      if DSetUtr.FieldValues['SUMM']<>0 then
        Value:=DSetUtr.FieldValues['SUMM']
      else
        Value:='';
    end
    else
      Value:=NULL;
  end;
  if UpperCase(VarName)='N_SUMM_ALL' then
  begin
    Sum_Nar:=0;
    DSetNar.First;
    while not DSetNar.Eof do
    Begin
      if DSetNar['IS_GROUP']='F' then
        Sum_Nar:=Sum_Nar+DSetNar['SUMM'];
      DSetNar.Next;
    end;
    Value:=FloatToStrF(Sum_Nar,ffFixed,16,2);
  end;

  if UpperCase(VarName)='U_SUMM_ALL' then
  begin
    Sum_Nar:=0;
    DSetUtr.First;
    while not DSetUtr.Eof do
    Begin
      Sum_Nar:=Sum_Nar+DSetUtr['SUMM'];
      DSetUtr.Next;
    end;
    Value:=FloatToStrF(Sum_Nar,ffFixed,16,2);
  end;
  if UpperCase(VarName)='OKPO' then
  begin
    Value:=ValueFieldZSetup(DB.Handle, 'OKPO');
  end;

  if UpperCase(VarName)='FIRM_NAME_FULL' then
  begin
    Value:=ValueFieldZSetup(DB.Handle, 'FIRM_NAME_FULL');
  end;
  if (TYPE_FORM=tfsNP7)  then
    id_sch:=DSetFoundationData['id_sch'];
  if  (TYPE_FORM=tfsNP6)  then
    id_sch:=DSetFoundationData['id_man'];

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
