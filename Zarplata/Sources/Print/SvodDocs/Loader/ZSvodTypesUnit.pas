unit ZSvodTypesUnit;

interface

uses IBase,Classes,ZTypes,DB;

type TTypeData = (tdArhiv,tdNotSaved,tdAll,tdNotUpdate);
type TTypeSchForm = (tfsSimple,tfsNP7, tfsNP6,tfsReeAccrualSingleBySch);
type TGroupSmetForm = (tfsPkv,tfsGroupSmet);

Type TSvodParam = record
 DB_Handle:TISC_DB_HANDLE;
 AOwner:TComponent;
 Kod_setup:integer;
 Type_data:TTypeData;
 TypeGroup:TGroupSmetForm;
 ID_Session:integer;
   id_session_fond : integer;
end;

Type TSvodBySchParam = record
  FoundationParam : TSvodParam;
  Id_Sch : Variant;
  TypeForm:TTypeSchForm;
 // id_session_fond : integer;

end;

Type TSvodBySchSmParam = record
  FoundationParam : TSvodParam;
  Id_Sch : Variant;
  TypeForm:TTypeSchForm;
  DataSet: TDataSet;
 // id_session_fond : integer;

end;

Type TSvodByGroupSmParam = record
  FoundationParam : TSvodParam;
  Id_pkv : Variant;
  Id_type_finance : Variant;
end;

type TSvodByDepartmentParam = record
 SvodParam:TSvodParam;
 Id_Department:integer;
end;


type TTypeSimpleReestr = (tsrHospList,tsrDuty,tsrDopPlat,tsrStrah,tsrAlimony,
                          tsrOtherUd,tsrPF,tsrPFU,tsrSumMoreVidrah,tsrInvalid,
                          tsrPererah,tsrCredit,tsrInvalid2, tsrAccrualSingle,
                          tsrAccrualSingleForManAll,tsrAccrualSingleForInvalid,
                          tsrAccrualSingleForManOwer, tsrAlimony_budget);
type TTypeHospFSS = (thfTVP, thfUnfortunate, thfUnfortunate1);

type TSimpleReestrParam = record
 SvodParam: TSvodParam;
 TypeSimpleReestr:TTypeSimpleReestr;
end;

type TTypeReeHosp = (trhByTn,trhByDepartment);

type TReeHospParam = record
 SvodParam: TSvodParam;
 TypeReeHosp:TTypeReeHosp;
end;

type TAvgHospParam = record
 DB_Handle:TISC_DB_HANDLE;
 Owner:TComponent;
 Id:integer;
 Type_Id:byte;//0-Id_man_hosp,1-Id_Reestr
 SortOrder:string;//Example: order by fio descending
end;

type TAvgSocInsurance = record
 DB_Handle:TISC_DB_HANDLE;
 Owner:TComponent;
 Id_reestr:integer;
 kodsetup:Integer;
 TypeHospFSS:TTypeHospFSS;
end;

type TAvgHolParam = record
 DB_Handle:TISC_DB_HANDLE;
 Owner:TComponent;
 Id:integer;
end;

type TSheetToBankParameter = record
 DB_Handle:TISC_DB_HANDLE;
 Owner:TComponent;
 Id_reestr:Longint;
 type_payment:string;
 id_type_payment:Integer;
 id_system:Boolean;
end;

type TSheetToBankAllParameter = record
 DB_Handle:TISC_DB_HANDLE;
 Owner:TComponent;
 Id_session:Longint;
end;

type TZAccListParameter = record
 DB_Handle:TISC_DB_HANDLE;
 AOwner:TComponent;
 Kod_setup:integer;
 ID_Session:integer;
 Id_Group_Account:Integer;
 Id_Man:integer;
 Id_Department:integer;
 TypeData:byte; //0-Архив, 1-не сохранены
 System:TZChildSystems;
 Path:string;
 TypeOper:byte; //1-pdf, 2-html;
 ID_SESSION_FILTER_DEP:Integer;
end;

implementation

end.
