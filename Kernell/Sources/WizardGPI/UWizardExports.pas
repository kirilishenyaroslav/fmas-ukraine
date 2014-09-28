unit UWizardExports;

interface

uses Kernel, Ibase, UWizardMain, Controls, Dialogs;

function RunWizard(VWIZARD_GET_PROV_INFO:PWIZARD_GET_PROV_INFO):Boolean; stdcall;
exports  RunWizard;


implementation

function RunWizard(VWIZARD_GET_PROV_INFO:PWIZARD_GET_PROV_INFO):Boolean;
var  R:Boolean;
begin
     if VWIZARD_GET_PROV_INFO^.ID_LANGUAGE<>2
     then VWIZARD_GET_PROV_INFO^.ID_LANGUAGE:=1;
     VWIZARD_GET_PROV_INFO^.FACED_FLAG:=false;

     if (VWIZARD_GET_PROV_INFO^.MODE in [21,22,1,3])
     then begin
               VWIZARD_GET_PROV_INFO^.DB_ID_SCH_KOD:='';
               VWIZARD_GET_PROV_INFO^.KR_ID_SCH_KOD:='';

               VWIZARD_GET_PROV_INFO^.DB_ID_SCH_TIT:='';
               VWIZARD_GET_PROV_INFO^.KR_ID_SCH_TIT:='';

               VWIZARD_GET_PROV_INFO^.DB_TITLE_SMETA:='';
               VWIZARD_GET_PROV_INFO^.KR_TITLE_SMETA:='';

               VWIZARD_GET_PROV_INFO^.DB_TITLE_RAZD:='';
               VWIZARD_GET_PROV_INFO^.KR_TITLE_RAZD:='';

               VWIZARD_GET_PROV_INFO^.DB_TITLE_STAT:='';
               VWIZARD_GET_PROV_INFO^.KR_TITLE_STAT:='';

               VWIZARD_GET_PROV_INFO^.DB_KEKV_TITLE:='';
               VWIZARD_GET_PROV_INFO^.KR_KEKV_TITLE:='';

               VWIZARD_GET_PROV_INFO^.DB_KOD_SMETA:=-1;
               VWIZARD_GET_PROV_INFO^.KR_KOD_SMETA:=-1;

               VWIZARD_GET_PROV_INFO^.DB_KOD_RAZD:=-1;
               VWIZARD_GET_PROV_INFO^.KR_KOD_RAZD:=-1;

               VWIZARD_GET_PROV_INFO^.DB_KOD_STAT:=-1;
               VWIZARD_GET_PROV_INFO^.KR_KOD_STAT:=-1;

               VWIZARD_GET_PROV_INFO^.DB_KOD_KEKV:=-1;
               VWIZARD_GET_PROV_INFO^.KR_KOD_KEKV:=-1;
     end;



     with TfrmProvInfoWizard1.Create(VWIZARD_GET_PROV_INFO) do
     begin
          ShowModal;
          if Work_result then R:=true else R:=false;
          Free;
     end;

     Result:=R;
end;


end.
