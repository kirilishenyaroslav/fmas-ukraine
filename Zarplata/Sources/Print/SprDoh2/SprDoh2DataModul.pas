unit SprDoh2DataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc,Dialogs, frxExportXLS, frxExportRTF,
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
    Report: TfrxReport;
    XLSExport: TfrxXLSExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxRTFExport1: TfrxRTFExport;
    StoredProc: TpFIBStoredProc;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportAfterPrintReport(Sender: TObject);
  private
    PUser:Boolean;
    CanEdit:Boolean;
  public
    function PrintSpr(ADb_Handle: TISC_DB_HANDLE; AParameter:TFilterData):variant;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SprDoh';
const NameReport               = 'Reports\Zarplata\SprDoh2.fr3';

function TDM.PrintSpr(ADb_Handle: TISC_DB_HANDLE; AParameter:TFilterData):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    SummaDoh:Extended;
    SummaNal:Extended;
    SummaNar:Extended;
begin
 PUser:=AParameter.PrUser;
 CanEdit := fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Reports/Z_Menu_DOXOD/CanEdit','Belong')=0;
 CanEdit := True;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SPR_DOH2('+IntToStr(AParameter.Kod_setup1)+','
                                                       +IntToStr(AParameter.Kod_setup2)+','
                                                       +IntToStr(AParameter.ID_man)+')';
 DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_FOUNDATION_DATA_SPR_DOH2('+IntToStr(AParameter.ID_man)+','+IntToStr(AParameter.Kod_setup2)+')';
 DB.Handle:=ADb_Handle;
 DSet.Open;
 DSetFoundationData.Open;
 SummaDoh:=0;
 SummaNal:=0;
 SummaNar:=0;
 DSet.First;
 while not DSet.Eof do
  begin
    SummaDoh:=SummaDoh+DSet['SUM_DOH'];
    SummaNal:=SummaNal+DSet['SUM_NAL'];
    SummaNar:=SummaNar+DSet['SUM_NAR'];
    DSet.Next;
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
 if SummaDoh=0 then
  Report.Variables.AddVariable('User Category','PSumDoh','''----- ''')
 else
  Report.Variables.AddVariable('User Category','PSumDoh',''''+FloatToStrF(SummaDoh,ffFixed,16,2)+' ''');
 if SummaNal=0 then
  Report.Variables.AddVariable('User Category','PSumNal','''----- ''')
 else
  Report.Variables.AddVariable('User Category','PSumNal',''''+FloatToStrF(SummaNal,ffFixed,16,2)+' ''');
 if SummaNar=0 then
  Report.Variables.AddVariable('User Category','PSumNar','''----- ''')
 else
  Report.Variables.AddVariable('User Category','PSumNar',''''+FloatToStrF(SummaNar,ffFixed,16,2)+' ''');

 Report.Variables.AddVariable('User Category','PWork',''''+TypeWorkReturn(DSetFoundationData['N_STUD'],DSetFoundationData['N_TYPEWORK'])+
                                                          '   '+IfThen(VarIsNull(DSetFoundationData['KURS']),'',VarToStr(DSetFoundationData['KURS'])+' курс  ')+
                                                          IfThen(VarIsNull(DSetFoundationData['NAME_DEPARTMENT']),'',VarToSTr(DSetFoundationData['NAME_DEPARTMENT']))+'''');
 Report.Variables.AddVariable('User Category','SumLetters',''''+SumToString(SummaDoh,1,False)+'''');
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
     value:='                                  ';
if UpperCase(VarName)='PKOD_SETUP' then
  Value:=KodSetupToPeriod(DSet['KOD_SETUP'],4);
if UpperCase(VarName)='PSUM_DOH' then
  begin
   if (DSet['SUM_DOH']=NULL) or (DSet['SUM_DOH']=0) then
    value:='----- '
   else
    Value:=FloatToStrF(DSet['SUM_DOH'],ffFixed,16,2)+' ';
  end;
if UpperCase(VarName)='PSUM_NAL' then
  begin
   if (DSet['SUM_NAL']=NULL) or (DSet['SUM_NAL']=0) then
    value:='----- '
   else
    Value:=FloatToStrF(DSet['SUM_NAL'],ffFixed,16,2)+' ';
  end;
if UpperCase(VarName)='PSUM_NAR' then
  begin
   if (DSet['SUM_NAR']=NULL) or (DSet['SUM_NAR']=0) then
    value:='----- '
   else
    Value:=FloatToStrF(DSet['SUM_NAR'],ffFixed,16,2)+' ';
  end;
if UpperCase(VarName)='P_MONTH' then
begin
  value:=MonthNumToName(IfThen((DateToKodSetup(Date) mod 12)=0,12,DateToKodSetup(Date) mod 12));
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
 StoredProc.ExecProc;
end;

end.
