unit RaschVedPrintDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, frxClass, frxDesgn, frxDBSet, IBase, ZMessages, IniFiles,
  ZProc, Forms,Unit_PrintAccList_Consts, Variants, Dates, Dialogs,
  ZSvodTypesUnit, frxExportXLS, frxExportHTML, frxExportPDF, FIBQuery,
  pFIBQuery, pFIBStoredProc, UnitZarplataConsts, frxExportTXT;

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
    frxXLSExport1: TfrxXLSExport;
    PDFExport: TfrxPDFExport;
    HTMLExport: TfrxHTMLExport;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    DSetParent: TpFIBDataSet;
    DBDSetParent: TfrxDBDataset;
    DSourceParent: TDataSource;
    TXTExport: TfrxTXTExport;
    DSetGlobalData1: TpFIBDataSet;
    DSetAccNarList1: TpFIBDataSet;
    DSetAccUdList1: TpFIBDataSet;
    DSetSheets1: TpFIBDataSet;
    DSourceGlobalData1: TDataSource;
    DSetGlobalData0: TpFIBDataSet;
    DSetAccNarList0: TpFIBDataSet;
    DSetAccUdList0: TpFIBDataSet;
    DSetSheets0: TpFIBDataSet;
    DSetParent0: TpFIBDataSet;
    DSourceGlobalData0: TDataSource;
    frxDSetGlobalData1: TfrxDBDataset;
    UDSNarUderg1: TfrxUserDataSet;
    frxDSetSheets1: TfrxDBDataset;
    DBDSetParent0: TfrxDBDataset;
    frxDSetGlobalData0: TfrxDBDataset;
    UDSNarUderg0: TfrxUserDataSet;
    frxDSetSheets0: TfrxDBDataset;
    DSourceParent0: TDataSource;
    UDSMan: TfrxUserDataSet;
    UDSNarUderg: TfrxUserDataSet;
    UDSSheets: TfrxUserDataSet;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
    function DayClocks(Sender:TObject):String;
  private
    PComingLeavingText:string;
    PType:integer;
    PKod_Setup:integer;
    PLanguageIndex:byte;
    PParameter:TZAccListParameter;
  public
    function ReportCreate(AParameter:TZAccListParameter):variant;
    function ReportCreateShort(AParameter:TZAccListParameter):variant;
  end;

implementation

uses RaschVedMainDM;

{$R *.dfm}
const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'AccList';
const FullNameReport           = 'Reports\Zarplata\AccList.fr3';
const FullNameReportShort      = 'Reports\Zarplata\AccListShort.fr3';
const FullNameReportShortAll   = 'Reports\Zarplata\AccListShortAll.fr3';
const FullNameReportVUZ        = 'Reports\Zarplata\AccListVUZ.fr3';
const FullNameReportTabulka        = 'Reports\Zarplata\AccListTabulka.fr3';
const FullNameReportTabulkaNoDep        = 'Reports\Zarplata\AccListTabulkaNoDep.fr3';
const FullNameReportShortAllAndOne = 'Reports\Zarplata\AccListShortAllAndOne.fr3';

function TPrintDM.ReportCreate(AParameter:TZAccListParameter):variant;
var IniFile:TIniFile;
    ViewMode:byte;
    PathReport:string;
    IsUniver:variant;
    FIO:string;
    n:integer;
begin
 PParameter :=AParameter;
 PLanguageIndex:=LanguageIndex;
 IsUniver:=ValueFieldZSetup(AParameter.DB_Handle,'IS_UNIVER');
 if VarIsNull(IsUniver) then IsUniver:='F';
 PType:=0;
 if((AParameter.Id_Group_Account=-1)and(AParameter.Id_Department=-1))then
   PType:=1;
try
 DB.Handle:=AParameter.DB_handle;
 if AParameter.Id_Man<0 then
 begin
   DSetParent.SQLs.SelectSQL.Text     := 'SELECT DISTINCT * FROM Z_RASCHVED_DEPARTMENT_FILTER_S('+IntToStr(AParameter.ID_Session) +
   ' , ' + IntToStr(AParameter.ID_SESSION_FILTER_DEP)+') ORDER BY KOD_DEPARTMENT';  //отфильтрованные записи и по выбранным
   DSetGlobalData.DataSource:=DSourceParent;

   DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_S('+IntToStr(AParameter.Id_Session)+',?ID_MAN,'+
                                                                        IntToStr(AParameter.Kod_Setup)+',2) ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
   DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_S('+IntToStr(AParameter.Id_Session)+',?ID_MAN,'+
                                                                        IntToStr(AParameter.Kod_Setup)+',2) ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
   DSetPrivileges.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_PRIV_S(?ID_MAN,'+
                                                                         IntToStr(AParameter.Kod_Setup)+')';
   DSetShtatRas.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_MAN_MOVING_S(?ID_MAN,'+
                                                                             IntToStr(AParameter.Kod_Setup)+')';

   if(AParameter.TypeData=3)then
     DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE_SHIFR('+IfThen(AParameter.Id_Department<>-1,IntToStr(AParameter.Id_Department),'null')+','+
                                                                                        IntToStr(AParameter.Id_Session)+') order by tn'
   else
     DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE('+':ID_DEPARTMENT'+','+
                                                                                  IntToStr(AParameter.Id_Session)+') order by tn';

     {DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE_FILTER('+IntToStr(AParameter.Id_Session)+','+
                                                                                  IntToStr(AParameter.ID_SESSION_FILTER_DEP)+') order by tn';}

   DSetComingLeaving.SQLs.SelectSQL.Text :='SELECT * FROM Z_MAN_COMING_LEAVING(?ID_MAN,'+
                                                                         IntToStr(AParameter.Kod_Setup)+') order by REAL_DATE';
   DSetSmetaList.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_SMETA_S(?ID_GROUP_ACCOUNT,?ID_MAN,'+
                                                                             IntToStr(AParameter.Kod_Setup)+',0)'; // ORDER BY ID_DEPARTMENT,ID_SMETA';
   DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET(?ID_MAN,?ID_GROUP_ACCOUNT)';
 end
 else
 begin
   DSetGlobalData.DataSource:=nil;
   if((AParameter.Id_Group_Account=-1)and(AParameter.Id_Department<>-1))then
   begin
     DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_S(?ID_GROUP_ACCOUNT,'+IntToStr(AParameter.Id_Man)+','+
                                                                          '?KOD_SETUP1,?TYPE_TABLE) ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
     DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_S(?ID_GROUP_ACCOUNT,'+IntToStr(AParameter.Id_Man)+','+
                                                                          '?KOD_SETUP1,?TYPE_TABLE) ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
     DSetPrivileges.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_PRIV_S('+IntToStr(AParameter.Id_Man)+','+
                                                                           '?KOD_SETUP1)';
     DSetShtatRas.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_MAN_MOVING_S('+IntToStr(AParameter.Id_Man)+','+
                                                                               '?KOD_SETUP1)';
     DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE_PERIOD('+IntToStr(AParameter.Id_Man)+','+
                                                                                       IntToStr(AParameter.Kod_setup)+','+IntToStr(AParameter.Id_Department)+') order by tn';
     DSetComingLeaving.SQLs.SelectSQL.Text :='SELECT * FROM Z_MAN_COMING_LEAVING('+IntToStr(AParameter.Id_Man)+','+'?KOD_SETUP1) order by REAL_DATE';
     DSetSmetaList.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_SMETA_S(?ID_GROUP_ACCOUNT,'+IntToStr(AParameter.Id_Man)+','+
                                                                            '?KOD_SETUP1,?TYPE_TABLE)'; // ORDER BY ID_DEPARTMENT,ID_SMETA';
     DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET('+IntToStr(AParameter.Id_Man)+','+'?ID_GROUP_ACCOUNT)';
   end
   else
   begin
     DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                              IntToStr(AParameter.Id_Man)+','+
                                                                              IntToStr(AParameter.Kod_Setup)+','+
                                                                              IntToStr(AParameter.TypeData)+') ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
     DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                            IntToStr(AParameter.Id_Man)+','+
                                                                            IntToStr(AParameter.Kod_Setup)+','+
                                                                            IntToStr(AParameter.TypeData)+') order by KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
     DSetPrivileges.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_PRIV_S('+IntToStr(AParameter.Id_Man)+','+
                                                                           IntToStr(AParameter.Kod_Setup)+')';
     DSetShtatRas.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_MAN_MOVING_S('+IntToStr(AParameter.Id_Man)+','+
                                                                               IntToStr(AParameter.Kod_Setup)+')';
     DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_GLOBALDATA_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                                IntToStr(AParameter.Id_Man)+','+
                                                                                IntToStr(AParameter.Kod_Setup)+')';
     DSetComingLeaving.SQLs.SelectSQL.Text :='SELECT * FROM Z_MAN_COMING_LEAVING('+IntToStr(AParameter.Id_Man)+','+
                                                                           IntToStr(AParameter.Kod_Setup)+') order by REAL_DATE';
     DSetSmetaList.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_SMETA_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                              IntToStr(AParameter.Id_Man)+','+
                                                                              IntToStr(AParameter.Kod_Setup)+','+
                                                                              IntToStr(AParameter.TypeData)+')'; // GROUP BY ID_DEPARTMENT,ID_SMETA, SMETA_TITLE, NAME_SHORT, P1';
     DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET('+IntToStr(AParameter.Id_Man)+','+IntToStr(AParameter.Id_Group_Account)+')';
   end;
 end;

 DSetSystemData.SQLs.SelectSQL.Text := 'SELECT SHORT_NAME FROM Z_SETUP';


if AParameter.Id_Man<0 then DSetParent.Open;

 DSetGlobalData.Open;
 DSetGlobalData.FetchAll;

 DSetAccNarList.Open;
 DSetAccNarList.FetchAll;

 DSetAccUdList.Open;
 DSetAccUdList.FetchAll;

 DSetPrivileges.Open;
 DSetPrivileges.FetchAll;

 DSetShtatRas.Open;
 DSetShtatRas.FetchAll;

 DSetSystemData.Open;
 DSetSystemData.FetchAll;

 DSetComingLeaving.Open;
 DSetComingLeaving.FetchAll;


 if IsUniver='T' then
  begin
   DSetSmetaList.Open;
   DSetSmetaList.FetchAll;

   DSetSheets.Open;
   DSetSheets.FetchAll;
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
//if IsUniver='T' then
   //PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',FullNameReportTabulka);

if AParameter.Id_Man<0 then PathReport:=FullNameReportTabulka
else  PathReport:=FullNameReportTabulkaNoDep;

//PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',FullNameReport);

 IniFile.Free;

 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 if ((PathReport=FullNameReportTabulkaNoDep) and (AParameter.Id_Group_Account<>-1)) then
  Report.PreviewOptions.Zoom:=1.5
 else
  Report.PreviewOptions.Zoom:=1;

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
 if(AParameter.Id_Man>=0) and (AParameter.Id_Group_Account=-1)then
   Report.Variables['P_ACCLIST']:=null else
   if(AParameter.Id_Man>0)then
   begin
     if(DSetGlobalData['KOD_SETUP1']<>AParameter.Kod_Setup)then
       Report.Variables['P_ACCLIST']:='''Перерахунок за '+AnsiLowerCase(KodSetupToPeriod(DSetGlobalData['KOD_SETUP1'],2))+''''
     else
       Report.Variables['P_ACCLIST']:=''''+FZPrintAccList_P_AccList_Title+' '+AnsiLowerCase(KodSetupToPeriod(AParameter.Kod_Setup,2))+'''';
   end else
     Report.Variables['P_ACCLIST']:=''''+FZPrintAccList_P_AccList_Title+' '+AnsiLowerCase(KodSetupToPeriod(AParameter.Kod_Setup,2))+'''';
 Report.Variables['P_FROM']:=''''+FZPrintAccList_P_From_Text+'''';
 Report.Variables['P_SUMMARY']:=''''+FZPrintAccList_P_Summary_Text+'''';

 if((AParameter.Path<>'')and(AParameter.Path<>null))then
 begin
   try
     StProc.Transaction.StartTransaction;
     StProc.StoredProcName:='Z_FIO_BY_ID_MAN';
     StProc.Prepare;
     StProc.ParamByName('ID_MAN').AsInteger:=AParameter.Id_Man;
     StProc.ExecProc;
     FIO:=StProc.ParamByName('FIO').AsString;
     StProc.Transaction.Commit;
   except
     on E:Exception do
     begin
       ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
       WriteTransaction.Rollback;
     end;
   end;

   AParameter.Path:=AParameter.Path+IntToSTr(YearMonthFromKodSetup(AParameter.Kod_setup,true))+'-'
                                   +IfThen(YearMonthFromKodSetup(AParameter.Kod_setup,false)<10,'0'+IntToSTr(YearMonthFromKodSetup(AParameter.Kod_setup,false)),IntToSTr(YearMonthFromKodSetup(AParameter.Kod_setup,false)))+' ';
   n:=Pos(' ',Fio);
   AParameter.Path:=AParameter.Path+TransliterationUkrEng(Copy(Fio,1,n-1))+'_'+TransliterationUkrEng(Copy(Fio,n+1,1))+'_';
   Fio:=Copy(Fio,n+1,Length(Fio));
   n:=Pos(' ',Fio);
   AParameter.Path:=AParameter.Path+TransliterationUkrEng(Copy(Fio,n+1,1))+'.pdf';

   PDFExport.FileName:=AParameter.Path;
   HTMLExport.FileName:=AParameter.Path;
   Report.PrepareReport(true);
   if(AParameter.TypeOper=1)then
     Report.Export(PDFExport);
   if(AParameter.TypeOper=2)then
     Report.Export(HTMLExport);
 end else
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;


 Report.Free;
except
 on E:Exception do
  begin
   ZShowMessage(FZPrintAccList_Error_Caption,e.Message,mtError,[mbOK]);
  end;
end;
ReportCreate:=AParameter.Path;
end;

function TPrintDM.ReportCreateShort(AParameter:TZAccListParameter):variant;
var IniFile:TIniFile;
    ViewMode:byte;
    PathReport:string;
    IsUniver:variant;
    FIO:string;
    n:integer;
begin
 PParameter :=AParameter;
 PLanguageIndex:=LanguageIndex;
 IsUniver:=ValueFieldZSetup(AParameter.DB_Handle,'IS_UNIVER');
 if VarIsNull(IsUniver) then IsUniver:='F';
 {PType:=0;
 if((AParameter.Id_Group_Account=-1)and(AParameter.Id_Department=-1))then
   PType:=1;  }
try
 DB.Handle:=AParameter.DB_handle;
 if AParameter.Id_Man<0 then
 begin

   if(AParameter.TypeData=6)then
   begin
     DSetParent0.SQLs.SelectSQL.Text     := 'SELECT DISTINCT * FROM Z_RASCHVED_DEPARTMENT_FILTER_S('+IntToStr(AParameter.ID_Session) +
     ' , ' + IntToStr(AParameter.ID_SESSION_FILTER_DEP)+') ORDER BY KOD_DEPARTMENT';  //отфильтрованные записи и по выбранным
     DSetGlobalData0.DataSource:=DSourceParent0;
     DSetAccNarList0.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_SHORT_S('+IntToStr(AParameter.Id_Session)+','+
                                                                              '?ID_MAN,'+
                                                                              IntToStr(AParameter.Kod_Setup)+',2) ORDER BY KOD_SETUP3 descending,NAME_VIDOPL';
     DSetAccUdList0.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_SHORT_S('+IntToStr(AParameter.Id_Session)+','+
                                                                            '?ID_MAN,'+
                                                                            IntToStr(AParameter.Kod_Setup)+',2) order by KOD_SETUP3 descending,NAME_VIDOPL';
     DSetGlobalData0.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE_SHORT(?ID_DEPARTMENT,'+
                                                                                  IntToStr(AParameter.Id_Session)+' ,0) order by FIO';
     DSetSheets0.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET_SHORT(?ID_MAN,?ID_GROUP_ACCOUNT)';


     {DSetParent1.SQLs.SelectSQL.Text     := 'SELECT DISTINCT * FROM Z_RASCHVED_DEPARTMENT_FILTER_S('+IntToStr(AParameter.ID_Session) +
     ' , ' + IntToStr(AParameter.ID_SESSION_FILTER_DEP)+') ORDER BY KOD_DEPARTMENT'; } //отфильтрованные записи и по выбранным
     DSetGlobalData1.DataSource:=DSourceParent0;
     DSetAccNarList1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_SHORT_S('+IntToStr(AParameter.Id_Session)+','+
                                                                              '?ID_MAN,'+
                                                                              IntToStr(AParameter.Kod_Setup)+',2) ORDER BY KOD_SETUP3 descending,NAME_VIDOPL';
     DSetAccUdList1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_SHORT_S('+IntToStr(AParameter.Id_Session)+','+
                                                                            '?ID_MAN,'+
                                                                            IntToStr(AParameter.Kod_Setup)+',2) order by KOD_SETUP3 descending,NAME_VIDOPL';
     DSetGlobalData1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE_SHORT(?ID_DEPARTMENT,'+
                                                                                  IntToStr(AParameter.Id_Session)+' ,1) order by FIO';
     DSetSheets1.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET_SHORT(?ID_MAN,?ID_GROUP_ACCOUNT)';

   end
   else
   begin

     DSetParent.SQLs.SelectSQL.Text     := 'SELECT DISTINCT * FROM Z_RASCHVED_DEPARTMENT_FILTER_S('+IntToStr(AParameter.ID_Session) +
     ' , ' + IntToStr(AParameter.ID_SESSION_FILTER_DEP)+') ORDER BY KOD_DEPARTMENT';  //отфильтрованные записи и по выбранным
     DSetGlobalData.DataSource:=DSourceParent;
     DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_SHORT_S('+IntToStr(AParameter.Id_Session)+','+
                                                                                '?ID_MAN,'+
                                                                                IntToStr(AParameter.Kod_Setup)+',2) ORDER BY KOD_SETUP3 descending,NAME_VIDOPL';
     DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_SHORT_S('+IntToStr(AParameter.Id_Session)+','+
                                                                              '?ID_MAN,'+
                                                                              IntToStr(AParameter.Kod_Setup)+',2) order by KOD_SETUP3 descending,NAME_VIDOPL';
     DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE_SH_FULL(?ID_DEPARTMENT,'+
                                                                                    IntToStr(AParameter.Id_Session)+') order by FIO';
     DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET_SHORT(?ID_MAN,?ID_GROUP_ACCOUNT)';
     DSetParent.Open;
     DSetParent.FetchAll;
   end
 end
 else
{   if((AParameter.Id_Group_Account=-1)and(AParameter.Id_Department<>-1))then
   begin
     DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_S(?ID_GROUP_ACCOUNT,'+IntToStr(AParameter.Id_Man)+','+
                                                                          '?KOD_SETUP1,?TYPE_TABLE) ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
     DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_S(?ID_GROUP_ACCOUNT,'+IntToStr(AParameter.Id_Man)+','+
                                                                          '?KOD_SETUP1,?TYPE_TABLE) ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
     DSetPrivileges.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_PRIV_S('+IntToStr(AParameter.Id_Man)+','+
                                                                           '?KOD_SETUP1)';
     DSetShtatRas.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_MAN_MOVING_S('+IntToStr(AParameter.Id_Man)+','+
                                                                               '?KOD_SETUP1)';
     DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_RASCHVED_LISTPEOPLE_PERIOD('+IntToStr(AParameter.Id_Man)+','+
                                                                                       IntToStr(AParameter.Kod_setup)+','+IntToStr(AParameter.Id_Department)+') order by tn';
     DSetComingLeaving.SQLs.SelectSQL.Text :='SELECT * FROM Z_MAN_COMING_LEAVING('+IntToStr(AParameter.Id_Man)+','+'?KOD_SETUP1) order by REAL_DATE';
     DSetSmetaList.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_SMETA_S(?ID_GROUP_ACCOUNT,'+IntToStr(AParameter.Id_Man)+','+
                                                                            '?KOD_SETUP1,?TYPE_TABLE)'; // ORDER BY ID_DEPARTMENT,ID_SMETA';
     DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET('+IntToStr(AParameter.Id_Man)+','+'?ID_GROUP_ACCOUNT)';
   end
   else
   begin }
 begin
   DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_SHORT_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                            IntToStr(AParameter.Id_Man)+','+
                                                                            IntToStr(AParameter.Kod_Setup)+','+
                                                                            IntToStr(AParameter.TypeData)+') ORDER BY KOD_SETUP3 descending,NAME_VIDOPL';
   DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_SHORT_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                            IntToStr(AParameter.Id_Man)+','+
                                                                            IntToStr(AParameter.Kod_Setup)+','+
                                                                            IntToStr(AParameter.TypeData)+') order by KOD_SETUP3 descending,NAME_VIDOPL';
   DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_GLOBALDATA_SHORT_S('+IntToStr(AParameter.Id_Group_Account)+','+
                                                                            IntToStr(AParameter.Id_Man)+','+
                                                                            IntToStr(AParameter.Kod_Setup)+')';
   DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET_SHORT('+IntToStr(AParameter.Id_Man)+','+IntToStr(AParameter.Id_Group_Account)+')';
{   end;}
 end;



 if(AParameter.TypeData=6)then
 begin
  //DSetParent1.Open;
  DSetParent0.Open;
  DSetParent0.fetchAll;

  
  DSetGlobalData0.Open;
  DSetGlobalData0.fetchAll;

  DSetAccNarList0.Open;
  DSetAccNarList0.fetchAll;

  DSetAccUdList0.Open;
  DSetAccUdList0.fetchAll;

  DSetSheets0.Open;
  DSetSheets0.fetchAll;



  DSetGlobalData1.Open;
  DSetGlobalData1.fetchAll;

  DSetAccNarList1.Open;
  DSetAccNarList1.fetchAll;

  DSetAccUdList1.Open;
  DSetAccUdList1.fetchAll;

  DSetSheets1.Open;
  DSetSheets1.fetchAll;


  UDSMan.Fields.Add('TN1');
  UDSMan.Fields.Add('FIO1');
  UDSMan.Fields.Add('BIRTH_DATE1');

  UDSMan.Fields.Add('TN2');
  UDSMan.Fields.Add('FIO2');
  UDSMan.Fields.Add('BIRTH_DATE2');




  UDSNarUderg.Fields.Add('N_KOD_SETUP_31');
  UDSNarUderg.Fields.Add('N_KOD_SM1');
  UDSNarUderg.Fields.Add('N_NAME_VIDOPL1');
  UDSNarUderg.Fields.Add('N_DAY_CLOCK_SHORT1');
  UDSNarUderg.Fields.Add('N_SUMMA1');
  UDSNarUderg.Fields.Add('U_KOD_SETUP_31');
  UDSNarUderg.Fields.Add('U_NAME_VIDOPL1');
  UDSNarUderg.Fields.Add('U_SUMMA1');


  UDSNarUderg.Fields.Add('N_KOD_SETUP_32');
  UDSNarUderg.Fields.Add('N_KOD_SM2');
  UDSNarUderg.Fields.Add('N_NAME_VIDOPL2');
  UDSNarUderg.Fields.Add('N_DAY_CLOCK_SHORT2');
  UDSNarUderg.Fields.Add('N_SUMMA2');
  UDSNarUderg.Fields.Add('U_KOD_SETUP_32');
  UDSNarUderg.Fields.Add('U_NAME_VIDOPL2');
  UDSNarUderg.Fields.Add('U_SUMMA2');


  UDSSheets.Fields.Add('TYPE_SHEET1');
  UDSSheets.Fields.Add('SUMA_SHEET1');
  UDSSheets.Fields.Add('SMETA_KOD1');
  UDSSheets.Fields.Add('SMETA_NAME1');


  UDSSheets.Fields.Add('TYPE_SHEET2');
  UDSSheets.Fields.Add('SUMA_SHEET2');
  UDSSheets.Fields.Add('SMETA_KOD2');
  UDSSheets.Fields.Add('SMETA_NAME2');





 end
 else
 begin
  DSetGlobalData.Open;
  DSetAccNarList.Open;
  DSetAccUdList.Open;
  DSetSheets.Open;

  frxUserDataSet.Fields.Add('N_KOD_SETUP_3');
  frxUserDataSet.Fields.Add('N_KOD_SM');
  frxUserDataSet.Fields.Add('N_NAME_VIDOPL');
  frxUserDataSet.Fields.Add('N_DAY_CLOCK');
  frxUserDataSet.Fields.Add('N_SUMMA');
  frxUserDataSet.Fields.Add('U_KOD_SETUP_3');
  frxUserDataSet.Fields.Add('U_NAME_VIDOPL');
  frxUserDataSet.Fields.Add('U_SUMMA');
 end;




 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 if(AParameter.TypeData=4)then
   PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',FullNameReportShortAll)
 else if(AParameter.TypeData=6)then
   PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',FullNameReportShortAllAndOne)
 else
   PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',FullNameReportShort);
 IniFile.Free;

 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables['P_KOD_SETUP_3']:=''''+FZPrintAccList_P_KOD_SETUP_3_Text+'''';
 Report.Variables['P_NAME_VIDOPL']:=''''+FZPrintAccList_P_NAME_VIDOPL_Text+'''';
 Report.Variables['P_DAY_CLOCK']:='''Дні''';
 Report.Variables['P_SUMMA']:=''''+FZPrintAccList_P_SUMMA_Text+'''';
 Report.Variables['P_NAR']:=''''+FZPrintAccList_P_Nar_Text+'''';
 Report.Variables['P_UD']:=''''+FZPrintAccList_P_Ud_Text+'''';
 Report.Variables['P_ACCLIST_TYPE']:=NULL;
 Report.Variables['FORCOUNTRECORDOFUDSMAN']:=null;
 Report.Variables['P_ACCLIST_SHORT']:='''Відомість аналітичного контролю за '+AnsiLowerCase(KodSetupToPeriod(AParameter.Kod_Setup,2))+'''';
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
ReportCreateShort:=AParameter.Path;
end;

procedure TPrintDM.ReportGetValue(const VarName: String;
  var Value: Variant);
var PValue:Variant;
    Sum_Nar,Sum_Ud:Extended;
    Sign:string[1];
    P_ACCLIST_SHORT1,P_ACCLIST_SHORT2:Integer;
begin

if(PParameter.TypeData=6)then
  begin
    
   if UpperCase(VarName)='TN1' then
    begin
      if DSetGlobalData0.RecordCount-1>=UDSMan.RecNo then
       begin
        DSetGlobalData0.RecNo:=UDSMan.RecNo+1;
        Value:=DSetGlobalData0.FieldValues['TN'];



        Exit;
       end
      else
        begin
          Value:=NULL;
          Exit;
        end
    end;

    if UpperCase(VarName)='FIO1' then
    begin
      if DSetGlobalData0.RecordCount-1>=UDSMan.RecNo then
       begin
        DSetGlobalData0.RecNo:=UDSMan.RecNo+1;
        Value:=DSetGlobalData0.FieldValues['FIO'];
        Exit;
       end
      else
        begin
          Value:=NULL;
          Exit;
        end
    end;

    if UpperCase(VarName)='BIRTH_DATE1' then
    begin
      if DSetGlobalData0.RecordCount-1>=UDSMan.RecNo then
       begin
        DSetGlobalData0.RecNo:=UDSMan.RecNo+1;
        Value:=DSetGlobalData0.FieldValues['BIRTH_DATE'];
        Exit;
       end
      else
        begin
          Value:=NULL;
          Exit;
        end
    end;

    if UpperCase(VarName)='TN2' then
    begin
      if DSetGlobalData1.RecordCount-1>=UDSMan.RecNo then
       begin
        DSetGlobalData1.RecNo:=UDSMan.RecNo+1;
        Value:=DSetGlobalData1.FieldValues['TN'];

              DSetSheets0.FetchAll;
              DSetSheets1.FetchAll;
              DSetAccNarList0.FetchAll;
              DSetAccNarList1.FetchAll;
              DSetAccUdList0.FetchAll;
              DSetAccUdList1.FetchAll;
              
              P_ACCLIST_SHORT1:=IfThen(DSetAccNarList0.RecordCount>DSetAccNarList1.RecordCount,DSetAccNarList0.RecordCount,DSetAccNarList1.RecordCount);
              P_ACCLIST_SHORT2:=IfThen(DSetAccUdList0.RecordCount>DSetAccUdList1.RecordCount,DSetAccUdList1.RecordCount,DSetAccUdList1.RecordCount);
              UDSNarUderg.RangeEndCount:=IfThen(P_ACCLIST_SHORT1>P_ACCLIST_SHORT2,P_ACCLIST_SHORT1,P_ACCLIST_SHORT2);
              UDSNarUderg.RangeEnd:=reCount;

              P_ACCLIST_SHORT1:=IfThen(DSetSheets0.RecordCount>DSetSheets1.RecordCount, DSetSheets0.RecordCount, DSetSheets1.RecordCount);
              P_ACCLIST_SHORT2:=IfThen(DSetSheets0.RecordCount>DSetSheets1.RecordCount, DSetSheets0.RecordCount, DSetSheets1.RecordCount);
              UDSSheets.RangeEndCount:=IfThen(P_ACCLIST_SHORT1>P_ACCLIST_SHORT2,P_ACCLIST_SHORT1,P_ACCLIST_SHORT2);
              UDSSheets.RangeEnd:=reCount;


        Exit;
       end
      else
        begin
          Value:=NULL;
          Exit;
        end
    end;

    if UpperCase(VarName)='FIO2' then
    begin
      if DSetGlobalData1.RecordCount-1>=UDSMan.RecNo then
       begin
        DSetGlobalData1.RecNo:=UDSMan.RecNo+1;
        Value:=DSetGlobalData1.FieldValues['FIO'];
        Exit;
       end
      else
        begin
          Value:=NULL;
          Exit;
        end
    end;


    if UpperCase(VarName)='BIRTH_DATE2' then
    begin
      if DSetGlobalData1.RecordCount-1>=UDSMan.RecNo then
       begin
        DSetGlobalData1.RecNo:=UDSMan.RecNo+1;
        Value:=DSetGlobalData1.FieldValues['BIRTH_DATE'];
        Exit;
       end
      else
        begin
          Value:=NULL;
          Exit;
        end
    end;

    if UpperCase(VarName)='FORCOUNTRECORDOFUDSMAN' then
    begin

      DSetGlobalData0.fetchAll;
      DSetGlobalData1.fetchAll;
      UDSMan.RangeEndCount:=IfThen(DSetGlobalData0.RecordCount>DSetGlobalData1.RecordCount,DSetGlobalData0.RecordCount,DSetGlobalData1.RecordCount);
      UDSMan.RangeEnd:=reCount;
      
    end;



    if UpperCase(VarName)='P_ACCLIST_SHORT' then
    begin

{      P_ACCLIST_SHORT1:=IfThen(DSetAccNarList0.RecordCount>DSetAccNarList1.RecordCount,DSetAccNarList0.RecordCount,DSetAccNarList1.RecordCount);
      P_ACCLIST_SHORT2:=IfThen(DSetAccUdList0.RecordCount>DSetAccUdList1.RecordCount,DSetAccUdList0.RecordCount,DSetAccUdList1.RecordCount);
      UDSNarUderg.RangeEndCount:=IfThen(P_ACCLIST_SHORT1>P_ACCLIST_SHORT2,P_ACCLIST_SHORT1,P_ACCLIST_SHORT2);
      UDSNarUderg.RangeEnd:=reCount;
      ShowMessage('UDSNarUderg.RangeEndCount'+' '+inttostr(UDSNarUderg.RangeEndCount));
      P_ACCLIST_SHORT1:=IfThen(DSetSheets0.RecordCount>DSetSheets1.RecordCount, DSetSheets0.RecordCount, DSetSheets1.RecordCount);
      P_ACCLIST_SHORT2:=IfThen(DSetSheets0.RecordCount>DSetSheets1.RecordCount, DSetSheets0.RecordCount, DSetSheets1.RecordCount);
      UDSSheets.RangeEndCount:=IfThen(P_ACCLIST_SHORT1>P_ACCLIST_SHORT2,P_ACCLIST_SHORT1,P_ACCLIST_SHORT2);
      UDSSheets.RangeEnd:=reCount;
      ShowMessage('UDSSheets.RangeEndCount'+' '+inttostr(UDSSheets.RangeEndCount));       }
    end;



    if UpperCase(VarName)='N_KOD_SETUP_31' then
     begin
      if DSetAccNarList0.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList0.RecNo:=UDSNarUderg.RecNo+1;
        Value:=KodSetupToPeriod(DSetAccNarList0['KOD_SETUP3'],1);
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='N_KOD_SM1' then
     begin
      if DSetAccNarList0.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList0.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccNarList0['KOD_SMETA'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='N_NAME_VIDOPL1' then
     begin
      if DSetAccNarList0.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList0.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccNarList0.FieldValues['NAME_VIDOPL'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='N_DAY_CLOCK_SHORT1' then
     begin
      if DSetAccNarList0.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList0.RecNo:=UDSNarUderg.RecNo+1;
        if (DSetAccNarList0['NDAY']=0) or (VarIsNull(DSetAccNarList0['NDAY'])) then Value:=''
        else
        begin
          sign:=IfThen(DSetAccNarList0['NDAY']<0,'-','');
          PValue:=Abs(DSetAccNarList0['NDAY']);
          Value:=Sign+ifThen(PValue<10,'0','')+VarToStr(PValue);
        end;
       end
      else
       Value:=NULL;
     end;


     if UpperCase(VarName)='N_SUMMA1' then
     begin
      if DSetAccNarList0.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList0.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccNarList0.FieldValues['SUMMA'];;
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='U_KOD_SETUP_31' then
     begin
      if DSetAccUdList0.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccUdList0.RecNo:=UDSNarUderg.RecNo+1;
        Value:=KodSetupToPeriod(DSetAccUdList0['KOD_SETUP3'],1);;;
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='U_NAME_VIDOPL1' then
     begin
      if DSetAccUdList0.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccUdList0.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccUdList0.FieldValues['NAME_VIDOPL'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='U_SUMMA1' then
     begin
      if DSetAccUdList0.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccUdList0.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccUdList0.FieldValues['SUMMA'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


      ////2


     if UpperCase(VarName)='N_KOD_SETUP_32' then
     begin
      if DSetAccNarList1.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList1.RecNo:=UDSNarUderg.RecNo+1;
        Value:=KodSetupToPeriod(DSetAccNarList1['KOD_SETUP3'],1);
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='N_KOD_SM2' then
     begin
      if DSetAccNarList1.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList1.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccNarList1['KOD_SMETA'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='N_NAME_VIDOPL2' then
     begin
      if DSetAccNarList1.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList1.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccNarList1.FieldValues['NAME_VIDOPL'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

    if UpperCase(VarName)='N_DAY_CLOCK_SHORT2' then
    begin
      if DSetAccNarList1.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList1.RecNo:=UDSNarUderg.RecNo+1;
        if (DSetAccNarList1['NDAY']=0) or (VarIsNull(DSetAccNarList1['NDAY'])) then Value:=''
        else
        begin
          sign:=IfThen(DSetAccNarList1['NDAY']<0,'-','');
          PValue:=Abs(DSetAccNarList1['NDAY']);
          Value:=Sign+ifThen(PValue<10,'0','')+VarToStr(PValue);
        end;
       end
      else
       Value:=NULL;
    end;


     if UpperCase(VarName)='N_SUMMA2' then
     begin
      if DSetAccNarList1.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccNarList1.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccNarList1.FieldValues['SUMMA'];;
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='U_KOD_SETUP_32' then
     begin
      if DSetAccUdList1.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccUdList1.RecNo:=UDSNarUderg.RecNo+1;
        Value:=KodSetupToPeriod(DSetAccUdList1['KOD_SETUP3'],1);;;
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='U_NAME_VIDOPL2' then
     begin
      if DSetAccUdList1.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccUdList1.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccUdList1.FieldValues['NAME_VIDOPL'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='U_SUMMA2' then
     begin
      if DSetAccUdList1.RecordCount-1>=UDSNarUderg.RecNo then
       begin
        DSetAccUdList1.RecNo:=UDSNarUderg.RecNo+1;
        Value:=DSetAccUdList1.FieldValues['SUMMA'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     
     ///footer


     if UpperCase(VarName)='P_SUM_NAR1' then
     begin
      Sum_Nar:=0;
      DSetAccNarList0.First;
      while not DSetAccNarList0.Eof do
       Begin
        Sum_Nar:=Sum_Nar+IfThen(DSetAccNarList0['SUMMA']<>NULL,DSetAccNarList0['SUMMA'],0);
        DSetAccNarList0.Next;
       end;
      Value:=FloatToStrF(Sum_Nar,ffFixed,16,2);
     end;

    if UpperCase(VarName)='P_SUM_UD1' then
     begin
      Sum_Ud:=0;
      DSetAccUdList0.First;
      while not DSetAccUdList0.Eof do
       Begin
        Sum_Ud:=Sum_Ud+IfThen(DSetAccUdList0['SUMMA']<>NULL,DSetAccUdList0['SUMMA'],0);
        DSetAccUdList0.Next;
       end;
      Value :=FloatToStrF(Sum_Ud,ffFixed,16,2);
     end;


     if UpperCase(VarName)='P_SUM_NAR2' then
     begin
      Sum_Nar:=0;
      DSetAccNarList1.First;
      while not DSetAccNarList1.Eof do
       Begin
        Sum_Nar:=Sum_Nar+IfThen(DSetAccNarList1['SUMMA']<>NULL,DSetAccNarList1['SUMMA'],0);
        DSetAccNarList1.Next;
       end;
      Value:=FloatToStrF(Sum_Nar,ffFixed,16,2);
     end;

    if UpperCase(VarName)='P_SUM_UD2' then
     begin
      Sum_Ud:=0;
      DSetAccUdList1.First;
      while not DSetAccUdList1.Eof do
       Begin
        Sum_Ud:=Sum_Ud+IfThen(DSetAccUdList1['SUMMA']<>NULL,DSetAccUdList1['SUMMA'],0);
        DSetAccUdList1.Next;
       end;
      Value :=FloatToStrF(Sum_Ud,ffFixed,16,2);
     end;

     //sheets

     if UpperCase(VarName)='TYPE_SHEET1' then
     begin
      if DSetSheets0.RecordCount-1>=UDSSheets.RecNo then
       begin
        DSetSheets0.RecNo:=UDSSheets.RecNo+1;
        Value:=DSetSheets0.FieldValues['TYPE_SHEET'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='SUMA_SHEET1' then
     begin
      if DSetSheets0.RecordCount-1>=UDSSheets.RecNo then
       begin
        DSetSheets0.RecNo:=UDSSheets.RecNo+1;
        Value:=DSetSheets0.FieldValues['SUMMA'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='SMETA_KOD1' then
     begin
      if DSetSheets0.RecordCount-1>=UDSSheets.RecNo then
       begin
        DSetSheets0.RecNo:=UDSSheets.RecNo+1;
        Value:=DSetSheets0.FieldValues['SMETA_KOD'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='SMETA_NAME1' then
     begin
      if DSetSheets0.RecordCount-1>=UDSSheets.RecNo then
       begin
        DSetSheets0.RecNo:=UDSSheets.RecNo+1;
        Value:=DSetSheets0.FieldValues['SMETA_NAME'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='TYPE_SHEET2' then
     begin
      if DSetSheets1.RecordCount-1>=UDSSheets.RecNo then
       begin
        DSetSheets1.RecNo:=UDSSheets.RecNo+1;
        Value:=DSetSheets1.FieldValues['TYPE_SHEET'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='SUMA_SHEET2' then
     begin
      if DSetSheets1.RecordCount-1>=UDSSheets.RecNo then
       begin
        DSetSheets1.RecNo:=UDSSheets.RecNo+1;
        Value:=DSetSheets1.FieldValues['SUMMA'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;

     if UpperCase(VarName)='SMETA_KOD2' then
     begin
      if DSetSheets1.RecordCount-1>=UDSSheets.RecNo then
       begin
        DSetSheets1.RecNo:=UDSSheets.RecNo+1;
        Value:=DSetSheets1.FieldValues['SMETA_KOD'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='SMETA_NAME2' then
     begin
      if DSetSheets1.RecordCount-1>=UDSSheets.RecNo then
       begin
        DSetSheets1.RecNo:=UDSSheets.RecNo+1;
        Value:=DSetSheets1.FieldValues['SMETA_NAME'];
        Exit;
       end
      else
      begin
       Value:=NULL;
       Exit;
      end
     end;


     if UpperCase(VarName)='P_VIPLATA1' then
     begin
      Sum_Nar:=0;
      DSetAccNarList0.First;
      while not DSetAccNarList0.Eof do
       Begin
        Sum_Nar:=Sum_Nar+IfThen(DSetAccNarList0['SUMMA']<>null,DSetAccNarList0['SUMMA'],0);
        DSetAccNarList0.Next;
       end;
      Sum_Ud:=0;
      DSetAccUdList0.First;
      while not DSetAccUdList0.Eof do
       Begin
        Sum_Ud:=Sum_Ud+DSetAccUdList0['SUMMA'];
        DSetAccUdList0.Next;
       end;
      Value:=FZPrintAccList_P_Viplata_Text+'  '+FloatToStrF(Sum_Nar-Sum_Ud,ffFixed,16,2);
     end;

     if UpperCase(VarName)='P_VIPLATA2' then
     begin
      Sum_Nar:=0;
      DSetAccNarList1.First;
      while not DSetAccNarList1.Eof do
       Begin
        Sum_Nar:=Sum_Nar+IfThen(DSetAccNarList1['SUMMA']<>NULL,DSetAccNarList1['SUMMA'],0);
        DSetAccNarList1.Next;
       end;
      Sum_Ud:=0;
      DSetAccUdList1.First;
      while not DSetAccUdList1.Eof do
       Begin
        Sum_Ud:=Sum_Ud+IfThen(DSetAccUdList1['SUMMA']<>null,DSetAccUdList1['SUMMA'],0);
        DSetAccUdList1.Next;
       end;
      Value:=FZPrintAccList_P_Viplata_Text+'  '+FloatToStrF(Sum_Nar-Sum_Ud,ffFixed,16,2);
     end;
  end
  else    ////////////
  begin



  if UpperCase(VarName)='P_COMING_LEAVING' then
    begin
      Value:=PComingLeavingText;
      Exit;
    end;
    if UpperCase(VarName)='P_ACCLIST' then
    begin
      if(Report.Variables['P_ACCLIST']=null)then
        if(PType=0)then
          Value:=FZPrintAccList_P_AccList_Title+' '+AnsiLowerCase(KodSetupToPeriod(DSetGlobalData['KOD_SETUP1'],2))
        else
          Value:='Відомість про фактичне нарахування за  '+AnsiLowerCase(KodSetupToPeriod(DSetGlobalData['KOD_SETUP1'],2))
    end;
    if UpperCase(VarName)='P_ACCLIST_SHORT' then
    begin
      frxUserDataSet.RangeEndCount:=IfThen(DSetAccNarList.RecordCount>DSetAccUdList.RecordCount,DSetAccNarList.RecordCount,DSetAccUdList.RecordCount);
      frxUserDataSet.RangeEnd:=reCount;
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
      frxUserDataSet.RangeEndCount:=IfThen(DSetAccNarList.RecordCount>DSetAccUdList.RecordCount,DSetAccNarList.RecordCount,DSetAccUdList.RecordCount);
      frxUserDataSet.RangeEnd:=reCount;
      Value:=FZPrintAccList_P_Tn_Text;
      Exit;
     end;

    if UpperCase(VarName)='P_SUM_NAR' then
     begin
      Sum_Nar:=0;
      DSetAccNarList.First;
      while not DSetAccNarList.Eof do
       Begin
        Sum_Nar:=Sum_Nar+IFTHEN(DSetAccNarList['SUMMA']<>NULL,DSetAccNarList['SUMMA'],0);
        DSetAccNarList.Next;
       end;
      Value:=FloatToStrF(Sum_Nar,ffFixed,16,2);
     end;

    if UpperCase(VarName)='P_SUM_UD' then
     begin
      Sum_Ud:=0;
      DSetAccUdList.First;
      while not DSetAccUdList.Eof do
       Begin
        Sum_Ud:=Sum_Ud+IFTHEN(DSetAccUdList['SUMMA']<>NULL,DSetAccUdList['SUMMA'],0);
        DSetAccUdList.Next;
       end;
     Value :=FloatToStrF(Sum_Ud,ffFixed,16,2);
     end;

    if UpperCase(VarName)='P_VIPLATA' then
     begin
      Sum_Nar:=0;
      DSetAccNarList.First;
      while not DSetAccNarList.Eof do
       Begin
        Sum_Nar:=Sum_Nar+IFTHEN(DSetAccNarList['SUMMA']<>NULL,DSetAccNarList['SUMMA'],0);
        DSetAccNarList.Next;
       end;
      Sum_Ud:=0;
      DSetAccUdList.First;
      while not DSetAccUdList.Eof do
       Begin
        Sum_Ud:=Sum_Ud+DSetAccUdList['SUMMA'];
        DSetAccUdList.Next;
       end;
      Value:=FZPrintAccList_P_Viplata_Text+'  '+FloatToStrF(Sum_Nar-Sum_Ud,ffFixed,16,2);
     end;

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
        Value:=KodSetupToPeriod(DSetAccNarList['KOD_SETUP3'],1);
       end
      else
       Value:=NULL;
     end;
    if UpperCase(VarName)='N_KOD_SM' then
     begin
      if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
       begin
        DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
        Value:=DSetAccNarList['KOD_SMETA'];
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
        Value:=DayClocks(self);
       end
      else
       Value:=NULL;
     end;

    if UpperCase(VarName)='N_DAY_CLOCK_SHORT' then
     begin
      if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
       begin
        DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
        if (DSetAccNarList['NDAY']=0) or (VarIsNull(DSetAccNarList['NDAY'])) then Value:=''
        else
        begin
          sign:=IfThen(DSetAccNarList['NDAY']<0,'-','');
          PValue:=Abs(DSetAccNarList['NDAY']);
          Value:=Sign+ifThen(PValue<10,'0','')+VarToStr(PValue);
        end;
       end
      else
       Value:=NULL;
     end;
    if UpperCase(VarName)='N_PERCENT_SUMCLOCK' then
     begin
      if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
       begin
        DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
        if (ifthen(DSetAccNarList['PERCENT']<>NULL,DSetAccNarList['PERCENT'],0)<>0) then
         begin

            if (IfThen(DSetAccNarList['SUM_CLOCK']<>NULL, DSetAccNarList['SUM_CLOCK'], 0)<>0) then
            begin
              PValue:=DSetAccNarList['SUM_CLOCK'];
              Value:=FloatToStrF(PValue,ffFixed,5,2);
            end
            else Value := '';
            PValue:=DSetAccNarList['PERCENT'];
            if Value<>'' then Value:=Value+'/'+FloatToStrF(PValue,ffFixed,4,2)+'%'
                         else Value:=FloatToStrF(PValue,ffFixed,4,2)+'%';
         end
        else
         begin
          if (IfThen(DSetAccNarList['SUM_CLOCK']<>NULL, DSetAccNarList['SUM_CLOCK'], 0)<>0) then
          begin
            PValue:=DSetAccNarList['SUM_CLOCK'];
            Value:=FloatToStrF(PValue,ffFixed,5,2);
          end
          else
            Value:=NULL;
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
        Value:=KodSetupToPeriod(DSetAccUdList['KOD_SETUP3'],1);
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

  end




end;

procedure TPrintDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

function TPrintDM.DayClocks(Sender:TObject):String;
var PValue:Variant;
    Sign:string[1];
begin
  if (DSetAccNarList['NDAY']=0) or (VarIsNull(DSetAccNarList['NDAY'])) then Result:='--'
  else
   begin
    sign:=IfThen(DSetAccNarList['NDAY']<0,'-','');
    PValue:=Abs(DSetAccNarList['NDAY']);
    Result:=Sign+ifThen(PValue<10,'0','')+VarToStr(PValue);
   end;
  Result:=Result+'/';
  if (DSetAccNarList['CLOCK']=0) or (VarIsNull(DSetAccNarList['CLOCK'])) then Result:=Result+'---,--'
  else
   begin
    sign:=IfThen(DSetAccNarList['CLOCK']<0,'-','');
    PValue:=Abs(DSetAccNarList['CLOCK']);
    Result:=Result+Sign+ifThen(PValue<10,'0'+FloatToStrF(PValue,ffFixed,5,3),FloatToStrF(PValue,ffFixed,6,3));
   end;
end;

end.
