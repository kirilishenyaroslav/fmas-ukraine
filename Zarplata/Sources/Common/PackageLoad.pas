unit PackageLoad;

interface

uses Classes,IBase,Windows,Forms,Controls,SysUtils,Variants,ZTypes,ZProc,Dialogs,ZDPKConsts,DB,
     cxGridDBBandedTableView, pfibdataset;

function GetTable(DSource:TDataSource;PeriodFieldName:string='KOD_SETUP'):TcxGridDBBandedTableView;stdcall;

function ExportBankDataSet(AOwner:TComponent;DataSet:TpFIBDataSet;IdBank:integer):variant;
function LoadFilterKodSetup(Aowner: TComponent;DB:TISC_DB_HANDLE;AKod_Setup:integer):integer;
function LoadZAccess(AOwner: TComponent):TISC_DB_HANDLE;
function LoadWhatsNew(AOwner: TComponent;FileName:string):variant;
function LoadComAvg(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdCom:Integer):Variant;
procedure LoadAuthors(AOwner : TComponent);
function LoadPersonification(AOwner:TComponent;AHandle:TISC_DB_HANDLE):variant;
function LoadReeDepVO(AOwner:TComponent;AHandle:TISC_DB_HANDLE;System: boolean):variant;
function LoadAvgSumHands(Parameter:TZAvgSumParameter):variant;
function Load1df(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadVidoplSystems(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadNonSpisok(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadInvalid(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadNonSpisokControl(AParameter:TNonSpisokControlParameter):variant;
function LoadDopNach(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadDopNachControl(AParameter:TDopNachControlParameter):variant;
function LoadDedConst(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadDedConstControl(AParameter:TDedConstControlParameter):variant;
function LoadHospRMoving(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):variant;
function ZLoadFromPackage(const Parameter:TZSimpleParamFull; const Bpl:array of string):variant;
function LoadHospRMovingControl(AParameter:THospRMovingParameter):variant;
function LoadCurrent(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadRemont(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadTaxes(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadPeoplePriv(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadPeopleProp(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function ShowArhivPrintedSheets(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadSetup(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
function LoadDepartment(Aowner: TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):variant;
function LoadVidOpl(Aowner: TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle;Id_VoplFilter:Integer;Id_System:integer=0):variant;
function LoadVidOplSelect(Aowner: TComponent;DB:TISC_DB_HANDLE;Id_VoplFilter:Integer;Id_System:integer=0):variant;
function LoadPeopleModal(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_MAN:integer=-1):Variant;
function LoadPrivileges(Aowner: TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):variant;
function LoadReeVed(Aowner: TComponent;DB:TISC_DB_HANDLE;Id_1df:integer=-1;System:boolean=False):variant;
function LoadOperationEnd(Aowner: TComponent;DB:TISC_DB_HANDLE;Is_Rollback:boolean=False):variant;
function LoadTnAccess(Aowner: TComponent;DB:TISC_DB_HANDLE;AId_man:integer):variant;
function LoadVedView(Aowner: TComponent;DB:TISC_DB_HANDLE;ATypeView:TUVTypeViewSheet):variant;
function LoadViplata(Aowner: TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):variant;
function LoadVOplFilter(Aowner: TComponent;DB_HANDLE:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):variant;
function LoadVOplType(Aowner: TComponent;DB_HANDLE:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):variant;
function LoadVOplProp(Aowner: TComponent;DB_HANDLE:TISC_DB_HANDLE;PZFormStyle:TZFormStyle;AID_Vopl_Prop_Group:byte):variant;
function LoadVOplPropGroup(Aowner: TComponent;DB_HANDLE:TISC_DB_HANDLE;PZFormStyle:TZFormStyle;AID_Vopl_Prop_Group:byte):variant;
function LoadVOplPropControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId_VidOpl:integer;AID_System:byte):variant;
function LoadSotrList(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
function LoadAlimony(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
function LoadProtFSS(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
function LoadReCountData(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
function LoadPeoplePrivControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant;
function LoadPeoplePropControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePropParameters;Is_Grant: TZChildSystems=tsZarplata):Variant;
function LoadPeopleWorkModeControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems=tsZarplata):Variant;
function LoadInvalidControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZCtrlWithHistoryParam):Variant;
function LoadCurrentControl(AParameter:TZCurrentParameters):Variant;
function LoadAlimonyControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameter:TZAlimonyParameters):Variant;
function LoadIndexActsControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameter:TZIndexParameters):Variant;
function LoadSheetData(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TUVSheetDataParameters):variant;
function LoadDateAcc(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZTypeData):variant;
function PrintSheet(AOwner : TComponent;DB:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte):Variant;
function PrintSprSubs(AOwner: TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems=tsZarplata;Id_man:integer=-1):Variant;
function PrintSprDoh(AOwner: TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems=tsZarplata;Id_man:integer=-1):Variant;
function PrintSprDoh2(AOwner: TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems=tsZarplata;Id_man:integer=-1):Variant;
function PrintSprFond(AOwner: TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems=tsZarplata;Id_man:integer=-1):Variant;
function LoadSvodOptions(AOwner:TComponent;DB:TISC_DB_HANDLE):variant;
function PrintSprYearDecl(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems=tsZarplata;Id_man:integer=-1):Variant;

function LoadPaymentCount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
function LoadReCountList (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
function LoadShowHolAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                                RMoving:Integer;StartingMonth:TDate;
                                KolMonth:Integer;IdVidopl:Integer;IdHol:integer):Variant;

function LoadShowAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;RMoving:Integer;KodSetupB:integer):Variant;

function LoadShowHospAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                                IdMan:Integer;StartingMonth:TDate;
                                KolMonth:Integer;IdHosp:Integer):Variant;
procedure LoadSpAllPeople(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;
                               CanEdit:Boolean=True);
function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;
                    MultiSelect:Boolean=False;CanEdit:Boolean=False;
                    Id_Man:Integer=-1):Variant;


function LoadBankExportPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          IdReestr:Integer):Variant;


function LoadSimplePackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:String):Variant;
function LoadRMovingExc(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;RMoving:integer):Variant;
function LoadRMovingExcCtrl(aOwner:TComponent;DB_handle:TISC_DB_HANDLE;cfs:TZControlFormStyle;id:integer):Variant;

function LoadPaymentCountNew(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          AccountType:Integer):Variant;

function LoadHospReestr(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdReestr:Integer):Variant;
function LoadHospAvg(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_HOSP:Integer; rmoving : integer):Variant;
function LoadHolAvg(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdHol:Integer):Variant;

function LoadLoan(AOwner:TComponent;DB:TISC_DB_HANDLE):variant;
function LoadCheckPassword(AOwner:TComponent;APassword:string):boolean;
function uvFormSheet(AOwner:TComponent;DB_HAndle:TISC_DB_HANDLE;IdTypeSheet:integer;SumLimit:variant):variant;
procedure LoadSpAllPeopleEditForm(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; id_man:Integer=-1;
                               CanEdit:Boolean=True);
function LoadPeopleComandiriovkiControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeopleComandirovParameters;Is_Grant: TZChildSystems=tsZarplata):Variant;
function IsZSuperUser(id_user:Int64;DBHandle:TISC_DB_HANDLE):Boolean;
function View_ZIniOkladUpdates_Sp( AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant;

function LoadPersonification2010ExportToDbf(AOwner:TComponent;DB:TISC_DB_HANDLE;IdReport:Int64;KodSetup:integer):Variant;

function LoadSpGroupSm(Parameter:TZSpGroupSm):Variant;

function LoadAccountReloadPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;f:string):Variant;

function LoadPeoplePropByPeriod(AOwner:TComponent;DB:TISC_DB_HANDLE):Variant;
function PrintDataFromSprDoh(AOwner: TComponent;DB:TISC_DB_HANDLE):TFilterDataSprDoh;
function PrintSprZarplAndOthers(AOwner : TComponent;DB:TISC_DB_HANDLE; FilterDataSprDoh:TFilterDataSprDoh):variant;
function LoadPackageSpSortAsList(Parameter:TZParamFilterSprDoh; BplName:String; FunctionName:string):Variant;
function Load_InflHand(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
function LoadDateAcc2(AOwner : TComponent; DB:TISC_DB_HANDLE; KodSetupBeg:integer; KodSetupEnd:integer; id_man: variant):Variant;
function ShowSpSchSm(AParameter:TzSimpleParam;SchProp:integer):TDataSet;
function LoadSprWorkHours(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
function LoadZAccessFull(AOwner: TComponent):TZAccessResult;

implementation

function LoadSprWorkHours(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var HandlePack: HModule;
    MDIFUNC:function(AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant; stdcall;
begin

  HandlePack:=GetModuleHandle(Bpl_SprWorkHours);

  if (HandlePack<32)
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SprWorkHours);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,Func_SprWorkHours_Name);
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprWorkHours),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
  LoadSprWorkHours:=Result;
end;

function Load_InflHand(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var HandlePack: HModule;
    MDIFUNC:function(AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant; stdcall;
begin
  HandlePack:=GetModuleHandle(Bpl_InflycHand_Name);

  if (HandlePack<32)
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_InflycHand_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_InflycHand_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_InflycHand_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
  Load_InflHand:=Result;
end;

function LoadPeoplePropByPeriod(AOwner:TComponent;DB:TISC_DB_HANDLE):Variant;
var HandlePack: HModule;
    MDIFUNC:function(AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant; stdcall;
begin

  HandlePack:=GetModuleHandle(Bpl_PeoplePropByPeriod_Name);

  if (HandlePack<32)
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PeoplePropByPeriod_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('View_PeoplePropByPeriod'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PeoplePropByPeriod_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
  LoadPeoplePropByPeriod:=Result;

end;

function View_ZIniOkladUpdates_Sp( AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant;
var
  HandlePack: HModule;
  FUNC:function(AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant; stdcall;
begin
  Result:=false;

  HandlePack:=GetModuleHandle('ZIniOkladUpdates.bpl');
  if HandlePack<32
  then begin
             try
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'Zarplata\ZIniOkladUpdates.bpl');
             finally
                Screen.Cursor:=crDefault;
             end;
   end;

   if HandlePack > 32
   then begin
              @FUNC:=GetProcAddress(HandlePack,PChar('View_ZIniOkladUpdates_Sp'));
              if @FUNC<>nil
              then Result:=FUNC(Aowner,DB);
   end
   else begin
             MessageBox(Application.MainForm.Handle,PChar(Load_Error+'\Zarplata\ZIniOkladUpdates.bpl'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
   end;
end;



function IsZSuperUser(id_user:Int64;DBHandle:TISC_DB_HANDLE):Boolean;
var
  HandlePack: HModule;
  FUNC   :function(id_user:Int64;DBHandle:TISC_DB_HANDLE):Boolean;stdcall;
begin
  Result:=false;
  HandlePack:=GetModuleHandle('ZAccess.bpl');
  if HandlePack>32
  then begin
             try
                Screen.Cursor:=crHourGlass;
                HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\Zarplata\ZAccess.bpl');
             finally
                Screen.Cursor:=crDefault;
             end;

             if HandlePack > 0
             then begin
                        @FUNC:=GetProcAddress(HandlePack,PChar('IsZSuperUser'));
                        if @FUNC<>nil
                        then Result:=FUNC(id_user,DBHandle);
             end
   end
   else begin
             MessageBox(Application.MainForm.Handle,PChar(Load_Error+'\Zarplata\ZAccess.bpl'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
   end;
end;


function GetTable(DSource:TDataSource;PeriodFieldName:string='KOD_SETUP'):TcxGridDBBandedTableView;stdcall;
var
  HandlePack: HModule;
  MDIFUNC   :function(DSource:TDataSource;PeriodFieldName:string):TcxGridDBBandedTableView;stdcall;
begin
  Result:=nil;
  HandlePack:=GetModuleHandle('ShortTable.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\Zarplata\ShortTable.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetTable'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(DSource,PeriodFieldName);
  end
  else
   begin
            MessageBox(Application.MainForm.Handle,PChar(Load_Error+'\Zarplata\ShortTable.bpl'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
   end;
end;

function LoadBankExportPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          IdReestr:Integer):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          IdReestr:Integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_BankExport_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_BankExport_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_BankExport_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,IdReestr);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_BankExport_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;


procedure LoadAuthors(AOwner : TComponent);
var
  HandlePack: HModule;
  MDIFUNC   :procedure(AOwner : TComponent);stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Authors_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Authors_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Authors_Name));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Authors_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
end;

function LoadPersonification(AOwner:TComponent;AHandle:TISC_DB_HANDLE):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;AHandle:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Personification_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Personification_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Personification_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,AHandle);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Personification_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadAvgSumHands(Parameter:TZAvgSumParameter):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Parameter:TZAvgSumParameter):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_AvgSumHands_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_AvgSumHands_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_AvgSumHands_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Parameter);
  end
  else
   begin
            MessageBox(TForm(Parameter.Owner).Handle,PChar(Load_Error+Bpl_AvgSumHands_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadReeDepVO(AOwner:TComponent;AHandle:TISC_DB_HANDLE;System: boolean):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;AHandle:TISC_DB_HANDLE;System: boolean):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_ReeDepVO_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ReeDepVo_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ReeDepVo_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,AHandle,System);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ReeDepVo_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadVidoplSystems(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VidoplSystems_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VidoplSystems_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VidoplSystems_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VidoplSystems_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function Load1df(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_1df_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_1df_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_1df_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_1df_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadNonSpisok(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_NonSpisok_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_NonSpisok_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_NonSpisok_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_NonSpisok_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadNonSpisok:=Res;
end;

function LoadInvalid(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Invalid_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Invalid_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Invalid_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Invalid_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;
                    MultiSelect:Boolean=False;CanEdit:Boolean=False;
                    Id_Man:Integer=-1):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;
                    MultiSelect:Boolean=False;CanEdit:Boolean=False;
                    Id_Man:Integer=-1):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle('SpAllPeople.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+
                                                           'SpAllPeople.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('GetMan'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DBHANDLE,
                    MultiSelect,CanEdit,Id_Man);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+'SpAllPeople'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  GetMan:=Res;
end;

function LoadNonSpisokControl(AParameter:TNonSpisokControlParameter):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TNonSpisokControlParameter):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_NonSpisokControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_NonSpisokControl_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_NonSpisokControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AParameter);
  end
  else
   begin
            MessageBox(TForm(AParameter.Owner).Handle,PChar(Load_Error+Bpl_NonSpisokControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

procedure LoadSpAllPeople(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;
                               CanEdit:Boolean=True);

var
  HandlePack: HModule;
  MDIFUNC   :procedure (AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;
                             CanEdit:Boolean=True);stdcall;
begin
  HandlePack:=GetModuleHandle('SpAllPeople.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+
                                                    'SpAllPeople.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowSp'));
            if @MDIFUNC<>nil
             then MDIFUNC(AOwner,DBHANDLE,CanEdit);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+'SpAllPeople'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);

   end;

end;


procedure LoadSpAllPeopleEditForm(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE; id_man:Integer=-1;
                               CanEdit:Boolean=True);

var
  HandlePack: HModule;
  MDIFUNC   :function (AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                            IdMan:Integer;CanEdit:Boolean=False):Variant; stdcall;
begin
  HandlePack:=GetModuleHandle('SpAllPeople.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+
                                                    'SpAllPeople.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowManEditForm'));
            if @MDIFUNC<>nil
             then MDIFUNC(AOwner,DBHANDLE,id_man,CanEdit);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+'SpAllPeople'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);

   end;

end;



function LoadZAccess(AOwner: TComponent):TISC_DB_HANDLE;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent):TISC_DB_HANDLE;stdcall;
begin
  Result:=nil;
  
  HandlePack:=GetModuleHandle(Bpl_ZAccess_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ZAccess_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ZAccess_Name));
            if @MDIFUNC<>nil then Result:=MDIFUNC(AOwner);
  end
  else
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ZAccess_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
end;

function LoadZAccessFull(AOwner: TComponent):TZAccessResult;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent):TZAccessResult;stdcall;
begin

  HandlePack:=GetModuleHandle(Bpl_ZAccess_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ZAccess_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ZAccess_Name));
            if @MDIFUNC<>nil then Result:=MDIFUNC(AOwner);
  end
  else
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ZAccess_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
end;

function LoadWhatsNew(AOwner: TComponent;FileName:string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent;FileName:string):variant;stdcall;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(Bpl_WhatsNew_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_WhatsNew_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_WhatsNew_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,FileName);
  end
  else
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_WhatsNew_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
end;

function LoadDopNachControl(AParameter:TDopNachControlParameter):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TDopNachControlParameter):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_DopNachControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_DopNachControl_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_DopNachControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AParameter);
  end
  else
   begin
            MessageBox(TForm(AParameter.AOwner).Handle,PChar(Load_Error+Bpl_DopNachControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadFilterKodSetup(AOwner: TComponent;DB:TISC_DB_HANDLE;AKod_Setup:integer):integer;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;AKod_Setup:integer):integer;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Filters_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Filters_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_FilterKodSetup_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AKod_Setup);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_DopNach_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadFilterKodSetup:=Res;
end;

function LoadDopNach(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_DopNach_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_DopNach_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_DopNach_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_DopNach_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadDopNach:=Res;
end;

function LoadDedConst(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_DedConst_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_DedConst_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_DedConst_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_DedConst_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadDedConst:=Res;
end;

function LoadDedConstControl(AParameter:TDedConstControlParameter):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TDedConstControlParameter):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_DedConstControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_DedConstControl_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_DedConstControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AParameter);
  end
  else
   begin
            MessageBox(TForm(AParameter.AOwner).Handle,PChar(Load_Error+Bpl_DopNachControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadHospRMoving(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_HospRMoving_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_HospRMoving_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_HospRMoving_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,PZFormStyle);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_HospRMoving_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadHospRMovingControl(AParameter:THospRMovingParameter):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:THospRMovingParameter):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_HospRMovingControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_HospRMovingControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_HospRMovingControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AParameter);
  end
  else
   begin
            MessageBox(TForm(AParameter.AOwner).Handle,PChar(Load_Error+Bpl_HospRMovingControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadCurrent(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Current_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Current_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Current_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Current_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadCurrent:=Res;
end;

function LoadRemont(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Remont_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Remont_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Remont_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Remont_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadRemont:=Res;
end;

function LoadTaxes(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Taxes_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Taxes_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Taxes_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Taxes_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadTaxes:=Res;
end;

function LoadSetup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Setup_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Setup_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Setup_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Setup_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadSetup:=Res;
end;

function LoadPeoplePriv(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_PeoplePriv_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PeoplePriv_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PeoplePriv_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PeoplePriv_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadPeoplePriv:=Res;
end;

function LoadPeopleProp(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_PeopleProp_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PeopleProp_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PeopleProp_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PeopleProp_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadPeopleProp:=Res;
end;

function ShowArhivPrintedSheets(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_ArhivPrintedSheets_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ArhivPrintedSheets_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ArhivPrintedSheets_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ArhivPrintedSheets_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

function LoadDepartment(AOwner : TComponent;DB:TISC_DB_HANDLE; PZFormStyle:TZFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Department_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Department_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Department_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,PZFormStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Department_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadDepartment:=Res;
end;

function LoadVidOpl(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle;Id_VoplFilter:Integer;Id_System:integer=0):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle;Id_VoplFilter:Integer;Id_System:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VidOpl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VidOpl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VidOpl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,PZFormStyle,Id_VoplFilter,Id_System);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VidOpl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVidOpl:=Res;
end;

function LoadVidOplSelect(AOwner : TComponent;DB:TISC_DB_HANDLE;Id_VoplFilter:Integer;Id_System:integer=0):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Id_VoplFilter:Integer;Id_System:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VidOpl_Select_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VidOpl_Select_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VidOpl_Select_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Id_VoplFilter,Id_System);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VidOpl_Select_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;

function LoadPeopleModal(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_MAN:integer=-1):Variant;
var
  Res:Variant;
  MyRes:Variant;
begin
 MyRes:=null;
 Res:=GetMan(AOwner,DB,False,False,ID_MAN);
  if VarArrayDimCount(Res)>0 then
    begin
     MyRes:= VarArrayCreate([0,6],varVariant);
     MyRes[0]:=Res[0];            //ID_Man
     MyRes[1]:=Res[2];            //Familiya
     MyRes[2]:=Res[3];            //Imya
     MyRes[3]:=res[4];            //Otchestvo
     MyRes[4]:=Res[10];           //Tn
     MyRes[5]:=Res[9];            //Tin
     MyRes[6]:=Res[8];            //BirthDay
    end;
  Result:=MyRes;

end;

function LoadPrivileges(AOwner : TComponent;DB:TISC_DB_HANDLE; PZFormStyle:TZFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Privileges_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Privileges_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Privileges_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,PZFormStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Privileges_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPrivileges:=Res;
end;

function LoadOperationEnd(Aowner: TComponent;DB:TISC_DB_HANDLE;Is_Rollback:boolean=False):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:boolean):Variant;stdcall;
begin
  HandlePack:=GetModuleHandle(Bpl_OperationEnd_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_OperationEnd_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  Result:=NULL;
  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_OperationEnd_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB,Is_Rollback);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_OperationEnd_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
  end;
end;

function LoadReeVed(Aowner: TComponent;DB:TISC_DB_HANDLE;Id_1df:integer=-1;System:boolean=False):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Id_1df:integer;System:boolean):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_ReeVed_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ReeVed_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ReeVed_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Id_1df,System);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ReeVed_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReeVed:=Res;
end;

function LoadTnAccess(Aowner: TComponent;DB:TISC_DB_HANDLE;AId_Man:integer):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AId_Man:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_TnAccess_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_TnAccess_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0
  then begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_TnAccess_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AId_man);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_TnAccess_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;

function LoadVedView(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TUVTypeViewSheet):Variant;
var HandlePack: HModule;
    MDIFUNC:function(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TUVTypeViewSheet):Variant;stdcall;
    Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VedView_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VedView_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VedView_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,ATypeView);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VedView_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVedView:=Res;
end;

function LoadViplata(AOwner : TComponent;DB:TISC_DB_HANDLE; PZFormStyle:TZFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Viplata_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Viplata_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Viplata_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,PZFormStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Viplata_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadViplata:=Res;
end;

function LoadVOplFilter(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE; PZFormStyle:TZFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VOplFilter_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VOplFilter_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VOplFilter_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,PZFormStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VOplFilter_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVOplFilter:=Res;
end;

function LoadVOplType(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE; PZFormStyle:TZFormStyle):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VOplType_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VOplType_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VOplType_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,PZFormStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VOplType_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVOplType:=Res;
end;

function LoadVOplProp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE; PZFormStyle:TZFormStyle;AID_Vopl_Prop_Group:byte):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
//View_FVoplFilter_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VOplProp_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VOplProp_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VOplProp_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,PZFormStyle);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VOplProp_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVOplProp:=Res;
end;

function LoadVOplPropGroup(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE; PZFormStyle:TZFormStyle;AID_Vopl_Prop_Group:byte):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle;AID_Vopl_Prop_Group:byte):Variant;stdcall;
//View_FVoplFilter_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VOplPropGroup_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VOplPropGroup_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VOplPropGroup_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,PZFormStyle,AID_Vopl_Prop_Group);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VOplPropGroup_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVOplPropGroup:=Res;
end;

function LoadVOplPropControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId_VidOpl:integer;AID_System:byte):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId_VidOpl:integer;AID_System:byte):Variant;stdcall;
//View_FVoplFilter_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_VOplPropControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_VOplPropControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_VOplPropControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,AID_VidOPl,AID_System);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_VOplPropControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadVOplPropControl:=Res;
end;

function LoadSotrList(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant; stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_SotrList);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SotrList);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SotrList_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SotrList),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadSotrList:=Res;
end;

function PrintSheet(AOwner : TComponent;DB:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte):variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_PrintSheet_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PrintSheet_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintSheet_Name));
            if @MDIFUNC<>nil
            then
              Res:=MDIFUNC(AOwner,DB,AId,ATypeForm);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PrintSheet_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  PrintSheet:=Res;
end;


function LoadAlimony(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Alimony_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Alimony_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Alimony_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Alimony_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadAlimony:=Res;
end;

function LoadProtFSS(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_ProtFSS_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ProtFSS_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ProtFSS_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ProtFSS_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;

function LoadReCountData(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_ReCountData_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ReCountData_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ReCountData_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ReCountData_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadReCountData:=Res;
end;

function LoadPeoplePrivControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
  Res:Variant;
begin
  //function View_FZPeoplePrivControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
  HandlePack:=GetModuleHandle(Bpl_PeoplePrivControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PeoplePrivControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PeoplePrivControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AParameter);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PeoplePrivControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPeoplePrivControl:=Res;
end;

function LoadInvalidControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZCtrlWithHistoryParam):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZCtrlWithHistoryParam):Variant; stdcall;
begin
  //function View_FZPeoplePrivControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
  HandlePack:=GetModuleHandle(Bpl_InvalidCtrl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_InvalidCtrl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_InvalidCtrl_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB,AParameter);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Invalid_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
end;

function LoadPeopleWorkModeControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems=tsZarplata):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems):Variant; stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_PeopleWorkModeControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PeopleWorkModeControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PeopleWorkModeControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AParameter,Is_Grant);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PeoplePropControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPeopleWorkModeControl:=Res;
end;

function LoadPeopleComandiriovkiControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeopleComandirovParameters;Is_Grant: TZChildSystems=tsZarplata):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeopleComandirovParameters;Is_Grant: TZChildSystems):Variant; stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_PeopleComandirovkiControl_Name);

  if (HandlePack<32)
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PeopleComandirovkiControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,'View_FZPeopleComandirovkiControl');
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AParameter,Is_Grant);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PeoplePropControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPeopleComandiriovkiControl:=Res;
end;



function LoadPeoplePropControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePropParameters;Is_Grant:TZChildSystems=tsZarplata):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePropParameters;Is_Grant: TZChildSystems):Variant; stdcall;
  Res:Variant;
begin
  //function View_FZPeoplePrivControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
  HandlePack:=GetModuleHandle(Bpl_PeoplePropControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PeoplePropControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PeoplePropControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AParameter,Is_Grant);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PeoplePropControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPeoplePropControl:=Res;
end;

function LoadCurrentControl(AParameter:TZCurrentParameters):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TZCurrentParameters):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_CurrentControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_CurrentControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_CurrentControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AParameter);
  end
  else begin
            MessageBox(TForm(AParameter.Owner).Handle,PChar(Load_Error+Bpl_CurrentControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadCurrentControl:=Res;
end;

function LoadIndexActsControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameter:TZIndexParameters):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZIndexParameters):Variant; stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_AlimonyControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_IndexActsControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_IndexActsControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,AParameter);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Func_IndexActsControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadIndexActsControl:=Res;
end;


function LoadAlimonyControl(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AParameter:TZAlimonyParameters):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZAlimonyParameters):Variant; stdcall;
  Res:Variant;
begin
  //function View_FZPeoplePrivControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
  HandlePack:=GetModuleHandle(Bpl_AlimonyControl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_AlimonyControl_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_AlimonyControl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,AParameter);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_AlimonyControl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadAlimonyControl:=Res;
end;

function LoadSheetData(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TUVSheetDataParameters):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TUVSheetDataParameters):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_SheetData_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SheetData_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SheetData_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AParameter);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SheetData_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadSheetData:=Res;
end;

function LoadDateAcc(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZTypeData):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZTypeData):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_DateAcc_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_DateAcc_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_DateAcc_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,AParameter);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_DateAcc_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;

function LoadDateAcc2(AOwner : TComponent; DB:TISC_DB_HANDLE; KodSetupBeg:integer; KodSetupEnd:integer; id_man: variant):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent; DB:TISC_DB_HANDLE; KodSetupBeg:integer; KodSetupEnd:integer; id_man: variant):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_DateAcc2_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_DateAcc2_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_DateAcc2_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner, DB, KodSetupBeg, KodSetupEnd, id_man);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_DateAcc2_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  Result:=Res;
end;



function LoadPaymentCount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_PaymentCount_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_PaymentCount_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PaymentCount_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_PaymentCount_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadPaymentCount:=Res;
end;

function LoadReCountList(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_ReCountList_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ReCountList_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ShowReCountList_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_ReCountList_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadReCountList:=Res;
end;

function LoadSvodOptions(AOwner:TComponent;DB:TISC_DB_HANDLE):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_SvodDocsOptions_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SvodDocsOptions_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SvodDocsOptions_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SvodDocsOptions_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadSvodOptions:=Res;
end;

function LoadSimplePackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(BplName));

  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+BplName);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(FunctionName));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadSimplePackage:=Res;
end;


function LoadPackageSpSortAsList(Parameter:TZParamFilterSprDoh; BplName:String; FunctionName:string):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TZParamFilterSprDoh):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(BplName));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+BplName);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(FunctionName));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Parameter);
  end
  else begin
        MessageBox(TForm(Parameter.Owner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadPackageSpSortAsList:=Res;
end;


function PrintSprSubs(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_SprSubs_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SprSubs_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SprSubs_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Is_Grant,Id_man);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprSubs_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  PrintSprSubs:=Res;
end;

function PrintSprFond(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_SprFond_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SprFond_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SprFond_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Is_Grant,Id_man);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprSubs_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  PrintSprFond:=Res;
end;

function PrintSprDoh(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_SprDoh_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SprDoh_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SprDoh_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Is_Grant,Id_man);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprDoh_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  PrintSprDoh:=Res;
end;

function PrintSprYearDecl(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_SprYearDecl_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SprYearDecl_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SprYearDecl_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Is_Grant,Id_man);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Func_SprYearDecl_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  PrintSprYearDecl:=Res;
end;


function PrintDataFromSprDoh(AOwner : TComponent;DB:TISC_DB_HANDLE):TFilterDataSprDoh;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE;AParameter:TFilterDataSprDoh;Is_Grant:TZChildSystems):TFilterDataSprDoh;stdcall;
  Res:TFilterDataSprDoh;
begin
  HandlePack:=GetModuleHandle(Bpl_SprDoh_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SprDoh_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            Res.ID_man:=-1;
            Res.Kod_setup1:=-1;
            Res.Kod_setup2:=-1;
            Res.PrUser:=true;
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintDataFromSprDoh_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,res,tsZarplata);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprDoh_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res.ID_man:=-1;
   end;
  PrintDataFromSprDoh:=Res;
end;


function PrintSprZarplAndOthers(AOwner : TComponent;DB:TISC_DB_HANDLE; FilterDataSprDoh:TFilterDataSprDoh):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE; FilterDataSprDoh:TFilterDataSprDoh):variant;stdcall;
begin
  HandlePack:=GetModuleHandle(Bpl_SprDohZarplAndOthers_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SprDohZarplAndOthers_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_PrintSprZarplAndOthers_Name));
            if @MDIFUNC<>nil
            then MDIFUNC(AOwner,DB,FilterDataSprDoh);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprDoh_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
   end;
end;




function PrintSprDoh2(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE;Is_Grant:TZChildSystems;Id_man:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_SprDoh2_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SprDoh2_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SprDoh2_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,Is_Grant,Id_man);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprDoh2_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  PrintSprDoh2:=Res;
end;


function LoadShowHolAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                                RMoving:Integer;StartingMonth:TDate;
                                KolMonth:Integer;IdVidopl:Integer;IdHol:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                                RMoving:Integer;StartingMonth:TDate;
                                KolMonth:Integer;
                                IdVidopl:Integer;IdHol:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_ShowAvgPayment_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ShowAvgPayment_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowHolidayAvg'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,Rmoving,StartingMonth,KolMonth,IdVidopl,IdHol)
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprSubs_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadShowHolAvg:=Res;
end;



function LoadShowAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;RMoving:Integer;KodSetupB:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;RMoving:Integer;KodSetupB:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_HolAvg_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_HolAvg_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Avg_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,Rmoving,KodSetupB)
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_HolAvg_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  result:=Res;
end;


function LoadShowHospAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                                IdMan:Integer;StartingMonth:TDate;
                                KolMonth:Integer;IdHosp:Integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                             IdMan:Integer;StartingMonth:TDate;
                             KolMonth:Integer;IdHosp:Integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_ShowAvgPayment_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ShowAvgPayment_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowHospitalAvg'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,IdMan,
                                StartingMonth,KolMonth,IdHosp);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_SprSubs_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadShowHospAvg:=Res;
end;

function LoadRMovingExc(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;RMoving:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;RMoving:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_RMovingExc_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_RMovingExc_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,Func_RMovingExc_Name);
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,RMoving);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_RMovingExc_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadRMovingExc:=Res;
end;

function LoadRMovingExcCtrl(aOwner:TComponent;DB_handle:TISC_DB_HANDLE;cfs:TZControlFormStyle;id:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(aOwner:TComponent;DB_handle:TISC_DB_HANDLE;cfs:TZControlFormStyle;id:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_RMovingExc_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_RMovingExc_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,Func_RMovingExcCtrl_Name);
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,cfs,id);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_RMovingExc_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  Result:=Res;
end;


function LoadPaymentCountNew(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          AccountType:Integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                             AccountType:Integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle('Zarplata\PaymnetCount.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+
                                                   'Zarplata\PaymentCount.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('StartPaymentCount'));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,AccountType);

  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+'PaymentCount.bpl'),
                                PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadPaymentCountNew:=Res;
end;

function LoadHospAvg(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_HOSP:Integer; rmoving : integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_HOSP:Integer; rmoving : integer):Variant;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_HospAvg_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_HospAvg_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_HospAvg_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB_HANDLE,ID_HOSP, rmoving);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_HospAvg_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Result:=NULL;
  end;
end;

function LoadHolAvg(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdHol:Integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdHol:Integer):Variant;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_HolAvg_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_HolAvg_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_HolAvg_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB_HANDLE,IdHol);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_HospAvg_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Result:=NULL;
  end;
end;


function LoadComAvg(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdCom:Integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdHol:Integer):Variant;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_HolAvg_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_ComAvg_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_ComAvg_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB_HANDLE,IdCom);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_HospAvg_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Result:=NULL;
  end;
end;



function LoadHospReestr(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdReestr:Integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdReestr:Integer):Variant;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_HospReestr_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_HospReestr_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_HospReestr_Name));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB_HANDLE,IdReestr);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_HospReestr_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Result:=NULL;
  end;
end;

function LoadLoan(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Loan_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Loan_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Loan_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Loan_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadLoan:=Res;
end;

function ExportBankDataSet(AOwner:TComponent;DataSet:TpFIBDataSet;IdBank:integer):variant;
var
  HandlePack: HModule;
  MDIFUNC   : function(AOwner:TComponent;DataSet:TpFIBDataSet;IdBank:integer):Variant;stdcall;
begin
  HandlePack:=GetModuleHandle('ExportDataSet.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'Zarplata\ExportDataSet.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ExpBankDataSet'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DataSet,IdBank);
  end
  else begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+'Zarplata\ExportDataSet.bpl'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Result:=NULL;
  end;
end;

function LoadCheckPassword(AOwner:TComponent;APassword:string):boolean;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;APassword:string):boolean;stdcall;
begin
  Result := False;
  HandlePack:=GetModuleHandle('Password.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'Zarplata\Password.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ViewPassword'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,APassword);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+'Zarplata\Password.bpl'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Result:=False;
   end;
end;

function uvFormSheet(AOwner:TComponent;DB_handle:TISC_DB_HANDLE;IdTypeSheet:integer;SumLimit:variant):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_handle:TISC_DB_HANDLE;IdTypeSheet:integer;SumLimit:variant):variant;stdcall;
begin
  Result := False;
  HandlePack:=GetModuleHandle('Password.bpl');
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'Zarplata\FormSheet.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('uvFormSheet'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner,DB_HAndle,IdTypeSheet,SumLimit);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+'Zarplata\FormSheet.bpl'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Result:=False;
   end;
end;

function LoadPersonification2010ExportToDbf(AOwner:TComponent;DB:TISC_DB_HANDLE;IdReport:Int64;KodSetup:integer):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB:TISC_DB_HANDLE;IdReport:Int64;KodSetup:integer):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Personification2010Export_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Personification2010Export_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_Personification2010Export_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB,IdReport,KodSetup);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Personification2010Export_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  LoadPersonification2010ExportToDbf:=Res;
end;

function LoadSpGroupSm(Parameter:TZSpGroupSm):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Parameter:TZSpGroupSm):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl_SpGroupSm_Name));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_SpGroupSm_Name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Func_SpGroupSm_Name));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Parameter);
  end
  else begin
        MessageBox(TForm(Parameter.Owner).Handle,PChar(Load_Error+Bpl_SpGroupSm_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadSpGroupSm:=Res;
end;

function LoadAccountReloadPackage(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
    BplName:String;FunctionName:string;f:string):Variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;f:string):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(BplName));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+BplName);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(FunctionName));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,DB_HANDLE,f);
  end
  else begin
        MessageBox(TForm(AOwner).Handle,PChar(Load_Error+BplName),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
        Res:=NULL;
  end;
  LoadAccountReloadPackage:=Res;
end;


function ShowSpSchSm(AParameter:TzSimpleParam;SchProp:integer):TDataSet;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TObject;SchProp:integer):TDataSet;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(ExtractFilePath(Application.ExeName)+'\Zarplata\SpSchSm.bpl'));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\Zarplata\SpSchSm.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('View_SpSchSm'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AParameter,SchProp);
  end
  else
   begin
            MessageBox(TForm(AParameter.Owner).Handle,PChar(Load_Error+'Zarplata\SpSchSm.bpl'),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            //zShowMessage(ECaption[IndexLanguage],e.Message,mtError,[mbOk]);
            Result:=nil;
   end;
end;


function ZLoadFromPackage(const Parameter:TZSimpleParamFull; const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TZSimpleParam):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl[0]);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
            if @MDIFUNC<>nil then
             Result:=MDIFUNC(Parameter);

  end
  else
   begin
            MessageBox(TForm(Parameter.Owner).Handle,PChar(Load_Error+#13+Bpl[0]),
                       PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Result:=NULL;
   end;
end;


end.

