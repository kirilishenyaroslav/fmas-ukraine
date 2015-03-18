unit SimpleReestrDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit, Unit_ZGlobal_Consts,
  ZWait, frxExportXLS, gr_uCommonLoader, RxMemDS, MultySmetaSimpleReestr;

function IniFileNameReportByTypeSimpleReestr(TypeSimpleReestr:TTypeSimpleReestr):string;


type
  TSimpleDM = class(TDataModule)
    SimpleDB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    SimpleDesigner: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    UserDSet: TfrxUserDataSet;
    frxXLSExport1: TfrxXLSExport;
    DSetAddData: TpFIBDataSet;
    ReportDSetAddData: TfrxDBDataset;
    DataSourceInput: TDataSource;
    DSetInput: TRxMemoryData;
    frxDBDataset1: TfrxDBDataset;
    SimpleReport: TfrxReport;
    procedure SimpleReportGetValue(const VarName: String; var Value: Variant);
  private
    PTypeSimpleReestr:TTypeSimpleReestr;
    PId_man:integer;
    PTn:integer;
    PLine:integer;
    PId_Vidopl:Integer;
    MemoryData: TRxMemoryData;
  public
    function PrintSpr(AParameter:TSimpleReestrParam):variant;
  end;


implementation

{$R *.dfm}

function IniFileNameReportByTypeSimpleReestr(TypeSimpleReestr:TTypeSimpleReestr):string;
begin
 case TypeSimpleReestr of
  tsrDuty: result:='DutyNameReport';
  tsrNarLimit: result:='NarLimitNameReport';

  tsrInvalid: result:='InvNameReport';
  tsrSumMoreVidrah: result:='NonLimitNameReport';
  tsrPererah: result:='PererahNameReport';
  else
   result:='NameReport'
 end;
end;

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SimpleReestr';
const NameReport               = 'Reports\Zarplata\SimpleReestr.fr3';
const NameReportBudget         = 'Reports\Zarplata\SimpleReestrBudget.fr3';
const NameReportDuty           = 'Reports\Zarplata\Sv_Duty.fr3';
const NameReportNarLimit       = 'Reports\Zarplata\Sv_NarLimit.fr3';
const NameReportFondInv        = 'Reports\Zarplata\ReeFondInv.fr3';
const NameReportFondInv2       = 'Reports\Zarplata\ReeFondInv2.fr3';
const NameReportNonLimit       = 'Reports\Zarplata\ReeNonLimit.fr3';
const NameReportPererah        = 'Reports\Zarplata\ReePererah.fr3';
const NameReportDodat23        = 'Reports\Zarplata\ReeDodat23.fr3';
const NameReportAccrualSingle  = 'Reports\Zarplata\ReeAccrualSingle.fr3';
const NameReportAccrualSingleForMan  ='Reports\Zarplata\ReeAccrualSingleForMan.fr3';

function TSimpleDM.PrintSpr(AParameter:TSimpleReestrParam):variant;
var IniFile:TIniFile;
    ViewMode:integer;
    PathReport:string;
    VNameReport:string;
    wf:TForm;
    PParam:TgrSimpleParam;
    Sch:Variant;
    i: byte;
    Smeta:TDataSet;

begin
 wf:=ShowWaitForm(TForm(Self.Owner));
 PId_man:=0;
 PTypeSimpleReestr:=AParameter.TypeSimpleReestr;
 PTn:=0;
 SimpleDB.Handle:=AParameter.SvodParam.DB_Handle;
 ReportDsetData.DataSet:=DSetData;
 try
   Screen.Cursor:=crHourGlass;

   case AParameter.TypeSimpleReestr of
    tsrDuty:
     begin
      PParam:=TgrSimpleParam.Create;
      PParam.DB_Handle:=AParameter.SvodParam.DB_Handle;
      PParam.Owner:=AParameter.SvodParam.AOwner;
      PParam.KodCur := Aparameter.SvodParam.Kod_setup;
      sch:=ShowSpSch(PParam,29);
      if not(VarArrayDimCount(Sch)>0) then Exit;

      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_SV_DUTY_DATA('+
                                    IntToStr(AParameter.SvodParam.Kod_setup)+','+VarToStr(sch[0])+') order by fio';


      VNameReport:=NameReportDuty;
     end;

     tsrNarLimit:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_NAR_LIMIT('+
                                    IntToStr(AParameter.SvodParam.Kod_setup)+') order by Sch_Title, Fio Collate Win1251_Ua';


      VNameReport:=NameReportNarLimit;
     end;

    tsrInvalid:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_FONDINV('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+',NULL) ORDER BY FIO,TN,ID_MAN,KOD_SETUP_O2 DESCENDING';
      VNameReport:=NameReportFondInv;
     end;
    tsrInvalid2:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_FONDINV2('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+',NULL) ORDER BY NAME_SMETA,FIO,TN,ID_MAN,KOD_SETUP_O2 DESCENDING';
      VNameReport:=NameReportFondInv2;
     end;
    tsrSumMoreVidrah:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_NONLIMIT('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+',NULL) ORDER BY FIO,TN,ID_MAN,KOD_SETUP3 DESCENDING';
      VNameReport:=NameReportNonLimit;
     end;
    tsrPererah:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_PERER('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+') ORDER BY FIO,TN,ID_MAN,KOD_SETUP3 DESCENDING';
      VNameReport:=NameReportPererah;
     end;
    tsrPFU:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_DODAT23('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+') ORDER BY KOD_SETUP3';
      VNameReport:=NameReportDodat23;
     end;
    tsrAccrualSingle:
    begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_ACCRUAL_SINGLE_SUM('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+',''F'')';

      DSetAddData.SQLs.SelectSQL.Text:='SELECT * FROM Z_PAR_SET_SELECT_BY_KOD_SETUP('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+')';
      VNameReport:=NameReportAccrualSingle;
    end;
    tsrAccrualSingleForManAll:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_ACCRUAL_SINGLE_SUM('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+',''T'') order by fio, kod_set_tax_group';
      VNameReport:=NameReportAccrualSingleForMan;
     end;
    tsrAccrualSingleForInvalid:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_ACCRUAL_SINGLE_SUM('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+',''I'') order by fio, kod_set_tax_group';
      VNameReport:=NameReportAccrualSingleForMan;
     end;
    tsrAccrualSingleForManOwer:
     begin
      DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_REESTR_ACCRUAL_SINGLE_SUM('+
                                     IntToStr(AParameter.SvodParam.Kod_setup)+',''O'') order by fio, kod_set_tax_group';
      VNameReport:=NameReportAccrualSingleForMan;
     end;
    tsrAlimony_budget:
     begin
      PParam:=TgrSimpleParam.Create;
      PParam.DB_Handle:=AParameter.SvodParam.DB_Handle;
      PParam.Owner:=AParameter.SvodParam.AOwner;
      Smeta:=GetSmetsMulty(AParameter.SvodParam.AOwner,AParameter.SvodParam.DB_Handle, AParameter.SvodParam.Kod_setup, AParameter.SvodParam.ID_Session,
      IdVidOplPropFromTypeSimpleReestr(AParameter.TypeSimpleReestr));
      if Smeta=nil then
      begin
            Screen.Cursor:=crDefault;
            Exit;
      end;

      DSetInput:=TrxMemoryData(Smeta);
      DataSourceInput.DataSet:=DSetInput;
      DSetData.DataSource:=DataSourceInput;
      frxDBDataset1.DataSet:=DSetInput;

      DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SIMPLEREESTR_DATA_BUDGET('+
                                       IntToStr(IdVidOplPropFromTypeSimpleReestr(AParameter.TypeSimpleReestr))+', '+
                                       ':ID_SMETA'+', '+
                                       IntToStr(AParameter.SvodParam.ID_Session)+', '+
                                       IntToStr(AParameter.SvodParam.Kod_setup)+
                                       ') order by  KOD_SMETA descending, NAME_VIDOPL, FIO';

      VNameReport:=NameReportBudget;
     end;
     else
      begin
        PParam:=TgrSimpleParam.Create;
        PParam.DB_Handle:=AParameter.SvodParam.DB_Handle;
        PParam.Owner:=AParameter.SvodParam.AOwner;
        PParam.KodCur := Aparameter.SvodParam.Kod_setup;
        sch:=ShowSpSch(PParam,29);
        if not(VarArrayDimCount(Sch)>0) then
          begin
            Screen.Cursor:=crDefault;
            Exit;
          end;

        DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SIMPLEREESTR_DATA('+
                                         IntToStr(IdVidOplPropFromTypeSimpleReestr(AParameter.TypeSimpleReestr))+','+
                                         IntToStr(AParameter.SvodParam.Kod_setup)+', '+
                                         VarToStr(sch[0])+')order by KOD_SCH descending, KOD_VIDOPL descending, FIO descending';
        VNameReport:=NameReport;
      end;
   end;

   DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SIMPLEREESTR_GLOBALDATA('+
                                          IntToStr(IdVidOplPropFromTypeSimpleReestr(AParameter.TypeSimpleReestr))+')';

  
   if (AParameter.TypeSimpleReestr=tsrAlimony_budget) then
      try
        DSetData.Close;
        DSetData.Open;
        DSetGlobalData.Open;
        MemoryData:=TRxMemoryData.Create(self);
        ReportDsetData.DataSet:=MemoryData;    //////////
        MemoryData.FieldDefs.Add('TN',ftInteger);
        MemoryData.FieldDefs.Add('FIO',ftString,62);
        MemoryData.FieldDefs.Add('SUMMA',ftCurrency);
        MemoryData.FieldDefs.Add('KOD_SMETA',ftString,30);
        MemoryData.FieldDefs.Add('NAME_SMETA',ftString,60);
        MemoryData.FieldDefs.Add('KOD_VIDOPL',ftInteger);
        MemoryData.FieldDefs.Add('NAME_VIDOPL',ftString,255);

        MemoryData.Open;

        DSetData.Close;
        DSetInput.First;
        DSetData.Open;
        DSetData.First;
        while not(DSetInput.Eof) do
        begin

          while not(DSetData.Eof) do
          begin
            MemoryData.Insert;

            MemoryData['TN']:=DSetData['TN'];
            MemoryData['FIO']:=DSetData['FIO'];
            MemoryData['SUMMA']:=DSetData['SUMMA'];
            MemoryData['KOD_SMETA']:=DSetData['KOD_SMETA'];
            MemoryData['NAME_SMETA']:=DSetData['NAME_SMETA'];
            MemoryData['KOD_VIDOPL']  :=DSetData['KOD_VIDOPL'];
            MemoryData['NAME_VIDOPL'] :=DSetData['NAME_VIDOPL'];

            MemoryData.Post;
            DSetData.Next;
          end;
          DSetInput.Next;
        end;
      MemoryData.first;
      ReportDsetData.DataSet:=MemoryData;
    except
     on E:Exception do
      begin
       ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
       Exit;
      end;
    end;


   if((AParameter.TypeSimpleReestr=tsrDuty)or
     ((AParameter.TypeSimpleReestr<>tsrInvalid)and
      (AParameter.TypeSimpleReestr<>tsrNarLimit)and
      (AParameter.TypeSimpleReestr<>tsrInvalid2)and
      (AParameter.TypeSimpleReestr<>tsrSumMoreVidrah)and
      (AParameter.TypeSimpleReestr<>tsrPererah)and
      (AParameter.TypeSimpleReestr<>tsrPFU)and
      (AParameter.TypeSimpleReestr<>tsrAccrualSingle)and
      (AParameter.TypeSimpleReestr<>tsrAccrualSingleForManAll) and
      (AParameter.TypeSimpleReestr<>tsrAccrualSingleForInvalid) and
      (AParameter.TypeSimpleReestr<>tsrAccrualSingleForManOwer) and
      (AParameter.TypeSimpleReestr<>tsrAlimony_budget)))then
   try
    DSetData.Close;
    DSetData.Open;
    DSetGlobalData.Open;
    if AParameter.TypeSimpleReestr=tsrAccrualSingle then
      DSetAddData.Open;

    MemoryData:=TRxMemoryData.Create(self);
    ReportDsetData.DataSet:=MemoryData;    //////////
    MemoryData.FieldDefs.Add('TN',ftInteger);
    MemoryData.FieldDefs.Add('FIO',ftString,62);
    MemoryData.FieldDefs.Add('NAME_SCH',ftString,60);
    MemoryData.FieldDefs.Add('KOD_SCH',ftString,30);
    MemoryData.FieldDefs.Add('SUMMA',ftCurrency);
    
    if((AParameter.TypeSimpleReestr=tsrInvalid)or
       (AParameter.TypeSimpleReestr=tsrInvalid2))then
    begin
      MemoryData.FieldDefs.Add('SUMMA_DOG_PODR',ftCurrency);
    end;

    if(AParameter.TypeSimpleReestr=tsrNarLimit) then
    begin
      MemoryData.FieldDefs.Add('PERIOD',ftString,10);
      MemoryData.FieldDefs.Add('SUMMA_FACT',ftString,10);
      MemoryData.FieldDefs.Add('SUMMA_NAR',ftCurrency);
      MemoryData.FieldDefs.Add('SUMMA_RAZN',ftCurrency);
       MemoryData.FieldDefs.Add('ALLDAY',ftInteger);
        MemoryData.FieldDefs.Add('FACT_DAY',ftInteger);
    end;

    if(AParameter.TypeSimpleReestr=tsrDuty)then
    begin
      MemoryData.FieldDefs.Add('KOD_SMETA',ftInteger);
      MemoryData.FieldDefs.Add('KOD_DEPARTMENT',ftString,10);
    end
    else
    begin
      MemoryData.FieldDefs.Add('KOD_VIDOPL',ftInteger);
      MemoryData.FieldDefs.Add('NAME_VIDOPL',ftString,255);
    end;
    MemoryData.Open;
    while not(DSetData.Eof) do
    begin
      MemoryData.Insert;
      MemoryData['TN']:=DSetData['TN'];
      MemoryData['FIO']:=DSetData['FIO'];
      MemoryData['NAME_SCH']:=DSetData['NAME_SCH'];
      MemoryData['KOD_SCH']:=DSetData['KOD_SCH'];
      MemoryData['SUMMA']:=DSetData['SUMMA'];
      if((AParameter.TypeSimpleReestr=tsrInvalid)or
         (AParameter.TypeSimpleReestr=tsrInvalid2))then
      begin
        MemoryData['SUMMA_DOG_PODR']:=DSetData['SUMMA_DOG_PODR'];
      end;

      if(AParameter.TypeSimpleReestr=tsrNarLimit) then
      begin
          MemoryData['PERIOD']:=DSetData['PERIOD'];
          MemoryData['SUMMA_FACT']:=DSetData['SUMMA_FACT'];
          MemoryData['SUMMA_NAR']:=DSetData['SUMMA_NAR'];
          MemoryData['SUMMA_RAZN']:=DSetData['SUMMA_RAZN'];
          MemoryData['ALLDAY']:=DSetData['ALLDAY'];
          MemoryData['FACT_DAY']:=DSetData['FACT_DAY'];
      end;

      if(AParameter.TypeSimpleReestr=tsrDuty)then
      begin
        MemoryData['KOD_SMETA']     :=DSetData['KOD_SMETA'];
        MemoryData['KOD_DEPARTMENT']:=DSetData['KOD_DEPARTMENT'];
      end
      else
      begin
        MemoryData['KOD_VIDOPL']  :=DSetData['KOD_VIDOPL'];
        MemoryData['NAME_VIDOPL'] :=DSetData['NAME_VIDOPL'];
      end;
      MemoryData.Post;
      DSetData.Next;
    end;



    if ((AParameter.TypeSimpleReestr=tsrDuty)or
       ((AParameter.TypeSimpleReestr<>tsrInvalid)and
        (AParameter.TypeSimpleReestr<>tsrNarLimit)and
        (AParameter.TypeSimpleReestr<>tsrInvalid2)and
        (AParameter.TypeSimpleReestr<>tsrSumMoreVidrah)and
        (AParameter.TypeSimpleReestr<>tsrPererah)and
        (AParameter.TypeSimpleReestr<>tsrPFU)and
         (AParameter.TypeSimpleReestr<>tsrAccrualSingle)and
         (AParameter.TypeSimpleReestr<>tsrAccrualSingleForManAll)and
         (AParameter.TypeSimpleReestr<>tsrAccrualSingleForInvalid)and
         (AParameter.TypeSimpleReestr<>tsrAccrualSingleForManOwer) and
         (AParameter.TypeSimpleReestr<>tsrAlimony_budget))) then
    begin
      for i:=1 to (VarArrayHighBound(Sch,1)-1) do
      begin
        DSetData.Close;
        if (AParameter.TypeSimpleReestr=tsrDuty)then
          DSetData.SQLs.SelectSQL.Text:='SELECT * FROM Z_SV_DUTY_DATA('+
                                      IntToStr(AParameter.SvodParam.Kod_setup)+','+VarToStr(sch[i])+') order by fio'
        else
          DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SIMPLEREESTR_DATA('+
                                      IntToStr(IdVidOplPropFromTypeSimpleReestr(AParameter.TypeSimpleReestr))+','+
                                      IntToStr(AParameter.SvodParam.Kod_setup)+','+
                                      VarToStr(sch[i])+') order by KOD_SCH descending, KOD_VIDOPL descending, FIO descending';
        DSetData.Open;
        if AParameter.TypeSimpleReestr=tsrAccrualSingle then
            DSetAddData.Open;

        while not(DSetData.Eof) do
        begin
          MemoryData.Insert;
          MemoryData['TN']:=DSetData['TN'];
          MemoryData['FIO']:=DSetData['FIO'];
          MemoryData['NAME_SCH']:=DSetData['NAME_SCH'];
          MemoryData['KOD_SCH']:=DSetData['KOD_SCH'];
          MemoryData['SUMMA']:=DSetData['SUMMA'];
          if(AParameter.TypeSimpleReestr=tsrDuty)then
          begin
            MemoryData['KOD_SMETA']:=DSetData['KOD_SMETA'];
            MemoryData['KOD_DEPARTMENT']:=DSetData['KOD_DEPARTMENT'];
          end
          else
          begin
            MemoryData['KOD_VIDOPL']:=DSetData['KOD_VIDOPL'];
            MemoryData['NAME_VIDOPL']:=DSetData['NAME_VIDOPL'];
          end;
          MemoryData.Post;
          DSetData.Next;
        end;
      end;
      ReportDsetData.DataSet:=MemoryData;
    end;

   except
     on E:Exception do
      begin
       ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
       Exit;
      end;
   end;


   if(DSetData.Active=false) then DSetData.Open;
   if AParameter.TypeSimpleReestr=tsrAccrualSingle then
   if(DSetAddData.Active=false) then DSetAddData.Open;


   case AParameter.TypeSimpleReestr of
    tsrInvalid:
     begin
      UserDSet.RangeEndCount:=DSetData.RecordCount;
      UserDSet.RangeEnd:=reCount;
      UserDSet.Fields.Add('P_PERIOD');
      UserDSet.Fields.Add('P_TN');
      UserDSet.Fields.Add('P_FIO');
      UserDSet.Fields.Add('P_SUMMA');
      UserDSet.Fields.Add('P_SUMMA_DOG_PODR');
      UserDSet.Fields.Add('P_CODE_DEPARTMENT');
     end;

     tsrNarLimit:
     begin
      UserDSet.RangeEndCount:=DSetData.RecordCount;
      UserDSet.RangeEnd:=reCount;
      UserDSet.Fields.Add('P_PERIOD');
      UserDSet.Fields.Add('P_TN');
      UserDSet.Fields.Add('P_FIO');

      UserDSet.Fields.Add('P_SUMMA_FACT');
      UserDSet.Fields.Add('P_SUMMA_NAR');
      UserDSet.Fields.Add('P_SUMMA_RAZN');
      UserDSet.Fields.Add('P_ALLDAY');
      UserDSet.Fields.Add('P_FACT_DAY');
     end;

    tsrSumMoreVidrah:
     begin
      UserDSet.RangeEndCount:=DSetData.RecordCount;
      UserDSet.RangeEnd:=reCount;
      UserDSet.Fields.Add('P_PERIOD');
      UserDSet.Fields.Add('P_TN');
      UserDSet.Fields.Add('P_FIO');
      UserDSet.Fields.Add('P_SUM_PENS');
      UserDSet.Fields.Add('P_SUM_SOC');
      UserDSet.Fields.Add('P_SUM_INV');
      UserDSet.Fields.Add('P_SUM_FZAN');
      UserDSet.Fields.Add('P_CODE_DEPARTMENT');
     end;
   end;


   IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
   ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
   PathReport:=IniFile.ReadString(SectionOfIniFile,
                                  IniFileNameReportByTypeSimpleReestr(AParameter.TypeSimpleReestr),
                                  VNameReport);

   IniFile.Free;
   SimpleReport.Clear;

   SimpleReport.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);

   SimpleReport.Variables.Clear;
   SimpleReport.Variables[' '+'User Category']:=NULL;
   SimpleReport.Variables.AddVariable('User Category',
                                'PPeriod',
                                 ''''+KodSetupToPeriod(AParameter.SvodParam.Kod_setup,4)+'''');

   Screen.Cursor:=crDefault;
   if zDesignReport then
      SimpleReport.DesignReport    else
      SimpleReport.ShowReport;
   SimpleReport.Free;

  finally
   CloseWaitForm(wf);
  end;
end;

procedure TSimpleDM.SimpleReportGetValue(const VarName: String; var Value: Variant);
var tempIdMan:Integer;
begin
 case PTypeSimpleReestr of
  tsrInvalid:
   begin
    DSetData.RecNo:=UserDSet.RecNo+1;
    if not DSetData.Bof then
     begin
      DSetData.Prior;
      tempIdMan:=DSetData['ID_MAN'];
      DSetData.Next;
     end
    else
     begin
      tempIdMan:=-1;
      PLine:=0;
     end;
    if UpperCase(VarName)='PLINE' then
     begin
      inc(PLine);
      Value:=IfThen(tempIdMan<>DSetData['ID_MAN'],PLine,'');
     end;
    if UpperCase(VarName)='P_FIO' then
      Value:=IfThen(tempIdMan<>DSetData['ID_MAN'],DSetData['FIO'],'');
    if UpperCase(VarName)='P_TN' then
      Value:=IfThen(tempIdMan<>DSetData['ID_MAN'],DSetData['TN'],'');
    if UpperCase(VarName)='P_SUMMA' then Value:=DSetData['SUMMA'];
    if UpperCase(VarName)='P_SUMMA_DOG_PODR' then Value:=DSetData['SUMMA_DOG_PODR'];
    if UpperCase(VarName)='P_CODE_DEPARTMENT' then Value:=DSetData['CODE_DEPARTMENT'];
    if UpperCase(VarName)='P_PERIOD' then Value:=KodSetupToPeriod(DSetData['KOD_SETUP_O2'],1);
   end;

   tsrNarLimit:
   begin
     if UpperCase(VarName)='P_SUMMA_FACT' then Value:=DSetData['SUMMA_FACT'];
     if UpperCase(VarName)='P_SUMMA_NAR' then Value:=DSetData['SUMMA_NAR'];
     if UpperCase(VarName)='P_SUMMA_RAZN' then Value:=DSetData['SUMMA_RAZN'];
     if UpperCase(VarName)='P_ALLDAY' then Value:=DSetData['ALLDAY'];
     if UpperCase(VarName)='P_FACT_DAY' then Value:=DSetData['FACT_DAY'];

   end;

  tsrInvalid2:
   begin
{    DSetData.RecNo:=UserDSet.RecNo+1;
    if not DSetData.Bof then
     begin
      DSetData.Prior;
      tempIdMan:=DSetData['ID_MAN'];
      DSetData.Next;
     end
    else
     begin
      tempIdMan:=-1;
      PLine:=0;
     end;
    if UpperCase(VarName)='PLINE' then
     begin
      inc(PLine);
      Value:=IfThen(tempIdMan<>DSetData['ID_MAN'],PLine,'');
     end;
    if UpperCase(VarName)='P_FIO' then
      Value:=IfThen(tempIdMan<>DSetData['ID_MAN'],DSetData['FIO'],'');
    if UpperCase(VarName)='P_TN' then
      Value:=IfThen(tempIdMan<>DSetData['ID_MAN'],DSetData['TN'],'');
    if UpperCase(VarName)='P_SUMMA' then Value:=DSetData['SUMMA'];
    if UpperCase(VarName)='P_CODE_DEPARTMENT' then Value:=DSetData['NAME_SMETA'];}
    if UpperCase(VarName)='P_PERIOD' then Value:=KodSetupToPeriod(DSetData['KOD_SETUP_O2'],1);
   end;
  tsrSumMoreVidrah:
   begin
    DSetData.RecNo:=UserDSet.RecNo+1;
    if UpperCase(VarName)='P_TN' then
     begin
      Value:=IfThen(PTn<>DSetData['TN'],DSetData['TN'],'');
      PTn:=DSetData['TN'];
     end;
    if UpperCase(VarName)='P_FIO' then
     begin
      Value:=IfThen(PId_man<>DSetData['ID_MAN'],DSetData['FIO'],'');
      PId_man:=DSetData['ID_MAN'];
     end;
    if UpperCase(VarName)='P_SUM_PENS' then Value:=DSetData['SUM_PENS'];
    if UpperCase(VarName)='P_SUM_SOC' then Value:=DSetData['SUM_SOC'];
    if UpperCase(VarName)='P_SUM_FZAN' then Value:=DSetData['SUM_FZAN'];
    if UpperCase(VarName)='P_SUM_INV' then Value:=DSetData['SUM_INV'];
    if UpperCase(VarName)='P_PERIOD' then Value:=KodSetupToPeriod(DSetData['KOD_SETUP3'],1);
   end;
  tsrPererah:
   begin
    if UpperCase(VarName)='P_PERIOD' then Value:=KodSetupToPeriod(DSetData['KOD_SETUP3'],1);
   end;
  tsrPFU:
   begin
    if UpperCase(VarName)='P_PERIOD' then Value:=KodSetupToPeriod(DSetData['KOD_SETUP3'],1);
   end;
  tsrAccrualSingleForManAll:
   begin
      if UpperCase(VarName)='FILTER' then
        value:=''
   end;
  tsrAccrualSingleForInvalid:
   begin
      if UpperCase(VarName)='FILTER' then
        value:='(працюючі інваліди)'
   end;
  tsrAccrualSingleForManOwer:
   begin
      if UpperCase(VarName)='FILTER' then
        value:='(перевищення)'
   end;
  tsrAccrualSingle:
   begin
     if UpperCase(VarName)='FILTER' then
       value:='';
   end
  else
   exit;
 end;


end;

end.

