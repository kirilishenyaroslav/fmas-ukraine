unit gr_uCommonTypes;

interface

uses iBase,Classes;

type TgrUVParam = (uvpNotSaved,uvpFilter,uvpCurrent);

type TUser = record
 Id:integer;
 Name:string;
 Id_Card:integer;
 Fio:string;
 DB_Handle:TISC_DB_HANDLE;
 DbPath:string;
end;

type
   TParamFilter =class(TObject)
   AOwner:TComponent;
   Db_Handle:TISC_DB_HANDLE;
   Year:Integer;
   Month:Integer;
   KodSetup:Variant;
   Contract:string;
   Butget:string;
   id_man:Variant;
   Tn:Variant;
   id_prop:Variant;
   id_dep:Variant;
   id_cat:variant;
   id_vidopl:Variant;
   Bal_B:string;
   Bal_E:string;
   ManCaption:string;
   DepCaption:string;
   PropCaption:string;
   CatCaption:string;
   CaptionVidOpl:string;
   KodVidOpl:string;

end;

implementation

end.
