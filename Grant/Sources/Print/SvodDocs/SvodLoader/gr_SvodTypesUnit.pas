unit gr_SvodTypesUnit;

interface

uses IBase,Classes, gr_uCommonTypes;

type TTypeData = (tdArhiv,tdNotSaved,tdAll,tdNotUpdate);

Type TSvodParam = record
 DB_Handle:TISC_DB_HANDLE;
 AOwner:TComponent;
 Kod_setup:integer;
 Type_data:TTypeData;
 ID_Session:integer;
end;

Type TSvodBySchParam = record
  FoundationParam : TSvodParam;
  Id_Sch : Variant;
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
// System:TZChildSystems;
end; 

implementation

end.
