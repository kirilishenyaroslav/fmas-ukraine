unit st_common_types;

interface

uses Classes, IBase, Forms;

type  TSelectMode = (SingleSelect, MultiSelect);
type  TActionMode = (View, Edit);


Type TstSimpleParams = class
 public
  Owner: TComponent;
  Db_Handle: TISC_DB_HANDLE;
  FormStyle: TFormStyle;
  WaitPakageOwner : TForm;
  SMode  : TSelectMode;
  AMode  : TActionMode;
  ID_SESSION: Int64;
  Type_Report:Integer;
  Sql_Master, Sql_Detail, Report_Name : String;
  FieldView, NotFieldView, FieldNameReport : Variant;
  LastIgnor:Integer;
  Date_beg, Date_end : TDateTime;
  ID_User : Int64;
  User_Name : string;
  ID_Locate : int64;
  ID_Locate_1 : int64;
  ID_Locate_2 : int64;
  DontShowGroups : boolean;
  DontShowFacs : boolean;
  ID_PRICE: Int64;
  is_admin: boolean;
  is_debug : boolean;
end;

type TstParamsToPakage = record
  ID_MAN      : int64;
  ID_STUD     : int64;
  ID_DOC      : int64;
  FIO         : String;
  Num_Doc     : String;
  Note        : String;
  DATE_DOG    : TDateTime;
  Summa       : Currency;
  IsWithSumma : Boolean;
  DissDownAllContract : boolean;
  Is_collect  : byte;
  IsUpload    : Boolean;
  Is_Admin    : Boolean;
  BarCode     : String;
end;


type TstSimpleParamsEx = class(TstSimpleParams)
 public
  stParamsToPakage : TstParamsToPakage;
  ReturnMode : string; // Single, Multy
  TypeDoc    : byte;
  TR_Handle  : TISC_TR_HANDLE;
 end;

type TstAccessResult = record
  ID_User:integer;
  Name_user:string;
  User_Id_Card:integer;
  User_Fio:string;
  DB_Handle : TISC_DB_HANDLE;
  Password: string;
end;

type TstAcademicYear = record
  Date_Beg: TDateTime;
  Date_End: TDateTime;
end;

type TCurrentConnect = record
  Db_Handle: TISC_DB_HANDLE;
  PLanguageIndex: byte;
end;

type
  TDissInfo = record
  flag : Integer;
  TR_Handle: TISC_TR_HANDLE;
  Date_Diss: TDateTime;
end;


type TstExAcademicYear = array of  TstAcademicYear;

type TFinanceSource = record
  isEmpty     : boolean;
  ID_SMETA    : int64;
  ID_RAZDEL   : int64;
  ID_STAT     : int64;
  ID_KEKV     : int64;
  PERCENT     : Currency;
  TEXT_SMETA  :string;
  TEXT_RAZDEL :string;
  TEXT_STAT   :string;
  TEXT_KEKV   :string;
  CODE_SMETA  :string;
  CODE_RAZDEL :string;
  CODE_STAT   :string;
  CODE_KEKV   :string;
end;

type TstSourceStudInf = record
  ID_FAC,
  ID_SPEC,
  ID_GROUP,
  ID_KAT_STUD,
  ID_FORM_STUD,
  ID_NATIONS : int64;
  kurs : Integer;
end;

type TstSourceStudInfParams = class(TstSimpleParams)
 public
  stSourceStudInf : TstSourceStudInf;
 end;

type TstCalcIn = record
  Owner     : TComponent;
  DB_Handle : TISC_DB_HANDLE;
  ID_STUD   : int64;
  BEG_CHECK : TDateTime;
  END_CHECK : TDateTime;
  CNUPLSUM  : Currency;
end;

type TstCalcOut = record
  CNDATEOPL  : TDateTime;
  CN_SNEED   : Currency;
  CN_SNEEDL  : Currency;
  ID_SESSION : int64;
end;

type TstPayIn = record
  Owner     : TComponent;
  DB_Handle : TISC_DB_HANDLE;
  ID_STUD   : int64;
  BEG_CHECK : TDateTime;
  END_CHECK : TDateTime;
  DATE_PROV_CHECK : byte;
  IS_DOC_GEN      : byte;
  IS_PROV_GEN     : byte;
  IS_SMET_GEN     : byte;
  NOFPROV         : byte;
  DIGNORDOCID     : int64;
end;

type TstPayOut = record
  SUMMA_ALL  : Currency;
  CNUPLSUM   : Currency;
  CNSUMDOC   : Currency;
  CNINSOST   :Currency;
  ID_SESSION : int64;
end;

type TstAnnulContractIn = record
  Owner          : TComponent;
  DB_Handle      : TISC_DB_HANDLE;
  ID_DOG_ROOT    : int64;
  ID_DOG         : int64;
  ID_STUD        : int64;
  DATE_DISS      : TDateTime;
  ID_TYPE_DISS   : int64;
  ORDER_DATE     : TDateTime;
  ORDER_NUM      : String;
  COMMENT        : String;
  IS_COLLECT     : integer;
end;

type TstParamsToAddContract = record
  ID_DOG_STATUS : int64;
  ID_DEPARTMENT : int64;
  ID_SPEC       : int64;
  ID_GROUP      : int64;
  ID_FORM_STUD  : int64;
  ID_KAT_STUD   : int64;
  ID_NATIONAL   : int64;
  KURS          : Integer;
  DATE_BEG      : TDateTime;
  DATE_END      : TDateTime;
  ID_MAN        : int64;
end;

type TstSimpleParamsAbiturient = class(TstSimpleParams)
 public
  WorkMode   : string; // 'simple', 'extra'
  ActionMode : string; // 'add', 'edit'
  stParamsToAddContract : TstParamsToAddContract;
  stParamsToPakage     : TstParamsToPakage;
end;

implementation

end.
