unit TuCommonTypes;

interface

uses iBase;

type TgrUVParam = (uvpNotSaved,uvpFilter,uvpCurrent);

type TUser = record
 Id:integer;
 Name:string;
 Id_Card:integer;
 Fio:string;
 DB_Handle:TISC_DB_HANDLE;
 DbPath:string;
end;

type TTuFormStyle = (tfsModal, tfsNormal, tfsChild, tfsModalParent);

type TTuControlFormStyle = (tcfsInsert, tcfsUpdate, tcfsDelete, tcfsShowDetails, tcfsInsertWizard);

implementation

end.
