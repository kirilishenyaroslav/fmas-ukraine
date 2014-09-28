unit ZProc;

interface

Uses FIBDataSet, pFIBDataSet, DB, Forms, SysUtils, Classes, StrUtils,Dialogs,StdCtrls,ZTypes,
     Unit_Common_Consts, Z_StProc_DM, IBase, Controls, ZMessages, Unit_ZGlobal_Consts, Registry,
     Windows, Math, pFibStoredProc, pfibDataBase, zWait, IniFiles, Grids, TableCentral,
     Graphics, WorkModeCentral, DateUtils, WorkModeInfo, IBDataBase;


function DrawWorkMode(Date1, Date2: TDate; Id_Work_Mode, Shift: Integer;Trans:TibTransaction;ViewString:String): Integer;
function DrawWorkModeEx(Grid:TStringGrid; Date1, Date2: TDate; Id_Work_Mode, Shift: Integer;Trans:TibTransaction): Integer;
function zDesignReport:boolean;
function GetNameFirm(DB_Handle:TISC_DB_HANDLE;FieldName:string='NAME_FULL'):variant;
function zIdUser:string;
procedure DataSetCloseOpen(ComeDataSet:TpFIBDataSet;ComeKeyField:string='';const DoFetchAll:boolean=true);
procedure DataSetsCloseOpen(ADataSetParent:TpFIBDataSet;ADataSetChild:TpFIBDataSet;AKeyFieldParent:string='';AKeyFieldChild:string='');
function  IsMDIChildFormShow(AClass:TClass):boolean;
function  SumToString(ASumma:extended):string;overload;
function  SumToString(ASumma:extended;ATypeSumToString:byte;ANormalString:boolean=True):string;overload;
function  IfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant; overload;
Function  TypeWorkReturn(AStud:byte;AWork:byte):string;
function  StringPrepareToQueryText(AText:string):string;
function  LanguageIndex:byte;
function  ZSystemDecimalSeparator:string;
function zRoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;
function CurrentKodSetup(DB_Handle:TISC_DB_HANDLE):integer;
function NumPredpr(DB_Handle:TISC_DB_HANDLE):integer;
function VoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Prop:integer=0):variant;overload;
function VoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Id_System:integer;Prop:integer):variant;overload;
function SmetaByKod(Kod:integer;DB_Handle:TISC_DB_HANDLE):variant;
function DepartmentByKod(Kod:string;DB_Handle:TISC_DB_HANDLE):variant;
function ManByTn(Tn:integer;DB_Handle:TISC_DB_HANDLE):variant;
function CurrentAction(DB_Handle:TISC_DB_HANDLE;var AKod_Action:integer;var AIs_Finished:boolean):string;
function SetBeginAction(DB_Handle:TISC_DB_HANDLE;AKod_Action:integer):boolean;
function SetEndAction(DB_Handle:TISC_DB_HANDLE;AIs_Finished:string):boolean;
function ValueFieldZSetup(DB_Handle:TISC_DB_HANDLE;NameField:string):variant;
procedure zShowStProcParametersData(StProc:TpFIBStoredProc);
function GetIdGroupAccount(DB_Handle:TISC_DB_HANDLE;var id:integer):boolean;
function zFormSheet(DB_Handle:TISC_DB_HANDLE;aTypeSheet:integer;SumLimit:variant):boolean;
function GetConst(ConstName:string;ConstType:string):string;
function GetMonthList:string;
function TransliterationUkrEng(Text:string):string;


const tcButton = 'Button';
const tcLabel = 'Label';
const tcTabSheet = 'TabSheet';
const tcGridColumn = 'GridColumn';
const tcRadioButton = 'RadioButton';
const tcGroupBox = 'GroupBox';
const tcCheckBox = 'CheckBox';
const tcForm = 'Form';
const tcOtherConst = 'OtherConsts';

implementation

uses VarUtils, FIBQuery, pFIBQuery, Variants;

const Kopeika   : array[1..2,1..20] of string =(('коп≥йок','коп≥йка','коп≥йки','коп≥йки','коп≥йки','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок','коп≥йок'),
                                                ('копеек','копейка','копейки','копейки','копейки','копеек','копеек','копеек','копеек','копеек','копеек','копеек','копеек','копеек','копеек','копеек','копеек','копеек','копеек','копеек'));
{const Grivnja   : array[1..2,1..20] of string =(('гривень','гривн€','гривн≥','гривн≥','гривн≥','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень'),
                                                ('гривень','гривна','гривны','гривны','гривны','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень','гривень'));}
const Grivnja   : array[1..2,1..20] of string =(('грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.'),
                                                ('грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.','грн.'));
const DigitWoMan: array[1..2,1..20] of string =(('','одна','дв≥','три','чотири','п''€ть','ш≥сть','с≥м','в≥с≥м','дев''€ть','дес€ть','одинадц€ть','дванадц€ть','тринадц€ть','чотирнадц€ть','п''€тнадц€ть','ш≥стнадц€ть','с≥мнадц€ть','в≥с≥мнадц€ь','дев''€тнадц€ть'),
                                                ('','одна','две','три','четыре','п€ть','шесть','семь','восемь','дев€ть','дес€ть','одиннадцать','двенадцать','тринадцать','четырнадцать','п€тнадцать','шестнадцать','семнадцать','восемнадцать','дев€тнадцать'));
const DigitMan  : array[1..2,1..20] of string =(('','один','два','три','чотири','п''€ть','ш≥сть','с≥м','в≥с≥м','дев''€ть','дес€ть','одинадц€ть','дванадц€ть','тринадц€ть','чотирнадц€ть','п''€тнадц€ть','ш≥стнадц€ть','с≥мнадц€ть','в≥с≥мнадц€ь','дев''€тнадц€ть'),
                                                ('','один','два','три','четыре','п€ть','шесть','семь','восемь','дев€ть','дес€ть','одиннадцать','двенадцать','тринадцать','четырнадцать','п€тнадцать','шестнадцать','семнадцать','восемнадцать','дев€тнадцать'));
const Ten       : array[1..2,1..10] of string =(('','дес€ть','двадц€ть','тридц€ть','сорок','п''€тдес€т','ш≥стдес€т','с≥мдес€т','в≥с≥мдес€т','дев''€носто'),
                                                ('','дес€ть','двадцать','тридцать','сорок','п€тьдес€т','шестьдес€т','семьдес€т','восемьдес€т','дев€носто'));
const Hundread  : array[1..2,1..10] of string =(('','сто','дв≥ст≥','триста','чотириста','п''€тсот','ш≥стсот','с≥мсот','в≥с≥мсот','дев''€тсот'),
                                                ('','сто','двести','триста','четыреста','п€тсот','шестсот','семьсот','восемьсот','дев€тсот'));
const Thousand  : array[1..2,1..20] of string =(('тис€ч','тис€ча','тис€ч≥','тис€ч≥','тис€ч≥','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч','тис€ч'),
                                                ('тыс€ч','тыс€ча','тыс€чи','тыс€чи','тыс€чи','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч','тыс€ч'));
const Million   : array[1..2,1..20] of string =(('м≥льйон≥в','м≥льйон','м≥льйона','м≥льйона','м≥льйона','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в','м≥льйон≥в'),
                                                ('миллионов','миллион','миллиона','миллиона','миллиона','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов','миллионов'));
const Milliard  : array[1..2,1..20] of string =(('м≥ль€рд≥в','м≥ль€рд','м≥ль€рда','м≥ль€рда','м≥ль€рда','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в','м≥ль€рд≥в'),
                                                ('миллиардов','миллиард','миллиарда','миллиарда','миллиарда','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов','миллиардов'));

const TableTransliterationUkrEng : array[1..3,1..35] of string =(('ј','Ѕ','¬','√','ƒ','≈','™','∆','«','»','≤','ѓ','…',' ','Ћ','ћ','Ќ','ќ','ѕ','–','—','“','”','‘','’','÷','„','Ў','ў','ё','я','№','Џ','''',' '),
                                                                 ('A','B','V','H','D','E','YE','ZH','Z','Y','I','YI','Y','K','L','M','N','O','P','R','S','T','U','F','KH','TS','CH','SH','SHCH','YU','YA','','','',' '),
                                                                 ('A','B','V','H','D','E','IE','ZH','Z','Y','I','I','I','K','L','M','N','O','P','R','S','T','U','F','KH','TS','CH','SH','SHCH','IU','IA','','','',' '));


const ManState  : array[1..2,1..5] of boolean = ((False,False,False,True,True),(False,True,False,True,True));

function LanguageIndex:byte;
begin
 Result:=1;
end;

function ZSystemDecimalSeparator:string;
var reg: TRegistry;
    res:string;
begin
 reg:=TRegistry.Create;
  try
   Reg.RootKey := HKEY_CURRENT_USER;
   if Reg.OpenKey('\Control Panel\International\', False) then
   begin
     Res:=Reg.ReadString('SDecimal');
     Reg.CloseKey;
   end
   else
    res:=',';
  finally
   Reg.Free;
  end;
 Result:=Res;
end;

function DrawWorkModeEx(Grid:TStringGrid; Date1, Date2: TDate; Id_Work_Mode, Shift: Integer;Trans:TibTransaction): Integer;
var
    span: TTableDaySpan;
    i: Integer;
    real_shift: Integer;
    s, s2, s3: string;
    T:TfrmWorkModeInfo;
    Col_Count: Extended;
begin
    Col_Count:=Date2-Date1;
    try
        // √отовим √рид

        Grid.RowCount := 3;
        Grid.ColCount := trunc(Col_Count) + 1;
        Grid.FixedCols := 1;
        Grid.FixedRows := 2;
        Grid.DefaultColWidth := 40;
        Grid.DefaultRowHeight := 20;
        Grid.FixedColor := RGB(220, 250, 255);
        Grid.Color := clInfoBk;
        Grid.Cells[0, 1] := 'ƒата';
        Grid.Cells[0, 2] := '√один';

        WorkModeCenter:=TWorkModeCenter.Create(Trans);
        WorkModeCenter.ReLoad;

        WorkModeCenter.Id_Work_Mode := Id_Work_Mode;
        WorkModeCenter.Shift := Shift;
        real_shift := WorkModeCenter.NormalizedShift;
        result := real_shift;

        // создать промежуток дней табел€

        span := TTableDaySpan.Create(Date1, Date1 + Col_Count);

        // выбрать все клетки

        span.SelectAll;

        // установить режим и сдвижку

        span.SetMode(Id_Work_Mode, real_shift, 1);

        // подсчитать часы

        span.CalcDays;

        // вывести строчку часов

        for i := 1 to span.Count do
        begin

            if MonthOf(Date1 + i - 1) < 10 then
                s := '0'
            else
                s := '';

            if DayOfTheMonth(Date1 + i - 1) < 10 then
                s2 := '0'
            else
                s2 := '';

            case DayOfTheWeek(Date1 + i - 1) of
                1: s3 := 'ѕн';
                2: s3 := '¬т';
                3: s3 := '—р';
                4: s3 := '„т';
                5: s3 := 'ѕт';
                6: s3 := '—б';
                7: s3 := 'Ќд';
            end;

            Grid.Cells[i, 0] := s3;
            Grid.Cells[i, 1] := s2 + IntToStr(DayOfTheMonth(Date1 + i - 1)) + '.' + s + IntToStr(MonthOf(Date1 + i - 1));
            if span[i].WorkDay then
                Grid.Cells[i, 2] := FormatFloat('#0.###', span[i].Hours.Hours)
            else
                Grid.Cells[i, 2] := ' - ';
        end;

        // освободить строчку

        span.Free;
    except
    end;
end;



function DrawWorkMode(Date1, Date2: TDate; Id_Work_Mode, Shift: Integer;Trans:TibTransaction;ViewString:String): Integer;
var
    span: TTableDaySpan;
    i: Integer;
    real_shift: Integer;
    s, s2, s3: string;
    Grid: TStringGrid;
    T:TfrmWorkModeInfo;
    Col_Count: Extended;
begin
    Col_Count:=Date2-Date1+1;
    T:=TfrmWorkModeInfo.Create(Application.MainForm);
    T.WorkModeLabel.Caption:=ViewString;
    Grid:=T.WorkModeGrid;
    try
        // √отовим √рид

        Grid.RowCount := 3;
        Grid.ColCount := Trunc(Col_Count) + 1;
        Grid.FixedCols := 1;
        Grid.FixedRows := 2;
        Grid.DefaultColWidth := 40;
        Grid.DefaultRowHeight := 20;
        Grid.FixedColor := RGB(220, 250, 255);
        Grid.Color := clInfoBk;
        Grid.Cells[0, 1] := 'ƒата';
        Grid.Cells[0, 2] := '√один';

        WorkModeCenter:=TWorkModeCenter.Create(Trans);
        WorkModeCenter.ReLoad;

        WorkModeCenter.Id_Work_Mode := Id_Work_Mode;
        WorkModeCenter.Shift := Shift;
        real_shift := WorkModeCenter.NormalizedShift;
        result := real_shift;

        // создать промежуток дней табел€

        span := TTableDaySpan.Create(Date1, Date1 + Col_Count);

        // выбрать все клетки

        span.SelectAll;

        // установить режим и сдвижку

        span.SetMode(Id_Work_Mode, real_shift, 1);

        // подсчитать часы

        span.CalcDays;

        // вывести строчку часов

        for i := 1 to span.Count do
        begin

            if MonthOf(Date1 + i - 1) < 10 then
                s := '0'
            else
                s := '';

            if DayOfTheMonth(Date1 + i - 1) < 10 then
                s2 := '0'
            else
                s2 := '';

            case DayOfTheWeek(Date1 + i - 1) of
                1: s3 := 'ѕн';
                2: s3 := '¬т';
                3: s3 := '—р';
                4: s3 := '„т';
                5: s3 := 'ѕт';
                6: s3 := '—б';
                7: s3 := 'Ќд';
            end;

            Grid.Cells[i, 0] := s3;
            Grid.Cells[i, 1] := s2 + IntToStr(DayOfTheMonth(Date1 + i - 1)) + '.' + s + IntToStr(MonthOf(Date1 + i - 1));
            if span[i].WorkDay then
                Grid.Cells[i, 2] := FormatFloat('#0.###', span[i].Hours.Hours)
            else
                Grid.Cells[i, 2] := ' - ';
        end;

        // освободить строчку

        span.Free;
    except
    end;

    T.ShowModal;
    T.Free;
end;


function DepartmentByKod(Kod:string;DB_Handle:TISC_DB_HANDLE):variant;
var DM:TStProcDM;
    res:variant;
begin
 Res:=Null;
 DM := TStProcDM.Create(Application.MainForm);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_DEPARTMENT_BY_KOD';
   Prepare;
   ParamByName('KOD').AsString := KOD;
   ExecProc;
   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := ParamByName('ID_DEPARTMENT').AsVariant;
   Res[1] := ParamByName('KOD_DEPARTMENT').AsVariant;
   Res[2] := ParamByName('NAME_DEPARTMENT').AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;

function ManByTn(Tn:integer;DB_Handle:TISC_DB_HANDLE):variant;
var DM:TStProcDM;
    res:variant;
begin
 Res:=Null;
 DM := TStProcDM.Create(Application.MainForm);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_MAN_BY_TN';
   Prepare;
   ParamByName('KOD').AsInteger := Tn;
   ExecProc;
   res:=VarArrayCreate([0,3],varVariant);
   Res[0] := ParamByName('ID_MAN').AsVariant;
   Res[1] := ParamByName('TN').AsVariant;
   Res[2] := ParamByName('FIO').AsVariant;
   Res[3] := ParamByName('TIN').AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;

function SmetaByKod(Kod:integer;DB_Handle:TISC_DB_HANDLE):variant;
var DM:TStProcDM;
    res:variant;
begin
 Res:=Null;
 DM := TStProcDM.Create(Application.MainForm);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_SMETA_BY_KOD';
   Prepare;
   ParamByName('KOD').AsInteger := Kod;
   ExecProc;
   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := ParamByName('ID_SMETA').AsVariant;
   Res[1] := ParamByName('KOD_SMETA').AsVariant;
   Res[2] := ParamByName('NAME_SMETA').AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;

function VoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Prop:integer=0):variant;
begin
 result:=VoByKod(Kod,ActualDate,DB_Handle,ValueFieldZSetup(DB_Handle,'Z_ID_SYSTEM'),Prop);
end;

function VoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Id_System:integer;Prop:integer):variant;
var DM:TStProcDM;
    res:variant;
begin
 Res:=Null;
 DM := TStProcDM.Create(Application.MainForm);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_VIDOPL_BY_KOD';
   Prepare;
   ParamByName('AKOD_VIDOPL').AsInteger := Kod;
   ParamByName('ACTUAL_DATE').AsDate    := ActualDate;
   ParamByName('ID_PROP').AsInteger     := Prop;
   ParamByName('ID_SYSTEM').AsInteger   := Id_System;
   ExecProc;
   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := ParamByName('ID_VIDOPL').AsVariant;
   Res[1] := ParamByName('KOD_VIDOPL').AsVariant;
   Res[2] := ParamByName('NAME_VIDOPL').AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;

function CurrentKodSetup(DB_Handle:TISC_DB_HANDLE):integer;
var DM:TStProcDM;
    res:integer;
begin
 Res:=0;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_KOD_SETUP_RETURN';
   Prepare;
   ExecProc;
   Res := ParamByName('KOD_SETUP').AsInteger;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;

function GetNameFirm(DB_Handle:TISC_DB_HANDLE;FieldName:string='NAME_FULL'):variant;
var DM:TStProcDM;
begin
 Result:=NULL;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_GET_SYSDATA_NAMEFIRM';
   Prepare;
   ExecProc;
   Result := ParamByName(FieldName).AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
end;

function ValueFieldZSetup(DB_Handle:TISC_DB_HANDLE;NameField:string):variant;
var DM:TStProcDM;
begin
 Result:=NULL;
 DM := TStProcDM.Create(Application);
 try
  DM.DB.Handle := DB_Handle;
  DM.DSet.SQLs.SelectSQL.Text := 'SELECT '+NameField+' FROM Z_SETUP';
  DM.DSet.Open;
  Result:=DM.DSet[NameField];
  dm.Transaction.Commit;
  DM.Destroy;
 except
  on E:exception do
   begin
    ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
    Dm.Transaction.Rollback;
   end;
 end;
end;

function CurrentAction(DB_Handle:TISC_DB_HANDLE;var AKod_Action:integer;var AIs_Finished:boolean):string;
var DM:TStProcDM;
begin
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_ACTION_DATA';
   Prepare;
   ExecProc;
   AKod_Action:=ParamByName('KOD_ACTION').AsInteger;
   if AKod_Action=0 then AIs_Finished:=True
   else AIs_Finished:=(ParamByName('ACTION_FINISHED').AsString='T');
   Result := ParamByName('NAME_ACTION').AsString;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
end;

function SetBeginAction(DB_Handle:TISC_DB_HANDLE;AKod_Action:integer):boolean;
var DM:TStProcDM;
begin
 Result:=True;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_SETUP_ACTION_U';
   Prepare;
   ParamByName('KOD_ACTION').AsInteger := AKod_Action;
   ExecProc;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],'–озрахунок неможливий! ™ незак≥нчена операц≥€!',mtError,[mbOK]);
     Result:=False;
     Transaction.Rollback;
    end;
  end;
end;

function SetEndAction(DB_Handle:TISC_DB_HANDLE;AIs_Finished:string):boolean;
var DM:TStProcDM;
begin
 Result:=True;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_SETUP_FINISHED_U';
   Prepare;
   if AIs_Finished='' then
     ParamByName('IS_FINISHED').AsVariant := NULL
   else
     ParamByName('IS_FINISHED').AsString := AIs_Finished;
   ExecProc;
   Transaction.Commit;
  except
   on E:exception do
    begin
     Result:=False;
     Transaction.Rollback;
    end;
  end;
end;

function NumPredpr(DB_Handle:TISC_DB_HANDLE):integer;
var DM:TStProcDM;
    res:integer;
begin
 Res:=0;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_PREDPR_RETURN';
   Prepare;
   ExecProc;
   Res := ParamByName('NUM_PREDPR').AsInteger;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;

Function TypeWorkReturn(AStud:byte;AWork:byte):string;
var res:string;
begin
case AStud of
 0: res:=Common_AddStud0_Text;
 1: res:=Common_AddStud1_Text;
 2: res:=Common_AddStud2_Text;
 3: res:=Common_AddStud3_Text;
 4: res:=Common_AddStud4_Text;
end;
case AWork of
 0: res:=Common_NameWork0_Text+res;
 1: res:=Common_NameWork1_Text+res;
 2: res:=Common_NameWork2_Text+res;
 3: res:=Common_NameWork3_Text+res;
end;
TypeWorkReturn:=res;
end;


function IfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant; overload;
begin
 if AValue then
  IfThen:=ATrue
 else
  IfThen:=AFalse;
end;

Function Solid(n:Integer):String;
begin
Case n of
 1: Solid := 'грн ';
 2: Solid := 'тис. ';
 3: Solid := 'млн. ';
 4: Solid := 'млрд. ';
 5: Solid := 'трлн. ';
End;
End;

Function WordNum(s:Integer;i:Integer;n:Integer;Dec:Integer;ANormalString:boolean=True):String;
var World: String;
begin
If Dec = 1 Then
  Case s of
    0: World := 'дес€ть ';
    1: World := 'одинадц€ть ';
    2: World := 'дванадц€ть ';
    3: World := 'тринадц€ть ';
    4: World := 'чотирнадц€ть ';
    5: World := IfThen(ANormalString,'п''€тнадц€ть ','п''''€тнадц€ть ');
    6: World := 'ш≥стнадц€ть ';
    7: World := 'с≥мнадц€ть ';
    8: World := 'в≥с≥мнадц€ть ';
    9: World := IfThen(ANormalString,'дев''€тнадц€ть ','дев''''€тнадц€ть ');
  End
Else
 case i of
  1:Case s of
      0: World := '';
      1: World := IfThen(n > 1, 'один ', 'одна ');
      2: World := IfThen(n > 1, 'два ', 'дв≥ ');
      3: World := 'три ';
      4: World := 'чотири ';
      5: World := IfThen(ANormalString,'п''€ть ','п''''€ть ');
      6: World := 'ш≥сть ';
      7: World := 'с≥м ';
      8: World := 'в≥с≥м ';
      9: World := IfThen(ANormalString,'дев€''ть ','дев€''''ть ');
    end;
  2:Case s of
      0: World := ' ';
      1: World := 'дес€ть ';
      2: World := 'двадц€ть ';
      3: World := 'тридц€ть ';
      4: World := 'сорок ';
      5: World := IfThen(ANormalString,'п''€тдес€т ','п''''€тдес€т ');
      6: World := 'ш≥стдес€т ';
      7: World := 'с≥мдес€т ';
      8: World := 'в≥с≥мдес€т ';
      9: World := IfThen(ANormalString,'дев''€носто ','дев''''€носто ');
    end;
  3:Case s of
      0: World := ' ';
      1: World := 'сто ';
      2: World := 'дв≥ст≥ ';
      3: World := 'триста ';
      4: World := 'чотириста ';
      5: World := IfThen(ANormalString,'п''€тсот ','п''''€тсот ');
      6: World := 'ш≥стсот ';
      7: World := 'с≥мсот ';
      8: World := 'в≥с≥мсот ';
      9: World := IfThen(ANormalString,'дев''€тсот ','дев''''€тсот ');
    End;
 End;
WordNum := World;
End;

function SumToString(ASumma:extended;ATypeSumToString:byte;ANormalString:boolean=True):string;
var t,text:String;
    s,n,i,ForOutPut:integer;
    old_s,sum_ma:LongWord;
begin
Case ATypeSumToString of
1:
begin
  ASumma:=ASumma+0.000001; // ќ—“џЋ№. Int(ASumma), если  ASumma целое, равно ASumma-1
  If (ASumma - Int(ASumma)) * 100 < 10 Then
     text := '0' + IntToStr(Round((ASumma - Int(ASumma)) * 100)) + ' коп.'
  Else
     text := '' + intToStr(Round((ASumma - Int(ASumma)) * 100)) + ' коп.';
end;
end;
FloatToStr(ASumma);
{2:
  AllKop = Abs(Round(ASumma - Int(ASumma), Int(Worksheets("ƒанные").Range("DecimNum"))))
  While Abs(AllKop - Round(AllKop)) > 0.01
     AllKop = AllKop * 10
  Wend
  If Abs(Round(ASumma - Int(ASumma), Int(Worksheets("ƒанные").Range("DecimNum")))) * 100 < 10 Then
     text = "0" + CStr(Round(AllKop)) + " коп."
  Else
     text = "" + CStr(Round(AllKop)) + " коп."
  End If
End Select}
//****************************************************************************
sum_ma := Round(Int(ASumma));
//if (Round(ASumma) = Int(ASumma) +1) then sum_ma:=sum_ma+1 ;
n := 0;
s := 0;
while sum_ma>0 do
 begin
  t := '';
  ForOutPut := 0;
  For i := 1 To 3 do
   If sum_ma > 0 Then
    begin
     old_s := s;
     s := sum_ma Mod 10;
     ForOutPut := s + ForOutPut * 10;
     If (i = 2) And (s = 1) Then
      begin
       t := RightStr(t, pos(t, ' '));
       t := WordNum(old_s, i, n, 1, ANormalString) + t;
      end
     Else
      If Not ((i = 1) And (sum_ma Mod 100 > 10) And (sum_ma Mod 100 < 20)) Then t := WordNum(s, i, n, 2, ANormalString) + t;
     sum_ma := Round(Int(sum_ma / 10));
    end
   Else
    Break;
  inc(n);
  If ForOutPut > 0 Then
    text := t + Solid(n) + Trim(text)
  Else
    text := t + Trim(text);
 end;
Result:=text;
end;

function SumToString(ASumma:extended):string;

var res,t_res,text,t_text:String;
    j,int_sum:integer;
    PLanguageIndex:byte;
    GrivnjaWasAdded:boolean;

 function ThreeDigitNumberToString(var ANumber:string):string;
  var pres:string;
      TCount:byte;
 begin
  TCount:=1;
  ANumber:=Trim(ANumber);
  if length(ANumber)>3 then raise Exception.Create('It''s imposible!!!');
  while Length(ANumber)<3 do ANumber:=' '+ANumber;
  if ANumber[1]<>' ' then
    pres:=Hundread[PLanguageIndex][StrToInt(ANumber[1])+1];
  if ANumber[2]='1' then
   begin
    pres:=trim(pres)+' '+ifThen(ManState[PLanguageIndex][j+1]=True,
                                DigitMan[PLanguageIndex][StrToInt(copy(ANumber,2,2))+1],
                                DigitWoMan[PLanguageIndex][StrToInt(copy(ANumber,2,2))+1]);

    TCount:=2;
   end
  else
   begin
    if ANumber[2]<>' ' then
       pres:=trim(pres)+' '+Ten[PLanguageIndex][StrToInt(ANumber[2])+1];
    if ANumber[3]<>' ' then
       pres:=trim(pres)+' '+ifThen(ManState[PLanguageIndex][j+1]=True,
                                   DigitMan[PLanguageIndex][StrToInt(copy(ANumber,3,1))+1],
                                   DigitWoMan[PLanguageIndex][StrToInt(copy(ANumber,3,1))+1]);
   end;
  if (Trim(pres)<>'') and (StrToInt(ANumber)<>0)  then
     case j of
      0: pres:=Trim(pres)+' '+Kopeika[PLanguageIndex][StrToInt(copy(ANumber,4-TCount,TCount))+1];
      1:
       begin
        pres:=Trim(pres)+' '+Grivnja[PLanguageIndex][StrToInt(copy(ANumber,4-TCount,TCount))+1];
        GrivnjaWasAdded:=True;
       end;
      2: pres:=Trim(pres)+' '+Thousand[PLanguageIndex][StrToInt(copy(ANumber,4-TCount,TCount))+1];
      3: pres:=Trim(pres)+' '+Million[PLanguageIndex][StrToInt(copy(ANumber,4-TCount,TCount))+1];
      4: pres:=Trim(pres)+' '+Milliard[PLanguageIndex][StrToInt(copy(ANumber,4-TCount,TCount))+1];
     end;

  if (not GrivnjaWasAdded) and (Trim(pres)<>'') and (j>0) then
    begin
     pres:=Trim(pres)+' '+Grivnja[PLanguageIndex][1];
     GrivnjaWasAdded:=True;
    end;
  Result:=pRes;
 end;

begin
  GrivnjaWasAdded:=False;
  PLanguageIndex:=LanguageIndex;
  int_sum:=round((ASumma-int(ASumma))*100);
  text:=IntToStr(int_sum);

  j:=0;
  text:=Trim(text);
  while Length(text)<2 do text:='0'+text;
  res:= text+' коп.'; // ThreeDigitNumberToString(text);

  int_sum:=Round(int(ASumma));
  text:=IntToStr(int_sum);
  while Trim(text)<>'' do
   begin
    inc(j);
    t_text:=copy(text,LENGTH(text)-2,3);
    t_res:=ThreeDigitNumberToString(t_text);
    res:=Trim(t_res)+' '+trim(res);
    if Length(Trim(text))<3 then text:=''
    else delete(text,LENGTH(text)-2,3);
   end;

  if not GrivnjaWasAdded then res := Trim('нуль ' +Grivnja[PLanguageIndex][1])+' '+Trim(Res);
  Result:=Res;
end;

procedure DataSetCloseOpen(ComeDataSet:TpFIBDataSet;ComeKeyField:string='';const DoFetchAll:boolean=true);
var ComeFieldValue:variant;
begin
if ComeKeyField='' then
 begin
   ComeFieldValue:= ComeDataSet.RecNo;
   ComeDataSet.CloseOpen(DoFetchAll);
   ComeDataSet.RecNo:=ComeFieldValue;
 end
else
if not ComeDataSet.IsEmpty then
  begin
   ComeFieldValue:=ComeDataSet.FieldValues[ComeKeyField];
   ComeDataSet.CloseOpen(DoFetchAll);
   ComeDataSet.First;
   ComeDataSet.Locate(ComeKeyField,ComeFieldValue,[loCaseInsensitive, loPartialKey]);
  end;
end;


function IsMDIChildFormShow(AClass:TClass):boolean;
var IsFormShow:boolean;
    i:integer;
begin
IsFormShow:=False;
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = AClass) then
  begin
     IsFormShow:=True;
     Application.MainForm.MDIChildren[i].BringToFront;
     break;
  end;
IsMDIChildFormShow:=IsFormShow;
end;

procedure DataSetsCloseOpen(ADataSetParent:TpFIBDataSet;ADataSetChild:TpFIBDataSet;AKeyFieldParent:string='';AKeyFieldChild:string='');
var PFieldValueChild:variant;
begin
if AKeyFieldChild='' then
 begin
   PFieldValueChild:= ADataSetChild.RecNo;
   DataSetCloseOpen(ADataSetParent,AKeyFieldParent);
   ADataSetChild.CloseOpen(True);
   ADataSetChild.RecNo:=PFieldValueChild;
 end
else
if not ADataSetChild.IsEmpty then
  begin
   PFieldValueChild:=ADataSetChild.FieldValues[AKeyFieldChild];
   DataSetCloseOpen(ADataSetParent,AKeyFieldParent);
   ADataSetChild.CloseOpen(True);
   ADataSetChild.First;
   ADataSetChild.Locate(AKeyFieldChild,PFieldValueChild,[loCaseInsensitive, loPartialKey]);
  end
else
 begin
  ADataSetChild.Close;
  DataSetCloseOpen(ADataSetParent,AKeyFieldParent);
  ADataSetChild.Open;
 end;
end;

function StringPrepareToQueryText(AText:string):string;
var I:integer;
    TStr:string;
begin
 i:=1;
 While i<>Length(AText)+1 do
  begin
   if copy(Atext,i,1)='''' then
    begin
     TStr:=copy(Atext,i+1,Length(Atext)-i);
     delete(Atext,i+1,Length(Atext)-i);
     AText:=AText+''''+TStr;
     inc(i);
    end;
    inc(i);
  end;
 result:=Atext;
end;

function zRoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;
var PosComa:byte;
    strValue:string;
    strResult:String;
begin
 strValue:=FloatToStr(AValue);
 for PosComa:=1 to length(strValue) do
  if not((strValue[PosComa] in ['0'..'9']) or (strValue[PosComa]='-')) then  break;

 if PosComa-ADigit>=Length(strValue) then Result:=AValue
 else
  if strValue[PosComa-ADigit+1]>'4' then
   begin
    strValue:=copy(strValue,1,PosComa-ADigit);
    strResult:=strValue;
    for PosComa:=1 to Length(strResult) do
     if strResult[PosComa] in ['0'..'9'] then strResult[PosComa]:='0';
    strResult[Length(strResult)]:='1';
    Result:=StrToFloat(strValue)+StrToFloat(strResult);
   end
  else
   Result:=StrToFloat(copy(strValue,1,PosComa-ADigit));
end;

function zDesignReport:boolean;
var Registry:TRegistry;
begin
 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  Result:=Registry.OpenKey('\Software\Zarplata\DesignReport\',False);
 finally
  Registry.Free;
 end;
end;

function zIdUser:string;
var Registry:TRegistry;
begin
 Result:='';
 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  if Registry.OpenKey('\Software\Zarplata\Login\',False) then
     Result:=Registry.ReadString('UserId')
  else  Result:='';
 finally
  Registry.Free;
 end;
end;

procedure zShowStProcParametersData(StProc:TpFIBStoredProc);
  function pIsShowMessage:boolean;
  var Registry:TRegistry;
  begin
   Registry:=TRegistry.Create;
   try
    Registry.RootKey:=HKEY_CURRENT_USER;
    Result:=Registry.OpenKey('\Software\Zarplata\ShowStProcMessage\',False);
   finally
    Registry.Free;
   end;
  end;
var TextMessage:string;
    i:integer;
begin
 if not pIsShowMessage then exit;
 TextMessage := StProc.Params[0].Name+' = '+varToStrDef(StProc.Params[0].Value,'NULL');
 for i:=1 to StProc.ParamCount-1 do
  TextMessage := TextMessage+#13+
                 StProc.Params[i].Name+' = '+varToStrDef(StProc.Params[i].Value,'NULL');
 ShowMessage(TextMessage);
end;

function GetIdGroupAccount(DB_Handle:TISC_DB_HANDLE;var id:integer):boolean;
var DM:TStProcDM;
begin
 Result:=False;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_GET_NEW_GROUP_ACCOUNT';
   Prepare;
   ExecProc;
   Id := ParamByName('ID_GROUP_ACCOUNT').AsInteger;
   Result:=True;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 DM.Destroy;
end;


function zFormSheet(DB_Handle:TISC_DB_HANDLE;aTypeSheet:integer;SumLimit:variant):boolean;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
    wf:TForm;
begin
  wf:=ShowWaitForm(Application.MainForm);
  pDataBase := TpFIBDatabase.Create(Application.MainForm);
  pTransaction := TpFIBTransaction.Create(Application.MainForm);
  pStProc := TpFIBStoredProc.Create(Application.MainForm);

  try
    try
       pDataBase.SQLDialect := 3;
       pDataBase.DefaultTransaction := pTransaction;
       pTransaction.DefaultDatabase := pDataBase;
       pStProc.Database := pDataBase;
       pStProc.Transaction := pTransaction;

       pDataBase.Handle := DB_Handle;
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'Z_ACCOUNT_TO_TMPSHPRO';
       pStProc.Prepare;
       pStProc.ParamByName('ATYPE_SHEET').AsInteger := aTypeSheet;
       pStProc.ExecProc;

       pStProc.StoredProcName := 'UV_FORMSHEET';
       pStProc.Prepare;
       pStProc.ParamByName('LIMIT_SUM').AsVariant := SumLimit;
       pStProc.ParamByName('ID_TYPE_SHEET').AsInteger := aTypeSheet;
       pStProc.ExecProc;

       pStProc.Transaction.Commit;
       ZShowMessage('«авершенн€','‘ормуванн€ в≥домостей було вдало завершено!',mtInformation,[mbOk]);
       Result := True;
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        zShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
        Result := False;
       end;
    end;
  finally
     pStProc.Destroy;
     pTransaction.Destroy;
     pDataBase.Destroy;
     CloseWaitForm(wf);
  end;
end;

function GetConst(ConstName:string;ConstType:string):string;
var IniFile:TIniFile;
    IniFilePath:string;
begin
    IniFilePath:='Zarplata\Ukrainian.lng';

    if FileExists(ExtractFilePath(Application.ExeName)+IniFilePath) then
    begin
       IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+IniFilePath);
       Result := IniFile.ReadString(ConstType,ConstName,ConstName);
       IniFile.Destroy;
    end
    else Result := ConstName;
end;

function GetMonthList:string;
begin
 result := GetConst('MonthJanuary',tcOtherConst)+#13+
           GetConst('MonthFebruary',tcOtherConst)+#13+
           GetConst('MonthMarch',tcOtherConst)+#13+
           GetConst('MonthApril',tcOtherConst)+#13+
           GetConst('MonthMay',tcOtherConst)+#13+
           GetConst('MonthJune',tcOtherConst)+#13+
           GetConst('MonthJuly',tcOtherConst)+#13+
           GetConst('MonthAutumn',tcOtherConst)+#13+
           GetConst('MonthSeptember',tcOtherConst)+#13+
           GetConst('MonthOctober',tcOtherConst)+#13+
           GetConst('MonthNovember',tcOtherConst)+#13+
           GetConst('MonthDecember',tcOtherConst);
end;

function TransliterationUkrEng(Text:string):string;
var c:string;
    i,j:integer;
    n:integer;
    flag:byte;
    res:string;
begin
  for i:=1 to length(Text) do
  begin
    if(Copy(Text,i,2)='«√')then
      res:=res+'ZGH'
    else
    begin
      c:=Copy(Text,i,1);
      for j:=1 to 35 do
      begin
        if(c=TableTransliterationUkrEng[1,j])then
        begin
          n:=j;
          break;
        end
      end;
      res:=res+TableTransliterationUkrEng[ifthen(i=1,2,3),n];
    end;
  end;
  TransliterationUkrEng:=res;
end;

end.
