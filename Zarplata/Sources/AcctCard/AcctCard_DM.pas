unit AcctCard_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, frxClass, frxDBSet, frxDesgn, RxMemDS, Forms,
  ZProc, ZMessages, Unit_ZGlobal_Consts, Dialogs, DB, FIBDataSet,
  pFIBDataSet, frOLEExl, FR_Class, frRtfExp, frxExportRTF, frxExportXLS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    RTran: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    Designer: TfrxDesigner;
    DBDataset: TfrxDBDataset;
    Report: TfrxReport;
    DSet: TpFIBDataSet;
    XLSExport: TfrxXLSExport;
    RTFExport: TfrxRTFExport;
    DSource: TDataSource;
    WTran: TpFIBTransaction;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    { Private declarations }
  public
    BankName: string;
    IsWork:string;
    IsGrant:string;
    procedure Print(DSet:TRxMemoryData);
    procedure Print2(PType:integer);
  end;

implementation

{$R *.dfm}

const NameReport               = '\Reports\Zarplata\AcctCardPrint.fr3';
const NameReport2              = '\Reports\Zarplata\AcctCardCheckAll.fr3';
const NameReport3              = '\Reports\Zarplata\AcctCardDif.fr3';
const NameReport4              = '\Reports\Zarplata\AcctCardTypePaym.fr3';

procedure TDM.Print(DSet:TRxMemoryData);
begin
  try
    DBDataset.DataSet:=DSet;
    Report.Clear;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
    if zDesignReport then Report.DesignReport
                      else Report.ShowReport;
  except
    on E:Exception do
    begin
      ZShowMessage(Error_Caption[LanguageIndex],
                   E.Message,mtWarning,[mbOK]);
    end;
  end;
end;

procedure TDM.Print2(PType:integer);
begin
{  try
    DBDataset.DataSet:=DSetPrint;
    Report.Clear;
    if(PType=1)then
      Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport2,True);
    if(PType=2)then
      Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport3,True);
    if(PType=3)then
      Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport4,True);
    if zDesignReport then Report.DesignReport
                      else Report.ShowReport;
  except
    on E:Exception do
    begin
      ZShowMessage(Error_Caption[LanguageIndex],
                   E.Message,mtWarning,[mbOK]);
    end;
  end;}
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
  if UpperCase(VarName)='TYPE' then
  begin
    if(DBDataset.Value['RTYPE']=0)then Value:='0-фіз. особу не знайдено в базі';
    if(DBDataset.Value['RTYPE']=1)then Value:='1-номери карток не збігаються';
    if(DBDataset.Value['RTYPE']=2)then Value:='2-картка не знайдена в базі у даної фіз. особи';
    if(DBDataset.Value['RTYPE']=3)then Value:='3-фіз. особу не знайдено у файлі';
    if(DBDataset.Value['RTYPE']=4)then Value:='4-тип виплати не збігається';
    if(DBDataset.Value['RTYPE']=5)then Value:='5-картковий рахунок закрито';
  end;
  if UpperCase(VarName)='BANK_NAME' then Value:=BankName;
  if UpperCase(VarName)='IS_WORK' then Value:=IsWork;
  if UpperCase(VarName)='IS_GRANT' then Value:=IsGrant;  
end;

end.
