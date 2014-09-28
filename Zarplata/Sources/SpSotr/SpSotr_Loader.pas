unit SpSotr_Loader;

interface
uses Classes,IBase, SpSotr_MainForm, Variants, SpSotr_FilterForm,
 Windows, Messages, SysUtils,  Graphics, Controls, Forms,Dialogs ,ZTypes, Dates;

function View_SpSotr(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant; stdcall;
exports View_SpSotr;

function View_SpSotrWorker(Parameter:TZParamFilterSprDoh):Variant; stdcall;
exports View_SpSotrWorker;

implementation

uses ZProc;

function View_SpSotr(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant;
var ViewForm:TfmSpSotr;
    FilterParams: TZParamFilterSprDoh;
begin
 //if IsMDIChildFormShow(TfmSpSotr) then Exit;
 //FilterParams.is_filtered := False;
 //if ShowFilter(AOwner,ADB_Handle,FilterParams) then
  FilterParams:=TZParamFilterSprDoh.Create;
  FilterParams.Owner:= AOwner;
  FilterParams.DB_Handle:= ADB_Handle;
  FilterParams.Kod_Setup1:=DateToKodSetup(Date);  //для совместимости с конструктором
  FilterParams.Kod_Setup2:=DateToKodSetup(Date);
  ViewForm:=TfmSpSotr.Create(AOwner,ADB_Handle,FilterParams);
  FilterParams.Free;
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
  ViewForm.free;
end;

function View_SpSotrWorker(Parameter:TZParamFilterSprDoh):Variant;
var ViewForm:TfmSpSotr;
begin
  ViewForm:=TfmSpSotr.Create(Parameter.Owner,Parameter.DB_Handle,Parameter);
  if(ViewForm.ShowModal=mrYes)then
  Result:=ViewForm.Res;
  ViewForm.free;
end;

end.
