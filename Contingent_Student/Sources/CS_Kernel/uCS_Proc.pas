unit uCS_Proc;

interface

uses variants, Controls, iBase, uCS_Types, Forms, SysUtils, dialogs, uCS_DM;

function  IfThen(const Value: Variant; const ValueIfNull: Variant): Variant;
function VoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Id_System:integer =999):variant;
implementation
function IfThen(const Value: Variant; const ValueIfNull: Variant): Variant;
begin
 if Value <> NULL then
  IfThen:=Value
 else
  IfThen:=ValueIfNull;
end;

function VoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Id_System:integer =999):variant;
var DM:TCSDM;
    res:variant;
begin

 Res:=Null;
 DM := TCSDM.Create(Application.MainForm);

 DM.DB.Handle := DB_Handle;

 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'CS_VIDOPL_BY_KOD';
   Prepare;

   ParamByName('AKOD_VIDOPL').AsInteger := Kod;
   ParamByName('ACTUAL_DATE').AsDate    := ActualDate;
   ParamByName('ID_SYSTEM').AsInteger   := Id_System;

   ExecProc;

   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := ParamByName('ID_VIDOPL').AsVariant;
   Res[1] := ParamByName('KOD_VIDOPL').AsVariant;
   Res[2] := ParamByName('NAME_VIDOPL').AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ShowMessage('Помилка відоплати');
     Transaction.Rollback;
    end;
  end;
  DM.Free;
 Result:=res;
end;

end.
