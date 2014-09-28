unit gr_uCommonLoader;

interface

uses gr_uCommonConsts,gr_uMessage, gr_uWaitForm,iBase,gr_uCommonProc,
     Classes,Windows,Forms,Controls,SysUtils,Variants,Dialogs,
     gr_uCommonTypes, zTypes, PackageLoad, uCommonSp, pFIBDataSet;

type TgrFormStyle = (gfsModal, gfsNormal, gfsChild);

Type TgrSimpleParam = class(TObject)
 public
  DB_Handle:TISC_DB_HANDLE;
  Owner:TComponent;
  AnalitControl: boolean;
  KodCur: integer;
end;

Type TgrIndexacParam = class(TgrSimpleParam)
 public
  id_man:Variant;
end;

Type TParamGG = class(TObject)
public
  Owner:TComponent;
  Mode: variant;// добавить изменить
  TypePayment: Char;// тип выплаты
  PMemo: TComponent;//указатель на импорт
  PGrid: TComponent;//указатель на табл людей

end;

type TgrAccListParam = class(TgrSimpleParam)
 public
  Id_man:integer;
  IdGroupAccount:integer;
  KodSetup2:integer;
  TypeTable:integer;
  KOD_SETUP1:String;
  KOD_SETUP2:String;
  id:String;
  ID_TYPE:String;
  PAYMENT_TYPE:String;
end;

Type TgrCtrlSimpleParam = class(TgrSimpleParam)
 public
  Id:Int64;
  UseDT:TDateTime;
  fs:TZControlFormStyle;
  DateBeg:TDate;
  DateEnd:TDate;
  IdSmeta:integer;
  IdVidopl:integer;
  Summa:currency;
  Bal:currency;
  Prikaz:String;
  First: Bool;//первая ли запись
  CtrlType:integer;
 end;

type TgrStudIndexParam = class(TgrSimpleParam)
 public
  KodSetup:integer;
  BaseKodSetup:integer;
  SUMMA_IND_FIX:string;
  SUMMA_IND_FACT:string;
  SUMMA_IND_FIX_BOOL:boolean;
  SUMMA_IND_FACT_BOOL:boolean;
  IS_HAND_EDIT:boolean;
  fs:TZControlFormStyle;
end;

Type TgrBooleanParam = class(TgrSimpleParam)
 public
  Priznak:boolean;
 end;

Type TgrPriznakSimpleParam = class(TgrSimpleParam)
 public
  Priznak:variant;
 end;

function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;
function LoadgrAccess(AOwner: TComponent):TUser;
function ShowSpPeople(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE):variant;stdcall;
function ShowSpVidOpl(AOwner:TComponent;DB:TISC_DB_HANDLE;grFormStyle:TgrFormStyle=gfsModal;Id_VoplFilter:Integer=0):Variant;
function ShowSpDepartment(DB_Handle:TISC_DB_HANDLE;ShowStyle:byte=0;Select:byte=1):variant;
function ShowSpSch(AParameter:TObject;SchProp:integer):variant;stdcall;
function LoadgrOperationEnd(AParameter:TObject;IsRollback:boolean):variant;
const Stud_Grant_Pack          :array [1..2] of string=('Grant\gr_Stud_Grant.bpl','View_Stud_Grant');
const Group_Grant_Pack         :array [1..2] of string=('Grant\gr_GroupGrant.bpl','View_GroupGrant');
const StudentPack              :array [1..2] of string=('Grant\gr_Stud.bpl','View_Stud');
const Stud_terms_Ctrl_Pack     :array [1..2] of string=('Grant\gr_Stud_Terms_Ctrl.bpl','ViewStudTermsCtrl');
const Stud_terms_Edu_Ctrl_Pack :array [1..2] of string=('Grant\gr_Stud_Edu_Terms_Ctrl.bpl','ViewStudTermsCtrl');
const Stud_Grants_Ctrl_Pack    :array [1..2] of string=('Grant\gr_Grant_Ctrl.bpl','ViewGrantCtrl');
const Stud_Current_Ctrl_Pack   :array [1..2] of string=('Grant\gr_Current_Ctrl.bpl','View_grCurrentCtrl');
const Stud_AcctCard_Ctrl_Pack  :array [1..2] of string=('Grant\gr_AcctCard.bpl','View_FgrAcctCardCtrl');
const Stud_Vacation_Ctrl_Pack  :array [1..2] of string=('Grant\gr_Stud_Vacation_Ctrl.bpl','ViewStudVacationCtrl');
const Stud_Account_Spisok_Pack :array [1..2] of string=('Grant\gr_Account.bpl','View_SpisokCount');
const Stud_Recount_Spisok_Pack :array [1..2] of string=('Grant\gr_Recount.bpl','View_SpisokReCount');
const Stud_ReCountData_Pack    :array [1..2] of string=('Grant\gr_ReCountData.bpl','View_ReCountData');
const Stud_AcCountData_Pack    :array [1..2] of string=('Grant\gr_AccountData.bpl','View_grAccountData');
const Stud_AccList_Pack        :array [1..2] of string=('Grant\gr_AccList.bpl','PrintgrAccList');
const Stud_CountSheet_Pack     :array [1..2] of string=('Grant\gr_CountSheet.bpl','View_CountSheet');
const Stud_AccountFull_Pack    :array [1..2] of string=('Grant\gr_Account.bpl','View_FullSpisokCount');
const Stud_CountCurrent_Pack   :array [1..2] of string=('Grant\gr_CountCurrent.bpl','View_CountCurrent');
const Stud_Current_Pack        :array [1..2] of string=('Grant\gr_Current.bpl','View_grCurrent');
const Stud_AccDepart_Pack      :array [1..2] of string=('Grant\gr_AccDepart.bpl','View_grAccDepart');
const Stud_Print               :array [1..2] of string=('Grant\gr_Print.bpl','View_grPrint');
const Stud_GrantRise           :array [1..2] of string=('Grant\gr_GrantRise.bpl','View_GrantRise');
const Stud_FilterKodSetup      :array [1..2] of string=('Grant\gr_FilterKodSetup.bpl','View_FilterKodSetup');
const Stud_StudentCards        :array [1..2] of string=('Grant\gr_StudentCards.bpl','View_StudentCards');
const Stud_OperationEnd        :array [1..2] of string=('Grant\gr_OperationEnd.bpl','View_GrOperationEnd');
const Stud_SvodBySch           :array [1..2] of string=('Grant\gr_SvodBySch.bpl','View_SvodSch');
const Stud_ReeAlimony          :array [1..2] of string=('Grant\gr_ReeAlimony.bpl','View_ReeAlimony');
const Stud_ReeDolg             :array [1..2] of string=('Grant\gr_ReeDolg.bpl','View_ReeDolg');
const Stud_IndexCount          :array [1..2] of string=('Grant\gr_IndexCount.bpl','View_IndexCount');
const Stud_SpSmet              :array [1..2] of string=('Grant\gr_SpSmet.bpl','View_SpSmet');
const Stud_PrintVedByMonth     :array [1..2] of string=('Grant\gr_PrintVedByMonth.bpl','View_grPrintVedByMonth');
const Stud_SvodBySm            :array [1..2] of string=('Grant\gr_SvodBySm.bpl','View_SvodSm');
const Stud_PrintAnalitControl  :array [1..2] of string=('Grant\gr_PrintAnalitControl.bpl','View_grPrintAnalitControl');
const View_Stud_IndexEdit_Pack :array [1..2] of string=('Grant\gr_StudIndexEdit.bpl','View_Stud_IndexEdit');
implementation

function FormStyleGrToZ(grFormStyle:TgrFormStyle):TZFormStyle;
begin
 Result := zfsNormal;
 case grFormStyle of
  gfsModal:  Result := zfsModal;
  gfsNormal: Result := zfsNormal;
  gfsChild:  Result := zfsChild;
 end;
end;

function DoFunctionFromPackage(AParameter:TObject;const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TObject):Variant;stdcall;
  wf:TForm;
begin
  Result:=NULL;
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32
  then
   try

      wf:=ShowWaitForm(Application.MainForm,wfLoadPackage);

      Screen.Cursor:=crHourGlass;

      //ShowMessage(ExtractFilePath(Application.ExeName)+Bpl[0]); //v

      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl[0]);



   finally
      Screen.Cursor:=crDefault;
      CloseWaitForm(wf);
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
            if @MDIFUNC<>nil then
             Result:=MDIFUNC(AParameter);

  end
  else
   begin
            grShowMessage(ECaption[IndexLanguage],ELoadBPLText[IndexLanguage]+#13+Bpl[0],mtError,[mbOk]);
            Result:=NULL;
   end;
end;

function LoadgrAccess(AOwner: TComponent):TUser;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent):TUser;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(ExtractFilePath(Application.ExeName)+'\Grant\Access.bpl'));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\Grant\Access.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('ShowAccess'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AOwner);
  end
  else
   begin
            grShowMessage(ECaption[IndexLanguage],ELoadBPLText[IndexLanguage]+#13+'Access.bpl',mtError,[mbOk]);
            Result.ID:=0;
   end;
end;

function ShowSpPeople(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE):variant;
begin
 Result := LoadPeopleModal(AOwner,DB_Handle);
end;

function ShowSpVidOpl(AOwner:TComponent;DB:TISC_DB_HANDLE;grFormStyle:TgrFormStyle=gfsModal;Id_VoplFilter:Integer=0):Variant;
begin
 Result := LoadVidOpl(AOwner,DB,FormStyleGrToZ(grFormStyle),Id_VoplFilter,grValueFieldFromZSetup(DB,'GR_ID_SYSTEM'));
end;

function ShowSpDepartment(DB_Handle:TISC_DB_HANDLE;ShowStyle:byte=0;Select:byte=1):variant;
var sp: TSprav;
begin
    Result:=NULL;
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB_Handle);
            FieldValues['ShowStyle'] := ShowStyle;
            FieldValues['Select'] := Select;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
       begin
        Result := VarArrayCreate([0,3],varVariant);
        Result[0] := sp.Output['ID_DEPARTMENT'];
        Result[1] := sp.Output['DEPARTMENT_CODE'];
        Result[2] := sp.Output['NAME_SHORT'];
        Result[3] := sp.Output['NAME_FULL'];
       end;
    sp.Free;
end;

function ShowSpSch(AParameter:TObject;SchProp:integer):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TObject;SchProp:integer):variant;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(ExtractFilePath(Application.ExeName)+'\Grant\gr_SpSch.bpl'));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+'\Grant\gr_SpSch.bpl');
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar('View_SpSch'));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AParameter,SchProp);
  end
  else
   begin
            grShowMessage(ECaption[IndexLanguage],ELoadBPLText[IndexLanguage]+#13+'gr_SpSch.bpl',mtError,[mbOk]);
            Result.ID:=0;
   end;
end;

function LoadgrOperationEnd(AParameter:TObject;IsRollback:boolean):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(AParameter:TObject;IsRollback:boolean):variant;stdcall;
begin
  HandlePack:=GetModuleHandle(PChar(ExtractFilePath(Application.ExeName)+Stud_OperationEnd[1]));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Stud_OperationEnd[1]);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Stud_OperationEnd[2]));
            if @MDIFUNC<>nil
            then Result:=MDIFUNC(AParameter,IsRollback);
  end
  else
   begin
            grShowMessage(ECaption[IndexLanguage],ELoadBPLText[IndexLanguage]+#13+Stud_OperationEnd[1],mtError,[mbOk]);
            Result.ID:=0;
   end;
end;

end.
