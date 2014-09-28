unit SprFondDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc,Dialogs, frxExportRTF, frxExportXLS,
  frxExportHTML, FIBQuery, pFIBQuery, pFIBStoredProc, AccMGMT;

Type TFilterData = record
  ID_man : integer;
  TN:integer;
  FIO: string;
  Kod_setup1:integer;
  Kod_setup2:integer;
  PrUser:Boolean;
end;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    ReportDBDSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    DSetFoundationData: TpFIBDataSet;
    ReportDBDSetFoundationData: TfrxDBDataset;
    DSource: TDataSource;
    DSetDetail: TpFIBDataSet;
    ReportDBDSetDetail: TfrxDBDataset;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    DSetAcadem: TpFIBDataSet;
    ReportDSetAcadem: TfrxDBDataset;
    StoredProc: TpFIBStoredProc;
    DefaultTransaction: TpFIBTransaction;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportAfterPrintReport(Sender: TObject);
  private
    PUser:Boolean;
    CanEdit:Boolean;
  public
    function PrintSprFond(ADb_Handle: TISC_DB_HANDLE; AParameter:TFilterData):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SprFond';
const NameReport               = 'Reports\Zarplata\SprFond.fr3';

function TDM.PrintSprFond(ADb_Handle: TISC_DB_HANDLE; AParameter:TFilterData):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SummaZarVN:Extended;
    SummaZarSR:Extended;
    SummaVN:Extended;
    CalDay:integer;
    Summa:Extended;
    grn:Extended;
    kop:Extended;
begin
 PUser:=AParameter.PrUser;
 CanEdit := fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_DOXOD/CanEdit','Belong')=0;
 CanEdit := True;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SPR_DOH_ZAN('+IntToStr(AParameter.ID_man)+','
                                                           +IntToStr(AParameter.Kod_setup1)+','
                                                           +IntToStr(AParameter.Kod_setup2)+')';
 DSetDetail.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SPR_SUBS_VTCH('+IntToStr(AParameter.ID_man)+',?KOD_SETUP)';
 DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_FOUNDATION_DATA_SPR_FOND('+IntToStr(AParameter.ID_man)+','+IntToStr(AParameter.Kod_setup2)+')';
 DSetAcadem.SQLs.SelectSQL.Text := 'SELECT * FROM GR_DT_VACATION_S2('+IntToStr(AParameter.Kod_setup1)+','+IntToStr(AParameter.Kod_setup2)+','
                                    +IntToStr(AParameter.ID_man)+')';
 DB.Handle:=ADb_Handle;
 DSet.Open;
 DSetDetail.Open;
 DSetFoundationData.Open;
 DSetAcadem.Open;

 SummaZarVN:=0;
 SummaZarSR:=0;
 SummaVN:=0;
 CalDay:=0;
 DSet.First;
 while not DSet.Eof do
  begin
   SummaZarVN:=SummaZarVN+DSet['SUM_ZAR_VN'];
   SummaZarSR:=SummaZarSR+DSet['SUM_ZAR_SR'];
   SummaVN:=SummaVN+DSet['SUM_VN'];
   CalDay:=CalDay+DSet['CAL_DAY'];
   DSet.Next;
  end;

  if  CalDay<>0 then
    begin
      summa:=SummaZarSR/CalDay;
      grn:=Trunc(summa);
      kop:=(summa-grn)*100;
    end;

 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);
 IniFile.Free;
 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

 Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category','PSex',
                              ''''+IfThen(DSetFoundationData['ID_SEX']=1,TDM_RPSexMan_Text,TDM_RPSexWoMan_Text)+'''');
 Report.Variables.AddVariable('User Category','PKodSet1',''''+KodSetupToPeriod(AParameter.Kod_setup1,1)+'''');
 Report.Variables.AddVariable('User Category','PKodSet2',''''+KodSetupToPeriod(AParameter.Kod_setup2,1)+'''');
 if SummaZarVN=0 then
  Report.Variables.AddVariable('User Category','PSummaZarVN','''----- ''')
 else
  Report.Variables.AddVariable('User Category','PSummaZarVN',''''+FloatToStrF(SummaZarVN,ffFixed,16,2)+' ''');
 if SummaZarSR=0 then
  Report.Variables.AddVariable('User Category','PSummaZarSR','''----- ''')
 else
  Report.Variables.AddVariable('User Category','PSummaZarSR',''''+FloatToStrF(SummaZarSR,ffFixed,16,2)+' ''');
 if SummaVN=0 then
  Report.Variables.AddVariable('User Category','PSummaVN','''----- ''')
 else
  Report.Variables.AddVariable('User Category','PSummaVN',''''+FloatToStrF(SummaVN,ffFixed,16,2)+' ''');
 if CalDay=0 then
  Report.Variables.AddVariable('User Category','PCalDay','''----- ''')
 else
  Report.Variables.AddVariable('User Category','PCalDay',''''+FloatToStrF(CalDay,ffFixed,16,0)+' ''');
 if grn=0 then
  Report.Variables.AddVariable('User Category','Pgrn','''----- ''')
 else
  Report.Variables.AddVariable('User Category','Pgrn',''''+FloatToStrF(grn,ffFixed,16,0)+' ''');
 if kop=0 then
  Report.Variables.AddVariable('User Category','Pkop','''----- ''')
 else
  Report.Variables.AddVariable('User Category','Pkop',''''+FloatToStrF(kop,ffFixed,16,0)+' ''');


 Report.Variables.AddVariable('User Category','PWork',''''+TypeWorkReturn(DSetFoundationData['N_STUD'],DSetFoundationData['N_TYPEWORK'])+
                                                          '   '+IfThen(VarIsNull(DSetFoundationData['KURS']),'',VarToStr(DSetFoundationData['KURS'])+' курс ')+
                                                          '('+ IfThen(VarIsNull(DSetFoundationData['name_kat_stud']),'',VarToStr(DSetFoundationData['name_kat_stud'])+') ')+
                                                          IfThen(VarIsNull(DSetFoundationData['NAME_DEPARTMENT']),'',VarToSTr(DSetFoundationData['NAME_DEPARTMENT']))+'''');
if CalDay<>0 then
 Report.Variables.AddVariable('User Category','SumLetters',''''+SumToString(SummaZarSR/CalDay,1,False)+'''')
else
 Report.Variables.AddVariable('User Category','SumLetters',''''+'Кількість днів нульова'+'''');

 //Report.DesignReport;

 case ViewMode of
   1: Report.ShowReport;
   2: Report.DesignReport;
 end;
 Report.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if (PUser=True) then
  begin
  if UpperCase(VarName)='USER' then
     value:=AccMGMT.GetUserFIO;
  end
else if UpperCase(VarName)='USER' then
     value:='                                     ';
if UpperCase(VarName)='PKOD_SETUP' then
  Value:=KodSetupToPeriod(DSet['KOD_SETUP'],4);
if UpperCase(VarName)='PSUM_MONEY' then
  begin
   if (DSet['SUM_MONEY']=NULL) or (DSet['SUM_MONEY']=0) then
    value:='----- '
   else
    Value:=FloatToStrF(DSet['SUM_MONEY'],ffFixed,16,2)+' ';
  end;
if UpperCase(VarName)='PSUM_ALIMONY' then
  begin
   if (DSet['SUM_ALIMONY']=NULL) or (DSet['SUM_ALIMONY']=0) then
    value:='----- '
   else
    Value:=FloatToStrF(DSet['SUM_ALIMONY'],ffFixed,16,2)+' ';
  end;
if UpperCase(VarName)='PSUM_INSHI' then
  begin
   if (DSet['SUM_INSHI']=NULL) or (DSet['SUM_INSHI']=0) then
   begin
     if(DSetFoundationData['N_STUD']=0)then
       value:='----- '
     else
     begin
       if(DSet['IS_STUDY']=0)then
         value:='Не навчався ';
       if(DSet['IS_STUDY']=1)then
         value:='Стип. не нарах. низька успішність ';
       if(DSet['IS_STUDY']=2)then
         value:='Стип. не нарах. навчання за контрактом ';
       if(DSet['IS_STUDY']=3)then
         value:='----- ';
       if(DSet['IS_STUDY']=4)then
         value:='Стип. не нарах. була у відпустці ';
     end;
   end
   else
    Value:=FloatToStrF(DSet['SUM_INSHI'],ffFixed,16,2)+' ';
  end;
  
  if UpperCase(VarName)='P_MONTH' then
  begin
    value:=MonthNumToName(IfThen((DateToKodSetup(Date) mod 12)=0,12,DateToKodSetup(Date) mod 12))
  end;

  if UpperCase(VarName)='CANEDIT' then
    value:=CANEDIT;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

procedure TDM.ReportAfterPrintReport(Sender: TObject);
begin
 StoredProc.StoredProcName:='Z_SPRAVKA_NUMBER_INC';
 StoredProc.Transaction.Active:=True;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProc;
 StoredProc.Transaction.Commit;
 StoredProc.Transaction.Active:=False;
end;

end.
