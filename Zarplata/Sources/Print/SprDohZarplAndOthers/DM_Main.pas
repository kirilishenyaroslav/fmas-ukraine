unit DM_Main;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, IBase, ZTypes, Forms, ZProc, AccMGMT, Unit_SprSubs_Consts, Dates,
  Variants, frxExportXLS, frxExportRTF;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    ReportDBDSet: TfrxDBDataset;
    DSetFoundationData: TpFIBDataSet;
    ReportDBDSetFoundationData: TfrxDBDataset;
    Report: TfrxReport;
    frxlsxprtXLSExport: TfrxXLSExport;
    frxrtfxprtRTFExport: TfrxRTFExport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
    LocFilterDataSprDoh:TFilterDataSprDoh;
  public
    constructor Create(AOwner : TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;
  procedure Print(FilterDataSprDoh:TFilterDataSprDoh);
var
  DM: TDM;
//AOwner : TComponent;DB:TISC_DB_HANDLE;
implementation

const PathReport               = 'Reports\Zarplata\SprDohZarplAndOthers.fr3';
{$R *.dfm}
procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin

if (LocFilterDataSprDoh.PrUser=True) then
  begin
  if UpperCase(VarName)='USER' then
     value:=AccMGMT.GetUserFIO;
  end
else if UpperCase(VarName)='USER' then
     value:='                                  ';
if UpperCase(VarName)='P_MONTH' then
begin
  value:=MonthNumToName(IfThen((DateToKodSetup(Date) mod 12)=0,12,DateToKodSetup(Date) mod 12));
end;
end;

procedure Print(FilterDataSprDoh:TFilterDataSprDoh);
var SummaDoh,SumPDFO:double;
begin
  with DM do begin
    LocFilterDataSprDoh:=FilterDataSprDoh;

    DSet.Close;
    DSetFoundationData.Close;

    DSet.SQLs.SelectSQL.Text:='Select * From Z_CALC_TAX_NDF_FACT('+IntToStr(FilterDataSprDoh.Kod_setup1)+','+
    IntToStr(FilterDataSprDoh.Kod_setup2)+','+IntToStr(FilterDataSprDoh.Id_man)+')';
    DSet.Open;

    DSetFoundationData.SQLs.SelectSQL.Text :=
    'SELECT * FROM Z_SPR_SUBS_FOUNDATION_DATA('+IntToStr(FilterDataSprDoh.ID_man)+','+IntToStr(FilterDataSprDoh.Kod_setup2)+')';
    DSetFoundationData.Open;


    SummaDoh:=0;
    SumPDFO:=0;

    DSet.First;
    while not DSet.Eof do
      begin
        SummaDoh:=SummaDoh+DSet['SUMMA_DOH'];
        SumPDFO:=SumPDFO+DSet['SUMMA_UD_NDF'];
        DSet.Next;
      end;

    Report.Clear;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
    Report.Variables.Clear;
    Report.Variables[' '+'User Category']:=NULL;
    Report.Variables.AddVariable('User Category','SumLettersDoh',''''+SumToString(SummaDoh,1,False)+'''');
    Report.Variables.AddVariable('User Category','SumLettersPDFO',''''+SumToString(SumPDFO,1,False)+'''');
    Report.Variables.AddVariable('User Category','PKodSet1',''''+KodSetupToPeriod(FilterDataSprDoh.Kod_setup1,1)+'''');
    Report.Variables.AddVariable('User Category','PKodSet2',''''+KodSetupToPeriod(FilterDataSprDoh.Kod_setup2,1)+'''');

    Report.Variables.AddVariable('User Category','PSex',
                              ''''+IfThen(DSetFoundationData['ID_SEX']=1,TDM_RPSexMan_Text,TDM_RPSexWoMan_Text)+'''');

    Report.Variables.AddVariable('User Category','PWork',''''+TypeWorkReturn(DSetFoundationData['N_STUD'],DSetFoundationData['N_TYPEWORK'])+
                                                          '   '+IfThen(VarIsNull(DSetFoundationData['KURS']),'',VarToStr(DSetFoundationData['KURS'])+' курс  ')+
                                                          IfThen(VarIsNull(DSetFoundationData['NAME_DEPARTMENT']),'',VarToSTr(DSetFoundationData['NAME_DEPARTMENT']))+'''');

    if zDesignReport then Report.DesignReport
    else Report.ShowReport();

  end;
end;

constructor TDM.Create(AOwner : TComponent;DB_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DB.handle:=DB_Handle;
  ReadTransaction.StartTransaction;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
