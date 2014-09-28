unit SvodBySchSmDataModul;

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
    function PrintSpr(AParameter:TSvodBySchSmParam):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SvodBySchSm';
const NameReport               = 'Reports\Zarplata\SvodBySchSm.fr3';


function TDM.PrintSpr(AParameter:TSvodBySchSmParam):variant;
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
   AParameter.DataSet.First;

   if not AParameter.DataSet.Locate('TYPE_OBJECT',6,[]) then
   begin
    CloseWaitForm(wf);
    exit;  //чтобы если нет бюджетов не вызывались с пустыми значениями

   end;

   DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_SCHES_SM('+VarToStrDef(AParameter.DataSet['LINK_TO'],'NULL')+','+VarToStrDef(AParameter.DataSet['ID_SMETA'],'NULL')+','''+DateToStr(DateForm)+''','+IntToStr(AParameter.FoundationParam.ID_Session)+')';

   DSetCategoryGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_CATEGORY_GROUP_SM(?ID_SCH, :ID_SMETA,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''')';

   DSetPropPaymGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_PROPPAYM_GROUP_SM(?ID_SCH, :ID_SMETA,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''')';
   DSetUDGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_UD_SM(?ID_SCH,:ID_SMETA,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''') order by KOD_VO';
   DSetNotPodNalGroup.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_NOTPODNAL_SM(?ID_SCH,:ID_SMETA,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''')';
   DsetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_GRSHEET_SM(?ID_SCH,:ID_SMETA,'+IntToStr(AParameter.FoundationParam.Kod_setup)+')';
   DsetDolg.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SVODBYSCH_DOLG_SM(?ID_SCH,:ID_SMETA,'+IntToStr(AParameter.FoundationParam.Kod_setup)+')';
   DSetShifr.SQLs.SelectSQL.Text :=  'SELECT * FROM Z_SVODBYSCH_UD_SHIFR_SM(?ID_SCH,:ID_SMETA,'+IntToStr(AParameter.FoundationParam.ID_Session)+','''+DateToStr(DateForm)+''')';


   try
     DB.Handle:=AParameter.FoundationParam.DB_Handle;

     DSetFoundationData.Open;

     AParameter.DataSet.Next;

     while not(AParameter.dataset.Eof) do
     begin

      if  AParameter.DataSet['TYPE_OBJECT']=6 then
      begin

        DSetFoundationData.SQLs.InsertSQL.Text := 'SELECT * FROM Z_SVODBYSCH_SCHES_SM('+VarToStrDef(AParameter.DataSet['LINK_TO'],'NULL')+','+VarToStrDef(AParameter.DataSet['ID_SMETA'],'NULL')+','''+DateToStr(DateForm)+''','+IntToStr(AParameter.FoundationParam.ID_Session)+')';
        DSetFoundationData.Insert;
        DSetFoundationData.Post;

      end;

      AParameter.dataset.Next;

     end;

     DSetCategoryGroup.Open;

     DSetPropPaymGroup.Open;

     DSetUDGroup.Open;

     DSetNotPodNalGroup.Open;

     DsetGrSheet.Open;

     DsetDolg.Open;

     DSetShifr.Open;


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

  if UpperCase(VarName)='PKOD_SETUP' then
  begin
    Value:=KodSetupToPeriod(PKod_Setup,4);
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


end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
