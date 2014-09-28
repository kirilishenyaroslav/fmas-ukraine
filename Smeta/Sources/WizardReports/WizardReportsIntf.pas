unit WizardReportsIntf;

interface

uses Classes, Ibase;

procedure Wizard_GetPlanValuesReport(AOwner:TComponent;DBhandle:TISC_DB_Handle;Id_smeta:Int64;Date_beg:TDateTime;Date_end:TDateTime;id_user:Int64);stdcall;

exports Wizard_GetPlanValuesReport;

implementation


uses FrmReport1;

procedure Wizard_GetPlanValuesReport(AOwner:TComponent;DBhandle:TISC_DB_Handle;Id_smeta:Int64;Date_beg:TDateTime;Date_end:TDateTime;id_user:Int64);
begin
     with TfrmHtmlReport.Create(AOwner,DBHandle,id_smeta,date_beg,date_end,Id_USER) do
     begin
          ShowModal;
          Free;
     end;
end;



end.
