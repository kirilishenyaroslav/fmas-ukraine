unit SprPensionDataModule;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  frxDesgn, frxClass, frxDBSet, ibase, Forms, FIBQuery, pFIBQuery,
  pFIBStoredProc, ZWait, ZMessages, Unit_SprSubs_Consts, Dialogs,
  RxMemDS, IniFiles, ZProc, Dates,
  Variants, Math, frxExportXLS;

Type TFilterData = record
  ID_man : integer;
  TN:integer;
  TIN: variant;
  FIO: string;
  Kod_setup1:integer;
  Kod_setup2:integer;
  AOwner:TComponent;
end;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    ReportDBDSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    ReportDBDSetFoundationData: TfrxDBDataset;
    DSetFoundationData: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    UpdateTransaction: TpFIBTransaction;
    Report: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    procedure DataModuleDestroy(Sender: TObject);
  private
    PID_Report:integer;
    MemoryData: TRxMemoryData;
  public
    function PrintSpr(ADb_Handle: TISC_DB_HANDLE; AParameter:TFilterData):variant;
  end;

implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'Pension';
const NameReport               = 'Reports\Zarplata\Pension.fr3';

function TDM.PrintSpr(ADb_Handle: TISC_DB_HANDLE; AParameter:TFilterData):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    wf:TForm;
    i: integer;
    k: integer;
    HeaderBand: TfrxHeader;
    FooterBand: TfrxFooter;
    Memo: TfrxMemoView;
    SummaAll:Extended;
begin
 DB.Handle:=ADb_Handle;
 try
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='Z_PERSONIFICATION_REPORT_I';

   StProc.Prepare;
   StProc.ExecProc;
   PID_Report:=StProc.ParamByName('ID').AsInteger;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     ZShowMessage(TFSprSubs_InputError_Caption,e.Message,mtWarning,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;

  try
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='GR_MAN_BY_ID';
   StProc.ParamByName('IN_ID_MAN').AsInteger:=AParameter.ID_man;
   StProc.Prepare;
   StProc.ExecProc;
   AParameter.TIN:=StProc.ParamByName('TIN').AsVariant;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     ZShowMessage(TFSprSubs_InputError_Caption,e.Message,mtWarning,[mbOK]);
     StProc.Transaction.Rollback;
   end
 end;

 try
   wf:=ShowWaitForm(TForm(AParameter.AOwner));
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='Z_PERSONIFACATION';
   StProc.ParamByName('TIN').AsString:=AParameter.TIN;
   StProc.ParamByName('KOD_SETUP_B').AsInteger:=AParameter.Kod_setup1;
   StProc.ParamByName('KOD_SETUP_E').AsInteger:=AParameter.Kod_setup2;
   StProc.ParamByName('ID_REPORT').AsInteger:=PID_Report;
   StProc.Prepare;
   StProc.ExecProc;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     CloseWaitForm(wf);
     ZShowMessage(TFSprSubs_InputError_Caption,e.Message,mtWarning,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;

  DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SPR_PENSION('+IntToStr(PID_Report)+')';
  DSetFoundationData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SPR_SUBS_FOUNDATION_DATA('+IntToStr(AParameter.ID_man)+','+IntToStr(AParameter.Kod_setup2)+')';

  DSet.Open;
  DSetFoundationData.Open;

  MemoryData:=TRxMemoryData.Create(self);
  MemoryData.FieldDefs.Add('MONTH',ftVariant);
  MemoryData.FieldDefs.Add('SUMMA1',ftCurrency);
  MemoryData.FieldDefs.Add('SUMMA2',ftCurrency);
  MemoryData.FieldDefs.Add('SUMMA3',ftCurrency);
  MemoryData.FieldDefs.Add('SUMMA4',ftCurrency);
  MemoryData.FieldDefs.Add('SUMMA5',ftCurrency);
  MemoryData.FieldDefs.Add('SUMMA6',ftCurrency);
  MemoryData.FieldDefs.Add('SUMMA7',ftCurrency);
  MemoryData.FieldDefs.Add('SUMMA8',ftCurrency);
  MemoryData.Open;

  i:=12;
  while(i>=1)do
  begin
    MemoryData.Insert;
    MemoryData['MONTH']:=MonthNumToName(i);
    MemoryData.Post;
    Dec(i);
  end;

  DSet.Last;
  AParameter.Kod_setup2:=DSet['KOD_SETUP'];
  DSet.First;
  AParameter.Kod_setup1:=DSet['KOD_SETUP'];
  MemoryData.First;


  k:=AParameter.Kod_setup1 mod 12;
  if(k=0)then k:=12;

  for i:=1 to k-1 do
    MemoryData.Next;

  i:=1;
  SummaAll:=0;

  k:=AParameter.Kod_setup1;

  while not(DSet.Eof)do
  begin

    if(DSet['KOD_SETUP']=k)then
    begin
      SummaAll:=SummaAll+DSet['SUM_DOX_PENS'];
      MemoryData.Edit;
      MemoryData['SUMMA'+IntToStr(i)]:=DSet['SUM_DOX_PENS'];
      MemoryData.Post;
      DSet.Next;
    end;
    Inc(k);
    MemoryData.Next;
    if(k=12)then k:=0;
    if(MemoryData.Eof)then
    begin
      MemoryData.First;
      Inc(i);
    end;
  end;

  ReportDBDSet.DataSet:=MemoryData;
  ReportDBDSet.Open;

  CloseWaitForm(wf);

  IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
  ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
  PathReport:=IniFile.ReadString(SectionOfIniFile,'ReeDepVo',NameReport);

  IniFile.Free;
  Report.Clear;

  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

  Report.Variables.Clear;
  Report.Variables[' '+'User Category']:=NULL;
  Report.Variables.AddVariable('User Category',
                               'PSumAll',
                               ''''+StringPrepareToQueryText(SumToString(RoundTo(SummaAll,-2)))+'''');
  Report.Variables.AddVariable('User Category',
                               'KodSetup1',
                               YearMonthFromKodSetup(AParameter.Kod_setup1));
  Report.Variables.AddVariable('User Category',
                               'KodSetup2',
                               YearMonthFromKodSetup(AParameter.Kod_setup2));

  k:=YearMonthFromKodSetup(AParameter.Kod_setup2)-YearMonthFromKodSetup(AParameter.Kod_setup1);
  HeaderBand:=Report.FindObject('Header1') as TfrxHeader;
  for i:=0 to k do
  begin
    Memo:=HeaderBand.FindObject('Memo'+IntToStr(i+12)) as TfrxMemoView;
    Memo.Text:=IntToStr(YearMonthFromKodSetup(AParameter.Kod_setup1)+i);
  end;

  FooterBand:=Report.FindObject('Footer1') as TfrxFooter;
  for i:=0 to k do
  begin
    Memo:=FooterBand.FindObject('Memo'+IntToStr(i+20)) as TfrxMemoView;
    Memo.Text:='[SUM(<ReportDBDSet."SUMMA'+IntToStr(i+1)+'">,MasterData1)]';
  end;

  if zDesignReport then Report.DesignReport
                  else Report.ShowReport;

  Report.Free;

 try
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='Z_PERSONIFICATION_REPORT_D';
   StProc.Prepare;
   StProc.ParamByName('ID').AsInteger:=PID_Report;
   StProc.ExecProc;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     ZShowMessage(TFSprSubs_InputError_Caption,e.Message,mtWarning,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
