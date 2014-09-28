unit ZTypes;

interface
uses Classes,IBase,Controls,Forms;

type TZChildSystems = (tsZarplata,tsGrant,tsOther);

type TZAccessResult = record
 ID_User:integer;
 Name_user:string;
 User_Id_Card:integer;
 User_Fio:string;
 DB_Handle:TISC_DB_HANDLE;
 DbPath:string;
end;

type TZAvgSumParameter = record
 Owner:TComponent;
 DB_Handle:TISC_DB_HANDLE;
 Id_Hosp_List:integer;
 rmoving:integer;
end;

type TZKodSetupToPeriodParam  = (zkspWithSlashYearFull,
                                 zkspWithSlashYearShort,
                                 zkspWithOutSlashYearTextFull,
                                 zkspWithOutSlashYearTextNon,
                                 zkspWithOutSlashYearTextShort);

type TZFormMode  = (zfmNone, zfmFirst, zfmSecond);
type TZFormStyle = (zfsModal, zfsNormal, zfsChild);
type TZControlFormStyle = (zcfsInsert, zcfsUpdate, zcfsDelete, zcfsShowDetails);

type TZCurrentParameterType = (zcptRMoving, zcptIdCurrent);

type TZCurrentParameters =  record
 Owner: TComponent;
 Db_Handle:TISC_DB_HANDLE;
 ControlFormStyle: TZControlFormStyle;
 ID : integer;
 TypeID: TZCurrentParameterType;
end;

type TDopNachControlParameter = record
 AOwner: TComponent;
 ADb_Handle:TISC_DB_HANDLE;
 AControlFormStyle: TZControlFormStyle;
 AId:Longint;
end;

type TNonSpisokControlParameter = record
 Owner: TComponent;
 Db_Handle:TISC_DB_HANDLE;
 ControlFormStyle: TZControlFormStyle;
 Id:Integer;
end;

type TDedConstControlParameter = record
 AOwner: TComponent;
 ADb_Handle:TISC_DB_HANDLE;
 AControlFormStyle: TZControlFormStyle;
 AId:Longint;
end;

type THospRMovingParameter = record
 AOwner: TComponent;
 ADb_Handle:TISC_DB_HANDLE;
 AControlFormStyle: TZControlFormStyle;
 AId:Longint;
 AId_pcard:Longint;
 AId_hosp:Longint;
 ATypeAlg  :Integer;
end;

type TZPeoplePrivParameterType = (zppctIdPeoplePriv, zppctIdPeople, zppctNULL);

type TZPeoplePrivParameters = record
 ID : integer;
 TypeId: TZPeoplePrivParameterType;
 ControlFormStyle: TZControlFormStyle;
end;

type TZPeoplePropParameterType = (zppptIdMan, zppptIdPeopleProp);

type TZPeoplePropParameters = record
 ID : integer;
 TypeId : TZPeoplePropParameterType;
 ControlFormStyle: TZControlFormStyle;
// KodSetup:variant;
end;

type TZPeopleWorkModeParameters = record
 ID : integer;
 id_workmode : Integer;
 rmoving : Int64;
 date_beg :TDateTime;
 date_end :TDateTime;
 ControlFormStyle: TZControlFormStyle;
 SHIFT: Integer;
end;

type TZPeopleComandirovParameters = record
 ID : integer;
 rmoving : Int64;
 date_beg :TDateTime;
 date_end :TDateTime;
 avg_sum  :variant;
 id_smeta :integer;
 smeta_kod:string;
 id_vidopl:integer;
 KOD_VIDOPL:string;
 ControlFormStyle: TZControlFormStyle;
end;



type TZCommonParameter = record
 ID : integer;
 ControlFormStyle: TZControlFormStyle;
end;

type TZCtrlWithHistoryParam = record
 ID : integer;
 Use_DateTime:TDateTime;
 ControlFormStyle: TZControlFormStyle;
end;

type TZCtrlWithHistoryResultParam = record
 ID: Integer;
 Use_DateTime: TDateTime;
end;  

type TZAlimonyParameters = record
 ID : integer;
 ControlFormStyle: TZControlFormStyle;
end;

type TZIndexParameters = record
 ID : int64;
 id_man:int64;
 SUMMA_IND_FIX:string;
 SUMMA_IND_FACT:string;
 SUMMA_IND_FIX_BOOL:boolean;
 SUMMA_IND_FACT_BOOL:boolean;
 IS_HAND_EDIT:boolean;
 ActualDate:TDateTime;
 IndexBaseDate:TDateTime;
 ControlFormStyle: TZControlFormStyle;
end;


type TUVSheetDataParameters = record
 ID : integer;
 Caption: string;
end;

type TUVTypeViewSheet = (uvtvsWithFilter,uvtvsCurrentKodSetup,uvtvsNotSaved);

type TZTypeData= (ztdSaved,ztdNotSaved);


Type TFilterDataSprDoh = record
  ID_man : integer;
  TN:integer;
  FIO: string;
  Kod_setup1:integer;
  Kod_setup2:integer;
  PrUser:Boolean;
end;

type TZPrintAccListParameter = record
 Id_Group_Account:Integer;
 Id_Man:integer;
 Kod_Setup2:integer;
 TypeData:byte; //0-Архив, 1-не сохранены
 PaymentType:byte;
end;

type TZSpGroupSm = record
 Owner: TComponent;
 Db_Handle:TISC_DB_HANDLE;
 TypeData:byte;//0-Архив, 1-не сохранены, 2-свод
 IdSession:integer;
 KodSetup:integer;
end; 

type TZSimpleParam =class
  Owner:TComponent;
  DB_Handle:TISC_DB_HANDLE;
end;

type TZSimpleParamDate =class(TZSimpleParam)
  Datebeg:TDateTime;
  DateEnd:TDateTime;
end;

type TZParamFilterSprDoh = class(TZSimpleParam)
  Kod_Setup1:integer;
  Kod_Setup2:integer;
end;

type TZInfl_Hand_Param = record
  Kod_Setup:integer;
  Index_infl:double;
  fs:TZControlFormStyle;
  Aowner:TComponent;
end;

type TZSimpleParamFull = class(TZSimpleParam)
   Formstyle: TFormStyle;
   mode :TZControlFormStyle;
   ID_SESSION: Int64;
   ID_User : Int64;
   ID_Locate : int64;
   ID_Locate_1 : int64;
   ID_Locate_2 : int64;
end;

implementation

end.
