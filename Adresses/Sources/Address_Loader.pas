unit Address_Loader;

interface

uses Classes,IBase, Variants, Controls, uAddBirthPlace, uAddModifAdr3;

  function GetBirthPlace(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;IdBirthPlace:Integer=-1):Variant;stdcall;
  //Вызов формы для редактирования места рождения. Возвращает ИД нас.пункта и его путь
  function GetAddress3(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;IdAddress:Integer=-1):Variant;stdcall;
  //Вызов формы для редактирования адреса

  exports GetBirthPlace;

implementation

function GetBirthPlace(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;IdBirthPlace:Integer=-1):Variant;stdcall;
var ViewForm:TAddBirthPlace;
begin
  ViewForm:=TAddBirthPlace.Create(AOwner,DB_Handle,IdBirthPlace);
  if ViewForm.ShowModal=mrOk then
    begin
      Result:=VarArrayCreate([0,1],vtVariant);
    end
  else
    Result:=Null;
  ViewForm.Free;
end;

function GetAddress3(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;IdAddress:Integer=-1):Variant;stdcall;
var ViewForm:TAddModifAdrForm3;
begin
  ViewForm:=TAddModifAdrForm3.Create(AOwner,DB_Handle,False,False,IdAddress);
  if ViewForm.ShowModal=mrOk then
    begin
      Result:=VarArrayCreate([0,1],vtVariant);
    end
  else
    Result:=Null;
  ViewForm.Free;
end;

end.
