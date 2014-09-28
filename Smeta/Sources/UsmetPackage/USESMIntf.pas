unit USESMIntf;

interface

uses UDoOtch, USmetStru, Ibase, pFIbDatabase, Classes, Forms, UDoRests, UDoSmRecalc;

function  GetSprMdi(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Id_smeta:Int64;Id_plan:Int64):integer;stdcall;
procedure DoOtch(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);stdcall;
procedure CalcBuRests(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Integer);stdcall;
procedure DoSmRecalc(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64);stdcall;
exports GetSprMdi, DoOtch, CalcBuRests, DoSmRecalc;

implementation

procedure DoSmRecalc(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64);
var i:Integer;
    f:Boolean;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmBURecalc)
         then begin
                   Application.MainForm.MDIChildren[i].BringToFront;
                   f:=false;
         end;
    end;
    if f then TfrmBURecalc.Create(AOwner,DB_Handle,id_user);
end;

procedure CalcBuRests(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Integer);
var i:Integer;
    f:Boolean;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmGetBuRests)
         then begin
                   Application.MainForm.MDIChildren[i].BringToFront;
                   f:=false;
         end;
    end;
    if f then TfrmGetBuRests.Create(AOwner,DBHandle,id_user);
end;


function GetSprMdi(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Id_smeta:Int64;Id_plan:Int64):integer;stdcall;
var i:Integer;
    f:Boolean;
begin
    f :=true;

    if FS=fsMdiChild
    then begin
              for i:=0 to Application.MainForm.MDIChildCount-1 do
              begin
                   if (Application.MainForm.MDIChildren[i] is TfrmSmetaStru)
                   then begin
                        if (Application.MainForm.MDIChildren[i] as TfrmSmetaStru).CurIdPlan=Id_plan
                        then begin
                             Application.MainForm.MDIChildren[i].BringToFront;
                             f:=false;
                        end;
                   end;
              end;
    end;

    if f
    then begin
              if FS=fsMdiChild
              then begin
                        TfrmSmetaStru.Create(AOwner,DBHandle,FS,Book_Date,Id_smeta,Id_plan);
              end
              else begin
                        with TfrmSmetaStru.Create(AOwner,DBHandle,FS,Book_Date,Id_smeta,Id_plan) do
                        begin
                             ShowModal;
                             Free;
                        end;
              end;
    end;
    Result:=0;
end;

procedure DoOtch(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
var i:Integer;
    f:Boolean;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmDoOtch)
         then begin
                   Application.MainForm.MDIChildren[i].BringToFront;
                   f:=false;
         end;
    end;
    if f then TfrmDoOtch.Create(AOwner,DBHANDLE);
end;


end.
