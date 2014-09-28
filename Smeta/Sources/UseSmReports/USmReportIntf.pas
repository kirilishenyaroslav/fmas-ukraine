unit USmReportIntf;

interface

uses Windows, Classes, Ibase, Forms, GlobalSpr, Variants;



procedure GetExtendedSmReport(AOwner: TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
procedure GetSmResults(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;Id_smeta:Int64;Id_plan:Int64);stdcall;
procedure PrintSmetPlusPeriods(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
procedure PrintSmetaValues(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);stdcall;

exports GetSmResults,
        GetExtendedSmReport,
        PrintSmetPlusPeriods,
        PrintSmetaValues;

implementation

uses UPrintBUPlusPeriods,ExtendedReport,USmetReport, UMainReport;

procedure PrintSmetaValues(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
var i:Integer;
    f:Boolean;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmSmMainReport)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then TfrmSmMainReport.Create(AOwner,DBHandle);
end;


procedure PrintSmetPlusPeriods(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
var i:Integer;
    f:Boolean;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmPrintSmetPlusPeriods)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then TfrmPrintSmetPlusPeriods.Create(AOwner,DBHandle);
end;

procedure GetExtendedSmReport(AOwner: TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
begin
     TfrmSmetaSpr.Create(AOwner,DBHandle);
end;




procedure GetSmResults(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;ActualDate:TDateTime;Id_smeta:Int64;Id_plan:Int64);stdcall;
var f:Boolean;
    i:Integer;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmSmetaReportStru)
         then begin
              if  ((Application.MainForm.MDIChildren[i] as TfrmSmetaReportStru).CurIdPlan=id_plan)
              then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
              end;
         end;
    end;
    if f then TfrmSmetaReportStru.Create(AOwner,DBHandle,FS,ActualDate,Id_smeta,Id_plan);
end;


end.
