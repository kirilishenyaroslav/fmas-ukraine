unit St_ser_function;
interface

uses
  Windows,
  SysUtils,Forms, Classes,ShellAPI,pFIBDataSet,pFIBDataBase,IBase;

function  ST_serLanguageIndex(DBH:TISC_DB_HANDLE):byte;
implementation

uses Variants, DB;


function  ST_serLanguageIndex(DBH:TISC_DB_HANDLE):byte;
var
  DB:TpFIBDataBase;
  TR:TpFIBTransaction;
  select:TpFIBDataSet;
begin
  DB:=TpFIBDataBase.Create(nil);
  TR:=TpFIBTransaction.Create(nil);
  DB.DefaultTransaction:=TR;
  TR.DefaultDatabase:=DB;
  DB.Handle:=DBH;

  select:=TpFIBDataSet.Create(nil);
  select.Transaction:=TR;
  select.Database:=DB;

  select.SelectSQL.Text:='SELECT st_lng FROM st_ini';
  select.Active:=true;
  if VarIsNull(select.FBN('ST_LNG').AsVariant)=true then
     begin
       ST_serLanguageIndex:=1;
     end
     else
     begin
       ST_serLanguageIndex:=select.FBN('ST_LNG').AsInteger;
     end;
  select.Active:=false;
  select.Destroy;
  TR.Destroy;
  DB.Destroy;         
end;
end.
