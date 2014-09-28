unit AvgHospPrintDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit,
  Unit_ZGlobal_Consts, ZWait, frxExportXLS, frxExportHTML, frxExportPDF,
  frxExportRTF;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetSetup: TpFIBDataSet;
    ReportDSetSetup: TfrxDBDataset;
    DSourceGlobalData: TDataSource;
    frxDesigner1: TfrxDesigner;
    DSetFSSPredpr: TpFIBDataSet;
    ReportDSetFSSPredpr: TfrxDBDataset;
    DSetFSSPredprTerms: TpFIBDataSet;
    ReportDSetFSSPredprTerms: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    DataSet: TpFIBDataSet;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
    procedure FindAlg(id_hosp : integer);
    function DAY_CLOCK_HOSP(Sender:TObject;AddSymbol:string=''):string;
    function DAY_CLOCK(Sender:TObject;AddSymbol:string=''):string;
    function P_SUM_DAYCLOCK(Sender:TObject;AddSymbol:string=''):string;
    function DAY_CLOCK_HOSP_TERM(Sender:TObject;AddSymbol:string=''):string;
    function SUMMA_DAY_CLOCK_HOSP(Sender:TObject;AddSymbol:string=''):variant;
  private
    PId_man:integer;
    PTn:integer;
    PAvg:double;
    PKodSetup:integer;
    PIsVUZ:boolean;
    TypeAlg : integer;
  public
    function PrintSpr(AParameter:TAvgHospParam):variant;
    property KodSetup:Integer read PKodSetup write PKodSetup;
  end;


implementation

{$R *.dfm}

const NameReport               = 'Reports\Zarplata\AvgHosp.fr3';
const NameReportVuz            = 'Reports\Zarplata\AvgHospVuz.fr3';

function TDM.PrintSpr(AParameter:TAvgHospParam):variant;
var Is_Univer:string[1];
    wf:TForm;
begin
 try
    wf := ShowWaitForm(Application.MainForm);

    PIsVUZ := False;
    PId_man:=0;
    PTn:=0;
    PAvg:=0;

    Screen.Cursor:=crHourGlass;

    try

      is_univer:=VarToStrDef(ValueFieldZSetup(AParameter.DB_Handle,'IS_UNIVER'),'NULL');

      DB.Handle:=AParameter.DB_Handle;
      ReadTransaction.StartTransaction;


      DataSet.Close;
      DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_SYS_ALGORITM (:id_alg,:ac_date,:id_param)';
      DataSet.ParamByName('id_alg').AsInteger   := 2;
      DataSet.ParamByName('ac_date').Asdate     := date;
      DataSet.ParamByName('id_param').AsInteger := AParameter.Id;
      DataSet.Open;


      DSetSetup.SQLs.SelectSQL.Text := 'SELECT SHORT_NAME, NAME_MANEG, GLBUHG_POST FROM Z_SETUP';
      PIsVUZ := (AParameter.Type_Id<>0) and (is_univer='T');
      if PIsVUZ then
      begin
        DSetGlobalData.SQLs.SelectSQL.Text:='SELECT * FROM Z_HOSP_LIST_DATA_VUZ('+
                                         IntToStr(AParameter.Id)+','''+
                                         AParameter.SortOrder+''')';


        DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_HOSP_AVG_DATA_2(?ID_MAN_HOSP1,?PERIOD_DATE_BEG1,?IS_SMENA1,?WORK_DATE_BEG1,?RMOVING1,?ID_MAN_HOSP2,?PERIOD_DATE_BEG2,?IS_SMENA2,?WORK_DATE_BEG2, :RMOVING2)';


        DSetFSSPredpr.SQLs.SelectSQL.Text := 'SELECT * FROM Z_HOSP_FSS_PREDP_COUNT_VUZ(?ID_MAN_HOSP1,?RMOVING1,?AVG_SUM1,?IS_SMENA1,?PERCENT1,?ID_MAN_HOSP2,?RMOVING2,?AVG_SUM2,?IS_SMENA2,?PERCENT2)';
        DSetFSSPredprTerms.SQLs.SelectSQL.Text := 'SELECT * FROM Z_HOSP_FSS_PREDP_COUNT_TERMS_V(?ID_MAN_HOSP1,?RMOVING1,?AVG_SUM1,?IS_SMENA1,?PERCENT1,?ID_MAN_HOSP2,?RMOVING2,?AVG_SUM2,?IS_SMENA2,?PERCENT2)';
      end
      else
      begin
        if AParameter.SortOrder='T' then
          DSetGlobalData.SQLs.SelectSQL.Text:='SELECT * FROM Z_HOSP_LIST_DATA('+
                                            IntToStr(AParameter.Id)+','+
                                            IntToStr(AParameter.Type_Id)+') order by tn'
        else
          DSetGlobalData.SQLs.SelectSQL.Text:='SELECT * FROM Z_HOSP_LIST_DATA('+
                                            IntToStr(AParameter.Id)+','+
                                            IntToStr(AParameter.Type_Id)+') order by fio';
        if(DataSet['ACTIV_ALGORITM']=1) then
            DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_HOSP_AVG_DATA(?ID_MAN_HOSP,?PERIOD_DATE_BEG,?IS_SMENA,?WORK_DATE_BEG) where rmoving=?rmoving'
        else
            DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_HOSP_AVG_DATA(?ID_MAN_HOSP,?PERIOD_DATE_BEG,?IS_SMENA,?WORK_DATE_BEG)';

        DSetFSSPredpr.SQLs.SelectSQL.Text := 'SELECT * FROM Z_HOSP_FSS_PREDP_COUNT(?ID_MAN_HOSP,?RMOVING,?AVG_SUM,?IS_SMENA,?PERCENT) order by IS_FIVE_DAYS DESCENDING';
        DSetFSSPredprTerms.SQLs.SelectSQL.Text := 'SELECT * FROM Z_HOSP_FSS_PREDP_COUNT_TERMS(?ID_MAN_HOSP,?RMOVING,?AVG_SUM,?IS_SMENA,?PERCENT) order by DATE_BEG';
      end;


      DSetSetup.Open;
      DSetGlobalData.Open;
      DSetData.Open;
      DSetFSSPredpr.Open;
      DSetFSSPredprTerms.Open;
    except
    on E:Exception do
      begin
       ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
       Exit;
      end;
    end;

    Report.Clear;

    if PIsVUZ then Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportVuz,True)
              else Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);

    Report.Variables.Clear;
    Report.Variables[' '+'User Category']:=NULL;
    Report.Variables.AddVariable('User Category',
                                 'PPeriod',
                                 ''''+KodSetupToPeriod(PKodSetup,0)+'''');

 finally
    CloseWaitForm(wf);
    Screen.Cursor:=crDefault;
 end;

 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;

 Report.Free;
end;

procedure TDM.FindAlg(id_hosp : integer);
begin
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_SYS_ALGORITM (:id_alg,:ac_date,:id_param)';
    DataSet.ParamByName('id_alg').AsInteger   := 2;
    DataSet.ParamByName('ac_date').Asdate     := date;
    DataSet.ParamByName('id_param').AsInteger := id_hosp;
    DataSet.Open;

    TypeAlg  := DataSet['ACTIV_ALGORITM'];
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if AnsiUpperCase(VarName)='P_KOD_SETUP' then
  begin
   if VarIsNUll(DSetData['KOD_SETUP']) then Value:=''
   else Value:=KodSetupToPeriod(DSetData['KOD_SETUP'],0);
  end;
if AnsiUpperCase(VarName)='P_KOD_SETUP1' then
  begin
   if VarIsNUll(DSetData['KOD_SETUP1']) then Value:=''
   else Value:=KodSetupToPeriod(DSetData['KOD_SETUP1'],0);
  end;
if AnsiUpperCase(VarName)='P_KOD_SETUP2' then
  begin
   if VarIsNUll(DSetData['KOD_SETUP2']) then Value:=''
   else Value:=KodSetupToPeriod(DSetData['KOD_SETUP2'],0);
  end;

if AnsiUpperCase(VarName)='DAY_CLOCK' then Value:=DAY_CLOCK(self);
if AnsiUpperCase(VarName)='DAY_CLOCK1' then Value:=DAY_CLOCK(self,'1');
if AnsiUpperCase(VarName)='DAY_CLOCK2' then Value:=DAY_CLOCK(self,'2');


if AnsiUpperCase(VarName)='HEADER_DAY_CLOCK' then
 begin
  if VarToStr(DSetGlobalData['IS_SMENA'])='T' then Value := 'Години'
  else Value := 'Дні';
 end;
if AnsiUpperCase(VarName)='HEADER_DAY_CLOCK1' then
 begin
  if VarToStr(DSetGlobalData['IS_SMENA1'])='T' then Value := 'Години'
  else Value := 'Дні';
 end;
if AnsiUpperCase(VarName)='HEADER_DAY_CLOCK2' then
 begin
  if VarToStr(DSetGlobalData['IS_SMENA2'])='T' then Value := 'Години'
  else Value := 'Дні';
 end;


if AnsiUpperCase(VarName)='P_SUM_DAYCLOCK' then Value:=P_SUM_DAYCLOCK(self);
if AnsiUpperCase(VarName)='P_SUM_DAYCLOCK1' then Value:=P_SUM_DAYCLOCK(self,'1');
if AnsiUpperCase(VarName)='P_SUM_DAYCLOCK2' then Value:=P_SUM_DAYCLOCK(self,'2');


if AnsiUpperCase(VarName)='P_TYPE_HOSPLIST' then
 begin
  if (VarIsNull(DSetGlobalData['ID_PARENT'])) or (DSetGlobalData['ID_PARENT']=-1) then
    Value:='Первинний'
  else Value:='Продовження';
 end;
if AnsiUpperCase(VarName)='P_TYPE_HOSPLIST1' then
 begin
  if (VarIsNull(DSetGlobalData['ID_PARENT1'])) or (DSetGlobalData['ID_PARENT1']=-1) then
    Value:='Первинний'
  else Value:='Продовження';
 end;
if AnsiUpperCase(VarName)='P_TYPE_HOSPLIST2' then
 begin
  if (VarIsNull(DSetGlobalData['ID_PARENT2'])) or (DSetGlobalData['ID_PARENT2']=-1) then
    Value:='Первинний'
  else Value:='Продовження';
 end;


if AnsiUpperCase(VarName)='DAY_CLOCK_HOSP' then value:=DAY_CLOCK_HOSP(Self);
if AnsiUpperCase(VarName)='DAY_CLOCK_HOSP1' then value:=DAY_CLOCK_HOSP(Self,'1');
if AnsiUpperCase(VarName)='DAY_CLOCK_HOSP2' then value:=DAY_CLOCK_HOSP(Self,'2');


if AnsiUpperCase(VarName)='HEADER_DAY_CLOCK_HOSP' then
 begin
  if VarToStr(DSetGlobalData['IS_SMENA'])='T' then
     Value := 'Дні/Години'
  else Value := 'Дні';
 end;
if AnsiUpperCase(VarName)='HEADER_DAY_CLOCK_HOSP1' then
 begin
  if VarToStr(DSetGlobalData['IS_SMENA1'])='T' then
     Value := 'Дні/Години'
  else Value := 'Дні';
 end;
if AnsiUpperCase(VarName)='HEADER_DAY_CLOCK_HOSP2' then
 begin
  if VarToStr(DSetGlobalData['IS_SMENA2'])='T' then
     Value := 'Дні/Години'
  else Value := 'Дні';
 end;


if AnsiUpperCase(VarName)='HEADER_IS_FIVE_DAYS' then
 begin
  if VarToStr(DSetFSSPredpr['IS_FIVE_DAYS'])='F' then
     Value := 'ФСС'
  else Value := 'П';
 end;
if AnsiUpperCase(VarName)='HEADER_IS_FIVE_DAYS1' then
 begin
  if (VarToStr(DSetFSSPredpr['IS_FIVE_DAYS1'])='F') then Value := 'ФСС'
  else Value := 'П';
 end;
if AnsiUpperCase(VarName)='HEADER_IS_FIVE_DAYS2' then
 begin
  if VarToStr(DSetFSSPredpr['IS_FIVE_DAYS2'])='F' then
     Value := 'ФСС'
  else Value := 'П';
 end;


if AnsiUpperCase(VarName)='HEADER_IS_FIVE_DAYS_TERMS' then
 begin
  if VarToStr(DSetFSSPredprTerms['IS_FIVE_DAYS'])='F' then
     Value := 'ФСС'
  else Value := 'П';
 end;
if AnsiUpperCase(VarName)='HEADER_IS_FIVE_DAYS_TERMS1' then
 begin
  if VarIsNULL(DSetFSSPredprTerms['IS_FIVE_DAYS1']) then Value:=''
  else
   begin
    if VarToStr(DSetFSSPredprTerms['IS_FIVE_DAYS1'])='F' then
       Value := 'ФСС'
    else Value := 'П';
   end;
 end;
if AnsiUpperCase(VarName)='HEADER_IS_FIVE_DAYS_TERMS2' then
 begin
  if VarIsNULL(DSetFSSPredprTerms['IS_FIVE_DAYS2']) then Value:=''
  else
   begin
    if VarToStr(DSetFSSPredprTerms['IS_FIVE_DAYS2'])='F' then
       Value := 'ФСС'
    else Value := 'П';
   end;
 end;


if AnsiUpperCase(VarName)='SUM_DAY_CLOCK_HOSP' then Value:=SUMMA_DAY_CLOCK_HOSP(self);
if AnsiUpperCase(VarName)='SUM_DAY_CLOCK_HOSP1' then Value:=SUMMA_DAY_CLOCK_HOSP(self,'1');
if AnsiUpperCase(VarName)='SUM_DAY_CLOCK_HOSP2' then Value:=SUMMA_DAY_CLOCK_HOSP(self,'2');

if AnsiUpperCase(VarName)='DAY_CLOCK_HOSP_TERMS' then Value:=DAY_CLOCK_HOSP_TERM(self);
if AnsiUpperCase(VarName)='DAY_CLOCK_HOSP_TERMS1' then Value:=DAY_CLOCK_HOSP_TERM(self,'1');
if AnsiUpperCase(VarName)='DAY_CLOCK_HOSP_TERMS2' then Value:=DAY_CLOCK_HOSP_TERM(self,'2');

if AnsiUpperCase(VarName)='SIGNATURE1'then Value:=DSetSetup['NAME_MANEG'];
if AnsiUpperCase(VarName)='SIGNATURE2'then Value:=DSetSetup['GLBUHG_POST'];
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

function TDM.DAY_CLOCK_HOSP(Sender:TObject;AddSymbol:string=''):string;
var Value:string;
begin
  if VarToStr(DSetGlobalData['IS_SMENA'+AddSymbol])='T' then
    begin

     if VarIsNULL(DSetFSSPredpr['HOSP_DAYS'+AddSymbol]) then Value := ''
     else
      if DSetFSSPredpr['HOSP_DAYS'+AddSymbol]=0 then Value:=''
      else Value:=VarToStr(DSetFSSPredpr['HOSP_DAYS'+AddSymbol])+'/';

     if VarIsNULL(DSetFSSPredpr['HOSP_HOURS'+AddSymbol]) then Value:=Value+'--,---'
     else
      if DSetFSSPredpr['HOSP_HOURS'+AddSymbol]=0 then Value:=Value+'--,---'
      else value:=value+FloatToStrF(DSetFSSPredpr['HOSP_HOURS'+AddSymbol],ffFixed,9,3);
     if Trim(Value)='' then Value:='--,---';
    end
  else
    begin
     if VarIsNULL(DSetFSSPredpr['HOSP_DAYS'+AddSymbol]) then Value := ''
     else
      if DSetFSSPredpr['HOSP_DAYS'+AddSymbol]=0 then Value:=''
      else Value:=VarToStr(DSetFSSPredpr['HOSP_DAYS'+AddSymbol]);

     if Trim(Value)='' then Value:='--';
    end;
    result:=Value;
end;

function TDM.DAY_CLOCK(Sender:TObject;AddSymbol:string=''):string;
var Value:string;
begin
  if VarToStr(DSetGlobalData['IS_SMENA'+AddSymbol])='T' then
    begin
     if VarIsNULL(DSetData['HOURS'+AddSymbol]) then Value:=Value+'--,---'
     else
      if DSetData['HOURS'+AddSymbol]=0 then Value:=Value+'--,---'
      else value:=value+FloatToStrF(DSetData['HOURS'+AddSymbol],ffFixed,9,3);
    end
  else
    begin
     if VarIsNULL(DSetData['DAYS'+AddSymbol]) then Value := '---'
     else
      if DSetData['DAYS'+AddSymbol]=0 then Value:='---'
      else Value:=VarToStr(DSetData['DAYS'+AddSymbol]);
    end;
    result:=Value;
end;

function TDM.DAY_CLOCK_HOSP_TERM(Sender:TObject;AddSymbol:string=''):string;
var Value:string;
begin
  if VarToStr(DSetGlobalData['IS_SMENA'+AddSymbol])='T' then
    begin

     if VarIsNULL(DSetFSSPredprTerms['HOSP_DAYS'+AddSymbol]) then Value := ''
     else
      if DSetFSSPredprTerms['HOSP_DAYS'+AddSymbol]=0 then Value:=''
      else Value:=VarToStr(DSetFSSPredprTerms['HOSP_DAYS'+AddSymbol])+'/';

     if VarIsNULL(DSetFSSPredprTerms['HOSP_HOURS'+AddSymbol]) then Value:=Value+'--,---'
     else
      if DSetFSSPredprTerms['HOSP_HOURS'+AddSymbol]=0 then Value:=Value+'--,---'
      else value:=value+FloatToStrF(DSetFSSPredprTerms['HOSP_HOURS'+AddSymbol],ffFixed,9,3);
    end
  else
    begin
     if VarIsNULL(DSetFSSPredprTerms['HOSP_DAYS'+AddSymbol]) then Value := '---'
     else
      if DSetFSSPredprTerms['HOSP_DAYS'+AddSymbol]=0 then Value:='---'
      else Value:=VarToStr(DSetFSSPredprTerms['HOSP_DAYS'+AddSymbol]);
    end;
    result:=Value;
end;

function TDM.P_SUM_DAYCLOCK(Sender:TObject;AddSymbol:string=''):string;
var Value:string;
    isSmena:string;
begin
  if AddSymbol='' then isSmena:='RMOVING_IS_SMENA'
                  else isSmena:='IS_SMENA';

  if VarToStr(DSetGlobalData['IS_SMENA'+AddSymbol])='T' then
    begin
     if VarIsNULL(DSetGlobalData['HOURS_ALL'+AddSymbol]) then Value:=Value+'0'
     else
      if DSetGlobalData['HOURS_ALL'+AddSymbol]=0 then Value:=Value+'0'
      else value:=value+FloatToStrF(DSetGlobalData['HOURS_ALL'+AddSymbol],ffFixed,9,3);
    end
  else Value := VarToStrDef(DSetGlobalData['DAYS_ALL'+AddSymbol],'0');
  result:=Value;
end;


function TDM.SUMMA_DAY_CLOCK_HOSP(Sender:TObject;AddSymbol:string=''):variant;
var SumDays,SumHours:double;
begin
   SumDays:=0;
   SumHours:=0;
   DSetFSSPredpr.First;
   while not DSetFSSPredpr.Eof do
    begin
     if not VarIsNull(DSetFSSPredpr['HOSP_HOURS'+AddSymbol]) then SumHours:=SumHours+DSetFSSPredpr['HOSP_HOURS'+AddSymbol];
     if not VarIsNull(DSetFSSPredpr['HOSP_DAYS'+AddSymbol]) then SumDays:=SumDays+DSetFSSPredpr['HOSP_DAYS'+AddSymbol];
     DSetFSSPredpr.Next;
    end;
   if VarToStr(DSetGlobalData['IS_SMENA'+AddSymbol])='T' then
    begin
     Result:=ifThen(SumDays=0,'--',FloatToStr(SumDays))+'/'+
                         ifThen(SumHours=0,'--,---',FloatToStrF(SumHours,ffFixed,6,3));
    end
   else Result:=ifThen(SumDays=0,'--',FloatToStr(SumDays));
   DSetFSSPredpr.First;
end;

end.

