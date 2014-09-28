unit gar_Types;

interface

Uses Classes, gr_uCommonLoader, IBase;

Type TGarFormStyle = (garfsInsert, garfsUpdate, garfsDelete, garfsAccept, garfsShow, garfsSelect, garfsEdit);
Type TGarTypePrint = (gar_ComulativeList, gar_ComulativeList_FIO);

type TgarSimpleParam = class(TObject)
  DB_Handle:TISC_DB_HANDLE;
  Owner:TComponent;
end;

Type TgarSimpleParamMode = class(TgarSimpleParam)
public
  fs:TGarFormStyle;
end;

Type TgarParamWaybillPart = class(TgarSimpleParamMode)
public
  MILAGE: Variant;
  id_factor: integer;
  name_factor:string;
end;


Type TgarParamMarkaAvto = class(TgarSimpleParamMode)
public
  NameMarka: variant;
  Country_Provider: variant;
  Id_Marka: int64;
end;

Type TgarParamModel = class(TgarSimpleParamMode)
 public
  Id_Marka: int64;
  NameModel:variant;
  CONSUPTION_BASE:variant;
  CONSUPTION_BASE_TIME:variant;
  Id_Model: int64;
 end;

Type TgarParamMarkaTopl = class(TgarSimpleParamMode)
 public
  MARKA_TOPL:variant;
  KOD_TOPL:variant;
  ID_MARKA_TOPL: int64;
 end;

Type TgarParamAvto = class(TgarSimpleParamMode)
 public
  NAME:variant;
  NAME_MODEL:variant;
  NOM_KUZ:variant;
  NOM_MOTOR:variant;
  CALC_METOD:Variant;
  NOM_GOS:variant;
  NAME_MARKA_TOPL: variant;
  CONSUPTION_BASE: variant;
  ID_AVTO: int64;
 end;

type
  TParamEditBtn =class(TObject)
  id:int64;
  Tn:Variant;
  Caption:Variant;
end;


type TgarParamPeople =class(TgarSimpleParamMode)
  ParamEditBtn:TParamEditBtn;
  Dolgnost:Variant;
  ID_MO:int64;
  ID_GAR_PEOPLE:int64;
  constructor create;reintroduce;
end;

Type TgarParamWaybill = class(TgarSimpleParamMode)
 public
  ID_Waybill: int64;
  ID_FORMA:int64;
  ParamAvto:   TParamEditBtn;
  ParamPeople: TParamEditBtn;
  ID_MAN:  Int64;
  ID_AVTO: Int64;
  DATE_BEG: Variant;
  DATE_END: Variant;
  TIME_BEG: Variant;
  TIME_END: Variant;
  ID_TOPL:Int64;
  TOPL_COUNT_BEG: Variant;
  TOPL_COUNT_END: Variant;
  TOPL_COUNT:  Variant;
  SPIDOMETR_BEG: Variant;
  SPIDOMETR_END: Variant;
  SERIES: Variant;
  NOMBER: Variant;
  ID_KOLONA: Variant;
  ID_WORK_MODE: Variant;
  WORK_TIME: Variant;
  CALC_METOD: Variant;

  KOLONA:Variant;
  PRICEP1:String;
  PRICEP2:String;
  WAYPEOPLE_TXT:String;
  TASK_DRIVER_TXT:String;
  ORDER_TASK_TXT:String;
  RES_WORK_AVTO_WITH_PRICEP:String;
  PROSTOI : integer;
  tempc : integer;

  constructor create;reintroduce;
 end;

Type TgarParamWaybillFilter = class(TgarSimpleParamMode)
 public
  id_forma:Integer;
  ID_Waybill: Variant;
  ParamAvto:   TParamEditBtn;
  ParamPeople: TParamEditBtn;
  DATE_BEG: Variant;
  DATE_END: Variant;
  SERIES: String;
  NOMBER: Variant;
  constructor create;reintroduce;
 end;


Type TgarParamEQUIPMENT = class(TgarSimpleParamMode)
 public
    ID_AVTO :Int64;
    NAME : String ;
    COUNT_EQUIPMENT: integer;
    NOMBER :String;
    DATE_SPIS: TDateTime;
    ID_NOM_BASE :Int64;
    NOMBER_DOC_SPIS :Int64;
    ID_GAR_EQUIPMENT:Int64;
  //constructor create;reintroduce;
 end;




Type Tgar_ComulativeList_By_Avto = class(TgarSimpleParam)
  Kod_Setup:integer;
  ParamAvto:   TParamEditBtn;
  DateBeg,DateEnd:Variant;
  constructor create; reintroduce;
end;


Type Tgar_ComulativeList_Period = class(TgarSimpleParam)
  DATE_BEG: Variant;
  DATE_END: Variant;
  Kod_Setup:Integer;
end;

Type TgarParamFactor = class(TgarSimpleParamMode)
public
  ID_Factor:int64;
  NameFactor:String;
  ValueFactor:double;
end;


implementation

constructor Tgar_ComulativeList_By_Avto.create;
begin
  ParamAvto:=TParamEditBtn.Create();
end;

constructor TgarParamWaybillFilter.create;
begin
  inherited create;
  ParamPeople:=TParamEditBtn.Create();
  ParamAvto:=TParamEditBtn.Create();
end;

constructor TgarParamWaybill.create;
begin
  ParamPeople:=TParamEditBtn.Create();
  ParamAvto:=TParamEditBtn.Create();
end;

constructor TgarParamPeople.create;
begin
  ParamEditBtn:=TParamEditBtn.Create();
end;



end.
