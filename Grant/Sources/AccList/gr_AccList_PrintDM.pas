unit gr_AccList_PrintDM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, frxClass, frxDesgn, frxDBSet, IBase, IniFiles,
  ZProc, Forms, Variants, Dates, Dialogs,
  gr_uCommonLoader, gr_uCommonProc, gr_uMessage, gr_uCommonConsts,
  gr_uWaitForm, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TPrintDM = class(TDataModule)
    frxDSetGlobalData: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxUserDataSet: TfrxUserDataSet;
    ReadTransaction: TpFIBTransaction;
    DSetAccUdList: TpFIBDataSet;
    DSetAccNarList: TpFIBDataSet;
    DSetGlobalData: TpFIBDataSet;
    DB: TpFIBDatabase;
    DSetSystemData: TpFIBDataSet;
    frxDSetSystemData: TfrxDBDataset;
    StProc: TpFIBStoredProc;
    UdateTransaction: TpFIBTransaction;
    DSource: TDataSource;
    frxDSetAccNarList: TfrxDBDataset;
    Report: TfrxReport;
    DSetSmetaList: TpFIBDataSet;
    frxDSetSmetaList: TfrxDBDataset;
    DSetSheets: TpFIBDataSet;
    frxDSetSheets: TfrxDBDataset;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
    function DayClocks(Sender:TObject):String;
  private
    pParameter:TgrAccListParam;
    PIdSession:Integer;
  public
    procedure ReportCreate(AParameter:TgrAccListParam);
  end;

implementation

{$R *.dfm}
const FullNameReport           = '\grAccList.fr3';

procedure TPrintDM.ReportCreate(AParameter:TgrAccListParam);
var wf:TForm;
begin
try
 DB.Handle:=AParameter.DB_handle;
 pParameter:=AParameter;
 if(pParameter.TypeTable=2)then
 try
   wf:=ShowWaitForm(TForm(pParameter.Owner),wfPrepareData);
   DB.Handle:=PParameter.DB_Handle;
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='GR_SVOD_PREPARE_DATA';
   StProc.Prepare;
   StProc.ParamByName('KOD_SETUP').AsInteger :=PParameter.KodSetup2;
   StProc.ExecProc;
   AParameter.IdGroupAccount:=StProc.ParamByName('ID_SESSION').AsInteger;
   StProc.Transaction.Commit;
   CloseWaitForm(wf);
 except
   on E:Exception do
   begin
     CloseWaitForm(wf);
     grShowMessage(ECaption[1{PlanguageIndex}],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;

 DSetAccNarList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_NAR_S('+IntToStr(AParameter.IdGroupAccount)+','+
                                                                          ' ?ID_MAN,'+
                                                                            IntToStr(AParameter.KodSetup2)+','+
                                                                            IntToStr(AParameter.TypeTable)+') ORDER BY KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
 DSetAccUdList.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ACCOUNT_ACC_UD_S('+IntToStr(AParameter.IdGroupAccount)+','+
                                                                          ' ?ID_MAN,'+
                                                                          IntToStr(AParameter.KodSetup2)+','+
                                                                          IntToStr(AParameter.TypeTable)+') order by KOD_SETUP3 descending,KOD_VIDOPL,NAME_VIDOPL';
 DSetSmetaList.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_SMETA_S('+IntToStr(AParameter.IdGroupAccount)+',?ID_MAN,'+
                                                                           IntToStr(AParameter.KodSetup2)+','+IntToStr(AParameter.TypeTable)+')'; // ORDER BY ID_DEPARTMENT,ID_SMETA';
 DSetSheets.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET(?ID_MAN,'+IntToStr(AParameter.IdGroupAccount)+')';
 if AParameter.TypeTable=2 then
 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM GR_ACCOUNT_GLOBALDATA_S_FILTER('+IntToStr(AParameter.IdGroupAccount)+','+  IntToStr(AParameter.Id_man)+','+
                                                                              IntToStr(AParameter.KodSetup2)+','+
                                                                              IntToStr(AParameter.TypeTable)+','+
                                                                              AParameter.KOD_SETUP1+','+
                                                                              AParameter.KOD_SETUP2+','+
                                                                              AParameter.id+','+
                                                                              AParameter.ID_TYPE+','+
                                                                              AParameter.PAYMENT_TYPE+') order by ORG_STR_NAME'
 else
 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM GR_ACCOUNT_GLOBALDATA_S('+IntToStr(AParameter.IdGroupAccount)+','+  IntToStr(AParameter.Id_man)+','+
                                                                              IntToStr(AParameter.KodSetup2)+','+
                                                                              IntToStr(AParameter.TypeTable)+') order by ORG_STR_NAME';
 DSetSystemData.SQLs.SelectSQL.Text := 'SELECT SHORT_NAME FROM Z_SETUP';

 DSetGlobalData.Open;
 DSetAccNarList.Open;
 DSetAccUdList.Open;
 DSetSmetaList.Open;
 DSetSheets.Open;
 DSetSystemData.Open;

 frxUserDataSet.Fields.Add('N_CODE_DEPARTMENT');
 frxUserDataSet.Fields.Add('N_KOD_SETUP_3');
 frxUserDataSet.Fields.Add('N_KOD_VIDOPL');
 frxUserDataSet.Fields.Add('N_NAME_VIDOPL');
 frxUserDataSet.Fields.Add('N_DAY_CLOCK');
 frxUserDataSet.Fields.Add('N_PERCENT_SUMCLOCK');
 frxUserDataSet.Fields.Add('N_SUMMA');
 frxUserDataSet.Fields.Add('U_KOD_SETUP_3');
 frxUserDataSet.Fields.Add('U_KOD_VIDOPL');
 frxUserDataSet.Fields.Add('U_NAME_VIDOPL');
 frxUserDataSet.Fields.Add('U_SUMMA');
 frxUserDataSet.RangeEnd := reCount;
 frxUserDataSet.RangeEndCount := ifThen(DSetAccUdList.RecordCount>DSetAccNarList.RecordCount,DSetAccUdList.RecordCount,DSetAccNarList.RecordCount);

 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+FullNameReport,True);

 Report.Variables.Clear;
 Report.Variables['P_PERIOD']:=''''+AnsiLowerCase(KodSetupToPeriod(AParameter.KodSetup2,2))+'''';
 Report.Variables['P_SUMMARY']:='''';//+FZPrintAccList_P_Summary_Text+'''';
 Report.Variables['P_UD']:='''';//+FZPrintAccList_P_Ud_Text+'''';
 if grDesignReport
    then Report.DesignReport
    else Report.ShowReport;
 Report.Free;
except
 on E:Exception do
  begin
   grShowMessage(ECaption[Indexlanguage],e.Message,mtError,[mbOK]);
  end;
end;
 if(pParameter.TypeTable=2)then
 try
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='Z_SVOD_PREPARE_DATA_DELETE';
   StProc.Prepare;
   StProc.ParamByName('ID_SESSION').AsInteger:=AParameter.IdGroupAccount;
   StProc.ExecProc;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     grShowMessage(ECaption[1],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;
end;


procedure TPrintDM.ReportGetValue(const VarName: String;
  var Value: Variant);
var   Sum_Nar,Sum_Ud:Extended;
begin
if UpperCase(VarName)='P_ACCLIST_TYPE' then
 begin
  if DSetGlobalData['KOD_SETUP1']=pParameter.KodSetup2 then Value:=''
  else Value:='Перерахунок';
 end;
if UpperCase(VarName)='P_STUDENT' then
 begin
  if VarIsNULL(DSetGlobalData['TN']) then Value:=''
  else Value:=VarToStr(DSetGlobalData['TN'])+' - ';
  Value:=value+VarToStr(DSetGlobalData['FIO']);
  frxUserDataSet.RangeEndCount := ifThen(DSetAccUdList.RecordCount>DSetAccNarList.RecordCount,DSetAccUdList.RecordCount,DSetAccNarList.RecordCount);
 end;
if UpperCase(VarName)='P_SUM_NAR' then
 begin
  Sum_Nar:=0;
  DSetAccNarList.First;
  while not DSetAccNarList.Eof do
   Begin
    Sum_Nar:=Sum_Nar+DSetAccNarList['SUMMA'];
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
    Sum_Ud:=Sum_Ud+DSetAccUdList['SUMMA'];
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
    Sum_Nar:=Sum_Nar+DSetAccNarList['SUMMA'];
    DSetAccNarList.Next;
   end;
  Sum_Ud:=0;
  DSetAccUdList.First;
  while not DSetAccUdList.Eof do
   Begin
    Sum_Ud:=Sum_Ud+DSetAccUdList['SUMMA'];
    DSetAccUdList.Next;
   end;
  Value:=FloatToStrF(Sum_Nar-Sum_Ud,ffFixed,16,2);
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
if UpperCase(VarName)='N_KOD_SMETA' then
 begin
  if DSetAccNarList.RecordCount-1>=frxUserDataSet.RecNo then
   begin
    DSetAccNarList.RecNo:=frxUserDataSet.RecNo+1;
    Value:=DSetAccNarList.FieldValues['KOD_SMETA'];
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

if UpperCase(VarName)='P_SUM_NAR' then
 begin
  Sum_Nar:=0;
  DSetAccNarList.First;
  while not DSetAccNarList.Eof do
   Begin
    Sum_Nar:=Sum_Nar+DSetAccNarList['SUMMA'];
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
    Sum_Ud:=Sum_Ud+DSetAccUdList['SUMMA'];
    DSetAccUdList.Next;
   end;
 Value :=FloatToStrF(Sum_Ud,ffFixed,16,2);
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
  Result:='';
  if (DSetAccNarList['NDAY']=0) or (VarIsNull(DSetAccNarList['NDAY'])) then Result:='--'
  else
   begin
    sign:=IfThen(DSetAccNarList['NDAY']<0,'-','');
    PValue:=Abs(DSetAccNarList['NDAY']);
    Result:=Sign+ifThen(PValue<10,'0','')+VarToStr(PValue);
   end;
end;

end.
