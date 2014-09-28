unit gr_SvodBySmDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDocs_Consts,
  TypInfo, gr_uCommonConsts, gr_uCommonProc, gr_uWaitForm,
  gr_uCommonLoader, gr_uMessage, frxExportRTF, frxExportXLS;

Type TSvodParam = record
 DB_Handle:TISC_DB_HANDLE;
 AOwner:TComponent;
 Kod_setup:integer;
 Type_data:TTypeData;
 ID_Session:integer;
end;

Type TSvodBySmParam = record
  FoundationParam : TSvodParam;
  Id_Sm : Variant;
end;

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
    UpdateTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    Report: TfrxReport;
    DSourcePropPaymGroup: TDataSource;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
    PKod_Setup:Integer;
    PLanguageIndex:byte;
  public
    function PrintSpr(AParameter:TSvodBySmParam):variant;
  end;


implementation

{$R *.dfm}

const NameReport               ='\grSvodBySm.fr3';

function TDM.PrintSpr(AParameter:TSvodBySmParam):variant;
var DateForm:tdate;
    i: byte;
    wf:TForm;
begin
 DateForm:=ConvertKodToDate(AParameter.FoundationParam.Kod_setup);
 PKod_Setup:=AParameter.FoundationParam.Kod_setup;
 PLanguageIndex := IndexLanguage;
 try
   wf:=ShowWaitForm(TForm(AParameter.FoundationParam.AOwner),wfPrepareData);
   DB.Handle:=AParameter.FoundationParam.DB_Handle;
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='GR_SVOD_PREPARE_DATA';
   StProc.Prepare;
   StProc.ParamByName('KOD_SETUP').AsInteger :=AParameter.FoundationParam.Kod_setup;
   StProc.ExecProc;
   AParameter.FoundationParam.ID_Session:=StProc.ParamByName('ID_SESSION').AsInteger;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     CloseWaitForm(wf);
     grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;

 DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM GR_SVODBYSM_SMETS('+VarToStrDef(AParameter.Id_Sm[0],'NULL')+','+VarToStr(AParameter.FoundationParam.ID_Session)+')';

 DSetCategoryGroup.SQLs.SelectSQL.Text := 'SELECT * FROM GR_SVODBYSM_CATEGORY_GROUP(?OUT_ID_SMETA,'+VarToStr(AParameter.FoundationParam.ID_Session)+')';

 DSetPropPaymGroup.SQLs.SelectSQL.Text := 'SELECT * FROM GR_SVODBYSM_PROPPAYM_GROUP(?OUT_ID_SMETA,'+IntToStr(AParameter.FoundationParam.ID_Session)+') ORDER BY SUMMA DESCENDING';

 DSetUDGroup.SQLs.SelectSQL.Text := 'SELECT * FROM GR_SVODBYSM_UD(?OUT_ID_SMETA,'+IntToStr(AParameter.FoundationParam.ID_Session)+') order by KOD_VO';

 DSetNotPodNalGroup.SQLs.SelectSQL.Text := 'SELECT * FROM GR_SVODBYSM_NOTPODNAL(?OUT_ID_SMETA,'+IntToStr(AParameter.FoundationParam.ID_Session)+',?ID_VOPL_GROUP)';

 DsetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM GR_SVODBYSM_GRSHEET(?OUT_ID_SMETA,'+IntToStr(AParameter.FoundationParam.Kod_setup)+')';


 DsetDolg.SQLs.SelectSQL.Text := 'SELECT * FROM GR_SVODBYSM_DOLG(?OUT_ID_SMETA,'+IntToStr(AParameter.FoundationParam.Kod_setup)+')';

 try
  DSetFoundationData.Open;
  for i:=1 to (VarArrayHighBound(AParameter.Id_Sm,1)-1) do
  begin
    DSetFoundationData.SQLs.InsertSQL.Text := 'SELECT * FROM GR_SVODBYSM_SMETS('+VarToStrDef(AParameter.Id_Sm[i],'NULL')+','+VarToStr(AParameter.FoundationParam.ID_Session)+')';
    DSetFoundationData.Insert;
    DSetFoundationData.Post;
  end;
  DSetCategoryGroup.Open;
  DSetPropPaymGroup.Open;
  DSetUDGroup.Open;
  DSetNotPodNalGroup.Open;
  DsetGrSheet.Open;
  DsetDolg.Open;

 except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;
 CloseWaitForm(wf);

 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+NameReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;

 if grDesignReport then Report.DesignReport
                    else Report.ShowReport;

 Report.Free;
 try
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='Z_SVOD_PREPARE_DATA_DELETE';
   StProc.Prepare;
   StProc.ParamByName('ID_SESSION').AsInteger:=AParameter.FoundationParam.ID_Session;
   StProc.ExecProc;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PKOD_SETUP' then
  Value:=KodSetupToPeriod(PKod_Setup,4);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
