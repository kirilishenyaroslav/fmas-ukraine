unit uMatasFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Dialogs, Controls,
  DateUtils, Forms, StdCtrls, Classes, FIBDatabase, ibase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  uMatasVars, uResources;

type
  TMatasFilterOperParams = class
    DB_SCH_LIST: string;
    KR_SCH_LIST: string;
    SM_LIST: string;
    RZ_ST_LIST: string;
    KEKV_LIST: string;
  end;

  TMatasFilterOper = class(TObject)
    private
      F_DB_HANDLE: TISC_DB_HANDLE;
      F_ID_SESSION: integer;
      F_OWNER: TComponent;
      F_DB_Sch_List:string;
      F_KR_Sch_List:string;
      F_SM_List: string;
      F_RZ_ST_List: string;
      F_KEKV_List: string;
    public
      constructor Create(aOwner:TComponent; aDBHandle:TISC_DB_HANDLE; aID_SESSION: integer);
      procedure ShowFilter;
      property DB_SCH_LIST: string read F_DB_Sch_List;
      property KR_SCH_LIST: string read F_KR_Sch_List;
      property SM_LIST: string read F_SM_List;
      property RZ_ST_LIST: string read F_RZ_ST_List;
      property KEKV_LIST: string read F_KEKV_List;
  end;

implementation

{ TMatasFilterOper }

constructor TMatasFilterOper.Create(aOwner: TComponent; aDBHandle: TISC_DB_HANDLE; aID_SESSION: integer);
begin
   F_OWNER:=aOwner;
   F_DB_HANDLE:=aDBHandle;
   F_ID_SESSION:=aID_SESSION;
end;

procedure TMatasFilterOper.ShowFilter;
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION: integer; var aParams:TMatasFilterOperParams);stdcall;
 OperParams: TMatasFilterOperParams;
begin
 OperParams:=TMatasFilterOperParams.Create;
 with OperParams do
 begin
    DB_SCH_LIST:=F_DB_Sch_List;
    KR_SCH_LIST:=F_KR_Sch_List;
    SM_LIST:=F_SM_List;
    RZ_ST_LIST:=F_RZ_ST_List;
    KEKV_LIST:=F_KEKV_List;
 end;
 hPack := GetModuleHandle('MatasFilter.bpl');
 if hPack < 32 then hPack := LoadPackage('Matas\MatasFilter.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOperFilter'));
  if @SpravProc <> nil then
   SpravProc(F_Owner, F_DB_HANDLE, F_ID_SESSION, OperParams);
  end else begin
   ShowMessage(PChar(MAT_STR_LOAD_BPL_ERROR + 'MatasFilter.bpl'));
  end;
 with OperParams do
 begin
    F_DB_SCH_LIST:=DB_Sch_List;
    F_KR_SCH_LIST:=KR_Sch_List;
    F_SM_LIST:=SM_List;
    F_RZ_ST_LIST:=RZ_ST_List;
    F_KEKV_LIST:=KEKV_List;
 end;
end;

end.
